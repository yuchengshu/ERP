using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// analystPerformanceEntity 的摘要描述
/// </summary>
public class analystPerformanceEntity
{
    public analystPerformanceEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string analyst { get; set; }
    public string analystName { get; set; }
    public double totalPerformanceMoney { get; set; }
    public double totalMemberMoney { get; set; }
    public double aGroupMoney { get; set; }
    public double bGroupMoney { get; set; }
    public double venueMoney { get; set; }
    public double bonusCost { get; set; }
    public double otherIncome { get; set; }
    public double discount { get; set; }

}