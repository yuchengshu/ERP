using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// MPCDDhgSql 的摘要描述
/// </summary>
public class MPCDDhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MPCDDhgSql _instanct = new MPCDDhgSql();
    public static MPCDDhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MPCDDhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<CDDDataEntity> getCDDlist(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<CDDDataEntity> cdddeList = new List<CDDDataEntity>();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            CDDDataEntity cdd = new CDDDataEntity() ;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {

                    cdd = new CDDDataEntity();
                    cdd.M_id = sr[0].ToString().Trim();
                    cdd.CDD_date = sr[1].ToString().Trim();
                    cdd.CDD_Status = sr[2].ToString().Trim();
                    cdd.MC = sr[3].ToString().Trim();
                    cdddeList.Add(cdd);
                }
            }
        }

        log.endWrite("'cdddeList' : " + cdddeList.ToString(), className, methodName);
        return cdddeList;
    }
}