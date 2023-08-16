<%@ WebHandler Language="C#" Class="SRMVENUHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public class SRMVENUHandler : IHttpHandler {

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string MS_ID = context.Request["action"];
        string MeetingDate = context.Request["MeetingDate"];//會議日期
        string MP_Name = context.Request["MP_Name"];//分析師(員工編號)

        switch (action)
        {
            case "searchSRMVENUData":

                MeetingDate = context.Request["MeetingDate"];
                MP_Name = context.Request["MP_Name"];//分析師(員工編號)
                context.Response.Write(searchVenueDataList(MP_Name,MeetingDate));
                break;



            case "getSRMVENUData":
                MeetingDate = context.Request["MeetingDate"];
                MP_Name= context.Request["MP_Name"];

                context.Response.Write(getVenueDataList());
                break;

        }

    }
    // <summary>
    /// 取得會場會議列表(2022/04/27)
    /// </summary>
    /// <returns></returns>

    public string getVenueDataList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'StartDate;':"+StartDate+"'EndDate;':"+EndDate+"'keyWord;':"+keyWord, className, methodName);
        //取得所有會場編號
        //沒有設定條件
        List<SRMVENUEntity> SRMVENUList = srmvenuService.Instance.getSRMVENUData();//<==========

        log.endWrite("'srmvenuList' :"+SRMVENUList.ToString(), className, methodName);
        var test=Newtonsoft.Json.JsonConvert.SerializeObject(SRMVENUList);
        return Newtonsoft.Json.JsonConvert.SerializeObject(SRMVENUList);
    }
    // <summary>
    /// 設定條件搜尋會場會議列表
    /// </summary>
    /// <returns></returns>
    ///MP_Name:分析師的員工編號
    public string searchVenueDataList(string MP_Name, string MeetingDate)
    {
        char[] separators = new char[] { ' ', '.', '/' };
        string MeetingDateNew = "";
        //選到的日期:"04/05/2022"
        if (MeetingDate.Trim() != "")
        {
            string[] DateTime = MeetingDate.Split(separators);
            MeetingDateNew = DateTime[2] + "-" + DateTime[0] + "-" + DateTime[1];
        }
        else
        {
            MeetingDateNew = "";
        }
        //要整理的格式('2012-04-22' 
        //string MeetingDateNew = DateTime[2] + "-" + DateTime[0] + "-" + DateTime[1];
        string MP_CName = "";
        if (MP_Name != "")
        {
            MP_CName = GetNameByMP_Num(MP_Name);//由員工編號取得員工姓名
        }
        else
        {
            MP_CName="";
        }
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MeetingDate;':"+MeetingDate, className, methodName);
        //取得所有會場編號

        List<SRMVENUEntity> SRMVENUList = srmvenuService.Instance.searchSRMVENUData(MP_CName,MeetingDateNew);//<==========

        log.endWrite("'srmvenuList' :"+SRMVENUList.ToString(), className, methodName);
        var test=Newtonsoft.Json.JsonConvert.SerializeObject(SRMVENUList);
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

    public string getMailData(string U_Num,string keyWord)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num;':"+U_Num+"'keyWord;':"+keyWord, className, methodName);

        List<emailEntity> eeList = mailService.Instance.getMailData(U_Num,keyWord);//<==========

        log.endWrite("'eeList' :"+eeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(eeList);
    }

    public string deleteMailData(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':"+MS_ID, className, methodName);

        String backStr = mailService.Instance.deleteMailData(MS_ID);//<==========

        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;
    }

    public string addMailData(emailEntity ee)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':"+ee.MS_ID+"'MS_Sender':"+ee.MS_Sender+"'MS_Receiver':"+ee.MS_Receiver+"'MS_Title':"+ee.MS_Title+"'MS_Text':"+ee.MS_Text+"'add_User':"+ee.add_User+"'add_ip':"+ee.add_ip, className, methodName);

        String backStr = mailService.Instance.addMailData(ee);//<==========

        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;
    }

    public string getUpLoadData(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':"+MS_ID, className, methodName);

        uploadFileEntity ufe = mailService.Instance.getUpLoadData(MS_ID);//<==========

        log.endWrite("'ufe' :"+ufe.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ufe);
    }

    public string updateReadtag(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':"+MS_ID, className, methodName);

        string backStr = mailService.Instance.updateReadtag(MS_ID);//<==========

        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;
    }

    public string getMailDetail(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':"+MS_ID, className, methodName);

        emailEntity ee = mailService.Instance.getMailDetail(MS_ID);//<==========

        log.endWrite("'ee' :"+ee.ToString(), className, methodName);
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
        log.startWrite("'MS_ID':"+MS_ID, className, methodName);
        string keyword = "";
        List<msftfEntity> msftf = msftfService.Instance.getmsftfListData(MS_ID,keyword);//<==========
        log.endWrite("'eeList' :"+msftf.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(msftf);

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}