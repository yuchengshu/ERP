using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// MSGPThgSql 的摘要描述
/// </summary>
public class MSGPThgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MSGPThgSql _instanct = new MSGPThgSql();
    public static MSGPThgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MSGPThgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<publicMessageEntity> getPublicMessage(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<publicMessageEntity> pmeList = new List<publicMessageEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            publicMessageEntity pme = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    pme = new publicMessageEntity();
                    pme.auto_id = sr[0].ToString().Trim();
                    pme.Msg_Context = sr[1].ToString().Trim();
                    pmeList.Add(pme);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'pmeList' : " + pmeList.ToString(), className, methodName);
        return pmeList;
    }
}