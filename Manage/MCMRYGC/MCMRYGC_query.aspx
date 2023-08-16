<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MCMRYGC_query.aspx.cs" Inherits="Manage_User_MUSER_query" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper" style="min-height: 616px;">
        <!-- Content Header (Page header) -->
        <section class="content-header"></section>
        <!-- Main content -->
        <section class="content">
            <!-- Main row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-danger">
                        <div class="box-header">
                            <i class="fa fa-list-alt"></i>
                            <h1 class="box-title"><b>業務部 &gt;  案件派發作業</b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <%-- <form name="form1" method="post" action="MCMRYGC_EditDB.asp?MENU_no=" runat="server" onsubmit="return jsCheck();">--%>
                            <form name="form1" method="post" runat="server">
                                <div style="text-align: center">
                                    <div id="pageBar" style="margin: 0 auto;">
                                        <td align="center" valign="top">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="1">
                                                <tr>
                                                    <td height="197" align="center" valign="top">
                                                        <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#dddddd">
                                                            <tr bgcolor="#F7F6F3" class="12-k">
                                                                <td colspan="2" bgcolor="#e5e5e5">【多筆】派發</td>
                                                                <tr align="center" bgcolor="#F7F6F3" class="12-k">
                                                                    <td>資源帳號</font></td>

                                                                    <td align="left">
                                                                        <%--                 <asp:DropDownList ID="Z_Item" runat="server" OnInit="Z_Item_Init" OnSelectedIndexChanged="Z_Item_SelectedIndexChanged" OnTextChanged="Z_Item_TextChanged">
                                                                        </asp:DropDownList>--%>
                                                                        <%-- <label for="Q_Analyst">分析師：</label>--%>
                                                                        <%--資源帳號--%>
                                                                        <select id="Q_Analyst" class="form-control getZitemListFuc">
                                                                           <%-- <option value="">不拘123</option>
                                                                            <option value="">不拘456</option>--%>
                                                                        </select>

                                                                    </td>
                                                                    <tr align="center" bgcolor="#F7F6F3" class="12-k">
                                                                        <td class="auto-style1">交易狀態</font></td>
                                                                        <td align="left" class="auto-style1">
                                                                            <%--<asp:DropDownList ID="Q_member" runat="server" OnInit="Q_member_Init" OnSelectedIndexChanged="Q_member_SelectedIndexChanged" OnTextChanged="Q_member_TextChanged">
                                                                            </asp:DropDownList>--%>
                                                                            <select id="TradingStatus" class="form-control getTradingStatusListFuc">
                                                                           <%-- <option value="">不拘123</option>
                                                                            <option value="">不拘456</option>--%>
                                                                        </select>
                                                                            &nbsp;</td>
                                                                        <tr align="center" bgcolor="#F7F6F3" class="12-k">
                                                                            <td>派發人員</font></td>
                                                                            <td align="left">
                                                                                <%-- <asp:CheckBoxList runat="server" ID="CB_list"></asp:CheckBoxList>--%>
                                                                                <div class="col-xs-12" id="AnalystCheckBoxDiv">
                                                                                    <%-- <label for="Analyst"><span class="colorRed">*</span>詢問老師：</label>--%>

                                                                                    <input id="Analyst" type="hidden" class="form-control addCustomerDataRequired addCustomerDataInput" requireditem="詢問之分析師" />
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                            <tr align="center" bgcolor="#F7F6F3" class="12-k">
                                                                <td>派發筆數</font></td>

                                                                <td align="left">
                                                                    <asp:TextBox ID="Case_count_TB" runat="server" Width="110px"></asp:TextBox>


                                                                </td>
                                                                <tr align="center" height="15" bgcolor="#e5e5e5">
                                                                    <td class="12-k" colspan="2">
                                                                        <%--<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="派發案件" />--%>
                                                                        <button type="button" class="btn btn-info btn-flat assignCaseFuc qPer" id="assignCase">派發案件</button>
                                                                        <%--<input type="submit" name="submit" class="btn" value="派發案件">--%>
                                                                    </td>
                                                                </tr>


                                                        </table>
                                                        <br>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                        <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#dddddd">
                                                            <tr bgcolor="#F7F6F3" class="12-k">
                                                                <td colspan="2" bgcolor="#e5e5e5">【單筆】派發</td>

                                                                <tr align="center" bgcolor="#F7F6F3" class="12-k">
                                                                    <td width="200">客戶姓名/電話</font></td>

                                                                    <td align="left">
                                                                        <asp:TextBox ID="KeyWord" runat="server"></asp:TextBox>
                                                                        &nbsp;</td>
                                                                    <tr align="center" height="15" bgcolor="#e5e5e5">
                                                                        <td class="12-k" colspan="2">
                                                                            <asp:Button ID="Button2" runat="server" Text="查詢案件" OnClick="Button2_Click1" />
                                                                            <%--<input type="submit" name="submit" class="btn" value="查詢案件">--%>
                                                                        </td>
                                                                    </tr>


                                                        </table>

                                                    </td>

                                            </table>
                                        </td>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script src="<%=getRelativePath()%>js/pageList/muserPageList.js" type="text/javascript"></script>
    <script>
        //var CustomerManageHandlerUrl_G = "/Manage/User/MUSERHandler.ashx";
        var CustomerManageHandlerUrl_G = "/Manage/MCMRYGC/MCMRYGCHandler.ashx";
        var CustomerDataJson_G = null;
        <%--var MENU_no_G = "<%=getMENU_no()%>";--%>
        //現在頁數
        var NowPage_G = 1;
        //總頁數
        var TotalPage_G = 0;
        //每頁資料筆數
        var CountPerPage_G = 30;
        var pageNumClick = function () {
            var thisText = $(this).text();
            var goNext = true;
            if (thisText == ">>" || thisText == "<<") {
                if (NowPage_G <= TotalPage_G && NowPage_G >= 1) {
                    if (thisText == ">>") {
                        NowPage_G += 1;
                    } else if (thisText == "<<") {
                        NowPage_G -= 1;
                    }
                } else {
                    goNext = false;
                }
            } else {
                var clickPage = parseInt(thisText);
                if (clickPage <= TotalPage_G && clickPage >= 1) {
                    NowPage_G = clickPage;
                } else {
                    goNext = false;
                }
            }
            if (goNext) {

                makeHtml();
            }
        };
        //取得使用者資料============================================================start
        //取得下方分頁表列
        var getPageList = function () {
            $("#pageBar").empty();
            var startPageNum = NowPage_G - 5;
            if (startPageNum <= 0) {
                startPageNum = 1;
            }
            var showPageCount = 0;

            if (TotalPage_G >= 10) {
                showPageCount = 9;
            } else {
                showPageCount = TotalPage_G - 1;
            }

            var sb = new string_M.StringBuilder();

            if (NowPage_G > 1) {
                sb.append("<span class='pageList pageNum'><a class='qPer' href='#'><<</a></span>");
            }

            for (var i = 0; i <= showPageCount; i++) {
                sb.append("<span class='pageList pageNum'><a class='qPer'  href='javascript: void(0)'>");
                sb.append(startPageNum);
                sb.append("</a></span>");
                startPageNum += 1;
            }

            if (NowPage_G < TotalPage_G) {
                sb.append("<span class='pageList pageNum'><a class='qPer' href='#'>>></a></span>");
            }

            //$("#pageBar").append(sb.toString());
            append_M("#pageBar", sb.toString());
            empty_M("#pageNum");
            //$("#pageNum").empty();
            append_M("#pageNum", NowPage_G + "/" + TotalPage_G);
            //$("#pageNum").append(NowPage_G + "/" + TotalPage_G);
            onClick_M(".pageNum", pageNumClick);
            //$(".pageNum").on("click", pageNumClick);
        };

        //}
        var makeHtml = function () {
            $("#customerData").empty();
            if (CustomerDataJson_G.length != 0) {
                var sb = new string_M.StringBuilder();
                var n = 0;
                var startCount = (NowPage_G - 1) * 30 + 1;
                var endCount = 30 * NowPage_G;
                var isMember = false;
                $.each(CustomerDataJson_G, function (i, v) {
                    n += 1;
                    if (n >= startCount && n <= endCount) {
                        sb.append("<tr><th class='text-center'>");
                        sb.append(v.U_Num);
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.U_Name);
                        sb.append("");

                        if (v.N_Call_tag == "1") {
                            sb.append("<img style='width:25px;height:25px;' src=/img/icon/nocall.jpg alt=請勿聯絡>");
                        } else {
                            sb.append(v.ddesc);
                        }
                        sb.append("</th><th class='text-center'>");
                        sb.append("<a class='' ");
                        sb.append("'>");
                        sb.append(v.U_Item);
                        sb.append("</a></th><th class='text-center'>");
                        sb.append(v.DEPAR);
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.ComLand);

                        sb.append("</th><th class='text-center'>");
                        if (v.MTel1 != "") {
                            sb.append(v.ComLand);
                        }
                        if (v.MTel2 != "") {
                            sb.append("<br>");
                            sb.append(v.ComLand);
                        }
                        if (v.MTel3 != "") {
                            sb.append("<br>");
                            sb.append(v.ComLand);
                        }
                        sb.append("</th><th class='text-center'>");
                        if (v.OTel != "") {
                            sb.append("AA");
                            sb.append("-");
                            sb.append(v.OTel);
                            if (v.OTel_Sub != "") {
                                sb.append("#");
                                sb.append(v.ComLand);
                            }
                        }
                        if (v.OTel != "") {
                            sb.append(v.ComLand);
                            sb.append("-");
                            sb.append(v.ComLand);
                            if (v.OTel_Sub1 != "") {
                                sb.append("#");
                                sb.append(v.ComLand);
                            }
                        }
                        sb.append("</th><th class='text-center'>");
                        if (v.HTel != "") {
                            sb.append(v.HTel_Zone);
                            sb.append("-");
                            sb.append(v.HTel);
                        }
                        if (v.HTel1 != "") {
                            sb.append(v.HTel_Zone1);
                            sb.append("-");
                            sb.append(v.HTel1);
                        }
                        //sb.append("</th><th class='text-center'>");
                        //sb.append(v.add_date);
                        sb.append("</th>");
                        if (isMember) {
                            sb.append("<th class='text-center'>-</th>");
                            isMember = false;
                        } else {
                            sb.append("<th class='text-center'><a href='#' class='deleteCustomerData delPer' MID='");
                            sb.append(v.M_ID);
                            sb.append("'>刪</a></th>");
                        }

                        sb.append("</tr>");
                    }
                });


                //TotalPage_G = getTotalPage(n);
                //alert('append_M("#customerData", sb.toString());');
                append_M("#customerData", sb.toString());
                // $("#customerData").append(sb.toString());
                onClick_M(".deleteCustomerData", function () {
                    var MID = $(this).attr("MID");
                    var r = confirm("刪除後資料將無法恢復，確定刪除?");
                    console.log(r);
                    if (r == true) {
                        deleteCustomerData(MID);
                    }

                });
                /*$(".deleteCustomerData").on("click", function () {
                    var MID = $(this).attr("MID");
                    var r = confirm("刪除後資料將無法恢復，確定刪除?");
                    console.log(r);
                    if (r == true) {
                        deleteCustomerData(MID);
                    }
 
                });*/
            } else {
                alert("查無資料");
                NowPage_G = 1;
                TotalPage_G = 1;
            }
            //製作頁數列表
            getPageList();

            //頁面解鎖
            unBlockUI_M();
        };
        var IP_G = "<%=getIP()%>";
        //scriptH
        var MCMRYGCHandlerUrl_G = "/Manage/MCMRYGC/MCMRYGCHandler.ashx";
        var jsonParse_M = function (str) {
            return JSON.parse(str);
        };
        //傳送資料 ajax_M
        var ajax_M = function (url, data, success, error) {
            /* alert('call customerManageHandler!!!!!'+url);*/
            $.ajax({
                url: url,
                data: data,
                method: 'POST',
                success: success,
                error: error
            });
        };
        var Check_Item;//被勾選的項目(派發人員)
        var Check_Item_Ary;//被勾選的項目(陣列)(派發人員)
        var getCheckBoxValueStr = function (objs, idOrClassName) {
            var back = "";
            var count = 0;
            $.each(objs, function (i, v) {
                if ($(v).prop("checked") == true) {
                    if (count > 0) {
                        back += ",";
                    }
                    back += val_M(v);
                    count += 1;
                }
            });
            val_M(idOrClassName, back);//back:被勾選的項目
            Check_Item = back;//被勾選的項目(派發人員)
        };
        
         //派發案件(assignCase)
        //20220708
        var assignCase = function () {
            //var Analysts_Check = "";
            var Analysts = $('input[name="Analyst"]');
            //getCheckBoxValueStr(Analysts_Check, "#Analyst");
            getCheckBoxValueStr(Analysts, "#Analyst");
            alert("#Analyst");
            alert(Check_Item);
            Check_Item_Ary = Check_Item.split(',');//被勾選的項目(陣列)(派發人員)
            alert('派發案件');
            //var Analysts = $('input[name="Analyst"]');
            getCheckBoxValueStr(Analysts, "#Analyst");
            //20220708新增派發資料 ref:customerManage.aspx
            var data = "" + "&action=assignCase";;//進行派發案件
            var addCustomerDataSuccess = function (back) { };//新增成功後執行的函數
            ajax_M(MCMRYGCHandlerUrl_G, data, addCustomerDataSuccess);//<==呼叫執行新增的動作

            //ref:C:\Work\WebSites\ERP\Manage\Form\SRMVENU\新增資料夾
            //alert('Query!');
            //var Q_Analyst = val_M("#smdM_MP") == null ? emptyValue_M : val_M("#smdM_MP");//分析師員工編號
            ////alert(Q_Analyst);
            ////var startDate = val_M("#StartDate");
            ////var endDate = val_M("#EndDate");
            ////var doNext = check_M.isEndDateBigThanStartDate(startDate,endDate);
            ////if (isEmptyStr(startDate) && isEmptyStr(endDate)) {
            //doNext = true;
            ////}
            //if (doNext) {
            //    NowPage_G = 1;
            //    blockUI_M();
            //    empty_M("#MPMMTELData");
            //    //var keyWord = val_M("#keyWord");
            //    var Q_Analyst = val_M("#smdM_MP") == null ? emptyValue_M : val_M("#smdM_MP");//分析師員工編號
            //    //var Q_Product = val_M("#Q_Product") == null ? emptyValue_M : val_M("#Q_Product");
            //    //var data = "keyWord=" + keyWord + "&U_MDEP=" + U_MDEP_M + "&U_Num=" + U_Num_M + "&ComID=" + ComID_M + "&Q_Name=" + $("#Q_Name").val() + "&Q_Tel=" + $("#Q_Tel").val() + "&StartDate=" + startDate + "&EndDate=" + endDate + "&Q_Analyst=" + Q_Analyst + "&Q_Grade=" + $("#Q_Grade").val() + "&Q_Member=" + $("#Q_Member").val() + "&Q_Product=" + Q_Product + "&action=searchMPMMTELData";
            //    var data = "Q_Analyst=" + Q_Analyst + "&action=searchMPMMTELData";

            //    console.log("Q_Analyst = " + Q_Analyst + " & action=searchMPMMTELData");
            //    var searchCustomerDataSuccess = function (back) {
            //        MPMMTELDataJson_G = jsonParse_M(back);
            //        //alert('show list2');
            //        makeHtml();//<===
            //        hide_M("#customerAdvSearchDiv");

            //    };
            //    //alert('Call CustomerManageHandlerUrl_G2');
            //    ajax_M(MPMMTELDataHandlerUrl_G, data, searchCustomerDataSuccess);//<===
            //} else {
            //    alert("請正確選擇建檔日期區間");
            //}

        };
        //var getMUSERquery = function () {
        //    var data = "action=getERPcustomerWebPay" + "&keyWord=" + val_M("#keyWord") + "&PayStatus=" + val_M("#PayStatus") + "&U_MDEP=" + U_MDEP_M + "&ComID=" + ComID_M + "&U_Num=" + U_Num_M;
        //    var success = function (back) {
        //        var json = jsonParse_M(back);
        //        $muserPageList.Table.makeTbody("#ERPcustomerWebPaySearchTb", json, 10, "#pageBar", deleteData, getMid);
        //    };
        //    var error = function (e) { Log_M("getERPcustomerWebPay error=" + e); unBlockUI_M(); };
        //    ajax_M(ERPcustomerWebPayHandlerUrl_G, data, success, error);
        //};
        var afterSuccessFucForSmd = function () {
            //alert('call afterSuccessFucForSmd');
            onChange_M(".messagePublic", function () {
                var type = val_M("#smdM_MP");
                var sendType = val_M("#smdType");
                var htmlTag = "";
                if (sendType == "single") {
                    htmlTag = "radio";
                    disabledFalse_M("#smdM_TEL");
                    hide_M("#allCheck");
                    $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#smdM_MP", type, htmlTag);
                } else {
                    htmlTag = "checkbox";
                    disabledTrue_M("#smdM_TEL");
                    show_M("#allCheck");
                    $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#smdM_MP", type, htmlTag, getListByViewtag0, emptyValue_M, true);
                }
            });
        };
        var startThisPage = function () {
            
            onClick_M("#assignCase", assignCase);//派發案件
            //開始畫面()
            //20220705進度
            //ComID_M(HG01)
            //U_Num_M(B1103011)
            //取得交易狀態
            //取得派發人員
            //            //
            //取得資源帳號下拉式選單選項
            //$Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "getAnalystListFuc", emptyValue_M, "option");//20220704Test(取得資源帳號下拉式選單選項)
            //getZitemListFuc
            //取得資源帳號HtmlTagOption列表
            //$Common.MUSER.getZItemListHtmlTagOption(CommonHandlerUrl_M, "getAnalystListFuc", ComID_M, U_Num_M, "option", afterSuccessFucForSmd);
            //$Common.MUSER.getZItemListHtmlTagOption(CommonHandlerUrl_M, "getAnalystListFuc", ComID_M, U_Num_M, "option");//20220705Test(取得資源帳號下拉式選單選項)
            //20220705pm(取得資源帳號下拉式選單選項)
            //$Common.MUSER.getZItemListHtmlTagOption(CommonHandlerUrl_M, "getAnalystListFuc", ComID_M, U_Num_M, "option");//20220705Test(取得資源帳號下拉式選單選項)
            //Q_Analyst
            $Common.MUSER.getTradingStatusListTagOption(CommonHandlerUrl_M, "TradingStatus", ComID_M, U_Num_M, "option");//20220706(取得交易狀態下拉式選單選項)
            $Common.MUSER.getZItemListHtmlTagOption(CommonHandlerUrl_M, "Q_Analyst", ComID_M, U_Num_M, "option");//20220706(取得資源帳號下拉式選單選項)
           //取得派發人員勾選項目
            //$Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "#AnalystCheckBoxDiv", ComID_M, "checkbox");//取得派發人員勾選項目
            //取得派發人員勾選項目
            $Common.MUSER.getDispatcherListHtmlTagOption(CommonHandlerUrl_M, "#AnalystCheckBoxDiv", ComID_M, U_Num_M, "checkbox");//取得派發人員勾選項目
            //var data = "U_Num=" + U_Num_M + "&action=getMUSERData";
            //var success = function (back) {
            //    var json = jsonParse_M(back);
            //    CustomerDataJson_G = json;//取回的資料內容
            //    if (back != "成功") {
            //        makeHtml();
            //    }
            //};
            //var error = function (e) { Log_M("deleteMailData error=" + e); unBlockUI_M(); };
            //ajax_M(CustomerManageHandlerUrl_G, data, success, error);//<===

        };
        //
        $(function () {
            $("span[errormessage]")
                .addClass("aspNetVldrMark") //add class mark for latter access
                .each(function () {
                    var $spn = $(this);
                    //set errormessage as title to display when hover
                    $spn.attr("title", $spn.attr("errormessage"))
                        //add wrapper on innerText
                        .html("<span>" + $spn.html() + "</span>");
                });
            //blinking effect
            setInterval(function () {
                $("span.aspNetVldrMark > span").toggle();
                //or blink only the visible spans
                //$("span.aspNetVldrMark").filter(function () {
                //    return this.style.visibility == "visible";
                //}).children("span").toggle();
            }, 400);
        });
        //

        //頁面載入後自動執行
        $(function () {

            startThisPage();
            //查看使用者權限
            //getUserAuthority_M(startThisPage);
        })


    </script>
</asp:Content>

