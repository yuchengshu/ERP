using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

/// <summary>
/// MMBERhgDao 的摘要描述
/// </summary>
public class MMBERhgDao : System.Web.UI.Page
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MMBERhgDao _instance = new MMBERhgDao();
    public static MMBERhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MMBERhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string getKYC_tag(string M_ID)
    {
        string KYC_tag = "";
        //string getM_SD_tag_Cmd = "SELECT M_SD_Tag FROM [HG].[dbo].[MMBER]";

        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            /*
             *  string GetMC_COMByQ_MC = "SELECT [MC_COM] FROM [HG].[dbo].[MMBER] where MC='"+ Q_MC + "'";
                string old_MC_COM = GetValueBYSQL(conn, GetMC_COMByQ_MC); //原本的責任助理的員工公司代碼
             * 
             */
            //SqlConnection connection = conn;
            //string getKYC_Cmd = "SELECT * FROM [HG].[dbo].[KYC]";
            //string KYC_tag = GetValueBYSQL(conn, getKYC_Cmd);
            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            string commandText = "select * from kyc where m_id='" + M_ID + "' order by add_Date desc";
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            DataTable dt = new DataTable();
            cmd.Connection = conn;
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
            adapter.Fill(dt);//執行SQL取得的DataTable
            if (dt.Rows.Count == 0)//假如沒有資料
            {
                KYC_tag = "X";//<font color="red"><b>X</b></font>
            }
            else
            {
                KYC_tag = "V";//<font color="green"><b>V</b></font>
            }

        }
        //加入判斷條件算式!!!!!!
        return KYC_tag;
    }
    //要修改!!!(20230615)
    public string getCDD_tag(string M_ID)
    {
        string CDD_tag = "";
        //string getM_SD_tag_Cmd = "SELECT M_SD_Tag FROM [HG].[dbo].[MMBER]";

        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            /*
             *  string GetMC_COMByQ_MC = "SELECT [MC_COM] FROM [HG].[dbo].[MMBER] where MC='"+ Q_MC + "'";
                string old_MC_COM = GetValueBYSQL(conn, GetMC_COMByQ_MC); //原本的責任助理的員工公司代碼
             * 
             */
            //SqlConnection connection = conn;
            string getCount_Cmd = "SELECT * FROM [HG].[dbo].[cdd] where m_id="+ M_ID;
            string M_DS_tag = GetCountBYSQL(conn, getCount_Cmd);
            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            string commandText = "select * from iddata where m_id='" + M_ID + "' order by add_Date desc";
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            DataTable dt = new DataTable();
            cmd.Connection = conn;
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
            adapter.Fill(dt);//執行SQL取得的DataTable
            if (dt.Rows.Count == 0)//假如沒有資料
            {
                CDD_tag = "X";
            }
            else
            {
                CDD_tag = "V";
            }

        }
        //加入判斷條件算式!!!!!!
        return CDD_tag;
    }
    public string getID_tag(string M_ID)
    {
        string ID_tag = "";
        
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            string commandText = "select * from iddata where m_id='" + M_ID + "' order by add_Date desc";
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            DataTable dt = new DataTable();
            cmd.Connection = conn;
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
            adapter.Fill(dt);//執行SQL取得的DataTable
            if(dt.Rows.Count==0)//假如沒有資料
            {
                ID_tag = "-手工)";
            }
            else
            {
                ID_tag = "-網路上傳)";
            }

        }
        return ID_tag;
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

    public string GetCountBYSQL(SqlConnection conn, string commandText)
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
    //CaseTransfer
    //20221007work
    //M_ID:案件編號
    //Q_MC:原本的責任助理的員工編號
    //I_MC:要轉入的責任助理的員工編號
    public List<MCMCHTREntity> CaseTransfer(string M_ID_, string Q_MC, string I_MC)
    {
        List<MCMCHTREntity> MCMCHTRDataList = new List<MCMCHTREntity>();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            //Q_MC:原本的責任助理的員工編號
            string GetMC_COMByQ_MC = "SELECT [MC_COM] FROM [HG].[dbo].[MMBER] where MC='"+ Q_MC + "'";
            string old_MC_COM = GetValueBYSQL(conn, GetMC_COMByQ_MC); //原本的責任助理的員工公司代碼
            //I_MC:要轉入的責任助理的員工編號
            
            string GetMC_NameByQ_MC = "SELECT [MC_Name] FROM [HG].[dbo].[MMBER] where MC='" + Q_MC + "'";
            string old_MC_Name = GetValueBYSQL(conn, GetMC_NameByQ_MC);//原本的責任助理的員工名稱
            //I_MC:要轉入的責任助理的員工編號
            string GetMC_COMByI_MC = "SELECT　ComID FROM [HG].[dbo].[MUSER] where U_Num='" + I_MC + "'";
            string MC_COM= GetValueBYSQL(conn, GetMC_COMByI_MC); //要轉入的責任助理的員工公司代碼
            //I_MC:要轉入的責任助理的員工編號
            string GetMC_NameByI_MC = "SELECT [U_Name] FROM [HG].[dbo].[MUSER]　where U_Num='" + I_MC + "'";
            string MC_Name = GetValueBYSQL(conn, GetMC_NameByI_MC); //要轉入責任助理的員工名稱
            string M_ID = M_ID_;
            //取得目前時間[EditDate] =getdate()
            //新增轉換紀錄至MCHAG
            /*
             * vrs("M_ID") = trim(cities(i)) '會員流水編號
            vrs("old_MC") =  old_MC '原業務人員編號
            vrs("old_MC_Name") = old_MC_Name '原業務人員姓名
            vrs("old_MC_Com") = old_MC_Com '原業務人員公司別
            vrs("New_MC") = I_MC  '新業務人員編號
            vrs("New_MC_Name") = I_MC_Name '新業務人員姓名
            vrs("New_MC_Com") = I_MC_COm  '新業務人員公司
            vrs("Chg_Date") = now()   '轉換日期
            vrs("Chg_user") = session("U_Num")  '轉換人員
            vrs("Chg_PS") = "系統維護-案件轉檔轉出"  '說明
             * 
             */
            /*
             * string commandText = @"INSERT INTO [HG].[dbo].[MTRAT] ([T_ID],[M_ID],[MP],[MP_Name],[MP_COM],[MC],[MC_Name],[MC_COM],[T_Item],[Results_Item],[V_ID],[V_Name],[T_PayMoney],[T_PType],[T_Type],[T_StartDate],[T_EndDate],[T_AccountDate],[T_Fax],[T_Media],[T_PS],[T_Message],[Ccard_4Num],[INV_tag],[INV_Createdate],[INV_Item],[INV_open_Item],[INV_ComName],[INV_UnifyNum],[INV_MNum],[INV_SendState],[Light_Status],[Back_intag],[add_user],[add_date],[add_ip],[edit_date],[MT_COM],[XQ_SName],[XQ_SPw])VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}','{15}','{16}','{17}','{18}','{19}','{20}','{21}','{22}','{23}','{24}','{25}','{26}','{27}','{28}','{29}','{30}','{31}','{32}','{33}',GETDATE(),'{34}',GETDATE(),'{35}','{36}','{37}');";
               StringBuilder sbCommandText = new StringBuilder();
               sbCommandText.Append(string.Format(commandText, tre.T_ID, tre.M_ID, tre.MP, tre.MP_Name, tre.MP_COM, tre.MC, tre.MC_Name, tre.MC_COM, tre.T_Item, tre.Results_Item, tre.V_ID, tre.V_Name, tre.T_PayMoney, tre.T_PType, tre.T_Type, tre.T_StartDate, tre.T_EndDate, tre.T_AccountDate, tre.T_Fax, tre.T_Media, tre.T_PS, tre.T_Message, tre.Ccard_4Num, tre.INV_tag, tre.INV_Createdate, tre.INV_Item, tre.INV_open_Item, tre.INV_ComName, tre.INV_UnifyNum, tre.INV_MNum, tre.INV_SendState, tre.Light_Status, tre.Back_intag, tre.add_user, tre.add_ip, tre.MT_COM,tre.XQ_SName,tre.XQ_SPw));
               string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());

             */
            string commandText = "update [HG].[dbo].[MMBER] set [MC]='{0}',[MC_Name]='{1}',[MC_Com]='{2}',[Change_Date]=getdate() Where [M_ID]='{3}'";
            StringBuilder sbCommandText = new StringBuilder();
            sbCommandText.Append(string.Format(commandText, I_MC, MC_Name, MC_COM, M_ID));
            SqlCommand cmd = new SqlCommand();
            conn.Open();
            cmd.Connection = conn;
            cmd.CommandText = sbCommandText.ToString();
            int i = cmd.ExecuteNonQuery();
            if(i>0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('案件轉檔完成!!');", true);
            }
        }
        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('案件轉檔完成!!');", true);
        return MCMCHTRDataList;
    }
    //20221006work
    /// <summary>
    /// 取得客戶資料
    /// </summary>
    /// <param name="gcp"></param>
    /// <returns></returns>
    public List<customerDataEntity> getCustomerData(getCustormerParams gcp)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'gcp' :" + gcp.ToString(), className, methodName);
        string ct = string.Empty;
        if (common.isEmpty(gcp.M_ID))
        {
            string st = getSqlTxt.CustomerManageST(gcp);
            ct = getCommandText.CustomerManageCT(gcp, st);
        }
        else
        {
            // ct = "select top 300 * from MMBER where M_ID='" + gcp.M_ID + "' and del_tag = '0'";
            ct = "select * from MMBER where M_ID='" + gcp.M_ID + "' and del_tag = '0'";
        }
        List<customerDataEntity> cdeList = MMBERhgSql.Instance.getCustomerData(connectionStrings, ct);//<==========
        List<customerDataEntity> cdeListwithProductuion = MMBERhgSql.Instance.GetCustomerProductionByMID(cdeList, connectionStrings);                                                         //取得會期中商品
        //List <customerDataEntity> cdeListwithProduction = GetProduction(cdeList);
        log.endWrite(cdeList.ToString(), className, methodName);
        //log.endWrite(cdeListwithProductuion.ToString(), className, methodName);
        return cdeList;
        //return cdeListwithProductuion;
    }

    private List<customerDataEntity> GetProduction(List<customerDataEntity> cdeList)
    {
        throw new NotImplementedException();
    }

    public List<customerDataEntity> getCustomerDetail(string Tel)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Tel' :" + Tel, className, methodName);
        string commandText = "select M_ID,M_Name,MC_Name,MC_COM from MMBER where MTel1='" + Tel + "' or MTel2='" + Tel + "' or MTel3='" + Tel + "'";
        List<customerDataEntity> cdeList = MMBERhgSql.Instance.getCustomerDetail(connectionStrings, commandText);//<==========

        log.endWrite("'cdeList' :" + cdeList.ToString(), className, methodName);
        return cdeList;
    }


    public customerDataEntity getSingalCustomerData(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' :" + M_ID, className, methodName);

        string ct = "select M_ID ,M_Name ,M_Sax ,M_Grade ,BirthDay_Date ,MC ,MC_Name ,MC_COM ,OTel_Zone ,OTel ,OTel_Sub , OTel_Zone1 ,OTel1 ,OTel_Sub1 ,HTel_Zone ,HTel ,HTel_Zone1 ,HTel1 ,MTel1 ,MTel2 ,MTel3 ,Fax_Zone ,Fax ,Fax_Zone1 , Fax1 , M_SD ,EMail , OCity , OTown , OZipCode , O_Address , HCity , HTown ,HZipCode , H_Address , Recipient , Inv_Money , Analyst , Product ,Program , M_Note , M_Num ,  M_Password , Light_Status , MRYGC_tag , N_Call_tag , LongTag_Date , add_date from MMBER where M_ID='" + M_ID + "' and del_tag = '0'";

        customerDataEntity cde = MMBERhgSql.Instance.getSingalCustomerData(connectionStrings, ct);//<==========

        log.endWrite("'cde' :" + cde.ToString(), className, methodName);
        return cde;
    }

    public void updateMMBER(string M_ID, string MC, string MC_Name, string MC_Com, string Light_Status)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'M_ID' : {0}, 'MC' : {1}, 'MC_Name' : {2}, 'MC_Com' : {3}, 'Light_Status' : {4}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, M_ID, MC, MC_Name, MC_Com, Light_Status));
        log.startWrite(sb.ToString(), className, methodName);

        string commandText = "UPDATE mmber SET MC = '{0}', MC_Name = '{1}', MC_COM = '{2}', Light_Status = '{3}', LongTag_Date = GETDATE() WHERE M_ID ='{4}' and del_tag = '0'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, MC, MC_Name, MC_Com, Light_Status, M_ID));
        noSelectSql.Instance.doLongTag(connectionStrings, sbCommandText.ToString());//<==========

        log.endWrite(common.nothing, className, methodName);
    }

    public string updateMnumMpassword(string M_ID, string M_Num, string M_Password)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'M_ID' : {0}, 'M_Num' : {1}, 'M_Password' : {2}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, M_ID, M_Num, M_Password));
        log.startWrite(sb.ToString(), className, methodName);

        string commandText = "UPDATE mmber SET M_Num = '{0}', M_Password = '{1}' WHERE M_ID ='{2}' and del_tag = '0'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, M_Num, M_Password, M_ID));
        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<==========

        log.endWrite("'backString' :" + backString, className, methodName);
        return backString;
    }

    public List<midMNameEntity> getMidMNameEntityList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        string commandText = "select M_id,M_Name,M_Num From MMBER where del_tag = '0'";//20221102這邊要修改!!
        List<midMNameEntity> minList = MMBERhgSql.Instance.getMidMNameEntityList(connectionStrings, commandText);//<======

        log.endWrite(minList.ToString(), className, methodName);
        return minList;
    }

    public string addEditCustomerData(customerDataEntity cde, string addEditType)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(cde.ToString(), className, methodName);
        string commandText = string.Empty;
        StringBuilder sbCommandText = new StringBuilder();
        if (addEditType == "add")
        {
            commandText = "INSERT INTO MMBER (M_Name, M_Sax, M_Grade, BirthDay_Date, MC, MC_Name, MC_COM, OTel_Zone, OTel, OTel_Sub, OTel_Zone1, OTel1, OTel_Sub1, HTel_Zone, HTel, HTel_Zone1, HTel1, MTel1, MTel2, MTel3, Fax_Zone, Fax, Fax_Zone1, Fax1, M_SD, EMail, OCity, OTown, OZipCode, O_Address, HCity, HTown,HZipCode ,H_Address, Inv_Money, Analyst, Product, Program, M_Note,Light_Status,add_ip,add_user,add_date,Edit_date)VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}', '{10}', '{11}', '{12}', '{13}', '{14}', '{15}', '{16}', '{17}', '{18}', '{19}', '{20}', '{21}', '{22}', '{23}', '{24}', '{25}', '{26}', '{27}', '{28}', '{29}', '{30}', '{31}', '{32}', '{33}', '{34}', '{35}', '{36}', '{37}', '{38}', '{39}', '{40}', '{41}',GETDATE(),GETDATE())";
            sbCommandText.Append(string.Format(commandText, cde.M_Name, cde.M_Sax, cde.M_Grade, cde.BirthDay_Date, cde.MC, cde.MC_Name, cde.MC_COM, cde.OTel_Zone, cde.OTel, cde.OTel_Sub, cde.OTel_Zone1, cde.OTel1, cde.OTel_Sub1, cde.HTel_Zone, cde.HTel, cde.HTel_Zone1, cde.HTel1, cde.MTel1, cde.MTel2, cde.MTel3, cde.Fax_Zone, cde.Fax, cde.Fax_Zone1, cde.Fax1, cde.M_SD, cde.EMail, cde.OCity, cde.OTown, cde.OZipCode, cde.O_Address, cde.HCity, cde.HTown, cde.HZipCode, cde.H_Address, cde.Inv_Money, cde.Analyst, cde.Product, cde.Program, cde.M_Note, cde.Light_Status, cde.add_ip, cde.add_user));
        }
        else
        {
            commandText = "UPDATE MMBER set M_Name='{0}',M_Sax='{1}',M_Grade='{2}',BirthDay_Date='{3}',MC='{4}',MC_Name='{5}',MC_COM='{6}',OTel_Zone='{7}',OTel='{8}',OTel_Sub='{9}',OTel_Zone1='{10}',OTel1='{11}',OTel_Sub1='{12}',HTel_Zone='{13}',HTel='{14}',HTel_Zone1='{15}',HTel1='{16}',MTel1='{17}',MTel2='{18}',MTel3='{19}',Fax_Zone='{20}',Fax='{21}',Fax_Zone1='{22}',Fax1='{23}',M_SD='{24}',EMail='{25}',OCity='{26}',OTown='{27}',OZipCode='{28}',O_Address='{29}',HCity='{30}',HTown='{31}',HZipCode ='{32}',H_Address='{33}',Recipient='{34}',Inv_Money='{35}',Analyst='{36}',Product='{37}',Program='{38}',M_Note='{39}',Light_Status='{40}',Edit_ip='{41}',Edit_user='{42}',Edit_date= GETDATE() where M_ID='{43}'";
            sbCommandText.Append(string.Format(commandText, cde.M_Name, cde.M_Sax, cde.M_Grade, cde.BirthDay_Date, cde.MC, cde.MC_Name, cde.MC_COM, cde.OTel_Zone, cde.OTel, cde.OTel_Sub, cde.OTel_Zone1, cde.OTel1, cde.OTel_Sub1, cde.HTel_Zone, cde.HTel, cde.HTel_Zone1, cde.HTel1, cde.MTel1, cde.MTel2, cde.MTel3, cde.Fax_Zone, cde.Fax, cde.Fax_Zone1, cde.Fax1, cde.M_SD, cde.EMail, cde.OCity, cde.OTown, cde.OZipCode, cde.O_Address, cde.HCity, cde.HTown, cde.HZipCode, cde.H_Address, cde.Recipient, cde.Inv_Money, cde.Analyst, cde.Product, cde.Program, cde.M_Note, cde.Light_Status, cde.add_ip, cde.add_user, cde.M_ID));

        }

        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<==========
        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }
    //deleteMPMCOTFData
    public string deleteMPMCOTFData(string f_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("f_ID=" + f_ID, className, methodName);

        string commandText = "UPDATE MCOTF SET del_tag = '1' WHERE f_ID = '{0}'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, f_ID));
        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<==========

        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }
    /// <summary>
    /// 刪除客戶資料
    /// </summary>
    /// <param name="M_ID"></param>
    /// <returns></returns>
    public string deleteCustomerData(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("M_ID=" + M_ID, className, methodName);

        string commandText = "UPDATE MMBER SET del_tag = '1' WHERE M_ID = '{0}'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, M_ID));
        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<==========

        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }

    /// <summary>
    /// 查詢是否有會員編號
    /// </summary>
    /// <param name="M_Num"></param>
    /// <returns></returns>
    public string hasMnum(string M_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_Num' :" + M_Num, className, methodName);

        string commandText = "select M_Num From MMBER where M_Num = '{0}'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, M_Num));
        string backString = MMBERhgSql.Instance.hasMnum(connectionStrings, sbCommandText.ToString());//<======

        log.endWrite("'backString' :" + backString, className, methodName);
        return backString;
    }


    /// <summary>
    /// 查詢是否有此手機號碼
    /// </summary>
    /// <param name="MTelList"></param>
    /// <returns></returns>
    public string hasMTel(string MTel)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MTel' : " + MTel, className, methodName);

        string commandText = "select MTel1,MTel2,MTel3 From MMBER where MTel1 = '{0}' or  MTel2 = '{0}' or  MTel3 = '{0}'";

        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, MTel));
        string backString = MMBERhgSql.Instance.hasMTel(connectionStrings, sbCommandText.ToString(), MTel);//<======

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;

    }


    public string getMCname(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : " + M_ID, className, methodName);

        string commandText = "select MC_name From MMBER  where M_ID = '{0}'";

        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, M_ID));
        string backString = MMBERhgSql.Instance.getMCname(connectionStrings, sbCommandText.ToString());//<======

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }
    public List<midMNameEntity> getMMBERdata()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        string commandText = "select M_id,M_Name From MMBER where sourcetag='HG06' order by Add_date";
        List<midMNameEntity> minList = MMBERhgSql.Instance.getMidMNameEntityList(connectionStrings, commandText);//<======

        log.endWrite(minList.ToString(), className, methodName);
        return minList;
    }

    public List<customerDataEntity> getMCnameList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        string commandText = "select MC_Name,MTel1 From MMBER where del_tag='0' and MC_COM='HG06'";
        List<customerDataEntity> cdeList = MMBERhgSql.Instance.getMCnameList(connectionStrings, commandText);//<======

        log.endWrite("'cdeList':" + cdeList.ToString(), className, methodName);
        return cdeList;
    }

    public List<customerDataEntity> getCustomerInTheLastOneMonth(string U_Num, string dateStr)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' :" + U_Num + "'dateStr' :" + dateStr, className, methodName);

        string commandText = " SELECT M_Name,BirthDay_Date,MTel1,MTel2,MTel3,OTel_Zone,OTel_Zone1,OTel,OTel1,OTel_Sub,OTel_Sub1,HTel_Zone,HTel_Zone1,HTel,HTel1,M_ID,add_date FROM MMBER WHERE change_Date >=  '" + dateStr + "' and del_tag='0' and MC='" + U_Num + "' order by change_Date desc";
        //string commandText = "SELECT M_Name,BirthDay_Date,MTel1,MTel2,MTel3,OTel_Zone,OTel_Zone1,OTel,OTel1,OTel_Sub,OTel_Sub1,HTel_Zone,HTel_Zone1,HTel,HTel1,M_ID,add_date FROM MMBER	WHERE change_Date >=  '2017/9/4' and del_tag='0'order by change_Date desc";
        List<customerDataEntity> cdeList = MMBERhgSql.Instance.getCustomerInTheLastOneMonth(connectionStrings, commandText);//<======

        log.endWrite("'cdeList':" + cdeList.ToString(), className, methodName);
        return cdeList;
    }


    public List<customerDataEntity> getBirthDayCustomer(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' :" + U_Num, className, methodName);
        //測試
        //string commandText = "SELECT M_Name,BirthDay_Date,MTel1,MTel2,MTel3,OTel_Zone,OTel_Zone1,OTel,OTel1,OTel_Sub,OTel_Sub1,HTel_Zone,HTel_Zone1,HTel,HTel1,M_ID,add_date FROM  MMBER where Convert(char(10),dateadd(year,datediff(Year,birthday_date,GetDate()),birthday_date),111) between Convert(char(10),Getdate() ,111) and Convert(char(10),Getdate() + 30,111)  order by Convert(char(10),dateadd(year,datediff(Year,birthday_date,GetDate()),birthday_date),111)";
        //正試
        string commandText = "SELECT M_Name,BirthDay_Date,MTel1,MTel2,MTel3,OTel_Zone,OTel_Zone1,OTel,OTel1,OTel_Sub,OTel_Sub1,HTel_Zone,HTel_Zone1,HTel,HTel1,M_ID,add_date FROM  MMBER where Convert(char(10),dateadd(year,datediff(Year,birthday_date,GetDate()),birthday_date),111) between Convert(char(10),Getdate() ,111) and Convert(char(10),Getdate() + 30,111) and MC='" + U_Num + "' order by Convert(char(10),dateadd(year,datediff(Year,birthday_date,GetDate()),birthday_date),111)";

        List<customerDataEntity> cdeList = MMBERhgSql.Instance.getCustomerInTheLastOneMonth(connectionStrings, commandText);//<======

        log.endWrite("'cdeList':" + cdeList.ToString(), className, methodName);
        return cdeList;
    }

    public List<string> getMCcustomerData(string U_Num, string type, string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' :" + U_Num + "'type' :" + type + "'StartDate' :" + StartDate + "'EndDate' :" + EndDate, className, methodName);
        string sqltext = string.Empty;
        string sqlDateText = string.Empty;
        if (type == "traded")
        {
            sqltext = " and M_Num<>''";
        }
        else
        {
            sqltext = "  and (M_Num='' or m_Num is null)";
        }
        if (!common.isEmpty(StartDate))
        {
            sqlDateText = " and (add_date >= '" + StartDate + "') AND (add_date <= '" + EndDate + "')";
        }

        string commandText = "SELECT M_Name FROM  MMBER where MC='" + U_Num + "' and del_tag='0'" + sqltext + sqlDateText;

        List<string> strList = MMBERhgSql.Instance.getMCcustomerData(connectionStrings, commandText);//<======

        log.endWrite("'strList':" + strList.ToString(), className, methodName);
        return strList;
    }

    public List<string> getKeyWordList(string keyWord, string selectItem)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'keyWord' :" + keyWord, className, methodName);

        string commandText = "select DISTINCT " + selectItem + " from MMBER where del_tag = '0'  and  " + selectItem + " LIKE '" + keyWord + "%'";

        List<string> KeyWordList = MMBERhgSql.Instance.getKeyWordList(connectionStrings, commandText);//<======

        log.endWrite("'KeyWordList':" + KeyWordList.ToString(), className, methodName);
        return KeyWordList;
    }

    public customerDataEntity getMMBERdata(string ComID, string Tel)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID' :" + ComID + "'Tel' :" + Tel, className, methodName);

        string sql_txt = getSqlTxt.getMMBERdataST(Tel);

        string commandText = "SELECT M_ID,MC,MC_COM,MC_Name,MTel1,MTel2,MTel3 from MMBER where del_tag='0' and MC_COM ='" + ComID + "'" + sql_txt;

        customerDataEntity cde = MMBERhgSql.Instance.getMMBERdata(connectionStrings, commandText);//<======

        log.endWrite("'cde':" + cde.ToString(), className, methodName);
        return cde;
    }

    public customerDataEntity getMMBERdataByTel(string Tel)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Tel' :" + Tel, className, methodName);

        string sql_txt = getSqlTxt.getMMBERdataST(Tel);

        string commandText = "SELECT M_ID,MC,MC_COM,MC_Name,MTel1,MTel2,MTel3 from MMBER where del_tag='0' and MC_COM ='HG02'" + sql_txt;

        customerDataEntity cde = MMBERhgSql.Instance.getMMBERdata(connectionStrings, commandText);//<======

        log.endWrite("'cde':" + cde.ToString(), className, methodName);
        return cde;
    }

    public string getUpToDateMid()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        string commandText = "select TOP 1 M_ID from MMBER order by add_date desc";
        string backStr = MMBERhgSql.Instance.getUpToDateMid(connectionStrings, commandText);//<======

        log.endWrite("'backStr':" + backStr, className, methodName);
        return backStr;
    }

    public customerDataEntity getCustomerDataByMid(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("M_ID:" + M_ID, className, methodName);

        string commandText = "select M_Name,M_SD from MMBER WHERE M_ID='" + M_ID + "'";
        customerDataEntity cde = MMBERhgSql.Instance.getCustomerDataByMid(connectionStrings, commandText);//<======

        log.endWrite("'cde':" + cde.ToString(), className, methodName);
        return cde;
    }


    public List<customerDataEntity> getERPeditRecord(string keyWord, string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'keyWord' : " + keyWord + "'StartDate' : " + StartDate + "'EndDate' : " + EndDate, className, methodName);


        string sql_txt = getSqlTxt.getERPeditRecordST(keyWord, StartDate, EndDate);
        string commandText = "SELECT M_Num,M_Name,MC_Name,MTel1,MTel2,MTel3,OTel_Zone,OTel_Zone1,OTel,OTel1,OTel_Sub,OTel_Sub1,HTel_Zone,HTel_Zone1,HTel,HTel1,M_ID,add_date,Change_date FROM  MMBER where del_tag = '0' " + sql_txt + " order by add_date desc";
        log.debug2("commandText=" + commandText, "", "");
        List<customerDataEntity> cdeList = MMBERhgSql.Instance.getERPeditRecord(connectionStrings, commandText);//<======

        log.endWrite("'cdeList':" + cdeList.ToString(), className, methodName);
        return cdeList;
    }

}