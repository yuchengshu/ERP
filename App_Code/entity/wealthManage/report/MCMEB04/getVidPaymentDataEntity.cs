using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// getVidPaymentDataEntity 的摘要描述
/// </summary>
public class getVidPaymentDataEntity
{
    public getVidPaymentDataEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
 
    public string V_ID { get; set; }
    public string T_AccountDate { get; set; }
    public string M_Name { get; set; }
    public string M_Num { get; set; }
    public string MP { get; set; }
    public string MP_Name { get; set; }
    public string T_Item { get; set; }
    public string T_PayMoney { get; set; }
    public string T_ID { get; set; }
    public string MC { get; set; }
    public string MCname { get; set; }
    public string MCcom { get; set; }
    public string UMDEP { get; set; }
    public string T_ItemName { get; set; }

    public List<chargeDetailEntity> cdeList { get; set; }
}