<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MMBER_query.aspx.cs" Inherits="Manage_MCMRYGC_MCMRYGC_squery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 4%;
        }

        .auto-style2 {
            width: 4%;
            height: 30px;
        }

        .auto-style3 {
            height: 30px;
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
                            <h1 class="box-title">客戶管理</h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <%-- <form name="form1" method="post" action="MCMRYGC_EditDB.asp?MENU_no=" runat="server" onsubmit="return jsCheck();">--%>
                            <form name="form1" method="post" runat="server">
                                <table width="98%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
                                    <tr>
                                        <td width="4">
                                            <img src="../../../img/Memu_TL.jpg"></td>
                                        <td width="100%" background="../../../img/Memu_TC.jpg"></td>
                                        <td width="4">
                                            <img src="../../../img/Memu_TR.jpg"></td>
                                        <tr>
                                            <td width="4" background="../../../img/Memu_CL.jpg"></td>
                                            <td align="center" height="450" valign="top">
                                                <table width="98%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
                                                    <tr>
                                                        <td height="30" align="left" class="10-g">>> 客戶管理</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" valign="top">
                                                            <table width="98%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td height="24"><font size="5"><b>客戶管理</b></font></td>
                                                                </tr>
                                                                <tr>
                                                                    <!--<td  height="24" bgcolor=#fbf6db class="12-k">提醒區測試中</td>-->
                                                                    <td height="24" class="12-k"></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td align="center" valign="top">
                                                            <table width="98%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td valign="top"></td>
                                                                    <td align="center" valign="top">
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="1">
                                                                            <tr>
                                                                                <td height="197" align="center" valign="top">
                                                                                    <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#dddddd">
                                                                                        <tr align="center" bgcolor="#E5E5E5" class="12-k">
                                                                                            <td colspan="10">
                                                                                                <table border="0" width="100%" id="table1" bgcolor="#E4E4E4">
                                                                                                    <tr class="12-k">
                                                                                                        <td width="86%" class="12-k">關鍵字：
																		                 <input type="text" name="Keyword" size="15" value="" class="12-k">
                                                                                                            <input type="submit" name="query" class="btn" value="查詢">
                                                                                                            <input type="button" name="search" class="btn" value="進階查詢" onclick="javascript:window.open('MMBER_search.asp?MENU_no=','_query','scrollbars=yes,resizable=yes,width=560,height=420');">
                                                                                                            <input type="button" name="search" class="btn" value="今日聯絡事項" onclick="javascript:window.open('../SRMQUST/TodayContact.asp?MENU_no='','scrollbars=yes,resizable=yes,width=560,height=450');">
                                                                                                        </td>
                                                                                                        <td width="13%" align="right">
                                                                                                            <input type="button" name="add" value="新增客戶資料" class="btn_BLUE" onclick="javascript:location.href='MMBER_add.asp?MENU_no='';" style="float: RIGHT">
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr align="center" bgcolor="#E5E5E5" class="12-k">
                                                                                            <td class="auto-style1">項</font></td>
                                                                                            <td width="6%">狀態</td>
                                                                                            <td width="8%">姓名</font></td>
                                                                                            <td width="6%">性別</font></td>
                                                                                            <td width="8%">助理</td>
                                                                                            <td width="12%">手機</font></td>
                                                                                            <td width="14%">公司電話</font></td>
                                                                                            <td width="14%">住家電話</font></td>
                                                                                            <td width="20%">建檔日</td>
                                                                                            <td width="4%">刪</td>

                                                                                        </tr>

                                                                                        <tr align="center" class="12-k">

                                                                                            <td bgcolor="F7F6F3" class="auto-style2"></td>


                                                                                            <td bgcolor="" class="auto-style3"></td>

                                                                                            <td bgcolor="F7F6F3" class="auto-style3"></td>
                                                                                            <td bgcolor="F7F6F3" class="auto-style3"></td>

                                                                                            <td bgcolor="F7F6F3" class="auto-style3"></td>
                                                                                            <td bgcolor="F7F6F3" class="auto-style3"></td>
                                                                                            <td bgcolor="F7F6F3" class="auto-style3"></td>
                                                                                            <td bgcolor="F7F6F3" class="auto-style3"></td>
                                                                                            <td bgcolor="F7F6F3" class="auto-style3"></td>



                                                                                            <td bgcolor="F7F6F3" class="auto-style3">-
					                         
                                      <img src="../../../img/icon/delete.gif" width="18" height="17" border="0" alt="刪除" style="cursor: hand" onclick="javascript:if (confirm('刪除後資料將無法回復，確定要刪除？')) window.open('MMBER_delDB.asp?m_id=,'_del','scrollbars=yes,resizable=yes,width=20,height=20,left=2000,top=2000');">
                                                                                            </td>

                                                                                        </tr>

                                                                                        <tr align="center" height="15" bgcolor="#e5e5e5">
                                                                                            <td class="12-k" colspan="10">筆數: </td>
                                                                                        </tr>
                                                                                    </table>

                                                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                                                        <tr class="12-k" height="40" align="center">
                                                                                            <td colspan="11"></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>

                                                                    </td>
                                                                    <td valign="top"></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="4" background="../../../img/Memu_CR.jpg"></td>

                                            <tr>
                                                <td width="4">
                                                    <img src="../../../img/Memu_DL.jpg"></td>
                                                <td width="100%" background="../../../img/Memu_DC.jpg"></td>
                                                <td width="4">
                                                    <img src="../../../img/Memu_DR.jpg"></td>
                                                <tr>
                                                    <td colspan="3" align="center"></td>
                                                </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script src="<%=getRelativePath()%>js/pageList/muserPageList.js" type="text/javascript"></script>
    <script>
        var CustomerManageHandlerUrl_G = "/Manage/User/MUSERHandler.ashx";
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
                        sb.append(v.U_Num);//員工編號
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.U_Name);//姓名
                        //sb.append("");

                        //if (v.N_Call_tag == "1") {
                        //    sb.append("<img style='width:25px;height:25px;' src=/img/icon/nocall.jpg alt=請勿聯絡>");
                        //} else {
                        //    sb.append(v.ddesc);
                        //}
                        sb.append("</th><th class='text-center'>");
                        sb.append("<a class='' ");
                        sb.append("'>");
                        sb.append(v.U_Item);
                        sb.append("</a></th><th class='text-center'>");
                        sb.append(v.DEPAR);
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.ComLand);

                        sb.append("</th><th class='text-center'>");
                        if (v.MTel1 != "") {
                            sb.append(v.ComLand);
                        }
                        if (v.MTel2 != "") {
                            sb.append("<br>");
                            sb.append(v.ComLand);
                        }
                        if (v.MTel3 != "") {
                            sb.append("<br>");
                            sb.append(v.ComLand);
                        }
                        sb.append("</th><th class='text-center'>");
                        if (v.OTel != "") {
                            sb.append("AA");
                            sb.append("-");
                            sb.append(v.OTel);
                            if (v.OTel_Sub != "") {
                                sb.append("#");
                                sb.append(v.ComLand);
                            }
                        }
                        if (v.OTel != "") {
                            sb.append(v.ComLand);
                            sb.append("-");
                            sb.append(v.ComLand);
                            if (v.OTel_Sub1 != "") {
                                sb.append("#");
                                sb.append(v.ComLand);
                            }
                        }
                        sb.append("</th><th class='text-center'>");
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
                        sb.append("<th class='text-center'><a href='#' class='deleteCustomerData delPer' MID='");
                        sb.append(v.M_ID);
                        sb.append("'>刪</a></th>");
                    }

                    sb.append("</tr>");
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
        var CustomerManageHandlerUrl_G = "/Manage/User/MUSERHandler.ashx";
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

            //var data = "U_Num=" + U_Num_M + "&action=getMUSERData";
            //var success = function (back) {
            //    var json = jsonParse_M(back);
            //    CustomerDataJson_G = json;//取回的資料內容
            //    if (back != "成功") {
            //        makeHtml();
            //    }
            //};
            //var error = function (e) { Log_M("deleteMailData error=" + e); unBlockUI_M(); };
            //ajax_M(CustomerManageHandlerUrl_G, data, success, error);//<===

        };
        //
        $(function () {
            $("span[errormessage]")
                .addClass("aspNetVldrMark") //add class mark for latter access
                .each(function () {
                    var $spn = $(this);
                    //set errormessage as title to display when hover
                    $spn.attr("title", $spn.attr("errormessage"))
                        //add wrapper on innerText
                        .html("<span>" + $spn.html() + "</span>");
                });
            //blinking effect
            setInterval(function () {
                $("span.aspNetVldrMark > span").toggle();
                //or blink only the visible spans
                //$("span.aspNetVldrMark").filter(function () {
                //    return this.style.visibility == "visible";
                //}).children("span").toggle();
            }, 400);
        });
        //

        //頁面載入後自動執行
        $(function () {

            startThisPage();
            //查看使用者權限
            //getUserAuthority_M(startThisPage);
        })


    </script>
</asp:Content>

