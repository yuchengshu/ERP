<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MMTEL01.aspx.cs" Inherits="wealthManage_report_MREPO_MMTEL01_MMTEL01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .borderTopBlack {
            border-top:1px solid black;
        }
        .borderBottomBlack {
            border-bottom:1px solid black;
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
                            <h1 class="box-title"><b>ERP &gt;  報表區 &gt;電話統計表</b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-hover" id="TAB">
                            <thead id="">
                                <tr class="active">
                                    <th class="width20percent">
                                        <label>日期年:</label>
                                        <select id="MR_DateY" class="form-control">
                                 
                                            <option value="2011">2011</option>
                                            <option value="2012">2012</option>
                                            <option value="2013">2013</option>
                                            <option value="2014">2014</option>
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
                                            <option value="2019">2019</option>
                                            <option value="2020">2020</option>
                                            <option value="2021">2021</option>
                                        </select>
                                    </th>
                                    <th class="width20percent">
                                        <label>日期月:</label>
                                        <select id="MR_DateM" class="form-control">
                                 
                                            <option value="1">01</option>
                                            <option value="2">02</option>
                                            <option value="3">03</option>
                                            <option value="4">04</option>
                                            <option value="5">05</option>
                                            <option value="6">06</option>
                                            <option value="7">07</option>
                                            <option value="8">08</option>
                                            <option value="9">09</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                        </select>
                                    </th>
                                    <th class="width20percent">
                                        <label>分析師:</label>
                                        <select id="MP" class="form-control">
           
                                        </select>
                                    </th>
                                     <th class="width20percent">
                                        <button type="button" class="btn btn-info btn-flat qPer" id="search">查詢</button>
                                         <button type="button" class="btn btn-info btn-flat" id="print">列印</button>
                                    </th>
                                </tr>
                            </thead>
                        </table>
                        <div id="printArea" class=" startHide"  style="width:1300px;height:490px;overflow:auto ;">
                            <p><span>統計日期</span>:<span class="printYear"></span>年<span></span><span class="printMonth"></span>月</p>
                            <table class=" table-hover marginTop10 ex1" id="tab">
                                <thead id="ReportTh"">
                                   
                                </thead>
                                <tbody id="ReportTb">

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
        var reportHandlerMMTEL01Url_G = "reportHandlerMMTEL01.ashx";
        var MR_DateY_G = undefined;
        var MR_DateM_G = undefined;
        var titleJson = undefined;

        var getAnalyst = function () {
            empty_M("#ReportTh");
            MR_DateY_G = val_M("#MR_DateY");
            MR_DateM_G = val_M("#MR_DateM");
            var sbTh = new StringBuilder_M();
            text_M(".printYear", MR_DateY_G);
            text_M(".printMonth", MR_DateM_G);
            var data = "MP=" + val_M("#MP") + "&U_Num=" + U_Num_M + "&U_MDEP=" + U_MDEP_M + "&ComID=" + ComID_M + "&action=getAnalyst";
            var success = function (back) {
                //Log_M(" back=" + back);
                var json = jsonParse_M(back);
                var sbTh = new StringBuilder_M();
                sbTh.append("<tr class='bgGray'>");
                sbTh.append("<th class='textAlignCenter' style='width:70px;'>");
                sbTh.append("分析師");
                sbTh.append("</th>");
                $.each(json, function (i, v) {
                    if (v.U_Name != "合計") {
                        sbTh.append("<th class='textAlignCenter' colspan='36'>");
                    }
                    else{
                        sbTh.append("<th class='textAlignCenter' colspan='108' rowspan='2'>");
                    }
                    
                    sbTh.append(v.U_Name);
                    sbTh.append("</th>");
                    
                });
                sbTh.append("</tr>");
                append_M("#ReportTh", sbTh.toString());
                getProgram();
                
            };
            var error = function (e) { Log_M("getAnalyst error=" + e); unBlockUI_M(); };

            ajax_M(reportHandlerMMTEL01Url_G, data, success, error);
        };

        var getProgram = function () {
            MR_DateY_G = val_M("#MR_DateY");
            MR_DateM_G = val_M("#MR_DateM");
            text_M(".printYear", MR_DateY_G);
            text_M(".printMonth", MR_DateM_G);
            var data = "MR_DateY=" + MR_DateY_G + "&MR_DateM=" + MR_DateM_G + "&MP=" + val_M("#MP") + "&U_Num=" + U_Num_M + "&U_MDEP=" + U_MDEP_M + "&ComID=" + ComID_M + "&action=getProgram";
            var success = function (back) {
                //Log_M("getProgram back=" + back);
                var json = jsonParse_M(back);
                titleJson = json;
                var sbTh = new StringBuilder_M();
                sbTh.append("<tr class='bgGray'>");
                sbTh.append("<th class='textAlignCenter'>");
                sbTh.append("節目");
                sbTh.append("</th>");
                var num = "";
                var colspanCount = 36;
                $.each(json, function (i, v) {
                    if (num != v.U_Num) {
                        colspanCount = 36;
                        if (v.peList.length != 0)
                        {
                            colspanCount = colspanCount / v.peList.length;
                        }
                        
                        num = v.U_Num;
                    }
                    if (v.U_Name != "合計") {
                        if (v.peList.length != 0) {
                            $.each(v.peList, function (ii, vv) {

                                sbTh.append("<th class='textAlignCenter' colspan='");
                                sbTh.append(colspanCount);
                                sbTh.append("'>");

                                sbTh.append(vv.P_Channel);
                                sbTh.append("<br>");
                                sbTh.append(vv.P_Time);
                                sbTh.append("</th>");
                            });
                        } else {
                            sbTh.append("<th class='textAlignCenter' colspan='");
                            sbTh.append(colspanCount);
                            sbTh.append("'>無");


                            sbTh.append("</th>");
                        }
                    } 
                    
                    
                });
                sbTh.append("</tr>");
                append_M("#ReportTh", sbTh.toString());
                getDateTitle();
               
               
            };
            var error = function (e) { Log_M("getProgram error=" + e); unBlockUI_M(); };

            ajax_M(reportHandlerMMTEL01Url_G, data, success, error);
        };
        var getDateTitle = function () {
            
            var sbTh = new StringBuilder_M();
            sbTh.append("<tr class='bgGray'>");
            sbTh.append("<th class='textAlignCenter'>");
            sbTh.append("日期");
            sbTh.append("</th>");
            var num = "";
            var colspanCount = 36;
            $.each(titleJson, function (i, v) {
                if (num != v.U_Num) {
                    colspanCount = 36;
                    if (v.peList.length != 0) {
                       
                        colspanCount = colspanCount / v.peList.length / 3;
                       
                    }
                    num = v.U_Num;
                }
                
                if (v.U_Name != "合計") {
                    if (v.peList.length != 0) {
                        $.each(v.peList, function (ii, vv) {
                            sbTh.append("<th class='textAlignCenter' colspan='");
                            sbTh.append(colspanCount);
                            sbTh.append("'>可</th>");
                            sbTh.append("<th class='textAlignCenter' colspan='");
                            sbTh.append(colspanCount);
                            sbTh.append("'>不</th>");
                            sbTh.append("<th class='textAlignCenter' colspan='");
                            sbTh.append(colspanCount);
                            sbTh.append("'>合</th>");
                        });
                    } else {
                        sbTh.append("<th class='textAlignCenter' colspan='");
                        sbTh.append(colspanCount);
                        sbTh.append("'></th>");
                    }
                } else {
                    colspanCount == 36;
                    sbTh.append("<th class='textAlignCenter' colspan='");
                    sbTh.append(colspanCount);
                    sbTh.append("'>可</th>");
                    sbTh.append("<th class='textAlignCenter' colspan='");
                    sbTh.append(colspanCount);
                    sbTh.append("'>不</th>");
                    sbTh.append("<th class='textAlignCenter' colspan='");
                    sbTh.append(colspanCount);
                    sbTh.append("'>合</th>");
                }

                

            });
            sbTh.append("</tr>");
            append_M("#ReportTh", sbTh.toString());
            getTotalTelStatistics();
            
        };
        var getTotalTelStatistics = function () {
            empty_M("#ReportTb");
            MR_DateY_G = val_M("#MR_DateY");
            MR_DateM_G = val_M("#MR_DateM");
            text_M(".printYear", MR_DateY_G);
            text_M(".printMonth", MR_DateM_G);
            var data = "MR_DateY=" + MR_DateY_G + "&MR_DateM=" + MR_DateM_G + "&MP=" + val_M("#MP") + "&U_Num=" + U_Num_M + "&U_MDEP=" + U_MDEP_M + "&ComID=" + ComID_M + "&action=getTotalTelStatistics";
            var success = function (back) {
                Log_M("getTotalTelStatistics back=" + back);
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                var num = "";
                var colspanCount = 36;
                $.each(json, function (i, v) {
                    if (v.day == "周可key率") {
                        sb.append("<tr class='bgGray borderBottomBlack'>");
                    } else if (v.day == "周小計") {
                        sb.append("<tr class='bgGray borderTopBlack'>");
                    } else {
                        sb.append("<tr>");
                    }
                    
                    sb.append("<td  class='textAlignCenter'>");
                    sb.append(v.day);
                    sb.append(v.DayOfWeek);
                    sb.append("</td>");
                    if (v.day.indexOf("可") == -1) {//非週可KEY率表格製作
                        $.each(v.tseList, function (ii, vv) {
                            if (num != vv.U_Num) {
                                colspanCount = 36;
                                if (vv.peList.length != 0) {
                                    colspanCount = colspanCount / vv.peList.length / 3;
                                }
                                num = vv.U_Num;
                            }
                            if (vv.peList.length != 0) {
                                $.each(vv.peList, function (iii, vvv) {
                                    if (vvv.P_Channel == "合計") {
                                        colspanCount = 36;
                                    }
                                    if (vvv.MT_Okey != "0") {
                                        sb.append("<td class='textAlignCenter colorBlue' colspan='");
                                    } else {
                                        sb.append("<td class='textAlignCenter' colspan='");
                                    }

                                    sb.append(colspanCount);
                                    sb.append("'>");
                                    sb.append(vvv.MT_Okey);
                                    sb.append("</td>");
                                    if (vvv.MT_Nkey != "0") {
                                        sb.append("<td class='textAlignCenter colorBlue' colspan='");
                                    } else {
                                        sb.append("<td class='textAlignCenter' colspan='");
                                    }
                                    sb.append(colspanCount);
                                    sb.append("'>");
                                    sb.append(vvv.MT_Nkey);
                                    sb.append("</td>");
                                    if (vvv.MT_Tkey != "0") {
                                        if (v.day == "周可key率") {
                                            sb.append("<td class='textAlignCenter colorBlue' colspan='");
                                        } else if (v.day == "周小計") {
                                            sb.append("<td class='textAlignCenter colorBlue' colspan='");
                                        } else {
                                            sb.append("<td class='textAlignCenter colorBlue bgGrayf4f4f4' colspan='");
                                        }
                                        
                                    } else {
                                        if (v.day == "周可key率") {
                                            sb.append("<td class='textAlignCenter ' colspan='");
                                        } else if (v.day == "周小計") {
                                            sb.append("<td class='textAlignCenter ' colspan='");
                                        } else {
                                            sb.append("<td class='textAlignCenter bgGrayf4f4f4' colspan='");
                                        }
                                        
                                    }
                                    sb.append(colspanCount);
                                    sb.append("'>");
                                    sb.append(vvv.MT_Tkey);
                                    sb.append("</td>");

                                });
                            } else {
                                sb.append("<td class='textAlignCenter' colspan='");
                                sb.append(colspanCount);
                                sb.append("'></td>");
                            }

                        });
                        
                    } else {//週可KEY率表格製作
                        $.each(v.tseList, function (ii, vv) {
                            if (num != vv.U_Num) {
                                colspanCount = 36;
                                if (vv.peList.length != 0) {
                                    colspanCount = colspanCount / vv.peList.length / 3;
                                }
                                num = vv.U_Num;
                            }
                            if (vv.peList.length != 0) {
                                $.each(vv.peList, function (iii, vvv) {
                                    if (vvv.P_Channel == "合計") {
                                        colspanCount = 108;

                                    } else {
                                        colspanCount = 36 / vv.peList.length;
                                        
                                    }
                                    if (vvv.MT_Tkey != "0") {
                                        sb.append("<td class='textAlignCenter colorBlue' colspan='");
                                        sb.append(colspanCount);
                                        sb.append("'>");
                                        sb.append(Math.round((parseInt(vvv.MT_Okey) / parseInt(vvv.MT_Tkey)) * 100));
                                        sb.append("%</td>");
                                    } else {
                                        sb.append("<td class='textAlignCenter' colspan='");
                                        sb.append(colspanCount);
                                        sb.append("'>");
                                        sb.append("0%</td>");
                                    }
                                });
                            } else {
                                sb.append("<td class='textAlignCenter' colspan='");
                                sb.append(colspanCount);
                                sb.append("'></td>");
                            }
                        });
                    }
                    sb.append("</tr>");
                });
                
                append_M("#ReportTb", sb.toString());
       
                show_M("#printArea");
                
            };
            var error = function (e) { Log_M("getTelStatistics error=" + e); unBlockUI_M(); };

            ajax_M(reportHandlerMMTEL01Url_G, data, success, error);
        };
       
        $(function () {
            $Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "#MP", emptyValue_M, "option", emptyValue_M);
            onClick_M("#print", printScreen_M);
            onClick_M("#search", getAnalyst);
        })
    </script>
</asp:Content>

