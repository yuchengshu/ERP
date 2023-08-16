<%@ Page Language="C#" AutoEventWireup="true" CodeFile="businessConnectionDetail.aspx.cs" Inherits="wealthManage_businessConnection_MPMCOTF_businessConnectionDetail" %>

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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        #newBtnDiv {
          margin-left:20px;
          margin-right:20px;
          margin-top:20px;
        }
        .tabDivMargin {
          margin-bottom:20px;
          margin-left:20px;
          margin-right:20px;
          margin-top:5px;
        }
        .tabDivMargin2 {
          margin-bottom:20px;
          margin-left:20px;
          margin-right:20px;
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
        .tabDivMargin6 {
    

        }
        .tabDivMargin7 {
            margin-left:20px;
          margin-right:20px;
        }
        .marginTop10px {
            margin-top :10px;
        }
        .marginTop25 {
            margin-top:25px;
        }
        .marginTop20 {
            margin-top:20px;
        }
        .bgBlue {
            background-color:#CCEEFF;
        }
        #detailHead {
            font-size:20px;
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
        td {
             border-right:1px solid #ddd;
             
              border-top:1px solid #ddd;
        }
        tbody{
             border:1px solid #ddd;
     
        }
        #tagHistoryHead{
        background-color:#f4f4f4;
        }
        #tagHistoryTabDiv {
        border:1px solid #ddd;
        }
        #tagHistoryTitle {
        font-size:18px;
        
        }
        .brWhite {
        border-right-color: white;
        }
        #closeTagHistory {
            margin-bottom:5px;
        }
        .width10Per {
            width:7%;
        }
        .width5Per {
            width:3%;
        }
        .width15Per {
           width:11%;
        }
        .tabChangeDiv {
            border-left: 1px solid #ddd;
            border-right: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            margin-bottom:100px;
        }
        .marginTop5px {
         margin-top:5px;
        }
        .bgColor {
            background-color :  #ddd;
        }
        .bgColorF5F5F5 {
            background-color :  #F5F5F5;
        }
        .bgColorF2FFFF {
            background-color :  #F2FFFF;
        }

        .leftSideWhite {
         border-right:1px solid white;
        }
        .divBorder {
           border:2px solid #ddd;
           margin-bottom:10px;
        }
        .titleBottomBorder {
            border-bottom:2px solid red;
        }
        .marginLeftRight10 {
            margin-left:10px;
            margin-right:10px;
        }
        .closeBtn {
        background-color:red;
        color:black;
        }
        .colorBlue {
        color:blue;
        }
        .tdBorderColorf4f4f4 {
         border:1px solid #f4f4f4;
        }
        #butab  td {
         border-bottom:1px solid #f4f4f4;
        }
        .startHide {
            display:none;
        }
        #sendEditData {
            margin-top:10px;
            height:40px;
        }
        .btnSize {
            height:30px;
            width:30px;
             padding-top:4px;
            padding-left:8px;
        }
        .btnSize2 {
            height:30px;
            width:45px;
             padding-top:4px;
            padding-left:8px;
        }
        #tradeRecordDiv {
            font-size:12px;
        }
        .width160 {
            width:210px;
        }
        .openRecordBtn {
            height:25px;
            width:120px;
            margin:0 auto;
            padding-top:1px;
        }
        .colorRed {
            color:red;
        }
        .displayNone{
            display:none;
        }
        .displayBlock{
            display:block;
        }
        div {
            border: 1px solid groove;
        }
        .textAlignCenter {
            text-align:center;
        }
        .auto-style1 {
            height: 25px;
        }
    </style>
