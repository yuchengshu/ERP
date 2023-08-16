using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// MMSGEhgSql 的摘要描述
/// </summary>
public class MMSGEhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MMSGEhgSql _instanct = new MMSGEhgSql();
    public static MMSGEhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MMSGEhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<callMassageEntity> getCallMassage(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<callMassageEntity> cmeList = new List<callMassageEntity>();
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
                    callMassageEntity cme = new callMassageEntity();
                    cme.MP = sr[1].ToString().Trim();
                    cme.MP_Item = sr[3].ToString().Trim();
                    cme.msg_text = sr[6].ToString().Trim();
                    cme.add_Date = sr[10].ToString().Trim();
                    cmeList.Add(cme);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(cmeList.ToString(), className, methodName);
        return cmeList;
    }


    public List<callMassageEntity> getMessageList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<callMassageEntity> cmeList = new List<callMassageEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            callMassageEntity cme = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    cme = new callMassageEntity();
                    cme.msg_id = sr[0].ToString().Trim();
                    cme.MP = sr[1].ToString().Trim();
                    cme.MP_Item = sr[2].ToString().Trim();
                    cme.MS_Tel = sr[3].ToString().Trim();
                    cme.MS_TStatus = sr[4].ToString().Trim();
                    cme.msg_text = sr[5].ToString().Trim();
                    cme.add_user = sr[6].ToString().Trim();
                    cme.add_Date = sr[7].ToString().Trim();
                    cmeList.Add(cme);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(cmeList.ToString(), className, methodName);
        return cmeList;
    }


    public List<callMassageEntity> getMitemCount(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<callMassageEntity> cmeList = new List<callMassageEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            callMassageEntity cme = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    cme = new callMassageEntity();
                    cme.MP = sr[0].ToString().Trim();
                    cme.MP_Item = sr[1].ToString().Trim();
                    cmeList.Add(cme);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(cmeList.ToString(), className, methodName);
        return cmeList;
    }

}