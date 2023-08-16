using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// MSOUSEhgSql 的摘要描述
/// </summary>
public class MSOUSEhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MSOUSEhgSql _instanct = new MSOUSEhgSql();
    public static MSOUSEhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MSOUSEhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<WebMemberRegisteredActiveDetailEntity> getWebMemberRegisteredActiveDetail(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<WebMemberRegisteredActiveDetailEntity> wmradeList = new List<WebMemberRegisteredActiveDetailEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            WebMemberRegisteredActiveDetailEntity wmrade = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    wmrade = new WebMemberRegisteredActiveDetailEntity();
                   
                    wmrade.Sur_id = sr[0].ToString().Trim();
                    wmrade.website = "https://www.hwa-guan.com.tw/Auth/Register?source_id="+ wmrade.Sur_id;
                    wmrade.T_name = sr[1].ToString().Trim();
                    wmrade.T_Text = sr[2].ToString().Trim();
                    wmradeList.Add(wmrade);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'wmradeList' : " + wmradeList.ToString(), className, methodName);
        return wmradeList;
    }
}