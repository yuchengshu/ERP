using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MCperformanceEntity 的摘要描述
/// </summary>
public class MCperformanceEntity
{
    public MCperformanceEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string MC { get; set; }
    public string MC_Name { get; set; }
    MPperformanceEntity MPperformanceList { get; set; }
}