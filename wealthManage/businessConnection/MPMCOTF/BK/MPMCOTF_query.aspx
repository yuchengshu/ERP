<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MPMCOTF_query.aspx.cs" Inherits="wealthManage_businessConnection_MPMCOTF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 28px;
        }

        .auto-style2 {
            height: 28px;
            width: 3%;
        }

        .auto-style3 {
            width: 3%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper" style="min-height: 616px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
        </section>

        <!-- Main content -->
        <section class="content">
            <!-- Main row -->

            <div class="row">
                <div class="col-md-12">
                    <div class="box box-danger">
                        <div class="box-header">
                            <i class="fa fa-list-alt"></i>
                            <h1 class="box-title"><b>ERP &gt; 財富管理部 &gt; 業務聯絡單</b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title="">
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-hover" id="businessConnectionTab">
                                <thead id="businessConnectionThead">
                                    <tr class="active">
                                        <th class="auto-style2" colspan="4">種類<select class="form-control getMCOTFListFuc" id="CF_ITem" title="Kind">
                                            <option value="">請選擇種類</option>
                                        </select>
                                        </th>
                                        <th class="auto-style1" colspan="4">狀態
                                            <select class="form-control" id="F_Status">
                                                <option value="0">不限</option>
                                                <option value="1" selected>處理中</option>
                                                <option value="3">已完成</option>
                                                <option value="2">處理失敗</option>
                                            </select>
                                        </th>
                                        <th class="auto-style1" colspan="3">
                                            <input type="text" name="message" placeholder="查尋關鍵字..." class="form-control" id="keyWord">
                                        </th>
                                        <th class="auto-style1" colspan="1">
                                            <span class="input-group-btn marginLeft">
                                                <button type="button" class="btn btn-info btn-flat" id="search">查詢</button>
                                            </span>
                                        </th>
                                    </tr>
                                    <tr class="bgBlue">
                                        <th class="auto-style3" style="text-align: center;">單號</th>
                                        <th class="" style="width: 4%; text-align: center;">件別</th>
                                        <th class="" style="width: 6%; text-align: center;">燈號</th>
                                        <th class="" style="width: 15%; text-align: center;">聯絡單種類</th>
                                        <th class="" style="width: 7%; text-align: center;">分析師</th>
                                        <th class="" style="width: 10%; text-align: center;">會員姓名</th>
                                        <th class="" style="width: 12%; text-align: center;">提案人</th>
                                        <th class="" style="width: 12%; text-align: center;">提案日期</th>
                                        <th class="" style="width: 10%; text-align: center;">狀態</th>
                                        <th class="" style="width: 18%; text-align: center;">簽核狀態</th>
                                        <th class="" style="width: 2%; text-align: center;">細</th>
                                        <th class="" style="width: 2%; text-align: center;">刪</th>
                                    </tr>
                                </thead>
                                <tbody id="MPMCOTFData">
                                </tbody>
                            </table>
                            <div style="text-align: center">
                                <div id="pageBar" style="margin: 0 auto;"></div>

                            </div>

                        </div>
                        <!--/.box-body-->

                    </div>
                    <!--/.box-->

                </div>
            </div>
            <!-- /.row (main row) -->

        </section>
        <!-- /.content -->

    </div>
    <script src="<%=getRelativePath()%>js/MasterPage.js" type="text/javascript"></script>
    <script src="<%=getRelativePath()%>js/pageList/businessConnectionPageList.js" type="text/javascript"></script>
    <script>
        var MPMCOTFHandlerUrl_G = "MPMCOTFHandler.ashx";
        //var CustomerManageHandlerUrl_G = "/wealthManage/customerManage/MMBER/customerManageHandler.ashx";
        var MPMCOTFHListJson_G = undefined;
        //現在頁數
        var NowPage_G = 1;
        //總頁數
        var TotalPage_G = 0;
        //每頁資料筆數
        var CountPerPage_G = 30;
        var MENU_no_G = "<%=getMENU_no()%>";
        var U_Num_M = "<%=getU_Num()%>";
        //使用者公司代號
        var ComID_G = "<%=getComID()%>";
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
        <%--var CustomerDetailMENU_no_G = "<%=getCustomerDetailMENU_no()%>";--%>
        var MPMCOTFHMENU_no_G = "<%=getMPMCOTFHMENU_no()%>";
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
        var makeHtml = function () {
            //alert('取得資料!!');
            $("#MPMCOTFData").empty();
            if (MPMCOTFHListJson_G.length != 0) {
                var sb = new string_M.StringBuilder();
                var n = 0;
                var startCount = (NowPage_G - 1) * 30 + 1;
                var endCount = 30 * NowPage_G;
                var isMember = false;
                //businessConnectionListJson_G
                $.each(MPMCOTFHListJson_G, function (i, v) {
                    n += 1;
                    if (n >= startCount && n <= endCount) {
                        sb.append("<tr>");
                        sb.append("<td class='text-center'>");
                        sb.append(i + 1);//單號
                        sb.append("</td>");
                        sb.append("<td class='text-center'>");
                        sb.append(v.ObjName);//件別
                        sb.append("</td>");
                        sb.append("<td class='text-center'>");
                        temp = v.Light_Status;//燈號
                        //../../../img/
                        //sb.append("<td class='text-center' width='3' height='3' style='background-color:");
                        //sb.append("<span><img src='\\..\\..\\..\\img\\icon\\Green_Light.png' width=15 height=15>");
                        if (temp == "紅燈") {
                            //    sb.append("<span>");
                            sb.append("<span><img src='\\..\\..\\..\\img\\icon\\Green_Light.png' width=15 height=15>");
                            //        sb.append("<span>");
                            //    sb.append(temp);
                        } else if (temp == "黃燈") {
                            //    //sb.append("<span class='colorYellow'>");
                            //    sb.append("<span>");
                            sb.append("<span><img src='\\..\\..\\..\\img\\icon\\Green_Light.png' width=15 height=15>");
                            //    sb.append("<span>");
                            //    sb.append(temp);
                        } else {
                            sb.append("<span><img src='\\..\\..\\..\\img\\icon\\Green_Light.png' width=15 height=15>");
                            //    sb.append("<span>");
                            //    sb.append(temp);
                        }
                        if (temp == "紅燈") {
                            sb.append("red");
                        } else if (temp == "黃燈") {
                            sb.append("Yellow");
                        } else {
                            // sb.append("Green");
                        }
                        sb.append("</span>");

                        sb.append("</td>");
                        sb.append("<td class='text-center'>");
                        sb.append(v.Contact_Name);//聯絡單種類
                        sb.append("</td>");
                        sb.append("<td class='text-center'>");
                        sb.append(v.MC_Name);//分析師
                        sb.append("</td>");
                        sb.append("<td class='text-center'>");
                        sb.append("<a class='BlueLink10 qPer' href='/wealthManage/customerManage/MMBER/customerDetail.aspx?M_ID=");
                        sb.append(v.M_ID);//分析師M_ID
                        sb.append("' target='_blank'>");
                        sb.append(v.Name);//會員姓名                                                   
                        sb.append("</td>");
                        //sb.append("</th><th class='text-center'>");
                        //sb.append("<a class='BlueLink10 qPer' href='customerDetail.aspx?M_ID=");
                        //sb.append(dataArr[i].M_ID);//分析師M_ID
                        //sb.append("' target='_blank'>");
                        //sb.append(dataArr[i].M_Name);
                        //sb.append("</a></th><th class='text-center'>");
                        ////if (v.M_Sax == "M") {
                        ////    sb.append("先生");
                        ////} else {
                        ////    sb.append("小姐");
                        ////}
                        //sb.append("</th><th class='text-center'>");
                        sb.append("<td class='text-center'>");
                        sb.append(v.Propser);//提案人(部門名稱+提案人姓名)
                        sb.append("<br />");
                        //sb.append(dataArr[i].Date);//提案日期
                        sb.append("</td>");
                        sb.append("<td class='text-center'>");
                        sb.append(v.Date);//提案日期
                        sb.append("</td>");
                        sb.append("<td class='text-center'>");
                        sb.append(v.F_Status);//狀態
                        //sb.append("<FONT COLOR=GRAY> 處理中w</FONT>")
                        sb.append("</td>");
                        sb.append("<td class='textAlignLeft'>單:");
                        sb.append(v.U_LeaderName);
                        sb.append(" - ");
                        sb.append(v.U_LeaderStatus);
                        sb.append("<br />行:");
                        sb.append(v.EX_Name);
                        sb.append(" - ");
                        sb.append(v.EX_Status);
                        sb.append("<br />主:");
                        sb.append(v.EX_LeaderName);
                        sb.append(" - ");
                        sb.append(v.EX_LeaderStatus);
                        sb.append("</td>");
                        sb.append("<td class='text-center'><a class='qPer' href='/wealthManage/businessConnection/MPMCOTF/MPMCOTF_detail.aspx?f_id=");
                        sb.append(v.f_id);//這裡要再做修改!!!!!!(20230320進度)
                        sb.append("&M_ID=")
                        sb.append(v.M_ID);
                        sb.append("'>細999</td>");
                        //20230413修改這裡!!!!!!!!
                        // //20230413修改這邊!!!
                        //sb.append("<td class='text-center'><a class='delPer'  href='#' class='deleteCustomerData' f_id='");
                        /*
                         * sb.append("<th class='text-center'><a href='#' class='deleteCustomerData delPer' MID='");
                                    sb.append(v.M_ID);
                                    sb.append("'>刪</a></th>");
                         * 
                         * 
                         */
                        sb.append("<td class='text-center'><a href='#' class='deleteCustomerData delPer' F_id='");
                        sb.append(v.f_id);
                        sb.append("'>刪33333</a></th>");
                        sb.append("</td>");
                        sb.append("</tr>");
                    }
                });
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
                TotalPage_G = getTotalPage(n);
                append_M("#MPMCOTFData", sb.toString());
                //$("#MPMCOTFData").append(sb.toString());
                //onClick_M(".deleteCustomerData", function () {
                //    alert("按下刪除!!");
                //    var f_id = $(this).attr("f_id");
                //    var r = confirm("刪除後資料將無法恢復，確定刪除?");
                //    console.log(r);
                //    if (r == true) {
                //        deleteMPMCOTFDataFuc(f_id);
                //        startThisPage();
                //    }

                //});
               
                $(".deleteCustomerData").on("click", function () {
                    alert('Click Delete!!')
                    var f_id = $(this).attr("f_id");
                    var r = confirm("刪除後資料將無法恢復，確定刪除?");
                    console.log(r);
                    if (r == true) {
                        deleteMPMCOTFData(f_id);
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
        //刪除顧客資料
        var deleteMCMCASHData = function (ca_id) {
            alert("刪除資料" + back);
            var data = "ca_id=" + ca_id + "&action=deleteMCMCASHData";
            var success = function (back) {
                alert("刪除資料" + back);
                searchCustomerData();

            };
            //alert('Call CustomerManageHandlerUrl_G1');
            ajax_M(CustomerManageHandlerUrl_G, data, success);
        };
        var deleteMPMCOTFDataFuc = function () {
            //alert("按下刪除!!!");
            var f_id = attr_M(this, "f_id");
            var r = confirm("刪除後資料將無法恢復，確定刪除?");
            if (r == true) {
                //var data = "M_ID=" + mid + "&action=deleteCustomerData";
                var data = "f_id=" + f_id + "&action=deleteMPMCOTFData";
                var success = function (back) {
                    Log_M("deleteCustomerData back=" + back);
                    location.reload();
                };
                ajax_M(MPMCOTFHandlerUrl_G, data, success);
            }
        };
        var deleteData = function () {
            alert("按下刪除!!!");
            var deleteCheck = confirm("確定刪除?");
            var id = attr_M(this, "id");
            if (deleteCheck) {
                var data = "action=deleteData" + "&id=" + id;
                var success = function (back) {
                    if (back == "成功") {
                        getIdCheckList()
                        alert("資料異動成功");
                    }
                };
                var error = function (e) { Log_M("deleteData error=" + e); unBlockUI_M(); };
                ajax_M(idCheckHandlerUrl_G, data, success, error);
            }
        };
        //刪除業務聯絡單資料
        var deleteCustomerData = function (f_id) {
            alert('刪除業務聯絡單資料');
            var data = "f_id=" + f_id + "&action=deleteCustomerData";
            var success = function (back) {
                alert("刪除資料" + back);
                searchSRMVENUData();

            };
            //alert('Call CustomerManageHandlerUrl_G1');
            ajax_M(CustomerManageHandlerUrl_G, data, success);
        };
        var deleteCustomerDataFuc = function () {
            alert("按下刪除!!!");
            var f_id = attr_M(this, "f_id");
            var r = confirm("刪除後資料將無法恢復，確定刪除?");
            if (r == true) {
                //var data = "M_ID=" + mid + "&action=deleteCustomerData";
                var data = "f_id=" + f_id + "&action=deleteMPMCOTFData";
                var success = function (back) {
                    Log_M("deleteCustomerData back=" + back);
                    location.reload();
                };
                ajax_M(MPMCOTFHandlerUrl_G, data, success);
            }
        };
        var afterSuccessFuc = function () {
            onChange_M("#MP", function () {
                var MP_Type = val_M("#MP");//選到的分析師
                //alert(MP_Type)
                $Common.MITEM.getMVMEB08ListHtmlTagOption(CommonHandlerUrl_M, "#M_Item", "getMVMEB08List", MP_Type, "option");
            });
        };
        var getMid = function () {
            getMFUNTreportData
            var M_id = attr_M(this, "M_id")
            location.href = "/wealthManage/bussiessConnection/MPMCOTF/MPMCOTF_detail.aspx?M_ID=" + M_id + "&MENU_no=" + CustomerDetailMENU_no_G + "&ERPcustomerWebPayMENU_no=" + MENU_no_G;
        };
        //取得業聯單列表
        var getBusinessConnectionList = function () {
            alert('取得業聯單列表(含條件!!)');
            var CF_ITem = val_M("#CF_ITem");//所選到的種類
            //alert(CF_ITem);
            var F_Status = val_M("#F_Status");//目前的聯絡單狀態
            //alert(F_Status);
            //alert("目前聯絡單選取狀態:" + F_Status);
            var keyWord = val_M("#keyWord");//所輸入的關鍵字條件
            //alert(keyWord);
            var data = "CF_ITem=" + CF_ITem + "&F_Status=" + F_Status + "&keyWord=" + keyWord + "&U_MDEP=" + U_MDEP_M + "&U_Num=" + U_Num_M + "&action=getBusinessConnectionList";
            var success = function (back) {
                var json = jsonParse_M(back);
                MPMCOTFHListJson_G = jsonParse_M(back);
                makeHtml();
                $.each(json, function (i, v) {
                    $.each(emplistJson_M, function (ii, vv) {
                        if (v.MP_ID == vv.U_Num) {
                            json[i].MP_IDName = vv.empName;
                        }
                        if (v.add_user == vv.U_Num) {
                            json[i].add_userName = vv.empName;
                            json[i].addUserComIDName = (vv.ComLand.split('-'))[1];
                        }
                    });
                });
                //製作業聯單table內容
                //30(1頁顯示30筆資料)
                /*$businessConnectionPageList.Table.makeTbody("#businessConnectionTb", json, 30, "#pageBar", deleteMPMCOTFDataFuc, getMid);*/
                //MPMCOTFData
                $businessConnectionPageList.Table.makeTbody("#MPMCOTFData", json, 30, "#pageBar", deleteMPMCOTFDataFuc, getMid);
            };
            ajax_M(MPMCOTFHandlerUrl_G, data, success);
        };

        //進行頁面處理===============================================start
        var startThisPage = function () {
            //getCustomerDetailAnalyst
            //
            //
            $Common.MITEM.getCustomerDetailAnalyst(CommonHandlerUrl_M, "abcD_MP", "GetAnalyst", "option", ComID_G, afterSuccessFuc);

            //取得種類列表HtmlTagOption列表
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getMCOTFListFuc", "MCOTF", "option");



            //製作table表頭
            //var itemNameArr = ["單號", "件別", "燈號", "聯絡單種類", "分析師", "會員姓名", "提案人", "提案日期", "狀態", "簽核狀態", "細", "刪"];
            //var itemClassNameArr = ["textAlignCenter", "textAlignCenter", "textAlignCenter", "textAlignCenter", "textAlignCenter", "textAlignCenter", "textAlignCenter", "textAlignCenter", "textAlignCenter", "textAlignCenter", "textAlignCenter", "textAlignCenter"];
            //$businessConnectionPageList.Table.makeThead("#businessConnectionThead", emptyValue_M, "bgBlue", itemNameArr, itemClassNameArr);
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getMCOTFListFuc", "CF_ITem", "option");
            //取得業聯單列表
            //alert('取得業聯單列表!!!');
            getBusinessConnectionList();
            onClick_M("#search", getBusinessConnectionList);
            //設定權限
            setPermission_M();
            onClick_M(".deleteMPMCOTFData", function () {
                alert('按下刪除!');
                var f_id = $(this).attr("f_id");
                var r = confirm("刪除後資料將無法恢復，確定刪除?");
                console.log(r);
                if (r == true) {
                    deleteCustomerData2(f_id);
                }

            });
        };
        //進行頁面處理===============================================end
        var deleteCustomerData2 = function (MID) {
            //alert("刪除資料" + MID);
            var data = "M_ID=" + MID + "&action=deleteCustomerData";
            var success = function (back) {
                alert("刪除資料" + back);
                searchSRMVENUData();

            };
            //alert('Call CustomerManageHandlerUrl_G1');
            ajax_M(CustomerManageHandlerUrl_G, data, success);
        };
        //進行頁面處理===============================================end
        var deleteMPMCOTFData = function (f_id) {
            alert("刪除業務聯絡單資料" + f_id);
            var data = "f_id=" + f_id + "&action=deleteMPMCOTFData";
            var success = function (back) {
                alert("刪除資料" + back);
                searchSRMVENUData();

            };
            //alert('Call CustomerManageHandlerUrl_G1');
            ajax_M(CustomerManageHandlerUrl_G, data, success);
        };

        //刪除顧客資料
        var deleteCustomerData = function (f_id) {
            alert("刪除資料");
            var data = "f_id=" + f_id + "&action=deleteCustomerData";
            var success = function (back) {
                alert("刪除資料" + back);
                searchSRMVENUData();

            };
            //alert('Call CustomerManageHandlerUrl_G1');
            ajax_M(CustomerManageHandlerUrl_G, data, success);
        };




        $(function () {
            //取得種類列表HtmlTagOption列表
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getMCOTFListFuc", "MCOTF", "option");
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getMCOTFListFuc", "CF_ITem", "option");
            $Common.MITEM.getBusinessConnectionList(CommonHandlerUrl_M, ".getMCOTFListFuc", "CF_ITem", "option");
            //查看使用者權限
            getUserAuthority_M(startThisPage);
            onClick_M(".deleteMPMCOTFData", function () {
                alert('按下刪除!');
                var f_id = $(this).attr("f_id");
                var r = confirm("刪除後資料將無法恢復，確定刪除?");
                console.log(r);
                if (r == true) {
                    deleteCustomerData2(f_id);
                }

            });
            startThisPage();
        })
    </script>
</asp:Content>

