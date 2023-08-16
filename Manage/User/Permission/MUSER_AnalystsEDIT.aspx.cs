using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_User_MUSER_Analysts : System.Web.UI.Page
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
    
    public string getauto_id()
    {
        string auto_id = Request.Params["auto_id"].ToString();
        return auto_id;
    }

    public string getU_Num()
    {
        string U_Num = Request.Params["U_Num"].ToString();
        return U_Num;
    }
}