<%@ WebHandler Language="C#" Class="reportHandlerMCMEB09" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class reportHandlerMCMEB09 : IHttpHandler
{

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string MR_DateY = string.Empty;
        string MR_DateM = string.Empty;
        string MP = string.Empty;
        string T_ID = string.Empty;
        switch (action)
        {

            case "getMCMEB09DataList"://由aspx呼叫
                MR_DateY = context.Request["MR_DateY"];
                MR_DateM = context.Request["MR_DateM"];
                MP = context.Request["MP"];//如果為空值(NULL),則查詢所有人


                if (MP == null)
                {
                    MP = "";
                }
                context.Response.Write(getMCMEB09DataList(MR_DateY, MR_DateM, MP));
                break;
            case "getMediaClickStatistics":
                MR_DateY = context.Request["MR_DateY"];
                MR_DateM = context.Request["MR_DateM"];
                MP = context.Request["MP"];
                context.Response.Write(getMediaClickStatistics(MR_DateY, MR_DateM, MP));
                break;
            case "getClickDetail":
                string type = context.Request["type"];
                string t_id = context.Request["t_id"];
                MR_DateY = context.Request["MR_DateY"];
                MR_DateM = context.Request["MR_DateM"];

                context.Response.Write(getClickDetail(type, t_id, MR_DateY, MR_DateM));
                break;
        };
    }
    //20221107進度!!
    public string getMCMEB09DataList(string MR_DateY,string MR_DateM,string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        List<MCMEB09Entity> mcseList = new List<MCMEB09Entity>();
        //log.startWrite(" 'MR_DateY' : " + MR_DateY + " 'MR_DateM' : " + MR_DateM + " 'MP' : " + MP, className, methodName);
        if (MP != "")
        {
            mcseList = reportServiceMCMEB09.Instance.getReportHandlerMCMEB09DataList(MP, MR_DateY, MR_DateM);//<==========
            log.endWrite("'mcseList' : " + mcseList.ToString(), className, methodName);
            return Newtonsoft.Json.JsonConvert.SerializeObject(mcseList);
        }
        log.endWrite("'mcseList' : " + mcseList.ToString(), className, methodName);
            return Newtonsoft.Json.JsonConvert.SerializeObject(mcseList);
    }

    public string getMediaClickStatistics(string MR_DateY, string MR_DateM, string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'MR_DateY' : " + MR_DateY + " 'MR_DateM' : " + MR_DateM + " 'MP' : " + MP, className, methodName);

        List<MediaClickStatisticsEntity> mcseList = reportServiceMCMEB09.Instance.getMediaClickStatistics(MR_DateY, MR_DateM, MP);//<==========

        log.endWrite("'mcseList' : " + mcseList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(mcseList);
    }
    //20221114修改的地方
    public string getClickDetail(string type, string t_id, string MR_DateY, string MR_DateM)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'type' : " + type + " 't_id' : " + t_id + " 'MR_DateY' : " + MR_DateY + " 'MR_DateM' : " + MR_DateM, className, methodName);

        List<ClickDetailEntity> cdeList = reportServiceMCMEB09.Instance.getClickDetail(type, t_id, MR_DateY, MR_DateM);//<==========

        log.endWrite("'cdeList' : " + cdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cdeList);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}