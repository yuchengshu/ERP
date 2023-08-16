<%@ WebHandler Language="C#" Class="reportHandlerMVMEB08" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class reportHandlerMVMEB08 : IHttpHandler {
    
    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        switch (action) {
            case "getAdvancesRemainingMoney":
                getAdvancesRemainingMoneyParamEntity garmpe = new getAdvancesRemainingMoneyParamEntity();
                garmpe.start2Date = context.Request["start2Date"];//剩餘金額基準日
                garmpe.startDate = context.Request["startDate"];//交易起始日
                garmpe.endDate = context.Request["endDate"];//交易結束日
                garmpe.MP = context.Request["MP"];//分析師
                garmpe.M_Item = context.Request["M_Item"];//會員總類
                context.Response.Write(getAdvancesRemainingMoney(garmpe));//取得預收剩餘金額表 
                break;
        };
    }
    //取得預收剩餘金額表
    public string getAdvancesRemainingMoney(getAdvancesRemainingMoneyParamEntity garmpe)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'garmpe' : "+garmpe.ToString() , className, methodName);

        List<memberSessionStatusEntity> msseList = reportServiceMVMEB08.Instance.getAdvancesRemainingMoney(garmpe);//<==========

        log.endWrite("'msseList' : "+msseList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(msseList);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}