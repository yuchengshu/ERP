<%@ WebHandler Language="C#" Class="reportHandlerMREGT01_List" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class reportHandlerMREGT01_List : IHttpHandler
{

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string StartDate = string.Empty;
        string EndDate = string.Empty;
        string Selected_UNUM = string.Empty;
        string Select_Com = string.Empty;
        string Select_Dept = string.Empty;
        string MP = string.Empty;
        string T_ID = string.Empty;
        string U_Num = string.Empty;
        string ComID = string.Empty;
        string U_MDEP = string.Empty;
        string MR_SDate = string.Empty;
        string MR_EDate = string.Empty;

        switch (action)
        {
            //出缺勤異常表
            case "getMREGT01DataList":
                context.Response.Write(getMREGT01DataList(MR_SDate,MR_EDate));
                break;

            //getMREGT02DetailDataList
            case "getMREGT02DetailDataList":
                U_Num = context.Request["U_Num"];
                ComID = context.Request["ComID"];
                U_MDEP = context.Request["U_MDEP"];
                MR_SDate = context.Request["MR_SDate"];
                MR_EDate = context.Request["MR_EDate"];
                context.Response.Write(getMREGE02DataList_Detail(MR_SDate, MR_EDate, U_Num, ComID, U_MDEP));
                break;


            //getMREGT02DataList
            //取得考勤報表資料
            case "getMREGT02DataList"://由aspx呼叫
                Selected_UNUM = context.Request["Selected_UNUM"];
                Select_Com = context.Request["Select_Com"];
                Select_Dept = context.Request["Select_Dept"];
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];
                Selected_UNUM = context.Request["Selected_UNUM"];
                MP = context.Request["Selected_UNUM"];//如果為空值(NULL),則查詢所有人


                if (MP == null)
                {
                    MP = "";
                }

                context.Response.Write(getMREGE02DataList(StartDate, EndDate, MP, Select_Com, Select_Dept));
                break;
            case "getMediaClickStatistics":
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];
                MP = context.Request["MP"];
                context.Response.Write(getMediaClickStatistics(StartDate, EndDate, MP));
                break;
            case "getClickDetail":
                string type = context.Request["type"];
                string t_id = context.Request["t_id"];
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];

                context.Response.Write(getClickDetail(type, t_id, StartDate, EndDate));
                break;
        };
    }
    //取得出缺勤異常表
    public string getMREGT01DataList(string StartDate, string EndDate)
    {
        DateTime StartDateDt = DateTime.Parse(StartDate);
        DateTime EndDateDt = DateTime.Parse(EndDate);
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        List<MREGT01Entity> MREGT01DataList = new List<MREGT01Entity>();
        //log.startWrite(" 'MR_DateY' : " + MR_DateY + " 'MR_DateM' : " + MR_DateM + " 'MP' : " + MP, className, methodName);
        //if (MP != "")
        //{                                             getMREGE01DataList
        MREGT01DataList = reportServiceMREGT01.Instance.getMREGT01DataList(StartDate, EndDate);//<==========

        //}
        log.endWrite("'MREGT01DataList' : " + MREGT01DataList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(MREGT01DataList);
    }
    //20221213進度
    //出勤列表詳細資料內容
    public string getMREGE02DataList_Detail(string StartDate, string EndDate, string MP, string ComID, string U_MDEP)
    {
        DateTime StartDateDt = DateTime.Parse(StartDate);
        DateTime EndDateDt = DateTime.Parse(EndDate);
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        List<MREGT02DetailEntity> MREGT02DetailList = new List<MREGT02DetailEntity>();
        //log.startWrite(" 'MR_DateY' : " + MR_DateY + " 'MR_DateM' : " + MR_DateM + " 'MP' : " + MP, className, methodName);
        //if (MP != "")
        //{
        MREGT02DetailList = reportServiceMREGT02.Instance.getMREGT02DetailDataList(StartDate, EndDate, MP, ComID, U_MDEP);//<==========

        //}
        log.endWrite("'MREGT02DetailList' : " + MREGT02DetailList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(MREGT02DetailList);
    }
    //20221130進度!!
    //MP如為空值則查詢所有人
    //取得考勤報表資料
    public string getMREGE02DataList(string StartDate, string EndDate, string MP, string Select_Com, string Select_Dept)
    {
        DateTime StartDateDt = DateTime.Parse(StartDate);
        DateTime EndDateDt = DateTime.Parse(EndDate);
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        List<MREGT02Entity> MREGT02List = new List<MREGT02Entity>();
        //log.startWrite(" 'MR_DateY' : " + MR_DateY + " 'MR_DateM' : " + MR_DateM + " 'MP' : " + MP, className, methodName);
        //if (MP != "")
        //{
        MREGT02List = reportServiceMREGT02.Instance.getMREGT02DataList(StartDate, EndDate, MP, Select_Com, Select_Dept);//<==========

        //}
        log.endWrite("'mcseList' : " + MREGT02List.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(MREGT02List);
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