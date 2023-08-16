<%@ WebHandler Language="C#" Class="dailyResearchReportManagementHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;
using System.IO;
using System.Xml;

public class dailyResearchReportManagementHandler : IHttpHandler {

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string msg_id = string.Empty;
        string MP = string.Empty;
        string WFT_id = string.Empty;
        getMessageListParam gmlp = null;
        switch (action)
        {
            case"getDailyResearchReportList":
                gmlp = new getMessageListParam();
                gmlp.MP = context.Request["MP"];
                gmlp.MP_Item = context.Request["MP_Item"];
                gmlp.StartDate = context.Request["StartDate"];
                gmlp.EndDate = context.Request["EndDate"];
                gmlp.keyWord = context.Request["keyWord"];
                gmlp.U_MDEP = context.Request["U_MDEP"];
                gmlp.U_POSITION = context.Request["U_POSITION"];
                gmlp.ComID = context.Request["ComID"];
                gmlp.U_Num = context.Request["U_Num"];

                context.Response.Write(getDailyResearchReportList(gmlp));
                break;
            case"deleteDailyResearchReportFuc":
                string F_id = context.Request["F_id"];
                context.Response.Write(deleteDailyResearchReportFuc(F_id));
                break;
            case"getClosingPriceThreeBigData":
                context.Response.Write(getClosingPriceThreeBigData());
                break;
            case"deleteThreeBigData":
                WFT_id = context.Request["WFT_id"];
                context.Response.Write(deleteThreeBigData(WFT_id));
                break;
            case"sendThreeBigData":
                closingPriceThreeBigDataEntity cptbde = new closingPriceThreeBigDataEntity();
                cptbde.WFT_id = context.Request["WFT_id"];
                string [] WFT_dateArr = context.Request["WFT_date"].Split('/');
                cptbde.WFT_date = WFT_dateArr[2] + "-" + WFT_dateArr[0] + "-" + WFT_dateArr[1] + " 00:00:00.000";
                cptbde.WFT_TSE_T1 = context.Request["WFT_TSE_T1"];
                cptbde.WFT_TSE_T2 = context.Request["WFT_TSE_T2"];
                cptbde.WFT_TSE_T3 = context.Request["WFT_TSE_T3"];
                cptbde.WFT_OTC_T1 = context.Request["WFT_OTC_T1"];
                cptbde.WFT_OTC_T2  = context.Request["WFT_OTC_T2"];
                cptbde.WFT_OTC_T3 = context.Request["WFT_OTC_T3"];
                cptbde.WFT_II_T1 = context.Request["WFT_II_T1"];
                cptbde.WFT_II_T2 = context.Request["WFT_II_T2"];
                cptbde.WFT_II_T3 = context.Request["WFT_II_T3"];
                cptbde.WFT_II_T4 = context.Request["WFT_II_T4"];
                cptbde.actionType = context.Request["actionType"];
                context.Response.Write(sendThreeBigData(cptbde));
                break;
            case"getWAnalysts":
                context.Response.Write(getWAnalysts());
                break;
            case"sendReseachReportData":
                dailyResearchReportEntity drre = new dailyResearchReportEntity();
                drre.F_id = context.Request["F_id"];
                drre.P_id = context.Request["P_id"];
                drre.Open_tag = context.Request["Open_tag"];
                drre.Pay = context.Request["Pay"];
                drre.U_Item = context.Request["U_Item"];
                drre.F_Item = context.Request["F_Item"];
                drre.F_Title = context.Request["F_Title"];
                drre.F_SDate = context.Request["F_SDate"];
                drre.F_EDate = context.Request["F_EDate"];
                drre.F_VDate = context.Request["F_VDate"];
                drre.F_Context = HttpUtility.HtmlEncode(context.Request["F_Context"]);
                drre.PDFurl = context.Request["PDFurl"];
                drre.F_img1 = context.Request["F_img1"];
                drre.F_img2 = context.Request["F_img2"];
                drre.F_img3 = context.Request["F_img3"];
                drre.add_ip = context.Request["add_ip"];
                drre.add_user = context.Request["add_user"];
                drre.Stock1 = context.Request["Stock1"];
                drre.Stock_Text1 = context.Request["Stock_Text1"];
                drre.Stock_Note1 = context.Request["Stock_Note1"];
                drre.Stock2 = context.Request["Stock2"];
                drre.Stock_Text2 = context.Request["Stock_Text2"];
                drre.Stock_Note2 = context.Request["Stock_Note2"];
                drre.Stock3 = context.Request["Stock3"];
                drre.Stock_Text3 = context.Request["Stock_Text3"];
                drre.Stock_Note3 = context.Request["Stock_Note3"];
                drre.Stock4 = context.Request["Stock4"];
                drre.Stock_Text4 = context.Request["Stock_Text4"];
                drre.Stock_Note4 = context.Request["Stock_Note4"];
                drre.Stock5 = context.Request["Stock5"];
                drre.Stock_Text5 = context.Request["Stock_Text5"];
                drre.Stock_Note5 = context.Request["Stock_Note5"];
                drre.Stock6 = context.Request["Stock6"];
                drre.Stock_Text6 = context.Request["Stock_Text6"];
                drre.Stock_Note6 = context.Request["Stock_Note6"];
                drre.Stock7 = context.Request["Stock7"];
                drre.Stock_Text7 = context.Request["Stock_Text7"];
                drre.Stock_Note7 = context.Request["Stock_Note7"];
                drre.Stock8 = context.Request["Stock8"];
                drre.Stock_Text8 = context.Request["Stock_Text8"];
                drre.Stock_Note8 = context.Request["Stock_Note8"];
                drre.Stock9 = context.Request["Stock9"];
                drre.Stock_Text9 = context.Request["Stock_Text9"];
                drre.Stock_Note9 = context.Request["Stock_Note9"];
                drre.Stock10 = context.Request["Stock10"];
                drre.Stock_Text10 = context.Request["Stock_Text10"];
                drre.Stock_Note10 = context.Request["Stock_Note10"];
                drre.actionType = context.Request["actionType"];
                context.Response.Write(sendReseachReportData(drre));
                break;

        }
    }

    public string getDailyResearchReportList(getMessageListParam gmlp)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MP' :"+gmlp.MP+"'MP_Item' :"+gmlp.MP_Item+"'StartDate' :"+gmlp.StartDate+"'EndDate' :"+gmlp.EndDate+"'keyWord' :"+gmlp.keyWord+ "'U_MDEP':" +gmlp.U_MDEP + "'U_POSITION':" + gmlp.U_POSITION+ "'ComID':" + gmlp.ComID+ "'U_Num':" + gmlp.U_Num, className, methodName);

        List<dailyResearchReportEntity> drreList = dailyResearchReportManagementService.Instance.getDailyResearchReportList(gmlp);//<==========

        log.endWrite("'drreList' :"+drreList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(drreList);
    }

    public string getClosingPriceThreeBigData()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<closingPriceThreeBigDataEntity> cptbdeList = dailyResearchReportManagementService.Instance.getClosingPriceThreeBigData();//<==========

        log.endWrite("'cptbdeList' :"+cptbdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cptbdeList);
    }

    public string getWAnalysts()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<wAnalystEntity> wAnalystList = dailyResearchReportManagementService.Instance.getWAnalysts();//<==========

        log.endWrite("'wAnalystList' :"+wAnalystList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(wAnalystList);
    }

    public string deleteDailyResearchReportFuc(string F_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'F_id' :"+F_id, className, methodName);

        string backStr = dailyResearchReportManagementService.Instance.deleteDailyResearchReportFuc(F_id);//<==========

        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;
    }

    public string deleteThreeBigData(string WFT_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'WFT_id' :"+WFT_id, className, methodName);

        string backStr = dailyResearchReportManagementService.Instance.deleteThreeBigData(WFT_id);//<==========

        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;
    }

    public string sendThreeBigData(closingPriceThreeBigDataEntity cptbde)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'cptbde':"+cptbde, className, methodName);

        string backStr = dailyResearchReportManagementService.Instance.sendThreeBigData(cptbde);//<==========

        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;
    }

    public string sendReseachReportData(dailyResearchReportEntity drre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'drre':"+drre.ToString(), className, methodName);

        string backStr = dailyResearchReportManagementService.Instance.sendReseachReportData(drre);//<==========

        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}