using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// envelopeEntity 的摘要描述
/// </summary>
public class envelopeEntity
{
    public envelopeEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string T_AccountDate { get; set; }
    public string INV_Item { get; set; }
    public string INV_SendState { get; set; }
    public string MC_COM { get; set; }
    public string MC_Name { get; set; }
    public string Recipient { get; set; }
    public string M_Name { get; set; }
    public string HCity { get; set; }
    public string HTown { get; set; }
    public string HZipCode { get; set; }
    public string H_Address { get; set; }
}