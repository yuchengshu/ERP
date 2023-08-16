using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// MTRATjoinDTRAThgSql 的摘要描述
/// </summary>
public class MTRATjoinDTRAThgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MTRATjoinDTRAThgSql _instanct = new MTRATjoinDTRAThgSql();
    public static MTRATjoinDTRAThgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MTRATjoinDTRAThgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<paymentDataEntity> getPaymentData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        
        List<paymentDataEntity> pdeList = new List<paymentDataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            paymentDataEntity pde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    pde = new paymentDataEntity();
                    pde.T_ID = sr[0].ToString().Trim();
                    pde.Pay_Type = sr[1].ToString().Trim();
                    pde.T_type = sr[2].ToString().Trim();
                    pde.Account_Money = sr[3].ToString().Trim();
                    pde.T_AccountDate = sr[4].ToString().Trim();
                    pde.T_Item = sr[5].ToString().Trim();
                    pde.MP = sr[6].ToString().Trim();
                    pde.MP_Name = sr[7].ToString().Trim();
                    pde.MC = sr[8].ToString().Trim();
                    pde.MC_Name = sr[9].ToString().Trim();
                    pde.Light_Status = sr[10].ToString().Trim();
                    pde.Pay_tag = sr[11].ToString().Trim();
                    pde.MTRATmc = sr[12].ToString().Trim();
                    pdeList.Add(pde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end

        log.endWrite("'pdeList' :"+pdeList.ToString(), className, methodName);
        return pdeList;
    }


    public string getAnalystTotalMembershipFeeIncome(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        string backString = string.Empty;
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
                    backString = sr[0].ToString().Trim();
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'backString' :" + backString, className, methodName);
        return backString;
    }

    public List<string> getMCcustomerData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<string> strList = new List<string>();
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
                    strList.Add(sr[0].ToString().Trim());
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'strList' :" + strList.ToString(), className, methodName);
        return strList;
    }
  
    public List<analystSinglePerformanceEntity> getAnalystSinglePerformance(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<analystSinglePerformanceEntity> aspeList = new List<analystSinglePerformanceEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            analystSinglePerformanceEntity aspe = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    aspe = new analystSinglePerformanceEntity();

                    aspe.Light_Status = sr[0].ToString().Trim();
                    aspe.T_AccountDate = sr[1].ToString().Trim();
                    aspe.M_ID = sr[2].ToString().Trim();
                    aspe.T_Item = sr[3].ToString().Trim();
                    aspe.T_PayMoney = sr[4].ToString().Trim();
                    aspe.DT_ID = sr[5].ToString().Trim();
                    aspe.T_ID = sr[6].ToString().Trim();
                    aspe.T_StartDate = sr[7].ToString().Trim();
                    aspe.T_EndDate = sr[8].ToString().Trim();
                    aspe.T_Type = sr[9].ToString().Trim();
                    aspeList.Add(aspe);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end

        log.endWrite("'aspeList' :" + aspeList.ToString(), className, methodName);
        return aspeList;
    }


    public List<AccountMoneyDataEntity> getAccountMoneyData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<AccountMoneyDataEntity> amdeList = new List<AccountMoneyDataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            AccountMoneyDataEntity amde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    amde = new AccountMoneyDataEntity();
                    amde.Account_Money = sr[0].ToString().Trim();
                    amde.Pay_Type = sr[1].ToString().Trim();
                    amde.T_type = sr[2].ToString().Trim();

                    amdeList.Add(amde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end

        log.endWrite("'amdeList' :" + amdeList.ToString(), className, methodName);
        return amdeList;
    }
 
       
    public List<paymentDataEntity> getVenuePerformanceForMC(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<paymentDataEntity> pdeList = new List<paymentDataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            paymentDataEntity pde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    pde = new paymentDataEntity();
  
                    pde.M_ID = sr[0].ToString().Trim();
                    pde.MP_Name = sr[1].ToString().Trim();
                    pde.MP = sr[2].ToString().Trim();
                    pde.T_Item = sr[3].ToString().Trim();
                    pde.T_PayMoney = sr[4].ToString().Trim();
                    pde.Pay_tag = sr[5].ToString().Trim();
                    pde.Account_Money = sr[6].ToString().Trim();
                    pde.Pay_Type = sr[7].ToString().Trim();
                    pde.mca = sr[8].ToString().Trim();
                    pde.MC = sr[9].ToString().Trim();
                    pde.MC_Name = sr[10].ToString().Trim();
                    pde.T_AccountDate = sr[11].ToString().Trim();
                    pde.T_ID = sr[12].ToString().Trim();
                    pde.V_ID = sr[13].ToString().Trim();

           
                    pdeList.Add(pde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end

        log.endWrite("'pdeList' :" + pdeList.ToString(), className, methodName);
        return pdeList;
    }

    public List<AccountMoneyDataEntity> getPerMonthRevenue(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<AccountMoneyDataEntity> amdeList = new List<AccountMoneyDataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            AccountMoneyDataEntity amde = null;
            string[] temp = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    amde = new AccountMoneyDataEntity();
                    amde.Account_Money = sr[0].ToString().Trim();
                    amde.Pay_Type = sr[1].ToString().Trim();
                    amde.T_type = sr[2].ToString().Trim();
                    temp = sr[3].ToString().Trim().Split(' ')[0].Split('/');
                    amde.T_AccountDate = temp[0]+"/"+ temp[1];
                    amde.mc_com = sr[4].ToString().Trim();

                    amdeList.Add(amde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end

        log.endWrite("'amdeList' :" + amdeList.ToString(), className, methodName);
        return amdeList;
    }

   
    public List<AccountMoneyDataEntity> getAnalystPerformanceForCP(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<AccountMoneyDataEntity> amdeList = new List<AccountMoneyDataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            AccountMoneyDataEntity amde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    amde = new AccountMoneyDataEntity();
                    amde.Account_Money = sr[0].ToString().Trim();
                    amde.Pay_Type = sr[1].ToString().Trim();
                    amde.T_type = sr[2].ToString().Trim();
                    amde.MP = sr[3].ToString().Trim();
                    amde.mc_com = sr[4].ToString().Trim();
                    amdeList.Add(amde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end

        log.endWrite("'amdeList' :" + amdeList.ToString(), className, methodName);
        return amdeList;
    }

}