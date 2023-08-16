using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// MCASHhgSql 的摘要描述
/// </summary>
public class MCASHhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MCASHhgSql _instanct = new MCASHhgSql();
    public static MCASHhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MCASHhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string getBackTagLink(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        string back = string.Empty;
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            noticeBoardEntity nbe = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    back = sr[0].ToString().Trim();
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(back.ToString(), className, methodName);
        return back;
    }

    public List<appointDataEntity> getAppointData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<appointDataEntity> adeList = new List<appointDataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            appointDataEntity ade = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                   
                    ade = new appointDataEntity();
                    ade.C_name = sr[0].ToString().Trim();
                    ade.P_Name = sr[1].ToString().Trim();
                    ade.Price = sr[2].ToString().Trim();
                    ade.T_Sdate = sr[3].ToString().Trim();
                    ade.T_Edate = sr[4].ToString().Trim();
                    ade.Pay_Serial = sr[5].ToString().Trim();
                    ade.ca_id = sr[6].ToString().Trim();
                    adeList.Add(ade);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'adeList' :"+adeList.ToString(), className, methodName);
        return adeList;
    }
}