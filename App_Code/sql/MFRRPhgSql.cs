using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;
using System.Data;

/// <summary>
/// MFRRPhgSql 的摘要描述
/// </summary>
public class MFRRPhgSql
{

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MFRRPhgSql _instanct = new MFRRPhgSql();
    public static MFRRPhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MFRRPhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<activityMessageEntity> getActivityMessageList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<activityMessageEntity> ameList = new List<activityMessageEntity>();
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
                    activityMessageEntity ame = new activityMessageEntity();
                    ame.MFP_id = sr[0].ToString().Trim();
                    ame.MFP_Name = sr[1].ToString().Trim();
                    ame.MP_Name = sr[2].ToString().Trim();
                    ame.add_date = sr[3].ToString().Trim();
                    ame.M_Tel = sr[4].ToString().Trim();
                    ame.MP_ID = sr[5].ToString().Trim();
                    ameList.Add(ame);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(ameList.ToString(), className, methodName);
        return ameList;
    }
   
    public List<ResourceDistributionEntity> getResourceDistribution(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<ResourceDistributionEntity> rdeList = new List<ResourceDistributionEntity>();
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            ResourceDistributionEntity rde = null;
            SqlDataAdapter da = new SqlDataAdapter(commandText, conn);
            da.SelectCommand = cmd;
            //DataTable dt = new DataTable();
            //DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter();
            
            adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
            adapter.SelectCommand.ExecuteNonQuery();
            da.SelectCommand.ExecuteNonQuery();
            da.Fill(ds);
            da.Fill(dt);//取出所有會場編號
            adapter.Fill(ds);
            adapter.Fill(dt);
            using (SqlDataReader sr = cmd.ExecuteReader())
            {

                while (sr.Read())
                {
                    rde = new ResourceDistributionEntity();
                    rde.Result_user = sr[0].ToString().Trim();
                    rde.ru = sr[1].ToString().Trim();
                    rdeList.Add(rde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'rdeList':"+rdeList.ToString(), className, methodName);
        return rdeList;
    }

   
    public List<ResourceDistributionDetailEntity> getResourceDistributionDetail(string connectionStrings, string commandText, string Result_userName)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<ResourceDistributionDetailEntity> rddeList = new List<ResourceDistributionDetailEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            ResourceDistributionDetailEntity rdde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    rdde = new ResourceDistributionDetailEntity();
                    rdde.MFP_Name = sr[0].ToString().Trim();
                    rdde.M_Tel = sr[1].ToString().Trim();
                    rdde.Result_userName = Result_userName;
                    rdde.Result_Date = sr[2].ToString().Trim();

                    rddeList.Add(rdde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'rddeList':" + rddeList.ToString(), className, methodName);
        return rddeList;
    }
}