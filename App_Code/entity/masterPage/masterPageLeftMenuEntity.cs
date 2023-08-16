using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// 用於 masterPage頁產出LeftMenu結構
/// </summary>
public class masterPageLeftMenuEntity
{
    public masterPageLeftMenuEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string level1 { get; set; }
    public string level2 { get; set; }
    public string level3 { get; set; }
    public string level { get; set; }
    public string menuLocation { get; set; }
    public string menuName { get; set; }
    public string auto_id { get; set; }
}