using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// noticeBoardSql 的摘要描述
/// </summary>
public class noSelectSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static noSelectSql _instanct = new noSelectSql();
    public static noSelectSql Instance
    {
        get
        {
            return _instanct;
        }
    }

    public noSelectSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    /// <summary>
    /// 執行doNoneSelectSql的sql命令
    /// </summary>
    /// <param name="connectionStrings">連線字串</param>
    /// <param name="commandText">執行命令</param>
    public String doNoneSelectSql(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        string backString = "成功";
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            int i=cmd.ExecuteNonQuery();
        }
        log.endWrite("'backString' : "+ backString, className, methodName);
        return backString;
    }


    public void doLongTag(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            cmd.ExecuteNonQuery();
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(common.nothing, className, methodName);
    }



}