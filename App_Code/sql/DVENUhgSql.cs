using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// DVENUhgSql 的摘要描述
/// </summary>
public class DVENUhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static DVENUhgSql _instanct = new DVENUhgSql();
    public static DVENUhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public DVENUhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string getVidCount(string connectionStrings, string commandText)
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
                }
            }
        }

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }
   
    public List<getVenueMCentity> getVenueMC(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<getVenueMCentity> gvmceList = new List<getVenueMCentity>();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            getVenueMCentity gvmce = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    gvmce = new getVenueMCentity();
                    gvmce.DV_ID = sr[0].ToString().Trim();
                     gvmce.V_ID = sr[1].ToString().Trim();
                     gvmce.MC = sr[2].ToString().Trim();
                     gvmce.MC_Name = sr[3].ToString().Trim();
                     gvmce.add_date = sr[4].ToString().Trim();

                    gvmceList.Add(gvmce);
                }
            }
        }

        log.endWrite("'gvmceList' : " + gvmceList.ToString(), className, methodName);
        return gvmceList;
    }
}