<%@ WebHandler Language="C#" Class="Download" %>

using System;
using System.Web;
using System.IO;
    //http://localhost:13333/Download.ashx?file=img/Y.png
    //http://localhost:13333/Download.ashx?file=uploadfile/BOARD/20220608121051_6827_7246.jpg//下載檔案的範例格式
    //http://localhost:13333/Download.ashx?file=uploadfile/[File_Folder]/[File_Name]
    //Request.Url.Host
    //https://blog.miniasp.com/post/2008/02/10/How-Do-I-Get-Paths-and-URL-fragments-from-the-HttpRequest-object
    //下載檔案的網址
public class Download : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string file = context.Request.QueryString["file"];

        if (!string.IsNullOrEmpty(file) && File.Exists(context.Server.MapPath(file)))
        {
            context.Response.Clear();
            context.Response.ContentType = "application/octet-stream";
            context.Response.AddHeader("content-disposition", "attachment;filename=" + Path.GetFileName(file));
            context.Response.WriteFile(context.Server.MapPath(file));
            // This would b e the ideal spot to collect some download statistics and / or tracking
            // also, you could implement other requests, such as delete the file after download
            context.Response.End();        

        }
        else
        {
            context.Response.ContentType = "text/plain";
            context.Response.Write("File not be found!");
                

        }
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}