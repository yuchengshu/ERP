<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MVMEB07.aspx.cs" Inherits="wealthManage_report_MREPO_MVMEB07_MVMEB07" %>

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
                            <h1 class="box-title"><b>ERP &gt; 報表區 &gt; 未到期會員總表 </b> </h1>
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
                                        <th colspan="2" class="textAlignCenter borderGray">會員數</th>
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
        var MVMEB07reportHandlerUrl_G = "reportHandlerMVMEB07.ashx";
        var getAnalystSinglePerformance = function (startDate, endDate, mp) {
            var data = "StartDate=" + startDate + "&EndDate=" + endDate + "&MP=" + mp + "&action=getAnalystSinglePerformance";
            var success = function (back) {
                empty_M("#mcReportTb");
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
                   
                });
                append_M("#mcReportTb", sb.toString());
                unBlockUI_M();
            };
            var error = function (e) { Log_M("getAnalystSinglePerformance error=" + e); unBlockUI_M(); };
            ajax_M(MVMEB07reportHandlerUrl_G, data, success, error);
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
                    getAnalystSinglePerformance(startDate, endDate, mp);
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
            val_M("#StartDate", getTodayDatepickerStr_M());
            val_M("#EndDate", getTodayDatepickerStr_M());
            //取得分析師ListHtmlTagOption
            $Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "#MP", emptyValue_M, "option", emptyValue_M);
            onClick_M("#search", getAnalystSinglePerformanceTab);
        })
    </script>
</asp:Content>

