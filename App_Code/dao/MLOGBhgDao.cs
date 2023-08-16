using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MUSIPhgDao 的摘要描述
/// </summary>
public class MLOGBhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MLOGBhgDao _instance = new MLOGBhgDao();
    public static MLOGBhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MLOGBhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    /// <summary>
    /// 處理saveEditCustomerDataRecord的邏輯
    /// </summary>
    /// <param name="se">使用者登入資料</param>
    public string saveEditCustomerDataRecord(editCustomerDataRecord ecdr)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(ecdr.ToString(), className, methodName);

        string commandText = "INSERT INTO [HG].[dbo].[MLOGB] ([Log_Item],[M_ID],[T_ID],[M_Row],[M_text],[edit_user],[edit_date])VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', GETDATE())";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, ecdr.Log_Item, ecdr.M_ID, ecdr.T_ID, ecdr.M_Row, ecdr.M_text,ecdr.edit_user));
        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<============================

        log.endWrite("'backString' : "+ backString, className, methodName);
        return backString;
    }

    /// <summary>
    /// 取得客戶修改紀錄
    /// </summary>
    /// <param name="M_ID"></param>
    /// <returns></returns>
    public List<editCustomerDataRecord> getCustomerDataEditRecord(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : "+ M_ID, className, methodName);

        string commandText = "select * from MLOGB where Log_Item='1' and M_id='{0}' and del_tag = '0'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, M_ID));
        List<editCustomerDataRecord> ecdrList = MLOGBhgSql.Instance.getCustomerDataEditRecord(connectionStrings, sbCommandText.ToString());//<============================

        log.endWrite("'ecdrList' : " + ecdrList, className, methodName);
        return ecdrList;
    }


    public List<editCustomerDataRecord> getTradeDataEditRecord(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : " + M_ID, className, methodName);

        string commandText = "select * from MLOGB where Log_Item='2' and M_id='{0}' and del_tag = '0'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, M_ID));
        List<editCustomerDataRecord> ecdrList = MLOGBhgSql.Instance.getCustomerDataEditRecord(connectionStrings, sbCommandText.ToString());//<============================

        log.endWrite("'ecdrList' : " + ecdrList, className, methodName);
        return ecdrList;
    }
}