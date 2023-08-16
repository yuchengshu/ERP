using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// analystSinglePerformanceEntity 的摘要描述
/// </summary>
public class analystSinglePerformanceEntity
{
    public analystSinglePerformanceEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string t_item { get; set; }
    public string T_item_count { get; set; }
    public string T_PayMoney { get; set; }
    public double totalMoney { get; set; }
    public string MP { get; set; }
    public string MP_Name { get; set; }
    public string MC { get; set; }
    public string MC_Name { get; set; }
    public string Light_Status { get; set; }
    public string T_AccountDate { get; set; }
    public string M_ID { get; set; }
    public string T_StartDate { get; set; }
    public string T_EndDate { get; set; }
    public string T_Item { get; set; }
    public string DT_ID { get; set; }
    public string T_ID { get; set; }
    public string Pay_Type { get; set; }
    public string M_Name { get; set; }
    public string Account_Money { get; set; }
    public string T_Type { get; set; }

    public List<chargeDetailEntity> cdeList { get; set; }
    public string T_ItemName { get; set; }
    public string Pay_TypeName { get; set; }



}