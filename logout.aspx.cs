using log4net;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    static ILog logger = LogManager.GetLogger("Web");
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Abandon();//清除全部Session
        Server.Transfer("login.aspx");//返回登入頁
        //Session.Contents.RemoveAll();
        //logger.Debug("TEST20221109");
        //string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string ip = common.GetIP4Address();
        //log.ip = ip;
        //log.U_Num = "log";
        //log.U_Name = "尚未取得使用者姓名";
        //log.startWrite(common.nothing, className, methodName);

        //測試


        //string log4netPath = Server.MapPath("~/log4net.config");
        //log4net.Config.XmlConfigurator.ConfigureAndWatch(new System.IO.FileInfo(log4netPath));
        //logger.Debug("TEST20221104");

    }
    public string getRelativePath()
    {
        return "../../";
    }


    //下載檔案用(範例)
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //   //Request.Url.Host
    //    string host = Request.Url.Host;
    //    string File_Folder = "BOARD";//[File_Folder]
    //    string File_Name = "20220608121051_6827_7246.jpg";//[File_Name]
    //    string url = "/" + "Download.ashx?file=uploadfile/" + File_Folder + "/" + File_Name;
    //    Response.Redirect(url); 
    //}
}
