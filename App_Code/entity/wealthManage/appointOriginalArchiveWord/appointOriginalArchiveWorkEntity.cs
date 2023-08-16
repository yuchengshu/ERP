using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// appointOriginalArchiveWorkEntity 的摘要描述
/// </summary>
public class appointOriginalArchiveWorkEntity
{
    public appointOriginalArchiveWorkEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
   
    public string M_Name { get; set; }
    public string T_ID { get; set; }
    public string M_ID { get; set; }
    public string MP { get; set; }
    public string MP_Name { get; set; }
    public string MC { get; set; }
    public string MC_Name { get; set; }
    public string MC_COM { get; set; }
    public string T_Item { get; set; }
    public string T_PayMoney { get; set; }
    public string T_AccountDate { get; set; }
    public string Back_Status { get; set; }
    public string Back_tag { get; set; }

    public string Back_StatusName { get; set; }
    public string Back_tagName { get; set; }
    public string T_ItemName { get; set; }
    public string MC_COMname { get; set; }
    public string differenceT_AccountDateAndNow { get; set; }

}