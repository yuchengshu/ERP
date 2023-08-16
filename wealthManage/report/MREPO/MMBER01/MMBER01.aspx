<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MMBER01.aspx.cs" Inherits="wealthManage_report_MREPO_MMBER01_MMBER01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <style>

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
                            <h1 class="box-title"><b>ERP &gt; 報表區 &gt; 員工基本資料狀況表 </b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-hover" id="">
                            <thead id="">
                                <tr class="active">
                                    <th>
                                        <span class="inputSearch2">
                                            <label>起始日:</label>
                                            <input type="text" id="StartDate" class="datepicker form-control " placeholder="開始日">
                                        </span>
                                        <span class="inputSearch2">
                                            <label>結束日:</label>
                                        <input type="text" id="EndDate" class="datepicker form-control " placeholder="結束日">
                                        </span>
                                        <span class="inputSearch2">
                                            <label>搜尋類別:</label>
                                        <select id="dateType" class="form-control">
                                            <option value="1">到職日</option>
                                            <option value="2">離職日</option>
                                            <option value="3">出生日</option>
                                        </select>
                                        </span>
                                        <span class="inputSearch2">
                                           <label>在職/離職:</label>
                                        <select id="inoutService" class="form-control">
                                            <option value="">不限</option>
                                            <option value="inService">在職</option>
                                            <option value="outService">離職</option>
                                        </select>
                                        </span>
                                        <span class="inputSearchWidth55">
                                             <button type="button" class="btn btn-info btn-flat qPer" id="search">查詢</button>
                                        </span>
                                        <span class="inputSearchWidth55">
                                            <button type="button" class="btn btn-info btn-flat qPer" id="print">列印</button>
                                        </span>
                                        <span class="inputSearchWidth55">
                                            <button type="button" class="btn btn-info btn-flat qPer" id="excel"  onclick="javascrīpt: exportExcel()">excel</button>
                                        </span>
                                    </th>
                                    <!--<th class="width20percent">
                                        <label>起始日:</label>
                                        <input type="text" id="StartDate" class="datepicker form-control " placeholder="開始日">
                                    </th>
                                    <th class="width20percent">
                                        <label>結束日:</label>
                                        <input type="text" id="EndDate" class="datepicker form-control " placeholder="結束日">
                                    </th>
                                    <th class="width20percent">
                                        <label>搜尋類別:</label>
                                        <select id="dateType" class="form-control">
                                            <option value="1">到職日</option>
                                            <option value="2">離職日</option>
                                            <option value="3">出生日</option>
                                        </select>
                                    </th>
                                    <th class="width20percent">
                                        <label>在職/離職:</label>
                                        <select id="inoutService" class="form-control">
                                            <option value="">不限</option>
                                            <option value="inService">在職</option>
                                            <option value="outService">離職</option>
                                        </select>
                                    </th>
                                    <th class="width20percent">
                                        <label>員工姓名:</label>
                                        <input id="empName" class="form-control"/>
                                    </th>
                                    <th class="width20percent">
                                        <span class="input-group-btn marginLeft">
                                            <button type="button" class="btn btn-info btn-flat qPer" id="search">查詢</button>
                                        </span>
                                    </th>
                                    <th class="width20percent">
                                         <span class="input-group-btn marginLeft">
                                            <button type="button" class="btn btn-info btn-flat qPer" id="print">列印</button>
                                        </span>
                                    </th>
                                    <th class="width20percent">
                                         <span class="input-group-btn marginLeft">
                                            <button type="button" class="btn btn-info btn-flat qPer" id="excel"  onclick="javascrīpt: exportExcel()">excel</button>
                                        </span>
                                    </th>-->
          
                                </tr>
                            </thead>
                        </table>
                            <div class="box-body" id="exportExcel">
                            <div id="printArea">
                            <table class="table table-hover marginTop10" id="mcTable">
                                <thead id="">
                                    <tr class="bgGray">
                                        <th class="textAlignCenter" style="width:1%">序</th>
                                        <th class="textAlignCenter" style="width:6%">姓名</th>
                                        <th class="textAlignCenter" style="width:6%">部門別</th>
                                        <th class="textAlignCenter" style="width:6%">員工編號</th>
                                        <th class="textAlignCenter" style="width:6%">生日</th>
                                        <th class="textAlignCenter" style="width:6%">到職日期</th>
                                        <th class="textAlignCenter" style="width:6%">離職日期</th>
                                        <th class="textAlignCenter" style="width:7%">身分證字號</th>
                                        <th class="textAlignCenter" style="width:11%">戶籍地址</th>
                                        <th class="textAlignCenter" style="width:11%">住家地址</th>
                                        <th class="textAlignCenter" style="width:7%">住家電話</th>
                                        <th class="textAlignCenter" style="width:5%">手機</th>
                                        <th class="textAlignCenter" style="width:7%">緊急聯絡人</th>
                                        <th class="textAlignCenter" style="width:9%">緊急聯絡人電話</th>
                                    </tr>
                                </thead>
                                <tbody id="mcReportTb">

                                </tbody>
                        </table>
                        </div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        var MMBER01reportHandlerUrl_G = "reportHandlerMMBER01.ashx";
        function exportExcel() {
            var html = '&lt;meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8" />&lt;title>Excel&lt;/title>';
            html += '';
            html += document.getElementById('exportExcel').outerHTML + '';
            window.open('data:application/vnd.ms-excel,' + encodeURIComponent(html));
        }
        var getEmpData = function (startDate, endDate, dateType, inoutService, empName) {
            var data = "StartDate=" + startDate + "&EndDate=" + endDate + "&dateType=" + dateType + "&inoutService=" + inoutService + "&empName=" + empName + "&action=getEmpData";
            var success = function (back) {
                empty_M("#mcReportTb");
                Log_M("back=" + back);
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                $.each(json, function (i, v) {
                    sb.append("<tr>");
                    if (v.U_Name != "total") {
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(i + 1);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.U_Name);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.U_MDEPname);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.U_Num);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.BirthDayDate);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.SlimDate);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.LeaveDate);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.U_PID);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.OCity);
                        sb.append(v.OTown);
                        sb.append(v.OZipCode);
                        sb.append("<br/>");
                        sb.append(v.OAddress);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.HCity);
                        sb.append(v.HTown);
                        sb.append(v.HZipCode);
                        sb.append("<br/>");
                        sb.append(v.HAddress);
                        sb.append("</td>");

                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.HTel_Zone);
                        sb.append("-");
                        sb.append(v.HTel);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.HMobile);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.EName);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.EMobile);
                        sb.append("</td>");
                    } else{
                        sb.append("<td class='textAlignCenter bgGray' colspan='14'>筆數:");
                        sb.append(json.length-1);
                        sb.append("</td>");
                    }
                    
                    sb.append("</tr>")
                });
                append_M("#mcReportTb", sb.toString());
            };
            var error = function (e) { Log_M("getEmpData error=" + e); unBlockUI_M(); };
            ajax_M(MMBER01reportHandlerUrl_G, data, success, error);
        };
        var getEmpDataTab = function () {

            var startDate = val_M("#StartDate");
            var endDate = val_M("#EndDate");
            var dateType = val_M("#dateType");
            var inoutService = val_M("#inoutService");
            var empName = val_M("#empName");
            var checkCount = 0;
            if (!isEmptyStr(empName)) {
                checkCount += 1;
            }
            if (!isEmptyStr(inoutService)) {
                checkCount += 1;
            }
            if (!isEmptyStr(startDate) && !isEmptyStr(endDate)) {
                checkCount += 4;
            }
            if (checkCount > 0) {
                if (checkCount > 3) {
                    //確定起始日跟結束日沒有寫反
                    var doNext = check_M.isEndDateBigThanStartDate(startDate, endDate);
                    if (doNext) {
                        getEmpData(startDate, endDate, dateType, inoutService, empName);
                    } else {
                        alert("請正確選擇日期區間");
                    }
                } else {
                    getEmpData(startDate, endDate, dateType, inoutService, empName);
                }
            } else {
                alert("請擇一選擇員工姓名或在職離職或日期搜尋條件");
            }
            
        };
      
        $(function () {
            onClick_M("#search", getEmpDataTab);
            onClick_M("#print", printScreen_M);
        })
    </script>
</asp:Content>

