<%@ WebHandler Language="C#" Class="MCMSFTFHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
//個股管理作業
public class MCMSFTFHandler : IHttpHandler
{

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string MS_ID = context.Request["action"];
        string MeetingDate = context.Request["MeetingDate"];//電話統計作業日期
        string MP_Name = context.Request["MP_Name"];//分析師(員工編號)
        string Keyword = context.Request["keyWord"];//關鍵字
        string Q_Analyst = context.Request["Q_Analyst"];//分析師(員工編號)
        string add_user = context.Request["add_user"];

        switch (action)
        {
            // var data = "action=SaveEditDataAnalystsData" + "&com_id=" + com_id + "&com_name=" + com_name + "&uniform_num=" + uniform_num + "&tax_num=" + tax_num+"&add_user=" + U_Num_M;

            case "SaveEditDataAnalystsData":
                string com_id = context.Request["com_id"];
                //string add_user = context.Request["add_user"];
                string com_name = context.Request["com_name"];
                string uniform_num = context.Request["uniform_num"];
                string tax_num = context.Request["tax_num"];
                //string add_user = context.Request["add_user"];
                //string com_id_value, string com_name_value, string uniform_num_value, string tax_num_value, string add_user
                context.Response.Write(SaveEditDataAnalystsData(com_id, com_name, uniform_num, tax_num, add_user));

                break;

            case "InvoiceinfoCreate"://發票基本資料新增(InvoiceinfoCreate)
                string IP = context.Request["add_ip"];
                //string add_user = context.Request["add_user"];
                string Com_Name_Value = context.Request["Com_Name_Value"];
                string Uniform_Num_Value = context.Request["Uniform_Num_Value"];
                string Tax_Num_Value = context.Request["Tax_Num_Value"];
                context.Response.Write(InvoiceinfoCreate(Com_Name_Value, Uniform_Num_Value, Tax_Num_Value, add_user, IP));
                break;

            case "getInvoiceinfo"://取得發票基本資料
                context.Response.Write(getInvoiceinfo());
                break;
            case "searchMCMSFTFData"://個股管理作業資料
                Q_Analyst = context.Request["Q_Analyst"];
                //分析師(員工編號)//
                //MeetingDate = context.Request["MeetingDate"];
                MP_Name = context.Request["MP_Name"];//分析師(員工編號)

                context.Response.Write(searchMCMSFTFDataList(Q_Analyst));
                break;



        }

    }
    //修改發票公司資料
    //修改資料到MINVO
    public string SaveEditDataAnalystsData(string com_id_value, string com_name_value, string uniform_num_value, string tax_num_value, string add_user)
    {
        string com_id = com_id_value;
        string com_name = com_name_value;
        string uniform_num = uniform_num_value;
        string tax_num = tax_num_value;
        string edit_user = add_user;
        //string edit_date = common.getDateTime();//(目前時間)/// 產生 年 月 日 時 分 秒

        MINVOEntity mINVOEntity = new MINVOEntity();
        mINVOEntity.Com_id = com_id;
        mINVOEntity.Com_Name = com_name;
        mINVOEntity.Uniform_Num = uniform_num;
        mINVOEntity.Tax_Num = tax_num;
        mINVOEntity.edit_user = edit_user;
        //mINVOEntity.edit_date = edit_date;
        MINVOService.Instance.updateMINVOData(mINVOEntity);//<==========
        return "";
    }
    //新增公司資料
    //新增資料到MINVO
    public string InvoiceinfoCreate(string Com_Name_Value, string Uniform_Num_Value, string Tax_Num_Value, string _add_user, string IP)
    {
        string Com_Name = Com_Name_Value;
        string Uniform_Num = Uniform_Num_Value;
        string Tax_Num = Tax_Num_Value;
        string add_ip = IP;
        string add_user = _add_user;
        string add_date = common.getDateTimeStr();//(目前時間)/// 產生 年 月 日 時 分 秒
                                                   //新增公司資料到Table:[MINVO]
        MINVOEntity mINVOEntity = new MINVOEntity();
        mINVOEntity.Com_Name = Com_Name;
        mINVOEntity.Uniform_Num = Uniform_Num;
        mINVOEntity.Tax_Num = Tax_Num;
        mINVOEntity.del_tag = "0";
        mINVOEntity.add_ip = add_ip;
        mINVOEntity.add_user = add_user;
        //mINVOEntity.edit_user = edit_user;
        mINVOEntity.add_date = add_date;

        //20221014進度:撰寫新增到資料庫的語法
        //List<MSFTFDataEntity> MCMSFTFDataList = MINVOService.Instance.setMINVOData();//<==========
        MINVOService.Instance.setMINVOData(mINVOEntity);//<==========

        //         public companyDataEntity getCompanyData()
        //{
        //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //    log.startWrite(common.nothing, className, methodName);

        //    companyDataEntity cde = MINVOhgDao.Instance.getCompanyData();

        //    log.endWrite(cde.ToString(), className, methodName);
        //    return cde;
        //}
        return "";
    }


    public string getInvoiceinfo()
    {
        List<MINVOEntity> MINVOList = MINVOService.Instance.getMINVOData();
        //List<MCMCHTREntity> muserList = muserService.Instance.getMCMCHTRData(Q_MC, Q_Member);/
        return Newtonsoft.Json.JsonConvert.SerializeObject(MINVOList);

    }

    // <summary>
    /// 設定條件搜尋個股管理作業列表
    /// </summary>
    /// <returns></returns>
    ///Q_Analyst:分析師的員工編號
    public string searchMCMSFTFDataList(string keyword)
    {
        char[] separators = new char[] { ' ', '.', '/' };
        //string MeetingDateNew = "";
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
        //string MP_CName = "";
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
        //MCMFTFHService
        List<MSFTFDataEntity> MCMSFTFDataList = MCMFTFService.Instance.getMCMSFTFDataList(keyword);//<==========

        //log.endWrite("'srmvenuList' :"+SRMVENUList.ToString(), className, methodName);
        var test = Newtonsoft.Json.JsonConvert.SerializeObject(MCMSFTFDataList);
        return Newtonsoft.Json.JsonConvert.SerializeObject(MCMSFTFDataList);
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



    public string getMUSERData(string U_Num, string keyWord, string Com_, string Dept_)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num;':" + U_Num + "'keyWord;':" + keyWord, className, methodName);

        List<muserEntity> eeList = muserService.Instance.getMUSERData(U_Num, keyWord, Com_, Dept_);//<==========

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

    //public string getMUSERData(string MS_ID,string keyowrd,string Com_,string Dept_)
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    log.startWrite("'MS_ID':" + MS_ID, className, methodName);
    //    string keyword = "";
    //    List<muserEntity> muser = muserService.Instance.getMUSERData(MS_ID, keyword,Com_,Dept_);//<==========
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
    //  由前端呼叫
    public string getMCMSFTFData(string keyword)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'keyword':" + keyword, className, methodName);
        List<MSFTFDataEntity> msftf = MCMFTFService.Instance.getMCMSFTFDataList(keyword);//<==========
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