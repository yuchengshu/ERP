using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// WMediaHgSql 的摘要描述
/// </summary>
public class WVideoHgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static WVideoHgSql _instanct = new WVideoHgSql();
    public static WVideoHgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public WVideoHgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }


    public List<VideoDataEntity> getVideoData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<VideoDataEntity> vdeList = new List<VideoDataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            VideoDataEntity vde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    vde = new VideoDataEntity();
                    vde.P_id = sr[0].ToString().Trim();
                    vde.hot_count = int.Parse(sr[1].ToString().Trim());

                    vdeList.Add(vde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end

        log.endWrite("'vdeList' :" + vdeList.ToString(), className, methodName);
        return vdeList;
    }
}