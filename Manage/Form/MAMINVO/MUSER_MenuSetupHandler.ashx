<%@ WebHandler Language="C#" Class="MUSER_MenuSetupHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using System.Collections;

public class MUSER_MenuSetupHandler : IHttpHandler
{

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    //getMUSER_MenuSetupData
    private static string connectionStrings = "sqlConnectHG_Test";
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string U_Num = context.Request["U_Num"];//所選到的員工編號
        string MeetingDate = context.Request["MeetingDate"];//會議日期
        string MP_Name = context.Request["MP_Name"];//姓名
        string MP_ID = context.Request["MP_ID"];//分析師編號
        string M_Name = "";
        string Undefined_var = null;
        bool boola = String.IsNullOrWhiteSpace(Undefined_var);
        bool boolb = String.IsNullOrEmpty(Undefined_var);
        string[] checkboxes_checked_Fun_string_Array;
        string[] checkboxes_checked_MenuNo_string_Array;

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
        {
            case "ChangeState":
                //MeetingDate = context.Request["MeetingDate"];
                //MP_Name = context.Request["MP_Name"];//分析師(員工編號)
                //context.Response.Write(getMFUNTreportDataList());
                string User_Num_M = context.Request["User_Num_M"];//要修改的員工編號
                string state = context.Request["state"];//要執行的修改的權限
                string menu_no = context.Request["menu_no"];//要修改的功能代碼
                string[] checkboxes_checked_Fun_string_Array_Split = new string[] { };
                context.Response.Write(ChangeState(User_Num_M, state, menu_no));
                break;
            ////取得員工資料維護作業-選單權限資料
            /// var data = "action=updateMUSER_MenuSetupData" + "&Fun_Name=" + Fun_Name + "&Menu_No=" + Menu_No + "&TrurOrFalse=" + TrurOrFalse + "&User_Num_M=" + User_Num_M;
            //updateMUSER_MenuSetupData更新權限
            case "updateMUSER_MenuSetupData"://執行使用者權限更新功能
                string Fun_Name = context.Request["Fun_Name"];
                string Menu_No = context.Request["Menu_No"];
                string TrueOrFalse = context.Request["TrueOrFalse"];
                string User_Num = context.Request["User_Num"];
                context.Response.Write(updateMUSER_MenuSetupData(Fun_Name, Menu_No, TrueOrFalse, User_Num));
                break;



            case "getMUSER_MenuSetupData":
                //var Check_Item_Ary = context.Request["Check_Item_Ary"].Split(',');//畫面中有勾選到的項目(Info_if)[查詢權限]
                U_Num = context.Request.Form["U_Num"];//員工編號(所選到的)------ok
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
            //更新權限用
            //開啟資料庫連線
            case "OpenDBConnection":
                context.Response.Write(OpenDBConnection());
                break;
            //更新權限用
            //關閉資料庫連線
            case "CloseDBConnection":
                context.Response.Write(CloseDBConnection());
                break;

            //更新權限用
            //進行更新資料
            case "ExecuteMUMAPUPdateCommaned":
                context.Response.Write(getMFUNTreportDataList());
                break;


        }

    }
    public string OpenDBConnection()
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString());

        conn.Open();
        return "";
    }

    public string CloseDBConnection()
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString());
        conn.Close();
        return "";
    }


    //updateMUSER_MenuSetupData
    //更新使用者權限
    public string UpDateMUMAP(ArrayList Per_True_Arraylist, ArrayList Per_False_Arraylist, string User_Num_M_)
    {
        //Per_True_Arraylist
        //Per_False_Arraylist
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        foreach (var item in Per_True_Arraylist)
        {
            string[] Per_True = item.ToString().Split('_');
            string FunName = Per_True[0] + "_" + Per_True[1];//FunName
            string Menu_no = Per_True[2];
            commonService.Instance.setUserAuthority(FunName, Menu_no, User_Num_M_, "1");
        }
        foreach (var item in Per_False_Arraylist)
        {
            string[] Per_True = item.ToString().Split('_');
            string FunName = Per_True[0] + "_" + Per_True[1];//FunName
            string Menu_no = Per_True[2];
            commonService.Instance.setUserAuthority(FunName, Menu_no, User_Num_M_, "0");
        }
        //log.startWrite("'StartDate;':"+StartDate+"'EndDate;':"+EndDate+"'keyWord;':"+keyWord, className, methodName);
        //取得所有會場編號
        //沒有設定條件
        //string ChangeState = commonService.Instance.setUserAuthority()
        //log.endWrite("'muserMSEntityList' :"+muserMSEntityList.ToString(), className, methodName);
        //var test = Newtonsoft.Json.JsonConvert.SerializeObject(ChangeState);
        //return Newtonsoft.Json.JsonConvert.SerializeObject(ChangeState);
        return null;
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

    public string OpenDBConnection(string U_Num, string Per_Kind, string menu_no)
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

    public string CloseDBConnection(string U_Num, string Per_Kind, string menu_no)
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
    //updateMUSER_MenuSetupData(Fun_Name, Menu_No, TrueOrFalse, User_Num)
    //執行使用者權限更新功能(更新權限)
    public string updateMUSER_MenuSetupData(string Fun_Name, string Menu_No, string TrueOrFalse, string User_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'StartDate;':"+StartDate+"'EndDate;':"+EndDate+"'keyWord;':"+keyWord, className, methodName);
        //沒有設定條件
        List<muserMenuSetupEntity> muserMSEntityList = muserService.Instance.updateMUSER_MenuSetupData(Fun_Name, Menu_No, TrueOrFalse, User_Num);//<==========

        log.endWrite("'muserMSEntityList' :" + muserMSEntityList.ToString(), className, methodName);
        var test = Newtonsoft.Json.JsonConvert.SerializeObject(muserMSEntityList);
        return Newtonsoft.Json.JsonConvert.SerializeObject(muserMSEntityList);
    }
    //由上面的action呼叫
    //取得員工資料維護作業-選單權限資料
    public string getMUSER_MenuSetupDataList(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'StartDate;':"+StartDate+"'EndDate;':"+EndDate+"'keyWord;':"+keyWord, className, methodName);
        //沒有設定條件
        List<muserMenuSetupEntity> muserMSEntityList = muserService.Instance.getMUSER_MenuSetupDataList(U_Num);//<==========

        log.endWrite("'muserMSEntityList' :" + muserMSEntityList.ToString(), className, methodName);
        var test = Newtonsoft.Json.JsonConvert.SerializeObject(muserMSEntityList);
        return Newtonsoft.Json.JsonConvert.SerializeObject(muserMSEntityList);
    }

    public string getMUSER_MenuSetupUpdate(string[] Check_Item_Ary, string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'StartDate;':"+StartDate+"'EndDate;':"+EndDate+"'keyWord;':"+keyWord, className, methodName);
        //沒有設定條件
        foreach (var item in Check_Item_Ary)
        {

        }
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



    public string getMUSERData(string U_Num, string keyWord)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num;':" + U_Num + "'keyWord;':" + keyWord, className, methodName);

        List<muserEntity> eeList = muserService.Instance.getMUSERData(U_Num, keyWord);//<==========

        log.endWrite("'eeList' :" + eeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(eeList);
    }

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

    public string getMUSERData(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);
        string keyword = "";
        List<muserEntity> muser = muserService.Instance.getMUSERData(MS_ID, keyword);//<==========
        log.endWrite("'eeList' :" + muser.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(muser);

    }
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