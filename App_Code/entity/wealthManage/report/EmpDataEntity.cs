using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// EmpDataEntity 的摘要描述
/// </summary>
public class EmpDataEntity
{
    public EmpDataEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string U_Name { get; set; }
    public string U_MDEP { get; set; }
    public string U_Num { get; set; }
    public string BirthDayDate { get; set; }
    public string SlimDate { get; set; }
    public string LeaveDate { get; set; }
    public string U_PID { get; set; }
    public string OCity { get; set; }
    public string OTown { get; set; }
    public string OZipCode { get; set; }
    public string OAddress { get; set; }
    public string HCity { get; set; }
    public string HTown { get; set; }
    public string HZipCode { get; set; }
    public string HAddress { get; set; }
    public string HTel_Zone { get; set; }
    public string HTel { get; set; }
    public string HMobile { get; set; }
    public string EName { get; set; }
    public string EMobile { get; set; }

    public string U_MDEPname { get; set; }
}