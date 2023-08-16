using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// totalTelStatisticsEntity 的摘要描述
/// </summary>
public class totalTelStatisticsEntity
{
    public totalTelStatisticsEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string date { get; set; }
    public string DayOfWeek { get; set; }
    public string day { get; set; }
    public List<TelStatisticsEntity> tseList { get; set; }
    public int week { get; set; }


}