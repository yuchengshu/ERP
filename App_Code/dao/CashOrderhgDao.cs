using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// CashOrderhgDao 的摘要描述
/// </summary>
public class CashOrderhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static CashOrderhgDao _instance = new CashOrderhgDao();
    public static CashOrderhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public CashOrderhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string updateCh_tag(string Auto_Id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Auto_Id' : " + Auto_Id, className, methodName);
        string commandText = "update CashOrder set ch_tag ='1' where Auto_Id='"+ Auto_Id + "'";

        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);//<======

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    public string editData(string Auto_Id, string P_EDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Auto_Id' :" + Auto_Id + "'P_EDate' :" + P_EDate, className, methodName);
        string commandText = "update CashOrder set HandModeEndTime ='" + P_EDate + "' where Auto_Id='" + Auto_Id + "'";
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);//<======

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }


}