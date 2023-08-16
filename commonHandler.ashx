<%@ WebHandler Language="C#" Class="commonHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class commonHandler : IHttpHandler
{

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string U_Num = string.Empty;
        string ComID = string.Empty;
        string U_MDEP = string.Empty;
        string M_ID = string.Empty;
        string action = context.Request["action"];
        //string county = context.Request["county"];//取得選到的縣/市
        string StartDate = string.Empty;
        string EndDate = string.Empty;
        string U_Position = string.Empty;
        string U_Leader = string.Empty;
        string listType = string.Empty;
        string LeaveDate = string.Empty;
        string County = string.Empty;
        string SelectCom_Title = string.Empty;
        string SelectDept_Title = string.Empty;
        string TeacherUnum = string.Empty;

        switch (action)
        {
            case "getPITEMListFuc"://取得付款方式
                context.Response.Write(getPITEMListFuc());
                break;
            case "addBusinessConnection":
                ComID = context.Request["ComID"];
                U_MDEP = context.Request["U_MDEP"];
                context.Response.Write(getSelectEmplist(ComID, U_MDEP));
                break;
            case "getSelectEmplist":
                ComID = context.Request["ComID"];
                U_MDEP = context.Request["U_MDEP"];
                context.Response.Write(getSelectEmplist(ComID, U_MDEP));
                break;
            //依照分析師編號取得產品種類
            case "getMP_ItemList":
                U_Num = context.Request["U_Num"];
                context.Response.Write(getMP_ItemList(U_Num));
                break;
            case "getBusinessConnectionList"://取得業聯單列表
                context.Response.Write(getBusinessConnectionList());
                break;
            case "getCF_ITemListFuc"://取得業務聯絡單
                context.Response.Write(getCF_ITemListFuc());
                break;
            case "getBusinessConnectionDataEditRecord"://取得案件修改明細
                M_ID = context.Request["M_ID"];
                context.Response.Write(getCF_ITemListFuc());
                break;

            case "getMCOTFListFuc":
                break;
            case "getSelectEmploy":
                string COMID = context.Request["COMID"];
                string U_POSITION = context.Request["U_POSITION"];
                context.Response.Write(getSelectEmployList(COMID, U_POSITION));
                break;
            case "getCustomerDetailAnalyst":
                string COMID_ = context.Request["COMID"];
                context.Response.Write(getCustomerDetailAnalyst(COMID_));
                break;
            case "getMPToMP_Type":
                string MP_UserNum = context.Request["MP_UserNum"];
                context.Response.Write(getMPToMP_TypeList(MP_UserNum));
                break;
            //取得會員種類
            case "getMemberTypeFunc":
                TeacherUnum = context.Request["TeacherUnum"];
                context.Response.Write(getMemberTypeList(TeacherUnum));
                break;
            //取得部門主管
            case "getLeaderListFuc":
                SelectCom_Title = context.Request["SelectCom_Title"];
                SelectDept_Title = context.Request["SelectDept_Title"];
                context.Response.Write(getAgentList(SelectCom_Title, SelectDept_Title));
                break;
            //取得代理人
            case "getAgentListFuc":
                SelectCom_Title = context.Request["SelectCom_Title"];
                SelectDept_Title = context.Request["SelectDept_Title"];
                context.Response.Write(getAgentList(SelectCom_Title, SelectDept_Title));
                break;
            //取得電話區碼
            case "getSelectTelZoneListFuc":
                context.Response.Write(getTelZoneList());
                break;
            ////getBankListFuc(取得個人業績表[何承唐]會員種類)
            ///D9907161
            case "D9907161":
                context.Response.Write(getTelZoneList());
                break;
            ////取得銀行列表
            case "getBankListFuc":
                string BankKeyWord = context.Request["BankKeyWord"];//取得選到的縣/市
                                                                    //string county1 = context.Request["action1"];
                                                                    //context.Response.Write(getBankListList());
                                                                    //if (county != null)		context.Request["BankKeyWord"]	"undefined"	string

                if (context.Request["BankKeyWord"].ToString() != "undefined")
                {
                    context.Response.Write(getBankListList(BankKeyWord));
                }
                else
                {
                    context.Response.Write(getBankListList());
                }
                break;
            //取得所屬部門列表
            case "getDeptOptionListFuc":
                //string SelectCom = context.Request["SelectCom"];
                context.Response.Write(getDeptOptionListList());
                break;
            //取得所屬公司列表
            case "getComOptionListFuc":
                //string county2 = context.Request["action1"];
                context.Response.Write(getComOptionList());
                break;
            //取得所屬部門列表
            case "getSelectDeptListFuc":
                string county3 = context.Request["action1"];
                context.Response.Write(getSelectDeptList());
                break;
            //取得所屬公司列表
            case "getSelectComListFuc":
                string county4 = context.Request["action1"];
                context.Response.Write(getSelectComList());
                break;
            //取得投資金額列表
            case "getInvestMoneyListFuc":
                string county5 = context.Request["action1"];
                context.Response.Write(getInvestMoneyList());
                break;
            //取得等級列表
            case "getSelectLevelListFuc":
                context.Response.Write(getSelectLevelList());
                break;
            case "getAnalystMITEM":
                    string mitcode=context.Request["MITCODE"];
                context.Response.Write(getAnalystMITEM(mitcode));
                    break;
            //取得職稱列表
            case "getSelectUITEMListFuc":
                context.Response.Write(getSelectUITEMList());
                break;
            ////取得縣市列表
            case "getCountyOptionListFuc":
                context.Response.Write(getSelectCountyList());
                break;
            ////取得鄉鎮區市列表getTownShipOptionListFuc
            case "getTownShipOptionListFuc":
                //county = context.Request["action1"];
                string county = context.Request["county"];//取得選到的縣/市
                                                          //取得County
                                                          //if (county != null)
                if (context.Request["county"] != null)
                {
                    context.Response.Write(getSelectTownShipList(county));
                }
                else
                {
                    context.Response.Write(getSelectTownShipList());
                }
                break;
            //取得職稱列表
            case "getSelectPositListFuc":
                context.Response.Write(getSelectPositList());
                break;

            case "getUserAuthority":
                string menu_no = context.Request["menu_no"];
                U_Num = context.Request["U_Num"];
                context.Response.Write(getUserAuthority(menu_no, U_Num));
                break;
            case "getList":
                U_Num = context.Request["U_Num"];
                ComID = context.Request["ComID"];
                listType = context.Request["listType"];
                context.Response.Write(getList(listType, U_Num, ComID));
                break;
            case "getListByViewtag0":
                listType = context.Request["listType"];
                context.Response.Write(getListByViewtag0(listType));
                break;
            case "getAnalyst":
                ComID = context.Request["ComID"];
                U_Num = context.Request["U_Num"];
                context.Response.Write(getAnalystList(ComID));
                break;

            case "getAnalystList":
                ComID = context.Request["ComID"];
                U_Num = context.Request["U_Num"];
                context.Response.Write(getAnalystList(ComID));
                break;
            case "getDispatcherList"://取得派發人員
                ComID = context.Request["ComID"];
                U_Num = context.Request["U_Num"];
                context.Response.Write(getDispatcherList(ComID, U_Num));
                break;
            case "getZitemListFuc"://取得資源帳號列表
                listType = context.Request["listType"];
                ComID = context.Request["ComID"];
                U_Num = context.Request["U_Num"];
                context.Response.Write(getZitemListFucList(ComID, U_Num));
                //context.Response.Write(getAnalystList(ComID));//20220705修改
                break;
            case "getTradingStatusList"://取得交易狀態列表
                listType = context.Request["listType"];
                ComID = context.Request["ComID"];
                U_Num = context.Request["U_Num"];
                context.Response.Write(getTradingStatusList());
                break;
            case "getVenueDataList":
                context.Response.Write(getVenueDataList());
                break;
            case "getMClist":
                U_Num = context.Request["U_Num"];
                context.Response.Write(getMClist(U_Num));
                break;
            case "getCompanyData":
                context.Response.Write(getCompanyData());
                break;
            case "getMCdata":
                U_Num = context.Request["U_Num"];
                context.Response.Write(getMCdata(U_Num));
                break;

            case "getEmplist":
                ComID = context.Request["ComID"];
                U_MDEP = context.Request["U_MDEP"];
                context.Response.Write(getEmplist(ComID, U_MDEP));
                break;

            case "getResponsibleAssistantList":
                ComID = context.Request["ComID"];
                U_MDEP = context.Request["U_MDEP"];
                context.Response.Write(getResponsibleAssistantList(ComID, U_MDEP));
                break;
            //取得責任助理
            case "getResponsibleAssistantListForMCMCHTR_query":
                context.Response.Write(getResponsibleAssistantListForMCMCHTR_query());
                break;
            /*case "getAnalystListForPerformance":
                  StartDate = context.Request["StartDate"];
                  EndDate = context.Request["EndDate"];
                  context.Response.Write(getAnalystListForPerformance(StartDate,EndDate));
                  break;*/
            case "getEmpListForPerformance":
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];
                string EmpType = context.Request["EmpType"];
                ComID = context.Request["ComID"];
                U_MDEP = context.Request["U_MDEP"];
                context.Response.Write(getEmpListForPerformance(StartDate, EndDate, EmpType, ComID, U_MDEP));
                break;
            case "getGroupEmp":
                StartDate = context.Request["StartDate"];
                EndDate = context.Request["EndDate"];
                string groupType = context.Request["groupType"];
                context.Response.Write(getGroupEmp(StartDate, EndDate, groupType));
                break;
            case "getAnalystListForMessageSearch":
                ComID = context.Request["ComID"];
                U_MDEP = context.Request["U_MDEP"];
                U_Num = context.Request["U_Num"];
                U_Position = context.Request["U_Position"];
                U_Leader = context.Request["U_Leader"];
                context.Response.Write(getAnalystListForMessageSearch(ComID, U_MDEP, U_Num, U_Leader, U_Position));
                break;
            case "getAnalystListForOItable":
                ComID = context.Request["ComID"];
                U_MDEP = context.Request["U_MDEP"];
                U_Num = context.Request["U_Num"];
                U_Position = context.Request["U_Position"];
                U_Leader = context.Request["U_Leader"];
                context.Response.Write(getAnalystListForOItable(ComID, U_MDEP, U_Num, U_Leader, U_Position));
                break;
            case "getAnalystListAllPowerSendRecord":
                ComID = context.Request["ComID"];
                U_MDEP = context.Request["U_MDEP"];
                U_Num = context.Request["U_Num"];
                U_Position = context.Request["U_Position"];
                U_Leader = context.Request["U_Leader"];
                context.Response.Write(getAnalystListAllPowerSendRecord(ComID, U_MDEP, U_Num, U_Leader, U_Position));
                break;
            case "getEmpExtension":
                U_MDEP = context.Request["U_MDEP"];
                ComID = context.Request["ComID"];
                context.Response.Write(getEmpExtension(ComID, U_MDEP));
                break;
            //20220517
            //getAnalystListHtmlTagOptionForSRMSYSKQuery
            case "getAnalystListHtmlTagOptionForSRMSYSKQuery":
                U_Position = context.Request["U_Position"];
                ComID = context.Request["ComID"];
                U_Num = context.Request["U_Num"];
                LeaveDate = context.Request["LeaveDate"];
                context.Response.Write(getAnalystListForSRMSYSKQuery(U_Position, ComID, U_Num, LeaveDate));
                break;

        };
    }

    public string getEmplist(string ComID, string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID' : " + ComID + "'U_MDEP' : " + U_MDEP, className, methodName);

        //List<indexBDdataEntity> ibddeList = commonService.Instance.getEmpListForPerformance(StartDate, EndDate, EmpType, ComID, U_MDEP);//<==========
        List<muserEntity> ibddeList = commonService.Instance.getEmplist(ComID, U_MDEP);//<==========
        log.endWrite(ibddeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ibddeList);
    }
    //取得付款方式
    public string getPITEMListFuc()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string imList = "";
        log.endWrite(imList.ToString(), className, methodName);
        StringBuilder html = new StringBuilder();
        //List<ditcodedescEntity> SelectTelZoneList = commonService.Instance.getTelZoneList();//<==========
        List<ditcodedescEntity> PITEMList = commonService.Instance.getPITEMList();//<==========
        return Newtonsoft.Json.JsonConvert.SerializeObject(PITEMList);
    }



    public string getMP_ItemList(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string imList = "";
        log.endWrite(imList.ToString(), className, methodName);
        StringBuilder html = new StringBuilder();
        //List<ditcodedescEntity> SelectTelZoneList = commonService.Instance.getTelZoneList();//<==========
        List<ditcodedescEntity> SelectMP_ItemList = commonService.Instance.getMP_ItemList(U_Num);//<==========
        return Newtonsoft.Json.JsonConvert.SerializeObject(SelectMP_ItemList);
    }
    //取得業務聯絡單列表
    //getBusinessConnectionList
    public string getBusinessConnectionList()
    {
        return "";
    }
    //取得案件修改明細
    public string getBusinessConnectionDataEditRecord(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string imList = "";
        log.endWrite(imList.ToString(), className, methodName);
        StringBuilder html = new StringBuilder();
        //List<ditcodedescEntity> SelectTelZoneList = commonService.Instance.getTelZoneList();//<==========
        List<ditcodedescEntity> SelectCF_ITemList = commonService.Instance.getCF_ITemList();//<==========這裡要再修改!!!!!
        return Newtonsoft.Json.JsonConvert.SerializeObject(SelectCF_ITemList);
    }

    //getSelectEmployList(COMID, U_POSITION)
    ////取得[聯絡單種類]
    public string getCF_ITemListFuc()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string imList = "";
        log.endWrite(imList.ToString(), className, methodName);
        StringBuilder html = new StringBuilder();
        //List<ditcodedescEntity> SelectTelZoneList = commonService.Instance.getTelZoneList();//<==========
        List<ditcodedescEntity> SelectCF_ITemList = commonService.Instance.getCF_ITemList();//<==========
        return Newtonsoft.Json.JsonConvert.SerializeObject(SelectCF_ITemList);
    }
    //getSelectEmployList(COMID, U_POSITION)
    public string getSelectEmployList(string COMID, string U_POSITION)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string imList = "";
        log.endWrite(imList.ToString(), className, methodName);
        StringBuilder html = new StringBuilder();
        //List<ditcodedescEntity> SelectTelZoneList = commonService.Instance.getTelZoneList();//<==========
        List<ditcodedescEntity> SelectEmployList = commonService.Instance.getSelectEmployList(COMID, U_POSITION);//<==========
        return Newtonsoft.Json.JsonConvert.SerializeObject(SelectEmployList);
    }
    //getCustomerDetailAnalyst
    public string getCustomerDetailAnalyst(string COM_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string imList = "";
        log.endWrite(imList.ToString(), className, methodName);

        StringBuilder html = new StringBuilder();
        //List<ditcodedescEntity> SelectTelZoneList = commonService.Instance.getTelZoneList();//<==========
        List<ditcodedescEntity> SelectCustomerDetailAnalyst = commonService.Instance.getCustomerDetailAnalyst(COM_ID);//<==========
        return Newtonsoft.Json.JsonConvert.SerializeObject(SelectCustomerDetailAnalyst);
    }
    //getMPToMP_TypeList
    public string getMPToMP_TypeList(string MP_Type)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string imList = "";
        log.endWrite(imList.ToString(), className, methodName);

        StringBuilder html = new StringBuilder();
        //List<ditcodedescEntity> SelectTelZoneList = commonService.Instance.getTelZoneList();//<==========
        List<ditcodedescEntity> SelectMPToMP_TypeList = commonService.Instance.getMPToMP_TypeList(MP_Type);//<==========
        return Newtonsoft.Json.JsonConvert.SerializeObject(SelectMPToMP_TypeList);
    }
    //getLeaderListFuc
    //取得部門主管
    public string getLeaderList(string SelectCom_Title, string SelectDept_Title)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string imList = "";
        log.endWrite(imList.ToString(), className, methodName);

        StringBuilder html = new StringBuilder();
        //List<ditcodedescEntity> SelectTelZoneList = commonService.Instance.getTelZoneList();//<==========
        List<ditcodedescEntity> SelectAgentList = commonService.Instance.getLeaderList(SelectCom_Title, SelectDept_Title);//<==========
        return Newtonsoft.Json.JsonConvert.SerializeObject(SelectAgentList);
    }
    //getMemberTypeList
    //D9907161
    public string getMemberTypeList(string TeacherUnum)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string imList = "";
        log.endWrite(imList.ToString(), className, methodName);

        StringBuilder html = new StringBuilder();
        //List<ditcodedescEntity> SelectTelZoneList = commonService.Instance.getTelZoneList();//<==========
        List<ditcodedescEntity> MemberTypeList = commonService.Instance.getMemberTypeList(TeacherUnum);//<==========

        return Newtonsoft.Json.JsonConvert.SerializeObject(MemberTypeList);
    }
    //getAgentListFuc
    //取得代理人
    public string getAgentList(string SelectCom_Title, string SelectDept_Title)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string imList = "";
        log.endWrite(imList.ToString(), className, methodName);

        StringBuilder html = new StringBuilder();
        //List<ditcodedescEntity> SelectTelZoneList = commonService.Instance.getTelZoneList();//<==========
        List<ditcodedescEntity> SelectAgentList = commonService.Instance.getAgentList(SelectCom_Title, SelectDept_Title);//<==========
        return Newtonsoft.Json.JsonConvert.SerializeObject(SelectAgentList);
    }
    //getTelZoneList(取得電話區碼表)
    public string getTelZoneList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string imList = "";
        log.endWrite(imList.ToString(), className, methodName);

        StringBuilder html = new StringBuilder();
        List<ditcodedescEntity> SelectTelZoneList = commonService.Instance.getTelZoneList();//<==========

        return Newtonsoft.Json.JsonConvert.SerializeObject(SelectTelZoneList);
    }
    //取得銀行列表getBankListList(含銀行關鍵字)
    public string getBankListList(string BankKeyWord)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string imList = "";
        log.endWrite(imList.ToString(), className, methodName);

        StringBuilder html = new StringBuilder();
        List<ditcodedescEntity> SelectPositList = commonService.Instance.getBankListList(BankKeyWord);//<==========

        return Newtonsoft.Json.JsonConvert.SerializeObject(SelectPositList);
    }
    //取得銀行列表getBankListList
    public string getBankListList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string imList = "";
        log.endWrite(imList.ToString(), className, methodName);

        StringBuilder html = new StringBuilder();
        List<ditcodedescEntity> SelectPositList = commonService.Instance.getBankListList();//<==========

        return Newtonsoft.Json.JsonConvert.SerializeObject(SelectPositList);
    }

    //取得職稱列表
    public string getSelectPositList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string imList = "";
        log.endWrite(imList.ToString(), className, methodName);

        StringBuilder html = new StringBuilder();
        List<ditcodedescEntity> SelectPositList = commonService.Instance.getSelectPositList();//<==========

        return Newtonsoft.Json.JsonConvert.SerializeObject(SelectPositList);
    }

    //取得所屬公司列表
    public string getSelectComList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string imList = "";
        log.endWrite(imList.ToString(), className, methodName);

        StringBuilder html = new StringBuilder();
        List<ditcodedescEntity> SelectComList = commonService.Instance.getSelectComList();//<==========

        return Newtonsoft.Json.JsonConvert.SerializeObject(SelectComList);

    }
    //取得所屬部門列表
    public string getDeptOptionListList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string imList = "";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        StringBuilder html = new StringBuilder();
        List<ditcodedescEntity> DeptOptionListList = commonService.Instance.getSelectDeptList();//<==========

        log.endWrite(imList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(DeptOptionListList);
    }
    public string getCountyOptionList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string imList = "";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        StringBuilder html = new StringBuilder();
        List<ditcodedescEntity> DeptOptionListList = commonService.Instance.getCountyOptionList();//<==========

        log.endWrite(imList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(DeptOptionListList);
    }

    //getDeptOptionListList
    public string getTownShipOptionList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string imList = "";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        StringBuilder html = new StringBuilder();
        List<ditcodedescEntity> DeptOptionListList = commonService.Instance.getSelectDeptList();//<==========

        log.endWrite(imList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(DeptOptionListList);
    }
    //getComOptionList
    ////取得所屬公司列表
    public string getComOptionList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string imList = "";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        StringBuilder html = new StringBuilder();
        List<ditcodedescEntity> ComOptionList = commonService.Instance.getSelectComList();//<==========
                                                                                          //List<ditcodedescEntity> ComOptionList = commonService.Instance.getSelectDeptList();//<==========
        log.endWrite(imList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ComOptionList);
    }
    //getSelectDeptList
    //取得所屬部門列表
    public string getSelectDeptList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string imList = "";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);
        StringBuilder html = new StringBuilder();
        List<ditcodedescEntity> SelectDeptList = commonService.Instance.getSelectDeptList();//<==========

        log.endWrite(imList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(SelectDeptList);

    }
    //取得等級列表
    public string getSelectLevelList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        StringBuilder html = new StringBuilder();
        //SELECT [ditcode],[ddesc] FROM [HG].[dbo].[MITEM] where mitcode='POSIT'
        List<ditcodedescEntity> SelectPositList = commonService.Instance.getSelectLevelList();//<==========

        log.endWrite(SelectPositList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(SelectPositList);
    }
    //取得職稱列表
    public string getSelectUITEMList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        StringBuilder html = new StringBuilder();
        //SELECT [ditcode],[ddesc] FROM [HG].[dbo].[MITEM] where mitcode='POSIT'
        List<ditcodedescEntity> SelectLevelList = commonService.Instance.getSelectUITEMList();//<==========

        log.endWrite(SelectLevelList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(SelectLevelList);
    }
    //取得城市
    public string getSelectCountyList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        StringBuilder html = new StringBuilder();
        //SELECT [ditcode],[ddesc] FROM [HG].[dbo].[MITEM] where mitcode='POSIT'
        List<ditcodedescEntity> SelectCountyList = commonService.Instance.getSelectCountyList();//<==========

        log.endWrite(SelectCountyList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(SelectCountyList);
    }
    //取得鄉鎮區縣市(已知城市)
    //getSelectPositList
    public string getSelectTownShipList(string County)
    {
        if (County.Length > 3)
            County = "";

        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        StringBuilder html = new StringBuilder();
        //SELECT [ditcode],[ddesc] FROM [HG].[dbo].[MITEM] where mitcode='POSIT'
        //List<ditcodedescEntity> SelectTownShipList = commonService.Instance.getSelectTownShipList(County);//<==========
        List<ditcodedescEntity> SelectTownShipList = new List<ditcodedescEntity>();
        if (County != "")
        {
            SelectTownShipList = commonService.Instance.getSelectTownShipList(County);
        }
        else
        {
            SelectTownShipList = commonService.Instance.getSelectTownShipList();
        }
        log.endWrite(SelectTownShipList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(SelectTownShipList);
    }

    public string getSelectTownShipList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        StringBuilder html = new StringBuilder();
        //SELECT [ditcode],[ddesc] FROM [HG].[dbo].[MITEM] where mitcode='POSIT'
        //List<ditcodedescEntity> SelectTownShipList = commonService.Instance.getSelectTownShipList(County);//<==========
        List<ditcodedescEntity> SelectTownShipList = commonService.Instance.getSelectTownShipList();
        log.endWrite(SelectTownShipList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(SelectTownShipList);
    }
    ////取得投資金額列表
    public string getInvestMoneyList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        StringBuilder html = new StringBuilder();
        List<InvestMoney> InvestMoneyList = commonService.Instance.getInvestMoneyList();//<==========

        log.endWrite(InvestMoneyList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(InvestMoneyList);
    }
    /// <summary>
    /// 查詢使用者頁面權限
    /// </summary>
    /// <returns></returns>
    public string getUserAuthority(string menu_no, string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        StringBuilder html = new StringBuilder();
        List<muserMenuSetupEntity> mmcList = commonService.Instance.getUserAuthority(menu_no, U_Num);//<==========

        log.endWrite(mmcList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(mmcList);
    }
    ///// <summary>
    //   /// 取得資源帳號列表
    //   /// </summary>
    //   /// <returns></returns>
    //   public string getZitemListt()
    //   {
    //       string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //       //string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
    //       //StringBuilder sb = new StringBuilder();
    //       //sb.Append(string.Format(paramFormat, menu_no, U_Num));
    //       //log.startWrite(sb.ToString(), className, methodName);

    //       StringBuilder html = new StringBuilder();
    //       List<Z_ItemEntity> Z_ItemList= commonService.Instance.getZitemList();//<==========

    //       log.endWrite(Z_ItemList.ToString(), className, methodName);
    //       return Newtonsoft.Json.JsonConvert.SerializeObject(Z_ItemList);
    //   }
    /// <summary>
    /// 取得交易狀態列表
    /// </summary>
    /// <returns></returns>
    public string getTradingStatusList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        //StringBuilder sb = new StringBuilder();
        //sb.Append(string.Format(paramFormat, menu_no, U_Num));
        //log.startWrite(sb.ToString(), className, methodName);

        StringBuilder html = new StringBuilder();
        List<TradingStatus> tradingStatusList = commonService.Instance.getTradingStatusListFucList();//<==========

        log.endWrite(tradingStatusList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(tradingStatusList);
    }
    /// <summary>
    /// 取得各項列表
    /// </summary>
    /// <returns></returns>
    public string getList(string listType, string ComID, string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("listType :" + listType, className, methodName);
        List<ditcodedescEntity> ddeList = indexService.Instance.getditcodedescEntityList(listType, ComID, U_Num);//<==========
                                                                                                                 //listType=DEPAR
        List<ditcodedescEntity> ddeList_New = new List<ditcodedescEntity>();

        if (listType == "DEPAR")
        {
            ditcodedescEntity dde1 = new ditcodedescEntity();
            //dde1.ddesc = "測試";
            //dde1.ditcode = "9999";
            //dde1.mitcode = "DEPAR";
            //ddeList_New.Add(dde1);
            //ditcodedescEntity dde2 = new ditcodedescEntity();
            ////2
            //dde2.ddesc = "全公司";
            //dde2.ditcode = "9999";
            //dde2.mitcode = "DEPAR";
            //ddeList_New.Add(dde2);
            ditcodedescEntity dde3 = new ditcodedescEntity();
            //3
            dde3.ddesc = "全營運事業部";
            dde3.ditcode = "1111";
            dde3.mitcode = "DEPAR";
            ddeList_New.Add(dde3);
            ditcodedescEntity dde4 = new ditcodedescEntity();
            dde4.ddesc = "全營運1部";
            dde4.ditcode = "8888";
            dde4.mitcode = "DEPAR";
            ddeList_New.Add(dde4);
            //5
            ditcodedescEntity dde5 = new ditcodedescEntity();
            dde5.ddesc = "全營運2部";
            dde5.ditcode = "2222";
            dde5.mitcode = "DEPAR";
            ddeList_New.Add(dde5);
            //6
            ditcodedescEntity dde6 = new ditcodedescEntity();
            dde6.ddesc = "全營運3部";
            dde6.ditcode = "33333";
            dde6.mitcode = "DEPAR";
            ddeList_New.Add(dde6);
            //7
            ditcodedescEntity dde7 = new ditcodedescEntity();
            dde7.ddesc = "全營運5部";
            dde7.ditcode = "1115";
            dde7.mitcode = "DEPAR";
            ddeList_New.Add(dde7);
            //8
            ditcodedescEntity dde8 = new ditcodedescEntity();
            dde8.ddesc = "全營運特別部";
            dde8.ditcode = "4444";
            dde8.mitcode = "DEPAR";
            ddeList_New.Add(dde8);

            //9
            ditcodedescEntity dde9 = new ditcodedescEntity();
            dde9.ddesc = "全投資推廣部";
            dde9.ditcode = "7777";
            dde9.mitcode = "DEPAR";
            ddeList_New.Add(dde9);
            //10
            ditcodedescEntity dde10 = new ditcodedescEntity();
            dde10.ddesc = "全財富管理部";
            dde10.ditcode = "55551";
            dde10.mitcode = "DEPAR";
            ddeList_New.Add(dde10);
            //11
            ditcodedescEntity dde11 = new ditcodedescEntity();
            dde11.ddesc = "全財富2部";
            dde11.ditcode = "55552";
            dde11.mitcode = "DEPAR";
            ddeList_New.Add(dde11);
            //12
            ditcodedescEntity dde12 = new ditcodedescEntity();
            dde12.ddesc = "全理財推廣部";
            dde12.ditcode = "3333";
            dde12.mitcode = "DEPAR";
            ddeList_New.Add(dde12);
            //13
            ditcodedescEntity dde13 = new ditcodedescEntity();
            dde13.ddesc = "全行政部";
            dde13.ditcode = "6666";
            dde13.mitcode = "DEPAR";
            ddeList_New.Add(dde13);
            foreach (var item in ddeList)
            {
                ditcodedescEntity dde_Add = new ditcodedescEntity();
                dde_Add.ddesc = item.ddesc;
                dde_Add.ditcode = item.ditcode;
                dde_Add.mitcode = item.mitcode;
                ddeList_New.Add(dde_Add);
            }
            return Newtonsoft.Json.JsonConvert.SerializeObject(ddeList_New);
        }
        else if (listType == "getZitemListFuc")//20220704修改
        {
            ditcodedescEntity dde3 = new ditcodedescEntity();
            //3
            dde3.ddesc = "TEST全營運事業部";
            dde3.ditcode = "1111";
            dde3.mitcode = "DEPAR";
            ddeList_New.Add(dde3);
            ditcodedescEntity dde4 = new ditcodedescEntity();
            dde4.ddesc = "TEST全營運1部";
            dde4.ditcode = "8888";
            dde4.mitcode = "DEPAR";
            ddeList_New.Add(dde4);
            //5
            ditcodedescEntity dde5 = new ditcodedescEntity();
            dde5.ddesc = "TEST全營運2部";
            dde5.ditcode = "2222";
            dde5.mitcode = "DEPAR";
            ddeList_New.Add(dde5);
            //6
            ditcodedescEntity dde6 = new ditcodedescEntity();
            dde6.ddesc = "TEST全營運3部";
            dde6.ditcode = "33333";
            dde6.mitcode = "DEPAR";
            ddeList_New.Add(dde6);
            //7
            ditcodedescEntity dde7 = new ditcodedescEntity();
            dde7.ddesc = "TEST全營運5部";
            dde7.ditcode = "1115";
            dde7.mitcode = "DEPAR";
            ddeList_New.Add(dde7);
            //8
            ditcodedescEntity dde8 = new ditcodedescEntity();
            dde8.ddesc = "TEST全營運特別部";
            dde8.ditcode = "4444";
            dde8.mitcode = "DEPAR";
            ddeList_New.Add(dde8);

            //9
            ditcodedescEntity dde9 = new ditcodedescEntity();
            dde9.ddesc = "TEST全投資推廣部";
            dde9.ditcode = "7777";
            dde9.mitcode = "DEPAR";
            ddeList_New.Add(dde9);
            //10
            ditcodedescEntity dde10 = new ditcodedescEntity();
            dde10.ddesc = "TEST全財富管理部";
            dde10.ditcode = "55551";
            dde10.mitcode = "DEPAR";
            ddeList_New.Add(dde10);
            //11
            ditcodedescEntity dde11 = new ditcodedescEntity();
            dde11.ddesc = "TEST全財富2部";
            dde11.ditcode = "55552";
            dde11.mitcode = "DEPAR";
            ddeList_New.Add(dde11);
            //12
            ditcodedescEntity dde12 = new ditcodedescEntity();
            dde12.ddesc = "TEST全理財推廣部";
            dde12.ditcode = "3333";
            dde12.mitcode = "DEPAR";
            ddeList_New.Add(dde12);
            //13
            ditcodedescEntity dde13 = new ditcodedescEntity();
            dde13.ddesc = "TEST全行政部";
            dde13.ditcode = "6666";
            dde13.mitcode = "DEPAR";
            ddeList_New.Add(dde13);
            //foreach (var item in ddeList)
            //{
            //    ditcodedescEntity dde_Add = new ditcodedescEntity();
            //    dde_Add.ddesc = item.ddesc;
            //    dde_Add.ditcode = item.ditcode;
            //    dde_Add.mitcode = item.mitcode;
            //    ddeList_New.Add(dde_Add);
            //}
            return Newtonsoft.Json.JsonConvert.SerializeObject(ddeList_New);
        }

        log.endWrite(ddeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ddeList);
        //return Newtonsoft.Json.JsonConvert.SerializeObject(ddeList_New);
    }


    //public string getList(string listType, string U_Num, string COM_ID)
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    log.startWrite("listType :" + listType, className, methodName);
    //    List<ditcodedescEntity> ddeList = indexService.Instance.getditcodedescEntityList(listType,U_Num,COM_ID);//<==========
    //                                                                                                 //listType=DEPAR
    //    List<ditcodedescEntity> ddeList_New = new List<ditcodedescEntity>();

    //    if (listType == "DEPAR")
    //    {
    //        ditcodedescEntity dde1 = new ditcodedescEntity();
    //        //dde1.ddesc = "測試";
    //        //dde1.ditcode = "9999";
    //        //dde1.mitcode = "DEPAR";
    //        //ddeList_New.Add(dde1);
    //        //ditcodedescEntity dde2 = new ditcodedescEntity();
    //        ////2
    //        //dde2.ddesc = "全公司";
    //        //dde2.ditcode = "9999";
    //        //dde2.mitcode = "DEPAR";
    //        //ddeList_New.Add(dde2);
    //        ditcodedescEntity dde3 = new ditcodedescEntity();
    //        //3
    //        dde3.ddesc = "全營運事業部";
    //        dde3.ditcode = "1111";
    //        dde3.mitcode = "DEPAR";
    //        ddeList_New.Add(dde3);
    //        ditcodedescEntity dde4 = new ditcodedescEntity();
    //        dde4.ddesc = "全營運1部";
    //        dde4.ditcode = "8888";
    //        dde4.mitcode = "DEPAR";
    //        ddeList_New.Add(dde4);
    //        //5
    //        ditcodedescEntity dde5 = new ditcodedescEntity();
    //        dde5.ddesc = "全營運2部";
    //        dde5.ditcode = "2222";
    //        dde5.mitcode = "DEPAR";
    //        ddeList_New.Add(dde5);
    //        //6
    //        ditcodedescEntity dde6 = new ditcodedescEntity();
    //        dde6.ddesc = "全營運3部";
    //        dde6.ditcode = "33333";
    //        dde6.mitcode = "DEPAR";
    //        ddeList_New.Add(dde6);
    //        //7
    //        ditcodedescEntity dde7 = new ditcodedescEntity();
    //        dde7.ddesc = "全營運5部";
    //        dde7.ditcode = "1115";
    //        dde7.mitcode = "DEPAR";
    //        ddeList_New.Add(dde7);
    //        //8
    //        ditcodedescEntity dde8 = new ditcodedescEntity();
    //        dde8.ddesc = "全營運特別部";
    //        dde8.ditcode = "4444";
    //        dde8.mitcode = "DEPAR";
    //        ddeList_New.Add(dde8);

    //        //9
    //        ditcodedescEntity dde9 = new ditcodedescEntity();
    //        dde9.ddesc = "全投資推廣部";
    //        dde9.ditcode = "7777";
    //        dde9.mitcode = "DEPAR";
    //        ddeList_New.Add(dde9);
    //        //10
    //        ditcodedescEntity dde10 = new ditcodedescEntity();
    //        dde10.ddesc = "全財富管理部";
    //        dde10.ditcode = "55551";
    //        dde10.mitcode = "DEPAR";
    //        ddeList_New.Add(dde10);
    //        //11
    //        ditcodedescEntity dde11 = new ditcodedescEntity();
    //        dde11.ddesc = "全財富2部";
    //        dde11.ditcode = "55552";
    //        dde11.mitcode = "DEPAR";
    //        ddeList_New.Add(dde11);
    //        //12
    //        ditcodedescEntity dde12 = new ditcodedescEntity();
    //        dde12.ddesc = "全理財推廣部";
    //        dde12.ditcode = "3333";
    //        dde12.mitcode = "DEPAR";
    //        ddeList_New.Add(dde12);
    //        //13
    //        ditcodedescEntity dde13 = new ditcodedescEntity();
    //        dde13.ddesc = "全行政部";
    //        dde13.ditcode = "6666";
    //        dde13.mitcode = "DEPAR";
    //        ddeList_New.Add(dde13);
    //        foreach (var item in ddeList)
    //        {
    //            ditcodedescEntity dde_Add = new ditcodedescEntity();
    //            dde_Add.ddesc = item.ddesc;
    //            dde_Add.ditcode = item.ditcode;
    //            dde_Add.mitcode = item.mitcode;
    //            ddeList_New.Add(dde_Add);
    //        }
    //        return Newtonsoft.Json.JsonConvert.SerializeObject(ddeList_New);
    //    }
    //    else if (listType == "getZitemListFuc")//20220704修改
    //    {
    //        var test = U_Num;
    //        var test1 = COM_ID;
    //        ditcodedescEntity dde3 = new ditcodedescEntity();
    //        //3
    //        dde3.ddesc = "TEST全營運事業部";
    //        dde3.ditcode = "1111";
    //        dde3.mitcode = "DEPAR";
    //        ddeList_New.Add(dde3);
    //        ditcodedescEntity dde4 = new ditcodedescEntity();
    //        dde4.ddesc = "TEST全營運1部";
    //        dde4.ditcode = "8888";
    //        dde4.mitcode = "DEPAR";
    //        ddeList_New.Add(dde4);
    //        //5
    //        ditcodedescEntity dde5 = new ditcodedescEntity();
    //        dde5.ddesc = "TEST全營運2部";
    //        dde5.ditcode = "2222";
    //        dde5.mitcode = "DEPAR";
    //        ddeList_New.Add(dde5);
    //        //6
    //        ditcodedescEntity dde6 = new ditcodedescEntity();
    //        dde6.ddesc = "TEST全營運3部";
    //        dde6.ditcode = "33333";
    //        dde6.mitcode = "DEPAR";
    //        ddeList_New.Add(dde6);
    //        //7
    //        ditcodedescEntity dde7 = new ditcodedescEntity();
    //        dde7.ddesc = "TEST全營運5部";
    //        dde7.ditcode = "1115";
    //        dde7.mitcode = "DEPAR";
    //        ddeList_New.Add(dde7);
    //        //8
    //        ditcodedescEntity dde8 = new ditcodedescEntity();
    //        dde8.ddesc = "TEST全營運特別部";
    //        dde8.ditcode = "4444";
    //        dde8.mitcode = "DEPAR";
    //        ddeList_New.Add(dde8);

    //        //9
    //        ditcodedescEntity dde9 = new ditcodedescEntity();
    //        dde9.ddesc = "TEST全投資推廣部";
    //        dde9.ditcode = "7777";
    //        dde9.mitcode = "DEPAR";
    //        ddeList_New.Add(dde9);
    //        //10
    //        ditcodedescEntity dde10 = new ditcodedescEntity();
    //        dde10.ddesc = "TEST全財富管理部";
    //        dde10.ditcode = "55551";
    //        dde10.mitcode = "DEPAR";
    //        ddeList_New.Add(dde10);
    //        //11
    //        ditcodedescEntity dde11 = new ditcodedescEntity();
    //        dde11.ddesc = "TEST全財富2部";
    //        dde11.ditcode = "55552";
    //        dde11.mitcode = "DEPAR";
    //        ddeList_New.Add(dde11);
    //        //12
    //        ditcodedescEntity dde12 = new ditcodedescEntity();
    //        dde12.ddesc = "TEST全理財推廣部";
    //        dde12.ditcode = "3333";
    //        dde12.mitcode = "DEPAR";
    //        ddeList_New.Add(dde12);
    //        //13
    //        ditcodedescEntity dde13 = new ditcodedescEntity();
    //        dde13.ddesc = "TEST全行政部";
    //        dde13.ditcode = "6666";
    //        dde13.mitcode = "DEPAR";
    //        ddeList_New.Add(dde13);
    //        //foreach (var item in ddeList)
    //        //{
    //        //    ditcodedescEntity dde_Add = new ditcodedescEntity();
    //        //    dde_Add.ddesc = item.ddesc;
    //        //    dde_Add.ditcode = item.ditcode;
    //        //    dde_Add.mitcode = item.mitcode;
    //        //    ddeList_New.Add(dde_Add);
    //        //}
    //        return Newtonsoft.Json.JsonConvert.SerializeObject(ddeList_New);
    //    }

    //    log.endWrite(ddeList.ToString(), className, methodName);
    //    return Newtonsoft.Json.JsonConvert.SerializeObject(ddeList);
    //    //return Newtonsoft.Json.JsonConvert.SerializeObject(ddeList_New);
    //}

    public string getListByViewtag0(string listType)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("listType :" + listType, className, methodName);

        List<ditcodedescEntity> ddeList = ddeList = indexService.Instance.getditcodedescEntityListByViewtag0(listType);//<==========

        log.endWrite(ddeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ddeList);
    }

    /// <summary>
    /// 取得派發人員列表
    /// </summary>
    /// <returns></returns>
    public string getDispatcherList(string ComID, string U_num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        List<indexBDdataEntity> cdeList = commonService.Instance.getDispatcherList(ComID, U_num);//<==========
        log.endWrite(cdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cdeList);
    }
    /// <summary>
    /// 取得交易狀態
    /// </summary>
    /// <returns></returns>
    public string getTradingStatusListFuc()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        List<TradingStatus> cdeList = commonService.Instance.getTradingStatusListFucList();//<==========
        log.endWrite(cdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cdeList);
    }

    public string getAnalystMITEM(string MITCODE)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        List<ditcodedescEntity> cdeList = commonService.Instance.getAnalystMITEM(MITCODE);//<==========
        log.endWrite(cdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cdeList);
    }
    /// <summary>
    /// 取得資源帳號列表
    /// </summary>
    /// <returns></returns>
    public string getZitemListFucList(string ComID, string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        List<Z_ItemEntity> cdeList = commonService.Instance.getZitemListFucList(ComID, U_Num);//<==========
        log.endWrite(cdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cdeList);
    }


    /// <summary>
    /// 取得分析師表列表
    /// </summary>
    /// <returns></returns>
    public string getAnalystList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<indexBDdataEntity> cdeList = commonService.Instance.getAnalystList();//<==========

        log.endWrite(cdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cdeList);
    }
    /// <summary>
    /// 取得分析師表列表
    /// </summary>
    /// <returns></returns>
    public string getAnalystList(string Comid)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<indexBDdataEntity> cdeList = commonService.Instance.getAnalystList(Comid);//<==========

        log.endWrite(cdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cdeList);
    }

    public string getAnalystListForMessageSearch(string ComID, string U_MDEP, string U_Num, string U_Leader, string U_Position)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID':" + ComID + "'U_MDEP':" + U_MDEP + "'U_Num':" + U_Num + "'U_Leader':" + U_Leader + "'U_Position':" + U_Position, className, methodName);

        List<indexBDdataEntity> ibddeList = commonService.Instance.getAnalystListForMessageSearch(ComID, U_MDEP, U_Num, U_Leader, U_Position);//<==========

        log.endWrite("'ibddeList':" + ibddeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ibddeList);
    }

    public string getAnalystListForOItable(string ComID, string U_MDEP, string U_Num, string U_Leader, string U_Position)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID':" + ComID + "'U_MDEP':" + U_MDEP + "'U_Num':" + U_Num + "'U_Leader':" + U_Leader + "'U_Position':" + U_Position, className, methodName);

        List<indexBDdataEntity> ibddeList = commonService.Instance.getAnalystListForOItable(ComID, U_MDEP, U_Num, U_Leader, U_Position);//<==========

        log.endWrite("'ibddeList':" + ibddeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ibddeList);
    }

    public string getAnalystListAllPowerSendRecord(string ComID, string U_MDEP, string U_Num, string U_Leader, string U_Position)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID':" + ComID + "'U_MDEP':" + U_MDEP + "'U_Num':" + U_Num + "'U_Leader':" + U_Leader + "'U_Position':" + U_Position, className, methodName);

        List<indexBDdataEntity> ibddeList = commonService.Instance.getAnalystListAllPowerSendRecord(ComID, U_MDEP, U_Num, U_Leader, U_Position);//<==========

        log.endWrite("'ibddeList':" + ibddeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ibddeList);
    }

    //20220517NEW
    public string getAnalystListForSRMSYSKQuery(string U_Position, string Comid, string U_Num, string LeaveDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Position':" + U_Position + "'Comid':" + Comid + "'U_Num':" + U_Num + "'LeaveDate':" + LeaveDate, className, methodName);
        //string U_Position, string Comid, string U_Num,string LeaveDate
        List<muserEntity> ibddeList = commonService.Instance.getAnalystListForSRMSYSKQuery(U_Position, Comid, U_Num, LeaveDate);//<==========

        log.endWrite("'ibddeList':" + ibddeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ibddeList);
    }



    /// <summary>
    /// 取得會場列表
    /// </summary>
    /// <returns></returns>
    public string getVenueDataList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<venueDataEntity> vdeList = customerDetailService.Instance.getVenueDataList();//<==========

        log.endWrite(vdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(vdeList);
    }


    /// <summary>
    /// 取得業務員資料列
    /// </summary>
    /// <returns></returns>
    public string getMClist(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<mcDataEntity> mdeList = customerManageService.Instance.getMClist(U_Num);//<==========

        log.endWrite(mdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(mdeList);

    }


    /// <summary>
    /// 取得公司資料
    /// </summary>
    /// <returns></returns>
    public string getCompanyData()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        companyDataEntity cde = customerDetailService.Instance.getCompanyData();

        log.endWrite(cde.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cde);
    }

    /// <summary>
    /// 取得業務個人資料
    /// </summary>
    /// <param name="U_Num"></param>
    /// <returns></returns>
    public string getMCdata(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' :" + U_Num, className, methodName);

        mcDataEntity mde = customerDetailService.Instance.getMCdata(U_Num);//<==========

        log.endWrite(mde.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(mde);
    }

    public string getSelectEmplist(string ComID, string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("ComID :" + ComID + "&& U_MDEP :" + U_MDEP, className, methodName);

        List<muserEntity> ibddeList = commonService.Instance.getEmplist(ComID, U_MDEP);//<==========

        log.endWrite(ibddeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ibddeList);
    }

    public string getEmpExtension(string ComID, string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("ComID : " + ComID + "U_MDEP : " + U_MDEP, className, methodName);

        List<indexBDdataEntity> ibdeList = commonService.Instance.getEmpExtension(ComID, U_MDEP);

        log.endWrite(ibdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ibdeList);
    }

    public string getResponsibleAssistantListForMCMCHTR_query()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        // log.startWrite("'ComID' :" + ComID + "'U_MDEP' :" + U_MDEP, className, methodName);

        List<ditcodedescEntity> ibddeList = commonService.Instance.getResponsibleAssistantListForMCMCHTR_query();//<==========

        log.endWrite(ibddeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ibddeList);
    }

    public string getResponsibleAssistantList(string ComID, string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID' :" + ComID + "'U_MDEP' :" + U_MDEP, className, methodName);

        List<indexBDdataEntity> ibddeList = commonService.Instance.getResponsibleAssistantList(ComID, U_MDEP);//<==========

        log.endWrite(ibddeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ibddeList);
    }

    /* public string getAnalystListForPerformance(string startDate,string endDate)
     {
         string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
         log.startWrite("startDate :"+startDate+"'endDate' : " +endDate, className, methodName);

         List<indexBDdataEntity> ibddeList = commonService.Instance.getAnalystListForPerformance( startDate, endDate);//<==========

         log.endWrite(ibddeList.ToString(), className, methodName);
         return Newtonsoft.Json.JsonConvert.SerializeObject(ibddeList);
     }*/
    public string getEmpListForPerformance(string StartDate, string EndDate, string EmpType, string ComID, string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("StartDate :" + StartDate + "'EndDate' : " + EndDate + "'EmpType' : " + EmpType + "'ComID' : " + ComID + "'U_MDEP' : " + U_MDEP, className, methodName);

        List<indexBDdataEntity> ibddeList = commonService.Instance.getEmpListForPerformance(StartDate, EndDate, EmpType, ComID, U_MDEP);//<==========

        log.endWrite(ibddeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ibddeList);
    }

    public string getGroupEmp(string startDate, string endDate, string groupType)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("startDate :" + startDate + "'endDate' : " + endDate + "'groupType' : " + groupType, className, methodName);

        List<indexBDdataEntity> ibddeList = commonService.Instance.getGroupEmp(startDate, endDate, groupType);//<==========

        log.endWrite(ibddeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ibddeList);
    }

    public string getAnalystListHtmlTagOptionForSRMSYSKQuery(string startDate, string endDate, string groupType)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("startDate :" + startDate + "'endDate' : " + endDate + "'groupType' : " + groupType, className, methodName);

        List<indexBDdataEntity> ibddeList = commonService.Instance.getAnalystListHtmlTagOptionForSRMSYSKQuery(startDate, endDate, groupType);//<==========

        log.endWrite(ibddeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ibddeList);
    }



    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}