<%@ WebHandler Language="C#" Class="reportHandlerMCMEB01" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class reportHandlerMCMEB01 : IHttpHandler {

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
                string M_Item = context.Request["M_Item"];
                string ComID = context.Request["ComID"];
                string U_Num = context.Request["U_Num"];

                context.Response.Write(getAnalystSinglePerformance(StartDate,EndDate,MP,M_Item,ComID,U_Num));
                break;
        };
    }


    public string getAnalystSinglePerformance(string StartDate,string EndDate,string MP,string M_Item,string ComID,string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : "+StartDate + " 'EndDate' : "+EndDate+ " 'MP' : "+MP+ " 'M_Item' : "+M_Item+ " 'ComID' : "+ComID+ " 'U_Num' : "+U_Num, className, methodName);

        List<analystSinglePerformanceEntity> aspeList = reportServiceMCMEB01.Instance.getAnalystSinglePerformance(StartDate, EndDate, MP, M_Item, ComID, U_Num);//<==========

        log.endWrite("'aspeList' : "+aspeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(aspeList);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}