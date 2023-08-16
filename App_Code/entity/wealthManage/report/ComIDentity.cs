using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// ComIDentity 的摘要描述
/// </summary>
public class ComIDentity
{
    public ComIDentity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string ComID { get; set; }
    public string ComIDname { get; set; }
    public List<DEPARentity> depList { get; set; }
}