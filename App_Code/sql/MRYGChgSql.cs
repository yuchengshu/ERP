using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// MRYGChgSql 的摘要描述
/// </summary>
public class MRYGChgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MRYGChgSql _instanct = new MRYGChgSql();
    public static MRYGChgSql Instance
    {
        get
        {
            return _instanct;
        }
    }

    public MRYGChgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public assignNameDateEntity getAssignNameDate(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        assignNameDateEntity ande = null;
        //從資料庫把資料撈出來*************************************************************************************************start
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
                    ande = new assignNameDateEntity();
                    ande.Assign_Name = sr[0].ToString().Trim();
                    ande.Assign_Date = sr[1].ToString().Trim();
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        string logBackString = string.Empty;
        if (ande != null)
        {
            logBackString = ande.ToString();
        }
        log.endWrite(logBackString, className, methodName);
        return ande;
    }


}