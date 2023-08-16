<%@ WebHandler Language="C#" Class="reportHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class reportHandler : IHttpHandler {

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
            case "getReportList":
                string U_Num = context.Request["U_Num"];
                context.Response.Write(getReportList(U_Num));
                break;
        };
    }

    public string getReportList(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : "+U_Num, className, methodName);

        List<reportTabEntity> rteList = reportService.Instance.getReportList(U_Num);//<==========

        log.endWrite("'rteList' : "+rteList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(rteList);
    }


    public bool IsReusable {
        get {
            return false;
        }
    }

}