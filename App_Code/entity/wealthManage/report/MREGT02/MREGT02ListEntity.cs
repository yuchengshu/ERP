using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MREGT02Entity 的摘要描述
/// </summary>
/// 考勤表-個人詳細資料
public class MREGT02DetailEntity
{
    public MREGT02DetailEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string M_Date { get; set; } //日期

    public string MR_Name { get; set; } //人員
    public string MR_Item { get; set; } //班別
    public string MR_RStime { get; set; } //上班打卡時間
    public string MR_REtime { get; set; } //下班打卡時間
    public string Status { get; set; } //出勤狀態
    public string Ex_Hour { get; set; } //異常時數
    public string Information { get; set; } //請假資料
    


    //public int Late_Time { get; set; } //遲到的次數
}