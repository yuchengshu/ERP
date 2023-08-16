using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class wealthManage_administrativeCheck_idCheck_WIDUPL_idCheck : System.Web.UI.Page
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
        return Request.Params["MENU_no"].ToString();
    }
    public string getCustomerDetailMENU_no()
    {
        return Request.Params["CustomerDetailMENU_no"].ToString();
    }
}