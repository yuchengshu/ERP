using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// HGOPLISThgDao 的摘要描述
/// </summary>
public class HGOPLISThgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static HGOPLISThgDao _instance = new HGOPLISThgDao();
    public static HGOPLISThgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public HGOPLISThgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<webConsumptionOrderEntity> getWebConsumptionOrderList(getWebConsumptionOrderParamEntity gwcope)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'gwcope' :" + gwcope.ToString(), className, methodName);

    string sql_txt = getSqlTxt.getWebConsumptionOrderListST(gwcope);
        string commandText = "select Auto_Id,O_Id,Name,Tel,EMail,City,Address,Price,Payway,PayStatus,P_id,DPRD_Name,Transaction_Time,ch_tag,MU_id,Invoice_item,InvoiceNumber,LoveCode,CustomerIdentifier,CarruerNum,MPRD_ID,DPRD_ID from HGOPLIST where del_tag='0' and Com_id='HG' " + sql_txt + " order by auto_id desc";
        List<webConsumptionOrderEntity> wcoeList = HGOPLISThgSql.Instance.getWebConsumptionOrderList(connectionStrings, commandText);//<==========

        log.endWrite("'wcoeList' :" + wcoeList.ToString(), className, methodName);
        return wcoeList;
    }

    public string deleteData(string Auto_Id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Auto_Id' :" + Auto_Id, className, methodName);

        string commandText = common.makeSQLdeleteStr("HGOPLIST", "Auto_Id", Auto_Id);
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public string updateCh_tag(string Auto_Id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Auto_Id' : " + Auto_Id, className, methodName);
        string commandText = "update CashOrder set ch_tag ='1' where Auto_Id='" + Auto_Id + "'";

        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);//<======

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    public List<InvoiceDetailEntity> getWebElectronicInvoiceDetail(string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'StartDate' : " + StartDate + "'EndDate' : " + EndDate, className, methodName);

        string sql_txt = "and (add_date >= '" + StartDate + " 00:00:00') AND ( add_date <= '" + EndDate + " 23:59:59') ";
        string commandText = "SELECT Transaction_Time,InvoiceNumber,O_Id,Name,Price FROM HGOPLIST WHERE DEL_TAG='0' "+ sql_txt + " and invoicenumber  is not null and paystatus='1' order by Transaction_time";
        List<InvoiceDetailEntity> ideList = HGOPLISThgSql.Instance.getWebElectronicInvoiceDetail(connectionStrings, commandText);//<==========

        log.endWrite("'ideList' : " + ideList.ToString(), className, methodName);
        return ideList;
    }

}