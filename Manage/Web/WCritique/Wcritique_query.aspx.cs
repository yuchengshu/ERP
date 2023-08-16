using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Web_Wcritique_query : System.Web.UI.Page
{
    private string MS_ID = string.Empty;
    private string MENU_no = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {

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
    //public string getMENU_no()
    //{
    // return Request.Params["MENU_no"].ToString();
    //}
}