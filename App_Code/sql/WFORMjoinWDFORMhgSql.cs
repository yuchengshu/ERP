using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// WFORMjoinWDFORMhgSql 的摘要描述
/// </summary>
public class WFORMjoinWDFORMhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static WFORMjoinWDFORMhgSql _instanct = new WFORMjoinWDFORMhgSql();
    public static WFORMjoinWDFORMhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public WFORMjoinWDFORMhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<activityFormTransactionEntity> getWFORMjoinWDFORMdata(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<activityFormTransactionEntity> afteList = new List<activityFormTransactionEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            activityFormTransactionEntity afte = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    afte = new activityFormTransactionEntity();
                    afte.dwf_id = sr[0].ToString().Trim();
                    afte.add_date = sr[1].ToString().Trim();
                    afte.P_id = sr[2].ToString().Trim();
                    afte.M_Tel = sr[3].ToString().Trim();
                    afteList.Add(afte);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end

        log.endWrite("'afteList' :" + afteList.ToString(), className, methodName);
        return afteList;
    }
}