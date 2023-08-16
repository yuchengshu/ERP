using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MMTELdataEntity 的摘要描述
/// </summary>
public class MMTELdataEntity
{
    public MMTELdataEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //日期
    public string MT_Date { get; set; }
    //分析師
    public string MT_Teacher { get; set; }
    //節目名稱
    public string MT_Program { get; set; }

    public string TV_Program_Name { get; set; }
    //可key
    public string MT_Okey { get; set; }
    //不可key
    public string MT_Nkey { get; set; }

    ////節目種類
    public string ddesc { get; set; }
    ////節目頻道(節目名稱=節目頻道+節目時間)
    public string P_Channel { get; set; }
    ////節目時間(節目名稱=節目頻道+節目時間)
    public string P_Time { get; set; }
    //建檔人員
    public string add_user { get; set; }
    //建檔人員
    public string add_UserName { get; set; }
}