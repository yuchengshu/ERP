<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="mail.aspx.cs" Inherits="public_Mail_MMAIL_mail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                            <h1 class="box-title"><b>ERP > 公用 > 電子郵件</b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title="">
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <!-- <table class="table table-bordered table-condensed"> -->

                            <div style="text-align: center">
                            </div>
                            <!--電子郵件明細START-->
                            <div id="mailDetailDiv" class="divBorder startHide">
                                <div id="mailDetailTitle" class="marginLeftRight10 titleBottomBorder">
                                    <h3>電子郵件明細
                                    <div class="btn-group" data-toggle="btn-toggle" style="margin-right: 0 auto; float: right;">
                                        <button id="" type="button" class="btn closeBtn btn-flat closeSecondaryDiv" closedivid="#mailDetailDiv">X</button>
                                    </div>
                                    </h3>
                                </div>
                               <%-- 電子郵件明細內容20220627要修改的地方(加上附件1 2 3 欄位內容)--%>
                                <table class="table table-hover" id="mailDetailTab">

                                    <tbody id="mailDetailTb">
                                        <tr>
                                            <td class="textAlignCenter" style="width: 20%; text-align: center;"><span class="colorRed">*</span>標題</td>
                                            <td id="mdMS_Title" style="width: 80%;"></td>
                                        </tr>
                                        <tr>
                                            <td class="textAlignCenter"><span class="colorRed">*</span>寄件人</td>
                                            <td id="mdMS_SenderName"></td>
                                        </tr>
                                        
                                        <tr>
                                            <td class="textAlignCenter"><span class="colorRed">*</span>內容</td>
                                            <td id="mdMS_Text"></td>
                                        </tr>
                                        <tr>
                                            <td class="textAlignCenter">附件1</td>
                                            <td id="mdMS_Attachment1"></td>
                                        </tr>
                                        <tr>
                                            <td class="textAlignCenter">附件2</td>
                                            <td id="mdMS_Attachment2"></td>
                                        </tr>
                                        <tr>
                                            <td class="textAlignCenter">附件3</td>
                                            <td id="mdMS_Attachment3"></td>
                                        </tr>
                                         <tr>
                                            <td class="textAlignCenter" colspan="2">
                                                <button type="button" class="btn btn-info btn-flat" id="Back">返回信件列表</button></td>

                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                            <!--電子郵件明細END-->
                            <!--新增電子郵件START-->
                            <div id="addMailDiv" class="divBorder startHide">
                                <div id="addMailTitle" class="marginLeftRight10 titleBottomBorder">
                                    <h3>新增電子郵件
                                    <div class="btn-group" data-toggle="btn-toggle" style="margin-right: 0 auto; float: right;">
                                        <button id="" type="button" class="btn closeBtn btn-flat closeSecondaryDiv" closedivid="#addMailDiv">X</button>
                                    </div>
                                    </h3>
                                </div>
                                <div class="form-group row marginLeftRight10">
                                    
                                    
                                </div>
                                <table class="table table-hover" id="addMailTab">

                                    <tbody id="addMailTb">
                                        
                                        <tr>
                                            <td class="textAlignCenter"><span class="colorRed">*</span>標題</td>
                                            <td>
                                                <input type="text" class="form-control upLoadGroup" id="MS_Title" /></td>
                                        </tr>
                                        <tr>
                                            <td class="textAlignCenter"><span class="colorRed">*</span>收件人</td>
                                            <td>
                                                <div class="form-group row marginLeftRight10">
                                                    <div class="col-xs-3">
                                                        <label for="EX_Status">公司別：</label>
                                                        <select id="abcU_Com" class="form-control getComIDlistHtmlTagOption comMdepChangeFuc" com="abcU_Com" mdep="abcU_MDEP" emp="EX_User"></select>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label for="EX_Status">部門別：</label>
                                                        <select id="abcU_MDEP" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc" com="abcU_Com" mdep="abcU_MDEP" emp="EX_User"></select>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label for="EX_Status">姓名：</label>
                                                        <select id="EX_User" class="form-control"></select>
                                                    </div>

                                                </div>
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <%--新增電子郵件要上傳的附件--%>
                                            <td class="textAlignCenter">附件</td>
                                            <td>
                                                <form runat="server">
                                                    <asp:FileUpload type="file" ID="File1" class="form-control uploadFileCheck  upLoadGroup" ClientIDMode="Static" runat="server" />
                                                    <asp:FileUpload type="file" ID="File2" class="form-control uploadFileCheck  upLoadGroup" ClientIDMode="Static" runat="server" />
                                                    <asp:FileUpload type="file" ID="File3" class="form-control uploadFileCheck  upLoadGroup" ClientIDMode="Static" runat="server" />
                                                </form>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="textAlignCenter"><span class="colorRed">*</span>內容</td>
                                            <td>
                                                <textarea id="MS_Text" class="form-control  upLoadGroup"></textarea></td>
                                        </tr>
                                        <tr>
                                            <td class="textAlignCenter" colspan="2">
                                                <button type="button" class="btn btn-info btn-flat" id="addMailData">新增</button></td>

                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                            <!--新增電子郵件END-->
                             <div id="mailDataListDiv" class="divBorder">
                            <!--email列表START-->
                            <table class="table table-hover leaveDataGroup" id="mailDataTab">
                                <thead>
                                    <tr class="active">

                                        <th class="" colspan="5">
                                            <div class="input-group">
                                                <input type="text" name="message" placeholder="查尋關鍵字..." class="form-control marginTop5" id="keyWord">

                                                <span class="input-group-btn">
                                                    <button type="button" class="btn btn-info btn-flat" id="searchMailData">查詢</button>
                                                </span>
                                                &nbsp;
                                          &nbsp;
                                          &nbsp;
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-danger btn-flatt" id="deleteAllselect">刪除所選郵件</button>
                                        </span>
                                            </div>
                                        </th>

                                        <th class="" colspan="1">
                                            <button type="button" id="openAddMailDiv" class="btn btn-primary btn-flat marginBottom5">新增電子郵件</button>
                                        </th>
                                        <th class="" colspan="1"><span id="pageNum"></span></th>
                                    </tr>

                                    <tr class="bgBlue">
                                        <th class="" style="width: 10%; text-align: center;">選取</th>
                                        <th class="" style="width: 10%; text-align: center;">項次</th>
                                        <th class="" style="width: 30%; text-align: center;">標題</th>
                                        <th class="" style="width: 20%; text-align: center;">日期</th>
                                        <th class="" style="width: 10%; text-align: center;">寄件人</th>
                                        <th class="" style="width: 10%; text-align: center;">讀取</th>
                                        <th class="" style="width: 10%; text-align: center;">刪</th>
                                    </tr>
                                </thead>
                                <tbody id="mailData">
                                </tbody>

                            </table>
                              </div>
                            <!--EMAIL列表END-->
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
    <script src="<%=getRelativePath()%>js/pageList/mailDataPageList.js" type="text/javascript"></script>
    <script>
        var mailHandlerUrl_G = "mailHandler.ashx";
        var MS_ID_G = "<%=getMS_ID()%>";
        var MENU_no_G = "<%=getMENU_no()%>";
        var mailDataJson = undefined;
        var tempMC_G = undefined;
        var isPageList = false;
        var uploadFile = function () {

        };
        var uploadFileCheck = function () {
            var fileSize = this.files[0].size
            if (fileSize > 3670016) {
                $(this).val("");
                alert("上傳的檔案不得超過 3MB！");
            } else {
                //取得該filebox中的檔案資料：
                var id = attr_M(this, "id")
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
        //下拉式選單依照選項取得名單
        var comMdepChangeFuc = function () {
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
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getMDEPlistHtmlTagOption", "DEPAR", "option", getMCdata);
            //取得姓名option(2022062實作這個下拉式選單)
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getEmpExtension", "COMID", "DEPAR", "option",);
            $(".comMdepChangeFuc").on("change", comMdepChangeFuc);
        };
        var deleteMailData = function () {
            var r = confirm("刪除後資料將無法恢復，確定刪除?");
            var mailId = attr_M(this, "mailId");
            alert(mailId);
            if (r) {
                var mailId = attr_M(this, "mailId");
                Log_M("deleteMailData start");
                var data = "mailId=" + mailId + "&action=deleteMailData";
                var success = function (back) {
                    Log_M("deleteMailData back=" + back);
                    if (back == "成功") {
                        location.reload();
                    }

                };
                var error = function (e) { Log_M("deleteMailData error=" + e); unBlockUI_M(); };

                ajax_M(mailHandlerUrl_G, data, success, error);
            }
        };
        //取得信件附件
        var getUpLoadData = function (MS_ID) {

            var data = "MS_ID=" + MS_ID + "&action=getUpLoadData";
            var success = function (back) {
                Log_M("getUpLoadData back=" + back);
                var json = jsonParse_M(back);
                if (!isEmptyStr(json.File_Title)) {

                    html_M("#mdMS_Attachment", "<a target='_blank' href='../../../uploadfile/MMAIL/" + json.File_Name + "'>" + json.File_Title + "</a>");
                }
                //alert('Show MailDetail!!');
                show_M("#mailDetailDiv");
                unBlockUI_M();
            };
            var error = function (e) { Log_M("getUpLoadData error=" + e); unBlockUI_M(); };

            ajax_M(mailHandlerUrl_G, data, success, error);

        };

        var updateReadtag = function (MS_ID) {
            Log_M("updateReadtag start");
            var data = "MS_ID=" + MS_ID + "&action=updateReadtag";
            var success = function (back) {
                Log_M("updateReadtag back=" + back);
                if (back == "成功") {
                    getMailData();////查詢全部郵件資訊
                }
            };
            var error = function (e) { Log_M("updateReadtag error=" + e); unBlockUI_M(); };

            ajax_M(mailHandlerUrl_G, data, success, error);
        };

        var getSingleMailDetail = function () {
            //alert('getSingleMailDetail');
            var data = "MS_ID=" + MS_ID_G + "&action=getMailDetail";
            var success = function (back) {
                Log_M("getMailData back=" + back);
                var json = jsonParse_M(back);
                text_M("#mdMS_Title", json.MS_Title);

                html_M("#mdMS_Text", json.MS_Text);
                text_M("#mdMS_SenderName", json.MS_SenderName);
                getUpLoadData(MS_ID_G);
                updateReadtag(MS_ID_G);
                hide_M("#mailDataTab");
            };
            var error = function (e) { Log_M("getMailData error=" + e); unBlockUI_M(); };

            ajax_M(mailHandlerUrl_G, data, success, error);
        };
        ////取得詳細資料(含附件資訊)
        var getMailDetail = function () {
            
            //blockUI_M();
            Log_M("getMailDetail start");
            var MS_Title = attr_M(this, "MS_Title");
            var MS_Text = attr_M(this, "MS_Text");
            var MS_ID = attr_M(this, "MS_ID");
            var MS_SenderName = attr_M(this, "MS_SenderName");

            text_M("#mdMS_Title", MS_Title);
            html_M("#mdMS_Text", MS_Text);
            text_M("#mdMS_SenderName", MS_SenderName);

            getUpLoadData(MS_ID);
            getUpLoadData1(MS_ID);     
            getUpLoadData2(MS_ID);

            getUpLoadData3(MS_ID);

            updateReadtag(MS_ID);
            hide_M("#mailDataTab");
        };
        //取得詳細資料中的取得上傳資料(附件1)
        var getUpLoadData1 = function (MS_ID) {
            //alert('File_num:取得附件1' + MS_ID);
            var data = "MS_ID=" + MS_ID + "&action=getUpLoadData1";
            var success = function (back) {
                Log_M("getUpLoadData back=" + back);
                var json = jsonParse_M(back);
                if (!isEmptyStr(json.File_Title)) {
                    //html_M("#mdMS_Title", json.adver_subject);
                    //html_M("#adver_create_date", json.adver_create_date);
                    //html_M("#adver_employ_Name", json.adver_employ_Name);
                    //顯示附件檔案(20220610)
                    //附件1
                    html_M("#mdMS_Attachment1", "<a target='_blank' href='../../../uploadfile/MMAIL/" + json.File_Name + "'>" + json.File_Title + "</a>");
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
                show_M("#getUpLoadData1_Show");
                unBlockUI_M();
            };
            var error = function (e) { Log_M("getUpLoadData error=" + e); unBlockUI_M(); };

            ajax_M(mailHandlerUrl_G, data, success, error);

        };
        var getUpLoadData2 = function (MS_ID) {
            //alert('MS_ID:取得附件2' + MS_ID);
            var data = "MS_ID=" + MS_ID + "&action=getUpLoadData2";
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
                    html_M("#mdMS_Attachment2", "<a target='_blank' href='../../../uploadfile/MMAIL/" + json.File_Name + "'>" + json.File_Title + "</a>");
                    //附件3
                    // html_M("#mdMS_Attachment3", "<a target='_blank' href='../../../uploadfile/BOARD/" + json.File_Name + "'>" + json.File_Title + "</a>");
                    // html_M("#mdMS_Attachment", "<a target='_blank' href='../../../uploadfile/BOARD/" + json.File_Name + "'>" + json.File_Title + "</a>");
                    //html_M("#adver_content", json.adver_content);
                }
                else {
                    html_M("#mdMS_Attachment2", "<a>無</a>");
                }
                show_M("#niticeBoardDetailDiv");
                unBlockUI_M();
            };
            var error = function (e) { Log_M("getUpLoadData error=" + e); unBlockUI_M(); };

            ajax_M(mailHandlerUrl_G, data, success, error);

        };
        var getUpLoadData3 = function (MS_ID) {
            //alert('File_num:取得附件3:' + MS_ID);
            var data = "MS_ID=" + MS_ID + "&action=getUpLoadData3";
            var success = function (back) {
                Log_M("getUpLoadData back=" + back);
                var json = jsonParse_M(back);
                if (!isEmptyStr(json.File_Title)) {
                    //html_M("#mdMS_Title", json.adver_subject);
                    //html_M("#adver_create_date", json.adver_create_date);
                    //html_M("#adver_employ_Name", json.adver_employ_Name);
                    //顯示附件檔案(20220610)
                    //附件1
                    //html_M("#mdMS_Attachment1", "<a target='_blank' href='../../../uploadfile/MMAIL/" + json.File_Name + "'>" + json.File_Title + "</a>");
                    //附件2
                    //html_M("#mdMS_Attachment2", "<a target='_blank' href='../../../uploadfile/MMAIL/" + json.File_Name + "'>" + json.File_Title + "</a>");
                    //附件3
                    html_M("#mdMS_Attachment3", "<a target='_blank' href='../../../uploadfile/MMAIL/" + json.File_Name + "'>" + json.File_Title + "</a>");
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

            ajax_M(mailHandlerUrl_G, data, success, error);

        };
        //返回到列表
        var back = function () {
            //alert('BACK!!!');
            hide_M("#mailDetailDiv")
            show_M("#mailDataListDiv");
            show_M("#mailDataTab");
            unBlockUI_M();
        };
        //查詢全部郵件資訊
        var getMailData = function () {
            var data = "U_Num=" + U_Num_M + "&keyWord=" + val_M("#keyWord") + "&action=getMailData";
            var success = function (back) {
                //alert('//查詢全部郵件資訊');
                var json = jsonParse_M(back);
                mailDataJson = json;
                $mailDataPageList.Table.makeTbody("#mailData", json, 10, "#pageBar", deleteMailData, getMailDetail);
            };
            var error = function (e) { Log_M("getMailData error=" + e); unBlockUI_M(); };
            ajax_M(mailHandlerUrl_G, data, success, error);
        };

        var deleteAllselect = function () {
            //blockUI_M();
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
                Log_M("deleteMailData start");
                var data = "mailId=" + MS_ID + "&action=deleteMailData";
                var success = function (back) {
                    Log_M("deleteMailData back=" + back);
                    if (back == "成功") {
                        location.reload();
                    }
                };
                var error = function (e) { Log_M("deleteMailData error=" + e); unBlockUI_M(); };
                ajax_M(mailHandlerUrl_G, data, success, error);
            }
        };
        var openAddMailDiv = function () {
            //blockUI_M();
            hide_M("#mailDataTab");
            show_M("#addMailDiv");
            $(".upLoadGroup").val("");
            getComIdMdepEmpList();
        };

        var upload = function upload(id, fileNum) {
            var formData = new FormData();
            var totalFiles = document.getElementById(id).files.length;
            for (var i = 0; i < totalFiles; i++) {
                var file = document.getElementById(id).files[i];
                formData.append("id", id);
                formData.append("File_num", fileNum);
                formData.append("File_Folder", "MMAIL");
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
        }
        //呼叫新增郵件動作
        var addMailData = function () {
            //blockUI_M();
            var MS_Title = val_M("#MS_Title");
            var MS_Receiver = val_M("#EX_User");
            var MS_Text = val_M("#MS_Text");
            var data = "MS_Title=" + MS_Title
                + "&MS_Sender=" + U_Num_M
                + "&MS_Receiver=" + MS_Receiver
                + "&MS_Text=" + MS_Text
                + "&add_User=" + U_Num_M
                + "&add_ip=" + IP_M
                + "&action=addMailData";
            var success = function (back) {
                var file1 = undefined;
                var file2 = undefined;
                var file3 = undefined;
                //進行上傳檔案動作
                if (!isEmptyStr(back)) {
                    file1 = document.getElementById("File1").files;
                    if (file1.length != 0) {
                        upload("File1", back);
                    }
                    file2 = document.getElementById("File2").files;
                    if (file2.length != 0) {
                        upload("File2", back);
                    }
                    file3 = document.getElementById("File3").files;
                    if (file3.length != 0) {
                        upload("File3", back);
                    }
                }
                hide_M("#addMailDiv");
                alert("新增郵件成功");
                unBlockUI_M();
                show_M("#mailDataTab");
            };
            var error = function (e) { Log_M("addMailData error=" + e); unBlockUI_M(); };
            ajax_M(mailHandlerUrl_G, data, success, error);
        };

        var closeSecondaryDiv = function () {
            var id = attr_M(this, "closeDivId");
            hide_M(id);
            show_M("#mailDataTab");
        };

        //進行頁面處理===============================================start
        var startThisPage = function () {
            //blockUI_M();
            if (isEmptyStr(MS_ID_G)) {
                getMailData();////查詢全部郵件資訊
                isPageList = true;
            } else {
                getSingleMailDetail();

            }

            if (!isPageList) {
                hide_M("#pageBar");
            }

            onClick_M("#deleteAllselect", deleteAllselect);
            onClick_M("#searchMailData", getMailData);
            onClick_M("#openAddMailDiv", openAddMailDiv);
            onClick_M("#addMailData", addMailData);//新增郵件
            onClick_M(".closeSecondaryDiv", closeSecondaryDiv);
            onClick_M("#Back", back);//設定返回按鈕
            //設定權限
            setPermission_M();

        };
        //進行頁面處理===============================================end

        $(function () {
            startThisPage();
            //查看使用者權限
            //getUserAuthority_M(startThisPage);
        })

    </script>
</asp:Content>

