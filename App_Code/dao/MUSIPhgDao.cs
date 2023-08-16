using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MUSIPhgDao 的摘要描述
/// </summary>
public class MUSIPhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MUSIPhgDao _instance = new MUSIPhgDao();
    public static MUSIPhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MUSIPhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    /// <summary>
    /// 處理saveLoginRecord的邏輯
    /// </summary>
    /// <param name="se">使用者登入資料</param>
    public void saveLoginRecord(sessionEntity se)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(se.ToString(), className, methodName);

        string commandText = "INSERT INTO [HG].[dbo].[MUSIP] ([IP_Address],[U_Num],[U_Name],[ComID],[U_MDEP],[U_Action])VALUES('{0}', '{1}','{2}','{3}','{4}', '登入')";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, se.IP, se.U_Num, se.U_Name, se.ComID, se.U_MDEP));
        noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<============================

        log.endWrite(common.nothing, className, methodName);
    }
}