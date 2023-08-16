<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MCMEB13.aspx.cs" Inherits="wealthManage_report_MREPO_MCMEB13_MCMEB13" %>

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
                            <h1 class="box-title"><b>ERP &gt; 報表區 &gt; 資源分配報表 </b> </h1>
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
                                        <label>部門:</label>
                                        <select id="Q_DEP" class="form-control">
                                            <option value="">不限</option>
                                            <option value="HG01">營運</option>
                                            <option value="HG02">投資</option>
                                            <option value="HG03">財富</option>
                                            <option value="HG04">理財</option>
                                            <option value="HG06">網事</option>
                                        </select>
                                    </th>
                                    <th class="width20percent">
                                        <span class="input-group-btn marginLeft">
                                            <button type="button" class="btn btn-info btn-flat qPer" id="search">查詢</button>
                                        </span>
                                    </th>
                                </tr>
                            </thead>
                        </table>
                      
                       <%-- requestGiftReportTb--%>
                            <table class="table table-hover marginTop10">
                                <thead id="">
                                    <tr class="bgGray">
                                        <th class="textAlignCenter" colspan="3">索取贈送</th>
                                    </tr>
                                    <tr class="bgGray">
                                        <th class="textAlignCenter">序</th>
                                        <th class="textAlignCenter">業務</th>
                                        <th class="textAlignCenter">案件數</th>
                                    </tr>
                                </thead>
                                <tbody id="requestGiftReportTb">

                                </tbody>
                            </table>
                            <%--contactUsReportTb--%>
                            <table class="table table-hover marginTop10">
                                <thead id="">
                                    <tr class="bgGray">
                                        <th class="textAlignCenter" colspan="3">聯絡我們 </th>
                                    </tr>
                                    <tr class="bgGray">
                                        <th class="textAlignCenter">序</th>
                                        <th class="textAlignCenter">業務</th>
                                        <th class="textAlignCenter">案件數</th>
                                    </tr>
                                </thead>
                                <tbody id="contactUsReportTb">

                                </tbody>
                            </table>
                            <%--activeTabReportTb--%>
                            <table class="table table-hover marginTop10">
                                <thead id="">
                                    <tr class="bgGray">
                                        <th class="textAlignCenter" colspan="3">活動表單</th>
                                    </tr>
                                    <tr class="bgGray">
                                        <th class="textAlignCenter">序</th>
                                        <th class="textAlignCenter">業務</th>
                                        <th class="textAlignCenter">案件數</th>
                                    </tr>
                                </thead>
                                <tbody id="activeTabReportTb">

                                </tbody>
                            </table>
                            <%--venueReportTb--%>
                            <table class="table table-hover marginTop10">
                                <thead id="">
                                    <tr class="bgGray">
                                        <th class="textAlignCenter" colspan="3">會場</th>
                                    </tr>
                                    <tr class="bgGray">
                                        <th class="textAlignCenter">序</th>
                                        <th class="textAlignCenter">業務</th>
                                        <th class="textAlignCenter">案件數</th>
                                    </tr>
                                </thead>
                                <tbody id="venueReportTb">

                                </tbody>
                            </table>
                            <%--resourceDistributionDetailTb--%>
                            <div id="resourceDistributionDetailDialog" class="form-control startHide" title="資源分配明細">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class='textAlignCenter'>項次</th>
                                        <th class='textAlignCenter'>報告名稱</th>
                                        <th class='textAlignCenter'>電話</th>
                                        <th class='textAlignCenter'>分配人員</th>
                                        <th class='textAlignCenter'>分配時間</th>
                                    </tr>
                                </thead>
                                <tbody id="resourceDistributionDetailTb">

                                </tbody>
                                
                            </table>
                            <div style="text-align:center" id="pageBarDiv" class="marginTop10">
　                                   <div id="pageBar" style="margin:0 auto;"> </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script src="<%=getRelativePath()%>js/pageList/MCMEB13PageList.js" type="text/javascript"></script>
    <script>
        var MCMEB13reportHandlerUrl_G = "reportHandlerMCMEB13.ashx";
        
        var getResourceDistributionDetail = function () {
            var Result_user = attr_M(this, "Result_user");
            var Q_DEP = attr_M(this, "Q_DEP");
            var startDate = attr_M(this, "startDate");
            var endDate = attr_M(this, "endDate");
            var Result_userName = attr_M(this, "Result_userName");
            var data = "action=getResourceDistributionDetail&startDate=" + startDate + "&endDate=" + endDate + "&Result_user=" + Result_user + "&Q_DEP=" + Q_DEP + "&Result_userName=" + Result_userName;
            var success = function (back) {
                Log_M("back=" + back);
                var json = jsonParse_M(back);
                $MCMEB13PageList.Table.makeTbody("#resourceDistributionDetailTb", json, 10, "#pageBar");
                $('#resourceDistributionDetailDialog').dialog("open");
            };
            var error = function (e) { Log_M("getResourceDistributionDetail error=" + e); unBlockUI_M(); };
            ajax_M(MCMEB13reportHandlerUrl_G, data, success, error);
        };

        var getResourceDistribution = function (startDate, endDate, type) {
            alert('getResourceDistribution!!');
            var Q_DEP = val_M("#Q_DEP");
            var data = "action=getResourceDistribution&startDate=" + startDate + "&endDate=" + endDate + "&Q_DEP=" + Q_DEP + "&type=" + type;
            var success = function (back) {
                Log_M("back=" + back);
                empty_M("#" + type + "ReportTb");
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                var count = 0;
                $.each(json, function (i, v) {
                    sb.append("<tr>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(i+1);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.Result_userName);
                    sb.append("</td>");
                   
                    sb.append("<td class='textAlignCenter'><a href='javascript:void(0)' class='getResourceDistributionDetail' Result_user='");
                    sb.append(v.Result_user);
                    sb.append("' Q_DEP='");
                    sb.append(Q_DEP);
                    sb.append("' startDate='");
                    sb.append(startDate);
                    sb.append("' endDate='");
                    sb.append(endDate);
                    sb.append("' Result_userName='");
                    sb.append(v.Result_userName);
                    sb.append("'>");
                    sb.append(v.ru);
                    sb.append("</td>");
                    sb.append("</tr>");
                });
          
                append_M("#" + type + "ReportTb", sb.toString());
                onClick_M(".getResourceDistributionDetail", getResourceDistributionDetail);
            };
            var error = function (e) { Log_M("getResourceDistribution error=" + e); unBlockUI_M(); };
            ajax_M(MCMEB13reportHandlerUrl_G, data, success, error);
        };
        



        var getResourceDistributionTab = function () {
            var startDate = val_M("#StartDate");
            var endDate = val_M("#EndDate");

            //確定起始日跟結束日沒有寫反
            var doNext = check_M.isEndDateBigThanStartDate(startDate, endDate);
            if (doNext) {
                alert('GetrequestGift')
                getResourceDistribution(startDate, endDate, "requestGift");
                alert('GetrcontactUs')
                getResourceDistribution(startDate, endDate, "contactUs");
                getResourceDistribution(startDate, endDate, "activeTab");
                getResourceDistribution(startDate, endDate, "venue");
            }else{
                alert("請正確選擇日期區間");
            }
            
        };
      
        $(function () {
            $('#resourceDistributionDetailDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 800,
                height: 600,
            });
            onClick_M("#search", getResourceDistributionTab);
        })
    </script>
</asp:Content>


