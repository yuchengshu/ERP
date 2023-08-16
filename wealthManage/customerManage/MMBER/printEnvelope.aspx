<%@ Page Language="C#" AutoEventWireup="true" CodeFile="printEnvelope.aspx.cs" Inherits="wealthManage_customerManage_MMBER_printEnvelope" %>

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
        .fontSize {
        font-size:40px;
        font-weight:bold;
        }
        .leftFontSize{
        font-size:25px;
        
        }
        .marginLeft {
        margin-left:50px;
        }
        #mcNameFont {
             margin-left:120px;
        }
        #comTelFont {
        margin-bottom:238px;
         margin-left:190px;
        }
        #comAddressFont {
         margin-bottom:25px;
        }
         #comNameFont {
        margin-bottom:35px;
        }
        #cusName {
        margin-bottom:0px;
         margin-top:250PX;
        }
       
        .wordBold {
        font-weight:bold;
        }
        .cus,.sendMC {
            display:none;
        }
        #dataBar {
            border-bottom:1px solid black;
            margin-top:20px;
            padding-bottom:5px;
            margin-bottom:20px;
             font-size:18px;
        }
        #MC_Name {
        margin-bottom:170px;
        }
         #H_Address {
        margin-bottom:40px;
        }
        .marginLeft20 {
         margin-left:60px;
        }
        #GIN {
         margin-top:80PX;
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
    <div id="dataBar"><input id="printBtn" type="button" value="列印" class="marginLeft20" onclick="javascrīpt: printme()" /><span class="wordBold marginLeft20">入帳日期&nbsp;:&nbsp;</span><span id="T_AccountDate"></span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="wordBold">發票種類&nbsp;:&nbsp;</span><span id="INV_Item"></span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="wordBold">寄發狀況&nbsp;:&nbsp;</span><span id="INV_SendState"></span></div>
    
    
  
     <div id="printArea"> 
       <FONT STYLE="writing-mode:tb-rl" id="comTelFont" class="font"><span id="comTel" class="leftFontSize"></span></FONT>
       <FONT STYLE="writing-mode:tb-rl" class="" id="comAddressFont" class="font"><span id="comAddress" class="leftFontSize"></span></FONT> 
       <FONT STYLE="writing-mode:tb-rl" id="comNameFont" class="font"><span id="comName" class="leftFontSize"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> 
       <FONT STYLE="writing-mode:tb-rl" class="marginLeft" class="font"><span id="cusName" class="fontSize"></span><span id="GIN" class="fontSize">君</span></FONT> 
        <FONT STYLE="writing-mode:tb-rl" id="mcNameFont" class=""><span id="HZipCode" class="leftFontSize cus"></span>&nbsp;&nbsp;<span id="HCity" class="leftFontSize cus"></span><span id="HTown" class="leftFontSize cus"></span><span id="H_Address" class="leftFontSize cus"></span><span id="" class="leftFontSize sendMC">發票轉交業務 → </span><span id="MC_Name" class="leftFontSize sendMC"></span></FONT>
    </div>  


    <script>
        var json = <%=getEnvelope()%>;
        var EnvelopeCount = "<%=getEnvelopeCount()%>";
        var HZipCode = undefined;
        var HCity = undefined;
        var HTown = undefined;
        var H_Address = undefined;
        var M_Name = undefined;
        var HG_Name = undefined;
        var HG_Address = undefined;
        var HG_Tel = undefined;
        function printme() {
            var count = parseInt(EnvelopeCount);
            var html="";
            for(var i=0;i<count;i++){
                html+=document.getElementById('printArea').innerHTML;
            }
            document.body.innerHTML = html;
            window.print();
        }
        $(function () {
           
            $("#T_AccountDate").text(json.T_AccountDate.split(' ')[0]);
            var invItem = undefined;
            if(json.INV_Item == "1"){
                invItem = "二聯";
            }else if(json.Inv_Item == "2"){
                invItem = "三聯";
            }
            $("#INV_Item").text(invItem);
            var invSendState = undefined;
            var INV_SendState = json.INV_SendState;
            switch(INV_SendState){
                case "1":
                    invSendState = "一般";
                    break;
                case "2":
                    invSendState = "空白信封";
                    break;
                case "3":
                    invSendState = "發票轉交業務("+json.MC_Name+")";
                    break;
                case "5":
                    invSendState = "捐贈";
                    break;
            }
            $("#INV_SendState").text(invSendState);
            switch(json.MC_COM){
                case "HG01":
                    HG_Tel =  "TEL:(02)6630-3201";
                    break;
                case "HG02":
                    HG_Tel = "TEL:(02)6630-3266";
                    break;
                case "HG03":
                    HG_Tel = "TEL:(02)6630-3221";
                    break;
                case "HG04":
                    HG_Tel = "TEL:(02)6630-3231";
                    break;
                case "HG05":
                    HG_Tel = "TEL:(02)6630-3237";
                    break;
                case "HG06":
                    HG_Tel = "TEL:(02)6632-1000";
                    break;
            }

            if(INV_SendState == "1" || INV_SendState == "3"){
                HZipCode = "";
                HCity = "";
                HTown = "";
                if(INV_SendState == "3"){
                    H_Address = "發票轉交業務 → "+json.MC_Name;
                    $(".sendMC").show();
                }else{
                    HZipCode = json.HZipCode;
                    HCity = json.HCity;
                    HTown = json.HTown;
                    H_Address = json.H_Address;
                    $(".cus").show();
                }
                if($HG.util.isEmptyStr(json.Recipient)){
                    M_Name = json.M_Name;
                }else{
                    M_Name = json.Recipient;
                }
                HG_Name = "華冠證券投資顧問股份有限公司";        
                HG_Address = "100 台北市忠孝東路二段100號6樓之2";
            }else if(INV_SendState == "2"){
                HZipCode = json.HZipCode;
                HCity = json.HCity;
                HTown = json.HTown;
                H_Address = json.H_Address;
                $(".cus").show();
                if($HG.util.isEmptyStr(json.Recipient)){
                    M_Name = json.M_Name;
                }else{
                    M_Name = json.Recipient;
                }
                HG_Tel = "";
            }else if(INV_SendState == "5"){
                H_Address = "108 台北市萬華區艋舺大道303號";
                M_Name = "紅十字會";
                HG_Name = "華冠證券投資顧問股份有限公司";        
                HG_Address = "100 台北市忠孝東路二段100號6樓之2";
                $(".cus").show();
            }

            $("#comTel").text(HG_Tel);
            $("#comAddress").text(HG_Address);
            $("#comName").text(HG_Name);
            $("#cusName").text(M_Name);
            $("#MC_Name").text(json.MC_Name);
            $("#HZipCode").text(json.HZipCode);
            $("#HCity").text(json.HCity);
            $("#HTown").text(json.HTown);
            $("#H_Address").text(json.H_Address);
         
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
