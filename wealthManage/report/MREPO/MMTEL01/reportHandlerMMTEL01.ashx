<%@ WebHandler Language="C#" Class="reportHandlerMMTEL01" %>
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class reportHandlerMMTEL01 : IHttpHandler {

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];

        getAnalystParamEntity gape = null;
        switch (action) {
            case "getAnalyst":
                gape = new getAnalystParamEntity();
                gape.MP = context.Request["MP"];
                gape.U_Num = context.Request["U_Num"];
                gape.U_MDEP = context.Request["U_MDEP"];
                gape.ComID = context.Request["U_MDEP"];
                context.Response.Write(getAnalyst(gape));
                break;

            case "getProgram":
                gape = new getAnalystParamEntity();
                gape.MP = context.Request["MP"];
                gape.U_Num = context.Request["U_Num"];
                gape.U_MDEP = context.Request["U_MDEP"];
                gape.ComID = context.Request["U_MDEP"];
                gape.MR_DateY = context.Request["MR_DateY"];
                gape.MR_DateM = context.Request["MR_DateM"];
                context.Response.Write(getProgram(gape));
                break;
            case "getTotalTelStatistics":
                gape = new getAnalystParamEntity();
                gape.MP = context.Request["MP"];
                gape.U_Num = context.Request["U_Num"];
                gape.U_MDEP = context.Request["U_MDEP"];
                gape.ComID = context.Request["U_MDEP"];
                gape.MR_DateY = context.Request["MR_DateY"];
                gape.MR_DateM = context.Request["MR_DateM"];
                context.Response.Write(getTotalTelStatistics(gape));
                break;
        };
    }
    public string getAnalyst(getAnalystParamEntity gape)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'gape' : "+gape.ToString(), className, methodName);

        List<TelStatisticsEntity> tseList = reportServiceMMTEL01.Instance.getAnalyst(gape);//<==========

        log.endWrite("'tseList' : "+tseList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(tseList);
    }
    public string getProgram(getAnalystParamEntity gape)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'gape' : "+gape.ToString(), className, methodName);

        List<TelStatisticsEntity> tseList = reportServiceMMTEL01.Instance.getProgram(gape);//<==========

        log.endWrite("'tseList' : "+tseList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(tseList);
    }
    
    public string getTotalTelStatistics(getAnalystParamEntity gape)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'gape' : "+gape.ToString(), className, methodName);

        List<totalTelStatisticsEntity> ttseList = reportServiceMMTEL01.Instance.getTotalTelStatistics(gape);//<==========

        log.endWrite("'ttseList' : "+ttseList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ttseList);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}