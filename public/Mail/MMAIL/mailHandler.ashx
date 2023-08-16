<%@ WebHandler Language="C#" Class="mailHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class mailHandler : IHttpHandler
{

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string MS_ID = context.Request["MS_ID"];
        string mailId = context.Request["mailId"];
        switch (action)
        {
            case "getMailData"://取得電子郵件信件資訊
                string U_Num = context.Request["U_Num"];
                string keyWord = context.Request["keyWord"];
                context.Response.Write(getMailData(U_Num, keyWord));
                break;
            case "deleteMailData":
                mailId = context.Request["mailId"];
                context.Response.Write(deleteMailData(mailId));
                break;
            //進行郵件新增動作
            case "addMailData":
                emailEntity ee = new emailEntity();
                common.getDateTime();
                ee.MS_ID = common.year + common.month + common.day + common.hour + common.minute + common.second + "_" + common.getRandom1();
                ee.MS_Sender = context.Request["MS_Sender"];
                ee.MS_Receiver = context.Request["MS_Receiver"];
                ee.MS_Title = context.Request["MS_Title"];
                ee.MS_Text = context.Request["MS_Text"];
                ee.add_User = context.Request["add_User"];
                ee.add_ip = context.Request["add_ip"];

                context.Response.Write(addMailData(ee));
                break;
            case "getUpLoadData":
                MS_ID = context.Request["MS_ID"];
                context.Response.Write(getUpLoadData(MS_ID));
                break;
            //取得信件附件1
            case "getUpLoadData1":
                MS_ID = context.Request["MS_ID"];
                context.Response.Write(getUpLoadData1(MS_ID));
                break;
            //取得信件附件2
            case "getUpLoadData2":
                MS_ID = context.Request["MS_ID"];
                context.Response.Write(getUpLoadData2(MS_ID));
                break;
            //取得信件附件3
            case "getUpLoadData3":
                MS_ID = context.Request["MS_ID"];
                context.Response.Write(getUpLoadData3(MS_ID));
                break;
            case "updateReadtag":
                MS_ID = context.Request["MS_ID"];
                context.Response.Write(updateReadtag(MS_ID));
                break;
            case "getMailDetail":
                MS_ID = context.Request["MS_ID"];
                context.Response.Write(getMailDetail(MS_ID));
                break;
        }

    }

    public string getMailData(string U_Num, string keyWord)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num;':" + U_Num + "'keyWord;':" + keyWord, className, methodName);

        List<emailEntity> eeList = mailService.Instance.getMailData(U_Num, keyWord);//<==========

        log.endWrite("'eeList' :" + eeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(eeList);
    }

    public string deleteMailData(string mailId)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'mailId':" + mailId, className, methodName);

        String backStr = mailService.Instance.deleteMailData(mailId);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
    /// <summary>
    /// 新增郵件細項資料
    /// </summary>
    public string addMailData(emailEntity ee)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + ee.MS_ID + "'MS_Sender':" + ee.MS_Sender + "'MS_Receiver':" + ee.MS_Receiver + "'MS_Title':" + ee.MS_Title + "'MS_Text':" + ee.MS_Text + "'add_User':" + ee.add_User + "'add_ip':" + ee.add_ip, className, methodName);

        String backStr = mailService.Instance.addMailData(ee);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
    public string getUpLoadData(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':"+MS_ID, className, methodName);

        uploadFileEntity ufe = mailService.Instance.getUpLoadData(MS_ID);//<==========

        log.endWrite("'ufe' :"+ufe.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ufe);
    }
    //取得信件附件1getUpLoadData1
    public string getUpLoadData1(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        emailEntity ufe = mailService.Instance.getUpLoadData1(MS_ID);//<==========

        log.endWrite("'ufe' :" + ufe.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ufe);
    }
    //取得信件附件2
    public string getUpLoadData2(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        emailEntity ufe = mailService.Instance.getUpLoadData2(MS_ID);//<==========

        log.endWrite("'ufe' :" + ufe.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ufe);
    }
    //取得信件附件3
    public string getUpLoadData3(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        emailEntity ufe = mailService.Instance.getUpLoadData3(MS_ID);//<==========

        log.endWrite("'ufe' :" + ufe.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ufe);
    }


    public string updateReadtag(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        string backStr = mailService.Instance.updateReadtag(MS_ID);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public string getMailDetail(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        emailEntity ee = mailService.Instance.getMailDetail(MS_ID);//<==========

        log.endWrite("'ee' :" + ee.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ee);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}