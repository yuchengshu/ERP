<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MFUNT_report.aspx.cs" Inherits="Manage_User_MFUNT_report" %>

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
                            <h1 class="box-title"><b>ERP &gt;  員工資料維護作業-首頁權限</b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table width="100%" border="0" cellspacing="0" cellpadding="1">
                                <thead id="">
                                    <tr class="bgBlue">
                                        <th class="" style="width: 10%; text-align: center;">序</th>
                                        <th class="" style="width: 20%; text-align: center;">代碼</th>
                                        <th class="" style="width: 30%; text-align: center;">單元名稱</th>
                                        <th class="" style="width: 30%; text-align: center;">備註</th>
                                        <th class="" style="width: 10%; text-align: center;">開放權限</th>

                                    </tr>

                                </thead>
                                <tbody id="MFUNTData">
                                </tbody>

                            </table>
                            <div style="text-align: center">
                                <div id="pageBar" style="margin: 0 auto;"></div>
                            </div>
                            <%--按下送出後更新--%>
                              <div style="text-align: center">
                            <input type="submit" name="submit" class="btn" value="送　出" onclick="UpDate()">
                            <input type="submit" name="submit" class="btn" value="回到員工資料維護作業" onclick="Return()">
                                  </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script src="<%=getRelativePath()%>js/pageList/MFUNT_report.js" type="text/javascript"></script>
    <script>
        var MFUNTreportHandlerUrl_G = "/Manage/User/Permission/MFUNT_reportHandler.ashx";
        var MFUNTreportDataJson_G = null;
        var MENU_no_G = "<%=getMENU_no()%>";
        //傳入的使用者員工編號
        var User_Num_M = "<%=getU_Num()%>";
        //傳入操作者的員工編號
        var EditU_Num = "<%=getEditU_Num()%>";
        //alert(User_Num_M);
        //現在頁數
        var NowPage_G = 1;
        //總頁數
        var TotalPage_G = 0;
        //每頁資料筆數
        var CountPerPage_G = 30;
        var IP_G = "<%=getIP()%>";
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

                //makeHtml();
            }
        };
        var Check_Item;//被勾選的項目
        var Check_Item_Ary;//被勾選的項目(代碼)
        var getCheckBoxValueStr = function (objs, idOrClassName) {
            var back = "";
            var count = 0;
            $.each(objs, function (i, v) {
                if ($(v).prop("checked") == true) {
                    if (count > 0) {
                        back += ",";
                    }
                    //var Test = ($(v).prop("value");
                    back += ($(v).prop("value"));//back內存有勾選的[代碼]
                    count += 1;
                }
            });
            val_M(idOrClassName, back);
            Check_Item = back;//被勾選的項目(回傳html中的value值:代碼)
            Check_Item_Ary = Check_Item.split(',');//畫面中被勾選的項目(代碼)


        };
        //REF MCMRYGC_query.aspx(#347~#427)
        //
        //按下[送出](首頁權限)

        function UpDate() {
            var per_open = $('input[name="per_open_"]');
            getCheckBoxValueStr(per_open, "#per_open_");
            var data = "Check_Item_Ary=" + Check_Item_Ary + "&EditU_Num=" + EditU_Num + "&U_Num=" + User_Num_M + "&action=HomePageUpdate";
            var searchCustomerDataSuccess = function (back) {
                MPMMTELDataJson_G = jsonParse_M(back);
                ////alert('show list2');
                //makeHtml();//<===
                //hide_M("#customerAdvSearchDiv");
                alert('更新成功！回到上一頁！');
                window.close();//關閉此畫面
                // User / MUSER_query.aspx
                //Response.Redirect("~/User/MUSER_query.aspx");

            }
            ajax_M(MFUNTreportHandlerUrl_G, data, searchCustomerDataSuccess);
            //var per_open = $('input[name="per_open_"]');
            ////window.alert('Hi!');
            ////window.alert('Bye!');
            getCheckBoxValueStr(per_open, "#per_open");
            //var Check = Check_Item_Ary;
            ////var test = $("#per_open").val();
            ////var pere = per_open;
            //var test = per_open;
            //alert(test);
        }
        function Return() {
            //alert("Return!!");
            //Response.redirect("~/MUSER_query.aspx");
            this.close();
        }
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
        //生成資料畫面
        var makeHtml = function () {
            $("#MFUNT_report").empty();
            if (MFUNTreportDataJson_G.length != 0) {
                var sb = new string_M.StringBuilder();
                var n = 0;
                var startCount = (NowPage_G - 1) * 30 + 1;
                var endCount = 30 * NowPage_G;
                var isMember = false;
                $.each(MFUNTreportDataJson_G, function (i, v) {
                    n += 1;
                    if (n >= startCount && n <= endCount) {
                        sb.append("<tr><th class='text-center'>");
                        sb.append(v.U_Num);
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.U_Name);
                        sb.append("");

                        if (v.N_Call_tag == "1") {
                            sb.append("<img style='width:25px;height:25px;' src=/img/icon/nocall.jpg alt=請勿聯絡>");
                        } else {
                            sb.append(v.ddesc);
                        }
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
                        //sb.append("</th><th class='text-center'>");
                        //sb.append(v.add_date);
                        sb.append("</th>");
                        //if (isMember) {
                        //    sb.append("<th class='text-center'>-</th>");
                        //    isMember = false;
                        //} else {
                        //    sb.append("<th class='text-center'><a href='#' class='deleteCustomerData delPer' MID='");
                        //    sb.append(v.M_ID);
                        //    sb.append("'>刪</a></th>");
                        //}

                        sb.append("</tr>");
                    }
            });


                //TotalPage_G = getTotalPage(n);
                //alert('append_M("#customerData", sb.toString());');
                //append_M("#MFUNTData", sb.toString());
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
        //var getCheckBoxValueStr = function (objs, idOrClassName) {
        //    var back = "";
        //    var count = 0;
        //    $.each(objs, function (i, v) {
        //        if ($(v).prop("checked") == true) {
        //            if (count > 0) {
        //                back += ",";
        //            }
        //            back += val_M(v);
        //            count += 1;
        //        }
        //    });
        //    val_M(idOrClassName, back);
        //};
        //scriptH
        var MFUNTreportHandlerUrl_G = "/Manage/User/Permission/MFUNT_reportHandler.ashx";
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

        var getMid = function () {
            //getMFUNTreportData
            var M_id = attr_M(this, "M_id")
            location.href = "/wealthManage/customerManage/MMBER/customerDetail.aspx?M_ID=" + M_id + "&MENU_no=" + CustomerDetailMENU_no_G + "&ERPcustomerWebPayMENU_no=" + MENU_no_G;
        };
        var getMFUNTquery = function () {
            //alert('!!');
            var data = "action=getHomePagePerquery" + "&keyWord=" + val_M("#keyWord") + "&PayStatus=" + val_M("#PayStatus") + "&U_MDEP=" + U_MDEP_M + "&ComID=" + ComID_M + "&U_Num=" + User_Num_M;
            var success = function (back) {
                var json = jsonParse_M(back);
                $muserPageList.Table.makeTbody("#MFUNTData", json, 10, "#pageBar", deleteData, getMid);
            };
            var error = function (e) { Log_M("MFUNTData error=" + e); unBlockUI_M(); };
            ajax_M(MFUNTreportHandlerUrl_G, data, success, error);
        };

        var deleteData = function () {
            var deleteCheck = confirm("是否刪除資料");
            if (deleteCheck) {
                var ca_id = attr_M(this, "ca_id");
                var data = "action=deleteData" + "&ca_id=" + ca_id;
                var success = function (back) {
                    if (back == "成功") {
                        getERPcustomerWebPay();
                        alert("資料異動成功");
                    }
                };
                var error = function (e) { Log_M("deleteData error=" + e); unBlockUI_M(); };
                ajax_M(ERPcustomerWebPayHandlerUrl_G, data, success, error);
            }
        };
        var startThisPage = function () {
            getMFUNTquery();
            var data = "U_Num=" + User_Num_M + "&action=getHomePagePerquery";
            var success = function (back) {
                var json = jsonParse_M(back);
                MFUNTreportDataJson_G = json;//取回的資料內容(MFUNTreportDataJson_G)
                if (back != "成功") {
                    makeHtml();
                }
            };
            var error = function (e) { Log_M("deleteMailData error=" + e); unBlockUI_M(); };
            ajax_M(MFUNTreportHandlerUrl_G, data, success, error);//<===

        };
        //頁面載入後自動執行
        $(function () {

            startThisPage();
            //查看使用者權限
            //getUserAuthority_M(startThisPage);
        })


    </script>
</asp:Content>

