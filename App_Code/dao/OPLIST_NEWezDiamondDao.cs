using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// OPLIST_NEWezDiamondDao 的摘要描述
/// </summary>
public class OPLIST_NEWezDiamondDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectEZDiamond";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static OPLIST_NEWezDiamondDao _instance = new OPLIST_NEWezDiamondDao();
    public static OPLIST_NEWezDiamondDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public OPLIST_NEWezDiamondDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<easySchoolOrderEntity> getEasySchoolOrderList(getEasySchoolOrderParamEntity gesope)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'gesope' :" + gesope.ToString(), className, methodName);

        string sql_txt = getSqlTxt.getEasySchoolOrderListST(gesope);
        string commandText = "select Auto_Id,O_Id,U_Name,Tel,EMail,Price,Invoice,Invoice_Com,Payway,Invoice_Vat,PayStatus,Add_Date,ch_tag,MU_PW,P_Name,MPRD_ID,d_price,Quantity,InvoiceNumber,Invoice_item,CarruerNum,CustomerIdentifier,LoveCode,P_EDate,T_id,OD_id from OPLIST_NEW where Auto_id is not null and Com_Id='EZ' " + sql_txt + " order by add_date desc";
        List<easySchoolOrderEntity> esoeList = OPLIST_NEWezDiamondSql.Instance.getEasySchoolOrderList(connectionStrings, commandText);//<==========

        log.endWrite("'esoeList' :" + esoeList.ToString(), className, methodName);
        return esoeList;
    }

    public string updateCh_tag(string Auto_Id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Auto_Id' : " + Auto_Id, className, methodName);
        string commandText = "update OPLIST_NEW set ch_tag ='1' where Auto_Id='" + Auto_Id + "'";

        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);//<======

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    public List<InvoiceDetailEntity> getSchoolElectronicInvoiceDetail(string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'StartDate' : " + StartDate + "'EndDate' : " + EndDate, className, methodName);

        string sql_txt = "and (add_date >= '" + StartDate + "') AND ( add_date <= '" + EndDate + "') ";
        string commandText = "SELECT add_date,InvoiceNumber,O_Id,U_Name,P_Price FROM oplist_new WHERE invoicenumber<>'' " + sql_txt + " order by add_Date";
        List<InvoiceDetailEntity> ideList = HGOPLISThgSql.Instance.getWebElectronicInvoiceDetail(connectionStrings, commandText);//<==========

        log.endWrite("'ideList' : " + ideList.ToString(), className, methodName);
        return ideList;
    }
}