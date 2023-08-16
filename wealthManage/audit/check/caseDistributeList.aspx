<%@ Page Language="C#" AutoEventWireup="true" CodeFile="caseDistributeList.aspx.cs" Inherits="wealthManage_audit_check_caseDistributeList" %>

<!DOCTYPE html>

<html><head>
    <meta charset="UTF-8"/>
    <title>華冠投顧ERP</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
    <!-- Bootstrap 3.3.2 -->
    <link href="<%=getRelativePath()%>bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">    
    <!-- FontAwesome 4.3.0 -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Ionicons 2.0.0 -->
    <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css">    
    <!-- Theme style -->
    <link href="<%=getRelativePath()%>dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="<%=getRelativePath()%>dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css">
    <!-- iCheck -->
    <link href="<%=getRelativePath()%>plugins/iCheck/flat/blue.css" rel="stylesheet" type="text/css">
    <!-- Morris chart -->
    <link href="<%=getRelativePath()%>plugins/morris/morris.css" rel="stylesheet" type="text/css">
    <!-- jvectormap -->
    <link href="<%=getRelativePath()%>plugins/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css">
    <!-- Date Picker -->
    <link href="<%=getRelativePath()%>plugins/datepicker/datepicker3.css" rel="stylesheet" type="text/css">
    <!-- Daterange picker -->
    <link href="<%=getRelativePath()%>plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link href="<%=getRelativePath()%>plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css">
    <link href="<%=getRelativePath()%>plugins/jQueryUI/CSS/jquery-ui-1.10.4.custom.min.css" rel="stylesheet" type="text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        #addCustomerDataTb td {
            border-right:1px solid #ddd;
        }
        
        .bgYellow {
            background-color:#FFFFBB;
        }
        .bgBlue {
            background-color:#CCEEFF;
        }
        .bgGray {
            background-color:#DDDDDD;
        }
        .borderGray {
            border:2px solid #f4f4f4;
        }
        #clear {
            margin-left:10px;
        }
        .closeBtn {
            background-color:#f4f4f4;
            color:black;
        }
        .colorRed {
            color:red;
        }
        .colorYellow {
            color:red;
        }
        .colorGreen {
            color:forestgreen;
        }
        .colorBlue {
            color:blue;
        }
        #detailHead {
            font-size:20px;
        }
        .detailHead {
             background-color :#DCDCDC	;
        }
        .detail {
             border:1px solid #DCDCDC;
             border-top-color:#DCDCDC;
             margin-top:10px;
             margin-bottom:40px
        }
        .divBorder {
           border:2px solid #f4f4f4;
           margin-bottom:10px;
        }
        .fontSize18{
            font-size:18px;
        }
        .fontWeightBold {
            font-weight:bold;
        }
        .inputSearch{
            display: inline-block; width:110px;margin-right:5px;
        }
        .inputSearch1{
            display: inline-block; width:70px;margin-right:5px;
        }
        .inputSearch2{
            display: inline-block; width:150px;margin-right:5px;
        }
        .inputSearch3{
            display: inline-block; width:170px;margin-right:5px;
        }
        .inputSearch4{
            display: inline-block; width:110px;margin-right:5px;
        }

        .jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;z-index: 10000;}
        .jqsfield { color: white;font: 10px arial, san serif;text-align: left;}
        .leftSideWhite {
            border-right:1px solid white;
        }
        .margin10 {
            margin:1px;
        }
        .marginTop5 {
            margin-top:5px;
        }
        .marginTop10 {
            margin-top:10px;
        }
        .marginTop25 {
            margin-top:25px;
        }
        .marginTop30 {
            margin-top:30px;
        }
        .marginRight0 {
            margin-right:0px;
        }
        .marginRight {
            margin-right:10px;
        }
        .marginRight20 {
            margin-right:20px;
        }
        .marginLeft {
            margin-left:10px;
        }
        .marginTop-27 {
             margin-top:-27px;
        }
        .marginTop-130 {
             margin-top:-130px;
        }
        .marginLeftRight10 {
            margin-left:10px;
            margin-right:10px;
        }
        .marginBottom5 {
            margin-bottom:5px;
        }
        .marginBottom10 {
            margin-bottom:10px;
        }
        .marginBottom-7 {
            margin-bottom:-7PX;
        }
        #pageBar {
            margin-top:10px;
            margin-right :10px;
            margin-left :10px;
        }
        .pageList {
            margin :5px;
            padding :5px;
            font-size:15px;
        } 
        .pageSpan {
             display: inline-block; width:150px;margin-left:280px;
        }
        .spaceCenter {
	        margin-top: 5%;
        }
        .spaceCenter1 {
           margin-top: 15px;
        }
        .startHide {
            display:none;
        }
        .span1{
            float: left;
            width: 33%;
        }
        .span2{
            float: left;
            width: 33%;
          }
        .span3{
            float: left;
            width: 33%;
          }
        .span4{
            margin-left:72%;
            width: 33%;
        }
        .tabDiv {
          margin-bottom:20px;
          margin-left:20px;
          margin-right:20px;
          margin-top:5px;
        }
        .tabChangeDiv {
            border-left: 1px solid #ddd;
            border-right: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            margin-bottom:100px;
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
        .textAlignCenter{
            text-align: center;
        }
        .textAlignLeft{
            text-align: left;
        }
        .textAlignRight{
          text-align: right;
        }
        .textAlignCenter,option {
            text-align:center;
        }
        .titleBottomBorder {
            border-bottom:2px solid #f4f4f4;
        }
        .width15percent {
            width:15%;
        }
        .width20percent {
            width:20%;
        }
        .width10percent {
            width:10%;
        }
        .width50percent {
            width:20%;
        }
        .width33percent {
            width:33%;
        }
    </style>
</head>
<body  style="font-family:Microsoft JhengHei;" >
<!-- jQuery 2.1.3 -->
    
    <script src="<%=getRelativePath()%>plugins/jQuery/jQuery-2.1.3.min.js"></script>
        <!-- jQuery 2.1.3 -->
    <script src="<%=getRelativePath()%>plugins/jQueryUI/jquery.blockUI.js"></script>
      <!-- Bootstrap 3.3.2 JS -->
    <script src="<%=getRelativePath()%>js/HG.js" type="text/javascript"></script>
    <script src="<%=getRelativePath()%>js/common/Common.js" type="text/javascript"></script>
    <script src="<%=getRelativePath()%>js/common/CommonTool.js" type="text/javascript"></script>
    <script src="<%=getRelativePath()%>js/MasterPage.js" type="text/javascript"></script> 
    
    <div  style="text-align:center;margin-top:20px;" >
        <table  class="table" style="width:90%;margin:0 auto;">
            <thead>
                <tr>
                    <th class="textAlignCenter" colspan="8" style="font-size:20px;">派發明細表</th>
                </tr>
            <tr>
                <th class="textAlignCenter  leftSideWhite" style="width:5%">序號</th>
                <th class="textAlignCenter  leftSideWhite" style="width:5%">燈號</th>
                <th class="textAlignCenter  leftSideWhite" style="width:10%">客戶姓名</th>
                <th class="textAlignCenter  leftSideWhite" style="width:15%">聯絡電話</th>
                <th class="textAlignCenter  leftSideWhite" style="width:10%">分配人員</th>
                <th class="textAlignCenter  leftSideWhite" style="width:15%">分配日期</th>
                <th class="textAlignCenter  leftSideWhite" style="width:20%">長註記</th>
                <th class="textAlignCenter  leftSideWhite" style="width:20%">短註記</th>
            </tr>
            </thead>
            <tbody id="caseDistributeListTb">
                
            </tbody>
        </table>
    </div>
     <div style="text-align:center" id="pageBarDiv" class="">
　       <div id="pageBar" style="margin:0 auto;"> </div>
     </div>
    <div id="tagHistoryTabDialog" class="tabDivMargin startHide form-control" title="公司資源註記 - 歷史資料 ">
        <table class="table" id="tagHistoryTab">
            <thead>
                <tr class ="detailHead" id="tagHistoryHead">
                    <th class="textAlignCenter brWhite">序 </th>
                    <th class="textAlignCenter brWhite">註記日期</th>
                    <th class="textAlignCenter">註記人員</th>
                    <th class="textAlignCenter">註記種類</th>
                </tr>
        </thead>
        <tbody id="tagHistoryTb"></tbody>
    </table>

    </div>
     <!-- Bootstrap 3.3.2 JS -->
    <script src="<%=getRelativePath()%>bootstrap/js/bootstrap.min.js" type="text/javascript"></script>    
    <!-- 第一 -->
    <script src="<%=getRelativePath()%>plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="<%=getRelativePath()%>plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
    <!-- 第二 -->
    <!-- Slimscroll -->
    <script src="<%=getRelativePath()%>plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- AdminLTE App -->
    <script src="<%=getRelativePath()%>dist/js/app.min.js" type="text/javascript"></script>
    <!-- 第三 -->
    <!-- jQuery UI 1.11.2 -->
    <script src="http://code.jquery.com/ui/1.11.2/jquery-ui.min.js" type="text/javascript"></script>
     <script src="<%=getRelativePath()%>js/ckeditor/ckeditor.js" type="text/javascript"></script>
     <script src="<%=getRelativePath()%>js/pageList/caseDistributeListPageList.js" type="text/javascript"></script> 
    <script>
        var ajax_M = function (url, data, success, error) {
            $.ajax({
                url: url,
                data: data,
                method: 'POST',
                success: success,
                error: error
            });
        };
        var jsonParse_M = function (str) {
            return JSON.parse(str);
        };
        var empty_M = function (idOrClassName) {
            $(idOrClassName).empty();
        };
        var isEmptyStr = function (str) {
            var f = false;
            if (str === undefined || str === null || $.trim(str) === "" || str == "[]" || str == "[object Object]" || str == [] || str == "null") {
                f = true;
            }
            return f;
        };
        var StringBuilder_M = function () {
            this.buffer = [];
            this.append = function (val) {
                this.buffer.push(val);
                return this;
            };
            this.appendWhiteSpace = function () {
                this.buffer.push(" ");
                return this;
            };
            this.appendAttr = function (key, val) {
                this.buffer.push(key);
                this.buffer.push("='");
                this.buffer.push(val);
                this.buffer.push("'");
                return this;
            };
            this.toString = function () {
                return this.buffer.join('');
            };
            this.release = function () {
                while (this.buffer.length > 0) {
                    this.buffer.pop();
                }
            };
        };
        var AuditHandlerUrl_G = "auditHandler.ashx";
        var MENU_no_G ="<%=getMENU_no()%>";
        var U_Num_G = "<%=getU_Num()%>";
        //取得註記歷史資料
        var getTagHistory = function () {
            var M_ID = $(this).attr("Mid");
            var data = "M_ID=" + M_ID + "&action=getTagHistory";
            var success = function (back) {
                empty_M("#tagHistoryTb");
                var sb = new StringBuilder_M();
                if (isEmptyStr(back)) {
                    $("#tagHistoryTb").append("<tr style='margin-right:0 auto;text-align:center;'><th id='' class='textAlignCenter' colspan='4'>無資料</th></tr>")
                } else {

                    var json = jsonParse_M(back);
                    
                    $.each(json, function (i, v) {
                        sb.append("<tr style='margin-right:0 auto;text-align:center;'><th class='textAlignCenter'>");
                        sb.append(i + 1);
                        sb.append("</th><th class='textAlignCenter'>");
                        sb.append(v.DM_MarkTime);
                        sb.append("</th><th class='textAlignCenter'>");
                        sb.append(v.DM_MC_Name);
                        sb.append("</th><th class='textAlignCenter'>");
                        sb.append(v.DM_tagName);
                        sb.append("</th></tr>");
                    });
                    
                }
                $("#tagHistoryTb").append(sb.toString());
                $('#tagHistoryTabDialog').dialog("open");
            };
            ajax_M(AuditHandlerUrl_G, data, success);//<=====================================
    
        };

        var getCaseDistributeList = function () {
            var data = "action=getCaseDistributeList&U_Num=" + U_Num_G;
            var success = function (back) {
                var json = jsonParse_M(back);
                $caseDistributeListPageList.Table.makeTbody("#caseDistributeListTb", json, 10, "#pageBar", getTagHistory);
            };
            var error = function (e) { Log_M("getCaseDistributeList error=" + e); unBlockUI_M(); };
            ajax_M(AuditHandlerUrl_G, data, success, error);
        };
        
        //進行頁面處理===============================================start
        var startThisPage = function () {
            
            getCaseDistributeList();
            $('#tagHistoryTabDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 800,
            });
        };
        //進行頁面處理===============================================end

        $(function () {
            startThisPage();

        })
    </script>
     <!-- Bootstrap 3.3.2 JS -->
    <script src="<%=getRelativePath()%>bootstrap/js/bootstrap.min.js" type="text/javascript"></script>    
    <!-- 第一 -->
    <script src="<%=getRelativePath()%>plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="<%=getRelativePath()%>plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
    <!-- 第二 -->
    <!-- Slimscroll -->
    <script src="<%=getRelativePath()%>plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- AdminLTE App -->
    <script src="<%=getRelativePath()%>dist/js/app.min.js" type="text/javascript"></script>
    <!-- 第三 -->
</body>
</html>
