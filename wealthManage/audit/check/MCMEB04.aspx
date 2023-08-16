<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MCMEB04.aspx.cs" Inherits="wealthManage_audit_check_MCMEB04" %>

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
                            <h1 class="box-title"><b>ERP &gt; 稽核區  &gt; 業務ERP狀況表 </b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div><!-- /.box-header -->
                        <div class="box-body" id="printArea">
                            <table class="table">
                                <thead >
                                    <tr class="active">
                                        <th class=""  colspan="8">
                                            <div class="input-group">
                                                <span class="inputSearch3">
                                                    <select  class="form-control" id="U_MDEP"></select>
                                                </span>
                                                <span class="inputSearch2">
                                                    <input type="text" id="StartDate" class="datepicker form-control" placeholder="開始日">
                                                </span>
                                                <span class="inputSearch2">
                                                    <input type="text" id="EndDate" class="datepicker form-control" placeholder="結束日">
                                                </span>
                                                <span class="inputSearchWidth55">
                                                    <button type="button" class="btn btn-info btn-flat  qPer marginTop-27" id="getBusinessERPstatus">查詢</button>
                                                </span>
                                                <span class="inputSearchWidth102">
                                                    <button type="button" class="btn btn-info btn-flat  qPer marginTop-27" id="saveExcel"  onclick="javascrīpt: exportExcel()">轉存excel檔</button>
                                                </span>
                                                <span class="inputSearch2">
                                                    <button type="button" class="btn btn-info btn-flat  qPer marginTop-27" id="print"  onclick="javascrīpt: printme()">列印</button>
                                                </span>
                                            </div>
                                        </th>
                                    </tr>
                                    <tr class="marginTop5px bgColor">
                                        <th class="textAlignCenter  leftSideWhite" >
                                         
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" colspan="2">
                                            有交易
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" colspan="2">
                                            無交易
                                        </th>
                                    </tr>
                                    <tr class="marginTop5px bgColor">
                                        <th class="textAlignCenter  leftSideWhite" style="width:20%">
                                            業務姓名
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:20%">
                                            客戶總數
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:20%">
                                            本期間客戶數
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:20%">
                                            客戶總數
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:20%">
                                            本期客戶數
                                        </th>
                                    </tr>
                                </thead>
                                <tbody id="businessERPstatusTb">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <script>

        var AuditHandlerUrl_G = "auditHandler.ashx";
        function printme() {
            document.body.innerHTML =  document.getElementById('printArea').innerHTML;
            window.print();
        }
        function exportExcel() {
            var html = '&lt;meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8" />&lt;title>Excel&lt;/title>';
            html += '';
            html += document.getElementById('printArea').outerHTML + '';
            window.open('data:application/vnd.ms-excel,' + encodeURIComponent(html));
        }
        var getDepList = function () {
            var data = "action=getDepList";
            var success = function (back) {
                Log_M("getDepList back=" + back);
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                sb.append("<option value=''>不限</option>");
                $.each(json, function (i, v) {
                    sb.append("<option value='");
                    sb.append(v.ditcode);
                    sb.append("'>");
                    sb.append(v.ddesc);
                    sb.append("</option>");

                });
                append_M("#U_MDEP",sb.toString());
              
            };
            var error = function (e) { Log_M("getDepList error=" + e); unBlockUI_M(); };
            ajax_M(AuditHandlerUrl_G, data, success, error);
        };
        var getBusinessERPstatus = function () {
            var U_MDEP = val_M("#U_MDEP");
            
            var StartDate = val_M("#StartDate");
            var EndDate = val_M("#EndDate");
            var doNext = check_M.isEndDateBigThanStartDate(StartDate, EndDate);
            if (doNext) {
                blockUI_M();
                var data = "action=getBusinessERPstatus&U_MDEP=" + U_MDEP + "&EndDate=" + EndDate + "&StartDate=" + StartDate + "&User_MDEP=" + U_MDEP_M;
                var success = function (back) {
   
                    empty_M("#businessERPstatusTb");
                    var json = jsonParse_M(back);
                    var sb = new StringBuilder_M();
                    $.each(json, function (i, v) {
                        if (v.U_Name == "合計") {
                            sb.append("<tr class='colorBlue'>");
                        } else {
                            sb.append("<tr>");
                        }
                 
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.U_Name);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(getMoneyFormat_M(v.tradedCustomerCount));
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(getMoneyFormat_M(v.tradedCustomerCountThisPeriod));
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(getMoneyFormat_M(v.NonTradedCustomerCount));
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(getMoneyFormat_M(v.NonTradedCustomerCountThisPeriod));
                        sb.append("</td>");
                        sb.append("</tr>");
                    });
                    append_M("#businessERPstatusTb",sb.toString());
                    unBlockUI_M();
                };
                var error = function (e) { Log_M("getBusinessERPstatus error=" + e); unBlockUI_M(); };
                ajax_M(AuditHandlerUrl_G, data, success, error);
            } else {
                alert("請正確填寫查詢區間");
            }
            
        };
        //進行頁面處理===============================================start
        var startThisPage = function () {
            val_M("#StartDate", getTodayDatepickerStr_M());
            val_M("#EndDate", getTodayDatepickerStr_M());
            getDepList();
            onClick_M("#getBusinessERPstatus", getBusinessERPstatus);

        };
        //進行頁面處理===============================================end
      
        $(function () {
            startThisPage();
           
        })
    </script>
</asp:Content>

