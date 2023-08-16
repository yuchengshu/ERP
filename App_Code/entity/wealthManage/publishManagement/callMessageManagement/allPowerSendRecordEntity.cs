using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// allPowerSendRecordEntity 的摘要描述
/// </summary>
public class allPowerSendRecordEntity
{
    public allPowerSendRecordEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string M_TEL { get; set; }
    public string M_MP { get; set; }
    public string M_MITem { get; set; }
    public string M_SEQ { get; set; }
    public string M_TStatus { get; set; }
    public string M_SStatus { get; set; }
    public string originalM_Text { get; set; }
    public string M_Text { get; set; }
    public string add_user { get; set; }
    public string add_date { get; set; }
    public string add_ip { get; set; }
    //M_Name 是計算訊息的發送次數
    public string M_Name { get; set; }
    

    public string M_MITemName { get; set; }
    public string M_MITemTotal { get; set; }
    public string M_MPname { get; set; }
    public string M_MPcom { get; set; }
    public string add_userName { get; set; }
    public string M_TStatusName { get; set; }
    public string getMessageStatus { get; set; }
    public string getMessageStatusName { get; set; }
    public string smdType { get; set; }

}