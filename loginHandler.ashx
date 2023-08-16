<%@ WebHandler Language="C#" Class="loginHandler" %>

using System;
using System.Web;
using System.IO;
using System.Data.SqlClient;
using System.Web.Configuration;

public class loginHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string u_Num = context.Request["U_Num"];
        string u_PWD = context.Request["U_PWD"];
        context.Response.Write(sqlSelect(u_Num, u_PWD));
    }




    public string sqlSelect (string u_Num, string u_PWD) {
        string password = string.Empty;
        string backString = string.Empty;
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlConnectHG_Test"].ToString()))
            {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "SELECT U_Pwd FROM [HG].[dbo].[MUSER] where U_Num = '"+u_Num+"' and del_tag = '0' and leavedate is null";
            using (SqlDataReader sr = cmd.ExecuteReader()) {
                while (sr.Read()) {
                    backString = sr[0].ToString();
                }
            }
        }

        if (!common.isEmpty(u_PWD))
        {
             if (u_PWD.Trim() == backString.Trim())
            {
                backString = "登入成功";
            }
            else
            {
                backString = "登入失敗";
            }
        }
        return backString;
    }
 public bool IsReusable {
        get {
            return false;
        }
    }

}