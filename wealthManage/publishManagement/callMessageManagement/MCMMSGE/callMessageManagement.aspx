<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="callMessageManagement.aspx.cs" Inherits="wealthManage_publishManagement_callMessageManagement_MCMMSGE_callMessageManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .tabDivMargin3 {
          margin-left:20px;
          margin-right:20px;
          margin-top:5px;
        }
        .width10Per {
            width:7%;
        }
        .bgColor {
            background-color :  #ddd;
        }
        .pageSpan {
         font-size:12px;
        }
        
        #sendEditMessage {
            margin-right:0px;
        }
        .marginLeft10 {
            margin-left:10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                        <h1 class="box-title"><b>ERP &gt; 行政部 &gt; 外網-Call訊發佈管理</b> </h1>
                        <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title="">
                            
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <ul id="myTab" class="nav nav-tabs tabDivMargin3">
                            <li class="active">
                                <a id="#" href="#nextMonthSoonFallDueMemberDiv" data-toggle="tab" class="tabChange" openDivName="#callMessageSearchDiv">Call訊發佈查詢</a>
                            </li>
                            <li class="">
                                <a href="#" data-toggle="tab" class="tabChange" openDivName="#allPowerSendRecordDiv">詮力發送紀綠查詢</a>
                            </li>
                            <li class="">
                                <a href="#" data-toggle="tab" class="tabChange" openDivName="#callMessageDealDataDiv">Call訊成交資訊</a>
                            </li>
                        </ul>
                        <!--Call訊發佈查詢##########################################Start-->
                        <div id="callMessageSearchDiv" class="tabDivMargin5 tabChangeDiv">
        
                            <div id="callMessageSearchInerDiv" class="tabDivMargin4">
                            <table class="table">
                                <thead >
                                     <tr class="active">
                                
                                    <th class=""  colspan="12">
                                        <div class="input-group marginBottom-7">
                                            <span class="inputSearch" style="">
                                                <select id="MP" class="form-control" ></select>
                                            </span>
                     
                                            <span class="inputSearch marginRight20">
                                                <select id="MP_Item" class="form-control" ><option value="">請選擇</option></select>
                                            </span>
                                           
                                            <span class="inputSearch">
                                                <input type="text" id="StartDate" class="datepicker form-control today" placeholder="開始日">
                                            </span>
                                            <span class="inputSearch  marginRight20">
                                                <input type="text" id="EndDate" class="datepicker form-control today" placeholder="結束日">
                                            </span>
                                            <span class="inputSearch">
                                               <input type="text" name="message" placeholder="查尋關鍵字..." class="form-control" id="keyWord">
                                            </span>
                                            <span class="inputSearch">
                                              <button type="button" class="btn btn-info btn-flat marginTop-27" id="getMessageList">查詢</button>
                                            </span>
                                            <span class="inputSearch">
                                              <button type="button" id="openSendMessageDiv" class="btn btn-primary btn-flat addPer marginTop-27">簡訊發送</button>
                                            </span>
                                            <span class="inputSearch pageSpan">
                                              <span class="">page</span>&nbsp; <span class="">：</span>&nbsp;<span id ="pageNum" class=""></span>
                                            </span>
                                  
                                      </div>
                                    </th>

                            
                                </tr>
                                    <tr class="marginTop5px bgColor">
                                        <th class="textAlignCenter  leftSideWhite" style="width:4%">
                                            項次
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:7%">
                                            訊息總類
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:6%">
                                            分析師
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:6%">
                                            種類
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:25%">
                                            內容
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:25%">
                                          成交狀況
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:9%">
                                          發布時間
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:6%">
                                          發布人
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:4%">
                                          明細
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:3%">
                                          修
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:3%">
                                          刪
                                        </th>
                                    </tr>
                                </thead>
                                <tbody id="callMessageSearchTb">

                                </tbody>
                            </table>
                            </div>
                        </div>
                        <!--Call訊發佈查詢##########################################End-->
                        
                        <!--詮力發送紀綠#########################################Start-->
                        <div id="allPowerSendRecordDiv" class="tabDivMargin5 tabChangeDiv startHide">
        
                            <div id="allPowerSendRecordInerDiv" class="tabDivMargin4">
                            <table class="table">
                                <thead >
                                     <tr class="active">
                                
                                    <th class=""  colspan="12">
                                        <div class="input-group marginBottom-7">
                                            <span class="inputSearch" style="">
                                                <select id="apMP" class="form-control" ></select>
                                            </span>
                     
                                            <span class="inputSearch marginRight20">
                                                <select id="apMP_Item" class="form-control" ><option value="">請選擇</option></select>
                                            </span>
                                           
                                            <span class="inputSearch">
                                                <input type="text" id="apStartDate" class="datepicker form-control today" placeholder="開始日">
                                            </span>
                                            <span class="inputSearch  marginRight20">
                                                <input type="text" id="apEndDate" class="datepicker form-control today" placeholder="結束日">
                                            </span>
                                            <span class="inputSearch">
                                               <input type="text" name="message" placeholder="查尋關鍵字..." class="form-control" id="apKeyWord">
                                            </span>
                                            <span class="inputSearch">
                                              <button type="button" class="btn btn-info btn-flat marginTop-27" id="getAllPowerSendRecord">查詢</button>
                                            </span>
                                            <span class="inputSearch pageSpan">
                                              <span class="">page</span>&nbsp; <span class="">：</span>&nbsp;<span id ="apsrPageNum" class=""></span>
                                            </span>
                                      </div>
                                    </th>

                            
                                </tr>
                                    <tr class="marginTop5px bgColor">
                                        <th class="textAlignCenter  leftSideWhite" style="width:4%">
                                            項次
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:7%">
                                            電話
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:9%">
                                            師/種類
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:6%">
                                            字/通數
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:22%">
                                           內容
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:6%">
                                            發送狀況
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:6%">
                                          收訊狀況
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:9%">
                                          發訊時間
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:6%">
                                          發訊人
                                        </th>
                                    </tr>
                                </thead>
                                <tbody id="allPowerSendRecordTb">

                                </tbody>
                            </table>
                            </div>
                        </div>
                        <!--詮力發送紀綠#########################################End-->

                        <!--Call訊成交資訊#########################################Start-->
                        <div id="callMessageDealDataDiv" class="tabDivMargin5 tabChangeDiv startHide">
                             <div class="input-group marginLeft10">
                                           
                                            <span class="inputSearch" style="">
                                                <input type="text" id="cmddDate" class="datepicker form-control today" placeholder="日期">
                                            </span>
                                            <span class="inputSearch" style="">
                                                <select id="cmddMP"  class="form-control"></select>
                                            </span>
                             </div>
                            
                             <div id="callMessageDealDataInnerDiv">

                             </div>
                        </div>
                        <!--Call訊成交資訊#########################################end-->

                        <!--////***********-->
                        <div style="text-align:center" id="pageBarDiv" class="marginTop-130">
　                        <div id="pageBar" style="margin:0 auto;"> </div>
                        </div>
                        <div style="text-align:center" id="apsrPageBarDiv" class="marginTop-130 startHide">
　                        <div id="apsrPageBar" style="margin:0 auto;"> </div>
                        </div>

                        <div id="cmddEditDialog" class="form-control" title="修改">
                            <form class="">
                                <input type="text" class="form-control startHide" id="cmddEmsg_id" />
                                <p>簡訊內容：<input type="text" class="form-control" id="cmddEmsg_text" /></p>
                                <p>成交資訊：<input type="text" class="form-control" id="cmddeMS_TStatus"  /></p>
                                <div style="text-align:center" class="">
                                   <input type="button" class="btn btn-primary editMessageData" editType="cmdd" id="cmddEditMessageData" value="修改資料" />
                                </div>
                                 
                            </form>
                        </div>
                        <div id="my_dialog" class="form-control" title="修改">
                            <form class="">
                                <input type="text" class="form-control startHide" id="Emsg_id" />
                                <p>內容：<input type="text" class="form-control" id="Emsg_text" /></p>
                                <p>成交狀況：<input type="text" class="form-control" id="eMS_TStatus"  /></p>
                                <div style="text-align:center" class="">
                                   <input type="button" class="btn btn-primary editMessageData" editType="" id="editMessageData" value="修改資料" />
                                </div>
                                 
                            </form>
                        </div>
                        <div id="messageDetailDialog" class="form-control" title="訊息內容">
                            <form class="">
                                <input type="hidden" class="form-control" id="mdauto_id" />
                                <p>訊息內容：<input type="text" class="form-control" id="mdMsg_Context" /></p>
                                <div style="text-align:center" class="">
                                    <input type="button" class="btn btn-success mdAddDeleteEdit" id="mdEdit" value="修改資料" />
                                    <input type="button" class="btn btn-danger mdAddDeleteEdit" id="mdDelete" value="刪除資料" />
                                    <input type="button" class="btn btn-primary mdAddDeleteEdit" id="mdAdd" value="新增資料" />
                                </div>
                            </form>
                        </div>
                        <!--<div id="addStockOIdataDialog" class="form-control" title="新增股票留倉資料">
                            <form class="">
                                <input type="hidden" class="form-control" id="mdauto_id" />
                                <p>訊息內容：<input type="text" class="form-control" id="mdMsg_Context" /></p>
                                <div style="text-align:center" class="">
                                    <input type="button" class="btn btn-success mdAddDeleteEdit" id="mdEdit" value="修改資料" />
                                    <input type="button" class="btn btn-danger mdAddDeleteEdit" id="mdDelete" value="刪除資料" />
                                    <input type="button" class="btn btn-primary mdAddDeleteEdit" id="mdAdd" value="新增資料" />
                                </div>
                            </form>
                        </div>-->
                        <div id="sendMessageDialog" class="form-control" title="簡訊發布">
                            <form class="">
                                <p>發訓數量：<select id="smdType" class="form-control messagePublic"><option value="single">單筆</option><option value="multiple">批次</option></select></p>
                                <p>分析師：<select id="smdM_MP" class="form-control messagePublic ssmRequired smmRequired" FieldName="分析師"></select></p>
                                <p>種類&nbsp;:<br /><span id="allCheck" class="startHide"><input id="allCheckInput" type="checkbox" value="all" />全選</span>&nbsp;<span id="smdM_MP"></span><input type="hidden" id="singleMPitem" class="ssmRequired"  FieldName="種類"/><input type="hidden" id="multipleMPitem" class="smmRequired" FieldName="種類"/></p>
                                <p>電話號碼：<input type="text" class="form-control ssmRequired" id="smdM_TEL"  FieldName="電話號碼"/></p>
                                <p>簡訊範本：<input type="button" class="btn btn-info" id="getPublicMessage" value="帶入公用自訂簡訊" />&nbsp;&nbsp;<input type="button" class="btn btn-info" id="getAnalystMessage" value="當日分析師歷史簡訊" /></p>
                                <p><table class="table startHide MessageTab" id="publicMessageTab">
                                    <thead>
                                        <tr>
                                            <td style="width:10%" class="textAlignCenter">明細</td>
                                            <td style="width:90%" class="textAlignCenter">簡訊內容</td>
                                        </tr>
                                    </thead>
                                    <tbody id="publicMessageTb">

                                    </tbody>
                                   </table>
                                    <table class="table startHide MessageTab" id="analystMessageTab">
                                    <thead>
                                        <tr>
                                            <td style="width:10%" class="textAlignCenter">序號</td>
                                            <td style="width:10%" class="textAlignCenter">分析師</td>
                                            <td style="width:10%" class="textAlignCenter">簡訊種類</td>
                                            <td style="width:70%" class="textAlignCenter">簡訊內容</td>
                                        </tr>
                                    </thead>
                                    <tbody id="analystMessageTb">

                                    </tbody>
                                   </table></p>
                                <p>訊息內容：<textarea  type="text" class="form-control  ssmRequired smmRequired" id="smdM_Text" FieldName="訊息內容"></textarea></p>
                                <p>發布人員：<label id="smdAddUser"></label>&nbsp;-&nbsp;<label id="smdAddUserName"></label></p>
                                <div style="text-align:center" class="">
                                   <input type="button" class="btn btn-primary" id="sendMessage" value="確定送出" />
                                </div>
                                 
                            </form>
                        </div>

                    </div><!--/.box-body-->

                </div><!--/.box-->
                
            </div>
          </div><!-- /.row (main row) -->

        </section><!-- /.content -->
        
      </div>
     <script src="<%=getRelativePath()%>js/MasterPage.js" type="text/javascript"></script>
    <script src="<%=getRelativePath()%>js/pageList/callMessageManagement/getMessageListPageList.js" type="text/javascript"></script> 
    <script src="<%=getRelativePath()%>js/pageList/callMessageManagement/getAllPowerSendRecord.js" type="text/javascript"></script> 
    <script>
        var CallMessageManagementHandlerUrl_G = "callMessageManagementHandler.ashx";
        var MENU_no_G = "<%=getMENU_no()%>";
        var showPublicMessageTF_G = false;
        var getPublicMessageTF_G = false;
        var showAnalystMessageTF_G = false;
        var getAnalystMessageTF_G = false;
        //頁籤切換功能
        var tabChange = function () {
            var divId = $(this).attr("openDivName");
            switch (divId) {
                case "#callMessageSearchDiv":
                    show_M("#pageBarDiv");
                    hide_M("#apsrPageBarDiv");
                    break;
                case "#allPowerSendRecordDiv":
                    hide_M("#pageBarDiv");
                    show_M("#apsrPageBarDiv");
                    break;
                case "#callMessageDealDataDiv":
                    hide_M("#pageBarDiv");
                    hide_M("#apsrPageBarDiv");
                    break;
            }

            var tabChanges = $(".tabChange");
            var thisCloseId = undefined;
            $.each(tabChanges, function (i, v) {
                thisCloseId = $(v).attr("openDivName");
                hide_M(thisCloseId)
            });
            show_M(divId);
        };


        //取得分析師ListHtmlTagOption
        var afterSuccessFuc = function () {
            onChange_M("#MP", function () {
                var type = val_M("#MP");
                alert(type);
                $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#MP_Item", type, "option");
            });
        };

        var afterSuccessFucForAp = function () {
            onChange_M("#apMP", function () {
                var type = val_M("#apMP");
                $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#apMP_Item", type, "option");
            });
        };
        var getMitemCount = function (mp, mpItem) {
            Log_M("getMitemCount start");
            var data = "action=getMitemCount&MP=" + mp + "&MP_Item=" + mpItem;
            var success = function (back) {
                text_M("#" + mp + mpItem, "(" + back + ")");
                Log_M("getMitemCount back=" + back + "&MP=" + mp + "&MP_Item=" + mpItem);
            };
            var error = function (e) { Log_M("getMitemCount error=" + e); unBlockUI_M(); };
            ajax_M(CallMessageManagementHandlerUrl_G, data, success, error);
        };
        var getListByViewtag0 = function () {
            Log_M("getListByViewtag0 start");
            var mp = val_M("#smdM_MP");
            var data = "action=getListByViewtag0&listType=" + mp;
            var success = function (back) {
                Log_M("getListByViewtag0success back=" + back);
                var json = jsonParse_M(back);
                $.each(json, function (i,v) {
                    getMitemCount(mp, v.ditcode);
                })
            };
            var error = function (e) { Log_M("getListByViewtag0 error=" + e); unBlockUI_M(); };
            ajax_M(CommonHandlerUrl_M, data, success, error);
        };
        var afterSuccessFucForSmd = function () {
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
       
        var getTodayToInputDate = function () {
            var dd = new Date();
            var year = dd.getFullYear();
            var month = dd.getMonth() + 1;
            var date = dd.getDate();
            var today = month + "/" + date + "/" + year;
            val_M(".today", today);
        };
        var editDataFuc = function () {
            val_M("#Emsg_id",attr_M(this,"msg_id"));
            val_M("#Emsg_text",attr_M(this,"msg_text"));
            val_M("#eMS_TStatus",attr_M(this,"MS_TStatus"));
            $('#my_dialog').dialog('open');
        };
        var cmddEditDataFuc = function () {
            val_M("#cmddEmsg_id", attr_M(this, "msg_id"));
            val_M("#cmddEmsg_text", attr_M(this, "msg_text"));
            val_M("#cmddeMS_TStatus", attr_M(this, "MS_TStatus"));
            $('#cmddEditDialog').dialog('open');
        };
        var openSendMessageDiv = function () {
            text_M("#smdAddUserName",U_Name_M);
            text_M("#smdAddUser", U_Num_M);
            $('#sendMessageDialog').dialog('open');
        };
        var getMessageList = function () {
            var MP = val_M("#MP");
            var MP_Item = val_M("#MP_Item");
            var StartDate = val_M("#StartDate");
            var EndDate = val_M("#EndDate");
            var keyWord = val_M("#keyWord");
            var data = "MP=" + MP + "&MP_Item=" + MP_Item + "&StartDate=" + StartDate + "&EndDate=" + EndDate + "&keyWord=" + keyWord + "&U_MDEP=" + U_MDEP_M + "&U_POSITION=" + U_POSITION_M + "&ComID=" + ComID_M + "&U_Leader=" + U_Leader_M + "&U_Num=" + U_Num_M + "&action=getMessageList";

            var success = function (back) {
                var json = jsonParse_M(back);
                $getMessageListPageList.Table.makeTbody("#callMessageSearchTb", json, 10, "#pageBar", deleteMessageData, editDataFuc);
            };
            var error = function (e) { Log_M("getMessageList error=" + e); unBlockUI_M(); };
            ajax_M(CallMessageManagementHandlerUrl_G, data, success, error);

        };

        var deleteMessageData = function () {
            var msg_id = val_M(this, "msg_id");
            var r = confirm("刪除後資料將無法恢復，確定刪除?");
            if (r == true) {
                var data = "msg_id=" + msg_id + "&action=deleteMessageData";
                var success = function (back) {
                    if (back == "成功") {
                        alert("刪除資料成功");
                        location.reload();
                    }
                };
                var error = function (e) { Log_M("deleteMessageData error=" + e); unBlockUI_M(); };
                ajax_M(CallMessageManagementHandlerUrl_G, data, success, error);
            }
        };

        var editMessageData = function () {
            var editType = attr_M(this, "editType");
            var msg_id = undefined;
            var msg_text = undefined;
            var MS_TStatus = undefined;
            if (isEmptyStr(editType)) {
                msg_id = val_M("#Emsg_id");
                msg_text = val_M("#Emsg_text");
                MS_TStatus = val_M("#eMS_TStatus");
            } else {
                msg_id = val_M("#cmddEmsg_id");
                msg_text = val_M("#cmddEmsg_text");
                MS_TStatus = val_M("#cmddeMS_TStatus");
            }
           
            var data = "msg_id=" + msg_id + "&msg_text=" + msg_text + "&MS_TStatus=" + MS_TStatus + "&action=editMessageData";
            var success = function (back) {
                if (back == "成功") {
                    if (isEmptyStr(editType)) {
                        $('#my_dialog').dialog('close');
                    } else {
                        $('#cmddEditDialog').dialog('close');
                    }
                    alert("修改資料成功");
                    if (isEmptyStr(editType)) {
                        getMessageList();
                    } else {
                        getCallMessageDealData();
                    }
                }
            };
            var error = function (e) { Log_M("editMessageData error=" + e); unBlockUI_M(); };
            ajax_M(CallMessageManagementHandlerUrl_G, data, success, error);
        };

        var getAllPowerSendRecord = function () {
            var MP = val_M("#apMP");
            var MP_Item = val_M("#apMP_Item");
            var StartDate = val_M("#apStartDate");
            var EndDate = val_M("#apEndDate");
            var keyWord = val_M("#apKeyWord");

            var data = "MP=" + MP + "&MP_Item=" + MP_Item + "&StartDate=" + StartDate + "&EndDate=" + EndDate + "&keyWord=" + keyWord + "&U_MDEP=" + U_MDEP_M + "&U_POSITION=" + U_POSITION_M + "&ComID=" + ComID_M + "&U_Leader=" + U_Leader_M + "&U_Num=" + U_Num_M + "&action=getAllPowerSendRecord";
            var success = function (back) {
                Log_M("back=" + back);
                var json = jsonParse_M(back);
                $getAllPowerSendRecord.Table.makeTbody("#allPowerSendRecordTb", json, 10, "#apsrPageBar");
            };
            var error = function (e) { Log_M("getAllPowerSendRecord error=" + e); unBlockUI_M(); };
            ajax_M(CallMessageManagementHandlerUrl_G, data, success, error);
        };

        var MPcallMessageChange = function () {
            var val = val_M(this);
            hide_M(".allShow");
            show_M("." + val);
        };

        var getCallMessageDealData = function () {
            var MP = val_M("#cmddMP");
            var StartDate = val_M("#cmddDate");
            if (MP == "allShow") {
                MP = "";
            }
            var data = "MP=" + MP + "&searchDate=" + StartDate  + "&U_MDEP=" + U_MDEP_M + "&ComID=" + ComID_M + "&action=getCallMessageDealData";
            var success = function (back) {
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                var sbSelect = new StringBuilder_M();
                empty_M("#callMessageDealDataInnerDiv");
                empty_M("#cmddMP");
                sbSelect.append("<option value='");
                sbSelect.append("allShow");
                sbSelect.append("'>");
                sbSelect.append("不限");
                sbSelect.append("</option>");
                $.each(json, function (i, v) {
                    
                    if (v.length != 0) {
                        sbSelect.append("<option value='");
                        sbSelect.append(v[0].MP);
                        sbSelect.append("'>");
                        sbSelect.append(v[0].MPname);
                        sbSelect.append("</option>");
                 
                        sb.append("<table  class='allShow table margin10 ");
                        sb.append(v[0].MP);
                        sb.append("'>");
                        sb.append("<thead>");
                        sb.append("<tr>");
                        sb.append("<th colspan='4' class='textAlignCenter'>");
                        sb.append(v[0].MPname);
                        sb.append("</th>");
                        sb.append("</tr>");
                        sb.append("<tr>");
                        sb.append("<th class='textAlignCenter  leftSideWhite' style='width:17%'>項目</th>");
                        sb.append("<th class='textAlignCenter  leftSideWhite' style='width:33%'>簡訊內容</th>");
                        sb.append("<th class='textAlignCenter  leftSideWhite' style='width:33%'>成交資訊</th>");
                        sb.append("<th class='textAlignCenter  leftSideWhite' style='width:17%'>修改</th>");
                        sb.append("</tr>");
                        sb.append("</thead>");
                        sb.append("<tbody>");
                    $.each(v, function (ii, vv) {
                        sb.append("<tr>");
                        sb.append("<td class='textAlignCenter  leftSideWhite'>");
                        sb.append(vv.MP_ItemName);
                        sb.append("</td>");
                        sb.append("<td>");
                        sb.append(vv.msg_text);
                        
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter  leftSideWhite'>");
                        sb.append(vv.MS_TStatus);
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter  leftSideWhite'><a href='javascript:void(0)' class='cmddEditDataFuc' msg_id='");
                        sb.append(vv.msg_id);
                        sb.append("' msg_text='");
                        sb.append(vv.msg_text);
                        sb.append("' MS_TStatus='");
                        sb.append(vv.MS_TStatus);
                        sb.append("'>");
                        sb.append("修改");
                        sb.append("</a></td>");
                        sb.append("</tr>");
                    });
                        sb.append("</tbody>");
                        sb.append("</table>");
                    }
                });
                append_M("#callMessageDealDataInnerDiv", sb.toString());
                append_M("#cmddMP", sbSelect.toString());
                onChange_M("#cmddMP", MPcallMessageChange);
                onClick_M(".cmddEditDataFuc", cmddEditDataFuc);
            };
            var error = function (e) { Log_M("getCallMessageDealData error=" + e); unBlockUI_M(); };
            ajax_M(CallMessageManagementHandlerUrl_G, data, success, error);
        };

        var getPublicMessageDetail = function () {
            var auto_id = attr_M(this, "auto_id");
            var Msg_Context = attr_M(this, "Msg_Context");
            val_M("#mdMsg_Context", Msg_Context);
            val_M("#mdauto_id", auto_id);
            $('#messageDetailDialog').dialog('open');
        };

        var getAnalystMessage = function () {
            hide_M("#publicMessageTab");
            var MP = val_M("#smdM_MP");
            var data = "MP=" + MP + "&action=getAnalystMessage";
            Log_M("getAnalystMessage data=" + data);
            var success = function (back) {
                empty_M("#analystMessageTb");
                Log_M("getAnalystMessage back=" + back);
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                $.each(json, function (i, v) {
                    sb.append("<tr>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.msg_id);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.MPname);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.MP_ItemName);
                    sb.append("</td>");
                    sb.append("<td><a href='#masterTop' class='bringData' auto_id='");
                    sb.append(v.msg_id);
                    sb.append("' Msg_Context='");
                    sb.append(v.msg_text);
                    sb.append("' MsgType='Analyst'>");
                    sb.append(v.msg_text);
                    sb.append("</a></td>");
                    sb.append("</tr>");
                });
                append_M("#analystMessageTb", sb.toString());
                onClick_M(".bringData", bringData);
                show_M("#analystMessageTab");
            };
            var error = function (e) { Log_M("getAnalystMessage error=" + e); unBlockUI_M(); };
            ajax_M(CallMessageManagementHandlerUrl_G, data, success, error);
        };

        var getPublicMessage = function () {
            hide_M("#analystMessageTab");
            if (!showPublicMessageTF_G) {
                if (!getPublicMessageTF_G) {
                    var data = "action=getPublicMessage";
                    var success = function (back) {
                        empty_M("#publicMessageTb");
                        Log_M("getPublicMessage back=" + back);
                        var json = jsonParse_M(back);
                        var sb = new StringBuilder_M();
                        $.each(json, function (i, v) {
                            sb.append("<tr>");
                            sb.append("<td class='textAlignCenter'><a href='javascript:void(0)' class='getPublicMessageDetail' auto_id='");
                            sb.append(v.auto_id);
                            sb.append("' Msg_Context='");
                            sb.append(v.Msg_Context);
                            sb.append("'>");
                            sb.append(i + 1);
                            sb.append("</a></td>");
                            sb.append("<td><a href='#masterTop' class='bringData' auto_id='");
                            sb.append(v.auto_id);
                            sb.append("' Msg_Context='");
                            sb.append(v.Msg_Context);
                            sb.append("' MsgType='public'>");
                            sb.append(v.Msg_Context);
                            sb.append("</a></td>");
                            sb.append("</tr>");
                        });
                        append_M("#publicMessageTb", sb.toString());
                        onClick_M(".getPublicMessageDetail", getPublicMessageDetail);
                        onClick_M(".bringData", bringData);
                        show_M("#publicMessageTab");
                    };
                    var error = function (e) { Log_M("getPublicMessage error=" + e); unBlockUI_M(); };
                    ajax_M(CallMessageManagementHandlerUrl_G, data, success, error);
                    showPublicMessageTF_G = true;
                    getPublicMessageTF_G = true;
                } else {
                    show_M("#publicMessageTab");
                    showPublicMessageTF_G = true;
                }
            } else {
                showPublicMessageTF_G = false;
                hide_M("#publicMessageTab");
            }
        };

        var bringData = function () {
            var Msg_Context = attr_M(this, "Msg_Context");
            empty_M("#smdM_Text");
            val_M("#smdM_Text", Msg_Context);
            var MsgType = attr_M(this, "MsgType");
            if (MsgType == "public") {
                getPublicMessageTF_G = true;
                showPublicMessageTF_G = false;
            }
            hide_M(".MessageTab");
            $('#messageDetailDialog').dialog('close');
        };

        var mdAddDeleteEdit = function () {
            var dataAction = attr_M(this, "id");
            var auto_id = val_M("#mdauto_id");
            var Msg_Context = val_M("#mdMsg_Context");
            var data = "auto_id=" + auto_id + "&Msg_Context=" + Msg_Context + "&dataAction=" + dataAction + "&actionUser=" + U_Num_M + "&action=mdAddDeleteEdit";
            var success = function (back) {
                if (back == "成功") {
                    var backStr = "";
                    switch (dataAction) {
                        case "mdAdd":
                            backStr == "新增";
                            break;
                        case "mdDelete":
                            backStr == "刪除";
                            break;
                        case "mdEdit":
                            backStr == "修改";
                            break;
                    }
                    showPublicMessageTF_G=false;
                    getPublicMessageTF_G = false;
                    getPublicMessage();
                    alert(backStr + back);
                }
            };
            var error = function (e) { Log_M("mdAddDeleteEdit error=" + e); unBlockUI_M(); };
            ajax_M(CallMessageManagementHandlerUrl_G, data, success, error);
            $("#messageDetailDialog").dialog("close");
        };

       

        var sendMessage = function () {
            
            var smdType = val_M("#smdType");
            var emptyCheckTF = false;
            var emptyFieldName = "";
            if (smdType == "single") {
                var singleMPitem = val_M('input[class=singleMPitem]:checked');
                val_M("#singleMPitem", singleMPitem);
                var ssmRequiredVals = $(".ssmRequired");
                $.each(ssmRequiredVals, function (i, v) {
                    if (isEmptyStr(val_M(v))) {
                        emptyCheckTF = true;
                        emptyFieldName=attr_M(v, "FieldName");
                    }
                   
                });
            } else {
        
                var multipleMPitems = $('input[class=multipleMPitem]:checked');
                    var multipleMPitem = "";
                    if (multipleMPitems.length != 0) {
                        $.each(multipleMPitems, function (i, v) {
                            if (i == 0) {
                                multipleMPitem = val_M(v);
                            } else {
                                multipleMPitem += ",";
                                multipleMPitem += val_M(v);
                            }
                        });
                    }
                    val_M("#multipleMPitem", multipleMPitem);
              
                
                var smmRequiredVals = $(".smmRequired");
                $.each(smmRequiredVals, function (i, v) {
                    if (isEmptyStr(val_M(v))) {
                        emptyCheckTF = true;
                        emptyFieldName = attr_M(v, "FieldName");
                    }
                });
            }
            if (emptyCheckTF) {
                alert(emptyFieldName + "欄位不可為空值");
            } else {
                
                var M_Text = val_M("#smdM_Text");
                var charCount = M_Text.length;
                
                
            /*var charCount = M_Text.length;
            var hasCinese = false;
            
            for (var i = 0; i < charCount; i++) {
                if (isChinese_M(M_Text.charAt(i))) {
                    hasCinese = true;
                    break;
                }
            }*/
                //驗證是否有中文
                var hasCineseTF = hasChineseCharTF_M(M_Text);
                /*
                var Quotient = 0;//商
            var Remainder = 0;//餘
            var messageCount = 0;//餘
            if (hasCinese) {
                Quotient = parseInt(charCount / 70);
                Remainder = charCount % 70;
                if (Remainder > 0) {
                    messageCount = Quotient + 1;
                } else {
                    messageCount = Quotient;
                }
            } else {
                Quotient = parseInt(charCount / 137);
                Remainder = charCount % 137;
                if (Remainder > 0) {
                    messageCount = Quotient + 1;
                } else {
                    messageCount = Quotient;
                }
            }*/
                //計算簡訊幾則
                var messageCount = countMessageChar_M(hasCineseTF, charCount);
            var goNext = confirm("訊息共" + charCount + "字，簡訊" + messageCount + "則，確認送出?");
            if (goNext) {
                var M_MITem = "";
                var data = "";
                var M_Text = val_M("#smdM_Text");
                var M_MP = val_M("#smdM_MP");
                if (smdType == "single") {
                    var M_TEL = val_M("#smdM_TEL");
                    M_MITem = val_M("#singleMPitem");
                    data = "smdType=" + smdType + "&M_MP=" + M_MP + "&M_TEL=" + M_TEL + "&M_Text=" + M_Text + "&M_MITem=" + M_MITem + "&add_user=" + U_Num_M + "&add_ip=" + IP_M + "&messageCount=" + messageCount + "&action=sendMessage";
                } else {
                    M_MITem = val_M("#multipleMPitem");
                    data = "smdType=" + smdType + "&M_MP=" + M_MP + "&M_Text=" + M_Text + "&M_MITem=" + M_MITem + "&add_user=" + U_Num_M + "&add_ip=" + IP_M + "&messageCount=" + messageCount + "&action=sendMessage";
                }
                    Log_M("data=" + data);
                    var success = function (back) {
                        Log_M("sendMessage back=" + back);
                        if (back == "成功") {
                            alert("訊息已成功寄出");
                            $('#sendMessageDialog').dialog('close');
                        }
                    };
                    var error = function (e) { Log_M("sendMessage error=" + e); unBlockUI_M(); };
                    ajax_M(CallMessageManagementHandlerUrl_G, data, success, error);

            } else {
                alert("未送出");
            }
            }
            
        };

        var allCheckClick = function () {
            var allCheckTF = $("#allCheckInput").prop("checked");
            var mp = val_M("#smdM_MP");
            $("input[name='" + mp + "']").prop("checked", allCheckTF);
        };

        var startThisPage = function () {
            onClick_M(".tabChange", tabChange);

            //取得分析師ListHtmlTagOption
            //20230216mark
            $Common.MUSER.getAnalystListHtmlTagOptionForMessageSearch(CommonHandlerUrl_M, "#MP", ComID_M, U_MDEP_M, U_POSITION_M, U_Leader_M, U_Num_M, afterSuccessFuc);
            $Common.MUSER.getAnalystListHtmlTagOptionForAllPowerSendRecord(CommonHandlerUrl_M, "#apMP", ComID_M, U_MDEP_M, U_POSITION_M, U_Leader_M, U_Num_M, afterSuccessFucForAp);
            $Common.MUSER.getAnalystListHtmlTagOptionForAllPowerSendRecord(CommonHandlerUrl_M, "#smdM_MP", ComID_M, U_MDEP_M, U_POSITION_M, U_Leader_M, U_Num_M, afterSuccessFucForSmd);

            getTodayToInputDate();
            getMessageList();
            getAllPowerSendRecord();
            getCallMessageDealData();
           
            $('#my_dialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width:800,
            });
            $('#cmddEditDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 800,
            });
            $('#sendMessageDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 800,
            });
            $('#messageDetailDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 800,
            });
            $('#AddStockOIdataDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 800,
            });

            onClick_M(".editMessageData", editMessageData);
            onClick_M("#getMessageList", getMessageList);//綁定查詢功能\
            onClick_M("#getAllPowerSendRecord", getAllPowerSendRecord);
            onClick_M("#openSendMessageDiv", openSendMessageDiv);
            onClick_M("#sendMessage", sendMessage);
            onClick_M("#getPublicMessage", getPublicMessage);
            onClick_M("#getAnalystMessage", getAnalystMessage);
            onClick_M(".mdAddDeleteEdit", mdAddDeleteEdit);
            onClick_M("#allCheckInput", allCheckClick);
            onChange_M("#cmddDate", getCallMessageDealData);
            //設定權限
            setPermission_M();
        };
      
        $(function () {
            //查看使用者權限
            getUserAuthority_M(startThisPage);
        })
    </script>
</asp:Content>

