using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// ProgramEntity 的摘要描述
/// </summary>
public class ProgramEntity
{
    public ProgramEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string P_Channel { get; set; }
    public string P_Time { get; set; }
    public string P_Date { get; set; }
    public string U_num { get; set; }
    public string P_ID { get; set; }
    public int MT_Okey { get; set; }
    public int MT_Nkey { get; set; }
    public int MT_Tkey { get; set; }
    public int weekTotalMT_Okey { get; set; }
    public int weekTotalMT_Nkey { get; set; }
    public int weekTotalMT_Tkey { get; set; }


}