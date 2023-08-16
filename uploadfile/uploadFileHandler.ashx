<%@ WebHandler Language="C#" Class="uploadFileHandler" %>

using System;
using System.Web;

public class uploadFileHandler : IHttpHandler
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public void ProcessRequest(HttpContext context)
    {
        string id = "";
        HttpFileCollection files = System.Web.HttpContext.Current.Request.Files;
        HttpPostedFile file = files[0];
        context.Response.ContentType = "text/plain";
        string File_name = "";
        try
        {
            id = context.Request.Form["id"];
            File_name = context.Request.Form["File_name"];
            var File_num = context.Request.Form["File_num"];
            var File_Folder = context.Request.Form["File_Folder"];
            var add_User = context.Request.Form["add_User"];
            var add_ip = context.Request.Form["add_ip"];
        }
        catch (Exception)
        {


        }
        id = context.Request.Form["id"];
        //HttpPostedFile file="";
        string File_Title = File_name;
        string[] name = File_Title.Split('.');
        string filenameExtension = name[1];//副檔名
        string fileName = File_name;
        addFileUpload ufe = new addFileUpload();
        try
        {

        }
        catch (Exception)
        {


        }
        //addFileUpload ufe = new addFileUpload();
        try
        {
            ufe.File_Folder = context.Request.Form["File_Folder"];
        }
        catch (Exception)
        {


        }
        //ufe.File_Folder = context.Request.Form["File_Folder"];
        try
        {
            ufe.File_num = context.Request.Form["File_num"];
        }
        catch (Exception)
        {


        }
        //ufe.File_num = context.Request.Form["File_num"];
        common.getDateTime();
        string tempFileName1= common.year + common.month + common.day + common.hour + common.minute + common.second + "_" ;
        string tempFileName2 = common.getRandom1() + "_" + common.getRandom2() + "." + filenameExtension;
        string tempFileName = tempFileName1 + tempFileName2;
        if (ufe.File_Folder == "MSYSK" || ufe.File_Folder == "BOARD" || ufe.File_Folder == "MMAIL" || ufe.File_Folder == "MMAIL")//(||)"OR,(&&)AND
        {
            // ufe.File_Title = name[0] + "." + filenameExtension;
        }
        else
        {
            ufe.File_Title = tempFileName;
        }

        ufe.File_Name = tempFileName;
        ufe.add_user = context.Request.Form["add_User"];
        ufe.add_ip = context.Request.Form["add_ip"];


        //進行檔案上傳動作
        file.SaveAs(context.Server.MapPath("~/uploadfile/" + ufe.File_Folder + "/" + ufe.File_Name));//進行檔案複製上傳動作
        context.Response.Write(insertUpLoadData(ufe));//進行上傳檔案內容寫入資料庫
    }

    //將上傳檔案內容寫入資料庫
    public string insertUpLoadData(addFileUpload ufe)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'File_Folder' : " + ufe.File_Folder + "'File_num' : " + ufe.File_num + "'File_Title' : " + ufe.File_Title + "'File_Name' : " + ufe.File_Name + "'add_user' : " + ufe.add_user + "'add_ip' : " + ufe.add_ip, className, methodName);

        UploadFilehgDao.Instance.addFileUpload(ufe);
        string backStr = "";
        log.endWrite("'backStr' : " + backStr, className, methodName);
        return backStr;
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}