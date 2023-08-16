<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MCMEB14.aspx.cs" Inherits="wealthManage_report_MREPO_MCMEB14_MCMEB14" %>

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
                            <h1 class="box-title"><b>ERP &gt; 報表區 &gt; 網站IP明細表 </b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-hover" id="">
                            <thead id="">
                                <tr class="active">
                                    <th class="">
                                        <label>起始日:</label>
                                        <input type="text" id="StartDate" class="datepicker form-control " placeholder="開始日">
                                    </th>
                                    <th class="">
                                        <label>結束日:</label>
                                        <input type="text" id="EndDate" class="datepicker form-control " placeholder="結束日">
                                    </th>
                                    <th class="">
                                        <label>列表方式:</label>
                                        <select id="Report_Item" class="form-control">
                                            <option value="1">單元</option>
                                            <option value="2">會員</option>
                                           
                                        </select>
                                    </th>
                                    <th class="">
                                        <label>查詢關鍵字:</label>
                                        <input id="keyWord" class="form-control" disabled="disabled"/>
                                    </th>
                                    <th class="">
                                        <span class="input-group-btn marginLeft">
                                            <button type="button" class="btn btn-info btn-flat qPer" id="search">查詢</button>
                                        </span>
                                    </th>
                                </tr>
                            </thead>
                        </table>
                      
                        
                            <table class="table table-hover marginTop10">
                                <thead id="">
                                    <tr class="bgGray">
                                        <th class="textAlignCenter" colspan="4">網站IP明細表</th>
                                    </tr>
                                    <tr class="bgGray">
                                        <th class="textAlignCenter">序</th>
                                        <th class="textAlignCenter">日期</th>
                                        <th class="textAlignCenter">單元名稱</th>
                                        <th class="textAlignCenter">分析師</th>
                                    </tr>
                                </thead>
                                <tbody id="ReportTb">

                                </tbody>
                            </table>
                            <div id="websiteIPdetailDialog" class="form-control startHide" title="網站IP明細表-會員瀏覽資料">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class='textAlignCenter'>項次</th>
                                        <th class='textAlignCenter'>會員編號</th>
                                        <th class='textAlignCenter'>會員姓名</th>
                                        <th class='textAlignCenter'>電話</th>
                                        <th class='textAlignCenter'>業務人員</th>
                                        <th class='textAlignCenter'>收看時間</th>
                                    </tr>
                                </thead>
                                <tbody id="websiteIPdetailTb">

                                </tbody>
                                
                            </table>
                            <div style="text-align:center" id="pageBarDiv" class="marginTop10">
　                                   <div id="pageBar" style="margin:0 auto;"> </div>
                            </div>
                        </div>
                        <div id="personBrowseHistoryDialog" class="form-control startHide" title="網站IP明細表-個人瀏覽歷史資料">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class='textAlignCenter'>項次</th>
                                        <th class='textAlignCenter'>會員姓名</th>
                                        <th class='textAlignCenter'>單元</th>
                                        <th class='textAlignCenter'>內容</th>
                                        <th class='textAlignCenter'>日期</th>
                                    </tr>
                                </thead>
                                <tbody id="personBrowseHistoryTb">

                                </tbody>
                                
                            </table>
                            <div style="text-align:center" id="pageBarDiv2" class="marginTop10">
　                                   <div id="pageBar2" style="margin:0 auto;"> </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script src="<%=getRelativePath()%>js/pageList/MCMEB14PageList.js" type="text/javascript"></script>
    <script src="<%=getRelativePath()%>js/pageList/MCMEB142PageList.js" type="text/javascript"></script>
    <script>
        var MCMEB14reportHandlerUrl_G = "reportHandlerMCMEB14.ashx";
        var getPersonBrowseData = function () {
            var M_id = attr_M(this, "M_id");
            var data = "action=getPersonBrowseData&M_id=" + M_id;
            var success = function (back) {
                Log_M("back=" + back);
                var json = jsonParse_M(back);
                $MCMEB142PageList.Table.makeTbody("#personBrowseHistoryTb", json, 10, "#pageBar2");
                $('#personBrowseHistoryDialog').dialog("open");
            };
            var error = function (e) { Log_M("getMemberBrowseData error=" + e); unBlockUI_M(); };
            ajax_M(MCMEB14reportHandlerUrl_G, data, success, error);
        };
        var getMemberBrowseData = function () {
            var Detail = attr_M(this, "Detail");
            var data = "action=getMemberBrowseData&Detail=" + Detail;
            var success = function (back) {
                Log_M("back=" + back);
                var json = jsonParse_M(back);
                $MCMEB14PageList.Table.makeTbody("#websiteIPdetailTb", json, 10, "#pageBar", getPersonBrowseData);
                $('#websiteIPdetailDialog').dialog("open");
            };
            var error = function (e) { Log_M("getMemberBrowseData error=" + e); unBlockUI_M(); };
            ajax_M(MCMEB14reportHandlerUrl_G, data, success, error);
        };

        var getWebsiteIPdetail = function (startDate, endDate, Report_Item) {
            var data = "action=getWebsiteIPdetail&startDate=" + startDate + "&endDate=" + endDate + "&Report_Item=" + Report_Item;
            var success = function (back) {
                Log_M("back=" + back);
                empty_M("#ReportTb");
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
     
                $.each(json, function (i, v) {
                    sb.append("<tr>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(i+1);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.StartDate);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'><a href='javascript:void(0)' class='getMemberBrowseData' Detail='");
                    sb.append(v.Detail);
                    sb.append("'>");
                    sb.append(v.Detail);
                    sb.append("</a>");
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.P_idName);
                    sb.append("</td>");
                    sb.append("</tr>");
                });
          
                append_M("#ReportTb", sb.toString());
                onClick_M(".getMemberBrowseData", getMemberBrowseData);
            };
            var error = function (e) { Log_M("getWebsiteIPdetail error=" + e); unBlockUI_M(); };
            ajax_M(MCMEB14reportHandlerUrl_G, data, success, error);
        };

        var getWebsiteIPdetailTab = function () {
            var Report_Item = val_M("#Report_Item");
            if (Report_Item == "1") {
                var startDate = val_M("#StartDate");
                var endDate = val_M("#EndDate");

                //確定起始日跟結束日沒有寫反
                var doNext = check_M.isEndDateBigThanStartDate(startDate, endDate);
                if (doNext) {
                    getWebsiteIPdetail(startDate, endDate, Report_Item);
                } else {
                    alert("請正確選擇日期區間");
                }
            } else {
                alert("功能尚未開放");
            }
            
            
        };
      
        $(function () {
            $('#websiteIPdetailDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 800,
                height: 600,
            });
            $('#personBrowseHistoryDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 800,
                height: 600,
            });
            onClick_M("#search", getWebsiteIPdetailTab);
        })
    </script>
</asp:Content>

