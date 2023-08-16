<%@ WebHandler Language="C#" Class="reportHandlerMCMEB13" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class reportHandlerMCMEB13 : IHttpHandler
{

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string StartDate = string.Empty;
        string EndDate = string.Empty;
        string MC_COM = string.Empty;
        switch (action)
        {
            case "getResourceDistribution":
                StartDate = context.Request["startDate"];
                EndDate = context.Request["endDate"];
                MC_COM = context.Request["Q_DEP"];
                string type = context.Request["type"];

                context.Response.Write(getResourceDistribution(StartDate, EndDate, MC_COM, type));
                break;
            case "getResourceDistributionDetail":
                StartDate = context.Request["startDate"];
                EndDate = context.Request["endDate"];
                MC_COM = context.Request["Q_DEP"];
                string Result_user = context.Request["Result_user"];
                string Result_userName = context.Request["Result_userName"];

                context.Response.Write(getResourceDistributionDetail(StartDate, EndDate, MC_COM, Result_user, Result_userName));
                break;
        };
    }

    public string getResourceDistribution(string StartDate, string EndDate, string MC_COM, string type)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'MC_COM' : " + MC_COM + " 'type' : " + type, className, methodName);

        List<ResourceDistributionEntity> rdeList = reportServiceMCMEB13.Instance.getResourceDistribution(StartDate, EndDate, MC_COM, type);//<==========

        log.endWrite("'rdeList' : " + rdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(rdeList);
    }

    public string getResourceDistributionDetail(string StartDate, string EndDate, string MC_COM, string Result_user, string Result_userName)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'MC_COM' : " + MC_COM + " 'Result_user' : " + Result_user + " 'Result_userName' : " + Result_userName, className, methodName);

        List<ResourceDistributionDetailEntity> rddeList = reportServiceMCMEB13.Instance.getResourceDistributionDetail(StartDate, EndDate, MC_COM, Result_user, Result_userName);//<==========

        log.endWrite("'rddeList' : " + rddeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(rddeList);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}