using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// masterPageSql 的摘要描述
/// </summary>
public class UploadFilehgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static UploadFilehgSql _instanct = new UploadFilehgSql();
    public static UploadFilehgSql Instance
    {
        get
        {
            return _instanct;
        }
    }

    public UploadFilehgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

   


    public List<uploadFileEntity> getUploadFile(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<uploadFileEntity> ufeList = new List<uploadFileEntity>();
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
                    uploadFileEntity ufe = new uploadFileEntity();
                    ufe.F_ID = sr[0].ToString().Trim();
                    ufe.File_Folder = sr[1].ToString().Trim();
                    ufe.File_num = sr[2].ToString().Trim();
                    ufe.File_Title = sr[3].ToString().Trim();
                    ufe.File_Name = sr[4].ToString().Trim();
                    ufe.add_user = sr[6].ToString();
                    ufe.add_date = sr[7].ToString();

                    ufeList.Add(ufe);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(ufeList.ToString(), className, methodName);
        return ufeList;
    }

    public uploadFileEntity getUpLoadData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        uploadFileEntity ufe = new uploadFileEntity();
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
                    ufe.F_ID = sr[0].ToString().Trim();
                    ufe.File_Folder = sr[1].ToString().Trim();
                    ufe.File_num = sr[2].ToString().Trim();
                    ufe.File_Title = sr[3].ToString().Trim();
                    ufe.File_Name = sr[4].ToString().Trim();
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'ufe' :"+ufe.ToString(), className, methodName);
        return ufe;
    }

        public List<uploadFileEntity> getFileDataList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<uploadFileEntity> ufeList = new List<uploadFileEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            uploadFileEntity ufe = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    ufe = new uploadFileEntity();
                    ufe.F_ID = sr[0].ToString().Trim();
                    ufe.File_Folder = sr[1].ToString().Trim();
                    ufe.File_num = sr[2].ToString().Trim();
                    ufe.File_Title = sr[3].ToString().Trim();
                    ufe.File_Name = sr[4].ToString().Trim();
                    ufeList.Add(ufe);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'ufeList' :" + ufeList.ToString(), className, methodName);
        return ufeList;
    }
}