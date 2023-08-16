<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MCMCASH_query.aspx.cs" Inherits="wealthManage_custermerManage_MMBER_customerManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 6%;
            height: 46px;
        }

        .auto-style2 {
            width: 10%;
            height: 46px;
        }

        .auto-style3 {
            width: 8%;
            height: 46px;
        }

        .auto-style4 {
            width: 11%;
            height: 46px;
        }

        .auto-style5 {
            width: 14%;
            height: 46px;
        }

        .auto-style6 {
            width: 4%;
            height: 46px;
        }

        .auto-style7 {
            width: 16%;
            height: 46px;
        }

        .auto-style8 {
            width: 2%;
            height: 46px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- <script src="<%=getRelativePath()%>js/common/CommonTool.js" type="text/javascript"></script>-->
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
                            <h1 class="box-title"><b>ERP > 財富管理部 > 線上付費暨委任契約書簽署</b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title="">
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <!-- <table class="table table-bordered table-condensed"> -->

                            <div style="text-align: center">
                            </div>





                            <table class="table table-hover" id="customerDataTab">
                                <thead>
                                    <tr class="active">

                                        <%-- <th class="" colspan="4">
                                            
                                                付款狀態：
                                           <select class="form-control getMCOTFListFuc" id="CF_ITem">
                                               <option value="">不限</option>
                                               <option value="">付款成功</option>
                                               <option value="">付款失敗</option>
                                           </select>
                                               
                                            
                                        </th>--%>
                                        <th class="" colspan="3">付款狀態：&nbsp;<span><span class="inputSearch marginRight20"><%--<select id="MP_Item" class="form-control" ><option value="">請選擇</option></select>--%>
                                            <select class="form-control" id="Pay_Status">
                                                <option value="" selected>不限</option>
                                                <option value="1">付款成功</option>
                                                <option value="0">付款失敗</option>
                                            </select>
                                        </span></span>
                                        </th>
                                        <th class="" colspan="4">案件狀態：&nbsp;<span><span class="inputSearch marginRight20"><%--<select id="MP_Item" class="form-control" ><option value="">請選擇</option></select>--%>
                                            <select class="form-control" id="Done_Tag">
                                                <option value="" selected>不限</option>
                                                <option value="0">成功</option>
                                                <option value="1">未簽署</option>
                                            </select>
                                        </span></span>
                                        </th>
                                        <th class="" colspan="3">
                                            <div class="input-group">
                                                <input type="text" name="keyWord" placeholder="查尋關鍵字..." class="form-control" id="keyWord">

                                                <span class="input-group-btn">
                                                    <button type="button" class="btn btn-info btn-flat searchMCMCASHDataFuc qPer" id="searchMCMCASHData">查詢</button>
                                                </span>
                                        </th>
                                        <th class="" colspan="1"></th>
                                        <th class="" colspan="1"></th>
                                        <th class="" colspan="2">page&nbsp;：&nbsp;<span id="pageNum"></span></th>
                                    </tr>

                                    <tr class="bgBlue">
                                        <th class="auto-style1" style="text-align: center;">單號</th>
                                        <th class="auto-style2" style="text-align: center;">登入代碼</th>
                                        <th class="auto-style1" style="text-align: center;">手機</th>
                                        <th class="auto-style3" style="text-align: center;">產品</th>
                                        <th class="auto-style4" style="text-align: center;">價格</th>
                                        <th class="auto-style4" style="text-align: center;">期間</th>
                                        <th class="auto-style4" style="text-align: center;">會員姓名</th>
                                        <th class="auto-style5" style="text-align: center;">提案人</th>
                                        <th class="auto-style2" style="text-align: center;">提案日期</th>
                                        <th class="auto-style6" style="text-align: center;">付款狀態</th>
                                        <th class="auto-style7" style="text-align: center;">簽署狀態</th>
                                        <th class="auto-style1" style="text-align: center;">說明</th>
                                        <th class="auto-style8" style="text-align: center;">刪</th>
                                    </tr>
                                </thead>
                                <tbody id="mcmcashData">
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
            <!-- /.row (main row) -->

        </section>
        <!-- /.content -->

    </div>

    <script>
        var MCMCASHHandlerUrl_G = "MCMCASHHandler.ashx";
        /*  var CustomerManageHandlerUrl_G = "customerManageHandler.ashx";*/
        // var CustomerDataJson_G = null;
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

        //刪除顧客資料(deleteMCMCASHData)
        var deleteMCMCASHData = function (ca_id) {
            alert('ca_id'+ca_id)
            var data = "ca_id=" + ca_id + "&action=deleteMCMCASHData";
            var success = function (back) {
                //alert("刪除資料" + back);
                searchMCMCASHData();

            };
            ajax_M(MCMCASHHandlerUrl_G, data, success);
        };

        
        //產生資料畫面
        var makeHtml = function () {
            //alert('取得使用者資料!!');
            //mcmcashData(線上付費暨委任契約書簽署)

            $("#mcmcashData").empty();
            if (MCMCASHHandlerUrl_G.length != 0) {
                var sb = new string_M.StringBuilder();
                var n = 0;
                var startCount = (NowPage_G - 1) * 30 + 1;
                var endCount = 30 * NowPage_G;
                var isMember = false;
                //20220713進度,顯示資料列
                //CustomerDataJson_G=>(MCMCASHDataJson_G)
                $.each(MCMCASHDataJson_G, function (i, v) {
                    n += 1;
                    if (n >= startCount && n <= endCount) {
                        sb.append("<tr><th class='text-center'>");
                        sb.append(i + 1);//單號
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.Pay_Serial);//登入代碼
                        sb.append("</th>");
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.C_Tel);//手機
                        sb.append("</th>");
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.P_Name);//產品
                        sb.append("</th>");
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.Price);//價格
                        sb.append("</th>");
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.T_Sdate);//期間(起)
                        sb.append("~");
                        sb.append(v.T_Edate);//期間(迄)
                        sb.append("</th><th class='text-center'>");
                        sb.append("<a class='BlueLink10 qPer' href='customerManage/MMBER/customerDetail.aspx?M_ID=");//連結到[客戶資料明細表]頁面
                        sb.append(v.M_id);
                        sb.append("&MENU_no=");
                        sb.append(MENU_no_G);
                        sb.append("&ERPcustomerWebPayMENU_no=");
                        sb.append(ERPcustomerWebPayMENUno_M.split('MENU_no=')[1]);
                        sb.append("' target='_blank'>");
                        sb.append(v.Member_Name);//會員姓名
                        sb.append("</a></th>");
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.MC_name);//提案人
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.add_date);//提案日期
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.PayStatus_Txt);//付款狀態
                        //if(v.Pay)
                        sb.append("</th><th class='text-center'>");//簽署狀態
                        if (v.Done_Tag == "1") {
                            sb.append("<font color=gray>");
                            sb.append("<font color=gray>未簽署</font>");
                        }
                        else if (v.Done_Tag == "0") {
                            sb.append("<a href=https://www.hwa-guan.com.tw/file/RAPDF/");
                            sb.append(v.ContractID);
                            sb.append(".pdf target = twcapdf > <font color=blue>成功</font></a > <br>");
                           
                                //+ v.contractid + ".pdf target=twcapdf><font color=blue>成功</font></a><br>" + v.ca_id);
                            /*sb.append(v.Done_Tag_Txt);//簽署狀態*/
                            //sb.append("</font>");
                        } 
                        else
                        {
                            sb.append("<font color=RED>失敗</font>");//簽署狀態
                        }
                            sb.append("</th>");
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.o_id);
                        sb.append("<br>");
                        sb.append(v.od_payorderid);
                        sb.append("<br>");
                        sb.append(v.Payway);
                        //sb.append(v.add_date);//說明
                        if (v.Card4NO != "") { 
                        sb.append("<br><span>卡末4碼:</span>");
                        sb.append(v.Card4NO)
                        }
                    sb.append("</th>");
                    sb.append("<th class='text-center'><a href='#' class='deleteMCMCASHData delPer' ca_id='");
                    sb.append(v.ca_id);//刪除
                    sb.append("'>刪</a></th>");
                    sb.append("</tr>");
                }
                                             });
            TotalPage_G = getTotalPage(n);
            append_M("#mcmcashData", sb.toString());
            // $("#customerData").append(sb.toString());
                onClick_M(".deleteMCMCASHData", function () {
                    var ca_id = $(this).attr("ca_id");
                var r = confirm("刪除後資料將無法恢復，確定刪除?");
                console.log(r);
                if (r == true) {
                    deleteMCMCASHData(ca_id);
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

        //按下[查詢]線上付費暨委任契約書簽署資料==============================================================================start
        var searchMCMCASHData = function () {
            //20220713進度!!!!將變數傳入顯示資料動作中!!!!
            //alert('Search');
            //20220718
            //取得關鍵字
            var keyWord = val_M("#keyWord");//取得關鍵字
            var Pay_Status_Val = val_M("#Pay_Status");
            var Done_Tag_Val = val_M("#Done_Tag");
            //alert("Case_Status " + Case_Status_Val);
            //alert("Pay_Status:" + Pay_Status_Val);
            //alert("Done_Tag:" + Done_Tag_Val);//20220719進度(修改此項查詢條件!!!)
            //alert("keyWord:" + keyWord);
            //alert("U_MDEP_M:" + U_MDEP_M);
            //alert("U_Num_M"+U_Num_M);
            //alert("ComID_G" + ComID_M);
            //alert('click searchMCMCASHData');
            //alert("keyWord" + keyWord);
            //var doNext = check_M.isEndDateBigThanStartDate(startDate, endDate);
            //if (isEmptyStr(startDate) && isEmptyStr(endDate)) {
            doNext = true;
            //}
            if (doNext) {
                NowPage_G = 1;
                blockUI_M();
                empty_M("#mcmcashData");
                var keyWord = val_M("#keyWord");
                //var Q_Analyst = val_M("#Q_Analyst") == null ? emptyValue_M : val_M("#Q_Analyst");
                //var Q_Product = val_M("#Q_Product") == null ? emptyValue_M : val_M("#Q_Product");
                /*var data = "keyWord=" + keyWord + "&U_MDEP=" + U_MDEP_M + "&U_Num=" + U_Num_M + "&ComID=" + ComID_M + "&Q_Name=" + $("#Q_Name").val() + "&Q_Tel=" + $("#Q_Tel").val() + "&StartDate=" + startDate + "&EndDate=" + endDate + "&Q_Analyst=" + Q_Analyst + "&Q_Grade=" + $("#Q_Grade").val() + "&Q_Member=" + $("#Q_Member").val() + "&Q_Product=" + Q_Product + "&action=searchCustomerData";*/
                //var data = "action=searchMCMCASHData";
                var data = "keyWord=" + keyWord + "&Pay_Status=" + Pay_Status_Val + "&Done_Tag=" + Done_Tag_Val + "&action=searchMCMCASHData";
                console.log("keyWord=" + keyWord + "&Pay_Status=" + Pay_Status_Val + "&Done_Tag=" + Done_Tag_Val + "&action=searchMCMCASHData");
                var searchMCMCASHDataSuccess = function (back) {
                    MCMCASHDataJson_G = jsonParse_M(back);
                    //alert('show list2');
                    makeHtml();//<===
                    hide_M("#customerAdvSearchDiv");

                };
                //alert('MCMCASHHandlerUrl_G');
                ajax_M(MCMCASHHandlerUrl_G, data, searchMCMCASHDataSuccess);//<===
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

        //打開新增客戶資料視窗========================start
        var openAddCustomerDataWindow = function () {
            hide_M("#customerAdvSearchDiv");
            hide_M("#customerDataTab");
            show_M("#addCustomerDataDiv");
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
        var getTodayConnectionMatterHtml = function () {
            var data = "U_Num=" + U_Num_M + "&action=getTodayConnectionMatterHtml";
            var getTodayConnectionMatterHtmlSuccess = function (back) {
                $("#getTodayConnectionMatterHtml").append(back.toString());
            };
            //alert('Call CustomerManageHandlerUrl_G3');
            ajax_M(MCMCASHHandlerUrl_G, data, getTodayConnectionMatterHtmlSuccess);//<===
        };
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
            ajax_M(MCMCASHHandlerUrl_G, data, success);//<===
        };
        //取得被勾選的項目
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
        //var addCustomerData = function () {
        //    var Analysts = $('input[name="Analyst"]');
        //    var PRODTs = $('input[name="PRODT"]');
        //    var MPGOMs = $('input[name="MPGOM"]');
        //    getCheckBoxValueStr(Analysts, "#Analyst");
        //    getCheckBoxValueStr(PRODTs, "#Product");
        //    getCheckBoxValueStr(MPGOMs, "#Program");
        //    //確認欄位資料是否正確
        //    if (checkCol()) {
        //        var OTown = $("#OTown :selected").text() == "請選擇區鄉鎮" ? emptyValue_M : $("#OTown :selected").text();
        //        var HTown = $("#HTown :selected").text() == "請選擇區鄉鎮" ? emptyValue_M : $("#HTown :selected").text();
        //        var data = "M_Name=" + val_M("#M_Name") +
        //            "&M_Sax=" + val_M("#M_Sax") +
        //            "&M_Grade=" + val_M("#M_Grade") +
        //            "&BirthDay_Date=" + val_M("#BirthDay_Date") +
        //            "&MCdata=" + val_M("#MCdata") +
        //            "&MC_Name=" + attr_M("#MCdata :selected", "uName") +
        //            "&MC_COM=" + attr_M("#MCdata :selected", "comid") +
        //            "&OTel_Zone=" + val_M("#OTel_Zone") +
        //            "&OTel=" + val_M("#OTel") +
        //            "&OTel_Sub=" + val_M("#OTel_Sub") +
        //            "&OTel_Zone1=" + val_M("#OTel_Zone1") +
        //            "&OTel1=" + val_M("#OTel1") +
        //            "&OTel_Sub1=" + val_M("#OTel_Sub1") +
        //            "&HTel_Zone=" + val_M("#HTel_Zone") +
        //            "&HTel=" + val_M("#HTel") +
        //            "&HTel_Zone1=" + val_M("#HTel_Zone1") +
        //            "&HTel1=" + val_M("#HTel1") +
        //            "&MTel1=" + val_M("#MTel1") +
        //            "&MTel2=" + val_M("#MTel2") +
        //            "&MTel3=" + val_M("#MTel3") +
        //            "&Fax_Zone=" + val_M("#Fax_Zone") +
        //            "&Fax=" + val_M("#Fax") +
        //            "&Fax_Zone1=" + val_M("#Fax_Zone1") +
        //            "&Fax1=" + val_M("#Fax1") +
        //            "&M_SD=" + val_M("#M_SD") +
        //            "&EMail=" + val_M("#EMail") +
        //            "&OCity=" + val_M("#OCity") +
        //            "&OTown=" + OTown +
        //            "&OZipCode=" + val_M("#OTown") +
        //            "&O_Address=" + val_M("#O_Address") +
        //            "&HCity=" + val_M("#HCity") +
        //            "&HTown=" + HTown +
        //            "&HZipCode=" + val_M("#HTown") +
        //            "&H_Address=" + val_M("#H_Address") +
        //            "&Inv_Money=" + val_M("#Inv_Money") +
        //            "&Analyst=" + val_M("#Analyst") +
        //            "&Product=" + val_M("#Product") +
        //            "&Program=" + val_M("#Program") +
        //            "&M_Note=" + val_M("#M_Note") +
        //            "&Light_Status=" + getLightStatusFromUmdep() +
        //            "&add_ip=" + IP_M +
        //            "&add_user=" + U_Num_M + "&action=addEditCustomerData&addEditType=add";
        //        var addCustomerDataSuccess = function (back) {
        //            alert("新增客戶資料" + back);
        //            searchCustomerData();
        //            val_M(".addCustomerDataInput", emptyValue_M);
        //            val_M(".put02", "02");
        //            val_M("#MCdata", U_Num_M);
        //            val_M("#M_Sax", "M");
        //            hide_M("#addCustomerDataDiv");
        //            show_M("#customerDataTab");
        //        };
        //        Log_M("addCustomerData Ajax data=" + data);
        //        //alert('Call CustomerManageHandlerUrl_G5');
        //        ajax_M(MCMCASHHandlerUrl_G, data, addCustomerDataSuccess);//<===
        //    }
        //};
        //新增客戶資料===============================================end

        //var getKeywordList = function () {

        //    var keyWord = val_M("#keyWord");
        //    var data = "keyWord=" + keyWord + "&action=getKeywordList";
        //    Log_M("getKeywordList data=" + data);
        //    var success = function (back) {
        //        Log_M("getKeywordList back=" + back);
        //        var json = jsonParse_M(back);
        //        $(function () {
        //            $("#keyWord").autocomplete({
        //                source: function (request, response) {
        //                    var results = $.ui.autocomplete.filter(json, request.term);
        //                    response(results.slice(0, 10));
        //                },
        //            });
        //        })
        //    };
        //    var error = function (e) { Log_M("getKeywordList error=" + e); unBlockUI_M(); };
        //    //alert('Call CustomerManageHandlerUrl_G6');
        //    ajax_M(MCMCASHHandlerUrl_G, data, success, error);
        //};

        //進行頁面處理===============================================start
        var startThisPage = function () {
            ////關閉所有次視窗之功能系結
            //onClick_M(".closeSecondaryWindow", closeSecondaryWindow);
            ////開啟"進階查詢"視窗之功能系結
            //onClick_M("#openSearchAdvancedWindow", openSearchAdvancedWindow);
            ////開啟"今日聯繫"視窗之功能系結
            //onClick_M("#openTodayContactWindow", openTodayContactWindow);
            ////開啟"新增客戶資料"視窗之功能系結
            //onClick_M("#openAddCustomerDataWindow", openAddCustomerDataWindow);
            ////"新增客戶資料"之功能系結
            //onClick_M("#addCustomerDataBtn", addCustomerData);
            ////取得今日聯絡事項
            //getTodayConnectionMatterHtml();
            ////取得分析師列表HtmlTagOption列表
            //$Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, ".getAnalystListFuc", emptyValue_M, "option");
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
            onClick_M(".searchMCMCASHDataFuc", searchMCMCASHData);
            //alert('click_M("#searchCustomerData");');
            click_M("#searchMCMCASHData");
            //searchMCMCASHData();
            //設定權限
            setPermission_M();

        };


        $(function () {
            //查看使用者權限
            getUserAuthority_M(startThisPage);
        })
    </script>
</asp:Content>

