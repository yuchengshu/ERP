using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// MQUSThgSql 的摘要描述
/// </summary>
public class MQUSThgSql
{

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MQUSThgSql _instanct = new MQUSThgSql();
    public static MQUSThgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MQUSThgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }


    public List<todayConnectionMatterEntity> getTodayConnectionMatter(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<todayConnectionMatterEntity> ebeList = new List<todayConnectionMatterEntity>();
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
                    todayConnectionMatterEntity tcme = new todayConnectionMatterEntity();
                    tcme.M_ID = sr[1].ToString().Trim();
                    tcme.Q_Name = sr[2].ToString().Trim();
                    tcme.Question = sr[4].ToString().Trim();
                    tcme.N_Date = sr[5].ToString().Trim();
                    tcme.N_Item = sr[6].ToString().Trim();
                    tcme.Add_User = sr[9].ToString().Trim();
                    ebeList.Add(tcme);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(ebeList.ToString(), className, methodName);
        return ebeList;
    }
}