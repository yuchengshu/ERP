<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="noticeBoard.aspx.cs" Inherits="public_MBULT_MBULT_noticeboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 10%;
            height: 25px;
        }
        .auto-style2 {
            width: 30%;
            height: 25px;
        }
        .auto-style3 {
            width: 20%;
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                            <h1 class="box-title"><b>ERP > 公用 > 公佈欄</b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title="">
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <!-- <table class="table table-bordered table-condensed"> -->

                            <div style="text-align: center">
                            </div>
                            <!--公佈欄明細START-->
                            <div id="noticeBoardDetailDiv" class="divBorder startHide">
                                <div id="mailDetailTitle" class="marginLeftRight10 titleBottomBorder">
                                    <h3>公佈欄明細</h3>
                                    <div class="btn-group" data-toggle="btn-toggle" style="margin-right: 0 auto; float: right;">
                                        <button id="" type="button" class="btn closeBtn btn-flat closeSecondaryDiv" closedivid="#noticeBoardDetailDiv">X</button>
                                    </div>
                                </div>

                                <table style="border-collapse: collapse" id="noticeBoardDetailTab">

                                    <tbody id="noticeBoardDetailTb">
                                        <tr>
                                            <td class="textAlignCenter" style="width: 20%; text-align: center;"><span class="colorRed">*</span>標題：</td>
                                            <td id="mdMS_Title" style="width: 80%;"></td>
                                        </tr>
                                        <tr>
                                            <td class="textAlignCenter"><span class="colorRed">*</span>發佈時間：</td>
                                            <td id="adver_create_date"></td>
                                        </tr>
                                        <tr>
                                            <td width="15%" align="center"><font color="Red">*</font>發佈人員：</td>
                                            <td id="adver_employ_Name"></td>

                                        </tr>
                                        <tr>
                                            <td class="textAlignCenter"><span class="colorRed">*</span>內文：</td>
                                            <td id="adver_content"></td>
                                        </tr>
                                        <tr>
                                            <td class="textAlignCenter" width="25%">附件1</td>
                                            <td class="textAlignCenter" id="mdMS_Attachment1" width="75%"></td>

                                        </tr>
                                        <tr>
                                            <td class="textAlignCenter" width="25%">附件2</td>

                                            <td class="textAlignCenter" id="mdMS_Attachment2" width="75%"></td>

                                        </tr>
                                        <tr>
                                            <td class="textAlignCenter" width="25%">附件3</td>

                                            <td class="textAlignCenter" id="mdMS_Attachment3" width="75%"></td>
                                        </tr>
                                        <tr>
                                            <td class="textAlignCenter" colspan="2">
                                                <button type="button" class="btn btn-info btn-flat" id="Back">返回公佈欄列表</button></td>

                                        </tr>
                                    </tbody>

                                </table>


                            </div>
                            <!--公佈欄明細END-->
                            <!--新增電子公佈欄START-->
                            <div id="addNoticeBoardDiv" class="divBorder startHide">
                                <div id="addMailTitle" class="marginLeftRight10 titleBottomBorder">
                                    <h3>公佈欄-新增</h3>
                                    <div class="btn-group" data-toggle="btn-toggle" style="margin-right: 0 auto; float: right;">
                                        <button id="" type="button" class="btn closeBtn btn-flat closeSecondaryDiv" closedivid="#addMailDiv">X</button>
                                    </div>

                                </div>

                                <table class="table table-hover" id="addMailTab">

                                    <tbody id="addNoticeBoardDataTb">
                                        <tr>
                                            <td class="textAlignCenter"><span class="colorRed">*</span>公佈屬性</td>
                                            <td>
                                                <input type="radio" name="adver_item" value="0" checked>一般
											   <input type="radio" name="adver_item" value="1">公告
											   <input type="radio" name="adver_item" value="2">置頂
                                            </td>

                                        </tr>
                                        <tr>
                                            <td class="textAlignCenter"><span class="colorRed">*</span>公佈對象</td>
                                            <td>
                                                <div class="form-group row marginLeftRight10">
                                                     <div class="col-xs-3">
                                                        <label for="EX_Status">公司別：</label>
                                                        <select id="abcU_Com" class="form-control getComIDlistHtmlTagOption comMdepChangeFuc" com="abcU_Com" mdep="abcU_MDEP" emp="EX_User"></select>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <%--發布對象--%>
                                                        <label for="EX_Status">部門別：</label>
                                                        <%--<select id="abcU_MDEP" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc" com="abcU_Com" mdep="abcU_MDEP" emp="EX_User"></select>--%>
                                                        <select id="abcU_MDEP" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc EAgroup addLeaveRequired" com="abcU_Com" mdep="abcU_MDEP" emp="EX_User"></select>
                                                    </div>
                                                    
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="textAlignCenter"><span class="colorRed">*</span>標題</td>

                                            <td><input type="text" class="form-control upLoadGroup" id="adver_subject" /></td>

                                        </tr>
                                        <tr>
                                            <td width="50%">附件</td>
                                            <td width="50%">
                                                <form runat="server">
                                                    <div align="right">
                                                        <asp:FileUpload type="file" ID="File1" class="form-control uploadFileCheck  upLoadGroup" ClientIDMode="Static" runat="server" />
                                                    </div>
                                                     <div align="right">
                                                    <asp:FileUpload type="file" ID="File2" class="form-control uploadFileCheck  upLoadGroup" ClientIDMode="Static" runat="server" />
                                                    </div>
                                                    <div align="right">
                                                         <asp:FileUpload type="file" ID="File3" class="form-control uploadFileCheck  upLoadGroup" ClientIDMode="Static" runat="server" />
                                                </div>
                                                        </form>

                                            </td>

                                        </tr>
                                        <tr>
                                            <td class="textAlignCenter"><span class="colorRed">*</span>公佈內文</td>
                                            <td>
                                               <input type="text" class="form-control upLoadGroup" id="adver_content_input" /></textarea></td>
                                        </tr>
                                        <tr>
                                            <td class="textAlignCenter" colspan="2">
                                                <button type="button" class="btn btn-info btn-flat" id="addnoticeBoardData">新增</button></td>

                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                            <!--新增電子公佈欄END-->

                            <!--公佈欄列表START-->
                            <div id="NoticeBoardDataListDiv" class="divBorder">
                                <table class="table table-hover leaveDataGroup" id="noticeBoardDataTab">
                                    <thead>
                                        <tr class="active">

                                            <th colspan="1">
                                                <span>發佈單位:
                                           
                                                </span>




                                            </th>
                                            <th colspan="1">
                                                <span>
                                                    <select id="abcAttach_MDEP" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc CF_Item0004" itemname="部門別" com="abcAttach_Com" mdep="abcAttach_MDEP" emp="abcAttach_User"></select>
                                                </span>
                                            </th>

                                            <th>
                                                <span>關鍵字:</span>
                                                <span class="inputSearch marginRight20">

                                                    <input type="text" name="message" placeholder="查尋關鍵字..." id="keyWord">
                                                </span>



                                            </th>
                                            <%--<th>
                                            <span>關鍵字:</span>
                                            <span class="inputSearch marginRight20">

                                                <input type="text" name="message" placeholder="查尋關鍵字..." id="keyWord">
                                            </span>



                                        </th>--%>
                                            <th>
                                                <span class="input-group-btn">
                                                    <button type="button" class="btn btn-info" id="searchNoticeBoardData">查詢</button>
                                                </span>
                                            </th>




                                            <th class="" colspan="1">
                                                <button type="button" id="openAddNoticeBoardDiv" class="btn btn-primary btn-flat marginBottom5">新增公佈欄</button>
                                            </th>
                                            <th class="" colspan="1">
                                                <span id="pageNum"></span>

                                            </th>
                                            <th class="" colspan="1">
                                                <span id="pageNum_"></span>
                                            </th>
                                        </tr>

                                        <tr class="bgBlue">
                                            <th class="auto-style1" style="text-align: center;">項次</th>
                                            <th class="auto-style2" style="text-align: center;">標題</th>
                                            <th class="auto-style3" style="text-align: center;">發佈時間</th>
                                            <th class="auto-style1" style="text-align: center;">發佈對象</th>
                                            <%--adver_dep--%>
                                            <th class="auto-style1" style="text-align: center;">發佈單位</th>
                                            <th class="auto-style1" style="text-align: center;">發佈人員</th>
                                            <th class="auto-style1" style="text-align: center;">刪</th>
                                        </tr>
                                    </thead>
                                    <tbody id="noticeBoardData">
                                    </tbody>

                                </table>
                            </div>
                            <!--公佈欄列表END-->
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
    <script src="<%=getRelativePath()%>js/pageList/noticeBoardDataPageList.js" type="text/javascript"></script>
    <script>
        //設定變數
        var U_Num_M = "<%=getU_Num()%>";
        var noticeBoardHandlerUrl_G = "noticeBoardHandler.ashx";
        var MS_ID = "<%=getMS_ID()%>";
        var MENU_no_G = "<%=getMENU_no()%>";
        var noticeBoardDataJson = undefined;
        var tempMC_G = undefined;
        var isPageList = false;
        var uploadFile = function () {

        };
        var uploadFileCheck = function () {
            //alert('upload');
            var fileSize = this.files[0].size
            if (fileSize > 3670016) {
                $(this).val("");
                alert("上傳的檔案不得超過 3MB！");
            } else {
                //取得該filebox中的檔案資料：
                var id = attr_M(this, "id");
                var files = document.getElementById(id).files;
                var fileData = new FormData();
                fileData.append(files[0].name, files[0]);
                ajax_M(UploadFileHandlerUrl_M, fileData, success, Error);

            }
        };
        var getMCdata = function () {
            var data = "U_Num=" + U_Num_M + "&action=getMCdata";
            var success = function (back) {
                var json = jsonParse_M(back);
                $("#abcU_MDEP").val(json.U_MDEP);
                $("#abcU_Com").val(json.ComID);
                //tempMC_G = json.U_Num;
                $("#abcU_MDEP").change();
                unBlockUI_M();
            };
            ajax_M(CommonHandlerUrl_M, data, success);//<======================
        };
        var comMdepChangeFuc = function () {
            //alert('comMdepChangeFuc');
            var emp = $(this).attr("EMP");
            var com = $(this).attr("Com");
            var mdep = $(this).attr("MDEP");
            $("#" + emp).empty();
            var abcU_ComVal = $("#" + com).val();
            var abcU_MDEPVal = $("#" + mdep).val();
            var url = CommonHandlerUrl_M;
            var data = "ComID=" + abcU_ComVal + "&U_MDEP=" + abcU_MDEPVal + "&action=getEmplist";
            var success = function (back) {
                if (!isEmptyStr(back)) {
                    var json = jsonParse_M(back);
                    var sb = new string_M.StringBuilder();
                    sb.append("<option value=''>請選擇</option>")
                    $.each(json, function (i, v) {
                        sb.append("<option value='");
                        sb.append(v.U_Num);
                        sb.append("'>");
                        sb.append(v.U_Name);
                        sb.append("</option>");
                    });
                    $("#" + emp).append(sb.toString());
                    if (emp == "ES1") {
                        $("#" + emp).val(tempLeader_G);
                        tempLeader_G = "";
                    } else {
                        $("#" + emp).val(tempMC_G);
                        tempMC_G = "";
                    }
                }
            };
            ajax_M(url, data, success);//<======================
        };
        var getComIdMdepEmpList = function () {
            //取得公司option
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getComIDlistHtmlTagOption", "COMID", "option");
            //取得部門option
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "getMDEPlistHtmlTagOption", "DEPAR", "option", getMCdata);
            $(".comMdepChangeFuc").on("change", comMdepChangeFuc);
        };
        var deletenoticeBoardData = function () {
            var r = confirm("刪除後資料將無法恢復，確定刪除?");
            if (r) {
                var adver_id = attr_M(this, "adver_id");
                //alert(adver_id);
                Log_M("deletenoticeBoardData start");
                var data = "adver_id=" + adver_id + "&action=deletenoticeBoardData";
                var success = function (back) {
                    Log_M("deletenoticeBoardData back=" + back);
                    if (back == "成功") {
                        location.reload();
                    }

                };
                var error = function (e) { Log_M("deletenoticeBoardData error=" + e); unBlockUI_M(); };

                ajax_M(noticeBoardHandlerUrl_G, data, success, error);
                //startThisPage();
                location.reload();
            }
        };
        //公佈欄明細
        //標題,發佈時間,發佈人員,附件,內文
        var getnoticeBoardDetail = function () {
            blockUI_M();
            //alert("取得公佈欄明細!!");
            var MS_ID = attr_M(this, "MS_ID");
            //var data = "File_num=" + File_num + "&action=getUpLoadData1";
            //alert("MS_ID" + MS_ID);
            //alert("MS_ID" + MS_ID);
            getBoardDataDetail(MS_ID);//取得詳細資料
            getUpLoadData1(MS_ID);//取得附件1
            getUpLoadData2(MS_ID);//取得附件2
            getUpLoadData3(MS_ID);//取得附件3
            Log_M("getnoticeBoardDetail start");
            var MS_Title = attr_M(this, "MS_Title");
            var adver_create_date = attr_M(this, "adver_create_date");
            var MS_ID = attr_M(this, "MS_ID");
            var MS_SenderName = attr_M(this, "MS_SenderName");
            var File_num = attr_M(this, "File_num");
            text_M("#mdMS_Title", MS_Title);//標題
            html_M("#mdMS_Text", adver_create_date);//mdMS_SenderName
            text_M("#mdMS_SenderName", adver_create_date);//發佈時間
            text_M("#file_num", File_num);
            //getUpLoadData(MS_ID);
            //getUpLoadData(MS_ID);
            //updateReadtag(MS_ID);
            show_M("#noticeBoardDetailDiv");
            hide_M("#NoticeBoardDataListDiv");
        };

        //取得詳細資料(含附件資訊)
        var getBoardDataDetail = function (File_num) {
            //alert('File_num:取得附件1' + File_num);
            var data = "File_num=" + File_num + "&action=getBoardDataDetail";
            var success = function (back) {
                Log_M("getUpLoadData back=" + back);
                var json = jsonParse_M(back);
                debugger;
                if (!isEmptyStr(json.adver_subject)) {

                    //html_M("#mdMS_Title", json.adver_subject);
                    html_M("#adver_create_date", json.adver_create_date);
                    html_M("#adver_employ_Name", json.adver_employ_Name);
                    html_M("#adver_content", json.adver_content);
                }
                getUpLoadData1(File_num);//取得附件1
                getUpLoadData2(File_num);//取得附件2
                getUpLoadData3(File_num);//取得附件3
                show_M("#niticeBoardDetailDiv");
                unBlockUI_M();
            };
            var error = function (e) { Log_M("getUpLoadData error=" + e); unBlockUI_M(); };

            ajax_M(noticeBoardHandlerUrl_G, data, success, error);

        };
        //取得公佈欄資料列表(條件:adver_depart_id,keyword)[按下查詢後]
        var getnoticeBoardData = function () {
            //alert('getnoticeBoardData');
            var adver_depart_id = val_M("#abcAttach_MDEP");//發佈部門代號(查詢條件)
            var keyword = val_M("#keyWord");//關鍵字(查詢條件)
            //var adver_depart_id = val_M("#adver_depart_id");
            //alert(adver_depart_id);
            var data = "U_Num=" + U_Num_M + "&adver_depart_id=" + adver_depart_id + "&keyWord=" + keyword + "&action=getnoticeBoardData";
            //var data = "";//要帶入的參數
            var success = function (back) {
                var json = jsonParse_M(back);
                noticeBoardDataJson = json;
                $("#muserData").empty();
                //alert('')
                $noticeBoardDataPageList.Table.makeTbody("#noticeBoardData", json, 10, "#pageBar", deletenoticeBoardData, getnoticeBoardDetail);//取得公佈欄資料
            };
            var error = function (e) { Log_M("getnoticeBoardData error=" + e); unBlockUI_M(); };
            ajax_M(noticeBoardHandlerUrl_G, data, success, error);
        };

        var deleteAllselect = function () {
            blockUI_M();
            var r = confirm("刪除後資料將無法恢復，確定刪除?");
            if (r) {
                var MS_ID = "";
                var selects = $("input:checked");
                Log_M("selects=" + selects.length);
                $.each(selects, function (i, v) {
                    if (i != 0) {
                        MS_ID += ",";
                    }
                    MS_ID += val_M(v);
                });
                Log_M("deletenoticeBoardData start");
                var data = "MS_ID=" + MS_ID + "&action=deletenoticeBoardData";
                var success = function (back) {
                    Log_M("deletenoticeBoardData back=" + back);
                    if (back == "成功") {
                        location.reload();
                    }
                };
                var error = function (e) { Log_M("deletenoticeBoardData error=" + e); unBlockUI_M(); };
                ajax_M(noticeBoardHandlerUrl_G, data, success, error);
            }
        };
        //開啟新增公佈欄
        var openAddNoticeBoardDiv = function () {
            //blockUI_M();
            hide_M("#noticeBoardDataTab")
            show_M("#addNoticeBoardDiv");
            //$(".upLoadGroup").val("");
            //getComIdMdepEmpList();
        };

        var upload = function upload(id, fileNum) {
            var formData = new FormData();
            var totalFiles = document.getElementById(id).files.length;
            for (var i = 0; i < totalFiles; i++) {
                var file = document.getElementById(id).files[i];
                formData.append("id", id);
                formData.append("File_num", fileNum);
                formData.append("File_Folder", "BOARD");
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

                },
                error: function (error) {

                }
            });
        };
        //新增公佈欄(20220615要修改的地方)
        var addnoticeBoardData = function () {
            blockUI_M();
            var adver_item = $("input[name='adver_item']:checked").val(); //[公布屬性]radio 取值
            //alert("公布屬性" + adver_item);
            var adver_dep = val_M("#abcU_MDEP");//公佈對象
            //alert(adver_dep);
            var adver_subject = val_M("#adver_subject");//標題
            var adver_content = val_M("#adver_content_input");//內文
            var ComID = ComID_M;
            var data = "adver_item=" + adver_item //公布屬性
                + "&adver_dep=" + adver_dep //(要被)發布對象(部門)
                + "&adver_content=" + adver_content //內文
                + "&adver_subject=" + adver_subject //標題
                + "&ComID=" + ComID//公司
                + "&adver_depart_id=" + U_MDEP_M//使用者部門代號(Session["U_MDEP"])
                + "&U_Num=" + U_Num_M //使用者員工編號
                + "&action=addnoticeBoardData";
            var success = function (back) {
                //alert('Upload!!');
                var file1 = undefined;
                var file2 = undefined;
                var file3 = undefined;
                if (!isEmptyStr(back)) {
                    file1 = document.getElementById("File1").files;
                    if (file1.length != 0) {
                        upload("File1", back);
                        //alert("File1 Upload ok!");
                    }
                    //
                    file2 = document.getElementById("File2").files;
                    if (file2.length != 0) {
                        upload("File2", back);
                        //alert("File2 Upload ok!");
                    }
                    //
                    file3 = document.getElementById("File3").files;
                    if (file3.length != 0) {
                        upload("File3", back);
                        //alert("File3 Upload ok!");
                    }
                }
                hide_M("#addNoticeBoardDiv");
                alert("新增公佈欄成功");
                unBlockUI_M();
                //show_M("#noticeBoardDataTab");
                location.reload();//重新載入網頁
                //startThisPage();
            };
            //var error = function (e) { Log_M("addnoticeBoardData error=" + e); unBlockUI_M(); };
            ajax_M(noticeBoardHandlerUrl_G, data, success, error);
            //startThisPage();
        };
        //返回到列表
        var back = function () {
            //alert('BACK!');
            hide_M("#noticeBoardDetailDiv")
            show_M("#NoticeBoardDataListDiv");
        };

        var closeSecondaryDiv = function () {
            var id = attr_M(this, "closeDivId");
            hide_M(id);
            //show_M("#noticeBoardDataTab");
        };

        var getNoticeBoard = function () {
            //blockUI_M();
            var keyWord = val_M("#keyWord");
            var adver_depart_id = val_M("#adver_depart_id");//發布單位代號
            var data = "U_MDEP=" + U_MDEP_M + "&U_POSITION=" + U_POSITION_M + "&keyWord=" + keyWord + "&adver_depart_id=" + adver_depart_id + "&action=getnoticeBoardData";
            //var data = "";//要帶入的參數
            var success = function (back) {
                Log_M("getNoticeBoard back=" + back);
                var json = jsonParse_M(back);
                $noticeBoardDataPageList.Table.makeTbody("#noticeBoardData", json, 10, "#pageBar", deletenoticeBoardData, getnoticeBoardDetail);////取得公佈欄資料
            };
            var error = function (e) { Log_M("getNoticeBoard error=" + e); unBlockUI_M(); };
            ajax_M(noticeBoardHandlerUrl_G, data, success, error);

        };
        //取得詳細資料中的取得上傳資料(附件1)
        var getUpLoadData1 = function (File_num) {
            //alert('File_num:取得附件1' + File_num);
            var data = "File_num=" + File_num + "&action=getUpLoadData1";
            var success = function (back) {
                Log_M("getUpLoadData back=" + back);
                var json = jsonParse_M(back);
                if (!isEmptyStr(json.File_Title)) {
                    //html_M("#mdMS_Title", json.adver_subject);
                    //html_M("#adver_create_date", json.adver_create_date);
                    //html_M("#adver_employ_Name", json.adver_employ_Name);
                    //顯示附件檔案(20220610)
                    //附件1
                    html_M("#mdMS_Attachment1", "<a target='_blank' href='../../../uploadfile/BOARD/" + json.File_Name + "'>" + json.File_Title + "</a>");
                    //附件2
                    //html_M("#mdMS_Attachment2", "<a target='_blank' href='../../../uploadfile/BOARD/" + json.File_Name + "'>" + json.File_Title + "</a>");
                    //附件3
                    //html_M("#mdMS_Attachment3", "<a target='_blank' href='../../../uploadfile/BOARD/" + json.File_Name + "'>" + json.File_Title + "</a>");
                    //html_M("#mdMS_Attachment", "<a target='_blank' href='../../../uploadfile/BOARD/" + json.File_Name + "'>" + json.File_Title + "</a>");
                    //html_M("#adver_content", json.adver_content);
                }
                else {
                    html_M("#mdMS_Attachment1", "<a>無</a>");

                }
                show_M("#niticeBoardDetailDiv");
                unBlockUI_M();
            };
            var error = function (e) { Log_M("getUpLoadData error=" + e); unBlockUI_M(); };

            ajax_M(noticeBoardHandlerUrl_G, data, success, error);

        };
        var getUpLoadData2 = function (File_num) {
            //alert('File_num:取得附件2' + File_num);
            var data = "File_num=" + File_num + "&action=getUpLoadData2";
            var success = function (back) {
                Log_M("getUpLoadData back=" + back);
                var json = jsonParse_M(back);
                if (!isEmptyStr(json.File_Title)) {
                    //html_M("#mdMS_Title", json.adver_subject);
                    //html_M("#adver_create_date", json.adver_create_date);
                    //html_M("#adver_employ_Name", json.adver_employ_Name);
                    //顯示附件檔案(20220610)
                    //附件1
                    //html_M("#mdMS_Attachment1", "<a target='_blank' href='../../../uploadfile/BOARD/" + json.File_Name + "'>" + json.File_Title + "</a>");
                    //附件2
                    html_M("#mdMS_Attachment2", "<a target='_blank' href='../../../uploadfile/BOARD/" + json.File_Name + "'>" + json.File_Title + "</a>");
                    //附件3
                    // html_M("#mdMS_Attachment3", "<a target='_blank' href='../../../uploadfile/BOARD/" + json.File_Name + "'>" + json.File_Title + "</a>");
                    // html_M("#mdMS_Attachment", "<a target='_blank' href='../../../uploadfile/BOARD/" + json.File_Name + "'>" + json.File_Title + "</a>");
                    //html_M("#adver_content", json.adver_content);
                }
                else
                {
                    html_M("#mdMS_Attachment2", "<a>無</a>");
                }
                show_M("#niticeBoardDetailDiv");
                unBlockUI_M();
            };
            var error = function (e) { Log_M("getUpLoadData error=" + e); unBlockUI_M(); };

            ajax_M(noticeBoardHandlerUrl_G, data, success, error);

        };
        var getUpLoadData3 = function (File_num) {
            //alert('File_num:取得附件3' + File_num);
            var data = "File_num=" + File_num + "&action=getUpLoadData3";
            var success = function (back) {
                Log_M("getUpLoadData back=" + back);
                var json = jsonParse_M(back);
                if (!isEmptyStr(json.File_Title)) {
                    //html_M("#mdMS_Title", json.adver_subject);
                    //html_M("#adver_create_date", json.adver_create_date);
                    //html_M("#adver_employ_Name", json.adver_employ_Name);
                    //顯示附件檔案(20220610)
                    //附件1
                    //html_M("#mdMS_Attachment1", "<a target='_blank' href='../../../uploadfile/BOARD/" + json.File_Name + "'>" + json.File_Title + "</a>");
                    //附件2
                    //html_M("#mdMS_Attachment2", "<a target='_blank' href='../../../uploadfile/BOARD/" + json.File_Name + "'>" + json.File_Title + "</a>");
                    //附件3
                    html_M("#mdMS_Attachment3", "<a target='_blank' href='../../../uploadfile/BOARD/" + json.File_Name + "'>" + json.File_Title + "</a>");
                    // html_M("#mdMS_Attachment", "<a target='_blank' href='../../../uploadfile/BOARD/" + json.File_Name + "'>" + json.File_Title + "</a>");
                    //html_M("#adver_content", json.adver_content);
                }
                else {
                    html_M("#mdMS_Attachment3", "<a>無</a>");
                }
                show_M("#niticeBoardDetailDiv");
                unBlockUI_M();
            };
            var error = function (e) { Log_M("getUpLoadData error=" + e); unBlockUI_M(); };

            ajax_M(noticeBoardHandlerUrl_G, data, success, error);

        };

        var getSinglenoticeBoardDetail = function () {
            //alert('getSinglenoticeBoardDetail');
            var data = "MS_ID=" + MS_ID_G + "&action=getSinglenoticeBoardDetail";
            var success = function (back) {
                Log_M("getMailData back=" + back);
                var json = jsonParse_M(back);
                text_M("#mdMS_Title", json.MS_Title);
                html_M("#mdMS_Text", json.MS_Text);
                text_M("#mdMS_SenderName", json.MS_SenderName);
                getUpLoadData1(MS_ID);//取得附件1
                getUpLoadData2(MS_ID);//取得附件2
                getUpLoadData3(MS_ID);//取得附件3
                updateReadtag(MS_ID);
                hide_M("#mailDataTab");
            };
            var error = function (e) { Log_M("getSinglenoticeBoardDetail error=" + e); unBlockUI_M(); };

            ajax_M(mailHandlerUrl_G, data, success, error);
        };
        //進行頁面處理===============================================start
        var startThisPage = function () {
          
            html_M("#mdMS_Attachment1", "");
            html_M("#mdMS_Attachment2", "");
            html_M("#mdMS_Attachment3", "");
            getNoticeBoard();
            blockUI_M();
            if (isEmptyStr(MS_ID)) {
                getnoticeBoardData();//取得所有資料
                isPageList = true;
            } else {
                getSinglenoticeBoardDetail();//取得單筆資料明細
                hide_M("#pageBar");
                hide_M("#noticeBoardDataTab");
            }

            if (!isPageList) {
                hide_M("#pageBar");
            }

            //onClick_M("#deleteAllselect", deleteAllselect);
            onClick_M("#searchNoticeBoardData", getnoticeBoardData);
            onClick_M("#openAddNoticeBoardDiv", openAddNoticeBoardDiv);
            onClick_M("#addnoticeBoardData", addnoticeBoardData);
            onClick_M("#Back", back);
            //onClick_M(".closeSecondaryDiv", closeSecondaryDiv);
            //設定權限
            setPermission_M();
            //取得部門option
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getMDEPlistHtmlTagOption", "DEPAR", "option", getMCdata);
            //取得部門option
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getMDEPlistHtmlTagOption", "DEPAR", "option", getMCdata);

        };
        //進行頁面處理===============================================end

        $(function () {
            startThisPage();
            //查看使用者權限
            //getUserAuthority_M(startThisPage);
        })

    </script>
</asp:Content>

