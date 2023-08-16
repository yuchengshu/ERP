<%@ WebHandler Language="C#" Class="reportHandlerMPMEB01" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class reportHandlerMPMEB01 : IHttpHandler {

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string MP = string.Empty;
        string StartDate = string.Empty;
        string EndDate = string.Empty;
        switch (action) {
            case "getMemberCountInSession":
                MP = context.Request["MP"];
                context.Response.Write(getMemberCountInSession(MP));
                break;
            case "getAnalystSinglePerformance":
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];
                MP = context.Request["MP"];
                string M_Item = context.Request["M_Item"];
                string caseType = context.Request["caseType"];
                context.Response.Write(getAnalystSinglePerformance(StartDate,EndDate,MP,M_Item,caseType));
                break;
        };
    }

    public string getMemberCountInSession(string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'MP' : "+MP, className, methodName);

        List<analystSinglePerformanceEntity> aspeList = reportServiceMPMEB01.Instance.getMemberCountInSession(MP);//<==========

        log.endWrite("'aspeList' : "+aspeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(aspeList);
    }

   public string getAnalystSinglePerformance(string StartDate,string EndDate,string MP,string M_Item,string caseType)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : "+StartDate + " 'EndDate' : "+EndDate+ " 'MP' : "+MP+ " 'M_Item' : "+M_Item+ " 'caseType' : "+caseType, className, methodName);

        List<analystSinglePerformanceEntity> aspeList = reportServiceMPMEB01.Instance.getAnalystSinglePerformance(StartDate, EndDate, MP, M_Item,caseType);//<==========
        log.endWrite("'aspeList' : "+aspeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(aspeList);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}