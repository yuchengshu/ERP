using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// DTRAThgDao 的摘要描述
/// </summary>
public class DTRAThgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static DTRAThgDao _instance = new DTRAThgDao();
    public static DTRAThgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public DTRAThgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<OINVO_query_01Entity> getOINVO_query_01DataList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("T_ID :" + T_ID, className, methodName);

        //string commandText = "select DT_ID,Pay_tag,Account_Date,MC,MC_Name,Account_Money,Pay_Type,T_ID,T_Com from DTRAT where del_tag='0' AND T_id='{0}' order by Add_date desc";
        string commandText = "SELECT TOP 20 T_ID,inv_createdate,*,MT_COM FROM NEW_VINVO where inv_createdate is not null and del_tag='0' and fs_tag='0'and mt_com='TK' ";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, ""));
        List<OINVO_query_01Entity> cdeList = DTRAThgSql.Instance.getOINVODataList(connectionStrings, sbCommandText.ToString());//<======

        log.endWrite(cdeList.ToString(), className, methodName);
        return cdeList;
    }
    //瑞兔
    public List<OINVO_query_02Entity> getOINVO_query_02DataList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("T_ID :" + T_ID, className, methodName);

        //string commandText = "select DT_ID,Pay_tag,Account_Date,MC,MC_Name,Account_Money,Pay_Type,T_ID,T_Com from DTRAT where del_tag='0' AND T_id='{0}' order by Add_date desc";
        string commandText = "SELECT TOP 20 T_ID,inv_createdate,*,MT_COM FROM NEW_VINVO where inv_createdate is not null and del_tag='0' and fs_tag='0'and mt_com='HG' ";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, ""));
        List<OINVO_query_02Entity> cdeList = DTRAThgSql.Instance.getOINVOData02List(connectionStrings, sbCommandText.ToString());//<======

        log.endWrite(cdeList.ToString(), className, methodName);
        return cdeList;
    }

    public List<chargeDetailEntity> getChargeDetailList(string T_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("T_ID :" + T_ID, className, methodName);

        string commandText = "select DT_ID,Pay_tag,Account_Date,MC,MC_Name,Account_Money,Pay_Type,T_ID,T_Com from DTRAT where del_tag='0' AND T_id='{0}' order by Add_date desc";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, T_ID));
        List<chargeDetailEntity> cdeList = DTRAThgSql.Instance.getChargeDetailList(connectionStrings, sbCommandText.ToString());//<======

        log.endWrite(cdeList.ToString(), className, methodName);
        return cdeList;
    }

    public List<chargeDetailEntity> getAllChargeDetail(string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("StartDate :" + StartDate + "EndDate:" + EndDate, className, methodName);

        string sqlTxt = getSqlTxt.getAllChargeDetailST(StartDate, EndDate);
        string commandText = "select DT_ID,Pay_tag,Account_Date,MC,MC_Name,Account_Money,Pay_Type,T_ID from DTRAT where del_tag='0' " + sqlTxt + " order by Add_date desc";
        List<chargeDetailEntity> cdeList = DTRAThgSql.Instance.getChargeDetailList(connectionStrings, commandText);//<======

        log.endWrite(cdeList.ToString(), className, methodName);
        return cdeList;
    }


    /// <summary>
    /// 新增交易明細
    /// </summary>
    /// <param name="cde"></param>
    /// <returns></returns>
    public string sendDTRAT(chargeDetailEntity cde)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(cde.ToString(), className, methodName);
        string commandText = string.Empty;
        StringBuilder sbCommandText = new StringBuilder();
        if (common.isEmpty(cde.DT_ID))
        {
            commandText = "INSERT INTO [HG].[dbo].[DTRAT] ([T_ID],[Pay_tag],[Account_Date],[MC],[MC_Name],[MC_Com],[Account_Money],[Pay_Type],[add_user],[add_date],[add_ip],[edit_date],[T_Com])VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}',GETDATE(),'{9}',GETDATE(),'{10}')";
            sbCommandText = new StringBuilder();
            sbCommandText.Append(string.Format(commandText, cde.T_ID, cde.Pay_tag, cde.Account_Date, cde.MC, cde.MC_Name, cde.MC_Com, cde.Account_Money, cde.Pay_Type, cde.add_user, cde.add_ip, cde.T_Com));
        }
        else
        {
            commandText = "update [HG].[dbo].[DTRAT] set [Pay_tag]='{0}',[Account_Date]='{1}',[MC]='{2}',[MC_Name]='{3}',[MC_Com]='{4}',[Account_Money]='{5}',[Pay_Type]='{6}',[edit_user]='{7}',[edit_date]=GETDATE() ,[edit_ip]='{8}',[T_Com]='{10}' where DT_ID='{9}'";
            sbCommandText = new StringBuilder();
            sbCommandText.Append(string.Format(commandText, cde.Pay_tag, cde.Account_Date, cde.MC, cde.MC_Name, cde.MC_Com, cde.Account_Money, cde.Pay_Type, cde.add_user, cde.add_ip, cde.DT_ID, cde.T_Com));
        }

        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<======

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;

    }

    public string reSendEditData(chargeDetailEntity cde)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(cde.ToString(), className, methodName);
        string commandText = string.Empty;
        StringBuilder sbCommandText = new StringBuilder();
        commandText = "INSERT INTO [HG].[dbo].[DTRAT] ([T_ID],[Account_Date],[MC],[MC_Name],[MC_Com],[Account_Money],[add_user],[add_ip],[add_date])VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}',GETDATE())";
        sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, cde.T_ID, cde.Account_Date, cde.MC, cde.MC_Name, cde.MC_Com, cde.Account_Money, cde.add_user, cde.add_ip));

        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<======

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;

    }

    /// <summary>
    /// 刪除收費明細
    /// </summary>
    /// <param name="DT_ID"></param>
    /// <returns></returns>
    public string deleteChargeDetail(string DT_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'DT_ID' : " + DT_ID, className, methodName);
        string commandText = "update DTRAT set del_tag ='1' where DT_ID='{0}'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, DT_ID));
        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<======

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }


    public string deleteTradeRecordDetail(string T_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'T_ID' : " + T_ID, className, methodName);
        string commandText = "update DTRAT set del_tag ='1' where T_ID='{0}'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, T_ID));
        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<======

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }


    public List<chargeDetailEntity> getChargeDetail(string DT_ID, string T_ID, string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'DT_ID' : " + DT_ID + "'T_ID' : " + T_ID + "'U_Num' : " + U_Num, className, methodName);
        string commandText = "select Pay_Type,Account_Money,MC_Name from DTRAT where DT_ID='" + DT_ID + "' and T_ID='" + T_ID + "' and MC='" + U_Num + "' and del_tag = '0'";

        List<chargeDetailEntity> cde = DTRAThgSql.Instance.getChargeDetail(connectionStrings, commandText);//<======

        log.endWrite("'cde' : " + cde.ToString(), className, methodName);
        return cde;
    }
}