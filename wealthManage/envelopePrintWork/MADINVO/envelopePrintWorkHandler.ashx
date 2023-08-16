<%@ WebHandler Language="C#" Class="envelopePrintWorkHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;
using System.IO;

public class envelopePrintWorkHandler : IHttpHandler {

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string StartDate = string.Empty;
        string EndDate = string.Empty;
        switch (action)
        {
            case"getPrintData":
                if (!common.isEmpty(context.Request["StartDate"]))
                {
                    StartDate = common.datepickerStrToDatetimeStr(context.Request["StartDate"]);
                }
                if (!common.isEmpty(context.Request["EndDate"]))
                {
                    StartDate = common.datepickerStrToDatetimeStr(context.Request["EndDate"]);
                }

                string M_Num = context.Request["M_Num"];
                context.Response.Write(getPrintData(M_Num,StartDate,EndDate));
                break;
        }
    }

    public string getPrintData(string M_Num,string StartDate,string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_Num' :"+M_Num+"'StartDate' :"+StartDate+"'EndDate' :"+EndDate, className, methodName);

        List<string> strList = envelopePrintWorkService.Instance.getPrintData(M_Num,StartDate,EndDate);//<==========

        log.endWrite("'strList' :"+strList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(strList);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}