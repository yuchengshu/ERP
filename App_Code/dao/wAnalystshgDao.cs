using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// wAnalystshgDao 的摘要描述
/// </summary>
public class wAnalystshgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static wAnalystshgDao _instance = new wAnalystshgDao();
    public static wAnalystshgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public wAnalystshgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<wAnalystEntity> getWAnalysts()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        string commandText = "select T_id,Ch,U_Num from wAnalysts where del_tag = '0' and Open_tag='0' order by T_id";
        List<wAnalystEntity> wAnalystList = wAnalystshgSql.Instance.getWAnalysts(connectionStrings, commandText);//<==========

        log.endWrite("'wAnalystList' :" + wAnalystList.ToString(), className, methodName);
        return wAnalystList;
    }




    
}