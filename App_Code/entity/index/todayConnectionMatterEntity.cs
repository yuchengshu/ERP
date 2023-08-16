using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// todayConnectionMatterEntity 的摘要描述
/// </summary>
public class todayConnectionMatterEntity
{
    public todayConnectionMatterEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string M_ID { get; set; }
    public string Q_Date { get; set; }
    public string Q_Name { get; set; }
    public string Question { get; set; }
    public string N_Date { get; set; }
    public string N_Item { get; set; }
    public string Add_User { get; set; }
    public string M_Name { get; set; }
    public string U_Name { get; set; }
    public string ddesc { get; set; }
    public bool MMBERm_idEqualMQUSTm_ID { get; set; }
    public bool MITEMditcodeEqualMQUSTn_Item { get; set; }

}