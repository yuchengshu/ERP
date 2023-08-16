<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MCMEB04.aspx.cs" Inherits="wealthManage_report_MREPO_MCMEB04_MCMEB04" %>

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
                            <h1 class="box-title"><b>ERP &gt; 報表區 &gt; 會場-業績總表 </b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-hover" id="">
                            <thead id="">
                                <tr class="active">
                                    <th>
                                        <span class="inputSearch2">
                                            <label>列表方式:</label>
                                            <select id="Report_Item" class="form-control">
                                                <option value="1">總表</option>
                                                <option value="2">細表</option>
                                                <option value="3">分析師</option>
                                                <option value="4">責任助理</option>
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
                                        <span class="inputSearch2">
                                               <label>分析師:</label>
                                        <select id="MP" class="form-control MP" disabled="disabled"></select>
                                        </span>
                                        <span class="inputSearch2">
                                               <label>責任助理:</label>
                                        <select id="MC" class="form-control"  disabled="disabled"></select>
                                        </span>
                                         <span class="inputSearchWidth55">
                                              <button type="button" class="btn btn-info btn-flat qPer" id="search">查詢</button>
                                        </span>
                                        <span class="inputSearchWidth55">
                                               <button type="button" class="btn btn-info btn-flat" id="print">列印</button>
                                        </span>
                                    </th>
                                </tr>
                            </thead>
                        </table>
                        <div id="printArea">

                        </div>
                            
                           <!-- <table class="table table-hover marginTop10">
                                <thead id="">
                                    <tr class="bgGray">
                                        <th class="textAlignCenter borderGray">編號</th>
                                        <th class="textAlignCenter borderGray">日期</th>
                                        <th class="textAlignCenter borderGray">地點</th>
                                        <th class="textAlignCenter borderGray">分析師</th>
                                        <th class="textAlignCenter borderGray">來賓人數</th>
                                        <th class="textAlignCenter borderGray">交易件數</th>
                                        <th class="textAlignCenter borderGray">助理人數</th>
                                        <th class="textAlignCenter borderGray">入會金額</th>
                                        <th class="textAlignCenter borderGray">入帳金額</th>
                                        <th class="textAlignCenter borderGray">明細</th>
                                    </tr>
                                </thead>
                                <tbody id="">

                                </tbody>
        
                        </table>-->
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        var MCMEB04reportHandlerUrl_G = "reportHandlerMCMEB04.ashx";

        var getVenuePerformance = function (StartDate, EndDate, MP, MC, Report_Item) {
            blockUI_M();
            var data = "StartDate=" + StartDate + "&EndDate=" + EndDate + "&MP=" + MP + "&MC=" + MC + "&Report_Item=" + Report_Item  + "&action=getVenuePerformance";
            var success = function (back) {
                Log_M("back=" + back);
                empty_M("#printArea");
                var json = jsonParse_M(back);
                var sb = new string_M.StringBuilder();
                if (Report_Item == "1" || Report_Item == "3") {//總表及分析師報表
                    sb.append("<p class='marginTop5'><span>日期</span>:<span id='printStartDate'></span><span>-</span><span id='printEndDate'></span></p>");
                    sb.append("<table class='table table-hover marginTop10'>");
                        sb.append("<thead id=''>");
                            sb.append("<tr class='bgGray'>");
                                sb.append("<th class='textAlignCenter borderGray'>編號</th>");
                                sb.append("<th class='textAlignCenter borderGray'>日期</th>");
                                sb.append("<th class='textAlignCenter borderGray'>地點</th>");
                                sb.append("<th class='textAlignCenter borderGray'>分析師</th>");
                                sb.append("<th class='textAlignCenter borderGray'>來賓人數</th>");
                                sb.append("<th class='textAlignCenter borderGray'>交易件數</th>");
                                sb.append("<th class='textAlignCenter borderGray'>助理人數</th>");
                                sb.append("<th class='textAlignCenter borderGray'>入會金額</th>");
                                sb.append("<th class='textAlignCenter borderGray'>入帳金額</th>");
                                sb.append("<th class='textAlignCenter borderGray'>明細</th>");
                                sb.append("</tr>");
                                sb.append("</thead>");
                                sb.append("<tbody>");
                    $.each(json, function (i, v) {
                        sb.append("<tr>");
                        if (v.V_ID != "0") {
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.V_ID);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.V_Date);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.V_Site);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.MP_Name);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.V_Mem);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.MTRATvidCount);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.DVENUvidCount);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(getMoneyFormat_M(v.AdmissionMoney));
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(getMoneyFormat_M(v.AccountMoney));
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                    
                            sb.append("</td>");
                        } else {
                            sb.append("<td class='textAlignCenter bgGray' colspan='10' >筆數: ");
                            sb.append(json.length-1);
                            sb.append("</td>");
                        }
                        sb.append("</tr>");
                    });
                    sb.append("</tbody>");
                    sb.append("</table>");
                    append_M("#printArea", sb.toString());
                    
   
                    unBlockUI_M();
                } else if (Report_Item == "2") {//明細表
                    sb.append("<p class='marginTop5'><span>日期</span>:<span class='printStartDate'></span><span>-</span><span class='printEndDate'></span></p>");
                    $.each(json, function (i, v) {
                    sb.append("<table class='table table-hover marginTop10'>");
                    sb.append("<thead id=''>");
                    sb.append("<tr class='bgGray'>");
                    sb.append("<th class='textAlignCenter borderGray'>編號</th>");
                    sb.append("<th class='textAlignCenter borderGray'>日期</th>");
                    sb.append("<th class='textAlignCenter borderGray'>地點</th>");
                    sb.append("<th class='textAlignCenter borderGray'>分析師</th>");
                    sb.append("<th class='textAlignCenter borderGray'>來賓人數</th>");
                    sb.append("<th class='textAlignCenter borderGray'>交易件數</th>");
                    sb.append("<th class='textAlignCenter borderGray'>助理人數</th>");
                    sb.append("<th class='textAlignCenter borderGray'>入會金額</th>");
                    sb.append("<th class='textAlignCenter borderGray'>入帳金額</th>");
                    sb.append("</tr>");
                    sb.append("</thead>");
                    sb.append("<tbody>");
                    
                        sb.append("<tr>");
                       
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.V_ID);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.V_Date);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.V_Site);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.MP_Name);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.V_Mem);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.MTRATvidCount);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.DVENUvidCount);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(getMoneyFormat_M(v.AdmissionMoney));
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(getMoneyFormat_M(v.AccountMoney));
                            sb.append("</td>");
                           
                       
                            sb.append("</tr>");
                            sb.append("</tbody>");
                            sb.append("</table>");
                            if (v.pdeList != null) {

                                sb.append("<table class='table table-hover marginTop10'>");
                                sb.append("<thead id=''>");
                                sb.append("<tr class='bgGray'>");
                                sb.append("<th class='textAlignCenter borderGray'>入帳日</th>");
                                sb.append("<th class='textAlignCenter borderGray'>客戶姓名</th>");
                                sb.append("<th class='textAlignCenter borderGray'>會員編號</th>");
                                sb.append("<th class='textAlignCenter borderGray'>分析師</th>");
                                sb.append("<th class='textAlignCenter borderGray'>種類</th>");
                                sb.append("<th class='textAlignCenter borderGray'>責任助理</th>");
                                sb.append("<th class='textAlignCenter borderGray'>入會金額</th>");
                                sb.append("<th class='textAlignCenter borderGray'>入帳細節</th>");
                                sb.append("</tr>");
                                sb.append("</thead>");
                                sb.append("<tbody>");
                                
                                $.each(v.pdeList, function (ii, vv) {
                                    sb.append("<tr>");
                                    sb.append("<td class='textAlignCenter'>");
                                    sb.append(vv.T_AccountDate);
                                    sb.append("</td>");
                                    sb.append("<td class='textAlignCenter'>");
                                    sb.append(vv.M_Name);
                                    sb.append("</td>");
                                    sb.append("<td class='textAlignCenter'>");
                                    sb.append(vv.M_Num);
                                    sb.append("</td>");
                                    sb.append("<td class='textAlignCenter'>");
                                    sb.append(vv.MP_Name);
                                    sb.append("</td>");
                                    sb.append("<td class='textAlignCenter'>");
                                    sb.append(vv.T_ItemName);
                                    sb.append("</td>");
                                    sb.append("<td class='textAlignCenter'>");
                                    sb.append(vv.MCname);
                                    sb.append("</td>");
                                    sb.append("<td class='textAlignCenter'>");
                                    sb.append(getMoneyFormat_M(vv.T_PayMoney));
                                    sb.append("</td>");
                                    sb.append("<td class='textAlignCenter'>");
                                    sb.append("<table>");
                                    $.each(vv.cdeList, function (iii, vvv) {
                                        sb.append("<tr>");
                                        sb.append("<td style='width:70px' class='textAlignCenter'>");
                                        sb.append(vvv.Pay_TypeName);
                                        sb.append("</td>");
                                        sb.append("<td style='width:70px' class='textAlignCenter'>");
                                        sb.append(vvv.MC_Name);
                                        sb.append("</td>");
                                        sb.append("<td style='width:70px' class='textAlignCenter'>");
                                        sb.append(vvv.Account_Money);
                                        sb.append("</td>");
                                        sb.append("</tr>");
                                    });
                                    sb.append("</table>");
                                    
                                    sb.append("</td>");
                                    sb.append("</tr>");
                                });
                                
                                sb.append("</tbody>");
                                sb.append("</table>");
                            }
                    });
                    
                    append_M("#printArea", sb.toString());

                    unBlockUI_M();
                } else {//助理表
                    $.each(json, function (i, v) {
                        sb.append("<p class='marginTop5'><span>日期</span>:<span class='printStartDate'></span><span>-</span><span class='printEndDate'></span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;助理:&nbsp;&nbsp;</span><span>");
                        sb.append(v.MCname);
                        sb.append("</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;部門:&nbsp;&nbsp;</span><span>");
                        sb.append(v.U_MDEPname);
                      
                        sb.append("</span></p>");
                        sb.append("<table class='table table-hover marginTop10'>");
                        sb.append("<thead id=''>");
                        sb.append("<tr class='bgGray'>");
                        sb.append("<th class='textAlignCenter borderGray'></th>");
                        sb.append("<th class='textAlignCenter borderGray'>入帳日</th>");
                        sb.append("<th class='textAlignCenter borderGray'>姓名</th>");
                        sb.append("<th class='textAlignCenter borderGray'>會編</th>");
                        sb.append("<th class='textAlignCenter borderGray'>分析師</th>");
                        sb.append("<th class='textAlignCenter borderGray'>種類</th>");
                        sb.append("<th class='textAlignCenter borderGray'>入會金額</th>");
                        sb.append("<th class='textAlignCenter borderGray'>付款方式/入帳金額</th>");
                        sb.append("</tr>");
                        sb.append("</thead>");
                        sb.append("<tbody>");
                        $.each(v.pdeList, function (ii, vv) {
                            sb.append("<tr>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(ii+1);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(vv.T_AccountDate.split(' ')[0]);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(vv.MC_Name);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(vv.MC);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(vv.MP_Name);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(vv.T_ItemName);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(getMoneyFormat_M(vv.T_PayMoney));
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append("<span class=''>");
                            sb.append(vv.Pay_TypeName);
                            sb.append("</span>");
                            sb.append("<span class=''>");
                            sb.append(vv.Pay_tag);
                            sb.append("</span>");
                            sb.append("<span class=''>");
                            sb.append(vv.Pay_tagName);
                            sb.append("</span>");
                            sb.append("<span class=''>");
                            sb.append(vv.T_ID);
                            sb.append("</span>");
                            sb.append("</td>");
                            sb.append("</tr>");
                        });
                        sb.append("</tbody>");
                        sb.append("</table>");
                    });
                    append_M("#printArea", sb.toString());
                    unBlockUI_M();
                }
                text_M(".printStartDate", StartDate);
                text_M(".printEndDate", EndDate);
                
            };
            var error = function (e) { Log_M("getAdvancesRemainingMoney error=" + e); unBlockUI_M(); };
            ajax_M(MCMEB04reportHandlerUrl_G, data, success, error);
        };


        var getVenuePerformanceTab = function () {
            var StartDate = val_M("#StartDate");
            var Report_Item = val_M("#Report_Item");
            var EndDate = val_M("#EndDate");
            var MP = val_M("#MP");
            var MC = val_M("#MC");
            //確定起始日跟結束日沒有寫反
            var doNext = check_M.isEndDateBigThanStartDate(StartDate, EndDate);
            if (doNext) {
                getVenuePerformance(StartDate, EndDate, MP, MC, Report_Item);
            } else {
                alert("請正確選擇日期區間");
            }
        };
        
        var ReportItemChange = function () {
            var Report_Item = val_M(this);
           
            if (Report_Item == "3") {
                document.getElementById("MP").disabled = false;
                document.getElementById("MC").disabled = true;
            } else if (Report_Item == "4") {
                document.getElementById("MC").disabled = false;
                document.getElementById("MP").disabled = true;
            } else {
                document.getElementById("MP").disabled = true;
                document.getElementById("MC").disabled = true;
            }
          
        };

        $(function () {
            //取得分析師ListHtmlTagOption
            $Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "#MP", emptyValue_M, "option", emptyValue_M);
            $Common.MUSER.getResponsibleAssistantListHtmlTagOption(CommonHandlerUrl_M, "#MC", emptyValue_M, "option");
            onClick_M("#search", getVenuePerformanceTab);

            onChange_M("#Report_Item", ReportItemChange);
       
            $("#MP").attr("disabled", true);
            onClick_M("#print", printScreen_M);
        })
    </script>
</asp:Content>

