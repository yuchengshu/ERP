<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MPMEB01.aspx.cs" Inherits="wealthManage_report_MREPO_MPMEB01_MPMEB01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <style>
       
   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                            <h1 class="box-title"><b>ERP &gt; 報表區 &gt; 分析師個人業績表 </b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div><!-- /.box-header -->
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
                                        <label>分析師:</label>
                                        <select id="MP" class="form-control"></select>
                                    </th>
                                    <th class="width20percent">
                                        <label>會員總類:</label>
                                        <select id="M_Item" class="form-control"><option value="">請選擇</option></select>
                                    </th>
                                    <th class="width20percent">
                                        <span class="input-group-btn marginLeft">
                                            <button type="button" class="btn btn-info btn-flat qPer" id="search">查詢</button>
                                        </span>
                                    </th>
                                    <th></th>
          
                                </tr>
                            </thead>
                        </table>
                        <table class="table table-hover marginTop10">
                                <thead id="">
                                    <tr class="bgGray">
                                        <th colspan="2" class="textAlignCenter borderGray">一般件</th>
                                    </tr>
                                    <tr class="bgBlue">
                                        <th class="width50percent textAlignCenter borderGray">會員總類</th>
                                        <th class="width50percent textAlignCenter borderGray">數量</th>
                                    </tr>
                                </thead>
                                <tbody id="norReportTb">

                                </tbody>
                                <thead>
                                    <tr class="bgBlue">
                                        <th class="width50percent textAlignCenter borderGray">合計</th>
                                        <th id="norTotalCount" class="width50percent textAlignCenter borderGray colorBlue"></th>
                                    </tr>
                                    <tr class="bgBlue">
                                        <th class="width50percent textAlignCenter borderGray">金額</th>
                                        <th id="norTotalMoney" class="width50percent textAlignCenter colorBlue"></th>
                                    </tr>
                                </thead>
                        </table>
                        <table class="table table-hover marginTop10">
                                <thead id="">
                                    <tr class="bgGray">
                                        <th colspan="2" class="textAlignCenter borderGray">會場件</th>
                                    </tr>
                                    <tr class="bgBlue">
                                        <th class="width50percent textAlignCenter borderGray">會員總類</th>
                                        <th class="width50percent textAlignCenter borderGray">數量</th>
                                    </tr>
                                </thead>
                                <tbody id="venueReportTb">

                                </tbody>
                                <thead>
                                    <tr class="bgBlue">
                                        <th class="width50percent textAlignCenter borderGray">合計</th>
                                        <th id="venueTotalCount" class="width50percent textAlignCenter borderGray colorBlue"></th>
                                    </tr>
                                    <tr class="bgBlue">
                                        <th class="width50percent textAlignCenter borderGray">金額</th>
                                        <th id="venueTotalMoney" class="width50percent textAlignCenter colorBlue"></th>
                                    </tr>
                                </thead>
                        </table>
                            <table class="table table-hover marginTop10">
                                <thead id="">
                                    <tr class="bgGray">
                                        <th colspan="2" class="textAlignCenter borderGray">會期中會員數</th>
                                    </tr>
                                    <tr class="bgBlue">
                                        <th class="width50percent textAlignCenter borderGray">會員總類</th>
                                        <th class="width50percent textAlignCenter borderGray">數量</th>
                                    </tr>
                                </thead>
                                <tbody id="mcReportTb">

                                </tbody>
        
                        </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        var MPMEB01reportHandlerUrl_G = "reportHandlerMPMEB01.ashx";
        var afterSuccessFuc = function () {
            onChange_M("#MP", function () {
                var type = val_M("#MP");
                $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#M_Item", type, "option");
            });
        };

        var getMemberCountInSession = function (mp) {
            var data = "MP=" + mp + "&action=getMemberCountInSession";
            var success = function (back) {
                empty_M("#mcReportTb");
                Log_M("back=" + back);
                var json = jsonParse_M(back);
                var sb = new string_M.StringBuilder();
                $.each(json, function (i, v) {
                    sb.append("<tr>");
                    sb.append("<td class='textAlignCenter borderGray'>");
                    sb.append(v.t_item);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter borderGray'>");
                    sb.append(v.T_item_count);
                    sb.append("</td>");
                    sb.append("</tr>")
                });
                append_M("#mcReportTb", sb.toString());
            };
            ajax_M(MPMEB01reportHandlerUrl_G, data, success);
        };
        

        var getAnalystSinglePerformance = function (caseType, startDate, endDate,mp) {
            var data = "StartDate=" + startDate + "&EndDate=" + endDate + "&MP=" + mp + "&M_Item=" + val_M("#M_Item") + "&caseType=" + caseType + "&action=getAnalystSinglePerformance";
            var success = function (back) {
                empty_M("#" + caseType + "ReportTb");
                    Log_M("back=" + back);
                    var json = jsonParse_M(back);
                    var sb = new string_M.StringBuilder();
                    var totalCount = 0;
                    var totalMoney = 0;
                    $.each(json, function (i, v) {
                        sb.append("<tr>");
                        sb.append("<td class='textAlignCenter borderGray'>");
                        sb.append(v.t_item);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter borderGray'>");
                        sb.append(v.T_item_count);
                        sb.append("</td>");
                        sb.append("</tr>")
                        totalCount += parseInt(v.T_item_count);
                        totalMoney += Math.round(v.totalMoney);
                    });
                    append_M("#" + caseType + "ReportTb", sb.toString());
                    text_M("#" + caseType + "TotalCount", totalCount.toString());
                    text_M("#" + caseType + "TotalMoney", getMoneyFormat_M(totalMoney.toString()));
                    unBlockUI_M();
                };
            ajax_M(MPMEB01reportHandlerUrl_G, data, success);
        };

        var getAnalystSinglePerformanceTab = function () {
            blockUI_M();
            var startDate = val_M("#StartDate");
            var endDate = val_M("#EndDate");
            var mp = val_M("#MP");
            //確定起始日跟結束日沒有寫反
            var doNext = check_M.isEndDateBigThanStartDate(startDate, endDate);
            if (doNext) {
                if (!isEmptyStr(mp)) {
                    getAnalystSinglePerformance("nor", startDate, endDate, mp);
                    getAnalystSinglePerformance("venue", startDate, endDate, mp);
                    getMemberCountInSession(mp);
                } else {
                    alert("請選擇分析師");
                    unBlockUI_M();
                }
                
            }else{
                alert("請正確選擇日期區間");
                unBlockUI_M();
            }
            
        };
      
        $(function () {
            //取得分析師ListHtmlTagOption
            $Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "#MP", emptyValue_M, "option", afterSuccessFuc);
            onClick_M("#search", getAnalystSinglePerformanceTab);
        })
    </script>
</asp:Content>

