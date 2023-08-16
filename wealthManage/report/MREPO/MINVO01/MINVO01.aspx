<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MINVO01.aspx.cs" Inherits="wealthManage_report_MREPO_MINVO01_MINVO01" %>

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
                            <h1 class="box-title"><b>ERP &gt; 報表區 &gt; 發票明細表 </b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-hover" id="">
                            <thead id="">
                                <tr class="active">
                                    <th>
                                        <span class="inputSearch2">
                                            <label>發票種類:</label>
                                            <select id="Invoice_Item" class="form-control">
                                                <option value="">不限</option>
                                                <option value="1">二聯式</option>
                                                <option value="2">三聯式</option>
                                                
                                            </select>
                                        </span>
                                        <span class="inputSearch2">
                                             <label>起始日:</label>
                                        <input type="text" id="StartDate" class="datepicker form-control" placeholder="開始日">
                                        </span>
                                        <span class="inputSearch2">
                                              <label>結束日:</label>
                                        <input type="text" id="EndDate" class="datepicker form-control" placeholder="結束日">
                                        </span>

                                         <span class="inputSearchWidth55">
                                              <button type="button" class="btn btn-info btn-flat qPer" id="search">查詢</button>
                                        </span>
                                        <span class="inputSearchWidth55">
                                               <button type="button" class="btn btn-info btn-flat" id="print">列印</button>
                                        </span>
                                        <span class="inputSearchWidth55">
                                               <button type="button" class="btn btn-info btn-flat" id="EXCEL"  onclick="javascrīpt: exportExcel()">EXCEL</button>
                                        </span>
                                    </th>
                                </tr>
                            </thead>
                        </table>
                        <div class="box-body" id="exportExcel">
                        <div id="printArea">
                            <p class='marginTop5'><span>日期</span>:<span class='printStartDate'></span><span>-</span><span class='printEndDate'></span></p>
                            <table class="table table-hover marginTop10">
                                <thead id="">
                                    <tr class="bgGray">
                                        <th class="textAlignCenter" colspan="9">電子機算機發票明細表</th>
                                    </tr>
                                    <tr class="bgGray">
                                        <th class="textAlignCenter">序</th>
                                        <th class="textAlignCenter">日期</th>
                                        <th class="textAlignCenter">發票號碼</th>
                                        <th class="textAlignCenter">發票種類</th>
                                        <th class="textAlignCenter">買受人</th>
                                        <th class="textAlignCenter">品名</th>
                                        <th class="textAlignCenter">金額</th>
                                        <th class="textAlignCenter">稅額</th>
                                        <th class="textAlignCenter">總計</th>
                                    </tr>
                                </thead>
                                <tbody id="ElectronicCalculatorInvoiceDetailTb">

                                </tbody>
        
                        </table>
                        <!---->
                        <p class='marginTop5'><span>日期</span>:<span class='printStartDate'></span><span>-</span><span class='printEndDate'></span></p>
                            <table class="table table-hover marginTop10">
                                <thead id="">
                                    <tr class="bgGray">
                                        <th class="textAlignCenter" colspan="9">手開發票明細表</th>
                                    </tr>
                                    <tr class="bgGray">
                                        <th class="textAlignCenter">序</th>
                                        <th class="textAlignCenter">日期</th>
                                        <th class="textAlignCenter">發票號碼</th>
                                        <th class="textAlignCenter">案件編號</th>
                                        <th class="textAlignCenter">買受人</th>
                                        <th class="textAlignCenter">金額</th>
                                        <th class="textAlignCenter">稅額</th>
                                        <th class="textAlignCenter">總計</th>
                                        <th class="textAlignCenter">備註</th>
                                    </tr>
                                </thead>
                                <tbody id="HandOpenInvoiceDetailTb">

                                </tbody>
        
                        </table>
                        <!---->
                        <p class='marginTop5'><span>日期</span>:<span class='printStartDate'></span><span>-</span><span class='printEndDate'></span></p>
                            <table class="table table-hover marginTop10">
                                <thead id="">
                                    <tr class="bgGray">
                                        <th class="textAlignCenter" colspan="9">華冠網站電子發票明細表</th>
                                    </tr>
                                    <tr class="bgGray">
                                        <th class="textAlignCenter">序</th>
                                        <th class="textAlignCenter">日期</th>
                                        <th class="textAlignCenter">發票號碼</th>
                                        <th class="textAlignCenter">訂單編號</th>
                                        <th class="textAlignCenter">買受人</th>
                                        <th class="textAlignCenter">金額</th>
                                        <th class="textAlignCenter">稅額</th>
                                        <th class="textAlignCenter">總計</th>
                                        <th class="textAlignCenter">備註</th>
                                    </tr>
                                </thead>
                                <tbody id="WebElectronicInvoiceDetailTb">

                                </tbody>
        
                        </table>
                        <!---->
                        <p class='marginTop5'><span>日期</span>:<span class='printStartDate'></span><span>-</span><span class='printEndDate'></span></p>
                            <table class="table table-hover marginTop10">
                                <thead id="">
                                    <tr class="bgGray">
                                        <th class="textAlignCenter" colspan="9">輕鬆學院電子發票明細表</th>
                                    </tr>
                                    <tr class="bgGray">
                                        <th class="textAlignCenter">序</th>
                                        <th class="textAlignCenter">日期</th>
                                        <th class="textAlignCenter">發票號碼</th>
                                        <th class="textAlignCenter">訂單編號</th>
                                        <th class="textAlignCenter">買受人</th>
                                        <th class="textAlignCenter">金額</th>
                                        <th class="textAlignCenter">稅額</th>
                                        <th class="textAlignCenter">總計</th>
                                        <th class="textAlignCenter">備註</th>
                                    </tr>
                                </thead>
                                <tbody id="SchoolElectronicInvoiceDetailTb">

                                </tbody>
        
                        </table>
                        <!---->
                        </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        var MINVO01reportHandlerUrl_G = "reportHandlerMINVO01.ashx";
        function exportExcel() {
            var html = '&lt;meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8" />&lt;title>Excel&lt;/title>';
            html += '';
            html += document.getElementById('exportExcel').outerHTML + '';
            window.open('data:application/vnd.ms-excel,' + encodeURIComponent(html));
        }
        var getElectronicCalculatorInvoiceDetail = function (StartDate, EndDate) {
            blockUI_M();
            var data = "StartDate=" + StartDate + "&EndDate=" + EndDate + "&Invoice_Item=" + val_M("#Invoice_Item") + "&action=getElectronicCalculatorInvoiceDetail";
            var success = function (back) {
                Log_M("back=" + back);
                empty_M("#ElectronicCalculatorInvoiceDetailTb");
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                var deleteLine = false;
                $.each(json, function (i, v) {
                    if (v.Invoice_ARMame != "合計") {
                        if (v.Invoice_State == "2") {
                            deleteLine = true;
                        }
                        sb.append("<tr>");
                        sb.append("<td class='textAlignCenter'>");
                        if (deleteLine) {
                            sb.append("<s>");
                        }
                        sb.append(i + 1);
                        if (deleteLine) {
                            sb.append("</s>");
                        }
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        if (deleteLine) {
                            sb.append("<s>");
                        }
                        sb.append(v.Invoice_CreateDate);
                        if (deleteLine) {
                            sb.append("</s>");
                        }
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        if (deleteLine) {
                            sb.append("<s>");
                        }
                        sb.append(v.Invoice_Num);
                        if (deleteLine) {
                            sb.append("</s>");
                        }
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        if (deleteLine) {
                            sb.append("<s>");
                        }
                        sb.append(v.Invoice_ItemName);
                        if (deleteLine) {
                            sb.append("</s>");
                        }
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        if (v.Invoice_Item == "1") {
                            if (deleteLine) {
                                sb.append("<s>");
                            }
                            sb.append("買受人 : ");
                            sb.append(v.Invoice_ARMame);
                            if (deleteLine) {
                                sb.append("</s>");
                            }
                            if (deleteLine) {
                                sb.append("<span class='colorRed'>作廢</span>");
                            }

                        }
                        else {
                            sb.append("公司名稱：");
                            sb.append(v.Invoice_ComName);
                            sb.append("<br>統一編號：");
                            sb.append(v.Invoice_UnifyNum);
                        }
                        
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.Invoice_PName);
                        sb.append("</td>");

                        sb.append("<td class='textAlignCenter'>");
                        sb.append(getMoneyFormat_M(v.Invoice_PayAmountLessTax));
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(getMoneyFormat_M(v.Tax));
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(getMoneyFormat_M(v.Invoice_PayAmount));
                        sb.append("</td>");
                        sb.append("</tr>");
                    } else {
                        sb.append("<tr>");
                        sb.append("<td class='textAlignCenter' colspan='6'>");
                        sb.append(v.Invoice_ARMame);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter colorBlue'>");
                        sb.append(getMoneyFormat_M(v.Invoice_PayAmountLessTax));
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter colorBlue'>");
                        sb.append(getMoneyFormat_M(v.Tax));
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter colorBlue'>");
                        sb.append(getMoneyFormat_M(v.Invoice_PayAmount));
                        sb.append("</td>");
                        sb.append("</tr>");
                        sb.append("<tr class='textAlignCenter bgGray'>");
                        sb.append("<td class='textAlignCenter' colspan='9'>開立發票總數 ： ");
                        sb.append(json.length - 1);
                        sb.append("</td>");
                        sb.append("</tr>");
                    }
                    
                    deleteLine = false;
                });
                append_M("#ElectronicCalculatorInvoiceDetailTb", sb.toString());
                text_M(".printStartDate", StartDate);
                text_M(".printEndDate", EndDate);
                unBlockUI_M();
                
            };
            var error = function (e) { Log_M("getElectronicCalculatorInvoiceDetail error=" + e); unBlockUI_M(); };
            ajax_M(MINVO01reportHandlerUrl_G, data, success, error);
        };

        var getHandOpenInvoiceDetail = function (StartDate, EndDate) {
            blockUI_M();
            var data = "StartDate=" + StartDate + "&EndDate=" + EndDate  + "&action=getHandOpenInvoiceDetail";
            var success = function (back) {
                Log_M("back=" + back);
                empty_M("#HandOpenInvoiceDetailTb");
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                $.each(json, function (i, v) {
                    sb.append("<tr>");
                    sb.append("<td class='textAlignCenter'>");
                        sb.append(i + 1);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v);
                        sb.append("</td>");
                        sb.append("<td class='bgGray' colspan='7'>");
                        sb.append("</td>");
                    sb.append("</tr>");
                    
                });
                append_M("#HandOpenInvoiceDetailTb", sb.toString());
                text_M(".printStartDate", StartDate);
                text_M(".printEndDate", EndDate);
          

            };
            var error = function (e) { Log_M("getHandOpenInvoiceDetail error=" + e); unBlockUI_M(); };
            ajax_M(MINVO01reportHandlerUrl_G, data, success, error);
        };

        var getWebElectronicInvoiceDetail = function (StartDate, EndDate) {
            blockUI_M();
            var data = "StartDate=" + StartDate + "&EndDate=" + EndDate + "&Invoice_Item=" + val_M("#Invoice_Item") + "&action=getWebElectronicInvoiceDetail";
            var success = function (back) {
                Log_M("back=" + back);
                empty_M("#WebElectronicInvoiceDetailTb");
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                $.each(json, function (i, v) {
                    sb.append("<tr>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(i + 1);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.Transaction_Time);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.InvoiceNumber);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.O_Id);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.Name);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(getMoneyFormat_M(v.PriceLessTax));
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(getMoneyFormat_M(v.Tax));
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(getMoneyFormat_M(v.Price));
                    sb.append("</td>");
                    sb.append("</tr>");
                });
                append_M("#WebElectronicInvoiceDetailTb", sb.toString());
                text_M(".printStartDate", StartDate);
                text_M(".printEndDate", EndDate);
          

            };
            var error = function (e) { Log_M("getWebElectronicInvoiceDetail error=" + e); unBlockUI_M(); };
            ajax_M(MINVO01reportHandlerUrl_G, data, success, error);
        };
        var getSchoolElectronicInvoiceDetail = function (StartDate, EndDate) {
            blockUI_M();
            var data = "StartDate=" + StartDate + "&EndDate=" + EndDate +  "&action=getSchoolElectronicInvoiceDetail";
            var success = function (back) {
                Log_M("back=" + back);
                empty_M("#SchoolElectronicInvoiceDetailTb");
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                $.each(json, function (i, v) {
                    sb.append("<tr>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(i + 1);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.Transaction_Time);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.InvoiceNumber);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.O_Id);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.Name);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(getMoneyFormat_M(v.PriceLessTax));
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(getMoneyFormat_M(v.Tax));
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(getMoneyFormat_M(v.Price));
                    sb.append("</td>");
                    sb.append("</tr>");
                });
                append_M("#SchoolElectronicInvoiceDetailTb", sb.toString());
                text_M(".printStartDate", StartDate);
                text_M(".printEndDate", EndDate);
          

            };
            var error = function (e) { Log_M("getSchoolElectronicInvoiceDetail error=" + e); unBlockUI_M(); };
            ajax_M(MINVO01reportHandlerUrl_G, data, success, error);
        };

        var getInvoiceDetailTab = function () {
            var StartDate = val_M("#StartDate");
            var EndDate = val_M("#EndDate");
            //確定起始日跟結束日沒有寫反
            var doNext = check_M.isEndDateBigThanStartDate(StartDate, EndDate);
            if (doNext) {
                getElectronicCalculatorInvoiceDetail(StartDate, EndDate);
                getHandOpenInvoiceDetail(StartDate, EndDate);
                getWebElectronicInvoiceDetail(StartDate, EndDate);
                getSchoolElectronicInvoiceDetail(StartDate, EndDate);
            } else {
                alert("請正確選擇日期區間");
            }
        };
        

        $(function () {
            onClick_M("#search", getInvoiceDetailTab);
            onClick_M("#print", printScreen_M);
        })
    </script>
</asp:Content>

