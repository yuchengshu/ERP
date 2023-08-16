using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;
using System.Data;

/// <summary>
/// DTRAThgSql 的摘要描述
/// </summary>
public class DTRAThgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static DTRAThgSql _instanct = new DTRAThgSql();
    public static DTRAThgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public DTRAThgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<chargeDetailEntity> getChargeDetailList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<chargeDetailEntity> cdeList = new List<chargeDetailEntity>();

        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            chargeDetailEntity cde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    cde = new chargeDetailEntity();
                    cde.DT_ID = sr[0].ToString().Trim();
                    cde.Pay_tag = sr[1].ToString().Trim();
                    cde.Account_Date = sr[2].ToString().Trim();
                    cde.MC = sr[3].ToString().Trim();
                    cde.MC_Name = sr[4].ToString().Trim();
                    cde.Account_Money = sr[5].ToString().Trim();
                    cde.Pay_Type = sr[6].ToString().Trim();
                    cde.T_ID = sr[7].ToString().Trim();
                    cde.T_Com = sr[8].ToString().Trim();
                    cdeList.Add(cde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(cdeList.ToString(), className, methodName);
        return cdeList;
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
        //conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
        //conn.Open();
        //SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        //cmd.CommandText = tsql;
        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
        adapter.Fill(dt);
        //20221020修正!!!!
        //已經開啟一個與這個 Command 相關的 DataReader，必須先將它關閉。

        //取出所有會場編號
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
    //SELECT T_ID, inv_createdate,* FROM NEW_VINVO where inv_createdate is not null and del_tag = '0' and fs_tag = '0'and mt_com = 'TK'--and M_ID = '2018121713310336'
    public List<OINVO_query_01Entity> getOINVODataList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<OINVO_query_01Entity> OINVODataList = new List<OINVO_query_01Entity>();
        OINVO_query_01Entity oinvo_01 = null;
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            SqlCommand cmd2 = new SqlCommand();
            cmd2.Connection = conn;
            SqlCommand cmd3 = new SqlCommand();
            cmd3.Connection = conn;
            SqlCommand cmd4 = new SqlCommand();
            cmd4.Connection = conn;
            SqlCommand cmd5 = new SqlCommand();
            cmd4.Connection = conn;
            //cmd2.CommandText = commandText;
            string MP_Title = "";
            string ddesc = "";
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    oinvo_01 = new OINVO_query_01Entity();
                    oinvo_01.T_ID = sr[0].ToString().Trim();//交易編號
                    oinvo_01.inv_createdate = sr[1].ToString().Trim();//開立日期
                    oinvo_01.U_MDEP = sr[2].ToString().Trim();
                    oinvo_01.M_ID= sr[3].ToString().Trim();
                    oinvo_01.M_Name = sr[4].ToString().Trim();//取得客戶名稱
                    //oinvo_01.MP_Name
                    //取得種類
                    using (SqlConnection conn3 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
                    {
                        cmd2.CommandText = "SELECT MP from New_VINVO where T_ID='" + oinvo_01.T_ID + "'";
                        string MP = GetValueBYSQL(conn3, cmd2.CommandText);
                        cmd5.CommandText = "SELECT [U_Name] FROM [HG].[dbo].[MUSER] a where a.U_Num ='" + MP + "'";
                        MP_Title = GetValueBYSQL(conn3, cmd5.CommandText);//分析師名稱
                        cmd4.CommandText = "SELECT T_Item from New_VINVO where T_ID='" + oinvo_01.T_ID + "'";
                        string T_Item = GetValueBYSQL(conn3, cmd4.CommandText);
                        cmd3.CommandText = "Select DDESC from MITEM where mitcode='" + MP + "' and ditcode='"+ T_Item + "'";
                        ddesc = GetValueBYSQL(conn3, cmd3.CommandText);//取得種類
                        //oinvo_01.Analyst_Kind = MP_Title+"-"+ddesc//陳飛龍 - 課程-線上 
                    }
                    oinvo_01.Analyst_Kind = MP_Title + "-" + ddesc;//陳飛龍 - 課程-線上 
                    oinvo_01.M_Sax = sr[5].ToString().Trim();//性別
                    oinvo_01.T_PayMoney= sr[62].ToString().Trim();//金額
                    oinvo_01.Inv_num = sr[71].ToString().Trim();//發票號碼
                    oinvo_01.Inv_item=sr[64].ToString().Trim();//發票種類(轉成文字說明)
                    oinvo_01.mt_com = sr[74].ToString().Trim();//金流
                    //發票明細
                    //oinvo_01.Inv_Comname = sr[66].ToString().Trim();//公司抬頭
                    //oinvo_01.INV_UnifyNum = sr[67].ToString().Trim();//公司統編()
                    
                    if(sr[74].ToString().Trim() == "HK")
                    {
                        oinvo_01.mt_com = "華冠";
                    }
                    else if(sr[74].ToString().Trim() == "TK")
                        {
                        oinvo_01.mt_com = "天酷";
                    }
                    if (sr[64].ToString().Trim()=="1")
                    {
                        oinvo_01.Inv_item = "二聯";
                    }
                    else if (sr[64].ToString().Trim() == "2")
                    {
                        oinvo_01.Inv_item = "三聯";
                    }
                    else if (sr[64].ToString().Trim() == "3")
                    {
                        oinvo_01.Inv_item = "特種";
                    }
                    oinvo_01.Inv_Comname = sr[66].ToString().ToString();//公司抬頭
                    oinvo_01.INV_UnifyNum = sr[67].ToString().ToString();//公司統編
                    oinvo_01.Inv_SendState = sr[68].ToString().ToString();//寄發狀況(轉成文字說明)
                    if (sr[68].ToString().Trim() == "1")
                    {
                        oinvo_01.Inv_SendState = "正常";
                    }
                    else if (sr[68].ToString().Trim() == "2")
                    {
                        oinvo_01.Inv_SendState = "<font color=red>空白信封</font>";
                    }
                    else if (sr[68].ToString().Trim() == "3")
                    {
                        oinvo_01.Inv_SendState = "<font color=red>發票轉交業務</font>";
                    }
                    else if (sr[68].ToString().Trim() == "4")
                    {
                        oinvo_01.Inv_SendState = "<font color=red>不寄</font>";
                    }
                    else if (sr[68].ToString().Trim() == "5")
                    {
                        oinvo_01.Inv_item = "<font color=red>捐贈</font>";
                    }
                    //取得付款方式
                    using (SqlConnection conn2 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
                    {
                        cmd2.CommandText = "SELECT Pay_Type from DTRAT where T_ID='" + oinvo_01.T_ID + "'";
                        string Pay_Type = GetValueBYSQL(conn2, cmd2.CommandText);
                        cmd3.CommandText = "Select DDESC from MITEM where ditcode='" + Pay_Type + "' and mitcode='PITEM'";
                        ddesc = GetValueBYSQL(conn2, cmd3.CommandText);//付款方式
                    }
                    oinvo_01.Pay_Type = ddesc;//付款方式
                   
                    OINVODataList.Add(oinvo_01);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'OINVODataList' :" + OINVODataList.ToString(), className, methodName);
        return OINVODataList;
    }


    public List<OINVO_query_02Entity> getOINVOData02List(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
    StringBuilder sb = new StringBuilder();
    sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<OINVO_query_02Entity> OINVODataList = new List<OINVO_query_02Entity>();
        OINVO_query_02Entity oinvo_02= null;
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
{
    conn.Open();
    SqlCommand cmd = new SqlCommand();
    cmd.Connection = conn;
    cmd.CommandText = commandText;
    SqlCommand cmd2 = new SqlCommand();
    cmd2.Connection = conn;
    SqlCommand cmd3 = new SqlCommand();
    cmd3.Connection = conn;
    SqlCommand cmd4 = new SqlCommand();
    cmd4.Connection = conn;
    SqlCommand cmd5 = new SqlCommand();
    cmd4.Connection = conn;
    //cmd2.CommandText = commandText;
    string MP_Title = "";
    string ddesc = "";
    using (SqlDataReader sr = cmd.ExecuteReader())
    {
        while (sr.Read())
        {
                    oinvo_02 = new OINVO_query_02Entity();
                    oinvo_02.T_ID = sr[0].ToString().Trim();//交易編號
                    oinvo_02.inv_createdate = sr[1].ToString().Trim();//開立日期
                    oinvo_02.U_MDEP = sr[2].ToString().Trim();
                    oinvo_02.M_ID = sr[3].ToString().Trim();
                    oinvo_02.M_Name = sr[4].ToString().Trim();//取得客戶名稱
                                                      //oinvo_01.MP_Name
                                                      //取得種類
            using (SqlConnection conn3 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
            {
                cmd2.CommandText = "SELECT MP from New_VINVO where T_ID='" + oinvo_02.T_ID + "'";
                string MP = GetValueBYSQL(conn3, cmd2.CommandText);
                cmd5.CommandText = "SELECT [U_Name] FROM [HG].[dbo].[MUSER] a where a.U_Num ='" + MP + "'";
                MP_Title = GetValueBYSQL(conn3, cmd5.CommandText);//分析師名稱
                cmd4.CommandText = "SELECT T_Item from New_VINVO where T_ID='" + oinvo_02.T_ID + "'";
                string T_Item = GetValueBYSQL(conn3, cmd4.CommandText);
                cmd3.CommandText = "Select DDESC from MITEM where mitcode='" + MP + "' and ditcode='" + T_Item + "'";
                ddesc = GetValueBYSQL(conn3, cmd3.CommandText);//取得種類
                                                               //oinvo_01.Analyst_Kind = MP_Title+"-"+ddesc//陳飛龍 - 課程-線上 
            }
                    oinvo_02.Analyst_Kind = MP_Title + "-" + ddesc;//陳飛龍 - 課程-線上 
                    oinvo_02.M_Sax = sr[5].ToString().Trim();//性別
                    oinvo_02.T_PayMoney = sr[62].ToString().Trim();//金額
                    oinvo_02.Inv_num = sr[71].ToString().Trim();//發票號碼
                    oinvo_02.Inv_item = sr[64].ToString().Trim();//發票種類(轉成文字說明)
                    oinvo_02.mt_com = sr[74].ToString().Trim();//金流
                                                       //發票明細
                                                       //oinvo_01.Inv_Comname = sr[66].ToString().Trim();//公司抬頭
                                                       //oinvo_01.INV_UnifyNum = sr[67].ToString().Trim();//公司統編()

            if (sr[74].ToString().Trim() == "HK")
            {
                        oinvo_02.mt_com = "華冠";
            }
            else if (sr[74].ToString().Trim() == "TK")
            {
                        oinvo_02.mt_com = "天酷";
            }
            if (sr[64].ToString().Trim() == "1")
            {
                        oinvo_02.Inv_item = "二聯";
            }
            else if (sr[64].ToString().Trim() == "2")
            {
                        oinvo_02.Inv_item = "三聯";
            }
            else if (sr[64].ToString().Trim() == "3")
            {
                        oinvo_02.Inv_item = "特種";
            }
                    oinvo_02.Inv_Comname = sr[66].ToString().ToString();//公司抬頭
                    oinvo_02.INV_UnifyNum = sr[67].ToString().ToString();//公司統編
                    oinvo_02.Inv_SendState = sr[68].ToString().ToString();//寄發狀況(轉成文字說明)
            if (sr[68].ToString().Trim() == "1")
            {
                        oinvo_02.Inv_SendState = "正常";
            }
            else if (sr[68].ToString().Trim() == "2")
            {
                        oinvo_02.Inv_SendState = "<font color=red>空白信封</font>";
            }
            else if (sr[68].ToString().Trim() == "3")
            {
                        oinvo_02.Inv_SendState = "<font color=red>發票轉交業務</font>";
            }
            else if (sr[68].ToString().Trim() == "4")
            {
                        oinvo_02.Inv_SendState = "<font color=red>不寄</font>";
            }
            else if (sr[68].ToString().Trim() == "5")
            {
                        oinvo_02.Inv_item = "<font color=red>捐贈</font>";
            }
            //取得付款方式
            using (SqlConnection conn2 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
            {
                cmd2.CommandText = "SELECT Pay_Type from DTRAT where T_ID='" + oinvo_02.T_ID + "'";
                string Pay_Type = GetValueBYSQL(conn2, cmd2.CommandText);
                cmd3.CommandText = "Select DDESC from MITEM where ditcode='" + Pay_Type + "' and mitcode='PITEM'";
                ddesc = GetValueBYSQL(conn2, cmd3.CommandText);//付款方式
            }
                    oinvo_02.Pay_Type = ddesc;//付款方式

            OINVODataList.Add(oinvo_02);
        }
    }
}
//從資料庫把資料撈出來*************************************************************************************************end
log.endWrite("'OINVODataList' :" + OINVODataList.ToString(), className, methodName);
return OINVODataList;
    }

    public List<chargeDetailEntity> getChargeDetail(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<chargeDetailEntity> cdeList = new List<chargeDetailEntity>();
        chargeDetailEntity cde = null;
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
                    cde = new chargeDetailEntity();
                    cde.Pay_Type = sr[0].ToString().Trim();
                    cde.Account_Money = sr[1].ToString().Trim();
                    cde.MC_Name = sr[2].ToString().Trim();
                    cdeList.Add(cde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'cdeList' :" + cdeList.ToString(), className, methodName);
        return cdeList;
    }
}