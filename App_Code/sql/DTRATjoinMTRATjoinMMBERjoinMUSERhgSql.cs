using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// DTRATjoinMTRATjoinMMBERjoinMUSERhgSql 的摘要描述
/// </summary>
public class DTRATjoinMTRATjoinMMBERjoinMUSERhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static DTRATjoinMTRATjoinMMBERjoinMUSERhgSql _instanct = new DTRATjoinMTRATjoinMMBERjoinMUSERhgSql();
    public static DTRATjoinMTRATjoinMMBERjoinMUSERhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public DTRATjoinMTRATjoinMMBERjoinMUSERhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<performanceRankingEntity> getPerformanceRanking(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<performanceRankingEntity> preList = new List<performanceRankingEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            performanceRankingEntity pre = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    pre = new performanceRankingEntity();
                    pre.mc = sr[0].ToString().Trim();
                    pre.mc_com = sr[1].ToString().Trim();
                    pre.mc_name = sr[2].ToString().Trim();
                    pre.U_Mdep = sr[3].ToString().Trim();
                    pre.money = sr[4].ToString().Trim();
                    preList.Add(pre);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(preList.ToString(), className, methodName);
        return preList;
    }
}