using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// haltResumeEntity 的摘要描述
/// </summary>
public class haltResumeEntity
{
    public haltResumeEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string M_Id { get; set; }

    public string MP { get; set; }

    public string T_Item { get; set; }

    public string MembershipType { get; set; } //會員種類
     
    public string T_StartDate { get; set; } //入會日期

    public string T_EndDate { get; set; }//到期日期

    public string T_ID { get; set; } //案件編號

    public string T_PayMoney { get; set; } //入會金額
}