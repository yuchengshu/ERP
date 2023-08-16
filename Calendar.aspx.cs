using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Calendar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        string sScript = "";
        string sTextBoxID = "";
        sTextBoxID = Request.QueryString["TextBox1"];
        sScript = "window.opener.document.getElementById('" + sTextBoxID + "').value='" + Calendar1.SelectedDate.Date + "';";
        sScript = sScript + "window.close();";
        ClientScript.RegisterStartupScript(this.GetType(), "_Calendar", sScript, true);
    }
}