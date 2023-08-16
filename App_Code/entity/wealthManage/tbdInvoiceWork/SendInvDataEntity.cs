using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// SendInvDataEntity 的摘要描述
/// </summary>
public class SendInvDataEntity
{
    public SendInvDataEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string Company { get; set; }
    public string Invoice_item { get; set; }
    public string RelateNumber { get; set; }
    public string CustomerID { get; set; }
    public string CustomerName { get; set; }
    public string CustomerAddr { get; set; }
    public string CustomerPhone { get; set; }
    public string CustomerEMail { get; set; }
    public string CarruerNum { get; set; }
    public string Print { get; set; }
    public string LoveCode { get; set; }
    public string CustomerIdentifier { get; set; }
    public string SalesAmount { get; set; }
    public string InoviceRemark { get; set; }
    public string ItemName { get; set; }
    public string ItemCount { get; set; }
    public string ItemWord { get; set; }
    public string ItemPrice { get; set; }
    public string ItemAmount { get; set; }


    
}