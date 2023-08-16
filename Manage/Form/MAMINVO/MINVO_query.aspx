    <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MINVO_query.aspx.cs" Inherits="wealthManage_custermerManage_MMBER_customerManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="<%=getRelativePath()%>js/common/CommonTool.js" type="text/javascript"></script>
    <div class="content-wrapper" style="min-height: 668px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
        </section>

        <!-- Main content -->
        <section class="content">
            <!-- Main row -->
            <div id="Main" class="divBorder">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-danger">
                            <div class="box-header">
                                <i class="fa fa-list-alt"></i>
                                <h1 class="box-title"><b>ERP > 人事財務部 > <font>發票基本資料維護</font></b></h1>
                                <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title="">
                                </div>
                            </div>
                            <!-- /.box-header -->

                            <div class="box-body">

                                <%--個股管理作業 - 新增--%>
                                <%--20220722--%>




                                <table class="table table-hover" id="customerDataTab">

                                    <thead>
                                        <tr class="active">

                                            <th class="" colspan="3">
                                                <div class="input-group">
                                                    <%-- <span class="input-group-btn ">
                                                    <button type="button" class="btn btn-info btn-flat marginLeft marginRight qPer" id="openSearchAdvancedWindow">進階查詢</button>
                                                </span>
                                                <span class="input-group-btn marginLeft">
                                                    <button type="button" class="btn btn-info btn-flat qPer" id="openTodayContactWindow">今日聯絡事項</button>
                                                </span>--%>
                                                </div>
                                            </th>


                                            <th class="" colspan="1"></th>
                                            <th class="" colspan="1">
                                                <div class="btn-group" data-toggle="btn-toggle">
                                                    <button type="button" id="openAddLeaveDataDiv" class="btn btn-primary btn-flat getComIdMdepEmpList">新增公司資料</button>
                                                </div>
                                            </th>
                                            <th class="" colspan="1">page&nbsp;：&nbsp;<span id="pageNum"></span></th>
                                        </tr>

                                        <tr class="bgBlue">
                                            <th class="" style="width: 10%; text-align: center;">編號</th>
                                            <th class="" style="width: 27%; text-align: center;">營業人名稱</th>
                                            <th class="" style="width: 23%; text-align: center;">統一編號</th>
                                            <th class="" style="width: 20%; text-align: center;">稅籍編號</th>
                                            <th class="" style="width: 10%; text-align: center;">修改</th>
                                            <th class="" style="width: 10%; text-align: center;">刪除</th>
                                        </tr>
                                    </thead>
                                    <tbody id="MINVOData">
                                    </tbody>

                                </table>
                                <div style="text-align: center">
                                    <div id="pageBar" style="margin: 0 auto;"></div>
                                </div>

                            </div>
                        </div>
                        <!--/.box-body-->

                    </div>
                    <!--/.box-->

                </div>
            </div>
            <!--新增公司資料START-->
            <div id="addLeaveDataDiv" class="divBorder startHide">
                <div id="addLeaveDataTitle" class="marginLeftRight10 titleBottomBorder">
                    <h2><span>發票基本資料新增</span>
                        <div id="closeAddLeaveDataDiv" class="btn" style="margin-right: 0 auto; float: right;">
                            <button id="closeAddLeaveDataBtn" type="button" class="btn btn-flat closeSecondaryDiv closeBtn" closedivid="">X</button>
                        </div>
                    </h2>
                </div>
                <div id="addLeaveDataSection">
                    <form id="addLeaveDataFm" class="marginTop10">
                        <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#E4E4E4">
                            <form name="form1" method="post" action="MINVO_addDB.asp" onsubmit="return jsCheck();">
                            <tr class="12-k" bgcolor="F7F6F3">
                                <td width="25%" align="right">營業人名稱：</td>
                                <td width="75%">
                                    <input type="text" name="Com_Name" id="Com_Name" size="50" maxlength="50"></td>
                            </tr>
                            <tr class="12-k" bgcolor="F7F6F3">
                                <td align="right">統一編號：</td>
                                <td>
                                    <input type="text" name="Uniform_Num" id="Uniform_Num" size="10" maxlength="8"><font color="RED">(僅能輸入8碼數字)</font></td>
                            </tr>
                            <tr class="12-k" bgcolor="F7F6F3">
                                <td align="right">稅籍編號：</td>
                                <td>
                                    <input type="text" name="Tax_Num" id="Tax_Num" size="10" maxlength="9"><font color="RED">(僅能輸入9碼數字)</font></td>
                            </tr>
                            <tr align="center">
                                <td colspan="2">
                                    <%-- <input type="submit" name="INVO_NEW" class="btn" value="新增發票基本資料">--%>
                                    <button type="button" id="INVO_NEW" class="btn btn-primary btn-flat getComIdMdepEmpList">新增發票基本資料</button>

                                    <button type="button" class="btn btn-info btn-flat" id="Back">返回基本資料列表</button>

                                </td>
                                </tr>

                        </table>
                    </form>
                </div>
                <div id="editMINVODataDialog" class="form-control startHide" title="修改資料">
                                <form class="">
                                    <p>
                                        營業人名稱：<input class="form-control" id="com_name" />
                                        <input type="hidden" id="auto_id" />
                                        <input type="hidden" id="com_id" />
                                    </p>
                                    <p>統一編號：<input class="form-control" id="uniform_num" /></></p>
                                    <p>稅籍編號：<input class="form-control" id="tax_num" /></p>


                                    <div style="text-align: center" class="">
                                        <input type="button" class="btn btn-primary editPer" id="editDataAnalystsData" value="修改資料" />
                                    </div>
                                </form>
                            </div>
                <!--新增公司資料END-->
                <script src="<%=getRelativePath()%>js/pageList/mcmsftfPageList.js" type="text/javascript"></script>

                <script>
                    var MINVOHandlerrUrl_G = "MINVOHandler.ashx";
                    var MINVODataJson_G = null;
                    var MENU_no_G = "<%=getMENU_no()%>";
                    //現在頁數
                    var NowPage_G = 1;
                    //總頁數
                    var TotalPage_G = 0;
                    //每頁資料筆數
                    var CountPerPage_G = 30;
                    //業務員列表
                    var McList_G = undefined;
                    //業務員公司別
                    var McComID_G = undefined;
                    //業務員部門別
                    var McMdep_G = undefined;
                    //業務員姓名
                    var McName_G = undefined;
                    //=============================================================分頁工具start
                    var pageNumClick = function () {
                        //alert('pageNumClick');
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
                            //alert('makeHtml');
                            makeHtml();
                        }
                    };
                    var editDataAnalystsData = function () {
                        //alert('修改資料!!');
                        //var goNext = confirm("刪除後資料將無法恢復，確定刪除?");
                        //if (goNext) {
                        var com_id = val_M("#com_id");
                        var com_name = val_M("#com_name");
                        var uniform_num = val_M("#uniform_num");
                        var tax_num = val_M("#tax_num");

                        var data = "action=SaveEditDataAnalystsData" + "&com_id=" + com_id + "&com_name=" + com_name + "&uniform_num=" + uniform_num + "&tax_num=" + tax_num+"&add_user=" + U_Num_M;
                        var success = function (back) {
                            if (back = "成功") {
                                alert("異動資料成功!");
                                $('#editMINVODataDialog').dialog('close');
                                startThisPage();
                                
                            }
                        };
                        var error = function (e) { Log_M("editData error=" + e); unBlockUI_M(); };
                        ajax_M(MINVOHandlerrUrl_G, data, success, error);
                        // }
                    };

                    onClick_M(".editData", editDataAnalystsData);
                    onClick_M("#editDataAnalystsData", editDataAnalystsData);
                    var openEditDataGiftDialog = function () {
                        alert('openEditDataGiftDialog');
                        $('#editMINVODataDialog').dialog('open');
                        //alert('分析師產品修改');
                        val_M("#com_id", attr_M(this, "com_id"));
                        val_M("#com_name", attr_M(this, "com_name"));
                        val_M("#uniform_num", attr_M(this, "uniform_num"));
                        //alert(attr_M(this, "auto_id"));
                        //alert(attr_M(this, "ProductName"));
                        val_M("#tax_num", attr_M(this, "tax_num"));


                        // $('#editDataAnalystsDialog').dialog('open');

                    };
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
                    //=========================================================================================分頁工具end
                    function isNumber(val) {
                        // negative or positive
                        return /^[-]?[\.\d]+$/.test(val);
                    }
                    var INVO_NEW = function () {
                        alert("新增公司資料!!");
                        //營業人名稱Com_Name
                        var Com_Name_Value = document.getElementById('Com_Name').value;
                        //統一編號檢查(僅能輸入8碼數字)
                        var Uniform_Num_Value = document.getElementById('Uniform_Num').value;
                        var Uniform_Num_Value_Text = isNaN(Uniform_Num_Value);//檢查是否為數字
                        if (isNumber(Uniform_Num_Value) != true) {
                            alert('統一編號格式不合,必須為數字!')
                            return;
                        }
                        var Uniform_Num_Value_length = document.getElementById('Uniform_Num').value.length;//輸入的文字長度
                        if (Uniform_Num_Value_length != 8) {
                            if (Tax_Num_Value_length != 9) {
                                alert('稅籍編號長度不合');
                                alert('統一編號長度不合');
                                return;
                            }
                            else {
                                alert('統一編號長度不合');
                            }
                            return;
                        }
                        //稅籍編號檢查(僅能輸入8碼數字)
                        var Tax_Num_Value = document.getElementById('Tax_Num').value;
                        var Tax_Num_Value_Text = isNaN(Tax_Num_Value);//檢查是否為數字
                        var Tax_Num_Value_length = document.getElementById('Tax_Num').value.length;//輸入的文字長度
                        if (isNumber(Tax_Num_Value) != true) {
                            alert('稅籍編號格式不合,必須為數字!')
                            return;
                        }
                        if (Tax_Num_Value_length != 9) {
                            alert('稅籍編號長度不合')
                            return;
                        }
                        //if (Uniform_Num_Value_length > 2) {
                        //    alert('Uniform_Num長度不合')
                        //    return;
                        //}
                        alert("營業人名稱:" + Com_Name_Value);
                        //alert(Tax_Num_Value_length);
                        //alert(Uniform_Num_Value_Text);
                        //alert(Tax_Num_Value_Text);
                        //InvoiceinfoCreate
                        //進行發票基本資料新增(InvoiceinfoCreate)動作
                        alert('進行新增動作!!');
                        //var keyWord = val_M("#keyWord");
                        var data = "Com_Name_Value=" + Com_Name_Value + "&Uniform_Num_Value=" + Uniform_Num_Value + "&Tax_Num_Value=" + Tax_Num_Value + "&add_ip=" + IP_M + "&add_user=" + U_Num_M + "&action=InvoiceinfoCreate";
                        Log_M("getKeywordList data=" + data);
                        var success = function (back) {
                            Log_M("getKeywordList back=" + back);
                            var json = jsonParse_M(back);
                            $(function () {
                                $("#keyWord").autocomplete({
                                    source: function (request, response) {
                                        var results = $.ui.autocomplete.filter(json, request.term);
                                        response(results.slice(0, 10));
                                    },
                                });
                            })
                        };
                        var error = function (e) { Log_M("getKeywordList error=" + e); unBlockUI_M(); };
                        //alert('Call CustomerManageHandlerUrl_G6');
                        ajax_M(MINVOHandlerrUrl_G, data, success, error);
                    };
                    //新增請假單資料
                    //返回到列表
                    var back = function () {
                        alert('返回到列表!!!');
                        show_M("#Main");
                        hide_M("#addLeaveDataDiv");
                        show_M("#Main");
                        unBlockUI_M();
                    };
                    //顯示新增
                    var openAddLeaveDataDiv = function () {
                        //alert('Click!!');
                        hide_M(".leaveDataGroup");
                        hide_M("#pageBar");
                        hide_M("#compensatoryLeaveDataTab");
                        var sbHour = new StringBuilder_M();
                        var sbMin = new StringBuilder_M();
                        for (var i = 6; i < 24; i++) {
                            sbHour.append("<option value='");
                            sbHour.append(i);
                            sbHour.append("'>");
                            sbHour.append(i);
                            sbHour.append("</option>");
                        }
                        append_M(".getHourFuc", sbHour.toString());
                        for (var i = 0; i < 60; i++) {
                            sbMin.append("<option value='");
                            sbMin.append(i);
                            sbMin.append("'>");
                            sbMin.append(i);
                            sbMin.append("</option>");
                        }
                        append_M(".getMinFuc", sbMin.toString());
                        //getAnnualLeaveAndCompensatoryLeaveData();
                        //val_M("#addLeaveEndHour", "12");
                        hide_M("#Main");
                        show_M("#addLeaveDataDiv");
                    };
                    //取得總頁數
                    var getTotalPage = function (count) {
                        var pageCount = count / CountPerPage_G;
                        var pageCount1 = Math.floor(pageCount);
                        var remainder = count % CountPerPage_G;
                        if (remainder > 0) {
                            pageCount1 += 1;
                            pageCount = pageCount1;
                        }
                        return pageCount;
                    };
                    var getMINVOData = function () {
                        //alert('取得資料!');
                        // var Q_Analyst = val_M("#smdM_MP") == null ? emptyValue_M : val_M("#smdM_MP");//分析師員工編號
                        //alert(Q_Analyst);
                        //var startDate = val_M("#StartDate");
                        //var endDate = val_M("#EndDate");
                        //var doNext = check_M.isEndDateBigThanStartDate(startDate,endDate);
                        //if (isEmptyStr(startDate) && isEmptyStr(endDate)) {
                        doNext = true;
                        //}
                        if (doNext) {
                            NowPage_G = 1;
                            blockUI_M();
                            //empty_M("#MPMMTELData");
                            //var keyWord = val_M("#keyWord");
                            var Q_Analyst = val_M("#smdM_MP") == null ? emptyValue_M : val_M("#smdM_MP");//分析師員工編號
                            //var Q_Product = val_M("#Q_Product") == null ? emptyValue_M : val_M("#Q_Product");
                            //var data = "keyWord=" + keyWord + "&U_MDEP=" + U_MDEP_M + "&U_Num=" + U_Num_M + "&ComID=" + ComID_M + "&Q_Name=" + $("#Q_Name").val() + "&Q_Tel=" + $("#Q_Tel").val() + "&StartDate=" + startDate + "&EndDate=" + endDate + "&Q_Analyst=" + Q_Analyst + "&Q_Grade=" + $("#Q_Grade").val() + "&Q_Member=" + $("#Q_Member").val() + "&Q_Product=" + Q_Product + "&action=searchMCMSFTFData";
                            var data = "Q_Analyst=" + Q_Analyst + "&action=getInvoiceinfo";

                            console.log("Q_Analyst = " + Q_Analyst + " & action=getInvoiceinfo");
                            var searchCustomerDataSuccess = function (back) {
                                MINVODataJson_G = jsonParse_M(back);//20221014取回資料放這裡
                                makeHtml();//<===
                                hide_M("#customerAdvSearchDiv");

                            };
                            //alert('Call CustomerManageHandlerUrl_G2');
                            ajax_M(MINVOHandlerrUrl_G, data, searchCustomerDataSuccess);//<===
                        } else {
                            alert("請正確選擇建檔日期區間");
                        }

                    };
                    //查詢客戶資料==============================================================================end
                    //刪除顧客資料
                    var deleteMCMCASHData = function (ca_id) {
                        alert("刪除資料" + back);
                        var data = "ca_id=" + ca_id + "&action=deleteMCMCASHData";
                        var success = function (back) {
                            alert("刪除資料" + back);
                            //searchCustomerData();

                        };
                        //alert('Call CustomerManageHandlerUrl_G1');
                        ajax_M(MINVOHandlerrUrl_G, data, success);
                    };
                    //組成畫面20221014進度
                    <%--var makeHtml__ = function () {
                        //alert('取得使用者資料!!');
                        $("#MINVOData").empty();
                        if (MINVODataJson_G.length != 0) {
                            var sb = new string_M.StringBuilder();
                            var n = 0;
                            var startCount = (NowPage_G - 1) * 30 + 1;
                            var endCount = 30 * NowPage_G;
                            var isMember = false;
                            //MCMSFTFData
                            $.each(MINVODataJson_G, function (i, v) {
                                n += 1;
                                if (n >= startCount && n <= endCount) {
                                    sb.append("<tr><th class='text-center'>");
                                    sb.append(i + 1);
                                    sb.append("</th><th class='text-center'>");
                                    sb.append(v.Sk_No + " " + v.Sk_Name) //股票                      
                                    sb.append("</th><th class='text-center'>");
                                    sb.append(v.Industrial) //產業別
                                 <%--  <% vrs_Mitem.Open "select ditcode,ddesc From Mitem  where mitcode='STKIT' and del_tag='0' and ditcode<>'0000' and ditcode='"& vrs("Industrial")&"'" ,conn,3,1 %>
                                    < td bgcolor = "F7F6F3" ><%=show_color%><%=vrs_Mitem("ddesc")%></td >--%>

                        //        sb.append("</th><th class='text-center'>");
                        //        sb.append(v.Close_Price) //收盤價
                        //        sb.append("</th><th class='text-center'>");
                        //        sb.append(v.EPS) //今年EPS
                        //        sb.append("</th><th class='text-center'>");
                        //        sb.append() //合理本益比
                        //        sb.append("</th><th class='text-center'>");
                        //        sb.append(v.Tg_Price) //目標價
                        //        sb.append("</th><th class='text-center'>");
                        //        sb.append(v.Sk_text) //個股說明
                        //        sb.append("</td > <td class='textAlignCenter'><a href='#' class='openDiv' openDivName='#editCallRecordDetailDiv' thisId='");
                        //        sb.append("'>修</a></th>");
                        //        sb.append("<th class='text-center'><a href='#' class='deleteCustomerData delPer' MID='");
                        //        sb.append(v.M_ID);
                        //        sb.append("'>刪</a></th>");
                        //        sb.append("</tr>");
                        //    }
                        //});
                        //    TotalPage_G = getTotalPage(n);
                        //    append_M("#MINVOData", sb.toString());//要改的地方
                        //    // $("#customerData").append(sb.toString());
                        //    onClick_M(".deleteCustomerData", function () {
                        //        var MID = $(this).attr("MID");
                        //        var r = confirm("刪除後資料將無法恢復，確定刪除?");
                        //        console.log(r);
                        //        if (r == true) {
                        //            deleteCustomerData(MID);
                        //            startThisPage();
                        //        }

                    //        });
                    //        $(".deleteCustomerData").on("click", function () {
                    //            var MID = $(this).attr("MID");
                    //            var r = confirm("刪除後資料將無法恢復，確定刪除?");
                    //            console.log(r);
                    //            if (r == true) {
                    //                deleteCustomerData(MID);
                    //            }

                    //        });
                    //    } else {
                    //        alert("查無資料");
                    //        NowPage_G = 1;
                    //        TotalPage_G = 1;
                    //    }
                    //    //製作頁數列表
                    //    getPageList();

                    //    //頁面解鎖
                    //    unBlockUI_M();
                    //};--%>

                    //刪除顧客資料
                    var deleteCustomerData = function (MID) {
                        var data = "M_ID=" + MID + "&action=deleteCustomerData";
                        var success = function (back) {
                            alert("刪除資料" + back);
                            searchSRMVENUData();

                        };
                        //alert('Call CustomerManageHandlerUrl_G1');
                        ajax_M(MINVOHandlerrUrl_G, data, success);
                    };

                    var searchMINVOData = function () {
                        //alert('searchMCMSFTFData');
                        //var startDate = val_M("#StartDate");
                        //var endDate = val_M("#EndDate");
                        //var doNext = check_M.isEndDateBigThanStartDate(startDate, endDate);
                        ///if (isEmptyStr(startDate) && isEmptyStr(endDate)) {
                        doNext = true;
                        //}
                        if (doNext) {
                            NowPage_G = 1;
                            blockUI_M();
                            //empty_M("#customerData");
                            var keyWord = val_M("#keyWord");//關鍵字 

                            //var Q_Analyst = val_M("#Q_Analyst") == null ? emptyValue_M : val_M("#Q_Analyst");
                            //var Q_Product = val_M("#Q_Product") == null ? emptyValue_M : val_M("#Q_Product");
                            //var data = "keyWord=" + keyWord + "&U_MDEP=" + U_MDEP_M + "&U_Num=" + U_Num_M + "&ComID=" + ComID_M + "&Q_Name=" + $("#Q_Name").val() + "&Q_Tel=" + $("#Q_Tel").val() + "&StartDate=" + startDate + "&EndDate=" + endDate + "&Q_Analyst=" + Q_Analyst + "&Q_Grade=" + $("#Q_Grade").val() + "&Q_Member=" + $("#Q_Member").val() + "&Q_Product=" + Q_Product + "&action=searchCustomerData";
                            var data = "keyWord=" + keyWord + "&action=getInvoiceinfo";
                            console.log("keyWord=" + keyWord + "&action=getInvoiceinfo");
                            var success = function (back) {
                                var json = jsonParse_M(back);
                                //alert('GetMCMSFTFDataJson_G');
                                MINVODataJson_G = jsonParse_M(back);
                                if (back != "成功") {
                                    makeHtml();
                                }

                                /* hide_M("#customerAdvSearchDiv");*/

                            };
                            //alert('Call CustomerManageHandlerUrl_G2');
                            ajax_M(MINVOHandlerrUrl_G, data, success);//<===
                        } else {
                            alert("請正確選擇建檔日期區間");
                        }

                    };
                    //查詢客戶資料==============================================================================end
                    //20221014生成畫面
                    var makeHtml = function () {
                        //alert('!!');
                        $("#MINVOData").empty();
                        //alert('!!!!!');
                        if (MINVODataJson_G.length != 0) {
                            var sb = new string_M.StringBuilder();
                            var n = 0;
                            var startCount = (NowPage_G - 1) * 30 + 1;
                            var endCount = 30 * NowPage_G;
                            var isMember = false;
                            $.each(MINVODataJson_G, function (i, v) {
                                n += 1;
                                if (n >= startCount && n <= endCount) {
                                    sb.append("<tr><th class='text-center'>");
                                    sb.append(v.Com_id);//編號
                                    sb.append("</th><th class='text-center'>");
                                    sb.append(v.Com_Name);//營業人名稱
                                    sb.append("</th><th class='text-center'>");
                                    sb.append(v.Uniform_Num);//統一編號
                                    sb.append("</th><th class='text-center'>");
                                    sb.append(v.Tax_Num);//稅籍編號
                                    //sb.append("<th class='text-center'><a href='javascript:void(0)' class='deleteData delPer' Auto_Id='");
                                    //sb.append("'>修</a></th>");
                                    sb.append("<td class='textAlignCenter'><a href='javascript: void(0)' class='editData editPer' com_id='");
                                    sb.append(v.Com_id);
                                    sb.append("' auto_id='");
                                    sb.append(v.auto_id);
                                    sb.append("' Com_Name='");
                                    sb.append(v.Com_Name);
                                    sb.append("' Uniform_Num='");
                                    sb.append(v.Uniform_Num);
                                    sb.append("' Tax_Num='");
                                    sb.append(v.Tax_Num);
                                    sb.append("'>修</a>")
                                    sb.append("</th>");
                                    sb.append("<th class='text-center'><a href='javascript:void(0)' class='deleteData delPer' Auto_Id='");
                                    sb.append("'>刪</a></th>");
                                    sb.append("</th>");
                                    sb.append("</tr>");
                                }
                            });
                            //TotalPage_G = getTotalPage(n);
                            append_M("#MINVOData", sb.toString());
                            
                            $(".editData").on("click", openEditDataGiftDialog);
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
             
                            });
                        } else {
                            alert("查無資料");
                            NowPage_G = 1;
                            TotalPage_G = 1;
                        }
                        */
                            //製作頁數列表
                            getPageList();

                            //頁面解鎖
                            unBlockUI_M();
                        };

                        //開啟進階搜尋視窗========================start
                        //var openSearchAdvancedWindow = function () {
                        //    show_M("#customerAdvSearchDiv");
                        //    hide_M("#todayContactTab");
                        //    hide_M("#addCustomerDataDiv");
                        //};
                        //開啟進階搜尋視窗========================end


                        //關閉所有次級視窗========================start
                        //var closeSecondaryWindow = function () {
                        //    hide_M("#customerAdvSearchDiv");
                        //    hide_M("#addCustomerDataDiv");
                        //    hide_M("#todayContactTab");
                        //    show_M("#customerDataTab");
                        //    show_M("#pageBar");
                        //};
                        //關閉所有次級視窗========================end
                        //openAddMCMSFTFDataWindow
                        //打開個股管理作業 - 新增視窗========================start
                        //var openAddMCMSFTFDataWindow = function () {
                        //alert('openAddMCMSFTFDataWindow');
                        //    hide_M("#customerAdvSearchDiv");
                        //    //hide_M("#customerDataTab");
                        //    show_M("#AddMCMSFTFDataWindow");
                        //    hide_M("#todayContactTab");
                        //    hide_M("#pageBar");
                        //};
                        //打開新增客戶資料視窗========================end


                        //打開今日聯絡事項視窗========================start
                        //var openTodayContactWindow = function () {
                        //    hide_M("#customerAdvSearchDiv");
                        //    hide_M("#addCustomerDataDiv");
                        //    show_M("#todayContactTab");
                        //};
                        //打開今日聯絡事項視窗========================end


                        //取得今日聯絡事項============================================================start
                        //var getTodayConnectionMatterHtml = function () {
                        //    var data = "U_Num=" + U_Num_M + "&action=getTodayConnectionMatterHtml";
                        //    var getTodayConnectionMatterHtmlSuccess = function (back) {
                        //        $("#getTodayConnectionMatterHtml").append(back.toString());
                        //    };
                        //    //alert('Call CustomerManageHandlerUrl_G3');
                        //    ajax_M(CustomerManageHandlerUrl_G, data, getTodayConnectionMatterHtmlSuccess);//<===
                        //};
                        //取得今日聯絡事項============================================================end


                        ////確認欄位資料是否正確==========================================================start
                        var checkCol = function () {
                            var back = false;
                            if (check_M.AllRequiredNoEmpty(".addCustomerDataRequired", "requiredItem")) {
                                if (check_M.isROCIDstr(".checkIdFuc", false)) {
                                    if (check_M.isEmailFormat(".checkEmailFuc", false)) {
                                        if (check_M.AtLeastContact(".contact")) {
                                            if (check_M.isMobileNum(".checkMobile", false)) {
                                                back = true;
                                            }
                                        }
                                    }
                                }
                            }
                            return back;
                        };
                        ////確認欄位資料是否正確==========================================================end


                        //製作selectTag的業務員列表===============================start
                        var makeMClistHtmlTagSelect = function (idOrClassName) {
                            //alert('製作selectTag的業務員列表');

                            //2.送出查詢後，將回來的資料組成option
                            var getMClistSuccess = function (back) {
                                McList_G = jsonParse_M(back);
                                var sb = new string_M.StringBuilder();
                                $.each(McList_G, function (i, v) {
                                    sb.append("<option value = '");
                                    sb.append(v.U_Num);
                                    sb.append("' comid='");
                                    sb.append(v.ComID);
                                    sb.append("' uMdep='");
                                    sb.append(v.U_MDEP);
                                    sb.append("' uName='");
                                    sb.append(v.U_Name);
                                    sb.append("'>");
                                    sb.append(v.ComIDname);
                                    sb.append("-");
                                    sb.append(v.U_Num);
                                    sb.append("-");
                                    sb.append(v.U_Name);
                                    sb.append("</option>");
                                });
                                append_M(idOrClassName, sb.toString());
                                val_M(idOrClassName, U_Num_M);
                            };
                            //1.取得業務員資料
                            $Common.MUSER.getMClist(CommonHandlerUrl_M, U_Num_M, getMClistSuccess);//<=================
                        };
                        //製作selectTag的業務員列表===============================end


                        var getLightStatusFromUmdep = function () {
                            var lightStatus = undefined;
                            if (isEmptyStr(U_MDEP_M)) {
                                lightStatus = "G";
                            } else {
                                if (U_MDEP_M == "0002" || U_MDEP_M == "0007" || U_MDEP_M == "0011" || U_MDEP_M == "0013" || U_MDEP_M == "0015") {
                                    lightStatus = "G";
                                } else if (U_MDEP_M == "0006" || U_MDEP_M == "0016") {
                                    lightStatus = "Y";
                                } else {
                                    lightStatus = "R";
                                }
                            }
                            return lightStatus;
                        };


                        //檢查手機號碼是否存在之功能系結
                        var hasMTel = function () {
                            var MTel = val_M(this);
                            var id = attr_M(this, "id");
                            var data = "MTel=" + MTel + "&action=hasMTel";
                            var success = function (back) {
                                if (!isEmptyStr(back)) {
                                    alert(back + "已存在請再次確認。");
                                    val_M("#" + id, emptyValue_M);
                                }
                            };
                            //alert('Call CustomerManageHandlerUrl_G4');
                            ajax_M(MINVOHandlerrUrl_GMCMSFTFHandlerrUrl_G, data, success);//<===
                        };
                        //在objs取得被勾選的項目並將被勾選的項目存入idOrClassName中
                        var getCheckBoxValueStr = function (objs, idOrClassName) {
                            var back = "";
                            var count = 0;
                            $.each(objs, function (i, v) {
                                if ($(v).prop("checked") == true) {
                                    if (count > 0) {
                                        back += ",";
                                    }
                                    back += val_M(v);
                                    count += 1;
                                }
                            });
                            val_M(idOrClassName, back);
                        };

                        //新增客戶資料===============================================start
                        //20220721進行新增客戶動作!!!!
                        var addCustomerData = function () {
                            var Analysts = $('input[name="Analyst"]');
                            var PRODTs = $('input[name="PRODT"]');
                            var MPGOMs = $('input[name="MPGOM"]');
                            getCheckBoxValueStr(Analysts, "#Analyst");
                            getCheckBoxValueStr(PRODTs, "#Product");
                            getCheckBoxValueStr(MPGOMs, "#Program");
                            //確認欄位資料是否正確
                            if (checkCol()) {
                                var OTown = $("#OTown :selected").text() == "請選擇區鄉鎮" ? emptyValue_M : $("#OTown :selected").text();
                                var HTown = $("#HTown :selected").text() == "請選擇區鄉鎮" ? emptyValue_M : $("#HTown :selected").text();
                                var data = "M_Name=" + val_M("#M_Name") +
                                    "&M_Sax=" + val_M("#M_Sax") +
                                    "&M_Grade=" + val_M("#M_Grade") +
                                    "&BirthDay_Date=" + val_M("#BirthDay_Date") +
                                    "&MCdata=" + val_M("#MCdata") +
                                    "&MC_Name=" + attr_M("#MCdata :selected", "uName") +
                                    "&MC_COM=" + attr_M("#MCdata :selected", "comid") +
                                    "&OTel_Zone=" + val_M("#OTel_Zone") +
                                    "&OTel=" + val_M("#OTel") +
                                    "&OTel_Sub=" + val_M("#OTel_Sub") +
                                    "&OTel_Zone1=" + val_M("#OTel_Zone1") +
                                    "&OTel1=" + val_M("#OTel1") +
                                    "&OTel_Sub1=" + val_M("#OTel_Sub1") +
                                    "&HTel_Zone=" + val_M("#HTel_Zone") +
                                    "&HTel=" + val_M("#HTel") +
                                    "&HTel_Zone1=" + val_M("#HTel_Zone1") +
                                    "&HTel1=" + val_M("#HTel1") +
                                    "&MTel1=" + val_M("#MTel1") +
                                    "&MTel2=" + val_M("#MTel2") +
                                    "&MTel3=" + val_M("#MTel3") +
                                    "&Fax_Zone=" + val_M("#Fax_Zone") +
                                    "&Fax=" + val_M("#Fax") +
                                    "&Fax_Zone1=" + val_M("#Fax_Zone1") +
                                    "&Fax1=" + val_M("#Fax1") +
                                    "&M_SD=" + val_M("#M_SD") +
                                    "&EMail=" + val_M("#EMail") +
                                    "&OCity=" + val_M("#OCity") +
                                    "&OTown=" + OTown +
                                    "&OZipCode=" + val_M("#OTown") +
                                    "&O_Address=" + val_M("#O_Address") +
                                    "&HCity=" + val_M("#HCity") +
                                    "&HTown=" + HTown +
                                    "&HZipCode=" + val_M("#HTown") +
                                    "&H_Address=" + val_M("#H_Address") +
                                    "&Inv_Money=" + val_M("#Inv_Money") +
                                    "&Analyst=" + val_M("#Analyst") +
                                    "&Product=" + val_M("#Product") +
                                    "&Program=" + val_M("#Program") +
                                    "&M_Note=" + val_M("#M_Note") +
                                    "&Light_Status=" + getLightStatusFromUmdep() +
                                    "&add_ip=" + IP_M +
                                    "&add_user=" + U_Num_M + "&action=addEditCustomerData&addEditType=add";
                                var addCustomerDataSuccess = function (back) {
                                    alert("新增客戶資料" + back);
                                    //searchCustomerData();
                                    //val_M(".addCustomerDataInput", emptyValue_M);
                                    //val_M(".put02", "02");
                                    //val_M("#MCdata", U_Num_M);
                                    //val_M("#M_Sax", "M");
                                    hide_M("#addCustomerDataDiv");
                                    show_M("#customerDataTab");
                                };
                                Log_M("addCustomerData Ajax data=" + data);
                                //alert('Call CustomerManageHandlerUrl_G5');
                                ajax_M(MINVOHandlerrUrl_G, data, addCustomerDataSuccess);//<===
                            }
                        };
                        //新增客戶資料===============================================end

                        var getKeywordList = function () {

                            var keyWord = val_M("#keyWord");
                            var data = "keyWord=" + keyWord + "&action=getKeywordList";
                            Log_M("getKeywordList data=" + data);
                            var success = function (back) {
                                Log_M("getKeywordList back=" + back);
                                var json = jsonParse_M(back);
                                $(function () {
                                    $("#keyWord").autocomplete({
                                        source: function (request, response) {
                                            var results = $.ui.autocomplete.filter(json, request.term);
                                            response(results.slice(0, 10));
                                        },
                                    });
                                })
                            };
                            var error = function (e) { Log_M("getKeywordList error=" + e); unBlockUI_M(); };
                            //alert('Call CustomerManageHandlerUrl_G6');
                            ajax_M(CustomerManageHandlerUrl_G, data, success, error);
                        };

                        
                        //頁面載入後自動執行
                        //$(function () {

                        //    startThisPage();
                        //    //查看使用者權限
                        //    //getUserAuthority_M(startThisPage);
                        //})
                    }
                    //進行頁面處理===============================================start
                    var startThisPage = function () {
                        //alert('start!!');
                        getMINVOData();
                        //var data = "action=getInvoiceinfo";//20220802修改這裡!!!!!
                        //var success = function (back) {
                        //    var json = jsonParse_M(back);
                        //    MINVODataJson_G = json;//取回的資料內容(MUSERMenuSetupDataJson_G)
                        //    if (back != "成功") {
                        //        $muser_MenuSetupPageList.Table.makeTbody("#MUSERSetupData", json, 10, "#pageBar", deleteData, getMid);
                        //        //makeHtml();//20220927要修改的地方
                        //        //$muser_MenuSetupPageList.Table.makeTbody("#MUSERSetupData", json, 10, "#pageBar", deleteData, getMid);
                        //    }
                        //};
                        //show_M("#customerDataTab");
                        //關閉所有次視窗之功能系結
                        //onClick_M(".closeSecondaryWindow", closeSecondaryWindow);
                        //開啟"進階查詢"視窗之功能系結
                        //onClick_M("#openSearchAdvancedWindow", openSearchAdvancedWindow);
                        //開啟"今日聯繫"視窗之功能系結
                        //onClick_M("#openTodayContactWindow", openTodayContactWindow);
                        //開啟"新增客戶資料"視窗之功能系結
                        //onClick_M("#openAddCustomerDataWindow", openAddCustomerDataWindow);
                        //"新增個股管理作業之功能系結
                        //onClick_M("#AddMCMSFTFDataWindowBtn", openAddMCMSFTFDataWindow);
                        //查詢之功能系結searchCustomerData
                        //onClick_M(".searchCustomerDataFuc", searchCustomerData);
                        $('#editMINVODataDialog').dialog({  //创建dialog，并设置为非自启动
                            autoOpen: false,
                            width: 380,
                            height: 680
                        });


                        onClick_M("#openAddLeaveDataDiv", openAddLeaveDataDiv);
                        onClick_M("#INVO_NEW", INVO_NEW);
                        onClick_M("#Back", back);//設定返回按鈕
                        //alert('click_M("#searchCustomerData");');
                        //click_M("#searchCustomerData");
                        searchMINVOData();
                        //show_M("#customerDataTab")
                        //取得今日聯絡事項
                        //取得投資金額HtmlTagOption列表
                        //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getInvestMoneyListFuc", "INVMY", "option");
                        ////getTodayConnectionMatterHtml();
                        ////取得分析師列表HtmlTagOption列表
                        //$Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, ".getAnalystListFuc", emptyValue_M, "option");
                        //$Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "#AnalystCheckBoxDiv", ComID_M, "checkbox");
                        ////取得商品列表HtmlTagOption列表
                        //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getProductListFuc", "PRODT", "option");
                        //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#ProductCheckBoxDiv", "PRODT", "checkbox");
                        ////取得電話來源HtmlTagOption列表
                        //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getProgrmListFuc", "MPGOM", "option");
                        //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#ProgramCheckboxDiv", "MPGOM", "checkbox");
                        ////取得投資金額HtmlTagOption列表
                        //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getInvestMoneyListFuc", "INVMY", "option");
                        ////取得電話區碼
                        //$CommonTool.Tel.getZoneCodeHtmlTagOption(".getZoneCode");
                        ////製作selectTag的城市及鄉鎮列表
                        //$CommonTool.Address.makeCityListAndTownListHtmlTagSelect("#HCity", "#HTown", undefined, undefined);
                        //$CommonTool.Address.makeCityListAndTownListHtmlTagSelect("#OCity", "#OTown", undefined, undefined);
                        ////製作業務員selectTag
                        //makeMClistHtmlTagSelect("#MCdata");
                        ////控制只能輸入數字之功能系結
                        //$CommonTool.Number.onlyNumber(".onlyNumber");
                        ////檢查手機號碼是否存在之功能系結
                        //onChange_M(".checkMobile", hasMTel);
                        ////查詢之功能系結
                        //onClick_M(".searchCustomerDataFuc", searchCustomerData);
                        ////alert('click_M("#searchCustomerData");');
                        //click_M("#searchCustomerData");
                        //getKeywordList();
                        ////設定權限
                        //setPermission_M();

                    };
                    $(function () {

                        startThisPage();
                        //查看使用者權限
                        //getUserAuthority_M(startThisPage);
                    })

                </script>
            </div>
</asp:Content>

