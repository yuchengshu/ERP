using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// ERPcustomerWebPayEntity 的摘要描述
/// </summary>
public class ERPcustomerWebPayEntity
{
    public ERPcustomerWebPayEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string ca_id { get; set; }
    public string M_id { get; set; }
    public string MC_name { get; set; }
    public string Pay_Serial { get; set; }
    public string P_Name { get; set; }
    public string Price { get; set; }
    public string C_name { get; set; }
    public string C_Tel { get; set; }
    public string add_date { get; set; }
    public string o_id { get; set; }
    public string Done_Tag { get; set; }
    public string Done_TagName { get; set; }
    public string ContractID { get; set; }

    public string Card4NO { get; set; }
    public string Payway { get; set; }
    public string PayStatus { get; set; }

    public string PayStatusName { get; set; }
}