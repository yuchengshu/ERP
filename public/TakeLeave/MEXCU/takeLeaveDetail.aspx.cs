using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class public_TakeLeave_MEXCU_takeLeaveDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string getRelativePath()
    {
        return "../../../";
    }

    public string getMenuNo()
    {
        return Request.Params["MENU_no"];
    }

    public string getEXid()
    {
        return Request.Params["EX_id"];
    }

    public string getUnum()
    {
        return Request.Params["U_Num"];
    }
    public string getMS_ID()
    {
        return Request.Params["MS_ID"];
    }
}