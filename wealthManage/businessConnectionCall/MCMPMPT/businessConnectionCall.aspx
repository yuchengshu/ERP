<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="businessConnectionCall.aspx.cs" Inherits="wealthManage_businessConnectionCall_MCMPMPT_businessConnectionCall" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .tabChangeDiv {
            border-left: 1px solid #ddd;
            border-right: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            margin-bottom:100px;
        }
        .tabDivMargin3 {
          margin-left:20px;
          margin-right:20px;
          margin-top:5px;
        }
        .tabDivMargin4 {
          margin-left:20px;
          margin-right:20px;
          
        }
        .tabDivMargin5 {
          margin-left:20px;
          margin-right:20px;
          padding-top:15px;
        }
        .width10Per {
            width:7%;
        }
        .bgColor {
            background-color :  #ddd;
        }
        .leftSideWhite {
         border-right:1px solid white;
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
                        <h1 class="box-title"><b>ERP &gt; 業務通告 &gt; 業務通告</b> </h1>
                        <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title="">
                            
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <ul id="myTab" class="nav nav-tabs tabDivMargin3">
                            <li class="active">
                                <a id="#nextMonthSoonFallDueMemberDiv" href="#nextMonthSoonFallDueMemberDiv" data-toggle="tab" class="tabChange qPer" openDivName="#nextMonthSoonFallDueMemberDiv">次月交易即將到期之會員</a>
                            </li>
                            <li class="">
                                <a href="#customerInTheLastOneMonthDiv" data-toggle="tab" class="tabChange qPer" openDivName="#customerInTheLastOneMonthDiv">近一個月內轉進之客戶</a>
                            </li>
                            <li class="">
                                <a href="#expiredCustomerDiv" data-toggle="tab" class="tabChange qPer" openDivName="#expiredCustomerDiv">名下過期會員(測試中)</a>
                            </li>
                            <li class="">
                                <a href="#birthDayCustomerDiv" data-toggle="tab" class="tabChange qPer"  openDivName="#birthDayCustomerDiv">近一個月生日之客戶</a>
                            </li>
                        </ul>
                        <!--次月交易即將到期之會員##########################################Start-->
                        <div id="nextMonthSoonFallDueMemberDiv" class="tabDivMargin5 tabChangeDiv">
        
                            <div id="nextMonthSoonFallDueMemberInerDiv" class="tabDivMargin4">
                            <table class="table">
                                <thead >
                                    <tr class="marginTop5px bgColor">
                                        <th class="textAlignCenter width10Per leftSideWhite">
                                            項次
                                        </th>
                                         <th class="textAlignCenter width10Per leftSideWhite">
                                            客戶姓名
                                        </th>
                                        <th class="textAlignCenter width10Per leftSideWhite">
                                            交易編號
                                        </th>
                                        <th class="textAlignCenter width10Per leftSideWhite">
                                            分析師
                                        </th>
                                        <th class="textAlignCenter width10Per leftSideWhite">
                                            種類
                                        </th>
                                        <th class="textAlignCenter width10Per leftSideWhite">
                                            入會時間
                                        </th>
                                        <th class="textAlignCenter width10Per leftSideWhite">
                                           到期時間
                                        </th>
                                    </tr>
                                </thead>
                                <tbody id="nextMonthSoonFallDueMemberTb">

                                </tbody>
                            </table>
                            </div>
                        </div>
                        <!--次月交易即將到期之會員##########################################End-->
                        
                        <!--近一個月內轉進之客戶#########################################Start-->
                        <div id="customerInTheLastOneMonthDiv" class="tabDivMargin5 startHide tabChangeDiv">
         
                            <div id="customerInTheLastOneMonthInerDiv" class="tabDivMargin4">
                               
                                <table class="table">
                                    <thead >
                                        <tr class="marginTop5px bgColor">
                                            <th class="textAlignCenter width10Per leftSideWhite">
                                                項次
                                            </th>
                                             <th class="textAlignCenter width10Per leftSideWhite">
                                                客戶姓名
                                            </th>
                                             <th class="textAlignCenter width10Per leftSideWhite">
                                                生日
                                            </th>
                                            <th class="textAlignCenter width10Per leftSideWhite">
                                                手機
                                            </th>
                                            <th class="textAlignCenter width10Per leftSideWhite">
                                                家裡電話
                                            </th>
                                            <th class="textAlignCenter width10Per leftSideWhite">
                                                公司電話
                                            </th>
                                            <th class="textAlignCenter width10Per leftSideWhite">
                                                建檔時間
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody id="customerInTheLastOneMonthTb">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--近一個月內轉進之客戶#########################################End-->

                        <!--名下過期會員#########################################Start-->
                        <div id="expiredCustomerDiv" class="tabDivMargin5 startHide tabChangeDiv">
         
                            <div id="expiredCustomerInerDiv" class="tabDivMargin4">
                               
                                <table class="table">
                                    <thead >
                                        <tr class="marginTop5px bgColor">
                                            <th class="textAlignCenter width10Per leftSideWhite">
                                                項次
                                            </th>
                                             <th class="textAlignCenter width10Per leftSideWhite">
                                                客戶姓名
                                            </th>
                                             <th class="textAlignCenter width10Per leftSideWhite">
                                                生日
                                            </th>
                                            <th class="textAlignCenter width10Per leftSideWhite">
                                                手機
                                            </th>
                                            <th class="textAlignCenter width10Per leftSideWhite">
                                                家裡電話
                                            </th>
                                            <th class="textAlignCenter width10Per leftSideWhite">
                                                公司電話
                                            </th>
                                            <th class="textAlignCenter width10Per leftSideWhite">
                                                建檔時間
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody id="expiredCustomerTb">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--名下過期會員#########################################End-->
                        <!--近一個月生日之客戶#########################################Start-->
                        <div id="birthDayCustomerDiv" class="tabDivMargin5 startHide tabChangeDiv">
         
                            <div id="birthDayCustomerInerDiv" class="tabDivMargin4">
                               
                                <table class="table">
                                    <thead >
                                        <tr class="marginTop5px bgColor">
                                            <th class="textAlignCenter width10Per leftSideWhite">
                                                項次
                                            </th>
                                             <th class="textAlignCenter width10Per leftSideWhite">
                                                客戶姓名
                                            </th>
                                             <th class="textAlignCenter width10Per leftSideWhite">
                                                生日
                                            </th>
                                            <th class="textAlignCenter width10Per leftSideWhite">
                                                手機
                                            </th>
                                            <th class="textAlignCenter width10Per leftSideWhite">
                                                家裡電話
                                            </th>
                                            <th class="textAlignCenter width10Per leftSideWhite">
                                                公司電話
                                            </th>
                                            <th class="textAlignCenter width10Per leftSideWhite">
                                                建檔時間
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody id="birthDayCustomerTb">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--近一個月生日之客戶#########################################End-->

                        <div style="text-align:center">
　                        <div id="pageBar" style="margin:0 auto;"> </div>
                            
                        </div>
                        
                    </div><!--/.box-body-->

                </div><!--/.box-->
                
            </div>
          </div><!-- /.row (main row) -->

        </section><!-- /.content -->
        
      </div>
     <script src="<%=getRelativePath()%>js/MasterPage.js" type="text/javascript"></script>
     <script src="<%=getRelativePath()%>js/pageList/businessConnectionCall/nextMonthSoonFallDueMemberPageList.js" type="text/javascript"></script> 
    <script src="<%=getRelativePath()%>js/pageList/businessConnectionCall/customerInTheLastOneMonthPageList.js" type="text/javascript"></script> 
    <script>
        var BusinessConnectionCallHandlerUrl_G = "businessConnectionCallHandler.ashx";
        var MENU_no_G = "<%=getMENU_no()%>";
        //頁籤切換功能
        var tabChange = function () {
            blockUI_M();
            var divId = $(this).attr("openDivName");
            switch (divId) {
                case "#nextMonthSoonFallDueMemberDiv":
                    getNextMonthSoonFallDueMember();
                    break;
                case "#customerInTheLastOneMonthDiv":
                    getCustomerInTheLastOneMonth();
                    break;
                case "#expiredCustomerDiv":
                    getExpiredCustomer();
                    break;
                case "#birthDayCustomerDiv":
                    getBirthDayCustomer();
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
        var getNextMonthSoonFallDueMember = function () {
            var data = "U_Num=" + U_Num_M + "&action=getNextMonthSoonFallDueMember";
            var success = function (back) {
                Log_M("getNextMonthSoonFallDueMember back=" + back);
                var json = jsonParse_M(back);
                $nextMonthSoonFallDueMemberPageList.Table.makeTbody("#nextMonthSoonFallDueMemberTb", json, 10, "#pageBar");
            };
            var error = function (e) { Log_M("getNextMonthSoonFallDueMember error=" + e); unBlockUI_M(); };
            ajax_M(BusinessConnectionCallHandlerUrl_G, data, success, error);
        };
        var getCustomerInTheLastOneMonth = function () {
            var data = "U_Num=" + U_Num_M + "&action=getCustomerInTheLastOneMonth";
            var success = function (back) {
                Log_M("getCustomerInTheLastOneMonth back=" + back);
                var json = jsonParse_M(back);
                $customerInTheLastOneMonthPageList.Table.makeTbody("#customerInTheLastOneMonthTb", json, 10, "#pageBar");
            };
            var error = function (e) { Log_M("getCustomerInTheLastOneMonth error=" + e); unBlockUI_M(); };
            ajax_M(BusinessConnectionCallHandlerUrl_G, data, success, error);
        };

        var getExpiredCustomer = function () {
            var data = "U_Num=" + U_Num_M + "&action=getExpiredCustomer";
            var success = function (back) {
                Log_M("getExpiredCustomer back=" + back);
                var json = jsonParse_M(back);
                $customerInTheLastOneMonthPageList.Table.makeTbody("#expiredCustomerTb", json, 10, "#pageBar");
            };
            var error = function (e) { Log_M("getExpiredCustomer error=" + e); unBlockUI_M(); };
            ajax_M(BusinessConnectionCallHandlerUrl_G, data, success, error);
        };
        var getBirthDayCustomer = function () {
            var data = "U_Num=" + U_Num_M + "&action=getBirthDayCustomer";
            var success = function (back) {
                Log_M("getBirthDayCustomer back=" + back);
                var json = jsonParse_M(back);
                $customerInTheLastOneMonthPageList.Table.makeTbody("#birthDayCustomerTb", json, 10, "#pageBar");
            };
            var error = function (e) { Log_M("getBirthDayCustomer error=" + e); unBlockUI_M(); };
            ajax_M(BusinessConnectionCallHandlerUrl_G, data, success, error);
        };

        var startThisPage = function () {
            onClick_M(".tabChange", tabChange);
            getNextMonthSoonFallDueMember();
           
        };
      
        $(function () {
            //查看使用者權限
            getUserAuthority_M(startThisPage);
        })
    </script>
</asp:Content>

