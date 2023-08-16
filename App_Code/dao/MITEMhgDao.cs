using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.SessionState;

/// <summary>
/// MITEMhgDao 的摘要描述
/// </summary>
public class MITEMhgDao : System.Web.UI.Page
{

    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MITEMhgDao _instance = new MITEMhgDao();
    public static MITEMhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MITEMhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<ditcodedescEntity> getCustomerDetailAnalyst(string COMID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;

        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        string backString = string.Empty;
        string commandText = string.Empty;

        commandText = "SELECT [U_Num],[U_Name] FROM [HG].[dbo].[MUSER] where U_Position='0005' and LeaveDate is null and Comid='" + COMID;
        ddeList = MITEMhgSql.Instance.getditcodedescEntityList(connectionStrings, commandText);

        log.endWrite("'backString' : " + backString, className, methodName);
        return ddeList;
    }

    /// <summary>
    /// 取得入會種類
    /// </summary>
    /// <returns></returns>
    public List<ditcodedescEntity> getMemberTypeList(string TeacherUnum)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;

        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        string backString = string.Empty;
        string commandText = string.Empty;

        commandText = "SELECT [ditcode],[ddesc] FROM [HG].[dbo].[MITEM] where mitcode='"+ TeacherUnum + "' and ditcode <>'0000' and del_tag='0'order by rank";
        ddeList = MITEMhgSql.Instance.getditcodedescEntityList(connectionStrings, commandText);

