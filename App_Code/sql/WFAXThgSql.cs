using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// WFAXThgSql 的摘要描述
/// </summary>
public class WFAXThgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static WFAXThgSql _instanct = new WFAXThgSql();
    public static WFAXThgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public WFAXThgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<closingPriceThreeBigDataEntity> getClosingPriceThreeBigData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<closingPriceThreeBigDataEntity> cptbdeList = new List<closingPriceThreeBigDataEntity>();

        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            closingPriceThreeBigDataEntity cptbde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    cptbde = new closingPriceThreeBigDataEntity();
                    cptbde.WFT_id = sr[0].ToString().Trim();
                    cptbde.WFT_date = sr[1].ToString().Trim();
                    cptbde.WFT_TSE_T1 = sr[2].ToString().Trim();
                    cptbde.WFT_TSE_T2 = sr[3].ToString().Trim();
                    cptbde.WFT_TSE_T3 = sr[4].ToString().Trim();
                    cptbde.WFT_OTC_T1 = sr[5].ToString().Trim();
                    cptbde.WFT_OTC_T2 = sr[6].ToString().Trim();
                    cptbde.WFT_OTC_T3 = sr[7].ToString().Trim();
                    cptbde.WFT_II_T1 = sr[8].ToString().Trim();
                    cptbde.WFT_II_T2 = sr[9].ToString().Trim();
                    cptbde.WFT_II_T3 = sr[10].ToString().Trim();
                    cptbde.WFT_II_T4 = sr[11].ToString().Trim();
                    cptbdeList.Add(cptbde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'cptbdeList' : " + cptbdeList.ToString(), className, methodName);
        return cptbdeList;
    }
}