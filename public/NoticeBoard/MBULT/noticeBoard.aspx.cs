using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.IO;

public partial class public_MBULT_MBULT_noticeboard : System.Web.UI.Page
{
    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    private string MS_ID = string.Empty;
    private string MENU_no = string.Empty;
    private string detail = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!common.isEmpty(Request.Params["detail"]))
        {
            detail = Request.Params["detail"].ToString();
            MENU_no = "";
        }
        if (!common.isEmpty(Request.Params["MENU_no"]))
        {
            MENU_no = Request.Params["MENU_no"].ToString();
            MENU_no = "";
        }
        else
        {
            MS_ID = "";
            MENU_no = Request.Params["MENU_no"].ToString();
        }
        if (!common.isEmpty(Request.Params["MS_ID"]))
        {
            MS_ID = Request.Params["MS_ID"].ToString();
            MENU_no = "";
        }
        else
        {
            MS_ID = "";
            //MENU_no = Request.Params["MENU_no"].ToString();
        }
    }

    string U_Num = string.Empty;
    public string getU_Num()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        U_Num = Session["U_Num"] == null ? "" : Session["U_Num"].ToString();

        log.endWrite("'U_Num' : " + U_Num, className, methodName);
        return U_Num;
    }

    public string getRelativePath()
    {
        return "../../../";
    }
    public string getMS_ID()
    {
        return MS_ID;
        //return Request.Params["MS_ID"];
    }
    public string getMENU_no()
    {
        return MENU_no;
    }

   

}