using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// HGOPLISThgSql 的摘要描述
/// </summary>
public class HGOPLISThgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static HGOPLISThgSql _instanct = new HGOPLISThgSql();
    public static HGOPLISThgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public HGOPLISThgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<webConsumptionOrderEntity> getWebConsumptionOrderList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<webConsumptionOrderEntity> wcoeList = new List<webConsumptionOrderEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            webConsumptionOrderEntity wcoe = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    wcoe = new webConsumptionOrderEntity();
                    wcoe.Auto_Id = sr[0].ToString().Trim();
                    wcoe.O_Id = sr[1].ToString().Trim();
                    wcoe.Name = sr[2].ToString().Trim();
                    wcoe.Tel = sr[3].ToString().Trim();
                    wcoe.EMail = sr[4].ToString().Trim();
                    wcoe.City = sr[5].ToString().Trim();
                    wcoe.Address = sr[6].ToString().Trim();
                    wcoe.Price = sr[7].ToString().Trim();
                    wcoe.Payway = sr[8].ToString().Trim();
                    wcoe.PayStatus = sr[9].ToString().Trim();
                    wcoe.P_id = sr[10].ToString().Trim();
                    wcoe.DPRD_Name = sr[11].ToString().Trim();
                    wcoe.Transaction_Time = sr[12].ToString().Trim();
                    wcoe.ch_tag = sr[13].ToString().Trim();
                    wcoe.MU_id = sr[14].ToString().Trim();
                    wcoe.Invoice_item = sr[15].ToString().Trim();
                    wcoe.InvoiceNumber = sr[16].ToString().Trim();
                    wcoe.LoveCode = sr[17].ToString().Trim();
                    wcoe.CustomerIdentifier = sr[18].ToString().Trim();
                    wcoe.CarruerNum = sr[19].ToString().Trim();
                    wcoe.MPRD_ID = sr[20].ToString().Trim();
                    wcoe.DPRD_ID = sr[21].ToString().Trim();

                    wcoeList.Add(wcoe);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'wcoeList':" + wcoeList.ToString(), className, methodName);
        return wcoeList;
    }

    public List<InvoiceDetailEntity> getWebElectronicInvoiceDetail(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<InvoiceDetailEntity> ideList = new List<InvoiceDetailEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            InvoiceDetailEntity ide = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    ide = new InvoiceDetailEntity();
 
                    ide.Transaction_Time = sr[0].ToString().Trim();
                    ide.InvoiceNumber = sr[1].ToString().Trim();
                    ide.O_Id = sr[2].ToString().Trim();
                    ide.Name = sr[3].ToString().Trim();
                    ide.Price = sr[4].ToString().Trim();
                    ideList.Add(ide);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'ideList':" + ideList.ToString(), className, methodName);
        return ideList;
    }
}