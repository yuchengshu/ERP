using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.IO;

public partial class public_Mail_MMAIL_mail : System.Web.UI.Page
{
    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
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
    public string getMS_ID()
    {
        return MS_ID;
    }
    public string getMENU_no()
    {
        return MENU_no;
    }

   

}