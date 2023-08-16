using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// memberSessionStatusEntity 的摘要描述
/// </summary>
public class memberSessionStatusEntity
{
    public memberSessionStatusEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string M_Num { get; set; }
    public string M_ID { get; set; }
    public string M_Name { get; set; }
    public string MC_Name { get; set; }
    public string M_SD { get; set; }
    public string MTel1 { get; set; }
    public string MTel2 { get; set; }
    public string MTel3 { get; set; }
    public string OTel_Zone { get; set; }
    public string OTel { get; set; }
    public string OTel_Sub { get; set; }
    public string HTel_Zone { get; set; }
    public string HTel { get; set; }
    public string MP_Name { get; set; }
    public string MP { get; set; }
    public string T_AccountDate { get; set; }
    public string T_PayMoney { get; set; }
    public string T_StartDate { get; set; }
    public string T_EndDate { get; set; }
    public string T_Item { get; set; }
    public string Invoice_Num { get; set; }

    public string totalT_PayMoney { get; set; }
    public string totalL_PayMoney { get; set; }
    public string totalCount { get; set; }
    public string L_PayMoney { get; set; }
    public string Tdate { get; set; }
    public string Ldate { get; set; }
    public string Sdate { get; set; }
    public string Ldate2 { get; set; }
    public string T_ItemName { get; set; }
    public string RemainingMoney { get; set; }
    public string percentageMoney { get; set; }
    public string SixpointMethodMoney { get; set; }
    public string percentage { get; set; }

    public string totalRemainingMoney { get; set; }
    public string totalpercentageMoney { get; set; }
    public string totalSixpointMethodMoney { get; set; }

    public string mitem { get; set; }//預收剩餘金額表-種類


}