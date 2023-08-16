using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// OPLIST_NEWezDiamondSql 的摘要描述
/// </summary>
public class OPLIST_NEWezDiamondSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static OPLIST_NEWezDiamondSql _instanct = new OPLIST_NEWezDiamondSql();
    public static OPLIST_NEWezDiamondSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public OPLIST_NEWezDiamondSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<easySchoolOrderEntity> getEasySchoolOrderList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<easySchoolOrderEntity> esoeList = new List<easySchoolOrderEntity>();

        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            easySchoolOrderEntity esoe = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    esoe = new easySchoolOrderEntity();
                    esoe.Auto_Id = sr[0].ToString().Trim();
                    esoe.O_Id = sr[1].ToString().Trim();
                    esoe.U_Name = sr[2].ToString().Trim();
                    esoe.Tel = sr[3].ToString().Trim();
                    esoe.EMail = sr[4].ToString().Trim();
                    esoe.Price = sr[5].ToString().Trim();
                    esoe.Invoice = sr[6].ToString().Trim();
                    esoe.Invoice_Com = sr[7].ToString().Trim();
                    esoe.Payway = sr[8].ToString().Trim();
                    esoe.Invoice_Vat = sr[9].ToString().Trim();
                    esoe.PayStatus = sr[10].ToString().Trim();
                    esoe.Add_Date = sr[11].ToString().Trim();
                    esoe.ch_tag = sr[12].ToString().Trim();
                    esoe.MU_PW = sr[13].ToString().Trim();
                    esoe.P_Name = sr[14].ToString().Trim();
                    esoe.MPRD_ID = sr[15].ToString().Trim();
                    esoe.d_price = sr[16].ToString().Trim();
                    esoe.Quantity = sr[17].ToString().Trim();
                    esoe.InvoiceNumber = sr[18].ToString().Trim();
                    esoe.Invoice_item = sr[19].ToString().Trim();
                    esoe.CarruerNum = sr[20].ToString().Trim();
                    esoe.CustomerIdentifier = sr[21].ToString().Trim();
                    esoe.LoveCode = sr[22].ToString().Trim();
                    esoe.P_EDate = sr[23].ToString().Trim();
                    esoe.T_id = sr[24].ToString().Trim();
                    esoe.OD_id = sr[25].ToString().Trim();

               
                    esoeList.Add(esoe);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'esoeList' : " + esoeList.ToString(), className, methodName);
        return esoeList;
    }
}