</head>
<body  style="font-family:Microsoft JhengHei;" >
  <!-- jQuery 2.1.3 -->
    <script src="<%=getRelativePath()%>plugins/jQuery/jQuery-2.1.3.min.js"></script>
        <!-- jQuery 2.1.3 -->
    <script src="<%=getRelativePath()%>plugins/jQueryUI/jquery.blockUI.js"></script>
      <!-- Bootstrap 3.3.2 JS -->
    <script src="<%=getRelativePath()%>js/common/Common.js" type="text/javascript"></script>
    <script src="<%=getRelativePath()%>js/common/CommonTool.js" type="text/javascript"></script>
    <script src="<%=getRelativePath()%>js/MasterPage.js" type="text/javascript"></script>

    <!-- content start-->
    <div id="businessConnectionDetailTabDiv" class="tabDivMargin3 divBorder">
        <div id="" class="titleBottomBorder marginLeftRight10">
            <h3><span class="colorRed">業務聯絡單</span>
                
            </h3>
        </div>
        
        <div class="tabDivMargin4 marginTop10px">

        
        <table  class="table" id="butab">
            <tr class="">
                <td class="textAlignCenter" style="border-bottom:1px solid #f4f4f4"><B>聯絡單種類</B></td>
                <td class="textAlignLeft" id="bcdCF_Item"></td>
                 <td class="textAlignCenter" ><B>件別</B></td>
                <td class="textAlignLeft" id="bcdObj" ></td>
                 <td class="textAlignCenter" ><B>提案人</B></td>
                <td class="textAlignLeft" id="bcdAdd_userName"></td>
                 <td class="textAlignCenter" ><B>案件狀態</B></td>
                <td class="textAlignLeft"><img id="bcdLight_status" light="" style="width:25px;height:25px;" src="" />&nbsp;&nbsp;<span>派發:</span><label id="bcdAssign" class="textLabel"></label>&nbsp;&nbsp;<span>註記:</span><label id="bcdDM_MC" class="textLabel"></label></td>
                 
            </tr>
            <tr class="">
                <td class="textAlignCenter" ><B>單號</B></td>
                <td class="textAlignLeft" id="bcdf_id"></td>
                <td class="textAlignCenter"><B>客戶姓名</B></td>
                <td class="textAlignLeft"  id="bcdM_Name"></td>
                <td class="textAlignCenter"><B>分析師</B></td>
                <td class="textAlignLeft"  id="bcdMP_ID"></td>
                <td class="textAlignCenter"><B>會員種類</B></td>
                <td class="textAlignLeft"  id="bcdMP_Item"></td>
            </tr>
           
            <tr class="bgColorF2FFFF CF_Item CF_Item0001">
                <td class="textAlignCenter" ><B>入會方式</B></td>
                <td class="textAlignLeft" colspan="5">
                    <B><span id="bcdT_Type" class="colorBlue"></span></B>:&nbsp;&nbsp;&nbsp;
                    <!--T_Type2-->
                    <span class="T_Type2"><span><B>會場</B>&nbsp;：&nbsp;</span><span id="bcdV_ID"></span>-<span id="bcdV_Name"></span>&nbsp;&nbsp;&nbsp;<span><B>會場金額</B>&nbsp;：&nbsp;</span><span id="bcdPaymoney" class="textLabel"></span></span>
                    <!--T_Type3-->
                    <span class="T_Type3"><span><B>入帳人員1</B>&nbsp;：&nbsp;</span><span id="bcdSpecial1_userName" class=""></span>-<span id="bcdT_accountmoney1" class=""></span>-<span id="" class="bcdT_PType"></span>&nbsp;&nbsp;&nbsp;<span><B>入帳人員2</B>&nbsp;：&nbsp;</span><span id="bcdSpecial2_userName" class=""></span>-<span id="bcdT_accountmoney2" class=""></span>-<span id="" class="bcdT_PType"></span>&nbsp;&nbsp;&nbsp;<span class="Special3_userName"><span><B>入帳人員3</B>&nbsp;：&nbsp;</span><span id="bcdSpecial3_userName" class=""></span>-<span id="bcdT_accountmoney3" class=""></span>-<span id="" class="bcdT_PType"></span></span></span>

                </td>
                <td class="textAlignCenter"><B>業績種類</B></td>
                <td class="textAlignLeft"  id="bcdResults_Item"></td>
            </tr>
            <tr class="bgColorF2FFFF CF_Item CF_Item0001">
                <td class="textAlignCenter"><B>入帳資訊</B></td>
                <td class="textAlignLeft" colspan="3">
                    <span class="PT_ItemN2">
                        <span><B>會費</B>&nbsp;：&nbsp;</span><span id="bcdAccountPaymoney" class="colorBlue bcdAccountPaymoney"></span>&nbsp;&nbsp;&nbsp;<span><B>付款方式</B>&nbsp;：&nbsp;</span><span class="bcdT_PType"></span>
                    </span>
                    <span class="PT_ItemY2"><span><B>會費</B>&nbsp;：&nbsp;</span><span id="bcdAccountPaymoney" class="colorBlue bcdAccountPaymoney"></span><br />
                        <span><B>金額1</B>&nbsp;：&nbsp;</span><span class="bcdAccountPaymoney1"></span>&nbsp;&nbsp;&nbsp;<span><B>付款方式</B>&nbsp;：&nbsp;</span><span class="bcdT_PType1"></span><br />
                        <span><B>金額2</B>&nbsp;：&nbsp;</span><span class="bcdAccountPaymoney2"></span>&nbsp;&nbsp;&nbsp;<span><B>付款方式</B>&nbsp;：&nbsp;</span><span class="bcdT_PType2"></span><br />
                    </span>

                </td>
                <td class="textAlignCenter"><B>入會時間</B></td>
                <td class="textAlignLeft"  id="bcdbegindate_Date"></td>
                <td class="textAlignCenter"><B>到期時間</B></td>
                <td class="textAlignLeft"  id="bcdenddate_Date"></td>
            </tr>
            <tr class="bgColorF2FFFF CF_Item CF_Item0001">
                <td class="textAlignCenter" ><B>設定手機</B></td>
                <td class="textAlignLeft" id="bcdCellPhone"  colspan="7"></td>
            </tr>
            <tr class="bgColorF2FFFF  CF_Item CF_Item0001 CF_Item0002 CF_Item0003">
                
                <td class="textAlignCenter  CF_Item CF_Item0001 CF_Item0003" ><B>傳真稿</B></td>
                <td class="textAlignLeft  CF_Item CF_Item0001 CF_Item0003" id="bcdFax"></td>
                <td class="textAlignCenter  CF_Item CF_Item0001 CF_Item0002" ><B>設訊</B></td>
                <td class="textAlignLeft  CF_Item CF_Item0001 CF_Item0002" id="bcdMess"></td>
                <td class="textAlignCenter  CF_Item CF_Item0001" ><B>鎖碼影音</B></td>
                <td class="textAlignLeft  CF_Item CF_Item0001" id="bcdMedia"  colspan="3"></td>
            </tr>
            <tr class="bgColorF2FFFF CF_Item CF_Item0001">
                <td class="textAlignCenter" ><B>ATM後五碼</B></td>
                <td class="textAlignLeft" id="bcdATM"colspan="3"></td>
                <td class="textAlignCenter" ><B>信用卡末四碼</B></td>
                <td class="textAlignLeft" id="bcdCCard_4Num"colspan="3"></td>
                
            </tr>
             <tr class="bgColorF2FFFF CF_Item CF_Item0001">
                <td class="textAlignCenter" ><B>發票資料</B></td>
                <td class="textAlignLeft"colspan="7">
                    <span><B>發票開立方式</B>&nbsp;：&nbsp;</span><span id="bcdINV_Open_Item"></span><br />
                    <span><B>發票種類</B>&nbsp;：&nbsp;</span><span id="bcdINV_ITEM"></span><br />
                    <span class="INV_ITEM2"><B>公司抬頭</B>&nbsp;：&nbsp;</span><span id="bcdCOMNAME"></span><br  class="INV_ITEM2"/>
                    <span class="INV_ITEM2"><B>公司統編</B>&nbsp;：&nbsp;</span><span id="bcdINV_ITEM_UnifyNum"></span><br  class="INV_ITEM2"/>
                    <span><B>寄發狀況</B>&nbsp;：&nbsp;</span><span id="bcdT_Ivo"></span><br />
                </td>
            </tr>
            <tr class="bgColorF2FFFF CF_Item CF_Item0004">
                <td class="textAlignCenter" ><B>業績分類</B></td>
                <td class="textAlignLeft" colspan="7"><span><B>歸屬</B>&nbsp;：&nbsp;</span><span id="bcdAttach_Name"></span><br /><span><B>月份</B>&nbsp;：&nbsp;</span><span id="bcdCMonth"></span>&nbsp;&nbsp;&nbsp;<span><B>其他</B>&nbsp;：&nbsp;</span><span id="bcdother"></span> </td>
            </tr>
            <tr class="bgColorF2FFFF CF_Item CF_Item0005">
                <td class="textAlignCenter" ><B>責任助理</B></td>
                <td class="textAlignLeft" colspan="7"><span id="bcdMC_name"></span>&nbsp;&nbsp;<span id="bcdU_Agent_Name"></span></td>
            </tr>
            <tr class="bgColorF2FFFF CF_Item CF_Item0006">
                <td class="textAlignCenter" ><B>折讓</B></td>
                <td class="textAlignLeft" colspan="7">
                    <span><B>折讓案件</B>&nbsp;：&nbsp;</span><span id="bcdT_ID"></span>&nbsp;-&nbsp;<span id="bcdT_Name"></span><br />
                    <span><B>新轉案件</B>&nbsp;：&nbsp;</span><span id="" class="bcdD_MP"></span>&nbsp;-&nbsp;<span id="" class="bcdD_Item"></span><br />
                                        <span><B>新會期</B>&nbsp;：&nbsp;</span><span id="bcdDSdate"></span>&nbsp;-&nbsp;<span id="bcdDEdate"></span><br />
                                        <span><B>原會費</B>&nbsp;：&nbsp;</span><span id="bcdT_PayMoney"></span>&nbsp;&nbsp;&nbsp;<span><B>折讓金額</B>&nbsp;：&nbsp;</span><span id="bcdNew_PayMoney"></span><br />
                                        <span class=" D_tag1"><B>補件</B>&nbsp;：&nbsp;</span><br class="D_tag1"/>
                                        <span class=" D_tag1"><span id="" class="bcdD_MP"></span>&nbsp;-&nbsp;<span id="" class="bcdD_Item"></span></span><br  class="D_tag1"/>
                                        <span class=" D_tag1"><span><B>金額</B>&nbsp;：&nbsp;</span><span id="bcdD_Paymoney"></span></span><br  class="D_tag1"/>
                                        <span class=" D_tag1"><span><B>付款方式</B>&nbsp;：&nbsp;</span><span id="bcdD_Type"></span></span><br  class="D_tag1"/>
                </td>
            </tr>
            <tr class="bgColorF2FFFF CF_Item CF_Item0007">
                <td class="textAlignCenter" ><B>訂金件</B></td>
                <td class="textAlignLeft"colspan="7">
                    <span><B>會場</B>&nbsp;：&nbsp;</span><span id="bcdV_ID1"></span>&nbsp;-&nbsp;<span id="bcdV_Name1"></span><br/>
                    <span><B>金額</B>&nbsp;：&nbsp;</span><span id="bcdVD_Paymoney"></span>&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;<span><B>付款方式</B>&nbsp;：&nbsp;</span><span id="bcdVD_Type"></span>
                </td>
            </tr>
            <tr class="bgColorF2FFFF CF_Item CF_Item0008">
                <td class="textAlignCenter" ><B>退費</B></td>
                <td class="textAlignLeft" colspan="7">
                    <span><B>案件</B>&nbsp;：&nbsp;</span><span id="bcdB_ID"></span>-<span id="bcdB_Name"></span><br />
                    <span><B>金額</B>&nbsp;：&nbsp;</span><span id="bcdB_Paymoney"></span>
                </td>
            </tr>
            <tr class="bgColorF2FFFF CF_Item CF_Item0009">
                <td class="textAlignCenter" ><B>暫停/恢復</B></td>
                <td class="textAlignLeft" colspan="7">
                    <span><B>狀況</B>&nbsp;：&nbsp;</span><span id="bcdS_tag"></span><br />
                    <span><B>案件</B>&nbsp;：&nbsp;</span><span id="bcdS_ID"></span>&nbsp;-&nbsp;<span id="bcdS_Name"></span><br />
                    <span><B>日期</B>&nbsp;：&nbsp;</span><span id="bcdS_Paymoney"></span>
                </td>
            </tr>
             <tr class="bgColorF2FFFF CF_Item CF_Item0010">
                <td class="textAlignCenter" ><B>折讓/不折讓</B></td>
                <td class="textAlignLeft" id="bcdC_tag" colspan="7"></td>

            <tr class="">
                <td class="textAlignCenter" ><B>備註</B></td>
                <td class="textAlignLeft" id="bcdPS" colspan="7"></td>
            </tr>
        </table>
        </div>
        <!--
        <form id="" class="marginLeftRight10 marginTop10px">
            <div class="form-group row ">
                <div class="col-xs-2">
                    <label for="bcdCF_Item" class="colorBlue">聯絡單種類：</label>
                    <label id="bcdCF_Item" class="textLabel"></label>
                </div>
               
                <div class="col-xs-2">
                    <label for="bcdObj" class="colorBlue">件別：</label>
                    <label id="bcdObj" class="textLabel"></label>
                </div>
                 <div class="col-xs-2">
                     <label for="bcdAdd_userName" class="colorBlue">提案人：</label>
                    <label id="bcdAdd_userName" class="textLabel"></label>
                </div>
                <div class="col-xs-2">
                    <label for="bcdLight_status" class="colorBlue">燈號：</label>
                    <label id="" class="textLabel"><img id="bcdLight_status" light="" style="width:25px;height:25px;" src="" /></label>
                </div>
                <div class="col-xs-2">
                    <label for="bcdAssign" class="colorBlue">派發：</label>
                    <label id="bcdAssign" class="textLabel"></label>
                </div>
                <div class="col-xs-2">
                    <label for="bcdDM_MC" class="colorBlue">註記：</label>
                    <label id="bcdDM_MC" class="textLabel"></label>
                </div>
            </div>
            <div class="form-group row ">
                <div class="col-xs-2">
                     <label for="bcdf_id" class="colorBlue">單號：</label>
                    <label id="bcdf_id" class="textLabel"></label>
                </div>
                <div class="col-xs-2">
                    <label for="bcdM_Name" class="colorBlue">客戶姓名：</label>
                    <label id="bcdM_Name" class="textLabel"></label>
                </div>
                <div class="col-xs-2">
                    <label for="bcdMP_ID" class="colorBlue">分析師：</label>
                    <label id="bcdMP_ID" class="textLabel"></label>
                </div>
                <div class="col-xs-2">
                    <label for="bcdMP_Item" class="colorBlue">會員種類：</label>
                    <label id="bcdMP_Item" class="textLabel"></label>
                </div>
                <div class="col-xs-4">
                    <label class="colorBlue">備註：</label>
                    <label id="bcdPS"></label>
                </div>
                
            </div>
            <div class="form-group row CF_Item CF_Item0001">
                <div class="col-xs-2 CF_Item CF_Item0001">
                    <label for="bcdT_Type" class="colorBlue">入會方式：</label>
                    <label id="bcdT_Type" class="textLabel"></label>
                </div>
                <div class="col-xs-2 T_Type2  CF_Item CF_Item0001"  style="">
                   <label for="bcdV_ID" class="colorBlue">會場：</label>
                    <label id="bcdV_ID" class="textLabel"></label>-<label id="bcdV_Name" class="textLabel"></label>
                </div>
                <div class="col-xs-2 T_Type2  CF_Item CF_Item0001"  style="">
                   <label for="bcdPaymoney" class="colorBlue">會場金額：</label>
                    <label id="bcdPaymoney" class="textLabel"></label>
                </div>
                <div class="col-xs-2 T_Type3  CF_Item CF_Item0001">
                   <label for="bcdSpecial1_userName" class="colorBlue">入帳人員1：</label>
                    <label id="bcdSpecial1_userName" class="textLabel"></label>-<label id="bcdT_accountmoney1" class="textLabel"></label>-<label id="" class="textLabel bcdT_PType"></label>
                </div>
                <div class="col-xs-2 T_Type3  CF_Item CF_Item0001">
                   <label for="bcdSpecial2_userName" class="colorBlue">入帳人員2：</label>
                    <label id="bcdSpecial2_userName" class="textLabel"></label>-<label id="bcdT_accountmoney2" class="textLabel"></label>-<label id="" class="textLabel bcdT_PType"></label>
                </div>
                <div class="col-xs-2 Special3_userName T_Type3  CF_Item CF_Item0001">
                   <label for="bcdSpecial3_userName" class="colorBlue">入帳人員3：</label>
                    <label id="bcdSpecial3_userName" class="textLabel"></label>-<label id="bcdT_accountmoney3" class="textLabel"></label>-<label id="" class="textLabel bcdT_PType"></label>
                </div>
            </div>

            <div class="form-group row CF_Item CF_Item0001">
                <div class="col-xs-2  CF_Item CF_Item0001">
                   <label for="bcdResults_Item" class="colorBlue">業績種類：</label>
                    <label id="bcdResults_Item" class="textLabel"></label>
                </div>
                <div class="col-xs-2  CF_Item CF_Item0001">
                    <label class="colorBlue">入賬-會費：</label>
                    <label id="bcdAccountPaymoney"></label>
                </div>
                <div class="col-xs-2  CF_Item CF_Item0001">
                    <label class="colorBlue">入賬-付款方式：</label>
                    <label id=""class="bcdT_PType"></label>
                </div>
                <div class="col-xs-2  CF_Item CF_Item0001">
                    <label class="colorBlue">入會時間：</label>
                    <label id="bcdbegindate_Date"></label>
                </div>
                <div class="col-xs-2  CF_Item CF_Item0001">
                    <label class="colorBlue">到期時間：</label>
                    <label id="bcdenddate_Date"></label>
                </div>
                <div class="col-xs-2  CF_Item CF_Item0001">
                    <label class="colorBlue">設定手機：</label>
                    <label id="bcdCellPhone"></label>
                </div>
               
            </div>
            <div class="form-group row CF_Item CF_Item0001 CF_Item0002 CF_Item0003">
                <div class="col-xs-2  CF_Item CF_Item0001 CF_Item0003">
                    <label class="colorBlue">傳真稿：</label>
                    <label id="bcdFax"></label>
                </div>
                <div class="col-xs-2  CF_Item CF_Item0001 CF_Item0002">
                    <label class="colorBlue">設訊：</label>
                    <label id="bcdMess"></label>
                </div>
                <div class="col-xs-2  CF_Item CF_Item0001">
                    <label class="colorBlue">鎖碼影音：</label>
                    <label id="bcdMedia"></label>
                </div>
                <div class="col-xs-2  CF_Item CF_Item0001">
                    <label class="colorBlue">ATM後五碼：</label>
                    <label id="bcdATM"></label>
                </div>
                <div class="col-xs-2  CF_Item CF_Item0001">
                    <label class="colorBlue">信用卡末四碼：</label>
                    <label id="bcdCCard_4Num"></label>
                </div>

            </div>
            <div class="form-group row CF_Item CF_Item0001">
                <div class="col-xs-2  CF_Item CF_Item0001">
                    <label class="colorBlue">發票開立方式：</label>
                    <label id="bcdINV_Open_Item"></label>
                </div>
                <div class="col-xs-2  CF_Item CF_Item0001">
                    <label class="colorBlue">發票種類：</label>
                    <label id="bcdINV_ITEM"></label>
                </div> 
                <div class="col-xs-2  CF_Item CF_Item0001 INV_ITEM2">
                    <label class="colorBlue">公司抬頭：</label>
                    <label id="bcdCOMNAME"></label>
                </div>
                <div class="col-xs-2  CF_Item CF_Item0001 INV_ITEM2">
                    <label class="colorBlue">公司統編：</label>
                    <label id="bcdINV_ITEM_UnifyNum"></label>
                </div>
                <div class="col-xs-2  CF_Item CF_Item0001">
                    <label class="colorBlue">寄發狀況：</label>
                    <label id="bcdT_Ivo"></label>
                </div>  
            </div>
            <div class="form-group row CF_Item CF_Item0004">
                <div class="col-xs-2  CF_Item CF_Item0004">
                    <label class="colorBlue">業績分類：</label>
                    <label id=""></label>
                </div> 
                <div class="col-xs-2  CF_Item CF_Item0004">
                    <label class="colorBlue">歸屬：</label>
                    <label id="bcdAttach_Name"></label>
                </div>
                <div class="col-xs-2  CF_Item CF_Item0004">
                    <label class="colorBlue">月份：</label>
                    <label id="bcdCMonth"></label>
                </div>
                <div class="col-xs-2  CF_Item CF_Item0004">
                    <label class="colorBlue">其他：</label>
                    <label id="bcdother"></label>
                </div> 
            </div>
            <div class="form-group row CF_Item CF_Item0005">
                <div class="col-xs-2  CF_Item CF_Item0005">
                    <label class="colorBlue">責任助理：</label>
                    <label id="bcdMC_name"></label>&nbsp;&nbsp;<label id="bcdU_Agent_Name"></label>
                </div> 
            </div>
            <div class="form-group row CF_Item CF_Item0006">
                <div class="col-xs-4  CF_Item CF_Item0006">
                    <label class="colorBlue">折讓案件：</label>
                    <label id="bcdT_ID"></label>&nbsp;-&nbsp;<label id="bcdT_Name"></label>
                </div>
                <div class="col-xs-4  CF_Item CF_Item0006">
                    <label class="colorBlue">新轉案件：</label>
                    <label id="" class="bcdD_MP"></label>&nbsp;-&nbsp;<label id="" class="bcdD_Item"></label>
                </div> 
                <div class="col-xs-4  CF_Item CF_Item0006">
                    <label class="colorBlue">新會期：</label>
                    <label id="bcdDSdate"></label>&nbsp;-&nbsp;<label id="bcdDEdate"></label>
                </div> 
                
            </div>
            <div class="form-group row CF_Item CF_Item0006">
                <div class="col-xs-2  CF_Item CF_Item0006">
                    <label class="colorBlue">原會費：</label>
                    <label id="bcdT_PayMoney"></label>
                </div> 
                <div class="col-xs-2  CF_Item CF_Item0006">
                    <label class="colorBlue">折讓金額：</label>
                    <label id="bcdNew_PayMoney"></label>
                </div>
                <div class="col-xs-4  CF_Item CF_Item0006 D_tag1">
                    <label class="colorBlue">補件：</label>
                    <label id="" class="bcdD_MP"></label>&nbsp;-&nbsp;<label id="" class="bcdD_Item"></label>
                </div>
                <div class="col-xs-2  CF_Item CF_Item0006 D_tag1">
                    <label class="colorBlue">金額：</label>
                    <label id="bcdD_Paymoney"></label>
                </div>
                <div class="col-xs-2  CF_Item CF_Item0006 D_tag1">
                    <label class="colorBlue">付款方式：</label>
                    <label id="bcdD_Type"></label>
                </div>  
            </div>
            <div class="form-group row CF_Item CF_Item0007">
                <div class="col-xs-2  CF_Item CF_Item0007">
                    <label class="colorBlue">訂金件：</label>
                </div>
                <div class="col-xs-2  CF_Item CF_Item0007">
                    <label class="colorBlue">會場：</label>
                    <label id="bcdV_ID1"></label>&nbsp;-&nbsp;<label id="bcdV_Name1"></label>
                </div> 
                <div class="col-xs-2  CF_Item CF_Item0007">
                    <label class="colorBlue">金額：</label>
                    <label id="bcdVD_Paymoney"></label>&nbsp;元
                </div>
                <div class="col-xs-2  CF_Item CF_Item0007">
                    <label class="colorBlue">付款方式：</label>
                    <label id="bcdVD_Type"></label>
                </div>
            </div>
            <div class="form-group row CF_Item CF_Item0008">
                <div class="col-xs-4  CF_Item CF_Item0008">
                    <label class="colorBlue">退費案件：</label>
                    <label id="bcdB_ID"></label>-<label id="bcdB_Name"></label>
                </div>
                <div class="col-xs-4  CF_Item CF_Item0008">
                    <label class="colorBlue">退費金額：</label>
                    <label id="bcdB_Paymoney"></label>
                </div>
            </div>
            <div class="form-group row CF_Item CF_Item0009">
                <div class="col-xs-2  CF_Item CF_Item0009">
                    <label class="colorBlue">恢復/暫停&nbsp;-&nbsp;狀況：</label>
                    <label id="bcdS_tag"></label>
                </div>
                <div class="col-xs-4  CF_Item CF_Item0009">
                    <label class="colorBlue">案件：</label>
                    <label id="bcdS_ID"></label>&nbsp;-&nbsp;<label id="bcdS_Name"></label>
                </div>
               <div class="col-xs-4  CF_Item CF_Item0009">
                    <label class="colorBlue">日期：</label>
                    <label id="bcdS_Paymoney"></label>
                </div>
            </div>
            <div class="form-group row CF_Item CF_Item0010">
                <div class="col-xs-4  CF_Item CF_Item0010">
                    <label class="colorBlue">折讓/不折讓：</label>
                    <label id="bcdC_tag"></label>
                </div>
            </div>
        </form>-->
    </div>
    <div class="tabDivMargin7">
        <div id="caseEditRecordDiv" class="tabDivMargin6 tabChangeDiv divBorder col-xs-6 ">
        <div id="" class="titleBottomBorder marginLeftRight10">
            <h3><span class="colorRed">案件修改紀錄</span></h3>
        </div>
        <div id="caseEditRecordInerDiv" class="tabDivMargin4 marginTop10px">
        <table class="table">
            <thead >
                <tr class="marginTop5px bgColor">
                    <th class="auto-style1">
                        修改人
                    </th>
                     <th class="auto-style1">
                        欄位
                    </th>
                    <th class="auto-style1">
                        內容
                    </th>
                     <th class="auto-style1">
                        時間
                    </th>

                </tr>
            </thead>
            <tbody id="caseEditRecordTb">

            </tbody>
        </table>
        </div>
    </div>

        <div id="signingRecordDiv" class="tabDivMargin6 tabChangeDiv divBorder  col-xs-6 ">
        <div id="" class="titleBottomBorder marginLeftRight10">
            <h3><span class="colorRed">簽核明細</span></h3>
        </div>
        <div id="signingRecordInerDiv" class="tabDivMargin4 marginTop10px">
        <table class="table">
            <thead >
                <tr class="marginTop5px bgColor">
                    <th class="textAlignCenter width10Per leftSideWhite">
                        
                    </th>
                     <th class="textAlignCenter width10Per leftSideWhite">
                        簽核人員
                    </th>
                    <th class="textAlignCenter width10Per leftSideWhite">
                        簽核狀態
                    </th>
                    <th class="textAlignCenter width10Per leftSideWhite">
                        狀態時間
                    </th>
                     <th class="textAlignCenter width10Per leftSideWhite">
                        備註
                    </th>
                </tr>
            </thead>
            <tbody id="signingRecordTb">
                <tr class="marginTop5px ">
                    <td class="textAlignCenter width10Per leftSideWhite bgColor">
                        簽核單位主管
                    </td>
                     <td class="textAlignCenter width10Per " id="srU_LeaderName">
                    </td>
                    <td class="textAlignCenter width10Per " id="srU_LeaderStatus">
                        <button type="button" class="btn btn btn-primary btn-flat srU_LeaderStatus signStatus" timeType="U_LeaderStatusTime" signerStatusType="U_LeaderStatus" status="1" psType="L_Ps" signerType="U_Leader" signerNameType="U_LeaderName" id="">簽核</button>&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn btn-danger btn-flat srU_LeaderStatus signStatus" timeType="U_LeaderStatusTime"   signerStatusType="U_LeaderStatus" status="2" psType="L_Ps"   signerType="U_Leader" signerNameType="U_LeaderName"  id="">退回</button>
                    </td>
                    <td class="textAlignCenter width10Per " id="srU_LeaderStatusTime">
                    </td>
                     <td class="textAlignCenter width10Per " id="srL_PsTd">
                         <input type="text" class="form-control startHide"  id="srL_Ps"  disabled="disabled"/>
                    </td>
                </tr>
                <tr class="marginTop5px ">
                    <td class="textAlignCenter width10Per leftSideWhite bgColor">
                        行政人員
                    </td>
                     <td class="textAlignCenter width10Per " id="srEX_Name">
                    </td>
                    <td class="textAlignCenter width10Per " id="srEX_Status">
                         <button type="button" class="btn btn btn-primary btn-flat srEX_Status signStatus" timeType="EX_StatusTime"  signerStatusType="EX_Status" status="1" psType="EX_Ps" signerType="EX" signerNameType="EX_Name"  id="">簽核</button>&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn btn-danger btn-flat srEX_Status signStatus" timeType="EX_StatusTime"    signerStatusType="EX_Status" status="2" psType="EX_Ps"  signerType="EX" signerNameType="EX_Name"    id="">退回</button>
                    </td>
                    <td class="textAlignCenter width10Per " id="srEX_StatusTime">
                    </td>
                     <td class="textAlignCenter width10Per " id="srEX_PsTd">
                         <input type="text"  id="srEX_Ps" class="form-control startHide"  disabled="disabled"/>
                    </td>
                </tr>
                <tr class="marginTop5px">
                    <td class="textAlignCenter width10Per leftSideWhite bgColor">
                        行政主管
                    </td>
                     <td class="textAlignCenter width10Per " id="srEX_LeaderName">
                    </td>
                    <td class="textAlignCenter width10Per " id="srEX_LeaderStatus">
                        <input type="hidden" id="auto_id" />
                         <button type="button" class="btn btn btn-primary btn-flat srEX_LeaderStatus signStatus" timeType="EX_LeaderStatusTime"   signerStatusType="EX_LeaderStatus" status="1"  psType="EXL_Ps"  signerType="EXLeader" signerNameType="EX_LeaderName"   id="">簽核</button>&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn btn-danger btn-flat srEX_LeaderStatus signStatus" timeType="EX_LeaderStatusTime"  signerStatusType="EX_LeaderStatus" status="2" psType="EXL_Ps"  signerType="EXLeader" signerNameType="EX_LeaderName"   id="">退回</button>
                    </td>
                    <td class="textAlignCenter width10Per " id="srEX_LeaderStatusTime">
                    </td>
                     <td class="textAlignCenter width10Per " id="srEXL_PsTd">
                          <input type="text"  id="srEXL_Ps" class="form-control startHide" disabled="disabled"/>
                    </td>
                </tr>
            </tbody>
        </table>
        </div>
    </div>
    </div>
   <!--
    <ul id="myTab" class="nav nav-tabs tabDivMargin3">
        <li class="active">
            <a id="caseEditRecord" href="#caseEditRecordDiv" data-toggle="tab" class="tabChange" openDivName="#caseEditRecordDiv">案件修改紀錄</a>
        </li>
        <li class="">
            <a href="#signingRecord" href="#signingRecordDiv" data-toggle="tab" class="tabChange" openDivName="#signingRecordDiv">簽核明細</a>
        </li>
    </ul>
    <div id="caseEditRecordDiv" class="tabDivMargin5 tabChangeDiv">
        <div id="caseEditRecordInerDiv" class="tabDivMargin4">
        <table class="table">
            <thead >
                <tr class="marginTop5px bgColor">
                    <th class="textAlignCenter width10Per leftSideWhite">
                        修改人
                    </th>
                     <th class="textAlignCenter width10Per leftSideWhite">
                        欄位
                    </th>
                    <th class="textAlignCenter width10Per leftSideWhite">
                        內容
                    </th>
                     <th class="textAlignCenter width10Per leftSideWhite">
                        時間
                    </th>

                </tr>
            </thead>
            <tbody id="caseEditRecordTb">

            </tbody>
        </table>
        </div>
    </div>
    <div id="signingRecordDiv" class="tabDivMargin5 tabChangeDiv startHide">
        <div id="signingRecordInerDiv" class="tabDivMargin4">
        <table class="table">
            <thead >
                <tr class="marginTop5px bgColor">
                    <th class="textAlignCenter width10Per leftSideWhite">
                        
                    </th>
                     <th class="textAlignCenter width10Per leftSideWhite">
                        簽核人員
                    </th>
                    <th class="textAlignCenter width10Per leftSideWhite">
                        簽核狀態
                    </th>
                    <th class="textAlignCenter width10Per leftSideWhite">
                        狀態時間
                    </th>
                     <th class="textAlignCenter width10Per leftSideWhite">
                        備註
                    </th>
                </tr>
            </thead>
            <tbody id="signingRecordTb">
                <tr class="marginTop5px ">
                    <td class="textAlignCenter width10Per leftSideWhite bgColor">
                        簽核單位主管
                    </td>
                     <td class="textAlignCenter width10Per " id="srU_LeaderName">
                    </td>
                    <td class="textAlignCenter width10Per " id="srU_LeaderStatus">
                        <button type="button" class="btn btn btn-primary btn-flat srU_LeaderStatus signStatus" timeType="U_LeaderStatusTime" signerStatusType="U_LeaderStatus" status="1" psType="L_Ps" signerType="U_Leader" signerNameType="U_LeaderName" id="">簽核</button>&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn btn-danger btn-flat srU_LeaderStatus signStatus" timeType="U_LeaderStatusTime"   signerStatusType="U_LeaderStatus" status="2" psType="L_Ps"   signerType="U_Leader" signerNameType="U_LeaderName"  id="">退回</button>
                    </td>
                    <td class="textAlignCenter width10Per " id="srU_LeaderStatusTime">
                    </td>
                     <td class="textAlignCenter width10Per " id="srL_PsTd">
                         <input type="text" class="form-control startHide"  id="srL_Ps"  disabled="disabled"/>
                    </td>
                </tr>
                <tr class="marginTop5px ">
                    <td class="textAlignCenter width10Per leftSideWhite bgColor">
                        行政人員
                    </td>
                     <td class="textAlignCenter width10Per " id="srEX_Name">
                    </td>
                    <td class="textAlignCenter width10Per " id="srEX_Status">
                         <button type="button" class="btn btn btn-primary btn-flat srEX_Status signStatus" timeType="EX_StatusTime"  signerStatusType="EX_Status" status="1" psType="EX_Ps" signerType="EX" signerNameType="EX_Name"  id="">簽核</button>&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn btn-danger btn-flat srEX_Status signStatus" timeType="EX_StatusTime"    signerStatusType="EX_Status" status="2" psType="EX_Ps"  signerType="EX" signerNameType="EX_Name"    id="">退回</button>
                    </td>
                    <td class="textAlignCenter width10Per " id="srEX_StatusTime">
                    </td>
                     <td class="textAlignCenter width10Per " id="srEX_PsTd">
                         <input type="text"  id="srEX_Ps" class="form-control startHide"  disabled="disabled"/>
                    </td>
                </tr>
                <tr class="marginTop5px">
                    <td class="textAlignCenter width10Per leftSideWhite bgColor">
                        行政主管
                    </td>
                     <td class="textAlignCenter width10Per " id="srEX_LeaderName">
                    </td>
                    <td class="textAlignCenter width10Per " id="srEX_LeaderStatus">
                         <button type="button" class="btn btn btn-primary btn-flat srEX_LeaderStatus signStatus" timeType="EX_LeaderStatusTime"   signerStatusType="EX_LeaderStatus" status="1"  psType="EXL_Ps"  signerType="EXLeader" signerNameType="EX_LeaderName"   id="">簽核</button>&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn btn-danger btn-flat srEX_LeaderStatus signStatus" timeType="EX_LeaderStatusTime"  signerStatusType="EX_LeaderStatus" status="2" psType="EXL_Ps"  signerType="EXLeader" signerNameType="EX_LeaderName"   id="">退回</button>
                    </td>
                    <td class="textAlignCenter width10Per " id="srEX_LeaderStatusTime">
                    </td>
                     <td class="textAlignCenter width10Per " id="srEXL_PsTd">
                          <input type="text"  id="srEXL_Ps" class="form-control startHide" disabled="disabled"/>
                    </td>
                </tr>
            </tbody>
        </table>
        </div>
    </div>
    
   <!-- content end-->
    <!-- jQuery UI 1.11.2 -->
    <script src="http://code.jquery.com/ui/1.11.2/jquery-ui.min.js" type="text/javascript"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
     <script src="<%=getRelativePath()%>js/MasterPage.js" type="text/javascript"></script>
    <script>
        
        //script開始CommonHandlerUrl
 
        //本頁資訊======================================================================
        //客戶會員編號
        //var f_id_G = "<%=getf_id()%>";
        //使用者員工編號
        var U_Num_M = "<%=getU_Num()%>";
        var U_Name_M = "<%=getU_Name()%>";
        var U_MDEP_M = "<%=getU_MDEP()%>";
        var M_ID = "<%=getM_ID()%>";
        var IP_M = "<%=getIP()%>";

        var add_User_G = undefined;
        var add_User = undefined;
        var CommonHandlerUrl_M = "<%=getRelativePath()%>" + "commonHandler.ashx";
        var BusinessConnectionHandlerUrl_G = "businessConnectionHandler.ashx";
        var per_read_M = false;
        var per_add_M = false;
        var per_edit_M = false;
        var per_del_M = false;
        var per_query_M = false;

        //頁籤切換功能
        var tabChange = function () {
            var divId = $(this).attr("openDivName");
            var tabChanges = $(".tabChange");
            var thisCloseId = undefined;
            $.each(tabChanges, function (i, v) {
                thisCloseId = $(v).attr("openDivName");
                hide_M(thisCloseId)
            });
            show_M(divId);
        };
        //案件修改明細資料getBusinessConnectionDataEditRecord 
        //var getBusinessConnectionDataEditRecord = function (M_ID) {
        //    var data = "M_ID=" + M_ID + "&action=getBusinessConnectionDataEditRecord";
        //    var success = function (back) {
        //        var json = jsonParse_M(back);
        //        var sb = new $CommonTool.String.StringBuilder();
        //        $.each(json, function (i, v) {
        //            sb.append("<tr>");
        //            sb.append("<td class='textAlignCenter'>");
        //            sb.append(v.edit_userName);
        //            sb.append("</td>");
        //            sb.append("<td class='textAlignCenter'>");
        //            sb.append(v.M_Row);
        //            sb.append("</td>");
        //            sb.append("<td>");
        //            sb.append(v.M_text);
        //            sb.append("</td>");
        //            sb.append("<td class='textAlignCenter'>");
        //            sb.append(v.edit_date);
        //            sb.append("</td>");
        //            sb.append("</tr>");
        //        });
        //        append_M("#caseEditRecordTb", sb.toString());//案件修改明細資料
        //        unBlockUI_M();
        //    };
        //    ajax_M(BusinessConnectionHandlerUrl_G, data, success);
        //};
        
        //取得業務聯絡單明細
        var getBusinessConnectionDetail = function () {
            alert('取得業務聯絡單明細1!!!');
            var data = "f_id=" + f_id_G + "&M_ID=" + M_ID + "&action=getBusinessConnectionDetail";//20230202修改!!!
            alert(data);
            var success = function (back) {
                /*進行畫面資料綁定*/
                //20230203work
                console.log("back===" + back);
                var json = jsonParse_M(back);
                text_M("#bcdCF_Item", json.CF_ItemName);
                text_M("#bcdObj", json.ObjName);
                text_M("#bcdAdd_userName", json.add_userName);
                add_User_G = json.add_user;
                add_User = json.add_User;
                attr_M("#bcdLight_status", "src", "../../../img/" + json.Light_status + ".png");
                var str = "無";
                if (!isEmptyStr(json.Assign_name)) {
                    str = json.Assign_name + "-" + json.Assign_date;
                }
                text_M("#bcdAssign", str);
                if (!isEmptyStr(json.DM_MC_Name)) {
                    str = json.DM_MC_Name + "-" + json.DM_MarkTime;
                }
                text_M("#bcdDM_MC", str);
                text_M("#bcdf_id", json.f_id);
                //html_M("#bcdM_Name", "<a href='/wealthManage/customerManage/MMBER/customerDetail.aspx?M_ID=" + json.M_ID + "&MENU_no=" + MENU_no_G+ "'>" + json.M_Name + "</a>");
                text_M("#bcdMP_ID", json.MP_IDName);//分析師
                text_M("#bcdMP_Item", json.MP_Item);
                text_M("#bcdPS", json.PS);
                text_M("#srU_LeaderName", json.U_LeaderName);
                text_M("#srEX_Name", json.EX_Name);
                text_M("#srEX_LeaderName", jsom.EX_LeaderName);

                addClass_M(".CF_Item", "displayNone");
                removeClass_M(".CF_Item" + json.CF_Item, "displayNone");
                addClass_M(".D_tag1", "displayNone");
                switch (json.CF_Item) {
                    case "0001":
                        switch (json.T_Type) {
                            case "0001":
                                addClass_M(".T_Type2", "displayNone");
                                addClass_M(".T_Type3", "displayNone");
                                break;
                            case "0002":
                                addClass_M(".T_Type3", "displayNone");
                                break;
                            case "0003":
                                addClass_M(".T_Type2", "displayNone");
                                break;
                        }
                        text_M("#bcdT_Type", json.T_TypeName);
                        text_M("#bcdV_ID", json.V_ID);
                        text_M("#bcdV_Name", json.V_Name);
                        text_M("#bcdAccountPaymoney", json.Paymoney);
                        text_M("#bcdAccountPaymoney1", json.Paymoney1);
                        text_M("#bcdAccountPaymoney2", json.Paymoney2);
                        text_M("#bcdSpecial1_userName", json.Special1_userName);
                        text_M("#bcdT_accountmoney1", json.T_accountmoney1);
                        text_M("#bcdSpecial2_userName", json.Special2_userName);
                        text_M("#bcdT_accountmoney2", json.T_accountmoney2);
                        if (json.PT_Item != "2") {
                            hide_M(".PT_ItemY2");
                        } else {
                            hide_M(".PT_ItemN2");
                        }
                        if (isEmptyStr(json.Special3_userName)) {
                            hide_M(".Special3_userName");
                        } else {
                            text_M("#bcdSpecial3_userName", json.Special3_userName);
                            text_M("#bcdT_accountmoney3", json.T_accountmoney3);
                        }
                        text_M("#bcdResults_Item", json.Results_ItemName);
                        text_M("#bcdMP_Item", json.MP_ItemName);
                        text_M(".bcdT_PType", json.T_PTypeName);
                        text_M("#bcdT_PType1", json.T_PType1Name);
                        text_M("#bcdT_PType2", json.T_PType2Name);
                        text_M("#bcdbegindate_Date", split_M(json.begindate_Date,' ',0));
                        text_M("#bcdenddate_Date", split_M(json.enddate_Date,' ',0));
                        text_M("#bcdCellPhone", json.CellPhone);
                        text_M("#bcdMedia", json.MediaName);
                        text_M("#bcdATM", json.ATM);
                        text_M("#bcdCCard_4Num", json.CCard_4Num);
                        text_M("#bcdINV_Open_Item", json.INV_Open_ItemName);
                        if (json.INV_ITEM != "2") {
                            addClass_M(".INV_ITEM2", "displayNone");
                        }
                        text_M("#bcdINV_ITEM", json.INV_ITEMName);
                        text_M("#bcdCOMNAME", json.COMNAME);
                        text_M("#bcdINV_ITEM_UnifyNum", json.INV_ITEM_UnifyNum);
                        text_M("#bcdT_Ivo", json.T_IvoName);
                        text_M("#bcdMess", json.MessName);
                        text_M("#bcdFax", json.FaxName);
                        break;
                    case "0002":
                        text_M("#bcdMess", json.MessName);
                        break;
                    case "0003":
                        text_M("#bcdFax", json.FaxName);
                        break;
                    case "0004":
                        text_M("#bcdAttach_Name", json.Attach_Name);
                        text_M("#bcdCMonth", json.CMonthName);
                        text_M("#bcdother", json.other);
                        break;
                    case "0005":
                        text_M("#bcdMC_name", json.MC_Name);
                        text_M("#bcdU_Agent_Name", json.U_Agent_Name);
                        break;
                    case "0006":
                        text_M("#bcdT_ID", json.T_ID);
                        text_M("#bcdT_Name", json.T_Name);
                        text_M(".bcdD_MP", json.D_MPname);
                        text_M(".bcdD_Item", json.D_ItemName);
                        text_M("#bcdDSdate", split_M(json.DSdate,' ',0));
                        text_M("#bcdDEdate", split_M(json.DEdate,' ',0));
                        text_M("#bcdT_PayMoney", json.T_PayMoney);
                        text_M("#bcdNew_PayMoney",split_M(json.New_PayMoney,'.',0));
                        text_M("#bcdD_Paymoney", json.D_Paymoney);
                        text_M("#bcdD_Type", json.D_TypeName);
                        Log_M("D_tag=" + json.D_tag);
                        if (json.D_tag == "1") {
                            removeClass_M(".D_tag1", "displayNone");
                        }
                        
                        //TODO折讓金額計算
                        break;
                    case "0007":
                        text_M("#bcdV_ID1", json.V_ID1);
                        text_M("#bcdV_Name1", json.V_Name1);
                        text_M("#bcdVD_Paymoney", json.VD_Paymoney);
                        text_M("#bcdVD_Type", json.VD_TypeName);
                        break;
                    case "0008":
                        text_M("#bcdB_ID", json.B_ID);
                        text_M("#bcdB_Name", json.B_Name);
                        text_M("#bcdB_Paymoney", json.B_Paymoney);
                        break;
                    case "0009":
                        text_M("#bcdS_tag", json.S_tagName);
                        text_M("#bcdS_ID", json.S_ID);
                        text_M("#bcdS_Name", json.S_Name);
                        text_M("#bcdS_Paymoney", json.S_Paymoney);
                        break;
                    case "0010":
                        text_M("#bcdC_tag", json.C_tagName);
                        break;
                }

                //for signingRecordDiv
                text_M("#srU_LeaderName", json.U_LeaderName);
                text_M("#srU_LeaderStatusTime", json.U_LeaderStatusTime);
                if (json.F_Status == "1" && json.U_LeaderStatus == "0") {
                    if (json.U_Leader == U_Num_M || (json.U_Leader == "A9501041" && U_Num_M == "A0309013") || (json.U_Leader == "A9501041" && U_Num_M == "A0111282") || (json.U_Leader == "A9501042" && U_Num_M == "A0506011")) {
                        attr_M("#srL_Ps", "disabled", false);
                        show_M("#srL_Ps");
                    } else {
                        text_M("#srU_LeaderStatus", json.U_LeaderStatusName);
                        text_M("#srL_PsTd", json.L_Ps);
                    }
                } else {
                    text_M("#srU_LeaderStatus", json.U_LeaderStatusName);
                    text_M("#srL_PsTd", json.L_Ps);
                }

                text_M("#srEX_Name", json.EX_Name);
                text_M("#srEX_StatusTime", json.EX_StatusTime);
                if (json.F_Status == "1" && json.U_LeaderStatus == "1" && json.EX_Status != "1" && (U_MDEP_M == "0003" || U_MDEP_M == "0004")) {
                    attr_M("#srEX_Ps", "disabled", false);
                    show_M("#srEX_Ps");
                } else {
                    hide_M(".srEX_Status");
                    text_M("#srEX_Status", json.EX_StatusName);
                    text_M("#srEX_PsTd", json.EX_Ps);
                }


                text_M("#srEX_Name", json.EX_Name);
                text_M("#srEX_StatusTime", json.EX_StatusTime);
                if (json.F_Status == "1" && json.U_LeaderStatus == "1" &&  json.EX_Status=="1" && json.EX_LeaderStatus!="1" && (U_MDEP_M == "0003" || U_MDEP_M == "0004")) {
                    attr_M("#srEXL_Ps", "disabled", false);
                    show_M("#srEXL_Ps");
                } else {
                    hide_M(".srEX_LeaderStatus");
                    text_M("#srEX_LeaderStatus", json.EX_LeaderStatusName);
                    text_M("#srEXL_PsTd", json.EXL_Ps);
                }
              //getBusinessConnectionDataEditRecord
                //取得客戶修改紀錄
                alert('取得案件修改明細資料');
                getBusinessConnectionDataEditRecord(M_ID);//取得案件修改明細資料businessConnectionDetail
            };
            ajax_M(BusinessConnectionHandlerUrl_G, data, success);

        };
        //核准
        var signStatus = function () {
            Log_M("signStatus start");
            var timeType = attr_M(this, "timeType");
            var signerType = attr_M(this, "signerType");
            var signerNameType = attr_M(this, "signerNameType");
            var signerStatusType = attr_M(this, "signerStatusType");//簽核角色
            var psType = attr_M(this, "psType");
            var ps = val_M("#sr" + psType);
            var status = attr_M(this, "status");
            var f_id = text_M("#bcdf_id");
            var type = text_M("#bcdCase");//聯絡單種類
            var add_ip = IP_M;
            var M_Name = text_M("#bcdM_Name");
            var bcdT_Type = text_M("#bcdT_Type");
            alert("聯絡單種類:" + type);
            //20230626傳入函式的參數
            var data = "f_id=" + f_id
                + "&signerStatusType=" + signerStatusType
                + "&status=" + status
                + "&psType=" + psType
                + "&ps=" + ps +
                "&signerType=" + signerType
                + "&signerNameType=" + signerNameType
                + "&U_Num=" + U_Num_M
                + "&U_Name=" + U_Name_M
                + "&timeType=" + timeType
                + "&add_ip=" + add_ip
                + "&M_Name=" + M_Name
                + "&add_User=" + add_User
                + "&MENU_no=" + MENU_no_G
                + "&T_Type=" + bcdT_Type
                + "&action=signStatus";
            var success = function (back) {
                Log_M("signStatus back=" + back);
                if (back == "成功") {
                    alert("簽核成功");
                    location.reload();
                }
                unBlockUI_M();
            };
            var error = function (e) { Log_M("signStatus error=" + e); unBlockUI_M(); };
            ajax_M(BusinessConnectionHandlerUrl_G, data, success,error);
        };

        var startThisPage = function () {
            getBusinessConnectionDetail();//取得業務聯絡單明細
            getBusinessConnectionDataEditRecord();//案件修改紀錄資料
            //頁面下方的頁面切換
            onClick_M(".tabChange", tabChange);
            onClick_M(".signStatus", signStatus);
            //設定權限
            setPermission_M();
        };


    //PAGE開始
    $(function () {
        blockUI_M();
        //checkUnum_M();
        startThisPage();
       //查看權限
        //getUserAuthority_M(startThisPage);
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

