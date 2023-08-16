using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// GDINVOhgSql 的摘要描述
/// </summary>
public class GDINVOhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static GDINVOhgSql _instanct = new GDINVOhgSql();
    public static GDINVOhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public GDINVOhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<invNumEntity> getInvNumList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<invNumEntity> ineList = new List<invNumEntity>();

        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            invNumEntity ine = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    ine = new invNumEntity();
                    ine.T_id = sr[0].ToString().Trim();
                    ine.Inv_num = sr[1].ToString().Trim();
                   
                    ineList.Add(ine);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'ineList':"+ineList.ToString(), className, methodName);
        return ineList;
    }


    public string getInvNumByTid(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        string backStr = string.Empty;

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
                   
                    backStr = sr[0].ToString().Trim();
                   
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'backStr':" + backStr, className, methodName);
        return backStr;
    }



    
}