using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// InvoiceDetailEntity 的摘要描述
/// </summary>
public class InvoiceDetailEntity
{
    public InvoiceDetailEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string Transaction_Time { get; set; }
    public string InvoiceNumber { get; set; }
    public string O_Id { get; set; }
    public string Name { get; set; }
    public string Price { get; set; }
    public string PriceLessTax { get; set; }
    public string Tax { get; set; }


}