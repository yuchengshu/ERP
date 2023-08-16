using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// WProgramjoinWAnalystsHgSql 的摘要描述
/// </summary>
public class WProgramjoinWAnalystsHgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static WProgramjoinWAnalystsHgSql _instanct = new WProgramjoinWAnalystsHgSql();
    public static WProgramjoinWAnalystsHgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public WProgramjoinWAnalystsHgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
  
    public List<ProgramEntity> getProgram(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<ProgramEntity> peList = new List<ProgramEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            ProgramEntity pe = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    pe = new ProgramEntity();
                    pe.P_Channel = sr[0].ToString().Trim();
                    pe.P_Time = sr[1].ToString().Trim();
                    pe.P_Date = sr[2].ToString().Trim();
                    pe.U_num = sr[3].ToString().Trim();
                    pe.P_ID = sr[4].ToString().Trim();
                    peList.Add(pe);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end

        log.endWrite("'peList' :" + peList.ToString(), className, methodName);
        return peList;
    }
}