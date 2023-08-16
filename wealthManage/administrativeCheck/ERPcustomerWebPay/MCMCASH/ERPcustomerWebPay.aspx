<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ERPcustomerWebPay.aspx.cs" Inherits="wealthManage_administrativeCheck_ERPcustomerWebPay_ERPcustomerWebPay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .pageSpan3 {
             display: inline-block; width:150px;margin-left:30px;
        }
        .tabChangeDiv1 {

            margin-bottom:100px;
        }
        .color72afd2 {
            color:#72afd2;
        }
        #keyWord {
             width:100px;
        }
        #keyWordSpan {
             width:100px;
        }
        
         .pageSpan2 {
             margin-left:60px;
        }
        .pageNumBar {
            margin-bottom:-100px;
        }
        #pageNumBar {
            margin-left:700px;
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
                        <h1 class="box-title"><b>ERP &gt; 業務部 &gt; ERP客戶網站付費 </b> </h1>
                        <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title="">
                            
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div id="ERPcustomerWebPaySearchDiv" class="tabDivMargin5 tabChangeDiv1">
        
                            <div id="ERPcustomerWebPaySearchInerDiv" class="tabDivMargin4">
                            <table class="table">
                                <thead >
                                     <tr class="active">
                                
                                    <th class=""  colspan="12">
                                        <div class="input-group marginBottom-7" style="width:100%">
                                            <!--<span class="inputSearch">
                                                <input type="text" id="StartDate" class="datepicker form-control today" placeholder="開始日">
                                            </span>
                                            <span class="inputSearch  marginRight20">
                                                <input type="text" id="EndDate" class="datepicker form-control today" placeholder="結束日">
                                            </span>-->

                                            <span class="inputSearch">
                                                 <select id="PayStatus"  class="form-control">
                                                     <option value="">不限</option>
                                                     <option value="1">付款成功</option>
                                                      <option value="0">付款失敗</option>
                                                 </select>
                                            </span>
                                            <span class="inputSearch" id="keyWordSpan">
                                               <input type="text" name="message" placeholder="查尋關鍵字..." class="form-control " id="keyWord">
                                            </span>
                                            <span class="inputSearch" id="getAppointOriginalArchiveSpan">
                                              <button type="button" class="btn btn-info btn-flat qPer marginTop-27" id="getERPcustomerWebPay">查詢</button>
                                            </span>
                                           
                                            <span class=" pageSpan3" id="pageNumBar">
                                              <span class="pageNumBar">page</span>&nbsp; <span class="pageNumBar">：</span>&nbsp;<span id ="pageNum" class="pageNumBar"></span>
                                            </span>
                                      </div>
                                    </th>
                                </tr>
                                    <tr class="marginTop5px bgColor">
                                        <th class="textAlignCenter  leftSideWhite" style="width:4%">
                                            單號
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:8%">
                                            登入代碼
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:8%">
                                            手機
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:12%">
                                            產品
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:6%">
                                            價格
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:8%">
                                          會員姓名
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:8%">
                                          提案人
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:17%">
                                         提案日期
                                        </th>
                                          <th class="textAlignCenter  leftSideWhite" style="width:10%">
                                         付款狀態
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:10%">
                                         簽署狀態
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:16%">
                                         付款明細
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:3%">
                                         刪
                                        </th>
                                    </tr>
                                </thead>
                                <tbody id="ERPcustomerWebPaySearchTb">

                                </tbody>
                            </table>
                            </div>
                        </div>

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
    <script src="<%=getRelativePath()%>js/pageList/ecwpPageList.js" type="text/javascript"></script> 
    
    <script>
        var ERPcustomerWebPayHandlerUrl_G = "ERPcustomerWebPayHandler.ashx";
        var MENU_no_G = "<%=getMENU_no()%>";
        var CustomerDetailMENU_no_G = "<%=getCustomerDetailMENU_no()%>";

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
        var getMid = function () {
            var M_id = attr_M(this, "M_id")
            location.href = "/wealthManage/customerManage/MMBER/customerDetail.aspx?M_ID=" + M_id + "&MENU_no=" + CustomerDetailMENU_no_G + "&ERPcustomerWebPayMENU_no=" + MENU_no_G;
        };

        var getERPcustomerWebPay = function () {
            var data = "action=getERPcustomerWebPay" + "&keyWord=" + val_M("#keyWord") + "&PayStatus=" + val_M("#PayStatus") + "&U_MDEP=" + U_MDEP_M + "&ComID=" + ComID_M + "&U_Num=" + U_Num_M;
            var success = function (back) {
                var json = jsonParse_M(back);
               $ecwpPageList.Table.makeTbody("#ERPcustomerWebPaySearchTb", json, 10, "#pageBar", deleteData,getMid);
            };
            var error = function (e) { Log_M("getERPcustomerWebPay error=" + e); unBlockUI_M(); };
            ajax_M(ERPcustomerWebPayHandlerUrl_G, data, success, error);
        };


        var startThisPage = function () {
            onClick_M("#getERPcustomerWebPay", getERPcustomerWebPay)
            getERPcustomerWebPay();
            //設定權限
            setPermission_M();
        };
      
        $(function () {
            //查看使用者權限
            getUserAuthority_M(startThisPage);
        })
    </script>
</asp:Content>

