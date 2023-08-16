using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// CDDhgDao 的摘要描述
/// </summary>
public class CDDhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static CDDhgDao _instance = new CDDhgDao();
    public static CDDhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public CDDhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string getCDD(string M_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'M_id' : " + M_id, className, methodName);

        string commandText = "select C_id  from CDD  WHERE M_id = '" + M_id + "'";
        string K_id = CDDhgSql.Instance.getCDD(connectionStrings, commandText);//<==========

        log.endWrite("'K_id' : " + K_id, className, methodName);
        return K_id;
    }

}