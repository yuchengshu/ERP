using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// ERPInvoice 的摘要描述
/// </summary>
public class ERPInvoice
{
    public ERPInvoice()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string Company { get; set; }
    public string RelateNumber { get; set; } // 合作特店自訂編號.
    public string CustomerID { get; set; } // 客戶編號.
    public string CustomerName { get; set; }
    public string CustomerAddr { get; set; } //客戶地址
    public string CustomerPhone { get; set; }
    public string CustomerEMail { get; set; }
    //public string CustomerTrader { get; set; }//暫時不用設定
    public string M_Name { get; set; }
    public string INV_Item { get; set; }
    public string INV_ComName { get; set; }
    public string Invoice_item { get; set; }
    public string CarrierType { get; set; } // 載具類別: (empty): 空字串就是華冠會員載具，1: 綠界電子發票, 2: 自然人, 3: 手機條碼載具。Add at 2021/11/22(一).
    public string CarruerNum { get; set; } // 載具編號.
    public string Print { get; set; } // 列印註記.
    public string LoveCode { get; set; } // 捐贈碼.
    public string CustomerIdentifier { get; set; } // 統一編號.
    public string SalesAmount { get; set; }
    public string InvoiceRemark { get; set; }
    public string ItemName { get; set; }
    public string ItemCount { get; set; }
    public string ItemWord { get; set; }
    public string ItemPrice { get; set; } // 價格.
    public string ItemDiscount { get; set; } // 價格的折讓金額(負數).
    public string ItemAmount { get; set; }

}