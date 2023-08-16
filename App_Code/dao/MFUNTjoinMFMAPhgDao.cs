using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

/// <summary>
/// MFMAPhgDao 的摘要描述
/// </summary>
public class MFUNTjoinMFMAPhgDao : System.Web.UI.Page
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MFUNTjoinMFMAPhgDao _instance = new MFUNTjoinMFMAPhgDao();
    public static MFUNTjoinMFMAPhgDao Instance
    {
        get
        {
            return _instance;
        }
    }

    public MFUNTjoinMFMAPhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //20220727
    //取得可執行的功能清單
    public List<contentAuthorityEntity> searchContentAuthority(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num : '" + U_Num, className, methodName);
        //session
        //string commandText = "select b.link_page,b.info_id,a.MF_id,U_Num,U_Name,b.Info_Name from MFMAP a left join MFUNT b on a.MF_id=b.Auto_id where a.del_tag = '0' and b.del_tag = '0' and a.U_NUM='{0}' and a.Per_open='1' order by I_sort";
        string commandText = "select a.auto_id,a.Info_id,a.Info_Name,a.Note,b.per_open from MFUNT a left join MFMAP b on a.auto_id = b.MF_id where b.U_Num = '{0}'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, U_Num));
        //List<contentAuthorityEntity> caeList = MFMAPjoinMFUNThgSql.Instance.searchContentAuthority(connectionStrings, sbCommandText.ToString());
        List<contentAuthorityEntity> caeList = MFUNTjoinMFMAPhgSql.Instance.searchContentAuthority(connectionStrings, sbCommandText.ToString());

        log.endWrite(caeList.ToString(), className, methodName);
        return caeList;
    }
    //20221004進度
    //1.將畫面上的checkbox取出 並把權限設為False
    //2.將畫面上有勾選的checkbox取出 並把權限上為True
    //value:有勾選到的項目
    public List<contentAuthorityEntity> setMFMAPreportData(string[] Check_Item_Ary_ALL,string[] value, string U_NUM,string EditU_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num : '" + U_Num, className, methodName);
        string U_Num = "";
        //20220801進度
        //step1先將畫面上指定帳號可執行的功能權限全部關閉(per_open=0)
        string commandTextper_all_Close = "update [HG].[dbo].[MFMAP] set per_open=0 where U_Num='" + EditU_Num + "'";
        //20220801進度
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandTextper_all_Close;
            int i = cmd.ExecuteNonQuery();//傳回影響筆數

            //step2再將選中可執行的功能權限開啟(per_open=1)
            foreach (var item in value)//value:[Info_id]
            {
                string commandTextGetAuto_id = "select auto_id from MFUNT where Info_id='" + item + "'";
                string Auto_id = GetValueBYSQL(conn, commandTextGetAuto_id);
                string commandText_per_open = "update [HG].[dbo].[MFMAP] set per_open=1 where MF_id='" + Auto_id + "'" + " AND U_Num='" + U_NUM + "'";
                SqlCommand command_per_open = new SqlCommand();
                command_per_open.Connection = conn;
                command_per_open.CommandText = commandText_per_open;
                if (conn.State.ToString() == "Closed")
                {
                    conn.Open();
                    int j = command_per_open.ExecuteNonQuery();//傳回影響筆數
                }

            }
            //Server.Transfer("MFUNT_report.aspx");//返回頁
            //Response.Redirect("~/User/MUSER_query.aspx");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('權限已完成更新!!');", true);
            //string commandText = "select b.link_page,b.info_id,a.MF_id,U_Num,U_Name,b.Info_Name from MFMAP a left join MFUNT b on a.MF_id=b.Auto_id where a.del_tag = '0' and b.del_tag = '0' and a.U_NUM='{0}' and a.Per_open='1' order by I_sort";
            string commandText = "select b.link_page,b.info_id,a.MF_id,U_Num,U_Name,b.Info_Name from MFMAP a left join MFUNT b on a.MF_id=b.Auto_id where a.del_tag = '0' and b.del_tag = '0' and a.U_NUM='{0}'  order by I_sort";
            // string commandText = "select a.auto_id,a.Info_id,a.Info_Name,a.Note,b.per_open from MFUNT a left join MFMAP b on a.auto_id = b.MF_id where b.U_Num = '{0}'";
            StringBuilder sbCommandText = new StringBuilder();
            sbCommandText.Append(string.Format(commandText, U_Num));
            List<contentAuthorityEntity> caeList = MFMAPjoinMFUNThgSql.Instance.searchContentAuthority(connectionStrings, sbCommandText.ToString());
            return caeList;
            //  List<contentAuthorityEntity> caeList = MFUNTjoinMFMAPhgSql.Instance.searchContentAuthority(connectionStrings, sbCommandText.ToString());

            //  log.endWrite(caeList.ToString(), className, methodName);
            //List<contentAuthorityEntity> caeList=new List<contentAuthorityEntity> caeList<>;
        }
    }
    //首頁權限更新
    //setUpdateHomePageData
    public List<contentAuthorityEntity> setUpdateHomePageData(string[] Check_Item_Ary_ALL, string[] value, string U_NUM, string EditU_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num : '" + U_Num, className, methodName);
        string U_Num = "";
        //20220801進度
        //step1先將指定帳號可執行的功能權限全部關閉(per_open=0)
        string commandTextper_all_Close = "update [HG].[dbo].[MFMAP] set per_open='0' where U_Num='" + U_NUM + "'";
        //20220801進度
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandTextper_all_Close;
            int i = cmd.ExecuteNonQuery();//傳回影響筆數(先將指定帳號可執行的功能權限全部關閉(per_open=0))

            //step2再將選中可執行的功能權限開啟(per_open=1)
            foreach (var item in value)//value:[Info_id]
            {
                //string commandTextGetAuto_id = "select auto_id from MFMAP where Info_id='" + item + "'";
                string commandTextGetAuto_id = "select auto_id from MFUNT where Info_id='" + item + "'";
                string Auto_id = GetValueBYSQL(conn, commandTextGetAuto_id);
                string commandText_per_open = "update [HG].[dbo].[MFMAP] set per_open='1' where MF_id='" + Auto_id + "'" + " AND U_Num='" + U_NUM + "'";
                SqlCommand command_per_open = new SqlCommand();
                command_per_open.Connection = conn;
                command_per_open.CommandText = commandText_per_open;
                if (conn.State.ToString() == "Closed")
                {
                    conn.Open();
                    int j = command_per_open.ExecuteNonQuery();//傳回影響筆數
                }

            }
            //Server.Transfer("MFUNT_report.aspx");//返回頁
            //Response.Redirect("~/User/MUSER_query.aspx");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('報表權限已完成更新!!');", true);
            //string commandText = "select b.link_page,b.info_id,a.MF_id,U_Num,U_Name,b.Info_Name from MFMAP a left join MFUNT b on a.MF_id=b.Auto_id where a.del_tag = '0' and b.del_tag = '0' and a.U_NUM='{0}' and a.Per_open='1' order by I_sort";
            string commandText = "select b.link_page,b.info_id,a.MF_id,U_Num,U_Name,b.Info_Name from MFMAP a left join MFUNT b on a.MF_id=b.Auto_id where a.del_tag = '0' and b.del_tag = '0' and a.U_NUM='{0}'  order by I_sort";
            // string commandText = "select a.auto_id,a.Info_id,a.Info_Name,a.Note,b.per_open from MFUNT a left join MFMAP b on a.auto_id = b.MF_id where b.U_Num = '{0}'";
            StringBuilder sbCommandText = new StringBuilder();
            sbCommandText.Append(string.Format(commandText, U_Num));
            List<contentAuthorityEntity> caeList = MFMAPjoinMFUNThgSql.Instance.searchContentAuthority(connectionStrings, sbCommandText.ToString());
            return caeList;
            //  List<contentAuthorityEntity> caeList = MFUNTjoinMFMAPhgSql.Instance.searchContentAuthority(connectionStrings, sbCommandText.ToString());

            //  log.endWrite(caeList.ToString(), className, methodName);
            //List<contentAuthorityEntity> caeList=new List<contentAuthorityEntity> caeList<>;
        }

    }
    ////設定使用者報表權限
    public List<contentAuthorityEntity> setMFUNTreportData(string[] Check_Item_Ary_ALL,string[] value, string U_NUM,string EditU_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num : '" + U_Num, className, methodName);
        string U_Num = "";
        //20220801進度
        //step1先將指定帳號可執行的功能權限全部關閉(per_open=0)
        string commandTextper_all_Close = "update [HG].[dbo].[MRMAP] set per_open='0' where U_Num='" + U_NUM + "'";
        //20220801進度
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandTextper_all_Close;
            int i = cmd.ExecuteNonQuery();//傳回影響筆數(先將指定帳號可執行的功能權限全部關閉(per_open=0))

            //step2再將選中可執行的功能權限開啟(per_open=1)
            foreach (var item in value)//value:[Info_id]
            {
                string commandTextGetAuto_id = "select auto_id from MFUNT where Info_id='" + item + "'";
                string Auto_id = GetValueBYSQL(conn, commandTextGetAuto_id);
                string commandText_per_open = "update [HG].[dbo].[MFMAP] set per_open='1' where Auto_id='" + Auto_id + "'" + " AND U_Num='" + U_NUM + "'";
                SqlCommand command_per_open = new SqlCommand();
                command_per_open.Connection = conn;
                command_per_open.CommandText = commandText_per_open;
                if (conn.State.ToString() == "Closed")
                {
                    conn.Open();
                    int j = command_per_open.ExecuteNonQuery();//傳回影響筆數
                }

            }
            //Server.Transfer("MFUNT_report.aspx");//返回頁
            //Response.Redirect("~/User/MUSER_query.aspx");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('報表權限已完成更新!!');", true);
            //string commandText = "select b.link_page,b.info_id,a.MF_id,U_Num,U_Name,b.Info_Name from MFMAP a left join MFUNT b on a.MF_id=b.Auto_id where a.del_tag = '0' and b.del_tag = '0' and a.U_NUM='{0}' and a.Per_open='1' order by I_sort";
            string commandText = "select b.link_page,b.info_id,a.MF_id,U_Num,U_Name,b.Info_Name from MFMAP a left join MFUNT b on a.MF_id=b.Auto_id where a.del_tag = '0' and b.del_tag = '0' and a.U_NUM='{0}'  order by I_sort";
            // string commandText = "select a.auto_id,a.Info_id,a.Info_Name,a.Note,b.per_open from MFUNT a left join MFMAP b on a.auto_id = b.MF_id where b.U_Num = '{0}'";
            StringBuilder sbCommandText = new StringBuilder();
            sbCommandText.Append(string.Format(commandText, U_Num));
            List<contentAuthorityEntity> caeList = MFMAPjoinMFUNThgSql.Instance.searchContentAuthority(connectionStrings, sbCommandText.ToString());
            return caeList;
            //  List<contentAuthorityEntity> caeList = MFUNTjoinMFMAPhgSql.Instance.searchContentAuthority(connectionStrings, sbCommandText.ToString());

            //  log.endWrite(caeList.ToString(), className, methodName);
            //List<contentAuthorityEntity> caeList=new List<contentAuthorityEntity> caeList<>;
        }

    }
    //value:有勾選到的項目
    public List<contentAuthorityEntity> MUSERmenusetup(string[] value, string U_NUM)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num : '" + U_Num, className, methodName);
        string U_Num = "";
        //20220801進度
        //step1先將指定帳號可執行的功能權限全部關閉(per_open=0)
        string commandTextper_all_Close = "update [HG].[dbo].[MFMAP] set per_open=0 where U_Num='" + U_NUM + "'";
        //20220801進度
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandTextper_all_Close;
            int i = cmd.ExecuteNonQuery();//傳回影響筆數

            //step2再將選中可執行的功能權限開啟(per_open=1)
            foreach (var item in value)//value:[Info_id]
            {
                string commandTextGetAuto_id = "select auto_id from MFUNT where Info_id='" + item + "'";
                string Auto_id = GetValueBYSQL(conn, commandTextGetAuto_id);
                string commandText_per_open = "update [HG].[dbo].[MFMAP] set per_open=1 where MF_id='" + Auto_id + "'" +" AND U_Num='" + U_NUM + "'";
                SqlCommand command_per_open = new SqlCommand();
                command_per_open.Connection = conn;
                command_per_open.CommandText = commandText_per_open;
                if (conn.State.ToString()=="Closed")
                {
                    conn.Open();
                    int j = command_per_open.ExecuteNonQuery();//傳回影響筆數
                }
               
            }
            //Server.Transfer("MFUNT_report.aspx");//返回頁
            //Response.Redirect("~/User/MUSER_query.aspx");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('權限已完成更新!!');", true);
            //string commandText = "select b.link_page,b.info_id,a.MF_id,U_Num,U_Name,b.Info_Name from MFMAP a left join MFUNT b on a.MF_id=b.Auto_id where a.del_tag = '0' and b.del_tag = '0' and a.U_NUM='{0}' and a.Per_open='1' order by I_sort";
            string commandText = "select b.link_page,b.info_id,a.MF_id,U_Num,U_Name,b.Info_Name from MFMAP a left join MFUNT b on a.MF_id=b.Auto_id where a.del_tag = '0' and b.del_tag = '0' and a.U_NUM='{0}'  order by I_sort";
            // string commandText = "select a.auto_id,a.Info_id,a.Info_Name,a.Note,b.per_open from MFUNT a left join MFMAP b on a.auto_id = b.MF_id where b.U_Num = '{0}'";
            StringBuilder sbCommandText = new StringBuilder();
            sbCommandText.Append(string.Format(commandText, U_Num));
            List<contentAuthorityEntity> caeList = MFMAPjoinMFUNThgSql.Instance.searchContentAuthority(connectionStrings, sbCommandText.ToString());
            return caeList;
            //  List<contentAuthorityEntity> caeList = MFUNTjoinMFMAPhgSql.Instance.searchContentAuthority(connectionStrings, sbCommandText.ToString());

            //  log.endWrite(caeList.ToString(), className, methodName);
            //List<contentAuthorityEntity> caeList=new List<contentAuthorityEntity> caeList<>;
        }

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
        DataSet ds=new DataSet();
        //conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
        //conn.Open();
        //SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        //cmd.CommandText = tsql;
        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
        adapter.Fill(ds, "U_MDEP");//取出所有會場編號
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
}