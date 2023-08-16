using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MTRAThgDao 的摘要描述
/// </summary>
public class MTRAThgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MTRAThgDao _instance = new MTRAThgDao();
    public static MTRAThgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MTRAThgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    /// <summary>
    /// 取得交易紀錄
    /// </summary>
    /// <param name="M_ID"></param>
    /// <returns></returns>
    public List<tradeRecordEntity> getTradeRecord(string M_ID, string T_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("M_ID :" + M_ID + "&&T_ID :" + T_ID, className, methodName);

        string commandText = string.Empty;
        StringBuilder sbCommandText = new StringBuilder();
        if (!common.isEmpty(M_ID))
        {

            commandText = "select T_ID,MP,MP_Name,MC,MC_Name,T_Item,V_ID,V_Name,T_PayMoney,T_Type,T_StartDate,T_EndDate,T_PauseDate,T_AccountDate,T_Status,T_Fax,T_Media,T_PS,T_Message,Ccard_4Num,INV_tag,INV_Createdate,INV_Item,INV_open_Item,INV_ComName,INV_UnifyNum,INV_MNum,INV_SendState,Light_Status,Back_intag,Back_Status,Back_tag,add_user,ca_id,XQ_SName,XQ_SPw from MTRAT where del_tag='0' and M_ID='{0}' order by T_AccountDAte desc,T_Status desc,T_id desc";

            sbCommandText.Append(string.Format(commandText, M_ID));
        }
        else if (!common.isEmpty(T_ID))
        {
            commandText = "select T_ID,MP,MP_Name,MC,MC_Name,T_Item,V_ID,V_Name,T_PayMoney,T_Type,T_StartDate,T_EndDate,T_PauseDate,T_AccountDate,T_Status,T_Fax,T_Media,T_PS,T_Message,Ccard_4Num,INV_tag,INV_Createdate,INV_Item,INV_open_Item,INV_ComName,INV_UnifyNum,INV_MNum,INV_SendState,Light_Status,Back_intag,Back_Status,Back_tag,add_user,ca_id,XQ_SName,XQ_SPw  from MTRAT where del_tag='0' and T_ID='{0}'";
            sbCommandText.Append(string.Format(commandText, T_ID));
        }

        List<tradeRecordEntity> treList = MTRAThgSql.Instance.getTradeRecord(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite(treList.ToString(), className, methodName);
        return treList;
    }

    //取得折讓案件
    public List<discountDataEntity> getDiscountData(string m_Id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("m_Id :" + m_Id, className, methodName);
        StringBuilder sbCommandText = new StringBuilder();
        //取得折讓案件
        string commandText = "SELECT  a.M_id,a.T_StartDate,a.T_EndDate,a.T_ID,a.MP,a.T_Item,a.T_PayMoney FROM [HG].[dbo].[MTRAT] a where M_id='{0}'";
        sbCommandText.Append(string.Format(commandText, m_Id));


        List<discountDataEntity> tre = MTRAThgSql.Instance.getDiscountData(connectionStrings, sbCommandText.ToString());//<=====================
        /*
         * string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("M_ID :" + M_ID + "&&T_ID :" + T_ID, className, methodName);

        string commandText = string.Empty;
        StringBuilder sbCommandText = new StringBuilder();
        if (!common.isEmpty(M_ID))
        {

            commandText = "select T_ID,MP,MP_Name,MC,MC_Name,T_Item,V_ID,V_Name,T_PayMoney,T_Type,T_StartDate,T_EndDate,T_PauseDate,T_AccountDate,T_Status,T_Fax,T_Media,T_PS,T_Message,Ccard_4Num,INV_tag,INV_Createdate,INV_Item,INV_open_Item,INV_ComName,INV_UnifyNum,INV_MNum,INV_SendState,Light_Status,Back_intag,Back_Status,Back_tag,add_user,ca_id,XQ_SName,XQ_SPw from MTRAT where del_tag='0' and M_ID='{0}' order by T_AccountDAte desc,T_Status desc,T_id desc";

            sbCommandText.Append(string.Format(commandText, M_ID));
        }
        else if (!common.isEmpty(T_ID))
        {
            commandText = "select T_ID,MP,MP_Name,MC,MC_Name,T_Item,V_ID,V_Name,T_PayMoney,T_Type,T_StartDate,T_EndDate,T_PauseDate,T_AccountDate,T_Status,T_Fax,T_Media,T_PS,T_Message,Ccard_4Num,INV_tag,INV_Createdate,INV_Item,INV_open_Item,INV_ComName,INV_UnifyNum,INV_MNum,INV_SendState,Light_Status,Back_intag,Back_Status,Back_tag,add_user,ca_id,XQ_SName,XQ_SPw  from MTRAT where del_tag='0' and T_ID='{0}'";
            sbCommandText.Append(string.Format(commandText, T_ID));
        }

        List<tradeRecordEntity> treList = MTRAThgSql.Instance.getTradeRecord(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite(treList.ToString(), className, methodName);
        return treList;
         * 
         * 
         */
        return tre;
    }
    public List<haltResumeEntity> getCaseData(string m_Id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("m_Id :" + m_Id, className, methodName);
        StringBuilder sbCommandText = new StringBuilder();
        string commandText = "SELECT  a.M_id,a.T_StartDate,a.T_EndDate,a.T_ID,a.MP,a.T_Item,a.T_PayMoney FROM [HG].[dbo].[MTRAT] a where M_id='{0}'";
        sbCommandText.Append(string.Format(commandText, m_Id));


        List<haltResumeEntity> tre = MTRAThgSql.Instance.getCaseData(connectionStrings, sbCommandText.ToString());//<=====================
        /*
         * string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("M_ID :" + M_ID + "&&T_ID :" + T_ID, className, methodName);

        string commandText = string.Empty;
        StringBuilder sbCommandText = new StringBuilder();
        if (!common.isEmpty(M_ID))
        {

            commandText = "select T_ID,MP,MP_Name,MC,MC_Name,T_Item,V_ID,V_Name,T_PayMoney,T_Type,T_StartDate,T_EndDate,T_PauseDate,T_AccountDate,T_Status,T_Fax,T_Media,T_PS,T_Message,Ccard_4Num,INV_tag,INV_Createdate,INV_Item,INV_open_Item,INV_ComName,INV_UnifyNum,INV_MNum,INV_SendState,Light_Status,Back_intag,Back_Status,Back_tag,add_user,ca_id,XQ_SName,XQ_SPw from MTRAT where del_tag='0' and M_ID='{0}' order by T_AccountDAte desc,T_Status desc,T_id desc";

            sbCommandText.Append(string.Format(commandText, M_ID));
        }
        else if (!common.isEmpty(T_ID))
        {
            commandText = "select T_ID,MP,MP_Name,MC,MC_Name,T_Item,V_ID,V_Name,T_PayMoney,T_Type,T_StartDate,T_EndDate,T_PauseDate,T_AccountDate,T_Status,T_Fax,T_Media,T_PS,T_Message,Ccard_4Num,INV_tag,INV_Createdate,INV_Item,INV_open_Item,INV_ComName,INV_UnifyNum,INV_MNum,INV_SendState,Light_Status,Back_intag,Back_Status,Back_tag,add_user,ca_id,XQ_SName,XQ_SPw  from MTRAT where del_tag='0' and T_ID='{0}'";
            sbCommandText.Append(string.Format(commandText, T_ID));
        }

        List<tradeRecordEntity> treList = MTRAThgSql.Instance.getTradeRecord(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite(treList.ToString(), className, methodName);
        return treList;
         * 
         * 
         */
        return tre;
    }

    public tradeRecordEntity getTradeRecordByTid(string T_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("T_ID :" + T_ID, className, methodName);

        StringBuilder sbCommandText = new StringBuilder();
        string commandText = "select * from MTRAT where del_tag='0' and T_ID='{0}'";
        sbCommandText.Append(string.Format(commandText, T_ID));


        tradeRecordEntity tre = MTRAThgSql.Instance.getTradeRecordByTid(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite("'tre':"+tre.ToString(), className, methodName);
        return tre;
    }

    public string sendMTRAT(tradeRecordEntity tre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("tre :" + tre.ToString(), className, methodName);

        string commandText = @"INSERT INTO [HG].[dbo].[MTRAT] ([T_ID],[M_ID],[MP],[MP_Name],[MP_COM],[MC],[MC_Name],[MC_COM],[T_Item],[Results_Item],[V_ID],[V_Name],[T_PayMoney],[T_PType],[T_Type],[T_StartDate],[T_EndDate],[T_AccountDate],[T_Fax],[T_Media],[T_PS],[T_Message],[Ccard_4Num],[INV_tag],[INV_Createdate],[INV_Item],[INV_open_Item],[INV_ComName],[INV_UnifyNum],[INV_MNum],[INV_SendState],[Light_Status],[Back_intag],[add_user],[add_date],[add_ip],[edit_date],[MT_COM],[XQ_SName],[XQ_SPw])VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}','{15}','{16}','{17}','{18}','{19}','{20}','{21}','{22}','{23}','{24}','{25}','{26}','{27}','{28}','{29}','{30}','{31}','{32}','{33}',GETDATE(),'{34}',GETDATE(),'{35}','{36}','{37}');";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, tre.T_ID, tre.M_ID, tre.MP, tre.MP_Name, tre.MP_COM, tre.MC, tre.MC_Name, tre.MC_COM, tre.T_Item, tre.Results_Item, tre.V_ID, tre.V_Name, tre.T_PayMoney, tre.T_PType, tre.T_Type, tre.T_StartDate, tre.T_EndDate, tre.T_AccountDate, tre.T_Fax, tre.T_Media, tre.T_PS, tre.T_Message, tre.Ccard_4Num, tre.INV_tag, tre.INV_Createdate, tre.INV_Item, tre.INV_open_Item, tre.INV_ComName, tre.INV_UnifyNum, tre.INV_MNum, tre.INV_SendState, tre.Light_Status, tre.Back_intag, tre.add_user, tre.add_ip, tre.MT_COM,tre.XQ_SName,tre.XQ_SPw));
        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());

        log.endWrite("'backString' :" + backString, className, methodName);
        return backString;
    }
    public string reSendEditData(tradeRecordEntity tre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("tre :" + tre.ToString(), className, methodName);

        string commandText = @"INSERT INTO [HG].[dbo].[MTRAT] ([T_ID],[M_ID],[MP],[MP_Name],[MP_COM],[MC],[MC_Name],[MC_COM],[T_Item],[V_ID],[T_PayMoney],[T_PType],[T_Type],[T_StartDate],[T_EndDate],[T_AccountDate],[T_Fax],[T_PS],[T_Message],[add_user],[add_ip],[add_date])VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}','{15}','{16}','{17}','{18}','{19}','{20}',GETDATE());";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, tre.T_ID, tre.M_ID, tre.MP, tre.MP_Name, tre.MP_COM, tre.MC, tre.MC_Name, tre.MC_COM, tre.T_Item, tre.V_ID, tre.T_PayMoney, tre.T_PType, tre.T_Type, tre.T_StartDate, tre.T_EndDate, tre.T_AccountDate, tre.T_Fax, tre.T_PS, tre.T_Message,tre.add_user,tre.add_ip));
        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());

        log.endWrite("'backString' :" + backString, className, methodName);
        return backString;
    }
    //here

    public string seSendEditData(tradeRecordEntity tre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("tre=" + tre.ToString(), className, methodName);

        string commandText = @"update MTRAT set T_PauseDate = '{0}', T_PS = '{1}', T_Status = '2',edit_user = '{2}',edit_ip = '{3}' where T_ID = '{4}'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, tre.T_PauseDate, tre.T_PS, tre.edit_user, tre.edit_ip, tre.T_ID));
        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());

        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }
    public string reseSendEditData(tradeRecordEntity tre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("tre=" + tre.ToString(), className, methodName);

        string commandText = @"update MTRAT set T_RestDate = '{0}', T_PS = '{1}', T_Status = '1',edit_user = '{2}',edit_ip = '{3}',T_EndDate = '{5}' where T_ID = '{4}'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, tre.T_RestDate, tre.T_PS, tre.edit_user, tre.edit_ip, tre.T_ID,tre.T_EndDate));
        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());

        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }
    public string updateNormalEditTradeDetail(tradeRecordEntity tre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("tre :" + tre.ToString(), className, methodName);
      


        string commandText = @"update MTRAT set MP = '{0}', MP_Name = '{1}', MP_COM = '{2}', MC = '{3}', MC_Name = '{4}',MC_COM = '{5}', T_AccountDate = '{6}', T_PayMoney = '{7}', Light_Status = '{8}', Ccard_4Num = '{9}', T_StartDate = '{10}', T_EndDate = '{11}', T_Message = '{12}', T_Fax = '{13}', T_Media = '{14}', XQ_SName = '{15}', XQ_SPw = '{16}', MT_COM = '{17}', INV_open_Item = '{18}', INV_MNum = '{19}', INV_tag = '{20}', INV_Createdate = '{21}', INV_Item = '{22}', INV_ComName = '{23}', INV_UnifyNum = '{24}', INV_SendState = '{25}', Back_intag = '{26}', Back_Status = '{27}', T_PS = '{28}' , T_Item = '{30}' where T_ID = '{29}'"; 
         StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, tre.MP, tre.MP_Name, tre.MP_COM, tre.MC, tre.MC_Name, tre.MC_COM, tre.T_AccountDate, tre.T_PayMoney, tre.Light_Status, tre.Ccard_4Num, tre.T_StartDate, tre.T_EndDate, tre.T_Message, tre.T_Fax, tre.T_Media, tre.XQ_SName, tre.XQ_SPw, tre.MT_COM, tre.INV_open_Item, tre.INV_MNum, tre.INV_tag, tre.INV_Createdate, tre.INV_Item, tre.INV_ComName, tre.INV_UnifyNum, tre.INV_SendState, tre.Back_intag, tre.Back_Status, tre.T_PS, tre.T_ID, tre.T_Item));
        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());

        log.endWrite("'backString' :" + backString, className, methodName);
        return backString;
    }

    public tradeRecordEntity getTradeData(string T_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("T_ID :" + T_ID, className, methodName);
        string commandText = "select T_PayMoney,T_StartDate,T_EndDate,MT_COM,T_ID,M_ID From MTRAT where T_ID = '{0}' and del_tag='0'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, T_ID));
        tradeRecordEntity tre = MTRAThgSql.Instance.getTradeData(connectionStrings, sbCommandText.ToString());
        log.endWrite("'tre' :" + tre.ToString(), className, methodName);
        return tre;
    }

    public tradeRecordEntity getCDDdata(string T_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("T_ID :" + T_ID, className, methodName);

        string commandText = "select T_ID,M_ID,MC,T_PayMoney,T_AccountDate From MTRAT where T_ID = '{0}' and del_tag='0'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, T_ID));
        tradeRecordEntity tre = MTRAThgSql.Instance.getCDDdata(connectionStrings, sbCommandText.ToString());

        log.endWrite("'tre' :" + tre.ToString(), className, methodName);
        return tre;
    }
    public List<totalPerformanceEntity> getTotalPerformanceData(string MC, string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("MC :" + MC + "MP :" + MP, className, methodName);
        string commandText = string.Empty;
        if (common.isEmpty(MC))
        {
            commandText = "select MP,MP_Name,MC,MC_Name from MTRAT where T_Type<>'0002' and del_tag='0' and fs_tag='0'";
        }
        else
        {
            commandText = "select MP,MP_Name,MC,MC_Name from MTRAT where MC='{0}' and MP='{1}' and T_Type<>'0002' and del_tag='0' and fs_tag='0'";
            StringBuilder sbCommandText = new StringBuilder();
            sbCommandText.Append(string.Format(commandText, MC, MP));
            commandText = sbCommandText.ToString();
        }
       
        List<totalPerformanceEntity> tpeList = MTRAThgSql.Instance.getTotalPerformanceData(connectionStrings, commandText);
        log.endWrite("'tpeList' :" + tpeList.ToString(), className, methodName);
        return tpeList;
    }

    public string deleteTradeRecordDetail(string T_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'T_ID' : " + T_ID, className, methodName);
        string commandText = "update MTRAT set del_tag ='1' where T_ID='{0}'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, T_ID));
        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<======

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    public string archive(string T_ID, string Back_Status)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'T_ID' : " + T_ID, className, methodName);

        string Back_tag = string.Empty;
        if (Back_Status == "0")
        {
            Back_tag = "0";
        }
        else
        {
            Back_tag = "1";
        }

        string commandText = "update MTRAT set Back_Status ='"+ Back_Status + "',Back_tag='"+ Back_tag + "' where T_ID='" + T_ID + "'";

        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);//<======
        
        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

   

    public List<VenueDataEntity> getVenueData(string V_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'V_ID' : " + V_ID, className, methodName);

        string commandText = "select T_PayMoney,T_PType from MTRAT where V_ID='" + V_ID + "' and del_tag = '0'";
        List<VenueDataEntity> vdeList = MTRAThgSql.Instance.getVenueData(connectionStrings, commandText);

        log.endWrite("'vdeList' : " + vdeList, className, methodName);
        return vdeList;
    }


    public List<tradeRecordEntity> getElectronicCalculatorInvoiceData(string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("StartDate :" + StartDate + "&&EndDate :" + EndDate, className, methodName);

        string commandText = "select T_ID,T_PayMoney,INV_Item,INV_SendState from MTRAT where del_tag = '0' and INV_Createdate>='"+ StartDate + "' and INV_Createdate<='"+ EndDate + "'";
        List<tradeRecordEntity> treList = MTRAThgSql.Instance.getElectronicCalculatorInvoiceData(connectionStrings, commandText);//<=====================

        log.endWrite("'treList':"+treList.ToString(), className, methodName);
        return treList;
    }

}