using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// CDDhgSql 的摘要描述
/// </summary>
public class CDDhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static CDDhgSql _instanct = new CDDhgSql();
    public static CDDhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public CDDhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string getCDD(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        string back = string.Empty;
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

                    back = sr[0].ToString().Trim();

                }
            }
        }

        log.endWrite("'back' : " + back.ToString(), className, methodName);
        return back;
    }
}