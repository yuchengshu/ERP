using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class wealthManage_businessConnection_MPMCOTF_businessConnectionDetail : System.Web.UI.Page
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

    
    
    //public string getMENU_no()
    //{
    //    return Request.Params["MENU_no"].ToString();
    //}

    public string getf_id()
    {
       // return Request.Params["f_id"].ToString();
    return Request.Form["f_id"].ToString();
    }

    public string getU_MDEP()
    {
        string U_MDEP = Session["U_MDEP"] == null ? "" : Session["U_MDEP"].ToString();
        return U_MDEP;
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
    public string getIP()
    {
        string IP = Session["IP"] == null ? "" : Session["IP"].ToString();
        return IP;
      
    }
    public string getM_ID()
    {
        //return Request.Params["M_ID"].ToString();
        return Request.Form["M_ID"].ToString();
    }


    public string getRelativePath()
    {
        return "../../../";
    }
}