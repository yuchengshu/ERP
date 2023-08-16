using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// MMAILhgSql 的摘要描述
/// </summary>
public class MDEIThgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MDEIThgSql _instanct = new MDEIThgSql();
    public static MDEIThgSql Instance
    {
        get
        {
            return _instanct;
        }
    }

    public MDEIThgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public downPaymentEntity getDownpayment(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));

        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        downPaymentEntity dep = new downPaymentEntity();
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
                    dep.V_ID = sr[0].ToString();
                    dep.MC_Name = sr[1].ToString();
                    dep.Pay_Amount = sr[2].ToString();

                }
            }
        }

        log.endWrite("'dep' : " + dep, className, methodName);
        return dep;
    }
}