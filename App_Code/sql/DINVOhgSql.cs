using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// DINVOhgSql 的摘要描述
/// </summary>
public class DINVOhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static DINVOhgSql _instanct = new DINVOhgSql();
    public static DINVOhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public DINVOhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public invoiceEntity getInvoiceData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        invoiceEntity ie = new invoiceEntity();
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
                    ie.Invoice_CreateDate = sr[0].ToString().Trim();
                    ie.invoice_num = sr[1].ToString().Trim();
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(ie.ToString(), className, methodName);
        return ie;
    }


    public List<ElectronicCalculatorInvoiceDetailEntity> getElectronicCalculatorInvoiceDetail(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<ElectronicCalculatorInvoiceDetailEntity> ecideList = new List<ElectronicCalculatorInvoiceDetailEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            ElectronicCalculatorInvoiceDetailEntity ecide = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    ecide = new ElectronicCalculatorInvoiceDetailEntity();
                    ecide.M_id = sr[0].ToString().Trim();
                    ecide.T_id = sr[1].ToString().Trim();
                    ecide.Invoice_ARMame = sr[2].ToString().Trim();
                    ecide.Invoice_PayAmount = sr[3].ToString().Trim();
                    ecide.Invoice_CreateDate = sr[4].ToString().Trim();
                    ecide.Invoice_Num = sr[5].ToString().Trim();
                    ecide.Invoice_Item = sr[6].ToString().Trim();
                    ecide.Invoice_State = sr[7].ToString().Trim();
                    ecide.Invoice_ComName = sr[8].ToString().Trim();
                    ecide.Invoice_UnifyNum = sr[9].ToString().Trim();
                    ecide.Invoice_PName = sr[10].ToString().Trim();
                    ecideList.Add(ecide);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'ecideList' :"+ ecideList.ToString(), className, methodName);
        return ecideList;
    }
}