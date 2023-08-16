using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// WCritiqueHgSql 的摘要描述
/// </summary>
public class WCritiqueHgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static WCritiqueHgSql _instanct = new WCritiqueHgSql();
    public static WCritiqueHgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public WCritiqueHgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }


    public List<CritiqueDataEntity> getCritiqueData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<CritiqueDataEntity> cdeList = new List<CritiqueDataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            CritiqueDataEntity cde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    cde = new CritiqueDataEntity();
                    cde.P_id = sr[0].ToString().Trim();
                    cde.hot_count = int.Parse(sr[1].ToString().Trim());

                    cdeList.Add(cde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end

        log.endWrite("'cdeList' :" + cdeList.ToString(), className, methodName);
        return cdeList;
    }
}