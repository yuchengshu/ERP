using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_User_MUSER_query : System.Web.UI.Page
{
    private string MS_ID = string.Empty;
    private string MENU_no = string.Empty;
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
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
    public string getM_ID()
    {
        string M_ID = string.Empty;
        try
        {
            if (Request.Params["M_ID"] != null)
            {
                M_ID = Request.Params["M_ID"].ToString();
            }
            else
            {
                M_ID = "";
            }

        }
        catch (Exception)
        {

            M_ID = "";
        }
        return M_ID;
    }

    /// <summary>
    /// 取得員工編號
    /// </summary>
    /// <returns>員工編號</returns>
    public string getU_Num()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        string U_Num = Session["U_Num"] == null ? "" : Session["U_Num"].ToString();


        log.endWrite("'U_Num' : " + U_Num, className, methodName);
        return U_Num;
    }
    //<%="A"&right((year(date())-1911),2)&right("0"&month(date),2)&right("0"&day(date),2)&"1"%>> 
    //產生預設員工編號
    public string newU_Num()
    {
        System.Globalization.TaiwanCalendar tc = new System.Globalization.TaiwanCalendar();
        DateTime d = DateTime.Now;
        string U_Num = String.Format("{0}{1}{2}" + 1, tc.GetYear(d), tc.GetMonth(d), tc.GetDayOfMonth(d));
        U_Num = "A" + U_Num;
        return U_Num; 
    }

}