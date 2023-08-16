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
/// MMBERhgSql 的摘要描述
/// </summary>
public class MMBERhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MMBERhgSql _instanct = new MMBERhgSql();
    public static MMBERhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MMBERhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<customerDataEntity> getCustomerData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<customerDataEntity> cdeList = new List<customerDataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                while (sr.Read())
                {
                    customerDataEntity cde = new customerDataEntity();
                    cde.M_ID = sr[0].ToString().Trim();
                    cde.M_Name = sr[1].ToString().Trim();
                    cde.M_Sax = sr[2].ToString().Trim();
                    cde.M_Grade = sr[3].ToString().Trim();
                    cde.BirthDay_Date = sr[4].ToString().Trim();
                    cde.MC = sr[5].ToString().Trim();
                    cde.MC_Name = sr[6].ToString().Trim();
                    cde.MC_COM = sr[7].ToString().Trim();
                    cde.OTel_Zone = sr[8].ToString().Trim();
                    cde.OTel = sr[9].ToString().Trim();
                    cde.OTel_Sub = sr[10].ToString().Trim();
                    cde.OTel_Zone1 = sr[11].ToString().Trim();
                    cde.OTel1 = sr[12].ToString().Trim();
                    cde.OTel_Sub1 = sr[13].ToString().Trim();
                    cde.HTel_Zone = sr[14].ToString().Trim();
                    cde.HTel = sr[15].ToString().Trim();
                    cde.HTel_Zone1 = sr[16].ToString().Trim();
                    cde.HTel1 = sr[17].ToString().Trim();
                    cde.MTel1 = sr[18].ToString().Trim();
                    cde.MTel2 = sr[19].ToString().Trim();
                    cde.MTel3 = sr[20].ToString().Trim();
                    cde.Fax_Zone = sr[21].ToString().Trim();
                    cde.Fax = sr[22].ToString().Trim();
                    cde.Fax_Zone1 = sr[23].ToString().Trim();
                    cde.Fax1 = sr[24].ToString().Trim();
                    cde.M_SD = sr[25].ToString().Trim();
                    cde.M_SD_tag = sr[26].ToString().Trim();
                    cde.M_SD_Date = sr[27].ToString().Trim();
                    cde.EMail = sr[28].ToString().Trim();
                    cde.OCity = sr[29].ToString().Trim();
                    cde.OTown = sr[30].ToString().Trim();
                    cde.OZipCode = sr[31].ToString().Trim();
                    cde.O_Address = sr[32].ToString().Trim();
                    cde.HCity = sr[33].ToString().Trim();
                    cde.HTown = sr[34].ToString().Trim();
                    cde.HZipCode = sr[35].ToString().Trim();
                    cde.H_Address = sr[36].ToString().Trim();
                    cde.Recipient = sr[37].ToString().Trim();
                    cde.Inv_Money = sr[38].ToString().Trim();
                    cde.Analyst = sr[39].ToString().Trim();
                    cde.Product = sr[40].ToString().Trim();
                    cde.Program = sr[41].ToString().Trim();
                    cde.M_Note = sr[42].ToString().Trim();
                    cde.M_Num = sr[43].ToString().Trim();
                    cde.M_Password = sr[44].ToString().Trim();
                    cde.Light_Status = sr[45].ToString().Trim();
                    cde.MRYGC_tag = sr[46].ToString().Trim();
                    cde.N_Call_tag = sr[48].ToString().Trim();
                    cde.LongTag_Date = sr[49].ToString().Trim();
                    cde.add_date = sr[50].ToString().Trim();
                    //會期中商品
                    //cde.Production = GetCustomerProductionByMID(cde.M_ID, conn);
                    cdeList.Add(cde);
                    //cdeList = GetCustomerProductionByMID(cdeList, connectionStrings);

                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(cdeList.ToString(), className, methodName);
        return cdeList;
    }

    public List<customerDataEntity> GetCustomerProductionByMID(List<customerDataEntity> cdeList, string connectionStrings)
    {
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            int i = -1;
            foreach (var item in cdeList)
            {
                i++;
                string m_ID = item.M_ID;
                string MP_Name = string.Empty;
                string MP = string.Empty;
                string T_Item = string.Empty;
                SqlCommand cmd_GETMP = new SqlCommand();
                SqlCommand cmd_GETMPNAME = new SqlCommand();
                //cmd_GETMP.CommandText = "SELECT [MP] FROM [HG].[dbo].[MTRAT] where  T_enddate>=GETDATE() and M_ID='" + m_ID + "'";
                cmd_GETMP.CommandText = "SELECT [MP] FROM [HG].[dbo].[MTRAT] where  M_ID='" + m_ID + "'";
                //cmd_GETMPNAME.CommandText = "SELECT [MP_name] FROM [HG].[dbo].[MTRAT] where  M_ID='" + m_ID + "'";
                MP = GetValueBYSQLwithNoConnClose(conn, cmd_GETMP.CommandText);
                //MP_Name= GetValueBYSQLwithNoConnClose(conn, cmd_GETMP.CommandText);
                if (MP.Trim() != "")
                {
                    SqlCommand cmd_GEMP_name = new SqlCommand();
                    //cmd_GEMP_name.CommandText = "SELECT [MP_name] FROM [HG].[dbo].[MTRAT] where  T_enddate>=GETDATE() and M_ID='" + m_ID + "'";
                    cmd_GEMP_name.CommandText = "SELECT [MP_name] FROM [HG].[dbo].[MTRAT] where M_ID='" + m_ID + "'";
                    MP_Name = GetValueBYSQLwithNoConnClose(conn, cmd_GEMP_name.CommandText);

                    SqlCommand cmd_GETT_Item = new SqlCommand();
                    //cmd_GETT_Item.CommandText = "SELECT [T_Item]  FROM [HG].[dbo].[MTRAT] where  T_enddate>=GETDATE() and M_ID='" + m_ID + "'";
                    cmd_GETT_Item.CommandText = "SELECT [T_Item]  FROM [HG].[dbo].[MTRAT] where M_ID='" + m_ID + "'";
                    T_Item = GetValueBYSQLwithNoConnClose(conn, cmd_GETT_Item.CommandText);
                }
                if (MP.Trim() != "")
                {
                    //SqlCommand cmd_GetMPName = new SqlCommand();
                    //cmd_GetMPName.CommandText = "SELECT [MP_name] FROM [HG].[dbo].[MTRAT] where  T_enddate>=GETDATE() and M_ID='" + m_ID + "'";
                    //SqlCommand cmd_GETT_Item = new SqlCommand();
                    //cmd_GETT_Item.CommandText = "SELECT [T_Item] FROM [HG].[dbo].[MTRAT] where  T_enddate>=GETDATE() and M_ID='" + m_ID + "'";
                    //string T_Item = GetValueBYSQLwithNoConnClose(conn, cmd_GETT_Item.CommandText);//0008

                    SqlCommand cmdGetditcode = new SqlCommand();
                    //cmdGetditcode.Connection = conn;
                    //cmdGetditcode.CommandText = "SELECT  ditcode,ddesc from MITEM where mitcode ='" + MP + "' and ditcode <> '0000' and del_tag = '0' order by rank";
                    cmdGetditcode.CommandText = "SELECT  ditcode from MITEM where mitcode ='" + MP + "' and ditcode <> '0000' and del_tag = '0' order by rank";
                    string ditcode = GetValueBYSQLwithNoConnClose(conn, cmdGetditcode.CommandText);
                    SqlCommand cmdGetddesc = new SqlCommand();
                    cmdGetddesc.CommandText = "SELECT ddesc from MITEM where mitcode ='" + MP + "' and ditcode <> '0000' and ditcode='" + T_Item + "'and del_tag = '0' order by rank";
                    string ddesc = GetValueBYSQLwithNoConnClose(conn, cmdGetddesc.CommandText);
                    item.Production = item.Production + ddesc + "<br>";
                    item.Production = MP_Name+"-" + item.Production;
                    //if (ditcode == T_Item)
                    //{
                    //item.Production = item.Production + ddesc + "<br>";
                    //}
                }
                cdeList[i].Production = item.Production;
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
               

                //return ddesc;
            }

        }
        //throw new NotImplementedException();
        return cdeList;
    }
    
    public string GetValueBYSQL(SqlConnection conn, string commandText)
    {
        string value = "";
        //using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        //{
        // 如果是關閉狀態
        if (conn.State == System.Data.ConnectionState.Closed)
        {
            conn.Open();
        }
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
        if (conn.State == System.Data.ConnectionState.Open)
        {
            conn.Close();
        }
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

    public string GetValueBYSQLwithNoConnClose(SqlConnection conn, string commandText)
    {
        string value = "";
        //using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        //{
        // 如果是關閉狀態
        if (conn.State == System.Data.ConnectionState.Closed)
        {
            conn.Open();
        }
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
        if (conn.State == System.Data.ConnectionState.Open)
        {
            conn.Close();
        }
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

        //conn.Close();
        //}
        return value;
    }

    public List<customerDataEntity> getERPeditRecord(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<customerDataEntity> cdeList = new List<customerDataEntity>();
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
                    customerDataEntity cde = new customerDataEntity();

                    cde.M_Num = sr[0].ToString().Trim();
                    cde.M_Name = sr[1].ToString().Trim();
                    cde.MC_Name = sr[2].ToString().Trim();
                    cde.MTel1 = sr[3].ToString().Trim();
                    cde.MTel2 = sr[4].ToString().Trim();
                    cde.MTel3 = sr[5].ToString().Trim();
                    cde.OTel_Zone = sr[6].ToString().Trim();
                    cde.OTel_Zone1 = sr[7].ToString().Trim();
                    cde.OTel = sr[8].ToString().Trim();
                    cde.OTel1 = sr[9].ToString().Trim();
                    cde.OTel_Sub = sr[10].ToString().Trim();
                    cde.OTel_Sub1 = sr[11].ToString().Trim();
                    cde.HTel_Zone = sr[12].ToString().Trim();
                    cde.HTel_Zone1 = sr[13].ToString().Trim();
                    cde.HTel = sr[14].ToString().Trim();
                    cde.HTel1 = sr[15].ToString().Trim();
                    cde.M_ID = sr[16].ToString().Trim();
                    cde.add_date = sr[17].ToString().Trim();
                    cde.Change_date = sr[18].ToString().Trim();
                    cdeList.Add(cde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(cdeList.ToString(), className, methodName);
        return cdeList;
    }

    public customerDataEntity getCustomerDataByMid(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        customerDataEntity cde = new customerDataEntity();
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

                    cde.M_Name = sr[0].ToString().Trim();
                    cde.M_SD = sr[1].ToString().Trim();

                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("cde=" + cde.ToString(), className, methodName);
        return cde;
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
        log.endWrite("strList=" + strList.ToString(), className, methodName);
        return strList;
    }

    public List<customerDataEntity> getMCnameList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<customerDataEntity> cdeList = new List<customerDataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            customerDataEntity cde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    cde = new customerDataEntity();
                    cde.MC_Name = sr[0].ToString().Trim();
                    cde.MTel1 = sr[1].ToString().Trim();
                    cdeList.Add(cde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("cdeList:" + cdeList.ToString(), className, methodName);
        return cdeList;
    }

    public customerDataEntity getSingalCustomerData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
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
                    cde.M_ID = sr[0].ToString().Trim();
                    cde.M_Name = sr[1].ToString().Trim();
                    cde.M_Sax = sr[2].ToString().Trim();
                    cde.M_Grade = sr[3].ToString().Trim();
                    cde.BirthDay_Date = sr[4].ToString().Trim();
                    cde.MC = sr[5].ToString().Trim();
                    cde.MC_Name = sr[6].ToString().Trim();
                    cde.MC_COM = sr[7].ToString().Trim();
                    cde.OTel_Zone = sr[8].ToString().Trim();
                    cde.OTel = sr[9].ToString().Trim();
                    cde.OTel_Sub = sr[10].ToString().Trim();
                    cde.OTel_Zone1 = sr[11].ToString().Trim();
                    cde.OTel1 = sr[12].ToString().Trim();
                    cde.OTel_Sub1 = sr[13].ToString().Trim();
                    cde.HTel_Zone = sr[14].ToString().Trim();
                    cde.HTel = sr[15].ToString().Trim();
                    cde.HTel_Zone1 = sr[16].ToString().Trim();
                    cde.HTel1 = sr[17].ToString().Trim();
                    cde.MTel1 = sr[18].ToString().Trim();
                    cde.MTel2 = sr[19].ToString().Trim();
                    cde.MTel3 = sr[20].ToString().Trim();
                    cde.Fax_Zone = sr[21].ToString().Trim();
                    cde.Fax = sr[22].ToString().Trim();
                    cde.Fax_Zone1 = sr[23].ToString().Trim();
                    cde.Fax1 = sr[24].ToString().Trim();
                    cde.M_SD = sr[25].ToString().Trim();
                    cde.EMail = sr[26].ToString().Trim();
                    cde.OCity = sr[27].ToString().Trim();
                    cde.OTown = sr[28].ToString().Trim();
                    cde.OZipCode = sr[29].ToString().Trim();
                    cde.O_Address = sr[30].ToString().Trim();
                    cde.HCity = sr[31].ToString().Trim();
                    cde.HTown = sr[32].ToString().Trim();
                    cde.HZipCode = sr[33].ToString().Trim();
                    cde.H_Address = sr[34].ToString().Trim();
                    cde.Recipient = sr[35].ToString().Trim();
                    cde.Inv_Money = sr[36].ToString().Trim();
                    cde.Analyst = sr[37].ToString().Trim();
                    cde.Product = sr[38].ToString().Trim();
                    cde.Program = sr[39].ToString().Trim();
                    cde.M_Note = sr[40].ToString().Trim();
                    cde.M_Num = sr[41].ToString().Trim();
                    cde.M_Password = sr[42].ToString().Trim();
                    cde.Light_Status = sr[43].ToString().Trim();
                    cde.MRYGC_tag = sr[44].ToString().Trim();
                    cde.N_Call_tag = sr[45].ToString().Trim();
                    cde.LongTag_Date = sr[46].ToString().Trim();
                    cde.add_date = sr[47].ToString().Trim();
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'cde' :" + cde, className, methodName);
        return cde;
    }
    public List<midMNameEntity> getMidMNameEntityList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<midMNameEntity> minList = new List<midMNameEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            midMNameEntity min = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    min = new midMNameEntity();
                    min.M_id = sr[0].ToString().Trim();
                    min.M_Name = sr[1].ToString().Trim();
                    //min.M_Num = sr[2].ToString().Trim();
                    minList.Add(min);

                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(minList.ToString(), className, methodName);
        return minList;
    }

    public List<string> getKeyWordList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<string> KeyWordList = new List<string>();
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
                    KeyWordList.Add(sr[0].ToString().Trim());
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'KeyWordList':" + KeyWordList.ToString(), className, methodName);
        return KeyWordList;
    }

    /// <summary>
    /// 查詢是否有會員編號
    /// </summary>
    /// <param name="M_Num"></param>
    /// <returns></returns>
    public string hasMnum(string connectionStrings, string commandText)
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

    /// <summary>
    /// 查詢是否有手機號碼號
    /// </summary>
    /// <returns></returns>
    public string hasMTel(string connectionStrings, string commandText, string MTel)
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
                int n = 0;
                while (sr.Read())
                {
                    if (n == 0)
                    {
                        for (var i = 0; i < 3; i++)
                        {
                            if (MTel == sr[i].ToString().Trim())
                            {
                                backString = sr[i].ToString().Trim();
                                break;
                            }
                        }
                        n += 1;
                    }
                    else
                    {
                        break;
                    }

                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'backString' :" + backString, className, methodName);
        return backString;
    }


    /// <summary>
    /// 查詢是業務名稱
    /// </summary>
    /// <returns></returns>
    public string getMCname(string connectionStrings, string commandText)
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

    public List<customerDataEntity> getCustomerInTheLastOneMonth(string connectionStrings, string commandText)
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


    public List<customerDataEntity> getCustomerDetail(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<customerDataEntity> cdeList = new List<customerDataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            customerDataEntity cde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    cde = new customerDataEntity();
                    cde.M_ID = sr[0].ToString().Trim();
                    cde.M_Name = sr[1].ToString().Trim();
                    cde.MC_Name = sr[2].ToString().Trim();
                    cde.MC_COM = sr[3].ToString().Trim();
                    cdeList.Add(cde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'cdeList' :" + cdeList.ToString(), className, methodName);
        return cdeList;
    }


    public customerDataEntity getMMBERdata(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        customerDataEntity cde = new customerDataEntity();
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

                    cde.M_ID = sr[0].ToString().Trim();
                    cde.MC = sr[1].ToString().Trim();
                    cde.MC_COM = sr[2].ToString().Trim();
                    cde.MC_Name = sr[3].ToString().Trim();
                    cde.MTel1 = sr[4].ToString().Trim();
                    cde.MTel2 = sr[5].ToString().Trim();
                    cde.MTel3 = sr[6].ToString().Trim();

                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'cde' :" + cde.ToString(), className, methodName);
        return cde;
    }

    public string getUpToDateMid(string connectionStrings, string commandText)
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


}