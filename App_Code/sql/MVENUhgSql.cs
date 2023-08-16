using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;
using System.Data;
using System.Globalization;

/// <summary>
/// MVENUhgSql 的摘要描述
/// </summary>
public class MVENUhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MVENUhgSql _instanct = new MVENUhgSql();
    public static MVENUhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MVENUhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<venueDataEntity> getVenueDataList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<venueDataEntity> vdeList = new List<venueDataEntity>();

        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            venueDataEntity vde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    vde = new venueDataEntity();
                    vde.V_ID = sr[0].ToString().Trim();
                    vde.V_Date = sr[1].ToString().Trim();
                    vde.MP_Name = sr[2].ToString().Trim();
                    vde.V_Site = sr[3].ToString().Trim();
                    vdeList.Add(vde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'vdeList' : " + vdeList.ToString(), className, methodName);
        return vdeList;
    }
    //20220428加入日期條件!!
    public List<SRMVENUEntity> getSRMVENUList(string connectionStrings_, string commandText, string StartDate, string EndDate)
    {
        //取得所有會場編號(VID)
        string commandText_GETALLVID = "SELECT distinct d.V_ID, d.V_Date,d.V_Site,d.MP_Name,d.V_ID,d.del_tag FROM [dbo].[MVENU] d where d.del_tag=0";
        //V_Date
        //從資料庫把資料撈出來*************************************************************************************************start
        string connectionStrings = "sqlConnectHG_Test_TEST";
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText_GETALLVID;
            DataTable dt = new DataTable();
            conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
            conn.Open();
            //SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            //cmd.CommandText = tsql;
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);//取出所有會場編號
            int V_ID_Count = dt.Rows.Count;
            conn.Close();
            List<SRMVENUEntity> SRMVENUEntityList = new List<SRMVENUEntity>();
            string sql = "";
            //for (int i = 0; i < V_ID_Count; i++)
            //{
            //    string V_ID=dt[i][0].
            //}
            string Account_Money_Pay = "";
            foreach (DataRow row in dt.Rows)
            {
                SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
                string V_ID = row[0].ToString();//會場編號 ' 用 column index 存取欄位內容
                                                //string V_Date = "";//日期
                                                //string V_Site = "";//地點
                                                //string MP_Nam = "";//分析師
                                                //string V_MEM = "";//來賓人數
                                                //string TradeCount = "";//交易件數
                                                //string V_MemC="";//助理人數
                                                //string DepositCount="";//訂金件數
                                                // string Account_Money_Pay //入會金額
                                                // string Account_Money_IN //入帳金額
                SRMVENUEntity.V_ID = V_ID;
                sql = "SELECT  d.V_Date FROM[dbo].[MVENU] d where d.V_ID =" + V_ID;//日期
                string V_Date = GetValueBYSQL(conn, sql);
                SRMVENUEntity.V_Date = V_Date;
                sql = "SELECT  d.V_Site FROM[dbo].[MVENU] d where d.V_ID =" + V_ID;//地點
                string V_Site = GetValueBYSQL(conn, sql);
                SRMVENUEntity.V_Site = V_Site;
                sql = "SELECT  d.MP_Name,V_ID FROM[dbo].[MVENU] d where d.V_ID =" + V_ID;//分析師
                string MP_Name = GetValueBYSQL(conn, sql);
                SRMVENUEntity.MP_Name = MP_Name;
                sql = "SELECT  d.V_MemC FROM[dbo].[MVENU] d where d.V_ID  =" + V_ID;//來賓人數                
                string V_MemC;
                V_MemC = GetValueBYSQL(conn, sql);
                int V_MemC_int = int.Parse(V_MemC);
                sql = "SELECT  d.V_MemCN Mem FROM[dbo].[MVENU] d where d.V_ID  =" + V_ID;//來賓人數
                string V_MemCN;
                V_MemCN = GetValueBYSQL(conn, sql);
                int V_MemCN_int = int.Parse(V_MemCN);
                SRMVENUEntity.V_MEM = (V_MemC_int + V_MemCN_int).ToString();
                sql = "SELECT count(V_ID) FROM[dbo].[MTRAT] where del_tag = '0' and V_ID =" + V_ID; //交易件數
                string TradeCount = GetValueBYSQL(conn, sql);
                SRMVENUEntity.TradeCount = TradeCount;
                //sql = "SELECT count(a.V_ID)   FROM[HG].[dbo].[MVENU] a left join[dbo].[DVENU] c on CONVERT(varchar, a.V_ID) = c.V_ID where c.V_ID  =" + V_ID;//助理人數//--and a.V_Date = '2022-04-19'//
                //string V_MemC = GetValueBYSQL(conn, sql);
                SRMVENUEntity.V_MemC = V_MemC;
                sql = "SELECT COUNT(Auto_id) FROM MDEIT WHERE del_tag = '0' AND V_ID = " + V_ID;//訂金件數
                string DepositCount = GetValueBYSQL(conn, sql);
                SRMVENUEntity.DepositCount = DepositCount;
                sql = "Select sum(CONVERT(int, a.T_PayMoney)) FROM[dbo].[MTRAT] a WHERE del_tag = '0' AND V_ID =  " + V_ID; //入會金額
                if (String.IsNullOrEmpty(GetValueBYSQL(conn, sql)))
                {  
                    Account_Money_Pay = "0";
                }
                else
                {
                     Account_Money_Pay = GetValueBYSQL(conn, sql);
                }
                SRMVENUEntity.Account_Money_Pay = Account_Money_Pay;
                //Account_Money
                sql = "select Account_Money,Pay_Type,T_type from MTRAT a join DTRAT b on CONVERT(varchar, a.t_id)=b.t_id where V_id='" + V_ID + "' and a.del_tag = '0' and b.del_tag = '0'";//入帳金額(計算用)

                string Account_Money_IN = GetAccount_Money_IN_BYSQL(conn, sql); //入帳金額
                SRMVENUEntity.Account_Money_IN = Account_Money_IN;
                //Pay_Type
                //sql = "selectPay_Type from MTRAT a join DTRAT b on CONVERT(varchar, a.t_id) = b.t_id where V_id =" + V_ID + "' and a.del_tag = '0' and b.del_tag = '0'";//入帳金額(計算用)
                //string Pay_Type = GetValueBYSQL(conn, sql);
                //T_type
                //sql = "select T_type from MTRAT a join DTRAT b on CONVERT(varchar, a.t_id) = b.t_id where V_id =" + V_ID + "' and a.del_tag = '0' and b.del_tag = '0'";//入帳金額(計算用)
                // string T_type = GetValueBYSQL(conn, sql);

                //string Account_Money_IN = GetAccount_Money_IN_BYSQL()

                //sql=  select Account_Money,Pay_Type,T_type from MTRAT a join DTRAT b on CONVERT(varchar, a.t_id) = b.t_id
                //string Account_Money_IN= GetValueBYSQL2(conn, sql);
                /*
                 * SELECT  d.V_Date,d.V_Site,d.MP_Name FROM [dbo].[MVENU] d where d.V_ID=10032 --日期,地點,分析師

            SELECT  d.V_MemC+d.V_MemCN FROM [dbo].[MVENU] d where d.V_ID=10032 --來賓人數

            SELECT count(V_ID) FROM [dbo].[MTRAT] where del_tag = '0' and V_ID='10032' --交易件數


            SELECT count(a.V_ID)   FROM [HG].[dbo].[MVENU] a left join  [dbo].[DVENU] c on CONVERT(varchar, a.V_ID)=c.V_ID where a.V_ID='10032' --and a.V_Date='2022-04-19' --助理人數
            --inner join  [dbo].[MDEIT] d on  CONVERT(varchar, a.V_ID)=d.V_ID


            SELECT COUNT(Auto_id) FROM MDEIT WHERE del_tag = '0' AND V_ID='10032'--訂金件數

            Select sum(CONVERT(int,a.T_PayMoney)) FROM [dbo].[MTRAT] a WHERE del_tag = '0' AND V_ID='10032' --入會金額

                 */

                SRMVENUEntityList.Add(SRMVENUEntity);
            }
            //GridView1.DataSource = s
            //adapter.Fill(customers, "Customers");
            //venueDataEntity vde = null;
            //using (SqlDataReader sr = cmd.ExecuteReader())
            //{
            //    while (sr.Read())
            //    {
            //        vde = new venueDataEntity();
            //        vde.MP = sr[0].ToString().Trim();
            //        vde.MP_Name = sr[1].ToString().Trim();
            //        vde.V_Fees = sr[2].ToString().Trim();
            //        vdeList.Add(vde);
            //    }
            //}

            return SRMVENUEntityList;
        }
    }

    public List<SRMVENUEntity> getSRMVENUList(string connectionStrings_, string commandText)
    {
        //取得所有會場編號(VID)
        //string commandText_GETALLVID = "SELECT distinct d.V_ID, d.V_Date,d.V_Site,d.MP_Name,d.V_ID,d.del_tag FROM [dbo].[MVENU] d where d.del_tag=0";
        string commandText_GEYALLVID = commandText;
        //V_Date
        //從資料庫把資料撈出來*************************************************************************************************start
        string connectionStrings = "sqlConnectHG_Test_TEST";
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText_GEYALLVID;
            DataTable dt = new DataTable();
            conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
            conn.Open();
            //SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            //cmd.CommandText = tsql;
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);//取出所有會場編號
            int V_ID_Count = dt.Rows.Count;
            conn.Close();
            List<SRMVENUEntity> SRMVENUEntityList = new List<SRMVENUEntity>();
            string sql = "";
            //for (int i = 0; i < V_ID_Count; i++)
            //{
            //    string V_ID=dt[i][0].
            //}
            string Account_Money_Pay = "";
            foreach (DataRow row in dt.Rows)
            {
                SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
                string V_ID = row[0].ToString();//會場編號 ' 用 column index 存取欄位內容
                                                //string V_Date = "";//日期
                                                //string V_Site = "";//地點
                                                //string MP_Nam = "";//分析師
                                                //string V_MEM = "";//來賓人數
                                                //string TradeCount = "";//交易件數
                                                //string V_MemC="";//助理人數
                                                //string DepositCount="";//訂金件數
                                                // string Account_Money_Pay //入會金額
                                                // string Account_Money_IN //入帳金額
                SRMVENUEntity.V_ID = V_ID;
                sql = "SELECT  d.V_Date FROM[dbo].[MVENU] d where d.V_ID =" + V_ID;//日期
                string V_Date = GetValueBYSQL(conn, sql);
                SRMVENUEntity.V_Date = V_Date;
                sql = "SELECT  d.V_Site FROM[dbo].[MVENU] d where d.V_ID =" + V_ID;//地點
                string V_Site = GetValueBYSQL(conn, sql);
                SRMVENUEntity.V_Site = V_Site;
                sql = "SELECT  d.MP_Name,V_ID FROM[dbo].[MVENU] d where d.V_ID =" + V_ID;//分析師
                string MP_Name = GetValueBYSQL(conn, sql);
                SRMVENUEntity.MP_Name = MP_Name;
                sql = "SELECT  d.V_MemC FROM[dbo].[MVENU] d where d.V_ID  =" + V_ID;//來賓人數                
                string V_MemC;
                V_MemC = GetValueBYSQL(conn, sql);
                int V_MemC_int = int.Parse(V_MemC);
                sql = "SELECT  d.V_MemCN Mem FROM[dbo].[MVENU] d where d.V_ID  =" + V_ID;//來賓人數
                string V_MemCN;
                V_MemCN = GetValueBYSQL(conn, sql);
                int V_MemCN_int = int.Parse(V_MemCN);
                SRMVENUEntity.V_MEM = (V_MemC_int + V_MemCN_int).ToString();
                sql = "SELECT count(V_ID) FROM[dbo].[MTRAT] where del_tag = '0' and V_ID =" + V_ID; //交易件數
                string TradeCount = GetValueBYSQL(conn, sql);
                SRMVENUEntity.TradeCount = TradeCount;
                //sql = "SELECT count(a.V_ID)   FROM[HG].[dbo].[MVENU] a left join[dbo].[DVENU] c on CONVERT(varchar, a.V_ID) = c.V_ID where c.V_ID  =" + V_ID;//助理人數//--and a.V_Date = '2022-04-19'//
                //string V_MemC = GetValueBYSQL(conn, sql);
                SRMVENUEntity.V_MemC = V_MemC;
                sql = "SELECT COUNT(Auto_id) FROM MDEIT WHERE del_tag = '0' AND V_ID = " + V_ID;//訂金件數
                string DepositCount = GetValueBYSQL(conn, sql);
                SRMVENUEntity.DepositCount = DepositCount;
                sql = "Select sum(CONVERT(int, a.T_PayMoney)) FROM[dbo].[MTRAT] a WHERE del_tag = '0' AND V_ID =  " + V_ID; //入會金額
                if (String.IsNullOrEmpty(GetValueBYSQL(conn, sql)))
                {
                    Account_Money_Pay = "0";
                }
                else
                {
                    Account_Money_Pay = GetValueBYSQL(conn, sql);
                }
                SRMVENUEntity.Account_Money_Pay = Account_Money_Pay;
                //Account_Money
                sql = "select Account_Money,Pay_Type,T_type from MTRAT a join DTRAT b on CONVERT(varchar, a.t_id)=b.t_id where V_id='" + V_ID + "' and a.del_tag = '0' and b.del_tag = '0'";//入帳金額(計算用)

                string Account_Money_IN = GetAccount_Money_IN_BYSQL(conn, sql); //入帳金額
                SRMVENUEntity.Account_Money_IN = Account_Money_IN;
                //Pay_Type
                //sql = "selectPay_Type from MTRAT a join DTRAT b on CONVERT(varchar, a.t_id) = b.t_id where V_id =" + V_ID + "' and a.del_tag = '0' and b.del_tag = '0'";//入帳金額(計算用)
                //string Pay_Type = GetValueBYSQL(conn, sql);
                //T_type
                //sql = "select T_type from MTRAT a join DTRAT b on CONVERT(varchar, a.t_id) = b.t_id where V_id =" + V_ID + "' and a.del_tag = '0' and b.del_tag = '0'";//入帳金額(計算用)
                // string T_type = GetValueBYSQL(conn, sql);

                //string Account_Money_IN = GetAccount_Money_IN_BYSQL()

                //sql=  select Account_Money,Pay_Type,T_type from MTRAT a join DTRAT b on CONVERT(varchar, a.t_id) = b.t_id
                //string Account_Money_IN= GetValueBYSQL2(conn, sql);
                /*
                 * SELECT  d.V_Date,d.V_Site,d.MP_Name FROM [dbo].[MVENU] d where d.V_ID=10032 --日期,地點,分析師

            SELECT  d.V_MemC+d.V_MemCN FROM [dbo].[MVENU] d where d.V_ID=10032 --來賓人數

            SELECT count(V_ID) FROM [dbo].[MTRAT] where del_tag = '0' and V_ID='10032' --交易件數


            SELECT count(a.V_ID)   FROM [HG].[dbo].[MVENU] a left join  [dbo].[DVENU] c on CONVERT(varchar, a.V_ID)=c.V_ID where a.V_ID='10032' --and a.V_Date='2022-04-19' --助理人數
            --inner join  [dbo].[MDEIT] d on  CONVERT(varchar, a.V_ID)=d.V_ID


            SELECT COUNT(Auto_id) FROM MDEIT WHERE del_tag = '0' AND V_ID='10032'--訂金件數

            Select sum(CONVERT(int,a.T_PayMoney)) FROM [dbo].[MTRAT] a WHERE del_tag = '0' AND V_ID='10032' --入會金額

                 */

                SRMVENUEntityList.Add(SRMVENUEntity);
            }
            //GridView1.DataSource = s
            //adapter.Fill(customers, "Customers");
            //venueDataEntity vde = null;
            //using (SqlDataReader sr = cmd.ExecuteReader())
            //{
            //    while (sr.Read())
            //    {
            //        vde = new venueDataEntity();
            //        vde.MP = sr[0].ToString().Trim();
            //        vde.MP_Name = sr[1].ToString().Trim();
            //        vde.V_Fees = sr[2].ToString().Trim();
            //        vdeList.Add(vde);
            //    }
            //}

            return SRMVENUEntityList;
        }
    }
    //取的入帳金額
    private string GetAccount_Money_IN_BYSQL(SqlConnection conn_, string sql)
    {
        double A1 = 0;
        string value = "";
        double Account_Money;
        double Sum = 0;
        string Pay_Type = "";
        string T_Type = "";
        //using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        //{
        //SqlConnection connection = conn_;
        conn_.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn_;
        cmd.CommandText = sql;
        DataTable dt = new DataTable();

        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand = new SqlCommand(sql, conn_);
        adapter.Fill(dt);
        foreach (DataRow row in dt.Rows)
        {
            Account_Money = Convert.ToDouble(row[0]);
            Pay_Type = row[1].ToString();
            T_Type = row[2].ToString();
            if (Pay_Type == "0002")
            {
                A1 = Account_Money * 0.98;
            }
            else if (Pay_Type == "0006")
            {
                if (T_Type == "0003")
                {
                    A1 = Account_Money - (20 / 2);
                }
                else if (T_Type == "0")
                {
                    A1 = Account_Money - 20;
                    T_Type = "1";
                }
                else
                {
                    A1 = Account_Money;
                }

            }
            Sum = Sum + A1;
        }
        return Sum.ToString();
    }




    //private string GetValueBYSQL2(string connectionString, string sql)
    //{
    //    string value = "";
    //    using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionString].ToString()))
    //    {

    //        conn.Open();
    //        SqlCommand cmd = new SqlCommand();
    //        cmd.Connection = conn;
    //        cmd.CommandText = sql;
    //        DataTable dt = new DataTable();
    //        conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionString].ToString();
    //        conn.Open();
    //        //SqlCommand cmd = new SqlCommand();
    //        cmd.Connection = conn;
    //        //cmd.CommandText = tsql;
    //        SqlDataAdapter adapter = new SqlDataAdapter();
    //        adapter.SelectCommand = cmd;
    //        adapter.Fill(dt);//取出所有會場編號
    //        string Account_Money = "";
    //        string Pay_Type = "";
    //        string T_type = "";
    //        //int V_ID_Count = dt.Rows.Count;
    //        //List<SRMVENUEntity> SRMVENUEntityList = new List<SRMVENUEntity>();
    //        //for (int i = 0; i < V_ID_Count; i++)
    //        //{
    //        //    string V_ID=dt[i][0].
    //        //}
    //        foreach (DataRow row in dt.Rows)
    //        {
    //            float A_1 = 0;
    //            //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
    //            Account_Money = row[0].ToString();
    //            Pay_Type = row[1].ToString();
    //            T_type = row[2].ToString();
    //            //if (Pay_Type == "0002")
    //            //    A_1 = float.Parse(float.Parse(Account_Money) * 0.98);
    //            //        elseif(Pay_Type == "0006")
    //        }
    //    }
    //    return value;
    //    // sql = "select Account_Money,Pay_Type,T_type from MTRAT a join DTRAT b on a.t_id = b.t_id where V_id ='" + V_ID + "' and a.del_tag = '0' and b.del_tag = '0'";
    //    /*
    //     * 	A_1 = 0
    //                                            AccountMoney = 0
    //                                            for y = 1 to rs.recordcount
    //                                                A_1 = 0
    //                                                    if rs("Pay_Type") =  "0002" then 
    //                                                        A_1 =  (rs("Account_Money") * 0.98)
    //                                                    elseif rs("Pay_Type") =  "0006" then 

    //                                                         if rs("T_type")="0003" then
    //                                                                                A_1 =  rs("Account_Money")  - (20/2)
    //                                                                             else
    //                                                                                if T_type="0" then
    //                                                                                  A_1 =  rs("Account_Money")  - 20
    //                                                                                  T_type = "1"
    //                                                                                else
    //                                                                                  A_1 =  rs("Account_Money")
    //                                                                                end if                        														  
    //                                                                             end if

    //                                                    else 
    //                                                        A_1 =  rs("Account_Money") 
    //                                                    end if					                      				
    //                                                    AccountMoney = AccountMoney + A_1 
    //     */
    //    return "";
    //}

    public string GetValueBYSQL(SqlConnection conn, string commandText)
    {
        string value = "";
        //using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        //{
        SqlConnection connection = conn;

        //conn.ConnectionString = connectionStrings;
        //conn.Open();
        //conn.ConnectionString = connectionStrings;
        //conn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = commandText;
        DataTable dt = new DataTable();
        //conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
        //conn.Open();
        //SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        //cmd.CommandText = tsql;
        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand = cmd;
        adapter.Fill(dt);//取出所有會場編號
                         //int V_ID_Count = dt.Rows.Count;
                         //List<SRMVENUEntity> SRMVENUEntityList = new List<SRMVENUEntity>();
                         //for (int i = 0; i < V_ID_Count; i++)
                         //{
                         //    string V_ID=dt[i][0].
                         //}
        foreach (DataRow row in dt.Rows)
        {
            //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
            value = row[0].ToString();
        }
        conn.Close();
        //}
        return value;
    }

    public List<venueDataEntity> getVenueDataForPerformance(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<venueDataEntity> vdeList = new List<venueDataEntity>();

        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            venueDataEntity vde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    vde = new venueDataEntity();
                    vde.MP = sr[0].ToString().Trim();
                    vde.MP_Name = sr[1].ToString().Trim();
                    vde.V_Fees = sr[2].ToString().Trim();
                    vdeList.Add(vde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'vdeList' : " + vdeList.ToString(), className, methodName);
        return vdeList;
    }


    public List<VenuePerformanceEntity> getVenuePerformance(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<VenuePerformanceEntity> vpeList = new List<VenuePerformanceEntity>();

        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            VenuePerformanceEntity vpe = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    vpe = new VenuePerformanceEntity();
                    vpe.V_ID = sr[0].ToString().Trim();
                    vpe.V_Date = sr[1].ToString().Trim();
                    vpe.V_Site = sr[2].ToString().Trim();
                    vpe.MP_Name = sr[3].ToString().Trim();
                    vpe.V_MemC = sr[4].ToString().Trim();
                    vpe.V_MemCN = sr[5].ToString().Trim();
                    vpeList.Add(vpe);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'vpeList' : " + vpeList.ToString(), className, methodName);
        return vpeList;
    }


}