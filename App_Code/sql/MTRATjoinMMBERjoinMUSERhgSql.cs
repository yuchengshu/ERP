using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// MTRATjoinMMBERjoinMUSERhgSql 的摘要描述
/// </summary>
public class MTRATjoinMMBERjoinMUSERhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MTRATjoinMMBERjoinMUSERhgSql _instanct = new MTRATjoinMMBERjoinMUSERhgSql();
    public static MTRATjoinMMBERjoinMUSERhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MTRATjoinMMBERjoinMUSERhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<detailPerformanceEntity> getDetailPerformanceTable(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<detailPerformanceEntity> dpeList = new List<detailPerformanceEntity>();
        detailPerformanceEntity dpe = null;
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
                    dpe = new detailPerformanceEntity();
                    dpe.T_ID = sr[0].ToString().Trim();
                    dpe.M_ID = sr[1].ToString().Trim();
                    dpe.MP = sr[2].ToString().Trim();
                    dpe.MP_Name = sr[3].ToString().Trim();
                    dpe.T_Item = sr[4].ToString().Trim();
                    dpe.T_PayMoney = sr[5].ToString().Trim();
                    dpe.T_AccountDate = sr[6].ToString().Trim();
                    dpe.mc = sr[7].ToString().Trim();
                    dpe.mc_name = sr[8].ToString().Trim();
                    dpe.mc_com = sr[9].ToString().Trim();
                    dpe.U_mdep = sr[10].ToString().Trim();
                    dpe.M_Num = sr[11].ToString().Trim();
                    dpe.M_Name = sr[12].ToString().Trim();
                    dpe.Pay_Type = sr[13].ToString().Trim();
                    dpe.Account_Money = sr[14].ToString().Trim();
                    dpe.T_Type = sr[15].ToString().Trim();
                    dpe.INV_open_Item = sr[16].ToString().Trim();
                    dpe.Light_Status = sr[17].ToString().Trim();
                    dpe.MTRATmc = sr[18].ToString().Trim();
                    dpe.MTRATmc_name = sr[19].ToString().Trim();
                    dpe.MTel1 = sr[20].ToString().Trim();
                    dpe.MMBERadd_Date = sr[21].ToString().Trim();
                    dpe.MTRATadd_Date = sr[22].ToString().Trim();
                    dpeList.Add(dpe);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'dpeList' : " + dpeList.ToString(), className, methodName);
        return dpeList;
    }

    public List<detailPerformanceEntity> getPerformanceForGetReportTransaction(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<detailPerformanceEntity> dpeList = new List<detailPerformanceEntity>();
        detailPerformanceEntity dpe = null;
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
                    dpe = new detailPerformanceEntity();
                    dpe.T_ID = sr[0].ToString().Trim();
                    dpe.M_ID = sr[1].ToString().Trim();
                    dpe.MP = sr[2].ToString().Trim();
                    dpe.MP_Name = sr[3].ToString().Trim();
                    dpe.T_Item = sr[4].ToString().Trim();
                    dpe.T_PayMoney = sr[5].ToString().Trim();
                    dpe.T_AccountDate = sr[6].ToString().Trim();
                    dpe.U_mdep = sr[7].ToString().Trim();
                    dpe.M_Num = sr[8].ToString().Trim();
                    dpe.M_Name = sr[9].ToString().Trim();
                    dpe.T_Type = sr[10].ToString().Trim();
                    dpe.INV_open_Item = sr[11].ToString().Trim();
                    dpe.Light_Status = sr[12].ToString().Trim();
                    dpe.MTRATmc = sr[13].ToString().Trim();
                    dpe.MTRATmc_name = sr[14].ToString().Trim();
                    dpe.MTel1 = sr[15].ToString().Trim();
                    dpe.MMBERadd_Date = sr[16].ToString().Trim();
                    dpe.MTRATadd_Date = sr[17].ToString().Trim();
                    dpeList.Add(dpe);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'dpeList' : " + dpeList.ToString(), className, methodName);
        return dpeList;
    }

    
}