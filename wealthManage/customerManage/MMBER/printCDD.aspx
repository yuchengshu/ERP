<%@ Page Language="C#" AutoEventWireup="true" CodeFile="printCDD.aspx.cs" Inherits="wealthManage_customerManage_MMBER_printEnvelope" %>

<!DOCTYPE html>

<html><head>
<meta charset="UTF-8"/>
<title>華冠投顧ERP</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
<!-- Bootstrap 3.3.2 -->
    <link href="../../../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">    
    <!-- FontAwesome 4.3.0 -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Ionicons 2.0.0 -->
    <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css">    
    <!-- Theme style -->
    <link href="../../../dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="../../../dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css">
    <!-- iCheck -->
    <link href="../../../plugins/iCheck/flat/blue.css" rel="stylesheet" type="text/css">
    <!-- Morris chart -->
    <link href="../../../plugins/morris/morris.css" rel="stylesheet" type="text/css">
    <!-- jvectormap -->
    <link href="../../../plugins/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css">
    <!-- Date Picker -->
    <link href="../../../plugins/datepicker/datepicker3.css" rel="stylesheet" type="text/css">
    <!-- Daterange picker -->
    <link href="../../../plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link href="../../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">


        .colorBlue {
            color:blue;
        }
        #dataBar {
            border-bottom:1px solid black;
            margin-top:20px;
            padding-bottom:5px;
            margin-bottom:20px;
             
        }
        
        .fontSize18 {
        font-size:18px;
            font-size:18px;
        }

        .fontSize15 {
        font-size:15px;
        }
        .printAreaDiv {
        font-size:10px;
        }
        .marginTop5 {
         margin-top:5px;
        }
        .marginBottom5 {
         margin-bottom:5px;
        }
        .marginTop10 {
         margin-top:10px;
        }
        .marginLeft60 {
         margin-left:60px;
        }
        .marginLeft150 {
         margin-left:150px;
        }
        .marginLeftRight2 {
         margin-left:2px;
         margin-right:2px;
        }
        table,tr,th {
          border:1px solid black;
        }
        .textAlignCenter{
            text-align:center;
        }
        .textAlignLeft{
            text-align:left;
        }

    </style>
