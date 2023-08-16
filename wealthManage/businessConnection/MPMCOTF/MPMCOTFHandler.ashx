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
        //            var data = "CF_ITem=" + CF_ITem + "&F_Status=" + F_Status + "&keyWord=" + keyWord + "&U_MDEP=" + U_MDEP_M + "&U_Num=" + U_Num_M + "&action=getBusinessConnectionList";

        switch (action)
        {
            case "deleteMPMCOTFData":
                f_id = context.Request["f_id"];
                context.Response.Write(deleteMPMCOTFData(f_id));
                break;

                break;
            case "getBusinessConnectionList":
                searchBusinessConnectionParamEntity sbcpe = new searchBusinessConnectionParamEntity();
                sbcpe.U_MDEP = context.Request["U_MDEP"];
                sbcpe.U_Num = context.Request["U_Num"];
                sbcpe.CF_ITem = context.Request["CF_ITem"];//聯絡單種類
                sbcpe.F_Status = context.Request["F_Status"];//處理狀態
                sbcpe.keyWord = context.Request["keyWord"];//關鍵字
                context.Response.Write(getBusinessConnectionList(sbcpe));
                break;
            case "getBusinessConnectionDetail":
                f_id = context.Request["f_id"];
                context.Response.Write(getBusinessConnectionDetail(f_id));
                break;
            case "getCustomerDataEditRecord":
                string M_ID = context.Request["M_ID"];
                context.Response.Write(getCustomerDataEditRecord(M_ID));
                break;
            //新增業務聯絡單
            case "addBusinessConnection":
                businessConnectionEntity bce = new businessConnectionEntity();
                var test = context.Request.Params;
                var PT_Item = context.Request["PT_Item"].ToString();//付款類型
                if (PT_Item == "1")
                {
                    bce.M_ID = context.Request["M_ID"];
                    bce.CF_Item = context.Request["CF_Item"];
                    bce.CellPhone = context.Request["CellPhone"];
                    //B_Paymoney
                    //bce.B_Paymoney = context.Request["B_Paymoney"];//退費金額
                    bce.Mess = context.Request["Mess"];
                    bce.Media= context.Request["Media"];
                    bce.Fax = context.Request["Fax"];
                    bce.Attach_User = context.Request["Attach_User"];
                    bce.Attach_Name = context.Request["Attach_Name"];
                    bce.Attach_Com = context.Request["Attach_Com"];
                    bce.CMonth = context.Request["CMonth"];
                    bce.Other = context.Request["Other"];
                    bce.C_tag = context.Request["C_tag"];
                    bce.U_Agent = context.Request["U_Agent"];
                    bce.U_Agent_Name = context.Request["U_Agent_Name"];
                    bce.U_Agent_Com = context.Request["U_Agent_Com"];
                    bce.U_Leader = context.Request["U_Leader"];
                    bce.U_LeaderCom = context.Request["U_LeaderCom"];
                    bce.U_LeaderName = context.Request["U_LeaderName"];
                    bce.Obj = context.Request["Obj"];
                    bce.F_Status = context.Request["F_Status"];
                    bce.PS = context.Request["PS"];
                    bce.add_user = context.Request["add_user"];
                    bce.add_com = context.Request["add_com"];
                    bce.add_ip = context.Request["add_ip"];
                    bce.MP_ID = context.Request["MP_ID"];
                    bce.MP_Item = context.Request["MP_Item"];
                    bce.Results_Item = context.Request["Results_Item"];
                    bce.Paymoney = context.Request["Paymoney"];
                    if (!String.IsNullOrEmpty(context.Request["Paymoney1"].ToString()))
                    {
                        bce.Paymoney1 = context.Request["Paymoney1"];
                    }
                    // bce.Paymoney2 = context.Request["Paymoney2"];
                    bce.T_PType = context.Request["T_PType"];
                    // bce.T_PType1 = context.Request["T_PType1"];
                    // bce.T_PType2 = context.Request["T_PType2"];
                    bce.T_Type = context.Request["T_Type"];
                    bce.PT_Item = context.Request["PT_Item"];
                    bce.V_ID = context.Request["V_ID"];
                    bce.V_Name = context.Request["V_Name"];
                    bce.Special1_user = context.Request["Special1_user"];
                    bce.Special1_userName = context.Request["Special1_userName"];
                    bce.Special1_usercom = context.Request["Special1_usercom"];
                    bce.Special2_user = context.Request["Special2_user"];
                    bce.Special2_userName = context.Request["Special2_userName"];
                    bce.Special2_usercom = context.Request["Special2_usercom"];
                    bce.Special3_user = context.Request["Special3_user"];
                    bce.Special3_userName = context.Request["Special3_userName"];
                    bce.Special3_usercom = context.Request["Special3_usercom"];
                    bce.T_accountmoney1 = context.Request["T_accountmoney1"];
                    bce.T_accountmoney2 = context.Request["T_accountmoney2"];
                    bce.T_accountmoney3 = context.Request["T_accountmoney3"];
                    bce.begindate_Date = context.Request["begindate_Date"];
                    bce.enddate_Date = context.Request["enddate_Date"];
                    bce.Media = context.Request["Media"];
                    bce.ATM = context.Request["ATM"];
                    bce.INV_Open_Item = context.Request["INV_Open_Item"];
                    bce.T_Ivo = context.Request["T_Ivo"];
                    bce.INV_ITEM = context.Request["INV_ITEM"];
                    bce.COMNAME = context.Request["COMNAME"];
                    bce.INV_ITEM_UnifyNum = context.Request["INV_ITEM_UnifyNum"];
                    bce.CCard_4Num = context.Request["CCard_4Num"];
                    bce.ca_id = context.Request["ca_id"];
                    bce.S_tag = context.Request["S_tag"];
                    bce.S_ID = context.Request["S_ID"];
                    bce.S_Name = context.Request["S_Name"];
                    bce.B_ID = context.Request["B_ID"];
                    bce.B_Name = context.Request["B_Name"];
                }
                if (PT_Item == "2")
                {
                    //data = "M_ID=" + M_ID_G + "&CF_Item=" + CF_Item + "&CellPhone=" + CellPhone + "&Mess=" + Mess + "&U_Leader=" + U_Leader + "&U_LeaderName=" + U_LeaderName + "&Obj=" + Obj + "&F_Status=1&PS=" + PS + "&add_user=" + U_Num_M + "&add_com=" + ComID_G + "&add_ip=" + IP_G + "&U_LeaderCom=" + U_LeaderCom + "&action=addBusinessConnection";
                    bce.M_ID = context.Request["M_ID"];
                    bce.CellPhone = context.Request["CellPhone"];
                    bce.Mess = context.Request["Mess"];
                    bce.U_Agent_Com = context.Request["U_Agent_Com"];
                    bce.U_Leader = context.Request["U_Leader"];
                    bce.U_LeaderCom = context.Request["U_LeaderCom"];
                    bce.U_LeaderName = context.Request["U_LeaderName"];
                    bce.Obj = context.Request["Obj"];
                    bce.F_Status = context.Request["F_Status"];
                    bce.PS = context.Request["PS"];
                    bce.add_user = context.Request["add_user"];
                    bce.add_com = context.Request["add_com"];
                    bce.add_ip = context.Request["add_ip"];

                }
                bce.Paymoney = context.Request["Paymoney"];
                string SSDate = context.Request["SSDate"];
                if (!common.isEmpty(SSDate))
                {
                    string[] bd = SSDate.Split('/');
                    bce.SSDate = bd[0] + "-" + bd[1] + "-" + bd[2] + " " + "00:00:00.000";
                }
                else
                {
                    bce.SSDate = null;
                }
                bce.B_Paymoney = context.Request["B_Paymoney"];
                bce.B_ID = context.Request["B_ID"];
                bce.B_Name = context.Request["B_Name"];

                bce.T_ID = context.Request["T_ID"];
                bce.T_Name = context.Request["T_Name"];
                bce.D_MP = context.Request["D_MP"];
                bce.D_Item = context.Request["D_Item"];
                bce.D_Type = context.Request["D_Type"];
                bce.D_Paymoney = context.Request["D_Paymoney"];
                bce.D_tag = context.Request["D_tag"];
                string DSdate = context.Request["DSdate"];
                if (!common.isEmpty(DSdate))
                {
                    string[] bd = DSdate.Split('/');
                    bce.DSdate = bd[0] + "-" + bd[1] + "-" + bd[2] + " " + "00:00:00.000";
                }
                else
                {
                    bce.DSdate = null;
                }

                string DEdate = context.Request["DEdate"];
                if (!common.isEmpty(DEdate))
                {
                    string[] bd = DEdate.Split('/');
                    bce.DEdate = bd[0] + "-" + bd[1] + "-" + bd[2] + " " + "00:00:00.000";
                }
                else
                {
                    bce.DEdate = null;
                }
                context.Response.Write(addBusinessConnection(bce));
                break;
            //case "signStatus":
            //    signStatusEntity sse = new signStatusEntity();
            //    sse.type = context.Request["T_Type"];//簽核過要執行的動作(聯絡單種類)
            //    sse.f_id = context.Request["f_id"];//單號
            //    sse.signerStatusType = context.Request["signerStatusType"];//角色:簽核單位主管or行政人員or行政主管
            //    sse.status = context.Request["status"];//核可狀態(2:拒絕 1:核可)
            //    sse.psType = context.Request["psType"];
            //    sse.ps = context.Request["ps"];
            //    sse.signerType = context.Request["signerType"];//核可層級
            //    sse.signerNameType = context.Request["signerNameType"];
            //    sse.U_Num = context.Request["U_Num"];
            //    sse.U_Name = context.Request["U_Name"];
            //    sse.timeType = context.Request["timeType"];
            //    sse.add_ip = context.Request["add_ip"];
            //    sse.M_Name = context.Request["M_Name"];
            //    sse.add_User = context.Request["Add_userName"];//提案者姓名
            //    sse.MENU_no = context.Request["MENU_no"];
            //    sse.T_Type = context.Request["T_Type"];//入會方式

            //    context.Response.Write(signStatus(sse));
            //    break;        
            //20230630
            //進行核准動作    
            case "signStatus":
                signStatusEntity sse = new signStatusEntity();
                sse.f_id = context.Request["f_id"];
                sse.signerStatusType = context.Request["signerStatusType"];
                sse.timeType = context.Request["timeType"];
                sse.status = context.Request["status"];
                sse.psType = context.Request["psType"];
                sse.ps = context.Request["ps"];
                sse.signerType = context.Request["signerType"];//簽核角色
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

    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";


    public string deleteMPMCOTFData(string f_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("f_id=" + f_id, className, methodName);

        string commandText = "UPDATE MCOTF SET del_tag = '1' WHERE f_id = '{0}'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, f_id));
        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<==========

        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }
    /// <summary>
    /// 新增業務聯絡單
    /// </summary>
    /// <param name="bce"></param>
    /// <returns></returns>
    public string addBusinessConnection(businessConnectionEntity bce)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'bce' : " + bce.ToString(), className, methodName);

        string backString = customerDetailService.Instance.addBusinessConnection(bce);//<==========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
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
    public string getBusinessConnectionDetail(string f_id)
    {
        //20230528進度!!!

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
    //進行簽核通過的動作!!!!!!!!!!!!!(20230525WORK!!!!!!!!!)
    //進行簽核動作    
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