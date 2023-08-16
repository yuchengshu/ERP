using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MediaClickStatisticsEntity 的摘要描述
/// </summary>
public class MediaClickStatisticsEntity
{
    public MediaClickStatisticsEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string t_id { get; set; }
    public string U_Name { get; set; }
    public string U_Num { get; set; }
    public int mediaCount { get; set; }
    public int videoCount { get; set; }
    public int critiqueCount { get; set; }
    public int dailyMediaCount { get; set; }
    public int dailyVideoCount { get; set; }
    public int dailyCritiqueCount { get; set; }
    public int mediaDays { get; set; }
    public int videoDays { get; set; }
    public int critiqueDays { get; set; }
}