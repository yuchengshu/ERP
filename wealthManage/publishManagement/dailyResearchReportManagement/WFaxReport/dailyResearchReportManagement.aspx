<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="dailyResearchReportManagement.aspx.cs" Inherits="wealthManage_publishManagement_dailyResearchReportManagement_dailyResearchReportManagement"  validateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .pageSpan1 {
             display: inline-block; width:150px;margin-left:100px;
        }
        .tabChangeDiv1 {

            margin-bottom:100px;
        }
        .color72afd2 {
            color:#72afd2;
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
                        <h1 class="box-title"><b>ERP &gt; 網站維護 &gt; 會員研究日報發佈查詢</b> </h1>
                        <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title="">
                            
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div id="dailyResearchReportSearchDiv" class="tabDivMargin5 tabChangeDiv1">
        
                            <div id="dailyResearchReportSearchInerDiv" class="tabDivMargin4">
                            <table class="table">
                                <thead >
                                     <tr class="active">
                                
                                    <th class=""  colspan="11">
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
                                              <button type="button" class="btn btn-info btn-flat qPer marginTop-27" id="getDailyResearchReportList">查詢</button>
                                            </span>
                                             <span class="inputSearch">
                                              <button type="button" id="getClosingPriceThreeBigData" class="btn btn-primary btn-flat qPer marginTop-27">三大收盤資訊</button>
                                            </span>
                                            <span class="inputSearch">
                                              <button type="button" id="openAddDailyResearchReportDiv" class="btn btn-primary btn-flat addPer marginTop-27 openDailyResearchReportDiv" actionType="add">新增研究日報</button>
                                            </span>
                                            <span class="inputSearch pageSpan1">
                                              <span class="">page</span>&nbsp; <span class="">：</span>&nbsp;<span id ="pageNum" class=""></span>
                                            </span>
                                  
                                      </div>
                                    </th>

                            
                                </tr>
                                    <tr class="marginTop5px bgColor">
                                        <th class="textAlignCenter  leftSideWhite" style="width:10%">
                                            項次
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:10%">
                                            開/關
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:10%">
                                            日期
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:10%">
                                            會員類別
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:10%">
                                            文件類型
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:10%">
                                          分析師
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:10%">
                                          等級
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:20%">
                                         標題
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:5%">
                                          修
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:5%">
                                          刪
                                        </th>
                                    </tr>
                                </thead>
                                <tbody id="dailyResearchReportSearchTb">

                                </tbody>
                            </table>
                            </div>
                        </div>
                        <!--新增研究日報資料start-->
                         <div id="addResearchReportDiv" class="divBorder startHide">
                            <div id="addResearchReportDivTitle" class="marginLeftRight10 titleBottomBorder">
                                <h2>新修研究日報資料
                                    <div class="btn-group" data-toggle="btn-toggle"  style="margin-right:0 auto;float: right;">
                                         <button id="" type="button" class="btn closeBtn btn-flat closeSecondaryWindow">X</button>
                                    </div>
                                </h2>
                            </div>
                            <table class="table">
                                <thead>

                                </thead>
                                <tbody>
                                    <tr>
                                        <td class='text-center'>開啟/關閉<input type="hidden" id="F_id" /></td>
                                        <td><select class="form-control" id="Open_tag"><option value="1">關閉</option><option value="0">開啟</option></select>請選擇是否開啟此研究日報內容 </td>
                                    </tr>
                                    <tr>
                                        <td class='text-center'>有效日期</td>
                                        <td>起始日<input type="text" id="F_SDate" class="datepicker form-control"/><br />
                                            結束日<input  id="F_EDate" type="text" class="form-control datepicker"/></td>
                                    </tr>
                                    <tr>
                                        <td class='text-center'>分析師</td>
                                        <td><select class="form-control" id="P_id"></select></td>
                                    </tr>
                                    <tr>
                                        <td class='text-center'>等級</td>
                                        <td><select class="form-control" id="Pay">
                                            <option value=''>不限</option>
                                            <option value='0001'>普通會員</option>
                                            <option value='0002' selected>付費會員</option>
                                            <option value='0004'>試用會員</option>
                                            <option value='0005'>試用一指賺</option>
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td class='text-center'>研究日報/研究報告</td>
                                        <td><select class="form-control" id="F_Item" ><option value="0">研究日報</option><option value="1">研究報告</option></select></td>
                                    </tr>
                                    <tr>
                                        <td class='text-center'>會員總類</td>
                                        <td><select class="form-control" id="U_Item"></select></td>
                                    </tr>
                                    <tr>
                                        <td class='text-center'>標題</td>
                                        <td><input type="text" class="form-control" value="-研究報告" id="F_Title"/></td>
                                    </tr>
                                    <tr>
                                        <td class='text-center'>日期</td>
                                        <td><input type="text" class="form-control" id="F_VDate"/>輸入所要顯示的日期格式 </td>
                                    </tr>
                                    <tr>
                                        <td class='text-center'>主文區</td>
                                        <td><textarea  id="F_Context"></textarea></td>
                                    </tr>
                                    <tr class="editHide">
                                        <td class='text-center'>圖檔</td>
                                        <td>圖檔1:<input type="text" class="form-control" id="F_img1"/><br />
                                            圖檔2:<input type="text" class="form-control" id="F_img2"/><br />
                                            圖檔3:<input type="text" class="form-control" id="F_img3"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='text-center'>PDF檔URL</td>
                                        <td><input type="text" class="form-control" id="PDFurl"/></td>
                                    </tr>
                                     <tr class="addHide">
                                        <td class='text-center'>個股分析</td>
                                        <td><table class="table">
                                            <thead>
                                                <tr>
                                                    <th class='text-center' style="width:10%">序</th>
                                                    <th class='text-center' style="width:20%">股名</th>
                                                    <th class='text-center' style="width:35%">個股基礎</th>
                                                    <th class='text-center' style="width:35%">備註</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th class='text-center'><div class="spaceCenter1">1</div></th>
                                                    <th class='text-center '><input type="text" class="form-control spaceCenter" id="Stock1"/></th>
                                                    <th class='text-center'><textarea class="form-control" id="Stock_Text1"></textarea></th>
                                                    <th class='text-center'><textarea class="form-control" id="Stock_Note1"></textarea></th>
                                                </tr>
                                                <tr>
                                                    <th class='text-center'><div class="spaceCenter1">2</div></th>
                                                    <th class='text-center'><input type="text" class="form-control spaceCenter" id="Stock2"/></th>
                                                    <th class='text-center'><textarea class="form-control" id="Stock_Text2"></textarea></th>
                                                    <th class='text-center'><textarea class="form-control" id="Stock_Note2"></textarea></th>
                                                </tr>
                                                <tr>
                                                    <th class='text-center'><div class="spaceCenter1">3</div></th>
                                                    <th class='text-center'><input type="text" class="form-control spaceCenter" id="Stock3"/></th>
                                                    <th class='text-center'><textarea class="form-control" id="Stock_Text3"></textarea></th>
                                                    <th class='text-center'><textarea class="form-control" id="Stock_Note3"></textarea></th>
                                                </tr>
                                                <tr>
                                                    <th class='text-center'><div class="spaceCenter1">4</div></th>
                                                    <th class='text-center'><input type="text" class="form-control spaceCenter" id="Stock4"/></th>
                                                    <th class='text-center'><textarea class="form-control" id="Stock_Text4"></textarea></th>
                                                    <th class='text-center'><textarea class="form-control" id="Stock_Note4"></textarea></th>
                                                </tr>
                                                <tr>
                                                    <th class='text-center'><div class="spaceCenter1">5</div></th>
                                                    <th class='text-center'><input type="text" class="form-control spaceCenter" id="Stock5"/></th>
                                                    <th class='text-center'><textarea class="form-control" id="Stock_Text5"></textarea></th>
                                                    <th class='text-center'><textarea class="form-control" id="Stock_Note5"></textarea></th>
                                                </tr>
                                                <tr>
                                                    <th class='text-center'><div class="spaceCenter1">6</div></th>
                                                    <th class='text-center'><input type="text" class="form-control spaceCenter" id="Stock6"/></th>
                                                    <th class='text-center'><textarea class="form-control" id="Stock_Text6"></textarea></th>
                                                    <th class='text-center'><textarea class="form-control" id="Stock_Note6"></textarea></th>
                                                </tr>
                                                <tr>
                                                    <th class='text-center'><div class="spaceCenter1">7</div></th>
                                                    <th class='text-center'><input type="text" class="form-control spaceCenter" id="Stock7"/></th>
                                                    <th class='text-center'><textarea class="form-control" id="Stock_Text7"></textarea></th>
                                                    <th class='text-center'><textarea class="form-control" id="Stock_Note7"></textarea></th>
                                                </tr>
                                                <tr>
                                                    <th class='text-center'><div class="spaceCenter1">8</div></th>
                                                    <th class='text-center'><input type="text" class="form-control spaceCenter" id="Stock8"/></th>
                                                    <th class='text-center'><textarea class="form-control" id="Stock_Text8"></textarea></th>
                                                    <th class='text-center'><textarea class="form-control" id="Stock_Note8"></textarea></th>
                                                </tr>
                                                <tr>
                                                    <th class='text-center'><div class="spaceCenter1">9</div></th>
                                                    <th class='text-center'><input type="text" class="form-control spaceCenter" id="Stock9"/></th>
                                                    <th class='text-center'><textarea class="form-control" id="Stock_Text9"></textarea></th>
                                                    <th class='text-center'><textarea class="form-control" id="Stock_Note9"></textarea></th>
                                                </tr>
                                                <tr>
                                                    <th class='text-center'><div class="spaceCenter1">10</div></th>
                                                    <th class='text-center'><input type="text" class="form-control spaceCenter" id="Stock10"/></th>
                                                    <th class='text-center'><textarea class="form-control" id="Stock_Text10"></textarea></th>
                                                    <th class='text-center'><textarea class="form-control" id="Stock_Note10"></textarea></th>
                                                </tr>
                                            </tbody>
                                            </table></td>
                                    </tr>
                                    <tr>
                                        <td class='text-center' colspan="2"><input type="button" class="btn btn-primary" value="送出資料" id="sendReseachReportData"/></td>
                                    </tr>
                                </tbody>
                            </table>
                           
                        </div>
                        <!--新增研究日報資料end-->
                        <!--新增三大收盤資料start-->
                        <div id="ThreeBigDataDialog" class="form-control" title="新修收盤三大資訊">
                           
                                 <table class="table">
                                <thead>

                                </thead>
                                <tbody>
                                    <tr>
                                        <td class='text-center'>日期<input type="hidden" id="WFT_id" class="form-control" /></td>
                                        <td><input type="text" id="WFT_date" class="form-control datepicker"/></td>
                                    </tr>
                                    <tr>
                                        <td class='text-center'>集中市場</td>
                                        <td>
                                            <input type="text" id="WFT_TSE_T1"  class="form-control" placeholder="指數"/><br />
                                            <input type="text" id="WFT_TSE_T2"  class="form-control" placeholder="漲跌"/><br />
                                            <input type="text" id="WFT_TSE_T3"  class="form-control" placeholder="成交"/><br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='text-center'>店頭市場</td>
                                        <td>
                                            <input type="text" id="WFT_OTC_T1"  class="form-control" placeholder="指數"/><br />
                                            <input type="text" id="WFT_OTC_T2"  class="form-control" placeholder="漲跌"/><br />
                                            <input type="text" id="WFT_OTC_T3"  class="form-control" placeholder="成交"/><br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='text-center'>三大法人</td>
                                        <td>
                                            <input type="text" id="WFT_II_T1"  class="form-control" placeholder="外資"/><br />
                                            <input type="text" id="WFT_II_T2"  class="form-control" placeholder="投信"/><br />
                                            <input type="text" id="WFT_II_T3"  class="form-control" placeholder="自營(自)"/><br />
                                            <input type="text" id="WFT_II_T4"  class="form-control" placeholder="自營(避)"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='text-center' colspan="2"><input type="button" class="btn btn-primary" value="送出資料" id="sendThreeBigData"/></td>
                                    </tr>
                                </tbody>
                            </table>
                            
                            
                        </div>
                        <!--新增三大收盤資料end-->
                        <!--查詢三大收盤資料start-->
                        <div id="closingPriceThreeBigDataDialog" class="form-control" title="收盤三大資訊">
                            <form class="">
                                <p>
                                    <table class="table " id="">
                                    <thead>
                                        <tr>
                                            <td style="width:10%" class="textAlignCenter"><input type='button' class='addPer openThreeBigDataDialog btn btn-primary' actionType="add" value='新增' /></td>
                                            <td style="width:70%" class="textAlignCenter">日期</td>
                                            <td style="width:10%" class="textAlignCenter">修</td>
                                            <td style="width:10%" class="textAlignCenter">刪</td>
                                        </tr>
                                    </thead>
                                    <tbody id="closingPriceThreeBigDataTb">
                                       
                                    </tbody>
                                   </table></p>
                            </form>
                        </div>
                        <!--查詢三大收盤資料end-->
                        <!--////***********-->
                        
                        <!--////***********-->
                        <div style="text-align:center" id="pageBarDiv" class="marginTop-130">
　                        <div id="pageBar" style="margin:0 auto;"> </div>
                        </div>
                    </div><!--/.box-body-->
                </div><!--/.box-->
            </div>
          </div><!-- /.row (main row) -->
        </section><!-- /.content -->
      </div>
     <script src="<%=getRelativePath()%>js/MasterPage.js" type="text/javascript"></script>
    <script src="<%=getRelativePath()%>js/pageList/dailyResearchReportManagementPageList.js" type="text/javascript"></script> 
    
    <script>
        var DailyResearchReportManagementHandlerUrl_G = "dailyResearchReportManagementHandler.ashx";
        var MENU_no_G = "<%=getMENU_no()%>";
        var ActionType_G = undefined;
        var RrdActionType_G = undefined;
        var getTodayToInputDate = function () {
            var dd = new Date();
            var year = dd.getFullYear();
            var month = dd.getMonth() + 1;
            var date = dd.getDate();
            var today = month + "/" + date + "/" + year;
            val_M(".today", today);
        };
 
        var deleteDailyResearchReportFuc = function () {
            var F_id = attr_M(this, "F_id");
            var r = confirm("刪除後資料將無法恢復，確定刪除?");
            if (r == true) {
                var data = "F_id=" + F_id + "&action=deleteDailyResearchReportFuc";
                var success = function (back) {
                    if (back == "成功") {
                        getDailyResearchReportList();
                        alert("刪除資料成功");
                    }
                };
                var error = function (e) { Log_M("deleteDailyResearchReportFuc error=" + e); unBlockUI_M(); };
                ajax_M(DailyResearchReportManagementHandlerUrl_G, data, success, error);
            }
        };
        var editDataFuc = function () {
            var F_id = attr_M(this, "F_id");
            var Open_tag = attr_M(this, "Open_tag");
            var u_num = attr_M(this, "u_num");
            var Pay = attr_M(this, "Pay");
            var F_Item = attr_M(this, "F_Item");
            var U_Item = attr_M(this, "U_Item");
            var F_Title = attr_M(this, "F_Title");
            var F_SDate = attr_M(this, "F_SDate");
            var F_EDate = attr_M(this, "F_EDate");
            var F_VDate = attr_M(this, "F_VDate");
            var PDFurl = attr_M(this, "PDFurl");
            var F_Context = attr_M(this, "F_Context");
            var F_img1 = attr_M(this, "F_img1");
            var F_img2 = attr_M(this, "F_img2");
            var F_img3 = attr_M(this, "F_img3");
            Log_M("F_id=" + F_id + " Open_tag=" + Open_tag + " u_num=" + u_num + " Pay=" + Pay + " F_Item=" + F_Item + " U_Item=" + U_Item + " F_Title=" + F_Title + " F_SDate=" + F_SDate + " F_EDate=" + F_EDate + " PDFurl=" + PDFurl + " F_VDate=" + F_VDate + " F_Context=" + F_Context + " F_img1=" + F_img1 + " F_img2=" + F_img2 + " F_img3=" + F_img3);
        };
        //取得分析師ListHtmlTagOption
        var afterSuccessFuc = function () {
            onChange_M("#MP", function () {
                var type = val_M("#MP");
                $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#MP_Item", type, "option");
            });
        };
        var getDailyResearchReportList = function () {
            var MP = val_M("#MP");
            var MP_Item = val_M("#MP_Item");
            var StartDate = val_M("#StartDate");
            var EndDate = val_M("#EndDate");
            var keyWord = val_M("#keyWord");
            var data = "MP=" + MP + "&MP_Item=" + MP_Item + "&StartDate=" + StartDate + "&EndDate=" + EndDate + "&keyWord=" + keyWord + "&U_MDEP=" + U_MDEP_M + "&U_POSITION=" + U_POSITION_M + "&ComID=" + ComID_M + "&U_Num=" + U_Num_M + "&action=getDailyResearchReportList";

            var success = function (back) {
                Log_M("getDailyResearchReportList back" + back);
                empty_M("#dailyResearchReportSearchTb");
                var json = jsonParse_M(back);
                $dailyResearchReportManagementPageList.Table.makeTbody("#dailyResearchReportSearchTb", json, 10, "#pageBar", deleteDailyResearchReportFuc, openDailyResearchReportDiv);
            };
            var error = function (e) { Log_M("getDailyResearchReportList error=" + e); unBlockUI_M(); };
            ajax_M(DailyResearchReportManagementHandlerUrl_G, data, success, error);

        };

        var deleteThreeBigData = function () {
            var WFT_id = attr_M(this, "WFT_id");
            var r = confirm("刪除後資料將無法恢復，確定刪除?");
            if (r == true) {
                var data = "WFT_id=" + WFT_id + "&action=deleteThreeBigData";
                var success = function (back) {
                    Log_M("deleteThreeBigData back=" + back);
                    alert("刪除資料" + back);
                    getClosingPriceThreeBigData();
                };
                var error = function (e) { Log_M("deleteThreeBigData error=" + e); unBlockUI_M(); };
                ajax_M(DailyResearchReportManagementHandlerUrl_G, data, success, error);
            }
        };

        var getClosingPriceThreeBigData = function () {
            var data = "action=getClosingPriceThreeBigData";

            var success = function (back) {
                Log_M("getClosingPriceThreeBigData back=" + back);
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                empty_M("#closingPriceThreeBigDataTb");
                $.each(json, function (i, v) {
                    sb.append("<tr>");
                    sb.append("<td class='text-center'>");
                    sb.append(i+1);
                    sb.append("</td>");
                    sb.append("<td class='text-center'>");
                    sb.append(v.WFT_date.split(' ')[0]);
                    sb.append("</td>");
                    
                    sb.append("<td class='text-center'> <input type='button' class='editPer editThreeBigDataFuc btn btn-success openThreeBigDataDialog' value='修' WFT_id='");
                    sb.append(v.WFT_id);
                    sb.append("' WFT_date='");
                    sb.append(v.WFT_date);
                    sb.append("' WFT_TSE_T1='");
                    sb.append(v.WFT_TSE_T1);
                    sb.append("' WFT_TSE_T2='");
                    sb.append(v.WFT_TSE_T2);
                    sb.append("' WFT_TSE_T3='");
                    sb.append(v.WFT_TSE_T3);
                    sb.append("' WFT_OTC_T1='");
                    sb.append(v.WFT_OTC_T1);
                    sb.append("' WFT_OTC_T2='");
                    sb.append(v.WFT_OTC_T2);
                    sb.append("' WFT_OTC_T3='");
                    sb.append(v.WFT_OTC_T3);
                    sb.append("' WFT_II_T1='");
                    sb.append(v.WFT_II_T1);
                    sb.append("' WFT_II_T2='");
                    sb.append(v.WFT_II_T2);
                    sb.append("' WFT_II_T3='");
                    sb.append(v.WFT_II_T3);
                    sb.append("' WFT_II_T4='");
                    sb.append(v.WFT_II_T4);
                    sb.append("'/></td>");
                    sb.append("<td class='text-center'> <input type='button' class='delPer deleteThreeBigData btn btn-danger' value='刪' WFT_id='");
                    sb.append(v.WFT_id);
                    sb.append("'/></td>");
                    sb.append("</tr>");
                });
                append_M("#closingPriceThreeBigDataTb", sb.toString());
                $(".deleteThreeBigData").unbind();
                onClick_M(".editThreeBigDataFuc", openThreeBigDataDialog);
                onClick_M(".deleteThreeBigData", deleteThreeBigData);
                $('#closingPriceThreeBigDataDialog').dialog('open');
            };
            var error = function (e) { Log_M("getClosingPriceThreeBigData error=" + e); unBlockUI_M(); };
            ajax_M(DailyResearchReportManagementHandlerUrl_G, data, success, error);
        };
        var openThreeBigDataDialog = function () {
            ActionType_G = attr_M(this, "actionType");
            if (ActionType_G != "add") {
                val_M("#WFT_id", attr_M(this, "WFT_id"));
                var tempDate = attr_M(this, "WFT_date").split(' ')[0];
                var tempDateArr = tempDate.split('/');
                val_M("#WFT_date", tempDateArr[1] + "/" + tempDateArr[2] + "/" + tempDateArr[0]);
                val_M("#WFT_TSE_T1",attr_M(this,"WFT_TSE_T1"));
                val_M("#WFT_TSE_T2",attr_M(this,"WFT_TSE_T2"));
                val_M("#WFT_TSE_T3",attr_M(this,"WFT_TSE_T3"));
                val_M("#WFT_OTC_T1",attr_M(this,"WFT_OTC_T1"));
                val_M("#WFT_OTC_T2",attr_M(this,"WFT_OTC_T2"));
                val_M("#WFT_OTC_T3",attr_M(this,"WFT_OTC_T3"));
                val_M("#WFT_II_T1",attr_M(this,"WFT_II_T1"));
                val_M("#WFT_II_T2",attr_M(this,"WFT_II_T2"));
                val_M("#WFT_II_T3",attr_M(this,"WFT_II_T3"));
                val_M("#WFT_II_T4",attr_M(this,"WFT_II_T4"));
            }
            $('#ThreeBigDataDialog').dialog('open');
        };
       
        var sendThreeBigData = function () {
            var WFT_id =val_M("#WFT_id");
            var WFT_date = val_M("#WFT_date");
            var WFT_TSE_T1 = val_M("#WFT_TSE_T1");
            var WFT_TSE_T2 = val_M("#WFT_TSE_T2");
            var WFT_TSE_T3 = val_M("#WFT_TSE_T3");
            var WFT_OTC_T1 = val_M("#WFT_OTC_T1");
            var WFT_OTC_T2 = val_M("#WFT_OTC_T2");
            var WFT_OTC_T3 = val_M("#WFT_OTC_T3");
            var WFT_II_T1 = val_M("#WFT_II_T1");
            var WFT_II_T2 = val_M("#WFT_II_T2");
            var WFT_II_T3 = val_M("#WFT_II_T3");
            var WFT_II_T4 = val_M("#WFT_II_T4");
            var data = "actionType=" + ActionType_G + "&WFT_id=" + WFT_id + "&WFT_date=" + WFT_date + "&WFT_TSE_T1=" + WFT_TSE_T1 + "&WFT_TSE_T2=" + WFT_TSE_T2 + "&WFT_TSE_T3=" + WFT_TSE_T3 + "&WFT_OTC_T1=" + WFT_OTC_T1 + "&WFT_OTC_T2=" + WFT_OTC_T2 + "&WFT_OTC_T3=" + WFT_OTC_T3 + "&WFT_II_T1=" + WFT_II_T1 + "&WFT_II_T2=" + WFT_II_T2 + "&WFT_II_T3=" + WFT_II_T3 + "&WFT_II_T4=" + WFT_II_T4 + "&action=sendThreeBigData";
            Log_M("data=" + data);
            var success = function (back) {
                Log_M("sendThreeBigData back=" + back);
                $('#ThreeBigDataDialog').dialog('close');
                getClosingPriceThreeBigData();
                alert("資料異動" + back);
            };
            var error = function (e) { Log_M("sendThreeBigData error=" + e); unBlockUI_M(); };
            ajax_M(DailyResearchReportManagementHandlerUrl_G, data, success, error);

        };

        var getWAnalysts = function () {
            var data = "action=getWAnalysts";
            var success = function (back) {
                Log_M("getWAnalysts back=" + back);
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                empty_M("#P_id");
          
                $.each(json, function (i,v) {
                    sb.append("<option value='");
                    sb.append(v.T_id);
                    sb.append("'>");
                    sb.append(v.Ch);
                    sb.append("</option>");
                });
                append_M("#P_id", sb.toString());
            };
            var error = function (e) { Log_M("getWAnalysts error=" + e); unBlockUI_M(); };
            ajax_M(DailyResearchReportManagementHandlerUrl_G, data, success, error);
        };
        var afterFuc = function(){
        };
        var openDailyResearchReportDiv = function () {
            RrdActionType_G = attr_M(this, "actionType");
            Log_M("actionType=" + RrdActionType_G);
            if (RrdActionType_G == "add") {
                
                var today = new Date();
                var y = today.getFullYear().toString();
                var m = (today.getMonth() + 1).toString();
                var d = today.getDate().toString();
                var tomorrow = today;
                tomorrow.setDate(tomorrow.getDate() + 1);
                var ty = tomorrow.getFullYear();
                var tm = tomorrow.getMonth() + 1;
                var td = tomorrow.getDate();
             
                val_M("#Open_tag", "1");
            
                val_M("#Pay", "0002");
                val_M("#F_Item", "0");
                val_M("#U_Item", "0001");
                val_M("#F_Title", "-研究報告 ");

                val_M("#F_SDate", m + "/" + d + "/" + y);
                val_M("#F_EDate", tm + "/" + td + "/" + ty);
                val_M("#F_VDate", y + "/" +PlusZero_M(m) + "/" + PlusZero_M(d));
                var dateStr = y + PlusZero_M(m) + PlusZero_M(d);
                val_M("#F_img1", dateStr + "01.jpg");
                val_M("#F_img2", dateStr + "02.jpg");
                val_M("#F_img3", dateStr + "03.jpg");
                val_M("#PDFurl", dateStr + "_WT_RR.pdf");
                hide_M(".addHide");
                show_M(".editHide");
               
            } else {
                val_M("#F_id", attr_M(this, "F_id"));
                val_M("#Open_tag", attr_M(this, "Open_tag"));
                val_M("#P_id", attr_M(this, "P_id"));
                val_M("#Pay", attr_M(this, "Pay"));
                val_M("#F_Item", attr_M(this, "F_Item"));
                val_M("#U_Item", attr_M(this, "U_Item"));
                val_M("#F_Title", attr_M(this, "F_Title"));
                var F_SDateArr = attr_M(this, "F_SDate").split('/');
                val_M("#F_SDate", F_SDateArr[1] + "/" + F_SDateArr[2] + "/" + F_SDateArr[0]);
                var F_EDateArr = attr_M(this, "F_EDate").split('/');
                val_M("#F_EDate", F_EDateArr[1] + "/" + F_EDateArr[2] + "/" + F_EDateArr[0]);
                val_M("#F_VDate", attr_M(this, "F_VDate"));
                CKEDITOR.instances.F_Context.setData(HTMLDeCode(attr_M(this, "F_Context")));
                val_M("#F_img1", attr_M(this, "F_img1"));
                val_M("#F_img2", attr_M(this, "F_img2"));
                val_M("#F_img3", attr_M(this, "F_img3"));
                val_M("#PDFurl", attr_M(this, "PDFurl"));
                val_M("#Stock1", attr_M(this, "Stock1"));
                val_M("#Stock_Text1", attr_M(this, "Stock_Text1"));
                val_M("#Stock_Note1", attr_M(this, "Stock_Note1"));
                val_M("#Stock2", attr_M(this, "Stock2"));
                val_M("#Stock_Text2", attr_M(this, "Stock_Text2"));
                val_M("#Stock_Note2", attr_M(this, "Stock_Note2"));
                val_M("#Stock3", attr_M(this, "Stock3"));
                val_M("#Stock_Text3", attr_M(this, "Stock_Text3"));
                val_M("#Stock_Note3", attr_M(this, "Stock_Note3"));
                val_M("#Stock4", attr_M(this, "Stock4"));
                val_M("#Stock_Text4", attr_M(this, "Stock_Text4"));
                val_M("#Stock_Note4", attr_M(this, "Stock_Note4"));
                val_M("#Stock5", attr_M(this, "Stock5"));
                val_M("#Stock_Text5", attr_M(this, "Stock_Text5"));
                val_M("#Stock_Note5", attr_M(this, "Stock_Note5"));
                val_M("#Stock6", attr_M(this, "Stock6"));
                val_M("#Stock_Text6", attr_M(this, "Stock_Text6"));
                val_M("#Stock_Note6", attr_M(this, "Stock_Note6"));
                val_M("#Stock7", attr_M(this, "Stock7"));
                val_M("#Stock_Text7", attr_M(this, "Stock_Text7"));
                val_M("#Stock_Note7", attr_M(this, "Stock_Note7"));
                val_M("#Stock8", attr_M(this, "Stock8"));
                val_M("#Stock_Text8", attr_M(this, "Stock_Text8"));
                val_M("#Stock_Note8", attr_M(this, "Stock_Note8"));
                val_M("#Stock9", attr_M(this, "Stock9"));
                val_M("#Stock_Text9", attr_M(this, "Stock_Text9"));
                val_M("#Stock_Note9", attr_M(this, "Stock_Note9"));
                val_M("#Stock10", attr_M(this, "Stock10"));
                val_M("#Stock_Text10", attr_M(this, "Stock_Text10"));
                val_M("#Stock_Note10", attr_M(this, "Stock_Note10"));

                show_M(".addHide");
                hide_M(".editHide");
            }
            hide_M("#dailyResearchReportSearchDiv");
            hide_M("#pageBarDiv");
            show_M("#addResearchReportDiv");
        };


        var closeSecondaryWindow = function () {
            show_M("#dailyResearchReportSearchDiv");
            show_M("#pageBarDiv");
            hide_M("#addResearchReportDiv");
        };


        var HTMLEnCode =function(str) {
            var s = "";
            if (str.length == 0) return "";
            s = str.replace(/&/g, "&gt;");
            s = s.replace(/</g, "&lt;");
            s = s.replace(/>/g, "&gt;");
            s = s.replace(/    /g, "&nbsp;");
            s = s.replace(/\'/g, "'");
            s = s.replace(/\"/g, "&quot;");
            s = s.replace(/\n/g, "<br>");
            return s;
        }
        var HTMLDeCode = function (str) {
            var s = "";
            if (str.length == 0) return "";
            s = str.replace(/&gt;/g, "&");
            s = s.replace(/&lt;/g, "<");
            s = s.replace(/&gt;/g, ">");
            s = s.replace(/&nbsp;/g, "    ");
            s = s.replace(/'/g, "\'");
            s = s.replace(/&quot;/g, "\"");
            s = s.replace(/<br>/g, "\n");
            return s;
        }
        var sendReseachReportData = function () {
            
            var P_id = val_M("#P_id");
            if (!isEmptyStr(P_id)) {
                var Open_tag = val_M("#Open_tag");
                var F_id = val_M("#F_id");
               
                var Pay=val_M("#Pay");
                var U_Item=val_M("#U_Item");
                var F_Item=val_M("#F_Item");
                var F_Title=val_M("#F_Title");
                var F_SDate=val_M("#F_SDate");
                var F_EDate = val_M("#F_EDate");
                var F_VDate = val_M("#F_VDate");
                var F_Context = CKEDITOR.instances.F_Context.getData();
                var PDFurl = val_M("#PDFurl");
                var F_img1 = val_M("#F_img1");
                var F_img2 = val_M("#F_img2");
                var F_img3 = val_M("#F_img3");
                var Stock1 = val_M("#Stock1");
                var Stock_Text1 = val_M("#Stock_Text1");
                var Stock_Note1 = val_M("#Stock_Note1");
                var Stock2 = val_M("#Stock2");
                var Stock_Text2 = val_M("#Stock_Text2");
                var Stock_Note2 = val_M("#Stock_Note2");
                var Stock3 = val_M("#Stock3");
                var Stock_Text3 = val_M("#Stock_Text3");
                var Stock_Note3 = val_M("#Stock_Note3");
                var Stock4 = val_M("#Stock4");
                var Stock_Text4 = val_M("#Stock_Text4");
                var Stock_Note4 = val_M("#Stock_Note4");
                var Stock5 = val_M("#Stock5");
                var Stock_Text5 = val_M("#Stock_Text5");
                var Stock_Note5 = val_M("#Stock_Note5");
                var Stock6 = val_M("#Stock6");
                var Stock_Text6 = val_M("#Stock_Text6");
                var Stock_Note6 = val_M("#Stock_Note6");
                var Stock7 = val_M("#Stock7");
                var Stock_Text7 = val_M("#Stock_Text7");
                var Stock_Note7 = val_M("#Stock_Note7");
                var Stock8 = val_M("#Stock8");
                var Stock_Text8 = val_M("#Stock_Text8");
                var Stock_Note8 = val_M("#Stock_Note8");
                var Stock9 = val_M("#Stock9");
                var Stock_Text9 = val_M("#Stock_Text9");
                var Stock_Note9 = val_M("#Stock_Note9");
                var Stock10 = val_M("#Stock10");
                var Stock_Text10 = val_M("#Stock_Text10");
                var Stock_Note10 = val_M("#Stock_Note10");
                var data = "F_id=" + F_id + "&P_id=" + P_id + "&Open_tag=" + Open_tag + "&Pay=" + Pay + "&U_Item=" + U_Item + "&F_Item=" + F_Item + "&F_Title=" + F_Title + "&F_SDate=" + F_SDate + "&F_EDate=" + F_EDate + "&F_VDate=" + F_VDate + "&F_Context=" + F_Context + "&PDFurl=" + PDFurl + "&F_img1=" + F_img1 + "&F_img2=" + F_img2 + "&F_img3=" + F_img3 + "&add_ip=" + IP_M + "&add_user=" + U_Num_M + "&Stock1=" + Stock1 + "&Stock_Text1=" + Stock_Text1 + "&Stock_Note1=" + Stock_Note1 + "&Stock2=" + Stock2 + "&Stock_Text2=" + Stock_Text2 + "&Stock_Note2=" + Stock_Note2 + "&Stock3=" + Stock3 + "&Stock_Text3=" + Stock_Text3 + "&Stock_Note3=" + Stock_Note3 + "&Stock4=" + Stock4 + "&Stock_Text4=" + Stock_Text4 + "&Stock_Note4=" + Stock_Note4 + "&Stock5=" + Stock5 + "&Stock_Text5=" + Stock_Text5 + "&Stock_Note5=" + Stock_Note5 + "&Stock6=" + Stock6 + "&Stock_Text6=" + Stock_Text6 + "&Stock_Note6=" + Stock_Note6 + "&Stock7=" + Stock7 + "&Stock_Text7=" + Stock_Text7 + "&Stock_Note7=" + Stock_Note7 + "&Stock8=" + Stock8 + "&Stock_Text8=" + Stock_Text8 + "&Stock_Note8=" + Stock_Note8 + "&Stock9=" + Stock9 + "&Stock_Text9=" + Stock_Text9 + "&Stock_Note9=" + Stock_Note9 + "&Stock10=" + Stock10 + "&Stock_Text10=" + Stock_Text10 + "&Stock_Note10=" + Stock_Note10 + "&actionType=" + RrdActionType_G + "&action=sendReseachReportData";
                Log_M("data=" + data);
                var success = function (back) {
                    Log_M("sendReseachReportData back=" + back);
                    if (back == "成功") {
                        getDailyResearchReportList();
                        alert("資料異動" + back);
                        closeSecondaryWindow();
                    }
                };
                var error = function (e) { Log_M("sendReseachReportData error=" + e); unBlockUI_M(); };
                ajax_M(DailyResearchReportManagementHandlerUrl_G, data, success, error);
            }
            else {
                alert("請選擇分析師");
            }
        };
        var startThisPage = function () {
            $Common.MUSER.getAnalystListHtmlTagOptionForMessageSearch(CommonHandlerUrl_M, "#MP", ComID_M, U_MDEP_M, U_POSITION_M, U_Leader_M, U_Num_M, afterSuccessFuc);
            getTodayToInputDate();
            getDailyResearchReportList();
            getWAnalysts();
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#U_Item", "WITEM", "option", afterFuc);
            onClick_M("#getDailyResearchReportList", getDailyResearchReportList);

            $('#closingPriceThreeBigDataDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 360,
                height: 400 
            });
            $('#ThreeBigDataDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 380,
                height: 600
            });

            onClick_M("#getClosingPriceThreeBigData", getClosingPriceThreeBigData);
            onClick_M(".openThreeBigDataDialog", openThreeBigDataDialog);
            onClick_M("#sendThreeBigData", sendThreeBigData);
            //onClick_M("#openAddDailyResearchReportDiv", openAddDailyResearchReportDiv);
            onClick_M(".openDailyResearchReportDiv", openDailyResearchReportDiv);
            onClick_M(".closeSecondaryWindow", closeSecondaryWindow);
            onClick_M("#sendReseachReportData", sendReseachReportData);
            CKEDITOR.replace("F_Context", {
                font_names: 'Arial;Arial Black;Comic Sans MS;Courier New;Tahoma;Times New Roman;Verdana;新細明體;細明體;標楷體;微軟正黑體'
            });
            //設定權限
            setPermission_M();
        };
      
        $(function () {
            //查看使用者權限
            getUserAuthority_M(startThisPage);
        })
    </script>
</asp:Content>

