using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// MDEXChgSql 的摘要描述
/// </summary>
public class MDEXChgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MDEXChgSql _instanct = new MDEXChgSql();
    public static MDEXChgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MDEXChgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<compensatoryLeaveDetailEntity> getCompensatoryLeaveData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<compensatoryLeaveDetailEntity> cldeList = new List<compensatoryLeaveDetailEntity>();
        compensatoryLeaveDetailEntity clde = null;
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
                    clde = new compensatoryLeaveDetailEntity();
                    clde.DE_ID = sr[0].ToString().Trim();
                    clde.DE_Name = sr[1].ToString().Trim();
                    clde.DE_SDate = sr[2].ToString().Trim();
                    clde.DE_EDate = sr[3].ToString().Trim();
                    clde.DE_Ps = sr[4].ToString().Trim();
                    cldeList.Add(clde);
                }
            }
        }

        log.endWrite("'cldeList' : " + cldeList.ToString(), className, methodName);
        return cldeList;
    }


    public List<compensatoryLeaveDetailEntity> getCompensatoryLeave(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<compensatoryLeaveDetailEntity> cldeList = new List<compensatoryLeaveDetailEntity>();
        compensatoryLeaveDetailEntity clde = null;
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
                    clde = new compensatoryLeaveDetailEntity();
                    clde.DE_Day = sr[0].ToString().Trim();
                    clde.DE_Hour = sr[1].ToString().Trim();
                    cldeList.Add(clde);
                }
            }
        }

        log.endWrite("'cldeList' : " + cldeList.ToString(), className, methodName);
        return cldeList;
    }
}