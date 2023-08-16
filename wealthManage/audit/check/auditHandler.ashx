<%@ WebHandler Language="C#" Class="auditHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class auditHandler : IHttpHandler {

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string keyWord = string.Empty;
        string StartDate = string.Empty;
        string EndDate = string.Empty;
        string M_ID = string.Empty;
        string U_MDEP = string.Empty;
        string User_MDEP = string.Empty;
        string U_Num = string.Empty;
        switch (action) {
            case "getAuditList":
                U_Num = context.Request["U_Num"];
                context.Response.Write(getAuditList(U_Num));
                break;
            case "getERPeditRecord":
                keyWord = context.Request["keyWord"];
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];

                context.Response.Write(getERPeditRecord(keyWord,StartDate,EndDate));
                break;
            case "getCustomerDataEditRecord":
                M_ID = context.Request["M_ID"];
                context.Response.Write(getCustomerDataEditRecord(M_ID));
                break;
            case "getTradeDataEditRecord":
                M_ID = context.Request["M_ID"];
                context.Response.Write(getTradeDataEditRecord(M_ID));
                break;
            case "getDepList":
                context.Response.Write(getDepList());
                break;
            case "getDepListForCaseDistribute"://案件派發報表
                context.Response.Write(getDepListForCaseDistribute());
                break;
            case "getBusinessERPstatus":
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];
                U_MDEP = context.Request["U_MDEP"];
                User_MDEP = context.Request["User_MDEP"];
                context.Response.Write(getBusinessERPstatus( StartDate, EndDate, U_MDEP, User_MDEP));
                break;
            case "getCaseDistribute"://案件派發報表
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];
                U_MDEP = context.Request["U_MDEP"];
                User_MDEP = context.Request["User_MDEP"];
                context.Response.Write(getCaseDistribute( StartDate, EndDate, U_MDEP,User_MDEP));
                break;
            case "getDepListForCompanyResourceTag":
                context.Response.Write(getDepListForCompanyResourceTag());
                break;
            case "getMCListForCompanyResourceTag":
                string ComID =  context.Request["ComID"];
                context.Response.Write(getMCListForCompanyResourceTag(ComID));
                break;
            case "getCompanyResourceTag":
                getCompanyResourceTagParamEntity gcrtpe = new getCompanyResourceTagParamEntity();
                gcrtpe.StartDate = context.Request["StartDate"];
                gcrtpe.EndDate = context.Request["EndDate"];
                gcrtpe.U_MDEP = context.Request["U_MDEP"];
                gcrtpe.DM_tag = context.Request["DM_tag"];
                gcrtpe.MC = context.Request["MC"];
                gcrtpe.bMC = context.Request["bMC"];
                context.Response.Write(getCompanyResourceTag(gcrtpe));
                break;
            case "getCaseDistributeList":
                U_Num =  context.Request["U_Num"];
                context.Response.Write(getCaseDistributeList(U_Num));
                break;
             case "getTagHistory":
                 M_ID = context.Request["M_ID"];
                context.Response.Write(getTagHistory(M_ID));
                break;
        };
    }

    public string getAuditList(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : "+U_Num, className, methodName);

        List<reportTabEntity> rteList = auditService.Instance.getAuditList(U_Num);//<==========

        log.endWrite("'rteList' : "+rteList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(rteList);
    }

    public string getERPeditRecord(string keyWord,string StartDate,string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'keyWord' : "+keyWord+"'StartDate' : "+StartDate+"'EndDate' : "+EndDate, className, methodName);

        List<customerDataEntity> rteList = MCMEB05Service.Instance.getERPeditRecord(keyWord, StartDate, EndDate);//<==========

        log.endWrite("'rteList' : "+rteList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(rteList);
    }

    public string getCustomerDataEditRecord(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : "+M_ID, className, methodName);

        List<editCustomerDataRecord> ecdrList = MCMEB05Service.Instance.getCustomerDataEditRecord(M_ID);//<==========

        log.endWrite("'ecdrList' : "+ecdrList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ecdrList);
    }

    public string getTradeDataEditRecord(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : "+M_ID, className, methodName);

        List<editCustomerDataRecord> ecdrList = MCMEB05Service.Instance.getTradeDataEditRecord(M_ID);//<==========

        log.endWrite("'ecdrList' : "+ecdrList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ecdrList);
    }


    public string getDepList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<ditcodedescEntity> ddeList = MCMEB04Service.Instance.getDepList();//<==========

        log.endWrite("'ddeList' : "+ddeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ddeList);
    }
    //案件派發報表
    public string getDepListForCaseDistribute()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<ditcodedescEntity> ddeList = MCMEB08Service.Instance.getDepListForCaseDistribute();//<==========

        log.endWrite("'ddeList' : "+ddeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ddeList);
    }

    public string getDepListForCompanyResourceTag()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<ditcodedescEntity> ddeList = MCMEB01Service.Instance.getDepListForCompanyResourceTag();//<==========

        log.endWrite("'ddeList' : "+ddeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ddeList);
    }


    public string getMCListForCompanyResourceTag(string ComID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID' :"+ComID, className, methodName);

        List<businessERPstatusEntity> beseList = MCMEB01Service.Instance.getMCListForCompanyResourceTag(ComID);//<==========

        log.endWrite("'beseList' : "+beseList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(beseList);
    }

    public string getCompanyResourceTag(getCompanyResourceTagParamEntity gcrtpe)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' :"+gcrtpe.StartDate+" 'EndDate' :"+gcrtpe.EndDate+" 'U_MDEP' :"+gcrtpe.U_MDEP+" 'DM_tag' :"+gcrtpe.DM_tag+" 'MC' :"+gcrtpe.MC+" 'bMC' :"+gcrtpe.bMC, className, methodName);

        List<companyResourceTagEntity> crteList = MCMEB01Service.Instance.getCompanyResourceTag(gcrtpe);//<==========

        log.endWrite("'crteList' : "+crteList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(crteList);
    }


    public string getBusinessERPstatus(string StartDate,string EndDate,string U_MDEP,string User_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'StartDate' :"+StartDate+"'EndDate' :"+EndDate+"'U_MDEP' :"+U_MDEP+"'User_MDEP' :"+User_MDEP, className, methodName);

        List<businessERPstatusEntity> beseList = MCMEB04Service.Instance.getBusinessERPstatus( StartDate, EndDate, U_MDEP, User_MDEP);//<==========

        log.endWrite("'beseList' : "+beseList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(beseList);
    }
        //案件派發報表
    public string getCaseDistribute(string StartDate,string EndDate,string U_MDEP,string User_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'StartDate' :"+StartDate+"'EndDate' :"+EndDate+"'U_MDEP' :"+U_MDEP+"'User_MDEP' :"+User_MDEP, className, methodName);

        List<caseDistributeEntity> cdbeList = MCMEB08Service.Instance.getCaseDistribute( StartDate, EndDate, U_MDEP,User_MDEP);//<==========

        log.endWrite("'cdbeList' : "+cdbeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cdbeList);
    }

    public string getCaseDistributeList(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : "+U_Num, className, methodName);

        List<caseDistributeDataEntity> cddeList = caseDistributeListService.Instance.getCaseDistributeList(U_Num);//<==========

        log.endWrite("'cddeList' : "+cddeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cddeList);
    }

   public string getTagHistory(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID':"+M_ID, className, methodName);

        List<DMBERentity> deList = customerManageService.Instance.getTagHistory(M_ID);//<==========

        log.endWrite(deList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(deList);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}