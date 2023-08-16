<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MCMEB06.aspx.cs" Inherits="wealthManage_report_MREPO_MCMEB06_MCMEB06" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
                            <h1 class="box-title"><b>ERP &gt;  報表區 &gt;詮力發訊成本表</b> </h1>
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
                                        <button type="button" class="btn btn-info btn-flat qPer" id="search">查詢</button>
                                         <button type="button" class="btn btn-info btn-flat" id="print">列印</button>
                                    </th>

                                </tr>
                            </thead>
                        </table>
                        <div id="printArea">
      
                         </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        var reportHandlerMCMEB06Url_G = "reportHandlerMCMEB06.ashx";
        var getSendMessageCost = function () {
            blockUI_M();
            Log_M("Start getSendMessageCost");
            var StartDate = val_M("#StartDate");
            var EndDate = val_M("#EndDate");
            var MP = val_M("#MP");
            var doNext = check_M.isEndDateBigThanStartDate(StartDate, EndDate);
            if (doNext) {
                var data = "StartDate=" + StartDate + "&EndDate=" + EndDate + "&MP=" + MP + "&action=getSendMessageCost";
                var success = function (back) {
                    Log_M("getSendMessageCost back=" + back);
                    empty_M("#printArea");
                    var json = jsonParse_M(back);
                    var totalSendSuccessCount = 0;
                    var totalSendFailCount = 0;
                    var sb = new string_M.StringBuilder();
                    sb.append("<div class='textAlignCenter'>");
                    sb.append("<h3 class='table table-hover'>詮力發訊成本表</h3>");
                    sb.append("</div>");
                    sb.append("<p><span>日期</span>:");
                    sb.append(StartDate);
                    sb.append(" - ");
                    sb.append(EndDate);
                    sb.append("</p>");
                    sb.append("<table class='table table-hover'>");
                    sb.append("<thead>");
                    sb.append("<tr class ='bgBlue'>");
                    sb.append("<th class='textAlignCenter'>分析師</th>");
                    sb.append("<th class='textAlignCenter'>發訊成功</th>");
                    sb.append("<th class='textAlignCenter'>發訊不成功</th>");
                    sb.append("</tr>");
                    sb.append("</thead>");
                    sb.append("<tbody>");
                    $.each(json, function (i, v) {
                        if (isEmptyStr(MP)) {
                            sb.append("<tr>");
                            sb.append("<td class='textAlignCenter' id='");
                            sb.append(v.MP);
                            sb.append("'>");
                            if (isEmptyStr(v.MP_Name)) {
                                sb.append("其他");
                            } else {
                                sb.append(v.MP_Name);
                            }

                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(getMoneyFormat_M(v.sendSuccessCount));
                            totalSendSuccessCount += parseInt(v.sendSuccessCount);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(getMoneyFormat_M(v.sendFailCount));
                            totalSendFailCount += parseInt(v.sendFailCount);
                            sb.append("</td>");
                            sb.append("</tr>");
                        } else {
                            if (MP == v.MP) {
                                sb.append("<tr>");
                                sb.append("<td class='textAlignCenter' id='");
                                sb.append(v.MP);
                                sb.append("'>");
                                if (isEmptyStr(v.MP_Name)) {
                                    sb.append("其他");
                                } else {
                                    sb.append(v.MP_Name);
                                }

                                sb.append("</td>");
                                sb.append("<td class='textAlignCenter'>");
                                sb.append(getMoneyFormat_M(v.sendSuccessCount));
                                totalSendSuccessCount += parseInt(v.sendSuccessCount);
                                sb.append("</td>");
                                sb.append("<td class='textAlignCenter'>");
                                sb.append(getMoneyFormat_M(v.sendFailCount));
                                totalSendFailCount += parseInt(v.sendFailCount);
                                sb.append("</td>");
                                sb.append("</tr>");
                            }
                        }

                    });
                    sb.append("<tr class ='bgBlue colorBlue'>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append("總計");
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(getMoneyFormat_M(totalSendSuccessCount));
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(getMoneyFormat_M(totalSendFailCount));
                    sb.append("</td>");
                    sb.append("</tr>");
                    sb.append("</tbody>");
                    sb.append("</table>");
                    append_M("#printArea", sb.toString());
                    unBlockUI_M();
                };
                var error = function (e) { Log_M("getSendMessageCost error=" + e); unBlockUI_M(); };
                ajax_M(reportHandlerMCMEB06Url_G, data, success);
            } else {
                alert("請正確選擇日期區間");
                unBlockUI_M();
            }
           
        };
        $(function () {
            //取得分析師ListHtmlTagOption
            $Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "#MP", emptyValue_M, "option");
            onClick_M("#search", getSendMessageCost);
            onClick_M("#print", printScreen_M);
        })
    </script>
</asp:Content>

