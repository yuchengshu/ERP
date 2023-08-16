<%@ WebHandler Language="C#" Class="reportHandlerMVMEB07" %>


using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class reportHandlerMVMEB07 : IHttpHandler {
    
    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string MP = string.Empty;
        string StartDate = string.Empty;
        string EndDate = string.Empty;
        switch (action) {
            case "getAnalystSinglePerformance":
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];
                MP = context.Request["MP"];
                context.Response.Write(getAnalystSinglePerformance(StartDate,EndDate,MP));
                break;
        };
    }

    public string getAnalystSinglePerformance(string StartDate,string EndDate,string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : "+StartDate + " 'EndDate' : "+EndDate+ " 'MP' : "+MP, className, methodName);

        List<analystSinglePerformanceEntity> aspeList = reportServiceMVMEB07.Instance.getAnalystSinglePerformance(StartDate, EndDate, MP);//<==========
        log.endWrite("'aspeList' : "+aspeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(aspeList);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}