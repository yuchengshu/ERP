using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// MQUSTjoinMMBERhgSql 的摘要描述
/// </summary>
public class MQUSTjoinMMBERhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MQUSTjoinMMBERhgSql _instanct = new MQUSTjoinMMBERhgSql();
    public static MQUSTjoinMMBERhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MQUSTjoinMMBERhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<callRecordEntity> getCallRecordList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<callRecordEntity> creList = new List<callRecordEntity>();
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
                    callRecordEntity cre = new callRecordEntity();
                    cre.Auto_id = sr[0].ToString().Trim();
                    cre.Q_Date = sr[1].ToString().Trim();
                    cre.Question = sr[2].ToString().Trim();
                    cre.N_Date = sr[3].ToString().Trim();
                    cre.N_Item = sr[4].ToString().Trim();
                    cre.Add_User = sr[5].ToString().Trim();
                    cre.mc = sr[6].ToString().Trim();

                    creList.Add(cre);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(creList.ToString(), className, methodName);
        return creList;
    }
}