using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// HGMEMBERhgSql 的摘要描述
/// </summary>
public class HGMEMBERhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static HGMEMBERhgSql _instanct = new HGMEMBERhgSql();
    public static HGMEMBERhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public HGMEMBERhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string getMid(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));

        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        string backStr = string.Empty;
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
                    backStr = sr[0].ToString();
                }
            }
        }

        log.endWrite("'backStr' : " + backStr, className, methodName);
        return backStr;
    }


    public List<string> getAllSourceID(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));

        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<string> strList = new List<string>();
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
                    strList.Add(sr[0].ToString());
                }
            }
        }

        log.endWrite("'strList' : " + strList, className, methodName);
        return strList;
    }
   
    public List<hgmemberEntity> getAnalystActiveDetail(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));

        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<hgmemberEntity> hbeList = new List<hgmemberEntity>();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            hgmemberEntity he = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    he = new hgmemberEntity();
                    he.M_Ch = sr[0].ToString().Trim();
                    he.Tel = sr[1].ToString().Trim();
                    he.add_date = sr[2].ToString().Trim();
                    hbeList.Add(he);
                }
            }
        }

        log.endWrite("'hbeList' : " + hbeList, className, methodName);
        return hbeList;
    }

    public List<hgmemberEntity> getAllMidandTel(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));

        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<hgmemberEntity> hbeList = new List<hgmemberEntity>();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            hgmemberEntity he = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    he = new hgmemberEntity();
                    he.M_id = sr[0].ToString().Trim();
                    he.Tel = sr[1].ToString().Trim();
                    hbeList.Add(he);
                }
            }
        }

        log.endWrite("'hbeList' : " + hbeList.ToString(), className, methodName);
        return hbeList;
    }
}