using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// DMBERhgSql 的摘要描述
/// </summary>
public class DMBERhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static DMBERhgSql _instanct = new DMBERhgSql();
    public static DMBERhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }

    public DMBERhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<DMBERentity> getDMBERdata(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<DMBERentity> deList = new List<DMBERentity>();

        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            DMBERentity de = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    de = new DMBERentity();
                    de.DM_MC_Name = sr[0].ToString().Trim();
                    de.DM_MarkTime = sr[1].ToString().Trim();
                    de.DM_tag = sr[2].ToString().Trim();
                    de.DM_MC = sr[3].ToString().Trim();
                    deList.Add(de);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(deList.ToString(), className, methodName);
        return deList;
    }


}