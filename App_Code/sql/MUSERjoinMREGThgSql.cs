using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// MUSERjoinMREGThgSql 的摘要描述
/// </summary>
public class MUSERjoinMREGThgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MUSERjoinMREGThgSql _instanct = new MUSERjoinMREGThgSql();
    public static MUSERjoinMREGThgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MUSERjoinMREGThgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string getMonthPerformanceAims(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        string backString = string.Empty;
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    backString = sr[0].ToString().Trim();
                    if (common.isEmpty(backString))
                    {
                        backString = "0";
                    }
                }
            }
        }

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }
}