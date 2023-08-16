using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class wealthManage_customerManage_MMBER_customerDetail : System.Web.UI.Page
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";
    string U_Num = string.Empty;

    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    public string getU_Leader()
    {
        string U_Leader = Session["U_Leader"] == null ? "" : Session["U_Leader"].ToString();
        return U_Leader;
    }

    public string getU_LeaderName(string Unum)
    {
        string U_LeaderName = Session["U_LeaderName"] == null ? "" : Session["U_LeaderName"].ToString();
        return U_LeaderName;
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
    //public string getERPcustomerWebPayMENU_no()
    //{
    //    return Request.Params["ERPcustomerWebPayMENU_no"].ToString();
    //}

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

    public string getMC_Name()
    {
        string M_ID_=Request.Params["M_ID"].ToString();
        string MC_Name=MUSERhgDao.Instance.getMC_Name(M_ID_);//<==========
        return MC_Name;
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