<%@ WebHandler Language="C#" Class="tbdInvoiceWorkHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;
using System.Net;
using System.IO;

public class tbdInvoiceWorkHandler : IHttpHandler {

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string StartDate = string.Empty;
        string EndDate = string.Empty;
        switch (action)
        {
            case"getTbdInvoice":
                if (!common.isEmpty(context.Request["StartDate"]))
                {
                    StartDate = common.datepickerStrToDatetimeStr(context.Request["StartDate"]);
                }
                if (!common.isEmpty(context.Request["EndDate"]))
                {
                    EndDate = common.datepickerStrToDatetimeStr(context.Request["EndDate"]);
                }

                string keyWord = context.Request["keyWord"];
                context.Response.Write(getTbdInvoice(keyWord,StartDate,EndDate));
                break;

            case"getInvoiceDataList":
                string tids = context.Request["tids"];
                context.Response.Write(getInvoiceDataList(tids));
                break;
        }
    }

    public string getTbdInvoice(string keyWord,string StartDate,string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'keyWord' :"+keyWord+"'StartDate' :"+StartDate+"'EndDate' :"+EndDate, className, methodName);

        List<tbdInvoiceEntity> tieList = tbdInvoiceWorkService.Instance.getTbdInvoice(keyWord,StartDate,EndDate);//<==========

        log.endWrite("'tieList' :"+tieList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(tieList);
    }

    public string getInvoiceDataList(string tids)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'tids' :" + tids, className, methodName);

        string result = string.Empty;
        List<SendInvDataEntity> sideList = tbdInvoiceWorkService.Instance.getInvoiceDataList(tids);//<==========
   
        result= postXMLData("https://www.hwa-guan.com.tw/Financial/erpInvoiceCreate", Newtonsoft.Json.JsonConvert.SerializeObject(sideList));


        log.endWrite("'sideList' :"+sideList.ToString(), className, methodName);
        return result;
        //return Newtonsoft.Json.JsonConvert.SerializeObject(sideList);
    }

    private string postXMLData(string destinationUrl, string requestXml)
    {
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(destinationUrl);
        byte[] bytes;
        bytes = System.Text.Encoding.ASCII.GetBytes(requestXml);
        request.ContentType = "application/json";
        request.ContentLength = bytes.Length;
        request.Method = "POST";
        Stream requestStream = request.GetRequestStream();
        requestStream.Write(bytes, 0, bytes.Length);
        requestStream.Close();
        HttpWebResponse response;
        response = (HttpWebResponse)request.GetResponse();
        if (response.StatusCode == HttpStatusCode.OK)
        {
            Stream responseStream = response.GetResponseStream();
            string responseStr = new StreamReader(responseStream).ReadToEnd();
            return responseStr;
        }
        return null;
    }



    public bool IsReusable {
        get {
            return false;
        }
    }

}