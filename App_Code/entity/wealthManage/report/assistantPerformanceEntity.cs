using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// assistantPerformanceEntity 的摘要描述
/// </summary>
public class assistantPerformanceEntity
{
    public assistantPerformanceEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string assistant { get; set; }
    public string assistantName { get; set; }
    public double totalPerformanceMoney { get; set; }
    public double totalMemberMoney { get; set; }
    public double venueMoney { get; set; }
    public double redLightMoney { get; set; }
    public double yellowLightMoney { get; set; }
    public double greenLightMoney { get; set; }

}