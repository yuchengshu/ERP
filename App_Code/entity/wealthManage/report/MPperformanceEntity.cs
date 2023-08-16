using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MPperformanceEntity 的摘要描述
/// </summary>
public class MPperformanceEntity
{
    public MPperformanceEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string MP { get; set; }
    public string MP_Name { get; set; }
    public int totalTradeCount { get; set; }
    public int newAddTradeCount { get; set; }
    public string newAddTradeMoney { get; set; }
}