using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// sendMessageCostEntity 的摘要描述
/// </summary>
public class sendMessageCostEntity
{
    public sendMessageCostEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string auto_id { get; set; }
    public string MP { get; set; }
    public string MP_Name { get; set; }
    public string M_SStatus { get; set; }
    public int sendSuccessCount { get; set; }
    public int sendFailCount { get; set; }
    public string M_Name { get; set; }

}