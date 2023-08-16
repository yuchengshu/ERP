<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MVMEB06.aspx.cs" Inherits="wealthManage_report_MREPO_MVMEB06_MVMEB06" %>

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
                            <h1 class="box-title"><b>ERP &gt; 報表區 &gt; 會員會期狀態表 </b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-hover" id="">
                            <thead id="">
                                <tr class="active">
                                    <th class="width10percent">
                                        <label>入會起始日:</label>
                                        <input type="text" id="admissionStartDate" class="datepicker form-control admissionDate dateGroup" placeholder="開始日">
                                    </th>
                                    <th class="width10percent">
                                        <label>入會結束日:</label>
                                        <input type="text" id="admissionEndDate" class="datepicker form-control admissionDate dateGroup" placeholder="結束日">
                                    </th>
                                    <th class="width10percent">
                                        <label>到期起始日:</label>
                                        <input type="text" id="maturityStartDate" class="datepicker form-control maturityDate dateGroup" placeholder="開始日">
                                    </th>
                                    <th class="width10percent">
                                        <label>到期結束日:</label>
                                        <input type="text" id="maturityEndDate" class="datepicker form-control maturityDate dateGroup" placeholder="結束日">
                                    </th>
                                    <th class="width10percent">
                                        <label>入帳起始日:</label>
                                        <input type="text" id="accountStartDate" class="datepicker form-control accountDate dateGroup" placeholder="開始日">
                                    </th>
                                    <th class="width10percent">
                                        <label>入帳結束日:</label>
                                        <input type="text" id="accountEndDate" class="datepicker form-control  accountDate dateGroup" placeholder="結束日">
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
                                    </th>
          
                                </tr>
                            </thead>
                        </table>
                        
                        <div id="printArea" class=" startHide">
                            <div class='textAlignCenter'>
                                <h3 class='table table-hover'>會員會期狀態表 </h3>
                            </div>
                            <p><span>日期</span>:<span id="printStartDate"></span><span>-</span><span id="printEndDate"></span></p>
                            <table class="table table-hover marginTop10" style="font-size:8px;">
                                <thead id="">
                                    <tr class="bgGray">
                                        <th class="textAlignCenter borderGray" style="width:1%">序</th>
                                        <th class="textAlignCenter borderGray" style="width:6%">會員編號</th>
                                        <th class="textAlignCenter borderGray" style="width:6%">會員姓名</th>
                                        <th class="textAlignCenter borderGray" style="width:6%">助理</th>
                                        <th class="textAlignCenter borderGray" style="width:6%">身分證號</th>
                                        <th class="textAlignCenter borderGray" style="width:6%">手機</th>
                                        <th class="textAlignCenter borderGray" style="width:9%">電話</th>
                                        <th class="textAlignCenter borderGray" style="width:6%">分析師</th>
                                        <th class="textAlignCenter borderGray" style="width:4%">種類</th>
                                        <th class="textAlignCenter borderGray" style="width:6%">發票號碼</th>
                                        <th class="textAlignCenter borderGray" style="width:8%">入帳日期</th>
                                        <th class="textAlignCenter borderGray" style="width:6%">入會金額</th>
                                        <th class="textAlignCenter borderGray" style="width:6%">剩餘金額</th>
                                        <th class="textAlignCenter borderGray" style="width:7%">總天數/剩餘</th>
                                        <th class="textAlignCenter borderGray" style="width:8%">會期開始</th>
                                        <th class="textAlignCenter borderGray" style="width:10%">會期結束</th>
                                    </tr>
                                </thead>
                                <tbody id="printmcReportTb">

                                </tbody>
        
                        </table>
                        </div>
                            <table class="table table-hover marginTop10" style="font-size:8px;">
                                <thead id="">
                                    <tr class="bgGray">
                                        <th class="textAlignCenter borderGray" style="width:1%">序</th>
                                        <th class="textAlignCenter borderGray" style="width:6%">會員編號</th>
                                        <th class="textAlignCenter borderGray" style="width:6%">會員姓名</th>
                                        <th class="textAlignCenter borderGray" style="width:6%">助理</th>
                                        <th class="textAlignCenter borderGray" style="width:6%">身分證號</th>
                                        <th class="textAlignCenter borderGray" style="width:6%">手機</th>
                                        <th class="textAlignCenter borderGray" style="width:9%">電話</th>
                                        <th class="textAlignCenter borderGray" style="width:6%">分析師</th>
                                        <th class="textAlignCenter borderGray" style="width:4%">種類</th>
                                        <th class="textAlignCenter borderGray" style="width:6%">發票號碼</th>
                                        <th class="textAlignCenter borderGray" style="width:8%">入帳日期</th>
                                        <th class="textAlignCenter borderGray" style="width:6%">入會金額</th>
                                        <th class="textAlignCenter borderGray" style="width:6%">剩餘金額</th>
                                        <th class="textAlignCenter borderGray" style="width:7%">總天數/剩餘</th>
                                        <th class="textAlignCenter borderGray" style="width:8%">會期開始</th>
                                        <th class="textAlignCenter borderGray" style="width:10%">會期結束</th>
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
        var MVMEB06reportHandlerUrl_G = "reportHandlerMVMEB06.ashx";
        var afterSuccessFuc = function () {
            onChange_M("#MP", function () {
                var type = val_M("#MP");
                $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#M_Item", type, "option");
            });
        };
        var getMemberSessionStatusFuc = function (admissionStartDate, admissionEndDate, maturityStartDate, maturityEndDate, accountStartDate, accountEndDate, mp,M_Item) {
            var data = "admissionStartDate=" + admissionStartDate + "&admissionEndDate=" + admissionEndDate + "&maturityStartDate=" + maturityStartDate + "&maturityEndDate=" + maturityEndDate + "&accountStartDate=" + accountStartDate + "&accountEndDate=" + accountEndDate + "&MP=" + mp + "&M_Item=" + M_Item + "&action=getMemberSessionStatus";
            var success = function (back) {
                
                Log_M("back=" + back);
               
                empty_M("#mcReportTb");
                var json = jsonParse_M(back);
                var sb = new string_M.StringBuilder();
                var sbPrint = new string_M.StringBuilder();
                $.each(json, function (i, v) {
                    sb.append("<tr>");
                    if (v.M_Name != "total") {
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(i + 1);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.M_Num);
                        sb.append("</td>");
                        ///////////////////////////////////////
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
                        //////////////////////////////////

                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.MC_Name);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.M_SD);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.MTel1);
                        if (!isEmptyStr(v.MTel2)) {
                            sb.append("<br/>");
                            sb.append(v.MTel2);
                        }
                        if (!isEmptyStr(v.MTel3)) {
                            sb.append("<br/>");
                            sb.append(v.MTel3);
                        }
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        if (!isEmptyStr(v.HTel_Zone)) {

                            sb.append("H: ");
                            sb.append(v.HTel_Zone);
                            sb.append("-");
                            sb.append(v.HTel);

                        }
                        if (!isEmptyStr(v.OTel_Zone)) {
                            sb.append("<br/>");
                            sb.append("O: ");
                            sb.append(v.OTel_Zone);
                            sb.append("-");
                            sb.append(v.OTel);
                            if (!isEmptyStr(v.OTel_Sub)) {
                                sb.append("#");
                                sb.append(v.OTel_Sub);
                            }
                        }

                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.MP_Name);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.T_ItemName);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");

                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.T_AccountDate);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(getMoneyFormat_M(v.T_PayMoney));
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(getMoneyFormat_M(v.L_PayMoney));
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.Tdate);
                        sb.append(" / ");
                        sb.append(v.Ldate);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.T_StartDate);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append(v.T_EndDate);
                        sb.append("</td>");
                    } else {
                        sb.append("<td class='textAlignCenter' colspan='16'>");
                        sb.append("入會金額： ");
                        sb.append(getMoneyFormat_M(v.totalT_PayMoney));
                        sb.append("   剩餘金額： ");
                        sb.append(getMoneyFormat_M(v.totalL_PayMoney));
                        sb.append("   件數： ");
                        sb.append(v.totalCount);
                        sb.append("</td>");
                    }
                    
                    sb.append("</tr>")
                   
                });
                
                append_M("#mcReportTb", sb.toString());
                $.each(json, function (i, v) {
                    sbPrint.append("<tr>");
                    if (v.M_Name != "total") {
                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(i + 1);
                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(v.M_Num);
                        sbPrint.append("</td>");
                        ///////////////////////////////////////
                        sbPrint.append("<td class='text-center'>");
                        sbPrint.append(v.M_Name);
                        sbPrint.append("</td>");
                        //////////////////////////////////

                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(v.MC_Name);
                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(v.M_SD);
                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(v.MTel1);
                        if (!isEmptyStr(v.MTel2)) {
                            sbPrint.append("<br/>");
                            sbPrint.append(v.MTel2);
                        }
                        if (!isEmptyStr(v.MTel3)) {
                            sbPrint.append("<br/>");
                            sbPrint.append(v.MTel3);
                        }
                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        if (!isEmptyStr(v.HTel_Zone)) {

                            sbPrint.append("H: ");
                            sbPrint.append(v.HTel_Zone);
                            sbPrint.append("-");
                            sbPrint.append(v.HTel);

                        }
                        if (!isEmptyStr(v.OTel_Zone)) {
                            sbPrint.append("<br/>");
                            sbPrint.append("O: ");
                            sbPrint.append(v.OTel_Zone);
                            sbPrint.append("-");
                            sbPrint.append(v.OTel);
                            if (!isEmptyStr(v.OTel_Sub)) {
                                sbPrint.append("#");
                                sbPrint.append(v.OTel_Sub);
                            }
                        }

                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(v.MP_Name);
                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(v.T_ItemName);
                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");

                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(v.T_AccountDate);
                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(getMoneyFormat_M(v.T_PayMoney));
                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(getMoneyFormat_M(v.L_PayMoney));
                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(v.Tdate);
                        sbPrint.append(" / ");
                        sbPrint.append(v.Ldate);
                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(v.T_StartDate);
                        sbPrint.append("</td>");
                        sbPrint.append("<td class='textAlignCenter'>");
                        sbPrint.append(v.T_EndDate);
                        sbPrint.append("</td>");
                    } else {
                        sbPrint.append("<td class='textAlignCenter' colspan='16'>");
                        sbPrint.append("入會金額： ");
                        sbPrint.append(getMoneyFormat_M(v.totalT_PayMoney));
                        sbPrint.append("   剩餘金額： ");
                        sbPrint.append(getMoneyFormat_M(v.totalL_PayMoney));
                        sbPrint.append("   件數： ");
                        sbPrint.append(v.totalCount);
                        sbPrint.append("</td>");
                    }

                    sbPrint.append("</tr>")

                });
                append_M("#printmcReportTb", sbPrint.toString());
            };
            var error = function (e) { Log_M("getMemberSessionStatusFuc error=" + e); unBlockUI_M(); };
            ajax_M(MVMEB06reportHandlerUrl_G, data, success, error);
        };
        var checkDateAllEmptyTF = function () {
            var dates = $(".dateGroup");
            var val = undefined;
            var emptyCount = 0;
            var backTF = true;
            $.each(dates, function (i, v) {
                val = val_M(v);
                
                if (isEmptyStr(val)) {
                    emptyCount += 1;
                }
            });
            if (emptyCount > 5) {
                backTF = false;
            }
            return backTF;
        };
        var checkDateTF = function (className,alertName) {
            var classs = $("." + className);
            var val = undefined;
            var emptyCount = 0;
            var backTF = true;
            $.each(classs, function (i, v) {
                val = val_M(v);
                Log_M("val=" + val + "alertName=" + alertName);
                if (isEmptyStr(val)) {
                    emptyCount += 1;
                }
            });
            if (emptyCount == 1) {
                backTF = false;
                alert("請正確填寫" + alertName+"順序");
            }
            return backTF;
        };
        var getMemberSessionStatusTabFuc = function () {
        
            var admissionStartDate = val_M("#admissionStartDate");
            var admissionEndDate = val_M("#admissionEndDate");
            var maturityStartDate = val_M("#maturityStartDate");
            var maturityEndDate = val_M("#maturityEndDate");
            var accountStartDate = val_M("#accountStartDate");
            var accountEndDate = val_M("#accountEndDate");
            var mp = val_M("#MP");
            var M_Item = val_M("#M_Item");

            var dateGroups = $(".dateGroup");
            var goNext = true;
            $.each(dateGroups, function (i, v) {
                if (i == 0) {
                    if (!isEmptyStr(val_M(v))) {
                        text_M("#printStartDate", val_M(dateGroups[0]));
                        text_M("#printEndDate", val_M(dateGroups[1]));
                        goNext = false;
                    } 
                }
                if (goNext) {
                    if (i == 2) {
                        if (!isEmptyStr(val_M(v))) {
                            text_M("#printStartDate", val_M(dateGroups[2]));
                            text_M("#printEndDate", val_M(dateGroups[3]));
                            goNext = false;
                        } 
                    }
                }
                if (goNext) {
                    if (i == 4) {
                        if (!isEmptyStr(val_M(v))) {
                            text_M("#printStartDate", val_M(dateGroups[4]));
                            text_M("#printEndDate", val_M(dateGroups[5]));
                         
                        }
                    }
                }
            });
            var doNext = false;
            if (!isEmptyStr(mp)) {
                if (!isEmptyStr(M_Item)) {
                    if (checkDateAllEmptyTF()) {
                        if (checkDateTF("admissionDate", "'入會'日期")) {
                            if (checkDateTF("maturityDate", "'到期'日期")) {
                                if (checkDateTF("accountDate", "'入帳'日期")) {
                                    getMemberSessionStatusFuc(admissionStartDate, admissionEndDate, maturityStartDate, maturityEndDate, accountStartDate, accountEndDate, mp, M_Item);
                                }
                            }
                        }
                    } else {
                        alert("請選擇至少一種日期範圍");
                    }
                    
                } else {
                    alert("請選擇會員總類");
                }
            } else {
                alert("請選擇分析師");
            }
        };
      
        $(function () {
            //取得分析師ListHtmlTagOption
            $Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "#MP", emptyValue_M, "option", afterSuccessFuc);
            onClick_M("#search", getMemberSessionStatusTabFuc);
            onClick_M("#print", printScreen_M);
        })
    </script>
</asp:Content>

