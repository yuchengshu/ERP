using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// wAnalystshgSql 的摘要描述
/// </summary>
public class wAnalystshgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static wAnalystshgSql _instanct = new wAnalystshgSql();
    public static wAnalystshgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public wAnalystshgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<wAnalystEntity> getWAnalysts(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<wAnalystEntity> wAnalystList = new List<wAnalystEntity>();

        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            wAnalystEntity wae = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    wae = new wAnalystEntity();
                    wae.T_id = sr[0].ToString().Trim();
                    wae.Ch = sr[1].ToString().Trim();
                    wae.U_Num = sr[2].ToString().Trim();
                    wAnalystList.Add(wae);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'wAnalystList' : " + wAnalystList.ToString(), className, methodName);
        return wAnalystList;
    }
}