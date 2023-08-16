using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// SRMSYSKentity 的摘要描述
/// </summary>
public class SRMSYSKentity
{
    public SRMSYSKentity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string U_Name { get; set; }//分析師

    public string File_Title { get; set; } //檔案標題

    public string File_name { get; set; } //檔案路徑
    public string File_num { get; set; }

    public string add_date { get; set; } //日期

    public string MF_ID { get; set; }

    public string File_Path { get; set; }
}