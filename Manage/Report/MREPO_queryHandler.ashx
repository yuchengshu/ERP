<%@ WebHandler Language="C#" Class="MREPO_queryHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public class MREPO_queryHandler : IHttpHandler
{

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    //getMUSER_MenuSetupData
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string U_Num = context.Request["U_Num"];//所選到的員工編號
        string getEditU_Name = context.Request["getEditU_Name"];//操作者的員工編號
        string MeetingDate = context.Request["MeetingDate"];//會議日期
        string MP_Name = context.Request["MP_Name"];//姓名
        string MP_ID = context.Request["MP_ID"];//分析師編號
        string IP_M = context.Request["IP_M"];
        string M_Name = "";
        string Undefined_var = null;
        string U_Name = "";
        bool boola = String.IsNullOrWhiteSpace(Undefined_var);
        bool boolb = String.IsNullOrEmpty(Undefined_var);
        //string M_Name= context.Request["M_Name"];//客戶姓名
        if (context.Request["keyWord"] == Undefined_var)
        {
            M_Name = "";
        }
        else
        {
            M_Name = context.Request["keyWord"];
        }


        switch (action)
        {//updateMREPO_queryData
            case "updateMREPO_queryData":
                //var REPO_no = context.Request.Form["REPO_no"].Split(',');//員工編號(所選到的)------o
                var REPO_no = context.Request.Form["REPO_no"];
                var TrueOrFalse = context.Request.Form["TrueOrFalse"];//員工編號(所選到的)------o
                var User_Num = context.Request.Form["User_Num"];//員工編號(所選到的)------o
                context.Response.Write(updateMREPO_queryData(REPO_no, TrueOrFalse, User_Num));
                break;
            case "Reset"://Check_Item_Ary_ALL
                var Check_Item_Ary_ALL = context.Request["Check_Item_Ary_ALL"].Split(',');//求出畫面中所有checkbox的值
                U_Num = context.Request.Form["U_Num"];//員工編號(所選到的)------o
                context.Response.Write(Reset(Check_Item_Ary_ALL, U_Num, getEditU_Name, IP_M));
                break;

            case "Update"://更改員工資料維護作業-報表權限
                var Check_Item_Ary = context.Request["Check_Item_Ary"].Split(',');//畫面中有勾選到的項目(代碼)
                U_Num = context.Request.Form["U_Num"];//員工編號(所選到的)------o
                U_Name = context.Request.Form["U_Name"];//員工姓名(所選到的)------o
                context.Response.Write(Update(Check_Item_Ary, U_Num, getEditU_Name, IP_M));
                break;
            case "getMREPO_qyeryDataList"://取得使用者報表權限內容
                //MeetingDate = context.Request["MeetingDate"];
                //MP_Name = context.Request["MP_Name"];//分析師(員工編號)
                //context.Response.Write(getMFUNTreportDataList());
                //string
                User_Num = context.Request["U_Num"];//要修改的員工編號
                context.Response.Write(getMREPO_qyeryDataList(User_Num));//員工資料維護作業-報表權限
                break;

            case "reportstatechenge":
                //MeetingDate = context.Request["MeetingDate"];
                //MP_Name = context.Request["MP_Name"];//分析師(員工編號)
                //context.Response.Write(getMFUNTreportDataList());
                string User_Num_M = context.Request["User_Num_M"];//要修改的員工編號
                string state = context.Request["state"];//要執行的修改的權限
                string menu_no = context.Request["menu_no"];//要修改的功能代碼
                context.Response.Write(ChangeState(User_Num_M, state, menu_no));
                break;
            //getMUSER_MenuSetupData
            case "getMUSER_MenuSetupData":

                //MeetingDate = context.Request["MeetingDate"];
                //MP_Name = context.Request["MP_Name"];//分析師(員工編號)
                //context.Response.Write(getMFUNTreportDataList());
                context.Response.Write(getMUSER_MenuSetupDataList(U_Num));
                break;


            case "getMFUNTreportData":

                //MeetingDate = context.Request["MeetingDate"];
                //MP_Name = context.Request["MP_Name"];//分析師(員工編號)
                context.Response.Write(getMFUNTreportDataList());
                break;



            case "getSRMVMEBData":
                MeetingDate = context.Request["MeetingDate"];
                MP_Name = context.Request["MP_Name"];

                //context.Response.Write();
                break;




        }

    }
    //20221004進度
    //1.將畫面上的checkbox取出 並把權限設為False
    //2.將畫面上有勾選的checkbox取出 並把權限上為True
    // Check_Item_Ary_ALL = context.Request["Check_Item_Ary_ALL"].Split(',');//畫面中所有checkbox的值
    public string Reset(string[] Check_Item_Ary, string U_Num, string U_Name, string IP_M)
    {
        //string commandText = "SELECT [REPO_no],[REPO_id] FROM [HG].[dbo].[MREPO] where REPO_id='" + Repo_name + "'";
        string connectionStrings = "sqlConnectHG_Test_TEST";
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string Repo_no = "";
        string UpdatePER_ = "";
        //log.startWrite("'StartDate;':"+StartDate+"'EndDate;':"+EndDate+"'keyWord;':"+keyWord, className, methodName);
        foreach (var Repo_id in Check_Item_Ary)
        {
            // result = reportService.Instance.setReportRight(item);//<==========
            using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
            {
                SqlConnection connection = conn;
                string commandText = "SELECT [REPO_no],[REPO_id] FROM [HG].[dbo].[MREPO] where REPO_id='" + Repo_id + "'";//由Repo_id取的報表REPO_no

                //conn.ConnectionString = connectionStrings;
                //conn.Open();
                //conn.ConnectionString = connectionStrings;
                //conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = commandText;
                DataTable dt = new DataTable();
                string add_ip = IP_M;
                //conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
                //conn.Open();
                //SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                //cmd.CommandText = tsql;
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                adapter.Fill(dt);
                foreach (DataRow row in dt.Rows)
                {
                    //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
                    Repo_no = row[0].ToString();

                    //string GETPERfromMRMAP = "Select per_open,Repo_no from MRMAP WHERE [U_NUM]='" + U_Num + "' AND Repo_no='" + Repo_no + "'";
                    //SqlCommand GETPERfromMRMAPcmd = new SqlCommand();
                    //GETPERfromMRMAPcmd.Connection = conn;
                    //GETPERfromMRMAPcmd.CommandText = GETPERfromMRMAP;
                    //DataTable GETPERfromMRMAPcmd_dt = new DataTable();
                    //adapter.SelectCommand = GETPERfromMRMAPcmd;
                    //adapter.Fill(GETPERfromMRMAPcmd_dt);
                    //  string U_Num=
                    //此使用者使用此報表的權限不存在
                    //if (GETPERfromMRMAPcmd_dt.Rows.Count == 0)
                    //{                                                 //    0           1       2       3         4        5           6       7      
                    //    string createNEWPER = "INSERT INTO [dbo].[MRMAP]([Repo_no],[per_open],[U_NUM],[U_Name],[del_tag],[add_ip],[add_user],[add_date]) VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}', GETDATE())";
                    //    StringBuilder sbCommandText = new StringBuilder();

                    //    //   0      1      2       3     4         6         7
                    //    sbCommandText.Append(string.Format(createNEWPER, Repo_no, "1", U_Num, U_Name, 0, add_ip, U_Name, common.getDateTimeStr()));
                    //    //   StringBuilder sbCommandText = new StringBuilder(string.Format(createNEWPER, T_ID);

                    //    //     sbCommandText.Append(string.Format(commandText, Repo_no,"1",Session["U_Num"],));
                    //    noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<=====================
                    //}
                    //else
                    //{   //加入判斷per_open是否為0,如為0則更新為per_open為1,如不為0則不動作
                    //string pero_open = GETPERfromMRMAPcmd_dt.Rows[0][0].ToString().Trim();
                    //if (pero_open == "0")
                    //{
                    string UpdatePER = "UPDATE [dbo].[MRMAP] SET [per_open] = '0' WHERE [U_NUM]='" + U_Num + "' and [Repo_no]='" + Repo_no + "'";
                    //i = GETPERfromMRMAPcmd.ExecuteNonQuery().ToString();//傳回影響筆數
                    SqlCommand UpdatePER_Cmd = new SqlCommand();
                    UpdatePER_Cmd.Connection = conn;
                    UpdatePER_Cmd.CommandText = UpdatePER;
                    UpdatePER_ = cmd.ExecuteNonQuery().ToString();//傳回影響筆數
                                                                  //}/


                }

            }
        }
        //設定條件
        //List<MREPOqueryEntity> MREPOqueryEntityList = muserService.Instance.getMREPO_qyeryDataList(U_Num);//<==========

        //log.endWrite("'MREPOqueryEntityList' :" + MREPOqueryEntityList.ToString(), className, methodName);
        //var test = Newtonsoft.Json.JsonConvert.SerializeObject(MREPOqueryEntityList);
        //return i;

        return UpdatePER_;
    }
    //20221004
    //updateMREPO_queryData
    public string updateMREPO_queryData( string REPO_no, string TrurOrFalse, string User_Num)
    {
        //string commandText = "SELECT [REPO_no],[REPO_id] FROM [HG].[dbo].[MREPO] where REPO_id='" + Repo_name + "'";
        string connectionStrings = "sqlConnectHG_Test_TEST";
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string Repo_no = "";
        string i = "";
        string TureORFalseBool = "";
        if (TrurOrFalse.ToUpper() == "TRUE")
            TureORFalseBool = "1";
        else
            TureORFalseBool = "0";
        //log.startWrite("'StartDate;':"+StartDate+"'EndDate;':"+EndDate+"'keyWord;':"+keyWord, className, methodName);
        //foreach (var Repo_id in Check_Item_Ary)
        //{
        // result = reportService.Instance.setReportRight(item);//<==========
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            SqlConnection connection = conn;
            string commandText = "UPDATE [dbo].[MRMAP] SET [per_open]='"+TureORFalseBool+"' Where U_Num='"+User_Num+"' AND Repo_no='"+REPO_no+"'";//由Repo_id取的報表REPO_no

            //conn.ConnectionString = connectionStrings;
            conn.Open();
            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            //DataTable dt = new DataTable();
            cmd.ExecuteNonQuery();
            //string add_ip = IP_M;
            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
            //conn.Open();
            //SqlCommand cmd = new SqlCommand();
            //cmd.Connection = conn;
            //cmd.CommandText = tsql;
            //SqlDataAdapter adapter = new SqlDataAdapter();
            //adapter.SelectCommand = cmd;
            //adapter.Fill(dt);
            //foreach (DataRow row in dt.Rows)
            //{
            //    //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
            //    Repo_no = row[0].ToString();

            //    string GETPERfromMRMAP = "Select per_open,Repo_no from MRMAP WHERE [U_NUM]='" + U_Num + "' AND Repo_no='" + Repo_no + "'";
            //    SqlCommand GETPERfromMRMAPcmd = new SqlCommand();
            //    GETPERfromMRMAPcmd.Connection = conn;
            //    GETPERfromMRMAPcmd.CommandText = GETPERfromMRMAP;
            //    DataTable GETPERfromMRMAPcmd_dt = new DataTable();
            //    adapter.SelectCommand = GETPERfromMRMAPcmd;
            //    adapter.Fill(GETPERfromMRMAPcmd_dt);
            //    //  string U_Num=
            //    //此使用者使用此報表的權限不存在
            //    if (GETPERfromMRMAPcmd_dt.Rows.Count == 0)
            //    {                                                 //    0           1       2       3         4        5           6       7      
            //        string createNEWPER = "INSERT INTO [dbo].[MRMAP]([Repo_no],[per_open],[U_NUM],[U_Name],[del_tag],[add_ip],[add_user],[add_date]) VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}', GETDATE())";
            //        StringBuilder sbCommandText = new StringBuilder();

            //        //   0      1      2       3     4         6         7
            //        sbCommandText.Append(string.Format(createNEWPER, Repo_no, "1", U_Num, U_Name, 0, add_ip, U_Name, common.getDateTimeStr()));
            //        //   StringBuilder sbCommandText = new StringBuilder(string.Format(createNEWPER, T_ID);

            //        //     sbCommandText.Append(string.Format(commandText, Repo_no,"1",Session["U_Num"],));
            //        noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<=====================
            //    }
            //    else
            //    {   //加入判斷per_open是否為0,如為0則更新為per_open為1,如不為0則不動作
            //        string pero_open = GETPERfromMRMAPcmd_dt.Rows[0][0].ToString().Trim();
            //        if (pero_open == "0")
            //        {
            //            string UpdatePER = "UPDATE [dbo].[MRMAP] SET [per_open] = '1' WHERE [U_NUM]='" + U_Num + "' and [Repo_no]='" + Repo_no + "'";
            //            //i = GETPERfromMRMAPcmd.ExecuteNonQuery().ToString();//傳回影響筆數
            //            noSelectSql.Instance.doNoneSelectSql(connectionStrings, UpdatePER);//<=====================                    
            //        }


            //    }

            //}
            //    }
            //設定條件
            //List<MREPOqueryEntity> MREPOqueryEntityList = muserService.Instance.getMREPO_qyeryDataList(U_Num);//<==========

            //log.endWrite("'MREPOqueryEntityList' :" + MREPOqueryEntityList.ToString(), className, methodName);
            //var test = Newtonsoft.Json.JsonConvert.SerializeObject(MREPOqueryEntityList);
            //return i;
        }
        return i;
    }
    //20221003待修改
    //畫面中有勾選到的項目(Check_Item_Ary)U_Num(所選到的員工編號)
    public string Update(string[] Check_Item_Ary, string U_Num, string U_Name, string IP_M)
    {
        //string commandText = "SELECT [REPO_no],[REPO_id] FROM [HG].[dbo].[MREPO] where REPO_id='" + Repo_name + "'";
        string connectionStrings = "sqlConnectHG_Test_TEST";
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string Repo_no = "";
        string i = "";
        //log.startWrite("'StartDate;':"+StartDate+"'EndDate;':"+EndDate+"'keyWord;':"+keyWord, className, methodName);
        foreach (var Repo_id in Check_Item_Ary)
        {
            // result = reportService.Instance.setReportRight(item);//<==========
            using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
            {
                SqlConnection connection = conn;
                string commandText = "SELECT [REPO_no],[REPO_id] FROM [HG].[dbo].[MREPO] where REPO_id='" + Repo_id + "'";//由Repo_id取的報表REPO_no

                //conn.ConnectionString = connectionStrings;
                conn.Open();
                //conn.ConnectionString = connectionStrings;
                //conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = commandText;
                DataTable dt = new DataTable();
                string add_ip = IP_M;
                //conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
                //conn.Open();
                //SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                //cmd.CommandText = tsql;
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                adapter.Fill(dt);
                foreach (DataRow row in dt.Rows)
                {
                    //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
                    Repo_no = row[0].ToString();

                    string GETPERfromMRMAP = "Select per_open,Repo_no from MRMAP WHERE [U_NUM]='" + U_Num + "' AND Repo_no='" + Repo_no + "'";
                    SqlCommand GETPERfromMRMAPcmd = new SqlCommand();
                    GETPERfromMRMAPcmd.Connection = conn;
                    GETPERfromMRMAPcmd.CommandText = GETPERfromMRMAP;
                    DataTable GETPERfromMRMAPcmd_dt = new DataTable();
                    adapter.SelectCommand = GETPERfromMRMAPcmd;
                    adapter.Fill(GETPERfromMRMAPcmd_dt);
                    //  string U_Num=
                    //此使用者使用此報表的權限不存在
                    if (GETPERfromMRMAPcmd_dt.Rows.Count == 0)
                    {                                                 //    0           1       2       3         4        5           6       7      
                        string createNEWPER = "INSERT INTO [dbo].[MRMAP]([Repo_no],[per_open],[U_NUM],[U_Name],[del_tag],[add_ip],[add_user],[add_date]) VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}', GETDATE())";
                        StringBuilder sbCommandText = new StringBuilder();

                        //   0      1      2       3     4         6         7
                        sbCommandText.Append(string.Format(createNEWPER, Repo_no, "1", U_Num, U_Name, 0, add_ip, U_Name, common.getDateTimeStr()));
                        //   StringBuilder sbCommandText = new StringBuilder(string.Format(createNEWPER, T_ID);

                        //     sbCommandText.Append(string.Format(commandText, Repo_no,"1",Session["U_Num"],));
                        noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<=====================
                    }
                    else
                    {   //加入判斷per_open是否為0,如為0則更新為per_open為1,如不為0則不動作
                        string pero_open = GETPERfromMRMAPcmd_dt.Rows[0][0].ToString().Trim();
                        if (pero_open == "0")
                        {
                            string UpdatePER = "UPDATE [dbo].[MRMAP] SET [per_open] = '1' WHERE [U_NUM]='" + U_Num + "' and [Repo_no]='" + Repo_no + "'";
                            //i = GETPERfromMRMAPcmd.ExecuteNonQuery().ToString();//傳回影響筆數
                            noSelectSql.Instance.doNoneSelectSql(connectionStrings, UpdatePER);//<=====================                    
                        }


                    }

                }
            }
            //設定條件
            //List<MREPOqueryEntity> MREPOqueryEntityList = muserService.Instance.getMREPO_qyeryDataList(U_Num);//<==========

            //log.endWrite("'MREPOqueryEntityList' :" + MREPOqueryEntityList.ToString(), className, methodName);
            //var test = Newtonsoft.Json.JsonConvert.SerializeObject(MREPOqueryEntityList);
            //return i;
        }
        return i;
    }

    public string GetRepo_noByRepo_name(string Repo_name)
    {
        string commandText = "SELECT U_Name FROM [dbo].[MUSER] Where [U_Num]='" + Repo_name + "'";
        string connectionStrings = "sqlConnectHG_Test_TEST";
        string Name = "";
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
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
                Name = row[0].ToString();
            }
            conn.Close();
            //}
            return Name;
        }
    }
    //此帳號可執行的報表權限
    public string getMREPO_qyeryDataList(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'StartDate;':"+StartDate+"'EndDate;':"+EndDate+"'keyWord;':"+keyWord, className, methodName);

        //設定條件
        List<MREPOqueryEntity> MREPOqueryEntityList = muserService.Instance.getMREPO_qyeryDataList(U_Num);//<==========

        log.endWrite("'MREPOqueryEntityList' :" + MREPOqueryEntityList.ToString(), className, methodName);
        var test = Newtonsoft.Json.JsonConvert.SerializeObject(MREPOqueryEntityList);
        return Newtonsoft.Json.JsonConvert.SerializeObject(MREPOqueryEntityList);
    }

    public string ChangeState(string U_Num, string Per_Kind, string menu_no)
    {
        //先取出功能代碼的勾選狀態(status)
        string status = muserService.Instance.GetState(menu_no, U_Num, Per_Kind);
        //string Per_state = MUSERhgDao.Instance.getPer_AddState(menu_no, U_Num);//此帳號可執行的功能狀態1:開啟 0:關閉


        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'StartDate;':"+StartDate+"'EndDate;':"+EndDate+"'keyWord;':"+keyWord, className, methodName);
        //取得所有會場編號
        //沒有設定條件
        string ChangeState = muserService.Instance.ChangeState(U_Num, Per_Kind, menu_no, status);//<==========

        //log.endWrite("'muserMSEntityList' :"+muserMSEntityList.ToString(), className, methodName);
        var test = Newtonsoft.Json.JsonConvert.SerializeObject(ChangeState);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ChangeState);
    }
    //由上面的action呼叫
    public string getMUSER_MenuSetupDataList(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'StartDate;':"+StartDate+"'EndDate;':"+EndDate+"'keyWord;':"+keyWord, className, methodName);
        //取得所有會場編號
        //沒有設定條件
        List<muserMenuSetupEntity> muserMSEntityList = muserService.Instance.getMUSER_MenuSetupDataList(U_Num);//<==========

        log.endWrite("'muserMSEntityList' :" + muserMSEntityList.ToString(), className, methodName);
        var test = Newtonsoft.Json.JsonConvert.SerializeObject(muserMSEntityList);
        return Newtonsoft.Json.JsonConvert.SerializeObject(muserMSEntityList);
    }


    // <summary>
    /// 取得VIP會員管理資料(2022/05/12)
    /// </summary>
    /// <returns></returns>
    //20220513要修改的地方!!!!!!
    public string getMFUNTreportDataList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'StartDate;':"+StartDate+"'EndDate;':"+EndDate+"'keyWord;':"+keyWord, className, methodName);
        //取得所有會場編號
        //沒有設定條件
        List<SRMVMEBEntity> SRMVMEBList = srmvmebService.Instance.getVIPMEMBERList();//<==========

        log.endWrite("'srmvenuList' :" + SRMVMEBList.ToString(), className, methodName);
        var test = Newtonsoft.Json.JsonConvert.SerializeObject(SRMVMEBList);
        return Newtonsoft.Json.JsonConvert.SerializeObject(SRMVMEBList);
    }
    // <summary>
    /// 設定條件搜尋VIP會員資料列表
    /// </summary>
    /// <returns></returns>
    ///MP_Name:分析師的員工編號
    public string searchSRMVMEBDataList(string M_Name, string MP_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //取得所有會場編號
        //ORI
        //List<SRMVMEBEntity> SRMVENUList = srmvmebService.Instance.getVIPMEMBERList(M_Name);//<==========
        //TEST
        List<SRMVMEBEntity> SRMVENUList = srmvmebService.Instance.getVIPMEMBERList(M_Name, MP_ID);//<==========
        log.endWrite("'srmvenuList' :" + SRMVENUList.ToString(), className, methodName);
        var test = Newtonsoft.Json.JsonConvert.SerializeObject(SRMVENUList);
        return Newtonsoft.Json.JsonConvert.SerializeObject(SRMVENUList);
    }

    public string GetNameByMP_Num(string MP_NUM)
    {       //sql連線字串 webconfig的對應位置
        string commandText = "SELECT U_Name FROM [dbo].[MUSER] Where [U_Num]='" + MP_NUM + "'";
        string connectionStrings = "sqlConnectHG_Test_TEST";
        string Name = "";
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
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
                Name = row[0].ToString();
            }
            conn.Close();
            //}
            return Name;
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



    //public string getMUSERData(string U_Num,string keyWord)
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    log.startWrite("'U_Num;':"+U_Num+"'keyWord;':"+keyWord, className, methodName);

    //    List<muserEntity> eeList = muserService.Instance.getMUSERData(U_Num,keyWord);//<==========

    //    log.endWrite("'eeList' :"+eeList.ToString(), className, methodName);
    //    return Newtonsoft.Json.JsonConvert.SerializeObject(eeList);
    //}

    public string getMailData(string U_Num, string keyWord)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num;':" + U_Num + "'keyWord;':" + keyWord, className, methodName);

        List<emailEntity> eeList = mailService.Instance.getMailData(U_Num, keyWord);//<==========

        log.endWrite("'eeList' :" + eeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(eeList);
    }

    public string deleteMailData(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        String backStr = mailService.Instance.deleteMailData(MS_ID);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public string addMailData(emailEntity ee)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + ee.MS_ID + "'MS_Sender':" + ee.MS_Sender + "'MS_Receiver':" + ee.MS_Receiver + "'MS_Title':" + ee.MS_Title + "'MS_Text':" + ee.MS_Text + "'add_User':" + ee.add_User + "'add_ip':" + ee.add_ip, className, methodName);

        String backStr = mailService.Instance.addMailData(ee);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public string getUpLoadData(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        uploadFileEntity ufe = mailService.Instance.getUpLoadData(MS_ID);//<==========

        log.endWrite("'ufe' :" + ufe.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ufe);
    }

    public string updateReadtag(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        string backStr = mailService.Instance.updateReadtag(MS_ID);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public string getMailDetail(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        emailEntity ee = mailService.Instance.getMailDetail(MS_ID);//<==========

        log.endWrite("'ee' :" + ee.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ee);
    }

    //public string getMUSERData(string MS_ID)
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    log.startWrite("'MS_ID':"+MS_ID, className, methodName);
    //    string keyword = "";
    //    List<muserEntity> muser = muserService.Instance.getMUSERData(MS_ID,keyword);//<==========
    //    log.endWrite("'eeList' :"+muser.ToString(), className, methodName);
    //    return Newtonsoft.Json.JsonConvert.SerializeObject(muser);

    //}
    //由前端呼叫
    public string getMSFTFData(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);
        string keyword = "";
        List<msftfEntity> msftf = msftfService.Instance.getmsftfListData(MS_ID, keyword);//<==========
        log.endWrite("'eeList' :" + msftf.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(msftf);

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}