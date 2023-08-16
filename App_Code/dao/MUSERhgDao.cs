using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

/// <summary>
/// MUSERhgDao 的摘要描述
/// </summary>
public class MUSERhgDao : System.Web.UI.Page
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MUSERhgDao _instance = new MUSERhgDao();
    public static MUSERhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MUSERhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    //getMCMCHTRData
    public List<MCMCHTREntity> getMCMCHTRData(string U_NUM, string Q_Member)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        // log.startWrite("'ComID' : " + ComID, className, methodName);
        string commandText = string.Empty;
        // if (common.isEmpty(ComID))
        // {
        //     commandText = "select * from MRMAP a left join MREPO b on a.Repo_no=b.REPO_no ";
        // }
        // else
        // {
        //commandText = "select * from MITEM where mitcode='"+U_NUM+"'";
        //commandText= "select auto_id,ROW_NUMBER() OVER(ORDER BY rank) AS ROWID,ddesc,ditcode,rank from MITEM where mitcode='" + U_NUM +"'";
        ////select Light_status,M_Num,N_Call_tag,M_Name,MC_Name,MTel1,MTel2,OTel,OTel1,HTel,HTel1,add_date from MMBER where del_tag = '0' and N_call_tag='0'
        //and  MC_Name like '王彥琦'
        ////Q_MC:責任助理 Q_Member:客戶範圍(0:非會員 1:會員)
        string Q_Member_SQL = "";
        if (Q_Member == "0")//非會員 M_Num為Null(SQL: M_Num IS  NULL)
        {
            Q_Member_SQL = "and M_Num IS NULL";
            //commandText = "select Light_status,M_Num,N_Call_tag,M_Name,MC_Name,MTel1,MTel2,OTel,OTel1,HTel,HTel1,add_date from MMBER where del_tag = '0' and N_call_tag='0' and MC='"+ U_NUM + "'";
            commandText = "select Light_status,M_ID,N_Call_tag,M_Name,MC_Name,MTel1,MTel2,OTel,OTel1,HTel,HTel1,add_date from MMBER where del_tag = '0' and N_call_tag='0' and MC='" + U_NUM + "'";
            commandText = commandText + Q_Member_SQL;
        }
        else if (Q_Member == "1") //會員 M_Num不為Null(SQL: M_Num IS not NULL)
        {
            Q_Member_SQL = "and ( M_Num IS  NULL or M_Num='' )";
            //commandText = "select Light_status,M_Num,N_Call_tag,M_Name,MC_Name,MTel1,MTel2,OTel,OTel1,HTel,HTel1,add_date from MMBER where del_tag = '0' and N_call_tag='0' and MC='" + U_NUM +"'";
            commandText = "select Light_status,M_ID,N_Call_tag,M_Name,MC_Name,MTel1,MTel2,OTel,OTel1,HTel,HTel1,add_date from MMBER where del_tag = '0' and N_call_tag='0' and MC='" + U_NUM + "'";
            commandText = commandText + Q_Member_SQL;
        }
        else//不限
        {
            commandText = "select Light_status,M_ID,N_Call_tag,M_Name,MC_Name,MTel1,MTel2,OTel,OTel1,HTel,HTel1,add_date from MMBER where del_tag = '0' and N_call_tag='0' and MC='" + U_NUM + "'";
        }
        // }
        //20221012

        StringBuilder sbCommandText = new StringBuilder();
        // sbCommandText.Append(string.Format(commandText, ComID));
        List<MCMCHTREntity> MCMCHTRDataList = MUSERhgSql.Instance.getMCMCHTRData(connectionStrings, commandText);
        //getMREPOqueryDataList(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite(MCMCHTRDataList.ToString(), className, methodName);
        return MCMCHTRDataList;
    }
    //取得原責任助理姓名
    public string getMC_Name(string m_ID_)
    {
        //公司別comid.部門u_POSITION
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        // log.startWrite("'ComID' : " + ComID, className, methodName);
        string commandText = string.Empty;
        // if (common.isEmpty(ComID))
        // {
        //     commandText = "select * from MRMAP a left join MREPO b on a.Repo_no=b.REPO_no ";
        // }
        // else
        // {
        //commandText = "select * from MITEM where mitcode='"+U_NUM+"'";
        //commandText= "select auto_id,ROW_NUMBER() OVER(ORDER BY rank) AS ROWID,ddesc,ditcode,rank from MITEM where mitcode='" + U_NUM +"'";
        commandText = "SELECT [MC_Name] FROM [HG].[dbo].[MMBER] Where M_ID='"+ m_ID_+"'";
        // }

        StringBuilder sbCommandText = new StringBuilder();
        // sbCommandText.Append(string.Format(commandText, ComID));
        string MC_Name = MUSERhgSql.Instance.getMC_Name(connectionStrings, commandText);
        //getMREPOqueryDataList(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite(MC_Name, className, methodName);
        return MC_Name;
    }

    //由公司別,部門別取出對應的員工
    public  List<ditcodedescEntity> getSelectEmployList(string cOMID, string U_MDEP)
    {
        //公司別comid.部門u_POSITION
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        // log.startWrite("'ComID' : " + ComID, className, methodName);
        string commandText = string.Empty;
        // if (common.isEmpty(ComID))
        // {
        //     commandText = "select * from MRMAP a left join MREPO b on a.Repo_no=b.REPO_no ";
        // }
        // else
        // {
        //commandText = "select * from MITEM where mitcode='"+U_NUM+"'";
        //commandText= "select auto_id,ROW_NUMBER() OVER(ORDER BY rank) AS ROWID,ddesc,ditcode,rank from MITEM where mitcode='" + U_NUM +"'";
        commandText = "SELECT [U_Num],[U_Name] FROM  [HG].[dbo].[MUSER]  where  LeaveDate is  null and U_MDEP ='" + U_MDEP + "' and ComID='"+ cOMID + "'";
        // }

        StringBuilder sbCommandText = new StringBuilder();
        // sbCommandText.Append(string.Format(commandText, ComID));
        List<ditcodedescEntity> employList = MUSERhgSql.Instance.getSelectEmployList(connectionStrings, commandText);
        //getMREPOqueryDataList(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite(employList.ToString(), className, methodName);
        return employList;
    }

    public  List<ditcodedescEntity> getMPToMP_TypeList(string mPType)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        // log.startWrite("'ComID' : " + ComID, className, methodName);
        string commandText = string.Empty;
        // if (common.isEmpty(ComID))
        // {
        //     commandText = "select * from MRMAP a left join MREPO b on a.Repo_no=b.REPO_no ";
        // }
        // else
        // {
        //commandText = "select * from MITEM where mitcode='"+U_NUM+"'";
        //commandText= "select auto_id,ROW_NUMBER() OVER(ORDER BY rank) AS ROWID,ddesc,ditcode,rank from MITEM where mitcode='" + U_NUM +"'";
        commandText = "SELECT[ditcode],[ddesc] FROM[HG].[dbo].[MITEM] where ditcode<>'0000' and mitcode = '" + mPType + "'";
        // }

        StringBuilder sbCommandText = new StringBuilder();
        // sbCommandText.Append(string.Format(commandText, ComID));
        List<ditcodedescEntity> mrePOList = MUSERhgSql.Instance.getMPToMP_TypeList(connectionStrings, commandText);
        //getMREPOqueryDataList(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite(mrePOList.ToString(), className, methodName);
        return mrePOList;
    }

    //getAnalystsData
    ////取得員工資料維護作業-分析師資料
    public List<MUSERalystsEntity> getAnalystsData(string U_NUM)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        // log.startWrite("'ComID' : " + ComID, className, methodName);
        string commandText = string.Empty;
        // if (common.isEmpty(ComID))
        // {
        //     commandText = "select * from MRMAP a left join MREPO b on a.Repo_no=b.REPO_no ";
        // }
        // else
        // {
        //commandText = "select * from MITEM where mitcode='"+U_NUM+"'";
        //commandText= "select auto_id,ROW_NUMBER() OVER(ORDER BY rank) AS ROWID,ddesc,ditcode,rank from MITEM where mitcode='" + U_NUM +"'";
        commandText = "select auto_id,ddesc,ditcode,rank from MITEM where mitcode='" + U_NUM + "'";
        // }

        StringBuilder sbCommandText = new StringBuilder();
        // sbCommandText.Append(string.Format(commandText, ComID));
        List<MUSERalystsEntity> mrePOList = MUSERhgSql.Instance.getAnalystsData(connectionStrings, commandText);
        //getMREPOqueryDataList(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite(mrePOList.ToString(), className, methodName);
        return mrePOList;
    }

    //取得所有報表
    public List<MREPOqueryEntity> getALLMREPO_qyeryDataList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        // log.startWrite("'ComID' : " + ComID, className, methodName);
        string commandText = string.Empty;
        // if (common.isEmpty(ComID))
        // {
        //     commandText = "select * from MRMAP a left join MREPO b on a.Repo_no=b.REPO_no ";
        // }
        // else
        // {
        commandText = "select * from MRMAP a left join MREPO b on a.Repo_no=b.REPO_no ";
        // }

        StringBuilder sbCommandText = new StringBuilder();
        // sbCommandText.Append(string.Format(commandText, ComID));
        List<MREPOqueryEntity> mrePOList = MUSERhgSql.Instance.getMRMAPDataList(connectionStrings, sbCommandText.ToString());
        //getMREPOqueryDataList(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite(mrePOList.ToString(), className, methodName);
        return mrePOList;
    }
    //getMemberTypeList
    //public List<ditcodedescEntity> getMemberTypeList()
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    // log.startWrite("'ComID' : " + ComID, className, methodName);
    //    string commandText = string.Empty;
    //    // if (common.isEmpty(ComID))
    //    // {
    //    //     commandText = "select * from MRMAP a left join MREPO b on a.Repo_no=b.REPO_no ";
    //    // }
    //    // else
    //    // {
    //    //commandText = "select * from MRMAP a left join MREPO b on a.Repo_no=b.REPO_no ";
    //    commandText = "SELECT U_Num,U_Name  FROM [HG].[dbo].[MUSER]  where U_MDEP = '" + selectDept_Title + "'and ComID = '" + selectCom_Title + "'";
    //    // }

    //    //StringBuilder sbCommandText = new StringBuilder();

    //    // sbCommandText.Append(string.Format(commandText, ComID));
    //    List<ditcodedescEntity> MemberTypeList = MUSERhgSql.Instance.getLeaderList(connectionStrings, commandText);
    //    //getMREPOqueryDataList(connectionStrings, sbCommandText.ToString());//<=====================

    //    log.endWrite(MemberTypeList.ToString(), className, methodName);
    //    return MemberTypeList;
    //}
    //getLeaderList
    public List<ditcodedescEntity> getLeaderList(string selectCom_Title, string selectDept_Title)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        // log.startWrite("'ComID' : " + ComID, className, methodName);
        string commandText = string.Empty;
        // if (common.isEmpty(ComID))
        // {
        //     commandText = "select * from MRMAP a left join MREPO b on a.Repo_no=b.REPO_no ";
        // }
        // else
        // {
        //commandText = "select * from MRMAP a left join MREPO b on a.Repo_no=b.REPO_no ";
        commandText = "SELECT U_Num,U_Name  FROM [HG].[dbo].[MUSER]  where U_MDEP = '" + selectDept_Title + "'and ComID = '" + selectCom_Title + "'";
        // }

        //StringBuilder sbCommandText = new StringBuilder();

        // sbCommandText.Append(string.Format(commandText, ComID));
        List<ditcodedescEntity> mrePOList = MUSERhgSql.Instance.getLeaderList(connectionStrings, commandText);
        //getMREPOqueryDataList(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite(mrePOList.ToString(), className, methodName);
        return mrePOList;
    }
    public List<ditcodedescEntity> getAgentList(string selectCom_Title, string selectDept_Title)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        // log.startWrite("'ComID' : " + ComID, className, methodName);
        string commandText = string.Empty;
        // if (common.isEmpty(ComID))
        // {
        //     commandText = "select * from MRMAP a left join MREPO b on a.Repo_no=b.REPO_no ";
        // }
        // else
        // {
        //commandText = "select * from MRMAP a left join MREPO b on a.Repo_no=b.REPO_no ";
        commandText = "SELECT U_Num,U_Name  FROM [HG].[dbo].[MUSER]  where U_MDEP = '" + selectDept_Title + "'and ComID = '" + selectCom_Title + "'";
        // }

        //StringBuilder sbCommandText = new StringBuilder();

        // sbCommandText.Append(string.Format(commandText, ComID));
        List<ditcodedescEntity> mrePOList = MUSERhgSql.Instance.getAgentList(connectionStrings, commandText);
        //getMREPOqueryDataList(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite(mrePOList.ToString(), className, methodName);
        return mrePOList;
    }
    //updateMUserAnalystsEDITData
    public MUSERalystsEntity updateMUserAnalystsEDITData(string auto_id, string ProductName, string Code, string Sort)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //select ddesc,ditcode,rank from MITEM where mitcode = 'D1102072' and auto_id = '1014'
        //string commandText = string.Empty;
        //commandText = "select ddesc,ditcode,rank from MITEM where mitcode = '" + u_Num_M + "' and auto_id = '" + auto_id + "'";
        //string mUSERalystsEntity = MUSERhgSql.Instance.updateMUserAnalystsEDITData(connectionStrings, commandText);
        //return mUSERalystsEntity;
        string commandText = "UPDATE [dbo].[MITEM] SET [ddesc] = '{1}',[ditcode] = '{2}',[rank] = '{3}' WHERE [auto_id] = '{0}'";
        StringBuilder sb = new StringBuilder();
        //                                       0       1           2     3             
        sb.Append(string.Format(commandText, auto_id, ProductName, Code, Sort));
        string commandTXT = sb.ToString();
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sb.ToString());//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        MUSERalystsEntity MUSERalystsEntity = new MUSERalystsEntity();
        MUSERalystsEntity.Code = backStr;
        return MUSERalystsEntity;

    }
    public MUSERalystsEntity getMUserAnalystsEDITData(string u_Num_M, string auto_id)
    {
        //select ddesc,ditcode,rank from MITEM where mitcode = 'D1102072' and auto_id = '1014'
        string commandText = string.Empty;
        commandText = "select auto_id,ddesc,ditcode,rank from MITEM where mitcode = '" + u_Num_M + "' and auto_id = '" + auto_id + "'";
        MUSERalystsEntity mUSERalystsEntity = MUSERhgSql.Instance.getMUserAnalystsEDITData(connectionStrings, commandText);
        return mUSERalystsEntity;

    }

    //取得是否需要打卡
    public string getPunchcard_Tag(string  MP)
    {
        string commandText = string.Empty;
        commandText = "select Punchcard_tag from MUSER where U_Num = '" + MP + "'";
        MUSERalystsEntity mUSERalystsEntity = MUSERhgSql.Instance.getMUserAnalystsEDITData(connectionStrings, commandText);
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);//<==========
        return backStr;
        
    }
    //20220907進度!!!!!
    //新增個人資料
    public string addMuserData(muserEntity muser)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string U_Mdep = Session["U_MDEP"].ToString();
        //string U_NUM = Session["U_Num"].ToString();
        //string Comid = Session["ComID"].ToString();
        //log.startWrite("'MS_ID':" + ee.MS_ID + "'MS_Sender':" + ee.MS_Sender + "'MS_Receiver':" + ee.MS_Receiver + "'MS_Title':" + ee.MS_Title + "'MS_Text':" + ee.MS_Text + "'add_User':" + ee.add_User + "'add_ip':" + ee.add_ip, className, methodName);
        //20220907參考
        /*
         *  //20220610下午進度
        string commandText = "INSERT INTO [HG].[dbo].MBULT (adver_id,adver_item,adver_dep,adver_subject,adver_content,adver_depart_id,adver_employ_id,adver_Com,adver_create_date,adver_direct,add_user,add_ip,add_date) VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', GETDATE(), '{8}', '{9}', '{10}',  GETDATE())";
        StringBuilder sbCommandText = new StringBuilder();//  {0}',   '{1}',    '{2}',    '{3}',       '{4}',        '{5}',           '{6}',           '{7}',     GETDATE(),       '{8}',       '{9}',   '{10}', GETDATE()
                                                          //(adver_id,      adver_item,      adver_dep,     adver_subject,      adver_content,  adver_depart_id,  adver_employ_id,  adver_Com,  adver_create_date, adver_direct, add_user,add_ip,add_date) 
                                                          //('{0}',      '{1}',           '{2}',            '{3}',           '{4}',            '{5}', '            {6}',            '{7}',            GETDATE(), '  {8}',      '{9}', '{10}',  GETDATE())"
        sbCommandText.Append(string.Format(commandText, and.adver_id, and.adver_item, and.adver_dep, and.adver_subject, and.adver_content, and.adver_depart_id, and.add_user, and.adver_dep, and.adver_direct, and.add_user, and.add_ip,and.add_date));
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<=====================

         */
        //20220908進度!!!                          0       1    2         3          4        5       6       7          8    9           10          11                  12      13      14          15      16          17          18      19          20         21               22           23        24           25          26              27              28              29          30              31          32             33       34      35          36          37          38           39        40       41         42       43              44        45        46          47      48          49          50            51          52            53
        string commandText = "INSERT INTO MUSER ([U_Num],[Tag],[U_Pwd],[U_Name],[U_EName],[U_MDEP],[T_MDEP],[U_CARD],[U_TEL],[U_PID],[Punchcard_tag],[PaySheet_tag],[U_POSITION],[ComID],[ComLand],[U_ITEM],[SlimDate],[LeaveDate],[Note],[Sign_tag],[MG_Sort] ,[Fuc_open_Tag],[RepList_tag],[del_tag],[School_name1],[School_Dep1],[School_Grd1],[School_name2],[School_Dep2],[School_Grd2],[School_name3],[School_Dep3],[School_Grd3],[Be_Com1],[Be_Job1],[Be_Res1],[Be_Date1],[Be_Leave1],[Be_Salary1],[Be_Com2],[Be_Job2],[Be_Res2],[Be_Date2],[Be_Leave2],[Be_Salary2],[Be_Com3],[Be_Job3],[Be_Res3],[Be_Date3],[Be_Leave3],[Be_Salary3],[License_I],[License_A],[License_Detial]) VALUES";
        commandText += "('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}',  '{8}', '{9}', '{10}', '{11}', '{12}', '{13}', '{14}', '{15}', '{16}', '{17}', '{18}', '{19}', '{20}', '{21}', '{22}', '{23}', '{24}', '{25}', '{26}', '{27}', '{28}', '{29}', '{30}', '{31}', '{32}', '{33}', '{34}', '{35}', '{36}', '{37}', '{38}', '{39}', '{40}', '{41}', '{42}', '{43}', '{44}', '{45}', '{46}', '{47}', '{48}', '{49}', '{50}', '{51}', '{52}', '{53}')";
        StringBuilder sb = new StringBuilder();
        //                                            0       1           2           3           4               5               6           7               8           9           10                      11              12                  13              14             15           16              17          18              19              20                21                    22             23              24                 25              26              27                      28                  29                  30              31                  32                  33          34          35              36              37              38              39              40              41          42              43                  44              45              46              47              48              49          50                  51              52              53
        sb.Append(string.Format(commandText, muser.U_Num, muser.Tag, muser.U_Pwd, muser.U_Name, muser.U_EName, muser.U_MDEP, muser.T_MDEP, muser.U_Card, muser.U_TEL, muser.U_PID, muser.Punchcard_tag, muser.PaySheet_tag, muser.U_POSITION, muser.ComID, muser.ComLand, muser.U_Item, muser.SlimDate, muser.LeaveDate, muser.Note, muser.Sign_tag, muser.MG_Sort, muser.Fuc_open_Tag, muser.RepList_tag, muser.del_tag, muser.School_name1, muser.School_Dep1, muser.School_Grd1, muser.School_name2, muser.School_Dep2, muser.School_Grd2, muser.School_name3, muser.School_Dep3, muser.School_Grd3, muser.Be_Com1, muser.Be_Job1, muser.Be_Res1, muser.Be_Date1, muser.Be_Leave1, muser.Be_Salary1, muser.Be_Com2, muser.Be_Job2, muser.Be_Res2, muser.Be_Date2, muser.Be_Leave2, muser.Be_Salary2, muser.Be_Com3, muser.Be_Job3, muser.Be_Res3, muser.Be_Date3, muser.Be_Leave3, muser.Be_Salary3, muser.License_I, muser.License_A, muser.License_Detial));// 21muser.Sale_Continuous用NULL值帶
        string commandTXT = sb.ToString();
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sb.ToString());//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
    //20220919
    //儲存使用者維護作業修改
    //saveMuserEditData
    public string updateMuserEditData(muserEntity muser)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string U_Mdep = Session["U_MDEP"].ToString();
        //string U_NUM = Session["U_Num"].ToString();
        //string Comid = Session["ComID"].ToString();
        //log.startWrite("'MS_ID':" + ee.MS_ID + "'MS_Sender':" + ee.MS_Sender + "'MS_Receiver':" + ee.MS_Receiver + "'MS_Title':" + ee.MS_Title + "'MS_Text':" + ee.MS_Text + "'add_User':" + ee.add_User + "'add_ip':" + ee.add_ip, className, methodName);
        //20220907參考
        /*
         *  //20220610下午進度
        string commandText = "INSERT INTO [HG].[dbo].MBULT (adver_id,adver_item,adver_dep,adver_subject,adver_content,adver_depart_id,adver_employ_id,adver_Com,adver_create_date,adver_direct,add_user,add_ip,add_date) VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', GETDATE(), '{8}', '{9}', '{10}',  GETDATE())";
        StringBuilder sbCommandText = new StringBuilder();//  {0}',   '{1}',    '{2}',    '{3}',       '{4}',        '{5}',           '{6}',           '{7}',     GETDATE(),       '{8}',       '{9}',   '{10}', GETDATE()
                                                          //(adver_id,      adver_item,      adver_dep,     adver_subject,      adver_content,  adver_depart_id,  adver_employ_id,  adver_Com,  adver_create_date, adver_direct, add_user,add_ip,add_date) 
                                                          //('{0}',      '{1}',           '{2}',            '{3}',           '{4}',            '{5}', '            {6}',            '{7}',            GETDATE(), '  {8}',      '{9}', '{10}',  GETDATE())"
        sbCommandText.Append(string.Format(commandText, and.adver_id, and.adver_item, and.adver_dep, and.adver_subject, and.adver_content, and.adver_depart_id, and.add_user, and.adver_dep, and.adver_direct, and.add_user, and.add_ip,and.add_date));
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<=====================

         */
        /*
         *  commandText = "update [HG].[dbo].[MUSER] set [U_]='{0}',[Account_Date]='{1}',[MC]='{2}',[MC_Name]='{3}',[MC_Com]='{4}',[Account_Money]='{5}',[Pay_Type]='{6}',[edit_user]='{7}',[edit_date]=GETDATE() ,[edit_ip]='{8}',[T_Com]='{10}' where DT_ID='{9}'";
            sbCommandText = new StringBuilder();
            sbCommandText.Append(string.Format(commandText, cde.Pay_tag, cde.Account_Date, cde.MC, cde.MC_Name, cde.MC_Com, cde.Account_Money, cde.Pay_Type, cde.add_user, cde.add_ip, cde.DT_ID, cde.T_Com));
         */
        //20220919進度!!!                         
        string commandText = "UPDATE [dbo].[MUSER] SET [Tag] = '{1}',[U_Pwd] = '{2}',[U_Name] = '{3}',[U_EName] = '{4}',[U_MDEP] ='{5}',[T_MDEP] = '{6}',[U_Leader] ='{7}',[U_LeaderName] = '{8}',[U_LeaderCom] = '{9}',[U_Agent] ='{10}',[U_AgentName] ='{11}',[U_AgentCom] = '{12}',[U_Card] ='{13}',[U_Tel] = '{14}',[EMail] ='{15}',[U_POSITION] = '{16}',[ComID] = '{17}',[ComLand] = '{18}',[U_Item] = '{19}',[SlimDate] ='{20}',[LeaveDate] ='{21}',[edit_Date] = '{22}',[edit_User] ='{23}',[edit_ip] = '{24}',[EditDate] =getdate(),[EditUser] ='{25}' WHERE [U_Num] = '{0}'";
        StringBuilder sb = new StringBuilder();
        //                                            0       1           2           3           4               5               6                7               8                    9                10                      11              12                  13          14          15           16              17          18              19              20                21        22             23              24                 25         
        sb.Append(string.Format(commandText, muser.U_Num, muser.Tag, muser.U_Pwd, muser.U_Name, muser.U_EName, muser.U_MDEP, muser.T_MDEP, muser.U_LeaderNum, muser.U_LeaderName, muser.U_LeaderCom, muser.U_AgentNum, muser.U_AgentName, muser.U_AgentCom, muser.U_Card, muser.U_Tel, muser.EMail, muser.U_POSITION, muser.ComID, muser.ComLand, muser.U_Item, muser.SlimDate, muser.LeaveDate, muser.edit_Date, muser.edit_User, muser.edit_ip, muser.edit_User));// 21muser.Sale_Continuous用NULL值帶
        string commandTXT = sb.ToString();
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sb.ToString());//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
    //取出所有報表
    public List<MREPOqueryEntity> getALLMREPOqueryEntityList(string cmd)
    {
        //commandText = "select DEP_name,REPO_id,REPO_name,Note from MREPO";//取出所有報表
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'User_Num' : " + User_Num, className, methodName);
        string commandText = string.Empty;
        //string commandGetPerText = string.Empty;
        commandText = cmd;
        commandText = "select REPO_no,DEP_name,REPO_id,REPO_name,Note from MREPO";//取出所有有權限的報表
                                                                                  //StringBuilder sbCommandText = new StringBuilder();
                                                                                  //List<MREPOqueryEntity> mrePOList = MUSERhgSql.Instance.getMREPOqueryDataList(connectionStrings, commandText);//<=====================
        List<MREPOqueryEntity> mrePOList = MUSERhgSql.Instance.getALLMREPOqueryEntityList(connectionStrings, commandText);//<=====================
        return mrePOList;
    }
    //20220809
    //取出此帳號可執行的報表權限
    public List<MREPOqueryEntity> getMREPOqueryEntityList(string User_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'User_Num' : " + User_Num, className, methodName);
        string commandText = string.Empty;
        string commandGetPerText = string.Empty;
        //if (common.isEmpty(User_Num))
        //{
        //    commandText = "select U_Num,U_Name,U_EName,ComID From MUSER  where U_Position = '0005' and LeaveDate is null and del_tag='0' order by comID";
        //}
        //else
        //{
        //    commandText = "select U_Num,U_Name,U_EName,ComID From MUSER  where U_Position = '0005' and ComID = '{0}' and LeaveDate is null";
        //}
        //commandGetAllText = "select * from MREPO";//取出所有報表
        //commandGetPerText = "select * from MRMAP where U_NUM='{0}'  and del_tag=0";//指定帳號取得可用的報表權限
        commandText = "select b.DEP_name,b.REPO_id,b.REPO_name,b.Note,a.per_open,b.REPO_no from MRMAP a left join MREPO b on a.Repo_no=b.REPO_no where U_NUM='{0}'";
        //commandText = "select a.DEP_name,a.REPO_id,a.REPO_name,a.Note,b.per_open from MREPO a left join MRMAP b on a.REPO_no=b.Repo_no where U_NUM='{0}' order by DEP_name desc";
        //StringBuilder sbCommandText = new StringBuilder();
        StringBuilder sbCommandGetPerText = new StringBuilder();//指定帳號取得可用的報表權限
        sbCommandGetPerText.Append(string.Format(commandText, User_Num)); ;//指定帳號取得可用的報表權限
        //List<MREPOqueryEntity> mreGetAllList = getALLMREPOqueryEntityList(sbCommandGetPerText);//取得所有報表
        //修改這裡
        //取得此帳號使用報表的權限
        List<MREPOqueryEntity> mreGetPerList = MUSERhgSql.Instance.getMREPOqueryDataList(connectionStrings, sbCommandGetPerText.ToString());//指定帳號取得可用的報表權限
        //List<MREPOqueryEntity> mrePOListWithPre = new List<MREPOqueryEntity>();//加入帳號的報表權限欄位值
        //int match = 0;
        //int time = 0;
        //foreach (var itemMrePOList in mreGetPerList)
        //{
        //    mrePOListWithPre.Add(itemMrePOList);    
        //    //foreach (var itemMrePOListGetPre in mreGetPerList)
        //    //{
        //    //    if (itemMrePOList.REPO_no == itemMrePOListGetPre.REPO_no)
        //    //    {
        //    //        //itemMrePOList.REPO_no=itemMrePOListGetPre.REPO_no;
        //    //        itemMrePOList.per_open = "1";
        //    //        mrePOListWithPre.Add(itemMrePOList);
        //    //        match = 1;
        //    //    }
        //    //}
        //    //if (match == 0)
        //    //{
        //    //    itemMrePOList.per_open = "0";
        //    //    mrePOListWithPre.Add(itemMrePOList);
        //    //}
        //    //time++;
        //}
        log.endWrite(mreGetPerList.ToString(), className, methodName);
        return mreGetPerList;
    }
    //取出此帳號可執行的功能(20220802)
    public List<muserMenuSetupEntity> getMUSER_MenuSetupDataList(string U_Num)
    {
        //20220802要修改!!!
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        //sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        //string commandText = "SELECT * FROM [HG].[dbo].[MUMAP]  where menu_no='{0}' and U_Num='{1}'  and del_tag = '0'";
        //string commandText = "SELECT * FROM [HG].[dbo].[MUMAP]  where  U_Num='{0}'  and del_tag = '0'";
        //string commandText = "select auto_id,top_id,sub_id,item_id,name from MMENU where del_tag = '0'  order by top_id,sub_id,item_id";//auto_id:MENU_no
        string commandText = "select * from MMENU where del_tag = '0' order by top_id,sub_id,item_id";//20220804(取出全部的選單項目)
        StringBuilder sbCommandText = new StringBuilder();
        //sbCommandText.Append(string.Format(commandText, menu_no, U_Num));
        sbCommandText.Append(string.Format(commandText, U_Num));
        //sbCommandText.Append(commandText);
        List<muserMenuSetupEntity> mmsList = MUMAPhgSql.Instance.getUserAuthority(connectionStrings, sbCommandText.ToString());//20220804執行這裡!!20220804(取出全部的選單項目)
        //List<muserMenuSetupEntity> mmsList_new = MUMAPhgSql.Instance.getUserAuthorityList(connectionStrings, sbCommandText.ToString());
        List<muserMenuSetupEntity> mmsList_addper = new List<muserMenuSetupEntity>();
        string cmd = "select * from MUMAP where U_Num='" + U_Num + "'";//取得此帳號可執行的權限
        List<muserMenuSetupEntity> mmsList2 = MUMAPhgSql.Instance.getUserAuthorityList(connectionStrings, cmd, U_Num);//取出此帳號可執行的功能(20220802)
        int match = 0;//是否在權限列表中
        foreach (var item in mmsList)//取出全部的選單項目
        {
            StringBuilder sbCommandText2 = new StringBuilder();
            //string cmd = "select menu_no,menu_id,name,per_read,per_add,per_edit,per_del,per_query from MMENU a left join [HG].[dbo].[MUMAP] b on a.auto_id=b.menu_no";
            //string cmd = "select a.top_id,a.sub_id,a.item_id,menu_no,menu_id,name,per_read,per_add,per_edit,per_del,per_query from MMENU a left join [HG].[dbo].[MUMAP] b on a.auto_id=b.menu_no";//20220804
            //string cmd = "select auto_id,* from MMENU where del_tag = '0' order by top_id,sub_id,item_id";
            //string cmd = "select * from MUMAP where U_Num='"+U_Num+"'";//取得此帳號可執行的權限
            //List<muserMenuSetupEntity> mmsList2 = MUMAPhgSql.Instance.getUserAuthorityList(connectionStrings, cmd, U_Num);
            //為全部的選單項目加上此帳號的權限
            foreach (var item2 in mmsList2)
            {
                if (item.auto_id.Trim() == item2.menu_no.Trim())
                {
                    //if (item.auto_id.Trim() == "172")
                    //{
                    //    item.per_read = item2.per_read;//讀取
                    //    item.per_add = item2.per_add;//新增
                    //    item.per_query = item2.per_query;//進階查詢
                    //    item.per_edit = item2.per_edit;//修改
                    //    item.per_del = item2.per_del;//刪除
                    //    item.per_add = item2.per_add;//新增
                    //    mmsList_addper.Add(item);
                    //    match = 1;
                    //}
                    //else
                    //{
                    item.per_read = item2.per_read;//讀取
                    item.per_add = item2.per_add;//新增
                    item.per_query = item2.per_query;//進階查詢
                    item.per_edit = item2.per_edit;//修改
                    item.per_del = item2.per_del;//刪除
                    item.per_add = item2.per_add;//新增
                    mmsList_addper.Add(item);
                    match = 1;
                    //}

                }

                //mmsList_new.Add(item);
            }
            if (match == 0)
            {
                item.per_read = "0";//讀取
                item.per_add = "0";//新增
                item.per_query = "0";//進階查詢
                item.per_edit = "0";//修改
                item.per_del = "0";//刪除
                item.per_add = "0";//新增
                mmsList_addper.Add(item);
            }
            //if (!mmsList_addper.Contains(item))
            //{
            //    mmsList2.Add(item);
            //}    
            //menu_no=item.menu_no
            //select * from MUMAP where del_tag = '0'and menu_no=19
            //if (!mmsList_addper.Contains(item))
            //{
            //    item.per_read = "0";//讀取
            //    item.per_add = "0";//新增
            //    item.per_query = "0";//進階查詢
            //    item.per_edit = "0";//修改
            //    item.per_del = "0";//刪除
            //    item.per_add = "0";//新增
            //    mmsList_addper.Add(item);
            //    mmsList2.Add(item);
            //}
        }

        log.endWrite(mmsList_addper.ToString(), className, methodName);
        return mmsList_addper;//所有選單項目加上權限設定
    }

    public string ChangeState(string u_Num, string Per_Kind, string menu_no, string status)
    {
        string SQL = "";
        if (Per_Kind == "r")
        {
            SQL = "UPDATE [dbo].[MUMAP] set per_read=";
        }
        else if (Per_Kind == "e")
        {
            SQL = "UPDATE [dbo].[MUMAP] set per_edit=";
        }
        else if (Per_Kind == "a")
        {
            SQL = "UPDATE [dbo].[MUMAP] set per_add=";
        }
        else if (Per_Kind == "d")
        {
            SQL = "UPDATE [dbo].[MUMAP] set per_del=";
        }
        if (status == "1")
        {
            SQL = SQL + "'0' where U_Num='" + u_Num + "'";
        }
        else if (status == "0")
        {
            SQL = SQL + "'1' where U_Num='" + u_Num + "'";
        }
        SQL = SQL + " and menu_no='" + menu_no + "'";
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString());
        SqlCommand sqlCommand = conn.CreateCommand();
        sqlCommand.Connection = conn;
        sqlCommand.CommandText = SQL;
        conn.Open();
        string result = sqlCommand.ExecuteNonQuery().ToString();
        return result;
    }

    //傳入menu_id及u_Numm傳回權限開啟狀態
    public string getPer_State(string menu_id, string U_Num, string Per_Kind)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string Per = "";
        string commandText = "";
        StringBuilder sb = new StringBuilder();
        if (Per_Kind == "a")
        {
            commandText = "select per_add from MUMAP where U_Num ='" + U_Num + "'" + "AND menu_no = '" + menu_id + "'";//20220804(取出全部的選單項目)
        }
        else if (Per_Kind == "r")
        {
            commandText = "select per_read from MUMAP where U_Num ='" + U_Num + "'" + "AND menu_no = '" + menu_id + "'";//20220804(取出全部的選單項目)
        }
        else if (Per_Kind == "e")
        {
            commandText = "select per_edit from MUMAP where U_Num ='" + U_Num + "'" + "AND menu_no = '" + menu_id + "'";//20220804(取出全部的選單項目)
        }
        else if (Per_Kind == "d")
        {
            commandText = "select per_del from MUMAP where U_Num ='" + U_Num + "'" + "AND menu_no = '" + menu_id + "'";//20220804(取出全部的選單項目)
        }

        StringBuilder sbCommandText = new StringBuilder();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            Per = GetValueBYSQL(conn, commandText);
        }
        //sbCommandText.Append(string.Format(commandText, menu_no, U_Num));
        //sbCommandText.Append(string.Format(commandText, U_Num));
        //sbCommandText.Append(commandText);
        //sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);
        return Per;
    }

    public string GetValueBYSQL(SqlConnection conn, string commandText)
    {
        string value = "";
        //using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        //{
        SqlConnection connection = conn;

        //conn.ConnectionString = connectionStrings;
        //conn.Open();
        //conn.ConnectionString = connectionStrings;
        //conn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = commandText;
        DataTable dt = new DataTable();
        //conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
        //conn.Open();
        //SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        //cmd.CommandText = tsql;
        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
        adapter.Fill(dt);//取出所有會場編號
                         //int V_ID_Count = dt.Rows.Count;
                         //List<SRMVENUEntity> SRMVENUEntityList = new List<SRMVENUEntity>();
                         //for (int i = 0; i < V_ID_Count; i++)
                         //{
                         //    string V_ID=dt[i][0].
                         //}
        foreach (DataRow row in dt.Rows)
        {
            //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
            value = row[0].ToString();
        }
        conn.Close();
        //}
        return value;
    }

    /// <summary>
    /// 製作getEmpList執行sql時需要的連線字串、執行命令字串
    /// </summary>
    /// <param name="U_Position"></param>
    /// <returns></returns>
    /*public List<indexBDdataEntity> getAnalystList(string isLeaveDate, string U_Position,string ComID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'isLeaveDate' :"+ isLeaveDate + "& 'U_Position':" + U_Position + "& 'ComID':" + ComID, className, methodName);
        string commandText = string.Empty;
        if (common.isEmpty(ComID))
        {
            if (common.isEmpty(isLeaveDate))
            {
                commandText = "select U_Num,U_Name,U_EName,ComID From MUSER  where U_Position = '{0}'";
            }
            else
            {
                commandText = "select U_Num,U_Name,U_EName,ComID From MUSER  where U_Position = '{0}' and LeaveDate is null";
            }

        }
        else
        {
            commandText = "select U_Num,U_Name,U_EName,ComID From MUSER  where U_Position = '{0}' and ComID = '{1}' and LeaveDate is null";
        }

        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, U_Position, ComID));
        List<indexBDdataEntity> eList = MUSERhgSql.Instance.getAnalystList(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite(eList.ToString(), className, methodName);
        return eList;
    }*/
    //getHnBankCredit
    //public List<noticeBoardEntity> getHnBankCredit(string ComID)
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    log.startWrite("'ComID' : " + ComID, className, methodName);
    //    string commandText = string.Empty;
    //    if (common.isEmpty(ComID))
    //    {
    //        commandText = "select U_Num,U_Name,U_EName,ComID From MUSER  where U_Position = '0005' and LeaveDate is null and del_tag='0' order by comID";
    //    }
    //    else
    //    {
    //        commandText = "select U_Num,U_Name,U_EName,ComID From MUSER  where U_Position = '0005' and ComID = '{0}' and LeaveDate is null";
    //    }

    //    StringBuilder sbCommandText = new StringBuilder();
    //    sbCommandText.Append(string.Format(commandText, ComID));
    //    List<noticeBoardEntity> eList = MBULThgDao.Instance.getHnBankCredit(connectionStrings, sbCommandText.ToString());//<=====================

    //    log.endWrite(eList.ToString(), className, methodName);
    //    return eList;
    //}

    public List<TradingStatus> getTradingStatusListFucList(string ComID, string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID' : " + ComID, className, methodName);
        string commandText = string.Empty;
        if (common.isEmpty(ComID))
        {
            commandText = "select U_Num,U_Name,U_EName,ComID From MUSER  where U_Position = '0005' and LeaveDate is null and del_tag='0' order by comID";
        }
        else
        {
            commandText = "select U_Num,U_Name,U_EName,ComID From MUSER  where U_Position = '0005' and ComID = '{0}' and LeaveDate is null";
        }

        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, ComID));
        List<TradingStatus> eList = MITEMhgSql.Instance.getTradingStatusListFucList();//<=====================

        log.endWrite(eList.ToString(), className, methodName);
        return eList;
    }
    public List<indexBDdataEntity> getAnalystList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'ComID' : " + ComID, className, methodName);
        string commandText = string.Empty;

            //取得所有分析師
            commandText = "select U_Num,U_Name,U_EName,ComID From MUSER  where U_Position = '0005' and LeaveDate is null and del_tag='0' order by comID";
     
        

        StringBuilder sbCommandText = new StringBuilder();
        //sbCommandText.Append(string.Format(commandText, ComID));
        List<indexBDdataEntity> eList = MUSERhgSql.Instance.getAnalystList(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite(eList.ToString(), className, methodName);
        return eList;
    }
    /// <summary>
    /// 製作getEmpList執行sql時需要的連線字串、執行命令字串
    /// </summary>
    /// <param name="U_Position"></param>
    /// <returns></returns>
    public List<indexBDdataEntity> getAnalystList(string ComID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID' : " + ComID, className, methodName);
        string commandText = string.Empty;
        if (string.IsNullOrEmpty(ComID))
        {
            //select U_Num,U_Name,U_EName,ComID From MUSER
            //取得所有分析師
            commandText = "select U_Num,U_Name,U_EName,ComID From MUSER  where U_Position = '0005' and LeaveDate is null and del_tag='0' order by comID";
        }
        else
        {
            commandText = "select U_Num,U_Name,U_EName,ComID From MUSER  where U_Position = '0005' and ComID = '"+ ComID + "' and LeaveDate is null";//先不限制ComID(原系統有限制.為開發方便先取消限制),之後因業務聯絡單-新增功能需求再加上ComID限制
        }

        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, ComID));
        List<indexBDdataEntity> eList = MUSERhgSql.Instance.getAnalystList(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite(eList.ToString(), className, methodName);
        return eList;
    }

    //getDispatcherList
    public List<indexBDdataEntity> getDispatcherList(string ComID, string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'ComID' : " + ComID + "'U_Num' : " + U_Num, className, methodName);

        string commandText = "";
        if (U_Num == "B9601151")
        {
            commandText = "select U_Num,U_Name From MUSER where LeaveDate is null and (U_MDEP='0002' or U_MDEP='0006' or U_MDEP='0007' or U_MDEP='0008' or U_MDEP='0011' or U_MDEP='0012') AND u_NUM<>'Z0000001' AND u_NUM<>'Z0000002' AND u_NUM<>'Z0000003' order by U_MDEP";
        }
        else if (ComID == "HG01")
        {
            commandText = "select U_Num,U_Name From MUSER where LeaveDate is null and (U_MDEP='0002' or U_MDEP='0006' ) AND u_NUM<>'Z0000001' AND u_NUM<>'Z0000002' AND u_NUM<>'Z0000003' order by U_MDEP";
        }
        else if (ComID == "HG02")
        {
            commandText = "select U_Num,U_Name From MUSER where LeaveDate is null and (U_MDEP='0007' or U_MDEP='0008' ) AND u_NUM<>'Z0000011' AND u_NUM<>'Z0000012' order by U_MDEP";
        }
        else if (ComID == "HG03")
        {
            commandText = "select U_Num,U_Name From MUSER where LeaveDate is null and (U_MDEP='0011' or U_MDEP='0012' ) AND u_NUM<>'Z0300001' AND u_NUM<>'Z0300002'  order by U_MDEP";
        }
        else if (ComID == "HG07")
        {
            commandText = "select U_Num,U_Name From MUSER where LeaveDate is null and (U_MDEP='0018' or U_MDEP='0019' ) AND u_NUM<>'Z7000001' AND u_NUM<>'Z7000002'  order by U_MDEP";
        }
        else if (ComID == "HG05")
        {
            commandText = "select U_Num,U_Name From MUSER where LeaveDate is null and (U_MDEP='0015' or U_MDEP='0016' ) AND u_NUM<>'Z0010001' AND u_NUM<>'Z0010002'  order by U_MDEP";
        }

        List<indexBDdataEntity> ibddeList = MUSERhgSql.Instance.getDispatcherList(connectionStrings, commandText);
        return ibddeList;
    }
    public List<indexBDdataEntity> getAnalystListForDate(string startDate, string endDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'startDate' : " + startDate + "'endDate' : " + endDate, className, methodName);
        string commandText = "select U_Num,U_Name,U_EName,ComID From MUSER  where U_Position='0005' and (LeaveDate is null or (LeaveDate >='" + startDate + "' and LeaveDate <'" + endDate + "')) and del_tag='0' order by comID";

        List<indexBDdataEntity> ibddeList = MUSERhgSql.Instance.getAnalystList(connectionStrings, commandText);//<=====================

        log.endWrite("結果--'ibddeList':" + ibddeList.ToString(), className, methodName);
        return ibddeList;
    }
    //20220517NEW
    public List<muserEntity> getAnalystListForSRMSYSKQuery(string U_Position, string ComID, string U_Num, string LeaveDate, string U_MDEP, string U_Leader)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string U_MDEP = Session["U_MDEP"];
        log.startWrite("'U_Position':" + U_Position + "'Comid':" + ComID + "'U_Num':" + U_Num + "'LeaveDate':" + LeaveDate, className, methodName);
        string commandText = string.Empty;
        if (U_Num == "A9612031")
        {
            commandText = "select U_Num,U_Name From MUSER  where U_Position = '0005' and (Comid='" + ComID + "' or U_Num='D9406011') and LeaveDate is null";
        }
        else if (U_MDEP == "0006")
        {
            commandText = "select U_Num,U_Name From MUSER  where U_Position = '0005' and (Comid='" + ComID + "' or U_Num='C9404011') and LeaveDate is null";
        }
        else if (U_MDEP == "0002" || U_MDEP == "0007" || U_MDEP == "0008" || U_MDEP == "0011" || U_MDEP == "0012")
        {
            commandText = "select U_Num,U_Name From MUSER  where U_Position = '0005' and (Comid='" + ComID + "' or U_Num='C9404011') and LeaveDate is null";
        }
        else if (U_Position == "0006")
        {
            commandText = "select U_Num,U_Name From MUSER  where U_Position = '0005' and U_Num='" + U_Leader + "' and LeaveDate is null";
        }
        else if (U_Position == "0005")
        {
            commandText = "select U_Num,U_Name From MUSER  where U_Position = '0005' and U_Num='" + U_Num + "' and LeaveDate is null";
        }
        else
        {
            commandText = "select U_Num,U_Name From MUSER  where U_Position = '0005' and LeaveDate is null";
        }


        List<muserEntity> ibddeList = MUSERhgSql.Instance.getAnalystListForSRMSYSKQuery(connectionStrings, commandText);//<=====================

        log.endWrite("'ibddeList' :" + ibddeList.ToString(), className, methodName);
        return ibddeList;
    }

    private string GetU_LeaderByU_Num(string u_Num, string connectionStrings)
    {

        throw new NotImplementedException();
    }

    public List<indexBDdataEntity> getAnalystListByDateAndComID(string startDate, string endDate, string ComID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'startDate' : " + startDate + "'endDate' : " + endDate + "'ComID' : " + ComID, className, methodName);
        string commandText = "select U_Num,U_Name,U_EName,ComID From MUSER  where U_Position='0005' and (LeaveDate is null or (LeaveDate >='" + startDate + "' and LeaveDate <'" + endDate + "')) and del_tag='0' and ComID='" + ComID + "' order by comID";

        List<indexBDdataEntity> ibddeList = MUSERhgSql.Instance.getAnalystList(connectionStrings, commandText);//<=====================

        log.endWrite("結果--'ibddeList':" + ibddeList.ToString(), className, methodName);
        return ibddeList;
    }

    public List<indexBDdataEntity> getMcListByDateAndComIDAndDep(string startDate, string endDate, string ComID, string Dep)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'startDate' : " + startDate + "'endDate' : " + endDate + "'ComID' : " + ComID + "'Dep' : " + Dep, className, methodName);
        string commandText = "select U_Num,U_Name,U_EName,ComID From MUSER  where (LeaveDate is null or (LeaveDate >='" + startDate + "' and LeaveDate <'" + endDate + "')) and del_tag='0' and ComID='" + ComID + "' and U_mdep='" + Dep + "'";

        List<indexBDdataEntity> ibddeList = MUSERhgSql.Instance.getAnalystList(connectionStrings, commandText);//<=====================

        log.endWrite("結果--'ibddeList':" + ibddeList.ToString(), className, methodName);
        return ibddeList;
    }


    public List<indexBDdataEntity> getAnalystListForMessageSearch(string ComID, string U_MDEP, string U_Num, string U_Leader, string U_POSITION)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID':" + ComID + "'U_MDEP':" + U_MDEP + "'U_Num':" + U_Num + "'U_Leader':" + U_Leader + "'U_POSITION':" + U_POSITION, className, methodName);

        string commandText = string.Empty;
        if (U_MDEP == "0006")
        {
            commandText = "select U_Num,U_Name From MUSER  where U_Position = '0005' and Comid='" + ComID + "' and LeaveDate is null or U_Num='C9404011'";
        }
        else if (U_MDEP == "0002" || U_MDEP == "0007" || U_MDEP == "0008")
        {
            commandText = "select U_Name,BirthDayDate,U_Num From MUSER  where U_Position = '0005' and Comid='" + ComID + "' and LeaveDate is null";
        }
        else if (U_POSITION == "0006")
        {
            commandText = "select U_Name,BirthDayDate,U_Num From MUSER  where U_Position = '0005' and U_Num='" + U_Leader + "' and LeaveDate is null";
        }
        else if (U_POSITION == "0005")
        {
            commandText = "select U_Name,BirthDayDate,U_Num From MUSER  where U_Position = '0005' and U_Num='" + U_Num + "' and LeaveDate is null";
        }
        else
        {
            commandText = "select U_Name,BirthDayDate,U_Num From MUSER  where U_Position = '0005' and LeaveDate is null";
        }

        List<indexBDdataEntity> ibddeList = MUSERhgSql.Instance.getEmpBDlist(connectionStrings, commandText);//<=====================

        log.endWrite("'ibddeList' :" + ibddeList.ToString(), className, methodName);
        return ibddeList;
    }


    public List<indexBDdataEntity> getAllAnalystListForCallMessage(string ComID, string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID':" + ComID + "'U_MDEP':" + U_MDEP, className, methodName);

        string commandText = string.Empty;
        if (U_MDEP == "0002" || U_MDEP == "0006" || U_MDEP == "0007" || U_MDEP == "0008")
        {
            commandText = "select U_Name,BirthDayDate,U_Num From MUSER  where U_Position = '0005' and Comid='" + ComID + "' and LeaveDate is null";
        }
        else
        {
            commandText = "select U_Name,BirthDayDate,U_Num From MUSER MUSER  where U_Position = '0005' and LeaveDate is null";
        }

        List<indexBDdataEntity> ibddeList = MUSERhgSql.Instance.getEmpBDlist(connectionStrings, commandText);//<=====================

        log.endWrite("'ibddeList' :" + ibddeList.ToString(), className, methodName);
        return ibddeList;
    }

    public List<indexBDdataEntity> getAnalystListForOItable(string ComID, string U_MDEP, string U_Num, string U_Leader, string U_Position)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID':" + ComID + "'U_MDEP':" + U_MDEP + "'U_Num':" + U_Num + "'U_Leader':" + U_Leader + "'U_Position':" + U_Position, className, methodName);

        string commandText = string.Empty;
        if (U_Num == "A9612031")
        {
            commandText = "select U_Name,BirthDayDate,U_Num where U_Position = '0005' and (Comid='" + ComID + "' or U_Num='D9406011') and LeaveDate is null";
        }
        else if (U_MDEP == "0006")
        {
            commandText = "select U_Name,BirthDayDate,U_Num From MUSER  where U_Position = '0005' and (Comid='" + ComID + "' or U_Num='C9404011') and LeaveDate is null";
        }
        else if (U_MDEP == "0002" || U_MDEP == "0007" || U_MDEP == "0008" || U_MDEP == "0011" || U_MDEP == "0012")
        {
            commandText = "select U_Name,BirthDayDate,U_Num From MUSER  where U_Position = '0005' and Comid='" + ComID + "' and LeaveDate is null";
        }
        else if (U_Position == "0006")
        {
            commandText = "select U_Name,BirthDayDate,U_Num From MUSER  where U_Position = '0005' and U_Num='" + U_Leader + "' and LeaveDate is null";
        }
        else if (U_Position == "0005")
        {
            commandText = "select U_Name,BirthDayDate,U_Num From MUSER  where U_Position = '0005' and U_Num='" + U_Num + "' and LeaveDate is null";
        }
        else
        {
            commandText = "select U_Name,BirthDayDate,U_Num From MUSER  where U_Position = '0005' and LeaveDate is null";
        }
        List<indexBDdataEntity> ibddeList = MUSERhgSql.Instance.getEmpBDlist(connectionStrings, commandText);//<=====================

        log.endWrite("'ibddeList' :" + ibddeList.ToString(), className, methodName);
        return ibddeList;
    }

    public List<indexBDdataEntity> getAnalystListAllPowerSendRecord(string ComID, string U_MDEP, string U_Num, string U_Leader, string U_POSITION)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID':" + ComID + "'U_MDEP':" + U_MDEP + "'U_Num':" + U_Num + "'U_Leader':" + U_Leader + "'U_POSITION':" + U_POSITION, className, methodName);

        string commandText = string.Empty;
        if (U_Num == "A9612037")
        {
            commandText = "select U_Num,BirthDayDate,U_Name From MUSER  where U_Position = '0005' and Comid='" + ComID + "' and LeaveDate is null or U_Num='C9502231'";
        }
        else if (U_MDEP == "0002" || U_MDEP == "0006" || U_MDEP == "0007" || U_MDEP == "0008")
        {
            commandText = "select U_Name,BirthDayDate,U_Num From MUSER  where U_Position = '0005' and Comid='" + ComID + "' and LeaveDate is null";
        }
        else if (U_POSITION == "0006")
        {
            commandText = "select U_Name,BirthDayDate,U_Num From MUSER  where U_Position = '0005' and U_Num='" + U_Leader + "' and LeaveDate is null";
        }
        else if (U_POSITION == "0005")
        {
            commandText = "select U_Name,BirthDayDate,U_Num From MUSER  where U_Position = '0005' and U_Num='" + U_Num + "' and LeaveDate is null";
        }
        else
        {
            commandText = "select U_Name,BirthDayDate,U_Num From MUSER  where U_Position = '0005' and LeaveDate is null";
        }

        List<indexBDdataEntity> ibddeList = MUSERhgSql.Instance.getEmpBDlist(connectionStrings, commandText);//<=====================

        log.endWrite("'ibddeList' :" + ibddeList.ToString(), className, methodName);
        return ibddeList;
    }
    //下拉式選單選項變動時
    public List<muserEntity> getEmplist(string ComID, string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("ComID : " + ComID + "&& U_MDEP : " + U_MDEP, className, methodName);
        string commandText = string.Empty;
        //公司別為[不限]=>ComID:0000
        if (!common.isEmpty(ComID) && ComID != "0000")
        {
            if (U_MDEP.Trim() == "")
            {
                commandText = "select U_Name,BirthDayDate,U_Num,ComID,ComLand  FROM MUSER where del_tag='0' and leavedate is null and ComID='" + ComID + "'";
            }
            else
            {
                commandText = "select U_Name,BirthDayDate,U_Num,ComID,ComLand  FROM MUSER where del_tag='0' and leavedate is null and ComID='" + ComID + "' and U_MDEP='" + U_MDEP + "'";
            }
        }
        else
        {
            if (U_MDEP.Trim() != "")
            {
                commandText = "select U_Name,BirthDayDate,U_Num,ComID,ComLand  FROM MUSER where del_tag='0' and leavedate is null and U_MDEP='" + U_MDEP + "'";
            }
            else
            {
                commandText = "select U_Name,BirthDayDate,U_Num,ComID,ComLand  FROM MUSER where del_tag='0' and leavedate is null";
            }
        }
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, ComID, U_MDEP));
        List<muserEntity> ibdeList = MUSERhgSql.Instance.getEmpList(connectionStrings, sbCommandText.ToString());

        log.endWrite(ibdeList.ToString(), className, methodName);
        return ibdeList;
    }
    ////20220913work(修改時,依照選到的員工編號帶出原有資料)
    public List<muserEntity> getALLEmplist(string U_Num)
    {
        //取得所有員工員工編號
        //var keyword_Empty = string.IsNullOrEmpty(keyWord);
        //var ComID_Empty = string.IsNullOrEmpty(ComID);
        //var Dept_Empty = string.IsNullOrEmpty(Dept);
        string commandText1 = string.Empty;
        commandText1 = "SELECT U_Num FROM [HG].[dbo].[MUSER] where LeaveDate is null";
        //if (ComID != "0000")
        //{
        //    commandText1 += " ComID =" + ComID;
        //}
        //else
        //{
        //   // commandText1 = commandText1;
        //}
        //if (Dept != "0000")
        //{
        //    commandText1 += " U_MDEP =" + Dept;
        //}
        //else
        //{

        //}

        StringBuilder sbCommandText1 = new StringBuilder();
        sbCommandText1.Append(string.Format(commandText1));
        List<muserEntity> muserList = MUSERhgSql.Instance.getAllMuserForTable(connectionStrings, sbCommandText1.ToString());//回傳取回的資料
        ////員工編號 U_Num
        ///*
        // * SELECT distinct a.U_Num 員工編號,a.U_Name 姓名
        //    ,(SELECT b.ddesc FROM [HG].[dbo].[MUSER] a left join  MITEM b on a.U_Item= b.ditcode where b.mitcode='UITEM' and a.U_Num='B1103011') 職稱
        //    ,(SELECT b.ddesc FROM [HG].[dbo].[MUSER] a left join  MITEM b on a.U_MDEP= b.ditcode where b.mitcode='DEPAR' and a.U_Num='B1103011') 部門
        //    ,a.ComLand 所屬公司,a.U_Tel 分機 FROM [HG].[dbo].[MUSER] a left join  MITEM b on a.U_MDEP= b.ditcode where  a.U_Num='B1103011'

        // */
        //string methodName2 = System.Reflection.MethodBase.GetCurrentMethod().Name;
        ////log.startWrite("ComID : " + ComID, className, methodName2);
        //string commandText2 = string.Empty;
        //muserEntity ibdeList = new muserEntity();
        //List<muserEntity> AllList = new List<muserEntity>();
        //foreach (var item in userList)
        //{
        //string U_Num = item.U_Num; //員工編號
        //commandText2 = "SELECT distinct a.U_Num 員工編號, a.U_Name 姓名,(SELECT b.ddesc FROM [HG].[dbo].[MUSER] a left join  MITEM b on a.U_Item = b.ditcode where b.mitcode = 'UITEM' and a.U_Num = '" + U_Num + "') 職稱,(SELECT b.ddesc FROM[HG].[dbo].[MUSER] a left join MITEM b on a.U_MDEP = b.ditcode where b.mitcode = 'DEPAR' and a.U_Num = '" + U_Num + "') 部門,a.ComLand 所屬公司, a.U_Tel 分機 FROM[HG].[dbo].[MUSER] a left join MITEM b on a.U_MDEP = b.ditcode where a.U_Num = '" + U_Num + "'";
        //ibdeList = MUSERhgSql.Instance.getAllMuse(connectionStrings, commandText2.ToString());//回傳取回的資料
        //AllList.Add(ibdeList);
        //}
        return muserList;

    }


    public List<MREGT01Entity> getALLEmplist()
    {
        //取得所有員工員工編號
        string commandText1 = string.Empty;
        commandText1 = "SELECT U_Num FROM [HG].[dbo].[MUSER] where  LeaveDate is null and 1=1 ";
        

        StringBuilder sbCommandText1 = new StringBuilder();
        sbCommandText1.Append(string.Format(commandText1));
        List<MREGT01Entity> MRGT01List = new List<MREGT01Entity>(); //MUSERhgSql.Instance.getMREGT01List(connectionStrings, sbCommandText1.ToString());//回傳取回的資料




        return MRGT01List;

    }

    public List<muserEntity> getALLEmplist(string ComID, string Dept, string keyWord)
    {
        //取得所有員工員工編號
        var keyword_Empty = string.IsNullOrEmpty(keyWord);
        var ComID_Empty = string.IsNullOrEmpty(ComID);
        var Dept_Empty = string.IsNullOrEmpty(Dept);
        string commandText1 = string.Empty;
        if (!keyword_Empty)//關鍵字條件是否設定
        {
            commandText1 = "SELECT U_Num FROM [HG].[dbo].[MUSER] where U_Name like '%" + keyWord + "%' or U_Num like '%" + keyWord + "%' and LeaveDate is null and 1=1 ";
        }
        else
        {
            commandText1 = "SELECT U_Num FROM [HG].[dbo].[MUSER] where LeaveDate is  null";
        }
        if (ComID != "0000")
        {
            commandText1 += " ComID =" + ComID;
        }
        //else
        //{
        //   // commandText1 = commandText1;
        //}
        if (Dept != "0000")
        {
            commandText1 += " U_MDEP =" + Dept;
        }
        //else
        //{

        //}

        StringBuilder sbCommandText1 = new StringBuilder();
        sbCommandText1.Append(string.Format(commandText1, ComID));
        List<muserEntity> userList = MUSERhgSql.Instance.getAllMuserForTable(connectionStrings, sbCommandText1.ToString());//回傳取回的資料
                                                                                                                           //員工編號 U_Num
        /*
         * SELECT distinct a.U_Num 員工編號,a.U_Name 姓名
            ,(SELECT b.ddesc FROM [HG].[dbo].[MUSER] a left join  MITEM b on a.U_Item= b.ditcode where b.mitcode='UITEM' and a.U_Num='B1103011') 職稱
            ,(SELECT b.ddesc FROM [HG].[dbo].[MUSER] a left join  MITEM b on a.U_MDEP= b.ditcode where b.mitcode='DEPAR' and a.U_Num='B1103011') 部門
            ,a.ComLand 所屬公司,a.U_Tel 分機 FROM [HG].[dbo].[MUSER] a left join  MITEM b on a.U_MDEP= b.ditcode where  a.U_Num='B1103011'

         */
        string methodName2 = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("ComID : " + ComID, className, methodName2);
        string commandText2 = string.Empty;
        muserEntity ibdeList = new muserEntity();
        List<muserEntity> AllList = new List<muserEntity>();
        foreach (var item in userList)
        {
            string U_Num = item.U_Num; //員工編號
            commandText2 = "SELECT distinct a.U_Num 員工編號, a.U_Name 姓名,(SELECT b.ddesc FROM [HG].[dbo].[MUSER] a left join  MITEM b on a.U_Item = b.ditcode where b.mitcode = 'UITEM' and a.U_Num = '" + U_Num + "') 職稱,(SELECT b.ddesc FROM[HG].[dbo].[MUSER] a left join MITEM b on a.U_MDEP = b.ditcode where b.mitcode = 'DEPAR' and a.U_Num = '" + U_Num + "') 部門,a.ComLand 所屬公司, a.U_Tel 分機 FROM[HG].[dbo].[MUSER] a left join MITEM b on a.U_MDEP = b.ditcode where a.U_Num = '" + U_Num + "'";
            ibdeList = MUSERhgSql.Instance.getAllMuse(connectionStrings, commandText2.ToString());//回傳取回的資料
            AllList.Add(ibdeList);
        }
        return AllList;

    }
    //回傳所有員工資料(加入關鍵字搜尋)
    public List<muserEntity> getALLEmplist(string U_Num, string keyWord, string Com_, string Dept_)
    {
        //取得所有員工員工編號
        var keyword_Empty = string.IsNullOrEmpty(keyWord);
        bool Com_Empty = false;
        if (Com_ == "0000" || Com_ == null)
        {
            Com_Empty = true;
        }
        bool Dept_Empty = false;
        if (Dept_ == "0000" || Dept_ == null)
        {
            Dept_Empty = true;
        }
        string commandText1 = string.Empty;
        if (!keyword_Empty)//關鍵字條件是否設定
        {
            commandText1 = "SELECT U_Num FROM [HG].[dbo].[MUSER] where U_Name like '%" + keyWord + "%' or U_Num like '%" + keyWord + "%'  and 1=1 ";
        }
        else
        {
            commandText1 = "SELECT U_Num FROM [HG].[dbo].[MUSER] where LeaveDate is  null ";
        }
        if (Com_Empty)
        {
            commandText1 = commandText1;
        }
        else //0000(不限)
        {
            string cond_Com = " and ComID='" + Com_ + "'";
            commandText1 += cond_Com;
        }
        if (Dept_Empty)//0000(不限)
        {
            commandText1 = commandText1;
        }
        else
        {
            string cond_Dept = " and U_MDEP='" + Dept_ + "'";
            commandText1 += cond_Dept;
        }
        StringBuilder sbCommandText1 = new StringBuilder();
        sbCommandText1.Append(string.Format(commandText1, U_Num));
        List<muserEntity> userList = MUSERhgSql.Instance.getAllMuserForTable(connectionStrings, sbCommandText1.ToString());//回傳取回的資料
                                                                                                                           //員工編號 U_Num
        /*
         * SELECT distinct a.U_Num 員工編號,a.U_Name 姓名
            ,(SELECT b.ddesc FROM [HG].[dbo].[MUSER] a left join  MITEM b on a.U_Item= b.ditcode where b.mitcode='UITEM' and a.U_Num='B1103011') 職稱
            ,(SELECT b.ddesc FROM [HG].[dbo].[MUSER] a left join  MITEM b on a.U_MDEP= b.ditcode where b.mitcode='DEPAR' and a.U_Num='B1103011') 部門
            ,a.ComLand 所屬公司,a.U_Tel 分機 FROM [HG].[dbo].[MUSER] a left join  MITEM b on a.U_MDEP= b.ditcode where  a.U_Num='B1103011'

         */
        string methodName2 = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("U_Num : " + U_Num, className, methodName2);
        string commandText2 = string.Empty;
        muserEntity ibdeList = new muserEntity();
        List<muserEntity> AllList = new List<muserEntity>();
        foreach (var item in userList)
        {
            string U_Num_ = item.U_Num; //員工編號
            commandText2 = "SELECT distinct a.U_Num 員工編號, a.U_Name 姓名,(SELECT distinct b.ddesc FROM [HG].[dbo].[MUSER] a left join  MITEM b on a.U_Item = b.ditcode where b.mitcode = 'UITEM' and a.U_Num = '" + U_Num_ + "') 職稱,(SELECT b.ddesc FROM[HG].[dbo].[MUSER] a left join MITEM b on a.U_MDEP = b.ditcode where b.mitcode = 'DEPAR' and a.U_Num = '" + U_Num + "') 部門,a.ComLand 所屬公司, a.U_Tel 分機 FROM[HG].[dbo].[MUSER] a left join MITEM b on a.U_MDEP = b.ditcode where a.U_Num = '" + U_Num_ + "'";
            ibdeList = MUSERhgSql.Instance.getAllMuse(connectionStrings, commandText2.ToString());//回傳取回的資料
            AllList.Add(ibdeList);
        }
        return AllList;

    }

    public List<indexBDdataEntity> getEmpExtension(string ComID, string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("ComID : " + ComID + "U_MDEP : " + U_MDEP, className, methodName);

        string commandText = commandText = "select U_Item,U_Name,U_Tel FROM MUSER where ComID='" + ComID + "' and U_Mdep='" + U_MDEP + "' and Leavedate is null and U_Tel<>'' order by U_ITEM ,U_Tel";
        List<indexBDdataEntity> ibdeList = MUSERhgSql.Instance.getEmpExtension(connectionStrings, commandText);

        log.endWrite(ibdeList.ToString(), className, methodName);
        return ibdeList;
    }


    /// <summary>
    /// 取得員工生日列表
    /// </summary>
    /// <returns></returns>
    public List<indexBDdataEntity> getEmpBDlist()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        string commandText = "select U_Name,BirthDayDate,U_Num FROM MUSER where del_tag='0' and leavedate is null and BirthDayDate is not null order by DATEPART(month, BirthDayDate),DATEPART(day, BirthDayDate)";
        List<indexBDdataEntity> lmList = MUSERhgSql.Instance.getEmpBDlist(connectionStrings, commandText);

        log.endWrite(lmList.ToString(), className, methodName);
        return lmList;
    }

    public List<muserEntity> getEmplist()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        string commandText = "select * FROM MUSER where del_tag='0' and leavedate is null and BirthDayDate is not null order by DATEPART(month, BirthDayDate),DATEPART(day, BirthDayDate)";
        List<muserEntity> lmList = MUSERhgSql.Instance.getEmplist(connectionStrings, commandText);

        log.endWrite(lmList.ToString(), className, methodName);
        return lmList;
    }

    public List<ditcodedescEntity> getResponsibleAssistantListForMCMCHTR_query()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        string commandText = "select U_Num,U_Name,COMID From MUSER  where  (U_Mdep = '0002'  or U_Mdep = '0006' or U_Mdep = '0007' or U_Mdep = '0008' or U_Mdep = '0011' or U_Mdep = '0012' or U_Mdep = '0013' or U_Mdep = '0014' or U_Mdep = '0015' or U_Mdep = '0016' or U_Mdep = '0017'or U_Mdep = '0018' or U_Mdep = '0019' or U_Mdep = '0020' or U_Mdep = '0021' or U_Mdep = '0022' or U_Mdep = '0023' or U_Mdep = '0024') order by Leavedate,U_Name,ComID";

        List<ditcodedescEntity> ditcodedescs = new List<ditcodedescEntity>();

        List<ditcodedescEntity> ResponsibleAssistantList = MUSERhgSql.Instance.getResponsibleAssistantList(connectionStrings, commandText);
        return ResponsibleAssistantList;
    }
    public List<indexBDdataEntity> getResponsibleAssistantList(string ComID, string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID' :" + ComID + "'U_MDEP' :" + U_MDEP, className, methodName);

        StringBuilder sbCommandText = null;
        string commandText = "select U_Num,U_Name,U_MDEP,ComID From MUSER  where (U_Position = '0001'  or U_Position = '0006' or U_Position = '0007' or U_Position = '0008') and LeaveDate is null";
        if (common.isEmpty(ComID) && !common.isEmpty(U_MDEP))
        {
            commandText = "select U_Num,U_Name,U_MDEP,ComID From MUSER  where (U_Position = '0001'  or U_Position = '0006' or U_Position = '0007' or U_Position = '0008') and LeaveDate is null and U_MDEP='{0}'";
            sbCommandText = new StringBuilder();
            sbCommandText.Append(string.Format(commandText, U_MDEP));
            commandText = sbCommandText.ToString();
        }
        else if (!common.isEmpty(ComID) && common.isEmpty(U_MDEP))
        {
            commandText = "select U_Num,U_Name,U_MDEP,ComID From MUSER  where (U_Position = '0001'  or U_Position = '0006' or U_Position = '0007' or U_Position = '0008') and LeaveDate is null and ComID='{0}'";
            sbCommandText = new StringBuilder();
            sbCommandText.Append(string.Format(commandText, ComID));
            commandText = sbCommandText.ToString();
        }
        else if (!common.isEmpty(ComID) && !common.isEmpty(U_MDEP))
        {
            commandText = "select U_Num,U_Name,U_MDEP,ComID From MUSER  where (U_Position = '0001'  or U_Position = '0006' or U_Position = '0007' or U_Position = '0008') and LeaveDate is null and ComID='{0}' and U_MDEP='{1}'";
            sbCommandText = new StringBuilder();
            sbCommandText.Append(string.Format(commandText, ComID, U_MDEP));
            commandText = sbCommandText.ToString();
        }

        List<indexBDdataEntity> ibddeList = MUSERhgSql.Instance.getEmpData(connectionStrings, commandText);

        log.endWrite("'ibddeList' : " + ibddeList.ToString(), className, methodName);
        return ibddeList;
    }


    public mcDataEntity getMCdata(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);

        string commandText = "select U_Num,U_Name,U_MDEP,ComID,U_Leader,U_LeaderName,U_LeaderCom,SlimDate,LeaveDate,U_Agent from MUSER where U_Num ='{0}'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, U_Num));
        mcDataEntity mc = MUSERhgSql.Instance.getMCdata(connectionStrings, sbCommandText.ToString());

        log.endWrite(mc.ToString(), className, methodName);
        return mc;
    }
    //取得業務人員
    public List<mcDataEntity> getMClist(bool isAll)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        string commandText = string.Empty;
        if (isAll)
        {
            commandText = "select U_Num,U_Name,U_MDEP,ComID from MUSER";
        }
        else
        {
            commandText = "select U_Num,U_Name,U_MDEP,ComID from MUSER where (leavedate is NULL) AND del_tag='0' AND (U_MDEP='0002' OR U_MDEP='0006' OR U_MDEP='0007' OR U_MDEP='0008' OR U_MDEP='0011' OR U_MDEP='0012' OR U_MDEP='0013' OR U_MDEP='0014' OR U_MDEP='0015' OR U_MDEP='0016' OR U_MDEP='0017')  order by comid,U_MDEP";
        }
        List<mcDataEntity> mdeList = MUSERhgSql.Instance.getMClist(connectionStrings, commandText);

        log.endWrite(mdeList.ToString(), className, methodName);
        return mdeList;
    }


    //注意勿任意使用 因為它會改變LOG記錄檔的登入使用者名稱
    /// <summary>
    /// 製作getUserData執行sql時需要的連線字串、執行命令字串
    /// </summary>
    /// <param name="U_Num"></param>
    /// <returns></returns>
    public sessionEntity getUserData(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);

        string commandText = "SELECT U_Num,U_Name,U_POSITION,U_MDEP,ComID,ComLand,EMail,U_Leader,U_LeaderName,LeaveDate,U_LeaderCom FROM [HG].[dbo].[MUSER] where U_Num = '{0}' and del_tag = '0' and leavedate is null";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, U_Num));
        sessionEntity se = MUSERhgSql.Instance.getUserData(connectionStrings, sbCommandText.ToString(), U_Num);//<=====================

        log.endWrite(se.ToString(), className, methodName);
        return se;
    }

    /// <summary>
    /// 製作getEmpList執行sql時需要的連線字串、執行命令字串
    /// </summary>
    /// <param name="U_Position"></param>
    /// <returns></returns>
    /*public List<indexBDdataEntity> getAnalystListForPerformance(string startDate ,string endDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'startDate' : " + startDate+ " 'endDate' : "+ endDate, className, methodName);

        string commandText = "select U_Num,U_Name from MUSER where U_Position='0005' and (LeaveDate is null or (LeaveDate >='{0}' and LeaveDate <=DateAdd(\"d\",15,'{1}'))) and del_tag='0' order by comID";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, startDate, endDate));
        List<indexBDdataEntity> ibddeList = MUSERhgSql.Instance.getEmpData(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite("'ibddeList' : "+ibddeList.ToString(), className, methodName);
        return ibddeList;
    }*/

    public List<indexBDdataEntity> getEmpListForPerformance(string StartDate, string EndDate, string EmpType, string ComID, string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("StartDate :" + StartDate + "'EndDate' : " + EndDate + "'EmpType' : " + EmpType + "'ComID' : " + ComID + "'U_MDEP' : " + U_MDEP, className, methodName);
        string commandText = string.Empty;
        StringBuilder sbCommandText = new StringBuilder();
        List<indexBDdataEntity> ibddeList = null;
        if (EmpType == "Analyst")
        {
            if (common.isEmpty(ComID))
            {
                commandText = "select U_Num,U_name,U_MDEP,ComID from MUSER where U_Position='0005' and (LeaveDate is null or (LeaveDate >='{0}' and LeaveDate <=DateAdd(\"d\",15,'{1}'))) and del_tag='0' order by comID";
                sbCommandText.Append(string.Format(commandText, StartDate, EndDate));
            }
            else
            {
                commandText = "select U_Num,U_name,U_MDEP,ComID from MUSER where U_Position='0005' and (LeaveDate is null or (LeaveDate >='{0}' and LeaveDate <=DateAdd(\"d\",15,'{1}'))) and ComID='{2}' and del_tag='0' order by comID";
                sbCommandText.Append(string.Format(commandText, StartDate, EndDate, ComID));
            }
        }
        else if (EmpType == "Assistant")
        {
            commandText = "select U_Num,U_name,U_MDEP,ComID from MUSER where U_mdep='{0}' and (LeaveDate is null or (LeaveDate >='{1}' and LeaveDate <=DateAdd(\"d\",15,'{2}'))) and del_tag='0' and Comid='{3}' order by comID";
            sbCommandText.Append(string.Format(commandText, U_MDEP, StartDate, EndDate, ComID));
        }
        ibddeList = MUSERhgSql.Instance.getEmpData(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite("'ibddeList' : " + ibddeList.ToString(), className, methodName);
        return ibddeList;
    }

    public List<indexBDdataEntity> getGroupEmp(string startDate, string endDate, string groupType)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'startDate' : " + startDate + " 'endDate' : " + endDate + " 'endDate' : " + groupType, className, methodName);
        string commandText = string.Empty;
        if (groupType == "A")
        {
            commandText = "select U_Num,U_name,U_MDEP,ComID from MUSER where (U_mdep='0002' or U_mdep='0007' or U_mdep='0011' or U_mdep='0013' or U_mdep='0015') and (LeaveDate is null or (LeaveDate >='" + startDate + "' and LeaveDate <=DateAdd(\"d\",15,'" + endDate + "'))) and del_tag='0'";
        }
        else if (groupType == "B")
        {
            commandText = "select U_Num,U_name,U_MDEP,ComID from MUSER where (U_mdep='0006' or U_mdep='0008' or U_mdep='0012' or U_mdep='0014' or U_mdep='0016') and (LeaveDate is null or (LeaveDate >='" + startDate + "' and LeaveDate <=DateAdd(\"d\",15,'" + endDate + "'))) and del_tag='0'";
        }
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, startDate, endDate));
        List<indexBDdataEntity> ibddeList = MUSERhgSql.Instance.getEmpData(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite("'ibddeList' : " + ibddeList.ToString(), className, methodName);
        return ibddeList;
    }

    public List<indexBDdataEntity> getEmpListForAssistantDetailPerformanceTable(string StartDate, string EndDate, string U_MDEP, string MC)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("StartDate :" + StartDate + "'EndDate' : " + EndDate + "'U_MDEP' : " + U_MDEP + "'MC' : " + MC, className, methodName);
        string commandText = string.Empty;

        List<indexBDdataEntity> ibddeList = null;
        if (common.isEmpty(MC) && common.isEmpty(U_MDEP))
        {
            commandText = "select U_Num,U_name,U_MDEP,ComID from MUSER where (U_mdep='0002' or U_mdep='0006' or U_mdep='0007' or U_mdep='0008' or U_mdep='0011' or U_mdep='0012' or U_mdep='0013' or U_mdep='0014' or U_mdep='0015' or U_mdep='0016') and (LeaveDate is null or (LeaveDate >='" + StartDate + "' and LeaveDate <='" + EndDate + "')) and del_tag='0' order by U_mdep";
        }
        else if (common.isEmpty(U_MDEP))
        {
            commandText = "select U_Num,U_name,U_MDEP,ComID from MUSER where U_mdep='" + U_MDEP + "' and (LeaveDate is null or (LeaveDate >='" + StartDate + "' and LeaveDate <='" + EndDate + "')) and del_tag='0' order by U_mdep";
        }
        else
        {
            commandText = "select U_Num,U_name,U_MDEP,ComID from MUSER where U_Num='" + MC + "' and (LeaveDate is null or (LeaveDate >='" + StartDate + "' and LeaveDate <='" + EndDate + "')) and del_tag='0'";
        }
        ibddeList = MUSERhgSql.Instance.getEmpData(connectionStrings, commandText);//<=====================

        log.endWrite("'ibddeList' : " + ibddeList.ToString(), className, methodName);
        return ibddeList;
    }

    public List<string> getConcernedPeople(string MPcom)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("MPcom :" + MPcom, className, methodName);

        string commandText = "select U_Num from MUSER where (U_MDEP='0002' or U_MDEP='0006' or U_MDEP='0011' or U_MDEP='0012') and comid='" + MPcom + "' and LeaveDate is null";
        List<string> strList = MUSERhgSql.Instance.getConcernedPeople(connectionStrings, commandText);//<=====================

        log.endWrite("'strList' : " + strList.ToString(), className, methodName);
        return strList;
    }


    public List<businessERPstatusEntity> getMCdataForBusinessERPstatus(string U_MDEP, string User_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("U_MDEP :" + U_MDEP + "User_MDEP :" + User_MDEP, className, methodName);

        string sql1_txt = getSqlTxt.getMCdataForBusinessERPstatusST(U_MDEP, User_MDEP);
        string commandText = "select U_Num,U_Name from MUSER where  LeaveDate is null and del_tag='0' " + sql1_txt + " order by u_Mdep";
        List<businessERPstatusEntity> beseList = MUSERhgSql.Instance.getMCdataForBusinessERPstatus(connectionStrings, commandText);//<=====================

        log.endWrite("'beseList' : " + beseList.ToString(), className, methodName);
        return beseList;
    }
    public List<businessERPstatusEntity> getMCListForCompanyResourceTag(string ComID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID' :" + ComID, className, methodName);

        string commandText = string.Empty;
        if (ComID == "HG01")
        {
            commandText = "select U_Num,U_Name From MUSER  where (U_Mdep='0002' or U_Mdep='0006') and LeaveDate is null";
        }
        else if (ComID == "HG02")
        {
            commandText = "select U_Num,U_Name From MUSER  where (U_Mdep='0007' or U_Mdep='0008') and LeaveDate is null";
        }

        List<businessERPstatusEntity> beseList = MUSERhgSql.Instance.getMCdataForBusinessERPstatus(connectionStrings, commandText);//<==========

        log.endWrite("'beseList' : " + beseList.ToString(), className, methodName);
        return beseList;
    }

    public List<caseDistributeEntity> getMCListForCaseDistribute(string StartDate, string EndDate, string U_MDEP, string User_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'StartDate' :" + StartDate + "'EndDate' :" + EndDate + "'U_MDEP' :" + U_MDEP + "'User_MDEP' :" + User_MDEP, className, methodName);

        string sql1_txt = getSqlTxt.getMCListForCaseDistributeST(StartDate, EndDate, U_MDEP, User_MDEP);
        string commandText = "select U_Num,U_Name from MUSER where  LeaveDate is null and del_tag='0' " + sql1_txt + " order by U_MDEP";

        List<caseDistributeEntity> cdeList = MUSERhgSql.Instance.getMCListForCaseDistribute(connectionStrings, commandText);//<==========

        log.endWrite("'cdeList' : " + cdeList.ToString(), className, methodName);
        return cdeList;
    }


    public List<MediaClickStatisticsEntity> getAnalystTidData(string MR_DateY, string MR_DateM, string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'MR_DateY' : " + MR_DateY + " 'MR_DateM' : " + MR_DateM + " 'MP' : " + MP, className, methodName);

        string sql1_txt = getSqlTxt.getAnalystTidDataST(MR_DateY, MR_DateM, MP);
        //string commandText = "select (SELECT t_id FROM wanalysts a where a.U_Num = b.U_Num) as t_id,b.U_Name from MUSER b where U_Position='0005' and LeaveDate is null  and del_tag='0' " + sql1_txt + " order by comID";
        string commandText = "select (SELECT t_id FROM wanalysts a where a.U_Num = b.U_Num) as t_id,b.U_Name,b.U_Num from MUSER b where U_Position='0005' and LeaveDate is null  and del_tag='0' order by comID";
        List<MediaClickStatisticsEntity> mcseList = MUSERhgSql.Instance.getAnalystTidData(connectionStrings, commandText);//<==========

        log.endWrite("'mcseList' : " + mcseList.ToString(), className, methodName);
        return mcseList;
    }

    public List<EmpDataEntity> getEmpData(string StartDate, string EndDate, string dateType, string inoutService, string empName)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'dateType' : " + dateType + " 'inoutService' : " + inoutService + " 'empName' : " + empName, className, methodName);

        string sql_txt = getSqlTxt.getEmpDataST(StartDate, EndDate, dateType, inoutService, empName);
        string commandText = "select U_Name,U_MDEP,U_Num,BirthDayDate,SlimDate,LeaveDate,U_PID,OCity,OTown,OZipCode,OAddress,HCity,HTown,HZipCode,HAddress,HTel_Zone,HTel,HMobile,EName,EMobile from MUSER where del_tag='0'" + sql_txt + " order by U_Mdep,Leavedate";

        List<EmpDataEntity> edeList = MUSERhgSql.Instance.getEmpDataForTable(connectionStrings, commandText);//<==========

        log.endWrite("'edeList' : " + edeList.ToString(), className, methodName);
        return edeList;
    }

    public List<muserEntity> getEmpData()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'dateType' : " + dateType + " 'inoutService' : " + inoutService + " 'empName' : " + empName, className, methodName);

        string sql_txt = getSqlTxt.gerAllMuser();
        string commandText = "select* from MUSER where del_tag='0'" + sql_txt + " order by U_Mdep,Leavedate";

        List<muserEntity> mseList = MUSERhgSql.Instance.getEmpList(connectionStrings, commandText);//<==========

        log.endWrite("'mseList' : " + mseList.ToString(), className, methodName);
        return mseList;
    }

    public List<VenuePerformanceForMCentity> getVenuePerformanceForMC(string StartDate, string EndDate, string MC)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'MC' : " + MC, className, methodName);
        string commandText = string.Empty;
        if (!common.isEmpty(MC))
        {
            commandText = "select U_Num,U_name,U_MDEP from MUSER where U_Num='" + MC + "' and (LeaveDate is null or (LeaveDate >='" + StartDate + "' and LeaveDate <='" + EndDate + "')) and del_tag='0'";
        }
        else
        {
            commandText = "select U_Num,U_name,U_MDEP from MUSER where (U_mdep='0002' or U_mdep='0006' or U_mdep='0007' or U_mdep='0008' or U_mdep='0011' or U_mdep='0012' or U_mdep='0013' or U_mdep='0014' or U_mdep='0015' or U_mdep='0016' or U_mdep='0017') and (LeaveDate is null or (LeaveDate >='" + StartDate + "' and LeaveDate <='" + EndDate + "')) and del_tag='0' order by U_mdep";
        }

        List<VenuePerformanceForMCentity> vpfmeList = MUSERhgSql.Instance.getVenuePerformanceForMC(connectionStrings, commandText);//<==========

        log.endWrite("'vpfmeList' : " + vpfmeList.ToString(), className, methodName);
        return vpfmeList;
    }

    public List<TelStatisticsEntity> getAnalyst(getAnalystParamEntity gape)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'gape' : " + gape.ToString(), className, methodName);
        string commandText = string.Empty;
        string sql_txt = getSqlTxt.getAnalystST(gape);
        string U_Num = gape.U_Num;
        string U_MDEP = gape.U_MDEP;
        string ComID = gape.ComID;
        if (U_Num == "A9612037" || U_Num == "A9501041")
        {
            commandText = "select U_Num,U_name from MUSER where del_tag = '0' and U_Position='0005' " + sql_txt + " and Leavedate is null  order by ComID ";
        }
        else if (U_MDEP == "0002" || U_MDEP == "0006" || U_MDEP == "0015" || U_MDEP == "0015")
        {
            commandText = "select U_Num,U_name from MUSER where del_tag = '0' and U_Position='0005'  and (Comid='HG01' or comid='HG05')" + sql_txt + " and Leavedate is null  order by ComID ";
        }
        else if (U_MDEP == "0007" || U_MDEP == "0008" || U_MDEP == "0011" || U_MDEP == "0012" || U_MDEP == "0013" || U_MDEP == "0014")
        {
            commandText = "select U_Num,U_name from MUSER where del_tag = '0' and U_Position='0005'  and Comid='" + ComID + "'" + sql_txt + " and Leavedate is null  order by ComID ";
        }
        else
        {
            commandText = "select U_Num,U_name from MUSER where del_tag = '0' and U_Position='0005' " + sql_txt + " and Leavedate is null  order by ComID ";
        }

        List<TelStatisticsEntity> tseList = MUSERhgSql.Instance.getAnalyst(connectionStrings, commandText);//<==========

        log.endWrite("'tseList' : " + tseList.ToString(), className, methodName);
        return tseList;
    }

}
