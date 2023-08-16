<%@ WebHandler Language="C#" Class="businessConnectionCallHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class businessConnectionCallHandler : IHttpHandler {
    
   string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string U_Num = context.Request["U_Num"];

        switch (action) {
            case "getNextMonthSoonFallDueMember":
                context.Response.Write(getNextMonthSoonFallDueMember(U_Num));
                break;
            case "getCustomerInTheLastOneMonth":
                context.Response.Write(getCustomerInTheLastOneMonth(U_Num));
                break;
            case "getExpiredCustomer":
                context.Response.Write(getExpiredCustomer(U_Num));
                break;
            case "getBirthDayCustomer":
                context.Response.Write(getBirthDayCustomer(U_Num));
                break;

        };
    }
    
    public string getNextMonthSoonFallDueMember(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : "+U_Num, className, methodName);

        List<nextMonthSoonFallDueMemberEntity> nmsfdmeList = businessConnectionCallService.Instance.getNextMonthSoonFallDueMember(U_Num);//<==========

        log.endWrite("'nmsfdmeList':"+nmsfdmeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(nmsfdmeList);
    }

    public string getCustomerInTheLastOneMonth(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : "+U_Num, className, methodName);

        List<customerDataEntity> cdeList = businessConnectionCallService.Instance.getCustomerInTheLastOneMonth(U_Num);//<==========

        log.endWrite("'cdeList':"+cdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cdeList);
    }

    public string getExpiredCustomer(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : "+U_Num, className, methodName);

        List<customerDataEntity> cdeList = businessConnectionCallService.Instance.getExpiredCustomer(U_Num);//<==========

        log.endWrite("'cdeList':"+cdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cdeList);
    }

    
    public string getBirthDayCustomer(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : "+U_Num, className, methodName);

        List<customerDataEntity> cdeList = businessConnectionCallService.Instance.getBirthDayCustomer(U_Num);//<==========

        log.endWrite("'cdeList':"+cdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cdeList);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}