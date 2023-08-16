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
        string MeetingDate = context.Request["MeetingDate"];//電話統計作業日期
        string MP_Name = context.Request["MP_Name"];//分析師(員工編號)
        string Keyword = context.Request["keyWord"];//關鍵字
        string Q_Analyst = context.Request["Q_Analyst"];//分析師(員工編號)

        switch (action)
        {
            case "searchMPMMTELData":
                Q_Analyst = context.Request["Q_Analyst"];
                //分析師(員工編號)//
                //MeetingDate = context.Request["MeetingDate"];
                MP_Name = context.Request["MP_Name"];//分析師(員工編號)

                context.Response.Write(searchMPMMTELDataList(Q_Analyst));
                break;


            //取得所有電話統計作業的資料
            case "getMPMMTELDataList":
                MeetingDate = context.Request["MeetingDate"];
                MP_Name = context.Request["MP_Name"];
                context.Response.Write(getMPMMTELDataList());//取得所有電話統計作業的資料
                break;

        }

    }
    // <summary>
    /// 取得全部電話統計作業列表
    /// </summary>
    /// <returns></returns>
    public string getMPMMTELDataList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'StartDate;':"+StartDate+"'EndDate;':"+EndDate+"'keyWord;':"+keyWord, className, methodName);
        //取得電話統計作業
        //沒有設定條件
        List<MMTELdataEntity> MPMMTELList = MPMMTELService.Instance.getMPMMTELData();//<==========

        log.endWrite("'MPMMTELList' :"+MPMMTELList.ToString(), className, methodName);
        var test=Newtonsoft.Json.JsonConvert.SerializeObject(MPMMTELList);
        return Newtonsoft.Json.JsonConvert.SerializeObject(MPMMTELList);
    }
    // <summary>
    /// 設定條件搜尋會場會議列表
    /// </summary>
    /// <returns></returns>
    ///Q_Analyst:分析師的員工編號
    public string searchMPMMTELDataList(string Q_Analyst)
    {
        char[] separators = new char[] { ' ', '.', '/' };
        string MeetingDateNew = "";
        //選到的日期:"04/05/2022"
        //if (MeetingDate.Trim() != "")
        //{
        //    string[] DateTime = MeetingDate.Split(separators);
        //    MeetingDateNew = DateTime[2] + "-" + DateTime[0] + "-" + DateTime[1];
        //}
        //else
        //{
        //    MeetingDateNew = "";
        //}
        //要整理的格式('2012-04-22' 
        //string MeetingDateNew = DateTime[2] + "-" + DateTime[0] + "-" + DateTime[1];
        string MP_CName = "";
        //if (MP_Name != "")
        //{
        //    MP_CName = GetNameByMP_Num(MP_Name);//由員工編號取得員工姓名
        //}
        //else
        //{
        //    MP_CName = "";
        //}
        //string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'MeetingDate;':" + MeetingDate, className, methodName);
        ////取得所有會場編號

        List<MMTELdataEntity> MPMMTELList = MPMMTELService.Instance.searchMPMMTELDataList(Q_Analyst);//<==========

        //log.endWrite("'srmvenuList' :"+SRMVENUList.ToString(), className, methodName);
        var test=Newtonsoft.Json.JsonConvert.SerializeObject(MPMMTELList);
        return Newtonsoft.Json.JsonConvert.SerializeObject(MPMMTELList);
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