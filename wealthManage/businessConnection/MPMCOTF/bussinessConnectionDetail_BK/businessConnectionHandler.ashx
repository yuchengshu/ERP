<%@ WebHandler Language="C#" Class="businessConnectionHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class businessConnectionHandler : IHttpHandler
{
    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string f_id = string.Empty;
        switch (action)
        {
            case "getBusinessConnectionDetail":
                f_id = context.Request["f_id"];
                context.Response.Write(getBusinessConnectionDetail(f_id));
                break;
            //取得業務聯絡單列表
            case "getBusinessConnectionList":
                searchBusinessConnectionParamEntity sbcpe = new searchBusinessConnectionParamEntity();
                sbcpe.U_MDEP = context.Request["U_MDEP"];
                sbcpe.U_Num = context.Request["U_Num"];
                sbcpe.CF_ITem = context.Request["CF_ITem"];
                sbcpe.F_Status = context.Request["F_Status"];
                sbcpe.keyWord = context.Request["keyWord"];
                context.Response.Write(getBusinessConnectionList(sbcpe));
                break;
            //取得業務聯絡單詳細資料

            case "getCustomerDataEditRecord":
                string M_ID = context.Request["M_ID"];
                context.Response.Write(getCustomerDataEditRecord(M_ID));
                break;
            case "signStatus":
                signStatusEntity sse = new signStatusEntity();
                sse.f_id = context.Request["f_id"];
                sse.signerStatusType = context.Request["signerStatusType"];
                sse.status = context.Request["status"];
                sse.psType = context.Request["psType"];
                sse.ps = context.Request["ps"];
                sse.signerType = context.Request["signerType"];
                sse.signerNameType = context.Request["signerNameType"];
                sse.U_Num = context.Request["U_Num"];
                sse.U_Name = context.Request["U_Name"];
                sse.timeType = context.Request["timeType"];
                sse.add_ip = context.Request["add_ip"];
                sse.M_Name = context.Request["M_Name"];
                sse.MS_Receiver = context.Request["MS_Receiver"];
                sse.MENU_no = context.Request["MENU_no"];
                context.Response.Write(signStatus(sse));
                break;
        };



    }
    //20230130work
    /// <summary>
    /// 取得業務聯絡單列表
    /// </summary>
    /// <param name="sbcpe"></param>
    /// <returns></returns>
    public string getBusinessConnectionList(searchBusinessConnectionParamEntity sbcpe)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'sbcpe' : " + sbcpe.ToString(), className, methodName);

        StringBuilder html = new StringBuilder();
        //20230130進度
        //取得業務聯絡單列表
        List<businessConnectionDataEntity> bcdeList = businessConnectionService.Instance.getBusinessConnectionList(sbcpe);//<==========

        log.endWrite(bcdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(bcdeList);
    }

    /// <summary>
    /// 取得業務聯絡單明細
    /// </summary>
    /// <param name="f_id"></param>
    /// <returns></returns>
    public string getBusinessConnectionDetail(string f_id)//20230202修改!!!NEW
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'f_id' : " + f_id, className, methodName);

        MPMCOTFDetailEntity bce = businessConnectionDetailService.Instance.getBusinessConnectionDetail(f_id);//<==========

        log.endWrite("'bce' : " + bce.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(bce);
    }

    public string getCustomerDataEditRecord(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : " + M_ID, className, methodName);

        List<editCustomerDataRecord> ecdrList = businessConnectionDetailService.Instance.getCustomerDataEditRecord(M_ID);//<==========

        log.endWrite("'ecdrList' : " + ecdrList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ecdrList);
    }


    public string signStatus(signStatusEntity sse)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'f_id' : " + sse.f_id + "'signerStatusType' : " + sse.signerStatusType + "'status' : " + sse.status + "'psType' : " + sse.psType + "'ps' : " + sse.ps + "'signerType' : " + sse.signerType + "'signerNameType' : " + sse.signerNameType + "'U_Num' : " + sse.U_Num + "'U_Name' : " + sse.U_Name + "'timeType' : " + sse.timeType, className, methodName);

        string backStr = businessConnectionDetailService.Instance.signStatus(sse);//<==========

        log.endWrite("'backStr' : " + backStr, className, methodName);
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