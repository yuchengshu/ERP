<%@ WebHandler Language="C#" Class="dataGiftManagementHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;
using System.IO;
using System.Xml;

public class dataGiftManagementHandler : IHttpHandler {

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        switch (action)
        {
            case"getDataGiftTable":
                string ComID =  context.Request["ComID"];
                string U_MDEP =  context.Request["U_MDEP"];
                context.Response.Write(getDataGiftTable(ComID,U_MDEP));
                break;
            case"editData":
                dataGiftTableEntity dgte = new dataGiftTableEntity();
                dgte.s_id = context.Request["s_id"];
                dgte.M_id = context.Request["M_id"];
                dgte.M_Password = context.Request["M_Password"];
                dgte.MP_Num = context.Request["MP_Num"];
                dgte.ddesc = context.Request["ddesc"];

                dgte.Start_date = common.datepickerStrToDatetimeStr(context.Request["Start_date"])+" 00:00:00.000";
                dgte.End_date =  common.datepickerStrToDatetimeStr(context.Request["End_date"])+" 00:00:00.000";
                dgte.Pay = context.Request["Pay"];
                dgte.Faxno = context.Request["Faxno"];
                dgte.Tel_tag = context.Request["Tel_tag"];
                dgte.Call_tag = context.Request["Call_tag"];
                dgte.Action_tag = context.Request["Action_tag"];
                dgte.Img = context.Request["Img"];
                context.Response.Write(editData(dgte));
                break;
        }
    }

    public string getDataGiftTable(string ComID,string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID' :"+ComID+"'U_MDEP' :"+U_MDEP, className, methodName);

        List<dataGiftTableEntity> dgteList = dataGiftManagementService.Instance.getDataGiftTable(ComID,U_MDEP);//<==========

        log.endWrite("'dgteList' :"+dgteList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(dgteList);
    }

    public string editData(dataGiftTableEntity dgte)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'dgte' :"+dgte.ToString(), className, methodName);

        string backStr = dataGiftManagementService.Instance.editData(dgte);//<==========

        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}