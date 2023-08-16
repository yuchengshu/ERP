using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// VenuePerformanceDataEntity 的摘要描述
/// </summary>
public class VenuePerformanceDataEntity
{
    public VenuePerformanceDataEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string V_ID { get; set; }

    public List<MCentity> mcList { get; set; }
    public List<paymentDataEntity> pdeList { get; set; }
}