using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// muserEntity 的摘要描述
/// </summary>
public class MPMMTELEntity
{
    public MPMMTELEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    //日期
    public string V_Date { get; set; }
    //地點
    public string V_Site { get; set; }
    //分析師
    public string MP_Name { get; set; }
    //節目種類
    public string ddesc { get; set; }
    public string KEY { get; set; }

    public string MT_ID;//[MT_ID][decimal](18, 0) IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    public string MT_Date { get; set; }//[MT_Date][datetime] NULL,

    public string MT_Teacher; //[MT_Teacher][varchar] (8) NULL,

    public string MT_Teacher_Com; //[MT_Teacher_Com][char](10) NULL,
    
    public string MT_Program; //[MT_Program][varchar] (5) NULL,
    
    public string MT_Okey; //[MT_Okey][char](2) NULL,
    
    public string MT_Nkey; //[MT_Nkey][char](2) NULL,
    
    public string MT_Item; //[MT_Item][char](4) NULL,
    
    public string del_tag; //[del_tag][char](1) NULL,
    
    public string add_user; //[add_user][varchar] (8) NULL,
    
    public string add_ip; //[add_ip][varchar] (15) NULL,
    
    public string add_date; //[add_date][datetime] NULL,
    
    public string edit_user; //[edit_user][varchar] (8) NULL,
    
    public string edit_ip; //[edit_ip][varchar] (15) NULL,
    
    public string edit_date; //[edit_date][datetime] NULL,

}