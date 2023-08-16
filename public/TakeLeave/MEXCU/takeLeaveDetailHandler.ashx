<%@ WebHandler Language="C#" Class="takeLeaveDetailHandler" %>

using System;
using System.Web;
using System.Text;
using System.Text;
using System.Collections.Generic;

public class takeLeaveDetailHandler : IHttpHandler {

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string U_Num = string.Empty;
        string EX_id = string.Empty;
        switch (action) {
            case "getLeaveData"://假單查詢
                U_Num = context.Request["U_Num"];
                string MenuNo = context.Request["MenuNo"];
                string EX_Status = context.Request["EX_Status"];
                string EX_Type = context.Request["EX_Type"];
                string StartDate = context.Request["StartDate"];
                string EndDate = context.Request["EndDate"];
                string keyWord = context.Request["keyWord"];
                context.Response.Write(getLeaveData(U_Num, EX_Status, EX_Type, StartDate, EndDate,MenuNo,keyWord));
                break;
            case "getCompensatoryLeaveData":
                U_Num = context.Request["U_Num"];
                context.Response.Write(getCompensatoryLeaveData(U_Num));
                break;
            case "getAnnualLeaveAndCompensatoryLeaveAndSickLeaveData":
                U_Num = context.Request["U_Num"];
                string U_MDEP = context.Request["U_MDEP"];
                context.Response.Write(getAnnualLeaveAndCompensatoryLeaveAndSickLeaveData(U_Num,U_MDEP));
                break;
            case "getAgentAndLeaderData"://假單查詢
                U_Num = context.Request["U_Num"];
                context.Response.Write(getAgentAndLeaderData(U_Num));
                break;
            case "addLeaveData":
                string[] StartDateArr = context.Request["StartDate"].Split('/');
                string[] EndDateArr = context.Request["EndDate"].Split('/');
                leaveDetailEntity lde = new leaveDetailEntity();
                lde.EX_SDate = StartDateArr[2]+"-"+ StartDateArr[0] +"-"+ StartDateArr[1]+" "+ context.Request["StartHour"]+":"+context.Request["StartMin"]+":00";
                lde.EX_EDate = EndDateArr[2]+"-"+ EndDateArr[0] +"-"+ EndDateArr[1]+" "+ context.Request["EndHour"]+":"+context.Request["EndMin"]+":00";
                lde.EX_User = context.Request["EX_User"];
                lde.EX_Name = context.Request["EX_Name"];
                lde.EX_Com = context.Request["EX_Com"];
                lde.EX_Type = context.Request["EX_Type"];
                lde.EX_Agent = context.Request["EX_Agent"];
                lde.EX_Agent_Name = context.Request["EX_Agent_Name"];
                lde.EX_Agent_com = context.Request["EX_Agent_com"];
                lde.EX_Sign1_user = context.Request["EX_Sign1_user"];
                lde.EX_Sign1_name = context.Request["EX_Sign1_name"];
                lde.EX_Sign1_com = context.Request["EX_Sign1_com"];
                lde.EX_Sign2_user = context.Request["EX_Sign2_user"];
                lde.EX_Sign2_name = context.Request["EX_Sign2_name"];
                lde.EX_Sign2_com = context.Request["EX_Sign2_com"];
                lde.EX_Sign3_user = context.Request["EX_Sign3_user"];
                lde.EX_Sign3_name = context.Request["EX_Sign3_name"];
                lde.EX_Sign3_com = context.Request["EX_Sign3_com"];
                lde.EX_Day = context.Request["EX_Day"];
                lde.EX_Hour = context.Request["EX_Hour"];
                lde.EX_Reason = context.Request["EX_Reason"];
                lde.add_ip = context.Request["add_ip"];
                lde.add_user = context.Request["add_user"];
                //string data = "&EX_Agent=" + lde.EX_Agent + "&EX_Agent_Name=" + lde.EX_Agent_Name + "&EX_Agent_com=" + lde.EX_Agent_com + "&EX_Sign1_user =" + lde.EX_Sign1_user + "&EX_Sign1_name =" + lde.EX_Sign1_name + "&EX_Sign1_com =" + lde.EX_Sign1_com + "&EX_Sign2_user =" + lde.EX_Sign2_user + "&EX_Sign2_name =" + lde.EX_Sign2_name + "&EX_Sign2_com =" + lde.EX_Sign2_com + "&EX_Sign3_user =" + lde.EX_Sign3_user + "&EX_Sign3_name =" + lde.EX_Sign3_name + "&EX_Sign3_com =" + lde.EX_Sign3_com + "&EX_Day =" + lde.EX_Day + "&EX_Hour =" + lde.EX_Hour + "&EX_Reason =" + lde.EX_Reason + "&add_ip  =" + lde.add_ip + "&add_user   =" + lde.add_user + "&action=addLeaveData";
                context.Response.Write(addLeaveData(lde));
                break;
            case "deleteLeaveData":
                string deleteId = context.Request["deleteId"];
                context.Response.Write(deleteLeaveData(deleteId));
                break;
            case "getLeaveDetail":
                EX_id = context.Request["EX_id"];
                context.Response.Write(getLeaveDetail(EX_id));
                break;
            case "leaveApproveTF":
                EX_id = context.Request["EX_id"];
                string statusName = context.Request["statusName"];
                string status = context.Request["status"];
                string MS_ID = context.Request["MS_ID"];
                string nextSigner = context.Request["nextSigner"];
                U_Num = context.Request["U_Num"];
                string add_ip = context.Request["add_ip"];
                context.Response.Write(leaveApproveTF(EX_id,statusName,status,MS_ID,nextSigner,U_Num,add_ip));
                break;
        };
    }

    /// <summary>
    /// 取得請假明細
    /// </summary>
    /// <param name="U_Num"></param>
    /// <param name="EX_Status"></param>
    /// <param name="EX_Type"></param>
    /// <param name="StartDate"></param>
    /// <param name="EndDate"></param>
    /// <param name="MenuNo"></param>
    /// <param name="keyWord"></param>
    /// <returns></returns>
    public string getLeaveData(string U_Num,string EX_Status,string EX_Type,string StartDate,string EndDate,string MenuNo,string keyWord)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num':"+U_Num+"'EX_Status':"+EX_Status+"'EX_Type':"+EX_Type+"'StartDate':"+StartDate+"'EndDate':"+EndDate+"'MenuNo':"+MenuNo+"'keyWord':"+keyWord, className, methodName);

        List<leaveDetailEntity> ldeList = takeLeaveDetailService.Instance.getLeaveData(U_Num, EX_Status, EX_Type, StartDate, EndDate,MenuNo,keyWord);

        log.endWrite("'ldeList':"+ldeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ldeList);
    }
    /// <summary>
    /// 取得補休資料
    /// </summary>
    /// <param name="U_Num"></param>
    /// <returns></returns>
    public string getCompensatoryLeaveData(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num':"+U_Num, className, methodName);

        List<compensatoryLeaveDetailEntity> cldeList = takeLeaveDetailService.Instance.getCompensatoryLeaveData(U_Num);

        log.endWrite("'cldeList':"+cldeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cldeList);
    }
    /// <summary>
    /// 取得補休及年假及病假資料
    /// </summary>
    /// <param name="U_Num"></param>
    /// <returns></returns>
    public string getAnnualLeaveAndCompensatoryLeaveAndSickLeaveData(string U_Num,string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num':"+U_Num, className, methodName);

        annualLeaveAndCompensatoryLeaveAndSickLeaveDataEntity alaclde = takeLeaveDetailService.Instance.getAnnualLeaveAndCompensatoryLeaveAndSickLeaveData(U_Num,U_MDEP);

        log.endWrite("'alaclde':"+alaclde.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(alaclde);
    }

    /// <summary>
    /// 取得代理人資料
    /// </summary>
    /// <param name="U_Num"></param>
    /// <returns></returns>
    public string getAgentAndLeaderData(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num':"+U_Num, className, methodName);

        agentAndLeaderDataEntity aalde = takeLeaveDetailService.Instance.getAgentAndLeaderData(U_Num);

        log.endWrite("'aalde':"+aalde.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(aalde);
    }

    /// <summary>
    /// 新增假單資料
    /// </summary>
    /// <param name="lde"></param>
    /// <returns></returns>
    public string addLeaveData(leaveDetailEntity lde)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'lde':"+lde.ToString(), className, methodName);

        string backStr = takeLeaveDetailService.Instance.addLeaveData(lde);

        log.endWrite("'backStr':"+backStr, className, methodName);
        return backStr;
    }
    
    /// <summary>
    /// 刪除請假資料
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public string deleteLeaveData(string id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'id':"+id, className, methodName);

        string backStr = takeLeaveDetailService.Instance.deleteLeaveData(id);

        log.endWrite("'backStr':"+backStr, className, methodName);
        return backStr;
    }
    
    /// <summary>
    /// 取得假單明細資料
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public string getLeaveDetail(string id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'id':"+id, className, methodName);

        leaveDetailEntity lde = takeLeaveDetailService.Instance.getLeaveDetail(id);

        log.endWrite("'lde':"+lde.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(lde);
    }
    /// <summary>
    /// 假單核准或退回
    /// </summary>
    /// <param name="EX_id"></param>
    /// <param name="statusName"></param>
    /// <param name="status"></param>
    /// <returns></returns>
    public string leaveApproveTF(string EX_id,string statusName,string status,string MS_ID,string nextSigner,string U_Num,string add_ip)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'EX_id':"+EX_id+"'statusName':"+statusName+"'status':"+status+"'MS_ID':"+MS_ID+"'nextSigner':"+nextSigner+"'U_Num':"+U_Num+"'add_ip':"+add_ip, className, methodName);

        string backStr = takeLeaveDetailService.Instance.leaveApproveTF(EX_id,statusName,status,MS_ID,nextSigner,U_Num,add_ip);

        log.endWrite("'backStr':"+backStr, className, methodName);
        return backStr;
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}