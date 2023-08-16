<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="webConsumptionOrderManagement.aspx.cs" Inherits="wealthManage_administrativeCheck_webConsumptionOrderManagement_Worder_NEW_webConsumptionOrderManagement" %>

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
        .pageSpan150 {
        width:150px;
        }

        #M_ID {
             width:150px;
        }
       
        
         .pageSpan2 {
             margin-left:60px;
        }
        #getCustomerData {
         margin-left:37px;
        }
        #inputSearchPayway {
             width:135px;
        }
        #Payway {
         width:135px;
        }
        #inputSearchP_ID {
         width:120px;
        }
         #P_ID {
         width:120px;
        }
        .fontSizeSpan {
        font-size:13px;
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
                        <h1 class="box-title"><b>ERP &gt; 網站APP維護 &gt; 新-訂單管理</b> </h1>
                        <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title="">
                            
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div id="webConsumptionOrderSearchDiv" class="tabDivMargin5 tabChangeDiv1">
        
                            <div id="webConsumptionOrderSearchInerDiv" class="tabDivMargin4">
                            <table class="table">
                                <thead >
                                     <tr class="active">
                                
                                    <th class=""  colspan="12">
                                        <div class="input-group marginBottom-7">
                                            <span class="inputSearch">
                                                <select id="PayStatus" class="form-control">
                                                    <option value="">不限狀態</option>
                                                    <option value="1">成功</option>
                                                    <option value="0">失敗</option>

                                                </select>
                                            </span>
                                            <span class="inputSearch" id="inputSearchPayway">
                                                <select id="Payway" class="form-control">
                                                    <option value="">不限付款方式</option>
                                                    <option value="信用卡付款">綠界信用卡付款</option>
                                                    <option value="華南信用卡付款">華南信用卡付款</option>
                                                    <option value="超商代碼付款">超商代碼付款</option>
                                                     <option value="ATM付款">ATM付款</option>
                                                    <option value="網路ATM付款">網路ATM付款</option>
                                                </select>
                                            </span>
                                            <span class="inputSearch">
                                                <input type="text" id="StartDate" class="datepicker form-control today" placeholder="開始日">
                                            </span>
                                            <span class="inputSearch  marginRight20">
                                                <input type="text" id="EndDate" class="datepicker form-control today" placeholder="結束日">
                                            </span>
                                            <span class="inputSearch" id="inputSearchP_ID">
                                                <select id="P_id" class="form-control">
                                                   
                                                   
                                                </select>
                                            </span>
                                            <span class="inputSearch" id="keyWordSpan">
                                               <input type="text" name="message" placeholder="查尋關鍵字..." class="form-control " id="keyWord">
                                            </span>
                                            <span class="inputSearch" id="getAppointOriginalArchiveSpan">
                                              <button type="button" class="btn btn-info btn-flat qPer marginTop-27" id="getWebConsumptionOrderList">查詢</button>
                                            </span>
                                            <span class="inputSearch pageSpan3">
                                              <span class="">page</span>&nbsp; <span class="">：</span>&nbsp;<span id ="pageNum" class=""></span>
                                            </span>
                                      </div>
                                    </th>
                                </tr>
                                    <tr class="marginTop5px bgColor">
                                        <th class="textAlignCenter  leftSideWhite" style="width:5%">
                                            序
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:10%">
                                            訂單號碼
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:10%">
                                            方式
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:5%">
                                            狀態
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:5%">
                                            分析師
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:5%">
                                          姓名
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:8%">
                                         電話
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:30%">
                                         購買資訊
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:7%">
                                         金額
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:5%">
                                         轉入
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:5%">
                                         修改
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:5%">
                                         刪除
                                        </th>
                                         
                                    </tr>
                                </thead>
                                <tbody id="webConsumptionOrderListSearchTb">
                                    
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
    <script src="<%=getRelativePath()%>js/pageList/webConsumptionOrderManagementPageList.js" type="text/javascript"></script> 
    
    <script>
        var webConsumptionOrderManagementHandlerUrl_G = "webConsumptionOrderManagementHandler.ashx";
        var MENU_no_G = "<%=getMENU_no()%>";
        
        //轉入
        var changeOver = function () {
            var Auto_Id = attr_M(this, "Auto_Id");
            var O_Id = attr_M(this, "O_Id");
            var MPRD_ID = attr_M(this, "MPRD_ID");
            var DPRD_ID = attr_M(this, "DPRD_ID");
            var Name = attr_M(this, "Name");
            var Tel = attr_M(this, "Tel");
            var EMail = attr_M(this, "EMail");
            var Payway = attr_M(this, "Payway");
            var City = attr_M(this, "City");
            var Address = attr_M(this, "Address");
            var Price = attr_M(this, "Price");
            var P_id = attr_M(this, "P_id");
        
            
            var data = "action=changeOver" + "&Auto_Id=" + Auto_Id + "&O_Id=" + O_Id + "&MPRD_ID=" + MPRD_ID + "&DPRD_ID=" + DPRD_ID + "&Name=" + Name + "&Tel=" + Tel + "&EMail=" + EMail + "&Payway=" + Payway + "&City=" + City + "&Address=" + Address + "&Price=" + Price + "&P_id=" + P_id + "&add_ip=" + IP_M;
            Log_M("data=" + data);
            var success = function (back) {
                Log_M("changeOver back =" + back);
                var backArr = back.split(',');
                if (backArr.length == 5) {
                    getWebConsumptionOrderList()
                    alert("資料異動成功");
                }
            };
            var error = function (e) { Log_M("changeover error=" + e); unBlockUI_M(); };
            ajax_M(webConsumptionOrderManagementHandlerUrl_G, data, success, error);
        };
        
        var deleteData = function () {
            var deleteCheck = confirm("確定刪除?");
            var Auto_Id = attr_M(this, "Auto_Id");
            if (deleteCheck) {
                var data = "action=deleteData" + "&Auto_Id=" + Auto_Id;
                var success = function (back) {
                    if (back == "成功") {
                        getWebConsumptionOrderList()
                        alert("資料異動成功");
                    }
                };
                var error = function (e) { Log_M("deleteData error=" + e); unBlockUI_M(); };
                ajax_M(webConsumptionOrderManagementHandlerUrl_G, data, success, error);
            }
        };

        var editData = function () {
            alert("功能尚未開放");
        };
 
        var getWebConsumptionOrderList = function () {
            var data = "action=getWebConsumptionOrderList" + "&keyWord=" + val_M("#keyWord") + "&StartDate=" + val_M("#StartDate") + "&EndDate=" + val_M("#EndDate") + "&P_id=" + val_M("#P_id") + "&PayStatus=" + val_M("#PayStatus") + "&Payway=" + val_M("#Payway");
            var success = function (back) {
                Log_M("getWebConsumptionOrderList back=" + back);
                var json = jsonParse_M(back);
                $webConsumptionOrderManagementPageList.Table.makeTbody("#webConsumptionOrderListSearchTb", json, 10, "#pageBar", changeOver, editData, deleteData);
            };
            var error = function (e) { Log_M("getWebConsumptionOrderList error=" + e); unBlockUI_M(); };
            ajax_M(webConsumptionOrderManagementHandlerUrl_G, data, success, error);
        };

        var getWAnalysts = function () {
            var data = "action=getWAnalysts";
            var success = function (back) {
                Log_M("getWAnalysts back=" + back);
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                empty_M("#M_ID");
                sb.append("<option value=''>不限分析師</option>");
                $.each(json, function (i, v) {
                    sb.append("<option value='");
                    sb.append(v.T_id);
                    sb.append("'>");
                    sb.append(v.Ch);
                   
                    sb.append("</option>");
                });
                append_M("#P_id", sb.toString());
            };
            var error = function (e) { Log_M("getWAnalysts error=" + e); unBlockUI_M(); };
            ajax_M(webConsumptionOrderManagementHandlerUrl_G, data, success, error);
        };

        var startThisPage = function () {
            val_M("#StartDate", getTodayDatepickerStr_M());
            val_M("#EndDate", getTodayDatepickerStr_M());
            onClick_M("#getWebConsumptionOrderList", getWebConsumptionOrderList);
            getWAnalysts();
            getWebConsumptionOrderList();
            //設定權限
            setPermission_M();
        };
      
        $(function () {
            //查看使用者權限
            getUserAuthority_M(startThisPage);
        })
    </script>
</asp:Content>

