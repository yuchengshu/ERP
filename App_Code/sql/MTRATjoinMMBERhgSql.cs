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
/// MTRATjoinMMBERhgSql 的摘要描述
/// </summary>
public class MTRATjoinMMBERhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MTRATjoinMMBERhgSql _instanct = new MTRATjoinMMBERhgSql();
    public static MTRATjoinMMBERhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MTRATjoinMMBERhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public envelopeEntity getEnvelopeData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        envelopeEntity eve = new envelopeEntity();
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
                    
                    eve.MC_Name = sr[6].ToString().Trim();
                    eve.MC_COM = sr[7].ToString().Trim();
                    eve.T_AccountDate = sr[20].ToString().Trim();
                    eve.INV_Item = sr[32].ToString().Trim();
                    eve.INV_SendState = sr[38].ToString().Trim();
                    eve.M_Name = sr[53].ToString().Trim();
                    eve.HCity = sr[85].ToString().Trim();
                    eve.HTown = sr[86].ToString().Trim();
                    eve.HZipCode = sr[87].ToString().Trim();
                    eve.H_Address = sr[88].ToString().Trim();
                    eve.Recipient = sr[89].ToString().Trim();
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(eve.ToString(), className, methodName);
        return eve;
    }

    public List<string> getMTEl1List(string connectionStrings, string commandText)
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
        log.endWrite("strList :" +strList.ToString(), className, methodName);
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
        analystSinglePerformanceEntity aspe = null;
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
                    aspe = new analystSinglePerformanceEntity();
                    aspe.t_item = sr[0].ToString().Trim();
                    aspe.T_item_count = sr[1].ToString().Trim();
                    aspe.T_PayMoney = sr[2].ToString().Trim();
                    aspeList.Add(aspe);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'aspeList' : " + aspeList.ToString(), className, methodName);
        return aspeList;
    }

    public List<nextMonthSoonFallDueMemberEntity> getNextMonthSoonFallDueMember(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<nextMonthSoonFallDueMemberEntity> nmsfdmeList = new List<nextMonthSoonFallDueMemberEntity>();
        nextMonthSoonFallDueMemberEntity nmsfdme = null;
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
                    nmsfdme = new nextMonthSoonFallDueMemberEntity();
                    nmsfdme.T_ID = sr[0].ToString().Trim();
                    nmsfdme.M_ID = sr[1].ToString().Trim();
                    nmsfdme.MP_Name = sr[2].ToString().Trim();
                    nmsfdme.T_Item = sr[3].ToString().Trim();
                    nmsfdme.T_StartDate = sr[4].ToString().Trim();
                    nmsfdme.T_EndDate = sr[5].ToString().Trim();
                    nmsfdme.M_Name = sr[6].ToString().Trim();
                    nmsfdme.MP = sr[7].ToString().Trim();
                    nmsfdmeList.Add(nmsfdme);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'nmsfdmeList' : " + nmsfdmeList.ToString(), className, methodName);
        return nmsfdmeList;
    }

    public List<customerDataEntity> getExpiredCustomer(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<customerDataEntity> cdeList = new List<customerDataEntity>();
        customerDataEntity cde = null;
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
                    cde = new customerDataEntity();

                    cde.M_Name = sr[0].ToString().Trim();
                    cde.BirthDay_Date = sr[1].ToString().Trim();
                    cde.MTel1 = sr[2].ToString().Trim();
                    cde.MTel2 = sr[3].ToString().Trim();
                    cde.MTel3 = sr[4].ToString().Trim();
                    cde.OTel_Zone = sr[5].ToString().Trim();
                    cde.OTel_Zone1 = sr[6].ToString().Trim();
                    cde.OTel = sr[7].ToString().Trim();
                    cde.OTel1 = sr[8].ToString().Trim();
                    cde.OTel_Sub = sr[9].ToString().Trim();
                    cde.OTel_Sub1 = sr[10].ToString().Trim();
                    cde.HTel_Zone = sr[11].ToString().Trim();
                    cde.HTel_Zone1 = sr[12].ToString().Trim();
                    cde.HTel = sr[13].ToString().Trim();
                    cde.HTel1 = sr[14].ToString().Trim();
                    cde.M_ID = sr[15].ToString().Trim();
                    cde.add_date = sr[16].ToString().Trim();
                    cdeList.Add(cde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'cdeList' :" + cdeList.ToString(), className, methodName);
        return cdeList;
    }


    public List<string> getPrintData(string connectionStrings, string commandText)
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
        log.endWrite("'strList' : " + strList.ToString(), className, methodName);
        return strList;
    }

    
    public List<appointOriginalArchiveWorkEntity> getAppointOriginalArchive(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<appointOriginalArchiveWorkEntity> aoaweList = new List<appointOriginalArchiveWorkEntity>();
        appointOriginalArchiveWorkEntity aoawe = null;
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
                    aoawe = new appointOriginalArchiveWorkEntity();
                    aoawe.M_Name = sr[0].ToString().Trim();
                    aoawe.T_ID = sr[1].ToString().Trim();
                    aoawe.M_ID = sr[2].ToString().Trim();
                    aoawe.MP = sr[3].ToString().Trim();
                    aoawe.MP_Name = sr[4].ToString().Trim();
                    aoawe.MC = sr[5].ToString().Trim();
                    aoawe.MC_Name = sr[6].ToString().Trim();
                    aoawe.MC_COM = sr[7].ToString().Trim();
                    aoawe.T_Item = sr[8].ToString().Trim();
                    aoawe.T_PayMoney = sr[9].ToString().Trim();
                    aoawe.T_AccountDate = sr[10].ToString().Trim();
                    aoawe.Back_Status = sr[11].ToString().Trim();
                    aoawe.Back_tag = sr[12].ToString().Trim();
                    aoaweList.Add(aoawe);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'aoaweList' :" + aoaweList.ToString(), className, methodName);
        return aoaweList;
    }

    public List<memberSessionStatusEntity> getMemberSessionStatus(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<memberSessionStatusEntity> msseList = new List<memberSessionStatusEntity>();
        memberSessionStatusEntity msse = null;
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
                    msse = new memberSessionStatusEntity();
                    msse.M_Num = sr[0].ToString().Trim();
                    msse.M_ID = sr[1].ToString().Trim();
                    msse.M_Name = sr[2].ToString().Trim();
                    msse.MC_Name = sr[3].ToString().Trim();
                    msse.M_SD = sr[4].ToString().Trim();
                    msse.MTel1 = sr[5].ToString().Trim();
                    msse.MTel2 = sr[6].ToString().Trim();
                    msse.MTel3 = sr[7].ToString().Trim();
                    msse.OTel_Zone = sr[8].ToString().Trim();
                    msse.OTel = sr[9].ToString().Trim();
                    msse.OTel_Sub = sr[10].ToString().Trim();
                    msse.HTel_Zone = sr[11].ToString().Trim();
                    msse.HTel = sr[12].ToString().Trim();
                    msse.MP_Name = sr[13].ToString().Trim();
                    msse.MP = sr[14].ToString().Trim();
                    msse.T_AccountDate = sr[15].ToString().Trim();
                    msse.T_PayMoney = sr[16].ToString().Trim();
                    msse.T_StartDate = sr[17].ToString().Trim();
                    msse.T_EndDate = sr[18].ToString().Trim();
                    msse.T_Item = sr[19].ToString().Trim();
                    msseList.Add(msse);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'msseList' : " + msseList.ToString(), className, methodName);
        return msseList;
    }
    //取得預收剩餘金額表
    public List<memberSessionStatusEntity> getAdvancesRemainingMoney(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<memberSessionStatusEntity> msseList = new List<memberSessionStatusEntity>();
        memberSessionStatusEntity AdvancesRemainingMoney = null;
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
                    AdvancesRemainingMoney = new memberSessionStatusEntity();
                    AdvancesRemainingMoney.M_ID = sr[0].ToString().Trim();
                    AdvancesRemainingMoney.M_Name = sr[1].ToString().Trim();
                    AdvancesRemainingMoney.M_Num = sr[2].ToString().Trim();
                    AdvancesRemainingMoney.MC_Name = sr[3].ToString().Trim();
                    AdvancesRemainingMoney.M_SD = sr[4].ToString().Trim();
                    AdvancesRemainingMoney.MTel1 = sr[5].ToString().Trim();
                    AdvancesRemainingMoney.MTel2 = sr[6].ToString().Trim();
                    AdvancesRemainingMoney.MTel3 = sr[7].ToString().Trim();
                    AdvancesRemainingMoney.OTel_Zone = sr[8].ToString().Trim();
                    AdvancesRemainingMoney.OTel = sr[9].ToString().Trim();
                    AdvancesRemainingMoney.OTel_Sub = sr[10].ToString().Trim();
                    AdvancesRemainingMoney.HTel_Zone = sr[11].ToString().Trim();
                    AdvancesRemainingMoney.HTel = sr[12].ToString().Trim();
                    AdvancesRemainingMoney.MP_Name = sr[13].ToString().Trim();
                    AdvancesRemainingMoney.MP = sr[14].ToString().Trim();
                    AdvancesRemainingMoney.T_Item = sr[15].ToString().Trim();
                    AdvancesRemainingMoney.T_AccountDate = sr[16].ToString().Trim();
                    AdvancesRemainingMoney.T_PayMoney = sr[17].ToString().Trim();
                    AdvancesRemainingMoney.T_EndDate = sr[18].ToString().Trim();
                    AdvancesRemainingMoney.T_StartDate = sr[19].ToString().Trim();
                    //預收剩餘金額表-種類(mitem)
                    /*
                     *   rs.Open "select ditcode,ddesc from MITEM where mitcode = '"& VRS("mp") &"' and ditcode <> '0000' and del_tag = '0' order by rank" ,conn,3,1
				
													for z=1 to rs.recordcount
						'if rs.eof then exit for
                      		 if vrs("T_ITEM")=rs("ditcode") then response.write rs("ddesc")
                        	
                     * 
                     * 
                     * 
                     */
                    //取得預收剩餘金額種類
                    SqlConnection conn2 = new SqlConnection();
                    AdvancesRemainingMoney.mitem = GETAdvancesRemainingMoneyKind(AdvancesRemainingMoney.MP, AdvancesRemainingMoney.T_Item, conn2);//取得預收剩餘金額種類
                    //}
                    msseList.Add(AdvancesRemainingMoney);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'msseList' : " + msseList.ToString(), className, methodName);
        return msseList;
    }
    //預收剩餘金額表種類
    private string GETAdvancesRemainingMoneyKind(string MP, string T_Item, SqlConnection conn)
    {
        // rs.Open "select ditcode,ddesc from MITEM where mitcode = '"& VRS("mp") &"' and ditcode <> '0000' and del_tag = '0' order by rank" ,conn,3,1

        //string cmd_Text = "select ditcode,ddesc from MITEM where mitcode = '" + MP + "' and ditcode <> '0000' and del_tag = '0' order by rank";
        string cmd_Text = "select ddesc,ditcode from MITEM where mitcode = '" + MP + "' and ditcode <> '0000' and del_tag = '0' and ditcode='"+ T_Item + "' order by rank";
        //SqlCommand cmd=new SqlCommand(cmd_Text, conn);
        string AdvancesRemainingMoneyKind = GetValueBYSQLWithoutSQLOPEN(conn, cmd_Text);
        return AdvancesRemainingMoneyKind;
    }

    private static string connectionStrings = "sqlConnectHG_Test";
    public string GetValueBYSQLWithoutSQLOPEN(SqlConnection conn, string commandText)
    {
        string value = "";
        using (SqlConnection conn_AdvancesRemainingMoneyKind = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            //SqlConnection connection = conn;

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
            cmd.Connection = conn_AdvancesRemainingMoneyKind;
            //cmd.CommandText = tsql;
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
            adapter.Fill(dt);
            foreach (DataRow row in dt.Rows)
            {
                //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
                value = row[0].ToString();
            }
            conn.Close();
            //}
            return value;
        }
    }

    public List<getVidPaymentDataEntity> getVidPaymentData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<getVidPaymentDataEntity> gvpdeList = new List<getVidPaymentDataEntity>();
        getVidPaymentDataEntity gvpde = null;
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
                    gvpde = new getVidPaymentDataEntity();
                    gvpde.V_ID = sr[0].ToString().Trim();
                    gvpde.T_AccountDate = sr[1].ToString().Trim();
                    gvpde.M_Name = sr[2].ToString().Trim();
                    gvpde.M_Num = sr[3].ToString().Trim();
                    gvpde.MP = sr[4].ToString().Trim();
                    gvpde.MP_Name = sr[5].ToString().Trim();
                    gvpde.T_Item = sr[6].ToString().Trim();
                    gvpde.T_PayMoney = sr[7].ToString().Trim();
                    gvpde.T_ID = sr[8].ToString().Trim();
                    gvpde.MC = sr[9].ToString().Trim();
                    gvpde.MCname = sr[10].ToString().Trim();
                    gvpde.MCcom = sr[11].ToString().Trim();
                    gvpde.UMDEP = sr[12].ToString().Trim();

                    gvpdeList.Add(gvpde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'gvpdeList' : " + gvpdeList.ToString(), className, methodName);
        return gvpdeList;
    }
    
    public List<string> getHandOpenInvoiceDetail(string connectionStrings, string commandText)
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
                    strList.Add(sr[0].ToString().Trim().Split(' ')[0]);

                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'strList' : " + strList.ToString(), className, methodName);
        return strList;
    }


}