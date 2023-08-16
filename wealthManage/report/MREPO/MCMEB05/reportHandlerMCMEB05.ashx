<%@ WebHandler Language="C#" Class="reportHandlerMCMEB05" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class reportHandlerMCMEB05 : IHttpHandler {

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string MP = string.Empty;
        string StartDate = string.Empty;
        string EndDate = string.Empty;
        string MC = string.Empty;
        string GroupType =string.Empty;
        string CaseType=string.Empty;
        string EmpType=string.Empty;
        string U_MDEP = string.Empty;
        string ComID = string.Empty;
        switch (action) {
             case "getAssistantPerformance":
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];
                U_MDEP = context.Request["U_MDEP"];
                ComID = context.Request["ComID"];
                MP =  context.Request["MP"];
                context.Response.Write(getAssistantPerformance(StartDate,EndDate,U_MDEP,ComID,MP));
                break;
            case "getAllAnalystListForPerformance":
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];
                context.Response.Write(getAllAnalystListForPerformance(StartDate,EndDate));
                break;
     
        };
    }

    public string getAssistantPerformance(string StartDate,string EndDate,string U_MDEP,string ComID,string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : "+StartDate+" 'EndDate' : "+EndDate+" 'U_MDEP' : "+U_MDEP+" 'ComID' : "+ComID+" 'MP' : "+MP, className, methodName);

        List<assistantPerformanceEntity> apeList = reportServiceMCMEB05.Instance.getAssistantPerformance( StartDate, EndDate, U_MDEP, ComID,MP);//<==========

        log.endWrite("'apeList' : "+apeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(apeList);
    }
    
    public string getAllAnalystListForPerformance(string StartDate,string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : "+StartDate+" 'EndDate' : "+EndDate, className, methodName);

        List<analystPerformanceEntity> apeList = reportServiceMCMEB05.Instance.getAllAnalystListForPerformance( StartDate, EndDate);//<==========

        log.endWrite("'apeList' : "+apeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(apeList);
    }


    public bool IsReusable {
        get {
            return false;
        }
    }

}