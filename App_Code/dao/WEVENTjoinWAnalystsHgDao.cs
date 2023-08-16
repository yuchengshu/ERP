using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// WEVENTjoinWAnalystsHgDao 的摘要描述
/// </summary>
public class WEVENTjoinWAnalystsHgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static WEVENTjoinWAnalystsHgDao _instance = new WEVENTjoinWAnalystsHgDao();
    public static WEVENTjoinWAnalystsHgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public WEVENTjoinWAnalystsHgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<ResourceDistributionEntity> getResourceDistribution(string StartDate, string EndDate, string MC_COM)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'StartDate' :" + StartDate + "'EndDate' :" + EndDate + "'MC_COM' :" + MC_COM, className, methodName);

        string sql1_txt = getSqlTxt.getWEVENTjoinWAnalystsResourceDistributionST(StartDate, EndDate, MC_COM);
        //20221118執行sql
        string commandText = "SELECT a.Result_User, COUNT(a.Result_User) AS RU FROM WEVENT AS a INNER JOIN WAnalysts AS b ON a.T_id = b.T_id WHERE  (a.del_tag = '0') AND (a.Sys_assjob_tag = '1') " + sql1_txt +" GROUP BY a.Result_user";

        List<ResourceDistributionEntity> rdeList = MFRRPhgSql.Instance.getResourceDistribution(connectionStrings, commandText);//<======

        log.endWrite("'rdeList':" + rdeList.ToString(), className, methodName);
        return rdeList;
    }
}