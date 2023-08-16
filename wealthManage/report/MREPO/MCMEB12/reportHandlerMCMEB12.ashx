<%@ WebHandler Language="C#" Class="reportHandlerMCMEB12" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class reportHandlerMCMEB12 : IHttpHandler {
    
     //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];

        switch (action) {
            case "getWebMemberRegisteredActiveDetail":
                string MP = context.Request["MP"];
               
                context.Response.Write(getWebMemberRegisteredActiveDetail(MP));
                break;
            case "getAnalystActiveDetail":
                string Sur_id = context.Request["Sur_id"];
               
                context.Response.Write(getAnalystActiveDetail(Sur_id));
                break;
        };
    }
    

    public string getWebMemberRegisteredActiveDetail(string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'MP' : "+MP, className, methodName);

        List<WebMemberRegisteredActiveDetailEntity> wmradeList = reportServiceMCMEB12.Instance.getWebMemberRegisteredActiveDetail(MP);//<==========

        log.endWrite("'wmradeList' : "+wmradeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(wmradeList);
    }

    
    public string getAnalystActiveDetail(string Sur_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'Sur_id' : "+Sur_id, className, methodName);

        List<hgmemberEntity> hbeList = reportServiceMCMEB12.Instance.getAnalystActiveDetail(Sur_id);//<==========

        log.endWrite("'hbeList' : "+hbeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(hbeList);
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}