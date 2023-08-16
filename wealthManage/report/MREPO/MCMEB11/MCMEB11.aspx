<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MCMEB11.aspx.cs" Inherits="wealthManage_report_MREPO_MCMEB11_MCMEB11" %>

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
                            <h1 class="box-title"><b>ERP &gt;  報表區 &gt;</b>網站收入業績表</h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-hover" id="">
                                <thead id="">
                                    <tr class="active">
                                        <th class="width20percent">
                                            <label>起始日:</label>
                                            <input type="text" id="StartDate" class="datepicker form-control " placeholder="開始日">
                                        </th>
                                        <th class="width20percent">
                                            <label>結束日:</label>
                                            <input type="text" id="EndDate" class="datepicker form-control " placeholder="結束日">
                                        </th>
                                        <th class="width20percent">
                                            <label>公司:</label>
                                            <select id="ComID" class="form-control ComIDUMDEP">
                                                <option value="">不限</option>
                                                <option value="HG01">華冠-營1</option>
                                                <option value="HG02">華冠-投資</option>
                                                <option value="HG03">華冠-財富</option>
                                                <option value="HG04">華冠-理財</option>
                                                <option value="HG05">華冠-營2</option>
                                                <option value="HG06">華冠-網事</option>
                                            </select>
                                        </th>
                                       
                                        <th class="width20percent">
                                            

                                            <label>
                                            部門:</label>
                                            <select id="U_MDEP0" class="form-control" name="D1">
                                            </select></th>
                                    </tr>
                                </thead>
                            </table>
                            <%--<div id="printArea">

                         </div>--%>
                            <div class="box-body" id="exportExcel">
                                <table class="table">
                                    <thead>
                                        <tr class="active">
                                            <th class="" colspan="9">
                                                <div class="input-group">
                                                   
                                                    <span class="inputSearch3">
                                                        <label>分析師:</label>
                                                        <select class="form-control" id="DM_tag">
                                                            <option value="">不限(註記類別)</option>
                                                            <option value="1">短註記</option>
                                                            <option value="2">長註記</option>

                                                        </select>
                                                    </span>
                                                    <span class="inputSearch2">
                                                        <label>會員種類:</label>
                                                        <select class="form-control" id="MC"></select>
                                                    </span>
                                                    <span class="inputSearch2">
                                                        <label>責任助理:</label>
                                                        <select class="form-control" id="bMC"></select>
                                                    </span>

                                                    <span class="inputSearch2">
                                                        <button type="button" class="btn btn-info btn-flat " id="search">查詢</button>
                                                    </span>

                                                </div>
                                            </th>
                                        </tr>

                                        <tr class="marginTop5px bgColor">
                                            <th class="textAlignCenter  leftSideWhite" style="width: 3%">序
                                            </th>
                                            <th class="textAlignCenter  leftSideWhite" style="width: 6%">客戶姓名
                                            </th>
                                            <th class="textAlignCenter  leftSideWhite" style="width: 20%">聯絡電話
                                            </th>
                                            <th class="textAlignCenter  leftSideWhite" style="width: 10%">聯絡手機
                                            </th>
                                            <th class="textAlignCenter  leftSideWhite" style="width: 6%">公司別
                                            </th>
                                            <th class="textAlignCenter  leftSideWhite" style="width: 10%">註記日期
                                            </th>
                                            <th class="textAlignCenter  leftSideWhite" style="width: 6%">註記種類
                                            </th>
                                            <th class="textAlignCenter  leftSideWhite" style="width: 6%">註記業務
                                            </th>
                                            <th class="textAlignCenter  leftSideWhite" style="width: 6%">所屬助理
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody id="companyResourceTagTb">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        var reportHandlerMCMEB11Url_G = "reportHandlerMCMEB11.ashx";

        var DetailPerformanceDataList = [];
        var DetailPerformanceDataListCount = 0;
        var DetailPerformanceNameList = ["鎖碼影音", "活動表單成交件", "匯入名單成交件", "索取研究報告成交件"];
        var TransactionCountList = undefined;
        var makeDetailPerformanceTabel = function (startDate, endDate) {
            Log_M("Start makeDetailPerformanceTabel");
            var tempMid = undefined;
            var totalT_PayMoney = 0;
            var totalT_PayMoneyDouble = 0;
            var comidTotalT_PayMoney = 0;
            var comidTotalT_PayMoneyDouble = 0;
            var AllTotalT_PayMoney = 0;
            var AllTotalT_PayMoneyDouble = 0;
            var tempT_PayMoney = 0;
            var tempT_PayMoneyDouble = 0;
            var sb = null;
            empty_M("#printArea");
            $.each(DetailPerformanceDataList, function (k, kk) {
                sb = new StringBuilder_M();
                var json = jsonParse_M(DetailPerformanceDataList[k]);
                if (k == 0) {
                    sb.append("<div class='textAlignCenter'>");
                    sb.append("<h3 class='table table-hover'>網路事業業績表</h3>");
                    sb.append("</div>");
                    sb.append("<p><span>日期</span>:");
                    sb.append(startDate);
                    sb.append(" - ");
                    sb.append(endDate);
                    sb.append("</p>");
                }
                sb.append("<table class='table table-hover'>");
                sb.append("<thead>");
                sb.append("<tr class ='bgBlue'><th class='textAlignCenter'>");
                sb.append(DetailPerformanceNameList[k]);
                if (k > 0) {
                    sb.append("(");
                    sb.append(TransactionCountList[k]);
                    sb.append("件)");
                }

                sb.append("</th></tr>");
                sb.append("<tr class ='bgBlue'>");
                sb.append("<th class='textAlignCenter'>序號</th>");
                sb.append("<th class='textAlignCenter'>入帳日</th>");
                sb.append("<th class='textAlignCenter'>客戶姓名</th>");
                sb.append("<th class='textAlignCenter'>會員編號</th>");
                sb.append("<th class='textAlignCenter'>分析師</th>");
                sb.append("<th class='textAlignCenter'>種類</th>");
                sb.append("<th class='textAlignCenter'>責任助理</th>");
                sb.append("<th class='textAlignCenter'>入會金額</th>");
                sb.append("<th class='textAlignCenter'>入賬細節</th>");

                sb.append("</tr>");
                sb.append("</thead>");
                sb.append("<tbody>");
                $.each(json, function (i, v) {
                    if (k == 0) {
                        sb.append("<tr>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(i + 1);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(split_M(v.T_AccountDate, " ", 0));
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.M_Name);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.M_Num);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.MP_Name);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.T_ItemName);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.mc_name);
                        sb.append("</td>");

                        if (hasStr_M(v.T_PayMoney, "-")) {
                            sb.append("<td class='textAlignCenter colorRed'>");
                        } else {
                            sb.append("<td class='textAlignCenter'>");
                        }
                        tempT_PayMoney = parseFloat(v.T_PayMoney);
                        totalT_PayMoney += tempT_PayMoney;
                        comidTotalT_PayMoney += tempT_PayMoney;
                        AllTotalT_PayMoney += tempT_PayMoney;
                        sb.append(getMoneyFormat_M(Math.round(v.T_PayMoney)));
                        sb.append("</td>");
                        sb.append("<td class=''>");
                        sb.append("<div ><span class='textAlignCenter span1'>");
                        sb.append(v.Pay_TypeName);
                        if (v.INV_open_Item == "2") {
                            sb.append("<span class='colorGreen'>(手開)</span>");
                        }
                        sb.append("</span>");
                        sb.append("  ");
                        sb.append("<span class='textAlignCenter span2'>");
                        sb.append(v.mc_name);
                        sb.append("</span>");
                        sb.append("  ");
                        tempT_PayMoneyDouble = parseFloat(v.T_PayMoneyDouble);
                        totalT_PayMoneyDouble += tempT_PayMoneyDouble;
                        comidTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                        AllTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                        if (hasStr_M(v.T_PayMoneyDouble, "-")) {
                            sb.append("<span class='textAlignCenter span3 colorRed'>");
                        } else {
                            sb.append("<span class='textAlignCenter span3'>");
                        }

                        sb.append(getMoneyFormat_M(Math.round(v.T_PayMoneyDouble)));
                        sb.append("</span></div>");
                        if (!isEmptyStr(v.Pay_TypeName2)) {
                            sb.append("<div class=''><span class='textAlignCenter span1'>");
                            sb.append(v.Pay_TypeName2);
                            if (v.INV_open_Item == "2") {
                                sb.append("<span class='colorGreen'>(手開)</span>");
                            }
                            sb.append("</span>");
                            sb.append("  ");
                            sb.append("<span class='textAlignCenter span2'>");
                            sb.append(v.mc_name2);
                            sb.append("</span>");
                            sb.append("  ");
                            tempT_PayMoneyDouble = parseFloat(v.T_PayMoneyDouble2);
                            totalT_PayMoneyDouble += tempT_PayMoneyDouble;
                            comidTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                            AllTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                            if (hasStr_M(v.T_PayMoneyDouble2, "-")) {
                                sb.append("<span class='textAlignCenter span3 colorRed'>");
                            } else {
                                sb.append("<span class='textAlignCenter span3'>");
                            }
                            sb.append(getMoneyFormat_M(Math.round(v.T_PayMoneyDouble2)));
                            sb.append("</span></div>");
                        }
                        if (!isEmptyStr(v.Pay_TypeName3)) {

                            sb.append("<div class=''><span class='textAlignCenter span1'>");
                            sb.append(v.Pay_TypeName3);
                            if (v.INV_open_Item == "2") {
                                sb.append("<span class='colorGreen'>(手開)</span>");
                            }
                            sb.append("</span>");
                            sb.append("  ");
                            sb.append("<span class='textAlignCenter span2'>");
                            sb.append(v.mc_name3);
                            sb.append("</span>");
                            sb.append("  ");
                            tempT_PayMoneyDouble = parseFloat(v.T_PayMoneyDouble3);
                            totalT_PayMoneyDouble += tempT_PayMoneyDouble;
                            comidTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                            AllTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                            if (hasStr_M(v.T_PayMoneyDouble3, "-")) {
                                sb.append("<span class='textAlignCenter span3 colorRed'>");
                            } else {
                                sb.append("<span class='textAlignCenter span3'>");
                            }
                            sb.append(getMoneyFormat_M(Math.round(v.T_PayMoneyDouble3)));
                            sb.append("</span></div>");
                        }
                        sb.append("</td>");
                        sb.append("</tr>");
                    } else if (k >= 1) {
                        if (v.showTag == "1") {
                            sb.append("<tr>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(i + 1);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(split_M(v.T_AccountDate, " ", 0));
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.M_Name);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.M_Num);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.MP_Name);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.T_ItemName);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.mc_name);
                            sb.append("</td>");

                            if (hasStr_M(v.T_PayMoney, "-")) {
                                sb.append("<td class='textAlignCenter colorRed'>");
                            } else {
                                sb.append("<td class='textAlignCenter'>");
                            }
                            tempT_PayMoney = parseFloat(v.T_PayMoney);
                            totalT_PayMoney += tempT_PayMoney;
                            comidTotalT_PayMoney += tempT_PayMoney;
                            AllTotalT_PayMoney += tempT_PayMoney;
                            sb.append(getMoneyFormat_M(Math.round(v.T_PayMoney)));
                            sb.append("</td>");
                            sb.append("<td class=''>");
                            sb.append("<div ><span class='textAlignCenter span1'>");
                            sb.append(v.Pay_TypeName);
                            if (v.INV_open_Item == "2") {
                                sb.append("<span class='colorGreen'>(手開)</span>");
                            }
                            sb.append("</span>");
                            sb.append("  ");
                            sb.append("<span class='textAlignCenter span2'>");
                            sb.append(v.mc_name);
                            sb.append("</span>");
                            sb.append("  ");
                            tempT_PayMoneyDouble = parseFloat(v.T_PayMoneyDouble);
                            totalT_PayMoneyDouble += tempT_PayMoneyDouble;
                            comidTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                            AllTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                            if (hasStr_M(v.T_PayMoneyDouble, "-")) {
                                sb.append("<span class='textAlignCenter span3 colorRed'>");
                            } else {
                                sb.append("<span class='textAlignCenter span3'>");
                            }

                            sb.append(getMoneyFormat_M(Math.round(v.T_PayMoneyDouble)));
                            sb.append("</span></div>");
                            if (!isEmptyStr(v.Pay_TypeName2)) {
                                sb.append("<div class=''><span class='textAlignCenter span1'>");
                                sb.append(v.Pay_TypeName2);
                                if (v.INV_open_Item == "2") {
                                    sb.append("<span class='colorGreen'>(手開)</span>");
                                }
                                sb.append("</span>");
                                sb.append("  ");
                                sb.append("<span class='textAlignCenter span2'>");
                                sb.append(v.mc_name2);
                                sb.append("</span>");
                                sb.append("  ");
                                tempT_PayMoneyDouble = parseFloat(v.T_PayMoneyDouble2);
                                totalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                comidTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                AllTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                if (hasStr_M(v.T_PayMoneyDouble2, "-")) {
                                    sb.append("<span class='textAlignCenter span3 colorRed'>");
                                } else {
                                    sb.append("<span class='textAlignCenter span3'>");
                                }
                                sb.append(getMoneyFormat_M(Math.round(v.T_PayMoneyDouble2)));
                                sb.append("</span></div>");
                            }
                            if (!isEmptyStr(v.Pay_TypeName3)) {

                                sb.append("<div class=''><span class='textAlignCenter span1'>");
                                sb.append(v.Pay_TypeName3);
                                if (v.INV_open_Item == "2") {
                                    sb.append("<span class='colorGreen'>(手開)</span>");
                                }
                                sb.append("</span>");
                                sb.append("  ");
                                sb.append("<span class='textAlignCenter span2'>");
                                sb.append(v.mc_name3);
                                sb.append("</span>");
                                sb.append("  ");
                                tempT_PayMoneyDouble = parseFloat(v.T_PayMoneyDouble3);
                                totalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                comidTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                AllTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                if (hasStr_M(v.T_PayMoneyDouble3, "-")) {
                                    sb.append("<span class='textAlignCenter span3 colorRed'>");
                                } else {
                                    sb.append("<span class='textAlignCenter span3'>");
                                }
                                sb.append(getMoneyFormat_M(Math.round(v.T_PayMoneyDouble3)));
                                sb.append("</span></div>");
                            }
                            sb.append("</td>");
                            sb.append("</tr>");
                        }
                    }

                });
                sb.append("<tr class ='bgBlue'>");
                sb.append("<td class='textAlignCenter'>");
                sb.append("合計");
                sb.append("</td>");
                sb.append("<td class='textAlignCenter'>");
                sb.append("</td>");
                sb.append("<td class='textAlignCenter'>");
                sb.append("</td>");
                sb.append("<td class='textAlignCenter'>");
                sb.append("</td>");
                sb.append("<td class='textAlignCenter'>");
                sb.append("</td>");
                sb.append("<td class='textAlignCenter'>");
                sb.append("</td>");
                sb.append("<td class='textAlignCenter'>");
                sb.append("</td>");
                sb.append("<td class='textAlignCenter  colorBlue'>");
                sb.append(getMoneyFormat_M(Math.round(totalT_PayMoney)));
                totalT_PayMoney = 0;
                sb.append("</td>");
                sb.append("<td class=''>");
                sb.append("<div ><span class='textAlignCenter span1'>");
                sb.append("</span>");
                sb.append("  ");
                sb.append("<span class='textAlignCenter span2'>");
                sb.append("</span>");
                sb.append("  ");
                sb.append("<span class='textAlignCenter span4 colorBlue'>");

                sb.append(getMoneyFormat_M(Math.round(totalT_PayMoneyDouble)));
                totalT_PayMoneyDouble = 0;
                sb.append("</span></div>");
                sb.append("</td>");
                sb.append("</tr>");
                sb.append("</tbody>");
                sb.append("</table>");

            });
            sb.append("<table class='table table-hover'>");
            sb.append("<thead>");
            sb.append("<tr class ='bgBlue'>");
            sb.append("<th class='textAlignCenter'>總業績</th>");

            sb.append("<th class='textAlignCenter'><span>入會金額總計&nbsp;:&nbsp;</span><span id='' class='colorBlue'>");
            sb.append(getMoneyFormat_M(Math.round(AllTotalT_PayMoney)));
            AllTotalT_PayMoney = 0;
            sb.append("</span></th>");


            sb.append("<th class='textAlignCenter'><span>入帳金額總計&nbsp;:&nbsp;</span><span id=''class='colorBlue'>");
            sb.append(getMoneyFormat_M(Math.round(AllTotalT_PayMoneyDouble)));
            AllTotalT_PayMoneyDouble = 0
            sb.append("</span></th>");
            sb.append("</tr>");
            sb.append("</thead>");
            sb.append("</table>");
            append_M("#printArea", sb.toString());
            DetailPerformanceDataListCount = 0;
            DetailPerformanceDataList = [];
            show_M("#printArea");
            unBlockUI_M();
        };

        var getInternetBusinessPerformance = function (startDate, endDate, ComID, type, dataListNum) {
            DetailPerformanceDataListCount += 1;
            var data = "StartDate=" + startDate + "&EndDate=" + endDate + "&ComID=" + ComID + "&type=" + type + "&action=getInternetBusinessPerformance";
            var success = function (back) {
                Log_M(type + " back=" + back);
                DetailPerformanceDataList[dataListNum] = back;
                if (DetailPerformanceDataList.length == DetailPerformanceDataListCount) {
                    makeDetailPerformanceTabel(startDate, endDate);
                }

            };
            var error = function (e) { Log_M("getInternetBusinessPerformance error=" + e); unBlockUI_M(); };

            ajax_M(reportHandlerMCMEB11Url_G, data, success, error);
        };

        var getTransactionCount = function (startDate, endDate, ComID) {
            var data = "StartDate=" + startDate + "&EndDate=" + endDate + "&action=getTransactionCount";
            var success = function (back) {
                Log_M("getTransactionCount back=" + back);
                var json = jsonParse_M(back);
                TransactionCountList = json;
                getInternetBusinessPerformance(startDate, endDate, ComID, "lockVideo", 0);
                getInternetBusinessPerformance(startDate, endDate, ComID, "activityFormTransaction", 1);
                getInternetBusinessPerformance(startDate, endDate, ComID, "importListTransaction", 2);
                getInternetBusinessPerformance(startDate, endDate, ComID, "getReportTransaction", 3);
            };
            var error = function (e) { Log_M("getInternetBusinessPerformance error=" + e); unBlockUI_M(); };

            ajax_M(reportHandlerMCMEB11Url_G, data, success, error);
        };

        var getAllInternetBusinessPerformance = function () {
            alert('search');
            blockUI_M();
            Log_M("Start getAllInternetBusinessPerformance");

            var startDate = val_M("#StartDate");
            var endDate = val_M("#EndDate");
            var ComID = val_M("#ComID");
            var doNext = check_M.isEndDateBigThanStartDate(startDate, endDate);
            if (doNext) {
                getTransactionCount(startDate, endDate, ComID);

            } else {
                alert("請正確選擇日期區間");
                unBlockUI_M();
            }
        };
        /*
         * $("#per_select1").change(function () {
         */
        $(function () {
            onClick_M("#print", printScreen_M);
            onClick_M("#search", getAllInternetBusinessPerformance);


            $("#ComID").change(function () {
                alert('!!');
                //加入變動後觸發部門下拉示選單動作(20221117)
            });
        })
    </script>
</asp:Content>

