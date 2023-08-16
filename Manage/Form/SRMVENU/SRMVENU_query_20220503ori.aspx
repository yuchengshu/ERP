<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SRMVENU_query_20220503ori.aspx.cs" Inherits="Manage_Form_SRMVENU_query" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 125px;
        }
    </style>
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
                            <h1 class="box-title"><b>ERP > 行政部  > 會場管理</b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div>
                        <div class="input-group">

                            <div class="input-group">


                                <span class="inputSearch marginRight20">
                                    <%--<select id="MP_Item" class="form-control" ><option value="">請選擇</option></select>--%>
                                    <select id="smdM_MP" class="form-control messagePublic ssmRequired smmRequired" fieldname="分析師"></select>
                                </span>


                                <span class="inputSearch  marginRight20">
                                    <input type="text" id="MeetingDate" class="datepicker form-control today" placeholder="請選擇會場日期">
                                </span>

                                <span class="inputSearch">
                                    <button type="button" class="btn btn-info btn-flat searchSRMVENUDataFuc" id="searchSRMVENUData">查詢11</button>
                                    <%--<button type="button" class="btn btn-info btn-flat marginTop-27 searchSRMVENUDataFuc" id="searchSRMVENUData">查詢22</button>--%>
                                </span>

                                <span class="inputSearch pageSpan">
                                    <span class="">page</span>&nbsp; <span class="">：</span>&nbsp;<span id="pageNum" class=""></span>
                                </span>
                            </div>
                            <th class="" colspan="6">
                                <div class="input-group">
                                </div>
                            </th>
                        </div>

                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table width="100%" border="0" cellspacing="0" cellpadding="1">
                             <thead>
                            <tr class="bgBlue">
                                <th class="" style="width: 5%; text-align: center;">會場編號</th>
                                <th class="" style="width: 10%; text-align: center;">日期</th>
                                <th class="" style="width: 10%; text-align: center;">地點</th>
                                <th class="" style="width: 5%; text-align: center;">分析師</th>
                                <th class="" style="width: 5%; text-align: center;">來賓人數</th>
                                <th class="" style="width: 5%; text-align: center;">交易件數</th>
                                <th class="" style="width: 5%; text-align: center;">助理人數</th>
                                <th class="" style="width: 15%; text-align: center;">訂金件數</th>
                                <th class="" style="width: 5%; text-align: center;">入會金額</th>
                                <th class="" style="width: 5%; text-align: center;">入帳金額</th>
                                <th class="" style="width: 5%; text-align: center;">修改</th>
                                <th class="" style="width: 5%; text-align: center;">刪除</th>

                            </tr>
                            </thead>
                                <tbody id="customerData">
                                </tbody>
                        </table>
                        <div style="text-align: center">
                            <div id="pageBar" style="margin: 0 auto;"></div>
                        </div>

                    </div>
                </div>
            </div>
           
    </section>
    </div>
    <script src="<%=getRelativePath()%>js/pageList/muserPageList.js" type="text/javascript"></script>
    <script>                                      

        var CustomerManageHandlerUrl_G = "/Manage/Form/SRMVENU/SRMVENUHandler.ashx";
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
                        sb.append(v.V_ID);//會場編號
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.V_Date);//日期
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.V_Site);//地點
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.MP_Name);//分析師
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.V_MEM);//來賓人數
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.TradeCount);//交易件數
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.V_MemC);//助理人數
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.DepositCount);//訂金件數
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.Account_Money_Pay);//入會金額
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.Account_Money_IN);//入帳金額
                        sb.append("</td > <td class='textAlignCenter'><a href='#' class='openDiv' openDivName='#editCallRecordDetailDiv' thisId='");
                        sb.append("'>修</a></th>");
                        sb.append("<th class='text-center'><a href='javascript:void(0)' class='deleteData delPer' Auto_Id='");
                        sb.append("'>刪</a></th>");
                        sb.append("</th>");
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
        //查詢資料==============================================================================start
        //按下[查詢]紐會執行的功能
        var searchSRMVENUDataFuc = function () {
            //alert("searchSRMVENUDataFuc");
            var MeetingDate = val_M("#MeetingDate");
            var Q_Analyst = val_M("#smdM_MP") == null ? emptyValue_M : val_M("#smdM_MP");
            var doNext = check_M.isEndDateBigThanStartDate(startDate, endDate);

            if (isEmptyStr(startDate) && isEmptyStr(endDate)) {
                //alert("searchSRMVENUDataFuc_Start_Search!!");
                doNext = true;
            }
            if (doNext) {
                NowPage_G = 1;
                blockUI_M();
                empty_M("#customerData");
                var startDate = val_M("#StartDate");
                var endDate = val_M("#EndDate");
                var MP_Name = val_M("#smdM_MP");//分析師姓名
                var keyWord = val_M("#keyWord");//關鍵字
                var Q_Analyst = val_M("#smdM_MP") == null ? emptyValue_M : val_M("#smdM_MP");//分析師員工編號
                //var Q_Product = val_M("#Q_Product") == null ? emptyValue_M : val_M("#Q_Product");
                var data = "MP_Name=" + Q_Analyst + "&MeetingDate=" + MeetingDate + "&action=searchSRMVENUData";
                console.log("MP_Name=" + Q_Analyst + "&MeetingDate=" + MeetingDate + "&action=searchSRMVENUData");
                var searchCustomerDataSuccess = function (back) {
                    CustomerDataJson_G = jsonParse_M(back);
                    makeHtml();//<===
                    hide_M("#customerAdvSearchDiv");

                };
                //alert('Call CustomerManageHandlerUrl_G2');
                ajax_M(CustomerManageHandlerUrl_G, data, searchCustomerDataSuccess);//<===
            } else {
                alert("請正確選擇建檔日期區間");
            }

        };
        var IP_G = "<%=getIP()%>";
        //scriptH

        var jsonParse_M = function (str) {
            return JSON.parse(str);
        };
        //取得分析師ListHtmlTagOption
        var afterSuccessFuc = function () {
            onChange_M("#MP", function () {
                var type = val_M("#MP");
                $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#MP_Item", type, "option");
            });
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
        var afterSuccessFucForSmd = function () {
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
                    //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#smdM_MP", type, htmlTag, getListByViewtag0, emptyValue_M, true);
                }
            });
        };
        var getMUSERquery = function () {
            var data = "action=getERPcustomerWebPay" + "&keyWord=" + val_M("#keyWord") + "&PayStatus=" + val_M("#PayStatus") + "&U_MDEP=" + U_MDEP_M + "&ComID=" + ComID_M + "&U_Num=" + U_Num_M;
            var success = function (back) {
                var json = jsonParse_M(back);
                $muserPageList.Table.makeTbody("#ERPcustomerWebPaySearchTb", json, 10, "#pageBar", deleteData, getMid);
            };
            var error = function (e) { Log_M("getERPcustomerWebPay error=" + e); unBlockUI_M(); };
            ajax_M(ERPcustomerWebPayHandlerUrl_G, data, success, error);
        };
        var startThisPage = function () {
            $Common.MUSER.getAnalystListHtmlTagOptionForAllPowerSendRecord(CommonHandlerUrl_M, "#smdM_MP", ComID_M, U_MDEP_M, U_POSITION_M, U_Leader_M, U_Num_M, afterSuccessFucForSmd);
            var CustomerManageHandlerUrl_G = "/Manage/Form/SRMVENU/SRMVENUHandler.ashx";

            var data = "U_Num=" + U_Num_M + "&action=getSRMVENUData";
            var success = function (back) {
                var json = jsonParse_M(back);
                CustomerDataJson_G = json;//取回的資料內容
                if (back != "成功") {
                    makeHtml();
                }
            };
            var error = function (e) { Log_M("deleteMailData error=" + e); unBlockUI_M(); };
            ajax_M(CustomerManageHandlerUrl_G, data, success, error);//<===
            //查詢之功能系結
            onClick_M(".searchSRMVENUDataFuc", searchSRMVENUDataFuc);
            click_M("#searchCustomerDataSuccess");

        };
        //頁面載入後自動執行
        $(function () {
            startThisPage();
            //查看使用者權限
            //getUserAuthority_M(startThisPage);
        })


    </script>
</asp:Content>

