<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MCMEB10.aspx.cs" Inherits="wealthManage_report_MREPO_MCMEB10_MCMEB10" %>

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
                            <h1 class="box-title"><b>ERP &gt; 報表區 &gt; 委任正本歸檔報表 </b> </h1>
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
                                    <th class="">
                                        <label>歸檔狀況:</label>
                                        <select id="Q_back" class="form-control">
                                            <option value="">不限</option>
                                            <option value="1">已歸檔</option>
                                            <option value="0" selected>未歸檔</option>
                                        </select>
                                    </th>
                                    <th class="">
                                        <label>案件歸檔狀態:</label>
                                        <select id="Q_back_intag" class="form-control">
                                            <option value="">不限</option>
                                            <option value="1">需歸檔</option>
                                            <option value="0" selected>不需歸檔</option>
                                        </select>
                                    </th>
                                    <th class="">
                                        <label>關鍵字:</label>
                                        <input id="keyword" class="form-control" />
                                    </th>
                                    <th class="width20percent">
                                        <span class="input-group-btn marginLeft">
                                            <button type="button" class="btn btn-info btn-flat qPer" id="search">查詢</button>
                                        </span>
                                    </th>
                                    <th></th>
          
                                </tr>
                            </thead>
                        </table>
                      
                        
                            <table class="table table-hover marginTop10">
                                <thead id="">
                                    <tr class="bgGray">
                                        <th class="textAlignCenter">交易編號</th>
                                        <th class="textAlignCenter">入帳日</th>
                                        <th class="textAlignCenter">客戶姓名</th>
                                        <th class="textAlignCenter">入會種類</th>
                                        <th class="textAlignCenter">金額</th>
                                        <th class="textAlignCenter">業務</th>
                                        <th class="textAlignCenter">狀態</th>
                                        <th class="textAlignCenter">歸檔</th>
                                    </tr>
                                </thead>
                                <tbody id="ReportTb">

                                </tbody>
        
                        </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        var MCMEB10reportHandlerUrl_G = "reportHandlerMCMEB10.ashx";
        

        var getAppointOriginalArchive = function (startDate, endDate) {
            var data = "action=getAppointOriginalArchive&startDate=" + startDate + "&endDate=" + endDate + "&Q_DEP=" + val_M("#Q_DEP") + "&Q_back=" + val_M("#Q_back") + "&Q_back_intag=" + val_M("#Q_back_intag") + "&keyword=" + val_M("#keyword") + "&U_MDEP=" + U_MDEP_M + "&ComID=" + ComID_M;
            var success = function (back) {
                Log_M("back=" + back);
                empty_M("#ReportTb");
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                var count = 0;
                $.each(json, function (i, v) {
                    count += 1;
                    sb.append("<tr>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.T_ID);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.T_AccountDate);
                    sb.append(" (");
                    sb.append(v.differenceT_AccountDateAndNow);
                    sb.append("天)");
                    sb.append("</td>");
                    sb.append("<td class='text-center'>");
                    sb.append("<a class='BlueLink10 qPer' href='/wealthManage/customerManage/MMBER/customerDetail.aspx?M_ID=");
                    sb.append(v.M_ID);
                    sb.append("&MENU_no=");
                    sb.append(CustomerDetailMENUno_M.split('MENU_no=')[1]);
                    sb.append("&ERPcustomerWebPayMENU_no=");
                    sb.append(ERPcustomerWebPayMENUno_M.split('MENU_no=')[1]);
                    sb.append("' target='_blank'>");
                    sb.append(v.M_Name);
                    sb.append("</a></td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.MP_Name);
                    sb.append("-");
                    sb.append(v.T_ItemName);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(getMoneyFormat_M( v.T_PayMoney));
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.MC_Name);
                    sb.append("-");
                    sb.append(v.MC_COMname);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.Back_StatusName);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.Back_tagName);
                    sb.append("</td>");

                    sb.append("</tr>");
                });
                sb.append("<tr>");
                sb.append("<td colspan='8' class='textAlignCenter bgGray'>");
                sb.append("總計: ");
                sb.append(count);
                sb.append(" 筆");
                sb.append("</td>");
                sb.append("</tr>");
                append_M("#ReportTb", sb.toString());
            };
            var error = function (e) { Log_M("getAppointOriginalArchive error=" + e); unBlockUI_M(); };
            ajax_M(MCMEB10reportHandlerUrl_G, data, success, error);
        };
        



        var getAppointOriginalArchiveTab = function () {
            var startDate = val_M("#StartDate");
            var endDate = val_M("#EndDate");

            //確定起始日跟結束日沒有寫反
            var doNext = check_M.isEndDateBigThanStartDate(startDate, endDate);
            if (doNext) {
               
                getAppointOriginalArchive(startDate, endDate);
            }else{
                alert("請正確選擇日期區間");
            }
            
        };
      
        $(function () {
            onClick_M("#search", getAppointOriginalArchiveTab);
        })
    </script>
</asp:Content>

