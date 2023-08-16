using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// nameAccountMoneyDataEntity 的摘要描述
/// </summary>
public class nameAccountMoneyDataEntity
{
    public nameAccountMoneyDataEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string code { get; set; }
    public string codeName { get; set; }
    public List<AccountMoneyDataEntity> amdeList { get; set; }
    public List<nameAccountMoneyDataEntity> nAmdeList { get; set; }
    public double backAccount_Money { get; set; }
}