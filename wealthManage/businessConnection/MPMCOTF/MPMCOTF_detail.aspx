<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MPMCOTF_detail.aspx.cs" Inherits="wealthManage_businessConnection_MPMCOTF_businessConnectionDetail" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8" />
    <title>華冠投顧ERP</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
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
            margin-left: 20px;
            margin-right: 20px;
            margin-top: 5px;
        }

        .tabDivMargin {
            margin-bottom: 20px;
            margin-left: 20px;
            margin-right: 20px;
            margin-top: 5px;
        }

        .tabDivMargin2 {
            margin-bottom: 20px;
            margin-left: 20px;
            margin-right: 20px;
        }

        .tabDivMargin3 {
            margin-left: 20px;
            margin-right: 20px;
            margin-top: 5px;
        }

        .tabDivMargin4 {
            margin-left: 20px;
            margin-right: 20px;
        }

        .tabDivMargin5 {
            margin-left: 20px;
            margin-right: 20px;
            padding-top: 15px;
        }

        .tabDivMargin6 {
        }

        .tabDivMargin7 {
            margin-left: 20px;
            margin-right: 20px;
        }

        .marginTop10px {
            margin-top: 10px;
        }

        .marginTop25 {
            margin-top: 25px;
        }

        .marginTop20 {
            margin-top: 20px;
        }

        .bgBlue {
            background-color: #CCEEFF;
        }

        #detailHead {
            font-size: 20px;
        }

        .textAlignCenter {
            text-align: center;
        }

        .textAlignLeft {
            text-align: left;
        }

        .textAlignRight {
            text-align: right;
        }

        td {
            border-right: 1px solid #ddd;
            border-top: 1px solid #ddd;
        }

        tbody {
            border: 1px solid #ddd;
        }

        #tagHistoryHead {
            background-color: #f4f4f4;
        }

        #tagHistoryTabDiv {
            border: 1px solid #ddd;
        }

        #tagHistoryTitle {
            font-size: 15px;
        }

        .brWhite {
            border-right-color: white;
        }

        #closeTagHistory {
            margin-bottom: 5px;
        }

        .width10Per {
            width: 7%;
        }

        .width5Per {
            width: 3%;
        }

        .width15Per {
            width: 11%;
        }

        .tabChangeDiv {
            border-left: 1px solid #ddd;
            border-right: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            margin-bottom: 100px;
        }

        .marginTop5px {
            margin-top: 0px;
        }

        .bgColor {
            background-color: #ddd;
        }

        .bgColorF5F5F5 {
            background-color: #F5F5F5;
        }

        .bgColorF2FFFF {
            background-color: #F2FFFF;
        }

        .leftSideWhite {
            border-right: 1px solid white;
        }

        .divBorder {
            border: 2px solid #ddd;
            margin-bottom: 10px;
        }

        .titleBottomBorder {
            border-bottom: 2px solid red;
        }

        .marginLeftRight10 {
            margin-left: 10px;
            margin-right: 10px;
        }

        .closeBtn {
            background-color: red;
            color: black;
        }

        .colorBlue {
            color: blue;
        }

        .tdBorderColorf4f4f4 {
            border: 1px solid #f4f4f4;
        }

        #butab td {
            border-bottom: 1px solid #f4f4f4;
        }

        .startHide {
            display: none;
        }

        #sendEditData {
            margin-top: 10px;
            height: 40px;
        }

        .btnSize {
            height: 30px;
            width: 30px;
            padding-top: 4px;
            padding-left: 8px;
        }

        .btnSize2 {
            height: 30px;
            width: 45px;
            padding-top: 4px;
            padding-left: 8px;
        }

        #tradeRecordDiv {
            font-size: 12px;
        }

        .width160 {
            width: 210px;
        }

        .openRecordBtn {
            height: 25px;
            width: 120px;
            margin: 0 auto;
            padding-top: 1px;
        }

        .colorRed {
            color: red;
        }

        .displayNone {
            display: none;
        }

        /* .displayBlock {
            display: block;
        }*/

        div {
            border: 1px solid groove;
        }

        .textAlignCenter {
            text-align: center;
        }

        .auto-style1 {
            height: 25px;
        }

        .auto-style2 {
            text-align: center;
            height: 27px;
        }

        /* .auto-style5 {
            text-align: left;
            width: 350px;
            height: 40px;
            background-color: #E3E3E3;
            font-size: 15px;
        }*/


        .auto-style5 {
            text-align: center;
            width: 350px;
            height: 40px;
            background-color: #E3E3E3;
            font-size: 15px;
        }

        .auto-style7 {
            text-align: center;
            width: 280px;
            height: 40px;
            background-color: #E3E3E3;
            font-size: 15px;
        }

        .auto-style7_Left {
            text-align: left;
            width: 280px;
            height: 40px;
            background-color: #E3E3E3;
            font-size: 15px;
        }

        .auto-style8 {
            width: 280px;
        }

        .auto-style10 {
            background-color: #F2FFFF;
            width: 280px;
        }

        .auto-style12 {
            width: 30%;
        }
    </style>
