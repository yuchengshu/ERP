using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// KYCDao 的摘要描述
/// </summary>
public class KYChgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static KYChgDao _instance = new KYChgDao();
    public static KYChgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public KYChgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string getKYC(string M_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'M_id' : " + M_id, className, methodName);

        string commandText = "select K_id  from KYC  WHERE M_id = '" + M_id + "'";
        string K_id = KYChgSql.Instance.getKYC(connectionStrings, commandText);//<==========

        log.endWrite("'K_id' : " + K_id, className, methodName);
        return K_id;
    }
}