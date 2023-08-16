using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MINVOEntity 的摘要描述
/// </summary>
public class OINVO_query_02Entity
{
    

    public OINVO_query_02Entity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //交易編號
    public string T_ID { get; set; }
    //開立日期
    public string inv_createdate { get; set; }
    public string Account_Date { get; set; }
    public string U_MDEP { get; set; }

    public string Analyst_Kind { get; set; }//分析師-種類
    public string M_ID { get; set; }

    public string MP { get; set; }
    //姓名
    public string M_Name { get; set; }
    //分析師姓名
    public string MP_Name { get; set; }
    //種類
    public string T_Item { get; set; }
    //付款方式
    public string Pay_Type { get; set; }
    //金流
    public string mt_com { get; set; }
    //金額
    public string T_PayMoney { get; set; }
    //發票號碼
    public string Inv_num { get; set; }
    //發票種類
    public string Inv_item { get; set; }
    //發票抬頭
    public string Inv_Comname { get; set; }
    //發票統編
    public string Inv_Uniform { get; set; }
    //公司統編
    public string INV_UnifyNum { get; set; }
    //寄發狀況
    public string Inv_SendState { get; set; }
    public string del_tag { get; set; }

    public string add_ip { get; set; }

    public string add_user { get; set; }

    public string add_date { get; set; }

    public string edit_user { get; set; }

    public string edit_date { get; set; }
    public string M_Sax { get; internal set; }
}