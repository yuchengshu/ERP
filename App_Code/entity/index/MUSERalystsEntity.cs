﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MREPOqueryEntity 的摘要描述
/// </summary>
public class MUSERalystsEntity
{
    public MUSERalystsEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string auto_id { get; set; } //序(PK)

    public string ProductName { get; set; } //產品名稱

    public string Code { get; set; } //代碼

    public string Sort { get; set; } //排序
    public string Repo_no { get; set; }
    public string per_open { get; set; }
    public string U_Num { get; set; }
    public string U_Name { get; set; }


    public string DEP_name { get; set; } //部門別
    public string REPO_no { get; set; }//代碼
    public string REPO_id { get; set; }//代碼
    public string REPO_name { get; set; } //報表名稱
    public string Note { get; set; } //備註

    public string DEP_id { get; set; }

    //public string DEP_name { get; set; }

    public string sort { get; set; }

    public string Type { get; set; }

    public string del_tag { get; set; }
    //public string per_open { get; set; } //開放權限
    //public string sort { get; set; }
    //public string Type { get; set; }
    //public string del_tag { get; set; }
}