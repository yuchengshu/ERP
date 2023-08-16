<%@ WebHandler Language="C#" Class="reportHandlerMCMEB04" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class reportHandlerMCMEB04 : IHttpHandler {

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string StartDate = string.Empty;
        string EndDate = string.Empty;
        switch (action) {
            case "getVenuePerformance":
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];
                string MP = context.Request["MP"];
                string MC = context.Request["MC"];
                string Report_Item = context.Request["Report_Item"];
                if (Report_Item == "2")//細表
                {
                    context.Response.Write(getVenuePerformanceDetail(StartDate, EndDate));
                }
                else if (Report_Item == "4")//助理表
                {
                    context.Response.Write(getVenuePerformanceForMC(StartDate, EndDate, MC));
                }
                else//總表及分析師表
                {
                    context.Response.Write(getVenuePerformance(StartDate, EndDate, MP));
                }
                break;
        };
    }

    public string getVenuePerformance(string StartDate,string EndDate,string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : "+StartDate+" 'EndDate' : "+EndDate+" 'MP' : "+MP, className, methodName);

        List<VenuePerformanceEntity> vpeList = reportServiceMCMEB04.Instance.getVenuePerformance(StartDate, EndDate, MP);//<==========

        log.endWrite("'vpeList' : "+vpeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(vpeList);
    }
    public string getVenuePerformanceForMC(string StartDate,string EndDate,string MC)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : "+StartDate+" 'EndDate' : "+EndDate+" 'MC' : "+MC, className, methodName);

        List<VenuePerformanceForMCentity> vpfmeList = reportServiceMCMEB04.Instance.getVenuePerformanceForMC(StartDate, EndDate, MC);//<==========
        

        log.endWrite("'vpfmeList' : "+vpfmeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(vpfmeList);
    }
   
    public string getVenuePerformanceDetail(string StartDate,string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : "+StartDate+" 'EndDate' : "+EndDate, className, methodName);

        List<VenuePerformanceEntity> vpeList = reportServiceMCMEB04.Instance.getVenuePerformanceDetail(StartDate, EndDate);//<==========
        

        log.endWrite("'vpeList' : "+vpeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(vpeList);
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}