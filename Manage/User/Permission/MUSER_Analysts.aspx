<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MUSER_Analysts.aspx.cs" Inherits="Manage_User_MUSER_Analysts" %>

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
                            <h1 class="box-title"><b>ERP &gt;  員工資料維護作業-分析師產品權限</b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <%--<input type="submit" aligh="right" name="submit" class="btn" value="關閉此畫面,返回員工資料維護作業" onclick="Return()">--%>
                            <table width="100%" border="0" cellspacing="0" cellpadding="1">
                                
                                <thead id="">
                                    
                                         
                                    <tr class="bgBlue">
                                        <th class="" style="width: 10%; text-align: center;">序</th>
                                        <th class="" style="width: 30%; text-align: center;">產品名稱</th>
                                        <th class="" style="width: 20%; text-align: center;">代碼</th>
                                        <th class="" style="width: 20%; text-align: center;">排序</th>
                                        <th class="" style="width: 10%; text-align: center;">修改</th>
                                        <th class="" style="width: 10%; text-align: center;">刪除</th>
                                    </tr>

                                </thead>
                                <tbody id="MUSERAnalystsData">
                                </tbody>
                            </table>
                            <div style="text-align: center">
                                                            <input type="submit" aligh="right" name="submit" class="btn" value="關閉此畫面,返回員工資料維護作業" onclick="Return()">
                            </div>
                            <div style="text-align: center">
                                <div id="pageBar" style="margin: 0 auto;"></div>
                            </div>

                            <div id="editDataAnalystsDialog" class="form-control startHide" title="修改資料">
                                <form class="">
                                    <p>
                                        產品名稱：<input class="form-control" id="ProductName" />
                                        <input type="hidden" id="auto_id" />
                                    </p>
                                    <p>代碼：<input class="form-control" id="Code" /></></p>
                                    <p>排序：<input class="form-control" id="Sort" /></p>


                                    <div style="text-align: center" class="">
                                        <input type="button" class="btn btn-primary editPer" id="editDataAnalystsData" value="修改資料" />
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </section>
    </div>
    <script src="<%=getRelativePath()%>js/pageList/MUSER_Analysts.js" type="text/javascript"></script>
    <script>
        var MuserAnalystsHandlerUrl_G = "/Manage/User/MUSERHandler.ashx";
        var MuserAnalystsDataJson_G = null;
        var U_Num = "<%=getU_Num()%>";

        var openEditDataGiftDialog = function () {
            $('#editDataAnalystsDialog').dialog('open');
            //alert('分析師產品修改');
            //
            val_M("#auto_id", attr_M(this, "auto_id"));
            val_M("#ProductName", attr_M(this, "ProductName"));
            //alert(attr_M(this, "auto_id"));
            //alert(attr_M(this, "ProductName"));
            val_M("#Code", attr_M(this, "Code"));
            val_M("#Sort", attr_M(this, "Sort"));
            
            // $('#editDataAnalystsDialog').dialog('open');

        };


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

        var Return = function () {
            //this.close();
            window.close();
        }
        var editDataAnalystsData = function () {
            //alert('修改資料!!');
            //var goNext = confirm("刪除後資料將無法恢復，確定刪除?");
            //if (goNext) {
                var ProductName = val_M("#ProductName");
                var auto_id = val_M("#auto_id");
                var Code = val_M("#Code");
                var Sort = val_M("#Sort");
               
                var data = "action=SaveEditDataAnalystsData" + "&auto_id=" + auto_id + "&ProductName=" + ProductName + "&Code=" + Code + "&Sort=" + Sort;
                var success = function (back) {
                    if (back = "成功") {
                        alert("異動資料成功!");
                        //getDataGiftTable();
                        $('#editMINVODataDialog').dialog('close');
                        startThisPage();
                        //$('#editDataAnalystsDialog').dialog('close');
                    }
                };
                var error = function (e) { Log_M("editData error=" + e); unBlockUI_M(); };
                ajax_M(MuserAnalystsHandlerUrl_G, data, success, error);
           // }
        };
        //}
        var makeHtml = function () {
            $("#MUSERAnalystsData").empty();
            if (MuserAnalystsDataJson_G.length != 0) {
                var sb = new string_M.StringBuilder();
                var n = 0;
                var startCount = (NowPage_G - 1) * 30 + 1;
                var endCount = 30 * NowPage_G;
                var isMember = false;
                $.each(MuserAnalystsDataJson_G, function (i, v) {
                    n += 1;
                    if (n >= startCount && n <= endCount) {
                        sb.append("<tr><th class='text-center'>");
                        //sb.append(v.auto_id);
                        sb.append(n)

                        sb.append("</th><th class='text-center'>");
                        sb.append(v.ProductName);
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.Code);
                        //sb.append("</th><th class='text-center'>");
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.Sort);

                        sb.append("</th>");
                        //sb.append("<th class='text-center'><a href='#' class='editMuserAnalystsData delPer' MID='");
                        //sb.append("<td class='textAlignCenter'><a href='#' class='openDiv'  thisId='");
                        //sb.append("<td class='textAlignCenter'><a target='_blank' href='/Manage/User/Permission/MUSER_AnalystsEDIT.aspx?ProductName=");
                        sb.append("<td class='textAlignCenter'><a href='javascript: void(0)' class='editData editPer' ProductName='");
                        sb.append(v.ProductName);
                        sb.append("' auto_id='");
                        sb.append(v.auto_id);
                        sb.append("' Code='");
                        sb.append(v.Code);
                        sb.append("' Sort='");
                        sb.append(v.Sort);
                        sb.append("'>修</a>")
                        sb.append("</th>");
                        sb.append("<th class='text-center'><a href='#' class='deleteMuserAnalystsData delPer' MID='");
                        sb.append(v.ProductName);
                        sb.append("'>刪</a></th>");
                        sb.append("</tr>");
                    }
                });


                //TotalPage_G = getTotalPage(n);
                append_M("#MUSERAnalystsData", sb.toString());
                $(".editData").on("click", openEditDataGiftDialog);
                //alert('append_M("#customerData", sb.toString());');
                //append_M("#MUSERAnalystsData", sb.toString());
                //$("#MUSERAnalystsData").append(sb.toString());
                onClick_M(".deleteMuserAnalystsData", function () {
                    var MID = $(this).attr("MID");
                    var r = confirm("刪除後資料將無法恢復，確定刪除?");
                    console.log(r);
                    if (r == true) {
                        deleteCustomerData(MID);
                    }

                });
                $(".deleteCustomerData").on("click", function () {
                    var MID = $(this).attr("MID");
                    var r = confirm("刪除後資料將無法恢復，確定刪除?");
                    console.log(r);
                    if (r == true) {
                        deleteCustomerData(MID);
                    }

                });
            };
            //製作頁數列表
            getPageList();

            //頁面解鎖
            unBlockUI_M();
        };
        var IP_G = "<%=getIP()%>";

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
        //var MFUNTreportHandlerUrl_G = "/Manage/User/Permission/MFUNT_reportHandler";
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
            ajax_M(MuserAnalystsHandlerUrl_G, data, success, error);
        };
        var startThisPage = function () {
            //alert('Start!');
            var data = "action=getAnalystsData" + "&U_Num=" + U_Num;
            var success = function (back) {
                var json = jsonParse_M(back);
                MuserAnalystsDataJson_G = json;//取回的資料內容(MFUNTreportDataJson_G)
                if (back != "成功") {
                    makeHtml();
                }
            };
            $('#editDataAnalystsDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 380,
                height: 680
            });
            onClick_M(".editData", editDataAnalystsData);
            onClick_M("#editDataAnalystsData", editDataAnalystsData);
            var error = function (e) { Log_M("deleteMailData error=" + e); unBlockUI_M(); };
            ajax_M(MuserAnalystsHandlerUrl_G, data, success, error);//<===

        };
        //頁面載入後自動執行
        $(function () {
            //alert('Start!!');
            startThisPage();
            //查看使用者權限
            //getUserAuthority_M(startThisPage);
        })



    </script>
</asp:Content>

