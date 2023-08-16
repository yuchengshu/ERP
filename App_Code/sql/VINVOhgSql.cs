using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// VINVOhgSql 的摘要描述
/// </summary>
public class VINVOhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static VINVOhgSql _instanct = new VINVOhgSql();
    public static VINVOhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public VINVOhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<tbdInvoiceEntity> getTbdInvoice(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<tbdInvoiceEntity> tieList = new List<tbdInvoiceEntity>();

        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            tbdInvoiceEntity tie = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    tie = new tbdInvoiceEntity();
                    tie.M_ID = sr[0].ToString().Trim();
                    tie.M_Name = sr[1].ToString().Trim();
                    tie.T_ID = sr[2].ToString().Trim();
                    tie.INV_Createdate = sr[3].ToString().Trim();
                    tie.MP = sr[4].ToString().Trim();
                    tie.T_Item = sr[5].ToString().Trim();
                    tie.T_PayMoney = sr[6].ToString().Trim();
                    tie.INV_Item = sr[7].ToString().Trim();
                    tie.INV_ComName = sr[8].ToString().Trim();
                    tie.INV_UnifyNum = sr[9].ToString().Trim();
                    tie.INV_SendState = sr[10].ToString().Trim();
                    tie.MT_COM = sr[11].ToString().Trim();
                    tieList.Add(tie);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'tieList' : " + tieList.ToString(), className, methodName);
        return tieList;
    }


    public tbdInvoiceEntity getTbdInvoiceByTid(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        tbdInvoiceEntity tie = null;
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
                    tie = new tbdInvoiceEntity();
                    tie.M_ID = sr[0].ToString().Trim();
                    tie.M_Name = sr[1].ToString().Trim();
                    tie.T_ID = sr[2].ToString().Trim();
                    tie.INV_Createdate = sr[3].ToString().Trim();
                    tie.MP = sr[4].ToString().Trim();
                    tie.T_Item = sr[5].ToString().Trim();
                    tie.T_PayMoney = sr[6].ToString().Trim();
                    tie.INV_Item = sr[7].ToString().Trim();
                    tie.INV_ComName = sr[8].ToString().Trim();
                    tie.INV_UnifyNum = sr[9].ToString().Trim();
                    tie.INV_SendState = sr[10].ToString().Trim();
                    tie.MT_COM = sr[11].ToString().Trim();
                    tie.HCity = sr[12].ToString().Trim();
                    tie.HTown = sr[13].ToString().Trim();
                    tie.HZipCode = sr[14].ToString().Trim();
                    tie.H_Address = sr[15].ToString().Trim();
                    tie.MTel1 = sr[16].ToString().Trim();
                    tie.EMail = sr[17].ToString().Trim();
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'tieList' : " + tie.ToString(), className, methodName);
        return tie;
    }



    
}