using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// cDateTime 的摘要描述
/// </summary>
public class cDateTime
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public cDateTime()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    private static cDateTime _instanct = new cDateTime();
    public static cDateTime Instance
    {
        get
        {
            return _instanct;
        }
    }

    public static string getNowDateTimeForSql()
    {
        DateTime DTnow = DateTime.Now;
        string y = DTnow.Year.ToString();
        string m = DTnow.Month.ToString();
        string d = DTnow.Day.ToString();
        return y + "-" + m + "-" + d;
    }
    public static string getNowDateTimeForMsgtext()
    {
        DateTime DTnow = DateTime.Now;
       
        string m = DTnow.Month.ToString();
        string d = DTnow.Day.ToString();
        string hh = DTnow.Hour.ToString();
        string mm = DTnow.Minute.ToString();
        return "("+ m +"/"+d+ ")"+ hh+":"+ mm;
    }
    public static string daysToWeekday(string y,string m,int d)
    {
        string backStr = string.Empty;
        DateTime dateValue = new DateTime(int.Parse(y), int.Parse(m), d);
        backStr = dateValue.DayOfWeek.ToString();
        switch (backStr)
        {
            case "Monday":
                backStr = "一";
                break;
            case "Tuesday":
                backStr = "二";
                break;
            case "Wednesday":
                backStr = "三";
                break;
            case "Thursday":
                backStr = "四";
                break;
            case "Friday":
                backStr = "五";
                break;
            case "Saturday":
                backStr = "六";
                break;
            case "Sunday":
                backStr = "日";
                break;
        }
        return backStr;
    }
    public static string getLastMonthFirstDate(int LastMonth)
    {
        DateTime datetime = DateTime.Now;
        datetime = datetime.AddMonths(0 - LastMonth);
        return datetime.Year + "/" + datetime.Month + "/1";
    }
    public static string getAddDayDate(int LastDay)
    {
        DateTime datetime = DateTime.Now;
        datetime = datetime.AddDays(LastDay);
        string[] datetimeArr = datetime.ToString().Split(' ');
        return datetimeArr[0];
    }
    public static string getLastMonth(int LastMonth)
    {
        DateTime datetime = DateTime.Now;
        datetime = datetime.AddMonths(0 - LastMonth);
        return datetime.Year + "/" + datetime.Month;
    }
}