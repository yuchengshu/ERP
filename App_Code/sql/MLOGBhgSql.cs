using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// MLOGBhgSql 的摘要描述
/// </summary>
public class MLOGBhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MLOGBhgSql _instanct = new MLOGBhgSql();
    public static MLOGBhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MLOGBhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<editCustomerDataRecord> getCustomerDataEditRecord(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<editCustomerDataRecord> ecdrList = new List<editCustomerDataRecord>();
        editCustomerDataRecord ecdr = null;
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
                    ecdr = new editCustomerDataRecord();
                    ecdr.M_ID = sr[2].ToString().Trim();
                    ecdr.T_ID = sr[3].ToString().Trim();
                    ecdr.M_Row = sr[4].ToString().Trim();
                    ecdr.M_text = sr[5].ToString().Trim();
                    ecdr.edit_user = sr[7].ToString().Trim();
                    ecdr.edit_date = sr[8].ToString().Trim();
                    ecdrList.Add(ecdr);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'ecdrList' : " + ecdrList.ToString(), className, methodName);
        return ecdrList;
    }
}