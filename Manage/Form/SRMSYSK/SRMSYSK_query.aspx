<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SRMSYSK_query.aspx.cs" Inherits="Manage_TKMMBER_MMBER_query" %>

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

            <div class="row">
                <div class="col-md-12">
                    <div class="box box-danger">
                        <div class="box-header">
                            <i class="fa fa-list-alt"></i>
                            <h1 class="box-title"><b>ERP &gt;  行政部 &gt;</b> <b>留倉表發佈管理</b></h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title="">
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <%--留倉表資料列表START--%>
                        <div id="SRMSYSK_Main" class="box-body">
                            <!-- <table class="table table-bordered table-condensed"> -->
                            <table class="table table-hover" id="customerDataTab">
                                <thead>
                                    <tr class="active">
                                        <th>
                                            <div class="auto-style3">
                                                分析師:&nbsp;<select id="smdM_MP" class="form-control messagePublic ssmRequired smmRequired" fieldname="分析師" name="D1">
                                                </select>
                                            </div>
                                        </th>
                                        <th class="" colspan="1">
                                            <button type="button" class="btn btn-info btn-flat searchSRMVMEBDataFuc" id="searchSRMVMEBDataFuc">查詢</button>
                                        </th>
                                        <th class="" colspan="1"></th>
                                        <th class="" colspan="1"></th>
                                        <th class="" colspan="1">
                                            <%--<button type="button" class="btn btn-info btn-flat searchSRMVMEBDataFuc qPer" id="searchSRMVMEBDataFuc2">新增留倉表</button>--%>
                                            <button type="button" class="btn btn-info btn-flat" id="search">新增留倉表</button>
                                        </th>

                                    </tr>

                                    <tr class="bgBlue">
                                        <th class="" style="width: 10%; text-align: center;">項次</th>
                                        <th class="" style="width: 25%; text-align: center;">分析師</th>
                                        <th class="" style="width: 20%; text-align: center;">檔案</th>
                                        <th class="" style="width: 25%; text-align: center;">日期</th>
                                        <th class="" style="width: 20%; text-align: center;">刪除</th>
                                    </tr>
                                </thead>
                                <tbody id="SRMSYSKData">
                                </tbody>

                            </table>
                            <div style="text-align: center">
                                <div id="pageBar" style="margin: 0 auto;"></div>
                            </div>

                        </div>
                        <%--留倉表資料列表END--%>

                        <%--新增留倉表START--%>
                        <div id="SRMSYSK_New" class="box-body">
                            <div id="addSRMSYSKDiv" class="divBorder startHide">
                                <div id="addSRMSYSKTitle" class="marginLeftRight10 titleBottomBorder">
                                    <h3>留倉表資料-新增</h3>
                                    <div class="btn-group" data-toggle="btn-toggle" style="margin-right: 0 auto; float: right;">
                                        <button id="" type="button" class="btn closeBtn btn-flat closeSecondaryDiv" closedivid="#addMailDiv">X</button>
                                    </div>
                                </div>
                                <table class="table table-hover" id="addMailTab">
                                    <tbody id="addSRMSYSKDataTb">
                                        <tr>
                                            <td class="textAlignCenter"><span class="colorRed">*</span>分析師</td>
                                            <td>
                                                <select id="abcMP_ID" class="form-control  getComIDlistHtmlTagOption comMdepChangeFuc" itemname="分析師"></select>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td class="textAlignCenter"><span class="colorRed">*</span>附件</td>
                                            <td>
                                                <form runat="server">
                                                    <asp:FileUpload type="file" ID="File1" class="form-control uploadFileCheck upLoadGroup" ClientIDMode="Static" runat="server" />
                                                </form>
                                            </td>
                                        </tr>



                                        <tr>
                                            <td class="textAlignCenter" colspan="2">
                                                <button type="button" class="btn btn-info btn-flat" id="addSRMSYSKData">新增</button></td>

                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                        </div>
                        <%--新增留倉表END--%>
                        <!--/.box-body-->

                    </div>
                    <!--/.box-->

                </div>
            </div>
            <!-- /.row (main row) -->

        </section>
        <!-- /.content -->

    </div>

    <script>
        var SRMSYSKHandlerUrl_G = "SRMSYSKHandler.ashx";
        var SRMSYSKDataJson_G = 0;
        var MENU_no_G = "<%=getMENU_no()%>";
        var IP_G = "<%=getIP()%>";
        //現在頁數
        var NowPage_G = 1;
        //總頁數
        var TotalPage_G = 0;
        //每頁資料筆數
        var CountPerPage_G = 30;
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
                //alert('makeHtml!!');
                makeHtml();
            }
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
            //append_M("#pageBar", sb.toString());
            //empty_M("#pageNum");
            //$("#pageNum").empty();
            //append_M("#pageNum", NowPage_G + "/" + TotalPage_G);
            //$("#pageNum").append(NowPage_G + "/" + TotalPage_G);
            //onClick_M(".pageNum", pageNumClick);
            //$(".pageNum").on("click", pageNumClick);
            //20220520
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

        //刪除留倉資料
        var deleteSRMSYSKData = function (MF_ID) {
            var data = "MF_ID=" + MF_ID + "&action=deleteSRMSYSKData";
            var success = function (back) {
                alert("刪除資料" + back);
                //searchSRMVENUData();
                searchSRMSYSKDataFuc();

            };
            //alert('Call CustomerManageHandlerUrl_G1');
            ajax_M(SRMSYSKHandlerUrl_G, data, success);
        };

        var upload = function upload(id, fileNum) {
            var formData = new FormData();
            var totalFiles = document.getElementById(id).files.length;
            for (var i = 0; i < totalFiles; i++) {
                var file = document.getElementById(id).files[i];//取得上傳檔案的資訊
                formData.append("id", id);
                formData.append("File_num", fileNum);
                formData.append("File_name", file.name);
                formData.append("File_Folder", "MSYSK");
                formData.append("add_User", U_Num_M);
                formData.append("add_ip", IP_M);
                formData.append(id, file);
            }
            $.ajax({
                type: 'post',
                url: '../../../uploadfile/uploadFileHandler.ashx',
                data: formData,
                dataType: 'json',
                contentType: false,
                processData: false,
                success: function (response) {
                    //alert('檔案上傳成功!!');
                },
                error: function (error) {
                    //alert('檔案上傳失敗!!');
                }
            });
        };
        var FileName;
        var uploadFileCheck = function () {
            //alert('upload!!!!!!!!!!!!!!!!!!!');
            var fileSize = this.files[0].size
            if (fileSize > 3670016) {
                $(this).val("");
                alert("上傳的檔案不得超過 3MB！");
            } else {
                //取得該filebox中的檔案資料：
                var id = attr_M(this, "id");
                var files = document.getElementById(id).files;
                var fileData = new FormData();
                FileName = files[0].name;
                fileData.append(files[0].name, files[0]);
                alert("紀錄上傳資訊！");
                ajax_M(UploadFileHandlerUrl_M, fileData, success, Error);

            }
        };
        //新增留倉資料(20230310要修改的地方)
        var addSRMSYSKData = function () {
            //alert('新增動作!!');
            var file1 = undefined;
            blockUI_M();
            var abcMP_ID = val_M("#abcMP_ID");//分析師
            var FileTitle = "";//檔案名稱
            var adver_content = val_M("#adver_content_input");//內文
            var ComID = ComID_M;
            var data = "MP=" + abcMP_ID //找出分析師名稱、編號及公司別
                + "&FileName=" + FileName
                /*+ "&MP_Com=" + abcMP_ID*/
                //+ "&MF_ID=" + abcMP_ID U_Num_M 
                + "&add_user=" + U_Num_M
                + "&add_IP=" + IP_G
                + "&action=addSRMSYSKData";
            var success = function (back) {
                //alert('Upload!!');
                file1 = document.getElementById("File1").files;
                //var file2 = undefined;
                //var file3 = undefined;
                if (!isEmptyStr(back)) {
                    //file1 = document.getElementById("File1").files;
                    file1 = document.getElementById("File1").files;
                    //FileUpload1
                    if (file1.length != 0) {
                        upload("File1", back);
                        //upload(file1, back);
                        //alert("File1 Upload ok!");
                    }
                    //
                    //file2 = document.getElementById("File2").files;
                    //if (file2.length != 0) {
                    //    upload("File2", back);
                    //    //alert("File2 Upload ok!");
                    //}
                    ////
                    //file3 = document.getElementById("File3").files;
                    //if (file3.length != 0) {
                    //    upload("File3", back);
                    //    //alert("File3 Upload ok!");
                    //}
                }
                alert("新增留倉表資料成功");
                hide_M("#addSRMSYSKDiv");
                show_M("#SRMSYSK_Main");
                unBlockUI_M();
                //show_M("#noticeBoardDataTab");
                location.reload();//重新載入網頁
                //startThisPage();
            };
            var error = function (e) { Log_M("addSRMSYSKData error=" + e); unBlockUI_M(); };
            ajax_M(SRMSYSKHandlerUrl_G, data, success, error);
            //startThisPage();
        };


        //取得資料!!!!(20220512)
        var makeHtml = function () {
            //alert('取得VIP會員資料!!');
            $("#SRMSYSKData").empty();
            var sb = new string_M.StringBuilder();
            var n = 0;
            var startCount = (NowPage_G - 1) * 30 + 1;
            var endCount = 30 * NowPage_G;
            var isMember = false;
            //
            var Url_1 = '<a class=bluelink10 href="';
            var Url_2 = '../../../UploadFile/msysk/';

            var html = Url_1 + Url_2;
            $.each(SRMSYSKDataJson_G, function (i, v) {
                n += 1;
                //<A class=bluelink10 href=\"../ ../../UploadFile/msysk/20220518134517_6387_8106.xlsxtarget = 20220518134517_7215 > 白易弘副總留倉表111.05.18.xlsx</A>
                if (n >= startCount && n <= endCount) {
                    sb.append("<tr><th class='text-center'>");
                    sb.append(n);//項次
                    sb.append("</th><th class='text-center'>");
                    sb.append(v.U_Name);//分析師
                    //sb.append("</th><th class='text-center'>");
                    sb.append("</th ><th class='text-center'>");
                    //..//../../ UploadFile / msysk /")
                    //sb.append(Url_1 + Url_2);
                    //sb.append(v.File_Title)//檔案
                    sb.append("<a class=bluelink10 href=../../../UploadFile/msysk/");
                    //sb.append(v.File_Name);//File_Name
                    //sb.append("\" target = ");
                    sb.append(v.File_num);
                    sb.append("> ");
                    sb.append(v.File_Title);//File_Title
                    sb.append("</a >");
                    sb.append("</th><th class='text-center'>");
                    sb.append(v.add_date);//日期
                    sb.append("<th class='text-center'><a href='#' class='deleteSRMSYSKData delPer' MF_ID='");
                    sb.append(v.MF_ID);
                    sb.append("'>刪</a></th>");
                    sb.append("</tr>");
                    //sb.append(v.Add_Date);
                    //sb.append("<th class='text-center'><a href='#' class='deleteCustomerData delPer' MID='");
                    //sb.append(v.M_ID);
                    //sb.append("'>修</a></th>");
                    //sb.append("<th class='text-center'><a href='#' class='deleteCustomerData delPer' MID='");
                    //sb.append(v.M_ID);
                    //sb.append("'>刪</a></th>");
                    //sb.append("</tr>");
                }
            });
            TotalPage_G = getTotalPage(n);
            append_M("#SRMSYSKData", sb.toString());
            // $("#customerData").append(sb.toString());
            onClick_M(".deleteSRMSYSKData", function () {
                //var MID = $(this).attr("MID");
                var MF_ID = $(this).attr("mf_id");
                var r = confirm("刪除後資料將無法恢復，確定刪除?");
                console.log(r);
                if (r == true) {
                    deleteSRMSYSKData(MF_ID);
                }

            });
            $(".deleteSRMSYSKData").on("click", function () {
                //alert('按下刪除!!!!!');
                var MF_ID = $(this).attr("mf_id");
                var r = confirm("刪除後資料將無法恢復，確定刪除?");
                console.log(r);
                if (r == true) {
                    //alert('!!!!!!按下刪除!!');
                    deleteSRMSYSKData(MF_ID);
                }

            });
            getPageList();

            //頁面解鎖
            unBlockUI_M()
        }
            //製作頁數列表
            ;

        //查詢VIP會員資料維護作業資料==============================================================================start
        var searchSRMSYSKDataFuc = function () {
            //alert('查詢VIP會員資料維護作業資料');
            var Q_Analyst = val_M("#smdM_MP");
            var startDate = val_M("#StartDate");
            var endDate = val_M("#EndDate");
            var doNext = check_M.isEndDateBigThanStartDate(startDate, endDate);
            if (isEmptyStr(startDate) && isEmptyStr(endDate)) {
                doNext = true;
            }
            if (doNext) {
                NowPage_G = 1;
                blockUI_M();
                empty_M("#SRMSYSKData");
                //var keyWord = val_M("#keyWord");
                //var Q_Analyst = val_M("#Q_Analyst") == null ? emptyValue_M : val_M("#Q_Analyst");
                //var Q_Product = val_M("#Q_Product") == null ? emptyValue_M : val_M("#Q_Product");
                //var data = "keyWord=" + keyWord + "&U_MDEP=" + U_MDEP_M + "&U_Num=" + U_Num_M + "&ComID=" + ComID_M + "&Q_Name=" + $("#Q_Name").val() + "&Q_Tel=" + $("#Q_Tel").val() + "&StartDate=" + startDate + "&EndDate=" + endDate + "&Q_Analyst=" + Q_Analyst + "&Q_Grade=" + $("#Q_Grade").val() + "&Q_Member=" + $("#Q_Member").val() + "&Q_Product=" + Q_Product + "&action=searchSRMVMEBData";
                var data = "Q_Analyst="+Q_Analyst+ "&action=searchSRMSYSKData";
                console.log("action=searchSRMVMEBData");//searchSRMVMEBData
                var searchSRMSYSKDataSuccess = function (back) {
                    SRMSYSKDataJson_G = jsonParse_M(back);
                    //alert('makeHtml!!');
                    makeHtml();//<===
                    hide_M("#customerAdvSearchDiv");
                    hide_M("#addSRMSYSKDiv");
                    show_M("#SRMSYSK_Main");

                };
                //alert('Call CustomerManageHandlerUrl_G2');
                ajax_M(SRMSYSKHandlerUrl_G, data, searchSRMSYSKDataSuccess);//<===
            } else {
                alert("請正確選擇建檔日期區間");
                var data = "keyWord=" + "test" + "&action=searchSRMSYSKData";
                var searchSRMSYSKDataSuccess = function (back) {
                    SRMSYSKDataJson_G = jsonParse_M(back);
                    //alert('makeHtml!!');
                    makeHtml();//<===
                    hide_M("#customerAdvSearchDiv");
                    hide_M("#addSRMSYSKDiv");
                    show_M("#SRMSYSK_Main");
                    /*
                     * hide_M("#addSRMSYSKDiv");
                show_M("#SRMSYSK_Main");
                     */
                    //

                };
                //alert('Call CustomerManageHandlerUrl_G2');
                ajax_M(SRMSYSKHandlerUrl_G, data, searchSRMSYSKDataSuccess);//<===
            }

        };
        //查詢客戶資料==============================================================================end


        //開啟進階搜尋視窗========================start
        var openSearchAdvancedWindow = function () {
            show_M("#customerAdvSearchDiv");
            hide_M("#todayContactTab");
            hide_M("#addCustomerDataDiv");
        };
        //開啟進階搜尋視窗========================end


        //關閉所有次級視窗========================start
        var closeSecondaryWindow = function () {
            hide_M("#customerAdvSearchDiv");
            hide_M("#addCustomerDataDiv");
            hide_M("#todayContactTab");
            show_M("#customerDataTab");
            show_M("#pageBar");
        };
        //關閉所有次級視窗========================end

        //打開新增客戶資料視窗========================start
        var openAddCustomerDataWindow = function () {
            hide_M("#customerAdvSearchDiv");
            hide_M("#customerDataTab");
            show_M("#addCustomerDataDiv");
            hide_M("#todayContactTab");
            hide_M("#pageBar");
        };
        //打開新增客戶資料視窗========================end


        //打開今日聯絡事項視窗========================start
        var openTodayContactWindow = function () {
            hide_M("#customerAdvSearchDiv");
            hide_M("#addCustomerDataDiv");
            show_M("#todayContactTab");
        };
        //打開今日聯絡事項視窗========================end


        //取得今日聯絡事項============================================================start
        var getTodayConnectionMatterHtml = function () {
            var data = "U_Num=" + U_Num_M + "&action=getTodayConnectionMatterHtml";
            var getTodayConnectionMatterHtmlSuccess = function (back) {
                $("#getTodayConnectionMatterHtml").append(back.toString());
            };
            //alert('Call CustomerManageHandlerUrl_G3');
            ajax_M(SRMSYSKHandlerUrl_G, data, getTodayConnectionMatterHtmlSuccess);//<===
        };
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
        //var addCustomerData = function () {
        //    var Analysts = $('input[name="Analyst"]');
        //    var PRODTs = $('input[name="PRODT"]');
        //    var MPGOMs = $('input[name="MPGOM"]');
        //    getCheckBoxValueStr(Analysts, "#Analyst");
        //    getCheckBoxValueStr(PRODTs, "#Product");
        //    getCheckBoxValueStr(MPGOMs, "#Program");
        //    //確認欄位資料是否正確
        //    if (checkCol()) {
        //        var OTown = $("#OTown :selected").text() == "請選擇區鄉鎮" ? emptyValue_M : $("#OTown :selected").text();
        //        var HTown = $("#HTown :selected").text() == "請選擇區鄉鎮" ? emptyValue_M : $("#HTown :selected").text();
        //        var data = "M_Name=" + val_M("#M_Name") +
        //            "&M_Sax=" + val_M("#M_Sax") +
        //            "&M_Grade=" + val_M("#M_Grade") +
        //            "&BirthDay_Date=" + val_M("#BirthDay_Date") +
        //            "&MCdata=" + val_M("#MCdata") +
        //            "&MC_Name=" + attr_M("#MCdata :selected", "uName") +
        //            "&MC_COM=" + attr_M("#MCdata :selected", "comid") +
        //            "&OTel_Zone=" + val_M("#OTel_Zone") +
        //            "&OTel=" + val_M("#OTel") +
        //            "&OTel_Sub=" + val_M("#OTel_Sub") +
        //            "&OTel_Zone1=" + val_M("#OTel_Zone1") +
        //            "&OTel1=" + val_M("#OTel1") +
        //            "&OTel_Sub1=" + val_M("#OTel_Sub1") +
        //            "&HTel_Zone=" + val_M("#HTel_Zone") +
        //            "&HTel=" + val_M("#HTel") +
        //            "&HTel_Zone1=" + val_M("#HTel_Zone1") +
        //            "&HTel1=" + val_M("#HTel1") +
        //            "&MTel1=" + val_M("#MTel1") +
        //            "&MTel2=" + val_M("#MTel2") +
        //            "&MTel3=" + val_M("#MTel3") +
        //            "&Fax_Zone=" + val_M("#Fax_Zone") +
        //            "&Fax=" + val_M("#Fax") +
        //            "&Fax_Zone1=" + val_M("#Fax_Zone1") +
        //            "&Fax1=" + val_M("#Fax1") +
        //            "&M_SD=" + val_M("#M_SD") +
        //            "&EMail=" + val_M("#EMail") +
        //            "&OCity=" + val_M("#OCity") +
        //            "&OTown=" + OTown +
        //            "&OZipCode=" + val_M("#OTown") +
        //            "&O_Address=" + val_M("#O_Address") +
        //            "&HCity=" + val_M("#HCity") +
        //            "&HTown=" + HTown +
        //            "&HZipCode=" + val_M("#HTown") +
        //            "&H_Address=" + val_M("#H_Address") +
        //            "&Inv_Money=" + val_M("#Inv_Money") +
        //            "&Analyst=" + val_M("#Analyst") +
        //            "&Product=" + val_M("#Product") +
        //            "&Program=" + val_M("#Program") +
        //            "&M_Note=" + val_M("#M_Note") +
        //            "&Light_Status=" + getLightStatusFromUmdep() +
        //            "&add_ip=" + IP_M +
        //            "&add_user=" + U_Num_M + "&action=addEditCustomerData&addEditType=add";
        //        var addCustomerDataSuccess = function (back) {
        //            alert("新增客戶資料" + back);
        //            searchSRMVMEBData();
        //            val_M(".addCustomerDataInput", emptyValue_M);
        //            val_M(".put02", "02");
        //            val_M("#MCdata", U_Num_M);
        //            val_M("#M_Sax", "M");
        //            hide_M("#addCustomerDataDiv");
        //            show_M("#customerDataTab");
        //        };
        //        Log_M("addCustomerData Ajax data=" + data);
        //        //alert('Call CustomerManageHandlerUrl_G5');
        //        ajax_M(CustoSRMVMEBHandlerUrl_GmerManageHandlerUrl_G, data, addCustomerDataSuccess);//<===
        //    }
        //};
        //新增客戶資料===============================================end

        //var getKeywordList = function () {

        //    var keyWord = val_M("#keyWord");
        //    var data = "keyWord=" + keyWord + "&action=getKeywordList";
        //    Log_M("getKeywordList data=" + data);
        //    var success = function (back) {
        //        Log_M("getKeywordList back=" + back);
        //        var json = jsonParse_M(back);
        //        $(function () {
        //            $("#keyWord").autocomplete({
        //                source: function (request, response) {
        //                    var results = $.ui.autocomplete.filter(json, request.term);
        //                    response(results.slice(0, 10));
        //                },
        //            });
        //        })
        //    };
        //    var error = function (e) { Log_M("getKeywordList error=" + e); unBlockUI_M(); };
        //    //alert('Call CustomerManageHandlerUrl_G6');
        //    ajax_M(SRMSYSKHandlerUrl_G, data, success, error);
        //};
        //按下搜尋按鈕後
        var searchSRMVMEBData = function () {
            alert('按下搜尋按鈕後');
            var Q_Analyst = val_M("#smdM_MP");
            searchSRMSYSKDataFuc();
            //var Q_Analyst = val_M("#smdM_MP") == null ? emptyValue_M : val_M("#smdM_MP");//分析師員工編號
            ////alert(Q_Analyst);
            ////var keyWord = val_M("#customername");//客戶姓名
            ////var startDate = val_M("#StartDate");
            ////var endDate = val_M("#EndDate");
            ////var doNext = check_M.isEndDateBigThanStartDate(startDate, endDate);
            ////if (isEmptyStr(startDate) && isEmptyStr(endDate)) {
            //doNext = true;
            ////}
            //if (doNext) {
            //    NowPage_G = 1;
            //    blockUI_M();
            //    empty_M("#SRMSYSKData");
            //    //var keyWord = val_M("#customername");
            //    //var Q_Analyst = val_M("#smdM_MP") == null ? emptyValue_M : val_M("#smdM_MP");//分析師員工編號
            //    //alert(Q_Analyst);
            //    //var Q_Analyst = val_M("#Q_Analyst") == null ? emptyValue_M : val_M("#Q_Analyst");
            //    //var Q_Product = val_M("#Q_Product") == null ? emptyValue_M : val_M("#Q_Product");
            //    //var data = "keyWord=" + keyWord + "&MP_ID=" + Q_Analyst + "&action=searchSRMSYSKData";
            //    var data = "Q_Analyst=" + Q_Analyst + "&action=searchSRMSYSKData";
            //    console.log("Q_Analyst=" + Q_Analyst + "&action=searchSRMSYSKData");
            //    var searchSRMVMEBDataSuccess = function (back) {
            //        //alert(back);
            //        SRMSYSKDataJson_G = jsonParse_M(back);
            //        //alert('show list2');
            //        makeHtml();//<===
            //        hide_M("#customerAdvSearchDiv");

            //    };
            //    //alert('Call CustomerManageHandlerUrl_G2');
            //    ajax_M(SRMSYSKHandlerUrl_G, data, searchSRMVMEBDataSuccess);//<===
            //} else {
            //    alert("請正確選擇建檔日期區間");
            //}

        };
        var query = function () {
            //alert('留倉表資料-新增!!');
            //addNoticeBoardDiv
            show_M("#addSRMSYSKDiv");
            hide_M("#SRMSYSK_Main");
        };

        var afterSuccessFucForSmd = function () {
            //alert('call afterSuccessFucForSmd');
            onChange_M(".messagePublic", function () {
                var type = val_M("#smdM_MP");
                var sendType = val_M("#smdType");
                var htmlTag = "";
                if (sendType == "single") {
                    htmlTag = "radio";
                    disabledFalse_M("#smdM_TEL");
                    hide_M("#allCheck");
                    $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#smdM_MP", type, htmlTag);
                } else {
                    htmlTag = "checkbox";
                    disabledTrue_M("#smdM_TEL");
                    show_M("#allCheck");
                    $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#smdM_MP", type, htmlTag, getListByViewtag0, emptyValue_M, true);
                }
            });
        };
        var afterSuccessFuc = function (back) {
            //alert('!!!');
        };
        //進行頁面處理===============================================start
        var startThisPage = function () {
            //alert('!!');
            //$Common.MUSER.getAnalystListHtmlTagOptionForAllPowerSendRecord(CommonHandlerUrl_M, "#smdM_MP", ComID_M, U_MDEP_M, U_POSITION_M, U_Leader_M, U_Num_M, afterSuccessFucForSmd);
            searchSRMSYSKDataFuc();
            //$Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "#abcMP_ID", ComID_G, "option", afterSuccessFuc);//取得分析師列表

            $Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "#abcMP_ID", emptyValue_M, "option");
            $Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "#smdM_MP", emptyValue_M, "option");

            //var data = "U_Num=" + U_Num_M + "&action=getSRMSYSKData";
            //var searchSRMVMEBDataSuccess = function (back) {
            //    SRMVMEBDataJson_G = jsonParse_M(back);
            //    makeHtml();
            //    hide_M("#customerAdvSearchDiv");

            //};

            //ajax_M(SRMSYSKHandlerUrl_G, data, searchSRMVMEBDataSuccess);//<===
            //$Common.MUSER.getAnalystListHtmlTagOptionForAllPowerSendRecord(CommonHandlerUrl_M, "#smdM_MP", ComID_M, U_MDEP_M, U_POSITION_M, U_Leader_M, U_Num_M, afterSuccessFucForSmd);

            makeHtml();
            ////關閉所有次視窗之功能系結
            //onClick_M(".closeSecondaryWindow", closeSecondaryWindow);
            ////開啟"進階查詢"視窗之功能系結
            //onClick_M("#openSearchAdvancedWindow", openSearchAdvancedWindow);
            ////開啟"今日聯繫"視窗之功能系結
            //onClick_M("#openTodayContactWindow", openTodayContactWindow);
            ////開啟"新增客戶資料"視窗之功能系結
            //onClick_M("#openAddCustomerDataWindow", openAddCustomerDataWindow);
            ////"新增客戶資料"之功能系結
            //onClick_M("#addCustomerDataBtn", addCustomerData);
            ////取得今日聯絡事項
            //getTodayConnectionMatterHtml();
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
            ////makeMClistHtmlTagSelect("#MCdata");
            ////控制只能輸入數字之功能系結
            //$CommonTool.Number.onlyNumber(".onlyNumber");
            //檢查手機號碼是否存在之功能系結
            /*onChange_M(".checkMobile", hasMTel);*/
            //查詢之功能系結
            //          searchSRMVENUDataFuc
            onClick_M("#searchSRMVMEBDataFuc", searchSRMVMEBData);
            onClick_M("#searchSRMVMEBDataFuc2", searchSRMVMEBData);
            onClick_M("#addSRMSYSKData", addSRMSYSKData);
            //alert('click_M("#searchSRMVENUData!!");');
            //click_M("#searchSRMVENUData");
            //getKeywordList();
            //設定權限
            //alert("setPermission_M");
            setPermission_M();

        };


        $(function () {
            onClick_M("#search", query);
            //查看使用者權限
            startThisPage();
            //getUserAuthority_M(startThisPage);
        })
    </script>
</asp:Content>

