<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="audit.aspx.cs" Inherits="wealthManage_audit_check_audit" %>

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
                            <h1 class="box-title"><b>ERP &gt; 稽核區  &gt; 稽核區 </b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-hover" id="auditTab">
                                <thead id="auditThead"></thead>
                                <tbody id="auditTb">

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
        var AuditHandlerUrl_G = "auditHandler.ashx";
        var showPageList = ["MPMEB01", "MCMEB11", "MCMEB06", "MCMEB05", "MCMEB02"];
        var showPageTF = function (pageName) {
            var TF = false;
            $.each(showPageList, function (i, v) {
                if (pageName == v) {
                    TF = true;
                }
            })
            return TF;
        };
        var getAuditList = function () {
            var data = "action=getAuditList&U_Num=" + U_Num_M ;
            var success = function (back) {
                Log_M("back=" + back);
                var json = jsonParse_M(back);
                var sb = new string_M.StringBuilder();
                var temp = undefined;
                $.each(json, function (i, v) {
                
                        sb.append("<tr>");
                        sb.append("<td>");
                        sb.append(i + 1);
                        sb.append("</td>");
                        sb.append("<td>");
                        sb.append(v.DEP_name);
                        sb.append("</td>");
                        sb.append("<td><a class='readPer' href='");
                        /*temp = v.REPO_id.split('.');
                        sb.append(temp[0]);
                        sb.append("/");*/
                        sb.append(v.REPO_id);
                        if (v.REPO_id == "MCMEB01" || v.REPO_id == "MCMEB08") {
                            sb.append(".aspx?MENU_no=");
                            sb.append(MENU_no_G);
                            sb.append("'>");
                        } else {
                            sb.append(".aspx'>");
                        }
                        

                        sb.append(v.REPO_name);
                        sb.append("</a></td>");
                        sb.append("</tr>");
               
                    
                });
                append_M("#auditTb", sb.toString());
            };
            var error = function (e) { Log_M("getAuditList error=" + e); unBlockUI_M(); };
            ajax_M(AuditHandlerUrl_G, data, success, error);
        };
        //進行頁面處理===============================================start
        var startThisPage = function () {
            getAuditList();
            //設定權限
            setPermission_M();
        };
        //進行頁面處理===============================================end
      
        $(function () {
            startThisPage();
            //查看使用者權限
            //getUserAuthority_M(startThisPage);
        })
    </script>
</asp:Content>

