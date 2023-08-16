using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// SRMVENUEntity 的摘要描述
/// </summary>
public class SRMVMEBEntity
{
    public SRMVMEBEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    
    //客戶編號
    public string M_ID { get; set; }
    //客戶姓名
    public string M_Name { get; set; }
    //分析師
    public string MP_Name { get; set; }
    //助理
    public string MC_Name { get; set; }
    //行政人員
    public string SR_Name { get; set; }
    //建檔日期
    public string Add_Date { get; set; }
    
}