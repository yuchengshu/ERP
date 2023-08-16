<%@ WebHandler Language="C#" Class="SRMVENUHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public class SRMVENUHandler : IHttpHandler
{

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string MS_ID = context.Request["action"];
        string MeetingDate = context.Request["MeetingDate"];//會議日期
        string MP_ID = context.Request["MP_ID"];//分析師編號
        string MP_Name = "";
        string Undefined_var = null;
        bool boola = String.IsNullOrWhiteSpace(Undefined_var);
        bool boolb = String.IsNullOrEmpty(Undefined_var);
        //string M_Name= context.Request["M_Name"];//客戶姓名
        if (context.Request["keyWord"] == Undefined_var)
        {
            MP_Name = "";
        }
        else
        {
            MP_Name = context.Request["keyWord"];
        }


        switch (action)
        {
            case "searchSRMVMEBData":

                string keyWord = context.Request["keyWord"];
                if (keyWord == "undefined")
                {
                    keyWord = "";
                }
                MP_ID = context.Request["MP_ID"];//分析師(員工編號)
                context.Response.Write(searchSRMVMEBDataList(keyWord, MP_ID));
                break;



            case "getSRMVMEBData":
                MeetingDate = context.Request["MeetingDate"];
                MP_Name = context.Request["MP_Name"];

                context.Response.Write(getVIPMEMBERList());
                break;

        }

    }
    // <summary>
    /// 取得VIP會員管理資料(2022/05/12)
    /// </summary>
    /// <returns></returns>
    //20220513要修改的地方!!!!!!
    public string getVIPMEMBERList()
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
    public string searchSRMVMEBDataList(string keyWord, string MP_ID)
    {
        if (MP_ID==null)
        {
            MP_ID = "";
        }
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //取得所有會場編號
        //ORI
        //List<SRMVMEBEntity> SRMVENUList = srmvmebService.Instance.getVIPMEMBERList(M_Name);//<==========
        //TEST
        List<SRMVMEBEntity> SRMVENUList = srmvmebService.Instance.getVIPMEMBERList(keyWord, MP_ID);//<==========
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