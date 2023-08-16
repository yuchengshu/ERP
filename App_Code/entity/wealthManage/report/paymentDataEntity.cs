using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// paymentDataEntity 的摘要描述
/// </summary>
public class paymentDataEntity
{
    public paymentDataEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string T_ID { get; set; }
    public string Pay_Type { get; set; }
    public string T_type { get; set; }
    public string Account_Money { get; set; }
    public string T_AccountDate { get; set; }
    public string T_Item { get; set; }
    public string T_ItemName { get; set; }
    public string MP { get; set; }
    public string MP_Name { get; set; }
    public string MC { get; set; }
    public string MC_Name { get; set; }
    public string Light_Status { get; set; }
    public string Pay_tag { get; set; }
    public string MTRATmc { get; set; }
    public string T_PayMoney { get; set; }
    public string M_ID { get; set; }
    public string mca { get; set; }
    public string M_Name { get; set; }
    public string M_Num { get; set; }

    public string DV_ID { get; set; }
    public string V_ID { get; set; }
    public string U_MDEP { get; set; }
    public string U_MDEPname { get; set; }


    public string Pay_TypeName { get; set; }
    public string Pay_tagName { get; set; }


}