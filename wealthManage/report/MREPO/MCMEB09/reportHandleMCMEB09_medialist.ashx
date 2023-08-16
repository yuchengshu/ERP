<%@ WebHandler Language="C#" Class="reportHandleMCMEB09_medialist" %>

using System;
using System.Web;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
using System.Web.Configuration;

public class reportHandleMCMEB09_medialist : IHttpHandler
{

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    private static string connectionStrings = "sqlConnectHG_Test";
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string MR_DateY = string.Empty;
        string MR_DateM = string.Empty;
        string MP = string.Empty;
        string T_ID = string.Empty;
        string M_ID = string.Empty;
        //sql連線字串 webconfig的對應位置

        switch (action)
        {
            ///20221110進度(取回對應的資料,並顯示在畫面上)
            /// var data = "&MP_ID=" + MP_ID + "&MR_SDATE=" + MR_SDATE + "&MR_EDATE=" + MR_EDATE + "&action=getMCMEB09_youtubelistData";
            /// var data = "MR_DateY=" + MR_DateY_G + "&MR_DateM=" + MR_DateM_G + "&MP=" + val_M("#MP") + "&action=getMCMEB09DataList";
            /// var data = "P_ID=" + P_ID + "&MR_DateY=" + MR_DateY + "&MR_DateM=" + MR_DateM + "&action=getMCMEB09_youtubelistData"
            //http://localhost:13333/wealthManage/report/MREPO/MCMEB09/MCMEB09_youtubelist.aspx?P_ID=D9907161&MR_DateY=2022&MR_DateM_G=1
            case "getMCMEB09_mediallistData"://
                M_ID = context.Request["M_ID"];//分析師編號

                MR_DateY = context.Request["MR_DateY"];
                MR_DateM = context.Request["MR_DateM"];
                ///20221110進度(取回對應的資料,並顯示在畫面上)
                context.Response.Write(getMCMEB09_mediallistData(M_ID, MR_DateY, MR_DateM));
                break;

            case "getMCMEB09DataList"://由aspx呼叫
                MR_DateY = context.Request["MR_DateY"];
                MR_DateM = context.Request["MR_DateM"];
                MP = context.Request["MP"];//如果為空值(NULL),則查詢所有人


                if (MP == null)
                {
                    MP = "";
                }
                context.Response.Write(getMCMEB09DataList(MR_DateY, MR_DateM, MP));
                break;
            case "getMediaClickStatistics":
                MR_DateY = context.Request["MR_DateY"];
                MR_DateM = context.Request["MR_DateM"];
                MP = context.Request["MP"];
                context.Response.Write(getMediaClickStatistics(MR_DateY, MR_DateM, MP));
                break;
            case "getClickDetail":
                string type = context.Request["type"];
                string t_id = context.Request["t_id"];
                MR_DateY = context.Request["MR_DateY"];
                MR_DateM = context.Request["MR_DateM"];

                context.Response.Write(getClickDetail(type, t_id, MR_DateY, MR_DateM));
                break;
        };
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
        try
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
            adapter.Fill(dt);//取出所有會場編號
                             //int V_ID_Count = dt.Rows.Count;
                             //List<SRMVENUEntity> SRMVENUEntityList = new List<SRMVENUEntity>();
                             //for (int i = 0; i < V_ID_Count; i++)
                             //{
                             //    string V_ID=dt[i][0].
                             //}
        }
        catch (Exception ex)
        {

            throw;
        }
        //SqlDataAdapter adapter = new SqlDataAdapter();
        //adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
        //adapter.Fill(dt);//取出所有會場編號
        //                 //int V_ID_Count = dt.Rows.Count;
        //                 //List<SRMVENUEntity> SRMVENUEntityList = new List<SRMVENUEntity>();
        //                 //for (int i = 0; i < V_ID_Count; i++)
        //                 //{
        //                 //    string V_ID=dt[i][0].
        //                 //}
        foreach (DataRow row in dt.Rows)
        {
            //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
            value = row[0].ToString();
        }
        conn.Close();
        //}
        return value;
    }
    //20221110進度
    public string getMCMEB09_mediallistData(string M_ID, string MR_DateY, string MR_DateM)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        List<ClickDetailEntity> getMCMEB09_medialist_Click = new List<ClickDetailEntity>();
        //log.startWrite(" 'MR_DateY' : " + MR_DateY + " 'MR_DateM' : " + MR_DateM + " 'MP' : " + MP, className, methodName);
        if (M_ID != "")
        {
            string T_ID = "";
            //加入由分析師編號取得T_ID
            string GetTIDfromU_Num = "select t_id from WAnalysts where U_Num='" + M_ID + "'";
            // GetChfromU_Num = "select Ch from WAnalysts where U_Num='" + item + "'";
            //if (P_ID == "D0312152")//王瞳
            //{
            //    GetChfromU_Num = "select Ch from WAnalysts where U_Num='D0312152' or U_Num='D0312153'";
            //}
            //if (P_ID == "")//不限
            //{
            //    GetChfromU_Num = "select Ch from WAnalysts where U_Num='D0312152' or U_Num='D0312153'";
            //}
            if (M_ID.Length > 4)
            {
                using (SqlConnection conn_GetValueBYSQL = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
                {
                    T_ID = GetValueBYSQL(conn_GetValueBYSQL, GetTIDfromU_Num);
                }
            }
            else
            {
                T_ID = M_ID;
            }
            //取得[Youtube - 總點閱](影音點閱)明細
            getMCMEB09_medialist_Click = reportServiceMCMEB09.Instance.getClickDetail("media", T_ID, MR_DateY, MR_DateM);//<==========
            log.endWrite("'getMCMEB09_youtubelist_Click' : " + getMCMEB09_medialist_Click.ToString(), className, methodName);
            return Newtonsoft.Json.JsonConvert.SerializeObject(getMCMEB09_medialist_Click);
        }
        log.endWrite("'mcseList' : " + getMCMEB09_medialist_Click.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(getMCMEB09_medialist_Click);
    }


    //20221107進度!!
    public string getMCMEB09DataList(string MR_DateY, string MR_DateM, string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        List<MCMEB09Entity> mcseList = new List<MCMEB09Entity>();
        //log.startWrite(" 'MR_DateY' : " + MR_DateY + " 'MR_DateM' : " + MR_DateM + " 'MP' : " + MP, className, methodName);
        if (MP != "")
        {
            mcseList = reportServiceMCMEB09.Instance.getReportHandlerMCMEB09DataList(MP, MR_DateY, MR_DateM);//<==========
            log.endWrite("'mcseList' : " + mcseList.ToString(), className, methodName);
            return Newtonsoft.Json.JsonConvert.SerializeObject(mcseList);
        }
        log.endWrite("'mcseList' : " + mcseList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(mcseList);
    }

    public string getMediaClickStatistics(string MR_DateY, string MR_DateM, string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'MR_DateY' : " + MR_DateY + " 'MR_DateM' : " + MR_DateM + " 'MP' : " + MP, className, methodName);

        List<MediaClickStatisticsEntity> mcseList = reportServiceMCMEB09.Instance.getMediaClickStatistics(MR_DateY, MR_DateM, MP);//<==========

        log.endWrite("'mcseList' : " + mcseList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(mcseList);
    }

    public string getClickDetail(string type, string t_id, string MR_DateY, string MR_DateM)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'type' : " + type + " 't_id' : " + t_id + " 'MR_DateY' : " + MR_DateY + " 'MR_DateM' : " + MR_DateM, className, methodName);

        List<ClickDetailEntity> cdeList = reportServiceMCMEB09.Instance.getClickDetail(type, t_id, MR_DateY, MR_DateM);//<==========

        log.endWrite("'cdeList' : " + cdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cdeList);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}