</head>
<body style="font-family: Microsoft JhengHei;">
    <!-- jQuery 2.1.3 -->
    <script src="<%=getRelativePath()%>plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- jQuery 2.1.3 -->
    <script src="<%=getRelativePath()%>plugins/jQueryUI/jquery.blockUI.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="<%=getRelativePath()%>js/common/Common.js" type="text/javascript"></script>
    <script src="<%=getRelativePath()%>js/common/CommonTool.js" type="text/javascript"></script>
    <script src="<%=getRelativePath()%>js/MasterPage.js" type="text/javascript"></script>

    <!-- content start-->
    <div id="businessConnectionDetailTabDiv" class="divBorder">
        <div id="" class="titleBottomBorder marginLeftRight10">
            <h3><span class="colorRed">業務聯絡單</span>

            </h3>
        </div>

        <div class="tabDivMargin4">
            <%--==================================依照聯絡單種類共同顯示=============================--%>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" id="Table1">
                <tr class="auto-style5">
                    <%--<td class="textAlignCenter" style="border-bottom: 1px solid #f4f4f4"><b>聯絡單種類11</b></td> style="height: 30px;"style="height: 30px;"--%>
                    <td class="auto-style5" style="height: 30px; width: 10%"><b>聯絡單種類</b></td>
                    <%--<td class="textAlignCenter" id="bcdCase"></td>--%>
                    <td class="auto-style7" id="bcdCase"></td>
                    <td class="auto-style5" style="height: 30px; width: 10%"><b>件別</b></td>
                    <td class="auto-style7" id="bcdObj"></td>

                </tr>
                <tr class="auto-style5">
                    <%--<td class="textAlignCenter" style="border-bottom: 1px solid #f4f4f4"><b>聯絡單種類11</b></td>--%>
                    <td class="auto-style5"><b>提案人</b></td>
                    <td class="auto-style7" id="bcdAdd_userName"></td>
                    <td class="auto-style5"><b>案件狀態</b></td>
                    <td class="auto-style7" id="bcdStatus"></td>

                </tr>
                <tr class="auto-style5">
                    <td class="auto-style5"><b>單號</b></td>
                    <td class="auto-style7" id="bcdf_id"></td>
                    <td class="auto-style5"><b>客戶姓名</b></td>
                    <td class="auto-style7" id="bcdM_Name"></td>
                    <%-- <td class="textAlignCenter"><b>分析師</b></td>
                    <td class="textAlignCenter" id="bcdMP_ID"></td>
                    <td class="textAlignCenter"><b>會員種類</b></td>
                    <td class="textAlignCenter" id="bcdMP_Item"></td>--%>
                </tr>
                <tr class="auto-style5">
                    <td class="auto-style5"><b>分析師</b></td>
                    <td class="auto-style7" id="bcdf_id2"><b></b></td>
                    <td class="auto-style5"><b>會員種類</b></td>
                    <td class="auto-style7 textAlignLeft" id="bcdM_Name2"><b></b></td>
                    <%-- <td class="textAlignCenter"><b>分析師</b></td>
                    <td class="textAlignCenter" id="bcdMP_ID"></td>
                    <td class="textAlignCenter"><b>會員種類</b></td>
                    <td class="textAlignCenter" id="bcdMP_Item"></td>--%>
                </tr>

                <%--=================================依照聯絡單種類不同顯示--%>
                <%--入會方式(入會才顯示),業績種類(入會才顯示)--%>
                <tr class="textAlignCenter" id="CF_Item0001" style="font-size: 15px; display: none;">
                    <td class="textAlignCenter bgColorF2FFFF" style="height: 30px;"><b>入會方式</b></td>
                    <td class="textAlignLeft bgColorF2FFFF" id="bcdf_IN" style="font-size: 20px"></td>
                    <td class="textAlignCenter bgColorF2FFFF" style="height: 30px;"><b>業績種類</b></td>
                    <td class="textAlignLeft bgColorF2FFFF" id="bcdResults_Item" style="height: 30px;"></td>
                </tr>
                <%--入帳資訊--%>
                <tr class="textAlignCenter" id="CF_Item0021" style="font-size: 15px; display: none;">
                    <td class="textAlignCenter bgColorF2FFFF" style="height: 30px;"><b>入帳資訊</b></td>
                    <td colspan='3' class="textAlignLeft bgColorF2FFFF" id="bcdT_PType" style="height: 30px; font-size: 20px"></td>
                </tr>
                <%--入會時間+到期時間--%>
                <tr class="textAlignCenter" id="CF_Item0002" style="font-size: 15px; display: none;">
                    <td class="textAlignCenter bgColorF2FFFF" style="height: 30px;"><b>入會時間</b></td>
                    <td class="textAlignLeft bgColorF2FFFF" id="bcdbegindate_Date"></td>
                    <td class="textAlignCenter bgColorF2FFFF" style="height: 30px;"><b>到期時間</b></td>
                    <td class="textAlignLeft bgColorF2FFFF" id="bcdenddate_Date"></td>
                </tr>
                <%--電子委任--%>
                <tr class="textAlignCenter" id="CF_Item0003" style="font-size: 15px; display: none;">
                    <td class="textAlignCenter bgColorF2FFFF" style="height: 30px;"><b>電子委任</b></td>
                    <td colspan="3" class="CF_Item  CF_ItemMess bgColorF2FFFF" id="bcdcontractid" style="height: 30px; text-align: left;"></td>

                </tr>
                <%--設定手機--%>
                <tr class="textAlignCenter" id="CF_Item0004" style="font-size: 15px; display: none;">
                    <td class="textAlignCenter  CF_Item CF_ItemTEXT CF_ItemFax bgColorF2FFFF" style="height: 30px;"><b>設定手機</b></td>
                    <td colspan="3" class="bgColorF2FFFF textAlignLeft" id="bcdCellPhone" style="height: 30px; text-align: left;"></td>
                </tr>
                <%--傳真稿+設訊--%>
                <tr class="textAlignCenter" id="CF_Item0005" style="font-size: 15px; display: none">
                    <td class="textAlignCenter  CF_Item  CF_ItemFax bgColorF2FFFF" style="height: 30px;"><b>傳真稿</b></td>
                    <td class="bgColorF2FFFF textAlignLeft" id="bcdFax"></td>
                    <td class="textAlignCenter  CF_Item  CF_ItemMess bgColorF2FFFF" style="height: 30px;"><b>設訊</b></td>
                    <td class="textAlignLeft bgColorF2FFFF  CF_Item  CF_ItemMess bgColorF2FFFF" id="bcdMess" style="height: 30px;"></td>
                    <%--<td class="bgColorF2FFFF textAlignLeft" style="height: 30px; font-size: 15px;"><b>備註2</b></td>--%>
                </tr>


                <%--設訊--%>
                <tr class="textAlignCenter" id="CF_Item0006" style="font-size: 15px; display: none;">
                    <td class="textAlignCenter  CF_Item  CF_ItemFax bgColorF2FFFF" style="height: 30px;"><b>設訊</b></td>
                    <td colspan="3" class="textAlignLeft  bgColorF2FFFF" id="bcdCF_Item" style="height: 30px;"></td>
                </tr>
                <%--鎖碼影音+付費文章--%>
                <tr class="textAlignCenter" id="CF_Item0012" style="font-size: 15px; display: none;">
                    <td class="textAlignCenter bgColorF2FFFF" style="height: 0px;"><b>鎖碼影音</b></td>
                    <td class="textAlignLeft bgColorF2FFFF" id="bcdMedia"></td>
                    <td class="textAlignCenter bgColorF2FFFF" style="height: 0px;"><b>付費文章</b></td>
                    <td class="auto-style10" id="bcdText"></td>
                </tr>
                <%--付費影音--%>
                <tr class="textAlignCenter" id="CF_Item0007" style="font-size: 15px; display: none;">
                    <td class="textAlignCenter bgColorF2FFFF" style="height: 30px;"><b>付費影音</b></td>
                    <td colspan='3' class="bgColorF2FFFF textAlignLeft" id="bcdPayVideo"></td>

                </tr>
                <%--ATM後五碼,信用卡末四碼--%>
                <tr class="textAlignCenter" id="CF_Item0008" style="font-size: 15px; display: none;">
                    <td class="textAlignCenter bgColorF2FFFF" style="height: 30px;"><b>ATM後五碼</b></td>
                    <td class="bgColorF2FFFF textAlignLeft" id="bcdATM"></td>
                    <td class="textAlignCenter bgColorF2FFFF" style="height: 30px;"><b>信用卡末四碼</b></td>
                    <td class="bgColorF2FFFF textAlignLeft" id="bcdCCard_4Num" style="height: 30px;"></td>
                </tr>
                <%--發票資料--%>
                <tr class="textAlignCenter" id="CF_Item0009" style="font-size: 15px; display: none;">
                    <td class="textAlignCenter bgColorF2FFFF"><b>發票資料</b></td>
                    <td colspan='3' class="textAlignLeft bgColorF2FFFF">
                        <span><b>發票開立方式</b>&nbsp;：&nbsp;</span><span id="bcdINV_Open_Item"></span><br />
                        <%--系統/手開--%>
                        <span><b>發票種類</b>&nbsp;：&nbsp;</span><span id="bcdINV_ITEM"></span><br />
                        <%--二聯/三聯--%>
                        <div id="INV_ITEM_visible" style="display: none;">
                            <%--顯示條件<%if vrs("INV_ITEM")="2" then%>--%>
                            <span class="INV_ITEM2"><b>公司抬頭</b>&nbsp;：&nbsp;</span><span id="bcdCOMNAME"></span><br class="INV_ITEM2" />
                            <span class="INV_ITEM2"><b>公司統編</b>&nbsp;：&nbsp;</span><span id="bcdINV_ITEM_UnifyNum"></span><br class="INV_ITEM2" />

                        </div>
                        <%-- 設訊才顯示--%>
                        <%--/* if vrs("CF_Item")="0002" then '設訊才顯示=============================================== --*/--%>
                        <%-- <span><b>寄發狀況</b>&nbsp;：&nbsp;</span><span id="bcdT_Ivo"></span><br />--%>
                        <span class="INV_ITEM2"><b>寄發狀況</b>&nbsp;：&nbsp;</span><span id="bcdINV_T_Ivo"></span><br class="INV_ITEM2" />
                    </td>

                </tr>



                <%--傳真--%>
                <tr class="textAlignCenter" id="CF_Item0013" style="font-size: 15px; display: none;">
                    <td class="textAlignCenter bgColorF2FFFF"><b>傳真</b></td>
                    <td class="bgColorF2FFFF"><span id="bacMC_fax"></span></td>
                    <td class="bgColorF2FFFF textAlignCenter"><b></b></td>
                    <td class="bgColorF2FFFF textAlignCenter"><b></b></td>
                </tr>
                <%--業績分類+歸屬--%>
                <tr class="textAlignCenter" id="CF_Item0014" style="display: none;">
                    <td class="bgColorF2FFFF textAlignCenter"><b>業績分類</b></td>
                    <td class="textAlignLeft bgColorF2FFFF"><span><b>歸屬</b>&nbsp;：&nbsp;</span><span id="bcdAttach_Name"></span><br />
                        <span><b>月份</b>&nbsp;：&nbsp;</span><span id="bcdCMonth"></span>&nbsp;&nbsp;&nbsp;<span><b>其他</b>&nbsp;：&nbsp;</span><span id="bcdother"></span> </td>
                </tr>
                <%--責任助理--%>
                <tr class="textAlignCenter" id="CF_Item0015" style="display: none;">
                    <td class="bgColorF2FFFF textAlignCenter"><b>責任助理</b></td>
                    <td class="bgColorF2FFFF textAlignCenter">
                        <span><b>原助理:</b>&nbsp;：&nbsp;</span><span id="OLDMC_name"></span>&nbsp;&nbsp;
                        <span><b>更改為:</b>&nbsp;：&nbsp;</span><span id="NEWMC_name"></span>
                    </td>
                    <td class="bgColorF2FFFF textAlignCenter"><b></b></td>
                    <td class="bgColorF2FFFF textAlignCenter"><b></b></td>
                </tr>
                <%--折讓--%>
                <tr class="textAlignCenter" id="CF_Item0016" style="display: none;">
                    <td class="textAlignCenter bgColorF2FFFF"><b>折讓</b></td>
                    <td colspan="3" class="bgColorF2FFFF textAlignLeft">
                        <%--20230330這邊要修改!!!!--%>
                        <span><b>折讓案件</b>&nbsp;：&nbsp;</span><span id="bcdT_ID"></span>&nbsp;-&nbsp;<span id="bcdT_Name"></span><br />
                        <br />
                        <span><b>新轉案件</b>&nbsp;：&nbsp;</span><span id="" class="bcdD_MP"></span>&nbsp;-&nbsp;<span id="" class="bcdD_Item"></span><br />

                        <span><b>新會期</b>&nbsp;：&nbsp;</span><span id="bcdDSdate"></span>&nbsp;-&nbsp;<span id="bcdDEdate"></span><br />
                        <span><b>原會費</b>&nbsp;：&nbsp;</span><span id="bcdT_PayMoney"></span>&nbsp;&nbsp;&nbsp;<span><b>折讓金額</b>&nbsp;：&nbsp;</span><span id="bcdNew_PayMoney"></span><br />
                        <span class=" D_tag1"><b>補件</b>&nbsp;：&nbsp;</span><br class="D_tag1" />
                        <span class=" D_tag1"><span id="" class="bcdD_MP"></span>&nbsp;-&nbsp;<span id="" class="bcdD_Item"></span></span><br class="D_tag1" />
                        <span class=" D_tag1"><span><b>金額</b>&nbsp;：&nbsp;</span><span id="bcdD_Paymoney"></span></span><br class="D_tag1" />
                        <span class=" D_tag1"><span><b>付款方式</b>&nbsp;：&nbsp;</span><span id="bcdD_Type"></span></span><br class="D_tag1" />
                    </td>
                </tr>

                <%-- 訂金件--%>
                <%--暫時沒用到--%>
                <tr class="textAlignCenter" style="display: none;">
                    <td class="bgColorF2FFFF textAlignCenter"><b>訂金件</b></td>
                    <td class="auto-style7">
                        <span><b>會場</b>&nbsp;：&nbsp;</span><span id="bcdV_ID1"></span>&nbsp;-&nbsp;<span id="bcdV_Name1"></span><br />
                        <span><b>金額</b>&nbsp;：&nbsp;</span><span id="bcdVD_Paymoney"></span>&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;<span><b>付款方式</b>&nbsp;：&nbsp;</span><span id="bcdVD_Type"></span>
                    </td>
                </tr>
                <%--退費--%>
                <tr class="textAlignCenter" id="CF_Item0017" style="display: none;">
                    <td class="bgColorF2FFFF textAlignCenter"><b>退費</b></td>
                    <td colspan="3" class="bgColorF2FFFF textAlignLeft">
                        <span><b>案件</b>&nbsp;：&nbsp;</span><span id="bcdB_ID"></span>-<span id="bcdB_Name"></span><br />
                        <span><b>金額</b>&nbsp;：&nbsp;</span><span id="bcdB_Paymoney"></span>
                    </td>
                </tr>
                <%--暫停/恢復--%>
                <tr class="textAlignCenter" id="CF_Item0018" style="display: none;">
                    <td class="bgColorF2FFFF textAlignCenter"><b>暫停/恢復</b></td>
                    <td class="auto-style7">
                        <span><b>狀況</b>&nbsp;：&nbsp;</span><span id="bcdS_tag"></span><br />
                        <span><b>案件</b>&nbsp;：&nbsp;</span><span id="bcdS_ID"></span>&nbsp;-&nbsp;<span id="bcdS_Name"></span><br />
                        <span><b>日期</b>&nbsp;：&nbsp;</span><span id="bcdS_Date"></span>
                    </td>
                    <td class="auto-style7" id=""></td>
                    <td class="auto-style7" id=""></td>
                </tr>
                <%--折讓/不折讓(轉換老師)--%>
                <tr class="textAlignCenter" id="CF_Item0019" style="display: none;">
                    <td class="bgColorF2FFFF auto-style2">
                        <b>折讓/不折讓</b><%--由C_tag判斷 如C_tag=0表示[折讓],如C_tag=1表示[不折讓]]--%>
                    </td>
                    <td class="auto-style7" id="bcdC_tag"></td>
                    <td class="auto-style7" id=""></td>
                    <td class="auto-style7" id=""></td>
                </tr>
                <%--備註--%>
                <tr class="textAlignCenter" id="CF_Item0020" style="display: '';">
                    <td class="bgColorF2FFFF textAlignCenter"><b>備註</b></td>
                    <td colspan="3" class="auto-style7_Left" id="bcdPS" style="height: 90px; font-size: 15px;"></td>
                </tr>
            </table>
        </div>
        <%--    var mychar = document.getElementById("con");
         mychar.style.display="none"; // 不显示，隐藏
           mychar.style.display="block";   // 显示，不隐藏--%>
    </div>
    <%--案件修改明細--%>
    <div id="caseEditRecordDiv" class="tabDivMargin3 divBorder">
        <div id="" class="titleBottomBorder marginLeftRight10">
            <h3><span class="colorRed">案件修改明細</span></h3>
        </div>
        <div id="caseEditRecordInerDiv" class="tabDivMargin4 marginTop10px">
            <table class="table">
                <thead>
                    <tr class="marginTop5px bgColor">
                        <th class="auto-style1">修改人
                        </th>
                        <th class="auto-style1">欄位
                        </th>
                        <th class="auto-style1">內容
                        </th>
                        <th class="auto-style1">時間
                        </th>

                    </tr>
                </thead>
                <tbody id="caseEditRecordTb">
                </tbody>
            </table>
        </div>
    </div>

    <%-- <div id="signingRecordDiv" class="tabDivMargin6 tabChangeDiv divBorder  col-xs-6 ">--%>
    <%--簽核明細--%>
    <div id="signingRecordDiv" class="tabDivMargin3 divBorder">
        <div id="" class="titleBottomBorder marginLeftRight10">
            <h3><span class="colorRed">簽核明細</span></h3>
        </div>
        <div id="signingRecordInerDiv" class="tabDivMargin4 marginTop10px">
            <table class="table">
                <thead>
                    <tr class="marginTop5px bgColor">
                        <th class="auto-style1" width="20%"></th>
                        <th class="auto-style12" width="10%">簽核人員</th>
                        <th class="auto-style1" width="20%">備註</th>
                        <th width="20%">簽核狀態</th>
                        <th class="auto-style1" width="30%">狀態時間</th>

                    </tr>
                </thead>
                <tbody id="signingRecordTb">
                    <tr class="marginTop5px ">
                        <td class="textAlignCenter width10Per leftSideWhite bgColor" style="width: 20%">簽核單位主管
                        </td>
                        <td class="auto-style12" id="srU_LeaderName" style="width: 20%"></td>
                        <td class="textAlignCenter width10Per " id="srU_LeaderStatus" style="width: 20%">
                            <input type="text" class="form-control" id="srL_Ps1" />
                        </td>
                        <td class="textAlignCenter width10Per  " id="srU_LeaderStatusTime" style="width: 20%">
                            <div id="U_LeaderStatus" class="startHide">
                                <input type="text" class="form-control" id="U_LeaderStatus_Value" />
                            </div>
                            <div id="SetU_LeaderStatus">
                                <button type="button" class="btn btn btn-primary btn-flat srU_LeaderStatus signStatus" timetype="U_LeaderStatusTime" signerstatustype="U_LeaderStatus" status="1" pstype="L_Ps" signertype="U_Leader" signernametype="U_LeaderName" id="U_Leader_OK" disabled>簽核</button>&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn btn-danger btn-flat srU_LeaderStatus signStatus" timetype="U_LeaderStatusTime" signerstatustype="U_LeaderStatus" status="2" pstype="L_Ps" signertype="U_Leader" signernametype="U_LeaderName" id="U_Leader_NO" disabled>退回</button>
                            </div>
                        </td>
                        <%--狀態時間--%>
                        <td class="textAlignCenter width10Per " id="srL_PsTd" style="width: 20%">
                            <input type="text" class="form-control startHide" id="srL_Ps2" disabled="disabled" />
                        </td>
                    </tr>
                    <tr class="marginTop5px ">
                        <td class="textAlignCenter width10Per leftSideWhite bgColor" style="width: 20%">行政人員
                        </td>
                        <td class="auto-style12" id="srEX_Name" style="width: 20%"></td>
                        <td class="textAlignCenter width10Per " id="srEX_Status" style="width: 20%">
                            <input type="text" class="form-control" id="srL_Ps3" />
                        </td>
                        <td class="textAlignCenter width10Per " id="srEX_StatusTime" style="width: 20%">
                            <div id="EX_Status" class="startHide">
                                <input type="text" class="form-control" id="EX_Status_Value" />
                            </div>
                            <div id="SetEX_Status">
                                <button type="button" class="btn btn btn-primary btn-flat srEX_Status signStatus" timetype="EX_StatusTime" signerstatustype="EX_Status" status="1" pstype="EX_Ps" signertype="EX" signernametype="EX_Name" id="EX_OK" disabled>簽核</button>&nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn btn-danger btn-flat srEX_Status signStatus" timetype="EX_StatusTime" signerstatustype="EX_Status" status="2" pstype="EX_Ps" signertype="EX" signernametype="EX_Name" id="EX_NO" disabled>退回</button>
                            </div>
                        </td>
                        <%--狀態時間--%>
                        <td class="textAlignCenter width10Per " id="srEX_PsTd" style="width: 20%"></td>
                    </tr>
                    <tr class="marginTop5px">
                        <td class="textAlignCenter width10Per leftSideWhite bgColor" style="width: 20%">行政主管
                        </td>
                        <td class="auto-style12" id="srEX_LeaderName"></td>
                        <td class="textAlignCenter width10Per " id="srEX_LeaderStatus" style="width: 20%">
                            <input type="text" class="form-control" id="srEX_Leader_Ps" />
                        </td>
                        <td class="textAlignCenter width10Per " id="srEX_LeaderStatusTime" style="width: 20%">
                            <div id="EX_LeaderStatus" class="startHide">
                                <input type="text" class="form-control" id="Leader_Status_Value" />
                            </div>
                            <div id="SetEX_LeaderStatus">
                                <input type="hidden" id="auto_id" />
                                <button type="button" class="btn btn btn-primary btn-flat srEX_LeaderStatus signStatus" timetype="EX_LeaderStatusTime" signerstatustype="EX_LeaderStatus" status="1" pstype="EXL_Ps" signertype="EXLeader" signernametype="EX_LeaderName" id="EXLeader_OK" disabled>簽核</button>&nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn btn-danger btn-flat srEX_LeaderStatus signStatus" timetype="EX_LeaderStatusTime" signerstatustype="EX_LeaderStatus" status="2" pstype="EXL_Ps" signertype="EXLeader" signernametype="EX_LeaderName" id="EXLeader_NO" disabled>退回</button>
                            </div>
                        </td>
                        <%--狀態時間--%>
                        <td class="textAlignCenter width10Per " id="srEXL_PsTd" style="width: 20%">
                            <input type="text" id="srEXL_Ps" class="form-control startHide" disabled="disabled" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <%--  </div>--%>
    <!-- jQuery UI 1.11.2 -->
    <script src="http://code.jquery.com/ui/1.11.2/jquery-ui.min.js" type="text/javascript"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script src="<%=getRelativePath()%>js/MasterPage.js" type="text/javascript"></script>
    <script>
        /*const j = require("../../../plugins/pace/pace");*/

        /* const j = require("../../../plugins/pace/pace");*/

        /*cconst j = require("../../../plugins/pace/pace");*/

        /*const { Doc } = require("../../../js/ckeditor/samples/toolbarconfigurator/lib/codemirror/codemirror");*/

        /*const j = require("../../../plugins/pace/pace");*/

        /*const j = require("../../../plugins/pace/pace");*/




        //script開始CommonHandlerUrl

        //本頁資訊======================================================================
        var f_id_G = "<%=getf_id()%>";
        // alert(f_id_G);
        var M_ID ="<%=getM_ID()%>";
        var F_ID = "<%=getF_ID()%>";
        var U_Num_M =  "<%=getU_Num()%>";
        var U_MDEP =  "<%=getU_MDEP()%>";
        var U_Name_M = "";
        var U_MDEP_M = "";
        var IP_M = "";
        <%--var MENU_no_G = "<%=getMENU_no()%>";--%>
        var MENU_no_G = "";
        var add_User_G = undefined;
        var add_User = U_Num_M;
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
        var getBusinessConnectionDataEditRecord = function () {
            var data = "M_ID=" + M_ID + "&action=getBusinessConnectionDataEditRecord";
            //alert(data);
            var success = function (back) {
                var json = jsonParse_M(back);
                //var sb = new $CommonTool.String.StringBuilder();
                var sb = new StringBuilder_M();
                $.each(json, function (i, v) {
                    sb.append("<tr>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.edit_user);//修改人
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.M_Row);//欄位
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.M_text);//內容
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.edit_date);//時間
                    sb.append("</td>");
                    sb.append("</tr>");
                });
                append_M("#caseEditRecordTb", sb.toString());//案件修改明細資料
                unBlockUI_M();
            };
            ajax_M(BusinessConnectionHandlerUrl_G, data, success);
        };
        //取得折讓(T_ID)
        //取得折讓(T_Name)
        //取得折讓(新轉案件)[分析師]
        //取得折讓(新轉案件)[產品]
        //取得折讓(新會期)[起]
        //取得折讓(新會期)[終
        //取得折讓(原會費)
        //取得折讓(折讓金額)


        //取得業績分類-備註欄位
        function getPS() {
            //alert('取得[取得業績分類欄位]');
            var data = "f_id=" + f_id_G + "&M_ID=" + M_ID + "&action=getPS";
            var success = function (back) {
                /*進行畫面資料綁定*/
                console.log("back===" + back);
                var json = jsonParse_M(back);
                ////alert('/*進行畫面資料綁定!!!*/');
                alert("歸屬:" + json);
                text_M("#bcdFax", json);//傳真稿


            };
            var error = function (e) { Log_M("getPS error=" + e); unBlockUI_M(); };
            ajax_M(BusinessConnectionHandlerUrl_G, data, success, error);
        }
        //取得暫停/恢復欄位[日期]
        function getDetail_S_Date() {
            var data = "f_id=" + f_id_G + "&M_ID=" + M_ID + "&action=getDetail_S_Date";
            var success = function (back) {
                /*進行畫面資料綁定*/
                console.log("back===" + back);
                var json = jsonParse_M(back);
                ////alert('/*進行畫面資料綁定!!!*/');
                //alert("其他:" + json);
                text_M("#bcdobcdS_Date", json);//傳真稿


            };
            var error = function (e) { Log_M("getOther error=" + e); unBlockUI_M(); };
            ajax_M(BusinessConnectionHandlerUrl_G, data, success, error);
        }

        //取得暫停/恢復欄位(案件)[名稱]
        function getDetail_S_Name() {
            var data = "f_id=" + f_id_G + "&M_ID=" + M_ID + "&action=getDetail_S_Name";
            var success = function (back) {
                /*進行畫面資料綁定*/
                console.log("back===" + back);
                var json = jsonParse_M(back);
                ////alert('/*進行畫面資料綁定!!!*/');
                alert("其他:" + json);
                text_M("#bcdS_Name", json);//傳真稿


            };
            var error = function (e) { Log_M("getOther error=" + e); unBlockUI_M(); };
            ajax_M(BusinessConnectionHandlerUrl_G, data, success, error);
        }
        //取得折讓明細
        //getDetail_T_ID();
        function getDetail_T_ID() {
            var data = "f_id=" + f_id_G + "&M_ID=" + M_ID + "&action=getDetail_S_Name";
            var success = function (back) {
                /*進行畫面資料綁定*/
                console.log("back===" + back);
                var json = jsonParse_M(back);
                ////alert('/*進行畫面資料綁定!!!*/');
                alert("其他:" + json);
                text_M("#bcdS_Name", json);//傳真稿


            };
            var error = function (e) { Log_M("getOther error=" + e); unBlockUI_M(); };
            ajax_M(BusinessConnectionHandlerUrl_G, data, success, error);
        }
        //getDetail_T_Name();
        function getDetail_T_Name() {
        }
        //getDetail_D_MP();
        function getDetail_D_MP() {
        }
        //getDetail_DSdate();
        function getDetail_DSdate() {
        }
        //getDetail_DEdate();
        function getDetail_DEdate() {
        }
        //getDetail_T_PayMoney();
        function getDetail_T_PayMoney() {
        }
        //取得暫停/恢復欄位(案件)[ID]
        function getDetail_S_ID() {
            var data = "f_id=" + f_id_G + "&M_ID=" + M_ID + "&action=getDetail_S_ID";
            var success = function (back) {
                /*進行畫面資料綁定*/
                console.log("back===" + back);
                var json = jsonParse_M(back);
                ////alert('/*進行畫面資料綁定!!!*/');
                //alert("其他:" + json);
                text_M("#bcdS_ID", json);//傳真稿
            };
            var error = function (e) { Log_M("getOther error=" + e); unBlockUI_M(); };
            ajax_M(BusinessConnectionHandlerUrl_G, data, success, error);
        }
        //取得暫停/恢復欄位(狀況)
        function getDetail_S_tag() {
            var data = "f_id=" + f_id_G + "&M_ID=" + M_ID + "&action=getDetail_S_tag";
            var success = function (back) {
                /*進行畫面資料綁定*/
                console.log("back===" + back);
                var json = jsonParse_M(back);
                ////alert('/*進行畫面資料綁定!!!*/');
                //alert("其他:" + json);
                text_M("#bcdS_tag", json);//傳真稿


            };
            var error = function (e) { Log_M("getOther error=" + e); unBlockUI_M(); };
            ajax_M(BusinessConnectionHandlerUrl_G, data, success, error);
        }
        //取得業績分類-其他欄位
        function getOther() {
            alert('取得[取得業績分類-其他欄位]');
            var data = "f_id=" + f_id_G + "&M_ID=" + M_ID + "&action=getOther";
            var success = function (back) {
                /*進行畫面資料綁定*/
                console.log("back===" + back);
                var json = jsonParse_M(back);
                ////alert('/*進行畫面資料綁定!!!*/');
                //alert("其他:" + json);
                text_M("#bcdother", json);//傳真稿


            };
            var error = function (e) { Log_M("getOther error=" + e); unBlockUI_M(); };
            ajax_M(BusinessConnectionHandlerUrl_G, data, success, error);
        }
        //取得業績分類-月份欄位
        function getCMonth() {
            //alert('取得[取得業績分類欄位]');
            var data = "f_id=" + f_id_G + "&M_ID=" + M_ID + "&action=getCMonth";
            var success = function (back) {
                /*進行畫面資料綁定*/
                console.log("back===" + back);
                var json = jsonParse_M(back);
                ////alert('/*進行畫面資料綁定!!!*/');
                alert("歸屬:" + json);
                text_M("#bcdCMonth", json);//傳真稿


            };
            var error = function (e) { Log_M("getCMonth error=" + e); unBlockUI_M(); };
            ajax_M(BusinessConnectionHandlerUrl_G, data, success, error);
        }
        //取得業績分類-歸屬欄位
        function getAttachName() {
            alert('取得[取得業績分類欄位]');
            var data = "f_id=" + f_id_G + "&M_ID=" + M_ID + "&action=getAttachName";//20230202修改!!!
            var success = function (back) {
                /*進行畫面資料綁定*/
                console.log("back===" + back);
                var json = jsonParse_M(back);
                ////alert('/*進行畫面資料綁定!!!*/');
                //alert("歸屬:" + json);
                text_M("#bcdAttach_Name", json);//傳真稿
            };
            var error = function (e) { Log_M("getAttachName error=" + e); unBlockUI_M(); };
            ajax_M(BusinessConnectionHandlerUrl_G, data, success, error);
        }
        //取得傳真稿欄位
        function getFAX() {
            //alert('取得[傳真稿]');
            var data = "f_id=" + f_id_G + "&M_ID=" + M_ID + "&action=getFAX";//20230202修改!!!
            var success = function (back) {
                /*進行畫面資料綁定*/
                console.log("back===" + back);
                var json = jsonParse_M(back);
                ////alert('/*進行畫面資料綁定!!!*/');
                alert("傳真稿:" + json);
                text_M("#bcdFax", json);//傳真稿


            };
            var error = function (e) { Log_M("getFAX error=" + e); unBlockUI_M(); };
            ajax_M(BusinessConnectionHandlerUrl_G, data, success, error);
        }
        //取得聯絡單種類[更改責任助理]中責任助理中的[原助理](OLD_MC_NAME)
        function getOLD_MC_NAME(M_ID) {
            //alert('取得聯絡單種類[更改責任助理]中責任助理中的[原助理]');
            var data = "f_id=" + f_id_G + "&M_ID=" + M_ID + "&action=getOLD_MC_NAME";//20230202修改!!!
            var success = function (back) {
                /*進行畫面資料綁定*/
                console.log("back===" + back);
                var json = jsonParse_M(back);
                ////alert('/*進行畫面資料綁定!!!*/');
                text_M("#OLDMC_name", json);//原助理
                ////alert('顯示案件修改明細資料!!');//getBusinessConnectionUpdateDetail
                //會員種類
                //alert("手機:" + json.cellphone);
                //text_M("#bcdCellPhone", json.cellphone);
                ////alert('/*進行畫面資料綁定!!!*/');
                //20230203進行畫面資料綁定!
                //  ajax_M(BusinessConnectionHandlerUrl_G, data, success);

            };
            var error = function (e) { Log_M("getOLD_MC_NAME error=" + e); unBlockUI_M(); };
            ajax_M(BusinessConnectionHandlerUrl_G, data, success, error);
        }
        //取得聯絡單種類[更改責任助理]中責任助理中的[更改為](U_Agent_Name)
        function getU_Agent_Name(M_ID) {
            //alert('取得聯絡單種類[更改責任助理]中責任助理中的[更改為](U_Agent_Name)');
            var data = "f_id=" + f_id_G + "&M_ID=" + M_ID + "&action=getU_Agent_Name";//20230202修改!!!
            var success = function (back) {
                /*進行畫面資料綁定*/
                console.log("back===" + back);
                var json = jsonParse_M(back);
                ////alert('/*進行畫面資料綁定!!!*/');
                text_M("#NEWMC_name", json);//更改責任助理
                ////alert('顯示案件修改明細資料!!');//getBusinessConnectionUpdateDetail
                //會員種類
                //alert("手機:" + json.cellphone);
                //text_M("#bcdCellPhone", json.cellphone);
                ////alert('/*進行畫面資料綁定!!!*/');
                //20230203進行畫面資料綁定!
                //  ajax_M(BusinessConnectionHandlerUrl_G, data, success);

            };
            var error = function (e) { Log_M("getU_Agent_Name error=" + e); unBlockUI_M(); };
            ajax_M(BusinessConnectionHandlerUrl_G, data, success, error);
        }
        /*
         *   var getTotalPage = function (count) {
                     var pageCount = count / CountPerPage_G;
                     var pageCount1 = Math.floor(pageCount);
                     var remainder = count % CountPerPage_G;
                     if (remainder > 0) {
                         pageCount1 += 1;
                         pageCount = pageCount1;
                     }
                     return pageCount;
                 };
         * 
        * */
        //取得業務聯絡單明細20230206
        //進行畫面資料綁定
        //取得業務聯絡單明細20230619
        var getBusinessConnectionDetail = function () {
            //show_M('#srL_Ps');//簽核單位主管
            //show_M('#srEX_Ps');//行政人員
            //show_M('#srEXL_Ps');//行政主管
            //alert('取得業務聯絡單明細3!!!');
            //20230528進度!!!!!!!!!!!
            //var data = "F_ID=" + F_ID + "&M_ID=" + M_ID + "&action=getBusinessConnectionDetail";//20230202修改!!!
            var data = "F_ID=" + F_ID + "&action=getBusinessConnectionDetail";//20230202修改!!!
            ////alert(data);
            var success = function (back) {
                console.log("back===" + back);
                var json = jsonParse_M(back);
                //alert(sessionStorage["U_Num"]);
                var U_NUM = U_Num_M;//登入的帳號
                //U_Num_M
                //alert("登入的帳號:" + U_NUM);
                //if (U_NUM == "B1103011") {
                //    alert("許毓政");
                //};
                var U_Mdep = U_MDEP;//登入者所屬部門A1004061
                var F_Status = json.F_Status;
                var U_Leader = json.U_Leader;
                var U_LeaderStatus = json.U_LeaderStatus;//[簽核狀態]簽核單位主管
                var EX_Status = json.EX_Status;//[簽核狀態]行政人員
                var EX_LeaderStatus = json.EX_LeaderStatus;//[簽核狀態]行政主管
                var Type = json.CF_item;//業務聯絡單種類
                text_M("#bcdT_PayMoney", json.Paymoney);//原會費
                //alert("簽核單位主管:" + json.U_LeaderName);
                text_M("#srU_LeaderName", json.U_LeaderName);//簽核單位主管
                //alert("行政人員:" + json.EX_Name);
                text_M("#srEX_Name", json.EX_Name);//行政人員
                //alert("行政主管:" + json.EX_LeaderName);
                text_M("#srEX_LeaderName", json.EX_LeaderName);//行政主管
                //簽核狀態
                //1:核准,2:退回
                text_M("#bcdAttach_Name", json.Attach_Name);
                if (json.CMonth = "1") {
                    text_M("#bcdCMonth", "當月");
                } else if (json.CMonth = "2") {
                    text_M("#bcdCMonth", "次月");
                }

                //Results_Item
                if (json.Results_Item == "0001") {
                    //alert(json.Results_Item);
                    json.Results_ItemName = "一般件";
                    //alert(json.Results_ItemName);
                }
                else {
                    //alert(json.Results_Item);
                    json.Results_ItemName = "獎勵件";
                    //alert(json.Results_ItemName);
                }


                var CF_Item0001_Visible = document.getElementById("CF_Item0001");//入會方式+業績種類
                var CF_Item0021_Visible = document.getElementById("CF_Item0021");//入帳資訊
                var CF_Item0002_Visible = document.getElementById("CF_Item0002");//入會時間+到期時間
                var CF_Item0003_Visible = document.getElementById("CF_Item0003");//電子委任
                var CF_Item0004_Visible = document.getElementById("CF_Item0004");//設定手機
                var CF_Item0005_Visible = document.getElementById("CF_Item0005");//傳真稿+設訊
                var CF_Item0006_Visible = document.getElementById("CF_Item0006");//設訊
                var CF_Item0007_Visible = document.getElementById("CF_Item0007");//付費影音
                var CF_Item0008_Visible = document.getElementById("CF_Item0008");//ATM後五碼,信用卡末四碼
                var CF_Item0009_Visible = document.getElementById("CF_Item0009");//發票資料
                var CF_Item0012_Visible = document.getElementById("CF_Item0012");//鎖碼影音
                var CF_Item0013_Visible = document.getElementById("CF_Item0013");//傳真
                var CF_Item0014_Visible = document.getElementById("CF_Item0014");//業績分類+歸屬
                var CF_Item0015_Visible = document.getElementById("CF_Item0015");//更改責任助理
                var CF_Item0016_Visible = document.getElementById("CF_Item0016");//折讓
                var CF_Item0017_Visible = document.getElementById("CF_Item0017");//退費
                var CF_Item0018_Visible = document.getElementById("CF_Item0018");//暫停/恢復
                var CF_Item0019_Visible = document.getElementById("CF_Item0019");//折讓/不折讓
                var CF_Item0020_Visible = document.getElementById("CF_Item0020");//備註
                text_M("#bcdDSdate", json.DSdate);//新會期(起)
                text_M("#bcdDEdate", json.DEdate);//新會期(終)
                //簽核單位主管
                /*'簽核單位主管
                    if vrs("F_Status")="1" and vrs("U_LeaderStatus")="0" then
                    '林家民、詠傑皆可簽核
                    if session("U_Num") = vrs("U_Leader")  or (vrs("U_Leader")="A9501042" and
                    session("U_Num")="A0605022" )  or (vrs("U_Leader")="A9501041" and 
                    session("U_Num")="A0111281" )  or (vrs("U_Leader")="A9501042" and 
                    session("U_Num")="A0506011" )  or (vrs("U_Leader")="A9501041" and 
                    session("U_Num")="A0111281" )  or (vrs("U_Leader")="A9501042" and 
                    session("U_Num")="A0407132" )  or (vrs("U_Leader")="A9501041" and 
                    session("U_Num")="A0404013" )    or (vrs("U_Leader")="A9501042" and 
                    session("U_Num")="A0312016" )   or (vrs("U_Leader")="A9501042" and 
                    session("U_Num")="A1004061" )  then%>

                 */
                var SetL_U_LeaderStatus_Visible = document.getElementById("SetU_LeaderStatus");//簽核單位主管簽核按鈕
                var SetEX_Status_Visible = document.getElementById("SetEX_Status");//行政人員簽核按鈕
                var SetEX_Leader_Status_Visible = document.getElementById("SetEX_LeaderStatus");//行政主管簽核按鈕
                var U_LeaderStatus_Visible = document.getElementById("U_LeaderStatus");
                //var EX_Status_Visible = document.getElementById("EX_Status");
                var EX_Leader_Status_Visible = document.getElementById("EX_LeaderStatus");



                var U_Mdep = '<%= Session["U_Mdep"] %>';
                //&&:AND
                //||:OR
                //簽核單位主管簽核明細
                //簽核單位主管簽核明細
                //||(OR)AND (&&)
                if (F_Status == '1' && U_LeaderStatus == '0') {
                    if ((U_NUM === U_Leader) ||
                        (json.U_Leader == "A9501042" && U_NUM == "A0605022") ||
                        (json.U_Leader == "A9501042" && U_NUM == "A0111281") ||
                        (json.U_Leader == "A9501042" && U_NUM == "A0506011") ||
                        (json.U_Leader == "A9501042" && U_NUM == "A0111281") ||
                        (json.U_Leader == "A9501042" && U_NUM == "A0407132") ||
                        (json.U_Leader == "A9501042" && U_NUM == "A0404013") ||
                        (json.U_Leader == "A9501042" && U_NUM == "A0312016") ||
                        (json.U_Leader == "A9501042" && U_NUM == "A1004061")) {
                        //alert('show簽核單位主管srEX_Ps');
                        //show_M('#srL_Ps');//簽核單位主管srEX_Ps
                        //alert('[簽核單位主管]核准+退回+簽核');
                    }
                }
                else if (json.U_LeaderStatus === '1') {
                    //  alert('hide_M(簽核單位主管srEX_Ps);');
                    text_M("#srL_PsTd", "已核准:" + json.U_LeaderStatusTime);
                    //alert('[簽核單位主管]已核准+備註');
                    SetU_LeaderStatus.style.display = 'none';
                }
                else if (json.U_LeaderStatus === '2') {
                    //  alert('hide_M(簽核單位主管srEX_Ps);');
                    text_M("#srL_PsTd", "已退回:" + json.U_LeaderStatusTime);
                    //alert('[簽核單位主管]已退回+備註');
                }
                else {
                    text_M("#srL_PsTd", "尚未簽核");
                    //alert('[簽核單位主管]尚未簽核');
                }




                //行政人員簽核明細
                if (json.F_Status === '1' && json.U_LeaderStatus === '1' && json.EX_Status != '1' && (U_Mdep == "0003" || U_Mdep == "0004")) {
                    //<input type = "submit" name = "EX_Status" value = "1" checked="true"/> 核准
                    //<input type = "submit" name = "EX_Status" value = "2"/> 退回
                    //<input type = "submit" name = "query" class= "btn" value = "簽核"/>


                }
                else if (json.EX_Status === '1') {
                    //EX_Status_Visible.style.display = "";
                    //SetEX_Status_Visible.style.display = '';
                    //SetEX_Status_Visible.style.display = "none";
                    text_M("#srEX_PsTd", "已核准:" + json.EX_StatusTime);

                    //alert('[行政人員]已核准+備註');
                    SetEX_Status.style.display = "none";
                }
                else if (json.EX_Status == '2') {
                    text_M("#srEX_PsTd", "已退回:" + json.EX_StatusTime);
                    //alert('[行政人員]已退回+備註');
                }
                else {
                    text_M("#srEX_PsTd", "尚未簽核");
                    //alert("'[行政人員]尚未簽核");
                }
                //行政主管簽核明細
                if (json.F_Status === '1' && json.U_LeaderStatus === '1' && json.EX_Status === '1' && json.EX_LeaderStatus != '1' && (U_Mdep == "0003" || U_Mdep == "0004")) {
                    //alert('[行政主管]核准+退回+簽核');
                }
                else if (json.U_LeaderStatus == '1') {
                    //  alert('hide_M(簽核單位主管srEX_Ps);');
                    text_M("#srEXL_PsTd", "已核准:" + json.EX_LeaderStatusTime);
                    //alert('[行政主管]已核准+備註');
                    SetEX_LeaderStatus.style.display = "none";
                }
                else if (json.U_LeaderStatus == '2') {
                    //  alert('hide_M(簽核單位主管srEX_Ps);');
                    text_M("#srEXL_PsTd", "已退回:" + json.EX_LeaderStatusTime);
                    //alert('[行政主管]已退回+備註');
                }
                else {
                    text_M("#srEXL_PsTd", "尚未簽核");
                    //alert('[行政主管]尚未簽核');
                }



                //行政人員(srEX_Ps)備註判斷
                //if vrs("F_Status")="1" and vrs("U_LeaderStatus")="1" and vrs("EX_Status")<>"1" and (Session("U_Mdep")="0003" or Session("U_Mdep")="0004") then
                if ((json.F_Status == "1") && (json.U_LeaderStatus == "1") && (json.EX_Status != "1") && (U_Mdep == "0003" || U_Mdep == "0004")) {
                    // alert('show行政人員srEX_Ps')
                    show_M('#srEX_Ps');//行政人員
                }
                else {
                    //alert(' hide_M行政人員');
                    //hide_M('#srEX_Ps');
                    show_M('#srEX_Ps');//行政人員//20230524測試用!!!
                };
                if (U_NUM = "B1103011") {
                    //alert('登入者為許毓政2!!');
                    //show_M('#srL_Ps');//簽核單位主管
                };
                if (F_Status = "1") {
                    // alert('F_Status2!!');
                    //show_M('#srEXL_Ps');
                }
                //alert(U_NUM_Login);
                //var type = json.CF_item_Name;//聯絡單種類
                //alert('聯絡單種類' + type);
                //依照聯絡單種類顯示不同畫面
                var type = json.CF_item_Name;
                //alert(type);
                //var url = 'https://www.hwa-guan.com.tw/file/RAPDF/9a02402b.pdf';
                //var Mess_Txt = document.getElementById("bcdMess");
                ////alert(json.P_Text);
                //if (json.TEXT_Txt = "0001") { }
                //var TEXT_Txt = document.getElementById("bcdTEXT");
                //if (json.M_text = "0001") { }
                //var Media_Txt = document.getElementById("bcdMedia");
                //if (json.Mess_Txt = "0001") { }
                /*進行畫面資料綁定*/
                var elem6 = document.getElementById("INV_ITEM_visible");
                elem6.style.display = "none";
                //console.log("back===" + back);
                //var json = jsonParse_M(back);
                var type = json.CF_item_Name;//聯絡單種類
                //alert('聯絡單種類' + type);
                //var type = json.CF_item_Name;
                //alert(type);
                var contractid = json.contractid;
                if (typeof (contractid) == "undefined") {
                    var url = '';
                    contractid = "";
                    var pdf = contractid + ".pdf";
                    var url = 'https://www.hwa-guan.com.tw/file/RAPDF/' + pdf;
                }
                else {
                    var pdf = contractid + ".pdf";
                    var url = 'https://www.hwa-guan.com.tw/file/RAPDF/' + pdf;
                }
                //http://localhost:13333/wealthManage/customerManage/MMBER/customerDetail.aspx?M_ID=20120331642614&MENU_no=28&ERPcustomerWebPayMENU_no=
                var url2 = "http://localhost:13333//wealthManage/customerManage/MMBER/customerDetail.aspx?M_ID=" + json.M_ID + "&MENU_no=28&ERPcustomerWebPayMENU_no=";
                //Results_Item
                if (json.Results_Item == "0001") {
                    //bcdResults_Item
                    text_M("#bcdResults_Item", json.Results_ItemName);//業績種類
                    //alert(json.Results_ItemName);
                }
                else if (json.Results_Item == "0002") {
                    text_M("#bcdResults_Item", json.Results_ItemName);//業績種類
                    //alert(json.Results_ItemName);
                }
                //var imgtext = "<img src=" + '"../../../img/icon/dc1.jpg"'+ ">";
                //<IMG src="../../../img/icon/Green_Light.png" width=15 height=15>
                //<IMG src="../../../img/icon/Green_Light.png" width=15 height=15>
                //聯絡單種類(入會)
                text_M("#bcdf_id2", json.MP_ID_Name2);//分析師中文名稱
                text_M("#bcdf_id2_", json.MP_ID_Name2);

                text_M("#bcdB_ID", json.B_ID);//退費-案件編號
                text_M("#bcdB_Name", json.B_Name);//退費-案件名稱
                text_M("#bcdB_Paymoney", json.B_Paymoney);//退費-金額
                //text_M("#bcdf_IN", json.Results_Item);//入會方式
                ////alert('/*進行畫面資料綁定!!!*/')
                //var elem4 = document.getElementById("PT_ItemN1_visible");
                //if (json.TEXT_Txt = "0001") {
                //    elem4.style.display = "table-row";
                //}
                //alert("c_tag" + json.c_tag);
                if (json.c_tag = 0) {
                    //bcdC_tag
                    text_M("#bcdC_tag", "折讓");//聯絡單種類
                }
                else {
                    text_M("#bcdC_tag", "不折讓");//聯絡單種類
                }
                if (json.CMonth = 1) { }
                else if (json.CMonth = 2) { }

                //text_M("#bcdother", json.other);
                var TEXT_Txt = document.getElementById("bcdTEXT");
                if (json.M_text = "0001") { }
                var Media_Txt = document.getElementById("bcdMedia");
                if (json.Mess_Txt = "0001") { };
                //
                text_M("#bcdcontractid2_", "12345");//入會2
                //
                text_M("#bcdCase", json.CF_item_Name);//聯絡單種類
                text_M("#bcdObj", json.Obj_Name);//件別
                //text_M("#bcdText", json.Text);//付費文章
                if (json.Text = "1") {
                    json.Text = "設";
                }
                else if (json.Results_Item = "2") {
                    json.Text = "不設";
                }
                else {
                    json.Text = "無";
                }
                //暫停.恢復

                text_M("#bcdCellPhone", json.cellphone);//設定手機
                //bcdPayVideo
                text_M("#bcdPayVideo", json.P_video);//付費影音
                text_M("#bcdAdd_userName",);//提案人
                text_M("#bcdf_id", json.f_id);//單號
                text_M("#bcdf_IN", json.Results_Item);//入會方式
                //text_M("#bcdResults_Item", "TEST");
                text_M("#bcdf_id32", "ABCDE");
                text_M("#bcdMP_Item", json.MP_ID_Name);//會員種類bcdMP_Item
                $("#bcdcontractid").html("<a href='" + url + "'" + " target='twcapdf' alt='點選看委任'> <font color='blue'>" + json.ca_id + "</font></a>(" + json.pay_serial + ")" + "-" + json.p_name + "-" + json.price + "元");//電子委任欄位
                $("#bcdcontractid2").html("<a href='" + url + "'" + " target='twcapdf' alt='點選看委任'> <font color='blue'>" + json.ca_id + "</font></a>(" + json.pay_serial + ")" + "-" + json.p_name + "-" + json.price + "元");//電子委任欄位
                text_M("#bcdResults_Item", json.Results_ItemName);//業績種類(20230607要把代碼[0001]變名稱[XXX])
                text_M("#bcdFax", json.Fax);//傳真稿
                //這裡需要修可,客戶姓名可串接
                //http://localhost:13333/wealthManage/customerManage/MMBER/customerDetail.aspx?M_ID=20120331642614&MENU_no=28&ERPcustomerWebPayMENU_no=
                //text_M("#bcdM_Name", url2);//客戶姓名
                $("#bcdM_Name").html("<a href='" + url2 + "'" + " target='twcapdf' alt='點選看委任'> <font color='blue'>" + json.M_Name + "</font></a>");//客戶姓名欄位

                if (json.EX_Status = 1) {
                    text_M("#EX_Status_Value", "核准");
                }
                else if (json.EX_Status = 0) {
                    text_M("#EX_Status_Value", "退回");
                }
                //U_LeaderStatus_Value
                if (json.U_LeaderStatus = 1) {
                    text_M("#U_LeaderStatus_Value", "核准");
                }
                else if (json.EX_Status = 0) {
                    text_M("#U_LeaderStatus_Value", "退回");
                }
                //Leader_Status_Value
                if (json.EX_LeaderStatus = 1) {
                    text_M("#Leader_Status_Value", "核准");
                }
                else if (json.EX_Status = 0) {
                    text_M("#Leader_Status_Value", "退回");
                }
                text_M("#bcdATM", json.atm);//後五碼

                text_M("#bcdCCard_4Num", json.CCard_4Num);//信用卡末四碼
                text_M("#bcdM_Name2", json.mem);//會員種類

                text_M("#bcdAdd_userName", json.add_user);//提案人姓名
                text_M("#bcdMP_ID", json.MP_ID_Name2);//入會方式
                if (json.Results_Item = "0001") {
                    json.Results_Item = "一般件";
                }
                else if (json.Results_Item = "0001") {
                    json.Results_Item = "獎勵件";
                }
                text_M("#bcdf_id9", json.Results_Item);//入會方式
                text_M("#bcdCF_Item", json.Mess);//設訊
                if (json.Text = "0001") {
                    json.Text = "設";
                }
                else if (json.Results_Item = "0002") {
                    json.Text = "不設";
                }
                else {
                    json.Text = "無";
                }
                text_M("#bcdTEXT", json.Text);//付費文章
                text_M("#bcdMedia", json.Media);//鎖碼影音
                text_M("#bcdINV_T_Ivo", json.T_Ivo);//寄發狀況
                text_M("#bcdINV_Open_Item", json.INV_open_ITEM);//發票開立方式
                //alert(json.PS);
                text_M("#bcdPS", json.PS);//備註

                $("#bcdAccountPaymoney1").text(json.Paymoney);//入帳資訊-會費
                $("#bcdT_PType").text(json.T_PType_Name);//入帳資訊-付款方式中文名稱
                $("#bcdbegindate_Date").text(json.begindate_Date);//入會時間
                $("#bcdenddate_Date").text(json.enddate_Date);//到期時間
                $("#bcdATM").text(json.atm)//ATM後五碼
                $("#bcdCCard_4Num").text(json.CCard_4Num);//信用卡末四碼
                $("#bcdMess").text(json.Mess);//設訊
                $("#bcdResults__Item1").text(json.Results_Item);//2);//業績種類
                $("#bcdT_PType").text("會費:" + json.Paymoney + "付款方式:" + json.T_PType_Name);//會費,付款方式
                $("#bacMC_fax").text(json.Fax);//設網路傳真
                $("#bacMC_fax2").text(json.Fax);//設網路傳真
                //alert("入帳資訊:" + "會費:" + json.Paymoney + "付款方式:" + json.T_PType_Name);
                //text_M("#bcdT_PType", json.T_PType_Name);//入帳資訊-付款方式中文名稱
                //text_M("#bcdT_PType", "會費:" + json.Paymoney + "付款方式:" + json.T_PType_Name);//入帳資訊-付款方式中文名稱(20230526可用!!!!!)
                //$("#bcdStatus").text(imgtext+"註記:"+json.Mark);//註記(案件狀態)
                //$("#bcdStatus").css("background-color", "FFA500");
                //$("#bcdStatus").css("bgcolor", "pink");
                if (json.Light_status == 'R') {
                    /*var color = "colorRed";*/
                    var color = "Red";
                }
                if (json.Light_status == 'Y') {
                    var color = "Yellow";
                }
                if (json.Light_status == 'G') {
                    var color = "Green";
                }
                $("#bcdStatus").html("<span style='color:" + color + "'>●" + "</span><span>派發:<span>" + json.Assign + "</span>" + "<span>" + "註記:</span>" + json.Mark);
                //$("#bcdStatus").text("註記:" + json.Mark);//註記(案件狀態)






                getBusinessConnectionDataEditRecord(json.M_ID);
                var elem1 = document.getElementById('T_Type_visible');
                var elem2 = document.getElementById('T_Type2_visible');
                var elem3 = document.getElementById('T_Type3_visible');
                /*var elem4 = document.getElementById("PT_ItemN1_visible");*/
                var elem5 = document.getElementById("PT_ItemN2_visible");
                /* var elem6 = document.getElementById("INV_ITEM_visible");*/
                var eleCF_Item1 = document.getElementById('T_Type_visible');
                //bcdMedia

                //alert("案件型態TYPE:" + json.T_Type);//案件型態
                ////alert("CF_item"+json.CF_item);
                //CF_Item
                //入會
                if (json.CF_item == "0001") {
                    //alert("入會!!");
                    //alert("CF_Item0001_Visible.style.display");
                    /*
                     *  var CF_Item0001_Visible = document.getElementById("CF_Item0001");//入會方式+業績種類
                        var CF_Item0021_Visible = document.getElementById("CF_Item0021");//入帳資訊
                        var CF_Item0002_Visible = document.getElementById("CF_Item0002");//入會時間+到期時間
                        var CF_Item0003_Visible = document.getElementById("CF_Item0003");//電子委任
                        var CF_Item0004_Visible = document.getElementById("CF_Item0004");//設定手機
                        var CF_Item0005_Visible = document.getElementById("CF_Item0005");//傳真稿+設訊
                        var CF_Item0006_Visible = document.getElementById("CF_Item0006");//設訊
                        var CF_Item0007_Visible = document.getElementById("CF_Item0007");//付費影音
                        var CF_Item0008_Visible = document.getElementById("CF_Item0008");//ATM後五碼,信用卡末四碼
                        var CF_Item0009_Visible = document.getElementById("CF_Item0009");//發票資料
                        var CF_Item0012_Visible = document.getElementById("CF_Item0012");//鎖碼影音
                        var CF_Item0013_Visible = document.getElementById("CF_Item0013");//傳真
                        var CF_Item0014_Visible = document.getElementById("CF_Item0014");//業績分類+歸屬
                        var CF_Item0015_Visible = document.getElementById("CF_Item0015");//更改責任助理
                        var CF_Item0016_Visible = document.getElementById("CF_Item0016");//折讓
                        var CF_Item0017_Visible = document.getElementById("CF_Item0017");//退費
                        var CF_Item0018_Visible = document.getElementById("CF_Item0018");//暫停/恢復
                        var CF_Item0019_Visible = document.getElementById("CF_Item0019");//折讓/不折讓
                        var CF_Item0020_Visible = document.getElementById("CF_Item0020");//備註
                     */
                    CF_Item0001_Visible.style.display = "";//入會方式-業績種類
                    CF_Item0021_Visible.style.display = "";//入會時間-到期時間
                    CF_Item0002_Visible.style.display = "";//傳真稿-設訊
                    CF_Item0003_Visible.style.display = "";//電子委任
                    CF_Item0004_Visible.style.display = "";//設定手機
                    CF_Item0005_Visible.style.display = "";//傳真稿+設訊
                    //CF_Item0006_Visible.style.display = 'none';
                    CF_Item0007_Visible.style.display = "";//付費影音
                    CF_Item0008_Visible.style.display = "";//ATM後五碼.信用卡末四碼
                    CF_Item0009_Visible.style.display = "";//發票資料
                    //CF_Item0010_Visible.style.display = 'none';
                    //CF_Item0011_Visible.style.display = "none";
                    CF_Item0012_Visible.style.display = "";//鎖碼影音
                    //CF_Item0013_Visible.style.display = 'none';
                    //CF_Item0014_Visible.style.display = 'none';
                    //CF_Item0015_Visible.style.display = 'none';
                    //CF_Item0016_Visible.style.display = 'none';//折讓
                    //CF_Item0017_Visible.style.display = 'none';
                    //CF_Item0018_Visible.style.display = 'none';
                    //CF_Item0019_Visible.style.display = 'none';
                    CF_Item0020_Visible.style.display = "";//備註

                }
                //設訊
                else if (json.CF_item == "0002") {
                    //alert("設訊!!");
                    //alert("CF_Item0002_Visible.style.display");
                    //CF_Item0001_Visible.style.display = "none";
                    //CF_Item0002_Visible.style.display = 'none';
                    //CF_Item0003_Visible.style.display = 'none';
                    //CF_Item0004_Visible.style.display = 'none';
                    //CF_Item0005_Visible.style.display = 'none';
                    //CF_Item0006_Visible.style.display = "";
                    //CF_Item0007_Visible.style.display = 'none';
                    //CF_Item0008_Visible.style.display = 'none';
                    //CF_Item0009_Visible.style.display = 'none';
                    //CF_Item0010_Visible.style.display = 'none';
                    //CF_Item0011_Visible.style.display = "none";
                    //CF_Item0012_Visible.style.display = 'none';//鎖碼影音
                    //CF_Item0013_Visible.style.display = 'none';
                    //CF_Item0014_Visible.style.display = 'none';
                    //CF_Item0015_Visible.style.display = 'none';
                    //CF_Item0016_Visible.style.display = 'none';
                    //CF_Item0017_Visible.style.display = 'none';
                    //CF_Item0018_Visible.style.display = 'none';
                    //CF_Item0019_Visible.style.display = 'none';
                    //CF_Item0020_Visible.style.display = 'none';
                    /////////////////////////////////////////////
                    //CF_Item0001_Visible.style.display = "";//入會方式-業績種類
                    //CF_Item0021_Visible.style.display = "";//入會時間-到期時間
                    //CF_Item0002_Visible.style.display = "";//傳真稿-設訊
                    //CF_Item0003_Visible.style.display = "";//電子委任
                    //CF_Item0004_Visible.style.display = "";//設定手機
                    //CF_Item0005_Visible.style.display = "";//傳真稿+設訊
                    CF_Item0006_Visible.style.display = "";//設訊
                    //CF_Item0007_Visible.style.display = "";//付費影音
                    //CF_Item0008_Visible.style.display = "";//ATM後五碼.信用卡末四碼
                    //CF_Item0009_Visible.style.display = "";//發票資料
                    //CF_Item0010_Visible.style.display = 'none';
                    //CF_Item0011_Visible.style.display = "none";
                    //CF_Item0012_Visible.style.display = "";//鎖碼影音
                    //CF_Item0013_Visible.style.display = 'none';
                    //CF_Item0014_Visible.style.display = 'none';
                    //CF_Item0015_Visible.style.display = 'none';
                    //CF_Item0016_Visible.style.display = 'none';//折讓
                    //CF_Item0017_Visible.style.display = 'none';
                    //CF_Item0018_Visible.style.display = 'none';
                    //CF_Item0019_Visible.style.display = 'none';
                    CF_Item0020_Visible.style.display = "";//備註
                }
                //設傳真稿
                else if (json.CF_item == "0003") {
                    //CF_Item0001_Visible.style.display = "none";
                    //CF_Item0002_Visible.style.display = 'none';
                    //CF_Item0003_Visible.style.display = 'none';
                    //CF_Item0004_Visible.style.display = 'none';
                    //CF_Item0005_Visible.style.display = 'none';
                    //CF_Item0006_Visible.style.display = 'none';
                    //CF_Item0007_Visible.style.display = 'none';
                    //CF_Item0008_Visible.style.display = 'none';
                    //CF_Item0009_Visible.style.display = 'none';
                    //CF_Item0010_Visible.style.display = 'none';
                    //CF_Item0011_Visible.style.display = "none";
                    //CF_Item0012_Visible.style.display = 'none';
                    //CF_Item0013_Visible.style.display = 'block';//設傳真稿
                    //CF_Item0014_Visible.style.display = 'none';
                    //CF_Item0015_Visible.style.display = 'none';
                    //CF_Item0016_Visible.style.display = 'none';
                    //CF_Item0017_Visible.style.display = 'none';
                    //CF_Item0018_Visible.style.display = 'none';
                    //CF_Item0019_Visible.style.display = 'none';
                    //CF_Item0020_Visible.style.display = 'none';
                    //alert("設訊!!");
                    //alert("CF_Item0002_Visible.style.display");
                    //CF_Item0001_Visible.style.display = "none";
                    //CF_Item0002_Visible.style.display = 'none';
                    //CF_Item0003_Visible.style.display = 'none';
                    //CF_Item0004_Visible.style.display = 'none';
                    //CF_Item0005_Visible.style.display = 'none';
                    //CF_Item0006_Visible.style.display = "";
                    //CF_Item0007_Visible.style.display = 'none';
                    //CF_Item0008_Visible.style.display = 'none';
                    //CF_Item0009_Visible.style.display = 'none';
                    //CF_Item0010_Visible.style.display = 'none';
                    //CF_Item0011_Visible.style.display = "none";
                    //CF_Item0012_Visible.style.display = 'none';//鎖碼影音
                    //CF_Item0013_Visible.style.display = 'none';
                    //CF_Item0014_Visible.style.display = 'none';
                    //CF_Item0015_Visible.style.display = 'none';
                    //CF_Item0016_Visible.style.display = 'none';
                    //CF_Item0017_Visible.style.display = 'none';
                    //CF_Item0018_Visible.style.display = 'none';
                    //CF_Item0019_Visible.style.display = 'none';
                    //CF_Item0020_Visible.style.display = 'none';
                    /////////////////////////////////////////////
                    //CF_Item0001_Visible.style.display = "";//入會方式-業績種類
                    //CF_Item0021_Visible.style.display = "";//入會時間-到期時間
                    //CF_Item0002_Visible.style.display = "";//傳真稿-設訊
                    //CF_Item0003_Visible.style.display = "";//電子委任
                    //CF_Item0004_Visible.style.display = "";//設定手機
                    //CF_Item0005_Visible.style.display = "";//傳真稿+設訊
                    //CF_Item0006_Visible.style.display = "";//設訊
                    //CF_Item0007_Visible.style.display = "";//付費影音
                    //CF_Item0008_Visible.style.display = "";//ATM後五碼.信用卡末四碼
                    //CF_Item0009_Visible.style.display = "";//發票資料
                    //CF_Item0010_Visible.style.display = 'none';
                    //CF_Item0011_Visible.style.display = "none";
                    //CF_Item0012_Visible.style.display = "";//鎖碼影音
                    CF_Item0013_Visible.style.display = "";//傳真
                    getFAX();
                    //取得[傳真稿欄位](bcdFax)





                    //CF_Item0014_Visible.style.display = 'none';
                    //CF_Item0015_Visible.style.display = 'none';
                    //CF_Item0016_Visible.style.display = 'none';//折讓
                    //CF_Item0017_Visible.style.display = 'none';
                    //CF_Item0018_Visible.style.display = 'none';
                    //CF_Item0019_Visible.style.display = 'none';
                    CF_Item0020_Visible.style.display = "";//備註
                }
                //業績歸屬
                else if (json.CF_item == "0004") {
                    CF_Item0001_Visible.style.display = "none";
                    CF_Item0002_Visible.style.display = 'none';
                    CF_Item0003_Visible.style.display = 'none';
                    CF_Item0004_Visible.style.display = 'none';
                    CF_Item0005_Visible.style.display = 'none';
                    CF_Item0006_Visible.style.display = 'none';
                    CF_Item0007_Visible.style.display = 'none';
                    CF_Item0008_Visible.style.display = 'none';
                    CF_Item0009_Visible.style.display = 'none';
                    //CF_Item0010_Visible.style.display = 'none';
                    //CF_Item0011_Visible.style.display = "none";
                    //CF_Item0012_Visible.style.display = 'none';
                    //CF_Item0013_Visible.style.display = 'none';
                    CF_Item0014_Visible.style.display = '';//業績歸屬
                    //取得業績分類欄位詳細資料
                    getAttachName();
                    getCMonth();
                    getOther();
                    getPS();
                    CF_Item0015_Visible.style.display = 'none';
                    CF_Item0016_Visible.style.display = 'none';
                    CF_Item0017_Visible.style.display = 'none';
                    CF_Item0018_Visible.style.display = 'none';
                    CF_Item0019_Visible.style.display = 'none';
                    CF_Item0020_Visible.style.display = '';
                }
                //更改責任助理
                else if (json.CF_item == "0005") {
                    CF_Item0001_Visible.style.display = "none";
                    CF_Item0002_Visible.style.display = 'none';
                    CF_Item0003_Visible.style.display = 'none';
                    CF_Item0004_Visible.style.display = 'none';
                    CF_Item0005_Visible.style.display = 'none';
                    CF_Item0006_Visible.style.display = 'none';
                    CF_Item0007_Visible.style.display = 'none';
                    CF_Item0008_Visible.style.display = 'none';
                    CF_Item0009_Visible.style.display = 'none';
                    //CF_Item0010_Visible.style.display = 'none';
                    //CF_Item0011_Visible.style.display = "none";
                    //CF_Item0012_Visible.style.display = 'none';
                    //CF_Item0013_Visible.style.display = 'none';
                    //CF_Item0014_Visible.style.display = 'none';
                    CF_Item0015_Visible.style.display = "";//更改責任助理
                    CF_Item0016_Visible.style.display = 'none';
                    CF_Item0017_Visible.style.display = 'none';
                    CF_Item0018_Visible.style.display = 'none';
                    CF_Item0019_Visible.style.display = 'none';
                    CF_Item0020_Visible.style.display = "";//備註
                    //alert(F_ID);
                    var OLD_MC_NAME = getOLD_MC_NAME(F_ID);//更改責任助理[原助理]
                    //OLD_MC_NAME();
                    //alert("原助理:" + OLD_MC_NAME);
                    var NEW_MC_NAME = getU_Agent_Name(M_ID);//更改責任助理[更改為]
                    //getU_Agent_Name(M_ID);
                    //NEW_MC_NAME();
                    //alert("更改責任助理:" + NEW_MC_NAME);
                }
                //折讓
                else if (json.CF_item == "0006") {
                    CF_Item0001_Visible.style.display = "none";
                    CF_Item0002_Visible.style.display = 'none';
                    CF_Item0003_Visible.style.display = 'none';
                    CF_Item0004_Visible.style.display = 'none';
                    CF_Item0005_Visible.style.display = 'none';
                    CF_Item0006_Visible.style.display = 'none';
                    CF_Item0007_Visible.style.display = 'none';
                    CF_Item0008_Visible.style.display = 'none';
                    CF_Item0009_Visible.style.display = 'none';
                    //CF_Item0010_Visible.style.display = 'none';
                    //CF_Item0011_Visible.style.display = "none";
                    //CF_Item0012_Visible.style.display = 'none';
                    //CF_Item0013_Visible.style.display = 'none';
                    //CF_Item0014_Visible.style.display = 'none';
                    CF_Item0015_Visible.style.display = 'none';
                    CF_Item0016_Visible.style.display = "";//折讓
                    CF_Item0017_Visible.style.display = 'none';
                    CF_Item0018_Visible.style.display = 'none';
                    CF_Item0019_Visible.style.display = 'none';
                    //取得折讓明細
                    getDetail_T_ID();
                    //getDetail_T_Name();
                    //getDetail_D_MP();
                    //getDetail_DSdate();
                    //getDetail_DEdate();
                    //getDetail_T_PayMoney();
                }
                //訂金件(暫時沒用到)
                else if (json.CF_item == "0007") {

                }
                //退費
                else if (json.CF_item == "0008") {
                    CF_Item0001_Visible.style.display = "none";
                    CF_Item0002_Visible.style.display = 'none';
                    CF_Item0003_Visible.style.display = 'none';
                    CF_Item0004_Visible.style.display = 'none';
                    CF_Item0005_Visible.style.display = 'none';
                    CF_Item0006_Visible.style.display = 'none';
                    CF_Item0007_Visible.style.display = 'none';
                    CF_Item0008_Visible.style.display = 'none';
                    CF_Item0009_Visible.style.display = 'none';
                    //CF_Item0010_Visible.style.display = 'none';
                    //CF_Item0011_Visible.style.display = "none";
                    //CF_Item0012_Visible.style.display = 'none';
                    //CF_Item0013_Visible.style.display = 'none';
                    //CF_Item0014_Visible.style.display = 'none';
                    CF_Item0015_Visible.style.display = 'none';
                    CF_Item0016_Visible.style.display = 'none';
                    CF_Item0017_Visible.style.display = "";
                    CF_Item0018_Visible.style.display = "none";// 退費
                    CF_Item0019_Visible.style.display = 'none';
                    CF_Item0020_Visible.style.display = "";
                }
                //暫停/恢復
                else if (json.CF_item == "0009") {
                    CF_Item0001_Visible.style.display = "none";
                    CF_Item0002_Visible.style.display = 'none';
                    CF_Item0003_Visible.style.display = 'none';
                    CF_Item0004_Visible.style.display = 'none';
                    CF_Item0005_Visible.style.display = 'none';
                    CF_Item0006_Visible.style.display = 'none';
                    CF_Item0007_Visible.style.display = 'none';
                    CF_Item0008_Visible.style.display = 'none';
                    CF_Item0009_Visible.style.display = 'none';
                    // CF_Item0010_Visible.style.display = 'none';
                    //CF_Item0011_Visible.style.display = "none";
                    //CF_Item0012_Visible.style.display = 'none';
                    //CF_Item0013_Visible.style.display = 'none';
                    //CF_Item0014_Visible.style.display = 'none';
                    CF_Item0015_Visible.style.display = 'none';
                    CF_Item0016_Visible.style.display = 'none';
                    CF_Item0017_Visible.style.display = 'none';
                    CF_Item0018_Visible.style.display = "";//暫停/恢復
                    getDetail_S_ID();////取得暫停/恢復欄位(案件)[ID]
                    getDetail_S_Name();//取得暫停/恢復欄位(案件)[名稱]
                    getDetail_S_tag(); //取得暫停/恢復欄位(狀況)
                    getDetail_S_Date();//取得暫停/恢復欄位(日期)
                    CF_Item0019_Visible.style.display = 'none';
                    //CF_Item0020_Visible.style.display = 'none';
                }
                //轉換老師
                else if (json.CF_item == "0010") {
                    CF_Item0001_Visible.style.display = "none";
                    CF_Item0002_Visible.style.display = 'none';
                    CF_Item0003_Visible.style.display = 'none';
                    CF_Item0004_Visible.style.display = 'none';
                    CF_Item0005_Visible.style.display = 'none';
                    CF_Item0006_Visible.style.display = 'none';
                    CF_Item0007_Visible.style.display = 'none';
                    CF_Item0008_Visible.style.display = 'none';
                    CF_Item0009_Visible.style.display = 'none';
                    //CF_Item0010_Visible.style.display = 'none';
                    //CF_Item0011_Visible.style.display = "none";
                    //CF_Item0012_Visible.style.display = 'none';
                    //CF_Item0013_Visible.style.display = 'none';
                    //CF_Item0014_Visible.style.display = 'none';
                    CF_Item0015_Visible.style.display = 'none';
                    CF_Item0016_Visible.style.display = 'none';
                    CF_Item0017_Visible.style.display = 'none';
                    CF_Item0018_Visible.style.display = 'none';
                    CF_Item0019_Visible.style.display = '';
                    //CF_Item0020_Visible.style.display = 'none';
                }
                //其他
                else if (json.CF_item == "0011") {
                    CF_Item0001_Visible.style.display = "none";
                    CF_Item0002_Visible.style.display = 'none';
                    CF_Item0003_Visible.style.display = 'none';
                    CF_Item0004_Visible.style.display = 'none';
                    CF_Item0005_Visible.style.display = 'none';
                    CF_Item0006_Visible.style.display = 'none';
                    CF_Item0007_Visible.style.display = 'none';
                    CF_Item0008_Visible.style.display = 'none';
                    CF_Item0009_Visible.style.display = 'none';
                    //CF_Item0010_Visible.style.display = 'none';
                    //CF_Item0011_Visible.style.display = "none";
                    //CF_Item0012_Visible.style.display = 'none';
                    //CF_Item0013_Visible.style.display = 'none';
                    //CF_Item0014_Visible.style.display = 'none';
                    CF_Item0015_Visible.style.display = 'none';
                    CF_Item0016_Visible.style.display = 'none';
                    CF_Item0017_Visible.style.display = 'none';
                    CF_Item0018_Visible.style.display = 'none';
                    CF_Item0019_Visible.style.display = 'none';
                    CF_Item0020_Visible.style.display = '';
                }
                //20230627簽核明細按鈕判斷
                const btn_U_Leader_OK = document.getElementById('U_Leader_OK');
                const btn_U_Leader_NO = document.getElementById('U_Leader_NO');
                const btn_EX_OK = document.getElementById('EX_OK');
                const btn_EX_NO = document.getElementById('EX_NO');
                const btn_EXLeader_OK = document.getElementById('EXLeader_OK');
                const btn_EXLeader_NO = document.getElementById('EXLeader_NO');
                //alert(btn_U_Leader_OK.style);
                //alert('removeAttribute');
                //加入判斷條件(20230627刪除簽核功能)
                //if()
                //簽核單位主管
                //
                if (F_Status = "1" || json.U_LeaderStatus == "1" || json.EX_Status != "1" || (json.U_Mdep == "0003" || json.U_Mdep == "0004")) {
                    btn_U_Leader_OK.removeAttribute("disabled");//刪除停用[核准]功能
                    btn_U_Leader_NO.removeAttribute("disabled");//刪除停用[退回]功能
                }
                ////行政人員
                //if (F_Status = "1" && json.U_LeaderStatus == "1" && json.EX_Status != "1" && (json.U_Mdep == "0003" || json.U_Mdep == "0004")) {
                //20230630
                btn_EX_OK.removeAttribute("disabled");//刪除停用[核准]功能
                btn_EX_NO.removeAttribute("disabled");//刪除停用[退回]功能
                //}
                //加入判斷條件(20230627刪除簽核功能)
                ////行政主管
                //EX_LeaderStatus
                if (F_Status = "1" || json.U_LeaderStatus == "1" || json.EX_Status == "1" || json.EX_LeaderStatus != "1" && (json.U_Mdep = "0003" || json.U_Mdep == "0004")) {
                    btn_EXLeader_OK.removeAttribute("disabled");//刪除[核准]功能
                    btn_EXLeader_NO.removeAttribute("disabled");//刪除[退回]功能
                }
                //////////////////////////////////////////////////////////
                //加入判斷條件(20230627刪除簽核功能)
                //if (F_Status = "1" && U_LeaderStatus == "1" && EX_Status != "1" && (U_MDEP = "0003" || U_MDEP == "0004")) {
                //$('.U_Leader_OK').removeAttr("disabled");//暫停簽核單位主管簽核功能
                //$('.U_Leader_NO').removeAttr("disabled");//暫停簽核單位主管退回功能
                //}
                //入會方式欄位決定
                //if (json.T_Type = "0001") {
                //    elem1.style.visibility = 'visible';
                //    elem2.style.visibility = 'hidden';
                //    elem3.style.visibility = 'hidden';
                //    text_M("#bcdT_Type", "一般件");//分析師中文名稱
                //}
                //else if (json.T_Type = "0002") {
                //    elem1.style.visibility = 'hidden';
                //    elem2.style.visibility = 'visible';
                //    elem3.style.visibility = 'hidden';
                //    text_M("#bcdT_Type", "會場件");//分析師中文名稱
                //    text_M("#bcdV_ID", json.V_ID);
                //    text_M("#bcdV_Name", json.V_Name);
                //}
                //else if (json.T_Type = "0003") {
                //    elem1.style.visibility = 'hidden';
                //    elem2.style.visibility = 'hidden';
                //    elem3.style.visibility = 'visible';
                //    text_M("#bcdT_Type", "特殊件：");//入會方式
                //    text_M("#bcdSpecial1_userName", json.Special1_userName);
                //    text_M("#bcdT_accountmoney1", json.T_accountmoney1);
                //    text_M("#bcdSpecial2_userName", json.Special2_userName);
                //    text_M("#bcdT_accountmoney2", json.T_accountmoney2);
                //    text_M("#bcdSpecial3_userName", json.Special3_userName);
                //    text_M("#bcdT_accountmoney3", json.T_accountmoney3);
                //    //入帳資訊欄位決定
                //    //Add_USER_Name
                //    ////alert('顯示案件修改明細資料20230206!!');//getBusinessConnectionUpdateDetail
                //    //會員種類
                //    getBusinessConnectionDataEditRecord(json.M_ID);////案件修改明細資料getBusinessConnectionDataEditRecord
                //    ////alert('/*進行畫面資料綁定!!!*/');
                //    //20230203進行畫面資料綁定!
                //    //  ajax_M(BusinessConnectionHandlerUrl_G, data, success);

                //};
                //////alert("Start:" + json.PT_ITEM);

                //if (json.INV_Item = 2) {
                //    // //alert('json.INV_Item = 2');
                //    elem6.style.visibility = 'visible';
                //}
                //else {
                //    // //alert('json.INV_Item != 2');
                //}

                ////入帳資訊欄位決定
                //if (json.PT_ITEM = "0004") {
                //    ////alert(json.PT_ITEM);
                //    // //alert("PT_ITEM=44444");
                //    //PT_ItemN1_visible.style.display = "none";
                //    PT_ItemN1_visible.style.display = "table-row";
                //    //elem3.style.visibility = 'hidden';
                //    //elem5.style.visibility = 'visible';
                //    //text_M("#bcdT_Type", "一般件");//分析師中文名稱
                //}
                //else if (json.PT_ITEM = "0002") {
                //    ////alert(json.PT_ITEM);
                //    ////alert("PT_ITEM=2");
                //    //PT_ItemN1_visible.style.display = "none";
                //    PT_ItemN2_visible.style.display = "table-row";
                //    //elem3.style.visibility = 'hidden';
                //    //elem5.style.visibility = 'visible';
                //    text_M("#bcdT_Type", "一般件");//分析師中文名稱
                //}
                //else {
                //    //alert("PT_ITEM=" + json.PT_ITEM);
                //    PT_ItemN1_visible.style.display = "table-row";
                //    //PT_ItemN2_visible.style.display = "none";
                //}


                //電子委任欄位決定
                if (json.ca_id !== null && json.ca_id != 0) {//顯示電子委任欄位
                    ////alert(json.ca_id);
                    //alert('(json.ca_is not null and id not 0');
                    // //alert(json.ca_id);
                    //alert("顯示電子委任欄位");
                    //CF_Item0014_Visible.style.display = "table-row";
                }

                else {//不顯示電子委任欄位
                    ////alert(json.ca_id);
                    //alert('json.ca_id is null');
                    //alert("不顯示電子委任欄位");
                    // //alert(json.ca_id);
                };

            };
            var error = function (e) { Log_M("getBusinessConnectionDetail error=" + e); unBlockUI_M(); };
            ajax_M(BusinessConnectionHandlerUrl_G, data, success, error);
        };
        //顯示案件修改明細資料(20230204進度)
        var getBusinessConnectionUpdateDetail = function () {
            ////alert('取得業務聯絡單明細2');
            var data = "f_id=" + f_id_G + "&M_ID=" + M_ID + "&action=getBusinessConnectionDetail";//20230202修改!!!
            var success = function (back) {
                /*進行畫面資料綁定*/
                console.log("back===" + back);
                var json = jsonParse_M(back);
                ////alert('/*進行畫面資料綁定!!!*/');
                text_M("#bcdCF_Item", json.CF_item_Name);//聯絡單種類
                ////alert('顯示案件修改明細資料!!');//getBusinessConnectionUpdateDetail
                //會員種類
                //alert("手機:" + json.cellphone);
                text_M("#bcdCellPhone", json.cellphone);
                ////alert('/*進行畫面資料綁定!!!*/');
                //20230203進行畫面資料綁定!
                //  ajax_M(BusinessConnectionHandlerUrl_G, data, success);

            };
            var error = function (e) { Log_M("getBusinessConnectionDetail error=" + e); unBlockUI_M(); };
            ajax_M(BusinessConnectionHandlerUrl_G, data, success, error);
        };
        //顯示簽核明細資料
        var signingRecordDataDetail = function () {
            ////alert('取得簽核明細資料');
            var data = "f_id=" + f_id_G + "&M_ID=" + M_ID + "&action=getsigningRecordDataDetail";//20230202修改!!!
            var success = function (back) {
                /*進行畫面資料綁定*/
                console.log("back===" + back);
                var json = jsonParse_M(back);
                ////alert('/*進行畫面資料綁定!!!*/');
                text_M("#bcdCF_Item", json.CF_item_Name);//聯絡單種類
                ////alert('顯示案件修改明細資料!!');//getBusinessConnectionUpdateDetail
                //會員種類
                //alert("手機:" + json.cellphone);
                text_M("#bcdCellPhone", json.cellphone);
                ////alert('/*進行畫面資料綁定!!!*/');
                //20230203進行畫面資料綁定!
                //  ajax_M(BusinessConnectionHandlerUrl_G, data, success);

            };
            var error = function (e) { Log_M("getBusinessConnectionDetail error=" + e); unBlockUI_M(); };
            ajax_M(BusinessConnectionHandlerUrl_G, data, success, error);
        };
        //按下簽核紐(20230724work)
        var signStatus = function () {
            alert('//按下簽核紐(核准變動)');
            //按下簽核的角色
            //[U_Leader]:簽核單位主管
            //[EX]:行政人員
            //[EXLeader]:行政主管
            var srEX_Leader_Ps_Text = document.getElementById('srEX_Leader_Ps').value;
            alert("備註Value:" + srEX_Leader_Ps_Text);
            Log_M("signStatus start");
            var timeType = attr_M(this, "timeType");
            var signerType = attr_M(this, "signerType");//按下簽核的角色
            var add_user_Unum = attr_M(this, "add_user_Unum");
            //簽核單位主管U_LeaderStatus
            //行政人員EX_Status
            //行政主管:EX_LeaderStatus
            var signerNameType = attr_M(this, "signerNameType");//EX_LeaderName
            var signerStatusType = attr_M(this, "signerStatusType");//EX_LeaderStatus
            var psType = attr_M(this, "psType");//EXL_Ps
            var ps = val_M("#sr" + psType);//EXL_Ps
            //var CaseType = text_M("#bcdCase");//聯絡單種類
            var T_Type = text_M("#bcdT_Type");//入會方式
            var status = attr_M(this, "status");//1:核准,2:退回//1
            var f_id = text_M("#bcdf_id");//單號1
            var add_ip = IP_M;//""
            var M_Name = text_M("#bcdM_Name");//客戶姓名
            var type = text_M("#bcdCase");//聯絡單種類(入會)
            var Add_userName = text_M("#bcdAdd_userName");//提案者姓名



            //
            var srL_Ps1_Text = document.getElementById("srL_Ps1").value;//[簽核單位主管]取得[備註]值
            var srEX_Leader_Ps_Text = document.getElementById("srEX_Leader_Ps").value;//[行政主管]取得[備註]值
            var srL_Ps3_Text = document.getElementById("srL_Ps3").value;//[行政人員]取得[備註]值
            var signerType = attr_M(this, "signerType");//按下簽核的角色[U_Leader][EX][EXLeader]
            //加入判斷簽核的角色!!!!!20230719work
            var signerTypetTxt = "";
            var com = '<%= Session["ComID"] %>';//HG01
            alert("公司:" + com);
            alert("簽核紐!!!!備註Value:" + srL_Ps3_Text);
            alert('//按下簽核紐2');
            var srL_Ps3_Text = document.getElementById("srL_Ps3").value;
            alert("簽核紐2備註Value:" + srL_Ps3_Text);
            alert('//按下簽核紐2');
            var tr = $(this).closest('tr');
            var amount = tr.find('td:eq(1)').find('input').val();
            var unitPrice = tr.find('td:eq(2)').text();
            var temp = tr.find('td:eq(3)').find('input');
            amount = parseInt(amount, 10);
            unitPrice = parseInt(unitPrice, 10);
            temp.val(amount * unitPrice);
            Log_M("signStatus start");
            var timeType = attr_M(this, "timeType");
            var signerType = attr_M(this, "signerType");//簽核角色//OK
            alert("簽核角色signerType:" + signerType);
            var signerNameType = attr_M(this, "signerNameType");//簽核者員工姓名OK
            alert("signerNameType:" + signerNameType);
            var signerStatusType = attr_M(this, "signerStatusType");//OK
            var timeType = attr_M(this, "timeType");//OK
            var psType = attr_M(this, "psType");//OK
            var ps = val_M("#sr" + psType);
            var status = attr_M(this, "status");
            var bcdPS = text_M("#bcdPS");//備註
            alert("備註:" + bcdPS);
            var f_id = text_M("#bcdf_id");//單號
            var type = text_M("#bcdCase");//聯絡單種類
            var add_ip = IP_M;
            var M_Name = text_M("#bcdM_Name");
            alert("單號:" + f_id);
            alert("聯絡單種類:" + type)
            //var bcdCase_Type = text_M("#bcdCase_Type");
            //var bcdT_Type = text_M("#bcdT_Type");
            ///$("#U_Num").val();
            //$("#U_Num").val();
            //var u_Num = $("#U_Num").val();
            //var bcdCase_Type = $("#bcdCase").val();// $('#CN_NAME').val();
            //alert("聯絡單種類:" + bcdCase_Type);
            //傳入給簽核功能的參數(20230525WORK!!!)
            //簽核單位主管
            if (signerType == "U_Leader") {
                alert("簽核的角色[簽核單位主管核准變動]");
                signerTypetTxt = "簽核單位主管核准變動";
                var data = "f_id=" + f_id
                    + "&type" + type
                    + "&signerStatusType=" + signerStatusType
                    + "&status=" + status
                    + "&psType=" + psType
                    + "&L_ps" + srL_Ps1_Text
                    + "&U_LeaderStatus=" + 1
                    + "&signerType=" + signerType
                    + "&signerNameType=" + signerNameType
                    + "&U_Num=" + U_Num_M
                    + "&U_Name=" + U_Name_M
                    + "&timeType=" + timeType
                    + "&add_ip=" + add_ip
                    + "&M_Name=" + M_Name
                    + "&add_User=" + add_User
                    + "&MENU_no=" + MENU_no_G
                    + "&U_LeaderStatus=" + 1
                    + "&action=signStatus";
                //alert(data);
                Log_M(data);
                var success = function (back) {
                    Log_M("signStatus back=" + back);
                    if (back == "成功") {
                        alert("簽核成功");
                        location.reload();
                    }
                    unBlockUI_M();
                };
                var error = function (e) { Log_M("signStatus error=" + e); unBlockUI_M(); };
                ajax_M(BusinessConnectionHandlerUrl_G, data, success, error);
            }
            else if (signerType == "EX") {
                alert("簽核的角色[行政人員核准變動]");
                signerTypetTxt = "行政人員核准變動";
                var data = "f_id=" + f_id
                    + "&type" + type
                    + "&signerStatusType=" + signerStatusType
                    + "&status=" + status
                    + "&psType=" + psType
                    + "&ex_ps=" + srL_Ps3_Text
                    + "&EX_Status=" + 1
                    + "&EX=" + U_Num_M
                    //+ "&EX_Com=" + 
                    //+ "&EX_PS=" + EX_Ps
                    + "&signerType=" + signerType
                    + "&signerNameType=" + signerNameType
                    + "&U_Num=" + U_Num_M
                    + "&U_Name=" + U_Name_M
                    + "&timeType=" + timeType
                    + "&add_ip=" + add_ip
                    + "&M_Name=" + M_Name
                    + "&add_User=" + add_User
                    + "&MENU_no=" + MENU_no_G
                    + "&action=signStatus";
                //alert(data);
                Log_M(data);
                var success = function (back) {
                    Log_M("signStatus back=" + back);
                    if (back == "成功") {
                        alert("簽核成功");
                        location.reload();
                    }
                    unBlockUI_M();
                };
                var error = function (e) { Log_M("signStatus error=" + e); unBlockUI_M(); };
                ajax_M(BusinessConnectionHandlerUrl_G, data, success, error);
            }
            else if (signerType == "EX_Leader") {
                alert("簽核的角色[行政主管核准變動]");
                signerTypetTxt = "行政主管核准變動";
                var data = "f_id=" + f_id
                    + "&type" + type
                    + "&signerStatusType=" + signerStatusType
                    + "&status=" + status
                    + "&psType=" + psType
                    + "&ps=" + srEX_Leader_Ps_Text
                    + "&EX_LeaderStatus=" + 1
                    + "&EX_Leader=" + U_Num_M
                    + "&EXL_PS=" + EXL_PS
                    + "&signerNameType=" + signerNameType
                    + "&U_Num=" + U_Num_M
                    + "&U_Name=" + U_Name_M
                    + "&timeType=" + timeType
                    + "&add_ip=" + add_ip
                    + "&M_Name=" + M_Name
                    + "&add_User=" + add_User
                    + "&MENU_no=" + MENU_no_G
                    + "&EX_LeaderStatus=" + 1
                    + "&action=signStatus";
                //alert(data);
                Log_M(data);
                var success = function (back) {
                    Log_M("signStatus back=" + back);
                    if (back == "成功") {
                        alert("簽核成功");
                        location.reload();
                    }
                    unBlockUI_M();
                };
                var error = function (e) { Log_M("signStatus error=" + e); unBlockUI_M(); };
                ajax_M(BusinessConnectionHandlerUrl_G, data, success, error);
            }
            alert("簽核的角色:" + signerTypetTxt);
           
           
            var data = "f_id=" + f_id
                + "&type" + type
                + "&signerStatusType=" + signerStatusType
                + "&status=" + status
                + "&psType=" + psType
                + "&ps=" + ps
                + "&signerType=" + signerType
                + "&signerNameType=" + signerNameType
                + "&U_Num=" + U_Num_M
                + "&U_Name=" + U_Name_M
                + "&timeType=" + timeType
                + "&add_ip=" + add_ip
                + "&M_Name=" + M_Name
                + "&add_User=" + add_User
                + "&MENU_no=" + MENU_no_G
                + "&action=signStatus";
            //alert(data);
            Log_M(data);
            var success = function (back) {
                Log_M("signStatus back=" + back);
                if (back == "成功") {
                    alert("簽核成功");
                    location.reload();
                }
                unBlockUI_M();
            };
            var error = function (e) { Log_M("signStatus error=" + e); unBlockUI_M(); };
            ajax_M(BusinessConnectionHandlerUrl_G, data, success, error);
            alert('按下簽核紐!!!');
            //////////////////////////////

            //var srEX_Leader_Ps_Text = document.getElementById(srEX_Leader_Ps).value;
            //alert("備註Value:" + srEX_Leader_Ps_Text);
            //Log_M("signStatus start");
            //var timeType = attr_M(this, "timeType");
            //var signerType = attr_M(this, "signerType");//按下簽核的角色
            //var add_user_Unum = attr_M(this, "add_user_Unum");
            ////簽核單位主管U_LeaderStatus
            ////行政人員EX_Status
            ////行政主管:EX_LeaderStatus
            //var signerNameType = attr_M(this, "signerNameType");//EX_LeaderName
            //var signerStatusType = attr_M(this, "signerStatusType");//EX_LeaderStatus
            //var psType = attr_M(this, "psType");//EXL_Ps
            //var ps = val_M("#sr" + psType);//EXL_Ps
            ////var CaseType = text_M("#bcdCase");//聯絡單種類
            //var T_Type = text_M("#bcdT_Type");//入會方式
            //var status = attr_M(this, "status");//1:核准,2:退回//1
            //var f_id = text_M("#bcdf_id");//單號1
            //var add_ip = IP_M;//""
            //var M_Name = text_M("#bcdM_Name");//客戶姓名
            //var type = text_M("#bcdCase");//聯絡單種類(入會)
            //var Add_userName = text_M("#bcdAdd_userName");//提案者姓名

            //////alert("提案者姓名" + Add_userName);
            ////var data = "f_id=" + f_id + "&signerStatusType=" + signerStatusType + "&status=" + status + "&psType=" + psType + "&ps=" + ps + "&signerType=" + signerType + "&signerNameType=" + signerNameType + "&U_Num=" + U_Num_M + "&U_Name=" + U_Name_M + "&timeType=" + timeType + "&add_ip=" + add_ip + "&M_Name=" + M_Name + "&MS_Receiver=" + add_User_G + "&action=signStatus";
            var data = "f_id=" + f_id + "&CaseType=" + type + "&signerStatusType=" + signerStatusType + "&status=" + status + "&psType=" + psType + "&ps=" + ps + "&signerType=" + signerType + "&signerNameType=" + signerNameType + "&U_Num=" + U_Num_M + "&U_Name=" + U_Name_M + "&timeType=" + timeType + "&add_ip=" + add_ip + "&M_Name=" + M_Name + "&MS_Receiver=" + add_User_G + "&T_Type=" + type + "&timeType=" + timeType + "&add_ip=" + add_ip + "&MS_Receiver=" + add_User_G + "&T_Type=" + T_Type + "&Add_userName=" + Add_userName + "&action=signStatus";
            var success = function (back) {
                Log_M("signStatus back=" + back);
                if (back == "成功") {
                    alert("簽核成功");
                    location.reload();
                }
                unBlockUI_M();
            };
            var error = function (e) { Log_M("signStatus error=" + e); unBlockUI_M(); };
            ajax_M(BusinessConnectionHandlerUrl_G, data, success, error);
        };
        function EX_OK() {
            alert("EX_OK");
        }


        var startThisPage = function () {

            getBusinessConnectionDetail();//取得業務聯絡單明細
            //getBusinessConnectionDataEditRecord();//案件修改紀錄資料
            onClick_M("EX_OK", EX_OK);
            //頁面下方的頁面切換
            onClick_M(".tabChange", tabChange);
            onClick_M(".signStatus", signStatus);
            //設定權限
            ////alert('設定權限');
            //setPermission_M();
        };


        //PAGE開始
        $(function () {
            //blockUI_M();
            //checkUnum_M();
            startThisPage();
            //var test = U_Num_M;
            //alert(test);
            //查看權限
            //getUserAuthority_M(startThisPage);
        });

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

