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
public class idCheckhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static idCheckhgSql _instanct = new idCheckhgSql();
    public static idCheckhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public idCheckhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<idCheckEntity> getIdCheckList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<idCheckEntity> iceList = new List<idCheckEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            idCheckEntity ice = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    ice = new idCheckEntity();
                    ice.id = sr[0].ToString().Trim();
                    ice.Name = sr[1].ToString().Trim();
                    ice.Tel = sr[2].ToString().Trim();
                    ice.ID_Img_Pos = sr[3].ToString().Trim();
                    ice.ID_Img_Obv = sr[4].ToString().Trim();
                    ice.ID_Status = sr[5].ToString().Trim();
                    ice.add_date = sr[6].ToString().Trim();
                    ice.M_id = sr[7].ToString().Trim();
                    iceList.Add(ice);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'iceList':"+iceList.ToString(), className, methodName);
        return iceList;
    }

    internal List<widupServiceEntity> getwidupServiceList(string connectionStrings, string commandText)
    {
        throw new NotImplementedException();
    }
}