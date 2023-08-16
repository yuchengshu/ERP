using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_User_MFUNT_report : System.Web.UI.Page
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

    //傳入欲修改的員工編號
    public string getU_Num()
    {
        string U_Num = Context.Request["U_Num"];
        //sql連線字串 webconfig的對應位置
        //private static string connectionStrings = "sqlConnectHG_Test";
        //string U_Num = "";
        //取得此類別名稱
        string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        //U_Num= context.Request["U_Num"];
        //U_Num = Session["U_Num"] == null ? "" : Session["U_Num"].ToString();


        log.endWrite("'U_Num' : " + U_Num, className, methodName);
        return U_Num;
    }
    //傳入操作者的員工編號
    public string getEditU_Num()
    {
        string U_Num = string.Empty;
        string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        U_Num = Session["U_Num"] == null ? "" : Session["U_Num"].ToString();

        log.endWrite("'U_Num' : " + U_Num, className, methodName);
        return U_Num;
    }
}