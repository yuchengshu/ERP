using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// SRMVENUEntity 的摘要描述
/// </summary>
public class SRMVENUEntity
{
    public SRMVENUEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //20220425要修改
    //會員編號
    public string V_ID { get; set; }
    //日期
    public string V_Date { get; set; }
    //地點
    public string V_Site { get; set; }
    //分析師
    public string MP_Name { get; set; }
    //來賓人數
    public string V_MEM { get; set; }
    //助理人數
    public string V_MemC { get; set; }
    //訂金件數
    public string DepositCount { get; set; }
    //交易件數
    public string TradeCount { get; set; }
    //入帳金額
    public string Account_Money_IN { get; set; }
    //入會金額
    public string Account_Money_Pay { get; set; }
    public double Account_Money { get; set; }
    public double Account_Money_IN_ALL { get; set; }
    public double value_Account_Money { get; set; }
}