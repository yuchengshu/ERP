<%@ WebHandler Language="C#" Class="reportHandlerMCMEB02" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class reportHandlerMCMEB02 : IHttpHandler {
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string StartDate = string.Empty;
        string EndDate = string.Empty;
        string U_MDEP = string.Empty;
        string ComID = string.Empty;
        switch (action) {

            case "getTotalPerformanceTable":
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];
                U_MDEP = context.Request["U_MDEP"];
                ComID = context.Request["ComID"];
                context.Response.Write(getTotalPerformanceTable(StartDate,EndDate,ComID,U_MDEP));
                break;
            case "getDetailPerformanceTable":
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];
                U_MDEP = context.Request["U_MDEP"];
                ComID = context.Request["ComID"];
                context.Response.Write(getDetailPerformanceTable(StartDate,EndDate,ComID,U_MDEP));
                break;
           case "getAssistantDetailPerformanceTable":
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];
                U_MDEP = context.Request["U_MDEP"];
                ComID = context.Request["ComID"];
                string MC = context.Request["MC"];
                context.Response.Write(getAssistantDetailPerformanceTable(StartDate,EndDate,ComID,U_MDEP,MC));
                break;

                    
                    
        };
    }

    public string getTotalPerformanceTable(string StartDate,string EndDate,string ComID,string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : "+StartDate+" 'EndDate' : "+EndDate+" 'ComID' : "+ComID+" 'U_MDEP' : "+U_MDEP, className, methodName);

       List<List<totalPerformanceEntity>> tpeList = reportServiceMCMEB02.Instance.getTotalPerformanceTable(StartDate, EndDate, ComID, U_MDEP);//<==========

        log.endWrite("'tpeList' : "+tpeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(tpeList);
    }
    
    public string getDetailPerformanceTable(string StartDate,string EndDate,string ComID,string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : "+StartDate+" 'EndDate' : "+EndDate+" 'ComID' : "+ComID+" 'U_MDEP' : "+U_MDEP, className, methodName);

       List<detailPerformanceEntity> dpeList = reportServiceMCMEB02.Instance.getDetailPerformanceTable(StartDate, EndDate, ComID, U_MDEP);//<==========

        log.endWrite("'dpeList' : "+dpeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(dpeList);
    }

    public string getAssistantDetailPerformanceTable(string StartDate,string EndDate,string ComID,string U_MDEP,string MC)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : "+StartDate+" 'EndDate' : "+EndDate+" 'ComID' : "+ComID+" 'U_MDEP' : "+U_MDEP+" 'MC' : "+MC, className, methodName);

       List<List<detailPerformanceEntity>> dpeListList = reportServiceMCMEB02.Instance.getAssistantDetailPerformanceTable(StartDate, EndDate, ComID, U_MDEP,MC);//<==========

        log.endWrite("'dpeListList' : "+dpeListList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(dpeListList);
    }


    public bool IsReusable {
        get {
            return false;
        }
    }

}