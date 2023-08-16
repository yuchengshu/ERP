using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// MCONThgSql 的摘要描述
/// </summary>
public class MCONThgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MCONThgSql _instanct = new MCONThgSql();
    public static MCONThgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MCONThgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";
    public string GetU_NameByU_Num(string U_Num)
    {
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            string commandText= "SELECT [U_Name] FROM[HG].[dbo].[MUSER] where U_Num = '"+ U_Num + "'";
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            remindProgramContractMaturityEntity rpcme = new remindProgramContractMaturityEntity();
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    
                    rpcme.CE_Date = sr[0].ToString().Trim();
                    //rpcme.CN_Channel = sr[1].ToString().Trim();
                    //rpcme.CN_Time = sr[2].ToString().Trim();
                    //rpcme.CN_NameS = sr[3].ToString().Trim() + sr[4].ToString().Trim();//大頭+小頭
                    //rpcme.CN_Teacher = sr[5].ToString().Trim();//D9907161
                    //rpcme.CN_Teacher = sr[5].ToString().Trim();
                    
                }
            }
            return rpcme.CE_Date;
        }
    }
    public List<remindProgramContractMaturityEntity> getRemindProgramContractMaturity(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<remindProgramContractMaturityEntity> rpcmeList = new List<remindProgramContractMaturityEntity>();
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
                    remindProgramContractMaturityEntity rpcme = new remindProgramContractMaturityEntity();
                    rpcme.CE_Date = sr[0].ToString().Trim();
                    rpcme.CN_Channel = sr[1].ToString().Trim();
                    rpcme.CN_Time = sr[2].ToString().Trim();
                    rpcme.CN_NameS = sr[3].ToString().Trim() + sr[4].ToString().Trim();//大頭+小頭
                    rpcme.CN_Teacher = sr[5].ToString().Trim();//D9907161
                    rpcme.CN_Teacher = GetU_NameByU_Num(rpcme.CN_Teacher);
                    //rpcme.CN_Teacher = sr[5].ToString().Trim();
                    rpcmeList.Add(rpcme);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(rpcmeList.ToString(), className, methodName);
        return rpcmeList;
    }

    public List<remindProgramContractMaturityEntity> getProgramCost(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<remindProgramContractMaturityEntity> rpcmeList = new List<remindProgramContractMaturityEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            remindProgramContractMaturityEntity rpcme = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    rpcme = new remindProgramContractMaturityEntity();
                    rpcme.CN_MPrice = sr[0].ToString().Trim();
                    rpcme.CN_Teacher = sr[1].ToString().Trim();
                   
                    rpcmeList.Add(rpcme);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(rpcmeList.ToString(), className, methodName);
        return rpcmeList;
    }

    public string getMonthCost(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        string backStr = string.Empty;
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
                    backStr = sr[0].ToString().Trim();
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("結果--'backStr' : "+backStr, className, methodName);
        return backStr;
    }
}