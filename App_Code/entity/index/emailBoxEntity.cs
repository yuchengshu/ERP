using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// emailBoxEntity 的摘要描述
/// </summary>
public class emailBoxEntity
{
    public emailBoxEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string auto_id { get; set; }
    public string MS_ID { get; set; }
    public string MS_Title { get; set; }
    public string MS_Text { get; set; }
    public string add_Date { get; set; }
    public string MS_Sender { get; set; }
    public string MS_Sender_Name { get; set; }
}