using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// DTRATjoinMTRATjoinMMBERjoinMUSERhgDao 的摘要描述
/// </summary>
public class DTRATjoinMTRATjoinMMBERjoinMUSERhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static DTRATjoinMTRATjoinMMBERjoinMUSERhgDao _instance = new DTRATjoinMTRATjoinMMBERjoinMUSERhgDao();
    public static DTRATjoinMTRATjoinMMBERjoinMUSERhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public DTRATjoinMTRATjoinMMBERjoinMUSERhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<performanceRankingEntity> getPerformanceRanking(string U_MDEP, string group)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'U_MDEP' : {0}, 'group' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, U_MDEP, group));
        log.startWrite(sb.ToString(), className, methodName);

        string sqlTxt = getSqlTxt.PerformanceRankingST(group, U_MDEP);
        string commandText = getCommandText.PerformanceRankingCT(U_MDEP, sqlTxt);
        List<performanceRankingEntity> nbeList = DTRATjoinMTRATjoinMMBERjoinMUSERhgSql.Instance.getPerformanceRanking(connectionStrings, commandText);//<======

        log.endWrite(nbeList.ToString(), className, methodName);
        return nbeList;
    }
}