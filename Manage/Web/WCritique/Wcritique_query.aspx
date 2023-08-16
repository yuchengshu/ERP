<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Wcritique_query.aspx.cs" Inherits="Manage_Web_Wcritique_query" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                            <h1 class="box-title"><b>ERP &gt;  專案客戶管理 &gt;個股管理作業</b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div>
                        <div class="input-group">
                                  
                                        <input type="text" name="message" placeholder="查尋關鍵字..." class="form-control" id="keyWord">
                                   
                                         <span class="input-group-btn">
                                              <button type="button" class="btn btn-info btn-flat searchMSFTFData qPer" id="searchMSFTFData">查詢</button>
                                          <%--<button type="button" class="btn btn-info btn-flat" id="searchMSFTFData">查詢</button>--%>
                                        </span>
                                          &nbsp;
                                          &nbsp;
                                          &nbsp;
                                        <span class="input-group-btn">
                                          <button type="button" class="btn btn-danger btn-flatt" id="deleteAllselect">新增個股</button>
                                        </span>
                                      </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table width="100%" border="0" cellspacing="0" cellpadding="1">
                                <thead id="">                                          
                                         <tr class ="bgBlue">
                                            <th class="" style="width: 5%;text-align:center;"></th>
                                            <th class="" style="width: 10%;text-align:center;">股票</th>
                                            <th class="" style="width: 10%;text-align:center;">產業別</th>
                                            <th class="" style="width: 5%;text-align:center;">收盤價</th>
                                            <th class="" style="width: 5%;text-align:center;">今年EPS</th>
                                            <th class="" style="width: 5%;text-align:center;">合理本益比</th>                                            
                                            <th class="" style="width: 5%;text-align:center;">目標價</th>
                                            <th class="" style="width: 25%;text-align:center;">個股說明</th>
                                            <th class="" style="width: 5%;text-align:center;">修改</th>
                                            <th class="" style="width: 5%;text-align:center;">刪除</th>
                                        </tr>
 
                                </thead>
                                <tbody id="customerData">
                                </tbody>
                            </table>
                            <div style="text-align:center">
