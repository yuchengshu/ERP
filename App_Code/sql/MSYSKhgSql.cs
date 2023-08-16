using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// MSYSKhgSql 的摘要描述
/// </summary>
public class MSYSKhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MSYSKhgSql _instanct = new MSYSKhgSql();
    public static MSYSKhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MSYSKhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<MSYSKentity> getOItable(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<MSYSKentity> meList = new List<MSYSKentity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            MSYSKentity me = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    me = new MSYSKentity();
                    me.MF_ID = sr[0].ToString().Trim();
                    me.MP = sr[1].ToString().Trim();
                    meList.Add(me);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'meList' : " + meList.ToString(), className, methodName);
        return meList;
    }

    public List<SRMSYSKentity> getSRMSYSKList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<SRMSYSKentity> meList = new List<SRMSYSKentity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            SRMSYSKentity me = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    me = new SRMSYSKentity();
                    me.U_Name = sr[0].ToString().Trim();
                    me.File_Title = sr[1].ToString().Trim();
                    me.File_name = sr[2].ToString().Trim();
                    me.File_num=sr[3].ToString().Trim();
                    me.MF_ID=sr[4].ToString().Trim();
                    me.add_date = sr[5].ToString();
                    me.File_Path=sr[6].ToString().Trim();
                    meList.Add(me);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'meList' : " + meList.ToString(), className, methodName);
        return meList;
    }
}