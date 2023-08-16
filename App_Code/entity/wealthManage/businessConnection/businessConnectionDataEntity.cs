using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// businessConnectionEntity 的摘要描述
/// </summary>
public class businessConnectionDataEntity
{
    public businessConnectionDataEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string f_id { get; set; }
    public string M_ID { get; set; }
    public string M_Name { get; set; }
    public string Light_Status { get; set; }
    public string add_date { get; set; }
    public string add_user { get; set; }
    public string MP_ID { get; set; }
    public string CF_Item { get; set; }
    //public string U_LeaderName { get; set; }
    //public string U_LeaderStatus { get; set; }
    //public string EX_Name { get; set; }
    //public string EX_Status { get; set; }
    //public string EX_LeaderName { get; set; }
    //public string EX_LeaderStatus { get; set; }
 
    public string F_Status { get; set; }
    public string ObjName { get; set; }
    public string Light_StatusName { get; set; }
    public string CF_ItemName { get; set; }
    public string MP_IDName { get; set; }
    public string add_userName { get; set; }
    public string F_StatusName { get; set; }
    /// <summary>
    /// ////////////////
    /// </summary>
    public string No { get; set; } //單號

    public string Obj { get; set; } //件別(代號)
    public string Obj_Name { get; set; } //件別(代號)名稱
    //public string U_LeaderName { get; set; } //單:姓名
    public string U_LeaderName { get; set; } //單:姓名
    public string EX_StatusName { get; set; } //行:姓名
    public string EX_LeaderName { get; set; } //主:姓名
    public string EX_Name { get; set; }//行:姓名核可狀態
    public string U_LeaderStatus { get; set; } //單:姓名核可狀態
    public string EX_Status { get; set; } //行:姓名核可狀態
    public string EX_LeaderStatus { get; set; } //主:姓名核可狀態
    public string Date { get; set; } //提案日期

    public string Propser { get; set; } //提案人
    public string Propser_DEPT { get; set; } //提案人1部門代號(由[MMBER]的mc_com)
    public string Propser_DEPT_Name { get; set; } //提案人1部門名稱(由[MMBER]的mc_com)

    public string Name { get; set; } //會員姓名

    public string MC { get; set; } //分析師

    public string MC_Name { get; set; } //分析師姓名

    public string Contact { get; set; } //聯絡單種類

    public string Contact_Name { get; set; } //聯絡單種類名稱

    public string LightStatus { get; set; } //燈號

    public string CaseStatus { get; set; } //件別

   // public string addUserComID { get; set; }
   // public string addUserComIDName { get; set; }

}