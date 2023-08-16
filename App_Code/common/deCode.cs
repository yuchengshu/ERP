using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// deCode 的摘要描述
/// </summary>
public class deCode
{
    public deCode()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public static string Light_Status(string Light_Status)
    {
        string backString = string.Empty;
        switch (Light_Status)
        {
            case "G":
                backString = "綠燈";
                break;
            case "Y":
                backString = "黃燈";
                break;
            case "R":
                backString = "紅燈";
                break;
        }
        return backString;
    }
    public static string F_Status(string F_Status)
    {
        string backString = string.Empty;
        switch (F_Status)
        {
            case "1":
                backString = "處理中";
                break;
            case "2":
                backString = "處理失敗";
                break;
            case "3":
                backString = "完成";
                break;
        }
        return backString;
    }
    public static string personStatus(string status)
    {
        string backString = string.Empty;
        switch (status)
        {
            case "1":
                backString = "核准";
                break;
            case "2":
                backString = "退回";
                break;
            default:
                backString = "未簽核";
                break;
        }
        return backString;
    }

    public static string Results_Item(string Results_Item)
    {
        string backString = string.Empty;
        switch (Results_Item)
        {
            case "0001":
                backString = "一般件";
                break;
            case "0002":
                backString = "獎勵件";
                break;
        }
        return backString;
    }

    public static string T_Type(string T_Type)
    {
        string backString = string.Empty;
        switch (T_Type)
        {
            case "0001":
                backString = "一般件";
                break;
            case "0002":
                backString = "會場件";
                break;
            case "0003":
                backString = "特殊件";
                break;
        }
        return backString;
    }

    public static string Fax(string Fax)
    {
        string backString = string.Empty;
        switch (Fax)
        {
            case "1":
                backString = "設(自取)";
                break;
            case "2":
                backString = "設(網路傳真)";
                break;
            case "3":
                backString = "不設";
                break;
            case "4":
                backString = "設解盤";
                break;
            case "5":
                backString = "設特別";
                break;
            case "6":
                backString = "設飆股";
                break;
        }
        return backString;
    }

    public static string Mess(string Mess)
    {
        string backString = string.Empty;
        switch (Mess)
        {
            case "1":
                backString = "設";
                break;
            case "2":
                backString = "不設";
                break;
            case "3":
                backString = "業務自帶";
                break;
            case "4":
                backString = "特助或行政帶";
                break;
            case "5":
                backString = "設解盤";
                break;
            case "6":
                backString = "設特別";
                break;
            case "7":
                backString = "設飆股";
                break;
        }
        return backString;
    }

    public static string Media(string Media)
    {
        string backString = string.Empty;
        switch (Media)
        {
            case "1":
                backString = "設";
                break;
            case "2":
                backString = "不設";
                break;
            default:
                backString = "無";
                break;

        }
        return backString;
    }

    public static string INV_Open_Item(string INV_Open_Item)
    {
        string backString = string.Empty;
        switch (INV_Open_Item)
        {
            case "1":
                backString = "系統";
                break;
            case "2":
                backString = "手開";
                break;
        }
        return backString;
    }


    public static string CMonth(string CMonth)
    {
        string backString = string.Empty;
        switch (CMonth)
        {
            case "1":
                backString = "當月";
                break;
            case "2":
                backString = "次月";
                break;
        }
        return backString;
    }

    public static string INV_ITEM(string INV_ITEM)
    {
        string backString = string.Empty;
        switch (INV_ITEM)
        {
            case "1":
                backString = "二聯";
                break;
            case "2":
                backString = "三聯";
                break;
        }
        return backString;
    }

    public static string T_Ivo(string T_Ivo)
    {
        string backString = string.Empty;
        switch (T_Ivo)
        {
            case "1":
                backString = "正常";
                break;
            case "2":
                backString = "空白信封";
                break;
            case "3":
                backString = "發票轉交業務";
                break;
            case "4":
                backString = "不寄";
                break;
            case "5":
                backString = "捐贈";
                break;
        }
        return backString;
    }

    public static string S_tag(string S_tag)
    {
        string backString = string.Empty;
        switch (S_tag)
        {
            case "1":
                backString = "暫停";
                break;
            case "0":
                backString = "恢復";
                break;
         
        }
        return backString;
    }

    public static string C_tag(string C_tag)
    {
        string backString = string.Empty;
        switch (C_tag)
        {
            case "1":
                backString = "不折讓";
                break;
            case "0":
                backString = "折讓";
                break;

        }
        return backString;
    }

    public static string DM_tag(string DM_tag)
    {
        string backString = string.Empty;
        switch (DM_tag)
        {
            case "1":
                backString = "派發註記";
                break;
            case "2":
                backString = "長註記";
                break;

        }
        return backString;
    }

}