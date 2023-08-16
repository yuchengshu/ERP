using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MUSIPhgDao 的摘要描述
/// </summary>
public class MCHAGBhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MCHAGBhgDao _instance = new MCHAGBhgDao();
    public static MCHAGBhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MCHAGBhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    /// <summary>
    /// 處理saveEditCustomerDataRecord的邏輯
    /// </summary>
    /// <param name="se">使用者登入資料</param>
    public string saveEditCustomerMCdataRecord(editCustomerMCdataRecord ecmdr)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ecmdr' : "+ecmdr.ToString(), className, methodName);

        string commandText = "INSERT INTO [HG].[dbo].[MCHAG] ([M_ID],[old_MC],[old_MC_Name],[old_MC_Com],[New_MC],[New_MC_Name],[New_MC_Com],[Chg_PS],[Chg_Date],[Chg_User])VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', GETDATE(), '{8}')";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, ecmdr.M_ID, ecmdr.old_MC, ecmdr.old_MC_Name, ecmdr.old_MC_Com, ecmdr.New_MC, ecmdr.New_MC_Name, ecmdr.New_MC_Com, ecmdr.Chg_PS, ecmdr.Chg_User));
        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<============================

        log.endWrite("'backString' : "+ backString, className, methodName);
        return backString;
    }
}