using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// PerMonthRevenueEntity 的摘要描述
/// </summary>
public class PerMonthRevenueEntity
{
    public PerMonthRevenueEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string MCcom { get; set; }
    public string MCcomName { get; set; }
    public List<MonthRevenueEntity> mreList { get; set; }
}