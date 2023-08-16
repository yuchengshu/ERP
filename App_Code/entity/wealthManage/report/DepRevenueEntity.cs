using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// DepRevenueEntity 的摘要描述
/// </summary>
public class DepRevenueEntity
{
    public DepRevenueEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string ComID { get; set; }
    public string ComIDname { get; set; }
    public List<MpRevenueEntity> mreList { get; set; }
    public double dayRevenue { get; set; }
    public double dayCost { get; set; }
    public double monthRevenue { get; set; }
    public double monthCost { get; set; }
    public double RevenueAim { get; set; }
    public double RevenueAimRate { get; set; }


}