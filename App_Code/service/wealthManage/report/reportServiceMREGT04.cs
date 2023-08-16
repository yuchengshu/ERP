using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Collections;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

/// <summary>
/// reportService 的摘要描述
/// </summary>
public class reportServiceMREGT04
{
    //引用時不用再NEW
    private static reportServiceMREGT04 _instance = new reportServiceMREGT04();
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";
    public static reportServiceMREGT04 Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public reportServiceMREGT04()
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
        DataSet ds = new DataSet();
        //conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
        //conn.Open();
        //SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        //cmd.CommandText = tsql;
        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
        if (cmd.Connection.State.ToString() == "Closed")
            cmd.Connection.Open();

        adapter.Fill(dt);//取出所有會場編號
        //foreach (DataRow datarow in ds.Tables[""].Rows)
        //{
        //    //每個資料列的內容
        //}
        //int V_ID_Count = dt.Rows.Count;
        foreach (DataRow row in dt.Rows)
        {
            //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
            value = row[0].ToString();
        }
        //List<SRMVENUEntity> SRMVENUEntityList = new List<SRMVENUEntity>();
        //for (int i = 0; i < V_ID_Count; i++)
        //{
        //    string V_ID = dt[i][0].ToString();
        //                           }
        //foreach (DataRow row in dt.Rows)
        //{
        //    //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
        //    value = row[0].ToString();
        //}
        // conn.Close();
        // }
        /*
         *  adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
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
         */
        return value;
    }


    //傳回所指定年份中指定月份的天數:
    //public static int DaysInMonth (int year, int month);
    //曆年制算法
    //取得可休年假表資訊
    //曆年制

    public List<MREGT04Entity> getMREGT04List(string Select_Employ, string Select_Dept, string StartDate, string EndDate)
    {
        //加入日期條件
        //StartDate:[08/01/2022],EndDate:[01/01/2023](月/日/年)
        //姓名 部門 到職日 離職日 可休年假 已休年假(天) 未休年假 詳細 
        //依據員工編號取得到職日(SlimDate)
        string GetNameByUNUM = "SELECT [U_Name] FROM [HG].[dbo].[MUSER] Where U_Num='" + Select_Employ + "'";//姓名
        string GetMDEPByUNUM = "SELECT [U_MDEP] FROM [HG].[dbo].[MUSER] Where U_Num='" + Select_Employ + "'";//部門
        string GetSlimDateByUNUM = "SELECT [SlimDate] FROM [HG].[dbo].[MUSER] Where U_Num='" + Select_Employ + "'";//到職日期
        string GetLeaveDateByUNUM = "SELECT [LeaveDate] FROM [HG].[dbo].[MUSER] Where U_Num='" + Select_Employ + "'";//離職日期
        //依據員工編號取得員工部門(U_MDEP)
        string GetU_MDEPByUNUM = "SELECT [U_MDEP] FROM [HG].[dbo].[MUSER] Where U_Num='" + Select_Employ + "'";
        MREGT04Entity mREGT04Entity = new MREGT04Entity();
        List<MREGT04Entity> mREGT04EntityList = new List<MREGT04Entity>();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            ////DateTime dt1 = DateTime.Parse(GetValueBYSQL(conn, GetSlimDateByUNUM).ToString("yy/MM/dd")
            var Today = DateTime.Parse(DateTime.Now.ToString("yyy/MM/dd"));//取得今天年月日
            var U_Name = GetValueBYSQL(conn, GetNameByUNUM);//姓名
            var MDEP = GetValueBYSQL(conn, GetMDEPByUNUM);//部門代碼
            string GetMDEPNameByMDEP = "SELECT DDESC  FROM [HG].[dbo].[MITEM] Where mitcode='DEPAR' AND ditcode='" + MDEP + "'";
            var MDEPName = GetValueBYSQL(conn, GetMDEPNameByMDEP);//部門名稱
            var SlimDate = DateTime.Parse(GetValueBYSQL(conn, GetSlimDateByUNUM));//到職日期
            string LeaveDate = "";
            if (GetValueBYSQL(conn, GetLeaveDateByUNUM) != "")
            {
                 LeaveDate = DateTime.Parse(GetValueBYSQL(conn, GetLeaveDateByUNUM)).ToString();//離職日期
            }
            else
            {
                 LeaveDate = "在職中";
            }
            string onduty2 = StartDate;//textBox1.Text.Trim();
            //string Today_String = Today;//textBox2.Text.Trim();
            var onduty = DateTime.Parse(onduty2.Trim());
            //var onduty_dt = DateTime.Parse(SlimDate);
            var onduty_dt = SlimDate;
            //var Today = DateTime.Parse(Today_String);
            var SlimDate_Dt = SlimDate;//DateTime.Parse(SlimDate);//到職日期
            //var SlimDate_String = DateTime.Parse(SlimDate_Dt).ToString();//到職日期
            var StartYear = onduty_dt.Year;//到職日的年份
            var StartYear_Month = onduty_dt.Month;//到職日的月份
            int GetDays = DateTime.DaysInMonth(StartYear, StartYear_Month);//到職日的當月有幾天
            var TDate = DateTime.Parse(StartYear + "/1/1");
            var Y1_SlimDate = onduty_dt.Subtract(TDate);//計算是否滿半年(和當年年初相比)
            var Y2_SlimDate_int = int.Parse(Today.Subtract(SlimDate_Dt).Days.ToString());//計算是否滿半年(到執行當天為止)[報到日到現在共經過了幾天][天數和原本ERP系統相同!!!!](從報到到今天為止共經過幾天)
            //int Y2_SlimDate_int=
            var Today_Year = Today.Year;
            var Today_Month = Today.Month;
            var Today_Day = Today.Day;
            var StartMonth = SlimDate.Month;
            var StartDay = SlimDate.Day;
            //var EndYear = DateTime.Parse(EndDate).Year;
            //var EndMonth = DateTime.Parse(EndDate).Month;
            //var EndDay = DateTime.Parse(EndDate).Day;
            //計算到職月份天數:DateTime.DaysInMonth(要查詢的年份,要查詢的月份);
            //計算剩餘月份
            var M1 = StartYear_Month;
            var MT = M1 - 1;

            //計算累積年資年月日
            //TY:累積年資(年)
            int TY = onduty.Year - TDate.Year - 1;
            if (TY < 0)
            {
                TY = 0;
            }
            int TM = 12 - StartMonth;
            int TD = GetDays - StartDay + 1;
            int DT = GetDays - TD;
            string SY = string.Empty;
            string SNY = string.Empty;
            //判斷所屬年假天數
            //string test = textBox1.Text;
            //DateTime dt_test = DateTime.Parse(test);
            //var test2 = dt_test.Subtract(onduty_dt).Days.ToString();//天
            //label1.Text = test;//在職天數
            ////目前日期
            //string Now_ = textBox2.Text.Trim();
            DateTime Now_dt = DateTime.Today;//目前日期
            var Y2_SlimDate_int_ = int.Parse(Now_dt.Subtract(onduty_dt).Days.ToString());//計算是否滿半年(到執行當天為止)[報到日到現在共經過了幾天][天數和原本ERP系統相同!!!!](從報到到今天為止共經過幾天)
            ///
            //string SY = string.Empty;
            //string SNY = string.Empty;
            //判斷所屬年假天數
            if (TY == 0)
            {
                SY = "3";
            }
            else if (TY == 1)
            {
                SY = "7";
                SNY = "10";
            }
            else if (TY == 2)
            {
                SY = "10";
                SNY = "14";
            }
            else if ((TY >= 3) & (TY <= 4))
            {
                SY = "14";
                SNY = "14";
            }
            else if ((TY > 4) & (TY < 5))
            {
                SY = "14";
                SNY = "15";
            }
            else if ((TY >= 5) && (TY < 9))
            {
                SY = "15";
                SNY = "15";

            }
            else if ((TY >= 9) && (TY < 10))
            {
                SY = "15";
                SNY = "16";
            }
            else if ((TY >= 10) && (TY <= 25))
            {
                SY = (TY + 6).ToString();
            }
            else if (TY < 25)
            {
                SY = 30.ToString();
            }
            
            int Para1 = Y2_SlimDate_int;//在職天數
            var Para2 = Select_Employ.ToString();
            double adverdays = 0;//年假天數(可休年假)
            if ((MDEP == "0005") && (Para2 == "B0301241") && Para1 <= 183)
            {
                adverdays = 0;
            }
            else if (TY <= 0 && TM <= 6 && Para1 > 183)//小於半年
            {
                //Math.round(0.5, MidpointRounding.AwayFromZero);
                float adverdays_ = int.Parse(SY) + (7 - ((MT + (DT / GetDays)) / 12 * 7));
                adverdays = Math.Round(adverdays_);
            }
            else if (TY <= 0 && TM > 6)//大於半年
            {
                float adverdays_ = (3 + DT / GetDays) / 6 * 3 + (7 - (3 + DT / GetDays) / 12 * 7);
                //int.Parse(SY) + (7 - (MT + (DT / GetDays)) / 12 * 7);
                adverdays = Math.Round(adverdays_);
            }
            else if (TY >= 1 && TM <= 10)//1~10年
            {
                //float adverdays_ = int.Parse(SY) + (7 - (MT + (DT / GetDays)) / 12 * 7);
                float adverdays_ = (MT + (DT / GetDays)) / 12 * int.Parse(SY) + (int.Parse(SNY) - ((MT + (DT / GetDays)) / 12 * int.Parse(SNY)));
                adverdays = Math.Round(adverdays_);
            }
            else if (TM >= 10)//10年後
            {
                float adverdays_ = (MT + DT / GetDays) / 12 * int.Parse(SY) + ((int.Parse(SY) + 1) - (MT + DT / GetDays) / 12 * int.Parse((SY + 1)));//+ ((SY+1))-(MT+DT/GetDays)/ 12 * 7);
                adverdays = Math.Round(adverdays_);
            }
            else
            {
                adverdays = 0;
            }
            //mREGT04Entity.adverdays = adverdays.ToString();//可休年假天數
            mREGT04Entity.U_Name = U_Name;//姓名
            mREGT04Entity.Dept = MDEPName;//部門名稱
            mREGT04Entity.SlimDate = SlimDate.ToString();//到職日期
            mREGT04Entity.LeaveDate = LeaveDate.ToString();//離職日期
            mREGT04Entity.adverdays = adverdays.ToString();//可休年假
            MEXCUhgDao mEXCUhgDao = new MEXCUhgDao();
            var EX_Day= mEXCUhgDao.GetEX_DayFromMEXCUbyTYPE(Select_Employ, StartDate, EndDate, "0001");//取得已請年假(這裡需要修改)
            string GetAnnualHoliday_EXDay = "select ex_day From MEXCU where EX_User='" + Select_Employ + "' and EX_Status='6'";
            string GetAnnualHoliday_EXHour = "select ex_Hour From MEXCU where EX_User='" + Select_Employ + "' and EX_Status='6'";
            string AnnualHoliday_EXHour = GetValueBYSQL(conn, GetAnnualHoliday_EXHour);
            string AnnualHoliday_EXDay = GetValueBYSQL(conn, GetAnnualHoliday_EXDay);
            var E1 = int.Parse(AnnualHoliday_EXDay) * 8 + int.Parse(AnnualHoliday_EXHour);
            mREGT04Entity.adverdays_day = (E1 / 8).ToString();//已休年假(天)
            mREGT04Entity.adverdays_unuse = (int.Parse(mREGT04Entity.adverdays) - int.Parse(mREGT04Entity.adverdays_day)).ToString();//未休年假
            mREGT04Entity.adverdays_detail = "在職天數:" + Y2_SlimDate_int_.ToString() + "在職:" + TY + "年" + TM + "月" + TD + "日";//詳細
            mREGT04EntityList.Add(mREGT04Entity);
        }
        return mREGT04EntityList;
    }


    public static TimeSpan toResult(string d1, string d2)
    {
        try
        {
            DateTime date1 = DateTime.Parse(d1);
            DateTime date2 = DateTime.Parse(d2);
            return toResult(date1, date2);
        }
        catch
        {
            throw new Exception("字符串参数不正确!");
        }
    }
    /// <summary>
    /// 计算日期间隔
    /// </summary>
    /// <param name="d1">要参与计算的其中一个日期</param>
    /// <param name="d2">要参与计算的另一个日期</param>
    /// <returns>一个表示日期间隔的TimeSpan类型</returns>
    public static TimeSpan toResult(DateTime d1, DateTime d2)
    {
        TimeSpan ts;
        if (d1 > d2)
        {
            ts = d1 - d2;
        }
        else
        {
            ts = d2 - d1;
        }
        return ts;
    }

    /// <summary>
    /// 计算日期间隔
    /// </summary>
    /// <param name="d1">要参与计算的其中一个日期字符串</param>
    /// <param name="d2">要参与计算的另一个日期字符串</param>
    /// <param name="drf">决定返回值形式的枚举</param>
    /// <returns>一个代表年月日的int数组，具体数组长度与枚举参数drf有关</returns>
    public static int[] toResult(string d1, string d2, diffResultFormat drf)
    {
        try
        {
            DateTime date1 = DateTime.Parse(d1);
            DateTime date2 = DateTime.Parse(d2);
            return toResult(date1, date2, drf);
        }
        catch
        {
            throw new Exception("字符串参数不正确!");
        }
    }
    /// <summary>
    /// 计算日期间隔
    /// </summary>
    /// <param name="d1">要参与计算的其中一个日期</param>
    /// <param name="d2">要参与计算的另一个日期</param>
    /// <param name="drf">决定返回值形式的枚举</param>
    /// <returns>一个代表年月日的int数组，具体数组长度与枚举参数drf有关</returns>
    public static int[] toResult(DateTime d1, DateTime d2, diffResultFormat drf)
    {
        #region 数据初始化
        DateTime max;
        DateTime min;
        int year;
        int month;
        int tempYear, tempMonth;
        if (d1 > d2)
        {
            max = d1;
            min = d2;
        }
        else
        {
            max = d2;
            min = d1;
        }
        tempYear = max.Year;
        tempMonth = max.Month;
        if (max.Month < min.Month)
        {
            tempYear--;
            tempMonth = tempMonth + 12;
        }
        year = tempYear - min.Year;
        month = tempMonth - min.Month;
        #endregion
        #region 按条件计算
        if (drf == diffResultFormat.dd)
        {
            TimeSpan ts = max - min;
            return new int[] { ts.Days };
        }
        if (drf == diffResultFormat.mm)
        {
            return new int[] { month + year * 12 };
        }
        if (drf == diffResultFormat.yy)
        {
            return new int[] { year };
        }
        return new int[] { year, month };
        #endregion
    }

    /// <summary>
    /// 回傳值形式的型態
    /// </summary>
    public enum diffResultFormat
    {
        /// <summary>
        /// 年数和月数
        /// </summary>
        yymm,
        /// <summary>
        /// 年数
        /// </summary>
        yy,
        /// <summary>
        /// 月数
        /// </summary>
        mm,
        /// <summary>
        /// 天数
        /// </summary>
        dd,
    }
    public List<reportTabEntity> getReportList(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num : '" + U_Num, className, methodName);

        List<reportTabEntity> rteList = MRMAPjoinMREPOhgDao.Instance.getReportList(U_Num);//<====

        log.endWrite("'rteList' : " + rteList.ToString(), className, methodName);
        return rteList;
    }


}