using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Web.Configuration;



/// <summary>
/// debug 的摘要描述
/// </summary>
public class log
{
    public log()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public static string ip { get; set; }
    public static string U_Name { get; set; }
    public static string U_Num { get; set; }

    public static void debug2(string content, string className, string methodName)
    {
        write(content, "偵錯2", className, methodName);
    }

    public static void debug(string content, string className, string methodName)
    {
        write(content, "偵錯", className, methodName);
    }

    public static void startWrite(string content ,string className, string methodName)
    {

        //write(content,"開始", className, methodName);
    }

    public static void endWrite(string content, string className, string methodName)
    {
        //write(content,"結束", className, methodName);
    }

    public static void write(string content, string logType,string className, string methodName)
    {
       
        string logPlace = WebConfigurationManager.AppSettings["logPlace"].ToString();
        DateTime dt = DateTime.Now;
        string year = dt.Year.ToString();
        string month = dt.Month.ToString().Length > 1 ? dt.Month.ToString() : "0" + dt.Month.ToString();
        string day = dt.Day.ToString().Length > 1 ? dt.Day.ToString() : "0" + dt.Day.ToString();
        string dateDirPath = logPlace + year + month + day;
        string logPath = dateDirPath + "\\log.txt";
        string userLogPath = dateDirPath + "\\" + U_Num + ".txt";

        if (!Directory.Exists(dateDirPath))
        {
            Directory.CreateDirectory(dateDirPath);
        }
        if (logType != "偵錯2")
        {
            fileStreamWriter(logPath, makeLogContent(content, logType, className, methodName));
            fileStreamWriter(userLogPath, makeLogContent(content, logType, className, methodName));
        }
        else
        {
            fileStreamWriter("D:\\Log.txt", makeLogContent(content, logType, className, methodName));
        }
        
    }

    public static void fileStreamWriter(string path,string content)
    {
        FileStream FsRead = File.Open(path, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.ReadWrite);
        StreamReader Sreader = new StreamReader(FsRead);
        string strSr = Sreader.ReadToEnd();
        Sreader.Dispose();
        FsRead.Dispose();
        FileStream FsWrite = File.Open(path, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.ReadWrite);
        StreamWriter Swriter = new StreamWriter(FsWrite);
        Swriter.WriteLine(strSr);
        Swriter.WriteLine(content);
        Swriter.Dispose();
        FsWrite.Dispose();
    }

    public static string makeLogContent(string content, string startEnd, string className, string methodName)
    {
        StringBuilder sb = new StringBuilder();
        DateTime dt = DateTime.Now;
        sb.Append(dt.ToString());

        if (startEnd == "開始")
        {
            sb.Append("**開始**");
        }
        else if (startEnd == "結束")
        {
            sb.Append("**結束**");
        }
        sb.Append("[");
        sb.Append(ip);
        sb.Append("]");
        sb.Append("{");
        sb.Append(U_Num);
        sb.Append("-");
        sb.Append(U_Name);
        sb.Append("}");
        sb.Append("[");
        if (startEnd == "開始")
        {
            sb.Append("去");
        }
        else if (startEnd == "結束")
        {
            sb.Append("回");
        }
        
        sb.Append(className);
        sb.Append(".");
        sb.Append(methodName);
        if (startEnd == "開始")
        {
            sb.Append("] 接收參數==>");
        }
        else if (startEnd == "結束")
        {
            sb.Append("] 回傳參數==>");
        }
        sb.Append(content);
        return sb.ToString();
    }

}