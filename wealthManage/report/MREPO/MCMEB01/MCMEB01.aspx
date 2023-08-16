<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MCMEB01.aspx.cs" Inherits="wealthManage_report_MREPO_MCMEB01_MCMEB01" %>

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
                            <h1 class="box-title"><b>ERP &gt; 報表區 &gt; 個人業績報表 </b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-hover" id="">
                            <thead id="">
                                <tr class="active">
                                    <th class="width20percent">
                                        <label>起始日:</label>
                                        <input type="text" id="StartDate" class="datepicker form-control " placeholder="開始日">
                                    </th>
                                    <th class="width20percent">
                                        <label>結束日:</label>
                                        <input type="text" id="EndDate" class="datepicker form-control " placeholder="結束日">
                                    </th>
                                    <th class="width20percent">
                                        <label>分析師:</label>
                                        <select id="MP" class="form-control"></select>
                                    </th>
                                    <th class="width20percent">
                                        <label>會員總類:</label>
                                        <select id="M_Item" class="form-control"><option value="">請選擇</option></select>
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
                                        <th class="textAlignCenter">序</th>
                                        <th class="textAlignCenter">燈號</th>
                                        <th class="textAlignCenter">入帳日</th>
                                        <th class="textAlignCenter">姓名</th>
                                        <th class="textAlignCenter">入會日期</th>
                                        <th class="textAlignCenter">到期日期</th>
                                        <th class="textAlignCenter">入會金額</th>
                                        <th class="textAlignCenter">付款方式/入帳金額</th>
                                    </tr>

                                </thead>
                                <tbody id="ReportTb">

                                </tbody>
                        
                        </table>
                        <table class="table table-hover marginTop10">
                                <thead id="">
                                    <tr class="bgGray">
                                        <th class="textAlignCenter">燈號</th>
                                        <th class="textAlignCenter">件數</th>
                                        <th class="textAlignCenter">金額</th>
                                    </tr>
                                </thead>
                                <tbody id="">
                                    <tr class="">
                                        <td class="textAlignCenter colorRed">紅</td>
                                        <th class="textAlignCenter" id="rCount"></th>
                                        <th class="textAlignCenter" id="rMoney"></th>
                                    </tr>
                                    <tr class="">
                                        <td class="textAlignCenter colorYellow">黃</td>
                                        <th class="textAlignCenter" id="yCount"></th>
                                        <th class="textAlignCenter" id="yMoney"></th>
                                    </tr>
                                    <tr class="">
                                        <td class="textAlignCenter colorGreen">綠</td>
                                        <th class="textAlignCenter" id="gCount"></th>
                                        <th class="textAlignCenter" id="gMoney"></th>
                                    </tr>
                                    <tr class="">
                                        <td class="textAlignCenter">無</td>
                                        <th class="textAlignCenter" id="Count"></th>
                                        <th class="textAlignCenter" id="Money"></th>
                                    </tr>
                                </tbody>
                        
                        </table>
                        
                         
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        var MCMEB01reportHandlerUrl_G = "reportHandlerMCMEB01.ashx";
        var afterSuccessFuc = function () {
            onChange_M("#MP", function () {
                
                var type = val_M("#MP");
                alert(type);//分析師代碼
                $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#M_Item", type, "option");//會員種類(20221115)
                //(20221116)修改!!!!!!!!!!!
            });
        };

        

        var getAnalystSinglePerformance = function (startDate, endDate, mp, M_Item) {
            var data = "StartDate=" + startDate + "&EndDate=" + endDate + "&MP=" + mp + "&M_Item=" + M_Item + "&ComID=" + ComID_M + "&U_Num=" + U_Num_M + "&action=getAnalystSinglePerformance";
            var success = function (back) {
               
                Log_M("back=" + back);

                empty_M("#ReportTb");
                    var json = jsonParse_M(back);
                    var sb = new string_M.StringBuilder();
                    var totalT_PayMoney = 0;
                    var totalAccount_Money = 0;
                    var rCount = 0;
                    var rMoney = 0;
                    var yCount = 0;
                    var yMoney = 0;
                    var gCount = 0;
                    var gMoney = 0;
                    var Count = 0;
                    var Money = 0;
                $.each(json, function (i, v) {
                    var count = json.length;
                    if ((i + 1) != count) {
                            sb.append("<tr>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(i + 1);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append("<img style='width:25px;height:25px;' src='../../../../img/");
                            sb.append(v.Light_Status);
                            sb.append(".png'/>");
                            switch (v.Light_Status) {
                                case "R":
                                    rCount +=1;
                                    rMoney += parseInt(v.T_PayMoney);
                                    break;
                                case "Y":
                                    yCount += 1;
                                    yMoney += parseInt(v.T_PayMoney);
                                    break;
                                case "G":
                                    gCount += 1;
                                    gMoney += parseInt(v.T_PayMoney);
                                    break;
                                default:
                                    Count += 1;
                                    Money += parseInt(v.T_PayMoney);
                                    break;
                            }
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.T_AccountDate.split(' ')[0]);
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
                            sb.append(v.T_StartDate.split(' ')[0]);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.T_EndDate.split(' ')[0]);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            totalT_PayMoney += parseInt(v.T_PayMoney);
                            sb.append(v.T_PayMoney);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            
                            $.each(v.cdeList, function (ii, vv) {
                                sb.append("<div>");
                                sb.append("<span class='textAlignCenter col-md-4'>");
                                sb.append(vv.Pay_TypeName);
                                sb.append("</span>");
                                sb.append("<span class='textAlignCenter col-md-4'>");
                                sb.append(vv.MC_Name);
                                sb.append("</span>");
                                sb.append("<span class='textAlignRight col-md-4'>");
                                sb.append(vv.Account_Money);
                                totalAccount_Money += parseInt(vv.Account_Money);
                                sb.append("</span>");
                                sb.append("</div>");
                            });

                            
                            sb.append("</td>");
                            sb.append("</tr>");
                        } else {
                            sb.append("<tr>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append("合計");
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append("</td>");
                            sb.append("<td class='text-center'>");
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter colorBlue'>");
                            sb.append(totalT_PayMoney);

                            sb.append("</td>");
                            sb.append("<td class='textAlignRight'>");
                            sb.append("<span class='textAlignRight paddingRight14 colorBlue'>");
                            sb.append(totalAccount_Money);
                            sb.append("</span>");
                            sb.append("</td>");
                            sb.append("</tr>");
                        }
                        
                        
                    });
           
                 
                    append_M("#ReportTb", sb.toString());
                    text_M("#rCount", rCount.toString());
              
                    text_M("#rMoney", rMoney.toString());
                    text_M("#yCount", yCount.toString());
                    text_M("#yMoney", yMoney.toString());
                    text_M("#gCount", gCount.toString());
                    text_M("#gMoney", gMoney.toString());
                    text_M("#Count", Count.toString());
                    text_M("#Money", Money.toString());
                    unBlockUI_M();
                };
            ajax_M(MCMEB01reportHandlerUrl_G, data, success);
        };
        //按下查詢紐(個人業績報表)
        var getAnalystSinglePerformanceTab = function () {
            blockUI_M();
            var startDate = val_M("#StartDate");//起始日
            var endDate = val_M("#EndDate");//結束日
            var mp = val_M("#MP");//分析師員工編號
            var M_Item = val_M("#M_Item");
            //確定起始日跟結束日沒有寫反
            var doNext = check_M.isEndDateBigThanStartDate(startDate, endDate);
            if (doNext) {
                if (!isEmptyStr(mp)) {
                    if (!isEmptyStr(M_Item)) {
                        getAnalystSinglePerformance(startDate, endDate, mp, M_Item);


                    } else {
                        alert("請選擇分析師類別");
                        unBlockUI_M();
                    }
 
          
                } else {
                    alert("請選擇分析師");
                    unBlockUI_M();
                }
                
            }else{
                alert("請正確選擇日期區間");
                unBlockUI_M();
            }
            
        };
      
        $(function () {
            //取得分析師ListHtmlTagOption
            $Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "#MP", ComID_M, "option", afterSuccessFuc);
            onClick_M("#search", getAnalystSinglePerformanceTab);
        })
    </script>
</asp:Content>


