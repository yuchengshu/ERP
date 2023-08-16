using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// VenuePerformanceEntity 的摘要描述
/// </summary>
public class VenuePerformanceEntity
{
    public VenuePerformanceEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string V_ID { get; set; }
    public string V_Date { get; set; }
    public string V_Site { get; set; }
    public string MP_Name { get; set; }
    public string V_MemC { get; set; }
    public string V_MemCN { get; set; }
    public string T_PayMoney { get; set; }
    public string T_PType { get; set; }
    public string Pay_Type { get; set; }
    public string Account_money { get; set; }
    public string T_Type { get; set; }
    public string V_Mem { get; set; }
    public string MTRATvidCount { get; set; }
    public string DVENUvidCount { get; set; }
    public string AdmissionMoney { get; set; }
    public string AccountMoney { get; set; }
    public List<getVidPaymentDataEntity> pdeList { get; set; }

}