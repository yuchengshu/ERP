using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class wealthManage_customerManage_MMBER_customerDetail : System.Web.UI.Page
{
    string U_Num = string.Empty;

    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    public string getU_Num()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        U_Num = Session["U_Num"] == null ? "" : Session["U_Num"].ToString();

        log.endWrite("'U_Num' : " + U_Num, className, methodName);
        return U_Num;
    }

    public string getMENU_no()
    {
        return Request.Params["MENU_no"].ToString();
    }
    public string getERPcustomerWebPayMENU_no()
    {
        return Request.Params["ERPcustomerWebPayMENU_no"].ToString();
    }

    public string getM_ID()
    {
        return Request.Params["M_ID"].ToString();
    }

    public string getU_MDEP()
    {
        string U_MDEP = Session["U_MDEP"] == null ? "" : Session["U_MDEP"].ToString();
        return U_MDEP;
    }

    public string getU_POSITION()
    {
        string U_POSITION = Session["U_POSITION"] == null ? "" : Session["U_POSITION"].ToString();
        return U_POSITION;
    }
    public string getU_Name()
    {
        string U_Name = Session["U_Name"] == null ? "" : Session["U_Name"].ToString();
        return U_Name;

    }

    public string getComID()
    {
        string ComID = Session["ComID"] == null ? "" : Session["ComID"].ToString();
        return ComID;
    }
    public string getU_LeaderName()
    {
        return Session["U_LeaderName"] == null ? "" : Session["U_LeaderName"].ToString();
    }
    public string getIP()
    {
        string IP = Session["IP"] == null ? "" : Session["IP"].ToString();
        return IP;

    }

    public string getRelativePath()
    {
        return "../../../../../";
    }


    


}