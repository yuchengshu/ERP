using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MCMEB09Entity 的摘要描述
/// </summary>
public class MCMEB09Entity
{
    public MCMEB09Entity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string Ch { get; set; }//分析師員工姓名

    public string P_ID { get; set; } //分析師員工編號
    public int WMEDIA_Count { get; set; }
    public int WVideo_Count { get; set; }
    public int WCRITIQUE_Count { get; set; }
    public int WMEDIA_Count_Avg { get; set; }
    public int WVideo_Count_Avg { get; set; }
    public int WCRITIQUE_Count_Avg { get; set; }
}