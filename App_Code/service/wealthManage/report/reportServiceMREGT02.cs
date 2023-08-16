using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Collections;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using System.Reflection;
using System.Globalization;

/// <summary>
/// reportService 的摘要描述
/// </summary>
public class reportServiceMREGT02
{
    //引用時不用再NEW
    private static reportServiceMREGT02 _instance = new reportServiceMREGT02();
    public static reportServiceMREGT02 Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public reportServiceMREGT02()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //設定報表權限為可用
    public int setReportRight(string item)
    {
        return 0;
    }
    int E12 = 0;//曠職時數
    int E10 = 0;//漏刷(次數)
    public DataSet GetSetBYSQL(SqlConnection conn, string commandText)
    {
        DataSet ds = new DataSet();
        using (SqlConnection conn2 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {

            SqlCommand cmd = new SqlCommand(commandText, conn2);
            if (conn2.State.ToString() == "Closed")
            {
                conn2.Open();
            }

            SqlDataAdapter adapter = new SqlDataAdapter(commandText, conn2);
            adapter.Fill(ds);//取出所有會場編號
            //var U_MDEP = ds.Tables[0].Rows[0][0].ToString();
            //value = U_MDEP;

            conn.Close();
        }
        return ds;
    }

    public DataTable GetDataTableBYSQL(SqlConnection conn, string commandText)
    {
        string value = "";
        DataTable dt = new DataTable();
        using (SqlConnection conn2 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {

            SqlCommand cmd = new SqlCommand(commandText, conn2);
            if (conn2.State.ToString() == "Closed")
            {
                conn2.Open();
            }

            SqlDataAdapter adapter = new SqlDataAdapter(commandText, conn2);

            //DataSet ds = new DataSet();
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);
            //foreach (DataRow row in dt.Rows)
            //{
            //    //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
            //    value = row[0].ToString();
            //}
            ////value = U_MDEP;

            //conn.Close();
            return dt;
        }

    }

    public string GetValueBYSQL(SqlConnection conn, string commandText)
    {
        string value = "";
        DataTable dt = new DataTable();
        using (SqlConnection conn2 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {

            SqlCommand cmd = new SqlCommand(commandText, conn2);
            if (conn2   .State.ToString() == "Closed")
            {
                conn2.Open();
            }

            SqlDataAdapter adapter = new SqlDataAdapter(commandText, conn2);

            //DataSet ds = new DataSet();
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);
            foreach (DataRow row in dt.Rows)
            {
                //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
                value = row[0].ToString();
            }
            //value = U_MDEP;

            conn.Close();
        }
        return value;
    }
    //出勤列表內容
    //MP如為空值則查詢所有人
    public List<MREGT02Entity> getMREGT02DataList(string StartDate, string EndDate, string MP, string Select_Com, string Select_Dept)
    {
        //MP:0000表示所有員工
        //取得目前系統時間(currentTime)
        System.DateTime currentTime = new System.DateTime();
        var Now = DateTime.Now.ToLongTimeString();
        List<MCLASEntity> MCLASList = new List<MCLASEntity>();
        //20221208取得[公司][部門][到職日][離職日]
        //公司
        //string Select_Com_Title = "";
        //部門
        //string Select_Dept_Title = "";
        //到職日
        string SlimDate = "";

        //離職日
        string LeaveDate = "";
        //
        //正常班MR_Item=0001
        //早班MR_Item=0002
        //晚班MR_Item=0003
        //休假假日MR_Item=0005
        //MP = "B1103011";//要查詢的員工帳號
        List<MREGT02Entity> MREGE02DataList = new List<MREGT02Entity>();//考勤報表畫面欄位資料來源
        if (MP == "0000")
        {
            string GETMPList = "SELECT [U_Num],[U_Name] FROM [HG].[dbo].[MUSER] where  ComID='" + Select_Com + "' and U_MDEP='" + Select_Dept + "' and LeaveDate is null";
            using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
            {
                var MP_Dt = GetDataTableBYSQL(conn, GETMPList);
                var MP_Dt_Row = GetDataTableBYSQL(conn, GETMPList).Rows;//所選公私部門內的員工
                int MP_Dt_Count = MP_Dt_Row.Count;//所選公私部門內有多少員工
                string mp = "";
                for (int i = 0; i < MP_Dt_Count; i++)
                {
                    mp = MP_Dt.Rows[i][0].ToString();//員工代號
                                                //}
                    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
                    log.startWrite("'MP : '" + mp, className, methodName);
                    //查詢請假紀錄(MEXCU)
                    MREGTEntity MEXCUList = new MREGTEntity();
                    string U_name = "";
                    string Punchcard_tag = "";
                    string COMID_Name = "";
                    string DEPAR_Name = "";
                    string SlimDate_Name = "";
                    string leaveDate_Name = "";


                    using (SqlConnection conn3 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
                    {
                        //判斷此員工是否需要打卡
                        string getPunchcard_tagBY_UNUM = "SELECT Punchcard_tag FROM[HG].[dbo].[MUSER] where U_Num = '" + mp + "' and LeaveDate is null";
                        Punchcard_tag = GetValueBYSQL(conn, getPunchcard_tagBY_UNUM);

                        string getNameBY_UNUM = "SELECT [U_Name] FROM [HG].[dbo].[MUSER] WHERE U_Num='" + mp + "' and LeaveDate is null";
                        U_name = GetValueBYSQL(conn, getNameBY_UNUM);
                        //公司
                        //string getComIDBY_UNUM = "SELECT [ComID] FROM [HG].[dbo].[MUSER] WHERE U_Num='" + MP + "' and LeaveDate is null";//取得公司別(COMID)
                        //string COMID = GetValueBYSQL(conn, getComIDBY_UNUM);
                        string SQL_getComID_Name = "SELECT [ddesc] FROM [HG].[dbo].[MITEM] where mitcode='COMID' and ditcode='" + Select_Com + "'";
                        COMID_Name = GetValueBYSQL(conn, SQL_getComID_Name);//公司別
                                                                            //部門
                                                                            //string getUDEPARBY_UNUM = "SELECT [U_MDEP] FROM [HG].[dbo].[MUSER] WHERE U_Num='" + MP + "' and LeaveDate is null";//取得部門別(COMID)
                                                                            //string DEPAR = GetValueBYSQL(conn, getUDEPARBY_UNUM);
                                                                            //string getUDEPAR_Name = "SELECT [ddesc] FROM [HG].[dbo].[MITEM] where mitcode='DEPAR' and ditcode='" + DEPAR + "'";
                        string SQL_getUDEPAR_Name = "SELECT [ddesc] FROM [HG].[dbo].[MITEM] where mitcode='DEPAR' and ditcode='" + Select_Dept + "'";
                        DEPAR_Name = GetValueBYSQL(conn3, SQL_getUDEPAR_Name);//部門別

                        //到職日
                        string getSlimDate_BY_UNUM = "SELECT [SlimDate],[LeaveDate] FROM [HG].[dbo].[MUSER] WHERE U_Num='" + mp + "' and LeaveDate is null";
                        SlimDate_Name = GetValueBYSQL(conn3, getSlimDate_BY_UNUM);//到職日

                        //離職日
                        string getLeaveDateBY_UNUM = "SELECT [LeaveDate] FROM [HG].[dbo].[MUSER] WHERE U_Num='" + mp + "' and LeaveDate is null";
                        leaveDate_Name = GetValueBYSQL(conn3, getLeaveDateBY_UNUM);//離職日
                        if (leaveDate_Name.Trim() == "")
                            leaveDate_Name = "在職中";
                        //mREGT02Entity.U_Name = U_name;
                        //20221205下午進度
                        //取得請假資料
                        MEXCUList = MEXCUhgDao.Instance.getMREGE02ListFromMEXCU(conn3, StartDate, EndDate, mp, U_name, Select_Com, Select_Dept, DEPAR_Name);//[產出]請假紀錄(從資料庫取出請假資料)
                                                                                                                                                            //查詢當年當月紀錄規定的上下班時間(原有系統資料表)]
                        MCLASList = MCLAShgDao.Instance.getMCLASList(StartDate, EndDate, mp);//當年當月紀錄規定的上下班時間(原有系統資料表)

                    }

                    List<MREGTEntity> MREGTList = new List<MREGTEntity>();//出缺勤打卡紀錄
                    MREGT02Entity mREGT02Entity = new MREGT02Entity();
                    //List<MREGT02Entity> MREGE02DataList = new List<MREGT02Entity>();//考勤報表畫面欄位資料來源
                    mREGT02Entity.Com = COMID_Name;
                    mREGT02Entity.Dept = DEPAR_Name;
                    mREGT02Entity.SlimDate = SlimDate;
                    if (LeaveDate == "")
                    {
                        mREGT02Entity.LeaveDate = "仍在職";
                    }
                    else
                    {
                        mREGT02Entity.LeaveDate = LeaveDate;//離職日期
                    }
                    if (Punchcard_tag == "1")//如果要打卡則取出打卡紀錄(MREGTList)
                    {
                        //List<MREGTEntity> MREGTList = new List<MREGTEntity>();
                        MREGTList = MREGThgDao.Instance.getMREGE02List(StartDate, EndDate, mp);//取出出缺勤打卡紀錄

                        //List<MREGT02Entity> MREGE02DataList = new List<MREGT02Entity>();//考勤報表畫面欄位資料來源
                        int m = 0;
                        //if (MREGTList[m].MR_RSTime.Trim() != "")//有下班打卡資料
                        //{
                        // if (MREGTList[m].MR_RETime.Trim() != "")//有上班打卡資料
                        // {
                        DateTime MR_DATA = new DateTime();
                        string Month = "";
                        string Year = "";
                        if (MREGTList[m].MR_RSTime.Trim() != "")
                        {
                            MR_DATA = DateTime.Parse(MREGTList[m].MR_RSTime.ToString());//取得上班打卡時間
                            Month = MR_DATA.Month.ToString();
                            Year = MR_DATA.Year.ToString();
                        }
                        // string Month = MR_DATA.Month.ToString();
                        // string Year = MR_DATA.Year.ToString();
                        MCLASList = MCLAShgDao.Instance.getMCLASList_(Year, Month, mp);//當年當月紀錄規定的上下班時間(原有系統資料表)
                                                                                       //int E9 = 0;//遲到的次數
                                                                                       //取出規定的上下班時間
                                                                                       //int E11 = 0;//早退的次數
                                                                                       //取出規定的上下班時間
                                                                                       //int E8 = 0;//曠職的次數
                                                                                       //int E10 = 0;//漏刷的次數
                        int onTime = 0;//準時到達的次數
                                       //MREGT02Entity mREGT02Entity = new MREGT02Entity();
                                       //List<MREGT02Entity> MREGE02DataList = new List<MREGT02Entity>();//考勤報表畫面欄位資料來源
                        DateTime dt_compard_S = new DateTime();
                        DateTime dt_compard_E = new DateTime();
                        //var dt_MR_RSTime = DateTime.Parse(MREGTList[1].MR_RSTime.ToString());
                        //var dt_MR_RETime = DateTime.Parse(MREGTList[1].MR_RETime.ToString());
                        //int m = 0;
                        //20221212這邊要修改!!!原DataModel加入  Comid,Comid_Name,Dept,Dept_Name
                        //將畫面生成部分內嵌部門代號,並將部門代號埋入最後一個欄位
                        //MREGT02Entity mREGT02Entity = new MREGT02Entity();
                        //mREGT02Entity.Com = COMID_Name;
                        //mREGT02Entity.Dept = DEPAR_Name;
                        //mREGT02Entity.SlimDate = SlimDate;
                        //if (LeaveDate == "")
                        //{
                        //    mREGT02Entity.LeaveDate = "仍在職";
                        //}
                        //else
                        //{
                        //    mREGT02Entity.LeaveDate = LeaveDate;//離職日期
                        //}

                        //20221215[遲到][早退][曠職][漏刷]判斷邏輯
                        //在設定的時間內對所取的資料做統計
                        foreach (var item in MREGTList)//MREGTList(//紀錄出缺勤打卡紀錄)
                        {

                            mREGT02Entity = new MREGT02Entity();
                            MREGTList[m].Dept = Select_Dept;//這邊要修改
                                                            //20221212這邊要修改判斷遲到/早退規則
                            if (MREGTList[m].MR_RSTime.ToString() != "")//判斷上班時間是否有打卡[MREGTList[m]:每天打卡的資料]
                            {
                                var dt_MR_RSTime = DateTime.Parse(MREGTList[m].MR_RSTime.ToString());//取得每天上班打卡時間
                                dt_compard_S = DateTime.Parse(dt_MR_RSTime.ToLongTimeString());//取得每天上班打卡時間
                                
                                DateTime dt_compard_S_ = dt_MR_RSTime;
                                string dt_compard_S_Year = dt_compard_S_.Year.ToString();//;//取得每天上班打卡時間(年份)[用來取得規定打卡時間]
                                string dt_compard_S_Month = dt_compard_S_.Month.ToString();//;//取得每天上班打卡時間(月份)[用來取得規定打卡時間]
                                if (MREGTList[m].MR_RETime.ToString() != "")//判斷下班時間是否有打卡
                                {
                                    var dt_MR_RETime = DateTime.Parse(MREGTList[m].MR_RETime.ToString());//取得下班打卡時間
                                    dt_compard_E = DateTime.Parse(dt_MR_RETime.ToLongTimeString());//取得每天下班打卡時間
                                }
                                TimeSpan ts = new TimeSpan();
                                DateTime dt_Standard_S = new DateTime();//規定的上班時間
                                DateTime dt_Standard_E = new DateTime();//規定的下班時間
                                string commandText = "SELECT [U_MDEP] FROM [HG].[dbo].[MUSER] where U_Num='" + mp + "'";
                                //20221205加入休假日不判斷!!!!!!!!!!!!
                                //20221205加入自訂上下班時間!!!!!!!!!!
                                //MR_Item:班別
                                bool Holiday = false;//預設為平日
                                using (SqlConnection conn2 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
                                {
                                    string MP_Mdep = GetValueBYSQL(conn, commandText);//所選中MP所屬的部門
                                                                                      //加入判斷是否需要打卡(Punchcard_tag為0或為空值則不需要打卡,Punchcard_tag則需要打卡)

                                    //加上是否換月份,需重新更新上下班打卡時間(20221214work),取得規定的上下班時間
                                    //DateTimeStandard(取得比較上下班打卡時間與規定時間的結果)
                                    //start[上班打卡]end[下班打卡]
                                    //20221214修改Year,Month會隨MREGTList[m]改變
                                    //dt_Standard_S:規定上班打卡時間,dt_Standard_E:規定下班打卡時間                                                 
                                    //取得規定上下班時間(DateTimeStandard)
                                    //規定上班打卡時間
                                    dt_Standard_S = DateTime.Parse(DateTimeStandard(MREGTList[m], "start", dt_compard_S_Year, dt_compard_S_Month, mp, MP_Mdep, conn2));
                                    //規定上班班打卡時間(CheckinDate)
                                    //var Checkin = MREGTList[m].MR_Date.ToString();
                                    //DateTime CheckinDate = new DateTime();
                                    //CheckinDate = DateTime.Parse(Checkin);//打卡當天日期
                                    //這邊會計算缺勤計算
                                    dt_Standard_E = DateTime.Parse(DateTimeStandard(MREGTList[m], "end", dt_compard_S_Year, dt_compard_S_Month, mp  , MP_Mdep, conn2));

                                    //這邊要修改,只取日期的時分秒
                                    double E9secs = dt_compard_S.Subtract(dt_Standard_S).TotalSeconds;//共差了多久時間(秒)[遲到]
                                    double E11secs = dt_compard_E.Subtract(dt_Standard_E).TotalSeconds;//共差了多久時間(秒)[早退]
                                    E12 = GetE12orE10(E9secs, MREGTList[m], currentTime, dt_Standard_S, "E12");////取得曠職時數
                                    E10 = GetE12orE10(E9secs, MREGTList[m], currentTime, dt_Standard_S, "E10");////取得計算過後的漏刷次數
                                                                                                               //取得打卡日期()

                                    //E11++;//早退
                                    if (E11secs < 0)
                                        E11++;//早退


                                    //if (GetDayName(dt_MR_RSTime) == "星期六")
                                    //{
                                    //    Holiday = true;//Holiday(假日)
                                    //}
                                    //else if (GetDayName(dt_MR_RSTime) == "星期日")
                                    //{
                                    //    Holiday = true;//Holiday(假日)
                                    //}
                                    //E9++;//遲到
                                    //dt_MR_RSTime:每天上班打卡時間
                                    if (E9secs > 0)
                                    {
                                        if (GetDayName(dt_MR_RSTime) == "星期六")
                                        {
                                            //Holiday = true;//Holiday改名為Holiday(假日)
                                        }
                                        else if (GetDayName(dt_MR_RSTime) == "星期日")
                                        {
                                            Holiday = true;
                                        }
                                        if (!Holiday)
                                        {
                                            //E9++;//遲到+1(所選的時間內遲到的次數)[E9]
                                            //MREGTList[m].MR_Item//班別
                                            //dt_Standard_E//規定下班打卡時間
                                            //dt_compard_S//實際上班打卡時間
                                            //dt_compard_E//實際下班打卡時間
                                            E9++;//遲到
                                            var M_Item = MREGTList[m].MR_Item;//班別
                                            Double E9_Hour = E9 / 3600;
                                            Double E12_Val = Math.Ceiling(E9_Hour);//E12:曠職時數(遲到秒數除以3600轉為小時並採用無條件進位)
                                                                                   //E12= Math.Ceiling(E9/3600);
                                                                                   //currentTime(目前系統時間),M_Item(目前用戶班別),MREGTList[m](目前出勤資料)
                                                                                   //dt_Standard_S:規定上班打卡時間


                                            //先判斷曠職(用小時計算)
                                            //再判斷漏刷
                                            //目前系統時間(currentTime)

                                        }
                                    }
                                    else
                                    {
                                        onTime++;//準時到達的次數+1
                                    }
                                    //早退
                                    if (E11secs < -1800)//這邊要修正,先命名-1800做測試用
                                    {
                                        if (!Holiday)
                                        {
                                            // E11++;//早退+1(所選的時間內早退的次數)[E11]
                                        }
                                    }
                                    else
                                    {
                                        onTime++;//準時到達的次數+1
                                    }
                                }
                            }
                            MEXCUList.E9 = E9;//遲到
                            MEXCUList.E10 = E10;//漏刷
                            MEXCUList.E11 = E11;//早退
                            MEXCUList.E12 = E12;//曠職



                            //using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
                            //{
                            //    string getNameBY_UNUM = "SELECT [U_Name] FROM [HG].[dbo].[MUSER] WHERE U_Num='" + MP + "'";

                            //    U_name = GetValueBYSQL(conn, getNameBY_UNUM);
                            //}
                            //mREGT02Entity.U_Name = U_name;
                            //m++;

                            //m++;
                            //所選時段的統計結果
                            //mREGT02Entity.E9 = E9.ToString();//遲到
                            //mREGT02Entity.E11 = E11.ToString();
                            //mREGT02Entity.U_Name = MP;
                            //MREGE02DataList.Add(mREGT02Entity);
                            mREGT02Entity.U_Name = mp;

                            m++;

                        }
                        mREGT02Entity.E9 = E9.ToString();//遲到
                        mREGT02Entity.E11 = E11.ToString();//早退
                    }
                    else //免打卡,不做遲到漏刷早退曠職判斷
                    {

                    }
                    //m++;
                    //所選時段的統計結果
                    //MEXCUList = MEXCUhgDao.Instance.getMREGE02ListFromMEXCU(conn, StartDate, EndDate, MP, U_name, Select_Com, Select_Dept, DEPAR_Name);//[產出]請假紀錄(從資料庫取出請假資料)
                    //mREGT02Entity.E9 = E9.ToString();//遲到
                    //mREGT02Entity.E11 = E11.ToString();//早退
                    mREGT02Entity.E1 = MEXCUList.E1.ToString();//年假
                    mREGT02Entity.E2 = MEXCUList.E2.ToString();
                    mREGT02Entity.E3 = MEXCUList.E3.ToString();
                    mREGT02Entity.E4 = MEXCUList.E4.ToString();
                    mREGT02Entity.E5 = MEXCUList.E5.ToString();
                    mREGT02Entity.E6 = MEXCUList.E6.ToString();
                    mREGT02Entity.E7 = MEXCUList.E7.ToString();
                    mREGT02Entity.E8 = MEXCUList.E8.ToString();//曠職
                    mREGT02Entity.E9 = MEXCUList.E9.ToString();
                    mREGT02Entity.E10 = MEXCUList.E10.ToString();
                    mREGT02Entity.E11 = MEXCUList.E11.ToString();
                    mREGT02Entity.E12 = MEXCUList.E12.ToString();
                    mREGT02Entity.E13 = MEXCUList.E13.ToString();
                    mREGT02Entity.E14 = MEXCUList.E14.ToString();
                    mREGT02Entity.E15 = MEXCUList.E15.ToString();
                    mREGT02Entity.E16 = MEXCUList.E16.ToString();
                    mREGT02Entity.ComName = COMID_Name;
                    mREGT02Entity.DeptName = DEPAR_Name;
                    mREGT02Entity.SlimDate = SlimDate_Name;
                    mREGT02Entity.LeaveDate = leaveDate_Name;
                    mREGT02Entity.Com = Select_Com;
                    mREGT02Entity.Dept = Select_Dept;
                    mREGT02Entity.U_Name = MEXCUList.U_Name.ToString();
                    mREGT02Entity.U_Num = mp;//員工編號
                    mREGT02Entity.E9 = E9.ToString();//遲到
                    mREGT02Entity.E11 = E11.ToString();//
                    MREGE02DataList.Add(mREGT02Entity);//傳回畫面的資料
                    E9 = 0;
                    E11 = 0;
                    E12 = 0;
                }
            }
        }
        else//只選單一人員
        {
            string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
            log.startWrite("'MP : '" + MP, className, methodName);
            //查詢請假紀錄(MEXCU)
            MREGTEntity MEXCUList = new MREGTEntity();
            string U_name = "";
            string Punchcard_tag = "";
            string COMID_Name = "";
            string DEPAR_Name = "";
            string SlimDate_Name = "";
            string leaveDate_Name = "";


            using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
            {
                //判斷此員工是否需要打卡
                string getPunchcard_tagBY_UNUM = "SELECT Punchcard_tag FROM[HG].[dbo].[MUSER] where U_Num = '" + MP + "' and LeaveDate is null";
                Punchcard_tag = GetValueBYSQL(conn, getPunchcard_tagBY_UNUM);

                string getNameBY_UNUM = "SELECT [U_Name] FROM [HG].[dbo].[MUSER] WHERE U_Num='" + MP + "' and LeaveDate is null";
                U_name = GetValueBYSQL(conn, getNameBY_UNUM);
                //公司
                //string getComIDBY_UNUM = "SELECT [ComID] FROM [HG].[dbo].[MUSER] WHERE U_Num='" + MP + "' and LeaveDate is null";//取得公司別(COMID)
                //string COMID = GetValueBYSQL(conn, getComIDBY_UNUM);
                string SQL_getComID_Name = "SELECT [ddesc] FROM [HG].[dbo].[MITEM] where mitcode='COMID' and ditcode='" + Select_Com + "'";
                COMID_Name = GetValueBYSQL(conn, SQL_getComID_Name);//公司別
                                                                    //部門
                                                                    //string getUDEPARBY_UNUM = "SELECT [U_MDEP] FROM [HG].[dbo].[MUSER] WHERE U_Num='" + MP + "' and LeaveDate is null";//取得部門別(COMID)
                                                                    //string DEPAR = GetValueBYSQL(conn, getUDEPARBY_UNUM);
                                                                    //string getUDEPAR_Name = "SELECT [ddesc] FROM [HG].[dbo].[MITEM] where mitcode='DEPAR' and ditcode='" + DEPAR + "'";
                string SQL_getUDEPAR_Name = "SELECT [ddesc] FROM [HG].[dbo].[MITEM] where mitcode='DEPAR' and ditcode='" + Select_Dept + "'";
                DEPAR_Name = GetValueBYSQL(conn, SQL_getUDEPAR_Name);//部門別

                //到職日
                string getSlimDate_BY_UNUM = "SELECT [SlimDate],[LeaveDate] FROM [HG].[dbo].[MUSER] WHERE U_Num='" + MP + "' and LeaveDate is null";
                SlimDate_Name = GetValueBYSQL(conn, getSlimDate_BY_UNUM);//到職日

                //離職日
                string getLeaveDateBY_UNUM = "SELECT [LeaveDate] FROM [HG].[dbo].[MUSER] WHERE U_Num='" + MP + "' and LeaveDate is null";
                leaveDate_Name = GetValueBYSQL(conn, getLeaveDateBY_UNUM);//離職日
                if (leaveDate_Name.Trim() == "")
                    leaveDate_Name = "在職中";
                //mREGT02Entity.U_Name = U_name;
                //20221205下午進度
                //取得請假資料
                MEXCUList = MEXCUhgDao.Instance.getMREGE02ListFromMEXCU(conn, StartDate, EndDate, MP, U_name, Select_Com, Select_Dept, DEPAR_Name);//[產出]請假紀錄(從資料庫取出請假資料)
                                                                                                                                                   //查詢當年當月紀錄規定的上下班時間(原有系統資料表)]
                MCLASList = MCLAShgDao.Instance.getMCLASList(StartDate, EndDate, MP);//當年當月紀錄規定的上下班時間(原有系統資料表)

            }

            List<MREGTEntity> MREGTList = new List<MREGTEntity>();//出缺勤打卡紀錄
            MREGT02Entity mREGT02Entity = new MREGT02Entity();
            //List<MREGT02Entity> MREGE02DataList = new List<MREGT02Entity>();//考勤報表畫面欄位資料來源
            mREGT02Entity.Com = COMID_Name;
            mREGT02Entity.Dept = DEPAR_Name;
            mREGT02Entity.SlimDate = SlimDate;
            if (LeaveDate == "")
            {
                mREGT02Entity.LeaveDate = "仍在職";
            }
            else
            {
                mREGT02Entity.LeaveDate = LeaveDate;//離職日期
            }
            if (Punchcard_tag == "1")//如果要打卡則取出打卡紀錄(MREGTList)
            {
                //List<MREGTEntity> MREGTList = new List<MREGTEntity>();
                MREGTList = MREGThgDao.Instance.getMREGE02List(StartDate, EndDate, MP);//取出出缺勤打卡紀錄

                //List<MREGT02Entity> MREGE02DataList = new List<MREGT02Entity>();//考勤報表畫面欄位資料來源
                int m = 0;
                //if (MREGTList[m].MR_RSTime.Trim() != "")//有下班打卡資料
                //{
                // if (MREGTList[m].MR_RETime.Trim() != "")//有上班打卡資料
                // {
                DateTime MR_DATA = new DateTime();
                string Month = "";
                string Year = "";
                if (MREGTList[m].MR_RSTime.Trim() != "")
                {
                    MR_DATA = DateTime.Parse(MREGTList[m].MR_RSTime.ToString());//取得上班打卡時間
                    Month = MR_DATA.Month.ToString();
                    Year = MR_DATA.Year.ToString();
                }
                else
                {
                    //當天上班未打卡
                }
                // string Month = MR_DATA.Month.ToString();
                // string Year = MR_DATA.Year.ToString();
                MCLASList = MCLAShgDao.Instance.getMCLASList_(Year, Month, MP);//當年當月紀錄規定的上下班時間(原有系統資料表)
                                                                               //int E9 = 0;//遲到的次數
                                                                               //取出規定的上下班時間
                                                                               //int E11 = 0;//早退的次數
                                                                               //取出規定的上下班時間
                                                                               //int E8 = 0;//曠職的次數
                                                                               //int E10 = 0;//漏刷的次數
                int onTime = 0;//準時到達的次數
                               //MREGT02Entity mREGT02Entity = new MREGT02Entity();
                               //List<MREGT02Entity> MREGE02DataList = new List<MREGT02Entity>();//考勤報表畫面欄位資料來源
                DateTime dt_compard_E = new DateTime();
                //var dt_MR_RSTime = DateTime.Parse(MREGTList[1].MR_RSTime.ToString());
                //var dt_MR_RETime = DateTime.Parse(MREGTList[1].MR_RETime.ToString());
                //int m = 0;
                //20221212這邊要修改!!!原DataModel加入  Comid,Comid_Name,Dept,Dept_Name
                //將畫面生成部分內嵌部門代號,並將部門代號埋入最後一個欄位
                //MREGT02Entity mREGT02Entity = new MREGT02Entity();
                //mREGT02Entity.Com = COMID_Name;
                //mREGT02Entity.Dept = DEPAR_Name;
                //mREGT02Entity.SlimDate = SlimDate;
                //if (LeaveDate == "")
                //{
                //    mREGT02Entity.LeaveDate = "仍在職";
                //}
                //else
                //{
                //    mREGT02Entity.LeaveDate = LeaveDate;//離職日期
                //}

                //20221215[遲到][早退][曠職][漏刷]判斷邏輯
                //在設定的時間內對所取的資料做統計
                foreach (var item in MREGTList)//MREGTList(//紀錄出缺勤打卡紀錄)
                {

                    mREGT02Entity = new MREGT02Entity();
                    MREGTList[m].Dept = Select_Dept;//這邊要修改
                                                    //20221212這邊要修改判斷遲到/早退規則
                    if (MREGTList[m].MR_RSTime.ToString().Length > 0)//判斷上班時間是否有打卡[MREGTList[m]:每天打卡的資料]
                    {
                        var dt_MR_RSTime = DateTime.Parse(MREGTList[m].MR_RSTime.ToString());//取得每天上班打卡時間
                                                                                             //DateTime dt_compard_S = DateTime.Parse(dt_MR_RSTime.ToLongTimeString());//取得每天上班打卡時間
                        DateTime dt_compard_S = dt_MR_RSTime;
                        string dt_compard_S_Year = dt_compard_S.Year.ToString();//;//取得每天上班打卡時間(年份)[用來取得規定打卡時間]
                        string dt_compard_S_Month = dt_compard_S.Month.ToString();//;//取得每天上班打卡時間(月份)[用來取得規定打卡時間]
                        if (MREGTList[m].MR_RETime.ToString().Length>0)//判斷下班時間是否有打卡
                        {
                            var dt_MR_RETime = DateTime.Parse(MREGTList[m].MR_RETime.ToString());//取得下班打卡時間
                            dt_compard_E = DateTime.Parse(dt_MR_RETime.ToLongTimeString());//取得每天下班打卡時間
                        }
                        else
                        {
                            //漏刷
                        }

                        TimeSpan ts = new TimeSpan();
                        DateTime dt_Standard_S = new DateTime();//規定的上班時間
                        DateTime dt_Standard_E = new DateTime();//規定的下班時間
                        string commandText = "SELECT [U_MDEP] FROM [HG].[dbo].[MUSER] where U_Num='" + MP + "'";
                        //20221205加入休假日不判斷!!!!!!!!!!!!
                        //20221205加入自訂上下班時間!!!!!!!!!!
                        //MR_Item:班別
                        bool Holiday = false;//預設為平日
                        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
                        {
                            string MP_Mdep = GetValueBYSQL(conn, commandText);//所選中MP所屬的部門
                                                                              //加入判斷是否需要打卡(Punchcard_tag為0或為空值則不需要打卡,Punchcard_tag則需要打卡)

                            //加上是否換月份,需重新更新上下班打卡時間(20221214work),取得規定的上下班時間
                            //DateTimeStandard(取得比較上下班打卡時間與規定時間的結果)
                            //start[上班打卡]end[下班打卡]
                            //20221214修改Year,Month會隨MREGTList[m]改變
                            //dt_Standard_S:規定上班打卡時間,dt_Standard_E:規定下班打卡時間                                                 
                            //取得規定上下班時間(DateTimeStandard)
                            //規定上班打卡時間
                            double E9secs = 0;
                            if (MREGTList[m].MR_RSTime.ToString().Length != 0)
                            {
                                dt_Standard_S = DateTime.Parse(DateTimeStandard(MREGTList[m], "start", dt_compard_S_Year, dt_compard_S_Month, MP, MP_Mdep, conn));
                                E9secs = dt_compard_S.Subtract(dt_Standard_S).TotalSeconds;//共差了多久時間(秒)[遲到]
                                E12 = GetE12orE10(E9secs, MREGTList[m], currentTime, dt_Standard_S, "E12");////取得曠職時數
                                E10 = GetE12orE10(E9secs, MREGTList[m], currentTime, dt_Standard_S, "E10");////取得計算過後的漏刷次數
                                                                                                           //取得打卡日期()
                            }
                            //規定上班班打卡時間(CheckinDate)
                            //var Checkin = MREGTList[m].MR_Date.ToString();
                            //DateTime CheckinDate = new DateTime();
                            //CheckinDate = DateTime.Parse(Checkin);//打卡當天日期
                            double E11secs = 0;
                            //這邊會計算缺勤計算
                            if (MREGTList[m].MR_RETime.ToString().Length != 0)
                            {
                                dt_Standard_E = DateTime.Parse(DateTimeStandard(MREGTList[m], "end", dt_compard_S_Year, dt_compard_S_Month, MP, MP_Mdep, conn));
                                E11secs = dt_compard_E.Subtract(dt_Standard_E).TotalSeconds;//共差了多久時間(秒)[早退]
                            }
                            //這邊要修改,只取日期的時分秒
                            //double E9secs = dt_compard_S.Subtract(dt_Standard_S).TotalSeconds;//共差了多久時間(秒)[遲到]
                            //double E11secs = dt_compard_E.Subtract(dt_Standard_E).TotalSeconds;//共差了多久時間(秒)[早退]
                            //E12 = GetE12orE10(E9secs, MREGTList[m], currentTime, dt_Standard_S, "E12");////取得曠職時數
                            //E10 = GetE12orE10(E9secs, MREGTList[m], currentTime, dt_Standard_S, "E10");////取得計算過後的漏刷次數
                                                                                                       //取得打卡日期()

                            //E11++;//早退
                            if (E11secs < 0)
                                E11++;//早退
                                      //遲到(E9)

                            if (GetDayName(dt_compard_S) == "星期六")
                            {
                                Holiday = true;//Holiday(假日)
                            }
                            else if (GetDayName(dt_compard_S) == "星期日")
                            {
                                Holiday = true;//Holiday(假日)
                            }

                            if (E9secs > 0)
                            {
                                if (GetDayName(dt_compard_S) == "星期六")
                                {
                                    Holiday = true;//Holiday改名為Holiday(假日)
                                }
                                else if (GetDayName(dt_compard_S) == "星期日")
                                {
                                    Holiday = true;
                                }
                                if (!Holiday)
                                {
                                    //E9++;//遲到+1(所選的時間內遲到的次數)[E9]
                                    //MREGTList[m].MR_Item//班別
                                    //dt_Standard_E//規定下班打卡時間
                                    //dt_compard_S//實際上班打卡時間
                                    //dt_compard_E//實際下班打卡時間
                                    var M_Item = MREGTList[m].MR_Item;//班別
                                    Double E9_Hour = E9 / 3600;
                                    Double E12_Val = Math.Ceiling(E9_Hour);//E12:曠職時數(遲到秒數除以3600轉為小時並採用無條件進位)
                                                                           //E12= Math.Ceiling(E9/3600);
                                                                           //currentTime(目前系統時間),M_Item(目前用戶班別),MREGTList[m](目前出勤資料)
                                                                           //dt_Standard_S:規定上班打卡時間


                                    //先判斷曠職(用小時計算)
                                    //再判斷漏刷
                                    //目前系統時間(currentTime)

                                }
                            }
                            else
                            {
                                onTime++;//準時到達的次數+1
                            }
                            //早退
                            if (E11secs < -1800)//這邊要修正,先命名-1800做測試用
                            {
                                if (!Holiday)
                                {
                                    // E11++;//早退+1(所選的時間內早退的次數)[E11]
                                }
                            }
                            else
                            {
                                onTime++;//準時到達的次數+1
                            }
                        }
                    }
                    else
                    {
                        //漏刷
                    }

                    MEXCUList.E9 = E9;//遲到
                    MEXCUList.E10 = E10;//漏刷
                    MEXCUList.E11 = E11;//早退
                    MEXCUList.E12 = E12;//曠職



                    //using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
                    //{
                    //    string getNameBY_UNUM = "SELECT [U_Name] FROM [HG].[dbo].[MUSER] WHERE U_Num='" + MP + "'";

                    //    U_name = GetValueBYSQL(conn, getNameBY_UNUM);
                    //}
                    //mREGT02Entity.U_Name = U_name;
                    //m++;

                    //m++;
                    //所選時段的統計結果
                    //mREGT02Entity.E9 = E9.ToString();//遲到
                    //mREGT02Entity.E11 = E11.ToString();
                    //mREGT02Entity.U_Name = MP;
                    //MREGE02DataList.Add(mREGT02Entity);
                    mREGT02Entity.U_Name = MP;

                    m++;

                }
                mREGT02Entity.E9 = E9.ToString();//遲到
                mREGT02Entity.E11 = E11.ToString();//早退
            }
            else //免打卡,不做遲到漏刷早退曠職判斷
            {

            }
            //m++;
            //所選時段的統計結果
            //MEXCUList = MEXCUhgDao.Instance.getMREGE02ListFromMEXCU(conn, StartDate, EndDate, MP, U_name, Select_Com, Select_Dept, DEPAR_Name);//[產出]請假紀錄(從資料庫取出請假資料)
            //mREGT02Entity.E9 = E9.ToString();//遲到
            //mREGT02Entity.E11 = E11.ToString();//早退
            mREGT02Entity.E1 = MEXCUList.E1.ToString();//年假
            mREGT02Entity.E2 = MEXCUList.E2.ToString();
            mREGT02Entity.E3 = MEXCUList.E3.ToString();
            mREGT02Entity.E4 = MEXCUList.E4.ToString();
            mREGT02Entity.E5 = MEXCUList.E5.ToString();
            mREGT02Entity.E6 = MEXCUList.E6.ToString();
            mREGT02Entity.E7 = MEXCUList.E7.ToString();
            mREGT02Entity.E8 = MEXCUList.E8.ToString();//曠職
            mREGT02Entity.E9 = MEXCUList.E9.ToString();
            mREGT02Entity.E10 = MEXCUList.E10.ToString();
            mREGT02Entity.E11 = MEXCUList.E11.ToString();
            mREGT02Entity.E12 = MEXCUList.E12.ToString();
            mREGT02Entity.E13 = MEXCUList.E13.ToString();
            mREGT02Entity.E14 = MEXCUList.E14.ToString();
            mREGT02Entity.E15 = MEXCUList.E15.ToString();
            mREGT02Entity.E16 = MEXCUList.E16.ToString();
            mREGT02Entity.ComName = COMID_Name;
            mREGT02Entity.DeptName = DEPAR_Name;
            mREGT02Entity.SlimDate = SlimDate_Name;
            mREGT02Entity.LeaveDate = leaveDate_Name;
            mREGT02Entity.Com = Select_Com;
            mREGT02Entity.Dept = Select_Dept;
            mREGT02Entity.U_Name = MEXCUList.U_Name.ToString();
            mREGT02Entity.U_Num = MP;//員工編號
            mREGT02Entity.E9 = E9.ToString();//遲到
            mREGT02Entity.E11 = E11.ToString();//
            MREGE02DataList.Add(mREGT02Entity);//傳回畫面的資料
            E9 = 0;
            E11 = 0;
            E12 = 0;

            // }
            //  }
        }
        return MREGE02DataList;
        // }
        // return MREGE02DataList;
    }
    //E12= Math.Ceiling(E9/3600);
    //currentTime(目前系統時間),M_Item(目前用戶班別),MREGTList[m](目前出勤資料)
    //dt_Standard_S:規定上班打卡時間
    //取得曠職時數
    private int GetE12orE10(double e9secs, MREGTEntity mREGTEntity, DateTime currentTime, DateTime dt_Standard_S1, string Value)
    {
        int val = 0;
        ////先判斷曠職(用小時計算)
        //班別
        mREGTEntity.MR_Item = "";
        //部門
        mREGTEntity.Dept = "";
        DateTime MR_Date_DateTime = DateTime.Parse(mREGTEntity.MR_Date);
        if (MR_Date_DateTime < currentTime && mREGTEntity.MR_Item != "0005" && mREGTEntity.MR_RSTime == null && mREGTEntity.MR_RETime == null)//曠職
            E12 = E12 + 8;//曠職(時數)
        else if (MR_Date_DateTime < currentTime && mREGTEntity.MR_Item != "0005" && (mREGTEntity.MR_RSTime == null || mREGTEntity.MR_RETime == null))
            E10 = E10 + 1;//漏刷(次數)

        if (Value == "E12")
            val = E12;
        else
             if (Value == "E10")
            val = E10;

        return val;
    }

    private string GetDayName(DateTime today)
    {
        string result = "";

        //DateTime today = DateTime.Now;
        if (today.DayOfWeek == DayOfWeek.Monday)
        {
            result = "星期一";
        }
        else if (today.DayOfWeek == DayOfWeek.Tuesday)
        {
            result = "星期二";
        }
        else if (today.DayOfWeek == DayOfWeek.Wednesday)
        {
            result = "星期三";
        }
        else if (today.DayOfWeek == DayOfWeek.Thursday)
        {
            result = "星期四";
        }
        else if (today.DayOfWeek == DayOfWeek.Friday)
        {
            result = "星期五";
        }
        else if (today.DayOfWeek == DayOfWeek.Saturday)
        {
            result = "星期六";
        }
        else if (today.DayOfWeek == DayOfWeek.Sunday)
        {
            result = "星期日";
        }

        return result;
    }

    int E9 = 0;//遲到的次數
    int E11 = 0;//早退的次數
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得考勤表-個人詳細資料(先做1個人 再做很多人!!!)
    //取得使用者定義上下班時間(dt_Standard_S_UserDefined/dt_Standard_E_UserDefined)規定上下班時間(DateTimeStandard)
    //_mREGTEntity:一天打卡的資料
    public string DateTimeStandard(MREGTEntity _mREGTEntity, string type, string dt_compard_S_Year, string dt_compard_S_Month, string U_Num, string MP_Mdep, SqlConnection con)
    {
        //List<MREGTEntity> MREGTList = MREGThgDao.Instance.getMREGE02List(StartDate, dt_compard_S_Year, U_Num);//取出出缺勤打卡紀錄
        ///判斷有沒有跨月份,需加入跨月份班表內容可能不同!!!!!!!!!!!!!!!!!!
        List<MCLASEntity> MCLASList = MCLAShgDao.Instance.getMCLASList(dt_compard_S_Year, dt_compard_S_Month, U_Num);//當月紀錄規定的上下班時間(原有系統資料表)
        DateTime dt_Standard_S = new DateTime();//規定的上班時間
        DateTime dt_Standard_E = new DateTime();//規定的下班時間
        DateTime dt_Standard_S_UserDefined = new DateTime();//使用者自訂的上班時間
        DateTime dt_Standard_E_UserDefined = new DateTime();//使用者自訂的下班時間
        dt_Standard_S = new DateTime();//規定的上班時間
        dt_Standard_E = new DateTime();//規定的下班時間
        //取得使用者自訂上班時間
        dt_Standard_S_UserDefined = GetUserDefined(_mREGTEntity, "Start", con);//使用者自訂上班時間
        dt_Standard_E_UserDefined = GetUserDefined(_mREGTEntity, "End", con);//使用者自訂下班時間
        //取得系統定義上班時間
        if (dt_Standard_S_UserDefined.ToString() == "0001/1/1 上午 12:00:00")//判斷是否有自訂上班時間(沒有自訂上班時間)
        {
            if (_mREGTEntity.MR_Item == "0001")//正常班上班
            {
                if (_mREGTEntity.MR_Mdep == "0002" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse((DateTime.Parse(MCLASList[0].A_OTime_S.ToString())).ToLongTimeString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].A_OBTime_E.ToString());//18:30:00
                                                                                       //break;
                }
                else if (_mREGTEntity.MR_Mdep == "0003" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse((DateTime.Parse(MCLASList[0].A_OTime_S.ToString())).ToLongTimeString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                    //break;
                }
                else if (_mREGTEntity.MR_Mdep == "0004" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    try
                    {
                        dt_Standard_S = DateTime.Parse((DateTime.Parse(MCLASList[0].A_OTime_S.ToString())).ToLongTimeString());//09:01:00
                    }
                    catch (Exception ex)
                    {

                        //throw ex;
                    }
                    //dt_Standard_S = DateTime.Parse((DateTime.Parse(MCLASList[0].A_OTime_S.ToString())).ToLongTimeString());//09:01:00
                    try
                    {
                        dt_Standard_E = DateTime.Parse(MCLASList[0].C_MTime_E.ToString());//這邊要修改!!!!!!!!!(原本:C_OTime_E)
                    }
                    catch (Exception ex)
                    {

                        //throw ex;
                    }
                }
                else if (_mREGTEntity.MR_Mdep == "0005" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //break;
                }
                else if (_mREGTEntity.MR_Mdep == "0006" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse((DateTime.Parse(MCLASList[0].A_OTime_S.ToString())).ToLongTimeString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].A_OBTime_E.ToString());
                    // break;
                }
                else if (_mREGTEntity.MR_Mdep == "0007" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse((DateTime.Parse(MCLASList[0].A_OTime_S.ToString())).ToLongTimeString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].B_OTime_E.ToString());
                    //break;
                }
                else if (_mREGTEntity.MR_Mdep == "0008" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse((DateTime.Parse(MCLASList[0].A_OTime_S.ToString())).ToLongTimeString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].B_OBTime_E.ToString());
                    //break;
                }
                else if (_mREGTEntity.MR_Mdep == "0009" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse((DateTime.Parse(MCLASList[0].A_OTime_S.ToString())).ToLongTimeString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                    //break;
                }
                else if (_mREGTEntity.MR_Mdep == "0010" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());//08:31:00//有問題,再確認!!!
                    dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());//17:30:00
                                                                                      // break;
                }
                else if (_mREGTEntity.MR_Mdep == "0011" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse((DateTime.Parse(MCLASList[0].A_OTime_S.ToString())).ToLongTimeString());//08:31:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());//18:00:00
                                                                                      // break;
                }
                else if (_mREGTEntity.MR_Mdep == "0012" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse((DateTime.Parse(MCLASList[0].A_OTime_S.ToString())).ToLongTimeString());//08:31:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].D_OBTime_E.ToString());//18:00:00
                                                                                       //  break;
                }
                else if (_mREGTEntity.MR_Mdep == "0013" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    // break;
                }
                else if (_mREGTEntity.MR_Mdep == "0014" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //  break;
                }
                else if (_mREGTEntity.MR_Mdep == "0015" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_OBTime_S.ToString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OBTime_E.ToString());//18:30:00
                                                                                       // break;
                }
                else if (_mREGTEntity.MR_Mdep == "0016" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());//08:31:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OBTime_E.ToString());//18:00:00
                                                                                       // break;
                }
                else if (_mREGTEntity.MR_Mdep == "0017" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].F_MTime_S.ToString());//08:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].F_MTime_E.ToString());//17:00:00
                                                                                      //break;
                }
                else if (_mREGTEntity.MR_Mdep == "0018" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());//18:00:00
                                                                                      //break;
                }
                else if (_mREGTEntity.MR_Mdep == "0019" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].D_OBTime_S.ToString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].D_OBTime_E.ToString());//18:00:00
                                                                                       // break;
                }
                else if (_mREGTEntity.MR_Mdep == "0020" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].G_OTime_S.ToString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].G_OTime_E.ToString());//18:00:00
                                                                                      //break;
                }
                else if (_mREGTEntity.MR_Mdep == "0021" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());//18:30:00
                                                                                      //break;
                }
                else if (_mREGTEntity.MR_Mdep == "0022" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_OBTime_S.ToString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());//18:30:00
                                                                                      //break;
                }
                else if (_mREGTEntity.MR_Mdep == "0023" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());//18:30:00
                                                                                      //break;

                }
                else if (_mREGTEntity.MR_Mdep == "0024" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_OBTime_S.ToString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());//18:30:00
                                                                                      //break;
                }

            }
            //早班
            else if (_mREGTEntity.MR_Item == "0002")//早班
            {
                if (_mREGTEntity.MR_Mdep == "0002" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].G_MTime_S.ToString());//08:01:00
                                                                                      // dt_Standard_E = DateTime.Parse(MCLASList[0].G_MTime_E.ToString());//17:00:00
                                                                                      //break;
                }
                //    if (MREGTList[0].MR_Mdep == "0003" && MREGTList[0].MR_Mdep == MP_Mdep)
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                //        //break;
                //    }
                //    if (MREGTList[0].MR_Mdep == "0004" && MREGTList[0].MR_Mdep == MP_Mdep)
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                //        //break;
                //    }
                //    if (MREGTList[0].MR_Mdep == "0005" && MREGTList[0].MR_Mdep == MP_Mdep)
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0006" && MREGTList[0].MR_Mdep == MP_Mdep)
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].A_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].A_OTime_E.ToString());
                //        //break;
                //    }
                //    if (MREGTList[0].MR_Mdep == "0007" && MREGTList[0].MR_Mdep == MP_Mdep)
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0008" && MREGTList[0].MR_Mdep == MP_Mdep)
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].B_MTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].B_NTime_E.ToString());
                //        //break;
                //    }
                //    if (MREGTList[0].MR_Mdep == "0009" && MREGTList[0].MR_Mdep == MP_Mdep)
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                //        //break;
                //    }
                //    if (MREGTList[0].MR_Mdep == "0010" && MREGTList[0].MR_Mdep == MP_Mdep)
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                //        //break;
                //    }
                //    if (MREGTList[0].MR_Mdep == "0011" && MREGTList[0].MR_Mdep == MP_Mdep)
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                //        //break;
                //    }
                //    if (MREGTList[0].MR_Mdep == "0012" && MREGTList[0].MR_Mdep == MP_Mdep)
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                //        //break;
                //    }
                //    if (MREGTList[0].MR_Mdep == "0013" && MREGTList[0].MR_Mdep == MP_Mdep)
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0014" && MREGTList[0].MR_Mdep == MP_Mdep)
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0015" && MREGTList[0].MR_Mdep == MP_Mdep)
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_MTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].E_MTime_E.ToString());
                //        //break;
                //    }
                //    if (MREGTList[0].MR_Mdep == "0016" && MREGTList[0].MR_Mdep == MP_Mdep)
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_MTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].E_MTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0017" && MREGTList[0].MR_Mdep == MP_Mdep)
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].F_MTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].F_MTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0018" && MREGTList[0].MR_Mdep == MP_Mdep)
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].D_MTime_S.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0019" && MREGTList[0].MR_Mdep == MP_Mdep)
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0020" && MREGTList[0].MR_Mdep == MP_Mdep)
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0021" && MREGTList[0].MR_Mdep == MP_Mdep)
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0022" && MREGTList[0].MR_Mdep == MP_Mdep)
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0023" && MREGTList[0].MR_Mdep == MP_Mdep)
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0024" && MREGTList[0].MR_Mdep == MP_Mdep)
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                //    }
            }
            ////晚班    
            else if (_mREGTEntity.MR_Item == "0003")//晚班
            {
                //    if (MREGTList[0].MR_Mdep == "0002")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].G_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].G_OTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0003")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0004")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0005")
                //    {

                //    }
                //    if (MREGTList[0].MR_Mdep == "0006")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].A_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].A_OTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0007")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0008")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].B_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].B_OTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0009")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0010")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0011")
                //    {

                //    }
                //    if (MREGTList[0].MR_Mdep == "0012")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0013")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0014")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0015")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0016")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0017")
                //    {

                //    }
                //    if (MREGTList[0].MR_Mdep == "0018")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0019")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].D_NTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].D_NTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0020")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0021")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0022")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0023")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0024")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                //    }
            }
            ////假日班
            else if (_mREGTEntity.MR_Item == "0005")//假日,休假
            {
                //    if (MREGTList[0].MR_Mdep == "0002")
                //    {

                //    }
                //    if (MREGTList[0].MR_Mdep == "0003")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0004")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0005")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0006")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0007")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0008")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0009")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0010")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0011")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0012")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0013")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0014")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0015")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_MTime_S.ToString());
                //        //break;
                //    }
                //    if (MREGTList[0].MR_Mdep == "0016")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0017")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].F_NTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].F_NTime_E.ToString());
                //        //break;
                //    }
                //    if (MREGTList[0].MR_Mdep == "0018")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0019")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0020")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0021")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_MTime_S.ToString());
                //        //break;
                //    }
                //    if (MREGTList[0].MR_Mdep == "0022")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0023")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_MTime_S.ToString());
                //        //break;
                //    }
                //    if (MREGTList[0].MR_Mdep == "0024")
                //    {
                //    }
            }
        }//判斷是否有自訂上班時間(沒有自訂上班時間)
        else
        {
            dt_Standard_S = dt_Standard_S_UserDefined;//有自訂上班時間
        }
        //取得系統定義下班時間
        if (dt_Standard_E_UserDefined.ToString() == "0001/1/1 上午 12:00:00")//判斷是否有自訂下班時間((沒有自訂下班時間))
        {
            //正常班上班
            if (_mREGTEntity.MR_Item == "0001")//正常班上班
            {
                if (_mREGTEntity.MR_Mdep == "0002" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //dt_Standard_S = DateTime.Parse((DateTime.Parse(MCLASList[0].A_OTime_S.ToString())).ToLongTimeString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].A_OBTime_E.ToString());//18:30:00
                    //dt_Standard_E = dt_Standard_E_UserDefined;                                                                //break;
                }
                else if (_mREGTEntity.MR_Mdep == "0003" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //dt_Standard_S = DateTime.Parse((DateTime.Parse(MCLASList[0].A_OTime_S.ToString())).ToLongTimeString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                    //break;
                    //dt_Standard_E = dt_Standard_E_UserDefined;
                }
                else if (_mREGTEntity.MR_Mdep == "0004" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //dt_Standard_S = DateTime.Parse((DateTime.Parse(MCLASList[0].A_OTime_S.ToString())).ToLongTimeString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].C_MTime_E.ToString());//這邊要修改!!!!!!!!!(原本:C_OTime_E)
                    //dt_Standard_E = dt_Standard_E_UserDefined;

                }
                else if (_mREGTEntity.MR_Mdep == "0005" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_E = dt_Standard_E_UserDefined;
                    //break;
                }
                else if (_mREGTEntity.MR_Mdep == "0006" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //dt_Standard_S = DateTime.Parse((DateTime.Parse(MCLASList[0].A_OTime_S.ToString())).ToLongTimeString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].A_OBTime_E.ToString());
                    // break;
                    //dt_Standard_E = dt_Standard_E_UserDefined;
                }
                else if (_mREGTEntity.MR_Mdep == "0007" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //dt_Standard_S = DateTime.Parse((DateTime.Parse(MCLASList[0].A_OTime_S.ToString())).ToLongTimeString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].B_OTime_E.ToString());
                    //break;
                    //dt_Standard_E = dt_Standard_E_UserDefined;
                }
                else if (_mREGTEntity.MR_Mdep == "0008" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //dt_Standard_S = DateTime.Parse((DateTime.Parse(MCLASList[0].A_OTime_S.ToString())).ToLongTimeString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].B_OBTime_E.ToString());
                    //break;
                    //dt_Standard_E = dt_Standard_E_UserDefined;
                }
                else if (_mREGTEntity.MR_Mdep == "0009" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //dt_Standard_S = DateTime.Parse((DateTime.Parse(MCLASList[0].A_OTime_S.ToString())).ToLongTimeString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                    //break;
                    //dt_Standard_E = dt_Standard_E_UserDefined;
                }
                else if (_mREGTEntity.MR_Mdep == "0010" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());//08:31:00//有問題,再確認!!!
                    dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());//17:30:00
                    // break;
                    //dt_Standard_E = dt_Standard_E_UserDefined;
                }
                else if (_mREGTEntity.MR_Mdep == "0011" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //dt_Standard_S = DateTime.Parse((DateTime.Parse(MCLASList[0].A_OTime_S.ToString())).ToLongTimeString());//08:31:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());//18:00:00
                    //                                                                  // break;
                    //dt_Standard_E = dt_Standard_E_UserDefined;
                }
                else if (_mREGTEntity.MR_Mdep == "0012" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //dt_Standard_S = DateTime.Parse((DateTime.Parse(MCLASList[0].A_OTime_S.ToString())).ToLongTimeString());//08:31:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].D_OBTime_E.ToString());//18:00:00
                    //  break;
                    //dt_Standard_E = dt_Standard_E_UserDefined;
                }
                else if (_mREGTEntity.MR_Mdep == "0013" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    // break;
                }
                else if (_mREGTEntity.MR_Mdep == "0014" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //  break;
                }
                else if (_mREGTEntity.MR_Mdep == "0015" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //dt_Standard_S = DateTime.Parse(MCLASList[0].E_OBTime_S.ToString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OBTime_E.ToString());//18:30:00
                    // break;
                    //dt_Standard_E = dt_Standard_E_UserDefined;
                }
                else if (_mREGTEntity.MR_Mdep == "0016" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());//08:31:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OBTime_E.ToString());//18:00:00
                    //                                                                   // break;
                    //dt_Standard_E = dt_Standard_E_UserDefined;
                }
                else if (_mREGTEntity.MR_Mdep == "0017" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //dt_Standard_S = DateTime.Parse(MCLASList[0].F_MTime_S.ToString());//08:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].F_MTime_E.ToString());//17:00:00
                    //break;
                    //dt_Standard_E = dt_Standard_E_UserDefined;
                }
                else if (_mREGTEntity.MR_Mdep == "0018" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());//18:00:00
                    //break;
                    //dt_Standard_E = dt_Standard_E_UserDefined;
                }
                else if (_mREGTEntity.MR_Mdep == "0019" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //dt_Standard_S = DateTime.Parse(MCLASList[0].D_OBTime_S.ToString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].D_OBTime_E.ToString());//18:00:00
                    // break;
                    //dt_Standard_E = dt_Standard_E_UserDefined;
                }
                else if (_mREGTEntity.MR_Mdep == "0020" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //dt_Standard_S = DateTime.Parse(MCLASList[0].G_OTime_S.ToString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].G_OTime_E.ToString());//18:00:00
                    //break;
                    //dt_Standard_E = dt_Standard_E_UserDefined;
                }
                else if (_mREGTEntity.MR_Mdep == "0021" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());//18:30:00
                    //break;
                    //dt_Standard_E = dt_Standard_E_UserDefined;
                }
                else if (_mREGTEntity.MR_Mdep == "0022" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //dt_Standard_S = DateTime.Parse(MCLASList[0].E_OBTime_S.ToString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());//18:30:00
                    //break;
                    //dt_Standard_E = dt_Standard_E_UserDefined;
                }
                else if (_mREGTEntity.MR_Mdep == "0023" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());//18:30:00
                    //break;
                    //dt_Standard_E = dt_Standard_E_UserDefined;

                }
                else if (_mREGTEntity.MR_Mdep == "0024" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //dt_Standard_S = DateTime.Parse(MCLASList[0].E_OBTime_S.ToString());//09:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());//18:30:00
                    //break;
                    //dt_Standard_E = dt_Standard_E_UserDefined;
                }

            }
            //早班
            else if (_mREGTEntity.MR_Item == "0002")//早班
            {
                if (_mREGTEntity.MR_Mdep == "0002" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    //dt_Standard_S = DateTime.Parse(MCLASList[0].G_MTime_S.ToString());//08:01:00
                    dt_Standard_E = DateTime.Parse(MCLASList[0].G_MTime_E.ToString());//17:00:00
                    //break;
                    //dt_Standard_E = dt_Standard_E_UserDefined;
                }
                if (_mREGTEntity.MR_Mdep == "0003" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                    dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                    //break;
                }
                if (_mREGTEntity.MR_Mdep == "0004" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                    dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                    //break;
                }
                if (_mREGTEntity.MR_Mdep == "0005" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                }
                if (_mREGTEntity.MR_Mdep == "0006" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].A_OTime_S.ToString());
                    dt_Standard_E = DateTime.Parse(MCLASList[0].A_OTime_E.ToString());
                    //break;
                }
                if (_mREGTEntity.MR_Mdep == "0007" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                }
                if (_mREGTEntity.MR_Mdep == "0008" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].B_MTime_S.ToString());
                    dt_Standard_E = DateTime.Parse(MCLASList[0].B_NTime_E.ToString());
                    //break;
                }
                if (_mREGTEntity.MR_Mdep == "0009" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                    dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                    //break;
                }
                if (_mREGTEntity.MR_Mdep == "0010" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                    dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                    //break;
                }
                if (_mREGTEntity.MR_Mdep == "0011" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                    dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                    //break;
                }
                if (_mREGTEntity.MR_Mdep == "0012" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                    dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                    //break;
                }
                if (_mREGTEntity.MR_Mdep == "0013" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                }
                if (_mREGTEntity.MR_Mdep == "0014" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                }
                if (_mREGTEntity.MR_Mdep == "0015" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_MTime_S.ToString());
                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_MTime_E.ToString());
                    //break;
                }
                if (_mREGTEntity.MR_Mdep == "0016" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_MTime_S.ToString());
                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_MTime_E.ToString());
                }
                if (_mREGTEntity.MR_Mdep == "0017" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].F_MTime_S.ToString());
                    dt_Standard_E = DateTime.Parse(MCLASList[0].F_MTime_E.ToString());
                }
                if (_mREGTEntity.MR_Mdep == "0018" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].D_MTime_S.ToString());
                }
                if (_mREGTEntity.MR_Mdep == "0019" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                    dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                }
                if (_mREGTEntity.MR_Mdep == "0020" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                    dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                }
                if (_mREGTEntity.MR_Mdep == "0021" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                }
                if (_mREGTEntity.MR_Mdep == "0022" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                }
                if (_mREGTEntity.MR_Mdep == "0023" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                }
                if (_mREGTEntity.MR_Mdep == "0024" && _mREGTEntity.MR_Mdep == MP_Mdep)
                {
                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                }
            }
            ////晚班    
            else if (_mREGTEntity.MR_Item == "0003")//晚班
            {
                //    if (MREGTList[0].MR_Mdep == "0002")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].G_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].G_OTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0003")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0004")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0005")
                //    {

                //    }
                //    if (MREGTList[0].MR_Mdep == "0006")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].A_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].A_OTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0007")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0008")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].B_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].B_OTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0009")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0010")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0011")
                //    {

                //    }
                //    if (MREGTList[0].MR_Mdep == "0012")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0013")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0014")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0015")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0016")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0017")
                //    {

                //    }
                //    if (MREGTList[0].MR_Mdep == "0018")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0019")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].D_NTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].D_NTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0020")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0021")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0022")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0023")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0024")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                //    }
            }
            ////假日班
            else if (_mREGTEntity.MR_Item == "0005")//假日,休假
            {
                //    if (MREGTList[0].MR_Mdep == "0002")
                //    {

                //    }
                //    if (MREGTList[0].MR_Mdep == "0003")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0004")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                //    }
                //    if (MREGTList[0].MR_Mdep == "0005")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0006")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0007")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0008")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0009")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0010")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0011")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0012")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0013")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0014")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0015")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_MTime_S.ToString());
                //        //break;
                //    }
                //    if (MREGTList[0].MR_Mdep == "0016")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0017")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].F_NTime_S.ToString());
                //        dt_Standard_E = DateTime.Parse(MCLASList[0].F_NTime_E.ToString());
                //        //break;
                //    }
                //    if (MREGTList[0].MR_Mdep == "0018")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0019")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0020")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0021")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_MTime_S.ToString());
                //        //break;
                //    }
                //    if (MREGTList[0].MR_Mdep == "0022")
                //    {
                //    }
                //    if (MREGTList[0].MR_Mdep == "0023")
                //    {
                //        dt_Standard_S = DateTime.Parse(MCLASList[0].E_MTime_S.ToString());
                //        //break;
                //    }
                //    if (MREGTList[0].MR_Mdep == "0024")
                //    {
                //    }
            }
        }//判斷是否有自訂下班時間(沒有自訂下班時間)
        else
        {
            dt_Standard_E = dt_Standard_E_UserDefined; ;//有自訂上班時間
        }







        DateTime dt_compard_S = new DateTime();
        DateTime dt_compard_E = new DateTime();
        DateTime dt_compard_S_test = new DateTime();
        DateTime dt_compard_E_test = new DateTime();
        bool Holiday = false;
        if (_mREGTEntity.MR_RSTime.ToString().Length != 0)
        {
            dt_compard_S = DateTime.Parse(_mREGTEntity.MR_RSTime);//上班打卡時間
            //排除假日打卡
            if (GetDayName(dt_compard_S) == "星期六")
            {
                Holiday = true;//Holiday改名為Holiday(假日)
            }
            else if (GetDayName(dt_compard_S) == "星期日")
            {
                Holiday = true;
            }
            else
            {
                Holiday = false;
            }
            //var dt_compard_S_test = DateTime.Parse(dt_compard_S.ToString("HH:mm:ss"));
        }
        if (_mREGTEntity.MR_RETime.ToString().Length != 0)
        {
            dt_compard_E = DateTime.Parse(_mREGTEntity.MR_RETime);//下班打卡時間(這邊要修改)
            dt_compard_E_test = DateTime.Parse(dt_compard_E.ToString("HH:mm:ss"));
        }
        //取得與規定時間差多少時間(20221214這邊要修改!!!!~)
        //DateTime dt_compard_S_test1 =new DateTime();
        DateTime dt_compard_S_test1 = new DateTime();//實際上班打卡時間
        DateTime dt_compard_E_test1 = new DateTime();//實際下班打卡時間
        if (_mREGTEntity.MR_RSTime.Trim() != "")
        {
            dt_compard_S_test1 = DateTime.Parse(DateTime.Parse(_mREGTEntity.MR_RSTime).ToString("HH:mm:ss"));//加入判斷_mREGTEntity.MR_RSTime是否為空值
        }
        if (_mREGTEntity.MR_RETime.Trim() != "")
        {
            dt_compard_E_test1 = DateTime.Parse(DateTime.Parse(_mREGTEntity.MR_RETime).ToString("HH:mm:ss"));//加入判斷_mREGTEntity.MR_RETime是否為空值
        }
        DateTime dt_Standard_S_test = DateTime.Parse(dt_Standard_S.ToString("HH:mm:ss"));//規定上班時間(含自訂上班時間)
        DateTime dt_Standard_E_test = DateTime.Parse(dt_Standard_E.ToString("HH:mm:ss"));//規定下班時間(含自訂上班時間)
        double E9secs = dt_compard_S_test1.Subtract(dt_Standard_S_test).TotalSeconds;//共差了多久時間(秒)[遲到](如果大於0表示遲到)
        double E11secs = dt_compard_E_test1.Subtract(dt_Standard_E_test).TotalSeconds;//共差了多久時間(秒)[早退](如果小於0表示早退)
        int onTime = 0;//準時到達的次數
        //判斷是否假日打卡
        //這邊加入允許遲到多久
        if (E9secs > 0)//大於0表示遲到
        {

            //if (GetDayName(dt_compard_S) == "星期六")
            //{
            //    Holiday = true;//Holiday改名為Holiday(假日)
            //}
            //else if (GetDayName(dt_compard_S) == "星期日")
            //{
            //    Holiday = true;
            //}
            if (type == "start")
            {
                if (!Holiday)
                {
                    // E9++;//遲到+1(所選的時間內遲到的次數)[E9]
                    //E9secs(遲到的時間)
                }   //m++;
                    //break;
            }
        }
        else
        {
            //onTime++;//準時到達的次數+1
            //m++;
            //break;
        }

        if (E11secs < -1800)//這邊要修正,先命名-1800做測試用//小於0表示早退
        {
            if (type == "end")
            {
                if (!Holiday)
                {
                    // E11++;//早退+1(所選的時間內早退的次數)[E11]
                    //E11secs早退的時間
                    //m++;
                    //break;
                }
            }
        }
        else
        {
            //onTime++;//準時到達的次數+1
            //m++;
            //break;
        }
        Holiday = false;//重回初始值
        string StandardTime = "";
        if (type == "start")
        {
            StandardTime = dt_Standard_S.ToString();
        }
        else if (type == "end")
        {
            StandardTime = dt_Standard_E.ToString();
        }
        return StandardTime;
        //m++;
        //break;
    }


    //取得使用者自訂上下班時間
    //type:決定取出上班或下班時間
    //由員工編號或部門編號決定(預設由員工編號)
    private DateTime GetUserDefined(MREGTEntity mREGTEntity, string type, SqlConnection con)
    {
        string U_Num = mREGTEntity.MR_Num;//員工編號
        string ComID = mREGTEntity.Com;//公司編號
        string DepID = mREGTEntity.Dept;//部門編號
        DateTime StandardTime = new DateTime();
        //取得順序[個人]>[部門]
        //個人
        mREGTEntity.MR_Num = U_Num;
        //部門
        mREGTEntity.Com = ComID;
        //公司
        mREGTEntity.Dept = DepID;


        string getddsecByU_NumSQL = "SELECT [ddesc] FROM [HG].[dbo].[MITEM] where ditcode='" + U_Num + "'";//取得是否有自訂時間(由員工編號)
        string getddsecByComIDSQL = "SELECT [ddesc] FROM [HG].[dbo].[MITEM] where ditcode='" + ComID + "'";//取得是否有自訂時間(由部門編號)
        var ddesc_dt_getddsecByU_NumSQL = GetDataTableBYSQL(con, getddsecByU_NumSQL);
        var ddesc_dt_getddsecByComIDSQL = GetDataTableBYSQL(con, getddsecByComIDSQL);
        string ddesc_dt_Value0 = "";
        string ddesc_dt_Value1 = "";
        string[] ddesc_dt_Value0_Aray = new string[2];
        string[] ddesc_dt_Value1_Aray = new string[2];
        //判斷是否有自訂上下班時間
        if (ddesc_dt_getddsecByU_NumSQL.Rows.Count != 0)
        {
            ddesc_dt_Value0 = ddesc_dt_getddsecByU_NumSQL.Rows[0]["ddesc"].ToString();
            ddesc_dt_Value0_Aray = ddesc_dt_Value0.Split('_');
        }
        if (ddesc_dt_getddsecByU_NumSQL.Rows.Count != 0)
        {
            ddesc_dt_Value1 = ddesc_dt_getddsecByU_NumSQL.Rows[1]["ddesc"].ToString();
            ddesc_dt_Value1_Aray = ddesc_dt_Value1.Split('_');
        }
        if (type == "Start")//上班時間
        {
            if (ddesc_dt_Value0_Aray[0] == "S")
                StandardTime = DateTime.Parse(ddesc_dt_Value0_Aray[1].ToString());
            if (ddesc_dt_Value1_Aray[0] == "S")
                StandardTime = DateTime.Parse(ddesc_dt_Value1_Aray[1].ToString());
        }
        else if (type == "End")//下班時間
        {
            if (ddesc_dt_Value0_Aray[0] == "E")
                StandardTime = DateTime.Parse(ddesc_dt_Value0_Aray[1].ToString());
            if (ddesc_dt_Value1_Aray[0] == "E")
                StandardTime = DateTime.Parse(ddesc_dt_Value1_Aray[1].ToString());
        }
        //string[] time = ddesc_dt_Value.Split('_');
        //StandardTime = DateTime.Parse(time[1]);
        return StandardTime;


    }

    //DateTimeStandard(start,string MR_Date, string MR_EDate,string U_Num,string MP_Mdep)

    //m++;
    //從DataTable轉List
    public List<T> ConvertToList<T>(DataTable dt)
    {
        var columnNames = dt.Columns.Cast<DataColumn>()
                .Select(c => c.ColumnName)
                .ToList();
        var properties = typeof(T).GetProperties();
        return dt.AsEnumerable().Select(row =>
        {
            var objT = Activator.CreateInstance<T>();
            foreach (var pro in properties)
            {
                if (columnNames.Contains(pro.Name))
                {
                    PropertyInfo pI = objT.GetType().GetProperty(pro.Name);
                    pro.SetValue(objT, row[pro.Name] == DBNull.Value ? null : Convert.ChangeType(row[pro.Name], pI.PropertyType));
                }
            }
            return objT;
        }).ToList();
    }


    //getMREGT02DetailDataList(StartDate, EndDate, MP, Select_Com, Select_Dept);
    //20221219進度!!!!!!!!!
    //MR_Item:班別
    //出勤表打卡內容詳細資料
    //考勤報表-個人詳細資料
    //取得[日期][班別][上班時間][下班時間][出勤狀態][異常時數][請假資料]
    //20221220進度(這邊要修改!!!)
    //20221221進度!!!!!(補上[請假資料]欄位)
    ////出勤表打卡內容詳細資料
    public List<MREGT02DetailEntity> getMREGT02DetailDataList(string StartDate, string EndDate, string MP, string Select_Com, string Select_Dept)
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Day");//日期
        dt.Columns.Add("MR_Name");//姓名
        dt.Columns.Add("MR_Item");//班別
        dt.Columns.Add("MR_RSTime");//上班時間
        dt.Columns.Add("MR_RETime");//下班時間
        dt.Columns.Add("Status");//出勤狀態  
        dt.Columns.Add("EX_Hour");//異常時數
        dt.Columns.Add("Information");//詳細資料(請假資料)
        DateTime MR_SDate_DateTime = DateTime.Parse(StartDate);//起始日
        string MR_Date_Year = MR_SDate_DateTime.Year.ToString();//年
        string MR_Date_Month = MR_SDate_DateTime.Month.ToString();//月
        string MR_Date_Day = MR_SDate_DateTime.Day.ToString();//日
        DateTime MR_EDate_DateTime = DateTime.Parse(EndDate);//終止日
        TimeSpan TS = MR_EDate_DateTime.Subtract(MR_SDate_DateTime);
        string ts22 = TS.Days.ToString();//中間間隔幾天
                                         //
        string[] Sdate = StartDate.Split('/');
        string SdateNEW = Sdate[2] + "-" + Sdate[0] + "-" + Sdate[1] + " 00:00:00.000";
        DateTime SdateNEWdatetime = DateTime.Parse(SdateNEW);
        string[] Edate = EndDate.Split('/');
        string EdateNEW = Edate[2] + "-" + Edate[0] + "-" + Edate[1] + " 00:00:00.000";
        DateTime EdateNEWdatetime = DateTime.Parse(EdateNEW);
        DateTime newdt = new DateTime();
        TimeSpan ts = new TimeSpan();//相差的天數
        int i = int.Parse(EdateNEWdatetime.Subtract(SdateNEWdatetime).TotalDays.ToString());//從起到迄[經過]了幾天
        int Day_int = i; ;//包含起始日到終止日的天數
        //int i = 0;//相差天數
        DataTable dataTable = new DataTable();
        //正確!!!
        //Day_int(包含起始日到終止日的天數)
        //考勤表-個人詳細資料
        //查詢請假紀錄(MEXCU)
        string U_name = "";
        string DEPAR_Name = "";
        List<MREGTEntity> MREGTList = new List<MREGTEntity>();//出缺勤打卡紀錄
        MREGTEntity MREGTDetail = new MREGTEntity();
        List<MCLASEntity> MCLASList = new List<MCLASEntity>();
        List<MREGT02DetailEntity> MREGT02ListDataList = new List<MREGT02DetailEntity>();
        List<MREGT02DetailEntity> MREGT02DetailList = new List<MREGT02DetailEntity>();//考勤報表-個人詳細資料
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            string getNameBY_UNUM = "SELECT [U_Name] FROM [HG].[dbo].[MUSER] WHERE U_Num='" + MP + "' and LeaveDate is null";
            //string getMREGTDtial = "SELECT  [MR_ID],[MR_Date],[MR_Num],[MR_Item],[MR_Mdep],[MR_RSTime],[MR_RETime] FROM [HG].[dbo].[MREGT] WHERE MR_Num='" + MP + "' and MR_Date='" + MP + "'";
            U_name = GetValueBYSQL(conn, getNameBY_UNUM);
            List<MREGT02DetailEntity> getMREGT02Detail_List = new List<MREGT02DetailEntity>();
            ////////
            //var dt_MR_RSTime = DateTime.Parse(MREGTList[m].MR_RSTime.ToString());//取得每天上班打卡時間
            //                                                                     //DateTime dt_compard_S = DateTime.Parse(dt_MR_RSTime.ToLongTimeString());//取得每天上班打卡時間
            //DateTime dt_compard_S = dt_MR_RSTime;
            int m = 0;
            /**/
            //List<MREGT02DetailEntity> MREGT02DetailList = new List<MREGT02DetailEntity>();//考勤報表-個人詳細資料
            DateTime dt_MR_RSTime = new DateTime();
            DateTime dt_compard_S = new DateTime();
            DateTime dt_compard_S_test = new DateTime();
            DateTime dt_compard_E = new DateTime();
            DateTime dt_compard_E_test = new DateTime();
            //20221220進度!!!!!!!!!!
            //20201230加入不用打卡的判斷
            MREGTList = MREGThgDao.Instance.getMREGE02List(StartDate, EndDate, MP);//取出出缺勤打卡紀錄
            //List<MREGT02Entity> MREGE02DataList = new List<MREGT02Entity>();//考勤報表畫面欄位資料來源
            ///產生畫面所需資料!!!(20221222)
            int day_interv = 0;
            do
            {
                MREGT02DetailEntity mREGT02DetailEntity = new MREGT02DetailEntity();//產生畫面所需資料(mREGT02DetailEntity)
                string Month = "";
                // mREGT02DetailEntity.M_Date = DateTime.Parse(mREGT02DetailEntity.M_Date).AddDays(m).ToString("yyyy-MM-dd");//日期天數加1(只取日期)

                DateTime Day_ = DateTime.Parse(MREGTList[m].MR_Date.ToString());//取得當天日期
                var Day_YMD = Day_.ToString("yyyy-MM-dd");//(當天日期)只取年月日
                //取得當天請假資料(GetMEXCU_Data)
                string getMEXCU_Data_EX_DAY = "select ex_day From MEXCU where EX_User='" + MP + "' AND EX_Sdate >= '" + Day_YMD + " 00:00:00' AND EX_Sdate <= '" + Day_YMD + " 23:59:59' AND EX_Status='6'";
                string EX_DAY = GetValueBYSQL(conn, getMEXCU_Data_EX_DAY);
                string getMEXCU_Data_EX_Hour = "select ex_Hour From MEXCU where EX_User='" + MP + "' AND EX_Sdate >= '" + Day_YMD + " 00:00:00' AND EX_Sdate <= '" + Day_YMD + " 23:59:59' AND EX_Status='6'";
                string EX_Hour = GetValueBYSQL(conn, getMEXCU_Data_EX_Hour);
                string getMEXCU_Data_EX_type = "select EX_type From MEXCU where EX_User='" + MP + "' AND EX_Sdate >= '" + Day_YMD + " 00:00:00' AND EX_Sdate <= '" + Day_YMD + " 23:59:59' AND EX_Status='6'";
                string EX_type = GetValueBYSQL(conn, getMEXCU_Data_EX_type);//假別種類(代號)
                string getMEXCU_Data_EX_type_Name = "select ddesc from MITEM where mitcode = 'EXCUE' and ditcode ='" + EX_type + "' and del_tag = '0' order by rank";
                string EX_type_Name = GetValueBYSQL(conn, getMEXCU_Data_EX_type_Name);//假別種類(名稱)
                DateTime dt_Standard_S = new DateTime();//規定的上班時間
                DateTime dt_Standard_E = new DateTime();//規定的下班時間
                //取得當天出勤資料
                mREGT02DetailEntity.Ex_Hour = EX_Hour;//異常時數
                if (EX_DAY.Trim() != "" || EX_Hour.Trim() != "")
                {
                    mREGT02DetailEntity.Information = EX_type_Name + "-" + EX_DAY + "天" + EX_Hour + "時";//請假資料
                }
                //MP:員工編號,Day_YMD:所選的日期
                //
                if (MREGTList[m].MR_RSTime.Trim() != "")
                {
                    dt_compard_S = DateTime.Parse(MREGTList[m].MR_RSTime.ToString());//取得每天上班打卡時間
                }
                dt_compard_S_test = DateTime.Parse(dt_compard_S.ToString("HH:mm:ss"));//取得上班打卡時間
                //if (MREGTList[m].MR_Item.Trim() == "0005")
                //{
                //    MREGTList[m].MR_Item = "0005";
                //}
                //dt_compard_S_test = DateTime.Parse(dt_compard_S.ToLongTimeString());//取得每天上班打卡時間

                if (MREGTList[m].MR_RETime.Trim() != "")
                {
                    dt_compard_E = DateTime.Parse(MREGTList[m].MR_RETime.ToString());//下班打卡時間(這邊要修改)
                }
                dt_compard_E_test = DateTime.Parse(dt_compard_E.ToString("HH:mm:ss"));//取得下班打卡時間

                if (MREGTList[m].MR_RETime.Trim() != "")
                {
                    dt_compard_E = DateTime.Parse(MREGTList[m].MR_RETime.ToString());//下班打卡時間(這邊要修改)
                    dt_compard_E_test = DateTime.Parse(dt_compard_E.ToString("HH:mm:ss"));//取得下班打卡時間
                }
                //var StartDate_Date = dt_MR_RSTime.ToString("yyyy/MM/dd");//只取年月日
                //DateTime StartDate_Date= DateTime.ParseExact(StartDate, "yyyy-MM-dd", CultureInfo.InvariantCulture);// StartDate;
                //string getMREGTDtial = "SELECT  [MR_ID],[MR_Date],[MR_Num],[MR_Item],[MR_Mdep],[MR_RSTime],[MR_RETime] FROM [HG].[dbo].[MREGT] WHERE MR_Num='" + MP + "' and MR_Date='" + StartDate_Date + "'";
                //SdateNEWdatetime = SdateNEWdatetime.AddDays(1);
                DateTime dt_compard_S2 = new DateTime();
                string dt_compard_S_Year = "";
                bool offduty = false;

                if (MREGTList[m].MR_RSTime.Trim() != "")
                {
                    var dt_MR_RSTime2 = DateTime.Parse(MREGTList[m].MR_RSTime.ToString());//取得每天上班打卡時間
                    dt_compard_S2 = dt_MR_RSTime2;
                    dt_compard_S_Year = dt_compard_S2.Year.ToString();//;//取得每天上班打卡時間(年份)[用來取得規定打卡時間]

                }
                else//表示此天無打卡紀錄
                {
                    dt_compard_S_Year = "";
                    offduty = true;//沒有出勤紀錄
                }
                if (!offduty)
                { //}
                    dt_compard_S_Year = dt_compard_S2.Year.ToString();//;//取得每天上班打卡時間(年份)[用來取得規定打卡時間]
                    string dt_compard_S_Month = dt_compard_S2.Month.ToString();//;//取得每天上班打卡時間(月份)[用來取得規定打卡時間]
                    dt_Standard_S = DateTime.Parse(DateTimeStandard(MREGTList[m], "start", dt_compard_S_Year, dt_compard_S_Month, MP, Select_Dept, conn));
                    dt_Standard_E = DateTime.Parse(DateTimeStandard(MREGTList[m], "end", dt_compard_S_Year, dt_compard_S_Month, MP, Select_Dept, conn));
                }
                ts = EdateNEWdatetime.Subtract(SdateNEWdatetime);
                i = ts.Days;//兩日期相隔的天數
                            //MR_Date_DateTime:起始日期
                            //取得詳細請假資料
                            //MEXCUList = MEXCUhgDao.Instance.getMREGE02ListFromMEXCU(conn, StartDate, EndDate, MP, U_name, ComID, U_MDEP, DEPAR_Name);//[產出]請假紀錄(從資料庫取出請假資料)
                            //MREGT02DetailEntity mREGT02DetailEntity = new MREGT02DetailEntity();//產生畫面所需資料(mREGT02DetailEntity)
                            //string Month = "";
                string Year = "";
                string Day = "";
                Month = SdateNEWdatetime.Month.ToString();
                Year = SdateNEWdatetime.Year.ToString();
                Day = SdateNEWdatetime.Day.ToString();
                string NewDate = Year + "-" + Month + "-" + Day;//年-月-日(給SQL語法用)
                                                                ////////////////////////////////////////////////
                Month = EdateNEWdatetime.Month.ToString();
                Year = EdateNEWdatetime.Year.ToString();
                Day = EdateNEWdatetime.Day.ToString();
                string ENewDate = Year + "-" + Month + "-" + Day;
                /////////////////////////////////////////////////
                MCLASList = MCLAShgDao.Instance.getMCLASList_(Year, Month, MP);//當年當月紀錄規定的上下班時間(原有系統資料表)


                mREGT02DetailEntity.M_Date = MREGTList[m].MR_Date;//資料日期

                mREGT02DetailEntity.MR_Name = MP;//員工編號[人員(MP)]
                                                 //班別(MR_ITEM)
                string getMR_Item = "SELECT  [MR_Item] FROM [HG].[dbo].[MREGT] WHERE MR_Num='" + MP + "' and MR_Date='" + NewDate + "'";
                string MR_Item = GetValueBYSQL(conn, getMR_Item);//班別
                                                                 //mREGT02DetailEntity.MR_Item = MR_Item;
                                                                 //上班時間(MR_RETime)
                string getMR_RSTime = "SELECT  [MR_RSTime] FROM [HG].[dbo].[MREGT] WHERE MR_Num='" + MP + "' and MR_Date='" + NewDate + "'";
                string getMR_RETime = "SELECT  [MR_RETime] FROM [HG].[dbo].[MREGT] WHERE MR_Num='" + MP + "' and MR_Date='" + NewDate + "'";
                string MR_RETime = GetValueBYSQL(conn, getMR_RETime);//下班時間

                string MR_RSTime = GetValueBYSQL(conn, getMR_RSTime);//上班時間
                if (MR_Item != "0005")
                {
                    mREGT02DetailEntity.MR_REtime = MR_RETime;
                    mREGT02DetailEntity.MR_RStime = MR_RSTime;
                }//下班時間(MR_RSTime)
                else
                {

                    mREGT02DetailEntity.MR_REtime = "---------------";
                    mREGT02DetailEntity.MR_RStime = "---------------";

                }
                //string getMR_RETime = "SELECT  [MR_RETime] FROM [HG].[dbo].[MREGT] WHERE MR_Num='" + MP + "' and MR_Date='" + NewDate + "'";
                //string MR_RETime = GetValueBYSQL(conn, getMR_RETime);//下班時間
                //mREGT02DetailEntity.MR_REtime = MR_RETime;
                //出勤狀態(Status)
                //異常時數(Ex_Hour)
                //請假資料(Information)
                //取得標準打卡時間



                //while (i > Day_int) ;
                //

                //TimeSpan TS_ = new TimeSpan();
                //DateTime TS_DateTime = new DateTime();
                int interv_Day = 0;//間隔的天數
                                   //做一個迴圈 從 MR_Date 每次加一天到 MR_EDate (MR_Date++ < MR_EDate) 
                                   //List<MREGT02DetailEntity> MREGT02ListDataList = new List<MREGT02DetailEntity>();
                                   //MR_Date:起始日期
                                   //MR_EDate:終止日期
                                   //do
                                   //{
                                   //    //MR_Date_DateTime:起始日期
                                   //MREGT02DetailEntity mREGT02DetailEntity = new MREGT02DetailEntity();
                                   //日期
                                   //人員
                                   //班別
                                   //上班時間
                                   //下班時間
                                   //出勤狀態
                                   //異常時數
                                   //請假資料

                //mREGT02DetailEntity.M_Date = MR_Date_DateTime.ToString();//日期
                //mREGT02DetailEntity.MR_Name = U_Num;//人員

                //DateTime MR_Date_DateTime_AddDays_1 = MR_Date_DateTime.AddDays(1);//起始日期+1
                //MR_Date_DateTime = MR_Date_DateTime_AddDays_1;
                //TS_ = MR_EDate_DateTime.Subtract(MR_Date_DateTime_AddDays_1);
                //日期
                //mREGT02DetailEntity.M_Date=
                string[] StartDate1 = null;
                string[] StartDate2 = null;
                //    interv_Day += 1;//間隔的天數
                //} while (TS_.TotalDays >= 0);
                string MR_EDate_Year = MR_EDate_DateTime.Year.ToString();//年
                string MR_EDate_Month = MR_EDate_DateTime.Month.ToString();//月
                string MR_EDate_Day = MR_EDate_DateTime.Day.ToString();//日
                                                                       //做一個迴圈 從 MR_Date 每次加一天到 MR_EDate (MR_Date++ < MR_EDate) 
                                                                       //List<MREGT02DetailEntity> MREGT02ListDataList = new List<MREGT02DetailEntity>();

                //List<MCLASEntity> MCLASList = new List<MCLASEntity>();
                string U_Num = "";
                //檢查日期格式
                //2022/10/4 上午 12:00:00
                //if (StartDate.Contains("午"))
                //{
                //    StartDate1 = StartDate.Split(' ');
                //    StartDate2 = StartDate1[0].Split('/');
                //    //重組年月日
                //    StartDate = StartDate2[0] + "-" + StartDate2[1] + "-" + StartDate2[2];
                //}
                //else
                //{
                //    StartDate1 = StartDate.Split(' ');
                //    StartDate2 = StartDate1[0].Split('/');
                //    //重組年月日
                //    StartDate = StartDate2[0] + "-" + StartDate2[1] + "-" + StartDate2[2];
                //}

                //NewDate
                if (NewDate.Contains("午"))
                {
                    StartDate1 = NewDate.Split(' ');
                    StartDate2 = StartDate1[0].Split('/');
                    //重組年月日
                    StartDate = StartDate2[0] + "-" + StartDate2[1] + "-" + StartDate2[2];
                }
                //else
                //{
                //StartDate1 = NewDate.Split(' ');
                //StartDate2 = StartDate1[0].Split('/');
                ////重組年月日
                //StartDate = StartDate2[0] + "-" + StartDate2[1] + "-" + StartDate2[2];
                //}

                string MR_Date = StartDate;
                string SdateNEWdatetime_String = "";
                string MR_EDate = EndDate;
                //MREGT02DetailEntity mREGT02DetailEntity = new MREGT02DetailEntity();//產生畫面欄位資料!!
                using (SqlConnection conn_ = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
                {

                    //List<MCLASEntity> MCLASList = new List<MCLASEntity>();
                    //mREGT02DetailEntity.M_Date = MR_Date;//日期
                    //SdateNEWdatetime
                    if (SdateNEWdatetime.ToString().Contains("/"))
                    {
                        StartDate1 = SdateNEWdatetime.ToString().Split(' ');
                        StartDate2 = StartDate1[0].Split('/');
                        //重組年月日
                        StartDate = StartDate2[0] + "-" + StartDate2[1] + "-" + StartDate2[2];
                        //SdateNEWdatetime= StartDate;
                        //SdateNEWdatetime_String = SdateNEWdatetime.ToString();
                        SdateNEWdatetime_String = StartDate;
                    }
                    //mREGT02DetailEntity.M_Date = SdateNEWdatetime.ToString();
                    mREGT02DetailEntity.M_Date = Day_YMD;
                    string temp = mREGT02DetailEntity.M_Date;
                    //取得當天班別(M_Item) 
                    string getMITEMBY_UUNUM = "SELECT MR_Item FROM [HG].[dbo].[MREGT] where MR_Num = '" + MP + "' and MR_Date = '" + temp + "'";
                    string M_ITEM = GetValueBYSQL(conn_, getMITEMBY_UUNUM);//'當天的班別

                    //取得班別中文名稱
                    string getMITEMNAMEBYMITEM = "SELECT [ddesc] FROM [HG].[dbo].[MITEM] where mitcode='MRGET' and ditcode='" + M_ITEM + "'";
                    string M_ITEM_NAME = GetValueBYSQL(conn, getMITEMNAMEBYMITEM);//班別中文名稱
                                                                                  //畫面中的[班別]欄位
                                                                                  // MREGTList[m].MR_Item
                    if (MREGTList[m].MR_Item == "0005")
                    {
                        mREGT02DetailEntity.Status = "休假";//班別中文名稱
                        mREGT02DetailEntity.MR_RStime = "----------------------";
                        mREGT02DetailEntity.MR_REtime = "----------------------";
                    }
                    else
                    {
                        mREGT02DetailEntity.MR_Item = M_ITEM_NAME;//班別中文名稱
                    }
                    //取得人員()
                    string getNameBY_UNUM_ = "SELECT [U_Name] FROM [HG].[dbo].[MUSER] WHERE U_Num='" + MP + "' and LeaveDate is null";
                    string U_name_ = GetValueBYSQL(conn, getNameBY_UNUM_);//人員(姓名)
                                                                          //畫面中的[人員]欄位
                    mREGT02DetailEntity.MR_Name = U_name_;
                    //取得上班時間
                    //取得下班時間
                    //取得出勤狀態
                    //取得請假資料
                    //2022122work取得[請假資料]欄位
                    string GetDayOFFDetail_EXDAY = "select ex_day From MEXCU where EX_User = '" + MP + "' and EX_Sdate >= '" + StartDate + " 00:00:00' and EX_Status = '6'";
                    string EXDAY = GetValueBYSQL(conn_, GetDayOFFDetail_EXDAY);
                    string GetDayOFFDetail_EXHOUR = "select ex_Hour From MEXCU where EX_User = '" + MP + "' and EX_Sdate >= '" + StartDate + " 00:00:00' and EX_Status = '6'";
                    string EXHOUR = GetValueBYSQL(conn_, GetDayOFFDetail_EXHOUR);
                    string GetDayOFFDetail_EXTYPE = "select EX_type From MEXCU where EX_User = '" + MP + "' and EX_Sdate >= '" + StartDate + " 00:00:00' and EX_Status = '6'";
                    string EXTYPE = GetValueBYSQL(conn_, GetDayOFFDetail_EXTYPE);
                    //string status = GetStatus(U_Num, conn, MR_Date, M_ITEM);
                    //判斷遲到或早退多少時間
                    //    //取得出勤狀態(GetStatus)[代入]1.部門 2.班別 3.日期 取出應打卡時間
                    //    //輸入日期(MR_Date),員工編號(MR_Num) 取得該天所屬班別(MR_ITEM)及該天上班打卡時間(MR_RSTime)及下班打卡時間(MR_RETime)
                    //    string GetMR_ITEMFromMREGT = "Select MR_ITEM,MR_RSTime,MR_RETime from MREGT where MR_Num='"+ U_Num + "'and MR_Date='"+ MR_Date + "'";
                    //    //輸入日期 取出該月各班別應打卡的時間
                    //string GetMCLAS = "SELECT * FROM MCLAS where C_SDate <='" + MR_Date + "' and C_EDate>='" + MR_Date + "'";
                    //DataSet MCLASSet = GetSetBYSQL(conn, GetMCLAS);//取得所選日期各班別應打卡時間
                    //MCLASList = MCLAShgDao.Instance.getMCLASList(MR_Date, MR_Date, U_Num);//當月紀錄規定的上下班時間(原有系統資料表)
                    //List<MCLASEntity> MCLASList = MCLAShgDao.Instance.getMCLASList(MR_Date, MR_EDate, U_Num);//當月紀錄規定的上下班時間(原有系統資料表)
                    List<MCLASEntity> MCLASList_ = MCLAShgDao.Instance.getMCLASList(MR_Date, MR_EDate, MP);//當月紀錄規定的上下班時間(原有系統資料表)
                                                                                                           //List<MREGT02Entity> MREGT02List = MREGThgDao.Instance.getMREGT02List(MR_Date, MR_EDate, U_Num);//紀錄出缺勤打卡紀錄
                    List<MREGTEntity> MREGTList_ = MREGThgDao.Instance.getMREGE02List(MR_Date, MR_EDate, MP);//取出出缺勤打卡紀錄
                    int E9 = 0;//遲到的次數
                               //取出規定的上下班時間
                    int E11 = 0;//早退的次數
                                //取出規定的上下班時間
                    int onTime = 0;//準時到達的次數
                                   //MREGT02Entity mREGT02Entity = new MREGT02Entity();
                                   //List<MREGT02Entity> MREGE02DataList = new List<MREGT02Entity>();//考勤報表畫面欄位資料來源
                                   //DateTime dt_compard_E = new DateTime();
                                   //var dt_MR_RSTime = DateTime.Parse(MREGTList[1].MR_RSTime.ToString());
                                   //var dt_MR_RETime = DateTime.Parse(MREGTList[1].MR_RETime.ToString());
                                   //int m = 0;
                                   //MREGT02Entity mREGT02Entity = new MREGT02Entity();
                                   //mREGT02Entity.Com = COMID_Name;
                                   //mREGT02Entity.Dept = DEPAR_Name;
                                   //mREGT02Entity.SlimDate = SlimDate;
                                   //if (LeaveDate == "")
                                   //{
                                   //    mREGT02Entity.LeaveDate = "仍在職";
                                   //}
                                   //else
                                   //{
                                   //    mREGT02Entity.LeaveDate = LeaveDate;//離職日期
                                   //}
                                   //foreach (var item in MREGTList)//MREGTList(//紀錄出缺勤打卡紀錄)
                                   //{
                                   //DateTime dt_compard_E = new DateTime();
                                   //DateTime dt_compard_S_test = new DateTime();
                                   //DateTime dt_compard_E_test = new DateTime();

                    //規定上班打卡時間(//重組年月日
                    //StartDate = StartDate2[0] + "-" + StartDate2[1] + "-" + StartDate2[2];)
                    var dt_Standard_S_ = DateTime.Parse(DateTimeStandard(MREGTList[m], "start", Year, Month, MP, Select_Dept, conn));
                    //規定下班打卡時間
                    var dt_Standard_E_ = DateTime.Parse(DateTimeStandard(MREGTList[m], "end", Year, Month, MP, Select_Dept, conn));



                    if (MREGTList[m].MR_RSTime.ToString() != "")
                    {
                        var dt_MR_RSTime_ = DateTime.Parse(MREGTList[m].MR_RSTime.ToString());//取得上班打卡時間
                        DateTime dt_compard_S__ = DateTime.Parse(dt_MR_RSTime_.ToLongTimeString());//取得上班打卡時間
                        dt_compard_S_test = DateTime.Parse(dt_compard_S__.ToString("HH:mm:ss"));
                        if (MREGTList[m].MR_RSTime.ToString() != "")
                        {
                            //var dt_MR_RSTime2 = DateTime.Parse(MREGTList[m].MR_RSTime.ToString());//取得上班打卡時間
                            dt_compard_S = DateTime.Parse(MREGTList[m].MR_RSTime.ToString());//取得上班打卡時間
                            dt_compard_S_test = DateTime.Parse(dt_compard_S.ToString("HH:mm:ss"));//取得下班打卡時間
                        }
                        if (MREGTList[m].MR_RETime.ToString().Length != 0)
                        {
                            dt_compard_E = DateTime.Parse(MREGTList[m].MR_RETime.ToString());//下班打卡時間(這邊要修改)
                            dt_compard_E_test = DateTime.Parse(dt_compard_E.ToString("HH:mm:ss"));//取得下班打卡時間
                        }
                    }
                    //取得與規定時間差多少時間
                    double E9secs = dt_compard_S_test.Subtract(dt_Standard_S).TotalSeconds;//共差了多久時間(秒)[遲到]
                    double E11secs = dt_compard_E_test.Subtract(dt_Standard_E).TotalSeconds;//共差了多久時間(秒)[早退]
                    //    string commandText = "SELECT [U_MDEP] FROM [HG].[dbo].[MUSER] where U_Num='" + MP + "'";
                    //    //取得規定上下班時間
                    using (SqlConnection conn_GetMCLASList = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
                    {

                        //        //dt_compard_S:上班打卡時間
                        //        //dt_compard_E:下班打卡時間
                        //        //傳入參數 部門(MP_Mdep)班別(MR_Item)取得規定上下班時間
                        //        string MP_Mdep = GetValueBYSQL(conn, commandText);//所選中MP所屬的部門
                        //                                                          //從出缺勤系統資料的上下班打卡紀錄和規定上下班時間比對出遲到或早退
                        //        foreach (var item1 in MREGTList)//出缺勤系統資料
                        //        {
                        //            DateTime dt_Standard_S = new DateTime();//規定的上班時間
                        //            DateTime dt_Standard_E = new DateTime();//規定的下班時間
                        //                                                    //正常班取得規定上/下班時間
                        //            if (MREGTList[0].MR_Item == "0001")//正常班上班
                        //            {
                        //                if (MREGTList[0].MR_Mdep == "0002" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].A_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].A_OBTime_E.ToString());
                        //                    break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0003" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                        //                    break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0004" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                        //                    break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0005" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0006" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].A_OBTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].A_OBTime_E.ToString());
                        //                    break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0007" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].B_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].B_OTime_E.ToString());
                        //                    break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0008" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].B_OBTime_E.ToString());
                        //                    break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0009" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                        //                    break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0010" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());//有問題,再確認!!!
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                        //                    break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0011" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                        //                    break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0012" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].D_OBTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].D_OBTime_E.ToString());
                        //                    break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0013" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0014" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0015" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_OBTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OBTime_E.ToString());
                        //                    break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0016" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OBTime_E.ToString());
                        //                    break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0017" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].F_MTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].F_MTime_E.ToString());
                        //                    break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0018" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                        //                    break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0019" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].D_OBTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].D_OBTime_E.ToString());
                        //                    break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0020" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].G_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].G_OTime_E.ToString());
                        //                    break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0021" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                        //                    break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0022" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_OBTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                        //                    break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0023" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                        //                    break;

                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0024" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_OBTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                        //                    break;

                        //                }

                        //            }
                        //            //早班
                        //            else if (MREGTList[0].MR_Item == "0002")//早班
                        //            {
                        //                if (MREGTList[0].MR_Mdep == "0002" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].G_MTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].G_MTime_E.ToString());
                        //                    //break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0003" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                        //                    //break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0004" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                        //                    //break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0005" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0006" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].A_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].A_OTime_E.ToString());
                        //                    //break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0007" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0008" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].B_MTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].B_NTime_E.ToString());
                        //                    //break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0009" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                        //                    //break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0010" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                        //                    //break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0011" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                        //                    //break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0012" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                        //                    //break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0013" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0014" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0015" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_MTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_MTime_E.ToString());
                        //                    //break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0016" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_MTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_MTime_E.ToString());
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0017" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].F_MTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].F_MTime_E.ToString());
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0018" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].D_MTime_S.ToString());
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0019" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0020" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0021" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0022" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0023" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0024" && MREGTList[0].MR_Mdep == MP_Mdep)
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                        //                }
                        //            }
                        //            //晚班    
                        //            else if (MREGTList[0].MR_Item == "0003")//晚班
                        //            {
                        //                if (MREGTList[0].MR_Mdep == "0002")
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].G_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].G_OTime_E.ToString());
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0003")
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0004")
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0005")
                        //                {

                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0006")
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].A_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].A_OTime_E.ToString());
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0007")
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0008")
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].B_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].B_OTime_E.ToString());
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0009")
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0010")
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0011")
                        //                {

                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0012")
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0013")
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0014")
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0015")
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0016")
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0017")
                        //                {

                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0018")
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0019")
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].D_NTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].D_NTime_E.ToString());
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0020")
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0021")
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0022")
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0023")
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0024")
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                        //                }
                        //            }
                        //            //假日班
                        //            else if (MREGTList[0].MR_Item == "0005")//假日,休假
                        //            {
                        //                if (MREGTList[0].MR_Mdep == "0002")
                        //                {

                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0003")
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0004")
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0005")
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0006")
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0007")
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0008")
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0009")
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0010")
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0011")
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0012")
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0013")
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0014")
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0015")
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_MTime_S.ToString());
                        //                    //break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0016")
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0017")
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].F_NTime_S.ToString());
                        //                    dt_Standard_E = DateTime.Parse(MCLASList[0].F_NTime_E.ToString());
                        //                    //break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0018")
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0019")
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0020")
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0021")
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_MTime_S.ToString());
                        //                    //break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0022")
                        //                {
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0023")
                        //                {
                        //                    dt_Standard_S = DateTime.Parse(MCLASList[0].E_MTime_S.ToString());
                        //                    //break;
                        //                }
                        //                if (MREGTList[0].MR_Mdep == "0024")
                        //                {
                        //                }
                        //            }
                        //            //取得與規定時間差多少時間
                        //            double E9secs = dt_compard_S.Subtract(dt_Standard_S).TotalSeconds;//共差了多久時間(秒)[遲到]
                        //            double E11secs = dt_compard_E.Subtract(dt_Standard_E).TotalSeconds;//共差了多久時間(秒)[早退]
                        //            if (E9secs > 0)
                        //            {
                        //                E9++;//遲到+1(所選的時間內遲到的次數)[E9]
                        //                     //m++;
                        //                     //break;
                        //            }
                        //            else
                        //            {
                        //                onTime++;//準時到達的次數+1
                        //                         //m++;
                        //                         //break;
                        //            }

                        //            if (E11secs < -1800)//這邊要修正,先命名-1800做測試用
                        //            {
                        //                E11++;//早退+1(所選的時間內早退的次數)[E11]
                        //                      //m++;
                        //                      //break;
                        //            }
                        //            else
                        //            {
                        //                onTime++;//準時到達的次數+1
                        //                         //m++;
                        //                         //break;
                        //            }
                        //            //m++;
                        //            break;
                        //        }
                        //        //m++;

                        //    }



                    }

                    //MEXCUList = MEXCUhgDao.Instance.getMREGE02ListFromMEXCU(StartDate, EndDate, MP, U_name, Select_Com, Select_Dept);//[產出]請假紀錄
                    //查詢上下班打卡是否遲到早退
                    List<MCLASEntity> MCLASList2 = MCLAShgDao.Instance.getMCLASList(MR_Date, MR_EDate, U_Num);//當月紀錄規定的上下班時間(原有系統資料表)
                    List<MREGTEntity> MREGT02List = MREGThgDao.Instance.getMREGE02List(StartDate, EndDate, MP);//紀錄出缺勤打卡紀錄
                    List<MREGTEntity> MREGTList2 = MREGThgDao.Instance.getMREGE02List(MR_Date, MR_EDate, U_Num);//取出出缺勤打卡紀錄


                    //List<MREGT02DetailEntity> MREGT02DetailList = new List<MREGT02DetailEntity>();
                    int E9_ = 0;//遲到的次數
                                //           //取出規定的上下班時間
                    int E11_ = 0;//早退的次數
                                 //            //取出規定的上下班時間
                    int onTime_ = 0;//準時到達的次數
                                    //               //MREGT02Entity mREGT02Entity = new MREGT02Entity();
                                    //List<MREGT02Entity> MREGE02DataList = new List<MREGT02Entity>();//考勤報表畫面欄位資料來源
                                    //DateTime dt_compard_E = new DateTime();
                                    //var dt_MR_RSTime = DateTime.Parse(MREGTList[1].MR_RSTime.ToString());
                                    //var dt_MR_RETime = DateTime.Parse(MREGTList[1].MR_RETime.ToString());
                                    //int m2 = 0;

                    //畫面中的[日期]欄位
                    //mREGT02DetailEntity.M_Date = DateTime.Parse(mREGT02DetailEntity.M_Date).AddDays(m).ToString("yyyy-MM-dd");//日期天數加1(只取日期)
                    ////取得[請假資料]欄位
                    //string GetDayOFFDetail_EXDAY = "select ex_day From MEXCU where EX_User = '"+ StartDate + " 00:00:00' and EX_Sdate >= '" +EndDate+ " 23:59:59' and EX_Status = '6'";
                    //string EXDAY= GetValueBYSQL()
                    //string GetDayOFFDetail_EXHOUR= "select ex_Hour From MEXCU where EX_User = '" + StartDate + " 00:00:00' and EX_Sdate >= '" + EndDate + " 23:59:59' and EX_Status = '6'";
                    //string GetDayOFFDetail_EXTYPE= "select EX_type From MEXCU where EX_User = '" + StartDate + " 00:00:00' and EX_Sdate >= '" + EndDate + " 23:59:59' and EX_Status = '6'";
                    ////畫面中的[出勤狀態]欄位
                    //mREGT02DetailEntity.Status = "";
                    //出勤狀態由MR_MDEP透過當天的MR_ITEM判斷
                    //畫面中的[異常時數]欄位
                    //mREGT02DetailEntity.Ex_Hour = "";
                    //畫面中的[請假資料]欄位
                    //mREGT02DetailEntity.Information = "";
                    //畫面中的[日期]欄位
                    mREGT02DetailEntity.M_Date = Day_YMD;
                    day_interv++;//經過的天數

                    MREGT02DetailList.Add(mREGT02DetailEntity);
                    //mREGT02DetailEntity.MR_RStime = "";
                    //mREGT02DetailEntity.MR_REtime = "";

                    m++;//包含起始日到終止日的天數
                        //return MREGT02DetailList;

                }
                SdateNEWdatetime = SdateNEWdatetime.AddDays(1);
                //return MREGT02DetailList;
                //Day_int++;//包含起始日到終止日的天數
            }
            while (Day_int >= m);
            //turn MREGT02DetailList;
            //return MREGT02DetailList;
            //do
            //{

            //} while (true);


            return MREGT02DetailList;

        }
    }
    //
    //return MREGT02DetailList;




    //取得出勤狀態(status)
    //MR_Date:打卡日期,M_ITEM:班別
    public string GetStatus(string U_Num, SqlConnection conn, string MR_Date, string M_ITEM)
    {
        string status = "";
        //由員工編號(U_Num)取得班別(MR_Item)
        //string GetMR_ItemFromU_Num = "SELECT [MR_item] FROM [HG].[dbo].[MREGT] where MR_Num='" + U_Num + "' and MR_Date='" + MR_Date + "'";
        //string MR_Item = GetValueBYSQL(conn, GetMR_ItemFromU_Num);//班別
        //List<MREGT02ListEntity> MREGT02ListDataList = new List<MREGT02ListEntity>();
        //由員工編號(U_Num)取得部門(DEPAR)
        string getUDEPARBY_UNUM = "SELECT [U_MDEP] FROM [HG].[dbo].[MUSER] WHERE U_Num='" + U_Num + "' and LeaveDate is null";//取得部門別(COMID)
        string DEPAR = GetValueBYSQL(conn, getUDEPARBY_UNUM);//部門名稱
                                                             //由員工編號(U_Num)取得公司(COM)
        string getCOMIDBY_UNUM = "SELECT [COMID] FROM [HG].[dbo].[MUSER] where MR_Num = '" + U_Num + "'";
        string COMID = GetValueBYSQL(conn, getCOMIDBY_UNUM);
        string getCOMIDNAMEBY_COMID = "SELECT [ddesc] FROM [HG].[dbo].[MITEM]  where ditcode='" + COMID + "'";
        string COMIDNAME = GetValueBYSQL(conn, getCOMIDNAMEBY_COMID);//公司名稱
                                                                     //取得出勤狀態(GetStatus)[代入]1.部門 2.班別 3.日期 取出應打卡時間
                                                                     //輸入日期(MR_Date),員工編號(MR_Num) 取得該天所屬班別(MR_ITEM)及該天上班打卡時間(MR_RSTime)及下班打卡時間(MR_RETime)
        string GetMR_ITEMFromMREGT = "Select MR_ITEM,MR_RSTime,MR_RETime from MREGT where MR_Num='" + U_Num + "'and MR_Date='" + MR_Date + "'";
        //輸入日期 取出該月各班別應打卡的時間
        string GetMCLAS = "SELECT * FROM MCLAS where C_SDate <='" + MR_Date + "' and C_EDate>='" + MR_Date + "'";
        DataSet MCLASSet = GetSetBYSQL(conn, GetMCLAS);//取得打卡當天各班別應打卡時間
        List<MCLASEntity> MCLASList = MCLAShgDao.Instance.getMCLASList(MR_Date, MR_Date, U_Num);//當月紀錄規定的上下班時間(原有系統資料表)

        //AAAAAA
        MREGTEntity MEXCUList = new MREGTEntity();
        string U_name = "";
        string COMID_Name = "";
        string DEPAR_Name = "";
        // using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        // {

        ////公司
        //string getComIDBY_UNUM = "SELECT [ComID] FROM [HG].[dbo].[MUSER] WHERE U_Num='" + MP + "' and LeaveDate is null";//取得公司別(COMID)
        //string COMID = GetValueBYSQL(conn, getComIDBY_UNUM);
        //string getComID_Name = "SELECT [ddesc] FROM [HG].[dbo].[MITEM] where mitcode='COMID' and ditcode='" + COMID + "'";
        //COMID_Name = GetValueBYSQL(conn, getComID_Name);//公司別
        //                                                //部門
        //string getUDEPARBY_UNUM = "SELECT [U_MDEP] FROM [HG].[dbo].[MUSER] WHERE U_Num='" + MP + "' and LeaveDate is null";//取得部門別(COMID)
        //string DEPAR = GetValueBYSQL(conn, getUDEPARBY_UNUM);
        //string getUDEPAR_Name = "SELECT [ddesc] FROM [HG].[dbo].[MITEM] where mitcode='DEPAR' and ditcode='" + DEPAR + "'";
        //DEPAR_Name = GetValueBYSQL(conn, getUDEPAR_Name);//部門別

        //到職日
        string getSlimDate_BY_UNUM = "SELECT [SlimDate],[LeaveDate] FROM [HG].[dbo].[MUSER] WHERE U_Num='" + U_Num + "' and LeaveDate is null";
        string SlimDate_Name = GetValueBYSQL(conn, getSlimDate_BY_UNUM);//到職日

        //離職日
        string getLeaveDateBY_UNUM = "SELECT [LeaveDate] FROM [HG].[dbo].[MUSER] WHERE U_Num='" + U_Num + "' and LeaveDate is null";
        string leaveDate_Name = GetValueBYSQL(conn, getLeaveDateBY_UNUM);//離職日
        if (leaveDate_Name.Trim() == "")
            leaveDate_Name = "在職中";

        // }
        //mREGT02Entity.U_Name = U_name;
        //20221205下午進度
        //MEXCUList = MEXCUhgDao.Instance.getMREGE02ListFromMEXCU(StartDate, EndDate, MP, U_name, Select_Com, Select_Dept);//[產出]請假紀錄
        //查詢上下班打卡是否遲到早退
        MCLASList = MCLAShgDao.Instance.getMCLASList(MR_Date, MR_Date, U_Num);//當月紀錄規定的上下班時間(原有系統資料表)
                                                                              //List<MREGT02Entity> MREGT02List = MREGThgDao.Instance.getMREGE02List(MR_DateY, MR_DateM, MP);//紀錄出缺勤打卡紀錄
        List<MREGTEntity> MREGTList = MREGThgDao.Instance.getMREGE02List(MR_Date, MR_Date, U_Num);//取出出缺勤打卡紀錄
        int E9 = 0;//遲到的次數
                   //取出規定的上下班時間
        int E11 = 0;//早退的次數
                    //取出規定的上下班時間
        int onTime = 0;//準時到達的次數
                       //MREGT02Entity mREGT02Entity = new MREGT02Entity();
        List<MREGT02DetailEntity> MREGE02DeailDataList = new List<MREGT02DetailEntity>();//考勤報表畫面欄位資料來源
                                                                                         //DateTime dt_compard_E = new DateTime();
                                                                                         //var dt_MR_RSTime = DateTime.Parse(MREGTList[1].MR_RSTime.ToString());
                                                                                         //var dt_MR_RETime = DateTime.Parse(MREGTList[1].MR_RETime.ToString());
        int m = 0;
        //MREGT02Entity mREGT02Entity = new MREGT02Entity();
        //mREGT02Entity.Com = COMID_Name;
        //mREGT02Entity.Dept = DEPAR_Name;
        //mREGT02Entity.SlimDate = SlimDate;
        //if (LeaveDate == "")
        //{
        //    mREGT02Entity.LeaveDate = "仍在職";
        //}
        //else
        //{
        //    mREGT02Entity.LeaveDate = LeaveDate;//離職日期
        //}
        //foreach (var item in MREGTList)//MREGTList(//紀錄出缺勤打卡紀錄)
        //{

        if (MREGTList[m].MR_RSTime.ToString() != "")
        {
            //var dt_MR_RSTime = DateTime.Parse(MREGTList[m].MR_RSTime.ToString());//取得上班打卡時間
            //DateTime dt_compard_S = DateTime.Parse(dt_MR_RSTime.ToLongTimeString());//取得上班打卡時間
            DateTime dt_MR_RSTime = new DateTime();
            DateTime dt_MR_RETime = new DateTime();
            if (MREGTList[m].MR_RETime.ToString() != "")
            {
                dt_MR_RSTime = DateTime.Parse(MREGTList[m].MR_RSTime.ToString());//取得下班打卡時間
                                                                                 //dt_compard_E = DateTime.Parse(dt_MR_RETime.ToLongTimeString());//取得下班打卡時間
            }
            if (MREGTList[m].MR_RETime.ToString() != "")
            {
                dt_MR_RETime = DateTime.Parse(MREGTList[m].MR_RETime.ToString());//取得下班打卡時間
                                                                                 //dt_compard_E = DateTime.Parse(dt_MR_RETime.ToLongTimeString());//取得下班打卡時間
            }
            //m++;
            DateTime dt_compard_S = DateTime.Parse(dt_MR_RSTime.ToLongTimeString());//取得上班打卡時間
            DateTime dt_compard_E = DateTime.Parse(dt_MR_RETime.ToLongTimeString());//取得下班打卡時間
            TimeSpan ts_ = new TimeSpan();
            //DateTime dt_Standard_S = new DateTime();//規定的上班時間
            //DateTime dt_Standard_E = new DateTime();//規定的下班時間
            string commandText = "SELECT [U_MDEP] FROM [HG].[dbo].[MUSER] where U_Num='" + U_Num + "'";
            //20221205加入休假日不判斷!!!!!!!!!!!!
            //20221205加入自訂上下班時間!!!!!!!!!!
            //MR_Item:班別
            //20221212檢查遲到出缺勤判斷邏輯!!!!!!!!(參考舊專案:MRGT02_List.asp #147~~~~~~~~)
            //依照事業部判斷
            using (SqlConnection conn_GetMCLASList = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
            {
                string MP_Mdep = GetValueBYSQL(conn, commandText);//所選中MP所屬的部門
                foreach (var item1 in MREGTList)//出缺勤系統資料
                {
                    DateTime dt_Standard_S = new DateTime();//規定的上班時間
                    DateTime dt_Standard_E = new DateTime();//規定的下班時間
                                                            //取得規定上/下班時間
                                                            //正常班
                    if (MREGTList[0].MR_Item == "0001" && M_ITEM == "0001")//正常班上班
                    {
                        if (MREGTList[0].MR_Mdep == "0002" && MREGTList[0].MR_Mdep == MP_Mdep)//營運事業一部A組
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].A_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].A_OTime_E.ToString());
                            break;
                        }
                        if (MREGTList[0].MR_Mdep == "0003" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                            break;
                        }
                        if (MREGTList[0].MR_Mdep == "0004" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                            break;
                        }
                        if (MREGTList[0].MR_Mdep == "0005" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            break;
                        }
                        if (MREGTList[0].MR_Mdep == "0006" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                            break;
                        }
                        if (MREGTList[0].MR_Mdep == "0007" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].B_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].B_OTime_E.ToString());
                            break;
                        }
                        if (MREGTList[0].MR_Mdep == "0008" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].B_OBTime_E.ToString());
                            break;
                        }
                        if (MREGTList[0].MR_Mdep == "0009" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                            break;
                        }
                        if (MREGTList[0].MR_Mdep == "0010" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());//有問題,再確認!!!
                            dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                            break;
                        }
                        if (MREGTList[0].MR_Mdep == "0011" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                            break;
                        }
                        if (MREGTList[0].MR_Mdep == "0012" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].D_OBTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].D_OBTime_E.ToString());
                            break;
                        }
                        if (MREGTList[0].MR_Mdep == "0013" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            break;
                        }
                        if (MREGTList[0].MR_Mdep == "0014" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            break;
                        }
                        if (MREGTList[0].MR_Mdep == "0015" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].E_OBTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].E_OBTime_E.ToString());
                            break;
                        }
                        if (MREGTList[0].MR_Mdep == "0016" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].E_OBTime_E.ToString());
                            break;
                        }
                        if (MREGTList[0].MR_Mdep == "0017" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].F_MTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].F_MTime_E.ToString());
                            break;
                        }
                        if (MREGTList[0].MR_Mdep == "0018" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                            break;
                        }
                        if (MREGTList[0].MR_Mdep == "0019" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].D_OBTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].D_OBTime_E.ToString());
                            break;
                        }
                        if (MREGTList[0].MR_Mdep == "0020" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].G_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].G_OTime_E.ToString());
                            break;
                        }
                        if (MREGTList[0].MR_Mdep == "0021" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                            break;
                        }
                        if (MREGTList[0].MR_Mdep == "0022" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].E_OBTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                            break;
                        }
                        if (MREGTList[0].MR_Mdep == "0023" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                            break;

                        }
                        if (MREGTList[0].MR_Mdep == "0024" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].E_OBTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                            break;

                        }

                    }
                    //早班
                    else if (MREGTList[0].MR_Item == "0002" && M_ITEM == "0002")//早班
                    {
                        if (MREGTList[0].MR_Mdep == "0002" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].G_MTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].G_MTime_E.ToString());
                            //break;
                        }
                        if (MREGTList[0].MR_Mdep == "0003" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                            //break;
                        }
                        if (MREGTList[0].MR_Mdep == "0004" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                            //break;
                        }
                        if (MREGTList[0].MR_Mdep == "0005" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0006" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].A_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].A_OTime_E.ToString());
                            //break;
                        }
                        if (MREGTList[0].MR_Mdep == "0007" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0008" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].B_MTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].B_NTime_E.ToString());
                            //break;
                        }
                        if (MREGTList[0].MR_Mdep == "0009" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                            //break;
                        }
                        if (MREGTList[0].MR_Mdep == "0010" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                            //break;
                        }
                        if (MREGTList[0].MR_Mdep == "0011" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                            //break;
                        }
                        if (MREGTList[0].MR_Mdep == "0012" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                            //break;
                        }
                        if (MREGTList[0].MR_Mdep == "0013" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0014" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0015" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].E_MTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].E_MTime_E.ToString());
                            //break;
                        }
                        if (MREGTList[0].MR_Mdep == "0016" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].E_MTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].E_MTime_E.ToString());
                        }
                        if (MREGTList[0].MR_Mdep == "0017" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].F_MTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].F_MTime_E.ToString());
                        }
                        if (MREGTList[0].MR_Mdep == "0018" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].D_MTime_S.ToString());
                        }
                        if (MREGTList[0].MR_Mdep == "0019" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                        }
                        if (MREGTList[0].MR_Mdep == "0020" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                        }
                        if (MREGTList[0].MR_Mdep == "0021" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                        }
                        if (MREGTList[0].MR_Mdep == "0022" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                        }
                        if (MREGTList[0].MR_Mdep == "0023" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                        }
                        if (MREGTList[0].MR_Mdep == "0024" && MREGTList[0].MR_Mdep == MP_Mdep)
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                        }
                    }
                    //晚班    
                    else if (MREGTList[0].MR_Item == "0003" && M_ITEM == "0003")//晚班
                    {
                        if (MREGTList[0].MR_Mdep == "0002")
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].G_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].G_OTime_E.ToString());
                        }
                        if (MREGTList[0].MR_Mdep == "0003")
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                        }
                        if (MREGTList[0].MR_Mdep == "0004")
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                        }
                        if (MREGTList[0].MR_Mdep == "0005")
                        {

                        }
                        if (MREGTList[0].MR_Mdep == "0006")
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].A_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].A_OTime_E.ToString());
                        }
                        if (MREGTList[0].MR_Mdep == "0007")
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0008")
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].B_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].B_OTime_E.ToString());
                        }
                        if (MREGTList[0].MR_Mdep == "0009")
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                        }
                        if (MREGTList[0].MR_Mdep == "0010")
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].C_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].C_OTime_E.ToString());
                        }
                        if (MREGTList[0].MR_Mdep == "0011")
                        {

                        }
                        if (MREGTList[0].MR_Mdep == "0012")
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].D_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].D_OTime_E.ToString());
                        }
                        if (MREGTList[0].MR_Mdep == "0013")
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0014")
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0015")
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                        }
                        if (MREGTList[0].MR_Mdep == "0016")
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                        }
                        if (MREGTList[0].MR_Mdep == "0017")
                        {

                        }
                        if (MREGTList[0].MR_Mdep == "0018")
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0019")
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].D_NTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].D_NTime_E.ToString());
                        }
                        if (MREGTList[0].MR_Mdep == "0020")
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0021")
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                        }
                        if (MREGTList[0].MR_Mdep == "0022")
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                        }
                        if (MREGTList[0].MR_Mdep == "0023")
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                        }
                        if (MREGTList[0].MR_Mdep == "0024")
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].E_NTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].E_NTime_E.ToString());
                        }
                    }
                    //假日班
                    else if (MREGTList[0].MR_Item == "0005" && M_ITEM == "0005")//假日,休假
                    {
                        if (MREGTList[0].MR_Mdep == "0002")
                        {

                        }
                        if (MREGTList[0].MR_Mdep == "0003")
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0004")
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].E_OTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].E_OTime_E.ToString());
                        }
                        if (MREGTList[0].MR_Mdep == "0005")
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0006")
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0007")
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0008")
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0009")
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0010")
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0011")
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0012")
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0013")
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0014")
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0015")
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].E_MTime_S.ToString());
                            //break;
                        }
                        if (MREGTList[0].MR_Mdep == "0016")
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0017")
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].F_NTime_S.ToString());
                            dt_Standard_E = DateTime.Parse(MCLASList[0].F_NTime_E.ToString());
                            //break;
                        }
                        if (MREGTList[0].MR_Mdep == "0018")
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0019")
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0020")
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0021")
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].E_MTime_S.ToString());
                            //break;
                        }
                        if (MREGTList[0].MR_Mdep == "0022")
                        {
                        }
                        if (MREGTList[0].MR_Mdep == "0023")
                        {
                            dt_Standard_S = DateTime.Parse(MCLASList[0].E_MTime_S.ToString());
                            //break;
                        }
                        if (MREGTList[0].MR_Mdep == "0024")
                        {
                        }
                    }
                    //dt_compard_S:上班打卡時間
                    //dt_compard_E:下班打卡時間
                    //取得與規定時間(dt_Standard_S)差多少時間
                    double E9secs = dt_compard_S.Subtract(dt_Standard_S).TotalSeconds;//共差了多久時間(秒)[遲到]
                    double E11secs = dt_compard_E.Subtract(dt_Standard_E).TotalSeconds;//共差了多久時間(秒)[早退]
                    if (E9secs > 0)
                    {
                        //if (!Holiday)
                        //{
                        //    E9++;//遲到+1(所選的時間內遲到的次數)[E9]
                        //}   //m++;
                    }
                    else
                    {
                        onTime++;//準時到達的次數+1
                                 //m++;
                                 //break;
                    }

                    if (E11secs < -1800)//這邊要修正,先命名-1800做測試用
                    {
                        E11++;//早退+1(所選的時間內早退的次數)[E11]
                              //m++;
                              //break;
                    }
                    else
                    {
                        onTime++;//準時到達的次數+1
                                 //m++;
                                 //break;
                    }
                    //m++;
                    break;
                }
                //m++;

            }

            //using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
            //{
            //    string getNameBY_UNUM = "SELECT [U_Name] FROM [HG].[dbo].[MUSER] WHERE U_Num='" + MP + "'";

            //    U_name = GetValueBYSQL(conn, getNameBY_UNUM);
            //}
            //mREGT02Entity.U_Name = U_name;
            //m++;
        }
        //m++;
        ////所選時段的統計結果
        //mREGT02Entity.E9 = E9.ToString();//遲到
        //mREGT02Entity.E11 = E11.ToString();//
        //MREGE02DataList.Add(mREGT02Entity);
        //mREGT02Entity.U_Name = MP;
        //mREGT02Entity.E9 = E9.ToString();//遲到
        //mREGT02Entity.E11 = E11.ToString();//早退
        //MREGE02DataList.Add(mREGT02Entity);
        m++;

        //MREGE02DataList.Add(mREGT02Entity);
        return status;//回傳出勤狀態
    }

    //private string GetMP_Mdep(string mP)
    //{
    //    string Mdep = "";
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
    //    StringBuilder sb = new StringBuilder();
    //    string commandText = "SELECT [U_MDEP] FROM [HG].[dbo].[MUSER] where U_Num='" + mP + "'";
    //    sb.Append(string.Format(paramFormat, connectionStrings, commandText));
    //    log.startWrite(sb.ToString(), className, methodName);
    //    //======================================================================================================================以上為log
    //    MCLASEntity mCLASEntity = new MCLASEntity();
    //    List<MCLASEntity> MCLASEntityList = new List<MCLASEntity>();
    //    //從資料庫把資料撈出來*************************************************************************************************start
    //    using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
    //    {
    //        return Mdep;
    //}
}