using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// uploadFileEntity 的摘要描述
/// </summary>
public class uploadFileEntity
{
    public uploadFileEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //取得詳細資料(標題 發佈時間 發佈人員[[U_Num-COMID-DEPAR] 附件 內文)
    //標題(adver_subject)
    public string adver_subject { get; set; }
    //發佈時間(adver_create_date)
    public string adver_create_date { get; set; }
    //發佈人員(U_Num)
    public string U_Num { get; set; }
    //發佈人員(COMID)
    public string COMID { get; set; }
    //發佈人員(DEPAR)
    public string DEPAR { get; set; }
    //附件(Attachment)
    public string Attachment { get; set; }
    //內文(adver_content)
    public string adver_content { get; set; }
    //取得詳細資料(標題 發佈時間 發佈人員[[U_Num-COMID-DEPAR] 附件 內文)
    public string F_ID { get; set; }
    public string File_Folder { get; set; }
    public string File_num { get; set; }
    public string File_Title { get; set; }//標題
    public string File_Name { get; set; }
    public string add_user { get; set; }
    public string add_date { get; set; }//發佈時間
    public string add_ip { get; set; }

    public string MP { get; set; }
    public string MPname { get; set; }




}