using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// annualLeaveAndCompensatoryLeaveAndSickLeaveDataEntity 的摘要描述
/// </summary>
public class annualLeaveAndCompensatoryLeaveAndSickLeaveDataEntity
{
    public annualLeaveAndCompensatoryLeaveAndSickLeaveDataEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public double takenAnnualLeaveDays { get; set; }
    public double takenSickLeaveDays { get; set; }
    public int AnnualLeaveDays { get; set; }
    public double takenCompensatoryLeaveDays { get; set; }
    public double CompensatoryLeaveDays { get; set; }


}