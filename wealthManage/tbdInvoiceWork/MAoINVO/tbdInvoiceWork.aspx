<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="tbdInvoiceWork.aspx.cs" Inherits="wealthManage_tbdInvoiceWork_MAoINVO_tbdInvoiceWork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .pageSpan1 {
             display: inline-block; width:150px;margin-left:300px;
        }
        .tabChangeDiv1 {

            margin-bottom:100px;
        }
        .color72afd2 {
            color:#72afd2;
        }
        .pageSpan150 {
        width:170px;
        }
        #keyWord {
             width:170px;
        }
         #getTbdInvoice {
             width:70px;
        }
         .pageSpan2 {
             margin-left:60px;
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
                        <h1 class="box-title"><b>ERP &gt; 人事財務部 &gt; 待開發票</b> </h1>
                        <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title="">
                            
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div id="tbdInvoiceWorkSearchDiv" class="tabDivMargin5 tabChangeDiv1">
        
                            <div id="tbdInvoiceWorkSearchInerDiv" class="tabDivMargin4">
                            <table class="table">
                                <thead >
                                     <tr class="active">
                                
                                    <th class=""  colspan="11">
                                        <div class="input-group marginBottom-7">
                                            <span class="inputSearch">
                                                <input type="text" id="StartDate" class="datepicker form-control today" placeholder="開始日">
                                            </span>
                                            <span class="inputSearch  marginRight20">
                                                <input type="text" id="EndDate" class="datepicker form-control today" placeholder="結束日">
                                            </span>
                                            <span class="inputSearch pageSpan150">
                                               <input type="text" name="message" placeholder="查尋關鍵字..." class="form-control " id="keyWord">
                                            </span>
                                            <span class="inputSearch pageSpan2">
                                              <button type="button" class="btn btn-info btn-flat qPer marginTop-27" id="getTbdInvoice">查詢</button>
                                            </span>
                                            <span class="inputSearch ">
                                              <button type="button" class="btn btn-success btn-flat qPer marginTop-27" id="invoice">開立發票</button>
                                            </span>
                                            <span class="inputSearch pageSpan1">
                                              <span class="">page</span>&nbsp; <span class="">：</span>&nbsp;<span id ="pageNum" class=""></span>
                                            </span>
                                      </div>
                                    </th>
                                </tr>
                                    <tr class="marginTop5px bgColor">
                                        <th class="textAlignCenter  leftSideWhite" style="width:12%">
                                            交易編號
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:12%">
                                            開立日期
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:7%">
                                            姓名
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:11%">
                                            分析師-種類
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:5%">
                                            金流
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:9%">
                                            付款方式
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:7%">
                                          金額
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:16%">
                                          發票明細
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:11%">
                                         發票號碼
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:10%">
                                          <a href="javascript:void(0)" id="allCheck">全選</a>/<a href="javascript:void(0)" id="allCancel">清除</a>
                                        </th>
                                        
                                    </tr>
                                </thead>
                                <tbody id="tbdInvoiceWorkSearchTb">

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
    <script src="<%=getRelativePath()%>js/pageList/tbdInvoiceWorkPageList.js" type="text/javascript"></script> 
    
    <script>
        var tbdInvoiceWorkHandlerUrl_G = "tbdInvoiceWorkHandler.ashx";
        var MENU_no_G = "<%=getMENU_no()%>";
        var CustomerDetailMENU_no_G = "<%=getCustomerDetailMENU_no()%>";
      
        
        var setPostData = function(json){
            var order = [];
            $.each(json,function(i,v){
                var pd = {
                    Company: "",
                    RelateNumber: "",
                    CustomerID: "",
                    CustomerName: "",
                    CustomerAddr: "",
                    CustomerPhone: "",
                    CustomerEMail: "",
                    Invoice_item: "",
                    CarruerNum: "",
                    Print: "0",
                    LoveCode: "",
                    CustomerIdentifier: "",
                    SalesAmount: "",
                    InoviceRemark: "",
                    ItemName: "",
                    ItemCount: "",
                    ItemWord: "",
                    ItemPrice: "",
                    ItemAmount: "",
                };
                pd.Company= v.Company;
                pd.Invoice_item= v.Invoice_item;
                pd.RelateNumber= v.RelateNumber;
                pd.CustomerID= v.CustomerID;
                pd.CustomerName= v.CustomerName;
                pd.CustomerAddr= v.CustomerAddr;
                pd.CustomerPhone= v.CustomerPhone;
                pd.CustomerEMail= v.CustomerEMail;
                pd.CarruerNum= v.CarruerNum;
                pd.LoveCode= v.LoveCode;
                pd.CustomerIdentifier= v.CustomerIdentifier;
                pd.SalesAmount= v.SalesAmount;
                pd.InoviceRemark= v.InoviceRemark;
                pd.ItemName= v.ItemName;
                pd.ItemCount= v.ItemCount;
                pd.ItemWord= v.ItemWord;
                pd.ItemPrice= v.ItemPrice;
                pd.ItemAmount= v.ItemAmount;
                order[i]=pd;
            });
            return order;
        };
        var getTbdInvoice = function () {
            var data = "action=getTbdInvoice" + "&keyWord=" + val_M("#keyWord") + "&StartDate=" + val_M("#StartDate") + "&EndDate=" + val_M("#EndDate");
            var success = function (back) {
                var json = jsonParse_M(back);
               
                $tbdInvoiceWorkPageList.Table.makeTbody("#tbdInvoiceWorkSearchTb", json, 10, "#pageBar");
            };
            var error = function (e) { Log_M("getTbdInvoice error=" + e); unBlockUI_M(); };
            ajax_M(tbdInvoiceWorkHandlerUrl_G, data, success, error);
        };

        var allCheck = function () {
            $("input[name='invoice']").prop("checked", true);
        };

        var allCancel = function () {
            $("input[name='invoice']").prop("checked", false);
        };

        var getInvoiceDataList = function () {
            var checkeds = $("input[name='invoice']:checked");
            var tids = "";
            $.each(checkeds, function (i, v) {
                if (i != 0) {
                    tids += ",";
                }
                tids += val_M(v);
            });
            var data = "action=getInvoiceDataList" + "&tids=" + tids;
            var success = function (back) {
                Log_M("back=" + back);
                /*var json = jsonParse_M(back);
                var order = setPostData(json);
          
                Log_M("backJSON=" + JSON.stringify({ erpInvoice: order }));
                */
               /* var http = new XMLHttpRequest();
                var url = 'https://www.hwa-guan.com.tw/Financial/erpInvoiceCreate';
                var params = JSON.stringify({ erpInvoice: order });
                http.open('POST', url, false);

            
                http.setRequestHeader('Content-type', 'application/json');

                http.onreadystatechange = function () {//Call a function when the state changes.
                    if (http.readyState == 4 && http.status == 200) {
                        alert(http.responseText);
                    }
                }
                http.send(params);*/
                /*$.ajax({
                    url: "https://www.hwa-guan.com.tw/Financial/erpInvoiceCreate",
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify({ erpInvoice: order }),
                    success: function (message) {
                        alert(message);
                    }
                });*/
            };
            var error = function (e) { Log_M("getInvoiceDataList error=" + e); unBlockUI_M(); };
            ajax_M(tbdInvoiceWorkHandlerUrl_G, data, success, error);
        };
        var startThisPage = function () {
            val_M("#StartDate", getTodayDatepickerStr_M());
            val_M("#EndDate", getTodayDatepickerStr_M());
            onClick_M("#getTbdInvoice", getTbdInvoice);
            onClick_M("#allCheck", allCheck);
            onClick_M("#allCancel", allCancel);
            onClick_M("#invoice", getInvoiceDataList);
            getTbdInvoice();
            //設定權限
            setPermission_M();
        };
      
        $(function () {

            //查看使用者權限
            getUserAuthority_M(startThisPage);
        })
    </script>
</asp:Content>

