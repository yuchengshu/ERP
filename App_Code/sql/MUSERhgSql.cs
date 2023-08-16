using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

/// <summary>
/// MUSERhgSql 的摘要描述
/// </summary>
public class MUSERhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MUSERhgSql _instanct = new MUSERhgSql();
    public static MUSERhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MUSERhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //getMCMCHTRData
    public List<MCMCHTREntity> getMCMCHTRData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        //DateTime dateTime = DateTime.Now;
        //DateTime dateTime_ = dateTime.AddDays(-30);
        //string datetime = dateTime_.ToString("d");
        List<MCMCHTREntity> MCMCHTRDataList = new List<MCMCHTREntity>();
        int i = 0;
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            //using (SqlConnection conn2 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
            //{ 
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            DateTime dateTime = DateTime.Now;
            DateTime dateTime_ = dateTime.AddDays(-30);
            string datetime = dateTime_.ToString("d");
            MCMCHTRDataList.Clear();

            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    MCMCHTREntity _MCMCHTRData = new MCMCHTREntity();
                    _MCMCHTRData.Light_status = sr[0].ToString().Trim();//燈號
                    _MCMCHTRData.M_ID = sr[1].ToString().Trim(); //M_ID
                    _MCMCHTRData.N_Call_tag = sr[2].ToString().Trim();//拒聯
                    _MCMCHTRData.M_Name = sr[3].ToString().Trim();//姓名
                    _MCMCHTRData.MC_Name = sr[4].ToString().Trim();//助理姓名
                    _MCMCHTRData.M_Tel1 = sr[5].ToString().Trim();//手機1
                    _MCMCHTRData.M_Tel2 = sr[6].ToString().Trim();//手機1
                    _MCMCHTRData.OTel = sr[7].ToString().Trim();//公司電話1
                    _MCMCHTRData.OTel1 = sr[8].ToString().Trim();//公司電話2
                    _MCMCHTRData.HTel = sr[9].ToString().Trim();//住家電話1
                    _MCMCHTRData.HTel1 = sr[10].ToString().Trim();//住家電話2
                    _MCMCHTRData.add_date = sr[11].ToString();//建檔日
                                                              //_MCMCHTRData.note = sr[12].ToString();//註記:'查詢是否有註記，且註記時間小約15天內，否則可註記
                                                              //'20221011:改為註記時間小約30天內，否則可註記
                                                              //TSQL = "select * From DMBER  where M_ID ='" & vrs("M_ID") & "'
                                                              //and del_tag='0' AND DM_MarkTime>='" & dateadd("d", -30, date()) & "' order by DM_Marktime desc"
                                                              //_MCMCHTRData.note = sr[12].ToString();
                                                              //string SQL = "select * From DMBER where M_ID ='" + _MCMCHTRData.M_ID + "' and del_tag='0' AND DM_MarkTime>='" + datetime + "' order by DM_Marktime desc";
                                                              //SqlCommand GetNoteCmd = new SqlCommand();
                                                              //GetNoteCmd.Connection = conn;
                                                              //GetNoteCmd.CommandText = SQL;
                                                              //int i = GetNoteCmd.ExecuteNonQuery();//查詢註記的筆數
                                                              //if(i>0)
                                                              //{
                                                              //    _MCMCHTRData.note = "註";
                                                              //}
                                                              //else
                                                              //{
                                                              //    _MCMCHTRData.note = "";
                                                              //}
                    MCMCHTRDataList.Add(_MCMCHTRData);
                }

                sr.Close();
                foreach (var item in MCMCHTRDataList)
                {
                    string SQL = "select * From DMBER where M_ID ='" + item.M_ID + "' and del_tag='0' AND DM_MarkTime>='" + datetime + "' order by DM_Marktime desc";

                    cmd.CommandText = SQL;
                    //查詢是否有註記，且註記時間小約15天內，否則可註記
                    int j = cmd.ExecuteNonQuery();
                    if (j > 0)
                    {
                        item.note = "註記";
                        MCMCHTRDataList[i].note = "註記";
                    }
                    else
                    {
                        item.note = "無";
                        MCMCHTRDataList[i].note = "無";
                    }
                    i++;
                    if (i == MCMCHTRDataList.Count)
                    {
                        break;
                    }
                }
            }
            //}
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(MCMCHTRDataList.ToString(), className, methodName);
        return MCMCHTRDataList;
    }
    public string getPunchcard_Tag(string connectionStrings, string commandText)
    {
        {
            string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
            string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
            StringBuilder sb = new StringBuilder();
            sb.Append(string.Format(paramFormat, connectionStrings, commandText));
            log.startWrite(sb.ToString(), className, methodName);
            //======================================================================================================================以上為log

            List<muserEntity> employList = new List<muserEntity>();
            muserEntity employ = new muserEntity();
            //從資料庫把資料撈出來*************************************************************************************************start
            using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = commandText;
                //muserEntity employ = new muserEntity();
                using (SqlDataReader sr = cmd.ExecuteReader())
                {
                    while (sr.Read())
                    {
                        // muserEntity employ = new muserEntity();
                        employ.Punchcard_tag = sr[0].ToString().Trim();//員工編號
                                                                       //employ.ddesc = sr[1].ToString().Trim(); //員工名稱
                                                                       //RAList.ddesc2 = sr[2].ToString().Trim(); //員工公司編號名稱
                                                                       //RAList.Code = sr[2].ToString().Trim();//代碼
                                                                       //RAList.Sort = sr[3].ToString().Trim();//排序
                                                                       //employList.Add(employ);
                    }
                }
            }
            //從資料庫把資料撈出來*************************************************************************************************end
            log.endWrite(employ.Punchcard_tag, className, methodName);
            return employ.Punchcard_tag;
        }
    }
    public string getMC_Name(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        string MC_Name = "";
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    MC_Name= sr[0].ToString().Trim(); //員工名稱
                    //RAList.ddesc2 = sr[2].ToString().Trim(); //員工公司編號名稱
                    //RAList.Code = sr[2].ToString().Trim();//代碼
                    //RAList.Sort = sr[3].ToString().Trim();//排序
                   
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(MC_Name.ToString(), className, methodName);
        return MC_Name;
    }
    public List<ditcodedescEntity> getSelectEmployList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<ditcodedescEntity> employList = new List<ditcodedescEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    ditcodedescEntity employ = new ditcodedescEntity();
                    employ.ditcode = sr[0].ToString().Trim();//員工編號
                    employ.ddesc = sr[1].ToString().Trim(); //員工名稱
                    //RAList.ddesc2 = sr[2].ToString().Trim(); //員工公司編號名稱
                    //RAList.Code = sr[2].ToString().Trim();//代碼
                    //RAList.Sort = sr[3].ToString().Trim();//排序
                    employList.Add(employ);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(employList.ToString(), className, methodName);
        return employList;
    }

    public string GetNote(string MID, string datetime, SqlConnection conn)
    {
        string Note = "";
        /*
         *  //TSQL = "select * From DMBER  where M_ID ='" & vrs("M_ID") & "'
            //and del_tag='0' AND DM_MarkTime>='" & dateadd("d", -30, date()) & "' order by DM_Marktime desc"

         */
        //using (SqlConnection conn2 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        //{
        //string Note = "";
        string SQL = "select * From DMBER where M_ID ='" + MID + "' and del_tag='0' AND DM_MarkTime>='" + datetime + "' order by DM_Marktime desc";
        SqlCommand cmd = new SqlCommand(SQL, conn);
        int i = cmd.ExecuteNonQuery();
        //SqlDataAdapter da = new SqlDataAdapter(cmd);
        //    DataTable dt = new DataTable();
        //    da.Fill(dt);
        //if (dt.Rows.Count > 0)
        //{
        //    Note = "註記";
        //}
        //else
        //{
        //    Note = "";
        //}
        if (i > 0)
        {
            Note = "註記";
        }
        else
        {
            Note = "";
        }
        //}
        return Note;

    }
    //
    public List<ditcodedescEntity> getResponsibleAssistantList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<ditcodedescEntity> ResponsibleAssistantList = new List<ditcodedescEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    ditcodedescEntity RAList = new ditcodedescEntity();
                    RAList.ditcode = sr[0].ToString().Trim();//員工編號
                    RAList.ddesc = sr[1].ToString().Trim(); //員工名稱
                    RAList.ddesc2 = sr[2].ToString().Trim(); //員工公司編號名稱
                    //RAList.Code = sr[2].ToString().Trim();//代碼
                    //RAList.Sort = sr[3].ToString().Trim();//排序
                    ResponsibleAssistantList.Add(RAList);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(ResponsibleAssistantList.ToString(), className, methodName);
        return ResponsibleAssistantList;
    }
    //取得分析師(MP)對應產品種類(MP_Type)
    //getMPToMP_TypeList
    public List<ditcodedescEntity> getMPToMP_TypeList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<ditcodedescEntity> MPToMP_TypeList = new List<ditcodedescEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    ditcodedescEntity MPToMP_Type = new ditcodedescEntity();
                    MPToMP_Type.ditcode = sr[0].ToString().Trim();//產品種類編號
                    MPToMP_Type.ddesc = sr[1].ToString().Trim(); //產品名稱
                    //MPToMP_Type.ddesc2 = sr[2].ToString().Trim(); //員工公司編號名稱
                    //RAList.Code = sr[2].ToString().Trim();//代碼
                    //RAList.Sort = sr[3].ToString().Trim();//排序
                    MPToMP_TypeList.Add(MPToMP_Type);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(MPToMP_TypeList.ToString(), className, methodName);
        return MPToMP_TypeList;
    }
    //取得員工資料維護作業-分析師產品權限資料
    public List<MUSERalystsEntity> getAnalystsData(string connectionStrings, string commandText)
    {

        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<MUSERalystsEntity> muserAlEList = new List<MUSERalystsEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    MUSERalystsEntity muserAlE = new MUSERalystsEntity();
                    muserAlE.auto_id = sr[0].ToString().Trim();//序號
                    muserAlE.ProductName = sr[1].ToString().Trim(); //產品名稱
                    muserAlE.Code = sr[2].ToString().Trim();//代碼
                    muserAlE.Sort = sr[3].ToString().Trim();//排序
                    muserAlEList.Add(muserAlE);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(muserAlEList.ToString(), className, methodName);
        return muserAlEList;

    }
    public List<indexBDdataEntity> getDispatcherList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<indexBDdataEntity> eList = new List<indexBDdataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    indexBDdataEntity emp = new indexBDdataEntity();
                    emp.U_Num = sr[0].ToString().Trim();
                    emp.U_Name = sr[1].ToString().Trim();
                    //emp.empName = sr[1].ToString().Trim();
                    //emp.U_EName = sr[2].ToString().Trim();
                    //emp.ComID = sr[3].ToString().Trim();
                    eList.Add(emp);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(eList.ToString(), className, methodName);
        return eList;
    }
    //getLeaderList
    public List<ditcodedescEntity> getLeaderList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<ditcodedescEntity> eList = new List<ditcodedescEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    ditcodedescEntity emp = new ditcodedescEntity();
                    emp.ditcode = sr[0].ToString().Trim();
                    emp.ddesc = sr[1].ToString().Trim();
                    //emp.empName = sr[1].ToString().Trim();
                    //emp.U_EName = sr[2].ToString().Trim();
                    //emp.ComID = sr[3].ToString().Trim();
                    eList.Add(emp);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(eList.ToString(), className, methodName);
        return eList;
    }
    //public string updateMUserAnalystsEDITData(string connectionStrings, string commandText)
    //{
    //}

    public MUSERalystsEntity getMUserAnalystsEDITData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        MUSERalystsEntity mUSERalystsEntity = new MUSERalystsEntity();
        //List<ditcodedescEntity> eList = new List<ditcodedescEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    mUSERalystsEntity.auto_id = sr[0].ToString();//auto_id
                    mUSERalystsEntity.ProductName = sr[1].ToString().Trim();//產品名稱
                    mUSERalystsEntity.Code = sr[2].ToString().Trim();//代碼
                    mUSERalystsEntity.Sort = sr[3].ToString().Trim();//排序
                                                                     //emp.empName = sr[1].ToString().Trim();
                                                                     //emp.U_EName = sr[2].ToString().Trim();
                                                                     //emp.ComID = sr[3].ToString().Trim();

                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(mUSERalystsEntity.ToString(), className, methodName);
        return mUSERalystsEntity;
    }

    public List<ditcodedescEntity> getAgentList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<ditcodedescEntity> eList = new List<ditcodedescEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    ditcodedescEntity emp = new ditcodedescEntity();
                    emp.ditcode = sr[0].ToString().Trim();
                    emp.ddesc = sr[1].ToString().Trim();
                    //emp.empName = sr[1].ToString().Trim();
                    //emp.U_EName = sr[2].ToString().Trim();
                    //emp.ComID = sr[3].ToString().Trim();
                    eList.Add(emp);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(eList.ToString(), className, methodName);
        return eList;
    }
    public List<MREPOqueryEntity> getMRMAPDataList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<MREPOqueryEntity> MOEList = new List<MREPOqueryEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            //select REPO_no,DEP_name,REPO_id,REPO_name,Note from MREPO

            //elect * from MRMAP where U_NUM='B9601151'
            cmd.CommandText = commandText;
            //select * from MRMAP where U_NUM='B9601151'
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    //"select * from MREPO
                    MREPOqueryEntity MOE = new MREPOqueryEntity();
                    //select * from MRMAP where U_NUM='B9601151'
                    MOE.REPO_no = sr[0].ToString().Trim();
                    MOE.DEP_name = sr[1].ToString().Trim();
                    MOE.REPO_id = sr[2].ToString().Trim();
                    MOE.REPO_name = sr[3].ToString().Trim();
                    MOE.Note = sr[4].ToString().Trim();
                    //MOE.DEO_name= sr[5].ToString().Trim(); 
                    //MOE.Note=sr[4].ToString().Trim();
                    //MOE.per_open = "1";
                    MOEList.Add(MOE);
                }
            }
        }
        return MOEList;
    }
    //20220809
    //20220810要修改的地方
    //取得此帳號有權限使用的報表
    public List<MREPOqueryEntity> getMREPOqueryDataList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<MREPOqueryEntity> MOEList = new List<MREPOqueryEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            //select REPO_no,DEP_name,REPO_id,REPO_name,Note from MREPO

            //elect * from MRMAP where U_NUM='B9601151'
            cmd.CommandText = commandText;
            //select * from MRMAP where U_NUM='B9601151'
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    //"select * from MREPO
                    MREPOqueryEntity MOE = new MREPOqueryEntity();
                    //select * from MRMAP where U_NUM='B9601151'
                    MOE.DEP_name = sr[0].ToString();
                    MOE.REPO_id = sr[1].ToString().Trim();
                    MOE.REPO_name = sr[2].ToString();
                    MOE.Note = sr[3].ToString();
                    MOE.per_open = sr[4].ToString();
                    MOE.REPO_no = sr[5].ToString();
                    //MOE.DEP_name= sr[1].ToString().Trim();
                    //MOE.per_open = sr[2].ToString().Trim();
                    //MOE.REPO_name= sr[3].ToString().Trim(); 
                    //MOE.Note= sr[4].ToString().Trim();
                    //MOE.DEO_name= sr[5].ToString().Trim(); 
                    //MOE.Note=sr[4].ToString().Trim();
                    //MOE.per_open = "1";
                    MOEList.Add(MOE);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(MOEList.ToString(), className, methodName);
        return MOEList;
    }
    //getALLMREPOqueryEntityList
    //select REPO_no,DEP_name,REPO_id,REPO_name,Note from MREPO"
    public List<MREPOqueryEntity> getALLMREPOqueryEntityList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<MREPOqueryEntity> MOEList = new List<MREPOqueryEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            //select REPO_no,DEP_name,REPO_id,REPO_name,Note from MREPO

            //elect * from MRMAP where U_NUM='B9601151'
            cmd.CommandText = commandText;
            //select * from MRMAP where U_NUM='B9601151'
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    //select REPO_no,DEP_name,REPO_id,REPO_name,Note from MREPO"
                    MREPOqueryEntity MOE = new MREPOqueryEntity();

                    MOE.REPO_no = sr[0].ToString().Trim();
                    MOE.DEP_name = sr[1].ToString().Trim();
                    MOE.REPO_id = sr[2].ToString().Trim();
                    MOE.REPO_name = sr[3].ToString().Trim();
                    MOE.Note = sr[4].ToString().Trim();
                    //MOE.DEO_name= sr[5].ToString().Trim(); 
                    //MOE.Note=sr[4].ToString().Trim();
                    //MOE.per_open = "1";
                    MOEList.Add(MOE);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(MOEList.ToString(), className, methodName);
        return MOEList;
    }
    public List<indexBDdataEntity> getAnalystList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<indexBDdataEntity> eList = new List<indexBDdataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            indexBDdataEntity emp = null;
            if (commandText.Trim() == "select U_Num,U_Name,U_EName,ComID From MUSER  where U_Position = '0005' and ComID = 'HG01' and LeaveDate is null")
            {
                using (SqlDataReader sr = cmd.ExecuteReader())
                {
                    while (sr.Read())
                    {
                        emp = new indexBDdataEntity();
                        emp.U_Num = sr[0].ToString().Trim();
                        emp.empName = sr[1].ToString().Trim();
                        emp.U_EName = sr[2].ToString().Trim();
                        emp.ComID = sr[3].ToString().Trim();
                        eList.Add(emp);
                    }
                }
            }
            else
            {
                using (SqlDataReader sr = cmd.ExecuteReader())
                {
                    while (sr.Read())
                    {
                        emp = new indexBDdataEntity();
                        emp.U_Num = sr[0].ToString().Trim();
                        emp.empName = sr[1].ToString().Trim();
                        emp.U_EName = sr[2].ToString().Trim();
                        emp.ComID = sr[3].ToString().Trim();
                        eList.Add(emp);
                    }
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(eList.ToString(), className, methodName);
        return eList;
    }

    /// <summary>
    /// 將資料從資料庫取出，並解析
    /// </summary>
    /// <param name="connectionStrings">連接字串</param>
    /// <param name="commandText">命令字串</param>
    /// <param name="U_Num">使用者代號</param>
    /// <returns></returns>
    public sessionEntity getUserData(string connectionStrings, string commandText, string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}, 'U_Num' :{2}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText, U_Num));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        sessionEntity se = new sessionEntity();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    se.U_Num = sr[0].ToString().Trim();
                    se.U_Name = sr[1].ToString().Trim();
                    se.U_POSITION = sr[2].ToString().Trim();
                    se.U_MDEP = sr[3].ToString().Trim();
                    se.ComID = sr[4].ToString().Trim();
                    se.ComLand = sr[5].ToString().Trim();
                    se.U_EMail = sr[6].ToString().Trim();
                    se.U_Leader = sr[7].ToString().Trim();
                    se.U_LeaderName = sr[8].ToString().Trim();
                    se.LeaveDate = sr[9].ToString().Trim();
                    se.U_LeaderCom = sr[10].ToString().Trim();
                }
            }
        }

        log.U_Name = se.U_Name;
        log.endWrite(se.ToString(), className, methodName);
        return se;
    }

    public List<businessERPstatusEntity> getMCdataForBusinessERPstatus(string connectionStrings, string commandText, string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}, 'U_Num' :{2}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText, U_Num));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<businessERPstatusEntity> beseList = new List<businessERPstatusEntity>();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            businessERPstatusEntity bese = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    bese = new businessERPstatusEntity();
                    bese.U_Num = sr[0].ToString().Trim();
                    bese.U_Name = sr[1].ToString().Trim();
                    beseList.Add(bese);
                }
            }
        }

        log.endWrite("'beseList' :" + beseList.ToString(), className, methodName);
        return beseList;
    }

    public List<caseDistributeEntity> getMCListForCaseDistribute(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<caseDistributeEntity> cdeList = new List<caseDistributeEntity>();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            caseDistributeEntity cde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    cde = new caseDistributeEntity();
                    cde.U_Num = sr[0].ToString().Trim();
                    cde.U_Name = sr[1].ToString().Trim();
                    cdeList.Add(cde);
                }
            }
        }

        log.endWrite("'cdeList' :" + cdeList.ToString(), className, methodName);
        return cdeList;
    }

    public List<muserEntity> getEmpList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<muserEntity> ibddeList = new List<muserEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    muserEntity ibddE = new muserEntity();
                    ibddE.U_Name = sr[0].ToString().Trim();
                    ibddE.BirthDayDate = sr[1].ToString().Trim();
                    ibddE.U_Num = sr[2].ToString().Trim();
                    ibddE.ComID = sr[3].ToString().Trim();
                    ibddE.ComLand = sr[4].ToString().Trim();
                    ibddeList.Add(ibddE);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(ibddeList.ToString(), className, methodName);
        return ibddeList;
    }


    public List<indexBDdataEntity> getEmpExtension(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<indexBDdataEntity> ibddeList = new List<indexBDdataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    indexBDdataEntity ibddE = new indexBDdataEntity();
                    ibddE.U_Item = sr[0].ToString().Trim();
                    ibddE.empName = sr[1].ToString().Trim();
                    ibddE.U_Tel = sr[2].ToString().Trim();
                    ibddeList.Add(ibddE);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(ibddeList.ToString(), className, methodName);
        return ibddeList;
    }

    public List<muserEntity> getAnalystListForSRMSYSKQuery(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<muserEntity> ibddeList = new List<muserEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    muserEntity ibddE = new muserEntity();
                    ibddE.U_Num = sr[0].ToString().Trim();
                    ibddE.U_Name = sr[1].ToString().Trim();
                    ibddeList.Add(ibddE);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(ibddeList.ToString(), className, methodName);
        return ibddeList;
    }

    public List<indexBDdataEntity> getEmpBDlist(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<indexBDdataEntity> ibddeList = new List<indexBDdataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    indexBDdataEntity ibddE = new indexBDdataEntity();
                    ibddE.empName = sr[0].ToString().Trim();
                    ibddE.empBD = sr[1].ToString().Trim();
                    ibddE.U_Num = sr[2].ToString().Trim();
                    ibddeList.Add(ibddE);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(ibddeList.ToString(), className, methodName);
        return ibddeList;
    }

    public List<muserEntity> getEmplist(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<muserEntity> ibddeList = new List<muserEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    muserEntity ibddE = new muserEntity();
                    ibddE.U_Name = sr[0].ToString().Trim();
                    ibddE.U_id = sr[1].ToString().Trim();
                    ibddE.U_Num = sr[2].ToString().Trim();
                    ibddeList.Add(ibddE);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(ibddeList.ToString(), className, methodName);
        return ibddeList;
    }
    public string getU_Leader(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        string backString = string.Empty;
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    backString = sr[0].ToString().Trim();
                }
            }
        }

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }
    public string getAgentUnum(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        string backString = string.Empty;
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    backString = sr[0].ToString().Trim();
                }
            }
        }

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    public mcDataEntity getMCdata(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        mcDataEntity mde = new mcDataEntity();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    mde.U_Num = sr[0].ToString().Trim();
                    mde.U_Name = sr[1].ToString().Trim();
                    mde.U_MDEP = sr[2].ToString().Trim();
                    mde.ComID = sr[3].ToString().Trim();
                    mde.U_Leader = sr[4].ToString().Trim();
                    mde.U_LeaderName = sr[5].ToString().Trim();
                    mde.U_LeaderCom = sr[6].ToString().Trim();
                    mde.SlimDate = sr[7].ToString().Trim();
                    mde.LeaveDate = sr[8].ToString().Trim();
                    mde.U_Agent = sr[9].ToString().Trim();
                }
            }
        }

        log.endWrite("'mde' : " + mde.ToString(), className, methodName);
        return mde;
    }
    public List<mcDataEntity> getMClist(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<mcDataEntity> mdeList = new List<mcDataEntity>();

        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    mcDataEntity mde = new mcDataEntity();
                    mde.U_Num = sr[0].ToString().Trim();
                    mde.U_Name = sr[1].ToString().Trim();
                    mde.U_MDEP = sr[2].ToString().Trim();
                    mde.ComID = sr[3].ToString().Trim();
                    mdeList.Add(mde);
                }
            }
        }

        log.endWrite("'mdeList' : " + mdeList.ToString(), className, methodName);
        return mdeList;
    }

    public List<indexBDdataEntity> getEmpData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<indexBDdataEntity> ibddeList = new List<indexBDdataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            indexBDdataEntity ibddE = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    ibddE = new indexBDdataEntity();
                    ibddE.U_Num = sr[0].ToString().Trim();
                    ibddE.empName = sr[1].ToString().Trim();
                    ibddE.U_MDEP = sr[2].ToString().Trim();
                    ibddE.ComID = sr[3].ToString().Trim();

                    ibddeList.Add(ibddE);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(ibddeList.ToString(), className, methodName);
        return ibddeList;
    }

    public List<string> getConcernedPeople(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<string> strList = new List<string>();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    strList.Add(sr[0].ToString().Trim());
                }
            }
        }

        log.endWrite("'strList' : " + strList.ToString(), className, methodName);
        return strList;
    }


    public List<businessERPstatusEntity> getMCdataForBusinessERPstatus(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<businessERPstatusEntity> bsseList = new List<businessERPstatusEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            businessERPstatusEntity bese = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    bese = new businessERPstatusEntity();
                    bese.U_Num = sr[0].ToString().Trim();
                    bese.U_Name = sr[1].ToString().Trim();


                    bsseList.Add(bese);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'bsseList' :" + bsseList.ToString(), className, methodName);
        return bsseList;
    }

    public List<MediaClickStatisticsEntity> getAnalystTidData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<MediaClickStatisticsEntity> mcseList = new List<MediaClickStatisticsEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            MediaClickStatisticsEntity mcse = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    mcse = new MediaClickStatisticsEntity();
                    mcse.t_id = sr[0].ToString().Trim();
                    mcse.U_Name = sr[1].ToString().Trim();
                    mcse.U_Num = sr[2].ToString().Trim();
                    mcseList.Add(mcse);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'mcseList' :" + mcseList.ToString(), className, methodName);
        return mcseList;
    }

    public muserEntity getAllMuse(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        muserEntity mse = new muserEntity();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            //muserEntity mse = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    mse = new muserEntity();
                    mse.U_Num = sr[0].ToString().Trim();//員工編號
                    mse.U_Name = sr[1].ToString().Trim();//員工姓名
                    mse.U_Item = sr[2].ToString().Trim();//職稱
                    mse.DEPAR = sr[3].ToString().Trim();//部門
                    mse.ComLand = sr[4].ToString().Trim();//所屬公司
                    mse.U_Tel = sr[5].ToString().Trim();//分機
                    //mse.LeaveDate = sr[5].ToString().Trim();
                    //mse.U_PID = sr[6].ToString().Trim();
                    //mse.OCity = sr[7].ToString().Trim();
                    //mse.OTown = sr[8].ToString().Trim();
                    //mse.OZipCode = sr[9].ToString().Trim();
                    //mse.OAddress = sr[10].ToString().Trim();
                    //mse.HCity = sr[11].ToString().Trim();
                    //mse.HTown = sr[12].ToString().Trim();
                    //mse.HZipCode = sr[13].ToString().Trim();
                    //mse.HAddress = sr[14].ToString().Trim();
                    //mse.HTel_Zone = sr[15].ToString().Trim();
                    //mse.HTel = sr[16].ToString().Trim();
                    //mse.HMobile = sr[17].ToString().Trim();
                    //mse.EName = sr[18].ToString().Trim();
                    //mse.EMobile = sr[19].ToString().Trim();
                    //mseList.Add(mse);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'edeList' :" + mse.ToString(), className, methodName);
        return mse;
    }
    ///回傳取回的資料員工編號 U_Num
    public List<muserEntity> getAllMuserForTable(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<muserEntity> mseList = new List<muserEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            muserEntity mse = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    mse = new muserEntity();
                    mse.U_Num = sr[0].ToString().Trim();//員工編號
                    //mse.U_Name = sr[1].ToString().Trim();//員工姓名
                    //mse.U_Item = sr[2].ToString().Trim();//職稱
                    //mse.U_Num = sr[3].ToString().Trim();//部門
                    //mse.ComID = sr[4].ToString().Trim();//所屬公司
                    //mse.ComLand = sr[5].ToString().Trim();//分機
                    //mse.LeaveDate = sr[5].ToString().Trim();
                    //mse.U_PID = sr[6].ToString().Trim();
                    //mse.OCity = sr[7].ToString().Trim();
                    //mse.OTown = sr[8].ToString().Trim();
                    //mse.OZipCode = sr[9].ToString().Trim();
                    //mse.OAddress = sr[10].ToString().Trim();
                    //mse.HCity = sr[11].ToString().Trim();
                    //mse.HTown = sr[12].ToString().Trim();
                    //mse.HZipCode = sr[13].ToString().Trim();
                    //mse.HAddress = sr[14].ToString().Trim();
                    //mse.HTel_Zone = sr[15].ToString().Trim();
                    //mse.HTel = sr[16].ToString().Trim();
                    //mse.HMobile = sr[17].ToString().Trim();
                    //mse.EName = sr[18].ToString().Trim();
                    //mse.EMobile = sr[19].ToString().Trim();
                    mseList.Add(mse);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'edeList' :" + mseList.ToString(), className, methodName);
        return mseList;
    }


    public List<MREGT01Entity> getMREGT01List(string connectionStrings, string commandText)
    {
        //string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        //StringBuilder sb = new StringBuilder();
        //sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        //log.startWrite(sb.ToString(), className, methodName);
        ////======================================================================================================================以上為log
        ////SELECT U_Num FROM [HG].[dbo].[MUSER] where  LeaveDate is null and 1=1  
        List<MREGT01Entity> mREGT01Entity = new List<MREGT01Entity>();
        ////從資料庫把資料撈出來*************************************************************************************************start
        //using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        //{
        //    conn.Open();
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.Connection = conn;
        //    cmd.CommandText = commandText;
        //    EmpDataEntity ede = null;
        //    using (SqlDataReader sr = cmd.ExecuteReader())
        //    {
        //        while (sr.Read())
        //        {
        //            ede = new EmpDataEntity();
        //            ede.U_Name = sr[0].ToString().Trim();
        //            ede.U_MDEP = sr[1].ToString().Trim();
        //            ede.U_Num = sr[2].ToString().Trim();
        //            ede.BirthDayDate = sr[3].ToString().Trim();
        //            ede.SlimDate = sr[4].ToString().Trim();
        //            ede.LeaveDate = sr[5].ToString().Trim();
        //            ede.U_PID = sr[6].ToString().Trim();
        //            ede.OCity = sr[7].ToString().Trim();
        //            ede.OTown = sr[8].ToString().Trim();
        //            ede.OZipCode = sr[9].ToString().Trim();
        //            ede.OAddress = sr[10].ToString().Trim();
        //            ede.HCity = sr[11].ToString().Trim();
        //            ede.HTown = sr[12].ToString().Trim();
        //            ede.HZipCode = sr[13].ToString().Trim();
        //            ede.HAddress = sr[14].ToString().Trim();
        //            ede.HTel_Zone = sr[15].ToString().Trim();
        //            ede.HTel = sr[16].ToString().Trim();
        //            ede.HMobile = sr[17].ToString().Trim();
        //            ede.EName = sr[18].ToString().Trim();
        //            ede.EMobile = sr[19].ToString().Trim();
        //            edeList.Add(ede);
        //        }
        //    }
        //}
        ////從資料庫把資料撈出來*************************************************************************************************end
        //log.endWrite("'edeList' :" + edeList.ToString(), className, methodName);
        return mREGT01Entity;
    }
    public List<EmpDataEntity> getEmpDataForTable(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<EmpDataEntity> edeList = new List<EmpDataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            EmpDataEntity ede = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    ede = new EmpDataEntity();
                    ede.U_Name = sr[0].ToString().Trim();
                    ede.U_MDEP = sr[1].ToString().Trim();
                    ede.U_Num = sr[2].ToString().Trim();
                    ede.BirthDayDate = sr[3].ToString().Trim();
                    ede.SlimDate = sr[4].ToString().Trim();
                    ede.LeaveDate = sr[5].ToString().Trim();
                    ede.U_PID = sr[6].ToString().Trim();
                    ede.OCity = sr[7].ToString().Trim();
                    ede.OTown = sr[8].ToString().Trim();
                    ede.OZipCode = sr[9].ToString().Trim();
                    ede.OAddress = sr[10].ToString().Trim();
                    ede.HCity = sr[11].ToString().Trim();
                    ede.HTown = sr[12].ToString().Trim();
                    ede.HZipCode = sr[13].ToString().Trim();
                    ede.HAddress = sr[14].ToString().Trim();
                    ede.HTel_Zone = sr[15].ToString().Trim();
                    ede.HTel = sr[16].ToString().Trim();
                    ede.HMobile = sr[17].ToString().Trim();
                    ede.EName = sr[18].ToString().Trim();
                    ede.EMobile = sr[19].ToString().Trim();
                    edeList.Add(ede);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'edeList' :" + edeList.ToString(), className, methodName);
        return edeList;
    }

    public List<VenuePerformanceForMCentity> getVenuePerformanceForMC(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<VenuePerformanceForMCentity> vpfmeList = new List<VenuePerformanceForMCentity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            VenuePerformanceForMCentity vpfme = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    vpfme = new VenuePerformanceForMCentity();
                    vpfme.MC = sr[0].ToString().Trim();
                    vpfme.MCname = sr[1].ToString().Trim();
                    vpfme.U_MDEP = sr[2].ToString().Trim();
                    vpfmeList.Add(vpfme);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'vpfmeList' :" + vpfmeList.ToString(), className, methodName);
        return vpfmeList;
    }


    public List<TelStatisticsEntity> getAnalyst(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<TelStatisticsEntity> tseList = new List<TelStatisticsEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            TelStatisticsEntity tse = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    tse = new TelStatisticsEntity();
                    tse.U_Num = sr[0].ToString().Trim();
                    tse.U_Name = sr[1].ToString().Trim();
                    tseList.Add(tse);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'tseList' :" + tseList.ToString(), className, methodName);
        return tseList;
    }

}