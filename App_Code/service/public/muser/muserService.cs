using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

/// <summary>
/// muserService 的摘要描述
/// </summary>
public class muserService : System.Web.UI.Page
{

    //引用時不用再NEW
    private static muserService _instance = new muserService();

    public static muserService Instance
    {
        get
        {
            return _instance;
        }
    }
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public muserService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
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
        adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
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
    //取得案件轉檔維護資料
    //20221006:step1 針對[案件轉檔維護]另外命名一個entity(MCMCHTREntity.cs)
    //20221006work 在MMBERhgDao中組成資料datatable後轉成List後回傳
    //CaseTransferMID, Q_MC, I_MC
    public List<MCMCHTREntity> CaseTransfer(string M_ID, string Q_MC, string I_MC)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //20221005:SQL:select Light_status,M_Num,N_Call_tag,M_Name,MC_Name,MTel1,MTel2,OTel,OTel1,HTel,HTel1,add_date from MMBER where del_tag = '0' and N_call_tag='0'
        //and MC_Name like '王彥琦' and M_Num is null


        //log.startWrite("'MS_ID':" + ee.MS_ID + "'MS_Sender':" + ee.MS_Sender + "'MS_Receiver':" + ee.MS_Receiver + "'MS_Title':" + ee.MS_Title + "'MS_Text':" + ee.MS_Text + "'add_User':" + ee.add_User + "'add_ip':" + ee.add_ip, className, methodName);

