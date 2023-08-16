<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="report.aspx.cs" Inherits="wealthManage_report_MREPO_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-wrapper" style="min-height: 2000px;">
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
                            <h1 class="box-title"><b>ERP &gt; 財富管理部 &gt; 報表區</b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-hover" id="reportTab">
                                <thead id="reportThead"></thead>
                                <tbody id="reportTb">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        var MENU_no_G = "<%=getMENU_no()%>";
        var U_Num_M = "<%=getU_Num()%>";
        var ReportHandlerUrl_G = "reportHandler.ashx";
        var showPageList = ["MPMEB01", "MCMEB11", "MCMEB06", "MCMEB05", "MCMEB02", "MCMEB04", "MVMEB06", "MVMEB07", "MVMEB08", "MCMEB01", "MCMEB09", "MCMEB10", "MCMEB11", "MCMEB12", "MCMEB13", "MCMEB14", "MMBER01", "MINVO01", "MMTEL01", "MNO01"];
        var showPageTF = function (pageName) {
            var TF = false;
            $.each(showPageList, function (i, v) {
                if (pageName == v) {
                    TF = true;
                }
            })
            return TF;
        };
        var getReportList = function () {
            var data = "U_Num=" + U_Num_M + "&action=getReportList";
            var success = function (back) {
                var json = jsonParse_M(back);
                var sb = new string_M.StringBuilder();
                var temp = undefined;
                $.each(json, function (i, v) {
                    //if (showPageTF(v.REPO_id)) {
                        sb.append("<tr>");
                        sb.append("<td>");
                        sb.append(i + 1);
                        sb.append("</td>");
                        sb.append("<td>");
                        sb.append(v.DEP_name);
                        sb.append("</td>");
                        sb.append("<td><a class='readPer' href='");
                        temp = v.REPO_id.split('.');
                        sb.append(temp[0]);
                        sb.append("/");
                        sb.append(v.REPO_id);
                        sb.append(".aspx'>");
                        sb.append(v.REPO_name);
                        sb.append("</a></td>");
                        sb.append("</tr>");
                   // }
                    
                });
                append_M("#reportTb", sb.toString());
            };
            ajax_M(ReportHandlerUrl_G, data, success);
        };
        //進行頁面處理===============================================start
        var startThisPage = function () {
            getReportList();
        };
        //進行頁面處理===============================================end
      
        $(function () {
            //查看使用者權限
            getUserAuthority_M(startThisPage);
        })
    </script>
</asp:Content>


