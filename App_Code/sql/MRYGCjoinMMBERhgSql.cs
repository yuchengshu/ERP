using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// MRYGCjoinMMBERhgSql 的摘要描述
/// </summary>
public class MRYGCjoinMMBERhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MRYGCjoinMMBERhgSql _instanct = new MRYGCjoinMMBERhgSql();
    public static MRYGCjoinMMBERhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MRYGCjoinMMBERhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public int getLightCount(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        int count = 0;
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
                    count += 1;
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
       
        log.endWrite("'count':"+ count.ToString(), className, methodName);
        return count;
    }

    public List<caseDistributeDataEntity> getCaseDistributeList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<caseDistributeDataEntity> cddeList = new List<caseDistributeDataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            caseDistributeDataEntity cdde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    cdde = new caseDistributeDataEntity();
                    cdde.Light_Status = sr[0].ToString().Trim();
                    cdde.M_ID = sr[1].ToString().Trim();
                    cdde.M_Name = sr[2].ToString().Trim();
                    cdde.MTel1 = sr[3].ToString().Trim();
                    cdde.MTel2 = sr[4].ToString().Trim();
                    cdde.MTel3 = sr[5].ToString().Trim();
                    cdde.Assign_user = sr[6].ToString().Trim();
                    cdde.Assign_Name = sr[7].ToString().Trim();
                    cdde.Assign_Date = sr[8].ToString().Trim();
                    cdde.LongTag_Date = sr[9].ToString().Trim();
                    cdde.MC_Name = sr[10].ToString().Trim();
                    cddeList.Add(cdde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end

        log.endWrite("'cddeList':" + cddeList.ToString(), className, methodName);
        return cddeList;
    }
}