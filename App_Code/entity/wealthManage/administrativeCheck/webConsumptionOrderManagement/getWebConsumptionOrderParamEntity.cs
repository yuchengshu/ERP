using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// getWebConsumptionOrderParamEntity 的摘要描述
/// </summary>
public class getWebConsumptionOrderParamEntity
{
    public getWebConsumptionOrderParamEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string keyWord { get; set; }
    public string StartDate { get; set; }
    public string EndDate { get; set; }
    public string P_id { get; set; }
    public string PayStatus { get; set; }
    public string Payway { get; set; }
}