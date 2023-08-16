using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// ElectronicCalculatorInvoiceDetailEntity 的摘要描述
/// </summary>
public class ElectronicCalculatorInvoiceDetailEntity
{
    public ElectronicCalculatorInvoiceDetailEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string M_id { get; set; }
    public string T_id { get; set; }
    public string Invoice_ARMame { get; set; }
    public string Invoice_PayAmount { get; set; }
    public string Invoice_CreateDate { get; set; }
    public string Invoice_Num { get; set; }
    public string Invoice_Item { get; set; }
    public string Invoice_State { get; set; }
    public string Invoice_ComName { get; set; }
    public string Invoice_UnifyNum { get; set; }
    public string Invoice_PName { get; set; }
    public string Invoice_ItemName { get; set; }

    public string Invoice_PayAmountLessTax { get; set; }
    public string Tax { get; set; }
    public string edit_user { get; set; }
    public string edit_ip { get; set; }
    public string add_user { get; set; }
    public string add_ip { get; set; }
}