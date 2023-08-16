<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MUSER_setup.aspx.cs" Inherits="Manage_User_MUSER_setup" %>

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
                            <h1 class="box-title"><b>ERP &gt;  員工資料維護作業</b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table width="100%" border="0" cellspacing="0" cellpadding="1">
                                <thead id="">
                                    <tr class="bgBlue">
                                        <th class="" style="width: 10%; text-align: center;">員工編號</th>
                                        <th class="" style="width: 10%; text-align: center;">姓名</th>
                                        <th class="" style="width: 5%; text-align: center;">職稱</th>
                                        <th class="" style="width: 10%; text-align: center;">主要部門</th>
                                        <th class="" style="width: 10%; text-align: center;">所屬公司</th>
                                         <th class="" style="width: 5%; text-align: center;">分機</th>
                                        <th class="" style="width: 10%; text-align: center;">首頁權限</th>
                                        <th class="" style="width 10%; text-align: center;">選單權限</th>
                                        <th class="" style="width: 10%; text-align: center;">報表權限</th>
                                        <th class="" style="width: 10%; text-align: center;">分析師產品權限</th>
                                        <th class="" style="width: 5%; text-align: center;">修改</th>
                                        <th class="" style="width: 5%; text-align: center;">刪除</th>
                                    </tr>

                                </thead>
                                <tbody id="muserData">
                                </tbody>
                            </table>
                            <div style="text-align: center">
                                <div id="pageBar" style="margin: 0 auto;"></div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script src="<%=getRelativePath()%>js/pageList/muserPageList.js" type="text/javascript"></script>
    <script>
        var MuserQueryHandlerUrl_G = "/Manage/User/MUSERHandler.ashx";
        var MuserQueryDataJson_G = null;
        var MENU_no_G = "<%=getMENU_no()%>";
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

        //生成資料畫面(20220726)
        var makeHtml = function () {
            $("#muserData").empty();
            if (MuserQueryDataJson_G.length != 0) {
                var sb = new string_M.StringBuilder();
                var n = 0;
                var startCount = (NowPage_G - 1) * 30 + 1;
                var endCount = 30 * NowPage_G;
                var isMember = false;
                $.each(MuserQueryDataJson_G, function (i, v) {
                    n += 1;
                    if (n >= startCount && n <= endCount) {
                        sb.append("<tr><th class='text-center'>");
                        sb.append(v.U_Num);//員工編號
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.U_Name);//姓名
                       /* sb.append("");*/
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.U_Item);//職稱
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.DEPAR);//主要部門
                        //if (v.N_Call_tag == "1") {
                        //    sb.append("<img style='width:25px;height:25px;' src=/img/icon/nocall.jpg alt=請勿聯絡>");
                        //} else {
                        //    sb.append(v.ddesc);
                        //}
                        sb.append("</th><th class='text-center'>");
                        sb.append("<a class='' ");
                        sb.append("'>");
                        sb.append(v.ComLand);//主要部門
                        //sb.append("</a></th><th class='text-center'>");
                        sb.append("</a></th><th class='text-center'><a target='_blank' href='/wealthManage/customerManage/MMBER/customerDetail.aspx?M_ID=");
                        sb.append(v.ComLand);//所屬公司
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.U_Tel);//分機

                        sb.append("</th><th class='text-center'><a target='_blank' href='/Manage/User/Permission/MFUNT_report.aspx?U_Num='");
                        sb.append(v.U_Num);//員工編號
                        //sb.append("首頁權限");//首頁權限
                        sb.append("'>首頁權限</th><th class='text-center'>");
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
                        sb.append("<th class='text-center'>");

                        if (v.HTel != "") {
                            sb.append(v.HTel_Zone);
                            sb.append("-");
                            sb.append(v.HTel);
                        }
                        if (v.HTel1 != "") {
                            sb.append(v.HTel_Zone1);
                            sb.append("-");
                            sb.append(v.HTel1);
                        }
                        //sb.append("</th><th class='text-center'>");
                        //sb.append(v.add_date);
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
                append_M("#muserData", sb.toString());
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
        var IP_G = "<%=getIP()%>";
        //scriptH
        var MuserQueryHandlerUrl_G = "/Manage/User/MUSERHandler.ashx";
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

            var data = "U_Num=" + U_Num_M + "&action=getMUSERData";
            var success = function (back) {
                var json = jsonParse_M(back);
                MuserQueryDataJson_G = json;//取回的資料內容
                if (back != "成功") {
                    makeHtml();
                }
            };
            var error = function (e) { Log_M("deleteMailData error=" + e); unBlockUI_M(); };
            ajax_M(MuserQueryHandlerUrl_G, data, success, error);//<===

        };
        //頁面載入後自動執行
        $(function () {

            startThisPage();
            //查看使用者權限
            //getUserAuthority_M(startThisPage);
        })


    </script>
</asp:Content>

