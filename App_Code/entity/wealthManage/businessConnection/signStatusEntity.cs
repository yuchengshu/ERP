using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;


/// <summary>
/// signStatusEntity 的摘要描述
/// </summary>
public class signStatusEntity
{
    public signStatusEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //businessConnectionHandler.ashx
    public string f_id { get; set; }
    public string T_ID { get; set; }
    public string T_PType { get; set; }
    public string f_IN { get; set; }
    public string V_id { get; set; }
    public string V_Name { get; set; }
    public string signerType { get; set; }
    public string signerNameType { get; set; }
    public string signerStatusType { get; set; }
    public string U_Num { get; set; }
    public string U_Name { get; set; }
    public string psType { get; set; }
    public string ps { get; set; }
    public string status { get; set; }
    public string timeType { get; set; }
    public string add_ip { get; set; }
    public string M_Name { get; set; }
    public string MS_Receiver { get; set; }
    public string MENU_no { get; set; }
    public string type { get; set; }//聯絡單種類(簽核過要執行的動作)
    public string Results_Item { get; set; }
    public string add_User { get; set; }
    public string add_User_UNUM { get; set; }
    public string Special1_user { get; set; }
    public string Special1_userName { get; set; }
    public string T_accountmoney1 { get; set; }
    public string Special2_user { get; set; }
    public string Special2_userName { get; set; }
    public string T_accountmoney2 { get; set; }
    public string Special3_user { get; set; }
    public string Special3_userName { get; set; }
    public string T_accountmoney3 { get; set; }
    //T_Type
    public string T_Type { get; set; } //入會方式
    public string paymoney { get; set; }
    public string paymoney1 { get; set; }
    public string paymoney2 { get; set; }

    public string begindate_Date { get; set; }//入會時間

    public string enddate_Date { get; set; } //到期日期

    public string contractid { get; set; } //電子委任id

    public string ca_id { get; set; } //電子委任id
    public string Pay_Serial { get; set; } //電子委任id
    public string p_name { get; set; } //電子委任id

    public string price { get; set; } //電子委任id

    public string Mess { get; set; } //設訊

    public string MessText { get; set; } //設訊(狀態文字)

    public string Media { get; set; } //鎖碼影音
    public string MediaText { get; set; }//鎖碼影音(狀態文字)

    public string p_text { get; set; } //付費文章

    public string p_textTxt { get; set; } //付費文章(狀態文字)

    public string p_video { get; set; } //付費影音

    public string p_videoTxt { get; set; } //付費影音(狀態文字)

    public string CellPhone { get; set; }//設定手機

    public string atm { get; set; }//atm

    public string ccard_4Num { get; set; }//信用卡末四碼

    public string INV_open_ITEM { get; set; }//發票開立方式

    public string INV_ITEM { get; set; }//發票種類

    public string INV_ITEMTxt { get; set; }//發票種類(狀態文字)
    //INV_T_Ivo
    public string INV_T_Ivo { get; set; }//寄發狀況[發票種類]
    public string Fax { get; set; }//傳真

    public string FaxTxt { get; set; }//傳真(狀態文字)

 
    public string Other { get; set; }//其他

    public string OLDMC_name { get; set; } //責任助理(原助理)

    public string NEWMC_name { get; set; }//責任助理(更改為)

    public string Attach_Name { get; set; } //業績分類(歸屬)

    public string CMonth { get; set; } //業績分類(月份)

    public string other { get; set; }//業績分類(其他)




}
