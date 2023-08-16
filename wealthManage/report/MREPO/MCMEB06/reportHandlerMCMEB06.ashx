<%@ WebHandler Language="C#" Class="reportHandlerMCMEB06" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class reportHandlerMCMEB06 : IHttpHandler {
    
    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string MP = string.Empty;
        string StartDate = string.Empty;
        string EndDate = string.Empty;
        switch (action) {
             case "getSendMessageCost":
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];
                MP =  context.Request["MP"];
                context.Response.Write(getSendMessageCost(StartDate,EndDate,MP));
                break;

     
        };
    }

    public string getSendMessageCost(string StartDate,string EndDate,string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : "+StartDate+" 'EndDate' : "+EndDate+" 'MP' : "+MP, className, methodName);

        List<sendMessageCostEntity> smceList = reportServiceMCMEB06.Instance.getSendMessageCost( StartDate, EndDate,MP);//<==========

        log.endWrite("'smceList' : "+smceList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(smceList);
    }

 
    public bool IsReusable {
        get {
            return false;
        }
    }

}