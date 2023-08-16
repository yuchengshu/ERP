<%@ WebHandler Language="C#" Class="appointOriginalArchiveWordHandler" %>
using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class appointOriginalArchiveWordHandler : IHttpHandler {

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string StartDate = string.Empty;
        string EndDate = string.Empty;
       
        switch (action)
        {
            case"getAppointOriginalArchive":
                getOriginalArchiveParamEntity goape = new getOriginalArchiveParamEntity();
                if (!common.isEmpty(context.Request["StartDate"]))
                {
                    goape.StartDate = common.datepickerStrToDatetimeStr(context.Request["StartDate"]);
                }
                if (!common.isEmpty(context.Request["EndDate"]))
                {
                    goape.EndDate = common.datepickerStrToDatetimeStr(context.Request["EndDate"]);
                }

                goape.keyWord = context.Request["keyWord"];
                goape.MC_COM = context.Request["MC_COM"];
                goape.Back_Status = context.Request["Back_Status"];
                goape.Back_tag = context.Request["Back_tag"];
                context.Response.Write(getAppointOriginalArchive(goape));
                break;
            case"archive":
                 string tids = context.Request["tids"];
                 string [] tidsArr = tids.Split(',');
                 string Back_Statuss = context.Request["Back_Statuss"];
                 string [] Back_StatussArr = Back_Statuss.Split(',');
                 context.Response.Write(archive(tidsArr,Back_StatussArr));
                 break;

        }
    }

    public string getAppointOriginalArchive(getOriginalArchiveParamEntity goape)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'goape' :"+goape.ToString(), className, methodName);

        List<appointOriginalArchiveWorkEntity> aoaweList = appointOriginalArchiveService.Instance.getAppointOriginalArchive(goape);//<==========

        log.endWrite("'aoaweList' :"+aoaweList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(aoaweList);
    }
   
    public string archive(string [] tidsArr,string [] Back_StatussArr)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'tidsArr' :"+tidsArr+"'Back_StatussArr' :"+Back_StatussArr, className, methodName);

        string backStr = appointOriginalArchiveService.Instance.archive(tidsArr,Back_StatussArr);//<==========

        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;
    }
    
    public bool IsReusable {
        get {
            return false;
        }
    }

}