<%@ WebHandler Language="C#" Class="idCheckHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class idCheckHandler : IHttpHandler {

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string id = string.Empty;

        switch (action)
        {
            case "getIdCheckList":
                string keyWord = context.Request["keyWord"];
                string StartDate = context.Request["StartDate"];
                string EndDate = context.Request["EndDate"];
                context.Response.Write(getIdCheckList(keyWord,StartDate,EndDate));
                break;

            case"getCustomerDetail":
                string Tel = context.Request["Tel"];
                context.Response.Write(getCustomerDetail(Tel));
                break;
            case"deleteData":
                id = context.Request["id"];
                context.Response.Write(deleteData(id));
                break;
            case"editData":
                id = context.Request["id"];
                string M_id = context.Request["M_ID"];
                string ID_Status = context.Request["ID_Status"];
                context.Response.Write(editData(id,M_id,ID_Status));
                break;
        }
    }

    public string getIdCheckList(string keyWord,string StartDate,string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'keyWord' :"+keyWord+"'StartDate' :"+StartDate+"'EndDate' :"+EndDate, className, methodName);

        List<idCheckEntity> iceList = idCheckService.Instance.getIdCheckList(keyWord,StartDate,EndDate);//<==========

        log.endWrite("'iceList' :"+iceList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(iceList);
    }

    public string getCustomerDetail(string Tel)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Tel' :"+Tel, className, methodName);

        List<customerDataEntity> cdeList = idCheckService.Instance.getCustomerDetail(Tel);//<==========

        log.endWrite("'cdeList' :"+cdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cdeList);
    }

    public string deleteData(string id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'id' :"+id, className, methodName);

        string backStr = idCheckService.Instance.deleteData(id);//<==========

        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;
    }


    public string editData(string id,string M_id,string ID_Status)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'id' :"+id+"'M_id' :"+M_id+"'ID_Status' :"+ID_Status, className, methodName);

        string backStr = idCheckService.Instance.editData(id,M_id,ID_Status);//<==========

        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}