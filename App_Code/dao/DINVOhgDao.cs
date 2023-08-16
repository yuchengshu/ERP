using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// DINVOhgDao 的摘要描述
/// </summary>
public class DINVOhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static DINVOhgDao _instance = new DINVOhgDao();
    public static DINVOhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public DINVOhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public invoiceEntity getInvoiceData(string T_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'T_ID : '" + T_ID, className, methodName);

        string commandText = "select Invoice_CreateDate,invoice_num from DINVO where T_ID='{0}' and del_tag = '0'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, T_ID));
        invoiceEntity ie = DINVOhgSql.Instance.getInvoiceData(connectionStrings, sbCommandText.ToString());

        log.endWrite(ie.ToString(), className, methodName);
        return ie;
    }

    public List<ElectronicCalculatorInvoiceDetailEntity> getElectronicCalculatorInvoiceDetail(string StartDate, string EndDate, string Invoice_Item)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'Invoice_Item' : " + Invoice_Item, className, methodName);

        string sqltxt = getSqlTxt.getElectronicCalculatorInvoiceDetailST(StartDate,EndDate,Invoice_Item);
        string commandText = "SELECT  M_id,T_id,Invoice_ARMame,Invoice_PayAmount,Invoice_CreateDate,Invoice_Num,Invoice_Item,Invoice_State,Invoice_ComName,Invoice_UnifyNum,Invoice_PName FROM DINVO WHERE DEL_TAG='0'"+sqltxt+" order by AUTOID,Invoice_Createdate";
        List<ElectronicCalculatorInvoiceDetailEntity> ecideList = DINVOhgSql.Instance.getElectronicCalculatorInvoiceDetail(connectionStrings, commandText);//<==========

        log.endWrite("'ecideList' : " + ecideList.ToString(), className, methodName);
        return ecideList;
    }
}