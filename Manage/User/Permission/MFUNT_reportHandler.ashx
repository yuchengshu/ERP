<%@ WebHandler Language="C#" Class="MFUNT_reportHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public class MFUNT_reportHandler : IHttpHandler
{

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    string U_Num1 = "";
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string MS_ID = context.Request["action"];
        string MeetingDate = context.Request["MeetingDate"];//會議日期
        string MP_Name = context.Request["MP_Name"];//姓名
        string MP_ID = context.Request["MP_ID"];//分析師編號
        string U_Num = string.Empty;//員工編號(所選到的)
        string U_Num_ = string.Empty;//員工編號(所選到的)
        string U_Num1 = string.Empty;
        string U_Num2 = string.Empty;
        U_Num1 = context.Request.Form["U_Num"];//員工編號(所選到的)------ok
                                               //var Check_Item_Ary_ALL_ = context.Request["Check_Item_Ary"].Split(',');//求出畫面中所有checkbox的值)
                                               //    var Check_Item_Ary_ = context.Request["Check_Item_Ary"].Split(',');//畫面中有勾選到的項目(                                   //string U_Num = context.Request["U_Num"];//所選到的使用者編號

        //string M_Name= context.Request["M_Name"];//客戶姓名


        //getMFUNTreportData
        switch (action)
        {       //getMFUNTreportData
            case "HomePageUpdate"://首頁權限更新
                var Check_Item_Ary_ALL_ = context.Request["Check_Item_Ary"].Split(',');//求出畫面中所有checkbox的值)
                var Check_Item_Ary_ = context.Request["Check_Item_Ary"].Split(',');//畫面中有勾選到的項目(Info_if)
                                                                                   //EditU_Num
                string EditU_Num = context.Request["EditU_Num"];//操作者的員工編號
                U_Num1 = context.Request.Form["U_Num"];//員工編號(所選到的)------ok
                context.Response.Write(Update_HomePage(Check_Item_Ary_ALL_, Check_Item_Ary_, EditU_Num, U_Num1));
                break;
            case "Reset":
                var Check_Item_Ary_ALL = context.Request["Check_Item_Ary_ALL"].Split(',');//求出畫面中所有checkbox的值)
                                                                                          //EditU_Num
                var Check_Item_Ary = context.Request["Check_Item_Ary"].Split(',');//畫面中有勾選到的項目(Info_if)
                string EditU_Num_ = context.Request["EditU_Num"];//操作者的員工編號
                U_Num_ = context.Request.Form["U_Num"];//員工編號(所選到的)------ok
                context.Response.Write(Update_MFUNT(Check_Item_Ary_ALL, Check_Item_Ary, EditU_Num_, U_Num_));
                break;
            case "Update"://設定使用者報表權限資料
                var Check_Item_Ary_ALL_2 = context.Request["Check_Item_Ary"].Split(',');//求出畫面中所有checkbox的值)
                var Check_Item_Ary_2 = context.Request["Check_Item_Ary"].Split(',');//畫面中有勾選到的項目(Info_if)
                                                                                   //EditU_Num
                string EditU_Num__ = context.Request["EditU_Num"];//操作者的員工編號
                U_Num1 = context.Request.Form["U_Num"];//員工編號(所選到的)------ok
                context.Response.Write(Update_MFUNT(Check_Item_Ary_ALL_2, Check_Item_Ary_2, EditU_Num__, U_Num1));
                break;

            case "getHomePagePerquery"://取得首頁權限資料
                                      //MeetingDate = context.Request["MeetingDate"];
                U_Num = context.Request.QueryString["U_Num"];//員工編號(所選到的)
                U_Num1 = context.Request.Form["U_Num"];//員工編號(所選到的)------ok
                U_Num2 = context.Request.Params["U_Num"];//員工編號(所選到的)----ok
                context.Response.Write(getHomePagePerqueryList(U_Num1));
                break;



            case "getSRMVMEBData":
                MeetingDate = context.Request["MeetingDate"];
                MP_Name = context.Request["MP_Name"];

                //context.Response.Write();
                break;

        }

    }
    // <summary>
    /// //設定使用者報表權限資料(2022/07/28)
    /// </summary>
    /// <returns></returns>

    //public string Update_MFUNTReport(string[] Info_id, string U_NUM, string EditU_Num)
    //{
    //    //有勾選到的項目(Info_if)
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    log.startWrite("'Info_id' : " + Info_id, className, methodName);
    //    List<contentAuthorityEntity> caeList = MFUNTreportService.Instance.setMFUNTreportData(Info_id, U_NUM, EditU_Num);//<=======

    //    log.endWrite(caeList.ToString(), className, methodName);
    //    return Newtonsoft.Json.JsonConvert.SerializeObject(caeList);
    //}
    //Update_HomePage
    //首頁權限更新
     public string Update_HomePage(string[] Check_Item_Ary_ALL, string[] Info_id, string EditU_Num, string U_NUM)
    {
        //有勾選到的項目(Info_if)
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Info_id' : " + Info_id, className, methodName);
        List<contentAuthorityEntity> caeList = MFUNTreportService.Instance.setUpdateHomePageData(Check_Item_Ary_ALL, Info_id, U_NUM, EditU_Num);//<=======

        log.endWrite(caeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(caeList);
    }
    /// ////設定使用者報表權限資料(2022/07/28)
    /// </summary>
    /// <returns></returns>

    public string Update_MFUNT(string[] Check_Item_Ary_ALL, string[] Info_id, string EditU_Num, string U_NUM)
    {
        //有勾選到的項目(Info_if)
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Info_id' : " + Info_id, className, methodName);
        List<contentAuthorityEntity> caeList = MFUNTreportService.Instance.setMFUNTreportData(Check_Item_Ary_ALL, Info_id, U_NUM, EditU_Num);//<=======

        log.endWrite(caeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(caeList);
    }
    // <summary>
    /// 取得首頁權限資料(2022/07/27)
    /// 取得可執行的功能清單
    /// </summary>
    /// <returns></returns>
    //20220513要修改的地方!!!!!!
    public string getHomePagePerqueryList(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);
        List<contentAuthorityEntity> caeList = MFUNTreportService.Instance.getMFUNTreportData(U_Num);////取得可執行的功能清單

        log.endWrite(caeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(caeList);
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



    //public string getMUSERData(string U_Num, string keyWord)
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    log.startWrite("'U_Num;':" + U_Num + "'keyWord;':" + keyWord, className, methodName);

    //    List<muserEntity> eeList = muserService.Instance.getMUSERData(U_Num, keyWord);//<==========

    //    log.endWrite("'eeList' :" + eeList.ToString(), className, methodName);
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
    //    log.startWrite("'MS_ID':" + MS_ID, className, methodName);
    //    string keyword = "";
    //    List<muserEntity> muser = muserService.Instance.getMUSERData(MS_ID, keyword);//<==========
    //    log.endWrite("'eeList' :" + muser.ToString(), className, methodName);
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