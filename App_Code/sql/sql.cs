using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net;
using System.Text;

/// <summary>
/// sql 的摘要描述
/// </summary>
public class sql
{
    public sql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    private static sql _instanct = new sql();
    public static sql Instance
    {
        get
        {
            return _instanct;
        }
    }

    /// <summary>
    /// 處理sql連線並執行command字串
    /// </summary>
    /// <param name="connectionStrings">連線字串</param>
    /// <param name="commandText">sql執行字串</param>
    /// <param name="commandType">sql執行的項目</param>
    /// <param name="fromPage">來自的頁面名稱</param>
    /// <returns>回傳字串</returns>
    public string sqlReturnString(string connectionStrings, string commandText, string commandType , string fromPage)
    {
        string backString = string.Empty;
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;

            //判斷來自哪個頁面訊息
            switch (fromPage)
            {
                //masterPage
                case "masterPage":

                    //判斷執行何種項目
                    switch (commandType)
                    {
                        case "nonSelect":
                            cmd.ExecuteNonQuery();
                            break;

                       
                    }
                    break;

                //首頁
                case "index":

                    //判斷執行何種項目
                    switch (commandType)
                    {
                        case "selectEmpBDlist":

                            using (SqlDataReader sr = cmd.ExecuteReader())
                            {
                                while (sr.Read())
                                {
                                    backString = sr[0].ToString();
                                }
                            }
                            break;
                    }
                    break;
            }
        }
        return backString;
    }




   


    public List<indexBDdataEntity> sqlReturnIndexBDdataEntityList(string connectionStrings, string commandText)
    {
        List<indexBDdataEntity> ibddeList = new List<indexBDdataEntity>();
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
                    indexBDdataEntity ibddE = new indexBDdataEntity();
                    ibddE.empName = sr[0].ToString().Trim();
                    ibddE.empBD= sr[1].ToString().Trim();
                    ibddeList.Add(ibddE);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        return ibddeList;
    }
}