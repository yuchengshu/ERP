using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// closingPriceThreeBigDataEntity 的摘要描述
/// </summary>
public class closingPriceThreeBigDataEntity
{
    public closingPriceThreeBigDataEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string WFT_id { get; set; }
    public string WFT_date { get; set; }
    public string WFT_TSE_T1 { get; set; }
    public string WFT_TSE_T2 { get; set; }
    public string WFT_TSE_T3 { get; set; }
    public string WFT_OTC_T1 { get; set; }
    public string WFT_OTC_T2 { get; set; }
    public string WFT_OTC_T3 { get; set; }
    public string WFT_II_T1 { get; set; }
    public string WFT_II_T2 { get; set; }
    public string WFT_II_T3 { get; set; }
    public string WFT_II_T4 { get; set; }

    public string actionType { get; set; }

}