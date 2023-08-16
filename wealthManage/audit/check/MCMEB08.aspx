<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MCMEB08.aspx.cs" Inherits="wealthManage_audit_check_MCMEB08" %>

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
                            <h1 class="box-title"><b>ERP &gt; 稽核區  &gt; 案件派發報表 </b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div><!-- /.box-header -->
                        <div class="box-body" id="exportExcel">
                            <table class="table">
                                <thead >
                                    <tr class="active">
                                        <th class=""  colspan="8">
                                            <div class="input-group">
                                                <span class="inputSearch3" id="U_MDEPspan">
                                                    <select  class="form-control" id="U_MDEP"></select>
                                                </span>
                                                <span class="inputSearch2">
                                                    <input type="text" id="StartDate" class="datepicker form-control" placeholder="開始日">
                                                </span>
                                                <span class="inputSearch2">
                                                    <input type="text" id="EndDate" class="datepicker form-control" placeholder="結束日">
                                                </span>
                                                <span class="inputSearchWidth55">
                                                    <button type="button" class="btn btn-info btn-flat  qPer marginTop-27" id="getCaseDistribute">查詢</button>
                                                </span>
                                                <span class="inputSearchWidth102">
                                                    <button type="button" class="btn btn-info btn-flat  qPer marginTop-27" id="saveExcel"  onclick="javascrīpt: exportExcel()">轉存excel檔</button>
                                                </span>
                                                <span class="inputSearchWidth55">
                                                    <button type="button" class="btn btn-info btn-flat  qPer marginTop-27" id="print"  onclick="javascrīpt: printme()">列印</button>
                                                </span>
                                            </div>
                                        </th>
                                    </tr>
                                   
                                    <tr class="marginTop5px bgColor">
                                        <th class="textAlignCenter  leftSideWhite" style="width:20%">
                                            業務姓名
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:20%">
                                            綠燈件數
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:20%">
                                            黃燈件數
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:20%">
                                            紅燈件數
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:20%">
                                            派發總數
                                        </th>
                                    </tr>
                                </thead>
                                <tbody id="caseDistributeTb">

                                </tbody>
                            </table>
                        </div>
                        <div class="box-body startHide" id="printArea">
                            <table class="table">
                                <thead >
                                    <tr class="marginTop5px bgColor">
                                        <th class="textAlignCenter  leftSideWhite" colspan="2">
                                            日期&nbsp;:&nbsp;<span id="StartDateSpan"></span>&nbsp;~&nbsp;<span id="EndDateSpan"></span>
                                        </th>
                                    </tr>
                                    <tr class="marginTop5px bgColor">
                                        <th class="textAlignCenter  leftSideWhite" style="width:20%">
                                            業務姓名
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:20%">
                                            綠燈件數
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:20%">
                                            黃燈件數
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:20%">
                                            紅燈件數
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:20%">
                                            派發總數
                                        </th>
                                    </tr>
                                </thead>
                                <tbody id="printAreaCaseDistributeTb">

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
        var MENU_no_G = "<%=getMENU_no()%>";
        function printme() {
            document.body.innerHTML =  document.getElementById('printArea').innerHTML;
            window.print();
        }
        function exportExcel() {
            var html = '&lt;meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8" />&lt;title>Excel&lt;/title>';
            html += '';
            html += document.getElementById('exportExcel').outerHTML + '';
            window.open('data:application/vnd.ms-excel,' + encodeURIComponent(html));
        }
        var getDepListForCaseDistribute = function () {
            var data = "action=getDepListForCaseDistribute";
            var success = function (back) {
                Log_M("getDepListForCaseDistribute back=" + back);
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
            var error = function (e) { Log_M("getDepListForCaseDistribute error=" + e); unBlockUI_M(); };
            ajax_M(AuditHandlerUrl_G, data, success, error);
        };

        var getCaseDistribute = function () {
            var U_MDEP = val_M("#U_MDEP");
            
            var StartDate = val_M("#StartDate");
            var EndDate = val_M("#EndDate");
            var StartDateArr = StartDate.split('/');
            var EndDateArr = EndDate.split('/');
            text_M("#StartDateSpan", StartDateArr[2] + "/" + StartDateArr[0] + "/" + StartDateArr[1]);
            text_M("#EndDateSpan", EndDateArr[2] + "/" + EndDateArr[0] + "/" + EndDateArr[1]);
            var doNext = check_M.isEndDateBigThanStartDate(StartDate, EndDate);
            if (doNext) {
                blockUI_M();
                var data = "action=getCaseDistribute&U_MDEP=" + U_MDEP + "&EndDate=" + EndDate + "&StartDate=" + StartDate + "&User_MDEP=" + U_MDEP_M;
                var success = function (back) {

                    empty_M("#caseDistributeTb");
                    empty_M("#printAreaCaseDistributeTb");
                   
                    var json = jsonParse_M(back);
                    var sb = new StringBuilder_M();
                    var sbPrint = new StringBuilder_M();
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
                        sb.append(v.greenCount);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.yellowCount);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.redCount);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'><a target='_blank' href='/wealthManage/audit/check/caseDistributeList.aspx?U_Num=");
                        sb.append(v.U_Num);
                        sb.append("&MENU_no=");
                        sb.append(MENU_no_G);
                        sb.append("'>");
                        sb.append(v.distributeCount);
                        sb.append("</a></td>");
                        sb.append("</tr>");
                    });
                    append_M("#caseDistributeTb", sb.toString());

                    $.each(json, function (i, v) {
                        if (v.U_Name == "合計") {
                            sbPrint.append("<tr class='colorBlue'>");
                        } else {
                            sbPrint.append("<tr>");
                        }

                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(v.U_Name);
                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(v.greenCount);
                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(v.yellowCount);
                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(v.redCount);
                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(v.distributeCount);
                        sbPrint.append("</td>");
                        sbPrint.append("</tr>");
                    });
                    append_M("#printAreaCaseDistributeTb", sbPrint.toString());
                    unBlockUI_M();
                };
                var error = function (e) { Log_M("getCaseDistribute error=" + e); unBlockUI_M(); };
                ajax_M(AuditHandlerUrl_G, data, success, error);
            } else {
                alert("請正確填寫查詢區間");
            }
            
        };
        //進行頁面處理===============================================start
        var startThisPage = function () {
           
            if (U_MDEP_M == "0002" || U_MDEP_M == "0006" || U_MDEP_M == "0007" || U_MDEP_M == "0008" || U_MDEP_M == "0011" || U_MDEP_M == "0012") {
                attr_M("#U_MDEPspan", "style", "display:none");
            }
            val_M("#StartDate", getTodayDatepickerStr_M());
            val_M("#EndDate", getTodayDatepickerStr_M());
            getDepListForCaseDistribute();
            onClick_M("#getCaseDistribute", getCaseDistribute);

        };
        //進行頁面處理===============================================end
      
        $(function () {
            startThisPage();
           
        })
    </script>
</asp:Content>

