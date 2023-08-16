using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class wealthManage_custermerManage_MMBER_customerManage : System.Web.UI.Page
{
    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    public string getRelativePath()
    {
        return "../../../";
    }

    public string getMENU_no()
    {
        return Request.Params["MENU_no"].ToString();
    }

}