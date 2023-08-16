using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// MFMAPjoinMFUNThgSql 的摘要描述
/// </summary>
public class MFMAPjoinMFUNThgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MFMAPjoinMFUNThgSql _instanct = new MFMAPjoinMFUNThgSql();
    public static MFMAPjoinMFUNThgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MFMAPjoinMFUNThgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<contentAuthorityEntity> searchContentAuthority(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<contentAuthorityEntity> caeList = new List<contentAuthorityEntity>();
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
                    contentAuthorityEntity cae = new contentAuthorityEntity();
                    cae.link_page = sr[0].ToString().Trim();
                    cae.info_id = sr[1].ToString().Trim();
                    cae.MF_id = sr[2].ToString().Trim();
                    cae.U_Num = sr[3].ToString().Trim();
                    cae.U_Name = sr[4].ToString().Trim();
                    cae.Info_Name = sr[5].ToString().Trim();
                    caeList.Add(cae);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(caeList.ToString(), className, methodName);
        return caeList;
    }
}