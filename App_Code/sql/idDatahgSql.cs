using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// idCheckhgSql 的摘要描述
/// </summary>
public class idDatahgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static idDatahgSql _instanct = new idDatahgSql();
    public static idDatahgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public idDatahgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //idDataList
    public List<widupServiceEntity> getwidupServiceList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<widupServiceEntity> widupServiceList = new List<widupServiceEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            widupServiceEntity wse = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    /*
                    SELECT id, M_id, Name, Tel, IDCardNumber, ID_Img_Pos, ID_Img_Obv, ID_Status, City, County, Address, del_tag, add_date, Web_Mid FROM IDData
                    */

                    wse = new widupServiceEntity();
                    wse.id = sr[0].ToString().Trim();
                    wse.add_date = sr[1].ToString().Trim();
                    wse.ID_Status = sr[2].ToString().Trim();
                    wse.ID_Img_Pos = sr[3].ToString().Trim();
                    wse.ID_Img_Obv = sr[4].ToString().Trim();
                    wse.Name = sr[5].ToString().Trim();
                    wse.id=sr[6].ToString().Trim();
                    widupServiceList.Add(wse);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'widupServiceList':" + widupServiceList.ToString(), className, methodName);
        return widupServiceList;
    }
}