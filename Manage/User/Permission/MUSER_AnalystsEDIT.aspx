<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MUSER_AnalystsEDIT.aspx.cs" Inherits="Manage_User_MUSER_Analysts" %>

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
                            <h1 class="box-title"><b>ERP &gt;  員工資料維護作業-分析師產品修改</b></h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table width="100%" border="0" cellspacing="0" cellpadding="1">

                                <tbody id="MUSERAnalystsData">
                                </tbody>
                            </table>
                            <div style="text-align: center">
                                <div id="pageBar" style="margin: 0 auto;"></div>
                            </div>
                            <p>產品名稱:</p>
                            <p>
                                <input class="form-control" id="ProductName" />
                            </p>
                            <p>代碼:</p>
                            <p>
                                <input class="form-control" id="Code" />

                            </p>
                            <p>排序:</p>
                            <p>
                                <input class="form-control" id="Sort" />

                            </p>

                            <input type="button" class="btn btn-primary" value="送出資料" id="sendThreeBigData" />

                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script src="<%=getRelativePath()%>js/pageList/MUSER_Analysts.js" type="text/javascript"></script>
    <script>
        var MuserAnalystsHandlerUrl_G = "/Manage/User/MUSERHandler.ashx";
        var MuserAnalystsEditDataJson_G = null;
        var auto_id = "<%=getauto_id()%>";
        var U_Num = "<%=getU_Num()%>";
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


        var sendThreeBigData = function () {
            alert("資料異動");
            var ProductName = val_M("#ProductName");
            var Code = val_M("#Code");
            var Sort = val_M("#Sort");
            //var WFT_id = val_M("#WFT_id");
            //var WFT_date = val_M("#WFT_date");
            //var WFT_TSE_T1 = val_M("#WFT_TSE_T1");
            //var WFT_TSE_T2 = val_M("#WFT_TSE_T2");
            //var WFT_TSE_T3 = val_M("#WFT_TSE_T3");
            //var WFT_OTC_T1 = val_M("#WFT_OTC_T1");
            //var WFT_OTC_T2 = val_M("#WFT_OTC_T2");
            //var WFT_OTC_T3 = val_M("#WFT_OTC_T3");
            //var WFT_II_T1 = val_M("#WFT_II_T1");
            //var WFT_II_T2 = val_M("#WFT_II_T2");
            //var WFT_II_T3 = val_M("#WFT_II_T3");
            //var WFT_II_T4 = val_M("#WFT_II_T4");
            //分析師產品權限修改
            //auto_id
            var data = "auto_id=" + auto_id +"&ProductName=" + ProductName + "&Code=" + Code + "&Sort=" + Sort + "&action=UpdateMUSERAnalysts";
            Log_M("data=" + data);
            var success = function (back) {
                Log_M("sendThreeBigData back=" + back);
                $('#ThreeBigDataDialog').dialog('close');
                getClosingPriceThreeBigData();
                alert("資料異動" + back);
            };
            var error = function (e) { Log_M("sendThreeBigData error=" + e); unBlockUI_M(); };
            ajax_M(MUSERHandler_G, data, success, error);

        };
        //}
        var makeHtml = function () {
            $("#customerData").empty();
            var success = function (back) {
                var json = jsonParse_M(back);
                var sb = new string_M.StringBuilder();
                var n = 0;
                var startCount = (NowPage_G - 1) * 30 + 1;
                var endCount = 30 * NowPage_G;
                var isMember = false;
                $.each(MuserAnalystsEditDataJson_G, function (i, v) {
                    n += 1;
                    val_M("#ProductName", attr_M(v, "ProductName"));
                    //val_M("#M_id", attr_M(this, "M_id"));
                    //val_M("#M_Password", attr_M(this, "M_Password"));
                    //val_M("#MP_Num", attr_M(this, "MP_Num"));
                    //val_M("#ddesc", attr_M(this, "ddesc"));
                    //val_M("#Start_date", datetimeStrToDatepickerStr_M(attr_M(this, "Start_date")));
                    //val_M("#End_date", datetimeStrToDatepickerStr_M(attr_M(this, "End_date")));
                    //val_M("#Pay", attr_M(this, "Pay"));
                    //val_M("#Faxno", attr_M(this, "Faxno"));
                    //val_M("#Tel_tag", attr_M(this, "Tel_tag"));
                    //val_M("#Call_tag", attr_M(this, "Call_tag"));
                    //val_M("#Action_tag", attr_M(this, "Action_tag"));
                    //val_M("#Img", attr_M(this, "Img"));
                    //if (n >= startCount && n <= endCount) {
                    //    sb.append("<tr><th class='text-center'>");
                    //    sb.append(v.U_Num);
                    //    sb.append("</th><th class='text-center'>");
                    //    sb.append(v.U_Name);
                    //    sb.append("");

                    //    if (v.N_Call_tag == "1") {
                    //        sb.append("<img style='width:25px;height:25px;' src=/img/icon/nocall.jpg alt=請勿聯絡>");
                    //    } else {
                    //        sb.append(v.ddesc);
                    //    }
                    //    sb.append("</th><th class='text-center'>");
                    //    sb.append("<a class='' ");
                    //    sb.append("'>");
                    //    sb.append(v.U_Item);
                    //    sb.append("</a></th><th class='text-center'>");
                    //    sb.append(v.DEPAR);
                    //    sb.append("</th><th class='text-center'>");
                    //    sb.append(v.ComLand);

                    //    sb.append("</th><th class='text-center'>");
                    //    if (v.MTel1 != "") {
                    //        sb.append(v.ComLand);
                    //    }
                    //    if (v.MTel2 != "") {
                    //        sb.append("<br>");
                    //        sb.append(v.ComLand);
                    //    }
                    //    if (v.MTel3 != "") {
                    //        sb.append("<br>");
                    //        sb.append(v.ComLand);
                    //    }
                    //    sb.append("</th><th class='text-center'>");
                    //    if (v.OTel != "") {
                    //        sb.append("AA");
                    //        sb.append("-");
                    //        sb.append(v.OTel);
                    //        if (v.OTel_Sub != "") {
                    //            sb.append("#");
                    //            sb.append(v.ComLand);
                    //        }
                    //    }
                    //    if (v.OTel != "") {
                    //        sb.append(v.ComLand);
                    //        sb.append("-");
                    //        sb.append(v.ComLand);
                    //        if (v.OTel_Sub1 != "") {
                    //            sb.append("#");
                    //            sb.append(v.ComLand);
                    //        }
                    //    }
                    //    sb.append("</th><th class='text-center'>");
                    //    if (v.HTel != "") {
                    //        sb.append(v.HTel_Zone);
                    //        sb.append("-");
                    //        sb.append(v.HTel);
                    //    }
                    //    if (v.HTel1 != "") {
                    //        sb.append(v.HTel_Zone1);
                    //        sb.append("-");
                    //        sb.append(v.HTel1);
                    //    }
                    //    //sb.append("</th><th class='text-center'>");
                    //    //sb.append(v.add_date);
                    //    sb.append("</th>");
                    //    if (isMember) {
                    //        sb.append("<th class='text-center'>-</th>");
                    //        isMember = false;
                    //    } else {
                    //        sb.append("<th class='text-center'><a href='#' class='deleteCustomerData delPer' MID='");
                    //        sb.append(v.M_ID);
                    //        sb.append("'>刪</a></th>");
                    //    }

                    //    sb.append("</tr>");
                    //}
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

                //製作頁數列表
                getPageList();

                //頁面解鎖
                unBlockUI_M();
            };
            var IP_G = "<%=getIP()%>";
        }
        //取得checkbox全部的value用'，'串成字串並返回其值 getAllcheckBoxValue_M
        var getAllcheckBoxValue_M = function (groupName) {
            var checkboxGroup = $(groupName);
            var backStr = undefined;
            var checkedCount = 0;
            $.each(checkboxGroup, function (i, v) {
                if ($(v).prop("checked")) {
                    if (checkedCount == 0) {
                        backStr = $(v).val();
                        checkedCount += 1;
                    } else {
                        backStr += ",";
                        backStr += $(v).val();
                        checkedCount += 1;
                    }
                }
            });
            return backStr;
        };
        //scriptH
        var MUSERHandler_G = "/Manage/User/MUSERHandler.ashx";
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
        var getMFUNTquery = function () {
            var data = "action=getMFUNTreportData" + "&keyWord=" + val_M("#keyWord") + "&PayStatus=" + val_M("#PayStatus") + "&U_MDEP=" + U_MDEP_M + "&ComID=" + ComID_M + "&U_Num=" + U_Num_M;
            var success = function (back) {
                var json = jsonParse_M(back);
                $muserPageList.Table.makeTbody("#MFUNTData", json, 10, "#pageBar", deleteData, getMid);
            };
            var error = function (e) { Log_M("MFUNTData error=" + e); unBlockUI_M(); };
            ajax_M(MUSERHandler_G, data, success, error);
        };
        var startThisPage = function () {
            <%--var auto_id = "<%=getauto_id()%>";--%>
            var U_Num = "<%=getU_Num()%>";
            onClick_M("#sendThreeBigData", sendThreeBigData);
            var data = "U_Num=" + U_Num + "&auto_id=" + auto_id + "&action=getMUserAnalystsEDITData";
            var success = function (back) {
                var json = jsonParse_M(back);
                MUSERAnalystsEditDataJson_G = json;//取回的資料內容(MFUNTreportDataJson_G)
                if (back != "成功") {
                    //makeHtml();
                    //$.each(MUSERAnalystsEditDataJson_G, function (i, v) {
                        // n += 1;
                        //val_M("#ProductName", attr_M(v.ProductName, "ProductName"));
                    val_M("#ProductName", MUSERAnalystsEditDataJson_G.ProductName);//產品名稱
                    val_M("#Code", MUSERAnalystsEditDataJson_G.Code);//代碼
                    val_M("#Sort", MUSERAnalystsEditDataJson_G.Sort);//排序
                    //})
                };
            };
            var error = function (e) { Log_M("deleteMailData error=" + e); unBlockUI_M(); };
            ajax_M(MUSERHandler_G, data, success, error);//<===

        };
        //頁面載入後自動執行
        $(function () {

            startThisPage();
            //查看使用者權限
            //getUserAuthority_M(startThisPage);
        })


    </script>
</asp:Content>

