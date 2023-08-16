<%@ WebHandler Language="C#" Class="MasterPageHandler" %>

using System;
using System.Web;
using System.IO;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Collections.Generic;

public class MasterPageHandler : IHttpHandler {
    
    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string U_Num = string.Empty;
        switch (action) {
            case "getMenuList":
                U_Num = context.Request["U_Num"];
                context.Response.Write(getMenuList(U_Num));
                break;
        };
    }
    
    public string getMenuList(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : "+U_Num, className, methodName);
        List<masterPageLeftMenuEntity> lmList = masterPageService.Instance.getLeftMenu(U_Num,false);
        log.endWrite("'lmList' :"+lmList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(lmList);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}