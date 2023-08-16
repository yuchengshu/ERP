<%@ WebHandler Language="C#" Class="reportHandlerMCMEB10" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class reportHandlerMCMEB10 : IHttpHandler {

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];

        switch (action) {
            case "getAppointOriginalArchive":
                getOriginalArchiveParamEntity goape = new getOriginalArchiveParamEntity();
                goape.StartDate = context.Request["startDate"];
                goape.EndDate = context.Request["endDate"];
                goape.MC_COM = context.Request["Q_DEP"];
                goape.Back_tag = context.Request["Q_back"];
                goape.Back_intag = context.Request["Q_back_intag"];
                goape.keyWord = context.Request["keyword"];
                goape.U_MDEP = context.Request["U_MDEP"];
                goape.ComID = context.Request["ComID"];
                context.Response.Write(getAppointOriginalArchive(goape));
                break;
        };
    }

    public string getAppointOriginalArchive(getOriginalArchiveParamEntity goape)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'goape' : "+goape.ToString(), className, methodName);

        List<appointOriginalArchiveWorkEntity> aoaweList = reportServiceMCMEB10.Instance.getAppointOriginalArchive(goape);//<==========

        log.endWrite("'aoaweList' : "+aoaweList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(aoaweList);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}