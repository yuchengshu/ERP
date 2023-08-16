using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Collections;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using System.Reflection;
using System.Web.UI;

/// <summary>
/// reportServiceMCMEB09 的摘要描述
/// </summary>
public class reportServiceMCMEB09 : Page
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";
    //引用時不用再NEW
    private static reportServiceMCMEB09 _instance = new reportServiceMCMEB09();
    public static reportServiceMCMEB09 Instance
    {
        get
        {
            return _instance;
        }
    }
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public reportServiceMCMEB09()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
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

    //20221107進度!!
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
        try
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
            adapter.Fill(dt);//取出所有會場編號
                             //int V_ID_Count = dt.Rows.Count;
                             //List<SRMVENUEntity> SRMVENUEntityList = new List<SRMVENUEntity>();
                             //for (int i = 0; i < V_ID_Count; i++)
                             //{
                             //    string V_ID=dt[i][0].
                             //}
        }
        catch (Exception ex)
        {
            string errorCMD=cmd.CommandText;
            throw;
        }
        //SqlDataAdapter adapter = new SqlDataAdapter();
        //adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
        //adapter.Fill(dt);//取出所有會場編號
        //                 //int V_ID_Count = dt.Rows.Count;
        //                 //List<SRMVENUEntity> SRMVENUEntityList = new List<SRMVENUEntity>();
        //                 //for (int i = 0; i < V_ID_Count; i++)
        //                 //{
        //                 //    string V_ID=dt[i][0].
        //                 //}
        foreach (DataRow row in dt.Rows)
        {
            //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
            value = row[0].ToString();
        }
        conn.Close();
        //}
        return value;
    }

    //20221107進度!!
    public List<MCMEB09Entity> getReportHandlerMCMEB09DataList(string MP, string Year, string Month)
    {
        int Month_Int = int.Parse(Month);
        int Day_Start = 1;
        int Day_End = 0;
        if (Month_Int == 1 || Month_Int == 3 || Month_Int == 5 || Month_Int == 7 || Month_Int == 8 || Month_Int == 10 || Month_Int == 12)// | Month_Int = 1 | Month_Int = 1 | Month_Int = 1 | Month_Int = 1 | Month_Int = 1 | Month_Int = 1)
        {
            Day_End = 31;
        }
        else
        {
            Day_End = 30;
        }

        if (Month_Int == 2)
        {
            int Year_Int = int.Parse(Year);
            if (Year_Int % 400 == 0 || Year_Int % 4 == 0 && Year_Int % 100 != 0)
            //閏年的判斷條件格式
            // 如果 年能被400整除 或者 年能被4整除 並且年不能被100整除。
            {
                Day_End = 29;
                //Console.WriteLine("是閏年，2月當月的天數有29天");
            }
            else
            {
                Day_End = 28;
                //Console.WriteLine("是平年，2月當月的天數有28天");
            }

        }
        string Date_S = Year + "-" + Month_Int + "-" + Day_Start;
        //20221108加入閏年2月的判斷
        string Date_E = Year + "-" + Month_Int + "-" + Day_End;
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite(" 'MR_DateY' : " + MR_DateY + " 'MR_DateM' : " + MR_DateM + " 'MP' : " + MP, className, methodName);
        //由分析師編號取得TID
        //select t_id from WAnalysts where U_Num='EZ000001'
        List<MCMEB09Entity> mcmEB09DataListList = new List<MCMEB09Entity>();
        string GetTIDfromU_Num = "";
        string GetChfromU_Num = "";
        //if (MP = context.Request["MP"];//如果為空值(NULL),則查詢所有人)
        string T_ID = "";
        string Ch = "";//分析師
        //查詢全部的分析師
        //",EZ000001,D0606201,MP888888,D9406012,D0312152,A0501042,D0808292,D0903022,D0903023,D0808291,D0704021,D0602021,D1102071,D1102072,D0903021,D0301063,D1101131,D1012011,D0509213,D0808295,D0110015,D1101132,"
        DataTable dt2 = new DataTable();
        if (MP.Length > 30)//選擇[不限]項目
        {
            string[] MPS;
            //String spearator="";
            //spearator = ",";
            //string[] MPS= MP.Split(", ");
            string authors = "Mahesh Chand, Henry He, Chris Love, Raj Beniwal, Praveen Kumar";
            //char[] delimiterChars = { ' ', ',', '.', ':', '\t' };
            char[] delimiterChars = { ',' };
            string[] authorsList = MP.Split(delimiterChars);//全部的分析師
            //DataTable dt2 = new DataTable();
            using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
            {
                foreach (var item in authorsList)
                {
                    //item:分析師員工編號
                    if (item != "" && item != "EZ000001")
                    {
                        GetTIDfromU_Num = "select t_id from WAnalysts where U_Num='" + item + "'";
                        GetChfromU_Num = "select Ch from WAnalysts where U_Num='" + item + "'";
                        if (item == "D0312152")//王瞳
                        {
                            GetChfromU_Num = "select Ch from WAnalysts where U_Num='D0312152' or U_Num='D0312153'";
                        }
                        if (MP == "")//不限
                        {
                            GetChfromU_Num = "select Ch from WAnalysts where U_Num='D0312152' or U_Num='D0312153'";
                        }
                        T_ID = GetValueBYSQL(conn, GetTIDfromU_Num);
                        Ch = GetValueBYSQL(conn, GetChfromU_Num).Trim();
                        MCMEB09Entity mcmEB09Data_ = new MCMEB09Entity();
                        string GetWMEDIA_Count_SQL = "";
                        string GetWMEDIA_Count_SQL_NUMBER = "";
                        int WMEDIA_Count_AVG = 0;
                        int WMEDIA_Count = 0;
                        if (T_ID != "")
                        {

                            GetWMEDIA_Count_SQL = "SELECT  ISNULL(SUM(CAST(hot_count AS INT)), 0) FROM [HG].[dbo].[WMEDIA] a where  a.P_id =" + T_ID + " and M_Date Between '" + Date_S + "' and  '" + Date_E + "'";

                            GetWMEDIA_Count_SQL_NUMBER = "SELECT COUNT(distinct M_id) FROM [HG].[dbo].[WMEDIA] a where  a.P_id =" + T_ID + " and M_Date Between '" + Date_S + "' and  '" + Date_E + "'";
                            WMEDIA_Count = int.Parse(GetValueBYSQL(conn, GetWMEDIA_Count_SQL));
                            int WMEDIA_Count_SQL_NUMBER_int = int.Parse(GetValueBYSQL(conn, GetWMEDIA_Count_SQL_NUMBER));
                            if (WMEDIA_Count_SQL_NUMBER_int != 0)
                            {
                                WMEDIA_Count_AVG = WMEDIA_Count / WMEDIA_Count_SQL_NUMBER_int;
                            }

                            //int WMEDIA_Count = int.Parse(GetValueBYSQL(conn, GetWMEDIA_Count_SQL));
                            //int WMEDIA_Count_SQL_NUMBER_int = int.Parse(GetValueBYSQL(conn, GetWMEDIA_Count_SQL_NUMBER));
                            //if (WMEDIA_Count_SQL_NUMBER_int != 0)
                            //{
                            //    WMEDIA_Count_AVG = WMEDIA_Count / WMEDIA_Count_SQL_NUMBER_int;
                            //}
                            //--求瀏覽次數(Youtube - 總點閱):WVideo_Count
                            //SELECT  ISNULL(SUM(CAST(hot_count AS INT)),0) FROM [HG].[dbo].[WVideo] a where  a.P_id=83 and  V_Date Between '2022-11-01' and  '2022-11-30'
                            string GetWVideo_Count_SQL = "";
                            string GetWVideo_Count_SQL_NUMBER = "";
                            int WVideo_Count_AVG = 0;
                            //Youtube - 總點閱(總共點擊次數)
                            GetWVideo_Count_SQL = "SELECT  ISNULL(SUM(CAST(hot_count AS INT)), 0) FROM [HG].[dbo].[WVideo] a where  a.P_id =" + T_ID + " and V_Date Between '" + Date_S + "' and  '" + Date_E + "'"+ "AND (v_channel='News' or v_channel='Topic' or v_channel='Trend') and del_tag='0' and open_tag='0'";
                            //Youtube - 總點閱(影片數目)
                            GetWVideo_Count_SQL_NUMBER = "SELECT COUNT(distinct V_id) FROM[HG].[dbo].[WVideo] a where  a.P_id = " + T_ID + " and V_Date Between '" + Date_S + "' and  '" + Date_E + "' and del_tag='0' and open_tag='0'";
                            int WVideo_Count = int.Parse(GetValueBYSQL(conn, GetWVideo_Count_SQL).ToString());
                            int Video_Count_SQL_NUMBER_int = int.Parse(GetValueBYSQL(conn, GetWVideo_Count_SQL_NUMBER));
                            if (Video_Count_SQL_NUMBER_int != 0)
                            {
                                WVideo_Count_AVG = WVideo_Count / Video_Count_SQL_NUMBER_int;
                            }
                            //string WVideo_Count_SQL_NUMBER_string = GetValueBYSQL(conn, GetWVideo_Count_SQL_NUMBER);//
                            //---求瀏覽次數(文章 - 總點閱):WCRITIQUE_Count
                            //SELECT  ISNULL(SUM(CAST(hot_count AS INT)),0) FROM [HG].[dbo].[WCRITIQUE] a where  a.P_id=83 and C_Date Between '2022-11-01' and  '2022-11-30'
                            string GetWCRITIQUE_Count_SQL = "";
                            string GetWCRITIQUE_Count_SQL_NUMBER = "";
                            int WCRITIQUE_Count_AVG = 0;
                            GetWCRITIQUE_Count_SQL = "SELECT  ISNULL(SUM(CAST(hot_count AS INT)), 0) FROM [HG].[dbo].[WCRITIQUE] a where  a.P_id =" + T_ID + " and C_Date Between '" + Date_S + "' and  '" + Date_E + "'";
                            GetWCRITIQUE_Count_SQL_NUMBER = "SELECT  COUNT(distinct c_id) FROM [HG].[dbo].[WCRITIQUE] a where  a.P_id =" + T_ID + " and C_Date Between '" + Date_S + "' and  '" + Date_E + "'";
                            int WCRITIQUE_Count = int.Parse(GetValueBYSQL(conn, GetWCRITIQUE_Count_SQL).ToString());
                            int WCRITIQUE_Count_SQL_NUMBER_int = int.Parse(GetValueBYSQL(conn, GetWCRITIQUE_Count_SQL_NUMBER));
                            if (WCRITIQUE_Count_SQL_NUMBER_int != 0)
                            {
                                WCRITIQUE_Count_AVG = WCRITIQUE_Count / WCRITIQUE_Count_SQL_NUMBER_int;
                            }

                            if (dt2.Rows.Count < 1)
                            {
                                dt2.Columns.Add("Ch");//分析師
                                dt2.Columns.Add("P_ID");//分析師員工編號
                                dt2.Columns.Add("WMEDIA_Count");//廣播-總點閱
                                dt2.Columns.Add("WMEDIA_Count_Avg");//廣播-總點閱(平均)
                                dt2.Columns.Add("WVideo_Count");//Youtube - 總點閱
                                dt2.Columns.Add("WVideo_Count_Avg");//Youtube - 總點閱(平均)
                                dt2.Columns.Add("WCRITIQUE_Count");//文章 - 總點閱
                                dt2.Columns.Add("WCRITIQUE_Count_Avg");//文章 - 總點閱(平均)
                            }
                            DataRow row;
                            row = dt2.NewRow();
                            row["Ch"] = Ch;
                            row["P_ID"] = item;//分析師員工編號
                            row["WMEDIA_Count"] = WMEDIA_Count;
                            row["WVideo_Count"] = WVideo_Count;
                            row["WCRITIQUE_Count"] = WCRITIQUE_Count;
                            row["WMEDIA_Count_Avg"] = WMEDIA_Count_AVG.ToString();
                            row["WVideo_Count_Avg"] = WVideo_Count_AVG.ToString();
                            row["WCRITIQUE_Count_Avg"] = WCRITIQUE_Count_AVG.ToString();
                            dt2.Rows.Add(row);
                        }
                        else
                        {
                            //D0808292
                            Page.RegisterClientScriptBlock("AlertMsg", "<script language='javascript'>alert('" + item + "')");
                        }
                    }
                }
            }
            mcmEB09DataListList = ConvertToList<MCMEB09Entity>(dt2);
            return mcmEB09DataListList;
        }
        else if (MP != "null" && MP != "")
        {
            //20221108如果下拉式選單選到[請選擇]則MP=""
            GetTIDfromU_Num = "select t_id from WAnalysts where U_Num='" + MP + "'";
            GetChfromU_Num = "select Ch from WAnalysts where U_Num='" + MP + "'";
            if (MP == "D0312152")//王瞳
            {
                GetChfromU_Num = "select Ch from WAnalysts where U_Num='D0312152' or U_Num='D0312153'";
            }
            if (MP == "")//不限
            {
                GetChfromU_Num = "select Ch from WAnalysts where U_Num='D0312152' or U_Num='D0312153'";
            }
        }

        DataTable dt = new DataTable();
        //if (!IsPostBack)
        //{
        if (MP != "null")
        {
            //if (T_ID != "")
            //{
            using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
            {
                T_ID = GetValueBYSQL(conn, GetTIDfromU_Num);
                Ch = GetValueBYSQL(conn, GetChfromU_Num).Trim();
                //int days = DateTime.DaysInMonth(int.Parse(MR_DateY), int.Parse(MR_DateM));
                //List<MediaClickStatisticsEntity> mcseList = MUSERhgDao.Instance.getAnalystTidData(MR_DateY, MR_DateM, MP);//<==========
                MCMEB09Entity mcmEB09Data = new MCMEB09Entity();
                //mcmEB09DataListList.Add(mcmEB09Data);
                //--求瀏覽次數(廣播-總點閱):WMEDIA_Count
                //SELECT  ISNULL(SUM(CAST(hot_count AS INT)),0) FROM [HG].[dbo].[WMEDIA] a where  a.P_id=83 and M_Date Between '2022-11-01' and  '2022-11-30'
                string GetWMEDIA_Count_SQL = "";
                string GetWMEDIA_Count_SQL_NUMBER = "";
                int WMEDIA_Count_AVG = 0;
                GetWMEDIA_Count_SQL = "SELECT  ISNULL(SUM(CAST(hot_count AS INT)), 0) FROM [HG].[dbo].[WMEDIA] a where  a.P_id =" + T_ID + " and M_Date Between '" + Date_S + "' and  '" + Date_E + "'";
                GetWMEDIA_Count_SQL_NUMBER = "SELECT COUNT(distinct M_id) FROM [HG].[dbo].[WMEDIA] a where  a.P_id =" + T_ID + " and M_Date Between '" + Date_S + "' and  '" + Date_E + "'";
                int WMEDIA_Count = int.Parse(GetValueBYSQL(conn, GetWMEDIA_Count_SQL));
                int WMEDIA_Count_SQL_NUMBER_int = int.Parse(GetValueBYSQL(conn, GetWMEDIA_Count_SQL_NUMBER));
                if (WMEDIA_Count_SQL_NUMBER_int != 0)
                {
                    WMEDIA_Count_AVG = WMEDIA_Count / WMEDIA_Count_SQL_NUMBER_int;
                }
                //--求瀏覽次數(Youtube - 總點閱):WVideo_Count
                //SELECT  ISNULL(SUM(CAST(hot_count AS INT)),0) FROM [HG].[dbo].[WVideo] a where  a.P_id=83 and  V_Date Between '2022-11-01' and  '2022-11-30'
                string GetWVideo_Count_SQL = "";
                string GetWVideo_Count_SQL_NUMBER = "";
                int WVideo_Count_AVG = 0;
                GetWVideo_Count_SQL = "SELECT  ISNULL(SUM(CAST(hot_count AS INT)), 0) FROM [HG].[dbo].[WVideo] a where  a.P_id =" + T_ID + " and V_Date Between '" + Date_S + "' and  '" + Date_E + "'";
                GetWVideo_Count_SQL_NUMBER = "SELECT COUNT(distinct V_id) FROM[HG].[dbo].[WVideo] a where  a.P_id = " + T_ID + " and V_Date Between '" + Date_S + "' and  '" + Date_E + "'";
                int WVideo_Count = int.Parse(GetValueBYSQL(conn, GetWVideo_Count_SQL).ToString());
                int Video_Count_SQL_NUMBER_int = int.Parse(GetValueBYSQL(conn, GetWVideo_Count_SQL_NUMBER));
                if (Video_Count_SQL_NUMBER_int != 0)
                {
                    WVideo_Count_AVG = WVideo_Count / Video_Count_SQL_NUMBER_int;
                }
                //string WVideo_Count_SQL_NUMBER_string = GetValueBYSQL(conn, GetWVideo_Count_SQL_NUMBER);//
                //---求瀏覽次數(文章 - 總點閱):WCRITIQUE_Count
                //SELECT  ISNULL(SUM(CAST(hot_count AS INT)),0) FROM [HG].[dbo].[WCRITIQUE] a where  a.P_id=83 and C_Date Between '2022-11-01' and  '2022-11-30'
                string GetWCRITIQUE_Count_SQL = "";
                string GetWCRITIQUE_Count_SQL_NUMBER = "";
                int WCRITIQUE_Count_AVG = 0;
                GetWCRITIQUE_Count_SQL = "SELECT  ISNULL(SUM(CAST(hot_count AS INT)), 0) FROM [HG].[dbo].[WCRITIQUE] a where  a.P_id =" + T_ID + " and C_Date Between '" + Date_S + "' and  '" + Date_E + "'";
                GetWCRITIQUE_Count_SQL_NUMBER = "SELECT  COUNT(distinct c_id) FROM [HG].[dbo].[WCRITIQUE] a where  a.P_id =" + T_ID + " and C_Date Between '" + Date_S + "' and  '" + Date_E + "'";
                int WCRITIQUE_Count = int.Parse(GetValueBYSQL(conn, GetWCRITIQUE_Count_SQL).ToString());
                int WCRITIQUE_Count_SQL_NUMBER_int = int.Parse(GetValueBYSQL(conn, GetWCRITIQUE_Count_SQL_NUMBER));
                if (WCRITIQUE_Count_SQL_NUMBER_int != 0)
                {
                    WCRITIQUE_Count_AVG = WCRITIQUE_Count / WCRITIQUE_Count_SQL_NUMBER_int;
                }
                DataRow row;

                dt.Columns.Add("Ch");//分析師
                dt.Columns.Add("WMEDIA_Count");//廣播-總點閱
                dt.Columns.Add("WMEDIA_Count_Avg");//廣播-總點閱(平均)
                dt.Columns.Add("WVideo_Count");//Youtube - 總點閱
                dt.Columns.Add("WVideo_Count_Avg");//Youtube - 總點閱(平均)
                dt.Columns.Add("WCRITIQUE_Count");//文章 - 總點閱
                dt.Columns.Add("WCRITIQUE_Count_Avg");//文章 - 總點閱(平均)
                row = dt.NewRow();
                row["Ch"] = Ch;
                row["WMEDIA_Count"] = WMEDIA_Count;
                row["WVideo_Count"] = WVideo_Count;
                row["WCRITIQUE_Count"] = WCRITIQUE_Count;
                row["WMEDIA_Count_Avg"] = WMEDIA_Count_AVG.ToString();
                row["WVideo_Count_Avg"] = WVideo_Count_AVG.ToString();
                row["WCRITIQUE_Count_Avg"] = WCRITIQUE_Count_AVG.ToString();
                dt.Rows.Add(row);
            }
            //}
        }
        //這裡可能需要修改
        if (dt.Rows.Count != 0)
        {
            mcmEB09DataListList = ConvertToList<MCMEB09Entity>(dt);
        }
        else if (dt2.Rows.Count != 0)
        {
            mcmEB09DataListList = ConvertToList<MCMEB09Entity>(dt2);
        }
        return mcmEB09DataListList;
    }
    public List<MediaClickStatisticsEntity> getMediaClickStatistics(string MR_DateY, string MR_DateM, string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'MR_DateY' : " + MR_DateY + " 'MR_DateM' : " + MR_DateM + " 'MP' : " + MP, className, methodName);

        int days = DateTime.DaysInMonth(int.Parse(MR_DateY), int.Parse(MR_DateM));
        List<MediaClickStatisticsEntity> mcseList = MUSERhgDao.Instance.getAnalystTidData(MR_DateY, MR_DateM, MP);//<==========
        MediaClickStatisticsEntity mcse = new MediaClickStatisticsEntity();
        mcse.U_Name = "總計";
        mcseList.Add(mcse);
        List<MediaDataEntity> mdeList = WMediaHgDao.Instance.getMediaData(MR_DateY, MR_DateM);
        List<VideoDataEntity> vdeList = WVideoHgDao.Instance.getVideoData(MR_DateY, MR_DateM);
        List<CritiqueDataEntity> cdeList = WCritiqueHgDao.Instance.getCritiqueData(MR_DateY, MR_DateM);
        int lastCount = mcseList.Count - 1;
        for (var i = 0; i < mcseList.Count; i++)
        {
            for (var m = 0; m < mdeList.Count; m++)
            {
                if (mcseList[i].t_id == mdeList[m].P_id)
                {
                    mcseList[i].mediaCount += mdeList[m].hot_count;
                    mcseList[lastCount].mediaCount += mdeList[m].hot_count;
                    mcseList[i].mediaDays += 1;
                }
            }
            for (var v = 0; v < vdeList.Count; v++)
            {
                if (mcseList[i].t_id == vdeList[v].P_id)
                {
                    mcseList[i].videoCount += vdeList[v].hot_count;
                    mcseList[lastCount].videoCount += vdeList[v].hot_count;
                    mcseList[i].videoDays += 1;
                }
            }
            for (var c = 0; c < cdeList.Count; c++)
            {
                if (mcseList[i].t_id == cdeList[c].P_id)
                {
                    mcseList[i].critiqueCount += cdeList[c].hot_count;
                    mcseList[lastCount].critiqueCount += cdeList[c].hot_count;
                    mcseList[i].critiqueDays += 1;
                }
            }
        }
        for (var i = 0; i < mcseList.Count; i++)
        {
            if (mcseList[i].mediaDays != 0)
            {
                mcseList[i].dailyMediaCount = mcseList[i].mediaCount / mcseList[i].mediaDays;
            }
            else
            {
                mcseList[i].dailyMediaCount = 0;
            }

            if (mcseList[i].videoDays != 0)
            {
                mcseList[i].dailyVideoCount = mcseList[i].videoCount / mcseList[i].videoDays;
            }
            else
            {
                mcseList[i].dailyVideoCount = 0;
            }

            if (mcseList[i].critiqueDays != 0)
            {
                mcseList[i].dailyCritiqueCount = mcseList[i].critiqueCount / mcseList[i].critiqueDays;
            }
            else
            {
                mcseList[i].dailyCritiqueCount = 0;
            }



        }

        log.endWrite("'mcseList' : " + mcseList.ToString(), className, methodName);
        return mcseList;
    }

    public List<ClickDetailEntity> getClickDetail(string type, string P_ID, string MR_DateY, string MR_DateM)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'type' : " + type + " 'P_ID' : " + P_ID + " 'MR_DateY' : " + MR_DateY + " 'MR_DateM' : " + MR_DateM, className, methodName);
        string T_ID = string.Empty;
        if (P_ID.Length > 3)
        {
            using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
            {
                string sql = "Select T_id   FROM [HG].[dbo].[WAnalysts] where U_Num='" + P_ID + "'";
                T_ID = GetValueBYSQL(conn, sql);
            }
        }
        else
        {
            T_ID = P_ID;
        }
        List<ClickDetailEntity> cdeList = null;
        switch (type)
        {
            case "media":
                cdeList = WMediaHgDao.Instance.getClickDetail(MR_DateY, MR_DateM, T_ID);//<==========
                break;
            case "video":
                cdeList = WVideoHgDao.Instance.getClickDetail(MR_DateY, MR_DateM, T_ID);//<==========
                break;
            case "critique":
                cdeList = WCritiqueHgDao.Instance.getClickDetail(MR_DateY, MR_DateM, T_ID);//<==========
                break;
        }


        log.endWrite("'cdeList' : " + cdeList.ToString(), className, methodName);
        return cdeList;
    }


}