<%@ WebHandler Language="C#" Class="reportHandlerMINVO01" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class reportHandlerMINVO01 : IHttpHandler {
    
    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string StartDate = string.Empty;
        string EndDate = string.Empty;
        string Invoice_Item = string.Empty;
        switch (action) {
            case "getElectronicCalculatorInvoiceDetail":
                Invoice_Item = context.Request["Invoice_Item"];
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];
                context.Response.Write(getElectronicCalculatorInvoiceDetail(StartDate, EndDate,Invoice_Item));
                break;
            case "getHandOpenInvoiceDetail":
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];
                context.Response.Write(getHandOpenInvoiceDetail(StartDate, EndDate));
                break;
            case "getWebElectronicInvoiceDetail":
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];
                context.Response.Write(getWebElectronicInvoiceDetail(StartDate, EndDate));
                break;
            case "getSchoolElectronicInvoiceDetail":
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];
                context.Response.Write(getSchoolElectronicInvoiceDetail(StartDate, EndDate));
                break;
        };
    }

    public string getElectronicCalculatorInvoiceDetail(string StartDate,string EndDate,string Invoice_Item)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'StartDate' : "+StartDate+"'EndDate' : "+EndDate+"'Invoice_Item' : "+Invoice_Item, className, methodName);

        List<ElectronicCalculatorInvoiceDetailEntity> ecideList = reportServiceMINVO01.Instance.getElectronicCalculatorInvoiceDetail(StartDate, EndDate, Invoice_Item);//<==========

        log.endWrite("'ecideList' : "+ecideList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ecideList);
    }

    public string getHandOpenInvoiceDetail(string StartDate,string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'StartDate' : "+StartDate+"'EndDate' : "+EndDate, className, methodName);
            
        List<string> strList = reportServiceMINVO01.Instance.getHandOpenInvoiceDetail(StartDate, EndDate);//<==========

        log.endWrite("'strList' : "+strList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(strList);
    }

    public string getWebElectronicInvoiceDetail(string StartDate,string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'StartDate' : "+StartDate+"'EndDate' : "+EndDate, className, methodName);
            
        List<InvoiceDetailEntity> ideList = reportServiceMINVO01.Instance.getWebElectronicInvoiceDetail(StartDate, EndDate);//<==========

        log.endWrite("'ideList' : "+ideList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ideList);
    }

    public string getSchoolElectronicInvoiceDetail(string StartDate,string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'StartDate' : "+StartDate+"'EndDate' : "+EndDate, className, methodName);
            
        List<InvoiceDetailEntity> ideList = reportServiceMINVO01.Instance.getSchoolElectronicInvoiceDetail(StartDate, EndDate);//<==========

        log.endWrite("'ideList' : "+ideList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ideList);
    }

 
    public bool IsReusable {
        get {
            return false;
        }
    }

}