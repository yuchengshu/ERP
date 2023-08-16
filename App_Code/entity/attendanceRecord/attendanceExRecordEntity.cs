using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// attendanceExRecordEntity 的摘要描述
/// </summary>
public class attendanceExRecordEntity
{
    public attendanceExRecordEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string EX_User { get; set; }
    public string EX_Type { get; set; }
    public string EX_SDate { get; set; }
    public string EX_EDate { get; set; }
    public int EX_Day { get; set; }
    public double takeLeaveHour { get; set; }
    public string EX_Status { get; set; }
    public string EX_STime { get; set; }
    public string EX_ETime { get; set; }
    public string inCompanyTime { get; set; }
    public string OutCompanyTime { get; set; }
    public string EX_TypeName { get; set; }

}