<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MCMEB07.aspx.cs" Inherits="wealthManage_report_MREPO_MCMEB06_MCMEB06" %>

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
                            <h1 class="box-title"><b>ERP &gt;  報表區 &gt;業務撥打報表</b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-hover" id="">
                                <thead id="">
                                    <tr class="active">
                                        <th class="width20percent">配發日期
                                           <%-- 配發日期(年)--%>
                                            <select id="AssignYear" class="form-control">
                                                <option value="">年</option>
                                                <option value="2011">2011</option>
                                                <option value="2012">2012</option>
                                                <option value="2013">2013</option>
                                                <option value="2014">2014</option>
                                                <option value="2015">2015</option>
                                                <option value="2016">2016</option>
                                                <option value="2017">2017</option>
                                                <option value="2018">2018</option>
                                                <option value="2019">2019</option>
                                                <option value="2020">2020</option>
                                                <option value="2021">2021</option>
                                                <option value="2022">2022</option>
                                                <option value="2023">2023</option>
                                            </select>
                                        </th>
                                        <th>
                                            <%--配發日期(月)--%>
                                            <select id="AssignMonth" class="form-control">
                                                <option value="">月</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                            </select>
                                        </th>
                                        <th class="width20percent"></th>
                                        <th class="width20percent"></th>

                                    </tr>
                                    <tr class="active">
                                        <th class="width20percent">
                                            <td align="right">是否註記：</td>

                                        </th>
                                        <th class="width20percent">
                                            <select id="Note" class="form-control">
                                                <option value="">不限</option>
                                                <option value="1">已註記</option>
                                                <option value="0">未註記</option>
                                            </select></th>
                                        <th class="width20percent">是否註記：
                                        
                                        </th>
                                        <th class="width20percent"></th>

                                    </tr>
                                    <tr class="active">
                                        <th class="width20percent">&nbsp;</th>
                                        <th class="width20percent">&nbsp;</th>
                                        <th class="width20percent">&nbsp;</th>
                                        <th class="width20percent">
                                            <button type="button" class="btn btn-info btn-flat qPer" id="search">查詢</button>

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

