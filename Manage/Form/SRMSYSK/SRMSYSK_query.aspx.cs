﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_TKMMBER_MMBER_query : System.Web.UI.Page
{
    private string MS_ID = string.Empty;
    private string MENU_no = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (common.isEmpty(Request.Params["MENU_no"]))
        {
            MS_ID = Request.Params["MS_ID"].ToString();
            MENU_no = "";
        }
        else
        {
            MS_ID = "";
            MENU_no = Request.Params["MENU_no"].ToString();
        }
    }
    public string getRelativePath()
    {
        return "../../../";
    }
    public string getIP()
    {
        string IP = Session["IP"] == null ? "" : Session["IP"].ToString();
        return IP;

    }

    public string getMENU_no()
    {
        return MENU_no;
    }
    
}