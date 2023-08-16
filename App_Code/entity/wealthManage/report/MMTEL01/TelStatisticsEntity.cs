using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// TelStatisticsEntity 的摘要描述
/// </summary>
public class TelStatisticsEntity
{
    public TelStatisticsEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string U_Name { get; set; }
    public string U_Num { get; set; }
    public List<ProgramEntity> peList { get; set; }
    
}