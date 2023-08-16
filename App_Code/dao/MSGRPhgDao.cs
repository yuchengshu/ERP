using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MSGRPhgDao 的摘要描述
/// </summary>
public class MSGRPhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MSGRPhgDao _instance = new MSGRPhgDao();
    public static MSGRPhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MSGRPhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<sendMessageCostEntity> getSendMessageCost(string StartDate, string EndDate, string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'StartDate' :" + StartDate+ "'EndDate' :" + EndDate + "'MP' :" + MP , className, methodName);
        string commandText = string.Empty;
        StringBuilder sb = null;
        if (common.isEmpty(MP))
        {
            sb = new StringBuilder();
            commandText = "select auto_id,M_MP,M_SStatus,M_Name from MSGRP where (add_date >= '{0}') and (add_date <= DATEADD(d, 1, '{1}')) and del_tag='0'";
            sb.Append( string.Format(commandText, StartDate, EndDate));
            commandText = sb.ToString();
        }
        else
        {
            sb = new StringBuilder();
            commandText = "select auto_id,M_MP,M_SStatus,M_Name from MSGRP where (add_date >= '{0}') and (add_date <= DATEADD(d, 1, '{1}')) and M_MP='{2}'and del_tag='0'";
            sb.Append(string.Format(commandText, StartDate, EndDate, MP));
            commandText = sb.ToString();
        }

        List<sendMessageCostEntity> smceList = MSGRPhgSql.Instance.getSendMessageCost(connectionStrings, commandText);//<===

        log.endWrite("'smceList' :"+ smceList.ToString(), className, methodName);
        return smceList;
    }

    public List<allPowerSendRecordEntity> getAllPowerSendRecord(getMessageListParam gmlp)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MP' :" + gmlp.MP + "'MP_Item' :" + gmlp.MP_Item + "'StartDate' :" + gmlp.StartDate + "'EndDate' :" + gmlp.EndDate + "'keyWord' :" + gmlp.keyWord + "'U_MDEP':" + gmlp.U_MDEP + "'U_POSITION':" + gmlp.U_POSITION + "'ComID':" + gmlp.ComID + "'U_Leader':" + gmlp.U_Leader + "'U_Num':" + gmlp.U_Num, className, methodName);

        string sqlTxt = getSqlTxt.getAllPowerSendRecordST(gmlp);
        string commandText = "select M_TEL,M_MP,M_MITem,M_SEQ,M_TStatus,M_Text,add_user,add_date from MSGRP where del_tag = '0' " + sqlTxt + " order by add_date desc";
        List<allPowerSendRecordEntity> apsreList = MSGRPhgSql.Instance.getAllPowerSendRecord(connectionStrings, commandText);//<===

        log.endWrite("'apsreList' :" + apsreList.ToString(), className, methodName);
        return apsreList;
    }


    public string sendSingleMessage(allPowerSendRecordEntity apsre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'apsre' :" + apsre.ToString(), className, methodName);

        StringBuilder sb = null;
        string commandText = "insert into MSGRP([M_TEL],[M_Name],[M_MP],[M_MITem],[M_SEQ],[M_TStatus],[M_SStatus],[M_Text],[add_user],[add_date],[add_ip])values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}',GETDATE(),'{9}')";
        sb = new StringBuilder();
        sb.Append(string.Format(commandText, apsre.M_TEL, apsre.M_Name, apsre.M_MP, apsre.M_MITem, apsre.M_SEQ, apsre.M_TStatus, apsre.M_SStatus, apsre.originalM_Text, apsre.add_user, apsre.add_ip));
        log.debug2(sb.ToString(),"","");
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sb.ToString());//<===
        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
}