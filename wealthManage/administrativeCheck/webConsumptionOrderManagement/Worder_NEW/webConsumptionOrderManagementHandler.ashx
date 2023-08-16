<%@ WebHandler Language="C#" Class="webConsumptionOrderManagementHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class webConsumptionOrderManagementHandler : IHttpHandler {

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string id = string.Empty;

        switch (action)
        {
            case "getWebConsumptionOrderList":
                getWebConsumptionOrderParamEntity gwcope = new getWebConsumptionOrderParamEntity();
                gwcope.keyWord = context.Request["keyWord"];
                gwcope.StartDate = context.Request["StartDate"];
                gwcope.EndDate = context.Request["EndDate"];
                gwcope.P_id = context.Request["P_id"];
                gwcope.PayStatus = context.Request["PayStatus"];
                gwcope.Payway = context.Request["Payway"];
                context.Response.Write(getWebConsumptionOrderList(gwcope));
                break;
            case "getWAnalysts":
                context.Response.Write(getWAnalysts());
                break;

            case"deleteData":
                string Auto_Id = context.Request["Auto_Id"];
                context.Response.Write(deleteData(Auto_Id));
                break;

            case"changeOver":
                changeOverParamEntity cope = new changeOverParamEntity();
                cope.Auto_Id = context.Request["Auto_Id"];
                cope.O_Id = context.Request["O_Id"];
                cope.MPRD_ID = context.Request["MPRD_ID"];
                cope.DPRD_ID = context.Request["DPRD_ID"];
                cope.Name = context.Request["Name"];
                cope.Tel = context.Request["Tel"];
                cope.EMail = context.Request["EMail"];
                cope.Payway = context.Request["Payway"];
                switch (cope.Payway)
                {
                    case "信用卡付款":
                        cope.Payway = "0008";
                        break;
                    case "華南信用卡付款":
                        cope.Payway = "0012";
                        break;
                    case "超商代碼付款":
                        cope.Payway = "0009";
                        break;
                    case "ATM付款":
                        cope.Payway = "0010";
                        break;
                    case "網路ATM付款":
                        cope.Payway = "0010";
                        break;
                }
                cope.City = context.Request["City"];
                cope.Address = context.Request["Address"];
                cope.Price = context.Request["Price"];
                cope.P_id = context.Request["P_id"];
                cope.add_ip = context.Request["add_ip"];
                context.Response.Write(changeOver(cope));
                break;

        }
    }

    public string getWebConsumptionOrderList(getWebConsumptionOrderParamEntity gwcope)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'gwcope' :"+gwcope.ToString(), className, methodName);

        List<webConsumptionOrderEntity> wcoeList = webConsumptionOrderManagementService.Instance.getWebConsumptionOrderList(gwcope);//<==========

        log.endWrite("'wcoeList' :"+wcoeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(wcoeList);
    }

    public string getWAnalysts()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<wAnalystEntity> waeList = webConsumptionOrderManagementService.Instance.getWAnalysts();//<==========

        log.endWrite("'waeList' :"+waeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(waeList);
    }

    public string getCustomerDetail(string Tel)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Tel' :"+Tel, className, methodName);

        List<customerDataEntity> cdeList = idCheckService.Instance.getCustomerDetail(Tel);//<==========

        log.endWrite("'cdeList' :"+cdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cdeList);
    }

    public string deleteData(string Auto_Id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Auto_Id' :"+Auto_Id, className, methodName);

        string backStr = webConsumptionOrderManagementService.Instance.deleteData(Auto_Id);//<==========

        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;
    }




    public string changeOver(changeOverParamEntity cope)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'cope' :"+cope.ToString(), className, methodName);

        string backStr = webConsumptionOrderManagementService.Instance.changeOver(cope);//<==========

        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}