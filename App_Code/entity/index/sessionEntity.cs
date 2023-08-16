using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// sessionEntity 的摘要描述
/// </summary>
public class sessionEntity
{
    

    public sessionEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string U_Num { get; set; }
    public string U_Name { get; set; }
    public string U_MDEP { get; set; }
    public string U_EMail { get; set; }
    public string U_POSITION { get; set; }
    public string ComID { get; set; }
    public string ComLand { get; set; }
    public string IP { get; set; }
    public string U_Leader { get; set; }
    public string U_LeaderName { get; set; }
    public string LeaveDate { get;  set; }

    public string U_LeaderCom { get; set; }
}