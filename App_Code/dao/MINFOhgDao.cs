using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MINFOhgDao 的摘要描述
/// </summary>
public class MINFOhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MINFOhgDao _instance = new MINFOhgDao();
    public static MINFOhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MINFOhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string addData(addMINFOdataEntity amde)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'amde' :" + amde.ToString(), className, methodName);

        string commandText = "INSERT INTO [HG].[dbo].[MINFO] ([MI_Item],[MI_Title],[MI_Note],[MI_People],[add_user],[add_ip],[add_date])VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', GETDATE())";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, amde.MI_Item, amde.MI_Title, amde.MI_Note, amde.MI_People, amde.add_user, amde.add_ip));
        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<============================

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }
}