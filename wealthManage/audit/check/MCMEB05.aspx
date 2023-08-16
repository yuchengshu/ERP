<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MCMEB05.aspx.cs" Inherits="wealthManage_audit_check_MCMEB05" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                            <h1 class="box-title"><b>ERP &gt; 稽核區  &gt; ERP修改紀錄 </b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <table class="table">
                                <thead >
                                    <tr class="active">
                                
                                    <th class=""  colspan="8">
                                      <div class="input-group">
                                          <span class="inputSearch2">
                                              <input type="text" name="message" placeholder="查詢電話或姓名" class="form-control" id="keyWord">
                                          </span>
                                          <span class="inputSearch2">
                                              <input type="text" id="StartDate" class="datepicker form-control" placeholder="開始日">
                                          </span>
                   
                                          <span class="inputSearch2">
                                              <input type="text" id="EndDate" class="datepicker form-control" placeholder="結束日">
                                          </span>
                                        
                                        
                                          
                                        <span class="inputSearch2">
                                          <button type="button" class="btn btn-info btn-flat  qPer marginTop-27" id="getERPeditRecord">查詢</button>
                                        </span>
                                      </div>
                                    </th>
                          
                      
                       
        
                                    <th class=""  colspan="1" class="">
                                        <div class=" marginTop-27">page&nbsp;：&nbsp;<span id ="pageNum"></span></div></th>
                                </tr>
                                    <tr class="marginTop5px bgColor">
                                        <th class="textAlignCenter  leftSideWhite" style="width:4%">
                                            項次
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:9%">
                                            會員
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:9%">
                                            姓名
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:9%">
                                          助理
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:12%">
                                          手機
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:13%">
                                          公司電話
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:12%">
                                          住家電話
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:16%">
                                          建檔日
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:16%">
                                          承接日
                                        </th>
                                    </tr>
                                </thead>
                                <tbody id="ERPeditRecordTb">

                                </tbody>
                            </table>

                            <div style="text-align:center">
　                               <div id="pageBar" style="margin:0 auto;"> </div>
                            
                            </div>
                            <div id="editRecordDialog" class="form-control" title="修改紀錄">

                                    <table class="table" id="">
                                    <thead>
                                        <tr>
                                            <th class="textAlignCenter fontSize18" colspan="4">基本資料修改紀錄</th>
                                          
                                        </tr>
                                        <tr>
                                            <td style="width:15%" class="textAlignCenter">修改人</td>
                                            <td style="width:15%" class="textAlignCenter">欄位</td>
                                            <td style="width:40%" class="textAlignCenter">內容</td>
                                            <td style="width:30%" class="textAlignCenter">時間</td>
                                        </tr>
                                    </thead>
                                    <tbody id="customerDataEditRecordTb">

                                    </tbody>
                                   
                                   </table>
                                    <table class="table" id="">
                                    <thead>
                                        <tr>
                                            <th class="textAlignCenter fontSize18" colspan="5">交易資料修改資料</th>
                                          
                                        </tr>
                                        <tr>
                                            <td style="width:15%" class="textAlignCenter">交易編號</td>
                                            <td style="width:10%" class="textAlignCenter">修改人</td>
                                            <td style="width:10%" class="textAlignCenter">欄位</td>
                                            <td style="width:35%" class="textAlignCenter">內容</td>
                                            <td style="width:30%" class="textAlignCenter">時間</td>
                                        </tr>
                                    </thead>
                                    <tbody id="tradeDataEditRecordTb">

                                    </tbody>
                                   
                                   </table>

                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script src="<%=getRelativePath()%>js/pageList/MCMEB05PageList.js" type="text/javascript"></script> 
    <script>

        var AuditHandlerUrl_G = "auditHandler.ashx";
        var getCustomerDataEditRecord = function (M_ID) {
            var data = "action=getCustomerDataEditRecord&M_ID=" + M_ID;
            var success = function (back) {
                Log_M("getCustomerDataEditRecord back=" + back);
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
   
                $.each(json, function (i,v) {
                    sb.append("<tr>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.edit_userName);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.M_Row);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.M_text);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.edit_date);
                    sb.append("</td>");
                    sb.append("</tr>");
                });
                sb.append("<tr>");
                sb.append("<th class='textAlignCenter' colspan='4'>筆數&nbsp;:&nbsp;&nbsp;");
                sb.append(json.length);
                sb.append("</th>");
                sb.append("</tr>");
                append_M("#customerDataEditRecordTb", sb.toString());
                $('#editRecordDialog').dialog("open");
            };
            var error = function (e) { Log_M("getCustomerDataEditRecord error=" + e); unBlockUI_M(); };
            ajax_M(AuditHandlerUrl_G, data, success, error);

        };
        var getTradeDataEditRecord = function (M_ID) {
            var data = "action=getTradeDataEditRecord&M_ID=" + M_ID;
            var success = function (back) {
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                text_M("#tradeDataEditRecordCount", json.length);
                $.each(json, function (i, v) {
                    sb.append("<tr>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.T_ID);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.edit_userName);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.M_Row);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.M_text);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.edit_date);
                    sb.append("</td>");
                    sb.append("</tr>");
                });
                sb.append("<tr>");
                sb.append("<th class='textAlignCenter' colspan='5'>筆數&nbsp;:&nbsp;&nbsp;");
                sb.append(json.length);
                sb.append("</th>");
                sb.append("</tr>");

                append_M("#tradeDataEditRecordTb", sb.toString());

            };
            var error = function (e) { Log_M("getTradeDataEditRecord error=" + e); unBlockUI_M(); };
            ajax_M(AuditHandlerUrl_G, data, success, error);

        };

        var getRecord = function () {
            var M_ID = attr_M(this, "M_ID");
            getCustomerDataEditRecord(M_ID);
            getTradeDataEditRecord(M_ID);
        };
        var getERPeditRecord = function () {
            var keyWord = val_M("#keyWord");
            
            var StartDate = val_M("#StartDate");
            var EndDate = val_M("#EndDate");
            var doNext = check_M.isEndDateBigThanStartDate(StartDate, EndDate);
            if (doNext) {
                var data = "action=getERPeditRecord&keyWord=" + keyWord + "&EndDate=" + EndDate + "&StartDate=" + StartDate;
                var success = function (back) {
                    Log_M("getERPeditRecord back=" + back);
                    var json = jsonParse_M(back);
                    $MCMEB05PageList.Table.makeTbody("#ERPeditRecordTb", json, 10, "#pageBar", getRecord);
                };
                var error = function (e) { Log_M("getERPeditRecord error=" + e); unBlockUI_M(); };
                ajax_M(AuditHandlerUrl_G, data, success, error);
            } else {
                alert("請正確填寫查詢區間");
            }
            
        };
        //進行頁面處理===============================================start
        var startThisPage = function () {
            val_M("#StartDate", getTodayDatepickerStr_M());
            val_M("#EndDate", getTodayDatepickerStr_M());
            $('#editRecordDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 1100,
                height: 350,
            });
            onClick_M("#getERPeditRecord", getERPeditRecord);
            getERPeditRecord();
        };
        //進行頁面處理===============================================end
      
        $(function () {
            startThisPage();

        })
    </script>
</asp:Content>

