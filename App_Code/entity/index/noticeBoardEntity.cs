using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// noticeBoardEntity 的摘要描述
/// </summary>
public class noticeBoardEntity
{
    public noticeBoardEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string account_total { get; set; }
    public string adver_id { get; set; }
    public string adver_item { get; set; }
    public string adver_dep { get; set; }
    public string adver_subject { get; set; }
    public string adver_content { get; set; }
    public string adver_depart_id { get; set; } //發布單位代號
    public string adver_employ_id { get; set; } //發布者代號
    public string adver_create_date { get; set; }
    public string adver_depName { get; set; }//發布對象(adver_dep)

    public string adver_ComName { get; set; }
    public string adver_depart_Name { get; set; }
    public string adver_employ_Name { get; set; }
    public string F_ID { get; set; }
    public string File_Folder { get; set; }
    public string File_num { get; set; }
    public string File_Title { get; set; }
    public string File_Name { get; set; }
    public string adver_employ_ComIDname { get; set; }
    public string adver_employ_U_MDEPname { get; set; }
}