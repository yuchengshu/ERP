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
public class MFUNTjoinMFMAPhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MFUNTjoinMFMAPhgSql _instanct = new MFUNTjoinMFMAPhgSql();
    public static MFUNTjoinMFMAPhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MFUNTjoinMFMAPhgSql()
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
                    cae.auto_id = sr[0].ToString().Trim();//序
                    cae.info_id = sr[1].ToString().Trim();//代碼
                    cae.Info_Name = sr[2].ToString().Trim();//單元名稱
                    cae.per_open = sr[4].ToString().Trim();//開放權限
                    //cae.U_Num = sr[3].ToString().Trim();
                    //cae.U_Name = sr[4].ToString().Trim();
                    //cae.Info_Name = sr[5].ToString().Trim();
                    caeList.Add(cae);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(caeList.ToString(), className, methodName);
        return caeList;
    }
}