　                        <div id="pageBar" style="margin:0 auto;"></div>
                        </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script src="<%=getRelativePath()%>js/pageList/muserPageList.js" type="text/javascript"></script>
    <script>                                      
        
        var CustomerManageHandlerUrl_G = "/Manage/Form/MSFTFHandler.ashx";
        var CustomerDataJson_G = null;
        <%--var MENU_no_G = "<%=getMENU_no()%>";--%>
        //現在頁數
        var NowPage_G = 1;
        //總頁數
        var TotalPage_G = 0;
        //每頁資料筆數
        var CountPerPage_G = 30;
        var pageNumClick = function () {
            var thisText = $(this).text();
            var goNext = true;
            if (thisText == ">>" || thisText == "<<") {
                if (NowPage_G <= TotalPage_G && NowPage_G >= 1) {
                    if (thisText == ">>") {
                        NowPage_G += 1;
                    } else if (thisText == "<<") {
                        NowPage_G -= 1;
                    }
                } else {
                    goNext = false;
                }
            } else {
                var clickPage = parseInt(thisText);
                if (clickPage <= TotalPage_G && clickPage >= 1) {
                    NowPage_G = clickPage;
                } else {
                    goNext = false;
                }
            }
            if (goNext) {
                
                makeHtml();
            }
        };
        //取得使用者資料============================================================start
        //取得下方分頁表列
        var getPageList = function () {
            $("#pageBar").empty();
            var startPageNum = NowPage_G - 5;
            if (startPageNum <= 0) {
                startPageNum = 1;
            }
            var showPageCount = 0;

            if (TotalPage_G >= 10) {
                showPageCount = 9;
            } else {
                showPageCount = TotalPage_G - 1;
            }

            var sb = new string_M.StringBuilder();

            if (NowPage_G > 1) {
                sb.append("<span class='pageList pageNum'><a class='qPer' href='#'><<</a></span>");
            }

            for (var i = 0; i <= showPageCount; i++) {
                sb.append("<span class='pageList pageNum'><a class='qPer'  href='javascript: void(0)'>");
                sb.append(startPageNum);
                sb.append("</a></span>");
                startPageNum += 1;
            }

            if (NowPage_G < TotalPage_G) {
                sb.append("<span class='pageList pageNum'><a class='qPer' href='#'>>></a></span>");
            }

            //$("#pageBar").append(sb.toString());
            append_M("#pageBar", sb.toString());
            empty_M("#pageNum");
            //$("#pageNum").empty();
            append_M("#pageNum", NowPage_G + "/" + TotalPage_G);
            //$("#pageNum").append(NowPage_G + "/" + TotalPage_G);
            onClick_M(".pageNum", pageNumClick);
            //$(".pageNum").on("click", pageNumClick);
        };

        //}
        var makeHtml = function () {
            $("#customerData").empty();
            if (CustomerDataJson_G.length != 0) {
                var sb = new string_M.StringBuilder();
                var n = 0;
                var startCount = (NowPage_G - 1) * 30 + 1;
                var endCount = 30 * NowPage_G;
                var isMember = false;
                $.each(CustomerDataJson_G, function (i, v) {
                    n += 1;
                    if (n >= startCount && n <= endCount) {
                        sb.append("<tr><th class='text-center'>");
                        sb.append(n);
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.Sk_Name);//股票中文
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.Industrial);//產業別
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.Close_Price);//收盤價
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.EPS);//今年EPS
                        sb.append("</th><th class='text-center'>");
                        sb.append();//合理本益比
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.Tg_Price);//目標價
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.Sk_text);//個股說明
                        sb.append("</th><th class='text-center'>");
                       
    
                        //if (v.MTel1 != "") {
                        //    sb.append(v.ComLand);
                        //}
                        //if (v.MTel2 != "") {
                        //    sb.append("<br>");
                        //    sb.append(v.ComLand);
                        //}
                        //if (v.MTel3 != "") {
                        //    sb.append("<br>");
                        //    sb.append(v.ComLand);
                        //}
                        //sb.append("</th><th class='text-center'>");
                        //if (v.OTel != "") {
                        //    sb.append("AA");
                        //    sb.append("-");
                        //    sb.append(v.OTel);
                        //    if (v.OTel_Sub != "") {
                        //        sb.append("#");
                        //        sb.append(v.ComLand);
                        //    }
                        //}
                        //if (v.OTel != "") {
                        //    sb.append(v.ComLand);
                        //    sb.append("-");
                        //    sb.append(v.ComLand);
                        //    if (v.OTel_Sub1 != "") {
                        //        sb.append("#");
                        //        sb.append(v.ComLand);
                        //    }
                        //}
                        //sb.append("</th><th class='text-center'>");
                        //if (v.HTel != "") {
                        //    sb.append(v.HTel_Zone);
                        //    sb.append("-");
                        //    sb.append(v.HTel);
                        //}
                        //if (v.HTel1 != "") {
                        //    sb.append(v.HTel_Zone1);
                        //    sb.append("-");
                        //    sb.append(v.HTel1);
                        //}
                        ////sb.append("</th><th class='text-center'>");
                        ////sb.append(v.add_date);
                        sb.append("</th>");
                        if (isMember) {
                            sb.append("<th class='text-center'>-</th>");
                            isMember = false;
                        } else {
                            sb.append("<th class='text-center'><a href='#' class='deleteCustomerData delPer' MID='");
                            sb.append(v.M_ID);
                            sb.append("'>刪</a></th>");
                        }

                        sb.append("</tr>");
                    }
            });

                
                //TotalPage_G = getTotalPage(n);
                //alert('append_M("#customerData", sb.toString());');
                append_M("#customerData", sb.toString());
                // $("#customerData").append(sb.toString());
                onClick_M(".deleteCustomerData", function () {
                    var MID = $(this).attr("MID");
                    var r = confirm("刪除後資料將無法恢復，確定刪除?");
                    console.log(r);
                    if (r == true) {
                        deleteCustomerData(MID);
                    }

                });
                /*$(".deleteCustomerData").on("click", function () {
                    var MID = $(this).attr("MID");
                    var r = confirm("刪除後資料將無法恢復，確定刪除?");
                    console.log(r);
                    if (r == true) {
                        deleteCustomerData(MID);
                    }
 
                });*/
            } else {
                alert("查無資料");
                NowPage_G = 1;
                TotalPage_G = 1;
            }
            //製作頁數列表
            getPageList();

            //頁面解鎖
            unBlockUI_M();
        };
        //查詢資料==============================================================================start
        //按下[查詢]紐會執行的功能
        var searchMSFTFData = function () {
            //alert("searchMSFTFData");
            //var startDate = val_M("#StartDate");
            ///var endDate = val_M("#EndDate");
            var doNext = check_M.isEndDateBigThanStartDate(startDate, endDate);
            if (isEmptyStr(startDate) && isEmptyStr(endDate)) {
                doNext = true;
            }
            if (doNext) {
                NowPage_G = 1;
                blockUI_M();
                empty_M("#customerData");
                var keyWord = val_M("#keyWord");
                var Q_Analyst = val_M("#Q_Analyst") == null ? emptyValue_M : val_M("#Q_Analyst");
                var Q_Product = val_M("#Q_Product") == null ? emptyValue_M : val_M("#Q_Product");
                var data = "keyWord=" + keyWord + "&U_MDEP=" + U_MDEP_M + "&U_Num=" + U_Num_M + "&ComID=" + ComID_M + "&Q_Name=" + $("#Q_Name").val() + "&Q_Tel=" + $("#Q_Tel").val() + "&StartDate=" + startDate + "&EndDate=" + endDate + "&Q_Analyst=" + Q_Analyst + "&Q_Grade=" + $("#Q_Grade").val() + "&Q_Member=" + $("#Q_Member").val() + "&Q_Product=" + Q_Product + "&action=searchCustomerData";
                console.log("keyWord=" + keyWord + "&U_MDEP=" + U_MDEP_M + "&U_Num=" + U_Num_M + "&ComID=" + ComID_M + "&Q_Name=" + $("#Q_Name").val() + "&Q_Tel=" + $("#Q_Tel").val() + "&StartDate=" + startDate + "&EndDate=" + endDate + "&Q_Analyst=" + Q_Analyst + "&Q_Grade=" + $("#Q_Grade").val() + "&Q_Member=" + $("#Q_Member").val() + "&Q_Product=" + Q_Product + "&action=searchCustomerData");
                var searchCustomerDataSuccess = function (back) {
                    CustomerDataJson_G = jsonParse_M(back);
                    //alert('show list2');//ERP > 財富管理部 > 客戶管理
                    makeHtml();//<===
                    hide_M("#customerAdvSearchDiv");

                };
                //alert('Call CustomerManageHandlerUrl_G2');
                ajax_M(CustomerManageHandlerUrl_G, data, searchCustomerDataSuccess);//<===
            } else {
                alert("請正確選擇建檔日期區間");
            }

        };
        var IP_G = "<%=getIP()%>";
        //scriptH
       
        var jsonParse_M = function (str) {
            return JSON.parse(str);
        };
        //傳送資料 ajax_M
        var ajax_M = function (url, data, success, error) {
           /* alert('call customerManageHandler!!!!!'+url);*/
            $.ajax({
                url: url,
                data: data,
                method: 'POST',
                success: success,
                error: error
            });
        };
        var getMUSERquery = function () {
            var data = "action=getERPcustomerWebPay" + "&keyWord=" + val_M("#keyWord") + "&PayStatus=" + val_M("#PayStatus") + "&U_MDEP=" + U_MDEP_M + "&ComID=" + ComID_M + "&U_Num=" + U_Num_M;
            var success = function (back) {
                var json = jsonParse_M(back);
                $muserPageList.Table.makeTbody("#ERPcustomerWebPaySearchTb", json, 10, "#pageBar", deleteData, getMid);
            };
            var error = function (e) { Log_M("getERPcustomerWebPay error=" + e); unBlockUI_M(); };
            ajax_M(ERPcustomerWebPayHandlerUrl_G, data, success, error);
        };
        var startThisPage = function () {
            var CustomerManageHandlerUrl_G = "/Manage/Form/MSFTFHandler.ashx";
            var data = "U_Num=" + U_Num_M + "&action=getMSFTFData";//呼叫MSFTFHandler.ashx中特定的action
            var success = function (back) {
                var json = jsonParse_M(back);
                CustomerDataJson_G = json;//取回的資料內容
                if (back != "成功") {
                    makeHtml();
                }
            };
            var error = function (e) { Log_M("deleteMailData error=" + e); unBlockUI_M(); };
            ajax_M(CustomerManageHandlerUrl_G, data, success, error);//<===
            onClick_M("#searchMSFTFData", searchMSFTFData);
            //查詢之功能系結
            //onClick_M(".searchCustomerDataFuc", searchCustomerData);
        };
        //頁面載入後自動執行
        $(function () {
           
            startThisPage();
            //查看使用者權限
            //getUserAuthority_M(startThisPage);
        })

       
    </script>
</asp:Content>

