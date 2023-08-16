<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MVMEB08.aspx.cs" Inherits="wealthManage_report_MREPO_MVMEB08_MVMEB08" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        #total {
            font-size: 18px;
        }

        .auto-style1 {
            width: 1%;
            height: 18px;
        }

        .auto-style2 {
            width: 6%;
            height: 18px;
        }

        .auto-style3 {
            width: 9%;
            height: 18px;
        }

        .auto-style4 {
            width: 7%;
            height: 18px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                            <h1 class="box-title"><b>ERP &gt; 報表區 &gt; 預收剩餘金額表 </b></h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-hover" id="">
                                <thead id="">
                                    <tr class="active">
                                        <th>
                                            <span class="inputSearch2">
                                                <label>剩餘金額基準日:</label>
                                                <input type="text" id="Start2Date" class="datepicker form-control" placeholder="開始日">
                                            </span>
                                            <span class="inputSearch2">
                                                <label>交易起始日:</label>
                                                <input type="text" id="StartDate" class="datepicker form-control" placeholder="開始日">
                                            </span>
                                            <span class="inputSearch2">
                                                <label>交易結束日:</label>
                                                <input type="text" id="EndDate" class="datepicker form-control" placeholder="結束日">
                                            </span>
                                            <span class="inputSearch2">
                                                <label>分析師:</label>
                                                <select id="MP" class="form-control MP"></select>
                                            </span>
                                            <span class="inputSearch2">
                                                <label>入會種類:</label>
                                                <select id="M_Item" class="form-control MP">
                                                    <option value="">請選擇</option>
                                                </select>
                                            </span>
                                            <span class="inputSearchWidth55">
                                                <button type="button" class="btn btn-info btn-flat qPer" id="search">查詢</button>
                                            </span>
                                            <span class="inputSearchWidth55">
                                                <button type="button" class="btn btn-info btn-flat" id="print">列印</button>
                                            </span>
                                        </th>
                                        <!--
                                    <th class="width10percent">
                                        <label>剩餘金額基準日:</label>
                                        <input type="text" id="Start2Date" class="datepicker form-control" placeholder="開始日">
                                    </th>
                                    <th class="width10percent">
                                        <label>交易起始日:</label>
                                        <input type="text" id="StartDate" class="datepicker form-control" placeholder="開始日">
                                    </th>
                                    <th class="width10percent">
                                        <label>交易結束日:</label>
                                        <input type="text" id="EndDate" class="datepicker form-control" placeholder="結束日">
                                    </th>
                                    
                                    
                                   
                                    <th class="width10percent">
                                        <label>分析師:</label>
                                        <select id="MP" class="form-control MP"></select>
                                    </th>
                                    <th class="width10percent">
                                        <label>會員總類:</label>
                                        <select id="M_Item" class="form-control MP"><option value="">請選擇</option></select>
                                    </th>
                                    <th class="width5percent">
                                        <span class="">
                                            <button type="button" class="btn btn-info btn-flat qPer" id="search">查詢</button>
                                        </span>
                                    </th>
                                    <th class="width5percent">
                                        <span class="">
                                            <button type="button" class="btn btn-info btn-flat" id="print">列印</button>
                                        </span>
                                    </th>-->

                                    </tr>
                                </thead>
                            </table>

                            <div id="printArea" class=" startHide">
                                <div class='textAlignCenter'>
                                    <h3 class='table table-hover'>會員會期狀態表 </h3>
                                </div>
                                <p><span>日期</span>:<span id="printStartDate"></span><span>-</span><span id="printEndDate"></span></p>
                                <table class="table table-hover marginTop10" style="font-size: 8px;">
                                    <thead id="">
                                        <tr class="bgGray">
                                            <th class="textAlignCenter borderGray" style="width: 1%">序123</th>
                                            <th class="textAlignCenter borderGray" style="width: 6%">會員編號</th>
                                            <th class="textAlignCenter borderGray" style="width: 6%">會員姓名</th>
                                            <th class="textAlignCenter borderGray" style="width: 6%">助理</th>
                                            <th class="textAlignCenter borderGray" style="width: 6%">身分證號</th>
                                            <th class="textAlignCenter borderGray" style="width: 6%">手機</th>
                                            <th class="textAlignCenter borderGray" style="width: 9%">電話</th>
                                            <th class="textAlignCenter borderGray" style="width: 6%">分析師</th>
                                            <th class="textAlignCenter borderGray" style="width: 6%">種類</th>
                                            <th class="textAlignCenter borderGray" style="width: 6%">發票號碼</th>
                                            <th class="textAlignCenter borderGray" style="width: 6%">入帳日期</th>
                                            <th class="textAlignCenter borderGray" style="width: 6%">入會金額</th>
                                            <th class="textAlignCenter borderGray" style="width: 9%">剩餘金額</th>
                                            <th class="textAlignCenter borderGray" style="width: 7%">總天數/剩餘</th>
                                            <th class="textAlignCenter borderGray" style="width: 7%">會期開始</th>
                                            <th class="textAlignCenter borderGray" style="width: 9%">會期結束</th>
                                        </tr>
                                    </thead>
                                    <tbody id="printmcReportTb">
                                    </tbody>

                                </table>
                            </div>
                            <table class="table table-hover marginTop10" style="font-size: 8px;">
                                <thead id="">
                                    <tr class="bgGray">
                                        <th class="auto-style1">序</th>
                                        <th class="auto-style2">會員編號</th>
                                        <th class="auto-style2">會員姓名</th>
                                        <th class="auto-style2">助理</th>
                                        <%--<th class="auto-style2">身分證號</th>
                                        <th class="auto-style2">手機</th>
                                        <th class="auto-style3">電話</th>--%>
                                        <th class="auto-style2">分析師</th>
                                        <th class="auto-style2">種類</th>
                                        <th class="auto-style2">發票號碼</th>
                                        <th class="auto-style2">入帳日期</th>
                                        <th class="auto-style2">入會金額</th>
                                        <th class="auto-style3">剩餘金額</th>
                                        <th class="auto-style4">總天數/剩餘</th>
                                        <th class="auto-style4">會期開始</th>
                                        <th class="auto-style3">會期結束</th>
                                    </tr>
                                </thead>
                                <tbody id="mcReportTb">
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        var MVMEB08reportHandlerUrl_G = "reportHandlerMVMEB08.ashx";
        var afterSuccessFuc = function () {
            onChange_M("#MP", function () {
                var MP_Type = val_M("#MP");//選到的分析師
                alert(MP_Type)
                $Common.MITEM.getMVMEB08ListHtmlTagOption(CommonHandlerUrl_M, "#M_Item","getMVMEB08List", MP_Type, "option");
            });
        };
        var getAdvancesRemainingMoney = function (start2Date, startDate, endDate, mp, M_Item) {
            var data = "start2Date=" + start2Date + "&startDate=" + startDate + "&endDate=" + endDate + "&MP=" + mp + "&M_Item=" + M_Item + "&action=getAdvancesRemainingMoney";
            var success = function (back) {//20221121顯示畫面執行這邊!!!

                Log_M("back=" + back);

                empty_M("#mcReportTb");
                var json = jsonParse_M(back);
                var sb = new string_M.StringBuilder();
                var sbPrint = new string_M.StringBuilder();
                text_M("#printStartDate", startDate);
                text_M("#printEndDate", endDate);
                $.each(json, function (i, v) {
                    sb.append("<tr>");
                   //序
                    sb.append("<td class='text-center'>");
                    sb.append(i+1);
                    sb.append("</td>");
                    //會員編號
                    sb.append("<td class='text-center'>");
                    sb.append(v.M_Num);
                    sb.append("</td>");
                    //會員姓名
                    sb.append("<td class='text-center'>");
                    sb.append(v.M_Name);
                    sb.append("</td>");
                    //助理
                    sb.append("<td class='text-center'>");
                    sb.append(v.MC_Name);
                    sb.append("</td>");
                    //分析師
                    sb.append("<td class='text-center'>");
                    sb.append(v.MP_Name);
                    sb.append("</td>");
                    //種類
                    sb.append("<td class='text-center'>");
                    sb.append(v.mitem);
                    sb.append("</td>");
                    //發票號碼
                    sb.append("<td class='text-center'>");
                    sb.append("");
                    sb.append("</td>");
                    //入帳日期
                    sb.append("<td class='text-center'>");
                    sb.append(v.T_AccountDate);
                    sb.append("</td>");
                    //入會金額
                    sb.append("<td class='text-center'>");
                    sb.append(v.T_PayMoney);
                    sb.append("</td>");
                    //剩餘金額
                    sb.append("<td class='text-center'>");
                    sb.append(v.RemainingMoney);
                    sb.append("</td>");
                    //總天數/剩餘//使用
                    sb.append("<td class='text-center'>");
                    sb.append(v.Tdate);
                    sb.append("/")
                    sb.append(v.Ldate);
                    sb.append("/")
                    sb.append(v.Sdate);
                    sb.append("</td>");
                    //會期開始
                    sb.append("<td class='text-center'>");
                    sb.append(v.T_StartDate);
                    sb.append("</td>");
                    //會期結束
                    sb.append("<td class='text-center'>");
                    sb.append(v.T_EndDate);
                    sb.append("</td>");



                    sb.append("</tr>")

                });

            append_M("#mcReportTb", sb.toString());

        };
        var error = function (e) { Log_M("getAdvancesRemainingMoney error=" + e); unBlockUI_M(); };
        ajax_M(MVMEB08reportHandlerUrl_G, data, success, error);
        };


        var getAdvancesRemainingMoneyTab = function () {
            var Start2Date = val_M("#Start2Date");
            var startDate = val_M("#StartDate");
            var endDate = val_M("#EndDate");
            var mp = val_M("#MP");
            var M_Item = val_M("#M_Item");//會員種類
            if (!isEmptyStr(Start2Date)) {
                //確定起始日跟結束日沒有寫反
                var doNext = check_M.isEndDateBigThanStartDate(startDate, endDate);
                if (doNext) {
                    getAdvancesRemainingMoney(Start2Date, startDate, endDate, mp, M_Item);
                } else {
                    alert("請正確選擇日期區間");
                }
            } else {
                alert("剩餘金額基準日不可為空值");
            }
        };

        $(function () {
            //取得分析師ListHtmlTagOption
            $Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "#MP", emptyValue_M, "option", afterSuccessFuc);
            onClick_M("#search", getAdvancesRemainingMoneyTab);
            onClick_M("#print", printScreen_M);
        })
    </script>
</asp:Content>

