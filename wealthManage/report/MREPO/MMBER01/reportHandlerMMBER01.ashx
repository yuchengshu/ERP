<%@ WebHandler Language="C#" Class="reportHandlerMMBER01" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class reportHandlerMMBER01 : IHttpHandler {
    
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string StartDate = string.Empty;
        string EndDate = string.Empty;
        switch (action) {
            case "getEmpData":
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];
                string dateType = context.Request["dateType"];
                string inoutService = context.Request["inoutService"];
                string empName = context.Request["empName"];
                context.Response.Write(getEmpData(StartDate,EndDate,dateType,inoutService,empName));
                break;
        }
    }

    public string getEmpData(string StartDate,string EndDate,string dateType,string inoutService,string empName)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : "+StartDate+" 'EndDate' : "+EndDate+" 'dateType' : "+dateType+" 'inoutService' : "+inoutService+" 'empName' : "+empName, className, methodName);

        List<EmpDataEntity> edeList = reportServiceMMBER01.Instance.getEmpData(StartDate,EndDate,dateType,inoutService,empName);//<==========

        log.endWrite("'edeList' : "+edeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(edeList);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}