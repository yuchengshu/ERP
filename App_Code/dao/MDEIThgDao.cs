using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MMAILhgDao 的摘要描述
/// </summary>
public class MDEIThgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MDEIThgDao _instance = new MDEIThgDao();
    public static MDEIThgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MDEIThgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public downPaymentEntity getDownpayment(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : " + M_ID, className, methodName);

        string commandText = "select V_ID,MC_Name,Pay_Amount From MDEIT  where M_ID='{0}'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, M_ID));
        downPaymentEntity dpe = MDEIThgSql.Instance.getDownpayment(connectionStrings, sbCommandText.ToString());

        log.endWrite("'dpe' : " + dpe, className, methodName);
        return dpe;
    }

}