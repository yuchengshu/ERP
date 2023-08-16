using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// IPRecordHgSql 的摘要描述
/// </summary>
public class IPRecordHgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static IPRecordHgSql _instanct = new IPRecordHgSql();
    public static IPRecordHgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public IPRecordHgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<WebsiteIPdetailEntity> getWebsiteIPdetail(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<WebsiteIPdetailEntity> wIPdeList = new List<WebsiteIPdetailEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            WebsiteIPdetailEntity wIPde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    wIPde = new WebsiteIPdetailEntity();
                    wIPde.Detail = sr[0].ToString().Trim();
                    wIPde.StartDate = sr[1].ToString().Trim();
                    wIPde.P_id = sr[2].ToString().Trim();
                    wIPdeList.Add(wIPde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'wIPdeList':" + wIPdeList.ToString(), className, methodName);
        return wIPdeList;
    }


    public List<MemberBrowseDataEntity> getMemberBrowseData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<MemberBrowseDataEntity> mbdeList = new List<MemberBrowseDataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            MemberBrowseDataEntity mbde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    mbde = new MemberBrowseDataEntity();
                    mbde.M_id = sr[0].ToString().Trim();
                    mbde.M_Ch = sr[1].ToString().Trim();
                    mbde.LoginTime = sr[2].ToString().Trim();
                    mbdeList.Add(mbde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'mbdeList':" + mbdeList.ToString(), className, methodName);
        return mbdeList;
    }

    public List<MemberBrowseDataEntity> getPersonBrowseData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<MemberBrowseDataEntity> mbdeList = new List<MemberBrowseDataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            MemberBrowseDataEntity mbde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    mbde = new MemberBrowseDataEntity();
                    mbde.M_id = sr[0].ToString().Trim();
                    mbde.M_Ch = sr[1].ToString().Trim();
                    mbde.LoginTime = sr[2].ToString().Trim();
                    mbde.Action = sr[3].ToString().Trim();
                    mbde.Detail = sr[4].ToString().Trim();
                    mbdeList.Add(mbde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'mbdeList':" + mbdeList.ToString(), className, methodName);
        return mbdeList;
    }
}