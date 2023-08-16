using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// customerDataEntity 的摘要描述
/// </summary>
public class customerDataEntity
{
    public customerDataEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string M_ID { get; set; }
    public string M_Name { get; set; }
    public string M_Sax{ get; set; }
    public string M_SaxCodeName { get; set; }
    public string M_Grade { get; set; }
    public string BirthDay_Date { get; set; }
    public string MC { get; set; }
    public string MC_Name { get; set; }
    public string MC_COM { get; set; }
    public string MC_COMCodeName { get; set; }
    public string OTel_Zone { get; set; }
    public string OTel { get; set; }
    public string OTel_Sub { get; set; }
    public string OTel_Zone1 { get; set; }
    public string OTel1 { get; set; }
    public string OTel_Sub1 { get; set; }
    public string HTel_Zone { get; set; }
    public string HTel { get; set; }
    public string HTel_Zone1 { get; set; }
    public string HTel1 { get; set; }
    public string MTel1 { get; set; }
    public string MTel2 { get; set; }
    public string MTel3 { get; set; }
    public string Fax_Zone { get; set; }
    public string Fax { get; set; }
    public string Fax_Zone1 { get; set; }
    public string Fax1 { get; set; }
    public string M_SD { get; set; }
    public string M_SD_tag { get; set; }
    public string M_SD_Date { get; set; }

    public string EMail { get; set; }
    public string OCity { get; set; }
    public string OTown { get; set; }
    public string OTownCodeName { get; set; }
    public string OZipCode { get; set; }
    public string O_Address { get; set; }
    public string HCity { get; set; }
    public string HTown { get; set; }
    public string HTownCodeName { get; set; }
    public string HZipCode { get; set; }
    public string H_Address { get; set; }
    public string Recipient { get; set; }
    public string Inv_Money { get; set; }
    public string Inv_MoneyCodeName { get; set; }
    public string Analyst { get; set; }
    public string AnalystName { get; set; }
    public string Product { get; set; }
    public string ProductCodeName { get; set; }
    public string Program { get; set; }
    public string ProgramCodeName { get; set; }//電話來源
    public string M_Note { get; set; }
    public string M_Num { get; set; }
    public string M_Password { get; set; }
    public string Light_Status { get; set; }
    public string MRYGC_tag { get; set; }
    public string N_Call_tag { get; set; }
    public string N_Call_tagCodeName { get; set; }
    public string LongTag_Date { get; set; }
    public string add_date { get; set; }
    public string Change_date { get; set; }
    public string add_ip { get; set; }
    public string add_user { get; set; }
    public string Assign_Name { get; set; }
    public string Assign_Date { get; set; }
    public string DM_MarkTime { get; set; }
    public string DM_MC_Name { get; set; }
    //會期中商品
    public string Production { get; set; }

}