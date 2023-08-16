using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// MRMAPjoinMREPOhgSql 的摘要描述
/// </summary>
public class MRMAPjoinMREPOhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MRMAPjoinMREPOhgSql _instanct = new MRMAPjoinMREPOhgSql();
    public static MRMAPjoinMREPOhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MRMAPjoinMREPOhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<reportTabEntity> getReportList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<reportTabEntity> rteList = new List<reportTabEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            reportTabEntity rte = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    rte = new reportTabEntity();
                    rte.DEP_name = sr[2].ToString().Trim();
                    rte.REPO_id = sr[3].ToString().Trim();
                    rte.REPO_name = sr[4].ToString().Trim();
                    rteList.Add(rte);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'rteList' : "+rteList.ToString(), className, methodName);
        return rteList;
    }
}