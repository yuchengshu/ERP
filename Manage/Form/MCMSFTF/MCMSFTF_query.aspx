<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MCMSFTF_query.aspx.cs" Inherits="wealthManage_custermerManage_MMBER_customerManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <script src="<%=getRelativePath()%>js/common/CommonTool.js" type="text/javascript"></script>
    <div class="content-wrapper" style="min-height: 668px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
        </section>

        <!-- Main content -->
        <section class="content">
            <!-- Main row -->

            <div class="row">
                <div class="col-md-12">
                    <div class="box box-danger">
                        <div class="box-header">
                            <i class="fa fa-list-alt"></i>
                            <h1 class="box-title"><b>ERP > 財富管理部 > 專案客戶管理><font>個股管理作業</font></b></h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title="">
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">

                            <%--個股管理作業 - 新增--%>
                            <%--20220722--%>


                            <table class="table table detail startHide" id="todayContactTab">
                                <tbody>
                                    <tr class="detailHead">
                                        <th style="width: 5%; text-align: center"></th>
                                        <th style="width: 20%; text-align: center">時間</th>
                                        <th style="width: 18%; text-align: center">客戶姓名</th>
                                        <th style="width: 35%; text-align: center">聯絡內容</th>
                                        <th style="width: 20%; text-align: center">建檔人員</th>
                                        <th style="width: 2%; text-align: right">
                                            <div class="btn-group" data-toggle="btn-toggle" style="margin-right: 0 auto;">
                                                <button type="button" class="btn btn-default btn-flat closeSecondaryWindow">X</button>
                                            </div>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td colspan="6" style="text-align: center"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <div id="customerAdvSearchDiv" class="divBorder">
                                <div id="customerAdvSearchTitle" class="marginLeftRight10 titleBottomBorder">
                                    <h2>客戶資料進階查詢
                                    <div class="btn-group" data-toggle="btn-toggle" style="margin-right: 0 auto; float: right;">
                                        <button id="" type="button" class="btn closeBtn btn-flat closeSecondaryWindow">X</button>
                                    </div>
                                    </h2>
                                </div>

                                <form id="customerAdvSearchFm" class="marginTop10 ">
                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-2">
                                            <label for="Q_Name">客戶名稱：</label>
                                            <input class="form-control " id="Q_Name" type="text">
                                        </div>
                                        <div class="col-xs-2">
                                            <label for="Q_Tel">電話：</label>
                                            <input class="form-control " id="Q_Tel" type="text">
                                        </div>

                                        <div class="col-xs-2">
                                            <label for="Q_Product">產品：</label>
                                            <select id="Q_Product" class="form-control getProductListFuc">
                                                <option value="">不限</option>
                                            </select>
                                        </div>
                                        <div class="col-xs-2">
                                            <label for="Q_Grade">等級：</label>
                                            <select id="Q_Grade" class="form-control ">
                                                <option value="">不限</option>
                                                <option value="A">A</option>
                                                <option value="B">B</option>
                                                <option value="C">C</option>
                                                <option value="D">D</option>
                                            </select>
                                        </div>

                                        <div class="col-xs-2">
                                            <label for="adver_item">建檔時間：</label><br />
                                            <input type="text" id="StartDate" class="datepicker form-control " placeholder="開始日">
                                        </div>
                                        <div class="col-xs-2">
                                            <label for="adver_item">建檔時間：</label><br />
                                            <input type="text" id="EndDate" class="datepicker form-control " placeholder="結束日">
                                        </div>
                                    </div>
                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-3">
                                            <label for="Q_Analyst">分析師：</label>
                                            <select id="Q_Analyst" class="form-control getAnalystListFuc ">
                                                <option value="">不拘</option>
                                            </select>
                                        </div>
                                        <div class="col-xs-3">
                                            <label for="Q_InvMoney">投資金額：</label>
                                            <select id="Q_InvMoney" class="form-control  getInvestMoneyListFuc">
                                            </select>
                                        </div>
                                        <div class="col-xs-2">
                                            <label for="Q_Member">是否為會員：</label>
                                            <select id="Q_Member" class="form-control ">
                                                <option value="">不拘</option>
                                                <option value="1">會員</option>
                                                <option value="2">非會員</option>
                                            </select>
                                        </div>
                                        <div class="col-xs-2">
                                            <label for="adver_item">排序欄位：</label>
                                            <select id="adver_item" class="form-control">
                                                <option value="Create_Date">建檔日期</option>
                                                <option value="Leave_Date">承接日期</option>
                                            </select>
                                        </div>
                                        <div class="col-xs-2 marginTop25" style="text-align: center" id="startSearchDiv">

                                            <button class="btn searchCustomerDataFuc" style="background-color: #f4f4f4;" onclick="return false;">開始查詢</button>

                                        </div>
                                    </div>
                                </form>
                            </div>
                            <table class="table table-hover" id="customerDataTab">

                                <thead>
                                    <tr class="active">

                                        <th class="" colspan="6">
                                            <div class="input-group">
                                                <input type="text" name="message" placeholder="查尋關鍵字..." class="form-control" id="keyWord">

                                                <span class="input-group-btn">
                                                    <button type="button" class="btn btn-info btn-flat searchCustomerDataFuc qPer" id="searchCustomerData">查詢</button>
                                                </span>
                                                <%-- <span class="input-group-btn ">
                                                    <button type="button" class="btn btn-info btn-flat marginLeft marginRight qPer" id="openSearchAdvancedWindow">進階查詢</button>
                                                </span>
                                                <span class="input-group-btn marginLeft">
                                                    <button type="button" class="btn btn-info btn-flat qPer" id="openTodayContactWindow">今日聯絡事項</button>
                                                </span>--%>
                                            </div>
                                        </th>

                                        <th class="" colspan="1"></th>
                                        <th class="" colspan="1"></th>
                                        <th class="" colspan="1">
                                            <div class="btn-group" data-toggle="btn-toggle">
                                                <button type="button" id="AddMCMSFTFDataWindowBtn" class="btn btn-primary btn-flat addPer">新增個股</button>
                                            </div>
                                        </th>
                                        <th class="" colspan="1">page&nbsp;：&nbsp;<span id="pageNum"></span></th>
                                    </tr>

                                    <tr class="bgBlue">
                                        <th class="" style="width: 2%; text-align: center;">項</th>
                                        <th class="" style="width: 4%; text-align: center;">股票</th>
                                        <th class="" style="width: 6%; text-align: center;">產業別</th>
                                        <th class="" style="width: 4%; text-align: center;">收盤價</th>
                                        <th class="" style="width: 11%; text-align: center;">今年EPS</th>
                                        <th class="" style="width: 17%; text-align: center;">合理本益比</th>
                                        <th class="" style="width: 12%; text-align: center;">目標價</th>
                                        <th class="" style="width: 32%; text-align: center;">個股說明</th>
                                        <th class="" style="width: 10%; text-align: center;">修改</th>
                                        <th class="" style="width: 2%; text-align: center;">刪</th>
                                    </tr>
                                </thead>
                                <tbody id="MCMSFTFData">
                                </tbody>

                            </table>
                            <div style="text-align: center">
                                <div id="pageBar" style="margin: 0 auto;"></div>
                            </div>

                        </div>
                        <!--/.box-body-->

                    </div>
                    <!--/.box-->

                </div>
            </div>
            <script src="<%=getRelativePath()%>js/pageList/mcmsftfPageList.js" type="text/javascript"></script>

            <script>
                var MCMSFTFHandlerrUrl_G = "MCMSFTFHandler.ashx";
                var MCMSFTFDataJson_G = null;
                var MENU_no_G = "<%=getMENU_no()%>";
                //現在頁數
                var NowPage_G = 1;
                //總頁數
                var TotalPage_G = 0;
                //每頁資料筆數
                var CountPerPage_G = 30;
                //業務員列表
                var McList_G = undefined;
                //業務員公司別
                var McComID_G = undefined;
                //業務員部門別
                var McMdep_G = undefined;
                //業務員姓名
                var McName_G = undefined;
                //=============================================================分頁工具start
                var pageNumClick = function () {
                    //alert('pageNumClick');
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
                        //alert('show list1');
                        makeHtml();
                    }
                };

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
                //=========================================================================================分頁工具end

                //取得總頁數
                var getTotalPage = function (count) {
                    var pageCount = count / CountPerPage_G;
                    var pageCount1 = Math.floor(pageCount);
                    var remainder = count % CountPerPage_G;
                    if (remainder > 0) {
                        pageCount1 += 1;
                        pageCount = pageCount1;
                    }
                    return pageCount;
                };
                //查詢客戶資料==============================================================================start
                var searchCustomerData = function () {
                    //alert('Query!');
                    // var Q_Analyst = val_M("#smdM_MP") == null ? emptyValue_M : val_M("#smdM_MP");//分析師員工編號
                    //alert(Q_Analyst);
                    //var startDate = val_M("#StartDate");
                    //var endDate = val_M("#EndDate");
                    //var doNext = check_M.isEndDateBigThanStartDate(startDate,endDate);
                    //if (isEmptyStr(startDate) && isEmptyStr(endDate)) {
                    doNext = true;
                    //}
                    if (doNext) {
                        NowPage_G = 1;
                        blockUI_M();
                        //empty_M("#MPMMTELData");
                        //var keyWord = val_M("#keyWord");
                        var Q_Analyst = val_M("#smdM_MP") == null ? emptyValue_M : val_M("#smdM_MP");//分析師員工編號
                        //var Q_Product = val_M("#Q_Product") == null ? emptyValue_M : val_M("#Q_Product");
                        //var data = "keyWord=" + keyWord + "&U_MDEP=" + U_MDEP_M + "&U_Num=" + U_Num_M + "&ComID=" + ComID_M + "&Q_Name=" + $("#Q_Name").val() + "&Q_Tel=" + $("#Q_Tel").val() + "&StartDate=" + startDate + "&EndDate=" + endDate + "&Q_Analyst=" + Q_Analyst + "&Q_Grade=" + $("#Q_Grade").val() + "&Q_Member=" + $("#Q_Member").val() + "&Q_Product=" + Q_Product + "&action=searchMCMSFTFData";
                        var data = "Q_Analyst=" + Q_Analyst + "&action=searchMCMSFTFData";

                        console.log("Q_Analyst = " + Q_Analyst + " & action=searchMCMSFTFData");
                        var searchCustomerDataSuccess = function (back) {
                            MPMMTELDataJson_G = jsonParse_M(back);
                            //alert('show list2');
                            makeHtml();//<===
                            hide_M("#customerAdvSearchDiv");

                        };
                        //alert('Call CustomerManageHandlerUrl_G2');
                        ajax_M(MCMSFTFHandlerrUrl_G, data, searchCustomerDataSuccess);//<===
                    } else {
                        alert("請正確選擇建檔日期區間");
                    }

                };
                //查詢客戶資料==============================================================================end
                //刪除顧客資料
                var deleteMCMCASHData = function (ca_id) {
                    alert("刪除資料" + back);
                    var data = "ca_id=" + ca_id + "&action=deleteMCMCASHData";
                    var success = function (back) {
                        alert("刪除資料" + back);
                        searchCustomerData();

                    };
                    //alert('Call CustomerManageHandlerUrl_G1');
                    ajax_M(MCMSFTFHandlerrUrl_G, data, success);
                };
                //組成畫面20220725進度
                var makeHtml = function () {
                    //alert('取得使用者資料!!');
                    $("#MCMSFTFData").empty();
                    if (MCMSFTFDataJson_G.length != 0) {
                        var sb = new string_M.StringBuilder();
                        var n = 0;
                        var startCount = (NowPage_G - 1) * 30 + 1;
                        var endCount = 30 * NowPage_G;
                        var isMember = false;
                        $.each(MCMSFTFDataJson_G, function (i, v) {
                            n += 1;
                            if (n >= startCount && n <= endCount) {
                                sb.append("<tr><th class='text-center'>");
                                sb.append(i + 1);
                                sb.append("</th><th class='text-center'>");
                                sb.append(v.Sk_No + " " + v.Sk_Name) //股票                      
                                sb.append("</th><th class='text-center'>");
                                sb.append(v.Industrial) //產業別
                                 <%--  <% vrs_Mitem.Open "select ditcode,ddesc From Mitem  where mitcode='STKIT' and del_tag='0' and ditcode<>'0000' and ditcode='"& vrs("Industrial")&"'" ,conn,3,1 %>
                                    < td bgcolor = "F7F6F3" ><%=show_color%><%=vrs_Mitem("ddesc")%></td >--%>
                                
                                sb.append("</th><th class='text-center'>");
                                sb.append(v.Close_Price) //收盤價
                                sb.append("</th><th class='text-center'>");
                                sb.append(v.EPS) //今年EPS
                                sb.append("</th><th class='text-center'>");
                                sb.append() //合理本益比
                                sb.append("</th><th class='text-center'>");
                                sb.append(v.Tg_Price) //目標價
                                sb.append("</th><th class='text-center'>");
                                sb.append(v.Sk_text) //個股說明
                                sb.append("</td > <td class='textAlignCenter'><a href='#' class='openDiv' openDivName='#editCallRecordDetailDiv' thisId='");
                                sb.append("'>修</a></th>");
                                sb.append("<th class='text-center'><a href='#' class='deleteCustomerData delPer' MID='");
                                sb.append(v.M_ID);
                                sb.append("'>刪</a></th>");
                                sb.append("</tr>");
                            }
                        });
                        TotalPage_G = getTotalPage(n);
                        append_M("#MCMSFTFData", sb.toString());//要改的地方
                        // $("#customerData").append(sb.toString());
                        onClick_M(".deleteCustomerData", function () {
                            var MID = $(this).attr("MID");
                            var r = confirm("刪除後資料將無法恢復，確定刪除?");
                            console.log(r);
                            if (r == true) {
                                deleteCustomerData(MID);
                                startThisPage();
                            }

                        });
                        $(".deleteCustomerData").on("click", function () {
                            var MID = $(this).attr("MID");
                            var r = confirm("刪除後資料將無法恢復，確定刪除?");
                            console.log(r);
                            if (r == true) {
                                deleteCustomerData(MID);
                            }

                        });
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

                //刪除顧客資料
                var deleteCustomerData = function (MID) {
                    var data = "M_ID=" + MID + "&action=deleteCustomerData";
                    var success = function (back) {
                        alert("刪除資料" + back);
                        searchSRMVENUData();

                    };
                    //alert('Call CustomerManageHandlerUrl_G1');
                    ajax_M(MCMSFTFHandlerrUrl_G, data, success);
                };

                //查詢個股管理作業資料==============================================================================start
                var searchMCMSFTFData = function () {
                    //alert('searchMCMSFTFData');
                    //var startDate = val_M("#StartDate");
                    //var endDate = val_M("#EndDate");
                    //var doNext = check_M.isEndDateBigThanStartDate(startDate, endDate);
                    ///if (isEmptyStr(startDate) && isEmptyStr(endDate)) {
                    doNext = true;
                    //}
                    if (doNext) {
                        NowPage_G = 1;
                        blockUI_M();
                        //empty_M("#customerData");
                        var keyWord = val_M("#keyWord");//關鍵字 

                        //var Q_Analyst = val_M("#Q_Analyst") == null ? emptyValue_M : val_M("#Q_Analyst");
                        //var Q_Product = val_M("#Q_Product") == null ? emptyValue_M : val_M("#Q_Product");
                        //var data = "keyWord=" + keyWord + "&U_MDEP=" + U_MDEP_M + "&U_Num=" + U_Num_M + "&ComID=" + ComID_M + "&Q_Name=" + $("#Q_Name").val() + "&Q_Tel=" + $("#Q_Tel").val() + "&StartDate=" + startDate + "&EndDate=" + endDate + "&Q_Analyst=" + Q_Analyst + "&Q_Grade=" + $("#Q_Grade").val() + "&Q_Member=" + $("#Q_Member").val() + "&Q_Product=" + Q_Product + "&action=searchCustomerData";
                        var data = "keyWord=" + keyWord + "&action=searchMCMSFTFData";
                        console.log("keyWord=" + keyWord + "&action=searchMCMSFTFData");
                        var success = function (back) {
                            var json = jsonParse_M(back);
                            //alert('GetMCMSFTFDataJson_G');
                            MCMSFTFDataJson_G = jsonParse_M(back);
                            if (back != "成功") {
                                makeHtml();
                            }

                            /* hide_M("#customerAdvSearchDiv");*/

                        };
                        //alert('Call CustomerManageHandlerUrl_G2');
                        ajax_M(MCMSFTFHandlerrUrl_G, data, success);//<===
                    } else {
                        alert("請正確選擇建檔日期區間");
                    }

                };
                //查詢客戶資料==============================================================================end


                //開啟進階搜尋視窗========================start
                var openSearchAdvancedWindow = function () {
                    show_M("#customerAdvSearchDiv");
                    hide_M("#todayContactTab");
                    hide_M("#addCustomerDataDiv");
                };
                //開啟進階搜尋視窗========================end


                //關閉所有次級視窗========================start
                var closeSecondaryWindow = function () {
                    hide_M("#customerAdvSearchDiv");
                    hide_M("#addCustomerDataDiv");
                    hide_M("#todayContactTab");
                    show_M("#customerDataTab");
                    show_M("#pageBar");
                };
                //關閉所有次級視窗========================end
                //openAddMCMSFTFDataWindow
                //打開個股管理作業 - 新增視窗========================start
                var openAddMCMSFTFDataWindow = function () {
                    //alert('openAddMCMSFTFDataWindow');
                    hide_M("#customerAdvSearchDiv");
                    //hide_M("#customerDataTab");
                    show_M("#AddMCMSFTFDataWindow");
                    hide_M("#todayContactTab");
                    hide_M("#pageBar");
                };
                //打開新增客戶資料視窗========================end


                //打開今日聯絡事項視窗========================start
                var openTodayContactWindow = function () {
                    hide_M("#customerAdvSearchDiv");
                    hide_M("#addCustomerDataDiv");
                    show_M("#todayContactTab");
                };
                //打開今日聯絡事項視窗========================end


                //取得今日聯絡事項============================================================start
                //var getTodayConnectionMatterHtml = function () {
                //    var data = "U_Num=" + U_Num_M + "&action=getTodayConnectionMatterHtml";
                //    var getTodayConnectionMatterHtmlSuccess = function (back) {
                //        $("#getTodayConnectionMatterHtml").append(back.toString());
                //    };
                //    //alert('Call CustomerManageHandlerUrl_G3');
                //    ajax_M(CustomerManageHandlerUrl_G, data, getTodayConnectionMatterHtmlSuccess);//<===
                //};
                //取得今日聯絡事項============================================================end


                ////確認欄位資料是否正確==========================================================start
                var checkCol = function () {
                    var back = false;
                    if (check_M.AllRequiredNoEmpty(".addCustomerDataRequired", "requiredItem")) {
                        if (check_M.isROCIDstr(".checkIdFuc", false)) {
                            if (check_M.isEmailFormat(".checkEmailFuc", false)) {
                                if (check_M.AtLeastContact(".contact")) {
                                    if (check_M.isMobileNum(".checkMobile", false)) {
                                        back = true;
                                    }
                                }
                            }
                        }
                    }
                    return back;
                };
                ////確認欄位資料是否正確==========================================================end


                //製作selectTag的業務員列表===============================start
                var makeMClistHtmlTagSelect = function (idOrClassName) {
                    //alert('製作selectTag的業務員列表');

                    //2.送出查詢後，將回來的資料組成option
                    var getMClistSuccess = function (back) {
                        McList_G = jsonParse_M(back);
                        var sb = new string_M.StringBuilder();
                        $.each(McList_G, function (i, v) {
                            sb.append("<option value = '");
                            sb.append(v.U_Num);
                            sb.append("' comid='");
                            sb.append(v.ComID);
                            sb.append("' uMdep='");
                            sb.append(v.U_MDEP);
                            sb.append("' uName='");
                            sb.append(v.U_Name);
                            sb.append("'>");
                            sb.append(v.ComIDname);
                            sb.append("-");
                            sb.append(v.U_Num);
                            sb.append("-");
                            sb.append(v.U_Name);
                            sb.append("</option>");
                        });
                        append_M(idOrClassName, sb.toString());
                        val_M(idOrClassName, U_Num_M);
                    };
                    //1.取得業務員資料
                    $Common.MUSER.getMClist(CommonHandlerUrl_M, U_Num_M, getMClistSuccess);//<=================
                };
                //製作selectTag的業務員列表===============================end


                var getLightStatusFromUmdep = function () {
                    var lightStatus = undefined;
                    if (isEmptyStr(U_MDEP_M)) {
                        lightStatus = "G";
                    } else {
                        if (U_MDEP_M == "0002" || U_MDEP_M == "0007" || U_MDEP_M == "0011" || U_MDEP_M == "0013" || U_MDEP_M == "0015") {
                            lightStatus = "G";
                        } else if (U_MDEP_M == "0006" || U_MDEP_M == "0016") {
                            lightStatus = "Y";
                        } else {
                            lightStatus = "R";
                        }
                    }
                    return lightStatus;
                };


                //檢查手機號碼是否存在之功能系結
                var hasMTel = function () {
                    var MTel = val_M(this);
                    var id = attr_M(this, "id");
                    var data = "MTel=" + MTel + "&action=hasMTel";
                    var success = function (back) {
                        if (!isEmptyStr(back)) {
                            alert(back + "已存在請再次確認。");
                            val_M("#" + id, emptyValue_M);
                        }
                    };
                    //alert('Call CustomerManageHandlerUrl_G4');
                    ajax_M(MCMSFTFHandlerrUrl_G, data, success);//<===
                };
                //在objs取得被勾選的項目並將被勾選的項目存入idOrClassName中
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
                    val_M(idOrClassName, back);
                };

                //新增客戶資料===============================================start
                //20220721進行新增客戶動作!!!!
                var addCustomerData = function () {
                    var Analysts = $('input[name="Analyst"]');
                    var PRODTs = $('input[name="PRODT"]');
                    var MPGOMs = $('input[name="MPGOM"]');
                    getCheckBoxValueStr(Analysts, "#Analyst");
                    getCheckBoxValueStr(PRODTs, "#Product");
                    getCheckBoxValueStr(MPGOMs, "#Program");
                    //確認欄位資料是否正確
                    if (checkCol()) {
                        var OTown = $("#OTown :selected").text() == "請選擇區鄉鎮" ? emptyValue_M : $("#OTown :selected").text();
                        var HTown = $("#HTown :selected").text() == "請選擇區鄉鎮" ? emptyValue_M : $("#HTown :selected").text();
                        var data = "M_Name=" + val_M("#M_Name") +
                            "&M_Sax=" + val_M("#M_Sax") +
                            "&M_Grade=" + val_M("#M_Grade") +
                            "&BirthDay_Date=" + val_M("#BirthDay_Date") +
                            "&MCdata=" + val_M("#MCdata") +
                            "&MC_Name=" + attr_M("#MCdata :selected", "uName") +
                            "&MC_COM=" + attr_M("#MCdata :selected", "comid") +
                            "&OTel_Zone=" + val_M("#OTel_Zone") +
                            "&OTel=" + val_M("#OTel") +
                            "&OTel_Sub=" + val_M("#OTel_Sub") +
                            "&OTel_Zone1=" + val_M("#OTel_Zone1") +
                            "&OTel1=" + val_M("#OTel1") +
                            "&OTel_Sub1=" + val_M("#OTel_Sub1") +
                            "&HTel_Zone=" + val_M("#HTel_Zone") +
                            "&HTel=" + val_M("#HTel") +
                            "&HTel_Zone1=" + val_M("#HTel_Zone1") +
                            "&HTel1=" + val_M("#HTel1") +
                            "&MTel1=" + val_M("#MTel1") +
                            "&MTel2=" + val_M("#MTel2") +
                            "&MTel3=" + val_M("#MTel3") +
                            "&Fax_Zone=" + val_M("#Fax_Zone") +
                            "&Fax=" + val_M("#Fax") +
                            "&Fax_Zone1=" + val_M("#Fax_Zone1") +
                            "&Fax1=" + val_M("#Fax1") +
                            "&M_SD=" + val_M("#M_SD") +
                            "&EMail=" + val_M("#EMail") +
                            "&OCity=" + val_M("#OCity") +
                            "&OTown=" + OTown +
                            "&OZipCode=" + val_M("#OTown") +
                            "&O_Address=" + val_M("#O_Address") +
                            "&HCity=" + val_M("#HCity") +
                            "&HTown=" + HTown +
                            "&HZipCode=" + val_M("#HTown") +
                            "&H_Address=" + val_M("#H_Address") +
                            "&Inv_Money=" + val_M("#Inv_Money") +
                            "&Analyst=" + val_M("#Analyst") +
                            "&Product=" + val_M("#Product") +
                            "&Program=" + val_M("#Program") +
                            "&M_Note=" + val_M("#M_Note") +
                            "&Light_Status=" + getLightStatusFromUmdep() +
                            "&add_ip=" + IP_M +
                            "&add_user=" + U_Num_M + "&action=addEditCustomerData&addEditType=add";
                        var addCustomerDataSuccess = function (back) {
                            alert("新增客戶資料" + back);
                            searchCustomerData();
                            val_M(".addCustomerDataInput", emptyValue_M);
                            val_M(".put02", "02");
                            val_M("#MCdata", U_Num_M);
                            val_M("#M_Sax", "M");
                            hide_M("#addCustomerDataDiv");
                            show_M("#customerDataTab");
                        };
                        Log_M("addCustomerData Ajax data=" + data);
                        //alert('Call CustomerManageHandlerUrl_G5');
                        ajax_M(MCMSFTFHandlerrUrl_G, data, addCustomerDataSuccess);//<===
                    }
                };
                //新增客戶資料===============================================end

                var getKeywordList = function () {

                    var keyWord = val_M("#keyWord");
                    var data = "keyWord=" + keyWord + "&action=getKeywordList";
                    Log_M("getKeywordList data=" + data);
                    var success = function (back) {
                        Log_M("getKeywordList back=" + back);
                        var json = jsonParse_M(back);
                        $(function () {
                            $("#keyWord").autocomplete({
                                source: function (request, response) {
                                    var results = $.ui.autocomplete.filter(json, request.term);
                                    response(results.slice(0, 10));
                                },
                            });
                        })
                    };
                    var error = function (e) { Log_M("getKeywordList error=" + e); unBlockUI_M(); };
                    //alert('Call CustomerManageHandlerUrl_G6');
                    ajax_M(CustomerManageHandlerUrl_G, data, success, error);
                };

                //進行頁面處理===============================================start
                var startThisPage = function () {
                    show_M("#customerDataTab");
                    //關閉所有次視窗之功能系結
                    //onClick_M(".closeSecondaryWindow", closeSecondaryWindow);
                    //開啟"進階查詢"視窗之功能系結
                    //onClick_M("#openSearchAdvancedWindow", openSearchAdvancedWindow);
                    //開啟"今日聯繫"視窗之功能系結
                    //onClick_M("#openTodayContactWindow", openTodayContactWindow);
                    //開啟"新增客戶資料"視窗之功能系結
                    //onClick_M("#openAddCustomerDataWindow", openAddCustomerDataWindow);
                    //"新增個股管理作業之功能系結
                    //onClick_M("#AddMCMSFTFDataWindowBtn", openAddMCMSFTFDataWindow);
                    //查詢之功能系結searchCustomerData
                    onClick_M(".searchCustomerDataFuc", searchCustomerData);
                    //alert('click_M("#searchCustomerData");');
                    //click_M("#searchCustomerData");
                    searchMCMSFTFData();
                    show_M("#customerDataTab");
                    //取得今日聯絡事項
                    //取得投資金額HtmlTagOption列表
                    //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getInvestMoneyListFuc", "INVMY", "option");
                    ////getTodayConnectionMatterHtml();
                    ////取得分析師列表HtmlTagOption列表
                    $Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, ".getAnalystListFuc", emptyValue_M, "option");
                    //$Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "#AnalystCheckBoxDiv", ComID_M, "checkbox");
                    ////取得商品列表HtmlTagOption列表
                    //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getProductListFuc", "PRODT", "option");
                    //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#ProductCheckBoxDiv", "PRODT", "checkbox");
                    ////取得電話來源HtmlTagOption列表
                    //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getProgrmListFuc", "MPGOM", "option");
                    //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#ProgramCheckboxDiv", "MPGOM", "checkbox");
                    ////取得投資金額HtmlTagOption列表
                    //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getInvestMoneyListFuc", "INVMY", "option");
                    ////取得電話區碼
                    //$CommonTool.Tel.getZoneCodeHtmlTagOption(".getZoneCode");
                    ////製作selectTag的城市及鄉鎮列表
                    //$CommonTool.Address.makeCityListAndTownListHtmlTagSelect("#HCity", "#HTown", undefined, undefined);
                    //$CommonTool.Address.makeCityListAndTownListHtmlTagSelect("#OCity", "#OTown", undefined, undefined);
                    ////製作業務員selectTag
                    //makeMClistHtmlTagSelect("#MCdata");
                    ////控制只能輸入數字之功能系結
                    //$CommonTool.Number.onlyNumber(".onlyNumber");
                    ////檢查手機號碼是否存在之功能系結
                    //onChange_M(".checkMobile", hasMTel);
                    ////查詢之功能系結
                    //onClick_M(".searchCustomerDataFuc", searchCustomerData);
                    ////alert('click_M("#searchCustomerData");');
                    //click_M("#searchCustomerData");
                    //getKeywordList();
                    ////設定權限
                    setPermission_M();

                };
                //頁面載入後自動執行
                $(function () {

                    startThisPage();
                    //查看使用者權限
                    //getUserAuthority_M(startThisPage);
                })


            </script>
</div>
</div>
     </div>
</asp:Content>

