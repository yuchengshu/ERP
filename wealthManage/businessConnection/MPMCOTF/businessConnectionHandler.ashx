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
        string M_ID = context.Request["M_ID"];
        string f_id = context.Request["f_id"];
        //action:signStatus按下簽核紐

        switch (action)
        {
            //取得暫停/恢復欄位(日期)
            case "getDetail_S_Date":
                context.Response.Write(getDetail_S_Date(f_id));
                break;
            //取得暫停/恢復欄位(案件:名稱)
            case "getDetail_S_Name":
                context.Response.Write(getDetail_S_Name(f_id));
                break;
            //取得暫停/恢復欄位(案件:ID)
            case "getDetail_S_ID":
                context.Response.Write(getDetail_S_ID(f_id));
                break;
            //取得暫停/恢復欄位(狀況)
            case "getDetail_S_tag":
                context.Response.Write(getDetail_S_tag(f_id));
                break;
            //取得業績分類欄位-月份
            case "getCmonth":
                context.Response.Write(getCmonth(f_id));
                break;
            //取得業績分類欄位-其他
            case "getOther":
                context.Response.Write(getOther(f_id));
                break;
            //取得業績分類欄位-歸屬
            case "getAttachName":
                context.Response.Write(getAttachName(f_id));
                break;
            //取得傳真稿
            case "getFAX":
                context.Response.Write(getFAX(f_id));
                break;
            //取得聯絡單種類[更改責任助理]中責任助理中的[原助理](OLD_MC_NAME)
            case "getOLD_MC_NAME":
                context.Response.Write(getOLD_MC_NAME(M_ID));
                break;
            // //取得聯絡單種類[更改責任助理]中責任助理中的[更改為](NEW_MC_NAME)
            case "getU_Agent_Name":
                context.Response.Write(getU_Agent_Name(f_id));
                break;
            //案件修改明細
            case "getBusinessConnectionDataEditRecord":
                context.Response.Write(getBusinessConnectionDataEditRecord(M_ID));
                break;
            case "getBusinessConnectionDetail":
                context.Response.Write(getBusinessConnectionDetail(f_id));
                break;
            //取得業務聯絡單明細
            //case "getBusinessConnectionDetail_MID":
            //    //M_ID = context.Request["M_ID"];
            //    string MID = context.Request["MID"];

            //    //context.Response.Write(getBusinessConnectionDetail(M_ID))
            //    context.Response.Write(getBusinessConnectionDetail_MID(MID));
            //    break;
            //取得業務聯絡單列表
            //加入觀看條件
            case "getBusinessConnectionList":
                searchBusinessConnectionParamEntity sbcpe = new searchBusinessConnectionParamEntity();
                sbcpe.U_MDEP = context.Request["U_MDEP"];
                sbcpe.U_Num = context.Request["U_Num"];
                sbcpe.CF_ITem = context.Request["CF_ITem"];//業務聯絡單種類
                sbcpe.F_Status = context.Request["F_Status"];//聯絡單狀態
                sbcpe.keyWord = context.Request["keyWord"];//關鍵字
                context.Response.Write(getBusinessConnectionList(sbcpe));
                break;
            //取得業務聯絡單詳細資料

            case "getCustomerDataEditRecord":
                M_ID = context.Request["M_ID"];
                context.Response.Write(getCustomerDataEditRecord(M_ID));
                break;
            //進行簽核動作
            //var data = "f_id=" + f_id + "&signerStatusType=" + signerStatusType + "&status=" + status +
            //"&psType=" + psType + "&ps=" + ps + "&signerType=" + signerType + "&signerNameType=" + signerNameType +
            //"&U_Num=" + U_Num_M + "&U_Name=" + U_Name_M + "&timeType=" + timeType + "&add_ip=" + add_ip +
            //"&M_Name=" + M_Name + "&MS_Receiver=" + add_User_G + "&type=" + type+ "&action=signStatus";

            //進行簽核動作
            //20230329新增簽核後要進行的動作!!!!!!!!!!
            //20230712新增簽核後要進行的動作!!!!!!!!!!
            case "signStatus":
                signStatusEntity sse = new signStatusEntity();
                sse.type = context.Request["CaseType"];//聯絡單種類(簽核過要執行的動作)
                sse.f_id = context.Request["f_id"];//單號
                sse.f_IN = context.Request["f_IN"];//入會方式
                sse.T_Type = context.Request["T_Type"];//入會方式(一般件/會場件/特殊件)
                sse.signerStatusType = context.Request["signerStatusType"];//角色:簽核單位主管or行政人員or行政主管
                sse.status = context.Request["status"];//核可狀態(2:拒絕 1:核可)
                sse.psType = context.Request["psType"];
                sse.ps = context.Request["ps"];
                sse.signerType = context.Request["signerType"];//簽核角色
                sse.signerNameType = context.Request["signerNameType"];
                sse.U_Num = context.Request["U_Num"];
                sse.U_Name = context.Request["U_Name"];
                sse.timeType = context.Request["timeType"];
                sse.add_ip = context.Request["add_ip"];
                sse.M_Name = context.Request["M_Name"];
                sse.add_User = context.Request["Add_userName"];//提案者姓名
                sse.MENU_no = context.Request["MENU_no"];
                sse.T_Type = context.Request["T_Type"];//入會方式(一般件/會場件/特殊件)
                sse.T_ID = context.Request["T_ID"];
                if (sse.signerType == "U_Leader")
                {
                    sse.ps = context.Request["L_ps"];
                }
                else if (sse.signerType == "EX")
                {
                    sse.ps = context.Request["ex_ps"];
                }
                else if (sse.signerType == "EXLeader")
                {
                    sse.ps = context.Request["PS"];
                }
                context.Response.Write(signStatus(sse));
                break;
        };



    }



    //case "getDetail_S_Date":
    //        context.Response.Write(getDetail_S_Date(f_id));
    //        break;
    //    //取得暫停/恢復欄位(案件:名稱)
    //    case "getDetail_S_Name":
    //        context.Response.Write(getDetail_S_Name(f_id));
    //        break;
    //    //取得暫停/恢復欄位(案件:ID)
    //    case "getDetail_S_ID":
    //        context.Response.Write(getDetail_S_ID(f_id));
    //        break;
    //    //取得暫停/恢復欄位(狀況)
    //    case "getDetail_S_tag":
    //        context.Response.Write(getDetail_S_tag(f_id));



    public string getDetail_S_Date(string f_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'f_id' : " + f_id, className, methodName);

        string S_Date = businessConnectionDetailService.Instance.getDetail_S_Date(f_id);//<==========

        log.endWrite("'S_Date' : " + S_Date, className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(S_Date);

    }
    public string getDetail_S_Name(string f_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'f_id' : " + f_id, className, methodName);

        string S_Name = businessConnectionDetailService.Instance.getDetail_S_Name(f_id);//<==========

        log.endWrite("'S_Name' : " + S_Name, className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(S_Name);
    }
    public string getDetail_S_ID(string f_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'f_id' : " + f_id, className, methodName);

        string S_ID = businessConnectionDetailService.Instance.getDetail_S_ID(f_id);//<==========

        log.endWrite("'S_ID' : " + S_ID, className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(S_ID);
    }
    public string getDetail_S_tag(string f_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'f_id' : " + f_id, className, methodName);

        string S_tag = businessConnectionDetailService.Instance.getDetail_S_tag(f_id);//<==========

        log.endWrite("'S_tag' : " + S_tag, className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(S_tag);
    }


    public string getCmonth(string f_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'f_id' : " + f_id, className, methodName);

        string Cmonth = businessConnectionDetailService.Instance.getCMonth(f_id);//<==========

        log.endWrite("'Cmonth' : " + Cmonth, className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(Cmonth);
    }
    //getSaleDetail
    //取得業績分類欄位明細
    //其他
    public string getOther(string f_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'f_id' : " + f_id, className, methodName);

        string Other = businessConnectionDetailService.Instance.getAttachName(f_id);//<==========

        log.endWrite("'Other' : " + Other, className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(Other);
    }
    //getSaleDetail
    //取得業績分類欄位明細
    //歸屬
    public string getAttachName(string f_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'f_id' : " + f_id, className, methodName);

        string AttachName = businessConnectionDetailService.Instance.getAttachName(f_id);//<==========

        log.endWrite("'AttachName' : " + AttachName, className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(AttachName);
    }
    //月份
    public string getCMonth(string f_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'f_id' : " + f_id, className, methodName);

        string SaleDetail = businessConnectionDetailService.Instance.getCMonth(f_id);//<==========

        log.endWrite("'SaleDetail' : " + SaleDetail, className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(SaleDetail);
    }

    //備註
    public string getPS(string f_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'f_id' : " + f_id, className, methodName);

        string SaleDetail = businessConnectionDetailService.Instance.getPS(f_id);//<==========

        log.endWrite("'SaleDetail' : " + SaleDetail, className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(SaleDetail);
    }

    public string getFAX(string f_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : " + f_id, className, methodName);

        string FAX = businessConnectionDetailService.Instance.getFAX(f_id);//<==========

        log.endWrite("'FAX' : " + FAX, className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(FAX);
    }
    //更改責任助理[更改為]
    //getNEW_MC_NAME
    public string getU_Agent_Name(string F_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'F_ID' : " + F_ID, className, methodName);

        string NEW_MC_NAME = businessConnectionDetailService.Instance.getNEW_MC_NAME(F_ID);//<==========

        log.endWrite("'NEW_MC_NAME' : " + NEW_MC_NAME, className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(NEW_MC_NAME);
    }

    //更改責任助理[原助理]
    public string getOLD_MC_NAME(string F_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'F_ID' : " + F_ID, className, methodName);
        string M_ID = businessConnectionDetailService.Instance.getM_IDFromF_ID(F_ID);
        string OLD_MC_NAME = businessConnectionDetailService.Instance.getOLD_MC_NAME(M_ID);//<==========

        log.endWrite("'OLD_MC_NAME' : " + OLD_MC_NAME, className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(OLD_MC_NAME);
    }
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
    //
    public string getBusinessConnectionDataEditRecord(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : " + M_ID, className, methodName);

        List<MPMCOTFDataEditRecordEntity> DEE = businessConnectionDetailService.Instance.getBusinessConnectionDataEditRecord(M_ID);//<==========

        log.endWrite("'DEE' : " + DEE.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(DEE);
    }
    /// <summary>
    /// 取得業務聯絡單明細
    /// </summary>
    /// <param name="f_id"></param>
    /// <returns></returns>
    public string getBusinessConnectionDetail_MID(string MID)//20230202修改!!!NEW
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MID' : " + MID, className, methodName);

        MPMCOTFDetailEntity bce = businessConnectionDetailService.Instance.getBusinessConnectionDetail_MID(MID);//<==========

        log.endWrite("'bce' : " + bce.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(bce);
    }
    /// <summary>
    /// 取得業務聯絡單明細
    /// </summary>
    /// <param name="f_id"></param>
    /// <returns></returns>
    public string getBusinessConnectionDetail(string f_ID)//20230202修改!!!NEW
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'f_ID' : " + f_ID, className, methodName);

        MPMCOTFDetailEntity bce = businessConnectionDetailService.Instance.getBusinessConnectionDetail(f_ID);//<==========

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

    //進行簽核動作
    //20230626實作
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