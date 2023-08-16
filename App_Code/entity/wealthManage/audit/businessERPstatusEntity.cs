using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// businessERPstatusEntity 的摘要描述
/// </summary>
public class businessERPstatusEntity
{
    public businessERPstatusEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string U_Num { get; set; }
    public string U_Name { get; set; }
    public string tradedCustomerCount { get; set; }
    public string tradedCustomerCountThisPeriod { get; set; }
    public string NonTradedCustomerCount { get; set; }
    public string NonTradedCustomerCountThisPeriod { get; set; }
}