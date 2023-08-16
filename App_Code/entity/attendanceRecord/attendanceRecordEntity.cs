using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// attendanceRecordEntity 的摘要描述
/// </summary>
public class attendanceRecordEntity
{
    public attendanceRecordEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string MR_Date { get; set; }
    public string MR_Num { get; set; }
    public string MR_Item { get; set; }
    public string MR_Mdep { get; set; }
    public string MR_RSTime { get; set; }
    public string MR_RETime { get; set; }
    public string EX_Status { get; set; }
    public double EX_Hour { get; set; }
    public int EX_Day { get; set; }
    public string EX_Reason { get; set; }
    public string MR_Name { get; set; }
    public string MR_ItemName { get; set; }
    public string MR_RSDate { get; set; }
    public string MR_REDate { get; set; }
    public string EX_Type { get; set; }
    public string EX_TypeName { get; set; }
    public string inCompanyTime { get; set; }
    public string OutCompanyTime { get; set; }
    public int lateCount { get; set; }
    public bool takeLeaveTF { get; set; }
}