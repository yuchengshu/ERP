<%@ WebHandler Language="C#" Class="ERPcustomerWebPayHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class ERPcustomerWebPayHandler : IHttpHandler {

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];

        switch (action)
        {
            case"getERPcustomerWebPay":
                getERPcustomerWebPayParamEntity gecwppe = new getERPcustomerWebPayParamEntity();
                gecwppe.keyWord = context.Request["keyWord"];
                gecwppe.PayStatus = context.Request["PayStatus"];
                gecwppe.U_MDEP = context.Request["U_MDEP"];
                gecwppe.U_Num = context.Request["U_Num"];
                gecwppe.ComID = context.Request["U_Num"];
                context.Response.Write(getERPcustomerWebPay(gecwppe));
                break;
            case"deleteData":
                string ca_id = context.Request["ca_id"];
                context.Response.Write(deleteData(ca_id));
                break;

        }
    }

    public string getERPcustomerWebPay(getERPcustomerWebPayParamEntity gecwppe)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'keyWord' :"+gecwppe.keyWord+"'PayStatus' :"+gecwppe.PayStatus+"'U_MDEP' :"+gecwppe.U_MDEP+"'U_Num' :"+gecwppe.U_Num+"'ComID' :"+gecwppe.ComID, className, methodName);

        //List<ERPcustomerWebPayEntity> ecwpeList = ERPcustomerWebPayService.Instance.getERPcustomerWebPay(gecwppe);//<==========
        List<ERPcustomerWebPayEntity> ecwpeList = new List<ERPcustomerWebPayEntity>();
        log.endWrite("'ecwpeList' :"+ecwpeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ecwpeList);
    }

    public string deleteData(string ca_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ca_id' :"+ca_id, className, methodName);

        //string backStr = ERPcustomerWebPayService.Instance.deleteData(ca_id);//<==========
        string backStr = "";
        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}