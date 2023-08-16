using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// emailEntity 的摘要描述
/// </summary>
public class emailEntity
{
    public emailEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    
    public string MS_ID { get; set; }
    public string MS_Sender { get; set; }
    public string MS_Receiver { get; set; }
    public string MS_Title { get; set; }
    public string MS_Text { get; set; }
    public string read_tag { get; set; }
    public string add_Date { get; set; }
    public string add_User { get; set; }
    public string add_ip { get; set; }
    public string MS_SenderName { get; set; }
    //20220624新增
    //附件adver_file
    public string adver_file { get; set; }
    public string File_Title { get; set; }

    public string adver_content { get; set; }

    public string COMID { get; set; }
    public string DEPAR { get; set; }

    public string File_Folder { get; set; }

    public string File_Name { get; set; }
    //
}