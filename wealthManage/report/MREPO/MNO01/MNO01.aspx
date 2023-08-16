<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MNO01.aspx.cs" Inherits="wealthManage_report_MREPO_MNO01_MNO01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>

    .table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td, .table>tbody>tr>td, .table>tfoot>tr>td {
   border-top: 1px solid white ;
}
        .border1Gray {
         border:1px solid  #f4f4f4;
        }
        .deptTabTH {
            border:1px solid  #f4f4f4;
            background-color: #f4f4f4;
        }
        .marginLeftRight15 {
            margin-left:15px;
            margin-right:15px;
        }
        .paddingLeftRight15 {
            padding-left:15px;
            padding-right:15px;
        }
        .bgColorf4f4f4 {
          background-color:#f4f4f4;
        }
    </style>
   
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
                            <h1 class="box-title"><b>ERP &gt;  報表區 &gt;公司管理總表 </b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <div id="" class="tabDivMargin3 divBorder">
                                <div id="" class="titleBottomBorder marginLeftRight10">
                                    <h3><span class="">主資訊區</span>

                                    </h3>
                                </div>
                                <table id="" class="table marginTop10 ">
                                    <tr class="">
                                        <td class="textAlignCenter"><a href="javascript:void(0)" class="getMonth">本月</a>&nbsp;<a class="getMonth" href="javascript:void(0)">上月</a>&nbsp;<B>報表區間&nbsp;:</B></td>
                                        <td class="textAlignLeft"><span id="reportDate"></span></td>
                                        <td class="textAlignCenter"><B>本日業績&nbsp;:</B></td>
                                        <td class="textAlignLeft"><B id="todayPerformance" class="colorBlue"></B><span>&nbsp; 萬</span></td>
                                        <td class="textAlignCenter"><B>本月目前業績&nbsp;:</B></td>
                                        <td class="textAlignLeft"><B id="monthPerformance" class="colorBlue"></B><span>&nbsp; 萬</span></td>
                                        <td class="textAlignCenter"><B>本月節目成本&nbsp;:</B></td>
                                        <td class="textAlignLeft"><B id="monthProgramPerformance" class="colorBlue"></B><span>&nbsp; 萬</span></td>
                                        <td class="textAlignCenter"><B>本月業績目標&nbsp;:</B></td>
                                        <td class="textAlignLeft"><B id="monthPerformanceAims" class="colorBlue"></B><span>&nbsp; 萬</span></td>
                                        <td class="textAlignCenter"><B>本月達成率</B></td>
                                        <td class="textAlignLeft"><B id="monthAchievingRate" class="colorBlue"></B><span>&nbsp; %</span></td>
                                    </tr>
                                </table>
                            </div>
                            <div id="" class="tabDivMargin3 divBorder">
                                <div id="" class="titleBottomBorder marginLeftRight10">
                                    <h3><span class=""> 圖表區</span></h3>
                                </div>
                                <table id="" class="table marginTop10 ">
                                    <tr class="">
                                        <td>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" id="perMonthRevenue" ><B>每月營收</B></a>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)"  id="AnalystCPvalue"><B>分析師成本/營收比圖</B></a>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)"><B>Call訊表</B></a></td>
                                        
                                    </tr>
                                    
                                </table>
                            </div>
                            <table style="width:100%" class="table marginTop10">
                                <tbody>
                                    <tr>
                                        <td id="depPerformance"  style="width:100%">
                                            <!--營運事業一部-->
                                            <!--<div style="float: Left; width: 50%;" class="tabDivMargin3 divBorder">
                                                <div id="" class="titleBottomBorder marginLeftRight10">
                                                    <h3><span class="">營運事業一部</span></h3>
                                                </div>
                                                <table id="" class="table marginTop10 marginLeftRight15" style=" width: 95%;">
                                                    <tr class="">
                                                        <th class="textAlignCenter deptTabTH">分析師</th>
                                                        <th class="textAlignCenter deptTabTH">月業績</th>
                                                        <th class="textAlignCenter deptTabTH">成本</th>
                                                        <th class="textAlignCenter deptTabTH">call訊</th>
                                                        <th class="textAlignCenter deptTabTH">留倉</th>
                                                        <th class="textAlignCenter deptTabTH">電話</th>
                                                    </tr>
                                                    <tbody>

                                                    </tbody>
                                                </table>
                                                <div id="" class="titleTopBorder marginLeftRight10">
                                                    <table id="" class="table marginTop10 ">
                                                        <tr class="">
                                                            <td class="textAlignLeft"><B>本日業績</B>&nbsp;:&nbsp;&nbsp;<B class="colorBlue">100</B>&nbsp;萬</td>
                                                            <td class="textAlignLeft"><B>節目成本</B>&nbsp;:&nbsp;&nbsp;<B class="colorBlue">100</B>&nbsp;萬</td>
                                                            <td class="textAlignLeft"><B>業績目標</B>&nbsp;:&nbsp;&nbsp;<B class="colorBlue">100</B>&nbsp;萬</td>
                                                        </tr>
                                                        <tr class="">
                                                            <td class="textAlignLeft"><B>本月業績</B>&nbsp;:&nbsp;&nbsp;<B class="colorBlue">100</B>&nbsp;萬</td>
                                                            <td class="textAlignLeft"><B></B></td>
                                                            <td class="textAlignLeft"><B>達成率</B>&nbsp;:&nbsp;&nbsp;<B class="colorBlue">100</B>&nbsp;%</td>
                                                        </tr>
                                                    </table>
                                                </div>
                                             </div>
                                            <!--營運事業二部-->
                                            <!--<div style="float: Left; width: 50%;" class="tabDivMargin3 divBorder">
                                                <div id="" class="titleBottomBorder marginLeftRight10">
                                                    <h3><span class=""> 營運事業二部</span></h3>
                                                </div>
                                                <table id="" class="table marginTop10 ">
                                                    <tr class="">
                                                        
                                                        <th class="textAlignCenter">分析師</th>
                                                        <th class="textAlignCenter">月業績</th>
                                                        <th class="textAlignCenter">成本</th>
                                                        <th class="textAlignCenter">call訊</th>
                                                        <th class="textAlignCenter">留倉</th>
                                                        <th class="textAlignCenter">電話</th>

                                                    </tr>
                                    
                                                </table>
                                             </div>-->
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            
                            <!--每月營收 start-->
                            <div id="perMonthRevenueDialog" class="form-control" title="每月營收">
                                <div id="visualization" style="width:2000px; height: 400px;"></div>
                                <table class="table marginTop10 ">
                                   <thead id="pmrdTH"></thead>
                                   <tbody id="pmrdTB"></tbody> 
                                </table>
                            </div>
                            <!--每月營收 END-->
                            <!--分析師CP start-->
                            <div id="AnalystCPvalueDialog" class="form-control" title="分析師成本/營收比圖">
                                <div id="visualization1" style="width:2000px; height: 400px;"></div>
                               
                            </div>
                            <!--分析師CP END-->
                            <!--達成率明細表 start-->
                            <div id="RevenueAimRateDetailDialog" class="form-control" title="達成率明細表">
                                
                               
                            </div>
                            <!--達成率明細表 END-->

                
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script>

        //畫圖1==========================================start
        //畫圖1-1=資料取得
        var drawData_G = <%=getPerMonthRevenueForDraw()%>;
        var drawVisualizationJson_G = undefined;
        drawVisualizationJson_G = drawData_G;
        $.each(drawVisualizationJson_G, function (i, v) {
            if (i != 0) {
                $.each(v, function (ii, vv) {
                    if (ii != 0) {
                        drawVisualizationJson_G[i][ii] = parseInt(vv) / 10000;
                    }
                })
            }
        });
        //畫圖1-2=畫圖開始
        google.load('visualization', '1', { packages: ['corechart'] });
        function drawVisualization() {
            // Create and populate the data table.
           
            var data = google.visualization.arrayToDataTable(drawData_G);
            
            // Create and draw the visualization.
            var ac = new google.visualization.ComboChart(document.getElementById('visualization'));
            ac.draw(data, {
                title: '每月營收',
                width: 1800,
                height: 400,
                vAxis: { title: "營收(萬)" },
                hAxis: { title: "月份" },
                seriesType: "bars",
                series: { 6: { type: "line" } }
            });
        }
        google.setOnLoadCallback(drawVisualization);
        //畫圖1==========================================end

        //畫圖2==========================================start
        //畫圖2-1=資料取得
        var drawAnalystCPvalueData_G = <%=getAnalystCPvalue()%>;
        var drawAnalystCPData_G = undefined;
        drawAnalystCPData_G = drawAnalystCPvalueData_G;
        $.each(drawAnalystCPData_G, function (i, v) {
            if (i != 0) {
                $.each(v, function (ii, vv) {
                    if (ii != 0) {
                        drawAnalystCPData_G[i][ii] = parseInt(vv) / 10000;
                    }
                })
            }
        });
        //畫圖2-2=畫圖開始
        google.load('visualization', '1', { packages: ['corechart'] });
        function drawVisualization1() {
            // Create and populate the data table.
           
            var data = google.visualization.arrayToDataTable(drawAnalystCPvalueData_G);
            
            // Create and draw the visualization.
            var ac = new google.visualization.ColumnChart(document.getElementById('visualization1'));
            ac.draw(data, {title:"分析師成本/營成比圖",
                width:1500, height:500,
                hAxis: {title: "分析師"}});
        }
        google.setOnLoadCallback(drawVisualization1);
        //畫圖1==========================================end
        
        
        var reportHandlerMNO01Url_G = "reportHandlerMNO01.ashx";

        
        var getTodayPerformance = function () {
            var data = "action=getTodayPerformance&today=" +getTodayStr_M() ;
            var success = function (back) {
                text_M("#todayPerformance",roundDecimal_M(parseInt(back) / 10000,2));
              
            };
            var error = function (e) { Log_M("getTodayPerformance error=" + e); unBlockUI_M(); };
            ajax_M(reportHandlerMNO01Url_G, data, success, error);//<=======================
        };
        var getMonth = function (monthType) {

            if (isEmptyStr(monthType)) {
                monthType = text_M(this);
            }
            //取當日
            var startdate = new Date();
            //取當日
            var enddate = new Date();
            var MonthCostEnddate = new Date();
            var startdateStr = undefined;
            var enddateStr = undefined;
            var MonthCostEnddateStr = undefined;
            var PerformanceAimsStartDate = new Date();
            var PerformanceAimsStartDateStr = undefined;
            if (monthType == "本月") {
                //設定日期為第一天
                startdate.setDate(1);
                startdateStr = startdate.getFullYear() + "/" + (startdate.getMonth() + 1) + "/" + startdate.getDate();
           
                //將月份移至下個月份
                enddate.setMonth(enddate.getMonth() + 1);
                //設定為下個月份的第一天
                enddate.setDate(1);
                //將日期-1為當月的最後一天
                enddate.setDate(enddate.getDate() - 1);
                enddateStr = enddate.getFullYear() + "/" + (enddate.getMonth() + 1) + "/" + enddate.getDate();
            
                MonthCostEnddate.setDate(1);
                MonthCostEnddate.setDate(enddate.getDate() - 1);
                MonthCostEnddateStr = MonthCostEnddate.getFullYear() + "/" + (MonthCostEnddate.getMonth() + 1) + "/" + MonthCostEnddate.getDate();
                PerformanceAimsStartDate.setDate(1);
                PerformanceAimsStartDateStr = PerformanceAimsStartDate.getFullYear() + "/" + (PerformanceAimsStartDate.getMonth() + 1) + "/" + PerformanceAimsStartDate.getDate();

            } else {
                startdate.setMonth(startdate.getMonth() - 1);
                //設定為下個月份的第一天
                startdate.setDate(1);
                startdateStr = startdate.getFullYear() + "/" + (startdate.getMonth() + 1) + "/" + startdate.getDate();
            
                enddate.setDate(1);
                //將日期-1為當月的最後一天
                enddate.setDate(enddate.getDate() - 1);
                enddateStr = enddate.getFullYear() + "/" + (enddate.getMonth() + 1) + "/" + enddate.getDate();
          
                startdate.setMonth(MonthCostEnddate.getMonth() - 1);
                MonthCostEnddate.setDate(1);
                MonthCostEnddate.setDate(enddate.getDate() - 1);
                MonthCostEnddateStr = MonthCostEnddate.getFullYear() + "/" + (MonthCostEnddate.getMonth() + 1) + "/" + MonthCostEnddate.getDate();
                PerformanceAimsStartDate.setMonth(startdate.getMonth() - 1);
                //設定為下個月份的第一天
                PerformanceAimsStartDate.setDate(1);
                PerformanceAimsStartDateStr = PerformanceAimsStartDate.getFullYear() + "/" + (PerformanceAimsStartDate.getMonth() + 1) + "/" + PerformanceAimsStartDate.getDate();

            }
            text_M("#reportDate", startdateStr + " ~ " + enddateStr);
            getMonthPerformance(startdateStr, enddateStr);
            getMonthCost(MonthCostEnddateStr);
            getMonthPerformanceAims(PerformanceAimsStartDateStr, getMonthPerformance(startdateStr, enddateStr));
        };
        var getMonthPerformance = function (startDate,endDate) {
            var data = "action=getMonthPerformance&startDate=" + startDate + "&endDate=" + endDate;
            var success = function (back) {
          
                text_M("#monthPerformance", roundDecimal_M(parseInt(back) / 10000, 2));
                return back;
            };
            var error = function (e) { Log_M("getMonthPerformance error=" + e); unBlockUI_M(); };
            ajax_M(reportHandlerMNO01Url_G, data, success, error);//<=======================
        };

        var getMonthCost = function (endDate) {
            var data = "action=getMonthCost&endDate=" + endDate ;
            var success = function (back) {
   
                text_M("#monthProgramPerformance", roundDecimal_M(parseInt(back) / 10000, 2));

            };
            var error = function (e) { Log_M("getMonthCost error=" + e); unBlockUI_M(); };
            ajax_M(reportHandlerMNO01Url_G, data, success, error);//<=======================
        };

        var getMonthPerformanceAims = function (startDate, MonthPerformance) {
            var data = "action=getMonthPerformanceAims&startDate=" + startDate;
            var success = function (back) {
     
                var showValue = undefined;
                if (back =="0"|| isEmptyStr(back)) {
                    showValue = "0";
                    text_M("#monthAchievingRate", showValue);
                } else {
                    text_M("#monthAchievingRate", parseInt(MonthPerformance) / parseInt(back));
                    showValue =roundDecimal_M(parseInt(back) / 10000, 2);
                }
                text_M("#monthPerformanceAims", showValue);

            };
            var error = function (e) { Log_M("getMonthPerformanceAims error=" + e); unBlockUI_M(); };
            ajax_M(reportHandlerMNO01Url_G, data, success, error);//<=======================
        };
        
        var getPerMonthRevenue = function () {
            var data = "action=getPerMonthRevenue";
            var success = function (back) {
                var json = jsonParse_M(back);
                var sbtb = new StringBuilder_M();
                var sbtr = new StringBuilder_M();
                var sbTB = new StringBuilder_M();
                var sbTH = new StringBuilder_M();
                var tdClass = undefined;
                var tdClass1 = "class='textAlignCenter border1Gray'";
                var tdClass2 = "class='textAlignCenter border1Gray colorBlue'";
                var tdClass3 = "class='textAlignCenter border1Gray colorRed'";

                var tempMonthRevenue = undefined;
                var arrNum = undefined;
                //make THead
                makeThTag_M(sbTH, "年度", "class='textAlignCenter border1Gray'");
                $.each(json[0].mreList, function (i, v) {
                    makeThTag_M(sbTH, v.Month, "class='textAlignCenter border1Gray'");
                }); 
                makeTrTag_M(sbtr, sbTH.toString(), "class='bgBlue'");
                append_M("#pmrdTH", sbtr.toString());
                
                //make Tbody
                sbtr = new StringBuilder_M();
                $.each(json, function (i, v) {
                    makeTdTag_M(sbtb, v.MCcomName, "class='textAlignCenter bgGray'");
                    $.each(v.mreList, function (ii, vv) {
                        tempMonthRevenue = (parseInt(vv.MonthRevenue) / 10000).toFixed(2);
                        if (v.MCcomName == "總業績") {
                            makeTdTag_M(sbtb, tempMonthRevenue, tdClass2);
                        } else if (v.MCcomName == "YOY") {
                            if (tempMonthRevenue <= 0) {
                                makeTdTag_M(sbtb, tempMonthRevenue, tdClass3);
                            } else {
                                makeTdTag_M(sbtb, tempMonthRevenue, tdClass1);
                            }
                           
                        }else {
                            makeTdTag_M(sbtb, tempMonthRevenue, tdClass1);
                    }
                    });
                    makeTrTag_M(sbtr, sbtb.toString(), "");
                    sbTB.append(sbtr.toString());
                    sbtb = new StringBuilder_M();
                    sbtr = new StringBuilder_M();
                });
                append_M("#pmrdTB", sbTB.toString());
               
            };
            var error = function (e) { Log_M("getPerMonthRevenue error=" + e); unBlockUI_M(); };
            ajax_M(reportHandlerMNO01Url_G, data, success, error);//<=======================
        };
        var openPerMonthRevenueDialog = function(){
            $('#perMonthRevenueDialog').dialog("open");
        };
        var openAnalystCPvalueDialog = function(){
            $('#AnalystCPvalueDialog').dialog("open");
        };
        var getDepRevenue = function(){
            var data = "action=getDepRevenue";
            var success = function (back) {
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                Log_M("getDepRevenue back="+back);
                $.each(json,function(i,v){
                    sb.append("<div style='float: Left; width: 50%;height:520px;' class='tabDivMargin3 divBorder'>");
                    sb.append("<div class='titleBottomBorder marginLeftRight10'>");
                    sb.append("<h3><span>");sb.append(v.ComIDname);sb.append("</span></h3>");
                        sb.append("</div>");
                        sb.append("<div style='height:350px;' class='marginLeftRight15'>");
                        sb.append("<table class='table marginTop10'>");
                            sb.append("<tr>");
                                sb.append("<th class='textAlignCenter deptTabTH'>分析師</th>");
                                sb.append("<th class='textAlignCenter deptTabTH'>月業績</th>");
                                sb.append("<th class='textAlignCenter deptTabTH'>成本</th>");
                                sb.append("<th class='textAlignCenter deptTabTH'>call訊</th>");
                                sb.append("<th class='textAlignCenter deptTabTH'>留倉</th>");
                                sb.append("<th class='textAlignCenter deptTabTH'>傳真</th>");
                                sb.append("<th class='textAlignCenter deptTabTH'>電話</th>");
                            sb.append("</tr>");
                            sb.append("<tbody>");
                            $.each(v.mreList,function(ii,vv){
                                sb.append("<tr>");
                                sb.append("<td class='textAlignCenter border1Gray'>");
                                    sb.append(vv.MPname);
                                    sb.append("</td>");
                                    sb.append("<td class='textAlignCenter border1Gray'><B class='colorBlue'>");
                                    sb.append((parseInt(vv.Revenue) / 10000).toFixed(2));
                                    sb.append("</B> 萬</td>");
                                    sb.append("<td class='textAlignCenter border1Gray'>");
                                    sb.append((parseInt(vv.Cost) / 10000).toFixed(2));
                                    sb.append(" 萬</td>");
                                    sb.append("<td class='textAlignCenter border1Gray'><a href='#' MP='");
                                    sb.append(vv.MP);
                                    sb.append("'>細</td>");
                                    sb.append("<td class='textAlignCenter border1Gray'><a href='#' MP='");
                                    sb.append(vv.MP);
                                    sb.append("'>細</td>");
                                    sb.append("<td class='textAlignCenter border1Gray'><a href='#' MP='");
                                    sb.append(vv.MP);
                                    sb.append("'>細</td>");
                                    sb.append("<td class='textAlignCenter border1Gray'><a href='#' MP='");
                                    sb.append(vv.MP);
                                    sb.append("'>細</td>");
                                sb.append("</tr>");
                            });
                                sb.append("<tr>");
                                sb.append("<td  colspan='7' class='textAlignCenter border1Gray'><button class='btn btn-default getRevenueAimRateDetail' ComID='");
                                sb.append(v.ComID);
                                sb.append("'>單位人員達成率明細表</button></td>");
                                sb.append("</tr>");
                            sb.append("</tbody>");
                        sb.append("</tbody>");
                   sb.append("</table>");
                   sb.append("</div>");
                   sb.append("<div class='titleTopBorder marginLeftRight10'>");
                        sb.append("<table class='table marginTop10'>");
                            sb.append("<tr>");
                            sb.append("<td class='textAlignLeft'><B>本日業績</B>&nbsp;:&nbsp;&nbsp;<B class='colorBlue'>");sb.append((parseInt(v.dayRevenue) / 10000).toFixed(2));sb.append("</B>&nbsp;萬</td>");
                            sb.append("<td class='textAlignLeft'><B>節目成本</B>&nbsp;:&nbsp;&nbsp;<B class='colorBlue'>");sb.append((parseInt(v.monthCost) / 10000).toFixed(2));sb.append("</B>&nbsp;萬</td>");
                            sb.append("<td class='textAlignLeft'><B>業績目標</B>&nbsp;:&nbsp;&nbsp;<B class='colorBlue'>");sb.append((parseInt(v.RevenueAim) / 10000).toFixed(2));sb.append("</B>&nbsp;萬</td>");
                            sb.append("</tr>");
                            sb.append("<tr>");
                            sb.append("<td class='textAlignLeft'><B>本月業績</B>&nbsp;:&nbsp;&nbsp;<B class='colorBlue'>");sb.append((parseInt(v.monthRevenue) / 10000).toFixed(2));sb.append("</B>&nbsp;萬</td>");
                                sb.append("<td class='textAlignLeft'><B></B></td>");
                                sb.append("<td class='textAlignLeft'><B>達成率</B>&nbsp;:&nbsp;&nbsp;<B class='colorBlue'>");sb.append(v.RevenueAimRate);sb.append("</B>&nbsp;%</td>");
                            sb.append("</tr>");
                       sb.append("</table>");
                       sb.append("</div>");
                       sb.append("</div>");
                });

                append_M("#depPerformance",sb.toString());
                onClick_M(".getRevenueAimRateDetail", getRevenueAimRateDetail);
            };
            var error = function (e) { Log_M("getDepRevenue error=" + e); unBlockUI_M(); };
            ajax_M(reportHandlerMNO01Url_G, data, success, error);//<=======================
        };

        var getRevenueAimRateDetail = function(){
            var ComID = attr_M(this,"ComID");
            Log_M("ComID="+ComID);
            var data = "action=getRevenueAimRateDetail&ComID=" + ComID;
            var success = function (back) {
                Log_M("getRevenueAimRateDetail back="+back);
            };
            var error = function (e) { Log_M("getRevenueAimRateDetail error=" + e); unBlockUI_M(); };
            ajax_M(reportHandlerMNO01Url_G, data, success, error);//<=======================
        };
       

        $(function () {
            getDepRevenue();
            $('#perMonthRevenueDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 1200,
                height: 500,
            });
            $('#AnalystCPvalueDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 1200,
                height: 500,
            });
            $('#RevenueAimRateDetailDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 1200,
                height: 500,
            });
            onClick_M(".getMonth", getMonth);
            getTodayPerformance();
            getMonth("本月");
            getPerMonthRevenue();
            onClick_M("#perMonthRevenue", openPerMonthRevenueDialog);
            onClick_M("#AnalystCPvalue", openAnalystCPvalueDialog);
            

        })
    </script>
</asp:Content>

