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
public class WMediaHgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static WMediaHgSql _instanct = new WMediaHgSql();
    public static WMediaHgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public WMediaHgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }


    public List<MediaDataEntity> getMediaData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<MediaDataEntity> mdeList = new List<MediaDataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            MediaDataEntity mde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    mde = new MediaDataEntity();
                    mde.P_id = sr[0].ToString().Trim();
                    mde.hot_count = int.Parse(sr[1].ToString().Trim());

                    mdeList.Add(mde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end

        log.endWrite("'mdeList' :" + mdeList.ToString(), className, methodName);
        return mdeList;
    }
   
    public List<ClickDetailEntity> getClickDetail(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<ClickDetailEntity> cdeList = new List<ClickDetailEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            ClickDetailEntity cde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    cde = new ClickDetailEntity();
                    cde.V_id = sr[0].ToString().Trim();
                    cde.Title = sr[1].ToString().Trim();
                    cde.Date = sr[2].ToString().Trim();
                    cde.hot_count = sr[3].ToString().Trim();
                    cdeList.Add(cde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end

        log.endWrite("'cdeList' :" + cdeList.ToString(), className, methodName);
        return cdeList;
    }
}