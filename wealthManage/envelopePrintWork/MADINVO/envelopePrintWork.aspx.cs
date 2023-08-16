using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class wealthManage_envelopePrintWork_MADINVO_envelopePrintWork : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string getRelativePath()
    {
        return "../../../../";
    }

    public string getMENU_no()
    {
        return Request.Params["MENU_no"];
    }

}