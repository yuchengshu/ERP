using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// GDINVOhgDao 的摘要描述
/// </summary>
public class GDINVOhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static GDINVOhgDao _instance = new GDINVOhgDao();
    public static GDINVOhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public GDINVOhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<invNumEntity> getInvNumList(string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("StartDate :" + StartDate + "EndDate:" + EndDate, className, methodName);

        string sqlTxt = getSqlTxt.getAllChargeDetailST(StartDate, EndDate);
        string commandText = "select T_id,Inv_num from GDINVO where 1=1 " + sqlTxt + " order by add_Date desc";
        List<invNumEntity> ineList = GDINVOhgSql.Instance.getInvNumList(connectionStrings, commandText);//<======

        log.endWrite("'ineList' :"+ineList.ToString(), className, methodName);
        return ineList;
    }

    public string getInvNumByTid(string Tid)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("Tid :" + Tid, className, methodName);


        string commandText = "select Inv_num from GDINVO where T_id="+ Tid;
        string backStr = GDINVOhgSql.Instance.getInvNumByTid(connectionStrings, commandText);//<======

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

}