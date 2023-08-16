<%@ WebHandler Language="C#" Class="SRMSYSKHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public class SRMSYSKHandler : IHttpHandler
{

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string MP_ID = context.Request["MP_ID"];
        string MS_ID = context.Request["action"];
        string MeetingDate = context.Request["MeetingDate"];//電話統計作業日期
        string MP_Name = context.Request["MP_Name"];//分析師(員工編號)
        string Keyword = context.Request["keyWord"];//關鍵字
        string Q_Analyst = context.Request["Q_Analyst"];//分析師(員工編號)

        switch (action)
        {       //searchSRMSYSKData
            case "searchSRMSYSKData":
                Q_Analyst = context.Request["Q_Analyst"];
                //分析師(員工編號)//
                //MeetingDate = context.Request["MeetingDate"];
                MP_Name = context.Request["MP_Name"];//分析師(員工編號)

                context.Response.Write(searchSRMSYSKDataList(Q_Analyst));
                break;


            //取得所有留倉資料管理的資料
            case "getSRMSYSKData":
                MeetingDate = context.Request["MeetingDate"];
                MP_Name = context.Request["MP_Name"];
                context.Response.Write(getSRMSYSKDataList());////取得所有留倉資料管理的資料
                break;

            //新增留倉資料管理的資料
            case "addSRMSYSKData":
                string MP = context.Request["MP"];
                string FileName = context.Request["FileName"];
                string add_user = context.Request["add_user"];
                string add_IP = context.Request["add_IP"];
                context.Response.Write(addSRMSYSKData(MP, FileName, add_user, add_IP));////取得所有留倉資料管理的資料
                break;

            case "deleteSRMSYSKData":
                string MF_ID = context.Request["MF_ID"];

                context.Response.Write(deleteSRMSYSKData(MF_ID));//刪除所選留倉資料管理的資料
                break;
        }

    }
    //20220315進度
    //刪除留倉資料
    public string deleteSRMSYSKData(string MF_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'StartDate;':"+StartDate+"'EndDate;':"+EndDate+"'keyWord;':"+keyWord, className, methodName);
        //留倉資料管理的資料
        //沒有設定條件
        string File_num = srmsyskService.Instance.deleteSRMSYSKData(MF_ID);//<==========
        log.endWrite("'File_num' :" + File_num.ToString(), className, methodName);
        //var test=Newtonsoft.Json.JsonConvert.SerializeObject(SRMSYSKDataList);
        return File_num;
    }


    // <summary>
    /// 新增留倉資料管理的資料
    /// </summary>
    /// <returns></returns>
    public string addSRMSYSKData(string MP, string FileName, string add_user, string add_IP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'StartDate;':"+StartDate+"'EndDate;':"+EndDate+"'keyWord;':"+keyWord, className, methodName);
        //留倉資料管理的資料
        //沒有設定條件
        string File_num = srmsyskService.Instance.addSRMSYSKData(MP, FileName, add_user, add_IP);//<==========

        log.endWrite("'File_num' :" + File_num.ToString(), className, methodName);
        //var test=Newtonsoft.Json.JsonConvert.SerializeObject(SRMSYSKDataList);
        return File_num;
    }
    // <summary>
    /// 留倉資料管理的資料
    /// </summary>
    /// <returns></returns>
    public string getSRMSYSKDataList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'StartDate;':"+StartDate+"'EndDate;':"+EndDate+"'keyWord;':"+keyWord, className, methodName);
        //留倉資料管理的資料
        //沒有設定條件
        List<SRMSYSKentity> SRMSYSKDataList = srmsyskService.Instance.getSRMSYSKData();//<==========

        log.endWrite("'SRMSYSKDataList' :" + SRMSYSKDataList.ToString(), className, methodName);
        var test = Newtonsoft.Json.JsonConvert.SerializeObject(SRMSYSKDataList);
        return Newtonsoft.Json.JsonConvert.SerializeObject(SRMSYSKDataList);
    }
    // <summary>
    /// 設定條件搜尋會場會議列表
    /// </summary>
    /// <returns></returns>
    ///Q_Analyst:分析師的員工編號
    public string searchSRMSYSKDataList(string Q_Analyst)
    {
        char[] separators = new char[] { ' ', '.', '/' };
        //string MeetingDateNew = "";

        //string MP_CName = "";
        List<SRMSYSKentity> SRMSYSKDataList = srmsyskService.Instance.getSRMSYSKData(Q_Analyst);//<==========

        //List<SRMSYSKentity> MPMMTELList = srmsyskService.Instance.getSRMSYSKData();//<==========

        //log.endWrite("'srmvenuList' :"+SRMVENUList.ToString(), className, methodName);
        var test = Newtonsoft.Json.JsonConvert.SerializeObject(SRMSYSKDataList);
        return Newtonsoft.Json.JsonConvert.SerializeObject(SRMSYSKDataList);
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