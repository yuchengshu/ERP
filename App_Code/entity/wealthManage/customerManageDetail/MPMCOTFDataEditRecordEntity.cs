using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// companyDataEntity 的摘要描述
/// </summary>
public class MPMCOTFDataEditRecordEntity
{
    public MPMCOTFDataEditRecordEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //M_ID
    public string auto_id { get; set; }
    public string Log_Item { get; set; }
    public string M_ID { get; set; }//0
    public string T_ID { get; set; }//1
    public string M_Row { get; set; }//2
    public string M_text { get; set; }//3
    public string del_tag { get; set; }
    public string edit_user { get; set; }
    public string edit_date { get; set; }
   
}