using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MMSGEhgDao 的摘要描述
/// </summary>
public class MMSGEhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MMSGEhgDao _instance = new MMSGEhgDao();
    public static MMSGEhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MMSGEhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<callMassageEntity> getCallMassage(string U_Num, string U_MDEP, string U_POSITION, string Comid, string group)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'U_MDEP' : {0}, 'U_POSITION' : {1}, 'Comid' : {2}, 'U_Num' : {3}, 'group' : {4}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, U_MDEP, U_POSITION, Comid, U_Num, group));
        log.startWrite(sb.ToString(), className, methodName);
        //==================================================================================================================

        //string sqlTxt = getSqlTxt.PerformanceRankingST(group, U_MDEP);
        string sqlTxt = string.Empty;
        string commandText = getCommandText.CallMassageCT(U_Num, U_MDEP, U_POSITION, Comid, sqlTxt);
        List<callMassageEntity> nbeList = MMSGEhgSql.Instance.getCallMassage(connectionStrings, commandText);//
        log.endWrite(nbeList.ToString(), className, methodName);
        return nbeList;
    }
 

    public List<callMassageEntity> getMessageList(getMessageListParam gmlp)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MP' :" + gmlp.MP + "'MP_Item' :" + gmlp.MP_Item + "'StartDate' :" + gmlp.StartDate + "'EndDate' :" + gmlp.EndDate + "'keyWord' :" + gmlp.keyWord + "'U_MDEP':" + gmlp.U_MDEP + "'U_POSITION':" + gmlp.U_POSITION + "'ComID':" + gmlp.ComID + "'U_Leader':" + gmlp.U_Leader + "'U_Num':" + gmlp.U_Num, className, methodName);
        string commandText = string.Empty;
        string sqlTxt = getSqlTxt.getMessageListST(gmlp);
        if (gmlp.U_MDEP == "0002" || gmlp.U_MDEP == "0006" || gmlp.U_MDEP == "0015" || gmlp.U_MDEP == "0016")
        {
            commandText = "select msg_id,MP,MP_Item,MS_Tel,MS_TStatus,msg_text,add_user,add_Date from MMSGE where del_tag = '0' " + sqlTxt + " and (mp_com='HG01' OR mp_com='HG05') order by add_date desc";
        }
        else if (gmlp.U_MDEP == "0007" || gmlp.U_MDEP == "0008" || gmlp.U_MDEP == "0011" || gmlp.U_MDEP == "0012" || gmlp.U_MDEP == "0013" || gmlp.U_MDEP == "0014" || gmlp.U_MDEP == "0017")
        {
            commandText = "select msg_id,MP,MP_Item,MS_Tel,MS_TStatus,msg_text,add_user,add_Date from MMSGE where del_tag = '0' " + sqlTxt + " and mp_com='" + gmlp.ComID + "' order by add_date desc";
        }
        else if (gmlp.U_POSITION == "0006")
        {
            commandText = "select msg_id,MP,MP_Item,MS_Tel,MS_TStatus,msg_text,add_user,add_Date from MMSGE where del_tag = '0' and mp='" + gmlp.U_Leader + "' " + sqlTxt + " order by add_date desc";
        }
        else if (gmlp.U_POSITION == "0005")
        {
            commandText = "select msg_id,MP,MP_Item,MS_Tel,MS_TStatus,msg_text,add_user,add_Date from MMSGE where del_tag = '0' and mp='" + gmlp.U_Num + "' " + sqlTxt + " order by add_date desc";
        }
        else
        {
            commandText = "select msg_id,MP,MP_Item,MS_Tel,MS_TStatus,msg_text,add_user,add_Date from MMSGE where del_tag = '0' " + sqlTxt + " order by add_date desc";
        }
        List<callMassageEntity> cmeList = MMSGEhgSql.Instance.getMessageList(connectionStrings, commandText);//<====

        log.endWrite("'cmeList' :" + cmeList.ToString(), className, methodName);
        return cmeList;
    }

    public List<callMassageEntity> getCallMessageDealData(string searchDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'searchDate' :" + searchDate, className, methodName);
        string commandText = "select msg_id,MP,MP_Item,MS_Tel,MS_TStatus,msg_text,add_user,add_Date from MMSGE where del_tag = '0'  and add_date>='" + searchDate + " 00:00:00' and add_date<='" + searchDate + " 23:59:59' order by add_date desc";
        

        List<callMassageEntity> cmeList = MMSGEhgSql.Instance.getMessageList(connectionStrings, commandText);//<====

        log.endWrite("'cmeList' :" + cmeList.ToString(), className, methodName);
        return cmeList;
    }


    public string addMessageData(allPowerSendRecordEntity apsre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'apsre' :" + apsre.ToString(), className, methodName);

        string commandText = "insert into MMSGE([MP],[MP_Com],[MP_Item],[msg_text],[add_user],[add_ip],[add_Date])values('{0}','{1}','{2}','{3}','{4}','{5}',GETDATE())";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(commandText,apsre.M_MP,apsre.M_MPcom,apsre.M_MITem,apsre.M_Text,apsre.add_user,apsre.add_ip));
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sb.ToString());

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
    public string editMessageData(string msg_id, string msg_text, string MS_TStatus)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'msg_id' :" + msg_id + "'msg_text' :" + msg_text + "'MS_TStatus' :" + MS_TStatus, className, methodName);

        string commandText = "UPDATE MMSGE SET msg_text='"+ msg_text + "', MS_TStatus='"+ MS_TStatus + "' WHERE msg_id='"+ msg_id + "'";
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public string deleteMessageData(string msg_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'msg_id' :" + msg_id, className, methodName);

        string commandText = "UPDATE MMSGE SET del_tag='1' WHERE msg_id='" + msg_id + "'";
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;

    }

    public List<callMassageEntity> getAnalystMessage(string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MP' :" + MP, className, methodName);
        DateTime DTnow = DateTime.Now;
        string y = DTnow.Year.ToString();
        string m = DTnow.Month.ToString();
        string d = DTnow.Day.ToString();
        string searchDate = y + "-" + m + "-" + d;
        string commandText = "select msg_id,MP,MP_Item,MS_Tel,MS_TStatus,msg_text,add_user,add_Date from MMSGE where del_tag = '0' and MP='"+ MP + "'and add_date>='" + searchDate + " 00:00:00' and add_date<='" + searchDate + " 23:59:59' order by add_date desc";
        List<callMassageEntity> cmeList = MMSGEhgSql.Instance.getMessageList(connectionStrings, commandText);//<====

        log.endWrite("'cmeList' :" + cmeList.ToString(), className, methodName);
        return cmeList;
    }

    public List<callMassageEntity> getMitemCount(string MP, string MP_Item)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MP' :" + MP + "'MP_Item' :" + MP_Item, className, methodName);
        DateTime DTnow = DateTime.Now;
        string y = DTnow.Year.ToString();
        string m = DTnow.Month.ToString();
        string d = DTnow.Day.ToString();
        string searchDate = y + "-" + m + "-" + d;
        string commandText = "select MP,MP_Item from MMSGE where MP='" + MP + "' and add_Date >='"+ searchDate + "' and MP_Item='" + MP_Item + "'  and del_tag = '0'";
         List<callMassageEntity>cmeList = MMSGEhgSql.Instance.getMitemCount(connectionStrings, commandText);//<====

        log.endWrite("'cmeList' :" + cmeList.ToString(), className, methodName);
        return cmeList;
    }
}