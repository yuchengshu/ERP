using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// getAdvancesRemainingMoneyParamEntity 的摘要描述
/// </summary>
public class getAdvancesRemainingMoneyParamEntity
{
    public getAdvancesRemainingMoneyParamEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string start2Date { get; set; } //剩餘金額基準日
    public string startDate { get; set; } //交易起始日
    public string endDate { get; set; } //交易結束日
    public string MP { get; set; } //分析師
    public string M_Item { get; set; }  //分析師產品種類
   
}