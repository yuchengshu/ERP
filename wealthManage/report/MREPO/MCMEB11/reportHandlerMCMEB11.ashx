<%@ WebHandler Language="C#" Class="reportHandlerMCMEB11" %>
using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class reportHandlerMCMEB11 : IHttpHandler {

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string StartDate = string.Empty;
        string EndDate = string.Empty;
        string ComID = string.Empty;
        string type = string.Empty;
        switch (action) {
            case "getInternetBusinessPerformance":
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];
                ComID = context.Request["ComID"];
                type = context.Request["type"];
                context.Response.Write(getInternetBusinessPerformance(StartDate,EndDate,ComID,type));
                break;
            case "getTransactionCount":
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];
                context.Response.Write(getTransactionCount(StartDate,EndDate));
                break;
        };
    }

    public string getInternetBusinessPerformance(string StartDate,string EndDate,string ComID,string type)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : "+StartDate+" 'EndDate' : "+EndDate+" 'ComID' : "+ComID+" 'type' : "+type, className, methodName);
        List<detailPerformanceEntity> tpeList = null;
        switch (type)
        {
            case "lockVideo":
                tpeList = reportServiceMCMEB11.Instance.getPerformanceForLockVideo(StartDate, EndDate, ComID, type);//<==========
                break;
            case "activityFormTransaction":
                tpeList = reportServiceMCMEB11.Instance.getPerformanceForActivityFormTransaction(StartDate, EndDate, ComID, type);//<==========
                break;
            case "importListTransaction":
                tpeList = reportServiceMCMEB11.Instance.getPerformanceForImportListTransaction(StartDate, EndDate, ComID, type);//<==========
                break;
            case "getReportTransaction":
                tpeList = reportServiceMCMEB11.Instance.getPerformanceForGetReportTransaction(StartDate, EndDate, ComID, type);//<==========
                break;
        }


        log.endWrite("'tpeList' : "+tpeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(tpeList);
    }

    public string getTransactionCount(string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : "+StartDate+" 'EndDate' : "+EndDate, className, methodName);

        List<string> strList = reportServiceMCMEB11.Instance.getTransactionCount(StartDate, EndDate);//<==========

        log.endWrite("'strList' : "+strList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(strList);
    }



    public bool IsReusable {
        get {
            return false;
        }
    }

}