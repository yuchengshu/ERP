using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// VenuePerformanceForMCentity 的摘要描述
/// </summary>
public class VenuePerformanceForMCentity
{
    public VenuePerformanceForMCentity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string DV_ID { get; set; }
    public string V_ID { get; set; }
    public string MC { get; set; }
    public string MCname { get; set; }
    public string U_MDEP { get; set; }
    public string U_MDEPname { get; set; }
    public string add_date { get; set; }
    public List<paymentDataEntity> pdeList { get; set; }
    
    

}