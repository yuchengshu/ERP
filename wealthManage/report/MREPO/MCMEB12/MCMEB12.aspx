<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MCMEB12.aspx.cs" Inherits="wealthManage_report_MREPO_MCMEB12_MCMEB12" %>

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
                            <h1 class="box-title"><b>ERP &gt; 報表區 &gt; 網站會員註冊活動明細表 </b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-hover" id="">
                            <thead id="">
                                <tr class="active">
                                    <th class="">
                                        <label>分析師:</label>
                                        <select id="MP" class="form-control">
                                           
                                        </select>
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
                                        <th class="textAlignCenter" colspan="6">會員數</th>
                                       
                                    </tr>
                                    <tr class="bgGray">
                                        <th class="textAlignCenter">編號</th>
                                        <th class="textAlignCenter">網址</th>
                                        <th class="textAlignCenter">分析師</th>
                                        <th class="textAlignCenter">活動名稱</th>
                                        <th class="textAlignCenter">人數</th>
                                        <th class="textAlignCenter">明細</th>
                                    </tr>
                                </thead>
                                <tbody id="ReportTb">

                                </tbody>
        
                        </table>

                        <table class="table table-hover marginTop10 startHide" id="activeDetailTab">
                                <thead id="">
                                    <tr class="bgGray">
                                        <th class="textAlignCenter" colspan="6">網站會員註冊活動明細表</th>
                                    </tr>
                                    <tr class="bgGray">
                                        <th class="textAlignCenter">序</th>
                                        <th class="textAlignCenter">姓名</th>
                                        <th class="textAlignCenter">電話</th>
                                        <th class="textAlignCenter">日期</th>
                                        
                                    </tr>
                                </thead>
                                <tbody id="activeDetailTb">

                                </tbody>
        
                        </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        var MCMEB12reportHandlerUrl_G = "reportHandlerMCMEB12.ashx";
        
        var getAnalystActiveDetail = function () {
            var Sur_id = attr_M(this, "Sur_id");
            var data = "action=getAnalystActiveDetail&Sur_id=" + Sur_id;
            var success = function (back) {
                Log_M("back=" + back);
                empty_M("#activeDetailTb");
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                var count = 0;
                $.each(json, function (i, v) {

                    sb.append("<tr>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(i+1);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.M_Ch);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.Tel);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.add_date);
                    sb.append("</td>");
                    sb.append("</tr>");
                });
                append_M("#activeDetailTb", sb.toString());
                show_M("#activeDetailTab");
            };
            var error = function (e) { Log_M("getAnalystActiveDetail error=" + e); unBlockUI_M(); };
            ajax_M(MCMEB12reportHandlerUrl_G, data, success, error);
        };

        var getWebMemberRegisteredActiveDetail = function () {
            var data = "action=getWebMemberRegisteredActiveDetail&MP=" + val_M("#MP");
            var success = function (back) {
                Log_M("back=" + back);
                empty_M("#ReportTb");
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                var count = 0;
                $.each(json, function (i, v) {
 
                    sb.append("<tr>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.Sur_id);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.website);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.T_name);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.T_Text);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.count);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'><a href='javascript:void(0)' class='getAnalystActiveDetail' Sur_id='");
                    sb.append(v.Sur_id);
                    sb.append("'>明細</a>");
                    sb.append("</td>");
                    sb.append("</tr>");
                });
                append_M("#ReportTb", sb.toString());
                onClick_M(".getAnalystActiveDetail", getAnalystActiveDetail);
            };
            var error = function (e) { Log_M("getWebMemberRegisteredActiveDetail error=" + e); unBlockUI_M(); };
            ajax_M(MCMEB12reportHandlerUrl_G, data, success, error);
        };

        $(function () {
            $Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "#MP", emptyValue_M, "option", emptyValue_M);
            onClick_M("#search", getWebMemberRegisteredActiveDetail);
        })
    </script>
</asp:Content>

