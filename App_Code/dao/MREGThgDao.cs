using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MREGThgDao 的摘要描述
/// </summary>
public class MREGThgDao
{

    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MREGThgDao _instance = new MREGThgDao();
    public static MREGThgDao Instance
    {
        get
        {
            return _instance;
        }
    }

    public MREGThgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    /// <summary>
    /// 製作chockonOrNo執行sql時需要的連線字串、執行命令字串
    /// </summary>
    /// <param name="U_Num"></param>
    /// <returns></returns>
    public string chockonOrNo(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);

        string commandText = "select MR_RSTime from MREGT where MR_Date = DATEADD(dd,DATEDIFF(dd,0,getdate()),0) and MR_Num='{0}' and del_tag='0'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, U_Num));
        string backString = MREGThgSql.Instance.chockonOrNo(connectionStrings, sbCommandText.ToString());//<=======================

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }
    //取出出勤打卡紀錄
    public List<MREGTEntity> getMREGE02List(string StartDate, string EndDate, string MP)
    {
        string[] Sdate = StartDate.Split('/');
        if (Sdate.Length < 2)
            Sdate = StartDate.Split('-');
        string SdateNEW = "";
        DateTime SdateNEWdatetime = new DateTime();
        try
        {
             SdateNEW = Sdate[2] + "-" + Sdate[0] + "-" + Sdate[1] + " 00:00:00.000";
             SdateNEWdatetime = DateTime.Parse(SdateNEW);
        }
        catch (Exception)
        {
                SdateNEW = Sdate[0] + "-" + Sdate[1] + "-" + Sdate[2] + " 00:00:00.000";
             SdateNEWdatetime = DateTime.Parse(SdateNEW);
            //throw;
        }
        //string SdateNEW=Sdate[2]+"-"+ Sdate[0] + "-"+Sdate[1] + " 00:00:00.000";
        //DateTime SdateNEWdatetime = DateTime.Parse(SdateNEW)
        //string SdateNEW = Sdate[0] + "-" + Sdate[1] + "-" + Sdate[2] + " 00:00:00.000";
        //DateTime SdateNEWdatetime = DateTime.Parse(SdateNEW);
        string[] Edate = EndDate.Split('/');
        string EdateNEW = Edate[2] + "-" + Edate[0] + "-" + Edate[1] + " 00:00:00.000";
        DateTime EdateNEWdatetime = DateTime.Parse(EdateNEW);
        DateTime newdt =new DateTime();
        TimeSpan ts = new TimeSpan();
        ts =EdateNEWdatetime.Subtract(SdateNEWdatetime);//兩日期相差的天數
        
        int Day_int = ts.Days;//包含起始日到終止日的天數
        int i = 0;//相差天數
        //do
        //{
        //    SdateNEWdatetime = SdateNEWdatetime.AddDays(1);
        //    ts = EdateNEWdatetime.Subtract(SdateNEWdatetime);
        //    i++;
        //    //SdateNEWdatetime = SdateNEWdatetime.AddDays(1);
        //    //Day_int = ts.Days;
        //    //Day_int++;//包含起始日到終止日的天數
        //} while (Day_int > i);
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        string Day = "";
        //邏輯 AND 運算子 &
        //邏輯 OR 運算子 |
        //if (MR_DateM == "2")
        //{
        //    Day = "28";
        //}
        //else if (MR_DateM == "4" | MR_DateM == "6" | MR_DateM == "9" | MR_DateM == "11")
        //{
        //    Day = "30";
        //}
        //else
        //{
        //    Day = "31";

        //}

       // string StartDate = StartDate;
       // string EndDate = MR_DateY + "-" + MR_DateM + "-" + Day;
        string commandText = "";
        if (MP.Trim() == "" && MP.Trim() !="0000")//如果MP為空值,則查詢所有人
        {
            commandText = "select * From MREGT where MR_Date between '" + SdateNEW + "' and '" + EdateNEW + "' order by MR_Date ";
        }
        else
        {
            commandText = "select * From MREGT where MR_Date between '" + SdateNEW + "' and '" + EdateNEW + "' and MR_Num='" + MP + "' order by MR_Date ";
        }
        List<MREGTEntity> MREGT = MREGThgSql.Instance.getMREGE02List(connectionStrings, commandText);//<======

        log.endWrite("'wte':" + MREGT.ToString(), className, methodName);
        return MREGT;
    }

    public void chockon(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);

        string commandText = "UPDATE[HG].[dbo].[MREGT] SET MR_RSTime = GETDATE() WHERE MR_Date = DATEADD(dd, DATEDIFF(dd, 0, getdate()), 0) and MR_Num = '{0}' and del_tag = '0'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, U_Num));
        noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<=================

        log.endWrite(common.nothing, className, methodName);
    }

    public List<attendanceRecordEntity> getAttendanceRecord(string firstDay, string lastDay, string U_Num, string slimDate, string leaveDate)
    {

        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'firstDay' : " + firstDay + "'lastDay' : " + lastDay + "'U_Num' : " + U_Num + "'slimDate' : " + slimDate + "'leaveDate' : " + leaveDate, className, methodName);
        string commandText = string.Empty;
        if (common.isEmpty(leaveDate))
        {
            commandText = "select MR_Date,MR_Num,MR_Item,MR_Mdep,MR_RSTime,MR_RETime from MREGT where MR_Num='" + U_Num + "' and MR_Date>='" + slimDate + "' and MR_Date>='" + firstDay + "' and MR_Date<='" + lastDay + "' and del_tag = '0'  order by MR_Date";
        }
        else
        {
            commandText = "select MR_Date,MR_Num,MR_Item,MR_Mdep,MR_RSTime,MR_RETime from MREGT where MR_Num='" + U_Num + "' and MR_Date>='" + slimDate + "' and MR_Date>='" + firstDay + "' and MR_Date<='" + lastDay + "' and MR_Date<'" + leaveDate + "' and del_tag = '0'  order by MR_Date";
        }
        log.debug2("commandText=" + commandText, "", "");
        List<attendanceRecordEntity> areList = MREGThgSql.Instance.getAttendanceRecord(connectionStrings, commandText);//<=======================

        log.endWrite("'areList' : " + areList.ToString(), className, methodName);
        return areList;
    }

    public string offWork(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);

        string commandText = "UPDATE[HG].[dbo].[MREGT] SET MR_RETime = GETDATE() WHERE MR_Date = DATEADD(dd, DATEDIFF(dd, 0, getdate()), 0) and MR_Num = '{0}' and del_tag = '0'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, U_Num));
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<=================

        log.endWrite("'backStr' : " + backStr, className, methodName);
        return backStr;
    }
}