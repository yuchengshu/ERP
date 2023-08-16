<%@ WebHandler Language="C#" Class="reportHandlerMCMEB14" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class reportHandlerMCMEB14 : IHttpHandler {
    
   //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string StartDate = string.Empty;
        string EndDate = string.Empty;
        switch (action) {
            case "getWebsiteIPdetail":
                StartDate = context.Request["startDate"];
                EndDate = context.Request["endDate"];
                string Report_Item = context.Request["Report_Item"];
                context.Response.Write(getWebsiteIPdetail(StartDate,EndDate,Report_Item));
                break;
             case "getMemberBrowseData":
                string Detail = context.Request["Detail"];
                context.Response.Write(getMemberBrowseData(Detail));
                break;
            case "getPersonBrowseData":
                string M_id = context.Request["M_id"];
                context.Response.Write(getPersonBrowseData(M_id));
                break;
        }
    }

    public string getWebsiteIPdetail(string StartDate,string EndDate,string Report_Item)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : "+StartDate+" 'EndDate' : "+EndDate+" 'Report_Item' : "+Report_Item, className, methodName);

        List<WebsiteIPdetailEntity> wIPdeList = reportServiceMCMEB14.Instance.getWebsiteIPdetail(StartDate,EndDate,Report_Item);//<==========

        log.endWrite("'wIPdeList' : "+wIPdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(wIPdeList);
    }

    
    public string getMemberBrowseData(string Detail)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'Detail' : "+Detail, className, methodName);

        List<MemberBrowseDataEntity> mbdeList = reportServiceMCMEB14.Instance.getMemberBrowseData(Detail);//<==========

        log.endWrite("'mbdeList' : "+mbdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(mbdeList);
    }
    
    public string getPersonBrowseData(string M_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'M_id' : "+M_id, className, methodName);

        List<MemberBrowseDataEntity> mbdeList = reportServiceMCMEB14.Instance.getPersonBrowseData(M_id);//<==========

        log.endWrite("'mbdeList' : "+mbdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(mbdeList);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}