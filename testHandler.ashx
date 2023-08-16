<%@ WebHandler Language="C#" Class="testHandler" %>

using System;
using System.Web;
using System.IO;
using System.Text;

public class testHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write(deleteFile());
    }
    public string deleteFile () {
        string addr = "C:/Users/B0704161/Downloads/MyExcel.csv";
        string ss = string.Empty;
        if (File.Exists(addr))
        {
            FileStream fs = new FileStream(addr, FileMode.Open, FileAccess.Read);

            using (StreamReader sr = new StreamReader(fs, Encoding.Default))
            {
                string temp = "";
                string[] tempArr = null;
                int row = 0;
                while ((temp = sr.ReadLine()) != null)
                {
                    if (row == 5)
                    {
                        tempArr = temp.Split(',');
                        ss +=(tempArr[1].Split('.'))[0];
                    }


                    row++;
                }
            }
            File.Delete(addr);
        }

        return ss;
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}