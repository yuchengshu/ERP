<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MCMEB01.aspx.cs" Inherits="wealthManage_audit_check_MCMEB01" %>

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
                            <h1 class="box-title"><b>ERP &gt; 稽核區  &gt; 公司資源註記表 </b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div><!-- /.box-header -->
                        <div class="box-body" id="exportExcel">
                            <table class="table">
                                <thead >
                                    <tr class="active">
                                        <th class=""  colspan="9">
                                            <div class="input-group">
                                                <span class="inputSearch3">
                                                    <select  class="form-control" id="U_MDEP"></select>
                                                </span>
                                                <span class="inputSearch2">
                                                    <select  class="form-control" id="DM_tag">
                                                        <OPTION value="">不限(註記類別)</OPTION>
														<OPTION value="1">短註記</OPTION>   																											
														<OPTION value="2">長註記</OPTION>

                                                    </select>
                                                </span>
                                                <span class="inputSearch2">
                                                    <select  class="form-control" id="MC"></select>
                                                </span>
                                                <span class="inputSearch2">
                                                    <select  class="form-control" id="bMC"></select>
                                                </span>
                                                <span class="inputSearch2">
                                                    <input type="text" id="StartDate" class="datepicker form-control" placeholder="開始日">
                                                </span>
                                                <span class="inputSearch2">
                                                    <input type="text" id="EndDate" class="datepicker form-control" placeholder="結束日">
                                                </span>
                                                <span class="inputSearchWidth55">
                                                    <button type="button" class="btn btn-info btn-flat  qPer marginTop-27" id="getCompanyResourceTag">查詢</button>
                                                </span>
                                                <span class="inputSearchWidth102">
                                                    <button type="button" class="btn btn-info btn-flat  qPer marginTop-27" id="saveExcel"  onclick="javascrīpt: exportExcel()">轉存excel檔</button>
                                                </span>
                                                <span class="inputSearch1">
                                                    <button type="button" class="btn btn-info btn-flat  qPer marginTop-27" id="print"  onclick="javascrīpt: printme()">列印</button>
                                                </span>
                                            </div>
                                        </th>
                                    </tr>
                                    
                                    <tr class="marginTop5px bgColor">
                                        <th class="textAlignCenter  leftSideWhite" style="width:3%">
                                            序
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:6%">
                                            客戶姓名
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:20%">
                                            聯絡電話
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:10%">
                                            聯絡手機
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:6%">
                                            公司別
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:10%">
                                            註記日期
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:6%">
                                            註記種類
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:6%">
                                            註記業務
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:6%">
                                            所屬助理
                                        </th>
                                    </tr>
                                </thead>
                                <tbody id="companyResourceTagTb">

                                </tbody>
                            </table>
                        </div>
                        <div class="box-body" id="printArea"  style="visibility:hidden">
                            <table class="table">
                                <thead >
                                    <tr class="marginTop5px bgColor">
                                        <th class="textAlignCenter  leftSideWhite" colspan="2">
                                            日期&nbsp;:&nbsp;<span id="StartDateSpan"></span>&nbsp;~&nbsp;<span id="EndDateSpan"></span>
                                        </th>
                                    </tr>
                                    <tr class="marginTop5px bgColor">
                                        <th class="textAlignCenter  leftSideWhite" style="width:3%">
                                            序
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:6%">
                                            客戶姓名
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:20%">
                                            聯絡電話
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:10%">
                                            聯絡手機
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:6%">
                                            公司別
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:10%">
                                            註記日期
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:6%">
                                            註記種類
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:6%">
                                            註記業務
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:6%">
                                            所屬助理
                                        </th>
                                    </tr>
                                </thead>
                                <tbody id="companyResourceTagPrintTb">

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
           
            document.body.innerHTML = document.getElementById('printArea').innerHTML;
            window.print();
        }
        function exportExcel() {
            var html = '&lt;meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8" />&lt;title>Excel&lt;/title>';
            html += '';
            html += document.getElementById('exportExcel').outerHTML + '';
            window.open('data:application/vnd.ms-excel,' + encodeURIComponent(html));
        }
        var getDepListForCompanyResourceTag = function () {
            var data = "action=getDepListForCompanyResourceTag";
            var success = function (back) {
                Log_M("getDepListForCompanyResourceTag back=" + back);
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                sb.append("<option value=''>不限(部門)</option>");
                $.each(json, function (i, v) {
                    sb.append("<option value='");
                    sb.append(v.ditcode);
                    sb.append("'>");
                    sb.append(v.ddesc);
                    sb.append("</option>");

                });
                append_M("#U_MDEP",sb.toString());
              
            };
            var error = function (e) { Log_M("getDepListForCompanyResourceTag error=" + e); unBlockUI_M(); };
            ajax_M(AuditHandlerUrl_G, data, success, error);
        };
        var getMCListForCompanyResourceTag = function () {
            var data = "action=getMCListForCompanyResourceTag&ComID="+ComID_M;
            var success = function (back) {
                Log_M("getMCListForCompanyResourceTag back=" + back);
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                sb.append("<option value=''>不限(註記人員)</option>");
                $.each(json, function (i, v) {
                    sb.append("<option value='");
                    sb.append(v.U_Num);
                    sb.append("'>");
                    sb.append(v.U_Name);
                    sb.append("</option>");

                });
                append_M("#MC", sb.toString());
            };
            var error = function (e) { Log_M("getMCListForCompanyResourceTag error=" + e); unBlockUI_M(); };
            ajax_M(AuditHandlerUrl_G, data, success, error);
        };

        var getBmcList = function () {
            var sb = new StringBuilder_M();
            sb.append("<OPTION value=''>不限(原案件人員)</OPTION>");
            if (ComID_M == "HG01") {
                sb.append("<OPTION value='Z0000001'>公司資源</OPTION>");
                sb.append("<OPTION value='Z0000002'>資源A組</OPTION>");
                sb.append("<OPTION value='Z0000003'>資源B組</OPTION>");
            } else if (ComID_M == "HG02") {
                sb.append("<OPTION value='Z0000010'>10F資源</OPTION>");
            } else {
                sb.append("<OPTION value='Z0000001'>公司資源</OPTION>");
                sb.append("<OPTION value='Z0000002'>資源A組</OPTION>");
                sb.append("<OPTION value='Z0000003'>資源B組</OPTION>");
                sb.append("<OPTION value='Z0000010'>10F資源</OPTION>");
            }
            append_M("#bMC",sb.toString());
        };

        var getCompanyResourceTag = function () {
            var U_MDEP = val_M("#U_MDEP");
            var DM_tag = val_M("#DM_tag");
            var MC = val_M("#MC");
            var bMC = val_M("#bMC");
            var StartDate = val_M("#StartDate");
            var EndDate = val_M("#EndDate");
            var StartDateArr = StartDate.split('/');
            var EndDateArr = EndDate.split('/');
            text_M("#StartDateSpan", StartDateArr[2] + "/" + StartDateArr[0] + "/" + StartDateArr[1]);
            text_M("#EndDateSpan", EndDateArr[2] + "/" + EndDateArr[0] + "/" + EndDateArr[1]);
            var doNext = check_M.isEndDateBigThanStartDate(StartDate, EndDate);
            if (doNext) {
                blockUI_M();
                var data = "action=getCompanyResourceTag&U_MDEP=" + U_MDEP + "&EndDate=" + EndDate + "&StartDate=" + StartDate + "&DM_tag=" + DM_tag + "&MC=" + MC + "&bMC=" + bMC;
                var success = function (back) {
                    Log_M("back=" + back);
                    unBlockUI_M();
                    
                    empty_M("#companyResourceTagTb");
                    empty_M("#companyResourceTagPrintTb");
                    var json = jsonParse_M(back);
                    var sb = new StringBuilder_M();
                    var sbPrint = new StringBuilder_M();
                    $.each(json, function (i, v) {

                        sbPrint.append("<tr>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(i + 1);
                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(v.M_Name);
                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        if (!isEmptyStr(v.HTel_Zone)) {
                            sbPrint.append("住家: ");
                            sbPrint.append(v.HTel_Zone);
                            sbPrint.append("-");
                            sbPrint.append(v.HTel);
                            sbPrint.append("<br/>");
                        }
                        if (!isEmptyStr(v.OTel_Zone)) {
                            sbPrint.append("公司: ");
                            sbPrint.append(v.OTel);
                            sbPrint.append("-");
                            sbPrint.append(v.OTel_Sub);
                        }

                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");

                        if (!isEmptyStr(v.MTel1)) {
                            sbPrint.append("手機1: ");
                            sbPrint.append(v.MTel1);
                            sbPrint.append("<br/>");
                        }
                        if (!isEmptyStr(v.MTel2)) {
                            sbPrint.append("手機2: ");
                            sbPrint.append(v.MTel2);
                            sbPrint.append("<br/>");
                        }
                        if (!isEmptyStr(v.MTel3)) {
                            sb.append("手機3: ");
                            sb.append(v.MTel3);
                        }
                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(v.MC_COM);
                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(v.DM_MarkTime);
                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(v.DM_tagName);
                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(v.DM_MC_Name);
                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(v.MC_Name);
                        sbPrint.append("</td>");
                        sbPrint.append("</tr>");
                    });
                    append_M("#companyResourceTagPrintTb", sbPrint.toString());
                    
                    $.each(json, function (i, v) {
                       
                        sb.append("<tr>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(i+1);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'><a href='/wealthManage/customerManage/MMBER/customerDetail.aspx?M_ID=");
                        sb.append(v.M_ID);
                        sb.append("&MENU_no=");
                        sb.append(MENU_no_G);
                        sb.append("'>");
                        sb.append(v.M_Name);
                        sb.append("</a></td>");
                        sb.append("<td class='textAlignCenter'>");
                        if(!isEmptyStr(v.HTel_Zone)){
                            sb.append("住家: ");
                            sb.append(v.HTel_Zone);
                            sb.append("-");
                            sb.append(v.HTel);
                            sb.append("<br/>");
                        }
                        if(!isEmptyStr(v.OTel_Zone)){
                            sb.append("公司: ");
                            sb.append(v.OTel);
                            sb.append("-");
                            sb.append(v.OTel_Sub);
                        }
                        
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                      
                        if (!isEmptyStr(v.MTel1)) {
                            sb.append("手機1: ");
                            sb.append(v.MTel1);
                            sb.append("<br/>");
                        }
                        if (!isEmptyStr(v.MTel2)) {
                            sb.append("手機2: ");
                            sb.append(v.MTel2);
                            sb.append("<br/>");
                        }
                        if (!isEmptyStr(v.MTel3)) {
                            sb.append("手機3: ");
                            sb.append(v.MTel3);
                        }
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.MC_COM);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.DM_MarkTime);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.DM_tagName);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.DM_MC_Name);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.MC_Name);
                        sb.append("</td>");
                        sb.append("</tr>");
                    });
                    append_M("#companyResourceTagTb", sb.toString());
                    unBlockUI_M();
                };
                var error = function (e) { Log_M("getCompanyResourceTag error=" + e); unBlockUI_M(); };
                ajax_M(AuditHandlerUrl_G, data, success, error);
            } else {
                alert("請正確填寫查詢區間");
            }
            
        };
        //進行頁面處理===============================================start
        var startThisPage = function () {
            val_M("#StartDate", getTodayDatepickerStr_M());
            val_M("#EndDate", getTodayDatepickerStr_M());
            getDepListForCompanyResourceTag();
            getMCListForCompanyResourceTag();
            getBmcList();
            onClick_M("#getCompanyResourceTag", getCompanyResourceTag);
        };
        //進行頁面處理===============================================end
      
        $(function () {
            startThisPage();
        })
    </script>
</asp:Content>

