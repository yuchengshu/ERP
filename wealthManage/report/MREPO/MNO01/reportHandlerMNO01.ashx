<%@ WebHandler Language="C#" Class="reportHandlerMNO01" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class reportHandlerMNO01 : IHttpHandler {
    
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string endDate = string.Empty;
        string startDate = string.Empty;
        switch (action) {
            case "getTodayPerformance":
                string today = context.Request["today"];
                context.Response.Write(getTodayPerformance(today));
                break;
            case "getMonthPerformance":
                startDate = context.Request["startDate"];
                endDate = context.Request["endDate"];
                context.Response.Write(getMonthPerformance(startDate,endDate));
                break;
            case "getMonthCost":
                endDate = context.Request["endDate"];
                context.Response.Write(getMonthCost(endDate));
                break;
            case "getMonthPerformanceAims":
                startDate = context.Request["startDate"];
                context.Response.Write(getMonthPerformanceAims(startDate));
                break;
            case "getPerMonthRevenue":
                context.Response.Write(getPerMonthRevenue());
                break;
            case "getDepRevenue":
                context.Response.Write(getDepRevenue());
                break;
            case "getRevenueAimRateDetail":
                string ComID = context.Request["ComID"];
                context.Response.Write(getRevenueAimRateDetail(ComID));
                break;
        };
    }
    public string getTodayPerformance(string today)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'today' : "+today, className, methodName);

        string backStr = reportServiceMNO01.Instance.getTodayPerformance(today);//<==========

        log.endWrite("結果--'backStr' : "+backStr.ToString(), className, methodName);
        return backStr;
    }

    public string getMonthPerformanceAims(string startDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'startDate' : "+startDate, className, methodName);

        string backStr = reportServiceMNO01.Instance.getMonthPerformanceAims(startDate);//<==========

        log.endWrite("結果--'backStr' : "+backStr.ToString(), className, methodName);
        return backStr;
    }

    public string getMonthPerformance(string startDate,string endDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'startDate' : "+startDate+"'endDate' : "+endDate, className, methodName);

        string backStr = reportServiceMNO01.Instance.getMonthPerformance(startDate,endDate);//<==========

        log.endWrite("結果--'backStr' : "+backStr.ToString(), className, methodName);
        return backStr;
    }

    public string getMonthCost(string endDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'endDate' : "+endDate, className, methodName);

        string backStr = reportServiceMNO01.Instance.getMonthCost(endDate);//<==========

        log.endWrite("結果--'backStr' : "+backStr.ToString(), className, methodName);
        return backStr;
    }

    public string getPerMonthRevenue()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'無'", className, methodName);

        List<PerMonthRevenueEntity> pmreList = reportServiceMNO01.Instance.getPerMonthRevenue();//<==========

        log.endWrite("結果--'pmreList' : "+pmreList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(pmreList);
    }
    
    public string getDepRevenue()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'無'", className, methodName);

        List<DepRevenueEntity> dreList = reportServiceMNO01.Instance.getDepRevenue();//<==========

        log.endWrite("結果--'dreList' : "+dreList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(dreList);
    }
     
    public string getRevenueAimRateDetail(string ComID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'ComID':"+ComID, className, methodName);

          List<List<List<string>>> strListListList = reportServiceMNO01.Instance.getRevenueAimRateDetail(ComID);//<==========

        log.endWrite("結果--'strListListList' : "+strListListList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(strListListList);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}