using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// VINVOhgDao 的摘要描述
/// </summary>
public class VINVOhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static VINVOhgDao _instance = new VINVOhgDao();
    public static VINVOhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public VINVOhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<tbdInvoiceEntity> getTbdInvoice(string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'StartDate' :" + StartDate + "'EndDate' :" + EndDate, className, methodName);

        string sql_txt = getSqlTxt.getTbdInvoiceST(StartDate, EndDate);
        string commandText = "SELECT M_ID,M_Name,T_ID,INV_Createdate,MP,T_Item,T_PayMoney,INV_Item,INV_ComName,INV_UnifyNum,INV_SendState,MT_COM FROM New_VINVO where inv_createdate is not null and del_tag='0' and fs_tag='0'" + sql_txt + " order by Inv_Createdate desc,U_Mdep,mc_com,add_date";

        List<tbdInvoiceEntity> tieList = VINVOhgSql.Instance.getTbdInvoice(connectionStrings, commandText);//<==========

        log.endWrite("'tieList' :" + tieList.ToString(), className, methodName);
        return tieList;
    }

    public tbdInvoiceEntity getTbdInvoiceByTid(string Tid)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Tid' :" + Tid, className, methodName);

        string commandText = "SELECT M_ID,M_Name,T_ID,INV_Createdate,MP,T_Item,T_PayMoney,INV_Item,INV_ComName,INV_UnifyNum,INV_SendState,MT_COM,HCity,HTown,HZipCode,H_Address,MTel1,EMail FROM New_VINVO where T_ID=" + Tid;

        tbdInvoiceEntity tie = VINVOhgSql.Instance.getTbdInvoiceByTid(connectionStrings, commandText);//<==========

        log.endWrite("'tie' :" + tie.ToString(), className, methodName);
        return tie;
    }

}