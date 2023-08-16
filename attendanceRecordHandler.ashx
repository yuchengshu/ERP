<%@ WebHandler Language="C#" Class="attendanceRecordHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class attendanceRecordHandler : IHttpHandler {
    
    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string U_Num = string.Empty;
        switch (action) {
            case "getAttendanceRecord":
                string firstDay = context.Request["firstDay"];
                string lastDay = context.Request["lastDay"];
                U_Num = context.Request["U_Num"];
                string U_MDEP = context.Request["U_MDEP"];
                context.Response.Write(getAttendanceRecord(firstDay,lastDay,U_Num,U_MDEP));
                break;
             case "offWork":
                U_Num = context.Request["U_Num"];
                context.Response.Write(offWork(U_Num));
                break;

        };
    }
    public string getAttendanceRecord(string firstDay,string lastDay,string U_Num,string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'firstDay' : "+firstDay+"'lastDay' : "+lastDay+"'U_Num' : "+U_Num+"'U_MDEP' : "+U_MDEP, className, methodName);

        List<attendanceRecordEntity> areList = AttendanceRecordService.Instance.getAttendanceRecord(firstDay,lastDay,U_Num,U_MDEP);//<==========

        log.endWrite("'areList' : "+areList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(areList);
    }
    public string offWork(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : "+U_Num, className, methodName);

        string backStr = AttendanceRecordService.Instance.offWork(U_Num);//<==========

        log.endWrite("'backStr' : "+backStr, className, methodName);
        return backStr;
    }

 
    public bool IsReusable {
        get {
            return false;
        }
    }

}