        //string backStr = MMAILhgDao.Instance.addMailData(ee);//<==========
        //string keyword = Session["Q_keyword"].ToString();
        //string ComID;
        //U_num = Session["U_num"].ToString();
        //ComID = Session["ComID"].ToString();
        //string U_Mdep = Session["U_MDEP"].ToString();
        //string U_NUM = Session["U_Num"].ToString();
        //string Comid = Session["ComID"].ToString();
        // List<muserEntity> muserList = MUSERhgDao.Instance.getALLEmplist(U_Num, keyWord, "", "");//<==========
        List<MCMCHTREntity> MCMCHTRDataList = MMBERhgDao.Instance.CaseTransfer(M_ID,Q_MC, I_MC);//<==========
        //if (backStr == "成功")
        //{
        //    //  backStr = ee.MS_ID;
        //}
        //log.endWrite("'backStr' :" + backStr, className, methodName);
        return MCMCHTRDataList;
    }
    public List<MCMCHTREntity> getMCMCHTRData(string Q_MC,string  Q_Member)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //20221005:SQL:select Light_status,M_Num,N_Call_tag,M_Name,MC_Name,MTel1,MTel2,OTel,OTel1,HTel,HTel1,add_date from MMBER where del_tag = '0' and N_call_tag='0'
        //and MC_Name like '王彥琦' and M_Num is null


        //log.startWrite("'MS_ID':" + ee.MS_ID + "'MS_Sender':" + ee.MS_Sender + "'MS_Receiver':" + ee.MS_Receiver + "'MS_Title':" + ee.MS_Title + "'MS_Text':" + ee.MS_Text + "'add_User':" + ee.add_User + "'add_ip':" + ee.add_ip, className, methodName);

        //string backStr = MMAILhgDao.Instance.addMailData(ee);//<==========
        //string keyword = Session["Q_keyword"].ToString();
        //string ComID;
        //U_num = Session["U_num"].ToString();
        //ComID = Session["ComID"].ToString();
        //string U_Mdep = Session["U_MDEP"].ToString();
        //string U_NUM = Session["U_Num"].ToString();
        //string Comid = Session["ComID"].ToString();
        // List<muserEntity> muserList = MUSERhgDao.Instance.getALLEmplist(U_Num, keyWord, "", "");//<==========
        List<MCMCHTREntity> MCMCHTRDataList = MUSERhgDao.Instance.getMCMCHTRData(Q_MC, Q_Member);//<==========
        if(MCMCHTRDataList.Count==0)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('查無資料!');", true);
        }

        //if (backStr == "成功")
        //{
        //    //  backStr = ee.MS_ID;
        //}
        //log.endWrite("'backStr' :" + backStr, className, methodName);
        return MCMCHTRDataList;
    }
    public string addMUSERData(muserEntity muser)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'MS_ID':" + ee.MS_ID + "'MS_Sender':" + ee.MS_Sender + "'MS_Receiver':" + ee.MS_Receiver + "'MS_Title':" + ee.MS_Title + "'MS_Text':" + ee.MS_Text + "'add_User':" + ee.add_User + "'add_ip':" + ee.add_ip, className, methodName);

        //string backStr = MMAILhgDao.Instance.addMailData(ee);//<==========
        //string keyword = Session["Q_keyword"].ToString();
        //string ComID;
        //U_num = Session["U_num"].ToString();
        //ComID = Session["ComID"].ToString();
        //string U_Mdep = Session["U_MDEP"].ToString();
        //string U_NUM = Session["U_Num"].ToString();
        //string Comid = Session["ComID"].ToString();
        string backStr = MUSERhgDao.Instance.addMuserData(muser);//<==========
        if (backStr == "成功")
        {
            //  backStr = ee.MS_ID;
        }
        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
    /// <summary>
    /// saveEditMuserData
    /// </summary>
    /// <param name="U_Num"></param>
    /// <returns></returns>
    /// //員工資料維護作業-更新
    public string updateMuserEditData(muserEntity muser)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'MS_ID':" + ee.MS_ID + "'MS_Sender':" + ee.MS_Sender + "'MS_Receiver':" + ee.MS_Receiver + "'MS_Title':" + ee.MS_Title + "'MS_Text':" + ee.MS_Text + "'add_User':" + ee.add_User + "'add_ip':" + ee.add_ip, className, methodName);

        //string backStr = MMAILhgDao.Instance.addMailData(ee);//<==========
        //string keyword = Session["Q_keyword"].ToString();
        //string ComID;
        //U_num = Session["U_num"].ToString();
        //ComID = Session["ComID"].ToString();
        //string U_Mdep = Session["U_MDEP"].ToString();
        //string U_NUM = Session["U_Num"].ToString();
        //string Comid = Session["ComID"].ToString();
        string backStr = MUSERhgDao.Instance.updateMuserEditData(muser);//<==========
        if (backStr == "成功")
        {
            //  backStr = ee.MS_ID;
        }
        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
    //員工資料維護作業-更新
    //public string updateMuserEditData(muserEntity muser)
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    //log.startWrite("'MS_ID':" + ee.MS_ID + "'MS_Sender':" + ee.MS_Sender + "'MS_Receiver':" + ee.MS_Receiver + "'MS_Title':" + ee.MS_Title + "'MS_Text':" + ee.MS_Text + "'add_User':" + ee.add_User + "'add_ip':" + ee.add_ip, className, methodName);

    //    //string backStr = MMAILhgDao.Instance.addMailData(ee);//<==========
    //    //string keyword = Session["Q_keyword"].ToString();
    //    //string ComID;
    //    //U_num = Session["U_num"].ToString();
    //    //ComID = Session["ComID"].ToString();
    //    //string U_Mdep = Session["U_MDEP"].ToString();
    //    //string U_NUM = Session["U_Num"].ToString();
    //    //string Comid = Session["ComID"].ToString();
    //    string backStr = MUSERhgDao.Instance.updateMuserEditData(muser);//<==========
    //    if (backStr == "成功")
    //    {
    //        //  backStr = ee.MS_ID;
    //    }
    //    log.endWrite("'backStr' :" + backStr, className, methodName);
    //    return backStr;
    //}
    public List<muserEntity> getMUSERData(string U_Num, string keyWord)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num;':" + U_Num + "'keyWord':" + keyWord, className, methodName);
        log.startWrite("'U_Num;':" + U_Num, className, methodName);
        //muserEntity mse = null;
        List<muserEntity> mseList = new List<muserEntity>();
        List<muserEntity> muserList = MUSERhgDao.Instance.getALLEmplist(U_Num, keyWord, "", "");//<==========
        foreach (var item in muserList)
        {
            mseList.Add(item);
        }
        log.endWrite("'eeList' :" + mseList.ToString(), className, methodName);
        return muserList;
    }

    public MUSERalystsEntity updateMUserAnalystsEDITData(string auto_id, string ProductName,string Code, string Sort)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num;':" + U_Num + "'keyWord':" + keyWord, className, methodName);
        //log.startWrite("'U_Num;':" + U_Num, className, methodName);
        //muserEntity mse = null;
        MUSERalystsEntity msealystEntity = MUSERhgDao.Instance.updateMUserAnalystsEDITData(auto_id, ProductName, Code,Sort);//更新分析師產品權限資料
        //MUSERalystsEntity muserList = MUSERhgDao.Instance.getAnalystsData(Auto_id);//<==========
        //foreach (var item in muserList)
        //{
        //    mseList.Add(item);
        //}
        //log.endWrite("'eeList' :" + mseList.ToString(), className, methodName);
        return msealystEntity;
    }

    public MUSERalystsEntity getMUserAnalystsEDITData(string U_Num_M, string auto_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num;':" + U_Num + "'keyWord':" + keyWord, className, methodName);
        //log.startWrite("'U_Num;':" + U_Num, className, methodName);
        //muserEntity mse = null;
        MUSERalystsEntity msealystEntity = MUSERhgDao.Instance.getMUserAnalystsEDITData(U_Num_M, auto_id);//取得分析師產品權限資料
        //MUSERalystsEntity muserList = MUSERhgDao.Instance.getAnalystsData(Auto_id);//<==========
        //foreach (var item in muserList)
        //{
        //    mseList.Add(item);
        //}
        //log.endWrite("'eeList' :" + mseList.ToString(), className, methodName);
        return msealystEntity;
    }

    //getAnalystsItemData
    public List<MUSERalystsEntity> getAnalystsItemData(string Auto_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num;':" + U_Num + "'keyWord':" + keyWord, className, methodName);
        //log.startWrite("'U_Num;':" + U_Num, className, methodName);
        //muserEntity mse = null;
        List<MUSERalystsEntity> mseList = new List<MUSERalystsEntity>();
        List<MUSERalystsEntity> muserList = MUSERhgDao.Instance.getAnalystsData(Auto_id);//<==========
        foreach (var item in muserList)
        {
            mseList.Add(item);
        }
        log.endWrite("'eeList' :" + mseList.ToString(), className, methodName);
        return muserList;
    }
    public List<MUSERalystsEntity> getAnalystsData(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num;':" + U_Num + "'keyWord':" + keyWord, className, methodName);
        //log.startWrite("'U_Num;':" + U_Num, className, methodName);
        //muserEntity mse = null;
        List<MUSERalystsEntity> mseList = new List<MUSERalystsEntity>();
        List<MUSERalystsEntity> muserList = MUSERhgDao.Instance.getAnalystsData(U_Num);//<==========
        foreach (var item in muserList)
        {
            mseList.Add(item);
        }
        log.endWrite("'eeList' :" + mseList.ToString(), className, methodName);
        return muserList;
    }
    //20220913work
    public List<muserEntity> getMUSERData(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num;':" + U_Num + "'keyWord':" + keyWord, className, methodName);
        //log.startWrite("'U_Num;':" + U_Num, className, methodName);
        //muserEntity mse = null;
        List<muserEntity> mseList = new List<muserEntity>();
        List<muserEntity> muserList = MUSERhgDao.Instance.getALLEmplist(U_Num);//<==========
        foreach (var item in muserList)
        {
            mseList.Add(item);
        }
        log.endWrite("'eeList' :" + mseList.ToString(), className, methodName);
        return muserList;
    }

    //public List<muserEntity> getMUSERData(string U_Num, string keyWord)
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    //log.startWrite("'U_Num;':" + U_Num + "'keyWord':" + keyWord, className, methodName);
    //    log.startWrite("'U_Num;':" + U_Num, className, methodName);
    //    //muserEntity mse = null;
    //    List<muserEntity> mseList = new List<muserEntity>();
    //    List<muserEntity> muserList = MUSERhgDao.Instance.getALLEmplist(U_Num, keyWord);//<==========
    //    foreach (var item in muserList)
    //    {
    //        mseList.Add(item);
    //    }
    //    log.endWrite("'eeList' :" + mseList.ToString(), className, methodName);
    //    return muserList;
    //}
    //取得此類別名稱
    public List<muserEntity> getMUSERData(string U_Num, string keyWord, string Com_, string Dept_)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num;':" + U_Num + "'keyWord':" + keyWord, className, methodName);
        log.startWrite("'U_Num;':" + U_Num, className, methodName);
        //muserEntity mse = null;
        List<muserEntity> mseList = new List<muserEntity>();
        List<muserEntity> muserList = MUSERhgDao.Instance.getALLEmplist(U_Num, keyWord, Com_, Dept_);//<==========
        foreach (var item in muserList)
        {
            mseList.Add(item);
        }
        log.endWrite("'eeList' :" + mseList.ToString(), className, methodName);
        return muserList;
    }
    //取得所有報表
    public List<MREPOqueryEntity> getALLMREPO_qyeryDataList(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num;':" + U_Num + "'keyWord':" + keyWord, className, methodName);
        //log.startWrite("'U_Num;':" + U_Num, className, methodName);
        //muserEntity mse = null;
        List<MREPOqueryEntity> mseList = new List<MREPOqueryEntity>();
        List<MREPOqueryEntity> muserList = MUSERhgDao.Instance.getALLMREPO_qyeryDataList();//此帳號可執行的報表權限
        foreach (var item in muserList)
        {
            mseList.Add(item);
        }
        log.endWrite("'eeList' :" + mseList.ToString(), className, methodName);
        return mseList;
    }


    //此帳號可執行的報表權限
    public List<MREPOqueryEntity> getMREPO_qyeryDataList(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num;':" + U_Num + "'keyWord':" + keyWord, className, methodName);
        //log.startWrite("'U_Num;':" + U_Num, className, methodName);
        //muserEntity mse = null;
        List<MREPOqueryEntity> mseList = new List<MREPOqueryEntity>();
        MUSERhgDao mUSERhgDao = new MUSERhgDao();
        mseList = mUSERhgDao.getMREPOqueryEntityList(U_Num);
        //List<MREPOqueryEntity> muserALLList = MUSERhgDao.Instance.getMREPOALLqueryEntityList(U_Num);//此帳號可執行的報表權限
        //List<MREPOqueryEntity> muserListWithPre = MUSERhgDao.Instance.getMREPOqueryEntityList(U_Num);//此帳號可執行的報表權限
        //foreach (var item in muserList)
        //{
        //    mseList.Add(item);
        //}
        log.endWrite("'eeList' :" + mseList.ToString(), className, methodName);
        return mseList;//此帳號可執行的報表權限
    }

    public List<muserMenuSetupEntity> getMUSER_MenuSetupDataList(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num;':" + U_Num + "'keyWord':" + keyWord, className, methodName);
        //log.startWrite("'U_Num;':" + U_Num, className, methodName);
        //muserEntity mse = null;
        List<muserMenuSetupEntity> mseList = new List<muserMenuSetupEntity>();
        List<muserMenuSetupEntity> muserList = MUSERhgDao.Instance.getMUSER_MenuSetupDataList(U_Num);//此員工可執行的功能
        foreach (var item in muserList)
        {
            mseList.Add(item);
        }
        log.endWrite("'eeList' :" + mseList.ToString(), className, methodName);
        return mseList;
    }
    //updateMUSER_MenuSetupData
    public List<muserMenuSetupEntity> updateMUSER_MenuSetupData(string Fun_Name, string Menu_No, string TrueOrFalse, string User_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num;':" + U_Num + "'keyWord':" + keyWord, className, methodName);
        //log.startWrite("'U_Num;':" + U_Num, className, methodName);
        //muserEntity mse = null;
        List<muserMenuSetupEntity> mseList = new List<muserMenuSetupEntity>();
        //public string setUserAuthority(string FunName, string menu_no, string U_Num, int Enable)
        string muserList = MUMAPhgDao.Instance.setUserAuthority(Fun_Name, Menu_No, User_Num, TrueOrFalse);//此員工可執行的功能
        //foreach (var item in muserList)
        //{
        //    mseList.Add(item);
        //}
        //log.endWrite("'eeList' :" + mseList.ToString(), className, methodName);
        return mseList;
    }
    public string GetState(string menu_id, string U_Num, string Per_Kind)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num;':" + U_Num + "'keyWord':" + keyWord, className, methodName);
        //log.startWrite("'U_Num;':" + U_Num, className, methodName);
        //muserEntity mse = null;
        List<muserMenuSetupEntity> mseList = new List<muserMenuSetupEntity>();
        string state = MUSERhgDao.Instance.getPer_State(menu_id, U_Num, Per_Kind);//此帳號可執行的功能狀態1:開啟 0:關閉

        return state;
    }

    public string ChangeState(string U_Num, string Per_Kind, string menu_no, string status)
    {

        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num;':" + U_Num + "'keyWord':" + keyWord, className, methodName);
        //log.startWrite("'U_Num;':" + U_Num, className, methodName);
        //muserEntity mse = null;
        List<muserMenuSetupEntity> mseList = new List<muserMenuSetupEntity>();
        string result = MUSERhgDao.Instance.ChangeState(U_Num, Per_Kind, menu_no, status);

        return result;
    }
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";
    string commandText = "";
    public string GetNumByName(string Name, string type)
    {
        string value = "";
        //sql連線字串 webconfig的對應位置
        //SqlConnection conn = new SqlConnection();
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString());
        SqlCommand cmd = new SqlCommand();
        commandText = "SELECT ditcode FROM [HG].[dbo].[MITEM] where ddesc='" + Name + "' and mitcode='" + type + "'";
        cmd.CommandText= commandText;
        DataTable dt = new DataTable();
        try
        {
            conn.Open();
            cmd.Connection = conn;
            SqlCommand com = new SqlCommand(commandText, conn);
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);
            foreach (DataRow row in dt.Rows)
            {
                //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
                value = row[0].ToString();
            }
        }
        catch (Exception)
        {

            throw;
        }
        commandText = "SELECT ditcode FROM [HG].[dbo].[MITEM] where ddesc='" + Name+"' and mitcode='"+ type + "'";
        return value;
    }

}