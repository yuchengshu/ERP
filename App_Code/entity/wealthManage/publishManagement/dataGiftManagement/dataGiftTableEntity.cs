using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// dataGiftTableEntity 的摘要描述
/// </summary>
public class dataGiftTableEntity
{
    public dataGiftTableEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string s_id { get; set; }
    public string M_id { get; set; }
    public string M_Password { get; set; }
    public string MP_Num { get; set; }
    public string MP_EN { get; set; }
    public string MP_Name { get; set; }
    public string MP_Com { get; set; }
    public string ddesc { get; set; }
    public string Start_date { get; set; }
    public string End_date { get; set; }
    public DateTime Start_dateDT { get; set; }
    public DateTime End_dateDT { get; set; }
    public string Pay { get; set; }
    public string Faxno { get; set; }
    public string Tel_tag { get; set; }
    public string Call_tag { get; set; }
    public string Action_tag { get; set; }
    public string Img { get; set; }

    public string PayName { get; set; }
    public string Tel_tagName { get; set; }
    public string Call_tagName { get; set; }
    public string Action_tagName { get; set; }
}