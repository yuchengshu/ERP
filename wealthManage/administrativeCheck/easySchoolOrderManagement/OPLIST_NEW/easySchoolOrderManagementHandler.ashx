<%@ WebHandler Language="C#" Class="easySchoolOrderManagementHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class easySchoolOrderManagementHandler : IHttpHandler {
    
    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string Auto_Id = string.Empty;

        switch (action)
        {
            case "getEasySchoolOrderList":
                getEasySchoolOrderParamEntity gesope = new getEasySchoolOrderParamEntity();
                gesope.keyWord = context.Request["keyWord"];
                gesope.StartDate = context.Request["StartDate"];
                gesope.EndDate = context.Request["EndDate"];
                gesope.PayStatus = context.Request["PayStatus"];
                gesope.Payway = context.Request["Payway"];
                context.Response.Write(getEasySchoolOrderList(gesope));
                break;

               case"editData":
                Auto_Id = context.Request["Auto_Id"];
                string P_EDate = context.Request["P_EDate"];
                context.Response.Write(editData(Auto_Id,P_EDate));
                break;
               case"deleteData":
                Auto_Id = context.Request["Auto_Id"];
                context.Response.Write(deleteData(Auto_Id));
                break;

            case"changeOver":
                changeOverParamEntity cope = new changeOverParamEntity();
                cope.Auto_Id = context.Request["Auto_Id"];
                cope.T_id = context.Request["T_id"];
                cope.O_Id = context.Request["O_Id"];
                cope.U_Name = context.Request["U_Name"];
                cope.Tel = context.Request["Tel"];
                cope.EMail = context.Request["EMail"];
                cope.Payway = context.Request["Payway"];
                switch (cope.Payway)
                {
                    case "信用卡付款":
                        cope.Payway = "0008";
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
                cope.Price = context.Request["Price"];
                cope.OD_id = context.Request["OD_id"];
                cope.Invoice = context.Request["Invoice"];
                cope.Invoice_Com = context.Request["Invoice_Com"];
                cope.Invoice_Vat = context.Request["Invoice_Vat"];
                cope.add_ip = context.Request["add_ip"];
                context.Response.Write(changeOver(cope));
                break;

        }
    }

    public string getEasySchoolOrderList(getEasySchoolOrderParamEntity gesope)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'gesope' :"+gesope.ToString(), className, methodName);

        List<easySchoolOrderEntity> esoeList = easySchoolOrderManagementService.Instance.getEasySchoolOrderList(gesope);//<==========

        log.endWrite("'esoeList' :"+esoeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(esoeList);
    }



    public string deleteData(string Auto_Id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Auto_Id' :"+Auto_Id, className, methodName);

        string backStr = easySchoolOrderManagementService.Instance.deleteData(Auto_Id);//<==========

        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;
    }

    public string editData(string Auto_Id,string P_EDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Auto_Id' :"+Auto_Id+"'P_EDate' :"+P_EDate, className, methodName);

        string backStr = easySchoolOrderManagementService.Instance.editData(Auto_Id, P_EDate);//<==========

        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;
    }




    public string changeOver(changeOverParamEntity cope)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'cope' :"+cope.ToString(), className, methodName);

        string backStr = easySchoolOrderManagementService.Instance.changeOver(cope);//<==========

        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}