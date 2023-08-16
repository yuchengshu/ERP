using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// lineMessageDetail 的摘要描述
/// </summary>
public class lineMessageDetail
{
    public lineMessageDetail()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //DB :LineMessageDetail
    //line訊息明細id
    public string LMDid { get; set; }
    //群發訊息id
    public string LMid { get; set; }
    //接受者ERP客戶編號
    public string M_ID { get; set; }
    //接受者LineID(官方產生之ID)
    public string LineID { get; set; }
    //所發訊息內容
    public string Message { get; set; }
    //上傳檔案位置
    public string upLoadAddress { get; set; }
    //發送類型: 1-立即 2-排程
    public string SendType { get; set; }
    //排程發送時間
    public string SendDate { get; set; }
    //發送狀態: 1:已發送 0:未發送
    public string SendStatus { get; set; }
    //接受者狀態: 1:已讀取 0:未讀取
    public string RecipientStatus { get; set; }

    public string del_tag { get; set; }
    //新增者
    public string addUser { get; set; }
    //新增時間
    public string addDate { get; set; }
    //新增ip
    public string addIP { get; set; }
}