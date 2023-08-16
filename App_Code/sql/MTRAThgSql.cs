using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

/// <summary>
/// MTRAThgSql 的摘要描述
/// </summary>
public class MTRAThgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MTRAThgSql _instanct = new MTRAThgSql();
    public static MTRAThgSql Instance
    {
        get
        {
            return _instanct;
        }
    }

    public MTRAThgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<tradeRecordEntity> getTradeRecord(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<tradeRecordEntity> treList = new List<tradeRecordEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            tradeRecordEntity tre = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    
                   tre = new tradeRecordEntity();
                    tre.T_ID = sr[0].ToString().Trim();
                    tre.MP = sr[1].ToString().Trim();
                    tre.MP_Name = sr[2].ToString().Trim();
                    tre.MC = sr[3].ToString().Trim();
                    tre.MC_Name = sr[4].ToString().Trim();
                    tre.T_Item = sr[5].ToString().Trim();
                    tre.V_ID = sr[6].ToString().Trim();
                    tre.V_Name = sr[7].ToString().Trim();
                    
                    tre.T_PayMoney = sr[8].ToString().Trim();
                    tre.T_Type = sr[9].ToString().Trim();
                    tre.T_StartDate = sr[10].ToString().Trim();
                    tre.T_EndDate = sr[11].ToString().Trim();
                    tre.T_PauseDate = sr[12].ToString().Trim();
                    tre.T_AccountDate = sr[13].ToString().Trim();
            
                    tre.T_Status = sr[14].ToString().Trim();
                    tre.T_Fax = sr[15].ToString().Trim();
                    tre.T_Media = sr[16].ToString().Trim();
                    tre.T_PS = sr[17].ToString().Trim();
                    tre.T_Message = sr[18].ToString().Trim();
                  
                    tre.Ccard_4Num = sr[19].ToString().Trim();
                    tre.INV_tag = sr[20].ToString().Trim();

                    tre.INV_Createdate = sr[21].ToString().Trim();
                    tre.INV_Item = sr[22].ToString().Trim();
                    tre.INV_open_Item = sr[23].ToString().Trim();
                    tre.INV_ComName = sr[24].ToString().Trim();
                    tre.INV_UnifyNum = sr[25].ToString().Trim();
                    tre.INV_MNum = sr[26].ToString().Trim();
                    tre.INV_SendState = sr[27].ToString().Trim();
                    tre.Light_Status = sr[28].ToString().Trim();
                    tre.Back_intag = sr[29].ToString().Trim();
                    tre.Back_Status = sr[30].ToString().Trim();
                    tre.Back_tag = sr[31].ToString().Trim();
                    tre.add_user = sr[32].ToString().Trim();
                    tre.ca_id = sr[33].ToString().Trim();
                    tre.XQ_SName = sr[34].ToString().Trim();
                    tre.XQ_SPw = sr[35].ToString().Trim();
                    treList.Add(tre);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(treList.ToString(), className, methodName);
        return treList;
    }

    public  List<discountDataEntity> getDiscountData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<discountDataEntity> dDERList = new List<discountDataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            discountDataEntity dDE = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    dDE = new discountDataEntity();
                    dDE.M_Id = sr[0].ToString().Trim();
                    dDE.T_StartDate = sr[1].ToString().Trim();
                    dDE.T_EndDate = sr[2].ToString().Trim();
                    dDE.T_ID = sr[3].ToString().Trim();
                    dDE.MP = sr[4].ToString().Trim();//分析師編號
                    dDE.T_Item = sr[5].ToString().Trim();
                    string getddesSQL = "Select ddesc from MITEM where mitcode='" + dDE.MP + "' and ditcode='" + dDE.T_Item + "'";
                    SqlConnection conn2 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString());
                    string ddesc = GetValueBYSQL(conn2, getddesSQL);//取得[會員種類]中的種類
                    string getMPNameSQL = "Select U_Name from MUSER where U_Num='" + dDE.MP + "'";
                    SqlConnection conn3 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString());
                    string MPName = GetValueBYSQL(conn3, getMPNameSQL);//取得[會員種類]中的分析師姓名
                    dDE.MembershipType = MPName + "--" + ddesc;//會員種類
                    dDE.T_PayMoney = sr[6].ToString().Trim();//入會金額
                    dDERList.Add(dDE);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(dDERList.ToString(), className, methodName);
        return dDERList;

    }

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
        DataSet ds = new DataSet();
        //conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
        //conn.Open();
        //SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        //cmd.CommandText = tsql;
        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
        if (cmd.Connection.State.ToString() == "Closed")
            cmd.Connection.Open();

        adapter.Fill(ds);//取出所有會場編號
        foreach (DataRow datarow in ds.Tables[0].Rows)
        {
            value = datarow[0].ToString();
            //每個資料列的內容

        }

        //int V_ID_Count = dt.Rows.Count;
        /*
         *  foreach (DataRow row in dt.Rows)
        {
            //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
            value = row[0].ToString();
        }
        conn.Close();
         */
        foreach (DataRow row in dt.Rows)
        {
            //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
            value = row[0].ToString();
        }
        //List<SRMVENUEntity> SRMVENUEntityList = new List<SRMVENUEntity>();
        //for (int i = 0; i < V_ID_Count; i++)
        //{
        //    string V_ID = dt[i][0].ToString();
        //                           }
        //foreach (DataRow row in dt.Rows)
        //{
        //    //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
        //    value = row[0].ToString();
        //}
        // conn.Close();
        // }
        /*
         *  adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
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
         */
        cmd.Connection.Close();
        return value;
    }
    public List<haltResumeEntity> getCaseData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<haltResumeEntity> hRList = new List<haltResumeEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            haltResumeEntity hRE = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    hRE = new haltResumeEntity();
                    hRE.M_Id = sr[0].ToString().Trim();
                    hRE.T_StartDate = sr[1].ToString().Trim();
                    hRE.T_EndDate = sr[2].ToString().Trim();
                    hRE.T_ID = sr[3].ToString().Trim();
                    hRE.MP = sr[4].ToString().Trim();//分析師編號
                    hRE.T_Item = sr[5].ToString().Trim();
                    string getddesSQL="Select ddesc from MITEM where mitcode='"+ hRE.MP + "' and ditcode='"+ hRE.T_Item + "'";
                    SqlConnection conn2 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString());
                    string ddesc=GetValueBYSQL(conn2, getddesSQL);//取得[會員種類]中的種類
                    string getMPNameSQL = "Select U_Name from MUSER where U_Num='" + hRE.MP + "'";
                    SqlConnection conn3 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString());
                    string MPName= GetValueBYSQL(conn3, getMPNameSQL);//取得[會員種類]中的分析師姓名
                    hRE.MembershipType = MPName + "--" + ddesc;//會員種類
                    hRE.T_PayMoney = sr[6].ToString().Trim();//入會金額
                    hRList.Add(hRE);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(hRList.ToString(), className, methodName);
        return hRList;
       
    }

    public tradeRecordEntity getTradeRecordByTid(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        tradeRecordEntity tre = null;
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
                    tre = new tradeRecordEntity();
                    tre.T_ID = sr[0].ToString().Trim();
                    tre.MP = sr[2].ToString().Trim();
                    tre.MP_Name = sr[3].ToString().Trim();
                    tre.MC = sr[5].ToString().Trim();
                    tre.MC_Name = sr[6].ToString().Trim();
                    tre.T_Item = sr[8].ToString().Trim();
                    tre.V_ID = sr[10].ToString().Trim();
                    tre.V_Name = sr[11].ToString().Trim();
                    tre.T_PayMoney = sr[13].ToString().Trim();
                    tre.T_Type = sr[15].ToString().Trim();
                    tre.T_StartDate = sr[16].ToString().Trim();
                    tre.T_EndDate = sr[17].ToString().Trim();
                    tre.T_PauseDate = sr[18].ToString().Trim();
                    tre.T_AccountDate = sr[21].ToString().Trim();
                    tre.T_Status = sr[22].ToString().Trim();
                    tre.T_Fax = sr[23].ToString().Trim();
                    tre.T_Media = sr[24].ToString().Trim();
                    tre.T_PS = sr[27].ToString().Trim();
                    tre.T_Message = sr[29].ToString().Trim();
                    tre.Ccard_4Num = sr[30].ToString().Trim();
                    tre.INV_tag = sr[31].ToString().Trim();
                    tre.INV_Createdate = sr[32].ToString().Trim();
                    tre.INV_Item = sr[33].ToString().Trim();
                    tre.INV_open_Item = sr[34].ToString().Trim();
                    tre.INV_ComName = sr[35].ToString().Trim();
                    tre.INV_UnifyNum = sr[36].ToString().Trim();
                    tre.INV_MNum = sr[37].ToString().Trim();
                    tre.INV_SendState = sr[39].ToString().Trim();
                    tre.Light_Status = sr[40].ToString().Trim();
                    tre.Back_intag = sr[41].ToString().Trim();
                    tre.Back_Status = sr[42].ToString().Trim();
                    tre.Back_tag = sr[43].ToString().Trim();
                    tre.add_user = sr[47].ToString().Trim();
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'tre':"+tre.ToString(), className, methodName);
        return tre;
    }


    public tradeRecordEntity getTradeData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        tradeRecordEntity tre = new tradeRecordEntity();
        string backString = string.Empty;
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
                    tre.T_PayMoney = sr[0].ToString().Trim();
                    tre.T_StartDate = sr[1].ToString().Trim();
                    tre.T_EndDate = sr[2].ToString().Trim();
                    tre.MT_COM = sr[3].ToString().Trim();
                    tre.T_ID = sr[4].ToString().Trim();
                    tre.M_ID = sr[5].ToString().Trim();
                }
            }
        }

        log.endWrite("'tre' : " + tre.ToString(), className, methodName);
        return tre;
    }

    public tradeRecordEntity getCDDdata(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        
       tradeRecordEntity tre = null;

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
                    tre = new tradeRecordEntity();
                    tre.T_ID = sr[0].ToString().Trim();
                    tre.M_ID = sr[1].ToString().Trim();
                    tre.MC = sr[2].ToString().Trim();
                    tre.T_PayMoney = sr[3].ToString().Trim();
                    tre.T_AccountDate = sr[4].ToString().Trim();
                    
                }
            }
        }

        log.endWrite("'tre' : " + tre.ToString(), className, methodName);
        return tre;
    }

    public List<totalPerformanceEntity> getTotalPerformanceData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<totalPerformanceEntity> tpeList = new List<totalPerformanceEntity>();
        totalPerformanceEntity tpe = null;
        string backString = string.Empty;
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
                    tpe = new totalPerformanceEntity();
                    tpe.MP = sr[0].ToString().Trim();
                    tpe.MP_Name = sr[1].ToString().Trim();
                    tpe.MC = sr[2].ToString().Trim();
                    tpe.MC_Name = sr[3].ToString().Trim();
                    tpeList.Add(tpe);
                }
            }
        }

        log.endWrite("'tpeList' : " + tpeList.ToString(), className, methodName);
        return tpeList;
    }


    public List<VenueDataEntity> getVenueData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<VenueDataEntity> vdeList = new List<VenueDataEntity>();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            VenueDataEntity vde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    vde = new VenueDataEntity();
                    vde.T_PayMoney = sr[0].ToString().Trim();
                    vde.T_PType = sr[1].ToString().Trim();
                    vdeList.Add(vde);
                }
            }
        }

        log.endWrite("'vdeList' : " + vdeList, className, methodName);
        return vdeList;
    }

    
    public List<tradeRecordEntity> getElectronicCalculatorInvoiceData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<tradeRecordEntity> treList = new List<tradeRecordEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            tradeRecordEntity tre = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    tre = new tradeRecordEntity();

                    tre.T_ID = sr[0].ToString().Trim();
                    tre.T_PayMoney = sr[1].ToString().Trim();
                    tre.INV_Item = sr[2].ToString().Trim();
                    tre.INV_SendState = sr[3].ToString().Trim();

                    treList.Add(tre);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(treList.ToString(), className, methodName);
        return treList;
    }




}