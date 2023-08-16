using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// totalPerformanceEntity 的摘要描述
/// </summary>
public class totalPerformanceEntity
{
    public totalPerformanceEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string MP { get; set; }
    public string MP_Name { get; set; }
    public string MC { get; set; }
    public string MC_Name { get; set; }
    public int totalTradeCount { get; set; }
    public int newAddTradeCount { get; set; }
    public double newAddTradeMoney { get; set; }
}