using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// lineMessage 的摘要描述
/// </summary>
public class lineMessage
{
    public lineMessage()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //DB :LineMessage

    //LINE訊息id
    public string LMid { get; set; }
    //發送者
    public string Sender { get; set; }
    //接收訊息群組
    public string ReceiveGroup { get; set; }
    //發訊息
    public string Message { get; set; }
    //上傳檔案位置
    public string upLoadAddress { get; set; }
    //發送類型: 0-立即 1-排程
    public string SendType { get; set; }
    //排程發送時間
    public string SendDate { get; set; }

    public string del_tag { get; set; }
    //新增者
    public string addUser { get; set; }
    //新增時間
    public string addDate { get; set; }
    //新增ip
    public string addIP { get; set; }
}