</head>
<body>
  <!-- jQuery 2.1.3 -->
    <script src="../../../plugins/jQuery/jQuery-2.1.3.min.js"></script>
        <!-- jQuery 2.1.3 -->
    <script src="../../../plugins/jQueryUI/jquery.blockUI.js"></script>
      <!-- Bootstrap 3.3.2 JS -->
    <script src="../../../js/HG.js" type="text/javascript"></script> 
    <div id="dataBar">
        <input id="printBtn" type="button" value="列印" class="marginLeft60" onclick="javascrīpt: printme()" />
    </div>

    <div id="printArea" class="printAreaDiv"> 
        <div style="text-align:center;">
            <div><b class="fontSize18"><span>(CDD) 客戶洗錢及資恐風險評估表(自然人)</span><span class="marginLeft60">□新客戶 ▉既有客戶 ※風險等級評估為高風險者，應填寫「加強客戶審查表」</span></b></div>
        </div>
        <div style="text-align:center;" class="marginTop5 marginBottom5">
            <div><b class="fontSize15">中華民國&nbsp;&nbsp;<span id="year" class="marginLeftRight2"></span>&nbsp;&nbsp;年&nbsp;&nbsp;<span id="month" class="marginLeftRight2"></span>&nbsp;&nbsp;月&nbsp;&nbsp;<span id="day" class="marginLeftRight2"></span>&nbsp;&nbsp;日&nbsp;&nbsp;</b></div>
        </div>
        <div style="text-align:left;">
            <div style="margin:0 auto;width:90%;"><b>客戶姓名&nbsp;:&nbsp;&nbsp;<span id="M_Name"></span></b><b class="marginLeft150">身分證字號&nbsp;:&nbsp;&nbsp;<span id="M_SD"></span></b></div>
        </div>
        
        <div style="text-align:center;">
            <table style="margin:0 auto;width:90%; height:400px;" class="textAlignCenter">
            <tr style="height:27px;">
                <th rowspan="2" style="width:5%" class="textAlignCenter">&nbsp;</th>
                <th rowspan="2" style="width:12%" class="textAlignCenter">評估項目</th>
                <th colspan="3" style="width:13%" class="textAlignCenter">風險等級</th>
                
                <th colspan="3" style="width:70%" class="textAlignCenter">定義</th>
               
            </tr>
             <tr style="height:27px;">
               
                <th class="textAlignCenter">低</th>
                <th class="textAlignCenter">一般</th>
                <th class="textAlignCenter">高</th>
                <th class="textAlignCenter"style="width:23%">低風險</th>
                <th class="textAlignCenter"style="width:23%">一般風險</th>
                <th class="textAlignCenter"style="width:24%">高風險</th>
            </tr>
            <tr>
                <th class="textAlignCenter">1</th>
                <th class="textAlignCenter">政治人物(PEPs)</th>
                <th class="textAlignCenter">V</th>
                <th class="textAlignCenter"></th>
                <th class="textAlignCenter"></th>
                <th class="textAlignCenter">否</th>
                <th class="textAlignLeft">非現職PEPs及其家庭成員或密切關係之人，註記：</th>
                <th class="textAlignLeft">現職PEPs及其家庭成員或密切關係之人/仍具影響力之非現職PEPs及其家庭成員或密切關係之人，註記：</th>
            </tr>
             <tr>
                <th class="textAlignCenter">2</th>
                <th class="textAlignCenter">國籍別</th>
                <th class="textAlignCenter">V</th>
                <th class="textAlignCenter"></th>
                <th class="textAlignCenter"></th>
                <th class="textAlignCenter">本國/非本國(有居留證)</th>
                <th class="textAlignLeft">非本國(無居留證)</th>
                <th class="textAlignLeft">雙重國籍身分或研判疑似雙重國籍者/高風險國家</th>
            </tr>
            <tr>
                <th class="textAlignCenter">3</th>
                <th class="textAlignCenter">職業別</th>
                <th class="textAlignCenter">V</th>
                <th class="textAlignCenter"></th>
                <th class="textAlignCenter"></th>
                <th class="textAlignCenter">可清楚得知/非屬右列2項者職業：</th>
                <th class="textAlignLeft">無法得知/不願告知/異常者</th>
                <th class="textAlignLeft">FATF公告之高洗錢行業/負面新聞</th>
            </tr>
            <tr>
                <th class="textAlignCenter">4</th>
                <th class="textAlignCenter">建立業務管道</th>
                <th class="textAlignCenter"><span id="low"></span></th>
                <th class="textAlignCenter"><span id="mid"></span></th>
                <th class="textAlignCenter"><span id="height"></span></th>
                <th class="textAlignCenter">面對面、現金20萬元以下</th>
                <th class="textAlignLeft">現金20萬元以上，50萬元以下</th>
                <th class="textAlignLeft">現金50萬元以上</th>
            </tr>
            <tr>
                <th class="textAlignCenter" colspan="2">風險評估結果</th>
                <th class="textAlignCenter" colspan="3"><span id="risk" class="fontSize18 colorBlue"></span></th>
                <th class="textAlignLeft" colspan="3">
                    評估時點：▉首次　　□非首次，前次風險評估日期：     ，風險等級：<br />
                    本次較前次評估結果：□風險等級不變 □風險等級提高 □風險等級降低<br />
                    定期檢視：▉低風險，每5年檢視乙次 □一般風險，每3年檢視乙次 □高風險，每1年須檢視乙次</th>
               
            </tr>
        </table>
        </div>
        <div style="text-align:left;" class="marginTop10">
            <div style="margin:0 auto;width:90%;"><b>評估人員&nbsp;:&nbsp;&nbsp;<span id="MC"></span></b><b class="marginLeft150">覆核人員&nbsp;:&nbsp;&nbsp;<span id="MCleaderName"></span></b></div>
        </div>
        
    </div>  


    <script>
        
        var ajax_M = function (url, data, success,error) {
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
        var M_Name_G =undefined;
        var M_SD_G =undefined;
        var U_Name_G =undefined;
        var U_LeaderName_G =undefined;

     
        var json = <%=getCDDdata()%>;
        function printme() {
            document.getElementById('printArea').style.zoom = 0.70;
            document.getElementById('risk').style.color ="blue";

            var html=document.getElementById('printArea').innerHTML;
            
            document.body.innerHTML = html;
            window.print();
        }
        var setT_AccountDate=function(T_AccountDate){
            var arr = T_AccountDate.split(' ');
            var T_AccountDateArr = arr[0].split('/');
            $("#year").text(T_AccountDateArr[0]);
            $("#month").text(T_AccountDateArr[1]);
            $("#day").text(T_AccountDateArr[2]);
        };
        
        var getCustomerDataByMid = function(Mid){
            var data = "M_ID=" + Mid  + "&action=getCustomerDataByMid";
            var success = function (back) {
                var json = jsonParse_M(back);
                $("#M_Name").text(json.M_Name);
                $("#M_SD").text(json.M_SD);
            };
            var error = function (e) { Console.log("getCustomerDataByMid error=" + e); };
            ajax_M("customerManageHandler.ashx", data, success,error);//<======================
        };

        var getMCdata = function(MC){
            var data = "MC=" + MC  + "&action=getMCdata";
            var success = function (back) {
                var json = jsonParse_M(back);
                $("#MC").text(json.U_Name);
                $("#MCleaderName").text(json.U_LeaderName);
               
            };
            var error = function (e) { Console.log("getMuserDataByMC error=" + e); };
            ajax_M("customerManageHandler.ashx", data, success,error);//<======================
        };

        var setRiskLevel = function(T_PayMoney){
            var TPayMoney = parseInt(T_PayMoney);
            if(TPayMoney < 200000){
                $("#low").text("V");
                $("#risk").text("低風險");
         
            }else if(TPayMoney >= 200000 && TPayMoney<500000){
                $("#mid").text("V");
                $("#risk").text("中風險");
            }else if(TPayMoney>=500000){
                $("#height").text("V");
                $("#risk").text("高風險");
            }

        };

        $(function () {

            setRiskLevel(json.T_PayMoney);
            getMCdata(json.MC);
            getCustomerDataByMid(json.M_ID);
            setT_AccountDate(json.T_AccountDate);

        })
    </script>
    
    <!-- Bootstrap 3.3.2 JS -->
    <script src="../../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>    
    <!-- 第一 -->
    <script src="../../../plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="../../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
    <!-- 第二 -->
    <!-- Slimscroll -->
    <script src="../../../plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- AdminLTE App -->
    <script src="../../../dist/js/app.min.js" type="text/javascript"></script>
    <!-- 第三 -->
</body>
</html>
