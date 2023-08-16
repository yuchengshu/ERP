<%@ WebHandler Language="C#" Class="reportHandlerMVMEB06" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class reportHandlerMVMEB06 : IHttpHandler {

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        switch (action) {
            case "getMemberSessionStatus":
                getMemberSessionStatusParamEntity gmsspe = new getMemberSessionStatusParamEntity();
                gmsspe.admissionStartDate = context.Request["admissionStartDate"];
                gmsspe.admissionEndDate = context.Request["admissionEndDate"];
                gmsspe.maturityStartDate = context.Request["maturityStartDate"];
                gmsspe.maturityEndDate = context.Request["maturityEndDate"];
                gmsspe.accountStartDate = context.Request["accountStartDate"];
                gmsspe.accountEndDate = context.Request["accountEndDate"];
                gmsspe.MP = context.Request["MP"];
                gmsspe.M_Item = context.Request["M_Item"];
                context.Response.Write(getMemberSessionStatus(gmsspe));
                break;
        };
    }

    public string getMemberSessionStatus(getMemberSessionStatusParamEntity gmsspe)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'gmsspe' : "+gmsspe.ToString() , className, methodName);

        List<memberSessionStatusEntity> msseList = reportServiceMVMEB06.Instance.getMemberSessionStatus(gmsspe);//<==========

        log.endWrite("'msseList' : "+msseList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(msseList);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}