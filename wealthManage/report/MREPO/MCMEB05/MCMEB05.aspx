<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MCMEB05.aspx.cs" Inherits="wealthManage_report_MREPO_MCMEB05_MCMEB05" %>

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
                            <h1 class="box-title"><b>ERP &gt;  報表區 &gt;業績分類表</b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-hover" id="">
                            <thead id="">
                                <tr class="active">
                                   <th class="">
                                       <span class="inputSearch2">
                                            <label>列表方式:</label>
                                            <select id="Report_Item" class="form-control"><option value="1">分析師</option><option value="2">責任助理</option></select>
                                       </span>
                                       <span class="inputSearch2">
                                           <label>分析師:</label>
                                            <select id="MP" class="form-control"></select>
                                       </span>
                                       <span class="inputSearch2 startHide">
                                           <label>責任助理:</label>
                                        <select id="MC" class="form-control"></select>
                                       </span>
                                       <span class="inputSearch2">
                                           <label>起始日:</label>
                                        <input type="text" id="StartDate" class="datepicker form-control " placeholder="開始日">
                                       </span>
                                       <span class="inputSearch2">
                                           <label>結束日:</label>
                                        <input type="text" id="EndDate" class="datepicker form-control " placeholder="結束日">
                                       </span>
                                       <span class="inputSearchWidth55">
                                           <button type="button" class="btn btn-info btn-flat qPer" id="search">查詢</button>
                                       </span>
                                        <span class="inputSearch2">
                                            <button type="button" class="btn btn-info btn-flat" id="print">列印</button>
                                       </span>
                                   </th>
                                   <!-- <th class="">
                                        <label>列表方式:</label>
                                        <select id="Report_Item" class="form-control"><option value="1">分析師</option><option value="2">責任助理</option></select>
                                    </th>
                                    <th class=" startHide">
                                        <label>分析師:</label>
                                        <select id="MP" class="form-control"></select>
                                    </th>
                                    <th class=" startHide">
                                        <label>責任助理:</label>
                                        <select id="MC" class="form-control"></select>
                                    </th>
                                    <th class="">
                                        <label>起始日:</label>
                                        <input type="text" id="StartDate" class="datepicker form-control " placeholder="開始日">
                                    </th>
                                    <th class="">
                                        <label>結束日:</label>
                                        <input type="text" id="EndDate" class="datepicker form-control " placeholder="結束日">
                                    </th>
                                    
                                    
                                    <th class="">
                                        <span class="input-group-btn marginLeft">
                                            <button type="button" class="btn btn-info btn-flat qPer" id="search">查詢</button>
                                            
                                        </span>
                                    </th>
                                    <th class="">
                                        <span class="input-group-btn marginLeft">
                                             <button type="button" class="btn btn-info btn-flat" id="print">列印</button>
                                        </span>
                                    </th>-->

                                </tr>
                            </thead>
                        </table>
                        <div id="printArea">
                            <div class='textAlignCenter startHide dateClass'>
                                <h3 class='table table-hover'>業績分類表</h3>
                            </div>
                            <p class='textAlignCenter startHide dateClass'><span>日期</span>:<span id="startDateSpan"></span>-<span id="endDateSpan"></span></p>
                                 <table class="table table-hover startHide" tableClass="Analyst" id="AnalystTab" >
                                <thead>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter">分析師</th>
                                        <th class="textAlignCenter">業績總額</th>
                                        <th class="textAlignCenter">會費總額</th>
                                        <th class="textAlignCenter">A組</th>
                                        <th class="textAlignCenter">B組</th>
                                        <th class="textAlignCenter">會場</th>
                                        <th class="textAlignCenter">獎金成本</th>
                                        <th class="textAlignCenter">其他收入</th>
                                        <th class="textAlignCenter">折讓</th>
                                    </tr>
                                </thead>
                                <tbody id="AnalystTb">
  
                                </tbody>
                            </table>

                            <table class="table table-hover startHide AssistantTab" tableClass="Assistant" id="" >
                                <thead>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter colorRed width15percent">營運事業一部A組</th>
                                    </tr>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter">責任助理</th>
                                        <th class="textAlignCenter">業績總額</th>
                                        <th class="textAlignCenter">入會總額</th>
                                        <th class="textAlignCenter">會場金額</th>
                                        <th class="textAlignCenter">紅燈</th>
                                        <th class="textAlignCenter">黃燈</th>
                                        <th class="textAlignCenter">綠燈</th>
                                        <th class="textAlignCenter">現金</th>
                                        <th class="textAlignCenter">備註</th>
                                    </tr>
                                </thead>
                                <tbody id="HG010002Tb">
  
                                </tbody>
                            </table>
                            <table class="table table-hover startHide AssistantTab" tableClass="Assistant" id="" >
                                <thead>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter colorRed width15percent">營運事業一部B組</th>
                                    </tr>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter">責任助理</th>
                                        <th class="textAlignCenter">業績總額</th>
                                        <th class="textAlignCenter">入會總額</th>
                                        <th class="textAlignCenter">會場金額</th>
                                        <th class="textAlignCenter">紅燈</th>
                                        <th class="textAlignCenter">黃燈</th>
                                        <th class="textAlignCenter">綠燈</th>
                                        <th class="textAlignCenter">現金</th>
                                        <th class="textAlignCenter">備註</th>
                                    </tr>
                                </thead>
                                <tbody id="HG010006Tb">
  
                                </tbody>
                            </table>
                            <table class="table table-hover startHide AssistantTab" tableClass="Assistant" id="" >
                                <thead>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter colorRed width15percent">營運事業二部A組</th>
                                    </tr>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter">責任助理</th>
                                        <th class="textAlignCenter">業績總額</th>
                                        <th class="textAlignCenter">入會總額</th>
                                        <th class="textAlignCenter">會場金額</th>
                                        <th class="textAlignCenter">紅燈</th>
                                        <th class="textAlignCenter">黃燈</th>
                                        <th class="textAlignCenter">綠燈</th>
                                        <th class="textAlignCenter">現金</th>
                                        <th class="textAlignCenter">備註</th>
                                    </tr>
                                </thead>
                                <tbody id="HG050015Tb">
  
                                </tbody>
                            </table>
                            <table class="table table-hover startHide AssistantTab" tableClass="Assistant" id="" >
                                <thead>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter colorRed width15percent">營運事業二部B組</th>
                                    </tr>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter">責任助理</th>
                                        <th class="textAlignCenter">業績總額</th>
                                        <th class="textAlignCenter">入會總額</th>
                                        <th class="textAlignCenter">會場金額</th>
                                        <th class="textAlignCenter">紅燈</th>
                                        <th class="textAlignCenter">黃燈</th>
                                        <th class="textAlignCenter">綠燈</th>
                                        <th class="textAlignCenter">現金</th>
                                        <th class="textAlignCenter">備註</th>
                                    </tr>
                                </thead>
                                <tbody id="HG050016Tb">
  
                                </tbody>
                            </table>
                            <table class="table table-hover startHide AssistantTab" tableClass="Assistant" id="" >
                                <thead>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter colorRed width15percent">投資推廣部A組</th>
                                    </tr>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter">責任助理</th>
                                        <th class="textAlignCenter">業績總額</th>
                                        <th class="textAlignCenter">入會總額</th>
                                        <th class="textAlignCenter">會場金額</th>
                                        <th class="textAlignCenter">紅燈</th>
                                        <th class="textAlignCenter">黃燈</th>
                                        <th class="textAlignCenter">綠燈</th>
                                        <th class="textAlignCenter">現金</th>
                                        <th class="textAlignCenter">備註</th>
                                    </tr>
                                </thead>
                                <tbody id="HG020007Tb">
  
                                </tbody>
                            </table>
                            <table class="table table-hover startHide AssistantTab" tableClass="Assistant" id="" >
                                <thead>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter colorRed width15percent">投資推廣部B組</th>
                                    </tr>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter">責任助理</th>
                                        <th class="textAlignCenter">業績總額</th>
                                        <th class="textAlignCenter">入會總額</th>
                                        <th class="textAlignCenter">會場金額</th>
                                        <th class="textAlignCenter">紅燈</th>
                                        <th class="textAlignCenter">黃燈</th>
                                        <th class="textAlignCenter">綠燈</th>
                                        <th class="textAlignCenter">現金</th>
                                        <th class="textAlignCenter">備註</th>
                                    </tr>
                                </thead>
                                <tbody id="HG020008Tb">
  
                                </tbody>
                            </table>
                            <table class="table table-hover startHide AssistantTab" tableClass="Assistant" id="" >
                                <thead>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter colorRed width15percent">財富管理部A組</th>
                                    </tr>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter">責任助理</th>
                                        <th class="textAlignCenter">業績總額</th>
                                        <th class="textAlignCenter">入會總額</th>
                                        <th class="textAlignCenter">會場金額</th>
                                        <th class="textAlignCenter">紅燈</th>
                                        <th class="textAlignCenter">黃燈</th>
                                        <th class="textAlignCenter">綠燈</th>
                                        <th class="textAlignCenter">現金</th>
                                        <th class="textAlignCenter">備註</th>
                                    </tr>
                                </thead>
                                <tbody id="HG030011Tb">
  
                                </tbody>
                            </table>
                            <table class="table table-hover startHide AssistantTab" tableClass="Assistant" id="" >
                                <thead>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter colorRed width15percent">財富管理部B組</th>
                                    </tr>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter">責任助理</th>
                                        <th class="textAlignCenter">業績總額</th>
                                        <th class="textAlignCenter">入會總額</th>
                                        <th class="textAlignCenter">會場金額</th>
                                        <th class="textAlignCenter">紅燈</th>
                                        <th class="textAlignCenter">黃燈</th>
                                        <th class="textAlignCenter">綠燈</th>
                                        <th class="textAlignCenter">現金</th>
                                        <th class="textAlignCenter">備註</th>
                                    </tr>
                                </thead>
                                <tbody id="HG030012Tb">
  
                                </tbody>
                            </table>
                            <table class="table table-hover startHide AssistantTab" tableClass="Assistant" id="" >
                                <thead>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter colorRed width15percent">理財推廣部A組-洪瑞賢</th>
                                    </tr>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter">責任助理</th>
                                        <th class="textAlignCenter">業績總額</th>
                                        <th class="textAlignCenter">入會總額</th>
                                        <th class="textAlignCenter">會場金額</th>
                                        <th class="textAlignCenter">紅燈</th>
                                        <th class="textAlignCenter">黃燈</th>
                                        <th class="textAlignCenter">綠燈</th>
                                        <th class="textAlignCenter">現金</th>
                                        <th class="textAlignCenter">備註</th>
                                    </tr>
                                </thead>
                                <tbody id="HG040013TbD0501041">
  
                                </tbody>
                            </table>
                            <table class="table table-hover startHide AssistantTab" tableClass="Assistant" id="" >
                                <thead>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter colorRed width15percent">理財推廣部A組-劉彥良</th>
                                    </tr>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter">責任助理</th>
                                        <th class="textAlignCenter">業績總額</th>
                                        <th class="textAlignCenter">入會總額</th>
                                        <th class="textAlignCenter">會場金額</th>
                                        <th class="textAlignCenter">紅燈</th>
                                        <th class="textAlignCenter">黃燈</th>
                                        <th class="textAlignCenter">綠燈</th>
                                        <th class="textAlignCenter">現金</th>
                                        <th class="textAlignCenter">備註</th>
                                    </tr>
                                </thead>
                                <tbody id="HG040013TbD0509211">
  
                                </tbody>
                            </table>
                            <table class="table table-hover startHide AssistantTab" tableClass="Assistant" id="" >
                                <thead>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter colorRed width15percent">理財推廣部B組</th>
                                    </tr>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter">責任助理</th>
                                        <th class="textAlignCenter">業績總額</th>
                                        <th class="textAlignCenter">入會總額</th>
                                        <th class="textAlignCenter">會場金額</th>
                                        <th class="textAlignCenter">紅燈</th>
                                        <th class="textAlignCenter">黃燈</th>
                                        <th class="textAlignCenter">綠燈</th>
                                        <th class="textAlignCenter">現金</th>
                                        <th class="textAlignCenter">備註</th>
                                    </tr>
                                </thead>
                                <tbody id="HG040014Tb">
  
                                </tbody>
                            </table>
                            <table class="table table-hover startHide AssistantTab" tableClass="Assistant" id="" >
                                <thead>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter colorRed width15percent">網路事業部A組</th>
                                    </tr>
                                    <tr class ="bgBlue">
                                        <th class="textAlignCenter">責任助理</th>
                                        <th class="textAlignCenter">業績總額</th>
                                        <th class="textAlignCenter">入會總額</th>
                                        <th class="textAlignCenter">會場金額</th>
                                        <th class="textAlignCenter">紅燈</th>
                                        <th class="textAlignCenter">黃燈</th>
                                        <th class="textAlignCenter">綠燈</th>
                                        <th class="textAlignCenter">現金</th>
                                        <th class="textAlignCenter">備註</th>
                                    </tr>
                                </thead>
                                <tbody id="HG060017Tb">
  
                                </tbody>
                            </table>
                         </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        var StartDateTime = undefined;
        var EndDateTime = undefined;
        var Date_C = undefined;

        var reportHandlerMCMEB05Url_G = "reportHandlerMCMEB05.ashx";
        var reportItemChange = function () {
            var type = val_M(this);
            if (type == "1") {
                disabledTrue_M("#MC");
                disabledFalse_M("#MP");
            } else {
                disabledTrue_M("#MP");
                disabledFalse_M("#MC");
            }
        };

        var getAssistantPerformance = function (U_MDEP, ComID, MP) {
            var startDate = val_M("#StartDate");
            var endDate = val_M("#EndDate");
            text_M("#startDateSpan", startDate);
            text_M("#endDateSpan", endDate);
            var data = "StartDate=" + startDate + "&EndDate=" + endDate + "&U_MDEP=" + U_MDEP + "&ComID=" + ComID + "&MP=" + MP + "&action=getAssistantPerformance";
            var success = function (back) {
                Log_M("getAssistantPerformance back=" + back);
                var id = undefined;
                if (isEmptyStr(MP)) {
                    id = "#" + ComID + U_MDEP + "Tb";
                } else {
                    id = "#" + ComID + U_MDEP + "Tb" + MP;
                }
                empty_M(id);
                var sb = new StringBuilder_M();
                var json = jsonParse_M(back);
                $.each(json, function (i, v) {
                    if (i != (json.length - 1)) {
                        sb.append("<tr>");
                    } else {
                        sb.append("<tr class='bgBlue colorBlue'>");
                    }
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.assistantName);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(getMoneyFormat_M(Math.round(v.totalPerformanceMoney)));
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(getMoneyFormat_M(Math.round(v.totalMemberMoney)));
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(getMoneyFormat_M(Math.round(v.venueMoney)));
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(getMoneyFormat_M(Math.round(v.redLightMoney)));
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(getMoneyFormat_M(Math.round(v.yellowLightMoney)));
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(getMoneyFormat_M(Math.round(v.greenLightMoney)));
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append("</td>");
                    sb.append("</tr>");
                });
                
                append_M(id, sb.toString());
                if (U_MDEP == "0017") {
                    show_M(".dateClass");
                    show_M(".AssistantTab");
                    unBlockUI_M();
                }

            };
            var error = function (e) { Log_M("getAssistantPerformance error=" + e); unBlockUI_M(); };

            ajax_M(reportHandlerMCMEB05Url_G, data, success, error);
        };
        var getAllAnalystListForPerformance = function () {
            blockUI_M("#AnalystTb");
            var startDate = val_M("#StartDate");
            var endDate = val_M("#EndDate");
            text_M("#startDateSpan", startDate);
            text_M("#endDateSpan", endDate);
            var data = "StartDate=" + startDate + "&EndDate=" + endDate+"&action=getAllAnalystListForPerformance";
            var success = function (back) {
                Log_M("getAllAnalystListForPerformance back=" + back);
                empty_M("#AnalystTb");
                var sb = new StringBuilder_M();
                var json = jsonParse_M(back);
                $.each(json, function (i, v) {
                    if (i != (json.length - 1)) {
                        sb.append("<tr>");
                    } else {
                        sb.append("<tr class='bgBlue colorBlue'>");
                    }
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.analystName);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(getMoneyFormat_M(Math.round(v.totalPerformanceMoney)));
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(getMoneyFormat_M(Math.round(v.totalMemberMoney)));
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(getMoneyFormat_M(Math.round(v.aGroupMoney)));
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(getMoneyFormat_M(Math.round(v.bGroupMoney)));
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(getMoneyFormat_M(Math.round(v.venueMoney)));
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                   sb.append(getMoneyFormat_M(Math.round(v.bonusCost)));
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(getMoneyFormat_M(Math.round(v.otherIncome)));
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(getMoneyFormat_M(Math.round(v.discount)));
                    sb.append("</td>");
                    sb.append("</tr>");
                });
                append_M("#AnalystTb", sb.toString());
                show_M(".dateClass");
                show_M("#AnalystTab");
                unBlockUI_M();
            };
            var error = function (e) { Log_M("getAllAnalystListForPerformance error=" + e); $.unblockUI(); };

            ajax_M(reportHandlerMCMEB05Url_G, data, success, error);
        };
        var getAllAssistantListForPerformance = function () {
            blockUI_M();
            getAssistantPerformance("0002", "HG01");
            getAssistantPerformance("0006", "HG01");
            getAssistantPerformance("0015", "HG05");
            getAssistantPerformance("0016", "HG05");
            getAssistantPerformance("0007", "HG02");
            getAssistantPerformance("0008", "HG02");
            getAssistantPerformance("0011", "HG03");
            getAssistantPerformance("0012", "HG03");
            getAssistantPerformance("0014", "HG04");
            getAssistantPerformance("0017", "HG06");
            getAssistantPerformance("0013", "HG04", "D0501041");
            getAssistantPerformance("0013", "HG04", "D0509211");

        };
        var getClassifiedPerformance = function (startDate, endDate) {
            StartDateTime = new Date();
            var startDate = val_M("#StartDate");
            var endDate = val_M("#EndDate");
            var doNext = check_M.isEndDateBigThanStartDate(startDate, endDate);
            if (doNext) {
                var Report_Item = val_M("#Report_Item");
                if (Report_Item == "1") {
                    hide_M(".AssistantTab");
                    getAllAnalystListForPerformance();
                } else if (Report_Item == "2") {
                    hide_M("#AnalystTab");
                    getAllAssistantListForPerformance();
                }
                
            } else {
                alert("請正確選擇日期區間");
                unBlockUI_M();
            }
        };
      
        $(function () {
            //取得分析師ListHtmlTagOption
            $Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "#MP", emptyValue_M, "option");
            $Common.MUSER.getResponsibleAssistantListHtmlTagOption(CommonHandlerUrl_M, "#MC", ComID_M, "option");
            onClick_M("#print", printScreen_M);
            onChange_M("#Report_Item", reportItemChange);
            onClick_M("#search", getClassifiedPerformance);
            disabledTrue_M("#MC");
        })
    </script>
</asp:Content>

