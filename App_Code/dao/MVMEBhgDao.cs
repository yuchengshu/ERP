using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data.SqlClient;

/// <summary>
/// MVENUhgDao 的摘要描述
/// </summary>
public class MVMEBhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MVMEBhgDao _instance = new MVMEBhgDao();
    public static MVMEBhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MVMEBhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    //public List<SRMVMEBEntity> getVenueDataLis2t2()
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    log.startWrite(common.nothing, className, methodName);
    //    string commandText = commandText = "select V_ID,V_Date,MP_Name,V_Site,V_Fees from MVENU where V_Date >= DateAdd(d,-14,GETDATE()) and del_tag = '0' order by V_date";

    //    List<SRMVMEBEntity> vde = MVMEBhgDao.Instance. getVenueDataList();

    //    log.endWrite(vde.ToString(), className, methodName);
    //    return vde;
    //}

    //public List<SRMVMEBEntity> getVenueDataList()
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    log.startWrite(common.nothing, className, methodName);
    //    string commandText = commandText = "select V_ID,V_Date,MP_Name,V_Site,V_Fees from MVENU where V_Date >= DateAdd(d,-14,GETDATE()) and del_tag = '0' order by V_date";

    //    List<SRMVMEBEntity> vde = MVMEBhgDao.Instance.getSRMVMEBList(connectionStrings, commandText);

    //    log.endWrite(vde.ToString(), className, methodName);
    //    return vde;
    //}

    //取得VIP會員資料
    public List<SRMVMEBEntity> getVIPMEMBERList(string keyWord, string  MP_ID)
    {
        string M_Name_test = keyWord;
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        string commandText = "SELECT  M_ID,M_Name,MP_Name,MC_Name,SR_Name,ADD_Date FROM MVMEB ";
        //string condition = "where M_Name like '%"+ Keyword + "%' or MP_Name like  '%" + Keyword + "%' ";
        string condition = "";
        if (M_Name_test != "undefined" && MP_ID !="")
        {
            condition = "where M_Name like '%" + keyWord + "%' AND MP_ID='"+MP_ID +"'" ;
        }
        if (M_Name_test != "undefined" && MP_ID =="")
        {
            condition = "where M_Name like '%" + keyWord + "%'";
        }
        string SQL = " order by ADD_Date desc";
        commandText = commandText + condition + SQL;
        //commandText = commandText + condition+SQL;
        List<SRMVMEBEntity> vde = MVMEBhgSql.Instance.getSRMVMEBList(connectionStrings, commandText);

        log.endWrite(vde.ToString(), className, methodName);
        return vde;
    }

    public List<SRMVMEBEntity> getVIPMEMBERList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        string commandText = "SELECT  M_ID,M_Name,MP_Name,MC_Name,SR_Name,ADD_Date FROM MVMEB ";
        //string condition = "where M_Name like '%" + Keyword + "%' or MP_Name like  '%" + Keyword + "%' or MC_Name like  '%" + Keyword + "%' or SR_Name like  '%" + Keyword + "%' or M_ID like  '%" + Keyword + "%'";
        string SQL = " order by ADD_Date desc";
        commandText = commandText + SQL;
        List<SRMVMEBEntity> vde = MVMEBhgSql.Instance.getSRMVMEBList(connectionStrings, commandText);

        log.endWrite(vde.ToString(), className, methodName);
        return vde;
    }


}