using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MREGT02Entity 的摘要描述
/// </summary>
public class MREGTInfo
{
    public MREGTInfo()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string Type { get; set; }//假期類別
    public string Day { get; set; }//天數
    public string Hour { get; set; }//小時
    public string Com { get; set; } //公司
    public string Dept { get; set; } //部門
    public string MR_ID { get; set; }
    public string MR_Date { get; set; }
    public string MR_Num { get; set; }
    public string MR_Item { get; set; }
    public string MR_Mdep { get; set; }
    public string MR_RSTime { get; set; }
    public string MR_RETime { get; set; }
    public string MR_RS_IP { get; set; }
    public string MR_RE_IP { get; set; }
    public string MR_Money { get; set; }
    public string del_tag { get; set; }
    public string add_date { get; set; }
    public string add_ip { get; set; }
    public string add_user { get; set; }

    public string U_Name { get; set; }
   
    public int E1 { get; set; }//年假(EX_TYPE:001)
    public int E2 { get; set; } //補休
    public int E3 { get; set; } //公假
    public int E4 { get; set; } //婚假
    public int E5 { get; set; } //喪假
    public int E6 { get; set; } //產假
    public int E7 { get; set; } //事假
    public int E8 { get; set; } //病假
    public int E9 { get; set; } //遲到的次數
    public int E10 { get; set; } //喪假
    public int E11 { get; set; } //喪假
    public int E12 { get; set; } //出勤調整(暫時用不到)
    public int E13 { get; set; } //颱風假
    public int E14 { get; set; } //榮譽假
    public int E15 { get; set; } //曠職
    public int E16 { get; set; } //家庭照護假

}