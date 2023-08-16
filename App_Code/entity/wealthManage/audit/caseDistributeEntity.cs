using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// caseDistributeEntity 的摘要描述
/// </summary>
public class caseDistributeEntity
{
    public caseDistributeEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string U_Num { get; set; }
    public string U_Name { get; set; }
    public int greenCount { get; set; }
    public int yellowCount { get; set; }
    public int redCount { get; set; }
    public int distributeCount { get; set; }
}