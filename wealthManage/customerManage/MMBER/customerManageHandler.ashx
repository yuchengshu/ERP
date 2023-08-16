<%@ WebHandler Language="C#" Class="customerManageHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;
using System.IO;

public class customerManageHandler : IHttpHandler
{
    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public string Value(HttpContext request, string value)
    {
        int count = request.Request.Params.Count;
        var test = request.Request.Params.AllKeys[0];
        string test9 = "";
        int m = 0;
        string requestvaule = "";
        do
        {
            var value2 = request.Request.Params.AllKeys[m];
            if (value2 == value)
            {
                test9 = value2;
                requestvaule = request.Request[value];
                if (requestvaule == "undefined")
                {
                    requestvaule = "";
                    return requestvaule;
                }
                return requestvaule;
            }
            //bce.Paymoney=context.Request["Paymoney"];
            m++;
        } while (m < count);

        return requestvaule;
    }

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        string action = context.Request["action"];
        string M_ID = string.Empty;
        string U_Num = string.Empty;
        string T_ID = string.Empty;
        string M_Num = string.Empty;
        callRecordEntity cre = null;
        tradeRecordEntity tre = null;
        //由customerDetail.aspx呼叫
        switch (action)
        {
            case "getKYC_tag_html_Value":
                M_ID = context.Request["M_ID"];
                context.Response.Write(getKYC_tag_html_Value(M_ID));//取得ID_tag_html_Value
                break;

            case "getCDD_tag_html_Value":
                M_ID = context.Request["M_ID"];
                context.Response.Write(getCDD_tag_html_Value(M_ID));//取得ID_tag_html_Value
                break;
            case "getID_tag_html_Value":
                M_ID = context.Request["M_ID"];
                context.Response.Write(getID_tag_html_Value(M_ID));//取得ID_tag_html_Value
                break;
            case "getRefundData"://取得退費案件
                M_ID = context.Request["M_ID"];
                context.Response.Write(getCaseData(M_ID));//取得折讓資料
                break;
            case "getOriDiscountData"://原案件
                M_ID = context.Request["M_ID"];
                context.Response.Write(getCaseData(M_ID));//取得折讓資料
                break;
            case "getDiscountData"://取得折讓資料
                M_ID = context.Request["M_ID"];
                context.Response.Write(getCaseData(M_ID));
                break;
            case "getCaseData"://取得選擇暫停/恢復資料[案件資料]
                M_ID = context.Request["M_ID"];
                context.Response.Write(getCaseData(M_ID));
                break;
            //20230412進度!!!!!!
            //data = "M_ID=" + M_ID_G + "&CF_Item=" + CF_Item + "&T_ID=" + T_ID + "&T_Name=" + T_Name + "&D_MP=" + D_MP + "&D_Item=" + D_Item + "&D_Type=" + D_Type + "&D_Paymoney=" + D_Paymoney + "&D_tag=" + D_tag + "&DSdate=" + DSdate + "&DEdate=" + DEdate +
            //"&U_Leader=" + U_Leader + "&U_LeaderName=" + U_LeaderName + "&U_LeaderCom=" + U_LeaderCom + "&Obj=" + Obj + "&F_Status=1&PS=" + PS + "&add_user=" + U_Num_M + "&add_com=" + ComID_G + "&add_ip=" + IP_G + "&action=addBusinessConnection";
            //
            //   data = "M_ID=" + M_ID_G + "&CF_Item=" + CF_Item + "&T_ID=" + T_ID + "&T_Name=" + T_Name + "&D_MP=" + D_MP + "&D_Item=" + D_Item + "&D_Type=" + D_Type + "&D_Paymoney=" + D_Paymoney + "&D_tag=" + D_tag + "&DSdate=" + DSdate + "&DEdate=" + DEdate + "&U_Leader=" + U_Leader + "&U_LeaderName=" + U_LeaderName + "&U_LeaderCom=" + U_LeaderCom + "&Obj=" + Obj + "&F_Status=1&PS=" + PS + "&add_user=" + U_Num_M + "&add_com=" + ComID_G + "&add_ip=" + IP_G + "&action=addBusinessConnection";
            //20230726work!!!!!!!!!!!!!!
            case "addBusinessConnection"://新增業務聯絡單
                businessConnectionEntity bce = new businessConnectionEntity();
                //依照不同聯絡單種類()進行不同動作
                int count = context.Request.Params.Count;
                var test = context.Request.Params.AllKeys[0];
                int m = 0;
                //do
                //{
                //    var value = context.Request.Params.AllKeys[m];
                //    if (value == "Paymoney")
                //    {
                //        bce.Paymoney = context.Request[value];
                //    }
                //    //bce.Paymoney=context.Request["Paymoney"];
                //    m++;
                //} while (m<count);
                var value = Value(context, "M_ID");
                //bce.PT_Item = context.Request.Params.Keys["PT_Item"];// 付款類型(入賬資訊)[單筆]or[多筆]
                bce.PT_Item = Value(context, "PT_Item");
                //    bce.PT_Item = context.Request["PT_Item"];
                //if(bce.PT_Item.ToString()=="undefined")
                //{
                //    bce.PT_Item = "";
                //}

                //bce.CF_Item = context.Request["CF_Item"];//取得聯落單種類
                bce.CF_Item = Value(context, "CF_Item");
                if (bce.CF_Item.ToString() == "0001")//入會
                {
                    if (bce.PT_Item.ToString() == "1")
                    {
                        bce.Paymoney = Value(context, "Paymoney");// context.Request["Paymoney"];//20230504要修改!!!!!!!!!!
                        bce.PT_Item = Value(context, "PT_Item");//context.Request["PT_Item"];//付款類型(單筆or多筆)
                                                                // "&T_PType=" + T_PType+//付款方式
                    }
                    else if (bce.PT_Item.ToString() == "2")
                    {
                        bce.Paymoney1 = context.Request["Paymoney1"];//付款金額1
                        bce.Paymoney2 = context.Request["Paymoney2"];//付款金額2
                        bce.T_PType1 = context.Request["PT_Item1"];//付款方式1
                        bce.T_PType2 = context.Request["PT_Item2"];//付款方式2
                    }
                    bce.M_ID = context.Request["M_ID"];
                    bce.CF_Item = context.Request["CF_Item"];//聯落單種類
                    bce.T_Type = context.Request["T_Type"];//入會方式
                    bce.MP_ID = context.Request["MP_ID"];
                    bce.MP_Item = context.Request["MP_Item"];
                    bce.Results_Item = context.Request["Results_Item"];
                    bce.ca_id = context.Request["ca_id"];//電子委任契約書編號
                                                         //bce.PT_Item = context.Request["PT_Item"];//付款方式
                                                         //bce.T_PType1= context.Request["PT_Item1"];//付款方式1
                                                         //bce.T_PType2= context.Request["PT_Item2"];//付款方式2
                    bce.CCard_4Num = context.Request["CCard_4Num"];//信用卡末四碼
                    bce.begindate_Date = context.Request["begindate_Date"];//新會期(始)
                    bce.enddate_Date = context.Request["bcenddate_Date"];//新會期(終)
                    bce.T_ID = context.Request["T_ID"];//折讓案件(原案件)編號
                    bce.T_Name = context.Request["T_Name"];//折讓案件(原案件)名稱
                    bce.D_MP = context.Request["D_MP"];//新案件(分析師)
                    bce.D_Item = context.Request["D_Item"];//新案件(服務項目)
                                                           //bce.Paymoney = context.Request["Paymoney"];
                                                           //bce.PT_Item = context.Request["PT_Item"];// 付款類型(入賬資訊)[單筆]or[多筆]
                    bce.begindate_Date = context.Request["begindate_Date"];//新會期(始)
                    bce.enddate_Date = context.Request["bcenddate_Date"];//新會期(終)
                    bce.Mess = context.Request["Mess"];//設訊
                    bce.Mess = context.Request["Mess"];//傳真稿
                    bce.Media = context.Request["Media"];//設鎖碼影影音
                    bce.P_Text = context.Request["P_Text"];//設付費文章
                    bce.P_video = context.Request["P_video"];//設付費影片
                    bce.ATM = context.Request["ATM"];
                    bce.INV_Open_Item = context.Request["INV_Open_Item"];
                    bce.T_Ivo = context.Request["T_Ivo"];
                    bce.INV_ITEM = context.Request["INV_ITEM"];
                    bce.COMNAME = context.Request["COMNAME"];
                    bce.INV_ITEM_UnifyNum = context.Request["INV_ITEM_UnifyNum"];
                    bce.Select_Com = context.Request["U_LeaderCom"];//簽核主管公司
                    bce.Select_Dept = context.Request["U_Leader"];//簽核主管員工編號
                    bce.Select_Employ = context.Request["U_LeaderName"];//簽核主管
                    bce.Obj = context.Request["Obj"];//件別
                    bce.PS = context.Request["PS"];//備註
                    bce.F_Status = context.Request["F_Status"];
                    bce.CellPhone = context.Request["CellPhone"];
                    bce.D_tag = context.Request["D_tag"];//是否補件
                    bce.D_Paymoney = context.Request["D_Paymoney"];//補件金額
                    bce.DSdate = context.Request["DSdate"];//入會時間
                    bce.DEdate = context.Request["DEdate"];//到期日期
                    bce.C_tag = context.Request["C_tag"];
                    bce.add_user = context.Request["add_user"];
                    bce.add_com = context.Request["add_com"];
                    bce.add_ip = context.Request["add_ip"];
                    //簽核主管
                    //"&U_LeaderName" + U_LeaderName +
                    //"&U_LeaderStatus" + U_LeaderStatus +
                    //"&U_LeaderStatusTime" + U_LeaderStatusTime+
                    //"&Com_Channge=" + Com_Channge +
                    //"&Dept_Channge=" + Dept_Channge +
                    //"&Name_Channge=" + Name_Channge +
                    //bce.Results_Item = context.Request["Results_Item"];//業績種類
                    //bce.T_Type = context.Request["T_Type"];//入會方式
                    //bce.T_PType1 = "0";
                    //bce.T_PType2 = "0";
                    //bce.PT_Item = context.Request["PT_Item"];//付款類型
                    //bce.Pay_Type = "0";
                    //bce.CellPhone = context.Request["CellPhone"];//設定手機
                    //bce.Fax= context.Request["Fax"];
                    //bce.Mess = context.Request["Mess"];//設訊
                    //bce.Media = context.Request["Media"];//設鎖碼影音
                    //bce.P_Text = context.Request["P_text"];///!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    //bce.P_video = context.Request["P_video"];//設付費影片
                    //bce.discount = "0";
                    //// bce.MP_ID = context.Request["MP_ID"];//入會方式(分析師)
                    //// bce.MP_Item = context.Request["MP_Item"];//入會方式(會員種類)
                    //bce.T_ID = context.Request["T_ID"];
                    //bce.T_Name = context.Request["T_Name"];
                    //bce.D_MP = context.Request["D_MP"];//分析師
                    //bce.D_Item = context.Request["D_Item"];//補件方式
                    //bce.D_Type = context.Request["D_Type"];//會費
                    //bce.D_Paymoney = context.Request["D_Paymoney"];//補件金額
                    //bce.D_tag = context.Request["D_tag"];//是否取件

                    ////bce.CCard_4Num = context.Request["CCard_4Num"];//信用卡號末四碼
                    //bce.begindate_Date = context.Request["begindate_Date"];//入會時間
                    //bce.enddate_Date = context.Request["bcenddate_Date"];//到期日期


                    //bce.ATM = context.Request["ATM"];//ATM後五碼
                    //bce.INV_Open_Item = context.Request["INV_Open_Item"];//發票開立方式(1:系統 2:手開)
                    //bce.T_Ivo = context.Request["T_Ivo"];//寄發狀況
                    //bce.INV_ITEM = context.Request["INV_ITEM"];//發票種類(1:二聯 2:三聯)
                    //bce.COMNAME = context.Request["COMNAME"];//公司抬頭
                    //bce.INV_ITEM_UnifyNum = context.Request["INV_ITEM_UnifyNum"];//公司統編
                    //bce.Select_Com = context.Request["Select_Com"];//簽核主管-公司別
                    //bce.Select_Dept = context.Request["Select_Dept"];//簽核主管-部門
                    //bce.Select_Employ = context.Request["Select_Employ"];////簽核主管-姓名
                    //bce.Obj = context.Request["Obj"];//件別
                    //bce.PS = context.Request["PS"];//備註
                    //bce.F_Status = context.Request["F_Status"];

                    //bce.D_tag = context.Request["D_tag"];//是否補件

                    //bce.D_Paymoney = context.Request["D_Paymoney"];//補件金額
                    //bce.DSdate = context.Request["DSdate"];//新會期(始)
                    //bce.DEdate = context.Request["DEdate"];///新會期(終)
                    //bce.C_tag = context.Request["C_tag"];//轉換老師(是否折讓)
                    ////bce.Com_Channge = context.Request["Com_Channge"];//更改責任助理-公司別
                    ////bce.Dept_Channge = context.Request["Dept_Channge"];//更改責任助理-部門別
                    ////bce.Name_Channge = context.Request["Name_Channge"];//更改責任助理-姓名
                    //bce.add_user = context.Request["add_user"];
                    //bce.add_com = context.Request["add_com"];
                    //bce.add_ip = context.Request["add_ip"];
                    //
                }
                else if (bce.CF_Item.ToString() == "0002")//設訊
                {
                    //if (bce.PT_Item.ToString() == "1")
                    //{
                    //    bce.Paymoney = context.Request["Paymoney"];//20230504要修改!!!!!!!!!!
                    //    bce.PT_Item = context.Request["PT_Item"];//付款類型(單筆or多筆)
                    //                                             // "&T_PType=" + T_PType+//付款方式
                    //}
                    //else if (bce.PT_Item.ToString() == "2")
                    //{
                    //    bce.Paymoney1 = context.Request["Paymoney1"];//付款金額1
                    //    bce.Paymoney2 = context.Request["Paymoney2"];//付款金額2
                    //    bce.T_PType1 = context.Request["PT_Item1"];//付款方式1
                    //    bce.T_PType2 = context.Request["PT_Item2"];//付款方式2
                    //}
                    bce.M_ID = context.Request["M_ID"];
                    bce.CF_Item = context.Request["CF_Item"];//聯落單種類
                    bce.T_Type = context.Request["T_Type"];//入會方式
                    bce.MP_ID = context.Request["MP_ID"];
                    bce.MP_Item = context.Request["MP_Item"];
                    bce.Results_Item = context.Request["Results_Item"];
                    bce.ca_id = context.Request["ca_id"];//電子委任契約書編號
                                                         //bce.PT_Item = context.Request["PT_Item"];//付款方式
                                                         //bce.T_PType1= context.Request["PT_Item1"];//付款方式1
                                                         //bce.T_PType2= context.Request["PT_Item2"];//付款方式2
                    bce.CCard_4Num = context.Request["CCard_4Num"];//信用卡末四碼
                    bce.begindate_Date = context.Request["begindate_Date"];//新會期(始)
                    bce.enddate_Date = context.Request["bcenddate_Date"];//新會期(終)
                    bce.T_ID = context.Request["T_ID"];//折讓案件(原案件)編號
                    bce.T_Name = context.Request["T_Name"];//折讓案件(原案件)名稱
                    bce.D_MP = context.Request["D_MP"];//新案件(分析師)
                    bce.D_Item = context.Request["D_Item"];//新案件(服務項目)
                                                           //bce.Paymoney = context.Request["Paymoney"];
                                                           //bce.PT_Item = context.Request["PT_Item"];// 付款類型(入賬資訊)[單筆]or[多筆]
                    bce.begindate_Date = context.Request["begindate_Date"];//新會期(始)
                    bce.enddate_Date = context.Request["bcenddate_Date"];//新會期(終)
                    bce.Mess = context.Request["Mess"];//設訊
                    bce.Media = context.Request["Media"];//設鎖碼影影音
                    bce.P_Text = context.Request["P_Text"];//設付費文章
                    bce.P_video = context.Request["P_video"];//設付費影片
                    bce.ATM = context.Request["ATM"];
                    bce.INV_Open_Item = context.Request["INV_Open_Item"];
                    bce.T_Ivo = context.Request["T_Ivo"];
                    bce.INV_ITEM = context.Request["INV_ITEM"];
                    bce.COMNAME = context.Request["COMNAME"];
                    bce.INV_ITEM_UnifyNum = context.Request["INV_ITEM_UnifyNum"];
                    bce.Select_Com = context.Request["U_LeaderCom"];//簽核主管公司
                    bce.Select_Dept = context.Request["U_Leader"];//簽核主管員工編號
                    bce.Select_Employ = context.Request["U_LeaderName"];//簽核主管
                    bce.Obj = context.Request["Obj"];//件別
                    bce.PS = context.Request["PS"];//備註
                    bce.F_Status = context.Request["F_Status"];
                    bce.CellPhone = context.Request["CellPhone"];
                    bce.D_tag = context.Request["D_tag"];//是否補件
                    bce.D_Paymoney = context.Request["D_Paymoney"];//補件金額
                    bce.DSdate = context.Request["DSdate"];//入會時間
                    bce.DEdate = context.Request["DEdate"];//到期日期
                    bce.C_tag = context.Request["C_tag"];
                    bce.add_user = context.Request["add_user"];
                    bce.add_com = context.Request["add_com"];
                    bce.add_ip = context.Request["add_ip"];
                }
                else if (bce.CF_Item.ToString() == "0003")//設傳真稿
                { //20230512這邊要加上修改的地方
                  //bce.M_ID = context.Request["M_ID"];
                    bce.M_ID = Value(context, "M_ID");
                    bce.CF_Item = context.Request["CF_Item"];//聯落單種類
                    bce.CF_item = Value(context, "CF_item");
                    bce.T_Type = Value(context, "T_Type");//context.Request["T_Type"];//入會方式
                    bce.MP_ID = context.Request["MP_ID"];
                    bce.MP_Item = context.Request["MP_Item"];
                    bce.Results_Item = context.Request["Results_Item"];
                    bce.ca_id = context.Request["ca_id"];//電子委任契約書編號
                                                         //bce.PT_Item = context.Request["PT_Item"];//付款方式
                                                         //bce.T_PType1= context.Request["PT_Item1"];//付款方式1
                                                         //bce.T_PType2= context.Request["PT_Item2"];//付款方式2
                    bce.CCard_4Num = context.Request["CCard_4Num"];//信用卡末四碼
                    bce.begindate_Date = context.Request["begindate_Date"];//新會期(始)
                    bce.enddate_Date = context.Request["bcenddate_Date"];//新會期(終)
                    bce.T_ID = context.Request["T_ID"];//折讓案件(原案件)編號
                    bce.T_Name = context.Request["T_Name"];//折讓案件(原案件)名稱
                    bce.D_MP = context.Request["D_MP"];//新案件(分析師)
                    bce.D_Item = context.Request["D_Item"];//新案件(服務項目)
                                                           //bce.Paymoney = context.Request["Paymoney"];
                                                           //bce.PT_Item = context.Request["PT_Item"];// 付款類型(入賬資訊)[單筆]or[多筆]
                    bce.begindate_Date = context.Request["begindate_Date"];//新會期(始)
                    bce.enddate_Date = context.Request["bcenddate_Date"];//新會期(終)
                    bce.Mess = context.Request["Mess"];//設訊
                    bce.Media = context.Request["Media"];//設鎖碼影影音
                    bce.P_Text = context.Request["P_Text"];//設付費文章
                    bce.P_video = context.Request["P_video"];//設付費影片
                    bce.ATM = context.Request["ATM"];
                    bce.INV_Open_Item = context.Request["INV_Open_Item"];
                    bce.T_Ivo = context.Request["T_Ivo"];
                    bce.INV_ITEM = context.Request["INV_ITEM"];
                    bce.COMNAME = context.Request["COMNAME"];
                    bce.INV_ITEM_UnifyNum = context.Request["INV_ITEM_UnifyNum"];
                    bce.Select_Com = context.Request["U_LeaderCom"];//簽核主管公司
                    bce.Select_Dept = context.Request["U_Leader"];//簽核主管員工編號
                    bce.Select_Employ = context.Request["U_LeaderName"];//簽核主管
                    bce.Obj = context.Request["Obj"];//件別
                    bce.PS = context.Request["PS"];//備註
                    bce.F_Status = context.Request["F_Status"];
                    bce.CellPhone = context.Request["CellPhone"];
                    bce.D_tag = context.Request["D_tag"];//是否補件
                    bce.D_Paymoney = context.Request["D_Paymoney"];//補件金額
                    bce.DSdate = context.Request["DSdate"];//入會時間
                    bce.DEdate = context.Request["DEdate"];//到期日期
                    bce.C_tag = context.Request["C_tag"];
                    bce.add_user = context.Request["add_user"];
                    bce.add_com = context.Request["add_com"];
                    bce.add_ip = context.Request["add_ip"];
                }
                else if (bce.CF_Item.ToString() == "0004")//業績歸屬
                {

                    bce.M_ID = Value(context, "M_ID");//context.Request["M_ID"]; //案件編號
                    bce.T_Type = Value(context, "T_Type");// context.Request["T_Type"]; //入會方式
                    bce.MP_ID = Value(context, "MP_ID");// context.Request["MP_ID"];//分析師(入會方式)
                    bce.MP_Item = Value(context, "MP_Item");//context.Request["MP_Item"];//會員種類
                    bce.Results_Item = Value(context, "Results_Item");// context.Request["Results_Item"];//業績種類
                    bce.ca_id = Value(context, "ca_id");//context.Request["ca_id "];
                    bce.T_PType = Value(context, "T_PType");//context.Request["T_PType "];
                    bce.Paymoney = Value(context, "Paymoney");//context.Request["Paymoney" ];
                    bce.PT_Item = Value(context, "PT_Item");//context.Request["PT_Item "];// 付款類型(入賬資訊)[單筆]or[多筆]
                    bce.begindate_Date = Value(context, "begindate_Date");//context.Request["begindate_Date"];// + begindate_Date//入會日期
                    bce.enddate_Date = Value(context, "enddate_Date");//context.Request["enddate_Date"];//+ bcenddate_Date//到期日期
                    bce.Select_Com = Value(context, "Select_Com");//context.Request["Select_Com"]; //+ Select_Com +//簽核主管-公司別[20230518]要修改
                    bce.Select_Dept = Value(context, "Select_Dept");//context.Request["Select_Dept"]; //+ Select_Dept +//簽核主管-部門
                    bce.Media = Value(context, "Media");//context.Request["Media"];//設鎖碼影音
                    bce.P_Text = Value(context, "P_Text");//context.Request["P_Text"];//設付費文章
                    bce.P_video = Value(context, "P_video");//context.Request["P_video"];//設付費影片
                    bce.ATM = Value(context, "ATM");//context.Request["ATM"];//ATM後五碼
                    bce.CCard_4Num = Value(context, "CCard_4Num");//context.Request["CCard_4Num"];//信用卡末四碼
                    bce.INV_Open_Item = Value(context, "INV_Open_Item");//context.Request["INV_Open_Item"];//發票開立方式
                    bce.T_Ivo = Value(context, "T_Ivo");//context.Request["T_Ivo"];//寄發狀況
                    bce.INV_ITEM = Value(context, "INV_ITEM");//context.Request["INV_ITEM"];//發票種類

                    // bce.=context.Request[""];//載具編號

                    bce.U_Leader = Value(context, "U_Leader");//context.Request["Select_Com"];//簽核主管-公司別
                    bce.U_LeaderCom = Value(context, "U_LeaderCom");//context.Request["Select_Dept"];//簽核主管-部門
                    bce.U_LeaderName = Value(context, "U_LeaderName");//context.Request["Select_Employ"];//簽核主管-員工編號
                    bce.INV_ITEM_UnifyNum = Value(context, "INV_ITEM_UnifyNum");//context.Request["INV_ITEM_UnifyNum"];
                    bce.U_Leader = Value(context, "U_Leader");//context.Request["U_Leader"];//簽核主管(公司別)
                    bce.U_LeaderCom = Value(context, "U_LeaderCom");//context.Request["U_LeaderCom"];//簽核主管(部門)
                    bce.U_LeaderName = Value(context, "U_LeaderName");//context.Request["U_LeaderName"];//簽核主管(姓名)
                    bce.Obj = Value(context, "Obj");//context.Request["Obj"];//件別
                    bce.PS = Value(context, "PS");//context.Request["PS"];//備註
                    bce.Other = Value(context, "Other");//context.Request["Other"];//其他
                    bce.Attach_User = Value(context, "Select_Employ_Attach");//context.Request["Attach_User"];//業績分類(歸屬)[員工編號]
                    bce.Attach_Com = Value(context, "Select_Com_Attach");//context.Request["Attach_Com"]; // 業績分類(歸屬)[員工公司]Select_Com_AttachSelect_Com_Attach
                    bce.Attach_Dept = Value(context, "Select_Dept_Attach");//context.Request["Attach_Dept"];
                    bce.CMonth = Value(context, "CMonth");//context.Request["CMonth"]; //月份(當月:1,次月:2)
                    bce.CellPhone = Value(context, "CellPhone");//context.Request["CellPhone"];//行動電話
                    bce.MessName = Value(context, "MessName");//context.Request["MessName"];//傳真稿
                    bce.Mess = Value(context, "Mess");//context.Request["Mess"]; //傳真稿(設)[選項]
                    bce.add_user = Value(context, "add_user");//context.Request["add_user"];
                    bce.add_com = Value(context, "add_com");//context.Request["add_com"];
                    bce.add_ip = Value(context, "add_ip");//context.Request["add_ip"];
                    bce.Mess = Value(context, "Mess");//context.Request["Mess"];//設訊
                    bce.PT_Item = Value(context, "PT_Item");//context.Request["PT_Item"];//付款類型
                    bce.M_ID = Value(context, "M_ID");// context.Request["M_ID"];
                    bce.CF_Item = Value(context, "CF_Item");//context.Request["CF_Item"];//聯落單種類
                    bce.T_Type = Value(context, "T_Type");// context.Request["T_Type"];//入會方式
                    bce.MP_ID = Value(context, "MP_ID");// context.Request["MP_ID"];
                    bce.MP_Item = Value(context, "MP_Item");// context.Request["MP_Item"];
                    bce.Results_Item = Value(context, "Results_Item");// context.Request["Results_Item"];
                    bce.ca_id = Value(context, "ca_id");// context.Request["ca_id"];//電子委任契約書編號
                                                        //bce.PT_Item = context.Request["PT_Item"];//付款方式
                                                        //bce.T_PType1= context.Request["PT_Item1"];//付款方式1
                                                        //bce.T_PType2= context.Request["PT_Item2"];//付款方式2
                    bce.CCard_4Num = Value(context, "CCard_4Num");//context.Request["CCard_4Num"];//信用卡末四碼
                    bce.begindate_Date = Value(context, "begindate_Date");//context.Request["begindate_Date"];//新會期(始)
                    bce.enddate_Date = Value(context, "bcenddate_Date");// context.Request["bcenddate_Date"];//新會期(終)
                    bce.T_ID = Value(context, "T_ID");// context.Request["T_ID"];//折讓案件(原案件)編號
                    bce.T_Name = Value(context, "T_Name");// context.Request["T_Name"];//折讓案件(原案件)名稱
                    bce.D_MP = Value(context, "D_MP");// context.Request["D_MP"];//新案件(分析師)
                    bce.D_Item = Value(context, "D_Item");// context.Request["D_Item"];//新案件(服務項目)
                                                          //bce.Paymoney = context.Request["Paymoney"];
                                                          //bce.PT_Item = context.Request["PT_Item"];// 付款類型(入賬資訊)[單筆]or[多筆]
                    bce.begindate_Date = Value(context, "begindate_Date");//context.Request["begindate_Date"];//新會期(始)
                    bce.enddate_Date = Value(context, "enddate_Date");// context.Request["bcenddate_Date"];//新會期(終)
                    bce.Mess = Value(context, "Mess");// context.Request["Mess"];//設訊
                    bce.Media = Value(context, "Media");// context.Request["Media"];//設鎖碼影影音
                    bce.P_Text = Value(context, "P_Text");//  context.Request["P_Text"];//設付費文章
                    bce.P_video = Value(context, "P_video");//  context.Request["P_video"];//設付費影片
                    bce.ATM = Value(context, "ATM");// context.Request["ATM"];
                    bce.INV_Open_Item = Value(context, "INV_Open_Item");// context.Request["INV_Open_Item"];
                    bce.T_Ivo = Value(context, "T_Ivo");//  context.Request["T_Ivo"];
                    bce.INV_ITEM = Value(context, "INV_ITEM");// context.Request["INV_ITEM"];
                    bce.COMNAME = Value(context, "COMNAME");//  context.Request["COMNAME"];
                    bce.INV_ITEM_UnifyNum = Value(context, "INV_ITEM_UnifyNum");// context.Request["INV_ITEM_UnifyNum"];
                    bce.Select_Com = Value(context, "U_LeaderCom");//  context.Request["U_LeaderCom"];//簽核主管公司
                    bce.Select_Dept = Value(context, "U_Leader");// context.Request["U_Leader"];//簽核主管員工編號
                    bce.Select_Employ = Value(context, "U_LeaderName");// context.Request["U_LeaderName"];//簽核主管
                    bce.Obj = Value(context, "Obj");//  context.Request["Obj"];//件別
                    bce.PS = Value(context, "PS");// context.Request["PS"];//備註
                    bce.F_Status = Value(context, "F_Status");// context.Request["F_Status"];
                    bce.CellPhone = Value(context, "CellPhone");//  context.Request["CellPhone"];
                    bce.D_tag = Value(context, "D_tag");//  context.Request["D_tag"];//是否補件
                    bce.D_Paymoney = Value(context, "D_Paymoney");// context.Request["D_Paymoney"];//補件金額
                    bce.DSdate = Value(context, "DSdate");// context.Request["DSdate"];//入會時間
                    bce.DEdate = Value(context, "DEdate");// context.Request["DEdate"];//到期日期
                    bce.C_tag = Value(context, "C_tag");//  context.Request["C_tag"];
                    bce.add_user = Value(context, "add_user");//  context.Request["add_user"];
                    bce.add_com = Value(context, "add_com");// context.Request["add_com"];
                    bce.add_ip = Value(context, "add_ip");// context.Request["add_ip"];
                }
                else if (bce.CF_Item.ToString() == "0005")//更改責任助理
                {
                    bce.M_ID = Value(context, "M_ID");
                    bce.CF_Item = Value(context, "CF_Item");
                    bce.T_Type = Value(context, "T_Type");
                    bce.MP_ID = Value(context, "MP_ID");
                    bce.MP_Item = Value(context, "MP_Item");
                    bce.Results_Item = Value(context, "Results_Item");
                    bce.ca_id = Value(context, "ca_id");
                    bce.T_PType = Value(context, "T_PType");
                    bce.Paymoney = Value(context, "Paymoney");
                    bce.PT_Item = Value(context, "PT_Item");
                    bce.begindate_Date = Value(context, "begindate_Date");
                    bce.enddate_Date = Value(context, "bcenddate_Date");
                    bce.Select_Com = Value(context, "Select_Com");
                    bce.Select_Dept = Value(context, "Select_Dept");
                    bce.Media = Value(context, "Media");
                    bce.P_Text = Value(context, "P_Text");
                    bce.P_video = Value(context, "P_video");
                    bce.ATM = Value(context, "ATM");
                    bce.CCard_4Num = Value(context, "CCard_4Num");
                    bce.INV_open_ITEM = Value(context, "INV_open_ITEM");
                    bce.T_Ivo = Value(context, "T_Ivo");
                    bce.U_Agent = Value(context, "U_Agent");
                    bce.U_Agent_Name = Value(context, "U_Agent_Name");
                    bce.U_Agent_Com = Value(context, "U_Agent_Com");
                    bce.Select_Com = Value(context, "Select_Com");
                    bce.Select_Com = Value(context, "Select_Com");
                    bce.Select_Dept = Value(context, "Select_Dept");
                    bce.Select_Employ = Value(context, "Select_Employ");
                    bce.INV_ITEM_UnifyNum = Value(context, "INV_ITEM_UnifyNum");
                    bce.U_Leader = Value(context, "U_Leader");
                    bce.U_LeaderCom = Value(context, "U_LeaderCom");
                    bce.U_LeaderName = Value(context, "U_LeaderName");
                    bce.Obj = Value(context, "Obj");
                    bce.PS = Value(context, "PS");
                    //bce.mess_other = Value(context, "mess_other");
                    //bce.abcMess = Value(context, "abcMess");
                    bce.add_user = Value(context, "add_user");
                    bce.add_com = Value(context, "add_com");
                    bce.add_ip = Value(context, "add_ip");
                    bce.Mess = Value(context, "Mess");
                    bce.PT_Item = Value(context, "PT_Item");



                }
                else if (bce.CF_Item.ToString() == "0006")//折讓
                {
                    bce.M_ID = Value(context, "M_ID");//context.Request["M_ID"]; //案件編號
                    bce.T_Type = Value(context, "T_Type");// context.Request["T_Type"]; //入會方式
                    bce.MP_ID = Value(context, "MP_ID");// context.Request["MP_ID"];//分析師(入會方式)
                    bce.MP_Item = Value(context, "MP_Item");//context.Request["MP_Item"];//會員種類
                    bce.Results_Item = Value(context, "Results_Item");// context.Request["Results_Item"];//業績種類
                    bce.ca_id = Value(context, "ca_id");//context.Request["ca_id "];
                    bce.T_PType = Value(context, "T_PType");//context.Request["T_PType "];
                    bce.Paymoney = Value(context, "Paymoney");//context.Request["Paymoney" ];
                    bce.PT_Item = Value(context, "PT_Item");//context.Request["PT_Item "];// 付款類型(入賬資訊)[單筆]or[多筆]
                    bce.begindate_Date = Value(context, "begindate_Date");//context.Request["begindate_Date"];// + begindate_Date//入會日期
                    bce.enddate_Date = Value(context, "enddate_Date");//context.Request["enddate_Date"];//+ bcenddate_Date//到期日期
                    bce.Select_Com = Value(context, "Select_Com");//context.Request["Select_Com"]; //+ Select_Com +//簽核主管-公司別[20230518]要修改
                    bce.Select_Dept = Value(context, "Select_Dept");//context.Request["Select_Dept"]; //+ Select_Dept +//簽核主管-部門
                    bce.Media = Value(context, "Media");//context.Request["Media"];//設鎖碼影音
                    bce.P_Text = Value(context, "P_Text");//context.Request["P_Text"];//設付費文章
                    bce.P_video = Value(context, "P_video");//context.Request["P_video"];//設付費影片
                    bce.ATM = Value(context, "ATM");//context.Request["ATM"];//ATM後五碼
                    bce.CCard_4Num = Value(context, "CCard_4Num");//context.Request["CCard_4Num"];//信用卡末四碼
                    bce.INV_Open_Item = Value(context, "INV_Open_Item");//context.Request["INV_Open_Item"];//發票開立方式
                    bce.T_Ivo = Value(context, "T_Ivo");//context.Request["T_Ivo"];//寄發狀況
                    bce.INV_ITEM = Value(context, "INV_ITEM");//context.Request["INV_ITEM"];//發票種類

                    // bce.=context.Request[""];//載具編號

                    bce.U_Leader = Value(context, "U_Leader");//context.Request["Select_Com"];//簽核主管-公司別
                    bce.U_LeaderCom = Value(context, "U_LeaderCom");//context.Request["Select_Dept"];//簽核主管-部門
                    bce.U_LeaderName = Value(context, "U_LeaderName");//context.Request["Select_Employ"];//簽核主管-員工編號
                    bce.INV_ITEM_UnifyNum = Value(context, "INV_ITEM_UnifyNum");//context.Request["INV_ITEM_UnifyNum"];
                    bce.U_Leader = Value(context, "U_Leader");//context.Request["U_Leader"];//簽核主管(公司別)
                    bce.U_LeaderCom = Value(context, "U_LeaderCom");//context.Request["U_LeaderCom"];//簽核主管(部門)
                    bce.U_LeaderName = Value(context, "U_LeaderName");//context.Request["U_LeaderName"];//簽核主管(姓名)
                    bce.Obj = Value(context, "Obj");//context.Request["Obj"];//件別
                    bce.PS = Value(context, "PS");//context.Request["PS"];//備註
                    bce.Other = Value(context, "Other");//context.Request["Other"];//其他
                    bce.Attach_User = Value(context, "Select_Employ_Attach");//context.Request["Attach_User"];//業績分類(歸屬)[員工編號]
                    bce.Attach_Com = Value(context, "Select_Com_Attach");//context.Request["Attach_Com"]; // 業績分類(歸屬)[員工公司]Select_Com_AttachSelect_Com_Attach
                    bce.Attach_Dept = Value(context, "Select_Dept_Attach");//context.Request["Attach_Dept"];
                    bce.CMonth = Value(context, "CMonth");//context.Request["CMonth"]; //月份(當月:1,次月:2)
                    bce.CellPhone = Value(context, "CellPhone");//context.Request["CellPhone"];//行動電話
                    bce.MessName = Value(context, "MessName");//context.Request["MessName"];//傳真稿
                    bce.Mess = Value(context, "Mess");//context.Request["Mess"]; //傳真稿(設)[選項]
                    bce.add_user = Value(context, "add_user");//context.Request["add_user"];
                    bce.add_com = Value(context, "add_com");//context.Request["add_com"];
                    bce.add_ip = Value(context, "add_ip");//context.Request["add_ip"];
                    bce.Mess = Value(context, "Mess");//context.Request["Mess"];//設訊
                    bce.PT_Item = Value(context, "PT_Item");//context.Request["PT_Item"];//付款類型
                    bce.M_ID = Value(context, "M_ID");// context.Request["M_ID"];
                    bce.CF_Item = Value(context, "CF_Item");//context.Request["CF_Item"];//聯落單種類
                    bce.T_Type = Value(context, "T_Type");// context.Request["T_Type"];//入會方式
                    bce.MP_ID = Value(context, "MP_ID");// context.Request["MP_ID"];
                    bce.MP_Item = Value(context, "MP_Item");// context.Request["MP_Item"];
                    bce.Results_Item = Value(context, "Results_Item");// context.Request["Results_Item"];
                    bce.ca_id = Value(context, "ca_id");// context.Request["ca_id"];//電子委任契約書編號
                                                        //bce.PT_Item = context.Request["PT_Item"];//付款方式
                                                        //bce.T_PType1= context.Request["PT_Item1"];//付款方式1
                                                        //bce.T_PType2= context.Request["PT_Item2"];//付款方式2
                    bce.CCard_4Num = Value(context, "CCard_4Num");//context.Request["CCard_4Num"];//信用卡末四碼
                    bce.begindate_Date = Value(context, "begindate_Date");//context.Request["begindate_Date"];//新會期(始)
                    bce.enddate_Date = Value(context, "bcenddate_Date");// context.Request["bcenddate_Date"];//新會期(終)
                    bce.T_ID = Value(context, "T_ID");// context.Request["T_ID"];//折讓案件(原案件)編號
                    bce.T_Name = Value(context, "T_Name");// context.Request["T_Name"];//折讓案件(原案件)名稱
                    bce.D_MP = Value(context, "D_MP");// context.Request["D_MP"];//新案件(分析師)
                    bce.D_Item = Value(context, "D_Item");// context.Request["D_Item"];//新案件(服務項目)
                                                          //bce.Paymoney = context.Request["Paymoney"];
                                                          //bce.PT_Item = context.Request["PT_Item"];// 付款類型(入賬資訊)[單筆]or[多筆]
                    bce.begindate_Date = Value(context, "begindate_Date");//context.Request["begindate_Date"];//新會期(始)
                    bce.enddate_Date = Value(context, "enddate_Date");// context.Request["bcenddate_Date"];//新會期(終)
                    bce.Mess = Value(context, "Mess");// context.Request["Mess"];//設訊
                    bce.Media = Value(context, "Media");// context.Request["Media"];//設鎖碼影影音
                    bce.P_Text = Value(context, "P_Text");//  context.Request["P_Text"];//設付費文章
                    bce.P_video = Value(context, "P_video");//  context.Request["P_video"];//設付費影片
                    bce.ATM = Value(context, "ATM");// context.Request["ATM"];
                    bce.INV_Open_Item = Value(context, "INV_Open_Item");// context.Request["INV_Open_Item"];
                    bce.T_Ivo = Value(context, "T_Ivo");//  context.Request["T_Ivo"];
                    bce.INV_ITEM = Value(context, "INV_ITEM");// context.Request["INV_ITEM"];
                    bce.COMNAME = Value(context, "COMNAME");//  context.Request["COMNAME"];
                    bce.INV_ITEM_UnifyNum = Value(context, "INV_ITEM_UnifyNum");// context.Request["INV_ITEM_UnifyNum"];
                    bce.Select_Com = Value(context, "U_LeaderCom");//  context.Request["U_LeaderCom"];//簽核主管公司
                    bce.Select_Dept = Value(context, "U_Leader");// context.Request["U_Leader"];//簽核主管員工編號
                    bce.Select_Employ = Value(context, "U_LeaderName");// context.Request["U_LeaderName"];//簽核主管
                    bce.Obj = Value(context, "Obj");//  context.Request["Obj"];//件別
                    bce.PS = Value(context, "PS");// context.Request["PS"];//備註
                    bce.F_Status = Value(context, "F_Status");// context.Request["F_Status"];
                    bce.CellPhone = Value(context, "CellPhone");//  context.Request["CellPhone"];
                    bce.D_tag = Value(context, "D_tag");//  context.Request["D_tag"];//是否補件
                    bce.D_Paymoney = Value(context, "D_Paymoney");// context.Request["D_Paymoney"];//補件金額
                    bce.DSdate = Value(context, "DSdate");// context.Request["DSdate"];//入會時間
                    bce.DEdate = Value(context, "DEdate");// context.Request["DEdate"];//到期日期
                    bce.C_tag = Value(context, "C_tag");//  context.Request["C_tag"];
                    bce.add_user = Value(context, "add_user");//  context.Request["add_user"];
                    bce.add_com = Value(context, "add_com");// context.Request["add_com"];
                    bce.add_ip = Value(context, "add_ip");// context.Request["add_ip"];
                }
                else if (bce.CF_Item.ToString() == "0007")//訂金件
                {
                    //老師演講會場收訂金用的～要保留[念純(行政)]
                }
                else if (bce.CF_Item.ToString() == "0008")//退費
                {
                    bce.M_ID = Value(context, "M_ID");
                    bce.U_Leader = Value(context, "U_Leader");//context.Request["Select_Com"];//簽核主管-公司別
                    bce.U_LeaderCom = Value(context, "U_LeaderCom");//context.Request["Select_Dept"];//簽核主管-部門
                    bce.U_LeaderName = Value(context, "U_LeaderName");//context.Request["Select_Employ"];//簽核主管-員工編號
                    bce.INV_ITEM_UnifyNum = Value(context, "INV_ITEM_UnifyNum");//context.Request["INV_ITEM_UnifyNum"];
                    bce.U_Leader = Value(context, "U_Leader");//context.Request["U_Leader"];//簽核主管(公司別)
                    bce.U_LeaderCom = Value(context, "U_LeaderCom");//context.Request["U_LeaderCom"];//簽核主管(部門)
                    bce.U_LeaderName = Value(context, "U_LeaderName");//context.Request["U_LeaderName"];//簽核主管(姓名)
                    bce.Obj = Value(context, "Obj");//context.Request["Obj"];//件別
                    bce.PS = Value(context, "PS");//context.Request["PS"];//備註
                    bce.B_Paymoney = Value(context, "B_Paymoney");//退費金額
                    bce.B_ID = Value(context, "B_ID");//退費案件編號
                    bce.B_Name = Value(context, "B_Name");//退費案件名稱
                    bce.add_user = Value(context, "add_user");
                    bce.add_com = Value(context, "add_com");
                    bce.add_ip = Value(context, "add_ip");
                }
                else if (bce.CF_Item.ToString() == "0009")//暫停/恢復
                {
                    bce.M_ID = Value(context, "M_ID");
                    bce.U_Leader = Value(context, "U_Leader");//context.Request["Select_Com"];//簽核主管-公司別
                    bce.U_LeaderCom = Value(context, "U_LeaderCom");//context.Request["Select_Dept"];//簽核主管-部門
                    bce.U_LeaderName = Value(context, "U_LeaderName");//context.Request["Select_Employ"];//簽核主管-員工編號
                    bce.INV_ITEM_UnifyNum = Value(context, "INV_ITEM_UnifyNum");//context.Request["INV_ITEM_UnifyNum"];
                    bce.U_Leader = Value(context, "U_Leader");//context.Request["U_Leader"];//簽核主管(公司別)
                    bce.U_LeaderCom = Value(context, "U_LeaderCom");//context.Request["U_LeaderCom"];//簽核主管(部門)
                    bce.U_LeaderName = Value(context, "U_LeaderName");//context.Request["U_LeaderName"];//簽核主管(姓名)
                    bce.Obj = Value(context, "Obj");//context.Request["Obj"];//件別
                    bce.PS = Value(context, "PS");//context.Request["PS"];//備註
                    bce.B_Paymoney = Value(context, "B_Paymoney");//退費金額
                    bce.B_ID = Value(context, "B_ID");//退費案件編號
                    bce.B_Name = Value(context, "B_Name");//退費案件名稱
                    bce.P_StartStop = Value(context, "S_tag");//暫停/恢復
                    bce.S_ID = Value(context, "S_ID");//暫停/恢復(案件編號)
                    bce.S_Name = Value(context, "S_Name");//暫停/恢復(案件名稱)
                    bce.add_user = Value(context, "add_user");
                    bce.add_com = Value(context, "add_com");
                    bce.add_ip = Value(context, "add_ip");
                }
                else if (bce.CF_Item.ToString() == "0010")//轉換老師
                {
                    bce.M_ID = Value(context, "M_ID");
                    bce.C_tag = Value(context, "C_tag");
                    bce.U_LeaderCom = Value(context, "U_LeaderCom");//context.Request["U_LeaderCom"];//簽核主管(部門)
                    bce.U_LeaderName = Value(context, "U_LeaderName");//context.Request["U_LeaderName"];//簽核主管(姓名)
                    bce.Obj = Value(context, "Obj");
                    bce.PS = Value(context, "PS");
                    bce.add_user = Value(context, "add_user");
                    bce.add_com = Value(context, "add_com");
                    bce.add_ip = Value(context, "add_ip");


                }
                else if (bce.CF_Item.ToString() == "0011")//其他
                {
                    bce.M_ID = Value(context, "M_ID");
                    bce.C_tag = Value(context, "C_tag");
                    bce.U_LeaderCom = Value(context, "U_LeaderCom");//context.Request["U_LeaderCom"];//簽核主管(部門)
                    bce.U_LeaderName = Value(context, "U_LeaderName");//context.Request["U_LeaderName"];//簽核主管(姓名)
                    bce.Obj = Value(context, "Obj");
                    bce.PS = Value(context, "PS");
                    bce.add_user = Value(context, "add_user");
                    bce.add_com = Value(context, "add_com");
                    bce.add_ip = Value(context, "add_ip");

                }

                context.Response.Write(addBusinessConnection(bce));

                break;
            case "getSelectEmplist":
                string U_MDEP = context.Request["U_MDEP"];
                string ComID = context.Request["ComID"];
                context.Response.Write(getSelectEmplist(U_MDEP, ComID));
                break;
            case "searchCustomerData":
                getCustormerParams gcp = new getCustormerParams();
                gcp.U_Num = context.Request["U_Num"];
                gcp.U_MDEP = context.Request["U_MDEP"];
                gcp.ComID = context.Request["ComID"];
                gcp.keyWord = context.Request["keyWord"];
                gcp.Q_Name = context.Request["Q_Name"];
                gcp.Q_Tel = context.Request["Q_Tel"];
                gcp.StartDate = context.Request["StartDate"];
                gcp.EndDate = context.Request["EndDate"];
                gcp.Q_Analyst = context.Request["Q_Analyst"];
                gcp.Q_Grade = context.Request["Q_Grade"];
                gcp.Q_Member = context.Request["Q_Member"];
                gcp.Q_Product = context.Request["Q_Product"];

                context.Response.Write(getCustomerDataHtml(gcp));
                break;
            case "getCustomerData":
                M_ID = context.Request["M_ID"];
                context.Response.Write(getCustomerData(M_ID));
                break;
            case "isLongTag":
                M_ID = context.Request["M_ID"];
                U_Num = context.Request["U_Num"];
                string tagType = context.Request["tagType"];
                context.Response.Write(isLongTag(M_ID, U_Num, tagType));
                break;
            case "doLongTag":
                M_ID = context.Request["M_ID"];
                string MC = context.Request["MC"];
                string MC_Name = context.Request["MC_Name"];
                string MC_Com = context.Request["MC_Com"];
                string Light_Status = context.Request["Light_Status"];
                doLongTag(M_ID, MC, MC_Name, MC_Com, Light_Status);
                break;
            case "getTagHistory":
                M_ID = context.Request["M_ID"];
                context.Response.Write(getTagHistory(M_ID));
                break;
            case "getKYC":
                M_ID = context.Request["M_ID"];
                context.Response.Write(getKYC(M_ID));
                break;
            case "getCDD":
                M_ID = context.Request["M_ID"];
                context.Response.Write(getCDD(M_ID));
                break;
            case "getCDDlist":
                M_ID = context.Request["M_ID"];
                context.Response.Write(getCDDlist(M_ID));
                break;

            case "getTodayConnectionMatterHtml":
                U_Num = context.Request["U_Num"];
                context.Response.Write(getTodayConnectionMatterHtml(U_Num));
                break;

            case "addEditCustomerData":
                customerDataEntity cde = new customerDataEntity();
                cde.M_Name = context.Request["M_Name"];
                cde.M_Sax = context.Request["M_Sax"];
                cde.M_Grade = context.Request["M_Grade"];
                string bdstr = context.Request["BirthDay_Date"];
                if (!common.isEmpty(bdstr))
                {
                    string[] bd = bdstr.Split('/');
                    cde.BirthDay_Date = bd[0] + "-" + bd[1] + "-" + bd[2] + " " + "00:00:00.000";
                }
                else
                {
                    cde.BirthDay_Date = null;
                }

                cde.MC = context.Request["MCdata"];
                cde.MC_Name = context.Request["MC_Name"];
                cde.MC_COM = context.Request["MC_COM"];
                cde.OTel_Zone = context.Request["OTel_Zone"];
                cde.OTel = context.Request["OTel"];
                cde.OTel_Sub = context.Request["OTel_Sub"];
                cde.OTel_Zone1 = context.Request["OTel_Zone1"];
                cde.OTel1 = context.Request["OTel1"];
                cde.OTel_Sub1 = context.Request["OTel_Sub1"];
                cde.HTel_Zone = context.Request["HTel_Zone"];
                cde.HTel = context.Request["HTel"];
                cde.HTel_Zone1 = context.Request["HTel_Zone1"];
                cde.HTel1 = context.Request["HTel1"];
                cde.MTel1 = context.Request["MTel1"];
                cde.MTel2 = context.Request["MTel2"];
                cde.MTel3 = context.Request["MTel3"];
                cde.Fax_Zone = context.Request["Fax_Zone"];
                cde.Fax = context.Request["Fax"];
                cde.Fax_Zone1 = context.Request["Fax_Zone1"];
                cde.Fax1 = context.Request["Fax1"];
                cde.M_SD = context.Request["M_SD"];
                cde.EMail = context.Request["EMail"];
                cde.OCity = context.Request["OCity"];
                cde.OTown = context.Request["OTown"];
                cde.OZipCode = context.Request["OZipCode"];
                cde.O_Address = context.Request["O_Address"];
                cde.HCity = context.Request["HCity"];
                cde.HTown = context.Request["HTown"];
                cde.HZipCode = context.Request["HZipCode"];
                cde.H_Address = context.Request["H_Address"];
                cde.Inv_Money = context.Request["Inv_Money"];
                cde.Analyst = context.Request["Analyst"];
                cde.Product = context.Request["Product"];
                cde.Program = context.Request["Program"];
                cde.M_Note = context.Request["M_Note"];
                cde.Light_Status = context.Request["Light_Status"];
                cde.add_ip = context.Request["add_ip"];
                cde.add_user = context.Request["add_user"];
                cde.M_ID = context.Request["M_ID"];
                cde.Recipient = context.Request["Recipient"];
                string addEditType = context.Request["addEditType"];
                context.Response.Write(addEditCustomerData(cde, addEditType));
                break;
            case "getTradeRecord":
                M_ID = context.Request["M_ID"];
                context.Response.Write(getTradeRecord(M_ID));
                break;
            case "getChargeDetailList":
                T_ID = context.Request["T_ID"];
                context.Response.Write(getChargeDetailList(T_ID));
                break;
            case "getCallRecordList":
                M_ID = context.Request["M_ID"];
                context.Response.Write(getCallRecordList(M_ID));
                break;
            case "getActivityMessageList":
                string M_Tel = context.Request["M_Tel"];
                context.Response.Write(getActivityMessageList(M_Tel));
                break;
            case "getDownpayment":
                M_ID = context.Request["M_ID"];
                context.Response.Write(getDownpayment(M_ID));
                break;
            case "deleteCustomerData":
                string f_id = context.Request["f_id"];
                context.Response.Write(deleteCustomerData(f_id));
                break;
            case "getAppointData":
                M_ID = context.Request["M_ID"];
                context.Response.Write(getAppointData(M_ID));
                break;

            case "deleteTradeRecordDetail":
                T_ID = context.Request["T_ID"];
                context.Response.Write(deleteTradeRecordDetail(T_ID));
                break;
            case "sendMTRAT":
                tre = new tradeRecordEntity();

                tre.T_ID = context.Request["T_ID"];
                tre.M_ID = context.Request["M_ID"];
                tre.MP = context.Request["MP"];
                tre.MP_Name = context.Request["MP_Name"];
                tre.MP_COM = context.Request["MP_COM"];
                tre.MC = context.Request["MC"];
                tre.MC_Name = context.Request["MC_Name"];
                tre.MC_COM = context.Request["MC_COM"];
                tre.T_Item = context.Request["T_Item"];
                tre.Results_Item = context.Request["Results_Item"];
                tre.V_ID = context.Request["V_ID"];
                tre.V_Name = context.Request["V_Name"];
                tre.MT_COM = context.Request["MT_COM"];
                tre.T_PayMoney = context.Request["T_PayMoney"];
                tre.T_Type = context.Request["T_Type"];
                tre.T_PType = context.Request["T_PType"];
                tre.T_StartDate = context.Request["T_StartDate"];
                tre.T_EndDate = context.Request["T_EndDate"];
                tre.T_PauseDate = context.Request["T_PauseDate"];
                tre.T_AccountDate = context.Request["T_AccountDate"];
                tre.T_Status = context.Request["T_Status"];
                tre.T_Fax = context.Request["T_Fax"];
                tre.T_Media = context.Request["T_Media"];
                tre.XQ_SName = context.Request["XQ_SName"];
                tre.XQ_SPw = context.Request["XQ_SPw"];
                tre.T_PS = context.Request["T_PS"];
                tre.T_Message = context.Request["T_Message"];
                tre.Ccard_4Num = context.Request["Ccard_4Num"];
                tre.INV_tag = context.Request["INV_tag"];
                tre.INV_Createdate = context.Request["INV_Createdate"];
                tre.INV_Item = context.Request["INV_Item"];
                tre.INV_open_Item = context.Request["INV_open_Item"];
                tre.INV_ComName = context.Request["INV_ComName"];
                tre.INV_UnifyNum = context.Request["INV_UnifyNum"];
                tre.INV_MNum = context.Request["INV_MNum"];
                tre.INV_SendState = context.Request["INV_SendState"];
                tre.Light_Status = context.Request["Light_Status"];
                tre.Back_intag = context.Request["Back_intag"];
                tre.Back_Status = context.Request["Back_Status"];
                tre.Back_tag = context.Request["Back_tag"];
                tre.add_user = context.Request["add_user"];
                tre.add_ip = context.Request["add_ip"];
                context.Response.Write(sendMTRAT(tre));
                break;
            case "updateNormalEditTradeDetail":
                tre = new tradeRecordEntity();
                tre.T_ID = context.Request["T_ID"];
                tre.MP = context.Request["MP"];
                tre.MP_Name = context.Request["MP_Name"];
                tre.MP_COM = context.Request["MP_COM"];
                tre.MC = context.Request["MC"];
                tre.MC_Name = context.Request["MC_Name"];
                tre.MC_COM = context.Request["MC_COM"];

                tre.T_AccountDate = context.Request["T_AccountDate"];
                tre.T_PayMoney = context.Request["T_PayMoney"];
                tre.Light_Status = context.Request["Light_Status"];
                tre.Ccard_4Num = context.Request["Ccard_4Num"];
                tre.T_Item = context.Request["T_Item"];
                tre.T_StartDate = context.Request["T_StartDate"];
                tre.T_EndDate = context.Request["T_EndDate"];
                tre.T_Message = context.Request["T_Message"];
                tre.T_Fax = context.Request["T_Fax"];
                tre.T_Media = context.Request["T_Media"];
                tre.XQ_SName = context.Request["XQ_SName"];
                tre.XQ_SPw = context.Request["XQ_SPw"];
                tre.MT_COM = context.Request["T_Com"];
                tre.INV_open_Item = context.Request["INV_open_Item"];
                tre.INV_MNum = context.Request["INV_MNum"];
                tre.INV_tag = context.Request["INV_tag"];
                tre.INV_Createdate = context.Request["INV_Createdate"];
                tre.INV_Item = context.Request["INV_Item"];
                tre.INV_ComName = context.Request["INV_ComName"];
                tre.INV_UnifyNum = context.Request["INV_UnifyNum"];
                tre.INV_SendState = context.Request["INV_SendState"];
                tre.Back_intag = context.Request["Back_intag"];
                tre.Back_Status = context.Request["Back_Status"];
                tre.T_PS = context.Request["T_PS"];
                tre.edit_user = context.Request["edit_user"];
                tre.edit_ip = context.Request["edit_ip"];
                context.Response.Write(updateNormalEditTradeDetail(tre));
                break;

            case "reSendEditData":
                tre = new tradeRecordEntity();
                chargeDetailEntity cde1 = null;
                chargeDetailEntity cde2 = null;
                ElectronicCalculatorInvoiceDetailEntity ecide = null;
                tre.T_ID = context.Request["T_ID"];
                tre.M_ID = context.Request["M_ID"];

                tre.MP = context.Request["MP"];
                tre.MP_Name = context.Request["MP_Name"];
                tre.MP_COM = context.Request["MP_COM"];
                tre.MC = context.Request["MC"];
                tre.MC_Name = context.Request["MC_Name"];
                tre.MC_COM = context.Request["MC_COM"];
                tre.T_Item = context.Request["T_Item"];
                tre.T_PayMoney = context.Request["T_PayMoney"];
                tre.T_PType = context.Request["T_PType"];
                tre.T_Type = context.Request["T_Type"];
                tre.T_StartDate = context.Request["T_StartDate"];
                tre.T_EndDate = context.Request["T_EndDate"];
                if (tre.T_Type == "0002")
                {
                    tre.V_ID = context.Request["V_ID"];
                }
                tre.T_AccountDate = context.Request["T_AccountDate"];
                tre.T_PS = context.Request["T_PS"];
                tre.T_Message = context.Request["T_Message"];
                tre.T_Fax = context.Request["T_Fax"];
                tre.add_user = context.Request["add_user"];
                tre.add_ip = context.Request["add_ip"];

                if (tre.T_Type == "0001")
                {
                    cde1 = new chargeDetailEntity();
                    cde1.T_ID = tre.T_ID;
                    cde1.Account_Date = tre.T_AccountDate;
                    cde1.MC = tre.MC;
                    cde1.MC_Name = tre.MC_Name;
                    cde1.MC_Com = tre.MC_COM;
                    cde1.Account_Money = tre.T_PayMoney;
                    cde1.add_user = tre.add_user;
                    cde1.add_ip = tre.add_ip;
                }
                else if (tre.T_Type == "0002")
                {

                }
                else if (tre.T_Type == "0003")
                {
                    cde1 = new chargeDetailEntity();
                    cde2 = new chargeDetailEntity();
                    cde1.T_ID = tre.T_ID;
                    cde2.T_ID = tre.T_ID;
                    cde1.MC = tre.MC;
                    cde1.MC_Name = tre.MC_Name;
                    cde1.MC_Com = tre.MC_COM;

                    cde2.MC = context.Request["MC2"];
                    cde2.MC_Name = context.Request["MC_Name2"];
                    cde2.MC_Com = context.Request["MC_COM2"];
                    cde1.Account_Money = context.Request["T_AccountMoney1"];
                    cde2.Account_Money = context.Request["T_AccountMoney2"];
                    cde1.add_user = tre.add_user;
                    cde1.add_ip = tre.add_ip;
                    cde2.add_user = tre.add_user;
                    cde2.add_ip = tre.add_ip;
                }
                if (context.Request["OP_INV"] == "1" && context.Request["U_MDEP"] == "0009" && context.Request["U_POSITION"] == "0004")
                {
                    ecide = new ElectronicCalculatorInvoiceDetailEntity();
                    ecide.Invoice_State = "1";
                    ecide.M_id = tre.M_ID;
                    ecide.T_id = tre.T_ID;
                    ecide.Invoice_CreateDate = context.Request["INV_Createdate"];
                    ecide.Invoice_ComName = context.Request["Invoice_ComName"];
                    ecide.Invoice_UnifyNum = context.Request["Invoice_UnifyNum"];
                    ecide.edit_ip = tre.add_ip;
                    ecide.edit_user = tre.add_user;
                }
                context.Response.Write(reSendEditData(tre, cde1, cde2, ecide));
                break;
            case "seSendEditData":
                tre = new tradeRecordEntity();
                tre.T_ID = context.Request["T_ID"];
                tre.T_PauseDate = context.Request["T_PauseDate"];
                tre.T_PS = context.Request["T_PS"];
                tre.T_Status = context.Request["T_Status"];
                tre.edit_user = context.Request["edit_user"];
                tre.edit_ip = context.Request["edit_ip"];
                context.Response.Write(seSendEditData(tre));
                break;

            case "reseSendEditData":
                tre = new tradeRecordEntity();
                tre.T_ID = context.Request["T_ID"];
                tre.T_RestDate = context.Request["T_RestDate"];
                tre.T_EndDate = context.Request["T_EndDate"];

                tre.T_PS = context.Request["T_PS"];
                tre.T_Status = context.Request["T_Status"];
                tre.edit_user = context.Request["edit_user"];
                tre.edit_ip = context.Request["edit_ip"];
                context.Response.Write(reseSendEditData(tre));
                break;

            case "cddAddData":
                CDDDataEntity cdeee = new CDDDataEntity();
                cdeee.M_id = context.Request["M_id"];
                cdeee.CDD_date = context.Request["CDD_date"];
                cdeee.CDD_Note = context.Request["CDD_Note"];
                cdeee.OP01 = context.Request["OP01"];
                cdeee.OP02 = context.Request["OP02"];
                cdeee.OP03 = context.Request["OP03"];
                cdeee.OP04 = context.Request["OP04"];
                cdeee.CDD_Status = context.Request["CDD_Status"];
                cdeee.MC = context.Request["MC"];

                context.Response.Write(cddAddData(cdeee));
                break;
            case "updateMnumMpassword":
                M_ID = context.Request["M_ID"];
                M_Num = context.Request["M_Num"];
                string M_Password = context.Request["M_Password"];
                context.Response.Write(updateMnumMpassword(M_ID, M_Num, M_Password));
                break;
            case "hasMnum":
                M_Num = context.Request["M_Num"];
                context.Response.Write(hasMnum(M_Num));
                break;
            case "sendDTRAT":
                chargeDetailEntity cdee = new chargeDetailEntity();
                cdee.DT_ID = context.Request["DT_ID"];
                cdee.T_ID = context.Request["T_ID"];
                cdee.T_Com = context.Request["T_Com"];
                cdee.Pay_tag = context.Request["Pay_tag"];
                cdee.Account_Date = context.Request["Account_Date"];
                cdee.MC = context.Request["MC"];
                cdee.MC_Name = context.Request["MC_Name"];
                cdee.MC_Com = context.Request["MC_Com"];
                cdee.Account_Money = context.Request["Account_Money"];
                cdee.Pay_Type = context.Request["Pay_Type"];
                cdee.add_user = context.Request["add_user"];
                cdee.add_ip = context.Request["add_ip"];
                context.Response.Write(sendDTRAT(cdee));
                break;
            case "hasMTel":
                string MTel = context.Request["MTel"];
                context.Response.Write(hasMTel(MTel));
                break;
            case "saveEditCustomerDataRecord":
                editCustomerDataRecord ecdr = new editCustomerDataRecord();
                ecdr.Log_Item = context.Request["Log_Item"];
                ecdr.M_ID = context.Request["M_ID"];
                ecdr.T_ID = context.Request["T_ID"];
                ecdr.M_Row = context.Request["M_Row"];
                ecdr.M_text = context.Request["M_text"];
                ecdr.edit_user = context.Request["edit_user"];
                context.Response.Write(saveEditCustomerDataRecord(ecdr));
                break;
            case "saveEditCustomerMCdataRecord":
                editCustomerMCdataRecord ecmdr = new editCustomerMCdataRecord();
                ecmdr.M_ID = context.Request["M_ID"];
                ecmdr.old_MC = context.Request["old_MC"];
                ecmdr.old_MC_Name = context.Request["old_MC_Name"];
                ecmdr.old_MC_Com = context.Request["old_MC_Com"];
                ecmdr.New_MC = context.Request["New_MC"];
                ecmdr.New_MC_Name = context.Request["New_MC_Name"];
                ecmdr.New_MC_Com = context.Request["New_MC_Com"];
                ecmdr.Chg_PS = context.Request["Chg_PS"];
                ecmdr.Chg_User = context.Request["Chg_User"];

                context.Response.Write(saveEditCustomerMCdataRecord(ecmdr));
                break;
            //業務聯絡單-新增動作
            //case "addBusinessConnection":
            //    businessConnectionEntity bce = new businessConnectionEntity();
            //    bce.M_ID = context.Request["M_ID"];
            //    bce.CF_Item = context.Request["CF_Item"];
            //    bce.CellPhone = context.Request["CellPhone"];
            //    bce.Mess = context.Request["Mess"];
            //    bce.Fax = context.Request["Fax"];
            //    bce.Attach_User = context.Request["Attach_User"];
            //    bce.Attach_Name = context.Request["Attach_Name"];
            //    bce.Attach_Com = context.Request["Attach_Com"];
            //    bce.CMonth = context.Request["CMonth"];
            //    bce.Other = context.Request["Other"];
            //    bce.C_tag = context.Request["C_tag"];
            //    bce.U_Agent = context.Request["U_Agent"];
            //    bce.U_Agent_Name = context.Request["U_Agent_Name"];
            //    bce.U_Agent_Com = context.Request["U_Agent_Com"];
            //    bce.U_Leader = context.Request["U_Leader"];
            //    bce.U_LeaderCom = context.Request["U_LeaderCom"];
            //    bce.U_LeaderName = context.Request["U_LeaderName"];
            //    bce.Obj = context.Request["Obj"];
            //    bce.F_Status = context.Request["F_Status"];
            //    bce.PS = context.Request["PS"];
            //    bce.add_user = context.Request["add_user"];
            //    bce.add_com = context.Request["add_com"];
            //    bce.add_ip = context.Request["add_ip"];
            //    bce.MP_ID = context.Request["MP_ID"];
            //    bce.MP_Item = context.Request["MP_Item"];
            //    bce.Results_Item = context.Request["Results_Item"];
            //    bce.Paymoney = context.Request["Paymoney"];
            //    bce.Paymoney1 = context.Request["Paymoney1"];
            //    bce.Paymoney2 = context.Request["Paymoney2"];
            //    bce.T_PType = context.Request["T_PType"];
            //    bce.T_PType1 = context.Request["T_PType1"];
            //    bce.T_PType2 = context.Request["T_PType2"];
            //    bce.T_Type = context.Request["T_Type"];
            //    bce.PT_Item = context.Request["PT_Item"];
            //    bce.V_ID = context.Request["V_ID"];
            //    bce.V_Name = context.Request["V_Name"];
            //    bce.Special1_user = context.Request["Special1_user"];
            //    bce.Special1_userName = context.Request["Special1_userName"];
            //    bce.Special1_usercom = context.Request["Special1_usercom"];
            //    bce.Special2_user = context.Request["Special2_user"];
            //    bce.Special2_userName = context.Request["Special2_userName"];
            //    bce.Special2_usercom = context.Request["Special2_usercom"];
            //    bce.Special3_user = context.Request["Special3_user"];
            //    bce.Special3_userName = context.Request["Special3_userName"];
            //    bce.Special3_usercom = context.Request["Special3_usercom"];
            //    bce.T_accountmoney1 = context.Request["T_accountmoney1"];
            //    bce.T_accountmoney2 = context.Request["T_accountmoney2"];
            //    bce.T_accountmoney3 = context.Request["T_accountmoney3"];
            //    bce.begindate_Date = context.Request["begindate_Date"];
            //    bce.enddate_Date = context.Request["enddate_Date"];
            //    bce.Media = context.Request["Media"];
            //    bce.ATM = context.Request["ATM"];
            //    bce.INV_Open_Item = context.Request["INV_Open_Item"];
            //    bce.T_Ivo = context.Request["T_Ivo"];
            //    bce.INV_ITEM = context.Request["INV_ITEM"];
            //    bce.COMNAME = context.Request["COMNAME"];
            //    bce.INV_ITEM_UnifyNum = context.Request["INV_ITEM_UnifyNum"];
            //    bce.CCard_4Num = context.Request["CCard_4Num"];
            //    bce.ca_id = context.Request["ca_id"];
            //    bce.S_tag = context.Request["S_tag"];
            //    bce.S_ID = context.Request["S_ID"];
            //    bce.S_Name = context.Request["S_Name"];
            //    string SSDate = context.Request["SSDate"];
            //    if (!common.isEmpty(SSDate))
            //    {
            //        string[] bd = SSDate.Split('/');
            //        bce.SSDate = bd[0] + "-" + bd[1] + "-" + bd[2] + " " + "00:00:00.000";
            //    }
            //    else
            //    {
            //        bce.SSDate = null;
            //    }
            //    bce.B_Paymoney = context.Request["B_Paymoney"];
            //    bce.B_ID = context.Request["B_ID"];
            //    bce.B_Name = context.Request["B_Name"];

            //    bce.T_ID = context.Request["T_ID"];
            //    bce.T_Name = context.Request["T_Name"];
            //    bce.D_MP = context.Request["D_MP"];
            //    bce.D_Item = context.Request["D_Item"];
            //    bce.D_Type = context.Request["D_Type"];
            //    bce.D_Paymoney = context.Request["D_Paymoney"];
            //    bce.D_tag = context.Request["D_tag"];
            //    string DSdate = context.Request["DSdate"];
            //    if (!common.isEmpty(DSdate))
            //    {
            //        string[] bd = DSdate.Split('/');
            //        bce.DSdate = bd[0] + "-" + bd[1] + "-" + bd[2] + " " + "00:00:00.000";
            //    }
            //    else
            //    {
            //        bce.DSdate = null;
            //    }

            //    string DEdate = context.Request["DEdate"];
            //    if (!common.isEmpty(DEdate))
            //    {
            //        string[] bd = DEdate.Split('/');
            //        bce.DEdate = bd[0] + "-" + bd[1] + "-" + bd[2] + " " + "00:00:00.000";
            //    }
            //    else
            //    {
            //        bce.DEdate = null;
            //    }
            //    context.Response.Write(addBusinessConnection(bce));
            //    break;
            case "addCallRecordDetail":
                cre = new callRecordEntity();
                cre.M_ID = context.Request["M_ID"];
                cre.Q_Date = context.Request["Q_Date"];
                cre.Question = context.Request["Question"];
                cre.N_Date = context.Request["N_Date"];
                cre.N_Item = context.Request["N_Item"];
                cre.Add_User = context.Request["Add_User"];
                context.Response.Write(addCallRecordDetail(cre));
                break;
            case "deleteCallRecordDetail":
                string Auto_id = context.Request["Auto_id"];
                context.Response.Write(deleteCallRecordDetail(Auto_id));
                break;
            case "editCallRecordDetail":
                cre = new callRecordEntity();
                cre.Auto_id = context.Request["Auto_id"];
                cre.Q_Date = context.Request["Q_Date"];
                cre.Question = context.Request["Question"];
                cre.N_Date = context.Request["N_Date"];
                cre.N_Item = context.Request["N_Item"];
                cre.Add_User = context.Request["Add_User"];
                context.Response.Write(editCallRecordDetail(cre));
                break;
            case "deleteChargeDetail":
                string DT_ID = context.Request["DT_ID"];
                context.Response.Write(deleteChargeDetail(DT_ID));
                break;
            case "getKeywordList":
                string keyWord = context.Request["keyWord"];
                context.Response.Write(getKeywordList(keyWord));
                break;
            case "getIddataByMid":
                M_ID = context.Request["M_ID"];
                context.Response.Write(getIddataByMid(M_ID));
                break;
            case "getCustomerDataByMid":
                M_ID = context.Request["M_ID"];
                context.Response.Write(getCustomerDataByMid(M_ID));
                break;
            case "getMCdata":
                MC = context.Request["MC"];
                context.Response.Write(getMCdata(MC));
                break;
            case "getAnalystForCashFlow":
                string ComID2 = context.Request["ComID"];
                context.Response.Write(getAnalystForCashFlow(ComID2));
                break;
            case "getAnalystItem":
                string analyst = context.Request["analyst"];
                context.Response.Write(getAnalystItem(analyst));
                break;
            case "SendAddcfasDataFuc":
                SendAddcfasDataParamEntity saCFASdpe = new SendAddcfasDataParamEntity();
                saCFASdpe.M_id = context.Request["M_id"];
                saCFASdpe.MC = context.Request["MC"];
                saCFASdpe.MC_name = context.Request["MC_name"];
                saCFASdpe.mc_com = context.Request["mc_com"];
                saCFASdpe.Pay_Serial = context.Request["Pay_Serial"];
                saCFASdpe.P_Name = context.Request["P_Name"];
                saCFASdpe.Price = context.Request["Price"];
                saCFASdpe.VerifyNo = context.Request["VerifyNo"];
                saCFASdpe.SExpenses = context.Request["SExpenses"];
                saCFASdpe.TExpenses = context.Request["TExpenses"];
                saCFASdpe.CExpenses = context.Request["CExpenses"];
                saCFASdpe.OExpenses = context.Request["OExpenses"];

                saCFASdpe.T_id = context.Request["T_id"];
                saCFASdpe.mp_item = context.Request["mp_item"];
                saCFASdpe.C_name = context.Request["C_name"];
                saCFASdpe.C_Email = context.Request["C_Email"];
                saCFASdpe.C_Tel = context.Request["C_Tel"];
                string T_Sdate = context.Request["T_Sdate"];
                if (!common.isEmpty(T_Sdate))
                {
                    string[] bd = T_Sdate.Split('/');
                    saCFASdpe.T_Sdate = bd[0] + "-" + bd[1] + "-" + bd[2] + " " + "00:00:00.000";
                }
                else
                {
                    saCFASdpe.T_Sdate = null;
                }

                string T_Edate = context.Request["T_Edate"];
                if (!common.isEmpty(T_Edate))
                {
                    string[] bd = T_Edate.Split('/');
                    saCFASdpe.T_Edate = bd[0] + "-" + bd[1] + "-" + bd[2] + " " + "00:00:00.000";
                }
                else
                {
                    saCFASdpe.T_Edate = null;
                }
                saCFASdpe.EffectiveDate = context.Request["EffectiveDate"] + " " + "00:00:00.000";
                saCFASdpe.SalesName = context.Request["SalesName"];
                saCFASdpe.HeadsSign = context.Request["HeadsSign"];
                saCFASdpe.adminSign = context.Request["adminSign"];
                saCFASdpe.PS = context.Request["PS"].Trim();
                saCFASdpe.Pay_Tag = context.Request["Pay_Tag"];
                saCFASdpe.add_user = context.Request["add_user"];
                saCFASdpe.add_com = context.Request["add_com"];
                context.Response.Write(SendAddcfasData(saCFASdpe));
                break;

            case "setWebFax":
                M_ID = context.Request["M_ID"];
                string add_ip = context.Request["add_ip"];
                string T_id = context.Request["T_id"];

                context.Response.Write(setWebFax(T_id, add_ip, M_ID));
                break;
            case "getFileDataList":
                T_ID = context.Request["T_ID"];
                context.Response.Write(getFileDataList(T_ID));
                break;
        }
    }

    public string getSelectEmplist(string U_MDEP, string ComID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'gcp' :"+gcp.ToString(), className, methodName);

        List<ditcodedescEntity> cdeList = customerManageService.Instance.getSelectEmplist(U_MDEP, ComID);//<==========

        log.endWrite(cdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cdeList);
    }


    /// <summary>
    /// 取得客戶資料列
    /// </summary>
    /// <returns></returns>
    public string getCustomerDataHtml(getCustormerParams gcp)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'gcp' :" + gcp.ToString(), className, methodName);

        List<customerDataEntity> cdeList = customerManageService.Instance.getCustomerData(gcp);//<==========

        log.endWrite(cdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cdeList);

    }


    /// <summary>
    /// 取得今日聯絡事項
    /// </summary>
    /// <returns>取得今日聯絡事項</returns>
    public string getTodayConnectionMatterHtml(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        StringBuilder html = new StringBuilder();
        //string U_Num = "A0312016";//測試 
        List<todayConnectionMatterEntity> tcmeList = indexService.Instance.getTodayConnectionMatter(U_Num);//<====

        if (tcmeList.Count == 0)
        {
            html.Append("<th style='text-align:center' colspan='6'>無近日聯絡事項</th></tr>");
        }
        else
        {

            for (var i = 0; i < tcmeList.Count; i++)
            {
                html.Append("<tr align = 'center' class='12-k'><td style='text-align:center'>");
                html.Append(i + 1);
                html.Append("</td><td style='text-align:center'>");
                html.Append(common.dateTimeToDate(tcmeList[i].N_Date));
                html.Append("</td><td style='text-align:center'>");
                if (tcmeList[i].M_ID.Length > 0)
                {
                    if (tcmeList[i].MMBERm_idEqualMQUSTm_ID)
                    {
                        html.Append("<a class='BlueLink10' href='../MPMMBER/MMBER_Detail.asp?M_ID=");
                        html.Append(tcmeList[i].M_ID);
                        html.Append("' target='");
                        html.Append(tcmeList[i].M_ID);
                        html.Append("'>");
                        html.Append(tcmeList[i].M_Name);
                        html.Append("</a>");
                    }

                }
                else
                {
                    html.Append(tcmeList[i].Q_Name);
                }
                html.Append("</td><td align ='left'>");

                if (tcmeList[i].MITEMditcodeEqualMQUSTn_Item)
                {
                    html.Append("<b>【");
                    html.Append(tcmeList[i].ddesc);
                    html.Append("】</b>");
                }

                html.Append("<br>");
                html.Append(tcmeList[i].Question);
                html.Append("</td><td style='text-align:center'>");
                if (tcmeList[i].Add_User == U_Num)
                {

                    html.Append(tcmeList[i].U_Name);

                }
                html.Append("</td><td></td>");
            }
        }

        log.endWrite(html.ToString(), className, methodName);
        return html.ToString();
    }

    /// <summary>
    /// 取得單一客戶資料
    /// </summary>
    /// <param name="M_ID"></param>
    /// <returns></returns>
    public string getCustomerData(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' :" + M_ID, className, methodName);
        string backString = string.Empty;
        getCustormerParams gcp = new getCustormerParams();
        gcp.M_ID = M_ID;
        List<customerDataEntity> cdeList = customerManageService.Instance.getCustomerData(gcp);//<==========
                                                                                               //cdeList[0].BirthDay_Date = (cdeList[0].BirthDay_Date.Split(' '))[0];
        log.endWrite(cdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cdeList);
    }

    /// <summary>
    /// 查詢是否長注記過
    /// </summary>
    /// <param name="M_ID"></param>
    /// <param name="U_Num"></param>
    /// <returns></returns>
    public bool isLongTag(string M_ID, string U_Num, string tagType)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' :" + M_ID + "&'U_Num' :" + U_Num + "&'tagType' :" + tagType, className, methodName);
        List<DMBERentity> deList = customerManageService.Instance.isLongTag(M_ID, U_Num, tagType);//<==========
        bool hasTag = true;
        if (deList.Count == 0)
        {
            hasTag = false;
        }
        log.endWrite(common.nothing, className, methodName);
        return hasTag;
    }


    public void doLongTag(string M_ID, string MC, string MC_Name, string MC_Com, string Light_Status)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'M_ID' : {0}, 'MC' : {1}, 'MC_Name' : {2}, 'MC_Com' : {3}, 'Light_Status' : {4}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, M_ID, MC, MC_Name, MC_Com, Light_Status));
        log.startWrite(sb.ToString(), className, methodName);
        customerManageService.Instance.doLongTag(M_ID, MC, MC_Name, MC_Com, Light_Status);//<==========

        log.endWrite(common.nothing, className, methodName);

    }

    public string getTagHistory(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID':" + M_ID, className, methodName);
        //測試
        // M_ID = "1330942049527";
        List<DMBERentity> deList = customerManageService.Instance.getTagHistory(M_ID);//<==========

        log.endWrite(deList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(deList);
    }

    public string getKYC(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID':" + M_ID, className, methodName);

        string Kid = customerManageService.Instance.getKYC(M_ID);//<==========

        log.endWrite(Kid, className, methodName);
        return Kid;
    }

    public string getCDD(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID':" + M_ID, className, methodName);

        string Kid = customerManageService.Instance.getCDD(M_ID);//<==========

        log.endWrite(Kid, className, methodName);
        return Kid;
    }
    //here
    public string getCDDlist(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID':" + M_ID, className, methodName);

        List<CDDDataEntity> cdddeList = customerManageService.Instance.getCDDlist(M_ID);//<==========

        log.endWrite(cdddeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cdddeList);
    }





    /// <summary>
    /// 新增客戶資料
    /// </summary>
    /// <param name="cde"></param>
    public string addEditCustomerData(customerDataEntity cde, string addEditType)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(cde.ToString(), className, methodName);

        string backString = customerManageService.Instance.addEditCustomerData(cde, addEditType);//<==========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;

    }

    /// <summary>
    /// 取得交易紀錄
    /// </summary>
    /// <param name="M_ID"></param>
    /// <returns></returns>
    public string getTradeRecord(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("M_ID=" + M_ID, className, methodName);

        List<tradeRecordEntity> treList = customerDetailService.Instance.getTradeRecord(M_ID);//<==========

        log.endWrite(treList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(treList);

    }

    /// <summary>
    /// 取得收費明細
    /// </summary>
    /// <param name="T_ID"></param>
    /// <returns></returns>
    public string getChargeDetailList(string T_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("T_ID=" + T_ID, className, methodName);

        List<chargeDetailEntity> cdeList = customerDetailService.Instance.getChargeDetailList(T_ID);//<==========

        log.endWrite(cdeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cdeList);

    }


    /// <summary>
    /// 取得通話紀錄
    /// </summary>
    /// <param name="M_ID"></param>
    /// <returns></returns>
    public string getCallRecordList(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("M_ID=" + M_ID, className, methodName);

        List<callRecordEntity> treList = customerDetailService.Instance.getCallRecordList(M_ID);//<==========

        log.endWrite(treList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(treList);

    }

    /// <summary>
    /// 取得活動資料
    /// </summary>
    /// <param name="M_Tel"></param>
    /// <returns></returns>
    public string getActivityMessageList(string M_Tel)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("M_Tel=" + M_Tel, className, methodName);

        List<activityMessageEntity> cmeList = customerDetailService.Instance.getActivityMessageList(M_Tel);//<==========

        log.endWrite(cmeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cmeList);

    }
    /// <summary>
    /// 取得訂金資料
    /// </summary>
    /// <param name="M_ID"></param>
    /// <returns></returns>
    public string getDownpayment(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("M_ID=" + M_ID, className, methodName);

        downPaymentEntity dpe = customerDetailService.Instance.getDownpayment(M_ID);//<==========

        log.endWrite(dpe.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(dpe);

    }
    /// <summary>
    /// 刪除業務聯絡單資料
    /// </summary>
    /// <param name="f_id"></param>
    /// <returns></returns>
    public string deleteMPMCOTFData(string f_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("f_id=" + f_id, className, methodName);

        string backString = customerManageService.Instance.deleteMPMCOTFData(f_id);//<==========

        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }
    /// <summary>
    /// 刪除客戶資料
    /// </summary>
    /// <param name="M_ID"></param>
    /// <returns></returns>
    public string deleteCustomerData(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("M_ID=" + M_ID, className, methodName);

        string backString = customerManageService.Instance.deleteCustomerData(M_ID);//<==========

        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }


    public string getAppointData(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("M_ID=" + M_ID, className, methodName);

        List<appointDataEntity> adeList = customerManageService.Instance.getAppointData(M_ID);//<==========

        log.endWrite("adeList : " + adeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(adeList);
    }
    /// <summary>
    /// 刪除交易紀錄
    /// </summary>
    /// <param name="T_ID"></param>
    /// <returns></returns>
    public string deleteTradeRecordDetail(string T_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("T_ID=" + T_ID, className, methodName);

        string backString = customerDetailService.Instance.deleteTradeRecordDetail(T_ID);//<==========

        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }

    public string sendMTRAT(tradeRecordEntity tre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("tre=" + tre.ToString(), className, methodName);

        string backString = customerDetailService.Instance.sendMTRAT(tre);//<==========

        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }

    public string updateNormalEditTradeDetail(tradeRecordEntity tre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("tre=" + tre.ToString(), className, methodName);

        string backString = customerDetailService.Instance.updateNormalEditTradeDetail(tre);//<==========

        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }

    public string reSendEditData(tradeRecordEntity tre, chargeDetailEntity cde1, chargeDetailEntity cde2, ElectronicCalculatorInvoiceDetailEntity ecide)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("tre=" + tre + "&cde1=" + cde1 + "&cde2=" + cde2 + "ecide=" + ecide, className, methodName);

        string backString = customerDetailService.Instance.reSendEditData(tre, cde1, cde2, ecide);//<==========

        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }

    public string seSendEditData(tradeRecordEntity tre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("tre=" + tre.ToString(), className, methodName);

        string backString = customerDetailService.Instance.seSendEditData(tre);//<==========

        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }

    public string reseSendEditData(tradeRecordEntity tre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("tre=" + tre.ToString(), className, methodName);

        string backString = customerDetailService.Instance.reseSendEditData(tre);//<==========

        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }

    public string cddAddData(CDDDataEntity cdee)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("cdee=" + cdee.ToString(), className, methodName);

        string backString = customerDetailService.Instance.cddAddData(cdee);//<==========

        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }

    /// <summary>
    /// 修改會員編號及密碼
    /// </summary>
    /// <param name="M_ID"></param>
    /// <param name="M_Num"></param>
    /// <param name="M_Password"></param>
    /// <returns></returns>
    public string updateMnumMpassword(string M_ID, string M_Num, string M_Password)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'M_ID' : {0}, 'M_Num' : {1}, 'M_Password' : {2}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, M_ID, M_Num, M_Password));
        log.startWrite(sb.ToString(), className, methodName);


        string backString = customerDetailService.Instance.updateMnumMpassword(M_ID, M_Num, M_Password); //<==========

        log.endWrite("'backString' :" + backString, className, methodName);
        return backString;
    }

    /// <summary>
    /// 查詢是否有會員編號
    /// </summary>
    /// <param name="M_Num"></param>
    /// <returns></returns>
    public string hasMnum(string M_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_Num' :" + M_Num, className, methodName);


        string backString = customerDetailService.Instance.hasMnum(M_Num); //<==========

        log.endWrite("'backString' :" + backString, className, methodName);
        return backString;
    }

    /// <summary>
    /// 新增交易明細
    /// </summary>
    /// <param name="cde"></param>
    /// <returns></returns>
    public string sendDTRAT(chargeDetailEntity cde)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(cde.ToString(), className, methodName);

        string backString = customerDetailService.Instance.sendDTRAT(cde);//<==========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;

    }


    /// <summary>
    /// 查詢是否有此手機號碼
    /// </summary>
    /// <param name="MTelList"></param>
    /// <returns></returns>
    public string hasMTel(string MTel)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MTel' : " + MTel, className, methodName);

        string backString = customerManageService.Instance.hasMTel(MTel);//<==========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;

    }

    /// <summary>
    /// 儲存修改客戶基本資料的歷程
    /// </summary>
    /// <param name="ecdr"></param>
    /// <returns></returns>
    public string saveEditCustomerDataRecord(editCustomerDataRecord ecdr)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ecdr' : " + ecdr.ToString(), className, methodName);

        string backString = customerDetailService.Instance.saveEditCustomerDataRecord(ecdr);//<==========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }


    /// <summary>
    /// 儲存修改客戶業務員的歷程
    /// </summary>
    /// <param name="ecmdr"></param>
    /// <returns></returns>
    public string saveEditCustomerMCdataRecord(editCustomerMCdataRecord ecmdr)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ecmdr' : " + ecmdr.ToString(), className, methodName);

        string backString = customerDetailService.Instance.saveEditCustomerMCdataRecord(ecmdr);//<==========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    //getDiscountData
    //取得選擇折讓資料
    public string getDiscountData(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : " + M_ID.ToString(), className, methodName);

        //List<haltResumeEntity> hRList = customerManageService.Instance.getCaseData(M_ID);//<=========
        List<discountDataEntity> hRList = appointOriginalArchiveService.Instance.getDiscountData(M_ID);//<=========
                                                                                                       //appointOriginalArchiveService
                                                                                                       //string backString = customerManageService.Instance.getCaseData(M_ID);//<==========

        log.endWrite("adeList : " + hRList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(hRList);
    }
    public string getCDD_tag_html_Value(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : " + M_ID.ToString(), className, methodName);
        //透過M_ID在MMBER中取得 CDD_tag
        string CDD_tag =MMBERService.Instance.getCDD_tag(M_ID);
        //return M_SD_tag;
        return Newtonsoft.Json.JsonConvert.SerializeObject(CDD_tag);
    }
    public string getKYC_tag_html_Value(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : " + M_ID.ToString(), className, methodName);
        //透過M_ID在MMBER中取得 KYC_tag
        string KYC_tag =MMBERService.Instance.getKYC_tag(M_ID);
        //return M_SD_tag;
        return Newtonsoft.Json.JsonConvert.SerializeObject(KYC_tag);
    }
    public string getID_tag_html_Value(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : " + M_ID.ToString(), className, methodName);
        //透過M_ID在MMBER中取得 M_SD_tag
        string ID_tag =MMBERService.Instance.getID_tag(M_ID);
        //return M_SD_tag;
        return Newtonsoft.Json.JsonConvert.SerializeObject(ID_tag);
    }


    /**/
    //string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //log.startWrite("M_ID=" + M_ID, className, methodName);

    //List<appointDataEntity> adeList = customerManageService.Instance.getAppointData(M_ID);//<==========

    //log.endWrite("adeList : " + adeList.ToString(), className, methodName);
    //return Newtonsoft.Json.JsonConvert.SerializeObject(adeList);
    //getCaseData

    //取得退費案件資料

    //取得選擇暫停/恢復資料
    public string getCaseData(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : " + M_ID.ToString(), className, methodName);

        //List<haltResumeEntity> hRList = customerManageService.Instance.getCaseData(M_ID);//<=========
        List<haltResumeEntity> hRList = appointOriginalArchiveService.Instance.getCaseData(M_ID);//<=========
                                                                                                 //appointOriginalArchiveService
                                                                                                 //string backString = customerManageService.Instance.getCaseData(M_ID);//<==========

        log.endWrite("adeList : " + hRList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(hRList);
    }
    /// <summary>
    /// 新增業務聯絡單動作
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


    /// <summary>
    /// 新增通話紀錄
    /// </summary>
    /// <param name="bce"></param>
    /// <returns></returns>
    public string addCallRecordDetail(callRecordEntity cre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'cre' : " + cre.ToString(), className, methodName);

        string backString = customerDetailService.Instance.addCallRecordDetail(cre);//<==========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }


    /// <summary>
    /// 刪除通話紀錄
    /// </summary>
    /// <param name="Auto_id"></param>
    /// <returns></returns>
    public string deleteCallRecordDetail(string Auto_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Auto_id' : " + Auto_id, className, methodName);

        string backString = customerDetailService.Instance.deleteCallRecordDetail(Auto_id);//<==========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    /// <summary>
    /// 修改通話紀錄
    /// </summary>
    /// <param name="Auto_id"></param>
    /// <returns></returns>
    public string editCallRecordDetail(callRecordEntity cre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'cre' : " + cre.ToString(), className, methodName);

        string backString = customerDetailService.Instance.editCallRecordDetail(cre);//<==========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    /// <summary>
    /// 刪除收費明細
    /// </summary>
    /// <param name="Auto_id"></param>
    /// <returns></returns>
    public string deleteChargeDetail(string DT_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'DT_ID' : " + DT_ID, className, methodName);

        string backString = customerDetailService.Instance.deleteChargeDetail(DT_ID);//<==========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    /// <summary>
    /// 設定網路傳真
    /// </summary>
    /// <param name="M_ID"></param>
    /// <returns></returns>
    public string setWebFax(string T_id, string add_ip, string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'T_id' : " + T_id + "'add_ip' : " + add_ip + "'M_ID' : " + M_ID, className, methodName);

        string backString = customerDetailService.Instance.setWebFax(T_id, add_ip, M_ID);//<==========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    public string getFileDataList(string T_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'T_id' : " + T_id, className, methodName);

        List<uploadFileEntity> ufeList = UploadFilehgDao.Instance.getFileDataList(T_id);//<==========

        log.endWrite("'ufeList' : " + ufeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ufeList);
    }

    public string getKeywordList(string keyWord)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'keyWord' : " + keyWord, className, methodName);

        List<string> strList = customerManageService.Instance.getKeywordList(keyWord);//<==========

        log.endWrite("'strList' : " + strList, className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(strList);
    }

    public string getIddataByMid(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : " + M_ID, className, methodName);

        List<idCheckEntity> iceList = customerManageService.Instance.getIddataByMid(M_ID);//<==========

        log.endWrite("'iceList.Count.ToString()' : " + iceList.Count.ToString(), className, methodName);
        return iceList.Count.ToString();
    }


    public string getCustomerDataByMid(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : " + M_ID, className, methodName);

        customerDataEntity cde = customerManageService.Instance.getCustomerDataByMid(M_ID);//<==========

        log.endWrite("'cde' : " + cde.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cde);
    }

    public string getMCdata(string MC)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MC' : " + MC, className, methodName);

        mcDataEntity mde = customerManageService.Instance.getMCdata(MC);//<==========

        log.endWrite("'mde' : " + mde.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(mde);
    }

    public string getAnalystForCashFlow(string ComID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID' : " + ComID, className, methodName);

        List<indexBDdataEntity> ibddeList = MUSERhgDao.Instance.getAnalystList(ComID);

        log.endWrite("'ibddeList' : " + ibddeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ibddeList);
    }

    public string getAnalystItem(string analyst)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'analyst' : " + analyst, className, methodName);

        List<ditcodedescEntity> ibddeList = MITEMhgDao.Instance.getditcodedescEntityList(analyst);

        log.endWrite("'ibddeList' : " + ibddeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ibddeList);
    }


    public string SendAddcfasData(SendAddcfasDataParamEntity saCFASdpe)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'saCFASdpe' : " + saCFASdpe.ToString(), className, methodName);

        string backStr = customerDetailService.Instance.SendAddcfasData(saCFASdpe);

        log.endWrite("'backStr' : " + backStr, className, methodName);
        return backStr;
    }


    /// <summary>
    /// 查詢區鄉鎮列表
    /// </summary>
    /// <returns></returns>
    /* public string getTownList(string cityCode)
     {
         string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
         log.startWrite("cityCode :"+cityCode, className, methodName);
         string[] city = { "台北市", "基隆市", "新北市", "宜蘭縣", "新竹市", "新竹縣",
         "桃園市", "苗栗縣", "台中市", "彰化縣", "南投縣", "嘉義市", "嘉義縣",
       "雲林縣", "台南市", "高雄市","澎湖縣", "屏東縣", "台東縣", "花蓮縣",
         "金門縣", "連江縣", "南海諸島", "釣魚台列嶼"};
         List<string []> ZoneList = new List<string[]>();
         // for "台北市"
         string[] Zone = {"中正區", "大同區", "中山區", "松山區", "大安區",
             "萬華區", "信義區", "士林區", "北投區", "內湖區", "南港區", "文山區" };
         ZoneList.Add(Zone);
         // for "基隆市"
         string[] Zone1 = {"仁愛區", "信義區", "中正區", "中山區", "安樂區",
             "暖暖區", "七堵區" };
         ZoneList.Add(Zone1);
         // for "新北市"
         string[] Zone2 = {"萬里區", "金山區", "板橋區", "汐止區", "深坑區", "石碇區", "瑞芳區",
             "平溪區", "雙溪區", "貢寮區", "新店區", "坪林區", "烏來區", "永和區", "中和區", "土城區",
             "三峽區", "樹林區", "鶯歌區", "三重區", "新莊區", "泰山區", "林口區", "蘆洲區", "五股區",
             "八里區", "淡水區", "三芝區", "石門區"};
         ZoneList.Add(Zone2);
         // for "宜蘭縣"
         string[] Zone3 = {"宜蘭市", "頭城鎮", "礁溪鄉", "壯圍鄉", "員山鄉", "羅東鎮", "三星鄉",
             "大同鄉", "五結鄉", "冬山鄉", "蘇澳鎮", "南澳鄉"};
         ZoneList.Add(Zone3);
         // for "新竹市"
         string[] Zone4 = { "東區", "北區", "香山區" };
         ZoneList.Add(Zone4);
         // for "新竹市"
         string[] Zone5 = {"竹北市", "湖口鄉", "新豐鄉", "新埔鎮", "關西鎮", "芎林鄉", "寶山鄉",
             "竹東鎮", "五峰鄉", "橫山鄉", "尖石鄉", "北埔鄉", "峨嵋鄉"};
         ZoneList.Add(Zone5);
         // for "桃園市"
         string[] Zone6 = {"中壢區", "平鎮區", "龍潭區", "楊梅區", "新屋區", "觀音區", "桃園區",
             "龜山區", "八德區", "大溪區", "復興區", "大園區", "蘆竹區"};
         ZoneList.Add(Zone6);
         // for "苗栗縣"
         string[] Zone7 = {"竹南鎮", "頭份鎮", "三灣鄉", "南庄鄉", "獅潭鄉", "後龍鎮", "通霄鎮",
             "苑裡鎮", "苗栗市", "造橋鄉", "頭屋鄉", "公館鄉", "大湖鄉", "泰安鄉", "銅鑼鄉", "三義鄉",
             "西湖鄉", "卓蘭鄉"};
         ZoneList.Add(Zone7);
         // for "台中市"
         string[] Zone8 = {"中區", "東區", "南區", "西區", "北區", "北屯區", "西屯區", "南屯區",
         "太平區", "大里區", "霧峰區", "烏日區", "豐原區", "后里區", "石岡區", "東勢區", "和平區",
         "新社區", "潭子區", "大雅區", "神岡區", "大肚區", "沙鹿區", "龍井區", "梧棲區", "清水區",
         "大甲區", "外埔區", "大安區"};
         ZoneList.Add(Zone8);
         // for "彰化縣"
         string[] Zone9 = {"彰化市", "芬園鄉", "花壇鄉", "秀水鄉", "鹿港鎮", "福興鄉", "線西鄉",
             "和美鎮", "伸港鄉", "員林鎮", "社頭鄉", "永靖鄉", "埔心鄉", "溪湖鎮", "大村鄉", "埔鹽鄉",
             "田中鎮", "北斗鎮", "田尾鄉", "埤頭鄉", "溪州鄉", "竹塘鄉", "二林鎮", "大城鄉", "芳苑鄉",
             "二水鄉"};
         ZoneList.Add(Zone9);
         // for "南投縣"
         string[] Zone10 = {"南投市", "中寮鄉", "草屯鎮", "國姓鄉", "埔里鎮", "仁愛鄉", "名間鄉",
             "集集鄉", "水里鄉", "魚池鄉", "信義鄉", "竹山鎮", "鹿谷鄉"};
         ZoneList.Add(Zone10);
         // for "嘉義市"
         string[] Zone11 = { "東區", "西區" };
         ZoneList.Add(Zone11);
         // for "嘉義縣"
         string[] Zone12 = {"番路鄉", "梅山鄉", "竹崎鄉", "阿里山鄉", "中埔鄉", "大埔鄉",
         "水上鄉", "鹿草鄉", "太保市", "朴子市", "東石鄉", "六腳鄉", "新港鄉", "民雄鄉", "大林鎮", "溪口鄉",
         "義竹鄉", "布袋鎮"};
         ZoneList.Add(Zone12);
         // for "雲林縣"
         string[] Zone13 = {"斗南鎮", "大埤鄉", "虎尾鎮", "土庫鎮", "褒忠鄉", "東勢鄉", "臺西鄉",
             "崙背鄉", "麥寮鄉", "斗六市", "林內鄉", "古坑鄉", "莿桐鄉", "西螺鎮", "二崙鄉", "北港鎮",
             "水林鄉", "口湖鄉", "四湖鄉", "元長鄉"};
         ZoneList.Add(Zone13);
         // for "台南市"
         string[] Zone14 = {"中西區", "東區", "南區", "北區", "安平區", "安南區", "永康區", "歸仁區",
             "新化區", "左鎮區", "玉井區", "楠西區", "南化區", "仁德區", "關廟區", "龍崎區", "官田區", "麻豆區",
             "佳里區", "西港區", "七股區", "將軍區", "學甲區", "北門區", "新營區", "後壁區", "白河區", "東山區",
             "六甲區", "下營區", "柳營區", "鹽水區", "善化區", "大內區", "山上區", "新市區", "安定區"};
         ZoneList.Add(Zone14);
         // for "高雄市"
         string[] Zone15 = {"新興區", "前金區", "苓雅區", "鹽埕區", "鼓山區", "旗津區", "前鎮區", "三民區",
             "楠梓區", "小港區", "左營區", "仁武區", "大社區", "岡山區", "路竹區", "阿蓮區", "田寮區", "燕巢區",
             "橋頭區", "梓官區", "彌陀區", "永安區", "湖內區", "鳳山區", "大寮區", "林園區", "鳥松區", "大樹區", "旗山區",
             "美濃區", "六龜區", "內門區", "杉林區", "甲仙區", "桃源區", "那碼夏", "茂林區", "茄萣區"};
         ZoneList.Add(Zone15);
         // for "澎湖縣"
         string[] Zone16 = { "馬公市", "西嶼鄉", "望安鄉", "七美鄉", "白沙鄉", "湖西鄉" };
         ZoneList.Add(Zone16);
         // for "屏東縣"
         string[] Zone17 = {"屏東市", "三地門鄉", "霧台鄉", "瑪家鄉", "九如鄉", "里港鄉", "高樹鄉",
             "鹽埔鄉", "長治鄉", "麟洛鄉", "竹田鄉", "內埔鄉", "萬丹鄉", "潮州鎮", "泰武鄉", "來義鄉",
             "萬巒鄉", "嵌頂鄉", "新埤鄉", "南州鄉", "林邊鄉", "東港鎮", "琉球鄉", "佳冬鄉", "新園鄉",
             "枋寮鄉", "枋山鄉", "春日鄉", "獅子鄉", "車城鄉", "牡丹鄉", "恆春鎮", "滿州鄉"};
         ZoneList.Add(Zone17);
         // for "台東縣"
         string[] Zone18 = {"台東市", "綠島鄉", "蘭嶼鄉", "延平鄉", "卑南鄉", "鹿野鄉", "關山鎮",
             "海端鄉", "池上鄉", "東河鄉", "成功鎮", "長濱鄉", "太麻里鄉", "金峰鄉", "大武鄉", "達仁鄉"};
         ZoneList.Add(Zone18);
         // for "花蓮縣"
         string[] Zone19 = {"花蓮市", "新城鄉", "秀林鄉", "吉安鄉", "壽豐鄉", "鳳林鎮", "光復鄉",
             "豐濱鄉", "瑞穗鄉", "萬榮鄉", "玉里鎮", "卓溪鄉", "富里鄉"};
         ZoneList.Add(Zone19);
         // for "金門縣"
         string[] Zone20 = { "金沙鎮", "金湖鎮", "金寧鄉", "金城鎮", "烈嶼鄉", "烏坵鄉" };
         ZoneList.Add(Zone20);
         // for "連江縣"
         string[] Zone21 = { "南竿鄉", "北竿鄉", "莒光鄉", "東引" };
         ZoneList.Add(Zone21);
         // for "南海諸島"
         string[] Zone22 = { "東沙", "西沙" };
         ZoneList.Add(Zone22);
         // for "釣魚台列嶼"
         //string[] Zone23 = { "" };
         //ZoneList.Add(Zone23);

         List<string[]> ZoneCodeList = new List<string[]>();

         // for "台北市"
         string[] ZipCode = {"100", "103", "104", "105", "106", "108", "110", "111",
             "112", "114", "115", "116" };
         ZoneCodeList.Add(ZipCode);
         // for "基隆市"
         string[] ZipCode1 = { "200", "201", "202", "203", "204", "205", "206" };
         ZoneCodeList.Add(ZipCode1);
         // for "新北市"
         string[] ZipCode2 = {"207", "208", "220", "221", "222", "223", "224", "226",
             "227", "228", "231", "232", "233", "234", "235", "236", "237", "238", "239",
             "241", "242", "243", "244", "247", "248", "249", "251", "252", "253"};
         ZoneCodeList.Add(ZipCode2);
         // for "宜蘭縣"
         string[] ZipCode3 = {"260", "261", "262", "263", "264", "265", "266", "267",
             "268", "269", "270", "272"};
         ZoneCodeList.Add(ZipCode3);
         // for "新竹市"
         string[] ZipCode4 = { "300", "300", "300" };
         ZoneCodeList.Add(ZipCode4);
         // for "新竹縣"
         string[] ZipCode5 = {"302", "303", "304", "305", "306", "307", "308", "310",
             "311", "312", "313", "314", "315"};
         ZoneCodeList.Add(ZipCode5);
         // for "桃園區"
         string[] ZipCode6 = {"320", "324", "325", "326", "327", "328", "330", "333",
             "334", "335", "336", "337", "338"};
         ZoneCodeList.Add(ZipCode6);
         // for "苗栗縣"
         string[] ZipCode7 = {"350", "351", "352", "353", "354", "356", "357",
             "358", "360", "361", "362", "363", "364", "365", "366", "367", "368", "369"};
         ZoneCodeList.Add(ZipCode7);
         // for "台中市"
         string[] ZipCode8 = {"400", "401", "402", "403", "404", "406", "407", "408",
             "411", "412", "413", "414", "420", "421", "422", "423", "424", "426", "427",
             "428", "429", "432", "433", "434", "435", "436", "437", "438", "439"};
         ZoneCodeList.Add(ZipCode8);
         // for "彰化縣"
         string[] ZipCode9 = {"500", "502", "503", "504", "505", "506", "507", "508",
             "509", "510", "511", "5112", "513", "514", "515", "516", "520", "521", "522",
             "523", "524", "525", "526", "527", "528", "530"};
         ZoneCodeList.Add(ZipCode9);
         // for "南投縣"
         string[] ZipCode10 = {"540", "541", "542", "544", "545", "546", "551", "552",
             "553", "555", "556", "557", "558"};
         ZoneCodeList.Add(ZipCode10);
         // for "嘉義市"
         string[] ZipCode11 = { "600", "600" };
         ZoneCodeList.Add(ZipCode11);
         // for "嘉義縣"
         string[] ZipCode12 = {"602", "603", "604", "605", "606", "607", "608", "611",
             "612", "613", "614", "615", "616", "621", "622", "623", "624", "625"};
         ZoneCodeList.Add(ZipCode12);
         // for "雲林縣"
         string[] ZipCode13 = {"630", "631", "632", "633", "634", "635", "636", "637",
             "638", "640", "643", "646", "647", "648", "649", "651", "652", "653", "654", "655"};
         ZoneCodeList.Add(ZipCode13);
         // for "台南市"
         string[] ZipCode14 = {"700", "701", "702", "704", "708", "709", "710",
             "711", "712", "713", "714", "715", "716", "717", "718", "719", "720", "721", "722",
             "723", "724", "725", "726", "727", "730", "731", "732", "733", "734", "735", "736",
             "737", "741", "742", "743", "744", "745"};
         ZoneCodeList.Add(ZipCode14);
         // for "高雄市"
         string[] ZipCode15 = {"800", "801", "802", "803", "804", "805", "806", "807",
             "811", "812", "813", "814", "815", "820", "821", "822", "823", "824", "825",
             "826", "827", "828", "829", "830", "831", "832", "833", "840", "842", "843",
             "844", "845", "846", "847", "848", "849", "851", "852"};
         ZoneCodeList.Add(ZipCode15);
         // for "澎湖縣"
         string[] ZipCode16 = { "880", "881", "882", "883", "884", "885" };
         ZoneCodeList.Add(ZipCode16);
         // for "屏東縣"
         string[] ZipCode17 = {"900", "901", "902", "903", "904", "905", "906", "907",
             "908", "909", "911", "912", "913", "920", "921", "922", "923", "924", "925",
             "926", "927", "928", "929", "931", "932", "940", "941", "942", "943", "944",
             "945", "946", "947"};
         ZoneCodeList.Add(ZipCode17);
         // for "台東縣"
         string[] ZipCode18 = {"950", "951", "952", "953", "954", "955", "956", "957",
             "958", "959", "961", "962", "963", "964", "965", "966"};
         ZoneCodeList.Add(ZipCode18);
         // for "花蓮縣"
         string[] ZipCode19 = {"970", "971", "972", "973", "974", "975", "976", "977",
             "978", "979", "981", "982", "983"};
         ZoneCodeList.Add(ZipCode19);
         // for "金門縣"
         string[] ZipCode20 = { "890", "891", "892", "893", "894", "896" };
         ZoneCodeList.Add(ZipCode20);
         // for "連江縣"
         string[] ZipCode21 = { "209", "210", "211", "212" };
         ZoneCodeList.Add(ZipCode21);
         // for "南海諸島"
         string[] ZipCode22 = { "817", "819", "290" };
         ZoneCodeList.Add(ZipCode22);
         // for "釣魚台列嶼"
         // string[] ZipCode23 = { "290" };
         // ZoneCodeList.Add(ZipCode23);
         string townList = string.Empty;
         StringBuilder sb = new StringBuilder();
         int cityCodeNum = int.Parse(cityCode);
         sb.Append("{");
         for (var k = 0; k < ZoneList.Count; k++)
         {
             if (k != 0)
             {
                 sb.Append(",");

             }
             sb.Append("\"");
             sb.Append(city[k]);
             sb.Append("\"");
             sb.Append(":");

             for (var i = 0; i < ZoneList[k].Length; i++)
             {
                 if (i != 0)
                 {
                     sb.Append(",");
                 }
                 else
                 {
                     sb.Append("[");
                 }
                 sb.Append("\"");
                 sb.Append(ZoneCodeList[k][i]);
                 sb.Append("-");
                 sb.Append( ZoneList[k][i]);
                 sb.Append("\"");
             }
             sb.Append("]");

         }
         sb.Append("}");
         log.endWrite(sb.ToString(), className, methodName);
         return sb.ToString();
     }*/

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}