        log.endWrite("'backString' : " + backString, className, methodName);
        return ddeList;

    }
    //取得付款方式
    public List<ditcodedescEntity> getPITEMList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;

        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        string backString = string.Empty;
        string commandText = string.Empty;

        commandText = "SELECT [ditcode],[ddesc] FROM [HG].[dbo].[MITEM] where mitcode='PITEM' and ditcode <>'0000'";
        ddeList = MITEMhgSql.Instance.getditcodedescEntityList(connectionStrings, commandText);

        log.endWrite("'backString' : " + backString, className, methodName);
        return ddeList;
    }

    public List<ditcodedescEntity> MP_ItemList(string u_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;

        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        string backString = string.Empty;
        string commandText = string.Empty;

        commandText = "SELECT  [ditcode],[ddesc]   FROM [HG].[dbo].[MITEM]  where mitcode ='"+ u_Num + "'";
        ddeList = MITEMhgSql.Instance.getditcodedescEntityList(connectionStrings, commandText);

        log.endWrite("'backString' : " + backString, className, methodName);
        return ddeList;
    }

    //取得電話區碼表(getTelZoneList)
    public List<ditcodedescEntity> getTelZoneList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;

        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        string backString = string.Empty;
        string commandText = string.Empty;

        commandText = "SELECT  [ditcode],[ddesc]   FROM [HG].[dbo].[MITEM]  where mitcode ='IZONE'";
        ddeList = MITEMhgSql.Instance.getditcodedescEntityList(connectionStrings, commandText);

        log.endWrite("'backString' : " + backString, className, methodName);
        return ddeList;
    }
    //取得聯絡單種類
    public List<ditcodedescEntity> getCF_ITemList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        ////log.startWrite("'adver_depart_id' : " + adver_depart_id, className, methodName);
        //// where T_ID='{0}'
        //string backString = string.Empty;
        //string commandText = "SELECT [Ba_id],[Ba_name] FROM [HG].[dbo].[MBANK] order by rank";// +
        //                                                                                                                                                           // and ditcode = '{0}'";
        //StringBuilder sbCommandText = new StringBuilder();
        ////sbCommandText.Append(string.Format(commandText, adver_depart_id));
        //sbCommandText.Append(string.Format(commandText));
        //backString = MITEMhgSql.Instance.getU_MDEP(connectionStrings, sbCommandText.ToString());

        //log.endWrite("'backString' : " + backString, className, methodName);
        //return backString;
        /////===
        ///string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        //log.startWrite("'adver_depart_id' : " + adver_depart_id, className, methodName);
        // where T_ID='{0}'
        string backString = string.Empty;
        string commandText = string.Empty;
        //if (county.Trim() != "")
        //{

        //    commandText = "SELECT PostalCode,County  FROM [HG].[dbo].[ZipCode] where city='" + county + "'";
        //    ddeList = MITEMhgSql.Instance.getditcodedescEntityList_GenNO(connectionStrings, commandText);
        //}
        //else
        //{
        commandText = "SELECT [ditcode],[ddesc]  FROM [HG].[dbo].[MITEM] where mitcode='MCOTF'";//取得[聯絡單種類]
        ddeList = MITEMhgSql.Instance.getditcodedescEntityList(connectionStrings, commandText);
        //}

        //sbCommandText.Append(string.Format(commandText, adver_depart_id));

        //ddeList = MITEMhgSql.Instance.getditcodedescEntityList_GenNO(connectionStrings, sbCommandText.ToString());

        log.endWrite("'backString' : " + backString, className, methodName);
        return ddeList;
    }

    //取得銀行列表(getBankListList)
    public List<ditcodedescEntity> getSelectBankList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        ////log.startWrite("'adver_depart_id' : " + adver_depart_id, className, methodName);
        //// where T_ID='{0}'
        //string backString = string.Empty;
        //string commandText = "SELECT [Ba_id],[Ba_name] FROM [HG].[dbo].[MBANK] order by rank";// +
        //                                                                                                                                                           // and ditcode = '{0}'";
        //StringBuilder sbCommandText = new StringBuilder();
        ////sbCommandText.Append(string.Format(commandText, adver_depart_id));
        //sbCommandText.Append(string.Format(commandText));
        //backString = MITEMhgSql.Instance.getU_MDEP(connectionStrings, sbCommandText.ToString());

        //log.endWrite("'backString' : " + backString, className, methodName);
        //return backString;
        /////===
        ///string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        //log.startWrite("'adver_depart_id' : " + adver_depart_id, className, methodName);
        // where T_ID='{0}'
        string backString = string.Empty;
        string commandText = string.Empty;
        //if (county.Trim() != "")
        //{

        //    commandText = "SELECT PostalCode,County  FROM [HG].[dbo].[ZipCode] where city='" + county + "'";
        //    ddeList = MITEMhgSql.Instance.getditcodedescEntityList_GenNO(connectionStrings, commandText);
        //}
        //else
        //{
        commandText = "SELECT [Ba_id],[Ba_name] FROM [HG].[dbo].[MBANK] order by rank";
        ddeList = MITEMhgSql.Instance.getditcodedescEntityList(connectionStrings, commandText);
        //}

        //sbCommandText.Append(string.Format(commandText, adver_depart_id));

        //ddeList = MITEMhgSql.Instance.getditcodedescEntityList_GenNO(connectionStrings, sbCommandText.ToString());

        log.endWrite("'backString' : " + backString, className, methodName);
        return ddeList;
        ///


    }
    //新增使用者自訂上下班時間
    //mitcode:MCLAS,ditcode:員工編號,ddesc:上/下班時間(S_07:01:00/E_18:01:00)
    public string addCustomUSERSETime(string StartTime,string EndTime, string select_Employ)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string paramFormat = "'M_ID' : {0}, 'DM_MC' : {1}, 'DM_MC_Name' : {2}, 'DM_MC_Com' : {3}, 'DM_Tag' : {4}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(StartTime, EndTime, select_Employ));
        log.startWrite(sb.ToString(), className, methodName);
        string backString = string.Empty;
        //string commandText = "INSERT INTO DMBER (M_ID, DM_MC,DM_MC_Name,DM_MC_Com,DM_MarkTime,DM_Tag)VALUES ('{0}','{1}','{2}','{3}', GETDATE(),'{4}')";
        //INSERT INTO [dbo].[MITEM] ([mitcode],[ditcode],[ddesc])VALUES　('MCLAS','B1103011','S_07:01:00')
        string commandText = "INSERT INTO [dbo].[MITEM] ([mitcode],[ditcode],[ddesc]) VALUES ('{0}','{1}','{2}')";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, "MCLAS", select_Employ, StartTime));
        noSelectSql.Instance.doLongTag(connectionStrings, sbCommandText.ToString());//<==========
        sbCommandText.Append(string.Format(commandText, "MCLAS", select_Employ, EndTime));
        noSelectSql.Instance.doLongTag(connectionStrings, sbCommandText.ToString());//<==========
        log.endWrite(common.nothing, className, methodName);
        return "";
    }

    public List<ditcodedescEntity> getSelectBankList(string BankKeyWord)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        ////log.startWrite("'adver_depart_id' : " + adver_depart_id, className, methodName);
        //// where T_ID='{0}'
        //string backString = string.Empty;
        //string commandText = "SELECT [Ba_id],[Ba_name] FROM [HG].[dbo].[MBANK] order by rank";// +
        //                                                                                                                                                           // and ditcode = '{0}'";
        //StringBuilder sbCommandText = new StringBuilder();
        ////sbCommandText.Append(string.Format(commandText, adver_depart_id));
        //sbCommandText.Append(string.Format(commandText));
        //backString = MITEMhgSql.Instance.getU_MDEP(connectionStrings, sbCommandText.ToString());

        //log.endWrite("'backString' : " + backString, className, methodName);
        //return backString;
        /////===
        ///string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        //log.startWrite("'adver_depart_id' : " + adver_depart_id, className, methodName);
        // where T_ID='{0}'
        string backString = string.Empty;
        string commandText = string.Empty;
        //if (county.Trim() != "")
        //{

        //    commandText = "SELECT PostalCode,County  FROM [HG].[dbo].[ZipCode] where city='" + county + "'";
        //    ddeList = MITEMhgSql.Instance.getditcodedescEntityList_GenNO(connectionStrings, commandText);
        //}
        //else
        //{
        commandText = "SELECT [Ba_id],[Ba_name] FROM [HG].[dbo].[MBANK] where Ba_name like '%"+ BankKeyWord + "%' order by rank";
        ddeList = MITEMhgSql.Instance.getditcodedescEntityList(connectionStrings, commandText);
        //}

        //sbCommandText.Append(string.Format(commandText, adver_depart_id));

        //ddeList = MITEMhgSql.Instance.getditcodedescEntityList_GenNO(connectionStrings, sbCommandText.ToString());

        log.endWrite("'backString' : " + backString, className, methodName);
        return ddeList;
        ///


    }

    //由發布單位代號求得發布單位名稱
    public string getadver_depart_nameByID(string adver_depart_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'adver_depart_id' : " + adver_depart_id, className, methodName);
        // where T_ID='{0}'
        string backString = string.Empty;
        string commandText = "SELECT ddesc FROM [HG].[dbo].[MITEM] where mitcode = 'DEPAR' and ditcode <> '0000' and del_tag = '0' and ditcode='{0}'order by rank";// +
                                                                                                                                                                   // and ditcode = '{0}'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, adver_depart_id));

        backString = MITEMhgSql.Instance.getU_MDEP(connectionStrings, sbCommandText.ToString());

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }
    //取得職稱列表getSelectPositList(UITEM)
    public List<ditcodedescEntity> getSelectPositList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        //log.startWrite("'adver_depart_id' : " + adver_depart_id, className, methodName);
        // where T_ID='{0}'
        string backString = string.Empty;
        string commandText = string.Empty;
        //if (county.Trim() != "")
        //{

        //    commandText = "SELECT PostalCode,County  FROM [HG].[dbo].[ZipCode] where city='" + county + "'";
        //    ddeList = MITEMhgSql.Instance.getditcodedescEntityList_GenNO(connectionStrings, commandText);
        //}
        //else
        //{
        commandText = "SELECT [ditcode],[ddesc] FROM [HG].[dbo].[MITEM] where mitcode='UITEM'";
        ddeList = MITEMhgSql.Instance.getditcodedescEntityList(connectionStrings, commandText);
        //}

        //sbCommandText.Append(string.Format(commandText, adver_depart_id));

        //ddeList = MITEMhgSql.Instance.getditcodedescEntityList_GenNO(connectionStrings, sbCommandText.ToString());

        log.endWrite("'backString' : " + backString, className, methodName);
        return ddeList;
    }
    //取得鄉鎮區市(已知城市)
    public List<ditcodedescEntity> getSelectTownShipList(string CitySort)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        //log.startWrite("'adver_depart_id' : " + adver_depart_id, className, methodName);
        // where T_ID='{0}'
        string backString = string.Empty;
        string commandText = string.Empty;
        //if (county.Trim() != "")
        //{

        //    commandText = "SELECT PostalCode,County  FROM [HG].[dbo].[ZipCode] where city='" + county + "'";
        //    ddeList = MITEMhgSql.Instance.getditcodedescEntityList_GenNO(connectionStrings, commandText);
        //}
        //else
        //{
        if (CitySort != "undefined")
        {
            commandText = "SELECT PostalCode,County  FROM [HG].[dbo].[ZipCode] where CitySort='" + CitySort + "'";
        }
        else
        {
            commandText = "SELECT PostalCode,County  FROM [HG].[dbo].[ZipCode]";
        }
        ddeList = MITEMhgSql.Instance.getditcodedescEntityList_GenNO(connectionStrings, commandText);
        //}

        //sbCommandText.Append(string.Format(commandText, adver_depart_id));

        //ddeList = MITEMhgSql.Instance.getditcodedescEntityList_GenNO(connectionStrings, sbCommandText.ToString());

        log.endWrite("'backString' : " + backString, className, methodName);
        return ddeList;
    }
    //取得鄉鎮區市
    public List<ditcodedescEntity> getSelectTownShipList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        //log.startWrite("'adver_depart_id' : " + adver_depart_id, className, methodName);
        // where T_ID='{0}'
        string backString = string.Empty;
        string commandText = string.Empty;
        //if (county.Trim() != "")
        //{
            
        //    commandText = "SELECT PostalCode,County  FROM [HG].[dbo].[ZipCode] where city='" + county + "'";
        //    ddeList = MITEMhgSql.Instance.getditcodedescEntityList_GenNO(connectionStrings, commandText);
        //}
        //else
        //{
            commandText = "SELECT PostalCode,County  FROM [HG].[dbo].[ZipCode]";
            ddeList = MITEMhgSql.Instance.getditcodedescEntityList_GenNO(connectionStrings, commandText);
        //}
        
        //sbCommandText.Append(string.Format(commandText, adver_depart_id));

        //ddeList = MITEMhgSql.Instance.getditcodedescEntityList_GenNO(connectionStrings, sbCommandText.ToString());

        log.endWrite("'backString' : " + backString, className, methodName);
        return ddeList;
    }

    public List<ditcodedescEntity> getAnalystMITEM(string mitcode)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        //log.startWrite("'adver_depart_id' : " + adver_depart_id, className, methodName);
        // where T_ID='{0}'
        string backString = string.Empty;
        string commandText = string.Empty;
        //if (county.Trim() != "")
        //{

        //    commandText = "SELECT PostalCode,County  FROM [HG].[dbo].[ZipCode] where city='" + county + "'";
        //    ddeList = MITEMhgSql.Instance.getditcodedescEntityList_GenNO(connectionStrings, commandText);
        //}
        //else
        //{
        commandText = "select ditcode,ddesc from MITEM where mitcode ='"+ mitcode+"' and ditcode<>0";
        ddeList = MITEMhgSql.Instance.getditcodedescEntityList(connectionStrings, commandText);
        //}

        //sbCommandText.Append(string.Format(commandText, adver_depart_id));

        //ddeList = MITEMhgSql.Instance.getditcodedescEntityList_GenNO(connectionStrings, sbCommandText.ToString());

        log.endWrite("'backString' : " + backString, className, methodName);
        return ddeList;
    }

    //取得縣市
    //getSelectCountyList
    public List<ditcodedescEntity> getSelectCountyList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        //log.startWrite("'adver_depart_id' : " + adver_depart_id, className, methodName);
        // where T_ID='{0}'
        string backString = string.Empty;
        string commandText = "SELECT distinct CitySort,City  FROM [HG].[dbo].[ZipCode]";//取得不同城市

        StringBuilder sbCommandText = new StringBuilder();
        //sbCommandText.Append(string.Format(commandText, adver_depart_id));

        //backString = MITEMhgSql.Instance.getU_MDEP(connectionStrings, sbCommandText.ToString());
        ddeList = MITEMhgSql.Instance.geSelectCountyList(connectionStrings, commandText);//<======
        log.endWrite("'backString' : " + backString, className, methodName);
        return ddeList;
    }
    //取得等級
    public List<ditcodedescEntity> getSelectLevelList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        //log.startWrite("'adver_depart_id' : " + adver_depart_id, className, methodName);
        // where T_ID='{0}'
        string backString = string.Empty;
        string commandText = "SELECT  [ditcode],[ddesc] FROM [HG].[dbo].[MITEM] where mitcode='POSIT'";// +
                                                                                                                 // and ditcode = '{0}'";
        StringBuilder sbCommandText = new StringBuilder();
        //sbCommandText.Append(string.Format(commandText, adver_depart_id));

        //backString = MITEMhgSql.Instance.getU_MDEP(connectionStrings, sbCommandText.ToString());
        ddeList = MITEMhgSql.Instance.getditcodedescEntityList(connectionStrings, commandText);//<======
        log.endWrite("'backString' : " + backString, className, methodName);
        return ddeList;
    }
    /// <summary>
    /// 取得等級
    /// </summary>
    ///// <returns></returns>
    //public List<ditcodedescEntity> getSelectPositList()
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
    //    //log.startWrite("'adver_depart_id' : " + adver_depart_id, className, methodName);
    //    // where T_ID='{0}'
    //    string backString = string.Empty;
    //    string commandText = "SELECT  [mitcode],[ditcode],[ddesc] FROM [HG].[dbo].[MITEM] where mitcode='POSIT'";// +
    //                                                                                                                                                               // and ditcode = '{0}'";
    //    StringBuilder sbCommandText = new StringBuilder();
    //    //sbCommandText.Append(string.Format(commandText, adver_depart_id));

    //    //backString = MITEMhgSql.Instance.getU_MDEP(connectionStrings, sbCommandText.ToString());
    //    ddeList = MITEMhgSql.Instance.getditcodedescEntityList(connectionStrings, commandText);//<======
    //    log.endWrite("'backString' : " + backString, className, methodName);
    //    return ddeList;
    //}

    public List<CustomUSERSETimeEntity> getCustomUSERSETimeDataList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        List<CustomUSERSETimeEntity> RETimeList = new List<CustomUSERSETimeEntity>();
        //log.startWrite("'adver_depart_id' : " + adver_depart_id, className, methodName);
        // where T_ID='{0}'
        string backString = string.Empty;
        string commandText = "SELECT distinct [ditcode],b.U_Name,[mitcode],[ddesc] FROM [HG].[dbo].[MITEM] a left join MUSER b on a.ditcode=b.U_Num where mitcode='MCLAS' ";// +
                                                                                                                 // and ditcode = '{0}'";
        StringBuilder sbCommandText = new StringBuilder();
        //sbCommandText.Append(string.Format(commandText, adver_depart_id));

        //backString = MITEMhgSql.Instance.getU_MDEP(connectionStrings, sbCommandText.ToString());
        RETimeList = MITEMhgSql.Instance.getCustomUSERSETimeDataList(connectionStrings, commandText);//<======
        log.endWrite("'backString' : " + backString, className, methodName);
        return RETimeList;
    }

    public List<ditcodedescEntity> getCountyList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        //log.startWrite("'adver_depart_id' : " + adver_depart_id, className, methodName);
        // where T_ID='{0}'
        string backString = string.Empty;
        string commandText = "SELECT  [mitcode],[ditcode],[ddesc] FROM [HG].[dbo].[MITEM] where mitcode='POSIT'";// +
                                                                                                                 // and ditcode = '{0}'";
        StringBuilder sbCommandText = new StringBuilder();
        //sbCommandText.Append(string.Format(commandText, adver_depart_id));

        //backString = MITEMhgSql.Instance.getU_MDEP(connectionStrings, sbCommandText.ToString());
        ddeList = MITEMhgSql.Instance.getditcodedescEntityList(connectionStrings, commandText);//<======
        log.endWrite("'backString' : " + backString, className, methodName);
        return ddeList;
    }

    public List<ditcodedescEntity> getditcodedescEntityList(string type)
    {
        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        string commandText = string.Empty;
        if (type == "all")
        {
            commandText = "select mitcode,ditcode,ddesc from MITEM";
            ddeList = MITEMhgSql.Instance.getditcodedescEntityList(connectionStrings, commandText);//<======
        }
        else if (type == "MPGOM")
        {
            commandText = "select mitcode,ditcode,ddesc from MITEM where mitcode = '" + type + "' and ditcode <> '0000' and  view_tag='0' and del_tag = '0' order by rank";
            ddeList = MITEMhgSql.Instance.getditcodedescEntityList(connectionStrings, commandText);//<======
        }
        else if (type == "DEPA3")
        {
            commandText = "select mitcode,ditcode,ddesc from MITEM where mitcode = '" + type + "' and ditcode <> '0000' and  view_tag='0' and del_tag = '0' order by rank";
            ddeList = MITEMhgSql.Instance.getditcodedescEntityList(connectionStrings, commandText);//<======
        }
        else if (type == "DEPAR2")
        {
            commandText = "";
            //commandText = "select mitcode,ditcode,ddesc from MITEM where mitcode = '" + type + "' and ditcode <> '0000' and  view_tag='0' and del_tag = '0' order by rank";
            ddeList = MITEMhgSql.Instance.getditcodedescEntityList(connectionStrings, commandText);//<======

        }
        else//type=":EXCUE//假別
        {
            commandText = "select mitcode,ditcode,ddesc from MITEM where mitcode = '" + type + "' and ditcode <> '0000' and del_tag = '0' order by rank";
            ddeList = MITEMhgSql.Instance.getditcodedescEntityList(connectionStrings, commandText);//<======

        }

        //List<ditcodedescEntity> ddeList = MITEMhgSql.Instance.getditcodedescEntityList(connectionStrings, commandText);//<======
        //加入判斷

        log.endWrite(ddeList.ToString(), className, methodName);
        return ddeList;
    }



    //取得鄉鎮市區
    public List<ditcodedescEntity> getTownShipOptionList()
    {
        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        string commandText = string.Empty;
        commandText = "select [ditcode],[ddesc] from MITEM";
        ddeList = MITEMhgSql.Instance.getditcodedescEntityList(connectionStrings, commandText);//<======
        return ddeList;
    }
    //取得縣市
    public List<ditcodedescEntity> getCountyOptionList()
    {
        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        string commandText = string.Empty; commandText = "SELECT distinct [City],CitySort FROM [HG].[dbo].[ZipCode]";
        ddeList = MITEMhgSql.Instance.getditcodedescEntityList(connectionStrings, commandText);//<======
        return ddeList;
    }

    
    //取得投資金額列表
    public List<InvestMoney> getInvestMoneyList()
    {
        List<InvestMoney> ddeList = new List<InvestMoney>();
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string commandText = string.Empty;
        commandText = "select ditcode,ddesc from MITEM where mitcode = 'INVMY' and ditcode <> '0000' and del_tag = '0' order by rank";
        ddeList = MITEMhgSql.Instance.getInvestMoneyList(connectionStrings, commandText);//<======
        log.endWrite(ddeList.ToString(), className, methodName);
        return ddeList;
    }
    ////取得投資金額列表
    //internal List<InvestMoney> getInvestMoneyList(string menu_no, string u_Num)
    //{
    //    List<InvestMoney> ddeList = new List<InvestMoney>();
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    string commandText = string.Empty;
    //    commandText = "select ditcode,ddesc from MITEM where mitcode = 'INVMY' and ditcode <> '0000' and del_tag = '0' order by rank";
    //    ddeList= MITEMhgSql.Instance.getInvestMoneyList(connectionStrings, commandText);//<======
    //    log.endWrite(ddeList.ToString(), className, methodName);
    //    return ddeList;
    //}

    public List<ditcodedescEntity> getditcodedescEntityList(string type, string ComID, string U_Num)
    {
        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        //List<TradingStatus> tradingStatusList = new List<TradingStatus>();//MITEMhgSql.getTradingStatusListFucList();
        //U_Num = Session["U_Num"].ToString();
        //ComID = Session["ComID"].ToString();
        if (type == "getZitemListFuc")//取得資源帳號下拉式選單選項
        {
            //commandText = ".getZitemListFuc";

            ditcodedescEntity dde = new ditcodedescEntity();
            //string U_num;
            //string ComID;
            //U_num = Session["U_num"].ToString();//引用using System.Web.SessionState;
            if (U_Num == "B9601151")
            {
                dde.mitcode = "Z0000002";
                dde.ditcode = "Z0000002";
                dde.ddesc = "營1資源A(黃";
                ddeList.Add(dde);
                dde.mitcode = "Z0000002";
                dde.ditcode = "Z0000002";
                dde.ddesc = "營1資源B(紅)";
                ddeList.Add(dde);
                dde.mitcode = "Z0000002";
                dde.ditcode = "Z0000002";
                dde.ddesc = "營2資源A(黃)";
                ddeList.Add(dde);
                dde.mitcode = "Z0000002";
                dde.ditcode = "Z0000002";
                dde.ddesc = "營2資源A(紅)";
                ddeList.Add(dde);
                dde.mitcode = "Z0000002";
                dde.ditcode = "Z0000002";
                dde.ddesc = "推廣資源A(黃)";
                ddeList.Add(dde);
                dde.mitcode = "Z0000002";
                dde.ditcode = "Z0000002";
                dde.ddesc = "推廣資源B(紅)";
                ddeList.Add(dde);
                dde.mitcode = "Z0000002";
                dde.ditcode = "Z0000002";
                dde.ddesc = "資源A(黃)";
                ddeList.Add(dde);
                dde.mitcode = "Z0000002";
                dde.ditcode = "Z0000002";
                dde.ddesc = "資源B(紅)";
                ddeList.Add(dde);
                dde.mitcode = "Z0000002";
                dde.ditcode = "Z0000002";
                dde.ddesc = "財1資源A(黃)";
                ddeList.Add(dde);
                dde.mitcode = "Z0000002";
                dde.ditcode = "Z0000002";
                dde.ddesc = "財1資源B(紅)";
                ddeList.Add(dde);
            }
            else if (ComID == "HG01")
            {
                dde.mitcode = "Z0000002";
                dde.ditcode = "Z0000002";
                dde.ddesc = "營1資源A(黃";
                ddeList.Add(dde);
                dde.mitcode = "Z0000003";
                dde.ditcode = "Z0000003";
                dde.ddesc = "營1資源B(紅)";
                ddeList.Add(dde);
            }
            else if (ComID == "HG05")
            {
                dde.mitcode = "Z0010001";
                dde.ditcode = "Z0010001";
                dde.ddesc = "營2資源A(黃)";
                ddeList.Add(dde);
                dde.mitcode = "Z0010002";
                dde.ditcode = "Z0010002";
                dde.ddesc = "營2資源A(紅)";
                ddeList.Add(dde);
            }
            else if (ComID == "HG02")
            {
                dde.mitcode = "Z0000010";
                dde.ditcode = "Z0000010";
                dde.ddesc = "營1資源A(黃";
                ddeList.Add(dde);
                dde.mitcode = "Z0000011";
                dde.ditcode = "Z0000011";
                dde.ddesc = "營1資源B(紅)";
                ddeList.Add(dde);
            }
            else if (ComID == "HG03")
            {
                dde.mitcode = "Z0300001";
                dde.ditcode = "Z0300001";
                dde.ddesc = "財1資源A(黃)";
                ddeList.Add(dde);
                dde.mitcode = "Z0300002";
                dde.ditcode = "Z0300002";
                dde.ddesc = "財1資源B(紅)";
                ddeList.Add(dde);

            }
            else if (ComID == "HG07")
            {
                dde.mitcode = "Z7000001";
                dde.ditcode = "Z7000001";
                dde.ddesc = "財1資源A(黃)";
                ddeList.Add(dde);
                dde.mitcode = "Z7000002";
                dde.ditcode = "Z7000002";
                dde.ddesc = "財1資源B(紅)";
                ddeList.Add(dde);
            };
        }
        else if (type == "TradingStatusList")
        {
            TradingStatus tradingStatus = new TradingStatus();
            tradingStatus.Status = "不限";
            tradingStatus.Value = "";

        }
        return ddeList;
    }
    //getZitemList
    //取得資源帳號
    public List<Z_ItemEntity> getZitemList(string ComID, string U_Num)
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
        //List<indexBDdataEntity> eList = MUSERhgSql.Instance.getAnalystList(connectionStrings, sbCommandText.ToString());//<=====================
        List<Z_ItemEntity> ddeList = MITEMhgSql.Instance.getZitemListFucList(ComID, U_Num);
        log.endWrite(ddeList.ToString(), className, methodName);
        return ddeList;
    }

    //tradingStatusList
    //List<TradingStatus> tradingStatusList = new List<TradingStatus>();//MITEMhgSql.getTradingStatusListFucList();
    public List<TradingStatus> getTradingStatusList()
    {

        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'type':" + type, className, methodName);

       // string commandText = "select mitcode,ditcode,ddesc from MITEM where mitcode = '" + type + "' and ditcode <> '0000' and  view_tag='0' and del_tag = '0' order by rank";

        List<TradingStatus> ddeList = MITEMhgSql.Instance.getTradingStatusListFucList();

        log.endWrite(ddeList.ToString(), className, methodName);
        return ddeList;
    }


    public List<ditcodedescEntity> getditcodedescEntityListByViewtag0(string type)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'type':" + type, className, methodName);

        string commandText = "select mitcode,ditcode,ddesc from MITEM where mitcode = '" + type + "' and ditcode <> '0000' and  view_tag='0' and del_tag = '0' order by rank";

        List<ditcodedescEntity> ddeList = MITEMhgSql.Instance.getditcodedescEntityList(connectionStrings, commandText);//<======

        log.endWrite(ddeList.ToString(), className, methodName);
        return ddeList;
    }



    public string getU_MDEP(string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_MDEP' : " + U_MDEP, className, methodName);

        string backString = string.Empty;
        string commandText = "SELECT ddesc FROM[HG].[dbo].[MITEM] where mitcode = 'DEPAR' and ditcode = '{0}'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, U_MDEP));

        backString = MITEMhgSql.Instance.getU_MDEP(connectionStrings, sbCommandText.ToString());

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    public List<ditcodedescEntity> getDepList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        string commandText = "select ditcode,ddesc from MITEM where mitcode = 'DEPAR' and (ditcode ='0002' or ditcode ='0006' or ditcode ='0007' or ditcode ='0008') and del_tag = '0' order by rank";
        List<ditcodedescEntity> ddeList = MITEMhgSql.Instance.getDepList(connectionStrings, commandText);

        log.endWrite("'ddeList' : " + ddeList.ToString(), className, methodName);
        return ddeList;
    }

    public List<ditcodedescEntity> getDepListForCaseDistribute()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        string commandText = "select ditcode,ddesc from MITEM where mitcode = 'DEPAR' and (ditcode ='0002' or ditcode ='0006' or ditcode ='0007' or ditcode ='0008' or ditcode ='0011' or ditcode ='0012') and del_tag = '0' order by rank";
        List<ditcodedescEntity> ddeList = MITEMhgSql.Instance.getDepList(connectionStrings, commandText);

        log.endWrite("'ddeList' : " + ddeList.ToString(), className, methodName);
        return ddeList;
    }

    public List<ditcodedescEntity> getDepListForCompanyResourceTag()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        string commandText = "select ditcode,ddesc from MITEM where mitcode = 'DEPAR' and (ditcode <>'0001' and ditcode <>'0003' and ditcode <>'0004'  and ditcode <>'0005' and ditcode <>'0009' and ditcode <>'0010' and ditcode <>'0000') and del_tag = '0' order by rank";
        List<ditcodedescEntity> ddeList = MITEMhgSql.Instance.getDepList(connectionStrings, commandText);

        log.endWrite("'ddeList' : " + ddeList.ToString(), className, methodName);
        return ddeList;
    }

    //取得所屬公司列表
    //getComOptionList
    public List<ditcodedescEntity> getComOptionList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        string commandText = "SELECT ditcode,ddesc FROM [HG].[dbo].[MITEM] where mitcode='COMID' and ditcode <>'0000' order by rank";
        List<ditcodedescEntity> ddeList = MITEMhgSql.Instance.getDepList(connectionStrings, commandText);

        log.endWrite("'ddeList' : " + ddeList.ToString(), className, methodName);
        return ddeList;
    }
    //取得所屬部門列表
    //getSelectDeptList
    public List<ditcodedescEntity> getSelectDeptList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        string commandText = "SELECT ditcode,ddesc FROM [HG].[dbo].[MITEM] where mitcode='DEPAR' and ditcode <>'0000' order by rank";
        List<ditcodedescEntity> ddeList = MITEMhgSql.Instance.getDepList(connectionStrings, commandText);

        log.endWrite("'ddeList' : " + ddeList.ToString(), className, methodName);
        return ddeList;
    }
    ////取得所屬公司列表
    //getSelectComList
    public List<ditcodedescEntity> getSelectComList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        string commandText = "SELECT ditcode,ddesc FROM [HG].[dbo].[MITEM] where mitcode='COMID' and ditcode <>'0000' order by rank";
        List<ditcodedescEntity> ddeList = MITEMhgSql.Instance.getDepList(connectionStrings, commandText);

        log.endWrite("'ddeList' : " + ddeList.ToString(), className, methodName);
        return ddeList;
    }
}