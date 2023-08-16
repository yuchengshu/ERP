<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="easySchoolOrderManagement.aspx.cs" Inherits="wealthManage_administrativeCheck_easySchoolOrderManagement_OPLIST_NEW_easySchoolOrderManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .pageSpan3 {
             display: inline-block; width:200px;margin-left:30px;
        }
        #pageNum {
             width:150px;
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
                        <h1 class="box-title"><b>ERP &gt; 輕鬆賺網站維護 &gt; 輕鬆投資學院訂單管理-新</b> </h1>
                        <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title="">
                            
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div id="easySchoolOrderSearchDiv" class="tabDivMargin5 tabChangeDiv1">
        
                            <div id="easySchoolOrderSearchInerDiv" class="tabDivMargin4">
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
                                                    <option value="信用卡付款">信用卡付款</option>
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
                                            
                                            <span class="inputSearch" id="keyWordSpan">
                                               <input type="text" name="message" placeholder="查尋關鍵字..." class="form-control " id="keyWord">
                                            </span>
                                            <span class="inputSearch" id="getAppointOriginalArchiveSpan">
                                              <button type="button" class="btn btn-info btn-flat qPer marginTop-27" id="getEasySchoolOrderList">查詢</button>
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
                                            訂單
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:5%">
                                            方式
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:6%">
                                            姓名
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:13%">
                                            聯絡
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:32%">
                                          訂單內容
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:5%">
                                         單價
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:5%">
                                         數量
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:7%">
                                         訂單金額
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:4%">
                                         轉入
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:4%">
                                         修改
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:4%">
                                         刪除
                                        </th>
                                         
                                    </tr>
                                </thead>
                                <tbody id="easySchoolOrderListSearchTb">
                                    
                                </tbody>
                            </table>
                            </div>
                        </div>

                        <!--////***********-->
                        <div id="editDataDialog" class="form-control startHide" title="修改資料">
                            <form class="">
                                <input type="hidden" class="form-control" id="Auto_Id" />
                                <p>日期：<input type="text" class="form-control" id="Add_Date" disabled="disabled"/></p>
                                
                                <p>姓名：<input type="text" class="form-control" id="U_Name" disabled="disabled" /></p>
                                <p>電話：<input type="text" class="form-control" id="Tel" disabled="disabled" /></p>
                                <p>電子郵件：<input type="text" class="form-control" id="EMail" disabled="disabled" /></p>
                                <p>播放截止日期：<input type="text" class="form-control datepicker" id="P_EDate" /></p>
                                <div style="text-align:center" class="">
                                    <input type="button" class="btn btn-primary editPer" id="editData" value="修改資料" />
                                </div>
                            </form>
                        </div>
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
    <script src="<%=getRelativePath()%>js/pageList/easySchoolOrderManagementPageList.js" type="text/javascript"></script> 
    
    <script>
        var easySchoolOrderManagementHandlerUrl_G = "easySchoolOrderManagementHandler.ashx";
        var MENU_no_G = "<%=getMENU_no()%>";
        //轉入
        var changeOver = function () {

            var Auto_Id = attr_M(this, "Auto_Id");
            var T_id = attr_M(this, "T_id");
            var O_Id = attr_M(this, "O_Id");
            var U_Name = attr_M(this, "U_Name");
            var Tel = attr_M(this, "Tel");
            var EMail = attr_M(this, "EMail");
            var Payway = attr_M(this, "Payway");
            var Price = attr_M(this, "Price");
            var OD_id = attr_M(this, "OD_id");
            var Invoice = attr_M(this, "Invoice");
            var Invoice_Com = attr_M(this, "Invoice_Com");
            var Invoice_Vat = attr_M(this, "Invoice_Vat");

            var data = "action=changeOver" + "&Auto_Id=" + Auto_Id + "&T_id=" + T_id + "&O_Id=" + O_Id + "&U_Name=" + U_Name + "&Tel=" + Tel + "&EMail=" + EMail + "&Payway=" + Payway + "&Price=" + Price + "&OD_id=" + OD_id + "&Invoice=" + Invoice + "&Invoice_Com=" + Invoice_Com + "&Invoice_Vat=" + Invoice_Vat + "&add_ip=" + IP_M;
            Log_M("data=" + data);
            var success = function (back) {
                Log_M("changeOver back =" + back);
                var backArr = back.split(',');
                if (backArr.length == 5) {
                    getEasySchoolOrderList()
                    alert("資料異動成功");
                }
            };
            var error = function (e) { Log_M("changeover error=" + e); unBlockUI_M(); };
            ajax_M(easySchoolOrderManagementHandlerUrl_G, data, success, error);
        };
        
        var deleteData = function () {
            alert("功能尚未開放");
           /* var deleteCheck = confirm("確定刪除?");
            var Auto_Id = attr_M(this, "Auto_Id");
            if (deleteCheck) {
                var data = "action=deleteData" + "&Auto_Id=" + Auto_Id;
                var success = function (back) {
                    if (back == "成功") {
                        getEasySchoolOrderList()
                        alert("資料異動成功");
                    }
                };
                var error = function (e) { Log_M("deleteData error=" + e); unBlockUI_M(); };
                ajax_M(easySchoolOrderManagementHandlerUrl_G, data, success, error);
            }*/
        };

        var editData = function () {
            var data = "action=editData" + "&Auto_Id=" + val_M("#Auto_Id") + "&P_EDate=" + val_M("#P_EDate") ;
            var success = function (back) {
                Log_M("editData back=" + back);
                if (back == "成功") {
                    $('#editDataDialog').dialog("close");
                    getEasySchoolOrderList()
                    alert("資料異動成功");
                }
            };
            var error = function (e) { Log_M("editData error=" + e); unBlockUI_M(); };
            ajax_M(easySchoolOrderManagementHandlerUrl_G, data, success, error);
        };

        var openEditDataDialog = function () {
            val_M("#U_Name", attr_M(this, "U_Name"));
            val_M("#Tel", attr_M(this, "Tel"));
            val_M("#EMail", attr_M(this, "EMail"));
            val_M("#Add_Date", attr_M(this, "Add_Date"));
            val_M("#P_EDate", attr_M(this, "P_EDate"));
            val_M("#Auto_Id", attr_M(this, "Auto_Id"));
            $('#editDataDialog').dialog("open");
        };
 
        var getEasySchoolOrderList = function () {
            var data = "action=getEasySchoolOrderList" + "&keyWord=" + val_M("#keyWord") + "&StartDate=" + val_M("#StartDate") + "&EndDate=" + val_M("#EndDate")  + "&PayStatus=" + val_M("#PayStatus") + "&Payway=" + val_M("#Payway");
            var success = function (back) {
                Log_M("getEasySchoolOrderList back=" + back);
                var json = jsonParse_M(back);
                $easySchoolOrderManagementPageList.Table.makeTbody("#easySchoolOrderListSearchTb", json, 10, "#pageBar", changeOver, openEditDataDialog, deleteData);
            };
            var error = function (e) { Log_M("getEasySchoolOrderList error=" + e); unBlockUI_M(); };
            ajax_M(easySchoolOrderManagementHandlerUrl_G, data, success, error);
        };



        var startThisPage = function () {
            val_M("#StartDate", getTodayDatepickerStr_M());
            val_M("#EndDate", getTodayDatepickerStr_M());
            $('#editDataDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 300,
            });
            onClick_M("#getEasySchoolOrderList", getEasySchoolOrderList);
            onClick_M("#editData", editData);
            getEasySchoolOrderList();
            //設定權限
            setPermission_M();
        };
      
        $(function () {
            //查看使用者權限
            getUserAuthority_M(startThisPage);
        })
    </script>
</asp:Content>

