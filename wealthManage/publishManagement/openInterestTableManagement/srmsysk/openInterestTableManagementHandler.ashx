<%@ WebHandler Language="C#" Class="openInterestTableManagementHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;
using System.IO;
using System.Xml;

public class openInterestTableManagementHandler : IHttpHandler {

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string MF_ID = string.Empty;
        switch (action)
        {
            case"getOItable":
                searchOItableParamEntity soitp = new searchOItableParamEntity();
                soitp.MP = context.Request["MP"];
                soitp.StartDate = common.datepickerStrToDatetimeStr(context.Request["StartDate"]);
                soitp.EndDate = common.datepickerStrToDatetimeStr(context.Request["EndDate"]);
                soitp.U_MDEP = context.Request["U_MDEP"];
                soitp.U_POSITION = context.Request["U_POSITION"];
                soitp.ComID = context.Request["ComID"];
                soitp.U_Num = context.Request["U_Num"];
                context.Response.Write(getOItable(soitp));
                break;
            case"addOItable":
                common.getDateTime();
                MF_ID = common.year + common.month + common.day + common.hour + common.minute + common.second + "_" + common.getRandom1();
                string MP = context.Request["MP"];
                string add_user = context.Request["add_user"];
                string add_ip = context.Request["add_ip"];
                context.Response.Write(addOItable(MF_ID,MP,add_user,add_ip));
                break;
            case"deleteMSYSKdata":
                MF_ID = context.Request["MF_ID"];
                context.Response.Write(deleteMSYSKdata(MF_ID));
                break;
            case"deleteUpload_FileData":
                string File_num = context.Request["File_num"];
                context.Response.Write(deleteUpload_FileData(File_num));
                break;



        }
    }

    public string getOItable(searchOItableParamEntity soitp)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'soitp' :"+soitp.ToString(), className, methodName);

        List<uploadFileEntity> ufeList = openInterestTableManagementService.Instance.getOItable(soitp);//<==========

        log.endWrite("'ufeList' :"+ufeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ufeList);
    }

    public string addOItable(string MF_ID,string MP,string add_user,string add_ip)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MF_ID' :"+MF_ID+"'MP' :"+MP+"'add_user' :"+add_user+"'add_ip' :"+add_ip, className, methodName);

        string backStr = openInterestTableManagementService.Instance.addOItable(MF_ID,MP, add_user, add_ip);//<==========
        if (backStr == "成功")
        {
            backStr = MF_ID;
        }
        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;
    }

    public string deleteMSYSKdata(string MF_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MF_ID' :"+MF_ID, className, methodName);

        string backStr = openInterestTableManagementService.Instance.deleteMSYSKdata(MF_ID);//<==========
        
        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;
    }

    public string deleteUpload_FileData(string File_num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'File_num' :"+File_num, className, methodName);

        string backStr = openInterestTableManagementService.Instance.deleteUpload_FileData(File_num);//<==========
        
        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}