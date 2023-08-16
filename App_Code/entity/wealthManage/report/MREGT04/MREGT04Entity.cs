using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MREGT02Entity 的摘要描述
/// </summary>
public class MREGT04Entity
{
    public MREGT04Entity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string U_Name { get; set; }//姓名

    public string U_Num { get; set; }
    public string Com { get; set; }
    public string Dept { get; set; } //部門
    public string ComName { get; set; }
    public string DeptName { get; set; }
    public string SlimDate { get; set; } //到職日
    public string LeaveDate { get; set; } //離職日

    public string adverdays { get; set; } //已休年假

    public string adverdays_day { get; set; } //已休年假(天)

    public string adverdays_unuse { get; set; } //未休年假

    public string adverdays_detail { get; set; } //詳細
    public string E1 { get; set; }
    public string E2 { get; set; }
    public string E3 { get; set; }
    public string E4 { get; set; }
    public string E5 { get; set; }
    public string E6 { get; set; }
    public string E7 { get; set; }
    public string E8 { get; set; }
    public string E9 { get; set; }
    public string E10 { get; set; }
    public string E11 { get; set; }
    public string E12 { get; set; }
    public string E13 { get; set; }
    public string E14 { get; set; }
    public string E15 { get; set; }
    public string E16 { get; set; }


    public int Late_Time { get; set; } //遲到的次數
}