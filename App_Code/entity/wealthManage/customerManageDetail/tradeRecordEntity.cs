using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// tradeRecord 的摘要描述
/// </summary>
public class tradeRecordEntity
{
    public tradeRecordEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string T_ID { get; set; }
    public string M_ID { get; set; }
    public string MP { get; set; }
    public string MP_Name { get; set; }
    public string MP_COM { get; set; }
    public string MC { get; set; }
    public string MC_Name { get; set; }
    public string MC_COM { get; set; }
    public string T_Item { get; set; }
    public string Results_Item { get; set; }
    public string ca_id { get; set; }
    public string V_ID { get; set; }
    public string V_Name { get; set; }
    public string MT_COM { get; set; }
    public string T_PayMoney { get; set; }
    public string T_Type { get; set; }
    public string T_PType { get; set; }
    public string T_StartDate { get; set; }
    public string T_EndDate { get; set; }
    public string T_PauseDate { get; set; }
    public string T_AccountDate { get; set; }
    public string T_Status { get; set; }
    public string T_Fax { get; set; }
    public string T_Media { get; set; }
    public string XQ_SName { get; set; }
    public string XQ_SPw { get; set; }
    public string T_PS { get; set; }
    public string T_Message { get; set; }
    public string Ccard_4Num { get; set; }
    public string INV_tag { get; set; }
    public string INV_Createdate { get; set; }
    public string INV_Item { get; set; }
    public string INV_open_Item { get; set; }
    public string INV_ComName { get; set; }
    public string INV_UnifyNum { get; set; }
    public string INV_MNum { get; set; }
    public string INV_SendState { get; set; }
    public string Light_Status { get; set; }
    public string Back_intag { get; set; }
    public string Back_Status { get; set; }
    public string Back_tag { get; set; }
    public string Back_tagName { get; set; }
    public string Back_tagLink { get; set; }
    public string add_user { get; set; }
    public string add_ip { get; set; }
    public string edit_user { get; set; }
    public string edit_ip { get; set; }
    //合約日期天數
    public string contractDays { get; set; }
    //扣除六日之後的合約日期天數
    public string contractDaysLessWeekday { get; set; }
    //剩餘天數
    public string maturityDays { get; set; }
    //暫停後後剩餘天數
    public string T_PauseDateDays { get; set; }
    public string maturityDaysLessWeekday { get; set; }
    public string Invoice_CreateDate { get; set; }
    public string invoice_num { get; set; }
    public string T_ItemName { get; set; }
    public string T_TypeName { get; set; }
    public string Light_StatusName { get; set; }
    public string Back_StatusName { get; set; }
    public string T_StatusPS { get; set; }
    public string T_RestDate { get; set; }
  

}