using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//個股管理作業
/// <summary>
/// MCMFTFDataEntity 的摘要描述
/// </summary>
/// [MSFTF]
public class MSFTFDataEntity
{
    public MSFTFDataEntity()
    {
    }
    public string Auto_id { get; set; }
    public string Sk_No { get; set; }
    public string Sk_Name { get; set; }
    public string Industrial { get; set; }
    public string Buy_date { get; set; }
    public string Close_Price { get; set; }
    public string EPS { get; set; }
    public string Tg_Price { get; set; }
    public string Sk_text { get; set; }
    public string del_tag { get; set; }
    public string add_date { get; set; }
    public string add_user { get; set; }
    public string add_ip { get; set; }
}
