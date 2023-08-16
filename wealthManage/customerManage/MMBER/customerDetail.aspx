<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customerDetail.aspx.cs" Inherits="wealthManage_customerManage_MMBER_customerDetail" %>

<!DOCTYPE html>

<html>
<head>
    <!--<meta charset="UTF-8">-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title id="title"></title>
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
    <link href="<%=getRelativePath()%>plugins/jQueryUI/CSS/jquery-ui-1.10.4.custom.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <style type="text/css" style="font-size: 25px">
        #newBtnDiv {
            margin-left: 20px;
            margin-right: 20px;
            margin-top: 20px;
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

        .detailHead {
            background-color: #f4f4f4;
        }

        .textAlignCenter {
            text-align: center;
        }

        td {
            font-size: 25px;
            border-right: 1px solid #ddd;
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
            font-size: 25px;
        }

        #addBusinessConnectionDiv {
            font-size: 25px;
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
            margin-top: 5px;
        }

        .bgColor {
            background-color: #ddd;
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
            font-size: 20px;
        }

        #customerDetail {
            font-size: 20px;
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

        #topTable {
            margin-bottom: -35px;
        }

        .colorGray {
            background-color: #f4f4f4;
            border-bottom: 1px solid white;
        }

        .colorGrayBottom {
            background-color: #f4f4f4;
        }

        .colorBlack {
            color: black;
        }

        .linkBlue {
            color: #3c8dbc;
        }

        .ui-widget-content a {
            color: #3c8dbc;
        }

        .displayInlineBlock {
            display: inline-block;
        }

        .colorGreen {
            color: green;
        }

        .openConnetTypeDiv0001InnerDIV {
            padding-left: 0px;
        }
        /*
            stylebutton
        */
    </style>
</head>
<body style="font-family: Microsoft JhengHei;">
    <!-- jQuery 2.1.3 -->
    <script src="<%=getRelativePath()%>plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- jQuery 2.1.3 -->
    <script src="<%=getRelativePath()%>plugins/jQueryUI/jquery.blockUI.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="<%=getRelativePath()%>js/HG.js" type="text/javascript"></script>
    <script src="<%=getRelativePath()%>js/common/Common.js" type="text/javascript"></script>
    <script src="<%=getRelativePath()%>js/common/CommonTool.js" type="text/javascript"></script>

    <script src="<%=getRelativePath()%>js/MasterPage.js" type="text/javascript"></script>

    <div id="uploadFileDialog" class="tabDivMargin startHide form-control" title="檔案管理">
        <table class="table" id="">

            <tbody id="">
                <tr>
                    <td>
                        <form runat="server">
                            <asp:FileUpload type="file" ID="File1" class="form-control uploadFileCheck  upLoadGroup" ClientIDMode="Static" runat="server" />
                            <asp:FileUpload type="file" ID="File2" class="form-control uploadFileCheck  upLoadGroup" ClientIDMode="Static" runat="server" />
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button type="button" class="btn" id="uploadFile">新增</button>
                    </td>
                </tr>
            </tbody>
        </table>

    </div>
    <!-- CDDevaluationDialog start -->
    <div id="CDDevaluationDialog" class="tabDivMargin startHide form-control" title="自然人評估表-新增">
        <table class="table">

            <tr class="">
                <td class="textAlignCenter colorGray"><b>評估日期</b></td>
                <td class="textAlignLeft" colspan="9">
                    <input class="form-control datepicker cddEmptyCheck" id="CDD_date" itemname="評估日期" /></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>政治人員</b></td>
                <td class="textAlignLeft" colspan="9">
                    <select id="OP01" class="form-control">
                        <option value="C">低風險</option>
                        <option value="B">一般</option>
                        <option value="A">高風險</option>
                    </select></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>國籍別</b></td>
                <td class="textAlignLeft" colspan="9">
                    <select id="OP02" class="form-control">
                        <option value="C">低風險</option>
                        <option value="B">一般</option>
                        <option value="A">高風險</option>
                    </select></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>職業別</b></td>
                <td class="textAlignLeft" colspan="9">
                    <select id="OP03" class="form-control">
                        <option value="C">低風險</option>
                        <option value="B">一般</option>
                        <option value="A">高風險</option>
                    </select></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>建立業務管道</b></td>
                <td class="textAlignLeft" colspan="9">
                    <select id="OP04" class="form-control">
                        <option value="C">低風險</option>
                        <option value="B">一般</option>
                        <option value="A">高風險</option>
                    </select></td>
            </tr>

            <tr class="">
                <td class="textAlignCenter colorGray"><b>備註</b></td>
                <td class="textAlignLeft" colspan="9">
                    <textarea id="CDD_Note" class="form-control"></textarea></td>
            </tr>
            <tr class="">

                <td class="textAlignLeft" colspan="12">
                    <div style="text-align: center">
                        <button id="cddAddData" type="button" class="btn btn-primary btn-flat form-control">新增資料</button>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <!--cdd end-->
    <%--[選擇委任資料]新增視窗--%>
    <div id="appointDataDialog" class="tabDivMargin startHide form-control" title="委任資料">
        <table class="table" id="">
            <thead>
                <tr class="detailHead" id="">
                    <th class="textAlignCenter brWhite">序</th>
                    <th class="textAlignCenter brWhite">客名</th>
                    <th class="textAlignCenter">產品內容</th>
                    <th class="textAlignCenter">金額</th>
                    <th class="textAlignCenter">會期</th>
                </tr>
            </thead>
            <tbody id="appointDataTb"></tbody>
        </table>
    </div>
    <%--[暫停/恢復資料]新增視窗--%>
    <div id="appointDataDialog2" class="tabDivMargin startHide form-control" title="暫停/恢復資料">
        <table class="table" id="" onmouseover="this.style.backgroundColor='#EEEEEE';" onmouseout="this.style.backgroundColor='#FFFFFF';">
            <thead>
                <tr class="detailHead" id="">
                    <th class="textAlignCenter brWhite">入會日期</th>
                    <th class="textAlignCenter brWhite">到期日期</th>
                    <th class="textAlignCenter">案件編號</th>
                    <th class="textAlignCenter">會員種類</th>
                    <th class="textAlignCenter">入會金額</th>
                </tr>
            </thead>
            <tbody id="appointDataTb2"></tbody>
        </table>

    </div>

    <div id="appointDataDialog3" class="tabDivMargin startHide form-control ui-dialog-content ui-widget-content" title="請選擇折讓案件">
        <table class="table" id="">
            <thead>
                <tr class="detailHead" id="">
                    <th class="textAlignCenter brWhite">入會日期</th>
                    <th class="textAlignCenter brWhite">到期日期</th>
                    <th class="textAlignCenter">案件編號</th>
                    <th class="textAlignCenter">會員種類</th>
                    <th class="textAlignCenter">入會金額</th>
                </tr>
            </thead>
            <tbody id="appointDataT3"></tbody>
        </table>

    </div>

    <div id="appointDataDialog4" class="tabDivMargin startHide form-control ui-dialog-content ui-widget-content" title="請選擇退費案件">
        <table class="table" id="">
            <thead>
                <tr class="detailHead" id="">
                    <th class="textAlignCenter brWhite">入會日期</th>
                    <th class="textAlignCenter brWhite">到期日期</th>
                    <th class="textAlignCenter">案件編號</th>
                    <th class="textAlignCenter">會員種類</th>
                    <th class="textAlignCenter">入會金額</th>
                </tr>
            </thead>
            <tbody id="appointDataT4"></tbody>
        </table>

    </div>

    <div id="tagHistoryTabDialog" class="tabDivMargin startHide form-control" title="公司資源註記1 - 歷史資料 ">
        <table class="table" id="tagHistoryTab">
            <thead>
                <tr class="detailHead" id="tagHistoryHead">
                    <th class="textAlignCenter brWhite">序 </th>
                    <th class="textAlignCenter brWhite">註記日期</th>
                    <th class="textAlignCenter">註記人員</th>
                    <th class="textAlignCenter">註記種類</th>
                </tr>
            </thead>
            <tbody id="tagHistoryTb"></tbody>
        </table>
    </div>


    <div style="margin-right: 0 auto; text-align: right;" id="newBtnDiv">
        <button id="" type="button" class="btn btn-primary btn-flat openDiv" opendivname='#customerDetailTabDiv' style="display: none">客戶資料明細表</button>
        <button id="" type="button" class="btn btn-primary btn-flat openDiv" opendivname='#addBusinessConnectionDiv'>新增業務聯絡單</button>
        <button id="openAddPayCashFlowAndAppointSignDialog" type="button" class="btn btn-primary btn-flat addPer">新增付費&委任簽署</button>
        <button id="" type="button" class="btn btn-primary btn-flat openDiv editPer" opendivname='#eCustomerDetailTabDiv'>修改基本資料</button>
        <button id="envelopePrint" type="button" class="btn btn-primary btn-flat">信封列印</button>
    </div>
    <%--業務聯絡單-新增畫面--%>
    <div id="addBusinessConnectionDiv" class="tabDivMargin3 divBorder startHide secondDiv">
        <div id="" class="titleBottomBorder marginLeftRight10">
            <h3><span class="colorRed">業務聯絡單-新增</span></h3>
            <div class="btn-group" data-toggle="btn-toggle" style="margin-right: 0 auto; float: right;">
                <button id="" type="button" class="btn closeBtn btn-flat closeDiv" opendivname="#addBusinessConnectionDiv">X</button>
            </div>
        </div>


        <%--客戶資料--%>
        <div id="Type1" class="form-group row">
            <%--客戶資料--%>
            <div class="col-xs-6">
                <label for="abcConnectType" class=""><span class="colorRed">*</span>客戶資料：</label>
                <label class="">
                    <select id="abcM_ID" class="form-control EAgroup addLeaveRequired" disabled="disabled"></select>
                </label>
            </div>
        </div>
        <%--聯絡單種類--%>
        <div id="Type25" class="form-group row">
            <div class="col-xs-6">
                <label for="abcConnectType" class=""><span class="colorRed">*</span>聯絡單種類：</label>
                <label class="">
                    <select id="abcCF_Item" class="form-control EAgroup abcCF_Item EAgroup addLeaveRequired" itemname="聯絡單種類"></select>
                </label>
            </div>

        </div>
        <%--入會方式--%><%--業績種類--%><%--入帳資訊--%><%--入會時間--%>
        <div id="Type2" class="form-group row startHide">
            <%--入會方式--%>

            <div class="col-xs-6">
                <label for="" class=""><span class="colorRed">*</span>入會方式：</label>
                <label class="">
                    <select id="abcT_Type" class="form-control T_Type CF_Item0001EmptyCheck" itemname="入會方式">
                        <option value="0001">一般</option>
                        <option value="0002">會場</option>
                        <option value="0003">特殊</option>
                    </select>
                </label>
            </div>
            <%--分析師--%>
            <div class="col-xs-2">
                <label for="" class=""><span class="colorRed">*</span>分析師：</label>
                <label class="">
                    <select id="abcMP_ID" class="form-control  CF_Item0001EmptyCheck" itemname="分析師">
                    </select>
                </label>
            </div>
            <%--會員種類--%>
            <div class="col-xs-6">
                <label for="" class=""><span class="colorRed">*</span>會員種類：</label>
                <label class="">
                    <select id="abcMP_Item" class="form-control   CF_Item0001EmptyCheck" itemname="會員種類">
                        <option value="">請選擇</option>
                    </select>
                </label>

                <%--業績種類--%>
                <div class="form-group row ">
                    <div class="col-xs-6">
                        <label for="" class=""><span class="colorRed">*</span>業績種類：</label>
                        <label class="">
                            <select id="abcResults_Item" class="form-control">
                                <option value="0001">一般件</option>
                                <option value="0002">獎勵件</option>
                            </select>
                        </label>
                    </div>
                </div>
            </div>

            <%--入帳資訊--%>
            <div class="form-group row ">
                <%--入帳資訊--%>
                <%--單筆--%>
                <div class="form-group row">
                    <div class="col-xs-6">
                        <label for="" class=""><span class="colorRed">*</span>入帳資訊：</label>
                        <span>會費：</span>
                        <label class="">
                            <%--<input class="form-control" id="dues" />--%>
                            <input type="text" class="form-control CF_Item0001EmptyCheck" id="Paymoney" itemname="會費">
                        </label>

                        <label class="">
                            <span>付款類型 </span>

                            <label class="">
                                <select id="abcPT_Item" class="form-control">
                                    <option value="1">單筆</option>
                                    <option value="2">多筆</option>
                                </select>
                            </label>
                            <span>付款方式</span>
                            <label class="">
                                <select class="form-control getPayTypeListHtmlTagOption PT_Item1EmptyCheck" id="abcT_PType" itemname="付款方式"></select>
                            </label>
                        </label>
                    </div>
                </div>
                <%--多筆--%>
                <div class="form-group row">
                    <div class="col-xs-6">
                        <span>金額1</span>
                        <label class="">
                            <input class="form-control PT_Item2EmptyCheck" id="abcPaymoney1" disabled="disabled" itemname="金額1" />
                        </label>
                        &nbsp;元
                            <span>付款方式1 </span>
                        <label class="">
                            <select class="form-control getPayTypeListHtmlTagOption PT_Item2EmptyCheck" id="abcT_PType1" disabled="disabled" itemname="付款方式1"></select>
                        </label>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-xs-6">
                        <span>金額2  </span>
                        <label class="">
                            <input class="form-control PT_Item2EmptyCheck" id="abcPaymoney2" disabled="disabled" itemname="金額2" />
                        </label>
                        &nbsp;元
                            <span>付款方式2  </span>
                        <label class="">
                            <select class="form-control getPayTypeListHtmlTagOption PT_Item2EmptyCheck" id="abcT_PType2" disabled="disabled" itemname="付款方式2"></select>
                        </label>
                    </div>
                </div>
                <%--信用卡末四碼--%>
                <div class="form-group row">
                    <div class="col-xs-6">
                        <span>信用卡末四碼 &nbsp;:&nbsp; </span>
                        <label class="">
                            <input class="form-control" id="abcCCard_4Num" />
                        </label>
                    </div>
                </div>
            </div>
            <%--入會時間--%>
            <div class="form-group row">
                <%--   <div class="col-md-4">
                  <span>     <label for="reT_StartDate" class=""><span class="colorRed">*</span>入會日期：</label>
                        <input type="text" class="datepicker form-control CF_Item0001EmptyCheck" id="abcbegindate_Date" itemname="入會日期"></span> 
                    </div>
                    <div class="col-md-6">
                        <label for="reT_EndDate" class=""><span class="colorRed">*</span>到期日期：</label>
                        <input type="text" class="datepicker form-control CF_Item0001EmptyCheck" id="abcenddate_Date" itemname="到期日期">
                    </div>--%>
                <div class="col-xs-6">
                    <label for="" class=""><span class="colorRed">*</span>入會日期：</label>
                    <label class="">
                        <%--<input class="form-control" id="dues" />--%>
                        <input type="text" class="datepicker form-control CF_Item0001EmptyCheck" id="abcbegindate_Date" itemname="入會日期">
                    </label>
                    <label for="" class=""><span class="colorRed">*</span><span>到期日期 </span></label>

                    <label class="">
                        <%-- <select id="abcPT_Item" class="form-control">
                                    <option value="1">單筆</option>
                                    <option value="2">多筆</option>
                                </select>--%>
                        <input type="text" class="datepicker form-control CF_Item0001EmptyCheck" id="abcenddate_Date" itemname="到期日期">
                    </label>
                    <%--</div>--%>

                    <%-- <span>會費</span>
                    <label class="">

                        <input class="form-control  CF_Item0001EmptyCheck" id="abcPaymoney" itemname="會費" />
                    </label>
                    元--%>
                    <%-- <span>付款方式</span>
                            <label class="">
                                <select class="form-control getPayTypeListHtmlTagOption PT_Item1EmptyCheck" id="abcT_PType" itemname="付款方式"></select>
                            </label>--%>
                </div>
            </div>
        </div>
        <%--入帳人員1,2,3--%>
        <div id="Type1666" class="form-group row startHide">
            <%--入帳人員1--%>
            <div class="form-group row ">
                <%--入帳人員1--%>
                <div class="col-ls-14">
                    <label for="" class=""><span class="colorRed">*</span>入帳人員1：</label>
                    <span><span class="colorRed">*</span>公司別 &nbsp;:&nbsp; </span>
                    <label class="">
                        <%-- <select title="Select_Com" id="Select_Com" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc EAgroup addLeaveRequired">--%>
                        <select title="Select_Com_Transfer1" id="Select_Com_Transfer1" class="form-control comMdepChangeFuc_Transfer1 EAgroup addLeaveRequired">
                        </select>
                    </label>
                    <span><span class="colorRed">*</span>部門別 &nbsp;:&nbsp; </span>
                    <label class="">
                        <%--<select title="Select_Dept" id="Select_Dept" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc CF_Item0004" itemname="部門別" com="abcAttach_Com" mdep="abcAttach_MDEP" emp="abcAttach_User">--%>
                        <select title="Select_Dept_Transfer1" id="Select_Dept_Transfer1" class="form-control comMdepChangeFuc_Transfer1 EAgroup addLeaveRequired">
                        </select>
                    </label>

                    <span><span class="colorRed">*</span>姓名  &nbsp;:&nbsp; </span>
                    <label class="">
                        <select id="Select_Employ_Transfer1" class="form-control">
                        </select>
                    </label>
                    <label for="" class=""><span class="colorRed">*</span>入帳金額：</label>

                    <label class="">
                        <%--<input class="form-control" id="dues" />--%>
                        <input type="text" class="form-control CF_Item0001EmptyCheck" id="Paymoney99" itemname="會費">
                    </label>
                    元

                </div>
            </div>
            <%--入帳人員2--%>
            <div class="form-group row ">
                <%--入帳人員2--%>
                <div class="col-xs-14">
                    <label for="" class=""><span class="colorRed">*</span>入帳人員2：</label>
                    <span><span class="colorRed">*</span>公司別 &nbsp;:&nbsp; </span>
                    <label class="">
                        <%-- <select title="Select_Com" id="Select_Com" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc EAgroup addLeaveRequired">--%>
                        <select title="Select_Com_Sign" id="Select_Com_Transfer2" class="form-control comMdepChangeFuc_Transfer2 EAgroup addLeaveRequired">
                        </select>
                    </label>
                    <span><span class="colorRed">*</span>部門別 &nbsp;:&nbsp; </span>
                    <label class="">
                        <%--<select title="Select_Dept" id="Select_Dept" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc CF_Item0004" itemname="部門別" com="abcAttach_Com" mdep="abcAttach_MDEP" emp="abcAttach_User">--%>
                        <select title="Select_Dept_Sign" id="Select_Dept_Transfer2" class="form-control comMdepChangeFuc_Transfer2 EAgroup addLeaveRequired">
                        </select>
                    </label>

                    <span><span class="colorRed">*</span>姓名  &nbsp;:&nbsp; </span>
                    <label class="">
                        <select id="Select_Employ_Transfer2" class="form-control">
                        </select>
                    </label>
                    <label for="" class=""><span class="colorRed">*</span>入帳金額：</label>

                    <label class="">
                        <%--<input class="form-control" id="dues" />--%>
                        <input type="text" class="form-control CF_Item0001EmptyCheck" id="Paymoney100" itemname="會費">
                    </label>
                    元
                </div>
            </div>
            <%--入帳人員3--%>
            <div class="form-group row ">
                <div class="col-xs-14">
                    <label for="" class=""><span class="colorRed">*</span>入帳人員3：</label>
                    <span><span class="colorRed">*</span>公司別 &nbsp;:&nbsp; </span>
                    <label class="">
                        <%-- <select title="Select_Com" id="Select_Com" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc EAgroup addLeaveRequired">--%>
                        <select title="Select_Com_Transfer3" id="Select_Com_Transfer3" class="form-control comMdepChangeFuc_Transfer3 EAgroup addLeaveRequired">
                        </select>
                    </label>
                    <span><span class="colorRed">*</span>部門別 &nbsp;:&nbsp; </span>
                    <label class="">
                        <%--<select title="Select_Dept" id="Select_Dept" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc CF_Item0004" itemname="部門別" com="abcAttach_Com" mdep="abcAttach_MDEP" emp="abcAttach_User">--%>
                        <select title="Select_Dept_Transfer3" id="Select_Dept_Transfer3" class="form-control comMdepChangeFuc_Transfer3 EAgroup addLeaveRequired">
                        </select>
                    </label>

                    <span><span class="colorRed">*</span>姓名  &nbsp;:&nbsp; </span>
                    <label class="">
                        <select id="Select_Employ_Transfer3" class="form-control">
                        </select>
                    </label>
                    <label for="" class=""><span class="colorRed">*</span>入帳金額：</label>

                    <label class="">
                        <%--<input class="form-control" id="dues" />--%>
                        <input type="text" class="form-control CF_Item0001EmptyCheck" id="Paymoney101" itemname="會費">
                    </label>
                    元
                </div>
            </div>
        </div>
        <%--電子委任契約書--%>
        <div id="Type15" class="form-group row startHide ">
            <div class="col-xs-6">
                <label>電子委任契約書：</label>
                <label>
                    <input class="form-control" id="abcca_id" style="width: 300px">
                </label>
                <button type="button" id="abcgetAppointData">選擇客戶資料</button>
            </div>

        </div>
        <%--設定手機--%>
        <div id="Type4" class="form-group row startHide">
            <div class="col-xs-6">
                <label for="" class="">設定手機：</label>
                <label class="">
                    <input id="abcCellPhone" class="form-control CF_Item0002" />
                </label>
            </div>

        </div>
        <%--傳真稿--%>
        <div id="Type44" class="form-group row startHide">
            
            <div class="col-xs-6">
                <label for="" class=""><span class="colorRed">*</span>傳真稿：</label>
                <input type="checkbox" id="fax" name="mess_other2" class="form-check-input" value="1"/>&nbsp;&nbsp;設-網路傳真&nbsp;&nbsp;
                            <label>
                                <select id="fax_item" class="form-control CF_Item0003EmptyCheck" itemname="">
                                    <option value="2">一般</option>
                                    <option value="4">解盤</option>
                                    <option value="5">特別</option>
                                    <option value="6">飆股</option>
                                    <option value="7">專案</option>
                                </select>
                            </label>
                <input type="checkbox" id="mess_other2" name="mess_other2" class="form-check-input" value="2"/>&nbsp;&nbsp;不設&nbsp;&nbsp;
                            
            </div>

        </div>
        <%--設訊--%>
        <div id="Type5" class="form-group row startHide">
            <div class="col-xs-6">
                <label for="" class=""><span class="colorRed">*</span>設訊：</label>
                <input type="checkbox" id="mess_other3" name="mess_other" value="1" class="form-check-input" />&nbsp;&nbsp;設&nbsp;&nbsp;
                        <label for="" class="">
                            <select id="abcMess3" class="form-control">
                                <option value="1">一般</option>
                                <option value="5">解盤</option>
                                <option value="6">特別</option>
                                <option value="7">飆股</option>
                                <option value="10">專案</option>
                            </select>
                        </label>
                <input type="checkbox" id="mess_other4" name="mess_other" value="2" class="form-check-input" />&nbsp;&nbsp;不設&nbsp;&nbsp;
                        
                        &nbsp;<input type="checkbox" id="mess_other5" name="mess_other5" value="3" class="form-check-input" />&nbsp;&nbsp;業務自帶&nbsp;&nbsp;
                        <input type="checkbox" id="mess_other6" name="mess_other6" value="4" class="form-check-input" />&nbsp;&nbsp;特助或行政帶
                    
                        
            </div>


        </div>
        <%--設鎖碼影音--%>
        <div id="Type31" class="form-group row  startHide">
            <div class="col-xs-6">
                <label for="reT_EndDate" class="">設鎖碼影音：</label>
                <label class="">
                    <select id="abcMedia" class="form-control">
                        <option value="1">設</option>
                        <option value="2" selected="selected">不設</option>
                    </select>
                </label>
            </div>
        </div>
        <%--設付費文章--%>
        <div id="Type32" class="form-group row  startHide">
            <div class="col-xs-6">
                <label for="reT_EndDate" class="">設付費文章：</label>
                <label class="">
                    <select id="P_text" class="form-control">
                        <option value="1">設</option>
                        <option value="2" selected="selected">不設</option>
                    </select>
                </label>
            </div>
        </div>
        <%--設付費影片--%>
        <div id="Type33" class="form-group row  startHide">
            <div class="col-xs-6">
                <label for="" class="">設付費影片：</label>
                <label class="">
                    <select id="P_video" class="form-control">
                        <option value="1">設</option>
                        <option value="2" selected="selected">不設</option>
                    </select>
                </label>
            </div>
        </div>
        <%--訂金件--%>
        <div id="Type17" class="form-group row  startHide">
            <div class="col-xs-4">
                <span class="colorRed">*</span><span>訂金件</span>
                <label class="">選擇會場：</label>
                <select class="form-control CF_Item0007" id="abcV_IDandName" itemname="選擇會場"></select>

            </div>
            <div class="col-xs-4">
                <label class=""><span class="colorRed">*</span>訂金金額：</label>
                <input class="form-control CF_Item0007" id="abcVD_paymoney" itemname="訂金金額">
            </div>
            <div class="col-xs-4">
                <label class=""><span class="colorRed">*</span>付款方式：</label>
                <select class="form-control getPayTypeListHtmlTagOption CF_Item0007" id="abcVD_Type" itemname="付款方式"></select>
            </div>

        </div>
        <%--折讓案件--%>
        <div id="Type7" class="form-group row  startHide">

            <div class="col-xs-6">
                <label for="" class=""><span class="colorRed">*</span>折讓案件：</label>
                <label for="S_Tag" class="">
                    <span class="colorRed">*</span>原案件：
                            <button type="button" id="getOriDiscountData">選擇折讓案件</button></label>

                <input class="form-control" id="data1" style="width: 200px"><%--案件編號--%>
                <input class="form-control" id="data2" style="width: 200px"><%--會員種類--%>
                <%-- <button type="button" id="abcgetCaseData2">選擇案件</button>--%>
            </div>


            <div class="col-xs-6">
                <label for="S_Tag" class="">
                    <span class="colorRed">*</span>新案件(分析師)：
                </label>
                <select id="abcD_MP" class="form-control CF_Item0006EmptyCheck" itemname="新案件(分析師)"></select>
            </div>
            <div class="col-xs-6">
                <label for="S_Tag" class="">
                    <span class="colorRed">*</span>新案件(服務項目)：
                </label>
                <select id="abcD_Item" class="form-control CF_Item0006EmptyCheck" itemname="新案件(服務項目)"></select>
            </div>
            <div class="col-xs-6">
                <label for="S_Tag" class="">新會期(始)：</label>
                <label class="">
                    <input id="abcDSdate_Date" class="form-control datepicker CF_Item0006EmptyCheck" itemname="新會期(始)" />
                </label>
            </div>
            <div class="col-xs-6">
                <label for="S_Tag" class="">新會期(終)：</label>
                <label class="">
                    <input id="abcDEdate_Date" class="form-control datepicker CF_Item0006EmptyCheck" itemname="新會期(終)" />
                </label>
            </div>
            <div class="col-xs-12">
                <label for="S_Tag" class="">是否補件：</label>
                <label class="">
                    <%--<select id="abcD_tag" class="form-control CF_Item0006EmptyCheck" itemname="是否補件">--%>
                        -<select id="abcD_tag" class="form-control" itemname="是否補件">
                            <option value="">請選擇</option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                </label>

                <%--</div>
                <div class="col-xs-6">--%>
                <label for="S_Tag" class="">補件金額：</label>
                <label class="">
                    <input id="abcD_Paymoney" class="form-control CF_Item00061EmptyCheck" itemname="補件金額" />
                </label>
                <%-- </div>
                <div class="col-xs-6">--%>
                <label for="S_Tag" class="">付款方式：</label>
                <label class="">
                    <select id="abcD_Type" class="form-control getPayTypeListHtmlTagOption CF_Item00061EmptyCheck" itemname="付款方式">
                    </select>
                </label>
            </div>

        </div>
        <%--暫停/恢復8--%>
        <div id="Type8" class="form-group row  startHide">

            <div class="col-xs-6">
                <label for="" class=""><span class="colorRed">*</span>暫停/恢復：</label>
                <label class="">
                    <select id="P_StartStop" class="form-control">
                        <option value="0">請選擇</option>
                        <option value="1">暫停</option>
                        <option value="2">恢復</option>
                    </select>
                </label>
                <label class="">
                    <%--選擇案件-編號--%>
                    <input id="abcgetCase1" class="form-control CF_Item0002" />
                </label>
                <label class="">
                    <%--選擇案件-名稱--%>
                    <input id="abcgetCase2" class="form-control CF_Item0002" />
                </label>
                <label>案件:</label>
                <button type="button" id="abcgetCaseData3">選擇案件</button>
                <%--  <div class="col-xs-8 " id="abcS_IDandNameDiv">
                            <label for="S_Tag" class=""><span class="colorRed">*</span>案件：</label>
                            <button type="button" id="abcgetCaseData">請選擇</button>
                        </div>--%>
                <div class="col-xs-4">
                    <label id="RecoverStopDate" class="">暫停日期：</label>
                    <input class="form-control datepicker CF_Item0009EmptyCheck" id="abcSSdate_Date" itemname="暫停日期">
                </div>
            </div>

        </div>
        <%--責任助理11--%>
        <div id="Type11" class="form-group row  startHide">

            <div class="col-xs-8">
                <label for="" class=""><span class="colorRed">*</span>責任助理：</label>
                <span>原助理</span>
                <%=getMC_Name()%>
                <span>更改為:</span>
                <br />
                <span>公司別 &nbsp;:&nbsp; </span>
                <%--form-control comMdepChangeFuc_Sign EAgroup addLeaveRequired--%>
                <label class="">
                    <select id="Select_Com_Title" class="form-control comMdepChangeFuc_Sign EAgroup addLeaveRequired" itemname="公司別" com="abcU_Agent_Com" mdep="abcU_Agent_MDEP" emp="abcU_Agent"></select>
                </label>
                <span>部門別  &nbsp;:&nbsp; </span>
                <label class="">
                    <select id="Select_Dept_Title" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc2 EAgroup addLeaveRequired" itemname="部門別" com="abcU_Agent_Com" mdep="abcU_Agent_MDEP" emp="abcU_Agent"></select>
                </label>
                <span>姓名  &nbsp;:&nbsp; </span>
                <label class="">
                    <select id="Select_Employ_Title" class="form-control CF_Item0005EmptyCheck" itemname="姓名"></select>
                </label>
            </div>

        </div>
        <%--轉換老師18--%>
        <div id="Type18" class="form-group row  startHide">
            <div class="col-xs-6">
                <label for="S_Tag" class="">轉換老師：是否折讓</label>
                <label class="">
                    <%--   <select id="abcC_tag" class="form-control CF_Item0006EmptyCheck" itemname="是否折讓">--%>
                    <select id="abcC_tag" class="form-control" itemname="是否折讓">
                        <option value="">請選擇</option>
                        <option value="1">折讓</option>
                        <option value="0">不折讓</option>
                    </select>
                </label>

            </div>
        </div>
        <%--業績分類10--%>
        <div id="Type10" class="form-group row  startHide">
            <div class="form-group row">
                <div class="col-xs-6">
                    <label for="" class=""><span class="colorRed">*</span>業績分類-歸屬：</label>
                    <br />
                    <span>公司別 &nbsp;:&nbsp; </span>
                    <label class="">
                        <select id="Select_Com_Attach" class="form-control getComIDlistHtmlTagOption comMdepChangeFuc3 CF_Item0004" itemname="公司別" com="abcAttach_Com" mdep="abcAttach_MDEP" emp="abcAttach_User"></select>
                    </label>
                    <span>部門別  &nbsp;:&nbsp; </span>
                    <label class="">
                        <select id="Select_Dept_Attach" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc3 CF_Item0004" itemname="部門別" com="abcAttach_Com" mdep="abcAttach_MDEP" emp="abcAttach_User"></select>
                    </label>
                    <span>姓名  &nbsp;:&nbsp; </span>
                    <label class="">
                        <select id="Select_User_Attach" class="form-control CF_Item0004EmptyCheck" itemname="姓名"></select>
                    </label>
                </div>
                <div class="col-xs-3">
                    <label for="" class=""><span class="colorRed">*</span>月份：</label>
                    <label class="">
                        <select id="abcCmonth2" class="form-control CF_Item0004EmptyCheck" itemname="月份">
                            <option value="1">當月</option>
                            <option value="2">次月</option>
                        </select>
                    </label>
                </div>
                <div class="col-xs-3">
                    <label for="" class="">其他：</label>
                    <label class="">
                        <input id="abcOther2" class="form-control CF_Item0004" itemname="其他" />
                    </label>
                </div>

            </div>
        </div>
        <%--ATM後五碼12--%>
        <div id="Type12" class="form-group row  startHide">
            <div class="col-xs-6">
                <label for="" class="">ATM後五碼：</label>
                <label class="">
                    <input type="text" class="form-control" id="abcATM">
                </label>
            </div>

        </div>
        <%--發票資料13--%>
        <div id="Type13" class="form-group row  startHide">
            <div class="col-xs-10">
                <label for="" class=""><span class="colorRed">*</span>發票資料：</label>
                <span>發票開立方式 &nbsp;:&nbsp; </span>
                <label class="">
                    <select id="abcINV_Open_Item" class="form-control">
                        <option value="1">系統</option>
                        <option value="2">手開</option>
                    </select>
                </label>

                <span>寄發狀況</span>
                <label class="">
                    <select id="abcT_Ivo" class="form-control">
                        <option value="1">正常</option>
                        <option value="2">空白信封</option>
                        <option value="3">發票轉交業務</option>
                        <option value="4" selected>不寄</option>
                        <option value="5">捐贈</option>
                    </select>
                </label>

                <span>發票種類</span>
                <label class="">
                    <select id="abcINV_ITEM" class="form-control INV_ItemSelect" companyclassname=".abccompany">
                        <%--目前華冠開的發票只有特種 by小源--%>
                        <%--  <option value="1">二聯</option> 目前華冠開的發票只有特種 by小源
                            <option value="2">三聯</option>--%>
                        <option value="3">特種</option>
                    </select>
                </label>
                <br />
                <span>載具編號: </span>
                <label class="">
                    <input class="form-control abccompany" id="abcCarrierNum" />
                </label>
                <span>公司抬頭: </span>
                <label class="">
                    <input class="form-control abccompany" id="abcCOMNAME" />
                </label>

                <span>公司統編:</span>
                <label class="">
                    <input class="form-control abccompany" id="abcINV_ITEM_UnifyNum" />
                </label>
            </div>

        </div>
        <%--退費--%>
        <div id="Type9" class="form-group row  startHide">
            <div class="col-xs-14">
                <label for="" class=""><span class="colorRed">*</span>退費案件：</label>
                <label for="S_Tag" class="">
                    <span class="colorRed">*</span>案件：
                        <label class="">
                            <input class="form-control" id="data3" style="width: 200px"><%--(退費)案件編號--%>
                        </label>
                    <label class="">
                        <input class="form-control" id="data4" style="width: 200px"><%--(退費)會員種類--%>
                    </label>
                    <button type="button" id="getRefundData">選擇退費件</button></label>


                <%-- <button type="button" id="abcgetCaseData2">選擇案件</button>--%>
            </div>



            <div class="col-xs-4">
                <label class=""><span class="colorRed">*</span>退費金額：</label>
                <input class="form-control  CF_Item0008EmptyCheck" id="abcB_Paymoney" itemname="退費金額">
            </div>
        </div>
        <%-- 備註14--%>
        <div id="Type14" class="form-group row  startHide">

            <div class="col-xs-8">
                <label for="" class="">備註：</label>
                <label for="" class="">
                    <textarea id="abcPS" class="form-control"></textarea>
                </label>
            </div>

            <%--簽核主管--%>
        </div>
        <%--簽核主管--%>
        <div id="Type16" class="form-group row  startHide">
            <div class="col-xs-7">
                <label for="" class=""><span class="colorRed">*</span>簽核主管：</label>
                <span><span class="colorRed">*</span>公司別 &nbsp;:&nbsp; </span>
                <label class="">
                    <%-- <select title="Select_Com" id="Select_Com" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc EAgroup addLeaveRequired">--%>
                    <select title="Select_Com_Sign" id="Select_Com_Sign" class="form-control comMdepChangeFuc_Sign EAgroup addLeaveRequired">
                    </select>
                </label>
                <span><span class="colorRed">*</span>部門別 &nbsp;:&nbsp; </span>
                <label class="">
                    <%--<select title="Select_Dept" id="Select_Dept" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc CF_Item0004" itemname="部門別" com="abcAttach_Com" mdep="abcAttach_MDEP" emp="abcAttach_User">--%>
                    <select title="Select_Dept_Sign" id="Select_Dept_Sign" class="form-control comMdepChangeFuc_Sign EAgroup addLeaveRequired">
                    </select>
                </label>

                <span><span class="colorRed">*</span>姓名  &nbsp;:&nbsp; </span>
                <label class="">
                    <select id="Select_Employ_Sign" class="form-control">
                    </select>


                </label>
            </div>
        </div>
        <%--業績歸屬--%>
        <div id="Type20" class="form-group row  startHide">
            <%-- <div class="col-xs-7">--%>
            <label for="" class=""><span class="colorRed">*</span>業績分類-歸屬1：</label>
            <span>公司別 &nbsp;:&nbsp; </span>
            <label class="">
                <select id="abcAttach_Com" class="form-control getComIDlistHtmlTagOption comMdepChangeFuc4 CF_Item0004" itemname="公司別" com="abcAttach_Com" mdep="abcAttach_MDEP" emp="abcAttach_User"></select>
            </label>
            <span>部門別  &nbsp;:&nbsp; </span>
            <label class="">
                <select id="abcAttach_MDEP" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc4 CF_Item0004" itemname="部門別" com="abcAttach_Com" mdep="abcAttach_MDEP" emp="abcAttach_User"></select>
            </label>
            <span>姓名  &nbsp;:&nbsp; </span>
            <label class="">
                <select id="abcAttach_User" class="form-control CF_Item0004EmptyCheck" itemname="姓名"></select>
            </label>
            <%--  </div>--%>
            <%-- <div class="col-xs-4">--%>
            <span class="colorRed">*</span>月份：
                        <select id="abcCmonth" itemname="月份">
                            <option value="1">當月</option>
                            <option value="2">次月</option>
                        </select>
            <%-- </div>
                    <div >--%>
            <label for="" class="">其他456：</label>
            <label for="">
                <input id="abcOther" class="form-control" itemname="其他" />
            </label>
            <%--   </div>--%>
        </div>
        <%-- 件別--%>
        <div id="Type19" class="form-group row  startHide">
            <div class="col-xs-4">
                <label for="abcObj" class=""><span class="colorRed">*</span>件別：</label>
                <label>
                    <select id="abcObj" class="form-control" style="height: 54px">
                        <option value="0001">最速件</option>
                        <option value="0002">速件</option>
                        <option value="0003" selected>普通件</option>
                    </select>
                </label>
            </div>


        </div>
        <%--新增業務聯絡單按鈕--%>
        <div class="col-xs-4">
            <div style="text-align: center">
                <button id="abcSendAddData" type="button" style="height: 54px" class="btn btn-primary btn-flat form-control marginTop25">新增業務聯絡單</button>
            </div>
        </div>























        <%-- <div id="Type1" class="titleBottomBorder marginLeftRight10">
            <span>入會</span>
        </div>--%>
        <%--<div id="Type2_" class="titleBottomBorder marginLeftRight10 startHide">
        <span>設訊</span>
    </div>
    <div id="Type3_" class="titleBottomBorder marginLeftRight10 startHide">
        <span>設傳真稿</span>
    </div>
    <div id="Type4__" class="titleBottomBorder marginLeftRight10 startHide">
        <span>業績歸屬</span>
    </div>
    <div id="Type5__" class="titleBottomBorder marginLeftRight10 startHide">
        <span>更改責任助理</span>
    </div>
    <div id="Type6__" class="titleBottomBorder marginLeftRight10 startHide">
        <span>折讓</span>--%>
        <%--<div class="form-group row ">
            <div id="openConnetTypeDiv0011" class="openConnetTypeDiv ">
                <div class="col-xs-12"></div>
            </div>
            <div id="openConnetTypeDiv0010" class="openConnetTypeDiv ">
            </div>--%>
        <%--<div id="openConnetTypeDiv0009" class="openConnetTypeDiv">
                <div class="col-xs-2">
                    <label for="S_Tag" class=""><span class="colorRed">*</span>暫停/恢復12：</label>
                    <select id="abcS_Tag" class="form-control CF_Item0009EmptyCheck" itemname="暫停/恢復">
                        <option value="">請選擇</option>
                        <option value="1">暫停</option>
                        <option value="0">恢復</option>
                    </select>
                </div>
                <div class="col-xs-8 " id="abcS_IDandNameDiv">
                    <label for="S_Tag" class=""><span class="colorRed">*</span>案件：</label>
                    <button type="button" id="abcgetCaseData">請選擇</button>
                </div>
                <div class="col-xs-2">
                    <label class="">暫停日期：</label><br />
                    <input class="form-control datepicker CF_Item0009EmptyCheck" id="abcSSdate_Date" itemname="暫停日期">
                </div>
            </div>--%>


        <%--折讓案件--%>
        <%--<div id="openConnetTypeDiv0006" class="openConnetTypeDiv">

                <div class="col-xs-12" id="abcT_IDandNameDiv">
                    <label for="S_Tag" class=""><span class="colorRed">*</span>原案件：</label>

                    <select id="abcT_IDandName" class="form-control CF_Item0006EmptyCheck" itemname="原案件">
                        <option value="">請選擇</option>
                    </select>
                </div>
                <div class="col-xs-6">
                    <label for="S_Tag" class=""><span class="colorRed">*</span>新案件(分析師)：</label>

                    <select id="abcD_MP" class="form-control CF_Item0006EmptyCheck" itemname="新案件(分析師)"></select>
                </div>
                <div class="col-xs-6">
                    <label for="S_Tag" class="">新案件(服務項目)：</label>

                    <select id="abcD_Item" class="form-control CF_Item0006EmptyCheck" itemname="新案件(服務項目)"></select>
                </div>
                <div class="col-xs-6">
                    <label for="S_Tag" class="">新會期(始)：</label>

                    <input id="abcDSdate_Date" class="form-control datepicker CF_Item0006EmptyCheck" itemname="新會期(始)" />

                </div>
                <div class="col-xs-6">
                    <label for="S_Tag" class="">新會期(終)：</label>

                    <input id="abcDEdate_Date" class="form-control datepicker CF_Item0006EmptyCheck" itemname="新會期(終)" />
                </div>
                <div class="col-xs-4">
                    <label for="S_Tag" class="">是否補件：</label>

                    <select id="abcD_tag" class="form-control CF_Item0006EmptyCheck" itemname="是否補件">
                        <option value="">請選擇</option>
                        <option value="1">是</option>
                        <option value="0">否</option>
                    </select>

                </div>
                <div class="col-xs-4">
                    <label for="S_Tag" class="">補件金額：</label>

                    <input id="abcD_Paymoney" class="form-control CF_Item00061EmptyCheck" itemname="補件金額" />
                </div>
                <div class="col-xs-4">
                    <label for="S_Tag" class="">付款方式：</label>

                    <select id="abcD_Type" class="form-control getPayTypeListHtmlTagOption CF_Item00061EmptyCheck" itemname="付款方式">
                    </select>

                </div>
            </div>--%>
        <%-------%>
        <%-- <div id="openConnetTypeDiv0005" class="openConnetTypeDiv">--%>


        <%-------%>
        </form>
    </div>

    <div id="openConnetTypeDiv0003" class="openConnetTypeDiv startHide">

        <div class="col-xs-6">
            <label for="" class="">&nbsp;</label>
            <select id="abcfax_item" class="form-control">
                <option value="2" selected>一般</option>
                <option value="4">解盤</option>
                <option value="5">特別</option>
                <option value="6">飆股</option>
                <option value="7">專案</option>
            </select>
        </div>
    </div>

    <!--CF_Item0001-->






    <div id="addPayCashFlowAndAppointSignDialog" class="form-control startHide" title="新增付費&委任簽署">

        <table class="table">
            <tr>
                <td class="textAlignCenter">
                    <span class="colorRed">*</span><b>客戶資料</b>
                </td>
                <td class="textAlignLeft M_Name" id="cfasC_Name"></td>
            </tr>
            <tr>
                <td class="textAlignCenter">
                    <span class="colorRed">*</span><b>分析師/會員種類</b>
                </td>
                <td class="textAlignLeft">
                    <select id="cfasT_id" class="getAnalystListFuc cfasDataCheckTF" itemid="#cfasmp_item" itemname="分析師"></select>-<select class="cfasDataCheckTF" id="cfasmp_item" itemname="會員種類"><option value=''>請選擇</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="textAlignCenter">
                    <b>會費</b>
                </td>
                <td class="textAlignLeft">
                    <input class="form-control cfasDataCheckTF" id="cfasPrice" itemname="會費" />
                </td>
            </tr>
            <tr>
                <td class="textAlignCenter">
                    <b>設定費</b>
                </td>
                <td class="textAlignLeft">
                    <input itemname="設定費" class="form-control cfasDataCheckTF" type="number" id="cfasSExpenses" /><span>設定費與資訊傳輸費加總需等於「會費」</span>
                </td>
            </tr>
            <tr>
                <td class="textAlignCenter">
                    <b>資訊傳輸費</b>
                </td>
                <td class="textAlignLeft">
                    <input itemname="資訊傳輸費" class="form-control cfasDataCheckTF" id="cfasTExpenses" type="number" /><span>設定費與資訊傳輸費加總需等於「會費」</span>
                </td>
            </tr>
            <tr>
                <td class="textAlignCenter">
                    <b>顧問費</b>
                </td>
                <td class="textAlignLeft">
                    <input itemname="顧問費" class="form-control cfasDataCheckTF" id="cfasCExpenses" type="number" /><span>設定費與資訊傳輸費加總需等於「會費」</span>
                </td>
            </tr>
            <tr>
                <td class="textAlignCenter">
                    <b>其他費用</b>
                </td>
                <td class="textAlignLeft">
                    <input itemname="其他費用" class="form-control cfasDataCheckTF" id="cfasOExpenses" type="number" /><span>設定費與資訊傳輸費加總需等於「會費」</span>
                </td>
            </tr>
            <tr>
                <td class="textAlignCenter">
                    <span class="colorRed">*</span><b>會期-開始日</b>
                </td>
                <td class="textAlignLeft">
                    <input itemname="會期-開始日" class="form-control datepicker cfasDataCheckTF" id="cfasT_Sdate" />
                </td>
            </tr>
            <tr>
                <td class="textAlignCenter">
                    <span class="colorRed">*</span><b>會期-結束日</b>
                </td>
                <td class="textAlignLeft">
                    <input itemname="會期-結束日" class="form-control datepicker cfasDataCheckTF" id="cfasT_Edate" />
                </td>
            </tr>
            <tr>
                <td class="textAlignCenter">
                    <b>是否使用上線付費</b>
                </td>
                <td class="textAlignLeft">
                    <select id="cfasPay_Tag" class="form-control">
                        <option value="1">不使用</option>
                        <option value="0">使用</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="textAlignCenter">
                    <b>備註</b>
                </td>
                <td class="textAlignLeft">
                    <textarea id="cfasPS" class="form-control">

                    </textarea>
                </td>
            </tr>
            <tr>
                <td class="textAlignCenter" colspan="2">
                    <button id="SendAddcfasDataFuc" type="button" class="btn btn-primary btn-flat form-control">送出新增資料1</button>
                </td>

            </tr>
        </table>

    </div>
    <%--客戶資料明細表--%>
    <div id="customerDetail" class="titleBottomBorder marginLeftRight10">
        <h3><span class="colorBlack"><b>客戶資料明細</b></span></h3>
        <div class="btn-group" data-toggle="btn-toggle" style="margin-right: 0 auto; float: right;">
            <button id="" type="button" class="btn closeBtn btn-flat closeDiv" opendivname="#customerTabDiv" style="display: none">X</button>
        </div>

        <div class="btn-group" data-toggle="btn-toggle" style="margin-right: 0 auto; float: right;">
            <button id="" type="button" class="btn closeBtn btn-flat closeDiv" opendivname="#customerDetailTabDiv" style="display: none">X</button>
        </div>
        <div id="TabArea">


            <table width="98%" border="0" cellpadding="4" cellspacing="1" bgcolor="#dddddd">
                <tr class="12-k">
                    <td width="10%" align="center" bgcolor="#F7F6F3">ID</td>
                    <td width="30%" align="center" bgcolor="#ffffff">
                        <font color="red"><b>X</b></font> <span id="ID_tag"></span>
                    </td>
                    <td width="10%" align="center" bgcolor="#F7F6F3">KYC</td>
                    <td width="20%" align="center" bgcolor="#ffffff"><span id="KYC_tag"></span></td>
                    <td width="10%" align="center" bgcolor="#F7F6F3">CDD</td>
                    <td width="20%" align="center" bgcolor="#ffffff"><span id="CDD_tag"></span></td>
                    <%--<td WIDTH=10% align=center bgcolor=#F7F6F3>KYC</td>
                                                            <td WIDTH=20% align=center bgcolor="#ffffff">
                                                                    <%vrs_Mitem.open "select * from kyc where m_id='"& vrs("m_id")&"' order by add_Date desc",conn,3,1
                                                                                if vrs_Mitem.eof then%>
                                                                             <font color="red"><b>X</b></font>
                                                                               <%else %>
                                                                 <font color="green"><b>V</b></font>
																  <%   if session("U_MDEP")="0003" or session("U_MDEP")="0004" or session("U_MDEP")="0009" or vrs("MC")=Session("U_Num") or session("U_Num")="B0808011"  then%>
																		   <input type="button" name="add" value="KYC" class="btn_blue" onclick="javascript: window.open('../MCMTRAT/KYC_PRINT.asp?m_id=<%=vrs("m_id")%>&MENU_no=<%=MENU_no%>', '_Lprint', 'scrollbars=yes,resizable=no,top=0,left=0,width=900,height=680');">	
					                									<%
                                              
																			end if%>   

                                                                            <%end if
                                                                                vrs_mitem.close %>
                                                            </td>
                                                            <td WIDTH=10% align=center bgcolor=#F7F6F3>CDD</td>
                                                            <td WIDTH=20% align=center bgcolor="#ffffff">
                                                                 <%vrs_Mitem.open "select * from cdd where m_id='"& vrs("m_id")&"' order by add_Date desc",conn,3,1
                                                                                if vrs_Mitem.eof then%>
                                                                             <font color="red"><b>X</b></font>
                                                                               <%else %>
                                                                 <font color="green"><b>V</b></font>

                                                                            <%end if
                                                                                vrs_mitem.close %>

                                                            </td>--%>
            </table>
        </div>
        <table class="table" id="butab">
            <tr class="">
                <td class="textAlignCenter colorGray"><b>建檔日期 </b></td>
                <td class="textAlignLeft" colspan="9"><span id="add_date"></span></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray" style="width: 12%"><b>燈號</b></td>
                <td class="textAlignLeft" style="width: 13%">
                    <img id="Light_Status" light="" style="width: 25px; height: 25px;" src="" /></td>
                <td class="textAlignCenter colorGray" style="width: 12%"><b>狀態</b></td>
                <td class="textAlignLeft" style="width: 13%"><span class=""><b>派發</b>&nbsp;:&nbsp;<span id="status"></span>&nbsp;&nbsp;&nbsp;<b>註記</b>&nbsp;:&nbsp;<span id="tag"></span><span id="longTag"></span>&nbsp;&nbsp;&nbsp;<span id="tagHistory"></span></span></td>
                <td class="textAlignCenter colorGray" style="width: 12%"><b>姓名</b></td>
                <td class="textAlignLeft" style="width: 13%"><span id="M_Name"></span><span id="noCallImg" class="startHide">
                    <img light="" style="width: 25px; height: 25px;" src="../../../img/nocall.jpg" /></span></td>
                <td class="textAlignCenter colorGray" style="width: 12%"><b>等級</b></td>
                <td class="textAlignLeft" style="width: 13%"><span id="M_Grade"></span></td>

            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>手機</b></td>
                <td class="textAlignLeft"><span id="MTel"></span></td>
                <td class="textAlignCenter colorGray"><b>業務人員</b></td>
                <td class="textAlignLeft"><span id="MC_Name"></span></td>
                <td class="textAlignCenter colorGray"><b>會員編號</b></td>
                <td class="textAlignLeft"><span id="M_Num"></span></td>
                <td class="textAlignCenter colorGray"><b>會員密碼</b></td>
                <td class="textAlignLeft"><span id="M_Password"></span></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>住家電話1</b></td>
                <td class="textAlignLeft"><span id="HTel"></span></td>
                <td class="textAlignCenter colorGray"><b>住家電話2</b></td>
                <td class="textAlignLeft"><span id="HTel1"></span></td>
                <td class="textAlignCenter colorGray"><b>公司電話1</b></td>
                <td class="textAlignLeft"><span id="OTel"></span></td>
                <td class="textAlignCenter colorGray"><b>公司電話2</b></td>
                <td class="textAlignLeft"><span id="OTel1"></span></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>傳真1</b></td>
                <td class="textAlignLeft"><span id="Fax"></span></td>
                <td class="textAlignCenter colorGray"><b>傳真2</b></td>
                <td class="textAlignLeft"><span id="Fax1"></span></td>
                <td class="textAlignCenter colorGray"><b>身分證字號</b></td>
                <td class="textAlignLeft"><span id="M_SD"></span></td>
                <td class="textAlignCenter colorGray"><b>電子郵件</b></td>
                <td class="textAlignLeft"><span id="EMail"></span></td>
            </tr>

            <tr class="">
                <td class="textAlignCenter colorGray"><b>出生日期</b></td>
                <td class="textAlignLeft" colspan="3"><span id="BirthDay_Date"></span></td>
                <!--<td class="textAlignCenter colorGray"><B>建檔日期 </B></td>
                <td class="textAlignLeft"><span id="add_date"></span></td>-->
                <td class="textAlignCenter colorGray"><b>郵件收件人 </b></td>
                <td class="textAlignLeft" colspan="3"><span id="Recipient"></span></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>住家地址</b></td>
                <td class="textAlignLeft" colspan="3"><span id="Haddress"></span></td>
                <td class="textAlignCenter colorGray"><b>公司地址</b></td>
                <td class="textAlignLeft" colspan="3"><span id="Oaddress"></span></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>投資金額</b></td>
                <td class="textAlignLeft"><span id="Inv_Money"></span></td>
                <td class="textAlignCenter colorGray"><b>電話來源</b></td>
                <td class="textAlignLeft"><span id="Program"></span></td>
                <td class="textAlignCenter colorGray"><b>詢問之分析師</b></td>
                <td class="textAlignLeft"><span id="Analyst"></span></td>
                <td class="textAlignCenter colorGray"><b>詢問之產品</b></td>
                <td class="textAlignLeft"><span id="Product"></span></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>備註</b></td>
                <td class="textAlignLeft" colspan="7"><span id="M_Note"></span></td>
            </tr>
        </table>
    </div>



    <div id="eCustomerDetailTabDiv" class="tabDivMargin3 divBorder startHide secondDiv">
        <div id="" class="titleBottomBorder marginLeftRight10">
            <h3><span class="colorRed">客戶資料明細-修改</span> </h3>
            <div class="btn-group" data-toggle="btn-toggle" style="margin-right: 0 auto; float: right;">
                <button id="" type="button" class="btn closeBtn btn-flat closeDiv" opendivname="#eCustomerDetailTabDiv">X</button>
            </div>

        </div>
        <form id="" class="marginLeftRight10 marginTop10px">
            <div class="form-group row ">
                <div class="col-xs-2">
                    <label for="ecM_Name"><span class="colorRed">*</span>姓名：</label><br />
                    <input class="form-control sendEditCustomerData sendEditCustomerDataRequired ecM_Name" id="ecM_Name" codenameyn="N" fieldname="姓名" requireditem="姓名" />
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecM_Name" id="ecM_NameHidden" />
                </div>
                <div class="col-xs-2">
                    <label for="ecM_Sax">性別：</label><br />
                    <select id="ecM_Sax" class="form-control sendEditCustomerData ecM_Sax" codenameyn="Y" fieldname="性別">
                        <option value="">請選擇</option>
                        <option value="M">先生</option>
                        <option value="F">小姐</option>
                    </select>
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecM_Sax" codename="" id="ecM_SaxHidden" />
                </div>
                <div class="col-xs-2">
                    <label>身分證字號：</label><br />
                    <input class="form-control checkIdFuc sendEditCustomerData ecM_SD" id="ecM_SD" codenameyn="N" type="text" fieldname="身分證字號" />
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecM_SD" id="ecM_SDHidden" />
                </div>
                <%-- <div class="col-xs-2">
                    <label">電子郵件：</label><br />
                    <input class="form-control checkEmailFuc sendEditCustomerData ecEMail" id="ecEMail" type="email" CodeNameYN="N" fieldName="電子郵件">
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecEMail" id="ecEMailHidden"/>
                </div>--%>
                <div class="col-xs-2">
                    <label>出生日期：</label><br />
                    <input class="form-control datepicker sendEditCustomerData ecBirthDay_Date" codenameyn="N" id="ecBirthDay_Date" fieldname="出生日期">
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecBirthDay_Date" id="ecBirthDay_DateHidden" />
                </div>
                <div class="col-xs-2">
                    <label>郵件收件人：</label><br />
                    <input type="text" id="ecRecipient" class="form-control sendEditCustomerData ecRecipient" codenameyn="N" placeholder="郵件收件人" fieldname="郵件收件人" />
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecRecipient" id="ecRecipientHidden" />
                </div>
            </div>
            <div class="form-group row">
                <div class="col-xs-2">
                    <label>會員編號：</label><br />
                    <input class="form-control sendEditCustomerData ecM_Num" id="ecM_Num" type="text" codenameyn="N" placeholder="會員編號" fieldname="會員編號" disabled="disabled">
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecM_Num" id="ecM_NumHidden" />
                </div>
                <div class="col-xs-2">
                    <label>會員密碼：</label><br />
                    <input class="form-control sendEditCustomerData ecM_Password" id="ecM_Password" codenameyn="N" fieldname="會員密碼" type="text" placeholder="會員密碼">
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecM_Password" id="ecM_PasswordHidden" />
                </div>
                <div class="col-xs-2">
                    <label for="ecLight_Status" class="" id="ecLight_StatusLabel">燈號：</label><br />
                    <select class="form-control ecLight_Status sendEditCustomerData" codenameyn="Y" id="ecLight_Status" fieldname="燈號">
                        <option value="">請選擇</option>
                        <option value="Y">黃燈</option>
                        <option value="G">綠燈</option>
                        <option value="R">紅燈</option>
                    </select>
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecLight_Status" codename="" id="ecLight_StatusHidden" />
                </div>
                <div class="col-xs-2">
                    <label for="ecN_Call_tag">聯絡註記</label>：<br />
                    <select id="ecN_Call_tag" class="form-control ecN_Call_tag sendEditCustomerData" codenameyn="Y" fieldname="聯絡註記">
                        <option value="">請選擇</option>
                        <option value="0">正常</option>
                        <option value="1">請勿聯絡</option>
                    </select>
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecN_Call_tag" codename="" id="ecN_Call_tagHidden" />
                </div>
                <div class="col-xs-2">
                    <label><span class="colorRed">*</span>等級：</label><br />
                    <select class="form-control ecM_Grade sendEditCustomerData sendEditCustomerDataRequired" id="ecM_Grade" codenameyn="N" fieldname="等級" requireditem="等級">
                        <option value="">請選擇</option>
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                        <option value="D">D</option>
                    </select>
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecM_Grade" id="ecM_GradeHidden" />
                </div>

                <div class="col-xs-2">
                    <label>投資金額：</label><br />
                    <select id="ecInv_Money" class="form-control sendEditCustomerData ecInv_Money" codenameyn="Y" fieldname="投資金額">
                        <option value="">請選擇</option>
                        <option value="0001">50萬以下</option>
                        <option value="0002">50萬~150萬</option>
                        <option value="0003">150萬~300萬</option>
                        <option value="0004">300萬以上</option>
                    </select>
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecInv_Money" codename="" id="ecInv_MoneyHidden" />
                </div>
            </div>
            <div class="form-group row">
                <div class="col-xs-2">
                    <label class="">手機：</label><br />
                    <input class="form-control onlyNumber sendEditCustomerData contact checkMobile ecMTel1" codenameyn="N" id="ecMTel1" fieldname="手機1" type="text" placeholder="手機號碼1 ">
                    <input class="form-control onlyNumber sendEditCustomerData contact checkMobile ecMTel2" codenameyn="N" id="ecMTel2" fieldname="手機2" type="text" placeholder="手機號碼2 ">
                    <input class="form-control onlyNumber sendEditCustomerData contact checkMobile ecMTel3" codenameyn="N" id="ecMTel3" fieldname="手機3" type="text" placeholder="手機號碼3 ">
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecMTel1" id="ecMTel1Hidden" />
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecMTel2" id="ecMTel2Hidden" />
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecMTel3" id="ecMTel3Hidden" />
                </div>

                <div class="col-xs-2">
                    <label class="">公司電話1：</label><br />
                    <select id="ecOTel_Zone" class="form-control getZoneCode sendEditCustomerData ecOTel_Zone" codenameyn="N" fieldname="公司電話1區碼"></select>
                    <input class="form-control onlyNumber sendEditCustomerData contact ecOTel" id="ecOTel" codenameyn="N" fieldname="公司電話1號碼" type="text" placeholder="電話號碼">
                    <input class="form-control onlyNumber sendEditCustomerData ecOTel_Sub" id="ecOTel_Sub" codenameyn="N" fieldname="公司電話1分機" type="text" placeholder="分機">
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecOTel_Zone" id="ecOTel_ZoneHidden" />
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecOTel" id="ecOTelHidden" />
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecOTel_Sub" id="ecOTel_SubHidden" />
                </div>
                <div class="col-xs-2">
                    <label class="">公司電話2：</label><br />
                    <select id="ecOTel_Zone1" class="form-control getZoneCode sendEditCustomerData ecOTel_Zone1" codenameyn="N" fieldname="公司電話2區碼"></select>
                    <input class="form-control onlyNumber sendEditCustomerData contact ecOTel1" id="ecOTel1" codenameyn="N" fieldname="公司電話2號碼" type="text" placeholder="電話號碼">
                    <input class="form-control onlyNumber sendEditCustomerData ecOTel_Sub1" id="ecOTel_Sub1" codenameyn="N" type="text" fieldname="公司電話2分機" placeholder="分機">
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecOTel_Zone1" id="ecOTel_Zone1Hidden" />
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecOTel1" id="ecOTel1Hidden" />
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecOTel_Sub1" id="ecOTel_Sub1Hidden" />
                </div>
                <div class="col-xs-6">
                    <label class="">住家地址：</label><br />
                    <select id="ecHCity" class="getCityListFuc form-control city sendEditCustomerData ecHCity" codenameyn="N" towntype="HTown" fieldname="住家地址城市">
                        <option value="">請選擇城市</option>
                    </select>
                    <select id="ecHTown" class="town form-control sendEditCustomerData ecHTown" codenameyn="Y" fieldname="住家地址區鄉鎮">
                        <option value="">請選擇區鄉鎮</option>
                    </select>
                    <input type="text" id="ecH_Address" class="form-control sendEditCustomerData ecH_Address" codenameyn="N" placeholder="地址" fieldname="住家地址" />
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecHCity" id="ecHCityHidden" />
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecHTown" codename="" id="ecHTownHidden" />
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecH_Address" id="ecH_AddressHidden" />
                </div>
                <div class="col-xs-6">
                    <label class="">公司地址：</label><br />
                    <select id="ecOCity" class="getCityListFuc form-control city sendEditCustomerData ecOCity" codenameyn="N" towntype="OTown" fieldname="公司地址城市">
                        <option value="">請選擇城市</option>
                    </select>
                    <select id="ecOTown" class="town form-control sendEditCustomerData ecOTown" codenameyn="Y" fieldname="公司地址區鄉鎮">
                        <option value="">請選擇區鄉鎮</option>
                    </select>
                    <input type="text" id="ecO_Address" class="form-control sendEditCustomerData ecO_Address" codenameyn="N" fieldname="公司地址" placeholder="地址" />
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecOCity" id="ecOCityHidden" />
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecOTown" codename="" id="ecOTownHidden" />
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecO_Address" id="ecO_AddressHidden" />
                </div>

            </div>
            <div class="form-group row">
                <div class="col-xs-2">
                    <label class="">住家電話1：</label><br />
                    <select id="ecHTel_Zone" class="form-control getZoneCode sendEditCustomerData ecHTel_Zone" codenameyn="N" fieldname="住家電話1區碼"></select>
                    <input class="form-control onlyNumber sendEditCustomerData contact ecHTel" id="ecHTel" codenameyn="N" fieldname="住家電話1號碼" type="text" placeholder="電話號碼">
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecHTel_Zone" id="ecHTel_ZoneHidden" />
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecHTel" id="ecHTelHidden" />
                </div>
                <div class="col-xs-2">
                    <label class="">住家電話2：</label><br />
                    <select id="ecHTel_Zone1" class="form-control getZoneCode sendEditCustomerData ecHTel_Zone1" codenameyn="N" fieldname="住家電話2區碼"></select>
                    <input class="form-control onlyNumber sendEditCustomerData contact ecHTel1" id="ecHTel1" codenameyn="N" fieldname="住家電話2號碼" type="text" placeholder="電話號碼">
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecHTel_Zone1" id="ecHTel_Zone1Hidden" />
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecHTel1" id="ecHTel1Hidden" />
                </div>
                <div class="col-xs-2">
                    <label class="">傳真1：</label><br />
                    <select id="ecFax_Zone" class="form-control getZoneCode sendEditCustomerData ecFax_Zone" codenameyn="N" fieldname="傳真1區碼">
                        <option value="">請選擇區碼</option>
                    </select>
                    <input class="form-control onlyNumber sendEditCustomerData ecFax" id="ecFax" type="text" codenameyn="N" fieldname="傳真1號碼" placeholder="電話號碼">
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecFax_Zone" id="ecFax_ZoneHidden" />
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecFax" id="ecFaxHidden" />
                </div>
                <div class="col-xs-2">
                    <label class="">傳真2：</label><br />
                    <select id="ecFax_Zone1" class="form-control getZoneCode sendEditCustomerData ecFax_Zone1" codenameyn="N" fieldname="傳真2區碼">
                        <option value="">請選擇區碼</option>
                    </select>
                    <input class="form-control onlyNumber sendEditCustomerData ecFax1" id="ecFax1" type="text" codenameyn="N" fieldname="傳真2號碼" placeholder="電話號碼">
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecFax_Zone1" id="ecFax_Zone1Hidden" />
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecFax1" id="ecFax1Hidden" />
                </div>
                <div class="col-xs-4">
                    <label class="">備註：</label><br />
                    <textarea id="ecM_Note" class="form-control sendEditCustomerData ecM_Note" codenameyn="N" style="height: 68px" fieldname="備註"></textarea>
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecM_Note" id="ecM_NoteHidden" />
                </div>
            </div>
            <div class="form-group row ">
                <div class="col-xs-12" id="AnalystCheckBoxDiv">
                    <label for="Analyst"><span class="colorRed">*</span>詢問老師：</label>
                    <input id="ecAnalyst" type="hidden" class="form-control  sendEditCustomerData" codenameyn="N" fieldname="詢問老師" />
                    <input id="ecAnalystCodeStr" type="hidden" class="form-control sendEditCustomerDataRequired " codenameyn="N" fieldname="詢問老師" requireditem="詢問之分析師" />
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecAnalyst" codename="" id="ecAnalystHidden" />
                </div>
            </div>
            <div class="form-group row ">
                <div class="col-xs-12" id="ProductCheckBoxDiv">
                    <label for="Product" class=""><span class="colorRed">*</span>詢問商品：</label>
                    <input id="ecProduct" type="hidden" class="form-control  sendEditCustomerData" codenameyn="N" fieldname="詢問商品" />
                    <input id="ecProductCodeStr" type="hidden" class="form-control sendEditCustomerDataRequired " codenameyn="N" fieldname="詢問商品" requireditem="詢問之商品" />
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecProduct" codename="" id="ecProductHidden" />
                </div>
            </div>
            <div class="form-group row ">
                <div class="col-xs-12" id="ProgramCheckboxDiv">
                    <label for="Program" class=""><span class="colorRed">*</span>電話來源：</label>
                    <input id="ecProgram" type="hidden" class="form-control  sendEditCustomerData" codenameyn="N" fieldname="電話來源" />
                    <input id="ecProgramCodeStr" type="hidden" class="form-control sendEditCustomerDataRequired " codenameyn="N" fieldname="電話來源" requireditem="詢問之電話來源" />
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecProgram" codename="" id="ecProgramHidden" />
                </div>
            </div>
            <div class="form-group row">

                <div class="col-xs-6">
                    <label class="">業務人員：</label><br />
                    <select id="ecMCdata" class="form-control sendEditCustomerData ecMCdata" codenameyn="Y" fieldname="業務人員"></select>
                    <input type="hidden" class="form-control sendEditCustomerDataHidden ecMCdata" codename="" comid="" id="ecMCdataHidden" />
                </div>
                <div class="col-xs-6">
                    <div>
                        <button class="btn btn-primary form-control marginTop25" id="editCustomerDataBtn" onclick="return false;">送出修改資料</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!--新版 tradeDetailDiv start-->
    <div id="tradeDetailTabDialog" class="tabDivMargin startHide form-control" title="交易紀錄 - 詳細資料">
        <table class="table">
            <tr class="">
                <td class="textAlignCenter colorGray" style="width: 25%"><b>交易編號</b></td>
                <td class="textAlignLeft" id="dT_ID" style="width: 25%"></td>
                <td class="textAlignCenter colorGray" style="width: 25%"><b>狀態</b></td>
                <td class="textAlignLeft" id="dT_Status" style="width: 25%"></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray" style="width: 25%"><b>分析師-入會種類</b></td>
                <td class="textAlignLeft" id="dMP_Name" style="width: 25%"></td>
                <td class="textAlignCenter colorGray" style="width: 25%"><b>入會方式</b></td>
                <td class="textAlignLeft" id="dT_Type" style="width: 25%"></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray" style="width: 25%"><b id="AccountType"></b></td>
                <td class="textAlignLeft" id="dT_AccountDate" style="width: 25%"></td>
                <td class="textAlignCenter colorGray" style="width: 25%"><b>入帳人員</b></td>
                <td class="textAlignLeft" id="dMC" style="width: 25%"></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray" style="width: 25%"><b>收費明細</b></td>
                <td class="textAlignLeft" colspan="9" style="width: 75%">
                    <div style="text-align: right; margin-bottom: 1px;">
                        <button type="button" class="openAddChargeDetailDialog">新增</button>
                    </div>
                    <table class="table" id="chargeDetailTab">
                        <thead class="bgColor">
                            <tr>
                                <td class="textAlignCenter leftSideWhite">編</td>
                                <td class="textAlignCenter leftSideWhite">類別</td>
                                <td class="textAlignCenter leftSideWhite">人員</td>
                                <td class="textAlignCenter leftSideWhite">入帳金額</td>
                                <td class="textAlignCenter leftSideWhite">公司</td>
                                <td class="textAlignCenter leftSideWhite">入帳日期</td>
                                <td class="textAlignCenter leftSideWhite">付款方式</td>
                                <td class="textAlignCenter leftSideWhite">修</td>
                                <td class="textAlignCenter leftSideWhite">刪</td>
                            </tr>
                        </thead>
                        <tbody id="chargeDetailTb" class="echargeDetailTb"></tbody>
                    </table>
                </td>

            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray" style="width: 25%"><b>會費</b></td>
                <td class="textAlignLeft" colspan="9" id="dT_PayMoney" style="width: 75%"></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray" style="width: 25%"><b>入會日期</b></td>
                <td class="textAlignLeft" id="dT_StartDate" style="width: 25%"></td>
                <td class="textAlignCenter colorGray" style="width: 25%"><b>到期日期</b></td>
                <td class="textAlignLeft" id="dT_EndDate" style="width: 25%"></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray" style="width: 25%"><b>剩餘天數/總天數</b></td>
                <td class="textAlignLeft" colspan="9" id="days" style="width: 75%"></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray" style="width: 25%"><b>設訊</b></td>
                <td class="textAlignLeft" id="dT_Message" style="width: 25%"></td>
                <td class="textAlignCenter colorGray" style="width: 25%"><b>傳真稿</b></td>
                <td class="textAlignLeft" id="dT_Fax" style="width: 25%"></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray" style="width: 25%"><b>發票作業</b></td>
                <td class="textAlignLeft" colspan="9" id="invoice" style="width: 75%"></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray" style="width: 25%"><b>備註</b></td>
                <td class="textAlignLeft" colspan="9" id="T_PS" style="width: 75%"></td>
            </tr>
        </table>

    </div>
    <!--新版 tradeDetailDiv end-->

    <div id="addTradeRecordDetailDiv" class="tabDivMargin3 divBorder startHide secondDiv">
        <div id="" class="titleBottomBorder marginLeftRight10">
            <h3><span class="colorRed">交易紀錄-新增</span>
                <div class="btn-group" data-toggle="btn-toggle" style="margin-right: 0 auto; float: right;">
                    <button id="" type="button" class="btn closeBtn btn-flat closeDiv" opendivname="#addTradeRecordDetailDiv">X</button>
                </div>
            </h3>
        </div>
        <!--交易紀錄-新增 新版start-->
        <table class="table">
            <tr class="">
                <td class="textAlignCenter colorGray"><b>分析師</b></td>
                <td class="textAlignLeft">
                    <select id="atdMP_Name" class="form-control getAnalystListFuc sendAddTradeDetailCheckTF0001 sendAddTradeDetailCheckTF0002 sendAddTradeDetailCheckTF0003" itemid="#atdT_Item" idtype="atd" itemname="分析師"></select></td>
                <td class="textAlignCenter colorGray"><b>入會種類</b></td>
                <td class="textAlignLeft">
                    <select class="form-control sendAddTradeDetailCheckTF0001 sendAddTradeDetailCheckTF0002 sendAddTradeDetailCheckTF0003" itemname="入會種類" id="atdT_Item">
                        <option value="">請選擇</option>
                    </select></td>
                <td class="textAlignCenter colorGray"><b>入會方式</b></td>
                <td class="textAlignLeft">
                    <select class="form-control T_Type " id="atdT_Type" accounttype="#atdAccountType" normal=".atdnormal" special=".atdspecial" venue=".atdVenue" venueid="#atdV_ID" mc="#atdMC"></select></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>[<span id="atdAccountType">一般</span>件]入帳</b></td>
                <td class="textAlignLeft" colspan="9">
                    <label class="">
                        <span>入帳時間 : </span>
                        <input type="text" class="datepicker form-control atdnormal atdspecial sendAddTradeDetailCheckTF0001 sendAddTradeDetailCheckTF0003" itemname="入帳時間" id="atdT_AccountDate" style="width: 90px;" />
                    </label>
                    <label class="">
                        <span>入帳人員1：</span>
                        <select id="atdMC" class="form-control getMClistHtmlTagOption atdnormal sendAddTradeDetailCheckTF0001 atdspecial sendAddTradeDetailCheckTF0003" itemname="入帳人員1"></select>
                    </label>
                    <label class="">
                        <span>入帳金額1：</span>
                        <input type="number" id="atdT_AccountMoney1" class="form-control atdVenue atdspecial sendAddTradeDetailCheckTF002 sendAddTradeDetailCheckTF003" itemname="入帳金額1" style="width: 90px;" disabled="disabled" />
                    </label>
                    <label class="">
                        <span>入帳人員2：</span>
                        <select id="atdMC2" class="form-control getMClistHtmlTagOption atdspecial sendAddTradeDetailCheckTF003" itemname="入帳人員2" disabled="disabled"></select>
                    </label>
                    <label class="">
                        <span>入帳金額2：</span>
                        <input type="number" id="atdT_AccountMoney2" class="form-control atdspecial sendAddTradeDetailCheckTF003" itemname="入帳金額2" style="width: 90px;" disabled="disabled" />
                    </label>
                    <label class="">
                        <span>選擇會場：</span>
                        <select id="atdV_ID" class="form-control atdVenue sendAddTradeDetailCheckTF0002" disabled="disabled" itemname="選擇會場"></select>
                    </label>
                    <label class="">
                        <span>收入類別：</span>
                        <select id="atdT_PayType" class="form-control atdVenue" disabled="disabled">
                            <option value="0">一般</option>
                            <option value="1">訂金件</option>
                        </select>
                    </label>
                </td>

            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>業績種類</b></td>
                <td class="textAlignLeft" colspan="9">
                    <select class="form-control" id="atdResults_Item">
                        <option value="0001">一般件</option>
                        <option value="0002">獎勵件</option>
                    </select></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>會費</b></td>
                <td class="textAlignLeft" colspan="3">
                    <input type="number" class="form-control sendAddTradeDetailCheckTF0001 sendAddTradeDetailCheckTF0002 sendAddTradeDetailCheckTF003" itemname="會費" id="atdT_PayMoney" /></td>
                <td class="textAlignCenter colorGray"><b>付款方式</b></td>
                <td class="textAlignLeft" colspan="3">
                    <select class="form-control getPayTypeListHtmlTagOption sendAddTradeDetailCheckTF0001 sendAddTradeDetailCheckTF0002 sendAddTradeDetailCheckTF003" id="atdT_PType" itemname="付款方式"></select></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>刷卡末四碼</b></td>
                <td class="textAlignLeft" colspan="9">
                    <input type="text" id="atdCcard_4Num" class="form-control" placeholder="多張用,分隔"></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>入會日期</b></td>
                <td class="textAlignLeft" colspan="3">
                    <input type="text" class="datepicker form-control sendAddTradeDetailCheckTF0001 sendAddTradeDetailCheckTF0002 sendAddTradeDetailCheckTF0003" id="atdT_StartDate" itemname="入會日期"></td>
                <td class="textAlignCenter colorGray"><b>到期日期</b></td>
                <td class="textAlignLeft" colspan="3">
                    <input type="text" class="datepicker form-control sendAddTradeDetailCheckTF0001 sendAddTradeDetailCheckTF0002 sendAddTradeDetailCheckTF0003" id="atdT_EndDate" itemname="到期日期"></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>設訊</b></td>
                <td class="textAlignLeft" colspan="9">
                    <label class="checkbox-inline">
                        <input type="checkbox" class="atdT_Message" id="atdT_Message1" value="1" checked>設</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="atdT_Message" id="atdT_Message2" value="2">不設
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="atdT_Message" id="atdT_Message3" value="3">業務自帶</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="atdT_Message" id="atdT_Message4" value="4">特助或行政帶</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="atdT_Message" id="atdT_Message5" value="5">設解盤</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="atdT_Message" id="atdT_Message6" value="6">設特別</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="atdT_Message" id="atdT_Message7" value="7">設飆股</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="atdT_Message" id="atdT_Message8" value="8">V1</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="atdT_Message" id="atdT_Message9" value="9">V2</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="atdT_Message" id="atdT_Message10" value="10">設專案</label>
                    <input type="hidden" id="atdT_Message" /></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>設研究日報</b></td>
                <td class="textAlignLeft" colspan="9">
                    <label class="checkbox-inline">
                        <input type="checkbox" class="atdT_Fax" id="atdT_Fax1" value="1" disabled="disabled">設</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="atdT_Fax" id="atdT_Fax2" value="2" checked>設(網路研究日報)</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="atdT_Fax" id="atdT_Fax3" value="3">不設</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="atdT_Fax" id="atdT_Fax4" value="4">設解盤
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="atdT_Fax" id="atdT_Fax5" value="5">設特別</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="atdT_Fax" id="atdT_Fax6" value="6">設飆股</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="atdT_Fax" id="atdT_Fax7" value="7">設專案
                    </label>
                    <input type="hidden" id="atdT_Fax" /></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>XQ軟體帳號</b></td>
                <td class="textAlignLeft" colspan="3">
                    <input type="text" class="form-control" id="atdXQ_SName"></td>
                <td class="textAlignCenter colorGray"><b>XQ軟體密碼</b></td>
                <td class="textAlignLeft" colspan="3">
                    <input type="text" class="form-control" id="atdXQ_SPw"></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>發票作業</b></td>
                <td class="textAlignLeft" colspan="9">
                    <label class="">
                        <span>開立公司 : </span>
                        <select id="atdT_Com" class="form-control">
                            <option value="HG">華冠</option>
                            <option value="TK">天酷</option>
                        </select>
                    </label>
                    <label class="">
                        <span>開立方式 : </span>
                        <select id="atdINV_open_Item" class="form-control">
                            <option value="1">系統開</option>
                            <option value="2">手開</option>
                            <option value="3">已開電子發票</option>
                        </select>
                    </label>
                    <label class="">
                        <span>手開發票號 : </span>
                        <input id="atdINV_MNum" style="width: 90px" class="form-control" />
                    </label>
                    <label class="">
                        <span>開立發票 : </span>
                        <select id="atdINV_tag" class="form-control">
                            <option value="1">是</option>
                            <option value="2">否</option>
                        </select>
                    </label>

                    <label class="">
                        <span>發票種類 : </span>
                        <select id="atdINV_ItemSelect" class="form-control INV_ItemSelect" companyclassname=".atdcompany">
                            <option value="3">特種</option>
                            <!-- <option value="1">二聯</option>
                            <option value="2">三聯</option>-->

                        </select>
                    </label>
                    <label class="">
                        <span>寄發狀況 : </span>
                        <select id="atdINV_SendStateSelect" class="form-control">
                            <option value="1">一般</option>
                            <option value="2">空白信封</option>
                            <option value="3">發票轉交業務</option>
                            <!--<option value="4">不寄</option>
                            <option value="5">捐贈</option>-->
                        </select>
                    </label>
                    &nbsp;<label class="">
                        <span>開立日期 : </span>
                        <input type="text" id="atdINV_CreatedateInput" style="width: 90px;" class="datepicker form-control">
                    </label>
                    &nbsp;<label class="">
                        <span>公司抬頭 : </span>
                        <input type="text" id="atdINV_ComName" style="width: 162px" class="form-control atdcompany" disabled="disabled">
                    </label>
                    &nbsp;<label class="">
                        <span>公司統編 : </span>
                        <input type="text" id="atdINV_UnifyNumInput" style="width: 162px" class="form-control atdcompany" disabled="disabled">
                    </label>
                </td>

            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>委任歸檔</b></td>
                <td class="textAlignLeft" colspan="9">
                    <select id="atdBack_intag" class="form-control">
                        <option value="0">需委任歸檔</option>
                        <option value="1">不需委任歸檔</option>
                    </select></td>

            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>備註</b></td>
                <td class="textAlignLeft" colspan="9">
                    <textarea id="atdT_PS" class="form-control"></textarea></td>
            </tr>
            <tr class="">

                <td class="textAlignLeft" colspan="12">
                    <div style="text-align: center">
                        <button id="sendAddTradeDetail" style="height: 55px;" type="button" class="btn btn-primary btn-flat form-control marginTop25">送出新增交易紀錄資料</button>
                    </div>
                </td>
            </tr>
        </table>
        <!--交易紀錄-新增 新版end-->
    </div>
    <div id="editCallRecordDetailDiv" class="tabDivMargin3 divBorder startHide">
        <div id="" class="titleBottomBorder marginLeftRight10">
            <h3><span class="colorRed">通話紀錄-修改</span>
                <div class="btn-group" data-toggle="btn-toggle" style="margin-right: 0 auto; float: right;">
                    <button id="" type="button" class="btn closeBtn btn-flat closeDiv" opendivname="#editCallRecordDetailDiv">X</button>
                </div>
            </h3>
        </div>
        <form id="" class="marginLeftRight10 marginTop10px">
            <div class="form-group row ">
                <div class="col-xs-2">
                    <label for="acrdQ_Date" class="colorBlue">通話日期：</label>
                    <input class="form-control datepicker" id="ecrdQ_Date">
                </div>
                <div class="col-xs-2">
                    <label for="atdMP_Name" class="colorBlue">下次聯絡日期：</label>
                    <input class="form-control datepicker" id="ecrdN_Date">
                </div>
                <div class="col-xs-2">
                    <label for="atdMP_Name" class="colorBlue">下次聯絡項目：</label>
                    <select class="form-control getNCONTListFuc" id="ecrdN_Item"></select>
                </div>
                <div class="col-xs-4">
                    <label for="acrdQ_Date" class="colorBlue">通話內容：</label>
                    <textarea class="form-control" id="ecrdQuestion"></textarea>
                </div>
                <div class="col-xs-2">
                    <div>
                        <button class="btn btn-primary form-control marginTop25" id="editCallRecordDetailBtn" onclick="return false;">送出新增資料3</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div id="addCallRecordDetailDiv" class="tabDivMargin3 divBorder startHide">
        <div id="" class="titleBottomBorder marginLeftRight10">
            <h3><span class="colorRed">通話紀錄-新增</span>
                <div class="btn-group" data-toggle="btn-toggle" style="margin-right: 0 auto; float: right;">
                    <button id="" type="button" class="btn closeBtn btn-flat closeDiv" opendivname="#addCallRecordDetailDiv">X</button>
                </div>
            </h3>
        </div>
        <form id="" class="marginLeftRight10 marginTop10px">
            <div class="form-group row ">
                <div class="col-xs-2">
                    <label for="acrdQ_Date" class="colorBlue">通話日期：</label>
                    <input class="form-control datepicker" id="acrdQ_Date">
                </div>
                <div class="col-xs-2">
                    <label for="atdMP_Name" class="colorBlue">下次聯絡日期：</label>
                    <input class="form-control datepicker" id="acrdN_Date">
                </div>
                <div class="col-xs-2">
                    <label for="atdMP_Name" class="colorBlue">下次聯絡項目：</label>
                    <select class="form-control getNCONTListFuc" id="acrdN_Item"></select>
                </div>
                <div class="col-xs-4">
                    <label for="acrdQ_Date" class="colorBlue">通話內容：</label>
                    <textarea class="form-control" id="acrdQuestion"></textarea>
                </div>
                <div class="col-xs-2">
                    <div>
                        <button class="btn btn-primary form-control marginTop25 blockUI" id="addCallRecordDetailBtn" onclick="return false;">送出新增資料4</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!--新版 入帳金額資料-新增 start-->
    <div id="addChargeDetailDialog" class="tabDivMargin startHide form-control" title="入帳金額資料 - 新增">
        <table class="table">
            <tr class="">
                <td class="textAlignCenter colorGray" style="width: 25%"><b>入帳日期</b></td>
                <td class="textAlignLeft" colspan="9" style="width: 75%">
                    <input class="form-control datepicker acdRequired" id="acdAccount_Date" requireditem="入帳日期" /></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray" style="width: 25%"><b>入賬類別</b></td>
                <td class="textAlignLeft" colspan="9" style="width: 75%">
                    <select class="form-control acdRequired" id="acdPay_tag" requireditem="入賬類別">
                        <option value="">請選擇</option>
                        <option value="0">一般件</option>
                        <option value="1">會場共分</option>
                        <option value="2">訂金件</option>
                    </select></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray" style="width: 25%"><b>入帳公司</b></td>
                <td class="textAlignLeft" colspan="9" style="width: 75%">
                    <select class="form-control acdRequired" id="acdT_Com" requireditem="入賬類別">
                        <option value="HG">華冠</option>
                        <option value="TK">天酷</option>
                    </select></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray" style="width: 25%"><b>入帳人員</b></td>
                <td class="textAlignLeft" colspan="9" style="width: 75%">
                    <select id="acdMC" class="form-control getMClistHtmlTagOption acdRequired" requireditem="入帳人員"></select></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray" style="width: 25%"><b>入帳金額</b></td>
                <td class="textAlignLeft" colspan="9" style="width: 75%">
                    <input type="number" class="form-control acdRequired" id="acdAccount_Money" requireditem="入帳金額" /></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray" style="width: 25%"><b>入帳方式</b></td>
                <td class="textAlignLeft" colspan="9" style="width: 75%">
                    <select class="form-control getPayTypeListHtmlTagOption acdRequired" id="acdPay_Type" requireditem="入帳方式"></select></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter" colspan="12">
                    <div style="text-align: center">
                        <button id="acdSendAddData" type="button" style="width: 200px; margin-top: 0px" class="btn btn-primary btn-flat form-control marginTop25">送出新增入帳金額資料</button>
                    </div>
                </td>

            </tr>

        </table>

    </div>
    <!--新版 入帳金額資料-新增 end-->
    <!--舊版 入帳金額資料-新增 start-->
    <!--
    <div id="addChargeDetailDiv" class="tabDivMargin3 divBorder startHide thirdDiv">
        <div id="" class="titleBottomBorder marginLeftRight10">
            <h3><span class="colorRed">入帳金額資料-新增</span>
                <div class="btn-group" data-toggle="btn-toggle"  style="margin-right:0 auto;float: right;">
                    <button id="" type="button" class="btn closeBtn btn-flat closeDiv" openDivName ="#addChargeDetailDiv">X</button>
                </div>
            </h3>
        </div>
        <form id="" class="marginLeftRight10 marginTop10px">
            <div class="form-group row ">
                <div class="col-xs-6">
                    <label for="seT_ID" class="colorBlue">入帳日期：</label>
                    <br />
                    <input class="form-control datepicker acdRequired" id="acdAccount_Date" requiredItem="入帳日期"/>
                </div>
                <div class="col-xs-6">
                    <label for="seT_StartDate" class="colorBlue">入賬類別：</label>
                    <br />
                    <select  class="form-control acdRequired" id="acdPay_tag" requiredItem="入賬類別">
                        <option value="" >請選擇</option>	
                        <option value="0" >一般件</option>
                        <option value="1" >會場共分</option>	
                        <option value="2" >訂金件</option>		
                    </select>
                </div>
                <div class="col-xs-6">
                    <label for="" class="colorBlue">入帳金額：</label>
                    <input type="number" class="form-control acdRequired" id="acdAccount_Money" requiredItem="入帳金額"/>
                </div>
                 <div class="col-xs-6">
                    <label for="" class="colorBlue">入帳方式：</label>
                     <select  class="form-control getPayTypeListHtmlTagOption acdRequired" id="acdPay_Type" requiredItem="入帳方式"></select>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-xs-6">
                    <label for="acdMC" class="colorBlue">入帳人員：</label>
                    <select id="acdMC" class="form-control getMClistHtmlTagOption acdRequired" requiredItem="入帳人員"></select>
                </div>
                <div class="col-xs-6">
                    <div style="text-align:center" >
                        <button id="acdSendAddData" type="button" style="height:34px;" class="btn btn-primary btn-flat form-control marginTop25">送出新增入帳金額資料</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
     <!--舊版 入帳金額資料-新增 end-->
    <!--新版 入帳金額資料-修改 start-->
    <div id="editChargeDetailDialog" class="tabDivMargin startHide form-control" title="入帳金額資料 - 修改">
        <input type="hidden" id="ecdDT_ID">
        <table class="table">

            <tr class="">
                <td class="textAlignCenter colorGray" style="width: 25%"><b>入帳日期</b></td>
                <td class="textAlignLeft" colspan="9" style="width: 75%">
                    <input class="form-control datepicker ecdRequired" id="ecdAccount_Date" requireditem="入帳日期" /></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray" style="width: 25%"><b>入賬類別</b></td>
                <td class="textAlignLeft" colspan="9" style="width: 75%">
                    <select class="form-control ecdRequired" id="ecdPay_tag" requireditem="入賬類別">
                        <option value="">請選擇</option>
                        <option value="0">一般件</option>
                        <option value="1">會場共分</option>
                        <option value="2">訂金件</option>
                    </select></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray" style="width: 25%"><b>入帳公司</b></td>
                <td class="textAlignLeft" colspan="9" style="width: 75%">
                    <select class="form-control ecdRequired" id="ecdT_Com" requireditem="入賬類別">
                        <option value="HG">華冠</option>
                        <option value="TK">天酷</option>
                    </select></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray" style="width: 25%"><b>入帳人員</b></td>
                <td class="textAlignLeft" colspan="9" style="width: 75%">
                    <select id="ecdMC" class="form-control getMClistHtmlTagOption ecdRequired" requireditem="入帳人員"></select></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray" style="width: 25%"><b>入帳金額</b></td>
                <td class="textAlignLeft" colspan="9" style="width: 75%">
                    <input type="number" class="form-control ecdRequired" id="ecdAccount_Money" requireditem="入帳金額" /></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray" style="width: 25%"><b>入帳方式</b></td>
                <td class="textAlignLeft" colspan="9" style="width: 75%">
                    <select class="form-control getPayTypeListHtmlTagOption ecdRequired" id="ecdPay_Type" requireditem="入帳方式"></select></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter" colspan="12">
                    <div style="text-align: center">
                        <button id="ecdSendEditData" type="button" style="width: 200px; margin-top: 0px" class="btn btn-primary btn-flat form-control marginTop25">送出修改入帳金額資料</button>
                    </div>
                </td>
            </tr>
        </table>

    </div>
    <!--新版 入帳金額資料-修改 end-->
    <!--舊版 入帳金額資料-修改 start-->
    <!--<div id="editChargeDetailDiv" class="tabDivMargin3 divBorder startHide thirdDiv">
        <div id="" class="titleBottomBorder marginLeftRight10">
            <h3><span class="colorRed">入帳金額資料-修改</span>
                <div class="btn-group" data-toggle="btn-toggle"  style="margin-right:0 auto;float: right;">
                    <button id="" type="button" class="btn closeBtn btn-flat closeDiv" openDivName ="#editChargeDetailDiv">X</button>
                </div>
            </h3>
        </div>
        <form id="" class="marginLeftRight10 marginTop10px">
            <div class="form-group row ">
                <div class="col-xs-6">
                    <label for="seT_ID" class="colorBlue">入帳日期：</label>
                    <br />
                    <input class="form-control datepicker ecdRequired" id="ecdAccount_Date" requiredItem="入帳日期"/>
                </div>
                <div class="col-xs-6">
                    <label for="seT_StartDate" class="colorBlue">入賬類別：</label>
                    <br />
                    <select  class="form-control ecdRequired" id="ecdPay_tag" requiredItem="入賬類別">
                        <option value="" >請選擇</option>	
                        <option value="0" >一般件</option>
                        <option value="1" >會場共分</option>	
                        <option value="2" >訂金件</option>		
                    </select>
                </div>
                <div class="col-xs-6">
                    <label for="" class="colorBlue">入帳金額：</label>
                    <input type="number" class="form-control ecdRequired" id="ecdAccount_Money" requiredItem="入帳金額"/>
                </div>
                 <div class="col-xs-6">
                    <label for="" class="colorBlue">入帳方式：</label>
                     <select  class="form-control getPayTypeListHtmlTagOption ecdRequired" id="ecdPay_Type" requiredItem="入帳方式"></select>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-xs-6">
                    <label for="ecdMC" class="colorBlue">入帳人員：</label>
                    <select id="ecdMC" class="form-control getMClistHtmlTagOption ecdRequired" requiredItem="入帳人員"></select>
                </div>
                <div class="col-xs-6">
                    <div style="text-align:center" >
                        <button id="ecdSendEditData" type="button" style="height:34px;" class="btn btn-primary btn-flat form-control marginTop25">送出修改入帳金額資料</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!--舊版 入帳金額資料-修改 end-->

    <div id="normalEditTradeDetailDiv" class="tabDivMargin3 divBorder startHide secondDiv">
        <div id="" class="titleBottomBorder marginLeftRight10">
            <h3><span class="colorBlack"><b>交易紀錄-一般修改</b></span>
                <div class="btn-group" data-toggle="btn-toggle" style="margin-right: 0 auto; float: right;">
                    <button id="" type="button" class="btn closeBtn btn-flat closeDiv" opendivname="#normalEditTradeDetailDiv">X</button>
                </div>
            </h3>
        </div>
        <!--新增-->
        <table class="table">
            <tr class="">
                <td class="textAlignCenter colorGray"><b>交易編號</b></td>
                <td class="textAlignLeft" colspan="3">
                    <input class="form-control" id="eT_ID" disabled="disabled" /></td>
                <td class="textAlignCenter colorGray"><b>狀態</b></td>
                <td class="textAlignLeft" colspan="3">
                    <input class="form-control" id="eT_Status" disabled="disabled" /></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>分析師</b></td>
                <td class="textAlignLeft">
                    <select id="eMP_Name" class="form-control getAnalystListFuc eeditDataCheckTF" itemid="#eT_Item" idtype="e" itemname="分析師"></select></td>
                <td class="textAlignCenter colorGray"><b>入會種類</b></td>
                <td class="textAlignLeft">
                    <select class="form-control eeditDataCheckTF" id="eT_Item" itemname="入會種類">
                        <option value="">請選擇</option>
                    </select></td>
                <td class="textAlignCenter colorGray"><b>入會方式</b></td>
                <td class="textAlignLeft">
                    <select class="form-control T_Type" id="eT_Type" disabled="disabled"></select></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b id="eAccountType"></b></td>
                <td class="textAlignLeft" colspan="3">
                    <input type="text" class="datepicker form-control eeditDataCheckTF" id="eT_AccountDate" itemname="入帳時間" /></td>
                <td class="textAlignCenter colorGray"><b>入帳人員</b></td>
                <td class="textAlignLeft" colspan="3">
                    <select id="eMC" class="form-control getMClistHtmlTagOption eeditDataCheckTF" itemname="入帳人員"></select></td>
            </tr>
            <tr class="">

                <td class="textAlignCenter colorGray"><b>收費明細</b></td>
                <td class="textAlignLeft" colspan="9">
                    <div class="col-xs-12">
                        <%--<div style="text-align:right;margin-bottom:3px;">
                        <button id="addChargeDetailBtn" type="button"  class="btn btn-primary btn-flat form-control  openRecordBtn openAddChargeDetailDialog" openDivName='#addChargeDetailDiv' thisId='' ">新增收費明細</button>
                    </div> --%>
                        <table class="table" id="eChargeDetailTab">
                            <thead class="bgColor">
                                <tr>
                                    <td class="textAlignCenter leftSideWhite">編</td>
                                    <td class="textAlignCenter leftSideWhite">類別</td>
                                    <td class="textAlignCenter leftSideWhite">人員</td>
                                    <td class="textAlignCenter leftSideWhite">入帳金額</td>
                                    <td class="textAlignCenter leftSideWhite">公司</td>
                                    <td class="textAlignCenter leftSideWhite">入帳日期</td>
                                    <td class="textAlignCenter leftSideWhite">付款方式</td>
                                    <td class="textAlignCenter leftSideWhite">修</td>
                                    <td class="textAlignCenter leftSideWhite">刪</td>
                                </tr>
                            </thead>
                            <tbody id="eChargeDetailTb" class="eChargeDetailTb"></tbody>
                        </table>
                    </div>
                </td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>會費</b></td>
                <td class="textAlignLeft" colspan="3">
                    <input class="form-control eeditDataCheckTF" id="eT_PayMoney" itemname="會費" /></td>
                <td class="textAlignCenter colorGray"><b>交易燈號</b></td>
                <td class="textAlignLeft" colspan="3">
                    <select id="eLight_Status" class="form-control">
                        <option value="">無燈號</option>
                        <option value="G">綠燈</option>
                        <option value="R">紅燈</option>
                        <option value="Y">黃燈</option>

                    </select></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>信用卡號末四碼</b></td>
                <td class="textAlignLeft" colspan="9">
                    <input type="text" id="eCcard_4Num" class="form-control" placeholder="多張用,分隔"></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>入會日期</b></td>
                <td class="textAlignLeft" colspan="3">
                    <input type="text" class="datepicker form-control eeditDataCheckTF" itemname="入會日期" id="eT_StartDate"></td>
                <td class="textAlignCenter colorGray"><b>到期日期</b></td>
                <td class="textAlignLeft" colspan="3">
                    <input type="text" class="datepicker form-control eeditDataCheckTF" itemname="到期日期" id="eT_EndDate"></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>剩餘天數</b></td>
                <td class="textAlignLeft" colspan="3">
                    <input class="form-control" id="maturityDays" disabled="disabled" /></td>
                <td class="textAlignCenter colorGray"><b>總天數</b></td>
                <td class="textAlignLeft" colspan="3">
                    <input class="form-control" id="contractDays" disabled="disabled" /></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>設訊</b></td>
                <td class="textAlignLeft" colspan="9">
                    <label class="checkbox-inline">
                        <input type="checkbox" class="eT_Message" id="eT_Message1" value="1">設</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="eT_Message" id="eT_Message2" value="2">不設
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="eT_Message" id="eT_Message3" value="3">業務自帶</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="eT_Message" id="eT_Message4" value="4">特助或行政帶</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="eT_Message" id="eT_Message5" value="5">設解盤</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="eT_Message" id="eT_Message6" value="6">設特別</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="eT_Message" id="eT_Message7" value="7">設飆股</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="eT_Message" id="eT_Message8" value="8">V1</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="eT_Message" id="eT_Message9" value="9">V2</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="eT_Message" id="eT_Message10" value="10">設專案</label>
                    <input type="hidden" id="eT_Message" /></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>研究日報</b></td>
                <td class="textAlignLeft" colspan="9">
                    <label class="checkbox-inline">
                        <input type="checkbox" class="eT_Fax" id="eT_Fax1" value="1">設(自取)</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="eT_Fax" id="eT_Fax2" value="2"><a href="#" class="setWebFaxFuc">設(網路傳真)</a></label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="eT_Fax" id="eT_Fax3" value="3">不設</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="eT_Fax" id="eT_Fax4" value="4">設解盤
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="eT_Fax" id="eT_Fax5" value="5">設特別</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="eT_Fax" id="eT_Fax6" value="6">設飆股</label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="eT_Fax" id="eT_Fax7" value="7">設專案
                    </label>
                    <input type="hidden" id="eT_Fax" /></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>鎖碼影音</b></td>
                <td class="textAlignLeft" colspan="9">
                    <label class="checkbox-inline">
                        <input type="checkbox" class="eT_Media" id="eT_Media1" value="1"><a href="#" class="setWebFaxFuc">設(網站權限)</a></label>
                    <label class="checkbox-inline">
                        <input type="checkbox" class="eT_Media" id="eT_Media2" value="2">不設</label>
                    <input type="hidden" id="eT_Media" /></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>XQ軟體帳號</b></td>
                <td class="textAlignLeft" colspan="3">
                    <input class="form-control" id="eXQ_SName" /></td>
                <td class="textAlignCenter colorGray"><b>XQ軟體密碼</b></td>
                <td class="textAlignLeft" colspan="3">
                    <input class="form-control" id="eXQ_SPw" /></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>發票作業</b></td>
                <td class="textAlignLeft" colspan="9">
                    <div class="col-xs-5 invoiced">

                        <label class="">
                            <span>發票號碼 : </span>
                            <label id="eInvoice_num"></label>
                        </label>
                        &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<label class="">
                            <span>開立日期 : </span>
                            <label id="eINV_Createdate"></label>
                        </label>
                        &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<label class="">
                            <span>發票種類 : </span>
                            <label id="eINV_Item"></label>
                        </label>
                        &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<label class="">
                            <span>寄發狀況 : </span>
                            <label id="eINV_SendState"></label>
                        </label>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<label class="">
                            <span>公司抬頭 : </span>
                            <label id="eINV_ComName"></label>
                        </label>
                        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<label class="">
                            <span>公司統編 : </span>
                            <label id="eINV_UnifyNum"></label>
                        </label>
                    </div>
                    <div class="col-xs-12 unInvoiced">
                        <label class="">
                            <span>開立公司 : </span>
                            <select id="eT_Com" class="form-control">
                                <option value="HG">華冠</option>
                                <option value="TK">天酷</option>
                            </select>
                        </label>
                        <label class="">
                            <span>開立方式 : </span>
                            <select id="eINV_open_Item" class="form-control">
                                <option value="1">系統開</option>
                                <option value="2">手開</option>
                                <option value="3">已開電子發票</option>
                            </select>
                        </label>
                        <label class="">
                            <span>手開發票號 : </span>
                            <input id="eINV_MNum" style="width: 110px" class="form-control" />
                        </label>
                        <label class="">
                            <span>開立發票 : </span>
                            <select id="eINV_tag" class="form-control">
                                <option value="0">是</option>
                                <option value="1">是</option>
                                <option value="2">否</option>
                            </select>
                        </label>
                        &nbsp;<label class="">
                            <span>開立日期 : </span>
                            <input type="text" id="eINV_CreatedateInput" style="width: 90px;" class="datepicker form-control">
                        </label>
                        <label class="">
                            <span>發票種類123 : </span>
                            <select id="eINV_ItemSelect" class="form-control INV_ItemSelect" companyclassname=".ecompany">
                                <option value="3">特種</option>
                                <option value="1">二聯</option>
                                <option value="2">三聯</option>

                            </select>
                        </label>
                        <label class="">
                            <span>公司抬頭: </span>
                            <input type="text" id="eINV_ComNameInput" style="width: 162px;" class="datepicker form-control">
                        </label>
                        <label class="">
                            <span>公司統編 : </span>
                            <input type="text" id="eINV_UnifyNumInput" style="width: 162px;" class="datepicker form-control">
                        </label>
                        <label class="">
                            <span>寄發狀況 : </span>
                            <select id="eINV_SendStateSelect" class="form-control">
                                <option value="1">一般</option>
                                <option value="2">空白信封</option>
                                <option value="3">發票轉交業務</option>
                                <option value="4">不寄</option>
                                <option value="5">捐贈</option>
                            </select>
                        </label>

                        <!-- &nbsp;<label class="">
                        <span>公司抬頭 : </span>
                        <input type="text" id="eINV_ComNameInput" style="width:162px" class="form-control ecompany" disabled="disabled">
                    </label>
                    &nbsp;<label class="">
                        <span>公司統編 : </span>
                        <input type="text" id="eINV_UnifyNumInput" style="width:162px" class="form-control ecompany" disabled="disabled">
                    </label>-->
                    </div>
                </td>

            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>委任歸檔</b></td>
                <td class="textAlignLeft" colspan="9">
                    <div>
                        <span class="displayInlineBlock">
                            <input class="form-control" id="eca_id" readonly="readonly" /></span>
                        <span class="displayInlineBlock">
                            <button type="button" id="getAppointData">選擇委任歸檔資料</button></span>
                    </div>
                    <div>
                        <span class="displayInlineBlock">
                            <select id="eBack_intag" class="form-control">
                                <option value="0">需委任歸檔</option>
                                <option value="1">不需委任歸檔</option>
                            </select></span>
                        <span class="displayInlineBlock">
                            <label class="">
                                <span>狀態 : </span>
                                <select id="eBack_Status" class="form-control">
                                </select>
                            </label>
                        </span>
                    </div>





                </td>

            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>歷史備註</b></td>
                <td class="textAlignLeft" colspan="9" id="eHistoryT_PS"></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>相關文件</b></td>
                <td class="textAlignLeft" colspan="9">
                    <button type="button" id="openUploadFileDialog">新增文件</button><label id="eFile"></label></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>備註</b></td>
                <td class="textAlignLeft" colspan="9">
                    <textarea id="eT_PS" class="form-control"></textarea></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter" colspan="12">
                    <div style="text-align: center">
                        <button id="sendNormalEditData" type="button" class="btn btn-primary btn-flat form-control marginTop25">送出修改交易紀錄資料</button>
                    </div>
                </td>

            </tr>
        </table>
        <!--新增end-->

    </div>
    <!--新版 交易紀錄-續約修改 start-->
    <div id="renewalEditTradeDetailDialog" class="tabDivMargin startHide form-control" title="交易紀錄-續約修改">
        <table class="table">
            <tr class="">
                <td class="textAlignCenter colorGray"><b>交易編號</b></td>
                <td class="textAlignLeft" colspan="9">
                    <input class="form-control" id="reT_ID" disabled="disabled" /></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>分析師</b></td>
                <td class="textAlignLeft">
                    <select id="reMP_Name" class="form-control getAnalystListFuc reeditDataCheckTF0001 reeditDataCheckTF0002 reeditDataCheckTF0003" itemid="#reT_Item" idtype="re" itemname="分析師"></select></td>
                <td class="textAlignCenter colorGray"><b>入會種類</b></td>
                <td class="textAlignLeft">
                    <select class="form-control  reeditDataCheckTF0001 reeditDataCheckTF0002 reeditDataCheckTF0003" id="reT_Item" itemname="入會種類">
                    </select></td>
                <td class="textAlignCenter colorGray"><b>入會方式</b></td>
                <td class="textAlignLeft">
                    <select class="form-control T_Type" id="reT_Type" accounttype="#reAccountType" normal=".normal" special=".special" venue=".Venue" venueid="#reV_ID">
                    </select></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>[<span id="reAccountType">一般</span>件]入帳</b></td>
                <td class="textAlignLeft" colspan="9">
                    <label class="">
                        <span>入帳時間 : </span>
                        <input type="text" class="datepicker form-control normal special reeditDataCheckTF0001 reeditDataCheckTF0003" itemname="入帳時間" id="reT_AccountDate" style="width: 90px;" />
                    </label>
                    <label class="">
                        <span>入帳人員1：</span>
                        <select id="reMC" class="form-control getMClistHtmlTagOption normal special reeditDataCheckTF0001 reeditDataCheckTF0003" itemname="入帳人員1"></select>
                    </label>
                    <label class="">
                        <span>入帳金額1：</span>
                        <input type="number" id="reT_AccountMoney1" class="form-control special reeditDataCheckTF0003" itemname="入帳金額1" style="width: 90px;" disabled="disabled" />
                    </label>
                    <label class="">
                        <span>入帳人員2：</span>
                        <select id="reMC2" class="form-control getMClistHtmlTagOption special reeditDataCheckTF0003" disabled="disabled" itemname="入帳人員2"></select>
                    </label>
                    <label class="">
                        <span>入帳金額2：</span>
                        <input type="number" id="reT_AccountMoney2" class="form-control special reeditDataCheckTF0003" style="width: 90px;" itemname="入帳金額2" disabled="disabled" />
                    </label>
                    <label class="">
                        <span>選擇會場：</span>
                        <select id="reV_ID" class="form-control Venue reeditDataCheckTF0002" itemname="選擇會場" disabled="disabled"></select>
                    </label>
                    <label class="">
                        <span>收入類別：</span>
                        <select id="reT_PayType" class="form-control Venue" disabled="disabled">
                            <option value="1">一般</option>
                            <option value="2">訂金件</option>
                        </select>
                    </label>
                </td>

            </tr>

            <tr class="">
                <td class="textAlignCenter colorGray"><b>會費</b></td>
                <td class="textAlignLeft" colspan="3">
                    <input class="form-control reeditDataCheckTF0001 reeditDataCheckTF0002 reeditDataCheckTF0003" id="reT_PayMoney" itemname="會費" /></td>
                <td class="textAlignCenter colorGray"><b>付款方式</b></td>
                <td class="textAlignLeft" colspan="3">
                    <select class="form-control getPayTypeListHtmlTagOption reeditDataCheckTF0001 reeditDataCheckTF0002 reeditDataCheckTF0003" itemname="付款方式" id="reT_PType"></select></td>
            </tr>

            <tr class="">
                <td class="textAlignCenter colorGray"><b>入會日期</b></td>
                <td class="textAlignLeft" colspan="3">
                    <input type="text" class="datepicker form-control  reeditDataCheckTF0001 reeditDataCheckTF0002 reeditDataCheckTF0003" itemname="入會日期" id="reT_StartDate"></td>
                <td class="textAlignCenter colorGray"><b>到期日期</b></td>
                <td class="textAlignLeft" colspan="3">
                    <input type="text" class="datepicker form-control  reeditDataCheckTF0001 reeditDataCheckTF0002 reeditDataCheckTF0003" itemname="到期日期" id="reT_EndDate"></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>設訊</b></td>
                <td class="textAlignLeft" colspan="3">
                    <select id="reT_Message" class="form-control">
                        <option value="1">設訊</option>
                        <option value="2">不設</option>
                    </select></td>
                <td class="textAlignCenter colorGray"><b>傳真稿</b></td>
                <td class="textAlignLeft" colspan="3">
                    <select id="reT_Fax" class="form-control">
                        <option value="1">自取</option>
                        <option value="2">設(網路傳真)</option>
                        <option value="3">不設</option>
                    </select></td>
            </tr>


            <tr class="">
                <td class="textAlignCenter colorGray"><b>發票作業</b></td>
                <td class="textAlignLeft" colspan="9">
                    <label class="">
                        <span>開立發票 : </span>
                        <select id="reOP_INV" class="form-control">
                            <option value="1">是</option>
                            <option value="2">否</option>
                        </select>
                    </label>
                    &nbsp;<label class="">
                        <span>開立日期 : </span>
                        <input type="text" id="reINV_Createdate" style="width: 90px;" class="datepicker form-control">
                    </label>
                    <label class="">
                        <span>發票種類 : </span>
                        <select id="reINV_Item" class="form-control INV_ItemSelect" companyclassname=".atdcompany">

                            <option value="1">二聯</option>
                            <option value="2">三聯</option>

                        </select>
                    </label>
                    <label class="">
                        <span>開立公司 : </span>
                        <select id="reINV_COM" class="form-control">
                        </select>
                    </label>
                    <label class="">
                        <span>發票號碼 : </span>
                        <select id="reInv_Num" class="form-control">
                        </select>
                    </label>





                    <label class="">
                        <span>寄發狀況 : </span>
                        <select id="reINV_SendState" class="form-control">
                            <option value="1">一般</option>
                            <option value="2">空白信封</option>
                            <option value="3">發票轉交業務</option>
                        </select>
                    </label>
                    <label class="" style="display: none">
                        <span>公司抬頭 : </span>
                        <input id="reInvoice_ComName" />
                    </label>
                    <label class="" style="display: none">
                        <span>公司統編 : </span>
                        <input id="reInvoice_UnifyNum" />
                    </label>


                </td>

            </tr>

            <tr class="">
                <td class="textAlignCenter colorGray"><b>備註</b></td>
                <td class="textAlignLeft" colspan="9">
                    <textarea id="reT_PS" class="form-control"></textarea></td>
            </tr>
            <tr class="">

                <td class="textAlignLeft" colspan="12">
                    <div style="text-align: center">
                        <button id="reSendEditData" type="button" class="btn btn-primary btn-flat form-control">修改續約交易紀錄資料</button>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <!--新版 交易紀錄-續約修改 end-->



    <!-- 新版 交易紀錄-暫停修改 start-->
    <div id="stopEditTradeDetailDialog" class="tabDivMargin startHide form-control" title="交易紀錄-暫停修改">
        <table class="table">

            <tr class="">
                <td class="textAlignCenter colorGray"><b>交易編號</b></td>
                <td class="textAlignLeft" colspan="9">
                    <input class="form-control" id="seT_ID" disabled="disabled" /></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>暫停日期</b></td>
                <td class="textAlignLeft" colspan="9">
                    <input class="form-control datepicker seeditDataCheckTF" id="seT_PauseDate" itemname="暫停日期" /></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>歷史備註</b></td>
                <td class="textAlignLeft" colspan="9">
                    <textarea id="seHistoryT_PS" class="form-control" disabled="disabled"></textarea></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>備註</b></td>
                <td class="textAlignLeft" colspan="9">
                    <textarea id="seT_PS" class="form-control"></textarea></td>
            </tr>
            <tr class="">

                <td class="textAlignLeft" colspan="12">
                    <div style="text-align: center">
                        <button id="seSendEditData" type="button" class="btn btn-primary btn-flat form-control">修改暫停交易紀錄資料</button>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <!--新版 交易紀錄-暫停修改 end-->
    <!--舊版 交易紀錄-暫停修改 start-->
    <!--<div id="stopEditTradeDetailDiv" class="tabDivMargin3 divBorder startHide secondDiv">
        <div id="" class="titleBottomBorder marginLeftRight10">
            <h3><span class="colorRed">交易紀錄-暫停修改</span>
                <div class="btn-group" data-toggle="btn-toggle"  style="margin-right:0 auto;float: right;">
                    <button id="" type="button" class="btn closeBtn btn-flat closeDiv" openDivName ="#stopEditTradeDetailDiv">X</button>
                </div>
            </h3>
        </div>
        <form id="" class="marginLeftRight10 marginTop10px">
            <div class="form-group row ">
                <div class="col-xs-6">
                    <label for="seT_ID" class="colorBlue">交易編號：</label>
                    <br />
                    <input class="form-control" id="seT_ID" disabled="disabled"/>
                </div>
                <div class="col-xs-2">
                    <label for="seT_StartDate" class="colorBlue">暫停日期：</label>
                    <br />
                    <input type="text" class="datepicker form-control" id="seT_PauseDate">
                </div>
                <div class="col-xs-3">
                    <label for="" class="colorBlue">歷史備註：</label>
                    <textarea id="seT_PS"class="form-control" disabled="disabled"></textarea>
                </div>
                 <div class="col-xs-2">
                    <label for="" class="colorBlue">備註：</label>
                    <textarea id="seT_PS"class="form-control"></textarea>
                </div>
                <div class="col-xs-2">

                    <div style="text-align:center" >
                        <button id="seSendEditData" type="button" style="height:54px;" class="btn btn-primary btn-flat form-control marginTop25">送出暫停修正資料</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!--舊版 交易紀錄-暫停修改 end-->
    <!--新版 交易紀錄-恢復修改 start-->
    <div id="restoreEditTradeDetailDialog" class="tabDivMargin startHide form-control" title="交易紀錄 - 恢復會期 ">
        <table class="table">

            <tr class="">
                <td class="textAlignCenter colorGray"><b>交易編號</b></td>
                <td class="textAlignLeft" colspan="9">
                    <input class="form-control" id="reseT_ID" disabled="disabled" /></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>原會期(始)</b></td>
                <td class="textAlignLeft" colspan="9">
                    <input class="form-control" id="reseT_StartDate" disabled="disabled" /></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>原會期(終)</b></td>
                <td class="textAlignLeft" colspan="9">
                    <input class="form-control" id="reseT_EndDate" disabled="disabled" /></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>暫停日期</b></td>
                <td class="textAlignLeft" colspan="9">
                    <input class="form-control" id="reseT_PauseDate" disabled="disabled" /></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>剩餘天數</b></td>
                <td class="textAlignLeft" colspan="9">
                    <input class="form-control" id="reseT_PauseDateDays" disabled="disabled" /></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>恢復日期</b></td>
                <td class="textAlignLeft" colspan="9">
                    <input class="datepicker form-control reseeditDataCheckTF" id="reseT_RestDate" itemname="恢復日期" /></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>新到期日</b></td>
                <td class="textAlignLeft" colspan="9">
                    <input class="datepicker form-control reseeditDataCheckTF" id="reseNewT_EndDate" itemname="新到期日" /></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>歷史備註</b></td>
                <td class="textAlignLeft" colspan="9">
                    <textarea id="reseHistoryT_PS" class="form-control" disabled="disabled"></textarea></td>
            </tr>
            <tr class="">
                <td class="textAlignCenter colorGray"><b>備註</b></td>
                <td class="textAlignLeft" colspan="9">
                    <textarea id="reseT_PS" class="form-control"></textarea></td>
            </tr>

            <tr class="">

                <td class="textAlignLeft" colspan="12">
                    <div style="text-align: center">
                        <button id="reseSendEditData" type="button" class="btn btn-primary btn-flat form-control">修改恢復交易紀錄資料</button>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <!--新版 交易紀錄-恢復修改 end-->
    <!--舊版 交易紀錄-恢復修改 start-->
    <!--<div id="restoreEditTradeDetailDiv" class="tabDivMargin3 divBorder startHide secondDiv">
        <div id="" class="titleBottomBorder marginLeftRight10">
            <h3><span class="colorRed">交易紀錄-恢復修改</span>
                <div class="btn-group" data-toggle="btn-toggle"  style="margin-right:0 auto;float: right;">
                    <button id="" type="button" class="btn closeBtn btn-flat closeDiv" openDivName ="#restoreEditTradeDetailDiv">X</button>
                </div>
            </h3>
        </div>
        <form id="" class="marginLeftRight10 marginTop10px">
            <div class="form-group row ">
                <div class="col-xs-2">
                    <label for="seT_ID" class="colorBlue">交易編號：</label>
                    <input class="form-control" id="reseT_ID" disabled="disabled"/>
                </div>
                <div class="col-xs-2">
                    <label for="reseT_StartDate" class="colorBlue">原會期(始)：</label>
                    <input type="text" class="form-control" id="reseT_StartDate" disabled="disabled"/>
                </div>
                <div class="col-xs-2">
                    <label for="reseT_EndDate" class="colorBlue">原會期(終)：</label>
                    <input type="text" class="form-control" id="reseT_EndDate" disabled="disabled"/>
                </div>
                <div class="col-xs-2">
                    <label for="reseT_PauseDate" class="colorBlue">暫停日期：</label>
                    <input type="text" class="form-control" id="reseT_PauseDate" disabled="disabled"/>
                </div>
                <div class="col-xs-2">
                    <label for="reseT_PauseDateDays" class="colorBlue">剩餘天數：</label>
                    <input type="text" class="datepicker form-control" id="reseT_PauseDateDays" disabled="disabled"/>
                </div>
                <div class="col-xs-2">
                    <label for="reseT_EndDate" class="colorBlue">恢復日期：</label>
                    <input type="text" class="datepicker form-control" id="reseT_RestDate" />
                </div>
            </div>
            <div class="form-group row ">
                <div class="col-xs-2">
                    <label for="reseT_EndDate" class="colorBlue">新到期日：</label>
                    <input type="text" class="datepicker form-control" id="reseNewT_EndDate" />
                </div>
                <div class="col-xs-6">
                    <label for="" class="colorBlue">歷史備註：</label>
                    <textarea id="reseT_PS"class="form-control" disabled="disabled"></textarea>
                </div>
                 <div class="col-xs-2">
                    <label for="" class="colorBlue">備註：</label>
                    <textarea id="reseT_PS"class="form-control"></textarea>
                </div>
                <div class="col-xs-2">
                    <br />
                    <br />
                    <div style="text-align:center" >
                        <button id="reseSendEditData" type="button" style="" class="btn btn-primary btn-flat form-control">送出恢復修正資料</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
     <!--舊版 交易紀錄-恢復修改 end-->
    <div id="customerTabDiv" class="tabDivMargin3 divBorder secondDiv">
        <div id="" class="titleBottomBorder marginLeftRight10">
            <h3><span class="colorBlack"><b>客戶紀錄表</b></span>
                <div class="btn-group" data-toggle="btn-toggle" style="margin-right: 0 auto; float: right;">
                    <button id="" type="button" class="btn closeBtn btn-flat closeDiv" opendivname="#customerTabDiv" style="display: none">X</button>
                </div>
            </h3>
        </div>
        <ul id="myTab" class="nav nav-tabs tabDivMargin3">
            <li class="active">
                <a id="tradeRecord" href="#tradeRecordDiv" data-toggle="tab" class="tabChange" opendivname="#tradeRecordDiv">交易紀錄</a>
            </li>
            <li class="">
                <a href="#callRecordDiv" data-toggle="tab" class="tabChange" opendivname="#callRecordDiv">通話紀錄</a>
            </li>
            <li class="">
                <a href="javascript:void(0)" data-toggle="tab" class="tabChange">VIP資料</a>
            </li>
            <li class="">
                <a href="#activityMessageDiv" data-toggle="tab" class="tabChange" opendivname="#activityMessageDiv">活動訊息</a>
            </li>
            <li class="">
                <a href="#CDDevaluationDiv" data-toggle="tab" class="tabChange" opendivname="#CDDevaluationDiv">CDD評估表</a>
            </li>

        </ul>
        <div id="tradeRecordDiv" class="tabDivMargin5 tabChangeDiv">

            <div id="tradeRecordInerDiv" class="tabDivMargin4">
                <div style="text-align: right; margin-bottom: 3px;">
                    <button id="addTradeRecordBtn" type="button" class="btn btn-primary btn-flat form-control openDiv openRecordBtn addPer" opendivname='#addTradeRecordDetailDiv'>新增交易紀錄</button>
                </div>
                <table class="table">
                    <thead>
                        <tr class="marginTop5px bgColor">
                            <th class="textAlignCenter width10Per leftSideWhite">交易編號
                            </th>
                            <th class="textAlignCenter width10Per leftSideWhite">分析師
                            </th>
                            <th class="textAlignCenter width10Per leftSideWhite">會員總類
                            </th>
                            <th class="textAlignCenter width10Per leftSideWhite">天數
                            </th>
                            <th class="textAlignCenter width10Per leftSideWhite">入會日
                            </th>
                            <th class="textAlignCenter width10Per leftSideWhite">到期日
                            </th>
                            <th class="textAlignCenter width10Per leftSideWhite">狀態
                            </th>
                            <th class="textAlignCenter width10Per leftSideWhite">委任
                            </th>
                            <th class="textAlignCenter width10Per leftSideWhite">行政
                            </th>
                            <th class="textAlignCenter width5Per leftSideWhite">信封
                            </th>
                            <th class="textAlignCenter width5Per leftSideWhite">CDD
                            </th>
                            <th class="textAlignCenter width15Per leftSideWhite">修
                            </th>
                            <th class="textAlignCenter width5Per leftSideWhite">刪
                            </th>
                        </tr>
                    </thead>
                    <tbody id="tradeRecordTb">
                    </tbody>
                </table>
            </div>
        </div>

        <div id="callRecordDiv" class="tabDivMargin5 startHide tabChangeDiv">

            <div id="callRecordInerDiv" class="tabDivMargin4">
                <div style="text-align: right; margin-bottom: 3px;">
                    <button id="addCallRecordBtn" type="button" class="btn btn-primary btn-flat form-control openDiv openRecordBtn addPer" opendivname='#addCallRecordDetailDiv'>新增通話紀錄</button>
                </div>
                <table class="table">
                    <thead>
                        <tr class="marginTop5px bgColor">
                            <th class="textAlignCenter width10Per leftSideWhite"></th>
                            <th class="textAlignCenter width10Per leftSideWhite">時間
                            </th>
                            <th class="textAlignCenter width10Per leftSideWhite">通話內容
                            </th>
                            <th class="textAlignCenter width10Per leftSideWhite">建檔人員
                            </th>
                            <th class="textAlignCenter width10Per leftSideWhite">修
                            </th>
                            <th class="textAlignCenter width10Per leftSideWhite">刪
                            </th>

                        </tr>
                    </thead>
                    <tbody id="callRecordTb">
                    </tbody>
                </table>
            </div>
        </div>

        <div id="activityMessageDiv" class="tabDivMargin5 startHide tabChangeDiv">
            <div id="activityMessageInerDiv" class="tabDivMargin4">
                <table class="table">
                    <thead>
                        <tr class="marginTop5px bgColor">

                            <th class="textAlignCenter width10Per leftSideWhite">活動編號
                            </th>
                            <th class="textAlignCenter width10Per leftSideWhite">活動名稱
                            </th>
                            <th class="textAlignCenter width10Per leftSideWhite">分析師
                            </th>
                            <th class="textAlignCenter width10Per leftSideWhite">索取日期
                            </th>

                        </tr>
                    </thead>
                    <tbody id="activityMessageTb">
                    </tbody>
                </table>
            </div>
        </div>
        <!-- 舊版cdd評估表 start-->
        <div id="CDDevaluationDiv" class="tabDivMargin5 startHide tabChangeDiv">
            <div id="CDDevaluationInerDiv" class="tabDivMargin4">
                <div style="text-align: right; margin-bottom: 3px;">
                    <button id="addNaturePersonBtn" type="button" class="btn btn-primary btn-flat form-control addPer openRecordBtn ">+自然人</button>
                    <button id="addNoNaturePersonBtn" type="button" class="btn btn-primary btn-flat form-control addPer openRecordBtn ">+非自然人</button>
                </div>
                <table class="table">
                    <thead>
                        <tr class="marginTop5px bgColor">
                            <th class="textAlignCenter width10Per leftSideWhite">序
                            </th>
                            <th class="textAlignCenter width10Per leftSideWhite">填寫時間
                            </th>
                            <th class="textAlignCenter width10Per leftSideWhite">風險等級
                            </th>
                            <th class="textAlignCenter width10Per leftSideWhite">建檔人員
                            </th>
                            <th class="textAlignCenter width10Per leftSideWhite">覆核人員
                            </th>
                            <th class="textAlignCenter width10Per leftSideWhite">修
                            </th>
                            <th class="textAlignCenter width10Per leftSideWhite">刪
                            </th>


                        </tr>
                    </thead>
                    <tbody id="CDDevaluationTb">
                    </tbody>
                </table>
            </div>
        </div>
        <!-- 舊版cdd評估表 end-->
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
    <script src="<%=getRelativePath()%>js/tool/tool.js" type="text/javascript"></script>
    <script>

        //====================
        //工具總類
        //1.一般工具 simpleTool
        //2.檢驗工具 checkTool
        //3.貨幣工具 moneyTool
        //4.通用工具 commonTool
        //5.時間日期工具 dateTimeTool
        //6.通用資料工具 commonDataTool
        //7.HTML tag 製作工具 htmlTagMakeTool

        //1.一般工具 simpleTool
        var Log_M = function (str) {
            console.log(str);
        }
        var val_M = function (idOrClassName, val) {
            if (!isEmptyStr(val)) {
                $(idOrClassName).val(val);
            } else {
                return $(idOrClassName).val();
            }
        };
        var text_M = function (idOrClassName, text) {
            if (isEmptyStr(text)) {
                return $(idOrClassName).text();
            } else {
                $(idOrClassName).text(text);
            }
        };
        var html_M = function (idOrClassName, html) {
            if (isEmptyStr(html)) {
                return $(idOrClassName).html();
            } else {
                $(idOrClassName).html(html);
            }
        };
        var attr_M = function (idOrClassName, attrName, val) {
            if (!isEmptyStr(val)) {
                $(idOrClassName).attr(attrName, val);
            } else {
                return $(idOrClassName).attr(attrName);
            }
        };
        var addClass_M = function (idOrClassName, className) {
            $(idOrClassName).addClass(className);
        };
        var removeClass_M = function (idOrClassName, className) {
            $(idOrClassName).removeClass(className);
        };

        var append_M = function (idOrClassName, text) {
            $(idOrClassName).append(text);
        };

        var empty_M = function (idOrClassName) {
            $(idOrClassName).empty();
        };
        var show_M = function (idOrClassName) {
            $(idOrClassName).show();
        };
        var hide_M = function (idOrClassName) {
            $(idOrClassName).hide();
        };
        var disabledTrue_M = function (idOrClassName) {
            $(idOrClassName).attr("disabled", "disabled");
        };
        var disabledFalse_M = function (idOrClassName) {
            $(idOrClassName).attr("disabled", false);
        };
        var unBind_M = function (idOrClassName) {
            $(idOrClassName).unbind();
        };
        var change_M = function (idOrClassName) {
            $(idOrClassName).change();
        };
        var click_M = function (idOrClassName) {
            $(idOrClassName).click();//<===
        };
        var blockUI_M = function () {
            $.blockUI();
        };
        var unBlockUI_M = function () {
            $.unblockUI();
        };
        var onClick_M = function (idOrClassName, func) {
            $(idOrClassName).on("click", func);
        };
        var onChange_M = function (idOrClassName, func) {
            $(idOrClassName).on("change", func);
        };


        //2.檢驗工具 checkTool
        //2-1.檢查是否有空值 emptyCheck_M
        //2-2.檢查字串中是否存在某些字元 hasStr_M
        //2-3.字體型別檢測 strTypeCheck_M
        //2-4.檢查是否為中文 chineseCheck_M
        //2-5.檢查是否為英文 englishCheck_M
        //2-6.檢查是否為數字 numberCheck_M
        //2-7.檢查日期順序 endDateBigThanStartDateCheck_M
        //2-8.檢查手機號碼是否正確 mobileCheckInputs_M
        //2-9.檢查email格式是否正確 emailFormatCheck_M
        //2-10.是否為身分證字號格式 idCheck_M
        //2-11.檢查至少留一種聯絡方式 atLeastContact_M

        //檢查是否有空值 emptyCheck_M
        var emptyCheck_M = function (str) {
            var f = false;
            if (str === undefined || str === null || $.trim(str) === "" || str == "[]" || str == "[object Object]" || str == [] || str == "null") {
                f = true;
            }
            return f;
        };
        var emptyCheckInput_M = function (groupName) {
            var val = undefined;
            var errorItemName = undefined;
            var back = true;

            var checks = $(groupName + "EmptyCheck");
            if (checks.length != 0) {
                $.each(checks, function (i, v) {
                    val = $(v).val();
                    if (back) {
                        if (emptyCheck_M(val)) {
                            errorItemName = $(v).attr("itemName");
                            alert(errorItemName + "欄位 請填入資料");
                            $(v).focus();
                            //back = false;
                            //return false;
                            back = true;
                            return back;
                        }
                    }
                });
            }
            //TEST
            back = true;
            return back;
        };
        //檢查字串中是否存在某些字元 hasStr_M
        var hasStr_M = function (str, chars) {
            var backBool = false;
            if (str.toString().indexOf(chars) != -1) {
                backBool = true;
            }
            return backBool;
        };
        //字體型別檢測 strTypeCheck_M
        var strTypeCheck_M = function (str) {
            var pattern = new RegExp("[\u4E00-\u9FA5]+");
            var backStr = "";
            if (pattern.test(str)) {
                backStr = "中";
            } else {
                var pattern2 = new RegExp("[A-Za-z]+");
                if (pattern2.test(str)) {
                    backStr = "英";
                } else {
                    var pattern3 = new RegExp("[0-9]+");
                    if (pattern3.test(str)) {
                        backStr = "數";
                    }
                }
            }
            return backStr;
        };
        //檢查是否為中文 chineseCheck_M
        var chineseCheck_M = function (str) {
            var pattern = new RegExp("[\u4E00-\u9FA5]+");
            return pattern.test(str);
        };
        var wordCheckInputs_M = function (groupName, typeCheck, warningStr) {
            var val = undefined;
            var errorItemName = undefined;
            var back = true;
            var RegExpStr = "";
            switch (typeCheck) {
                case "ChineseCheck":
                    RegExpStr = "[\u4E00-\u9FA5]+";
                    break;
                case "NumberCheck":
                    RegExpStr = "[0-9]+";
                    break;
                case "EnglishCheck":
                    RegExpStr = "[A-Za-z]+";
                    break;

            }
            var pattern = new RegExp(RegExpStr);
            var checks = $(groupName + typeCheck);
            if (checks.length != 0) {
                $.each(checks, function (i, v) {
                    val = $(v).val();
                    if (!emptyCheck_M(val)) {
                        if (!pattern.test(val)) {
                            errorItemName = $(v).attr("itemName");
                            alert(errorItemName + "欄位 " + warningStr);
                            $(v).focus();
                            back = false;
                            return false;
                        }
                    }
                });
            }
            return back;
        };

        //檢查是否為英文 englishCheck_M
        var englishCheck_M = function (str) {
            var pattern = new RegExp("[A-Za-z]+");
            return pattern.test(str);
        };
        //檢查是否為數字 numberCheck_M
        var numberCheck_M = function (str) {
            var pattern = new RegExp("[0-9]+");
            return pattern.test(str);
        };
        //檢查日期順序 endDateBigThanStartDateCheck_M
        var endDateBigThanStartDateCheck_M = function (startDate, endDate) {

            var doNext = false;
            if (!emptyCheck_M(startDate) && !emptyCheck_M(endDate)) {
                doNext = true;
                var startDateT = new Date(startDate);
                var endDateT = new Date(endDate);
                if (startDateT > endDateT) {
                    doNext = false;
                    alert("請正確選取日期");
                }
            } else if (emptyCheck_M(startDate) && emptyCheck_M(endDate)) {
                doNext = false;
                alert("請正確選取日期");
            }
            return doNext;
        }
        //檢查手機號碼是否正確 mobileCheckInputs_M
        var mobileCheckInputs_M = function (idOrClassName) {
            var backTF = true;
            var checks = $(idOrClassName + "MobileCheck");
            var vval = "";

            $.each(checks, function (i, v) {
                vval = $(v).val()
                if (!emptyCheck_M(vval)) {
                    if (vval.length != 10) {
                        $(v).focus();
                        alert("請正確填寫手機號碼");
                        backTF = false;
                        return false;
                    }
                }
            });

            return backTF;
        };
        //檢查email格式是否正確 emailFormatCheck_M
        var emailCheckInputs_M = function (idOrClassName) {
            var emailVal = $(idOrClassName).val();
            var back = true;
            if (!emptyCheck_M(emailVal)) {
                var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
                back = re.test(emailVal);
                if (!back) {
                    $(idOrClassName).focus();
                    alert("請填寫正確email格式");
                }
            }
            return back;
        };
        //是否為身分證字號格式 idCheck_M
        var idCheckInput_M = function (id) {
            var idStr = $(id).val();
            var backTF = true;
            if (!emptyCheck_M(idStr)) {
                // 依照字母的編號排列，存入陣列備用。
                var letters = new Array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'X', 'Y', 'W', 'Z', 'I', 'O');
                // 儲存各個乘數
                var multiply = new Array(1, 9, 8, 7, 6, 5, 4, 3, 2, 1);
                var nums = new Array(2);
                var firstChar;
                var firstNum;
                var lastNum;
                var total = 0;
                // 撰寫「正規表達式」。第一個字為英文字母，
                // 第二個字為1或2，後面跟著8個數字，不分大小寫。
                var regExpID = /^[a-z](1|2)\d{8}$/i;
                // 使用「正規表達式」檢驗格式
                if (idStr.search(regExpID) == -1) {
                    // 基本格式錯誤
                    backTF = false;
                    alert("請仔細填寫身分證號碼");
                    $(id).focus();
                    return false;
                } else {
                    // 取出第一個字元和最後一個數字。
                    firstChar = idStr.charAt(0).toUpperCase();
                    lastNum = idStr.charAt(9);
                }
                // 找出第一個字母對應的數字，並轉換成兩位數數字。
                for (var i = 0; i < 26; i++) {
                    if (firstChar == letters[i]) {
                        firstNum = i + 10;
                        nums[0] = Math.floor(firstNum / 10);
                        nums[1] = firstNum - (nums[0] * 10);
                        break;
                    }
                }
                // 執行加總計算
                for (var i = 0; i < multiply.length; i++) {
                    if (i < 2) {
                        total += nums[i] * multiply[i];
                    } else {
                        total += parseInt(idStr.charAt(i - 1)) * multiply[i];
                    }
                }
                // 和最後一個數字比對
                // 規則一餘數為零，且檢查碼需為零
                if (lastNum == 0 && (total % 10) != lastNum) {
                    $(id).focus();
                    backTF = false;
                    alert("身分證號碼寫錯了");
                    return false;
                }
                // 規則二餘數與檢查碼需相符
                if (lastNum != 0 && (10 - (total % 10)) != lastNum) {
                    $(id).focus();
                    backTF = false;
                    alert("身分證號碼寫錯了");
                    return false;
                }
            }

            return backTF;
        };
        //付款類型
        var PT_Item;
        //檢查至少留一種聯絡方式 atLeastContact_M
        var atLeastContact_M = function (idOrClassName) {
            var contacts = $(idOrClassName);
            var n = 0;
            $.each(contacts, function (i, v) {
                if (!emptyCheck_M($(v).val())) {
                    n += 1;
                }
            });
            if (n == 0) {
                alert("手機或電話至少填寫一種聯絡方式");
                return false;
            }
            return true;
        };

        //3.貨幣工具 moneyTool
        //3-1.貨幣數字格式 getMoneyFormat_M

        //3-1.貨幣數字格式 getMoneyFormat_M
        var getMoneyFormat_M = function (num) {
            var money = undefined;
            money = num.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
            return money;
        };
        //4.通用工具commonTool
        //4-1. SessionStorage設定 setSessionStorage_M
        //4-2.擷取頁面 printScreen_M
        //4-3.將字串轉成JSON物件 jsonParse_M
        //4-4.切割字體 split_M
        //4-5.字串串接工具 StringBuilder_M
        //4-6.補零 plusZero_M
        //4-7.傳送資料 ajax_M
        //4-8.取得隨機數 getRandom_M
        //4-9.取得checkbox全部的value用'，'串成字串並返回其值 getAllcheckBoxValue_M
        //SessionStorage設定 setSessionStorage_M
        var setSessionStorage_M = function (key, value) {
            sessionStorage[key] = value;
        };
        var getSessionStorage_M = function (key) {
            return sessionStorage[key];
        };
        //擷取頁面 printScreen_M
        var printScreen_M = function (idOrClassName) {
            document.body.innerHTML = $(idOrClassName).html();
            window.print();
        }
        //將字串轉成JSON物件 jsonParse_M
        var jsonParse_M = function (str) {
            return JSON.parse(str);
        };

        //切割字體 split_M
        var split_M = function (str, splitChar, num) {
            return str.split(splitChar)[num];
        };

        // 字串串接工具 StringBuilder_M
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
        //補零 plusZero_M
        var plusZero_M = function (str) {
            var backStr = undefined;
            if (str.length < 2) {
                backStr = "0" + str;
            } else {
                backStr = str;
            }
            return backStr;
        };
        //傳送資料 ajax_M
        var ajax_M = function (url, data, success, error) {
            $.ajax({
                url: url,
                data: data,
                method: 'POST',
                success: success,
                error: error
            });
        };
        //取得隨機數 getRandom_M
        var getRandom_M = function (min, max) {
            return Math.floor(Math.random() * (max - min + 1)) + min;
        };
        //取得checkbox全部的value用'，'串成字串並返回其值 getAllcheckBoxValue_M
        var getAllcheckBoxValue_M = function (groupName) {
            var checkboxGroup = $(groupName);
            var backStr = undefined;
            var checkedCount = 0;
            $.each(checkboxGroup, function (i, v) {
                if ($(v).prop("checked")) {
                    if (checkedCount == 0) {
                        backStr = $(v).val();
                        checkedCount += 1;
                    } else {
                        backStr += ",";
                        backStr += $(v).val();
                        checkedCount += 1;
                    }
                }
            });
            return backStr;
        };

        //5.時間日期工具 dateTimeTool
        //5-1.取得昨日日期 getYesTodayStr_M
        //5-2.取得今日日期 getTodayStr_M
        //5-3.sql日期格式轉換成datePicker格式 sqlDateTOdatePickDate_M
        //5-4.datePicker格式換成sql日期格式 datePickDateTOsqlDate_M
        var today = new Date();
        var todayY_M = today.getFullYear();
        var todayM_M = today.getMonth() + 1;
        var todayD_M = today.getDate();
        var yesToday = new Date();
        yesToday.setDate(yesToday.getDate() - 1);
        var yesTodayY_M = yesToday.getFullYear();
        var yesTodayM_M = yesToday.getMonth() + 1;
        var yesTodayD_M = yesToday.getDate();
        //取得昨日日期 getYesTodayStr_M
        var getYesTodayStr_M = function (dateType) {
            if (dateType == "dp") { //Datepicker =dp
                return yesTodayM_M + "/" + yesTodayD_M + "/" + yesTodayY_M;
            } else if (dateType == "sql") {
                return yesTodayY_M + "-" + yesTodayM_M + "-" + yesTodayD_M + " 00:00:00.000";
            } else if (dateType == "normal") {
                return yesTodayY_M + "/" + yesTodayM_M + "/" + yesTodayD_M;
            }
        };
        //取得今日日期 getTodayStr_M
        var getTodayStr_M = function (dateType) {
            if (dateType == "dp") { //Datepicker =dp
                return todayM_M + "/" + todayD_M + "/" + todayY_M;
            } else if (dateType == "sql") {
                return todayY_M + "-" + todayM_M + "-" + todayD_M + " 00:00:00.000";
            } else if (dateType == "normal") {
                return todayY_M + "/" + todayM_M + "/" + todayD_M;
            }
        };
        //sql日期格式轉換成datePicker格式 sqlDateTOdatePickDate_M
        var sqlDateTOdatePickDate_M = function (date) {
            var dateArr = date.split('/');
            return dateArr[1] + "/" + dateArr[2] + "/" + dateArr[0];
        };
        //datePicker格式換成sql日期格式 datePickDateTOsqlDate_M
        var datePickDateTOsqlDate_M = function (date) {
            var dateArr = date.split('/');
            return dateArr[2] + "-" + dateArr[0] + "-" + dateArr[1] + " 00:00:00.000";
        };
        //6.通用資料工具 commonDataTool
        //6-1.製作台灣各縣市selectOption getCityListHtmlTagOption_M
        //6-2.取得電話區碼列表 getZoneCodeHtmlTagOption_M

        //製作台灣各縣市selectOption getCityListHtmlTagOption_M
        /*
         m.Address = {
                getCityListHtmlTagOption: function (idOrClassName,val) {
                    $(idOrClassName).empty();
                    var sb = new m.String.StringBuilder();;
                    sb.append("<option value=''>請選擇城市</option>");
                    sb.append("<option value='台北市'>台北市</option>");
                    sb.append("<option value='基隆市'>基隆市</option>");
                    sb.append("<option value='新北市'>新北市</option>");
                    sb.append("<option value='宜蘭縣'>宜蘭縣</option>");
                    sb.append("<option value='新竹市'>新竹市</option>");
                    sb.append("<option value='新竹縣'>新竹縣</option>");
                    sb.append("<option value='桃園市'>桃園市</option>");
                    sb.append("<option value='苗栗縣'>苗栗縣</option>");
                    sb.append("<option value='台中市'>台中市</option>");
                    sb.append("<option value='彰化縣'>彰化縣</option>");
                    sb.append("<option value='南投縣'>南投縣</option>");
                    sb.append("<option value='嘉義市'>嘉義市</option>");
                    sb.append("<option value='嘉義縣'>嘉義縣</option>");
                    sb.append("<option value='雲林縣'>雲林縣</option>");
                    sb.append("<option value='台南市'>台南市</option>");
                    sb.append("<option value='高雄市'>高雄市</option>");
                    sb.append("<option value='澎湖縣'>澎湖縣</option>");
                    sb.append("<option value='屏東縣'>屏東縣</option>");
                    sb.append("<option value='台東縣'>台東縣</option>");
                    sb.append("<option value='花蓮縣'>花蓮縣</option>");
                    sb.append("<option value='金門縣'>金門縣</option>");
                    sb.append("<option value='連江縣'>連江縣</option>");
                    sb.append("<option value='南海諸島'>南海諸島</option>");
                    $(idOrClassName).append(sb.toString());
                    if (!m.Check.isEmptyStr(val)) {
                        $(idOrClassName).val(val);
                    }
                    
                },
                TownList: {
                    "台北市": ["100-中正區", "103-大同區", "104-中山區", "105-松山區", "106-大安區", "108-萬華區", "110-信義區", "111-士林區", "112-北投區", "114-內湖區", "115-南港區", "116-文山區"],
                    "基隆市": ["200-仁愛區", "201-信義區", "202-中正區", "203-中山區", "204-安樂區", "205-暖暖區", "206-七堵區"],
                    "新北市": ["207-萬里區", "208-金山區", "220-板橋區", "221-汐止區", "222-深坑區", "223-石碇區", "224-瑞芳區", "226-平溪區", "227-雙溪區", "228-貢寮區", "231-新店區", "232-坪林區", "233-烏來區", "234-永和區", "235-中和區", "236-土城區", "237-三峽區", "238-樹林區", "239-鶯歌區", "241-三重區", "242-新莊區", "243-泰山區", "244-林口區", "247-蘆洲區", "248-五股區", "249-八里區", "251-淡水區", "252-三芝區", "253-石門區"],
                    "宜蘭縣": ["260-宜蘭市", "261-頭城鎮", "262-礁溪鄉", "263-壯圍鄉", "264-員山鄉", "265-羅東鎮", "266-三星鄉", "267-大同鄉", "268-五結鄉", "269-冬山鄉", "270-蘇澳鎮", "272-南澳鄉"],
                    "新竹市": ["300-東區", "300-北區", "300-香山區"],
                    "新竹縣": ["302-竹北市", "303-湖口鄉", "304-新豐鄉", "305-新埔鎮", "306-關西鎮", "307-芎林鄉", "308-寶山鄉", "310-竹東鎮", "311-五峰鄉", "312-橫山鄉", "313-尖石鄉", "314-北埔鄉", "315-峨嵋鄉"],
                    "桃園市": ["320-中壢區", "324-平鎮區", "325-龍潭區", "326-楊梅區", "327-新屋區", "328-觀音區", "330-桃園區", "333-龜山區", "334-八德區", "335-大溪區", "336-復興區", "337-大園區", "338-蘆竹區"],
                    "苗栗縣": ["350-竹南鎮", "351-頭份鎮", "352-三灣鄉", "353-南庄鄉", "354-獅潭鄉", "356-後龍鎮", "357-通霄鎮", "358-苑裡鎮", "360-苗栗市", "361-造橋鄉", "362-頭屋鄉", "363-公館鄉", "364-大湖鄉", "365-泰安鄉", "366-銅鑼鄉", "367-三義鄉", "368-西湖鄉", "369-卓蘭鄉"],
                    "台中市": ["400-中區", "401-東區", "402-南區", "403-西區", "404-北區", "406-北屯區", "407-西屯區", "408-南屯區", "411-太平區", "412-大里區", "413-霧峰區", "414-烏日區", "420-豐原區", "421-后里區", "422-石岡區", "423-東勢區", "424-和平區", "426-新社區", "427-潭子區", "428-大雅區", "429-神岡區", "432-大肚區", "433-沙鹿區", "434-龍井區", "435-梧棲區", "436-清水區", "437-大甲區", "438-外埔區", "439-大安區"],
                    "彰化縣": ["500-彰化市", "502-芬園鄉", "503-花壇鄉", "504-秀水鄉", "505-鹿港鎮", "506-福興鄉", "507-線西鄉", "508-和美鎮", "509-伸港鄉", "510-員林鎮", "511-社頭鄉", "5112-永靖鄉", "513-埔心鄉", "514-溪湖鎮", "515-大村鄉", "516-埔鹽鄉", "520-田中鎮", "521-北斗鎮", "522-田尾鄉", "523-埤頭鄉", "524-溪州鄉", "525-竹塘鄉", "526-二林鎮", "527-大城鄉", "528-芳苑鄉", "530-二水鄉"],
                    "南投縣": ["540-南投市", "541-中寮鄉", "542-草屯鎮", "544-國姓鄉", "545-埔里鎮", "546-仁愛鄉", "551-名間鄉", "552-集集鄉", "553-水里鄉", "555-魚池鄉", "556-信義鄉", "557-竹山鎮", "558-鹿谷鄉"],
                    "嘉義市": ["600-東區", "600-西區"],
                    "嘉義縣": ["602-番路鄉", "603-梅山鄉", "604-竹崎鄉", "605-阿里山鄉", "606-中埔鄉", "607-大埔鄉", "608-水上鄉", "611-鹿草鄉", "612-太保市", "613-朴子市", "614-東石鄉", "615-六腳鄉", "616-新港鄉", "621-民雄鄉", "622-大林鎮", "623-溪口鄉", "624-義竹鄉", "625-布袋鎮"],
                    "雲林縣": ["630-斗南鎮", "631-大埤鄉", "632-虎尾鎮", "633-土庫鎮", "634-褒忠鄉", "635-東勢鄉", "636-臺西鄉", "637-崙背鄉", "638-麥寮鄉", "640-斗六市", "643-林內鄉", "646-古坑鄉", "647-莿桐鄉", "648-西螺鎮", "649-二崙鄉", "651-北港鎮", "652-水林鄉", "653-口湖鄉", "654-四湖鄉", "655-元長鄉"],
                    "台南市": ["700-中西區", "701-東區", "702-南區", "704-北區", "708-安平區", "709-安南區", "710-永康區", "711-歸仁區", "712-新化區", "713-左鎮區", "714-玉井區", "715-楠西區", "716-南化區", "717-仁德區", "718-關廟區", "719-龍崎區", "720-官田區", "721-麻豆區", "722-佳里區", "723-西港區", "724-七股區", "725-將軍區", "726-學甲區", "727-北門區", "730-新營區", "731-後壁區", "732-白河區", "733-東山區", "734-六甲區", "735-下營區", "736-柳營區", "737-鹽水區", "741-善化區", "742-大內區", "743-山上區", "744-新市區", "745-安定區"],
                    "高雄市": ["800-新興區", "801-前金區", "802-苓雅區", "803-鹽埕區", "804-鼓山區", "805-旗津區", "806-前鎮區", "807-三民區", "811-楠梓區", "812-小港區", "813-左營區", "814-仁武區", "815-大社區", "820-岡山區", "821-路竹區", "822-阿蓮區", "823-田寮區", "824-燕巢區", "825-橋頭區", "826-梓官區", "827-彌陀區", "828-永安區", "829-湖內區", "830-鳳山區", "831-大寮區", "832-林園區", "833-鳥松區", "840-大樹區", "842-旗山區", "843-美濃區", "844-六龜區", "845-內門區", "846-杉林區", "847-甲仙區", "848-桃源區", "849-那碼夏", "851-茂林區", "852-茄萣區"],
                    "澎湖縣": ["880-馬公市", "881-西嶼鄉", "882-望安鄉", "883-七美鄉", "884-白沙鄉", "885-湖西鄉"],
                    "屏東縣": ["900-屏東市", "901-三地門鄉", "902-霧台鄉", "903-瑪家鄉", "904-九如鄉", "905-里港鄉", "906-高樹鄉", "907-鹽埔鄉", "908-長治鄉", "909-麟洛鄉", "911-竹田鄉", "912-內埔鄉", "913-萬丹鄉", "920-潮州鎮", "921-泰武鄉", "922-來義鄉", "923-萬巒鄉", "924-嵌頂鄉", "925-新埤鄉", "926-南州鄉", "927-林邊鄉", "928-東港鎮", "929-琉球鄉", "931-佳冬鄉", "932-新園鄉", "940-枋寮鄉", "941-枋山鄉", "942-春日鄉", "943-獅子鄉", "944-車城鄉", "945-牡丹鄉", "946-恆春鎮", "947-滿州鄉"],
                    "台東縣": ["950-台東市", "951-綠島鄉", "952-蘭嶼鄉", "953-延平鄉", "954-卑南鄉", "955-鹿野鄉", "956-關山鎮", "957-海端鄉", "958-池上鄉", "959-東河鄉", "961-成功鎮", "962-長濱鄉", "963-太麻里鄉", "964-金峰鄉", "965-大武鄉", "966-達仁鄉"],
                    "花蓮縣": ["970-花蓮市", "971-新城鄉", "972-秀林鄉", "973-吉安鄉", "974-壽豐鄉", "975-鳳林鎮", "976-光復鄉", "977-豐濱鄉", "978-瑞穗鄉", "979-萬榮鄉", "981-玉里鎮", "982-卓溪鄉", "983-富里鄉"],
                    "金門縣": ["890-金沙鎮", "891-金湖鎮", "892-金寧鄉", "893-金城鎮", "894-烈嶼鄉", "896-烏坵鄉"], "連江縣": ["209-南竿鄉", "210-北竿鄉", "211-莒光鄉", "212-東引"],
                    "南海諸島": ["817-東沙", "819-西沙"]
                },
                makeCityListAndTownListHtmlTagSelect: function (cityIdOrClassName, townIdOrClassName, cityCode, townCode) {
                    //取得htmlTagOption城市列表
                    this.getCityListHtmlTagOption(cityIdOrClassName, cityCode);
                    //取得htmlTagOption區鄉鎮列表
                    var getTownList = function (code) {
                        console.log("getTownList start");
                        $(townIdOrClassName).empty();
                        var city = undefined;
                        if (m.Check.isEmptyStr(cityCode)) {
                            city = $(this).val();
                            console.log("getTownList city1=" + city);
                        } else {
                            city = cityCode;
                            cityCode = undefined;
                            console.log("getTownList city2=" + city);
                        }
                        var sb = new m.String.StringBuilder();
                        sb.append("<option value=' '>請選擇區鄉鎮</option>");
                        console.log("TownList=" + m.Address.TownList);
                        $.each(m.Address.TownList, function (i, v) {
                            if (i == city) {
                                $.each(v, function (ii, vv) {
                                    townAndCode = vv.split("-");
                                    sb.append("<option value = '");
                                    sb.append(townAndCode[0]);
                                    sb.append("'>");
                                    sb.append(townAndCode[1]);
                                    sb.append("</option>");
                                });
                            }
                        });
                        $(townIdOrClassName).append(sb.toString());
                        console.log("code=" + code.toString());
                        if (!m.Check.isEmptyStr(code.toString())) {
                            console.log("code=aaa");
                            $(townIdOrClassName).val(code);
                        }
                    };
        
                    //將取得htmlTagOption區鄉鎮列表的方法系結再城市select上面
                    $(cityIdOrClassName).on("change", getTownList);
                    if (!m.Check.isEmptyStr(townCode)) {
                        getTownList(townCode);
                    } 
        
                },
                //製作selectTag的城市及鄉鎮列表=====================================end
            };
        */
        //取得電話區碼列表 getZoneCodeHtmlTagOption_M
        var getZoneCodeHtmlTagOption_M = function (idOrClassName) {
            $(idOrClassName).empty();
            var sb = new m.String.StringBuilder();
            sb.append("<option value='02'>02</option>");
            sb.append("<option value='03'>03</option>");
            sb.append("<option value='037'>037</option>");
            sb.append("<option value='04'>04</option>");
            sb.append("<option value='049'>049</option>");
            sb.append("<option value='05'>05</option>");
            sb.append("<option value='06'>06</option>");
            sb.append("<option value='07'>07</option>");
            sb.append("<option value='08'>08</option>");
            sb.append("<option value='089'>089</option>");
            sb.append("<option value='082'>082</option>");
            sb.append("<option value='0826'>0826</option>");
            sb.append("<option value='0836'>0836</option>");
            $(idOrClassName).append(sb.toString());
        };
        //7.HTML tag 製作工具 htmlTagMakeTool
        //7-1.tr製作 makeTrTag_M
        //7-2.Img製作 makeImgTag_M
        //7-3.td製作 makeTdTag_M
        //7-4.th製作 makeThTag_M
        //7-5.body製作 makeTb_M

        //tr製作 makeTrTag_M
        var makeTrTag_M = function (sb, trInner, attr) {
            sb.append("<tr ");
            sb.append(attr);
            sb.append(">");
            sb.append(trInner);
            sb.append("</tr>");
        };

        //Img製作 makeImgTag_M
        var makeImgTag_M = function (attr) {
            var sb = new StringBuilder_M();
            sb.append("<img ");
            sb.append(attr);
            sb.append("/>");
            return sb.toString();
        };
        //td製作 makeTdTag_M
        var makeTdTag_M = function (sb, tdInner, attr) {
            sb.append("<td ");
            sb.append(attr);
            sb.append(">");
            sb.append(tdInner);
            sb.append("</td>");
        };
        //th製作 makeThTag_M
        var makeThTag_M = function (sb, thInner, attr) {
            sb.append("<th ");
            sb.append(attr);
            sb.append(">");
            sb.append(thInner);
            sb.append("</th>");
        };
        //body製作 makeTb_M
        var makeTb_M = function (dataArr, tbID, affterAppendFuc) {
            var sbtr = new StringBuilder_M();
            var sbtd = undefined;;
            $.each(dataArr, function (i, v) {
                sbtd = new StringBuilder_M();
                $.each(v, function (ii, vv) {
                    makeTdTag_M(sbtd, vv[0], vv[1]);
                });
                makeTrTag_M(sbtr, sbtd.toString());
                sbtd = null;
            });
            append_M(tbID, sbtr.toString());
            if (affterAppendFuc != null) {
                affterAppendFuc();
            };

        };

        //=============================================================================
        //scriptH
        var CustomerManageHandlerUrl_G = "customerManageHandler.ashx";
        //客戶會員編號
        var M_ID_G = "<%=getM_ID()%>";
        //客戶名稱
        var M_Name_G = "<%=getM_ID()%>";
        //使用者員工編號
        var U_Num_M = "<%=getU_Num()%>";
        U_Num_M = U_Num_M.toUpperCase();
        //使用者員工姓名
        var U_Name_G = "<%=getU_Name()%>";
        //使用者部門代號
        var U_MDEP_G = "<%=getU_MDEP()%>";
        var U_POSITION_G = "<%=getU_POSITION()%>";

        //使用者公司代號
        var ComID_G = "<%=getComID()%>";
        //使用者主管
        var U_LeaderName_G = "<%=getU_LeaderName()%>";

        //客戶業務員代號
        var MC_G = undefined;
        var tempMC_G = undefined;
        //客戶業務員姓名
        var MC_Name_G = undefined;
        //客戶業務員公司代號
        var MC_Com_G = undefined;
        //客戶代碼
        var M_Num_G = undefined;
        //目前登入IP
        var IP_G = "<%=getIP()%>";
        var MTel1_G = undefined;
        var MTel2_G = undefined;
        var MTel3_G = undefined;
        var T_id_G = undefined;
        var TagType_G = undefined;
        var TradeRecordListJson_G = undefined;
        var WarningMassage_G = undefined;
        var WarningID_G = undefined;
        var getMoneyFormat_M = function (num) {
            var money = undefined;
            money = num.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
            return money;
        };
        var getNowDateTimeStr = function () {
            var d = new Date();
            var Y = d.getFullYear().toString();
            var M = (d.getMonth() + 1).toString();
            var D = (d.getDate()).toString();
            var h = (d.getHours()).toString();
            var m = (d.getMinutes()).toString();
            var s = (d.getSeconds()).toString();
            return Y + "/" + M + "/" + D + " " + h + ":" + m + ":" + s;
        };
        var getRandom_M = function (min, max) {
            return Math.floor(Math.random() * (max - min + 1)) + min;
        };
        var EmptyEqualZero_M = function (str) {
            if (isEmptyStr(str)) {
                str == "0";
            }
            return str;
        };
        var dataCheckTF_M = function (type) {
            var checks = $("." + type);
            var val = undefined;
            var errorCount = 0;
            var errorItemName = undefined;
            var back = true;
            $.each(checks, function (i, v) {
                val = $(v).val();
                if (isEmptyStr(val)) {
                    errorCount += 1;
                    errorItemName = $(v).attr("itemName");
                    alert(errorItemName + "欄位 請填入資料");
                    $(v).focus();
                    back = false;
                    return back;
                }
            });
            return back;
        };

        var isEndDateBigThanStartDate_M = function (startDate, endDate) {

            var doNext = false;
            if (!isEmptyStr(startDate) && !isEmptyStr(endDate)) {
                doNext = true;
                var startDateT = new Date(startDate);
                var endDateT = new Date(endDate);
                if (startDateT > endDateT) {
                    doNext = false;
                    alert("請正確選取日期");
                }
            } else if (isEmptyStr(startDate) && isEmptyStr(endDate)) {
                doNext = false;
                alert("請正確選取日期");
            }

            return doNext;
        }
        //客戶個人資料
        var CustomerDataJson_G = undefined;
        var CallRecordList_G = undefined;

        var Log_M = function (str) {
            console.log(str);
        };

        function clearFileInput(id) {
            var oldInput = document.getElementById(id);

            var newInput = document.createElement("input");

            newInput.type = "file";
            newInput.id = oldInput.id;
            newInput.name = oldInput.name;
            newInput.className = oldInput.className;
            newInput.style.cssText = oldInput.style.cssText;
            // TODO: copy any other relevant attributes 

            oldInput.parentNode.replaceChild(newInput, oldInput);
        }



        var setWebFaxFuc = function () {
            var data = "add_ip=" + IP_G + "&T_id=" + T_id_G + "&M_ID=" + M_ID_G + "&action=setWebFax";
            var success = function (back) {
                if (back != "成功") {
                    alert(back);
                }
            };
            var error = function (e) { Log_M("setWebFaxFuc error=" + e); unBlockUI_M(); };
            //alert('call customerManageHandler');
            ajax_M(CustomerManageHandlerUrl_G, data, success, error);//<=====================================
        };

        //取得註記歷史資料
        var getTagHistory = function () {
            blockUI_M();
            var data = "M_ID=" + M_ID_G + "&action=getTagHistory";
            var success = function (back) {
                empty_M("#tagHistoryTb");
                var sb = new string_M.StringBuilder();
                if (isEmptyStr(back)) {
                    $("#tagHistoryTb").append("<tr style='margin-right:0 auto;text-align:center;'><th id='' class='textAlignCenter' colspan='4'>無資料</th></tr>")
                } else {
                    var json = jsonParse_M(back);
                    $.each(json, function (i, v) {
                        /*sb.append("<tr style='margin-right:0 auto;text-align:center;'><th class='textAlignCenter'>");*/
                        //onclick="getTableContent(this)"
                        sb.append("<tr style='margin-right:0 auto;text-align:center;'><th class='textAlignCenter' onclick='getTableContent(this)'>");
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
                unBlockUI_M();
            };
            //alert('call customerManageHandler');
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<=====================================
            $("#tagHistoryTabDiv").show();
        };

        //做長註記
        var doLongTag = function () {
            var Light_Status = "";
            if (ComID_G == "HG05") {
                Light_Status = "Y";
            } else {
                Light_Status = "G";
            }
            var data = "M_ID=" + M_ID_G + "&MC=" + U_Num_M + "&MC_Name=" + U_Name_G + "&MC_Com=" + ComID_G + "&Light_Status=" + Light_Status + "&action=doLongTag";
            var success = function (back) {
                alert("案件已長註記！");
                location.href = "customerDetail.aspx?M_ID=" + M_ID_G;
            };
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<=====================================
        };


        //是否有長註記過
        var isLongTag = function () {
            var data = "M_ID=" + M_ID_G + "&U_Num=" + U_Num_M + "&tagType=" + TagType_G + "&action=isLongTag";
            var success = function (back) {
                if (back == "false") {
                    doLongTag();
                } else {
                    alert("近90日內已註記過，不可重覆註記！");
                }
            };
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<=====================================
        };

        var testTelCode = function (str, id) {
            if (isEmptyStr(str)) {
                $(id).val("02");
            } else {
                $(id).val(str);
            }
        };

        var getCheckBoxValueStr = function (objs, idOrClassName) {
            var back = "";
            var backCodeName = "";
            var count = 0;
            $.each(objs, function (i, v) {
                if ($(v).prop("checked") == true) {
                    if (count > 0) {
                        back += ",";
                        backCodeName += ",";
                    }
                    back += val_M(v);
                    backCodeName += attr_M(v, "txt");
                    count += 1;
                }
            });
            val_M(idOrClassName + "CodeStr", back);
            val_M(idOrClassName, backCodeName);
        };

        var putCheckBoxValue = function (valueStr, objs) {
            var valueStrArr = valueStr.split(',');
            $.each(objs, function (i, v) {
                $.each(valueStrArr, function (ii, vv) {
                    if (val_M(v) == vv) {
                        $(v).prop("checked", true);
                    }
                });
            });
        };

        var getEditCustomerDataSuccess = function (back) {
            var json = jsonParse_M(back);
            //燈號
            $(".ecLight_Status").val(json[0].Light_Status);
            $("#ecLight_StatusHidden").attr("CodeName", $Common.Code.deCode("Light_Status", json[0].Light_Status));

            //性名
            $(".ecM_Name").val(json[0].M_Name);
            $(".ecM_Sax").val(json[0].M_Sax);
            $("#ecM_SaxHidden").attr("CodeName", $Common.Code.deCode("M_Sax", json[0].M_Sax));
            //等級
            $(".ecM_Grade").val(json[0].M_Grade);
            //手機
            MTel1_G = json[0].MTel1;
            MTel2_G = json[0].MTel2;
            MTel3_G = json[0].MTel3;
            $(".ecMTel1").val(MTel1_G);
            $(".ecMTel2").val(MTel2_G);
            $(".ecMTel3").val(MTel3_G);

            //業務員
            $(".ecMCdata").val(json[0].MC);
            var mcdataName = (($("#ecMCdata :selected").text()).split("-"))[3];
            $("#ecMCdataHidden").attr("CodeName", mcdataName);
            $("#ecMCdataHidden").attr("comid", $("#ecMCdata :selected").attr("comid"));
            //會員編號
            $(".ecM_Num").val(json[0].M_Num);

            //會員密碼
            $(".ecM_Password").val(json[0].M_Password);

            //住家電話1
            testTelCode(json[0].HTel_Zone, ".ecHTel_Zone");
            $(".ecHTel").val(json[0].HTel);

            //住家電話2
            testTelCode(json[0].HTel_Zone1, ".ecHTel_Zone1");
            $(".ecHTel1").val(json[0].HTel1);

            //公司電話1
            testTelCode(json[0].OTel_Zone, ".ecOTel_Zone");
            $(".ecOTel").val(json[0].OTel);
            $(".ecOTel_Sub").val(json[0].OTel_Sub);

            //公司電話2
            testTelCode(json[0].OTel_Zone1, ".ecOTel_Zone1");
            $(".ecOTel1").val(json[0].OTel1);
            $(".ecOTel_Sub1").val(json[0].OTel_Sub1);
            //傳真1
            testTelCode(json[0].Fax_Zone, ".ecFax_Zone");
            $(".ecFax").val(json[0].Fax);

            //傳真2
            testTelCode(json[0].Fax_Zone1, ".ecFax_Zone1");
            $(".ecFax1").val(json[0].Fax1);

            //身分證字號
            $(".ecM_SD").val(json[0].M_SD);

            //email
            $(".ecEMail").val(json[0].EMail);

            //生日

            if (!check_M.isEmptyDate(json[0].BirthDay_Date)) {
                $CommonTool.Date.putInputValueWithDatepickerDateTimeStr(".ecBirthDay_Date", json[0].BirthDay_Date);
            }

            //建檔日
            $(".ecadd_date").val(json[0].add_date);

            //製作selectTag的城市及鄉鎮列表
            $CommonTool.Address.makeCityListAndTownListHtmlTagSelect(".ecHCity", ".ecHTown", json[0].HCity, json[0].HZipCode);
            $("#ecHTownHidden").attr("CodeName", $("#ecHTown :selected").text());

            $(".ecH_Address").val(json[0].H_Address);

            //公司地址
            $CommonTool.Address.makeCityListAndTownListHtmlTagSelect(".ecOCity", ".ecOTown", json[0].OCity, json[0].OZipCode);
            $("#ecOTownHidden").attr("CodeName", $("#ecOTown :selected").text());
            $(".ecO_Address").val(json[0].O_Address);

            //郵件收件人
            $(".ecRecipient").val(json[0].Recipient);

            //投資金額
            $(".ecInv_Money").val(getMoneyFormat_M(json[0].Inv_Money));
            $("#ecInv_MoneyHidden").attr("CodeName", json[0].Inv_MoneyCodeName);

            //電話來源
            var MPGOMs = $('input[name="MPGOM"]');
            putCheckBoxValue(json[0].Program, MPGOMs);
            val_M("#ecProgramHidden", json[0].ProgramCodeName);
            //$("#ecProgramHidden").attr("CodeName", json[0].ProgramCodeName);
            // $(".ecProgram").val(json[0].Program);
            //詢問之分析師
            var Analysts = $('input[name="Analyst"]');
            putCheckBoxValue(json[0].Analyst, Analysts);
            val_M("#ecAnalystHidden", json[0].AnalystName);

            // $("#ecAnalystHidden").attr("CodeName", json[0].AnalystName);
            //$(".ecAnalyst").val(json[0].Analyst);

            //詢問之商品
            var PRODTs = $('input[name="PRODT"]');
            putCheckBoxValue(json[0].Product, PRODTs);
            val_M("#ecProductHidden", json[0].ProductCodeName);
            // $("#ecProductHidden").attr("CodeName", json[0].ProductCodeName);
            //$(".ecProduct").val(json[0].Product);

            //詢問之備註
            $(".ecM_Note").val(json[0].M_Note);
            //取得活動訊息列表
            //getActivityMessageHtml(json[0].MTel1);

            $.unblockUI();
        };
        ///////////////////////////////////////////////////////////////////////////////////////////////
        var getIddataByMid = function () {
            var data = "M_ID=" + M_ID_G + "&action=getIddataByMid";
            var success = function (back) {
                return back;
            };
            var error = function (e) { Log_M("getIddataByMid error=" + e); unBlockUI_M(); };
            ajax_M(CustomerManageHandlerUrl_G, data, success, error);//<=====================================
        };

        var getTableContent = function (node) {
            // 按鈕的父節點的父節點是tr。
            var tr1 = node.parentNode.parentNode;
            alert(tr1.rowIndex);
            alert(tr1.cells[0].childNodes[0].value); //獲取的方法一
            alert(tr1.cells[0].innerText);
            // 通過以下方式找到table物件，在獲取tr，td。然後獲取td的html內容
            var table = document.getElementById("tb1");//獲取第一個表格

            var child = table.getElementsByTagName("tr")[rowIndex - 1];//獲取行的第一個單元格

            var text = child.firstChild.innerHTML;
            window.alert("表格第" + rowIndex + "的內容為: " + text);
        }

        var getDetailCustomerDataSuccess = function (back) {
            var json = jsonParse_M(back);
            CustomerDataJson_G = json;
            //燈號
            $("#Light_Status").attr("src", "../../../img/" + json[0].Light_Status + ".png");
            $("#Light_Status").attr("light", json[0].Light_Status);
            //狀態
            if (isEmptyStr(json[0].Assign_Name)) {
                $("#status").html("無");
            } else {
                $("#status").html(json[0].Assign_Name + "-" + json[0].Assign_Date);
            }
            if (isEmptyStr(json[0].DM_MarkTime)) {
                if (!isEmptyStr(json[0].LongTag_Date)) {
                    text_M("#tag", "長註" + json[0].LongTag_Date);
                }
                var MC = json[0].MC;
                if ((MC == "Z0000010" || MC == "Z0000011" || MC == "Z0300001" || MC == "Z0300002" || MC == "Z6000001") && (U_MDEP_G == "0007" || U_MDEP_G == "0011" || U_MDEP_G == "0017")) {
                    $("#longTag").html("<button id='doLongTag'><a href='#'>長註記</a></button>");
                    TagType_G = "long";
                    $("#isLongTag").on("click", isLongTag);
                } else if ((MC == "Z0000002" || MC == "Z0000003" || MC == "Z0010001" || MC == "Z001000") && (U_MDEP_G == "0002" || U_MDEP_G == "0006" || U_MDEP_G == "0015" || U_MDEP_G == "0016")) {
                    $("#longTag").html("<button id='doLongTag'><a href='#'>註記</a></button>");
                    TagType_G = "short";
                    $("#isLongTag").on("click", isLongTag);
                }
            } else {
                text_M("#tag", "派發短記(" + json[0].DM_MC_Name + "-" + json[0].DM_MarkTime);
            }
            $("#tagHistory").html("<a class=bluelink10 href='javascript: void(0)'>(註記歷史)</a>");
            $("#tagHistory").on("click", getTagHistory);
            if (json[0].N_Call_tag == "1") {
                show_M("#noCallImg");
            }
            M_Name_G = json[0].M_Name;
            ////性名
            if (json[0].M_Sax == "M") {
                html_M("#M_Name", json[0].M_Name + "  先生");

            } else {
                html_M("#M_Name", json[0].M_Name + "  小姐");
            }
            $(".M_Name").text(json[0].M_Name);
            text_M("#title", json[0].M_Name);
            //等級
            $("#M_Grade").text(json[0].M_Grade);

            //手機
            if (isEmptyStr(json[0].MTel1)) {
                if (isEmptyStr(json[0].MTel2)) {
                    if (isEmptyStr(json[0].MTel3)) {
                        $("#MTel").text("");
                    } else {
                        $("#MTel").text(json[0].MTel3);
                    }
                } else {
                    if (isEmptyStr(json[0].MTel3)) {
                        $("#MTel").text(json[0].MTel2);
                    } else {
                        $("#MTel").text(json[0].MTel2 + "," + json[0].MTel3);
                    }
                }
            } else {
                if (isEmptyStr(json[0].MTel2)) {
                    if (isEmptyStr(json[0].MTel3)) {
                        $("#MTel").text(json[0].MTel1);
                    } else {
                        $("#MTel").text(json[0].MTel1 + "," + json[0].MTel3);
                    }
                } else {
                    if (isEmptyStr(json[0].MTel3)) {
                        $("#MTel").text(json[0].MTel1 + "," + json[0].MTel2);
                    } else {
                        $("#MTel").text(json[0].MTel1 + "," + json[0].MTel2 + "," + json[0].MTel3);
                    }
                }
            }

            //業務員
            $("#MC_Name").text(json[0].MC_Name);
            MC_G = json[0].MC;
            MC_Name_G = json[0].MC_Name;
            MC_Com_G = json[0].MC_COM;
            //會員編號
            $("#M_Num").text(json[0].M_Num);
            M_Num_G = json[0].M_Num;
            //會員密碼
            $("#M_Password").text(json[0].M_Password);

            //住家電話1
            if (!isEmptyStr(json[0].HTel)) {
                $("#HTel").text(json[0].HTel_Zone + "-" + json[0].HTel);
            }

            //住家電話2
            if (!isEmptyStr(json[0].HTel1)) {
                $("#HTel1").text(json[0].HTel_Zone1 + "-" + json[0].HTel1);
            }

            //公司電話1
            if (!isEmptyStr(json[0].OTel)) {
                $("#OTel").text(json[0].OTel_Zone + "-" + json[0].OTel + "-" + json[0].OTel_Sub);
            }

            //公司電話2
            if (!isEmptyStr(json[0].OTel1)) {
                $("#OTel1").text(json[0].OTel_Zone1 + "-" + json[0].OTel1 + "-" + json[0].OTel_Sub1);
            }

            //傳真1
            if (!isEmptyStr(json[0].Fax)) {
                $("#Fax").text(json[0].Fax_Zone + "-" + json[0].Fax);
            }

            //傳真2
            if (!isEmptyStr(json[0].Fax1)) {
                $("#Fax1").text(json[0].Fax_Zone1 + "-" + json[0].Fax1);
            }

            //身分證字號
            var M_SD_tagText = "";
            var tempText = "";
            if (json[0].M_SD_tag == "1") {
                if (getIddataByMid() == "0") {
                    tempText = "-手工)";
                } else {
                    tempText = "-網路上傳)";
                }
                M_SD_tagText = "<font color='green'><b>V</b></font> 影本(" + json[0].M_SD_Date + tempText;
            } else if (json[0].M_SD_tag == "0") {

                M_SD_tagText = "<font color='red'><b>X</b></font> 影本";
            }
            $("#M_SD").html(json[0].M_SD);
            $("#M_SD_tagText").html(M_SD_tagText);
            getKYC();
            getCDD();
            getCDDlist();
            //email
            $("#EMail").text(json[0].EMail);

            //生日
            var bd = json[0].BirthDay_Date;
            if (bd != "1900/1/1") {
                $("#BirthDay_Date").text(bd);
            }


            //建檔日
            $("#add_date").text(json[0].add_date);

            //住家地址
            if (!isEmptyStr(json[0].H_Address)) {
                $("#Haddress").text(json[0].HZipCode + json[0].HCity + json[0].HTown + json[0].H_Address);
            }


            //公司地址
            if (!isEmptyStr(json[0].O_Address)) {
                $("#Oaddress").text(json[0].OZipCode + json[0].OCity + json[0].OTown + json[0].O_Address);
            }


            //郵件收件人
            $("#Recipient").text(json[0].Recipient);

            //投資金額
            $("#Inv_Money").text(json[0].Inv_MoneyCodeName);

            //電話來源
            $("#Program").text(json[0].ProgramCodeName);

            //詢問之分析師
            $("#Analyst").text(json[0].AnalystName);

            //詢問之商品
            $("#Product").text(json[0].ProductCodeName);

            //詢問之備註
            //$("#M_Note").text(json[0].M_Note);
            html_M("#M_Note", json[0].M_Note);
            //取得活動訊息列表
            //getActivityMessageHtml(json[0].MTel1);


            $.unblockUI();
            /*startPage2();*/
        };
        var getKYC = function () {
            var success = function (back) {
                var str = undefined;
                if (isEmptyStr(back)) {
                    str = "<font color='red'><b>X</b></font>";
                } else {
                    str = "<font color='green'><b>V</b></font>";
                }
                $("#KYC").html(str);
            };
            var data = "M_ID=" + M_ID_G + "&action=getKYC";
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<==========================
        };
        var getCDD = function () {
            var success = function (back) {
                var str = undefined;
                if (isEmptyStr(back)) {
                    str = "<font color='red'><b>X</b></font>";
                } else {
                    str = "<font color='green'><b>V</b></font>";
                }
                $("#CDD").html(str);
            };
            var data = "M_ID=" + M_ID_G + "&action=getCDD";
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<==========================
        };
        var getCDDlist = function () {
            var success = function (back) {
                Log_M("getCDDlist");
                Log_M(back);
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                var sbTr = new StringBuilder_M();
                $.each(json, function (i, v) {
                    sb = new StringBuilder_M();
                    makeTdTag_M(sb, i + 1, "class='textAlignCenter'");
                    makeTdTag_M(sb, sqlDateTONormalDate_M(v.CDD_date), "class='textAlignCenter'");
                    makeTdTag_M(sb, v.CDD_StatusName, "class='textAlignCenter'");
                    makeTdTag_M(sb, v.MCname, "class='textAlignCenter'");
                    makeTdTag_M(sb, "", "class='textAlignCenter'");
                    makeTdTag_M(sb, "修", "class='textAlignCenter'");
                    makeTdTag_M(sb, "刪", "class='textAlignCenter'");
                    makeTrTag_M(sbTr, sb.toString());
                    sb = null;
                });

                append_M("#CDDevaluationTb", sbTr.toString());
            };
            var data = "M_ID=" + M_ID_G + "&action=getCDDlist";
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<==========================
        };
        var getCustomerData = function (success) {
            var data = "M_ID=" + M_ID_G + "&action=getCustomerData";
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<==========================
        };
        //取得付款類型(PT_Item)
        var getPT_Item = function () {
            PT_Item = $('#abcPT_Item').val();//取得付款類型
            //alert(PT_Item);
            if (PT_Item == "2") {
                //單筆
                //alert(PT_Item);
                $("#Paymoney").prop('disabled', true);//會費(單筆)
                $("#abcT_PType").prop('disabled', true);//付款方式
                $("#abcPaymoney1").prop('disabled', false);//金額1(@多筆)
                $("#abcPaymoney2").prop('disabled', false);//金額2(@多筆)
                $("#abcT_PType1").prop('disabled', false);//付款方式1
                $("#abcT_PType2").prop('disabled', false);//付款方式2
            }
            else {
                //多筆
                $("#Paymoney").prop('disabled', false);//會費(單筆)
                $("#abcT_PType").prop('disabled', false);//付款方式
                $("#abcPaymoney1").prop('disabled', true);//金額1(@多筆)
                $("#abcPaymoney2").prop('disabled', true);//金額2(@多筆)
                $("#abcT_PType1").prop('disabled', true);//付款方式1
                $("#abcT_PType2").prop('disabled', true);//付款方式2
            }
        };
        var ID_tag_html_Value;
        var KYC_tag_html_Value;
        var CDD_tag_html_Value;
        //var getID_tag_html_Value = function ()
        var getID_tag_html_Value = function (M_ID_G) {
            var M_ID = "<%=getM_ID()%>";
            alert(M_ID_G);
            var data = "M_ID=" + M_ID_G + "&action=getID_tag_html_Value";
            var success = function (back) {
                if (back != "成功") {
                    ID_tag_html_Value = back;
                    alert(ID_tag_html_Value);
                }
            };
            var error = function (e) { Log_M("setWebFaxFuc error=" + e); unBlockUI_M(); };
            //alert('call customerManageHandler');
            ajax_M(CustomerManageHandlerUrl_G, data, success, error);//<=====================================
        };
        var getKYC_tag_html_Value = function (M_ID_G) {
            var M_ID = "<%=getM_ID()%>";
            alert(M_ID_G);
            var data = "M_ID=" + M_ID_G + "&action=getKYC_tag_html_Value";
            var success = function (back) {
                if (back.trim().toString() == "") {
                    KYC_tag_html_Value = "<font color='red'><b>X</b></font>";

                }
            };
            var error = function (e) { Log_M("setWebFaxFuc error=" + e); unBlockUI_M(); };
            //alert('call customerManageHandler');
            ajax_M(CustomerManageHandlerUrl_G, data, success, error);//<=====================================
        };
        var getCDD_tag_html_Value = function (M_ID_G) {
            var M_ID = "<%=getM_ID()%>";
            alert(M_ID_G);
            var data = "M_ID=" + M_ID_G + "&action=getCDD_tag_html_Value";
            var success = function (back) {
                if (back != "成功") {
                    CDD_tag_html_Value = back;
                    alert(CDD_tag_html_Value);
                }
            };
            var error = function (e) { Log_M("setWebFaxFuc error=" + e); unBlockUI_M(); };
            //alert('call customerManageHandler');
            ajax_M(CustomerManageHandlerUrl_G, data, success, error);//<=====================================
        };
        var startThisPage = function () {
            //限制[設傳真稿][設][不設]不能同時選
            $("input[name=myCheckBox]").click(function () {
                var Selected = $(this).val();
                $("input[name=myCheckBox]").each(function (i) {
                    if ($(this).val() == Selected) $(this).prop("checked", true);
                    else $(this).prop("checked", false);
                });
            });
            //mess_other
            $("input[name=mess_other]").click(function () {
                var SelectedB_ = $(this).val();
                //不設
                $("input[name=mess_other]").each(function (i) {
                    if ($(this).val() == SelectedB_) $(this).prop("checked", true);
                    else $(this).prop("checked", false);
                });
            });
            //mess_other2
            $("input[name=mess_other2]").click(function () {
                var SelectedB = $(this).val();
                //不設
                $("input[name=mess_other2]").each(function (i) {
                    if ($(this).val() == SelectedB) $(this).prop("checked", true);
                    else $(this).prop("checked", false);
                });
            });
            //
            $("input[id=mess_other_3]").click(function () {
                var SelectedA = $(this).val();
                //不設
                $("input[id=fax]").each(function (i) {
                    if ($(this).val() == SelectedA) $(this).prop("checked", true);
                    else $(this).prop("checked", false);
                });
            });
            var M_ID = "<%=getM_ID()%>";
            var ID_tag_html_Value = getID_tag_html_Value(M_ID);//20230615要修改!!!
            var KYC_tag_html_Value = getKYC_tag_html_Value(M_ID);
            var CDD_tag_html_Value = getCDD_tag_html_Value(M_ID);
            //判斷為[手工]或[網路上傳]
            var ID_tag_html = document.getElementById("ID_tag");
            //var KYC_tag_html = document.getElementById("KYC_tag");
            //ID_tag_html_Value
            /* ID_tag_html.innerHTML = "<font color='red'><b>X</b></font> ID_tag_html";*/
            ID_tag_html.innerHTML = "<font color='red'><b>X</b></font>" + ID_tag_html_Value;
            var KYC_tag_html = document.getElementById("KYC_tag");
            KYC_tag_html.innerHTML = KYC_tag_html_Value;
            var CDD_tag_html = document.getElementById("CDD_tag");
            CDD_tag_html.innerHTML = "<font color='red'><b>X</b></font>" + CDD_tag_html_Value;
            //text_M("#note", "長註");
            getTabArea();
            //alert('startThisPage');
            /*簽核主管*/
            Select_Com_ = ComID_G;//使用者公司代號
            $Common.MITEM.getCustomerDetailAnalyst(CommonHandlerUrl_M, "#abcD_MP", "GetAnalyst", "option", Select_Com_, afterSuccessFucMREGT03);//20221207進度(實做這個!!)
            //$Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Dept", "Dept", "option", afterSuccessFucMREGT03);
            /*業績歸屬*/
            //$Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ", Select_Com, Select_Dept, "option", afterSuccessFucMREGT03);//20221207進度(實做這個!!)
            //$Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Dept", "Dept", "option", afterSuccessFucMREGT03);
            /*折讓案件 - 新案件 - 分析師abcD_MP*/
            //$Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ", Select_Com, Select_Dept, "option", afterSuccessFucMREGT03);//20221207進度(實做這個!!)

            /*折讓案件 - 新案件 - 服務項目abcD_Item*/
            //$Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ", Select_Com, Select_Dept, "option", afterSuccessFucMREGT03);//20221207進度(實做這個!!)
            onChange_M("#abcT_Type", function () {
                var SelectMP = val_M("#abcT_Type");
                alert(SelectMP);
                //$Common.MITEM.getCustomerDetailAnalyst_MITEM(CommonHandlerUrl_M, "#abcD_Item", "GetMITEM", "option", SelectMP, afterSuccessFucMREGT03);//20221207進度(實做這個!!)
                var Type1666_Visible = document.getElementById("Type1666");//特殊件-入帳人員
                Type1666_Visible.style.display = 'block';
                alert("入會方式:" + SelectMP);
                //0001:一般
                //0002:會場
                //0003:特殊
            });


            onChange_M("#abcD_MP", function () {
                var SelectMP = val_M("#abcD_MP");
                //alert(SelectMP);
                $Common.MITEM.getCustomerDetailAnalyst_MITEM(CommonHandlerUrl_M, "#abcD_Item", "GetMITEM", "option", SelectMP, afterSuccessFucMREGT03);//20221207進度(實做這個!!)

                alert(SelectMP);
            });
            onChange_M("#MP", function () {
                $Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ", Select_Com, Select_Dept, "option", afterSuccessFucMREGT03);//20221207進度(實做這個!!)
                $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Dept_Title", "Dept", "option", afterSuccessFucMREGT03);
                $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Dept", "Dept", "option", afterSuccessFucMREGT03);

            });
            onChange_M("#abcPT_Item", getPT_Item);//單筆/多筆(PT_Item=0(單筆)1(多筆))
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getPayTypeListHtmlTagOption", "PITEM", "option");
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#abcT_PType", "PITEM", "option");
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getPayTypeListHtmlTagOption", "PITEM", "option");
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#abcT_PType", "PITEM", "option");
            //分析師下拉選單
            //$Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "#abcMP_ID", ComID_G, "option", afterSuccessFuc);
            var SelectMP_ID = val_M("#abcMP_ID");
            onChange_M("#abcMP_ID", function () {
                var SelectMP_ID = val_M("#abcMP_ID");
                // $Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ", Select_Com, Select_Dept, "option", afterSuccessFucMREGT03);//20221207進度(實做這個!!)
                var SelectMP_ID = val_M("#abcMP_ID");

            });
            //var Select_Com = val_M("#Select_Com_Sign");//所選的公司
            //var Select_Dept = val_M("#Select_Dept_Sign");//所選的部門
            //var Select_Employ = val_M("$Select_Employ_Sign");//所選的人員姓名
            //[恢復/暫停]
            onChange_M("#P_StartStop", function () {
                var P_StartStop = val_M("#P_StartStop");
                //alert(P_StartStop);
                //$Common.MITEM.getCustomerDetailAnalyst_MITEM(CommonHandlerUrl_M, "#abcD_Item", "GetMITEM", "option", SelectMP, afterSuccessFucMREGT03);//20221207進度(實做這個!!)
                //RecoverStopDate
                var label = document.getElementById("RecoverStopDate");
                //var value = label.innerText;
                //alert("SHOW:"+P_StartStop);
                if (P_StartStop == 1) {
                    label.innerText = "暫停日期"
                }
                else {
                    label.innerText = "恢復日期";
                }

            });
            onChange_M("#abcMP_ID", function () {
                var MP_ID = val_M("#abcMP_ID");//所選的分析師會員編號

                //    //20230217work
                //    //種類下拉式選單
                //   alert("/所選的分析師會員編號:" + MP_ID);
                //    //20230217work
                //    //種類下拉式選單
                //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#abcMP_Item", MP_ID, "option");
                $Common.MITEM.getMP_ItemListHtmlTagOption(CommonHandlerUrl_M, "#abcMP_Item", MP_ID, "option");
            });
            //會員種類下拉選單(abcMP_Item)
            //取得付款方式下拉式選項
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#abcT_PType", "PITEM", "option");
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getPayTypeListHtmlTagOption", "PITEM", "option");

            //聯絡單種類下拉式選單變動
            $("#abcCF_Item").on("change", function () {
                //alert('hide!!!');
                $(customerDetail).hide();
                var Type = $("#abcCF_Item").val();//取得聯絡單種類代號
                //alert('聯絡單種類:' + Type);
                var typeABC = Type.toString();
                var customerDetail_Visible = document.getElementById("customerDetail");//客戶資料明細表
                //var Type0001_Visible = document.getElementById("Type1");///**********//***********/
                var Type0002_Visible = document.getElementById("Type2");// /**********//**********//**********//**********/
                var Type0031_Visible = document.getElementById("Type31");// /***********/
                var Type0032_Visible = document.getElementById("Type32");///***********/
                var Type0033_Visible = document.getElementById("Type33")///***********/
                var Type0004_Visible = document.getElementById("Type4");///**********/                //Type41
                var Type0044_Visible = document.getElementById("Type44");///*********/
                var Type0005_Visible = document.getElementById("Type5");//設訊
                //var Type0006_Visible = document.getElementById("Type6");//折讓案件
                var Type0007_Visible = document.getElementById("Type7");//折讓
                //Type9199
                //var Type0017_Visible = document.getElementById("Type17");//訂金件
                var Type0008_Visible = document.getElementById("Type8");//暫停/恢復
                var Type0009_Visible = document.getElementById("Type9");//退費
                var Type0010_Visible = document.getElementById("Type10");//業績歸屬
                var Type0011_Visible = document.getElementById("Type11");//更改責任助理
                var Type0012_Visible = document.getElementById("Type12");//ATM後五碼
                var Type0013_Visible = document.getElementById("Type13");//發票資料
                var Type0014_Visible = document.getElementById("Type14");//備註
                var Type0015_Visible = document.getElementById("Type15");//設電子委任契約書
                var Type0016_Visible = document.getElementById("Type16");//簽核主管
                var Type0017_Visible = document.getElementById("Type17");//訂金件
                var Type0018_Visible = document.getElementById("Type18");//轉換老師
                var Type0019_Visible = document.getElementById("Type19");//件別
                var Type0044_Visible = document.getElementById("Type44");//設傳真稿
                //var Test1_Visible = document.getElementById("test1");//test1
                //入會
                if (typeABC == "0001") {
                    $(customerDetail).hide();//客戶資料明細表隱藏
                    customerDetail_Visible.style.display == 'none';
                    //Test1_Visible.style.display = 'block';
                    //Type0001_Visible.style.display = 'block';
                    Type0002_Visible.style.display = 'block';
                    Type0031_Visible.style.display = 'block';
                    Type0032_Visible.style.display = 'block';
                    Type0033_Visible.style.display = 'block';
                    Type0004_Visible.style.display = 'block';//設定手機
                    Type0005_Visible.style.display = 'block';
                    //Type0006_Visible.style.display = 'block';
                    Type0007_Visible.style.display = 'none';//折讓
                    Type0008_Visible.style.display = 'none';//暫停/恢復
                    Type0009_Visible.style.display = 'none';//業績分類
                    Type0010_Visible.style.display = 'none';//業績歸屬
                    Type0011_Visible.style.display = 'none';//責任助理
                    Type0012_Visible.style.display = 'block';
                    Type0013_Visible.style.display = 'block';
                    Type0014_Visible.style.display = 'block';
                    Type0015_Visible.style.display = 'block';
                    //Type0016_Visible
                    Type0016_Visible.style.display = 'block';//簽核主管
                    //Type0017_Visible
                    Type0017_Visible.style.display = 'none';
                    Type0018_Visible.style.display = 'none';//轉換老師
                    Type0019_Visible.style.display = 'block';//件別
                    Type0044_Visible.style.display = 'block';//傳真稿
                }
                //設訊
                else if (typeABC == "0002") {

                    $(customerDetail).hide();//客戶資料明細表隱藏
                    customerDetail_Visible.style.display == 'none';
                    //Test1_Visible.style.display = 'none';
                    //Type0001_Visible.style.display = 'block';
                    Type0002_Visible.style.display = 'none';
                    Type0031_Visible.style.display = 'none';
                    Type0032_Visible.style.display = 'none';
                    Type0033_Visible.style.display = 'none';
                    Type0004_Visible.style.display = 'block';//設定手機
                    Type0005_Visible.style.display = 'block';
                    //Type0006_Visible.style.display = 'none';
                    Type0007_Visible.style.display = 'none';
                    Type0008_Visible.style.display = 'none';
                    Type0009_Visible.style.display = 'none';
                    Type0010_Visible.style.display = 'none';//業績歸屬
                    Type0011_Visible.style.display = 'none';
                    Type0012_Visible.style.display = 'none';//ATM後五碼
                    Type0013_Visible.style.display = 'none';//發票資料
                    Type0014_Visible.style.display = 'block';
                    Type0015_Visible.style.display = 'none';//電子委任契約書
                    Type0016_Visible.style.display = 'block';//簽核主管
                    Type0017_Visible.style.display = 'none';
                    Type0018_Visible.style.display = 'none';
                    Type0019_Visible.style.display = 'block';//件別
                    Type0044_Visible.style.display = 'none';//傳真稿
                }
                //設傳真稿
                else if (typeABC == "0003") {
                    $(customerDetail).hide();//客戶資料明細表隱藏
                    customerDetail_Visible.style.display == 'none';
                    //Test1_Visible.style.display = 'none';
                    //Type0001_Visible.style.display = 'block';
                    Type0002_Visible.style.display = 'none';
                    Type0031_Visible.style.display = 'none';
                    Type0032_Visible.style.display = 'none';
                    Type0033_Visible.style.display = 'none';
                    Type0004_Visible.style.display = 'none';
                    Type0005_Visible.style.display = 'none';
                    //Type0006_Visible.style.display = 'none';
                    Type0007_Visible.style.display = 'none';
                    Type0008_Visible.style.display = 'none';
                    Type0009_Visible.style.display = 'none';
                    Type0010_Visible.style.display = 'none';
                    Type0011_Visible.style.display = 'none';
                    Type0012_Visible.style.display = 'none';
                    Type0013_Visible.style.display = 'none';//發票資料
                    Type0014_Visible.style.display = 'block';
                    Type0015_Visible.style.display = 'none';//電子委任契約書
                    Type0016_Visible.style.display = 'block';//簽核主管
                    Type0017_Visible.style.display = 'none';
                    Type0018_Visible.style.display = 'none';
                    Type0019_Visible.style.display = 'block';//件別
                    Type0044_Visible.style.display = 'block';//傳真稿
                }
                //業績歸屬
                else if (typeABC == "0004") {
                    $(customerDetail).hide();//客戶資料明細表隱藏
                    customerDetail_Visible.style.display == 'none';
                    //Test1_Visible.style.display = 'none';
                    //Type0001_Visible.style.display = 'block';
                    Type0002_Visible.style.display = 'none';
                    Type0031_Visible.style.display = 'none';
                    Type0032_Visible.style.display = 'none';
                    Type0033_Visible.style.display = 'none';
                    Type0004_Visible.style.display = 'none';//設定手機
                    Type0005_Visible.style.display = 'none';
                    //Type0006_Visible.style.display = 'none';
                    Type0007_Visible.style.display = 'none';
                    Type0008_Visible.style.display = 'none';
                    Type0009_Visible.style.display = 'none';
                    Type0010_Visible.style.display = 'block';//業績歸屬
                    Type0011_Visible.style.display = 'none';
                    Type0012_Visible.style.display = 'none';
                    Type0013_Visible.style.display = 'none';//發票資料
                    Type0014_Visible.style.display = 'block';//備註
                    Type0015_Visible.style.display = 'none';//電子委任契約書
                    Type0016_Visible.style.display = 'block';//簽核主管
                    Type0017_Visible.style.display = 'none';
                    Type0018_Visible.style.display = 'none';
                    Type0019_Visible.style.display = 'block';//件別
                    Type0044_Visible.style.display = 'none';//傳真稿
                }
                //更改責任助理
                else if (typeABC == "0005") {
                    $(customerDetail).hide();//客戶資料明細表隱藏
                    customerDetail_Visible.style.display == 'none';
                    //Test1_Visible.style.display = 'none';
                    //Type0001_Visible.style.display = 'block';
                    Type0002_Visible.style.display = 'none';//入會方式/業績種類/入帳資訊/入會時間
                    Type0031_Visible.style.display = 'none';
                    Type0032_Visible.style.display = 'none';
                    Type0033_Visible.style.display = 'none';//設鎖碼影音/設付費文章/設付費影片
                    Type0004_Visible.style.display = 'none';//設定手機
                    Type0005_Visible.style.display = 'none';//設訊
                    //Type0006_Visible.style.display = 'block';
                    Type0007_Visible.style.display = 'none';//折讓
                    Type0008_Visible.style.display = 'none';//暫停/恢復
                    Type0009_Visible.style.display = 'none';//業績分類
                    Type0010_Visible.style.display = 'none';//業績歸屬
                    Type0011_Visible.style.display = 'block';//責任助理
                    //補上退費
                    Type0012_Visible.style.display = 'none';
                    Type0013_Visible.style.display = 'none';//發票資料
                    Type0014_Visible.style.display = 'block';
                    Type0015_Visible.style.display = 'none';//電子委任契約書
                    //Type0016_Visible
                    Type0016_Visible.style.display = 'block';//簽核主管
                    //Type0017_Visible
                    Type0017_Visible.style.display = 'none';
                    Type0018_Visible.style.display = 'none';
                    Type0019_Visible.style.display = 'block';//件別
                    Type0044_Visible.style.display = 'none';//傳真稿
                }
                //折讓
                else if (typeABC == "0006") {
                    //alert("折讓!!");
                    $(customerDetail).hide();//客戶資料明細表隱藏
                    customerDetail_Visible.style.display == 'none';
                    //Test1_Visible.style.display = 'none';
                    //Type0001_Visible.style.display = 'block';
                    Type0002_Visible.style.display = 'none';
                    Type0031_Visible.style.display = 'none';
                    Type0032_Visible.style.display = 'none';
                    Type0033_Visible.style.display = 'none';
                    Type0004_Visible.style.display = 'none';
                    Type0005_Visible.style.display = 'none';
                    //Type0006_Visible.style.display = "none";
                    Type0007_Visible.style.display = 'block';//折讓
                    //Type0007_Visible.style.display = 'none';
                    Type0008_Visible.style.display = 'none';
                    Type0009_Visible.style.display = 'none';
                    Type0010_Visible.style.display = 'none';
                    Type0011_Visible.style.display = 'none';
                    Type0012_Visible.style.display = 'none';
                    Type0013_Visible.style.display = 'none';//發票資料
                    Type0014_Visible.style.display = 'block';
                    Type0015_Visible.style.display = 'none';//電子委任契約書
                    Type0016_Visible.style.display = 'block';//簽核主管
                    Type0017_Visible.style.display = 'none';
                    Type0018_Visible.style.display = 'none';//轉換老師
                    Type0044_Visible.style.display = 'none';//傳真稿
                }
                //訂金件
                else if (typeABC == "0007") {
                    $(customerDetail).hide();//客戶資料明細表隱藏
                    customerDetail_Visible.style.display == 'none';
                    //Test1_Visible.style.display = 'none';
                    //Type0001_Visible.style.display = 'block';
                    Type0002_Visible.style.display = 'none';
                    Type0031_Visible.style.display = 'none';
                    Type0032_Visible.style.display = 'none';
                    Type0033_Visible.style.display = 'none';
                    Type0004_Visible.style.display = 'none';//設定手機
                    Type0005_Visible.style.display = 'none';
                    //Type0006_Visible.style.display = 'none';
                    Type0007_Visible.style.display = "none";
                    Type0008_Visible.style.display = 'none';
                    Type0009_Visible.style.display = 'none';
                    Type0010_Visible.style.display = 'none';
                    Type0011_Visible.style.display = 'none';
                    Type0012_Visible.style.display = 'none';
                    Type0013_Visible.style.display = 'none';//發票資料
                    Type0014_Visible.style.display = 'block';//備註
                    Type0015_Visible.style.display = 'none';//電子委任契約書
                    Type0016_Visible.style.display = 'block';//簽核主管
                    Type0017_Visible.style.display = 'block';
                    Type0018_Visible.style.display = 'none';
                    Type0019_Visible.style.display = 'block';//訂金件
                    Type0044_Visible.style.display = 'none';//傳真稿
                }
                //退費
                else if (typeABC == "0008") {
                    $(customerDetail).hide();//客戶資料明細表隱藏
                    customerDetail_Visible.style.display == 'none';
                    //Test1_Visible.style.display = 'none';
                    //Type0001_Visible.style.display = 'block';
                    Type0002_Visible.style.display = 'none';
                    Type0031_Visible.style.display = 'none';
                    Type0032_Visible.style.display = 'none';
                    Type0033_Visible.style.display = 'none';
                    Type0004_Visible.style.display = 'none';
                    Type0005_Visible.style.display = 'none';
                    //Type0006_Visible.style.display = 'none';
                    Type0007_Visible.style.display = 'none';
                    Type0008_Visible.style.display = "none";//暫停/恢復
                    Type0009_Visible.style.display = "block";//退費
                    Type0010_Visible.style.display = 'none';
                    Type0011_Visible.style.display = 'none';
                    Type0012_Visible.style.display = 'none';
                    Type0013_Visible.style.display = 'none';//發票資料
                    Type0014_Visible.style.display = 'block';//備註
                    Type0015_Visible.style.display = 'none';//電子委任契約書
                    Type0016_Visible.style.display = 'block';//簽核主管
                    Type0017_Visible.style.display = 'none';
                    Type0018_Visible.style.display = 'none';
                    Type0044_Visible.style.display = 'none';//傳真稿
                    Type0019_Visible.style.display = "block";//件別
                    //Type0019_Visible
                }
                //暫停/恢復
                else if (typeABC == "0009") {
                    $(customerDetail).hide();//客戶資料明細表隱藏
                    customerDetail_Visible.style.display == 'none';
                    //Test1_Visible.style.display = 'none';
                    //Type0001_Visible.style.display = 'block';
                    Type0002_Visible.style.display = 'none';
                    Type0031_Visible.style.display = 'none';
                    Type0032_Visible.style.display = 'none';
                    Type0033_Visible.style.display = 'none';
                    Type0004_Visible.style.display = 'none';
                    Type0005_Visible.style.display = 'none';
                    //Type0006_Visible.style.display = 'none';
                    Type0007_Visible.style.display = 'none';
                    Type0008_Visible.style.display = "block";//暫停/恢復
                    Type0009_Visible.style.display = "none";//退費
                    Type0010_Visible.style.display = 'none';
                    Type0011_Visible.style.display = 'none';
                    Type0012_Visible.style.display = 'none';
                    Type0013_Visible.style.display = 'none';//發票資料
                    Type0014_Visible.style.display = 'block';//備註
                    Type0015_Visible.style.display = 'none';//電子委任契約書
                    Type0016_Visible.style.display = 'block';//簽核主管
                    Type0018_Visible.style.display = 'none';
                    Type0044_Visible.style.display = 'none';//傳真稿
                }
                //轉換老師
                else if (typeABC == "0010") {//轉老師
                    $(customerDetail).hide();//客戶資料明細表隱藏
                    customerDetail_Visible.style.display == 'none';
                    //Test1_Visible.style.display = 'none';
                    //Type0001_Visible.style.display = 'block';
                    Type0002_Visible.style.display = 'none';
                    Type0031_Visible.style.display = 'none';
                    Type0032_Visible.style.display = 'none';
                    Type0033_Visible.style.display = 'none';
                    Type0004_Visible.style.display = 'none';
                    Type0005_Visible.style.display = 'none';
                    //Type0006_Visible.style.display = 'none';
                    Type0007_Visible.style.display = 'none';
                    Type0008_Visible.style.display = 'none';
                    Type0009_Visible.style.display = 'none';
                    Type0010_Visible.style.display = "none";
                    Type0011_Visible.style.display = 'none';
                    Type0012_Visible.style.display = 'none';
                    Type0013_Visible.style.display = 'none';//發票資料
                    Type0014_Visible.style.display = 'block';//備註
                    Type0015_Visible.style.display = 'none';//電子委任契約書
                    Type0016_Visible.style.display = 'block';//簽核主管
                    Type0018_Visible.style.display = 'block';
                    Type0019_Visible.style.display = 'block';//件別
                    Type0044_Visible.style.display = 'none';//傳真稿
                }
                //其他
                else if (typeABC == "0011") {
                    $(customerDetail).hide();//客戶資料明細表隱藏
                    customerDetail_Visible.style.display == 'none';
                    //Test1_Visible.style.display = 'none';
                    //Type0001_Visible.style.display = 'block';
                    Type0002_Visible.style.display = 'none';
                    Type0031_Visible.style.display = 'none';
                    Type0032_Visible.style.display = 'none';//設付費文章
                    Type0033_Visible.style.display = 'none';//設鎖碼影音/設付費文章/設付費影片
                    Type0004_Visible.style.display = 'none';
                    Type0005_Visible.style.display = 'none';
                    //Type0006_Visible.style.display = 'none';
                    Type0007_Visible.style.display = 'none';
                    Type0008_Visible.style.display = 'none';
                    Type0009_Visible.style.display = 'none';
                    Type0010_Visible.style.display = 'none';
                    Type0011_Visible.style.display = "none";
                    Type0012_Visible.style.display = 'none';
                    Type0013_Visible.style.display = 'none';//發票資料
                    Type0014_Visible.style.display = 'block';//備註
                    Type0015_Visible.style.display = 'none';//電子委任契約書
                    Type0016_Visible.style.display = 'block';//簽核主管
                    Type0019_Visible.style.display = 'block';//件別
                    Type0018_Visible.style.display = 'none';
                    Type0044_Visible.style.display = 'none';//傳真稿
                }
                else {
                    Type0001_Visible.style.display = 'block';
                    alert("START!");
                }
                //alert(Type);
            });
            //$("#abcCF_Item2").on("change", function () {
            //    alert('!!!');
            //    var Type = $("#abcCF_Item2").val();//取得聯絡單種類代號
            //    var typeABC = Type;
            //    var Type0001_Visible = document.getElementById("Type1");//入會
            //    var Type0002_Visible = document.getElementById("Type2");//設訊
            //    var Type0003_Visible = document.getElementById("Type3");//設傳真稿
            //    var Type0004_Visible = document.getElementById("Type4");//業績歸屬
            //    var Type0005_Visible = document.getElementById("Type5");//責任歸屬
            //    var Type0006_Visible = document.getElementById("Type6");//更改責任助理
            //    var Type0007_Visible = document.getElementById("Type7");//折讓
            //    var Type0008_Visible = document.getElementById("Type8");//訂金件
            //    var Type0009_Visible = document.getElementById("Type9");//退費
            //    var Type0010_Visible = document.getElementById("Type10");//暫停/恢復
            //    var Type0011_Visible = document.getElementById("Type11");//其他設
            //    if (typeABC = "0001") {
            //        alert(typeABC);
            //        Type0001_Visible.style.display = "block";
            //        Type0002_Visible.style.display = "block";
            //        Type0003_Visible.style.display = "block";
            //        Type0004_Visible.style.display = 'none';
            //        Type0005_Visible.style.display = 'none';
            //        Type0006_Visible.style.display = 'none';
            //        Type0007_Visible.style.display = 'none';
            //        Type0008_Visible.style.display = 'none';
            //        Type0009_Visible.style.display = 'none';
            //        Type0010_Visible.style.display = 'none';
            //        Type0011_Visible.style.display = 'none';
            //    }
            //    else if (typeABC == "0002") {
            //        Type0001_Visible.style.display = 'none';
            //        Type0002_Visible.style.display = "block";
            //        Type0003_Visible.style.display = 'none';
            //        Type0004_Visible.style.display = 'none';
            //        Type0005_Visible.style.display = 'none';
            //        Type0006_Visible.style.display = 'none';
            //        Type0007_Visible.style.display = 'none';
            //        Type0008_Visible.style.display = 'none';
            //        Type0009_Visible.style.display = 'none';
            //        Type0010_Visible.style.display = 'none';
            //        Type0011_Visible.style.display = 'none';
            //    }
            //    else if (typeABC == "0003") {
            //        Type0001_Visible.style.display = 'none';
            //        Type0002_Visible.style.display = 'none';
            //        Type0003_Visible.style.display = "block";
            //        Type0004_Visible.style.display = 'none';
            //        Type0005_Visible.style.display = 'none';
            //        Type0006_Visible.style.display = 'none';
            //        Type0007_Visible.style.display = 'none';
            //        Type0008_Visible.style.display = 'none';
            //        Type0009_Visible.style.display = 'none';
            //        Type0010_Visible.style.display = 'none';
            //        Type0011_Visible.style.display = 'none';
            //    }
            //    else if (typeABC == "0004") {
            //        Type0001_Visible.style.display = 'none';
            //        Type0002_Visible.style.display = 'none';
            //        Type0003_Visible.style.display = 'none';
            //        Type0004_Visible.style.display = "block";
            //        Type0005_Visible.style.display = 'none';
            //        Type0006_Visible.style.display = 'none';
            //        Type0007_Visible.style.display = 'none';
            //        Type0008_Visible.style.display = 'none';
            //        Type0009_Visible.style.display = 'none';
            //        Type0010_Visible.style.display = 'none';
            //        Type0011_Visible.style.display = 'none';
            //    }
            //    else if (typeABC == "0005") {
            //        Type0001_Visible.style.display = 'none';
            //        Type0002_Visible.style.display = 'none';
            //        Type0003_Visible.style.display = 'none';
            //        Type0004_Visible.style.display = 'none';
            //        Type0005_Visible.style.display = "block";
            //        Type0006_Visible.style.display = 'none';
            //        Type0007_Visible.style.display = 'none';
            //        Type0008_Visible.style.display = 'none';
            //        Type0009_Visible.style.display = 'none';
            //        Type0010_Visible.style.display = 'none';
            //        Type0011_Visible.style.display = 'none';
            //    }
            //    else if (typeABC == "0006") {
            //        Type0001_Visible.style.display = 'none';
            //        Type0002_Visible.style.display = 'none';
            //        Type0003_Visible.style.display = 'none';
            //        Type0004_Visible.style.display = 'none';
            //        Type0005_Visible.style.display = 'none';
            //        Type0006_Visible.style.display = "block";
            //        Type0007_Visible.style.display = 'none';
            //        Type0008_Visible.style.display = 'none';
            //        Type0009_Visible.style.display = 'none';
            //        Type0010_Visible.style.display = 'none';
            //        Type0011_Visible.style.display = 'none';
            //    }
            //    else if (typeABC == "0007") {
            //        Type0001_Visible.style.display = 'none';
            //        Type0002_Visible.style.display = 'none';
            //        Type0003_Visible.style.display = 'none';
            //        Type0004_Visible.style.display = 'none';
            //        Type0005_Visible.style.display = 'none';
            //        Type0006_Visible.style.display = 'none';
            //        Type0007_Visible.style.display = "block";
            //        Type0008_Visible.style.display = 'none';
            //        Type0009_Visible.style.display = 'none';
            //        Type0010_Visible.style.display = 'none';
            //        Type0011_Visible.style.display = 'none';
            //    }
            //    else if (typeABC == "0008") {
            //        Type0001_Visible.style.display = 'none';
            //        Type0002_Visible.style.display = 'none';
            //        Type0003_Visible.style.display = 'none';
            //        Type0004_Visible.style.display = 'none';
            //        Type0005_Visible.style.display = 'none';
            //        Type0006_Visible.style.display = 'none';
            //        Type0007_Visible.style.display = 'none';
            //        Type0008_Visible.style.display = "block";
            //        Type0009_Visible.style.display = 'none';
            //        Type0010_Visible.style.display = 'none';
            //        Type0011_Visible.style.display = 'none';
            //    }
            //    else if (typeABC == "0009") {
            //        Type0001_Visible.style.display = 'none';
            //        Type0002_Visible.style.display = 'none';
            //        Type0003_Visible.style.display = 'none';
            //        Type0004_Visible.style.display = 'none';
            //        Type0005_Visible.style.display = 'none';
            //        Type0006_Visible.style.display = 'none';
            //        Type0007_Visible.style.display = 'none';
            //        Type0008_Visible.style.display = 'none';
            //        Type0009_Visible.style.display = "block";
            //        Type0010_Visible.style.display = 'none';
            //        Type0011_Visible.style.display = 'none';
            //    }
            //    else if (typeABC == "0010") {
            //        Type0001_Visible.style.display = 'none';
            //        Type0002_Visible.style.display = 'none';
            //        Type0003_Visible.style.display = 'none';
            //        Type0004_Visible.style.display = 'none';
            //        Type0005_Visible.style.display = 'none';
            //        Type0006_Visible.style.display = 'none';
            //        Type0007_Visible.style.display = 'none';
            //        Type0008_Visible.style.display = 'none';
            //        Type0009_Visible.style.display = 'none';
            //        Type0010_Visible.style.display = "block";
            //        Type0011_Visible.style.display = 'none';
            //    }
            //    else if (typeABC == "0011") {
            //        Type0001_Visible.style.display = 'none';
            //        Type0002_Visible.style.display = 'none';
            //        Type0003_Visible.style.display = 'none';
            //        Type0004_Visible.style.display = 'none';
            //        Type0005_Visible.style.display = 'none';
            //        Type0006_Visible.style.display = 'none';
            //        Type0007_Visible.style.display = 'none';
            //        Type0008_Visible.style.display = 'none';
            //        Type0009_Visible.style.display = 'none';
            //        Type0010_Visible.style.display = 'none';
            //        Type0011_Visible.style.display = "block";
            //    }
            //    //alert(Type);
            //})

            //alert(Type);
            //type.style.display = "block";
            //var test2 = val_M("#Select_Employ");
            //var test3 = (val_M("abcCF_Item"));
            //var y = parseInt(val_M("#year"));
            //alert(Type);
            /* };*/
            //
            //var Type0001_Visible = document.getElementById("Type1");//入會才會顯示
            //var Type0002_Visible = document.getElementById("Type2");
            //var Type0003_Visible = document.getElementById("Type3");
            //var Type0004_Visible = document.getElementById("Type4");
            //var Type0005_Visible = document.getElementById("Type5");
            //var Type0006_Visible = document.getElementById("Type6");
            //var Type0007_Visible = document.getElementById("Type7");
            //var Type0008_Visible = document.getElementById("Type8");
            //var Type0009_Visible = document.getElementById("Type9");
            //var Type0010_Visible = document.getElementById("Type10");
            //var Type0011_Visible = document.getElementById("Type11");
            //Type0001_Visible.style.display = 'none';
            //Type0002_Visible.style.display = 'none';
            //Type0003_Visible.style.display = 'none';
            //Type0004_Visible.style.display = 'none';
            //Type0005_Visible.style.display = 'none';
            //Type0006_Visible.style.display = 'none';
            //Type0007_Visible.style.display = 'none';
            //Type0008_Visible.style.display = 'none';
            //Type0009_Visible.style.display = 'none';
            //Type0010_Visible.style.display = 'none';
            //Type0011_Visible.style.display = 'none';
            alert('取得詳細客戶資料!');
            getCustomerData(getDetailCustomerDataSuccess);
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#Select_Com_Transfer3", "Com", "option", "", afterSuccFunc3, "");
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#Select_Com_Transfer2", "Com", "option", "", afterSuccFunc3, "");
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#Select_Com_Transfer1", "Com", "option", "", afterSuccFunc3, "");
            $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Dept_Transfer3", "Dept", "option", afterSuccessFucMREGT03);
            $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Dept_Transfer2", "Dept", "option", afterSuccessFucMREGT03);
            $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Dept_Transfer1", "Dept", "option", afterSuccessFucMREGT03);
            //取得紀錄html檔
            //getTradeRecordHtml();
            //tagHistoryTabDivHide();
        };
        // };


        var tagHistoryTabDivHide = function () {
            $("#tagHistoryTb").empty();
            $("#tagHistoryTabDiv").hide();
        };

        var getTmessage = function (num) {

            var backString = undefined;
            switch (num) {
                case "1":
                    backString = "設(一般)";
                    break;
                case "2":
                    backString = "不設";
                    break;
                case "3":
                    backString = "業務自帶";
                    break;
                case "4":
                    backString = "特助或行政帶";
                    break;
                case "5":
                    backString = "設解盤";
                    break;
                case "6":
                    backString = "設特別";
                    break;
                case "7":
                    backString = "設飆股";
                    break;
            }
            return backString;
        };

        var getTfax = function (num) {
            var backString = undefined;
            switch (num) {
                case "1":
                    backString = "設(自取)";
                    break;
                case "2":
                    backString = "設(網路傳真)";
                    break;
                case "3":
                    backString = "不設";
                    break;
                case "4":
                    backString = "設解盤";
                    break;
                case "5":
                    backString = "設特別";
                    break;
                case "6":
                    backString = "設飆股";
                    break;

            }
            return backString;
        };


        //開啟交易紀錄-詳細資料視窗================================================start
        var openTradeRecordDetailDiv = function (tid) {
            var json = TradeRecordListJson_G;
            $.each(json, function (i, v) {
                if (v.T_ID == tid) {
                    //交易紀錄詳細資料
                    $("#dT_ID").text(v.T_ID);
                    $("#dT_Status").html(v.T_Status);
                    $("#dMP_Name").text(v.MP_Name + "-" + v.T_ItemName);
                    $("#dT_Type").text(v.T_TypeName);
                    $("#AccountType").text("[" + v.T_TypeName + "件]入帳 :");
                    $("#dT_AccountDate").text(v.T_AccountDate);
                    $("#dMC").text(v.MC + "-" + v.MC_Name);
                    $("#dT_PayMoney").text(getMoneyFormat_M(v.T_PayMoney) + "元");
                    $("#dT_StartDate").text(v.T_StartDate);
                    $("#dT_EndDate").text(v.T_EndDate);
                    $("#days").text(v.maturityDays + "/" + v.contractDays);
                    var message = undefined;
                    if (v.T_Message.length > 1) {
                        var arr = v.T_Message.split(',');
                        $.each(arr, function (i, v) {
                            if (message == undefined) {
                                message = getTmessage(v);
                            } else {
                                message += ",";
                                message += getTmessage(v);
                            }
                        });
                    } else {
                        message = getTmessage(v.T_Message);
                    }

                    $("#dT_Message").text(message);
                    var fax = undefined;
                    if (v.T_Fax.length > 1) {
                        var arr = v.T_Fax.split(',');
                        $.each(arr, function (i, v) {
                            if (fax == undefined) {
                                fax = getTfax(v);
                            } else {
                                fax += ",";
                                fax += getTfax(v);
                            }
                        });
                    } else {
                        fax = getTfax(v.T_Fax);
                    }
                    $("#dT_Fax").text(fax);

                    $("#invoice").empty();
                    var invoiceMessageSb = new string_M.StringBuilder();
                    if (isEmptyStr(v.invoice_num)) {

                        invoiceMessageSb.append("尚未開發票<br>開立方式：");
                        if (v.INV_open_Item == "2") {

                            invoiceMessageSb.append("手開");
                        } else {

                            invoiceMessageSb.append("系統開立");
                        }
                    } else {
                        invoiceMessageSb.append("發票號碼：");
                        invoiceMessageSb.append(v.invoice_num);
                        invoiceMessageSb.append("<br>開立日期：");
                        invoiceMessageSb.append(v.Invoice_CreateDate);
                        invoiceMessageSb.append("<br>發票種類：");
                        if (v.INV_Item == "1") {
                            invoiceMessageSb.append("二聯");
                        } else if (v.INV_Item == "2") {
                            invoiceMessageSb.append("三聯");
                        }
                        invoiceMessageSb.append("<br>公司抬頭：");
                        invoiceMessageSb.append(v.INV_ComName);
                        invoiceMessageSb.append("<br>公司統編：");
                        invoiceMessageSb.append(v.INV_UnifyNum);
                        invoiceMessageSb.append("<br>寄發狀況：");
                        switch (v.INV_SendState) {
                            case "1":
                                invoiceMessageSb.append("一般");
                                break;
                            case "2":
                                invoiceMessageSb.append("空白信封");
                                break;
                            case "3":
                                invoiceMessageSb.append("發票轉交業務");
                                break;
                            case "4":
                                invoiceMessageSb.append("不寄");
                                break;
                            case "5":
                                invoiceMessageSb.append("捐贈");
                                break;
                        }
                    }
                    $("#invoice").append(invoiceMessageSb.toString());
                    var tpsArr = undefined;
                    if (v.T_PS.indexOf("<br>") != -1) {
                        tpsArr = v.T_PS.split("<br>");
                        $("#T_PS").text(tpsArr[0]);
                    } else {
                        $("#T_PS").text(v.T_PS);
                    }
                }
            });
            //$("#tradeDetailDiv").show();
            $('#tradeDetailTabDialog').dialog("open");
        };
        //開啟交易紀錄-詳細資料視窗================================================end
        var getAdmissionTypeList = function (item, thisId, itemId) {
            //Log_M("getAdmissionTypeList start");
            //Log_M("item=" + item + "thisId=" + thisId + "itemId=" + itemId);
            if (itemId == undefined) {
                itemId = $(this).attr("itemId");
            }
            $(itemId).empty();
            var analyst = $(thisId).val();
            var afterSuccessFuc = function (back) {
                if (item.length == 4) {
                    $(itemId).val(item);
                } else {
                    $(itemId).val("0001");
                }
            };
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, itemId, analyst, "option", afterSuccessFuc);
        };
        var accountTypeShowHide = function () {
            var type = $(this).val();
            var AccountType = $(this).attr("AccountType");
            var special = $(this).attr("special");
            var Venue = $(this).attr("Venue");
            var normal = $(this).attr("normal");
            var VenueID = $(this).attr("VenueID");
            switch (type) {
                case "0001":
                    $(AccountType).text("一般");
                    disabledTrue_M(special);
                    disabledTrue_M(Venue);
                    disabledFalse_M(normal);
                    break;
                case "0002":
                    $(AccountType).text("會場");
                    disabledTrue_M(special);
                    disabledTrue_M(normal);
                    disabledFalse_M(Venue);
                    //取得會場資料
                    //$Common.MVENU.getVenueListHtmlTagOption(CommonHandlerUrl_M, VenueID);
                    break;
                case "0003":
                    $(AccountType).text("特殊");
                    disabledFalse_M(normal);
                    disabledTrue_M(Venue);
                    disabledFalse_M(special);
                    break;
            }
        };
        //取得交易紀錄明細for恢復修改用 
        var openRestoreEditTradeRecordDetailDiv = function (tid) {
            var json = TradeRecordListJson_G;
            $.each(json, function (i, v) {
                if (v.T_ID == tid) {
                    $("#reseT_ID").val(v.T_ID);
                    $("#reseT_StartDate").val(v.T_StartDate);
                    $("#reseT_EndDate").val(v.T_EndDate);
                    $("#reseT_PauseDate").val(v.T_PauseDate);
                    $("#reseT_PauseDateDays").val(v.T_PauseDateDays);
                    $("#reseT_RestDate").val(sqlDateTOdatePickDate(Today_G));

                    $("#reseNewT_EndDate").val(sqlDateTOdatePickDate(Today_G));

                    var arr = undefined;
                    var str = "";
                    if (v.T_PS.indexOf("<br>") == -1) {
                        $("#reseHistoryT_PS").html(v.T_PS);
                    } else {
                        arr = v.T_PS.split("<br>");
                        $.each(arr, function (i, v) {
                            str += arr[i] + "\n";

                        })
                        $("#reseHistoryT_PS").html(str);
                    }
                }
            });

            $('#restoreEditTradeDetailDialog').dialog("open");
        };
        //取得交易紀錄明細for暫停修改用
        var openStopEditTradeRecordDetailDiv = function (tid) {
            var json = TradeRecordListJson_G;
            $.each(json, function (i, v) {
                if (v.T_ID == tid) {
                    $("#seT_ID").val(v.T_ID);
                    $("#seT_PauseDate").val(sqlDateTOdatePickDate(Today_G));
                    var arr = undefined;
                    var str = "";
                    if (v.T_PS.indexOf("<br>") == -1) {
                        $("#seHistoryT_PS").html(v.T_PS);
                    } else {
                        arr = v.T_PS.split("<br>");
                        $.each(arr, function (i, v) {
                            str += arr[i] + "\n";

                        })
                        $("#seHistoryT_PS").html(str);
                    }


                }
            });
            $('#stopEditTradeDetailDialog').dialog("open");
        };
        //取得交易紀錄明細for續約修改用
        var openRenewalEditTradeRecordDetailDiv = function (tid) {
            //取得付款方式列表
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#reT_PType", "PITEM");
            //取得公司資料
            $Common.MINVO.getCompanyHtmlTagOption(CommonHandlerUrl_M, "#reINV_COM");


            var json = TradeRecordListJson_G;
            $.each(json, function (i, v) {
                if (v.T_ID == tid) {
                    $("#reT_ID").val(v.T_ID);
                    $("#reMP_Name").val(v.MP);
                    $("#reT_Type").val(v.T_Type);
                    getAdmissionTypeList(v.T_Item, "#reMP_Name", "#reT_Item");
                    $("#reT_AccountDate").val(sqlDateTOdatePickDate(v.T_AccountDate));
                    $("#reINV_Createdate").val(sqlDateTOdatePickDate(Today_G));
                    $("#reT_StartDate").val(sqlDateTOdatePickDate(Today_G));
                    $("#reT_EndDate").val(sqlDateTOdatePickDate(Today_G));
                    $("#reT_Fax").val(v.T_Fax);
                    $("#reMC").val(U_Num_M);
                };
            });
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#reT_PType", "PITEM", "option");
            $('#renewalEditTradeDetailDialog').dialog("open");

        };

        var getFileDataList = function (tid) {
            var data = "T_ID=" + tid + "&action=getFileDataList";
            var success = function (back) {
                var json = jsonParse_M(back);
                var sb = new string_M.StringBuilder();
                $.each(json, function (i, v) {
                    sb.append("<a href='/uploadfile/MTRAT/");
                    sb.append(v.File_Name);
                    sb.append("'>")
                    sb.append(v.File_Title);
                    sb.append("</a>")
                })
                $("#eFile").append(sb.toString());
            };
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<===================
        };
        var sqlDateTONormalDate_M = function (date) {
            var dateArr1 = date.split(' ');
            var dateArr = dateArr1[0].split('/');
            return dateArr[0] + "/" + dateArr[1] + "/" + dateArr[2];
        };
        var sqlDateTOdatePickDate = function (date) {
            var dateArr = date.split('/');
            return dateArr[1] + "/" + dateArr[2] + "/" + dateArr[0];
        };
        var datePickDateTOsqlDate = function (date) {
            var dateArr = date.split('/');
            return dateArr[2] + "/" + dateArr[0] + "/" + dateArr[1] + " 00:00:00.000";
        };

        //取得交易紀錄明細for一般修改用
        var openNormalEditTradeRecordDetailDiv = function (tid) {
            $Common.MVENU.getVenueListHtmlTagOption(CommonHandlerUrl_M, "#eV_ID");
            var json = TradeRecordListJson_G;
            $.each(json, function (i, v) {

                if (v.T_ID == tid) {
                    //交易紀錄詳細資料
                    getFileDataList(tid);
                    $("#eT_ID").val(v.T_ID);
                    $("#addChargeDetailBtn").attr("thisId", v.T_ID)
                    if (v.T_Status == "暫停中") {
                        $("#eT_Status").val(v.T_Status + " (" + v.T_StatusPS + ")");
                    } else {
                        $("#eT_Status").val(v.T_Status);
                    }

                    $("#eMP_Name").val(v.MP);
                    getAdmissionTypeList(v.T_Item, "#eMP_Name", "#eT_Item");
                    $("#eT_Type").val(v.T_Type);
                    $("#eXQ_SName").val(v.XQ_SName);
                    $("#eXQ_SPw").val(v.XQ_SPw);
                    $("#eAccountType").text("[" + v.T_TypeName + "件]入帳 :");
                    switch (v.T_TypeName) {
                        case "一般":
                            $("#eT_AccountDate").show();
                            $("#eV_ID").hide();
                            break;
                        case "會場":
                            $("#eT_AccountDate").hide();
                            $("#eV_ID").show();
                            break;
                        case "特殊":
                            break;
                    }

                    $("#eT_AccountDate").val(sqlDateTOdatePickDate(v.T_AccountDate));
                    $("#eV_ID").val(v.V_ID);
                    $("#eMC").val(v.MC);
                    $("#eT_PayMoney").val(v.T_PayMoney);
                    $("#eT_StartDate").val(sqlDateTOdatePickDate(v.T_StartDate));
                    $("#eT_EndDate").val(sqlDateTOdatePickDate(v.T_EndDate));
                    $("#eca_id").val(v.ca_id);
                    if (U_MDEP_G == "0003") {
                        $("#maturityDays").val(v.maturityDays);
                        $("#contractDays").val(v.contractDays);
                    } else {
                        $("#maturityDays").val(v.maturityDaysLessWeekday);
                        $("#contractDays").val(v.contractDaysLessWeekday);
                    }

                    $("#eLight_Status").val(v.Light_Status);
                    if (v.T_Message.length > 1) {
                        var arr = v.T_Message.split(',');
                        $.each(arr, function (i, v) {
                            $("#eT_Message" + v).attr("checked", true);
                        });
                    } else {
                        $("#eT_Message" + v.T_Message).attr("checked", true);
                    }

                    if (v.T_Fax.length > 1) {
                        var arr = v.T_Fax.split(',');
                        $.each(arr, function (i, v) {
                            $("#eT_Fax" + v).attr("checked", true);
                        });
                    } else {
                        $("#eT_Fax" + v.T_Fax).attr("checked", true);
                    }
                    if (!isEmptyStr(v.T_Media)) {
                        $("#eT_Media" + v.T_Media).attr("checked", true);
                    }

                    $("#eBack_intag").val(v.Back_intag);
                    $("#eBack_Status").val(v.Back_Status);
                    $("#eCcard_4Num").val(v.Ccard_4Num);
                    $("#eINV_open_Item").val(v.INV_open_Item);
                    if (isEmptyStr(v.invoice_num)) {
                        $("#eINV_MNum").val(v.INV_MNum);
                        $("#eINV_CreatedateInput").val(sqlDateTOdatePickDate(Today_G));
                        $("#eINV_ItemSelect").val(v.INV_Item);
                        if (v.INV_Item == "2") {
                            disabledFalse_M("#eINV_ComNameInput");
                            disabledFalse_M("#eINV_UnifyNumInput");
                        }

                        $("#eINV_SendStateSelect").val(v.INV_SendState);
                        $("#eINV_ComNameInput").val(v.INV_ComName);
                        $("#eINV_UnifyNumInput").val(v.INV_UnifyNum);
                        $(".invoiced").hide();
                    } else {
                        $("#eInvoice_num").text(v.invoice_num);
                        $("#eINV_Createdate").text(v.INV_Createdate);
                        var itemName = undefined;
                        switch (v.INV_Item) {
                            case "1":
                                itemName = "二聯";
                                break;
                            case "2":
                                itemName = "三聯";
                                break;
                            case "3":
                                itemName = "特種";
                                break;
                        }

                        $("#eINV_Item").text(itemName);
                        var sendStateName = undefined;
                        switch (v.INV_SendState) {
                            case "1":
                                sendStateName = "一般";
                                break;
                            case "2":
                                sendStateName = "空白信封";
                                break;
                            case "3":
                                sendStateName = "發票轉交業務";
                                break;
                            case "4":
                                sendStateName = "不寄";
                                break;
                            case "5":
                                sendStateName = "捐贈";
                                break;
                        }
                        $("#eINV_SendState").text(sendStateName);
                        $("#eINV_ComName").text(v.INV_ComName);
                        $("#eINV_UnifyNum").text(v.INV_UnifyNum);
                        $(".unInvoiced").hide();
                    }
                    $("#eINV_tag").val(v.INV_tag);
                    $("#eHistoryT_PS").html(v.T_PS);
                }
            });
            // $("#normalEditTradeDetailDiv").show();
        };
        //刪除收費明細表
        var deleteChargeDetail = function () {
            var r = confirm("刪除後資料將無法恢復，確定刪除?");
            if (r == true) {
                var DT_ID = attr_M(this, "DT_ID");
                var T_ID = attr_M(this, "thisId");
                var data = "DT_ID=" + DT_ID + "&action=deleteChargeDetail";
                var success = function (back) {
                    alert("執行" + back);
                    empty_M("#eChargeDetailTb");
                    empty_M("#chargeDetailTb");
                    getChargeDetailList(T_ID, emptyValue_M);
                    getChargeDetailList(T_ID, "detail");
                    hide_M(".thirdDiv");
                };
                ajax_M(CustomerManageHandlerUrl_G, data, success);//<===================
            }
        };
        //開啟收費明細 - 修改 視窗===========================================================================start
        var openEditChargeDetailDiv = function (thisId, pay_tag, mc, account_Money, account_Date, pay_Type, DT_ID) {
            val_M("#ecdPay_tag", pay_tag);
            val_M("#ecdMC", mc);
            val_M("#ecdAccount_Money", getMoneyFormat_M(account_Money));
            val_M("#ecdAccount_Date", $CommonTool.Date.getDatepickerDateTimeStr(account_Date));
            val_M("#ecdPay_Type", pay_Type);
            val_M("#ecdDT_ID", DT_ID);

        };
        //開啟收費明細 - 修改 視窗===========================================================================end
        var openEditChargeDetailDialog = function () {
            var thisId = $(this).attr("thisId");
            var DT_ID = $(this).attr("DT_ID");
            var Pay_tag = $(this).attr("Pay_tag");
            var MC = $(this).attr("MC");
            var Account_Money = $(this).attr("Account_Money");
            var Account_Date = $(this).attr("Account_Date");
            var Pay_Type = $(this).attr("Pay_Type");
            openEditChargeDetailDiv(thisId, Pay_tag, MC, Account_Money, Account_Date, Pay_Type, DT_ID);
            $('#editChargeDetailDialog').dialog("open");
        };
        //客戶資料明細標頭(TabArea)
        var getTabArea = function () {
            alert('取得客戶資料明細標頭');
            var data = "M_ID=" + M_ID_G + "&action=getTabArea";
            var success = function (back) {
                empty_M("#tagHistoryTb");
                var sb = new string_M.StringBuilder();
                if (isEmptyStr(back)) {
                    var json = jsonParse_M(back);
                    $.each(json, function (i, v) {
                        /*sb.append("<tr style='margin-right:0 auto;text-align:center;'><th class='textAlignCenter'>");*/
                        //onclick="getTableContent(this)"
                        sb.append("<table width='98%' border='0' cellpadding='4' cellspacing='1' bgcolor='#dddddd'>");
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
                $("#TabArea").append(sb.toString());
                //$('#tagHistoryTabDialog').dialog("open");
                unBlockUI_M();
            };

            //var error = function (e) { Log_M("getTabArea error" + e); };
            ajax_M(CustomerManageHandlerUrl_G, data, success);

        };
        //取得收費明細表
        var getChargeDetailList = function (tid, type) {
            var data = "T_ID=" + tid + "&action=getChargeDetailList";
            var success = function (back) {
                if (type == "detail") {
                    $("#chargeDetailTb").empty();
                } else {
                    $("#eChargeDetailTb").empty();
                }

                var json = jsonParse_M(back);
                var sb = new string_M.StringBuilder();
                $.each(json, function (i, v) {
                    sb.append("<tr><td class='textAlignCenter'>");
                    sb.append(v.DT_ID);
                    sb.append("</td><td class='textAlignCenter'>");
                    var tag = undefined;
                    switch (v.Pay_tag) {
                        case "0":
                            tag = "一般件";
                            break;
                        case "1":
                            tag = "會場共分";
                            break;
                        case "2":
                            tag = "訂金件";
                            break;
                    }
                    sb.append(tag);
                    sb.append("</td><td class='textAlignCenter'>");
                    sb.append(v.MC_Name);
                    sb.append("</td><td class='textAlignCenter'>");
                    sb.append(getMoneyFormat_M(v.Account_Money));
                    sb.append("</td><td class='textAlignCenter'>");
                    sb.append(v.T_ComName);
                    sb.append("</td><td class='textAlignCenter'>");
                    sb.append(v.Account_Date);
                    sb.append("</td><td class='textAlignCenter'>");
                    sb.append(v.Pay_TypeName);
                    sb.append("</td><td class='textAlignCenter'><a href='javascript:void(0)' class='openEditChargeDetailDialog' openDivName='#editChargeDetailDiv' thisId='");
                    sb.append(v.T_ID);
                    sb.append("' DT_ID='");
                    sb.append(v.DT_ID);
                    sb.append("' Pay_tag='");
                    sb.append(v.Pay_tag);
                    sb.append("' MC='");
                    sb.append(v.MC);
                    sb.append("' Account_Money='");
                    sb.append(getMoneyFormat_M(v.Account_Money));
                    sb.append("' T_Com='");
                    sb.append(v.T_Com);
                    sb.append("' Account_Date='");
                    sb.append(v.Account_Date);
                    sb.append("' Pay_Type='");
                    sb.append(v.Pay_Type);
                    sb.append("'>修</a></td><td class='textAlignCenter'><a href='#' class='deleteChargeDetail' thisId='");
                    sb.append(v.T_ID);
                    sb.append("' DT_ID='");
                    sb.append(v.DT_ID);
                    sb.append("'刪</a></td></tr>");
                });
                if (type == "detail") {
                    $("#chargeDetailTb").append(sb.toString());
                } else {
                    $("#eChargeDetailTb").append(sb.toString());
                }
                unBind_M(".closeDiv");
                unBind_M(".openDiv");
                unBind_M(".openEditChargeDetailDialog");
                unBind_M(".deleteChargeDetail");
                onClick_M(".closeDiv", closeDiv);
                onClick_M(".openDiv", openDiv);
                onClick_M(".deleteChargeDetail", deleteChargeDetail);
                onClick_M(".openEditChargeDetailDialog", openEditChargeDetailDialog);
                $.unblockUI();
            };
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<===================
        };
        //查驗是否具有修改的權限
        var checkTradeRecordDetailEditAble = function () {
            var able = false;
            if (U_MDEP_G == "0003" || U_MDEP_G == "0004" || U_MDEP_G == "0009") {
                able = true;
            }
            return able;
        };
        //查驗是否具有印出信封的權限
        var checkEnvelopeAble = function (MC) {
            var able = false;
            if (U_MDEP_G == "0003" || U_MDEP_G == "0004" || U_MDEP_G == "0009" || MC == U_Num_M) {
                able = true;
            }
            return able;
        };
        //打開列印信封頁面
        var openEnvelope = function () {
            var id = $(this).attr("thisId");
            window.open('printEnvelope.aspx?T_ID=' + id + '&count=1', '信封列印', config = 'height=780,width=700');
        };
        //openCDD
        var openCDD = function () {
            var id = $(this).attr("thisId");
            window.open('printCDD.aspx?T_ID=' + id + '&count=1', 'CDD列印', config = 'height=640,width=1050');
        };

        var secondDivShowHide = function (id) {
            $(".secondDiv").hide();
            $(id).show();
        };

        var thirdDivShowHide = function (id) {
            $(".thirdDiv").hide();
            $(id).show();
            location.href = id;
        };


        var getMCdata = function (type, num) {
            var uNum = undefined;
            if (type == "UA") {
                uNum = num;
            } else {
                uNum = U_Num_M;
            }
            var data = "U_Num=" + uNum + "&action=getMCdata";
            var success = function (back) {
                var json = jsonParse_M(back);
                if (type == "UA") {
                    $("#abcU_Agent_MDEP").val(json.U_MDEP);
                    $("#abcU_Agent_Com").val(json.ComID);
                    tempMC_G = json.U_Num;
                    $("#abcU_Agent_MDEP").change();
                } else {
                    $("#abcU_MDEP").val(json.U_MDEP);
                    $("#abcU_Com").val(json.ComID);
                    tempMC_G = json.U_Leader;
                    $("#abcU_MDEP").change();
                }
            };
            ajax_M(CommonHandlerUrl_M, data, success);//<======================
        };

        //製作selectTag的業務員列表===============================start
        var makeMClistHtmlTagSelect = function (idOrClassName) {

            //2.送出查詢後，將回來的資料組成option
            var getMClistSuccess = function (back) {
                McList_G = jsonParse_M(back);
                var sb = new string_M.StringBuilder();
                $.each(McList_G, function (i, v) {
                    sb.append("<option value = '");
                    sb.append(v.U_Num);
                    sb.append("' comid='");
                    sb.append(v.ComID);
                    sb.append("' uMdep='");
                    sb.append(v.U_MDEP);
                    sb.append("' uName='");
                    sb.append(v.U_Name);
                    sb.append("'>");
                    sb.append(v.ComIDname);
                    sb.append("-");
                    sb.append(v.U_Num);
                    sb.append("-");
                    sb.append(v.U_Name);
                    sb.append("</option>");
                });
                $(idOrClassName).append(sb.toString());
                $(idOrClassName).val(U_Num_M);
            };
            //1.取得業務員資料
            $Common.MUSER.getMClist(CommonHandlerUrl_M, U_Num_M, getMClistSuccess);//<=================
        };
        //製作selectTag的業務員列表===============================end

        var makeOption = function (val, txt) {
            var sb = new string_M.StringBuilder();
            sb.append("<option value='");
            sb.append(val);
            sb.append("'>");
            sb.append(txt);
            sb.append("</option>");
            return sb.toString();
        };
        var comMdepChangeFuc_Title = function () {
            //var emp = $(this).attr("EMP");
            //var com = $(this).attr("Select_Com");//所選到的公司代號
            //var mdep = $(this).attr("U_MDEP");//所選到的部門代號
            var Select_Com = val_M("#Select_Com");//所選的公司
            var Select_Dept = val_M("#Select_Dept");//所選的部門
            //var mdep = "/**************/"; //使用者部門代號
            //alert(Select_Com);
            //alert(Select_Dept);
            //$("#" + emp).empty();
            //var abcU_ComVal = $("#" + com).val();
            //alert($("#" + mdep).val());
            //var abcU_MDEPVal_Test = $("#" + mdep).val();
            //var url = CommonHandlerUrl_M;
            var data = "ComID=" + Select_Com + "&U_MDEP=" + Select_Dept + "&action=getSelectEmplist";
            var success = function (back) {
                var json = JSON.parse(back);
                var sb = new StringBuilder_M();
                //$(idOrClassName).empty();
                $("#Select_Employ").empty();
                $.each(json, function (i, v) {
                    sb.append("<option value='");
                    sb.append(v.ditcode);
                    sb.append("'>");
                    sb.append(v.ddesc);
                    sb.append("</option>");
                });
                $("#Select_Employ").append(sb.toString());
            };
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<======================
        }
        var comMdepChangeFuc_Transfer1 = function () {
            //var emp = $(this).attr("EMP");
            //var com = $(this).attr("Select_Com");//所選到的公司代號
            //var mdep = $(this).attr("U_MDEP");//所選到的部門代號
            var Select_Com = val_M("#Select_Com_Transfer1");//所選的公司
            var Select_Dept = val_M("#Select_Dept_Transfer1");//所選的部門
            //var mdep = "/**************/"; //使用者部門代號
            //alert(Select_Com);
            //alert(Select_Dept);
            //$("#" + emp).empty();
            //var abcU_ComVal = $("#" + com).val();
            //alert($("#" + mdep).val());
            //var abcU_MDEPVal_Test = $("#" + mdep).val();
            //var url = CommonHandlerUrl_M;
            var data = "ComID=" + Select_Com + "&U_MDEP=" + Select_Dept + "&action=getSelectEmplist";
            var success = function (back) {
                var json = JSON.parse(back);
                var sb = new StringBuilder_M();
                //$(idOrClassName).empty();
                $("#Select_Employ_Transfer1").empty();
                $.each(json, function (i, v) {
                    sb.append("<option value='");
                    sb.append(v.ditcode);
                    sb.append("'>");
                    sb.append(v.ddesc);
                    sb.append("</option>");
                });
                $("#Select_Employ_Transfer1").append(sb.toString());
            };
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<======================
        }
        var comMdepChangeFuc_Transfer2 = function () {
            //var emp = $(this).attr("EMP");
            //var com = $(this).attr("Select_Com");//所選到的公司代號
            //var mdep = $(this).attr("U_MDEP");//所選到的部門代號
            var Select_Com = val_M("#Select_Com_Transfer2");//所選的公司
            var Select_Dept = val_M("#Select_Dept_Transfer2");//所選的部門
            //var mdep = "/**************/"; //使用者部門代號
            //alert(Select_Com);
            //alert(Select_Dept);
            //$("#" + emp).empty();
            //var abcU_ComVal = $("#" + com).val();
            //alert($("#" + mdep).val());
            //var abcU_MDEPVal_Test = $("#" + mdep).val();
            //var url = CommonHandlerUrl_M;
            var data = "ComID=" + Select_Com + "&U_MDEP=" + Select_Dept + "&action=getSelectEmplist";
            var success = function (back) {
                var json = JSON.parse(back);
                var sb = new StringBuilder_M();
                //$(idOrClassName).empty();
                $("#Select_Employ_Transfer2").empty();
                $.each(json, function (i, v) {
                    sb.append("<option value='");
                    sb.append(v.ditcode);
                    sb.append("'>");
                    sb.append(v.ddesc);
                    sb.append("</option>");
                });
                $("#Select_Employ_Transfer2").append(sb.toString());
            };
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<======================
        }
        //var comMdepChangeFuc_Transfer2 = function () {
        //    //var emp = $(this).attr("EMP");
        //    //var com = $(this).attr("Select_Com");//所選到的公司代號
        //    //var mdep = $(this).attr("U_MDEP");//所選到的部門代號
        //    var Select_Com = val_M("#Select_Com_Transfer2");//所選的公司
        //    var Select_Dept = val_M("#Select_Dept_Transfer2");//所選的部門
        //    //var mdep = "/**************/"; //使用者部門代號
        //    alert(Select_Com);
        //    alert(Select_Dept);
        //    //$("#" + emp).empty();
        //    //var abcU_ComVal = $("#" + com).val();
        //    //alert($("#" + mdep).val());
        //    //var abcU_MDEPVal_Test = $("#" + mdep).val();
        //    //var url = CommonHandlerUrl_M;
        //    var data = "ComID=" + Select_Com + "&U_MDEP=" + Select_Dept + "&action=getSelectEmplist";
        //    var success = function (back) {
        //        var json = JSON.parse(back);
        //        var sb = new StringBuilder_M();
        //        //$(idOrClassName).empty();
        //        $("#Select_Employ_Transfer2").empty();
        //        $.each(json, function (i, v) {
        //            sb.append("<option value='");
        //            sb.append(v.ditcode);
        //            sb.append("'>");
        //            sb.append(v.ddesc);
        //            sb.append("</option>");
        //        });
        //        $("#Select_Employ_Transfer2").append(sb.toString());
        //    };
        //    ajax_M(CustomerManageHandlerUrl_G, data, success);//<======================
        //}
        var comMdepChangeFuc_Transfer3 = function () {
            //var emp = $(this).attr("EMP");
            //var com = $(this).attr("Select_Com");//所選到的公司代號
            //var mdep = $(this).attr("U_MDEP");//所選到的部門代號
            var Select_Com = val_M("#Select_Com_Transfer3");//所選的公司
            var Select_Dept = val_M("#Select_Dept_Transfer3");//所選的部門
            //var mdep = "/**************/"; //使用者部門代號
            alert(Select_Com);
            alert(Select_Dept);
            //$("#" + emp).empty();
            //var abcU_ComVal = $("#" + com).val();
            //alert($("#" + mdep).val());
            //var abcU_MDEPVal_Test = $("#" + mdep).val();
            //var url = CommonHandlerUrl_M;
            var data = "ComID=" + Select_Com + "&U_MDEP=" + Select_Dept + "&action=getSelectEmplist";
            var success = function (back) {
                var json = JSON.parse(back);
                var sb = new StringBuilder_M();
                //$(idOrClassName).empty();
                $("#Select_Employ_Transfer3").empty();
                $.each(json, function (i, v) {
                    sb.append("<option value='");
                    sb.append(v.ditcode);
                    sb.append("'>");
                    sb.append(v.ddesc);
                    sb.append("</option>");
                });
                $("#Select_Employ_Transfer3").append(sb.toString());
            };
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<======================
        }

        //業績歸屬下拉式選單變動
        var comMdepChangeFuc4 = function () {
            //var emp = $(this).attr("EMP");
            //var com = $(this).attr("Select_Com");//所選到的公司代號
            //var mdep = $(this).attr("U_MDEP");//所選到的部門代號
            var Select_Com_attach = val_M("#Select_Com_attach");//所選的公司
            var Select_Dept_Attach = val_M("#Select_Dept_Attach");//所選的部門
            //var mdep = "/**************/"; //使用者部門代號
            //alert(Select_Com);
            //alert(Select_Dept);
            //$("#" + emp).empty();
            //var abcU_ComVal = $("#" + com).val();
            //alert($("#" + mdep).val());
            //var abcU_MDEPVal_Test = $("#" + mdep).val();
            //var url = CommonHandlerUrl_M;
            var data = "ComID=" + Select_Com_attach + "&U_MDEP=" + Select_Dept_Attach + "&action=getSelectEmplist";
            var success = function (back) {
                var json = JSON.parse(back);
                var sb = new StringBuilder_M();
                //$(idOrClassName).empty();
                $("#Select_User_Attach").empty();
                $.each(json, function (i, v) {
                    sb.append("<option value='");
                    sb.append(v.ditcode);
                    sb.append("'>");
                    sb.append(v.ddesc);
                    sb.append("</option>");
                });
                $("#Select_User_Attach").append(sb.toString());
            };
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<======================
        }
        var comMdepChangeFuc3 = function () {
            //var emp = $(this).attr("EMP");
            //var com = $(this).attr("Select_Com");//所選到的公司代號
            //var mdep = $(this).attr("U_MDEP");//所選到的部門代號
            var Select_Com = val_M("#Select_Com_Attach");//所選的公司
            var Select_Dept = val_M("#Select_Dept_Attach");//所選的部門
            //var mdep = "/**************/"; //使用者部門代號
            //alert(Select_Com);
            //alert(Select_Dept);
            //$("#" + emp).empty();
            //var abcU_ComVal = $("#" + com).val();
            //alert($("#" + mdep).val());
            //var abcU_MDEPVal_Test = $("#" + mdep).val();
            //var url = CommonHandlerUrl_M;
            var data = "ComID=" + Select_Com + "&U_MDEP=" + Select_Dept + "&action=getSelectEmplist";
            var success = function (back) {
                var json = JSON.parse(back);
                var sb = new StringBuilder_M();
                //$(idOrClassName).empty();
                $("#Select_User_Attach").empty();
                $.each(json, function (i, v) {
                    sb.append("<option value='");
                    sb.append(v.ditcode);
                    sb.append("'>");
                    sb.append(v.ddesc);
                    sb.append("</option>");
                });
                $("#Select_User_Attach").append(sb.toString());
            };
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<======================
        }
        var comMdepChangeFuc2 = function () {
            //var emp = $(this).attr("EMP");
            //var com = $(this).attr("Select_Com");//所選到的公司代號
            //var mdep = $(this).attr("U_MDEP");//所選到的部門代號
            var Select_Com = val_M("#Select_Com_Title");//所選的公司
            var Select_Dept = val_M("#Select_Dept_Title");//所選的部門
            //var mdep = "/**************/"; //使用者部門代號
            //alert(Select_Com);
            //alert(Select_Dept);
            //$("#" + emp).empty();
            //var abcU_ComVal = $("#" + com).val();
            //alert($("#" + mdep).val());
            //var abcU_MDEPVal_Test = $("#" + mdep).val();
            //var url = CommonHandlerUrl_M;
            var data = "ComID=" + Select_Com + "&U_MDEP=" + Select_Dept + "&action=getSelectEmplist";
            var success = function (back) {
                var json = JSON.parse(back);
                var sb = new StringBuilder_M();
                //$(idOrClassName).empty();
                $("#Select_Employ_Title").empty();
                $.each(json, function (i, v) {
                    sb.append("<option value='");
                    sb.append(v.ditcode);
                    sb.append("'>");
                    sb.append(v.ddesc);
                    sb.append("</option>");
                });
                $("#Select_Employ_Title").append(sb.toString());
            };
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<======================
        }
        var comMdepChangeFuc = function () {
            //alert('!!!');
            //var emp = $(this).attr("EMP");Select_Com_Sign
            //var com = $(this).attr("Select_Com");//所選到的公司代號
            //var mdep = $(this).attr("U_MDEP");//所選到的部門代號
            var Select_Com = val_M("#Select_Com_Sign");//所選的公司
            var Select_Dept = val_M("#Select_Dept_Sign");//所選的部門
            //var mdep = "/**************/"; //使用者部門代號
            //alert(Select_Com);
            //alert(Select_Dept);
            //$("#" + emp).empty();
            //var abcU_ComVal = $("#" + com).val();
            //alert($("#" + mdep).val());
            //var abcU_MDEPVal_Test = $("#" + mdep).val();
            //var url = CommonHandlerUrl_M;
            var data = "ComID=" + Select_Com + "&U_MDEP=" + Select_Dept + "&action=getSelectEmplist";
            var success = function (back) {
                var json = JSON.parse(back);
                var sb = new StringBuilder_M();
                //$(idOrClassName).empty();
                $("#Select_Employ_Sign").empty();
                $.each(json, function (i, v) {
                    sb.append("<option value='");
                    sb.append(v.ditcode);
                    sb.append("'>");
                    sb.append(v.ddesc);
                    sb.append("</option>");
                });
                $("#Select_Employ_Sign").append(sb.toString());
            };
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<======================
        };
        var comMdepChangeFuc_Sign = function () {
            //var emp = $(this).attr("EMP");
            //var com = $(this).attr("Select_Com");//所選到的公司代號
            //var mdep = $(this).attr("U_MDEP");//所選到的部門代號
            var Select_Com_Sign = val_M("#Select_Com_Sign");//所選的公司
            var Select_Dept_Sign = val_M("#Select_Dept_Sign");//所選的部門
            //var mdep = "/**************/"; //使用者部門代號
            //alert(Select_Com);
            //alert(Select_Dept);
            //$("#" + emp).empty();
            //var abcU_ComVal = $("#" + com).val();
            //alert($("#" + mdep).val());
            //var abcU_MDEPVal_Test = $("#" + mdep).val();
            //var url = CommonHandlerUrl_M;
            var data = "ComID=" + Select_Com_Sign + "&U_MDEP=" + Select_Dept_Sign + "&action=getSelectEmplist";
            var success = function (back) {
                var json = JSON.parse(back);
                var sb = new StringBuilder_M();
                //$(idOrClassName).empty();
                $("#Select_Employ_Sign").empty();
                $.each(json, function (i, v) {
                    sb.append("<option value='");
                    sb.append(v.ditcode);
                    sb.append("'>");
                    sb.append(v.ddesc);
                    sb.append("</option>");
                });
                $("#Select_Employ_Sign").append(sb.toString());
            };
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<======================
        }
        //取得訂金資料
        var getDownpayment = function () {
            var data = "M_ID" + M_ID_G + "&action=getDownpayment";
            var success = function (back) {
                var json = jsonParse_M(back);
                $("#abcVD").text(json.V_ID + "-" + json.MC_Name + "-" + json.Pay_Amount + "元");
            };
            ajax_M(CustomerManageHandlerUrl_G, data, success);
        };
        var afterSuccFunc3 = function () {
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#abcT_PType", "PITEM", "option");
        };

        //公司列表下拉式選單變動
        var afterSuccessFucMREGT01 = function () {
            //alert('公司列表下拉式選單變動');
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#Select_Dept", "Dept", "option");
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#Select_Dept", "Dept", "option", afterSuccessFucMREGT02);
            //$Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Dept", "Dept", "option", afterSuccessFucMREGT02);
            ////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept", "Dept", "option", "", "", Dept);
            var Select_Com_Sign = val_M("#Select_Com_Sign");//所選的公司
            var Select_Dept_Sign = val_M("#Select_Dept_Sign");//所選的部門
            ////alert(Select_Com);
            ////alert(Select_Dept);
            /*責任助理*/
            //////取得[員工]
            $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Dept", "Dept", "option", afterSuccessFucMREGT03);
            //$Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Dept_Title", "Dept", "option", afterSuccessFucMREGT03);
            ////取得部門option
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getMDEPlistHtmlTagOption", "Dept", "option", getMCdata);
            ////getMREGT02ListHtmlTagOption_2: function (ul, idOrClassName, listType1,listType2, htmlTagType, afterSuccessFuc) {
            $Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ_Sign", Select_Com_Sign, Select_Dept_Sign, "option", afterSuccessFucMREGT03);//20221207進度(實做這個!!)
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom_Title", "Com", "option", "", afterSuccFunc3, "");
            //////取得[公司]
            ////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom", "Com", "option");
            //////SelectCom_Title1
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom_Title12", "Com", "option", "", afterSuccFunc3, "");
            //////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept_Title1", "", "Dept", "option", Com);//所選的公司別產生相對應的部門(中文)
            //////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "", "TownShip", "option", county);//所選的城市產生相對應的鄉鎮市區(中文)
            ////var SelectTownShip = val_M("#SelectTownShip");//所選的鄉鎮市區(代碼)
            ////alert(SelectTownShip);
            ////$("ZipCode").val(SelectTownShip);
            ////$("ZipCode1").val("123");

            //onChange_M("#MP", function () {
            //    $Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ", Select_Com, Select_Dept, "option", afterSuccessFucMREGT03);//20221207進度(實做這個!!)
            //});


        };
        var afterSuccessFucMREGT02 = function () {
            //alert('Change!!')
            //alert('公司列表下拉式選單變動');
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#Select_Dept", "Dept", "option");
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#Select_Dept", "Dept", "option", afterSuccessFucMREGT02);
            //$Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Dept", "Dept", "option", afterSuccessFucMREGT02);
            ////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept", "Dept", "option", "", "", Dept);
            var Select_Com_Title = val_M("#Select_Com_Title");//所選的公司
            var Select_Dept_Title = val_M("#Select_Dept_Title");//所選的部門
            ////alert(Select_Com);
            ////alert(Select_Dept);
            /*責任助理*/
            //////取得[員工]
            $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Dept", "Dept", "option", afterSuccessFucMREGT03);
            //$Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Dept_Title", "Dept", "option", afterSuccessFucMREGT03);
            ////取得部門option
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getMDEPlistHtmlTagOption", "Dept", "option", getMCdata);
            ////getMREGT02ListHtmlTagOption_2: function (ul, idOrClassName, listType1,listType2, htmlTagType, afterSuccessFuc) {
            $Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ_Title", Select_Com_Title, Select_Dept_Title, "option", afterSuccessFucMREGT03);//20221207進度(實做這個!!)
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom_Title", "Com", "option", "", afterSuccFunc3, "");
            //////取得[公司]
            ////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom", "Com", "option");
            //////SelectCom_Title1
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom_Title12", "Com", "option", "", afterSuccFunc3, "");
            //////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept_Title1", "", "Dept", "option", Com);//所選的公司別產生相對應的部門(中文)
            //////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "", "TownShip", "option", county);//所選的城市產生相對應的鄉鎮市區(中文)
            ////var SelectTownShip = val_M("#SelectTownShip");//所選的鄉鎮市區(代碼)
            ////alert(SelectTownShip);
            ////$("ZipCode").val(SelectTownShip);
            ////$("ZipCode1").val("123");

            //onChange_M("#MP", function () {
            //    $Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ", Select_Com, Select_Dept, "option", afterSuccessFucMREGT03);//20221207進度(實做這個!!)
            //});


        };
        //20230215work
        //開啟業務聯絡單視窗===========================================================================start
        var openAddBusinessConnectionDiv = function () {
            //分析師下拉示選單項目
            $Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "#abcMP_ID", ComID_G, "option", afterSuccessFuc);
            $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Com", "Com", "option", afterSuccessFucMREGT01);
            $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Dept", "Dept", "option", afterSuccessFucMREGT01);
            $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Com_Sign", "Com", "option", afterSuccessFucMREGT01);
            $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Dept_Sign", "Dept", "option", afterSuccessFucMREGT01);
            $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Com_Title", "Com", "option", afterSuccessFucMREGT02);
            $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Dept_Title", "Dept", "option", afterSuccessFucMREGT02);
            $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Com_Attach", "Com", "option", afterSuccessFucMREGT01);
            $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Dept_Attach", "Dept", "option", afterSuccessFucMREGT01);
            $Common.MITEM.getCustomerDetailListHtmlTagOption(CommonHandlerUrl_M, ".abcCF_Item", "MCOTF", "option");
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#abcT_PType", "PITEM", "option");
            $("#abcM_ID").append(makeOption(M_ID_G, M_Name_G));
        };

        //開啟客戶資料明細-修改視窗===========================================================================start
        var openEcustomerDetailTabDiv = function () {
            $.blockUI();
            getCustomerData(getEditCustomerDataSuccess);
        };
        //開啟客戶資料明細-修改視窗===========================================================================end

        var sendMTRAT = function (T_ID, M_ID, MP, MP_Name, MP_COM, MC, MC_Name, MC_COM, T_Item, Results_Item, V_ID, V_Name, Account_MoneyN, Pay_Type, T_Type, T_StartDate, T_EndDate, T_AccountDate, T_Fax, T_Media, T_PS, T_Message, Ccard_4Num, INV_tag, INV_Createdate, INV_Item, INV_open_Item, INV_ComName, INV_UnifyNum, INV_MNum, INV_SendState, Light_Status, Back_intag, add_user, add_ip, MT_COM, XQ_SName, XQ_SPw) {
            var success = function (back) {

                location.reload();
            };
            var data = "T_ID=" + T_ID + "&M_ID=" + M_ID + "&MP=" + MP + "&MP_Name=" + MP_Name + "&MP_COM=" + MP_COM + "&MC=" + MC + "&MC_Name=" + MC_Name + "&MC_COM=" + MC_COM + "&T_Item=" + T_Item + "&Results_Item=" + Results_Item + "&V_ID=" + V_ID + "&V_Name=" + V_Name + "&T_PayMoney=" + Account_MoneyN + "&T_PType=" + Pay_Type + "&T_Type=" + T_Type + "&T_StartDate=" + T_StartDate + "&T_EndDate=" + T_EndDate + "&T_AccountDate=" + T_AccountDate + "&T_Fax=" + T_Fax + "&T_Media=" + T_Media + "&T_PS=" + T_PS + "&T_Message=" + T_Message + "&Ccard_4Num=" + Ccard_4Num + "&INV_tag=" + INV_tag + "&INV_Createdate=" + INV_Createdate + "&INV_Item=" + INV_Item + "&INV_open_Item=" + INV_open_Item + "&INV_ComName=" + INV_ComName + "&INV_UnifyNum=" + INV_UnifyNum + "&INV_MNum=" + INV_MNum + "&INV_SendState=" + INV_SendState + "&Light_Status=" + Light_Status + "&Back_intag=" + Back_intag + "&add_user=" + add_user + "&add_ip=" + add_ip + "&MT_COM=" + MT_COM + "&XQ_SName=" + XQ_SName + "&XQ_SPw=" + XQ_SPw + "&action=sendMTRAT";
            ajax_M(CustomerManageHandlerUrl_G, data, success);
        }
        var cleanAddChargeDetailDialog = function () {
            $('#addChargeDetailDialog').dialog("close");
            $("#acdPay_tag").val("");
            $("#acdAccount_Date").val("");
            $("#acdMC").val("");
            $("#acdAccount_Money").val("");
            $("#acdPay_Type").val("");
            $("#acdT_Com").val("HG");
        };

        var sendDTRAT = function (T_ID, Pay_tag, Account_Date, MC, MC_Name, MC_Com, MC2, MC2_Name, MC2_Com, Account_MoneyN, Account_MoneyV, Account_MoneyVI, Pay_Type, add_user, add_ip, T_Type, DT_ID, T_Com) {

            var success = function (back) {
                alert("執行" + back);
                empty_M("#eChargeDetailTb");

                empty_M("#ChargeDetailTb");
                getChargeDetailList(T_ID, emptyValue_M);
                getChargeDetailList(T_ID, "detail");
                hide_M(".thirdDiv");
                cleanAddChargeDetailDialog();
                $('#editChargeDetailDialog').dialog("close");
            };
            var data = undefined;

            switch (T_Type) {
                case "0001":
                    data = "T_ID=" + T_ID + "&Pay_tag=" + Pay_tag + "&Account_Date=" + Account_Date + "&MC=" + MC + "&MC_Name=" + MC_Name + "&MC_Com=" + MC_Com + "&Account_Money=" + Account_MoneyN + "&Pay_Type=" + Pay_Type + "&add_user=" + add_user + "&add_ip=" + add_ip + "&T_Com=" + T_Com + "&action=sendDTRAT";
                    ajax_M(CustomerManageHandlerUrl_G, data, success);
                    break;
                case "0002":
                    data = "T_ID=" + T_ID + "&Pay_tag=" + Pay_tag + "&Account_Date=" + Account_Date + "&MC=" + MC + "&MC_Name=" + MC_Name + "&MC_Com=" + MC_Com + "&Account_Money=" + Account_MoneyV + "&Pay_Type=" + Pay_Type + "&add_user=" + add_user + "&add_ip=" + add_ip + "&T_Com=" + T_Com + "&action=sendDTRAT";
                    ajax_M(CustomerManageHandlerUrl_G, data, success);
                    break;
                case "0003":
                    data = "T_ID=" + T_ID + "&Pay_tag=" + Pay_tag + "&Account_Date=" + Account_Date + "&MC=" + MC + "&MC_Name=" + MC_Name + "&MC_Com=" + MC_Com + "&Account_Money=" + Account_MoneyV + "&Pay_Type=" + Pay_Type + "&add_user=" + add_user + "&add_ip=" + add_ip + "&T_Com=" + T_Com + "&action=sendDTRAT";
                    ajax_M(CustomerManageHandlerUrl_G, data, success);
                    data = "T_ID=" + T_ID + "&Pay_tag=" + Pay_tag + "&Account_Date=" + Account_Date + "&MC=" + MC2 + "&MC_Name=" + MC2_Name + "&MC_Com=" + MC2_Com + "&Account_Money=" + Account_MoneyVI + "&Pay_Type=" + Pay_Type + "&add_user=" + add_user + "&add_ip=" + add_ip + "&T_Com=" + T_Com + "&action=sendDTRAT";
                    ajax_M(CustomerManageHandlerUrl_G, data, success);
                    break;
                case "0004":
                    data = "DT_ID=" + DT_ID + "&Pay_tag=" + Pay_tag + "&Account_Date=" + Account_Date + "&MC=" + MC + "&MC_Name=" + MC_Name + "&MC_Com=" + MC_Com + "&Account_Money=" + Account_MoneyN + "&Pay_Type=" + Pay_Type + "&add_user=" + add_user + "&add_ip=" + add_ip + "&T_Com=" + T_Com + "&action=sendDTRAT";
                    ajax_M(CustomerManageHandlerUrl_G, data, success);
                    break;
            }
        };

        var updateMnumMpassword = function (M_Num, M_Password) {
            var data = "M_ID=" + M_ID_G + "&M_Num=" + M_Num + "&M_Password=" + M_Password + "&action=updateMnumMpassword";
            var success = function (back) {
            };
            ajax_M(CustomerManageHandlerUrl_G, data, success);
        };
        var hasMnum = function (M_Num) {
            var data = "M_Num=" + M_Num + "&action=hasMnum";
            var success = function (back) {
                if (isEmptyStr(back)) {
                    var password = M_Num.substr(3, 7)
                    updateMnumMpassword(M_Num, password);
                } else {
                    var mNum = $CommonTool.Number.getRandomStr(7);
                    hasMnum(mNum);
                }
            };
            ajax_M(CustomerManageHandlerUrl_G, data, success);
        };
        var getSingleCustomerDataSuccess = function (back) {
            var json = jsonParse_M(back);
            if (isEmptyStr(json[0].M_Num)) {
                var mNum = $CommonTool.Number.getRandomStr(7);
                hasMnum(mNum);
            }
        };
        //檢查欄位==========================================================start
        var checkCol = function () {
            var back = false;
            if (check_M.AllRequiredNoEmpty(".sendEditCustomerDataRequired", "requiredItem")) {
                if (check_M.isROCIDstr(".checkIdFuc", false)) {
                    if (check_M.isEmailFormat(".checkEmailFuc", false)) {
                        if (check_M.AtLeastContact(".contact")) {
                            if (check_M.isMobileNum(".checkMobile", false)) {
                                back = true;
                            }
                        }
                    }
                }
            }
            return back;
        };
        //檢查欄位==========================================================end
        var getLightStatusFromUmdep = function () {
            var lightStatus = undefined;
            if (isEmptyStr(U_MDEP_M)) {
                lightStatus = "G";
            } else {
                if (U_MDEP_M == "0002" || U_MDEP_M == "0007" || U_MDEP_M == "0011" || U_MDEP_M == "0013" || U_MDEP_M == "0015") {
                    lightStatus = "G";
                } else if (U_MDEP_M == "0006" || U_MDEP_M == "0016") {
                    lightStatus = "Y";
                } else {
                    lightStatus = "R";
                }
            }
            return lightStatus;
        };
        //送出修改個人資料資料按鈕綁定
        var sendEditCustomerDataBtnBinding = function () {

            unBind_M("#editCustomerDataBtn");
            $("#editCustomerDataBtn").on("click", function () {
                blockUI_M();
                var Analysts = $('input[name="Analyst"]');
                var PRODTs = $('input[name="PRODT"]');
                var MPGOMs = $('input[name="MPGOM"]');
                getCheckBoxValueStr(Analysts, "#ecAnalyst");
                getCheckBoxValueStr(PRODTs, "#ecProduct");
                getCheckBoxValueStr(MPGOMs, "#ecProgram");
                if (checkCol()) {
                    var data = "M_Name=" + $("#ecM_Name").val() +
                        "&M_Sax=" + $("#ecM_Sax").val() +
                        "&M_Grade=" + $("#ecM_Grade").val() +
                        "&BirthDay_Date=" + $("#ecBirthDay_Date").val() +
                        "&MCdata=" + $("#ecMCdata").val() +
                        "&MC_Name=" + $("#ecMCdata :selected").attr("uName") +
                        "&MC_COM=" + $("#ecMCdata :selected").attr("comid") +
                        "&OTel_Zone=" + $("#ecOTel_Zone").val() +
                        "&OTel=" + $("#ecOTel").val() +
                        "&OTel_Sub=" + $("#ecOTel_Sub").val() +
                        "&OTel_Zone1=" + $("#ecOTel_Zone1").val() +
                        "&OTel1=" + $("#ecOTel1").val() +
                        "&OTel_Sub1=" + $("#ecOTel_Sub1").val() +
                        "&HTel_Zone=" + $("#ecHTel_Zone").val() +
                        "&HTel=" + $("#ecHTel").val() +
                        "&HTel_Zone1=" + $("#ecHTel_Zone1").val() +
                        "&HTel1=" + $("#ecHTel1").val() +
                        "&MTel1=" + $("#ecMTel1").val() +
                        "&MTel2=" + $("#ecMTel2").val() +
                        "&MTel3=" + $("#ecMTel3").val() +
                        "&Fax_Zone=" + $("#ecFax_Zone").val() +
                        "&Fax=" + $("#ecFax").val() +
                        "&Fax_Zone1=" + $("#ecFax_Zone1").val() +
                        "&Fax1=" + $("#ecFax1").val() +
                        "&M_SD=" + $("#ecM_SD").val() +
                        "&EMail=" + $("#ecEMail").val() +
                        "&OCity=" + $("#ecOCity").val() +
                        "&OTown=" + $("#ecOTown :selected").text() +
                        "&OZipCode=" + $("#ecOTown").val() +
                        "&O_Address=" + $("#ecO_Address").val() +
                        "&HCity=" + $("#ecHCity").val() +
                        "&HTown=" + $("#ecHTown :selected").text() +
                        "&HZipCode=" + $("#ecHTown").val() +
                        "&H_Address=" + $("#ecH_Address").val() +
                        "&Inv_Money=" + $("#ecInv_Money").val() +
                        "&Analyst=" + $("#ecAnalystCodeStr").val() +
                        "&Product=" + $("#ecProductCodeStr").val() +
                        "&Recipient=" + $("#ecRecipient").val() +
                        "&Program=" + $("#ecProgramCodeStr").val() +
                        "&M_Note=" + $("#ecM_Note").val() +
                        "&Light_Status=" + $("#ecLight_Status").val() +
                        "&M_ID=" + M_ID_G +
                        "&add_ip=" + IP_G +
                        "&add_user=" + U_Num_M + "&action=addEditCustomerData&addEditType=edit";
                    var success = function (back) {
                        var sendEditCustomerDatas = $(".sendEditCustomerData");

                        $.each(sendEditCustomerDatas, function (i, v) {
                            var id = $(v).attr("id");
                            var idv = $("#" + id).val();
                            var codeName = $("#" + id).attr("CodeNameYN");
                            var idvCodeName = $("#" + id + " :selected").text();
                            var idhv = $("#" + id + "Hidden").val();
                            var idhvCodeName = $("#" + id + "Hidden").attr("CodeName");
                            var mtext = undefined;

                            if (idv != idhv) {

                                var mRow = $("#" + id).attr("fieldName");

                                if (codeName == "Y") {
                                    if (id == "ecMCdata") {
                                        idvCodeName = (idvCodeName.split("-"))[3];
                                        var old_MC_Com = $("#" + id + " :selected").attr("comid");
                                        var New_MC_Com = $("#" + id + "Hidden").attr("comid");
                                        var MCHAGdata = "M_ID=" + M_ID_G + "&old_MC=" + idhv + "&old_MC_Name=" + idhvCodeName + "&old_MC_Com=" + old_MC_Com + "&New_MC=" + idv + "&New_MC_Name=" + idvCodeName + "&New_MC_Com=" + New_MC_Com + "&Chg_PS=行政客戶界面修改&Chg_User=" + U_Num_M + "&action=saveEditCustomerMCdataRecord";
                                        var MCHAGsuccess = function (backk) {

                                        };
                                        ajax_M(CustomerManageHandlerUrl_G, MCHAGdata, MCHAGsuccess);//<===
                                    }
                                    mtext = idhvCodeName + "-->" + idvCodeName;
                                } else {
                                    mtext = idhv + "-->" + idv;
                                }
                                var MLOGBdata = "Log_Item=1" + "&M_ID=" + M_ID_G + "&M_Row=" + mRow + "&M_text=" + mtext + "&edit_user=" + U_Num_M + "&action=saveEditCustomerDataRecord";
                                var MLOGBsuccess = function (backk) {
                                    unBlockUI_M();
                                };
                                ajax_M(CustomerManageHandlerUrl_G, MLOGBdata, MLOGBsuccess);//<===
                            }
                        });
                        alert("修改客戶資料明細 " + back);
                        location.reload();
                    };
                    ajax_M(CustomerManageHandlerUrl_G, data, success);//<===
                }
            });
        };

        //送出新增通話紀錄資料按鈕綁定
        var sendAddCallRecordDetailBtnBinding = function () {
            $("#addCallRecordDetailBtn").on("click", function () {
                var Question = $("#acrdQuestion").val();
                if (!isEmptyStr(Question)) {
                    var Q_Date = $("#acrdQ_Date").val();
                    var N_Date = $("#acrdN_Date").val();
                    var N_Item = $("#acrdN_Item").val();

                    var data = "M_ID=" + M_ID_G + "&Q_Date=" + Q_Date + "&Question=" + Question + "&N_Date=" + N_Date + "&N_Item=" + N_Item + "&Add_User=" + U_Num_M + "&action=addCallRecordDetail";
                    var success = function (back) {
                        alert("新增通話紀錄資料 " + back);
                        //location.reload();

                        getCallRecordHtml();
                        hide_M("#addCallRecordDetailDiv");
                    };
                    ajax_M(CustomerManageHandlerUrl_G, data, success);
                } else {
                    alert("請輸入通話內容");
                }

            });
        };


        //送出修改通話紀錄資料按鈕綁定
        var sendEditCallRecordDetailBtnBinding = function (Auto_id) {
            var id = "#editCallRecordDetailBtn";
            unBind_M(id);
            onClick_M(id, function () {
                var Q_Date = $("#ecrdQ_Date").val();
                var N_Date = $("#ecrdN_Date").val();
                var N_Item = $("#ecrdN_Item").val();
                var Question = $("#ecrdQuestion").val();
                var data = "Auto_id=" + Auto_id + "&Q_Date=" + Q_Date + "&Question=" + Question + "&N_Date=" + N_Date + "&N_Item=" + N_Item + "&Add_User=" + U_Num_M + "&action=editCallRecordDetail";
                var success = function (back) {
                    alert("修改通話紀錄資料 " + back);
                    //location.reload();
                    getCallRecordHtml();
                    hide_M("#editCallRecordDetailDiv");
                };
                ajax_M(CustomerManageHandlerUrl_G, data, success);
            });

        };
        var reeditDataCheckTF = function (type) {
            var checks = $(".reeditDataCheckTF" + type);
            var val = undefined;
            var errorCount = 0;
            var errorItemName = undefined;
            var back = true;
            $.each(checks, function (i, v) {
                val = $(v).val();
                if (isEmptyStr(val)) {
                    errorCount += 1;
                    errorItemName = $(v).attr("itemName");
                    alert(errorItemName + "欄位 請填入資料");
                    $(v).focus();
                    back = false;
                    return back;
                }
            });
            return back;
        };
        var sendAddTradeDetailCheckTF = function (type) {
            var checks = $(".sendAddTradeDetailCheckTF" + type);
            var val = undefined;
            var errorCount = 0;
            var errorItemName = undefined;
            var back = true;
            $.each(checks, function (i, v) {
                val = $(v).val();
                if (isEmptyStr(val)) {
                    errorCount += 1;
                    errorItemName = $(v).attr("itemName");
                    alert(errorItemName + "欄位 請填入資料");
                    $(v).focus();
                    back = false;
                    return back;
                }
            });
            return back;
        };
        var updateNormalEditTradeDetail = function (eT_ID, eMP, eMP_Name, eMP_COM, eMC, eMC_Name, eMC_COM, eT_AccountDate, eT_PayMoney, eLight_Status, eCcard_4Num, eT_StartDate, eT_EndDate, eT_Message, eT_Fax, eT_Media, eXQ_SName, eXQ_SPw, eT_Com, eINV_open_Item, eINV_MNum, eINV_tag, eINV_Createdate, eINV_Item, eINV_ComName, eINV_UnifyNum, eINV_SendState, eBack_intag, eBack_Status, eT_PS, eT_Item) {

            var data = "T_ID=" + eT_ID + "&MP=" + eMP + "&MP_Name=" + eMP_Name + "&MP_COM=" + eMP_COM + "&MC=" + eMC + "&MC_Name=" + eMC_Name + "&MC_COM=" + eMC_COM + "&T_AccountDate=" + eT_AccountDate + "&T_PayMoney=" + eT_PayMoney + "&Light_Status=" + eLight_Status + "&Ccard_4Num=" + eCcard_4Num + "&T_StartDate=" + eT_StartDate + "&T_EndDate=" + eT_EndDate + "&T_Message=" + eT_Message + "&T_Fax=" + eT_Fax + "&T_Media=" + eT_Media + "&XQ_SName=" + eXQ_SName + "&XQ_SPw=" + eXQ_SPw + "&T_Com=" + eT_Com + "&INV_open_Item=" + eINV_open_Item + "&INV_MNum=" + eINV_MNum + "&INV_tag=" + eINV_tag + "&INV_Createdate=" + eINV_Createdate + "&INV_Item=" + eINV_Item + "&INV_ComName=" + eINV_ComName + "&INV_UnifyNum=" + eINV_UnifyNum + "&INV_SendState=" + eINV_SendState + "&Back_intag=" + eBack_intag + "&Back_Status=" + eBack_Status + "&T_PS=" + eT_PS + "&edit_user=" + U_Num_M + "&edit_ip=" + IP_G + "&T_Item=" + eT_Item + "&action=updateNormalEditTradeDetail";
            var success = function (back) {
                alert("執行" + back);
                location.reload();
            };
            var error = function (back) {
                alert("資料修改失敗");
                Log_M("updateNormalEditTradeDetail error")

            };
            ajax_M(CustomerManageHandlerUrl_G, data, success, error);

        };


        //送出修改交易紀錄資料按鈕綁定
        //var sendNormalEditTradeDetailBtnBinding = function () {
        //    $("#sendNormalEditData").on("click", function () {
        //        if (dataCheckTF_M("eeditDataCheckTF")) {
        //            var eT_ID = val_M("#eT_ID");
        //            var eMP = $("#eMP_Name :selected").val();
        //            var eMP_Name = $("#eMP_Name :selected").text();
        //            var eMP_COM = $("#eMP_Name :selected").attr("comid");
        //            var eMC = $("#eMC :selected").val();
        //            var eMC_Name = (($("#eMC :selected").text()).split("-"))[0];
        //            var eMC_COM = $("#eMC :selected").attr("comid");

        //            var eT_AccountDate = datePickDateTOsqlDate(val_M("#eT_AccountDate"));
        //            var eT_PayMoney = val_M("#eT_PayMoney");
        //            var eLight_Status = val_M("#eLight_Status");
        //            var eCcard_4Num = val_M("#eCcard_4Num");
        //            var eT_StartDate = datePickDateTOsqlDate(val_M("#eT_StartDate"));
        //            var eT_EndDateArr = val_M("#eT_EndDate").split("/");
        //            var eT_EndDate = datePickDateTOsqlDate(val_M("#eT_EndDate"));;
        //            var eT_Message = $CommonTool.checkbox.getAllValue(".eT_Message");
        //            var eT_Fax = $CommonTool.checkbox.getAllValue(".eT_Fax");
        //            var eT_Media = $CommonTool.checkbox.getAllValue(".eT_Media");
        //            if (isEmptyStr(eT_Media)) {
        //                eT_Media = "";
        //            }
        //            var eXQ_SName = val_M("#eXQ_SName");
        //            var eXQ_SPw = val_M("#eXQ_SPw");
        //            var eT_Com = val_M("#eT_Com");
        //            var eINV_open_Item = val_M("#eINV_open_Item");
        //            var eINV_MNum = val_M("#eINV_MNum");
        //            var eINV_tag = val_M("#eINV_tag");
        //            var eINV_CreatedateArr = val_M("#eINV_CreatedateInput").split("/");
        //            var eINV_Createdate = datePickDateTOsqlDate(val_M("#eINV_CreatedateInput"));
        //            var eINV_Item = $("#eINV_ItemSelect").val();
        //            if (isEmptyStr(eINV_Item)) {
        //                eINV_Item = "";
        //            }
        //            var eINV_ComName = $("#eINV_ComNameInput").val();
        //            var eINV_UnifyNum = $("#eINV_UnifyNumInput").val();
        //            var eINV_SendState = $("#eINV_SendStateSelect").val();
        //            if (isEmptyStr(eINV_SendState)) {
        //                eINV_SendState = "";
        //            }
        //            var eBack_intag = $("#eBack_intag").val();
        //            var eBack_Status = $("#eBack_Status").val();
        //            var eHistoryT_PS = $("#eHistoryT_PS").html();
        //            var eT_PS = $("#eT_PS").val();
        //            if (isEmptyStr(eT_PS)) {
        //                eT_PS = eHistoryT_PS
        //            } else {
        //                eT_PS = $("#eT_PS").val() + " (" + U_Name_G + "-" + getNowDateTimeStr() + ")" + "<br>" + eHistoryT_PS;
        //            }

        //            var eT_Item = $("#eT_Item").val();

        //            updateNormalEditTradeDetail(eT_ID, eMP, eMP_Name, eMP_COM, eMC, eMC_Name, eMC_COM, eT_AccountDate, eT_PayMoney, eLight_Status, eCcard_4Num, eT_StartDate, eT_EndDate, eT_Message, eT_Fax, eT_Media, eXQ_SName, eXQ_SPw, eT_Com, eINV_open_Item, eINV_MNum, eINV_tag, eINV_Createdate, eINV_Item, eINV_ComName, eINV_UnifyNum, eINV_SendState, eBack_intag, eBack_Status, eT_PS, eT_Item);

        //        }


        //    });
        //};
        //送出新增交易紀錄資料按鈕綁定
        //var sendAddTradeDetailBtnBinding = function () {
        //    $("#sendAddTradeDetail").on("click", function () {
        //        var TF = undefined;
        //        var T_Type = $("#atdT_Type").val();

        //        if (sendAddTradeDetailCheckTF(T_Type)) {
        //            //查詢此客戶是否曾經是會員
        //            getCustomerData("single", getSingleCustomerDataSuccess);


        //            var T_ID = $CommonTool.Date.getNowDateTimeStr();
        //            var T_Com = $("#atdT_Com").val();
        //            var Pay_tag = $("#atdT_PayType").val();
        //            var Account_Date = $("#atdT_AccountDate").val();
        //            var MC = $("#atdMC").val();
        //            var MC_Name = (($("#atdMC :selected").text()).split("-"))[0];
        //            var MC_Com = $("#atdMC :selected").attr("comid");
        //            var MC2 = $("#atdMC2").val();
        //            var MC2_Name = (($("#atdMC2 :selected").text()).split("-"))[0];
        //            var MC2_Com = $("#atdMC2 :selected").attr("comid");
        //            var Account_MoneyN = $("#atdT_PayMoney").val();
        //            var Account_MoneyV = $("#atdT_AccountMoney1").val();
        //            var Account_MoneyVI = $("#atdT_AccountMoney2").val();
        //            var Pay_Type = $("#atdT_PType").val();
        //            var add_user = U_Num_M;
        //            var add_ip = IP_G;

        //            sendDTRAT(T_ID, Pay_tag, Account_Date, MC, MC_Name, MC_Com, MC2, MC2_Name, MC2_Com, Account_MoneyN, Account_MoneyV, Account_MoneyVI, Pay_Type, add_user, add_ip, T_Type, emptyValue_M, T_Com);
        //            var MP = $("#atdMP_Name").val();
        //            var MP_Name = $("#atdMP_Name :selected").text();
        //            var MP_COM = $("#atdMP_Name :selected").attr("comid");
        //            var T_Item = $("#atdT_Item").val();
        //            var Results_Item = $("#atdResults_Item").val();
        //            var V_ID = "";
        //            var V_Name = "";
        //            if (T_Type == "0002") {
        //                V_ID = $("#atdV_ID").val();
        //                V_Name = $("#atdV_ID :selected").text();
        //            }
        //            var MT_COM = T_Com;
        //            var T_PayMoney = Account_MoneyN;
        //            var T_PType = Pay_Type;
        //            var T_StartDate = $("#atdT_StartDate").val();
        //            var T_EndDate = $("#atdT_EndDate").val();
        //            var T_AccountDate = $("#atdT_AccountDate").val();
        //            var T_Fax = $CommonTool.checkbox.getAllValue(".atdT_Fax");
        //            var T_Media = $("input[name=atdT_Media]:checked").val();
        //            if (isEmptyStr(T_Media)) {
        //                T_Media = "";
        //            }
        //            var XQ_SName = $("#atdXQ_SName").val();
        //            var XQ_SPw = $("#atdXQ_SPw").val();
        //            var T_PS = $("#atdT_PS").val() + " (" + U_Name_G + "-" + getNowDateTimeStr() + ")" + "<br>";

        //            var T_Message = $CommonTool.checkbox.getAllValue(".atdT_Message");
        //            var Ccard_4Num = $("#atdCcard_4Num").val();
        //            var INV_tag = $("#atdINV_tag").val();
        //            var INV_Createdate = $("#atdINV_CreatedateInput").val();
        //            var INV_Item = $("#atdINV_ItemSelect").val();
        //            var INV_open_Item = $("#atdINV_open_Item").val();
        //            var INV_ComName = $("#atdINV_ComName").val();
        //            var INV_UnifyNum = $("#atdINV_UnifyNumInput").val();
        //            var INV_MNum = $("#atdINV_MNum").val();
        //            var INV_SendState = $("#atdINV_SendStateSelect").val();
        //            var Light_Status = $("#Light_Status").attr("light");
        //            var Back_intag = $("#atdBack_intag").val();

        //            sendMTRAT(T_ID, M_ID_G, MP, MP_Name, MP_COM, MC, MC_Name, MC_Com, T_Item, Results_Item, V_ID, V_Name, T_PayMoney, T_PType, T_Type, T_StartDate, T_EndDate, T_AccountDate, T_Fax, T_Media, T_PS, T_Message, Ccard_4Num, INV_tag, INV_Createdate, INV_Item, INV_open_Item, INV_ComName, INV_UnifyNum, INV_MNum, INV_SendState, Light_Status, Back_intag, add_user, add_ip, MT_COM, XQ_SName, XQ_SPw);
        //        }
        //    });
        //};

        //開啟交易紀錄 - 新增 視窗===========================================================================end
        //var atdTtypeChange = function () {
        //    var temp = val_M("#atdT_Type");
        //    if (temp == "0003") {
        //        $("#atdMC").val(U_Num_M);
        //    }
        //};
        //var openAddTradeRecordDetailDiv = function () {
        //    $("#atdT_AccountDate").val(Today_G);
        //    $("#atdT_StartDate").val(Today_G);
        //    $("#atdT_EndDate").val(Today_G);
        //    $("#atdINV_CreatedateInput").val(Today_G);
        //    $("#atdMC").val(MC_G);
        //    onChange_M("#atdT_Type", atdTtypeChange);

        //};
        //開啟交易紀錄 - 新增 視窗===========================================================================end

        //開啟通話紀錄 - 新增 視窗===========================================================================end
        var openAddCallRecordDetailDiv = function () {
            $("#acrdQ_Date").val(Today_G);
        };
        //開啟通話紀錄 - 新增 視窗===========================================================================end

        //開啟通話紀錄 - 修改 視窗===========================================================================end
        var openEditCallRecordDetailDiv = function (thisId) {
            $.each(CallRecordList_G, function (i, v) {

                if (v.Auto_id == thisId) {
                    $CommonTool.Date.putInputValueWithDatepickerDateTimeStr("#ecrdQ_Date", v.Q_Date);
                    if (!check_M.isEmptyDate(v.N_Date)) {
                        $CommonTool.Date.putInputValueWithDatepickerDateTimeStr("#ecrdN_Date", v.N_Date);
                    }
                    $("#ecrdN_Item").val(v.N_Item);
                    $("#ecrdQuestion").val(v.Question);
                    sendEditCallRecordDetailBtnBinding(v.Auto_id);
                }
            });

        };
        //開啟通話紀錄 - 修改 視窗===========================================================================end
        //var ecdSendEditData = function () {
        //    if (check_M.AllRequiredNoEmpty(".ecdRequired", "requiredItem")) {
        //        var thisId = T_id_G;
        //        var Pay_tag = val_M("#ecdPay_tag");
        //        var Account_Date = val_M("#ecdAccount_Date");
        //        var MC = val_M("#ecdMC");
        //        var MC_Name = (($("#ecdMC :selected").text()).split("-"))[0];
        //        var MC_Com = $("#ecdMC :selected").attr("comid");
        //        var Account_MoneyN = val_M("#ecdAccount_Money");
        //        var Pay_Type = val_M("#ecdPay_Type");
        //        var T_Com = $("#ecdT_Com").val();
        //        var DT_ID = $("#ecdDT_ID").val();
        //        sendDTRAT(thisId, Pay_tag, Account_Date, MC, MC_Name, MC_Com, emptyValue_M, emptyValue_M, emptyValue_M, Account_MoneyN, emptyValue_M, emptyValue_M, Pay_Type, U_Num_M, IP_G, "0004", DT_ID, T_Com);
        //    }

        //};

        //var acdSendAddData = function () {
        //    if (check_M.AllRequiredNoEmpty(".acdRequired", "requiredItem")) {
        //        var T_ID = T_id_G;
        //        var Pay_tag = $("#acdPay_tag").val();
        //        var Account_Date = $("#acdAccount_Date").val();
        //        var MC = $("#acdMC").val();
        //        var MC_Name = (($("#acdMC :selected").text()).split("-"))[0];
        //        var MC_Com = $("#acdMC :selected").attr("comid");
        //        var Account_MoneyN = $("#acdAccount_Money").val();
        //        var Pay_Type = $("#acdPay_Type").val();
        //        var T_Com = $("#acdT_Com").val();

        //        sendDTRAT(T_ID, Pay_tag, Account_Date, MC, MC_Name, MC_Com, emptyValue_M, emptyValue_M, emptyValue_M, Account_MoneyN, emptyValue_M, emptyValue_M, Pay_Type, U_Num_M, IP_G, "0001", emptyValue_M, T_Com);
        //    }
        //};
        //開啟收費明細 - 新增 視窗===========================================================================start
        //var openAddChargeDetailDialog = function () {
        //    $('#addChargeDetailDialog').dialog("open");
        //};


        //開啟收費明細 - 新增 視窗===========================================================================end

        //開啟修改頁面
        var openDiv = function (openDivName, thisId, type) {
            if (isEmptyStr(openDivName)) {
                openDivName = attr_M(this, "openDivName");
            }
            if (isEmptyStr(thisId)) {
                thisId = attr_M(this, "thisId");
                T_id_G = thisId;
            }
            if (isEmptyStr(type)) {
                type = attr_M(this, "tradeRecordDetailType");
            }

            //hide_M("#customerDetailTabDiv");

            switch (openDivName) {
                //case "#tradeDetailDiv":
                //    //開啟交易紀錄-詳細資料視窗
                //    openTradeRecordDetailDiv(thisId);
                //    getChargeDetailList(thisId, type);
                //    secondDivShowHide(openDivName);
                //    break;
                //case "#normalEditTradeDetailDiv":
                //    location.href = openDivName;
                //    $.blockUI();
                //    openNormalEditTradeRecordDetailDiv(thisId);
                //    getChargeDetailList(thisId, type);
                //    secondDivShowHide(openDivName);
                //    break;
                //case "#renewalEditTradeDetailDiv":
                //    openRenewalEditTradeRecordDetailDiv(thisId);
                //    show_M("#customerDetailTabDiv");
                //    break;
                //case "#stopEditTradeDetailDiv":
                //    openStopEditTradeRecordDetailDiv(thisId);
                //    show_M("#customerDetailTabDiv");
                //    break;
                //case "#restoreEditTradeDetailDiv":
                //    openRestoreEditTradeRecordDetailDiv(thisId);
                //    show_M("#customerDetailTabDiv");
                //    break;
                case "#addBusinessConnectionDiv":
                    //blockUI_M();
                    openAddBusinessConnectionDiv();
                    //alert(openDivName);
                    //Type1
                    //$("#Type1").hide();
                    //customerDetail
                    $("#customerDetail").hide();
                    secondDivShowHide(openDivName);
                    break;
                /* case "#eCustomerDetailTabDiv":
                     openEcustomerDetailTabDiv();
 
                     secondDivShowHide(openDivName);
                     break;
                 case "#addTradeRecordDetailDiv":
                     openAddTradeRecordDetailDiv();
                     secondDivShowHide(openDivName);
                     break;
                 case "#addCallRecordDetailDiv":
                     openAddCallRecordDetailDiv();
                     secondDivShowHide(openDivName);
                     break;
                 case "#editCallRecordDetailDiv":
                     openEditCallRecordDetailDiv(thisId);
                     secondDivShowHide(openDivName);
                     break;
                  case "#addChargeDetailDiv":
                      openAddChargeDetailDiv(thisId);
                      thirdDivShowHide(openDivName);
                      break;
                  /*case "#editChargeDetailDiv":
                      var DT_ID = $(this).attr("DT_ID");
                      var Pay_tag = $(this).attr("Pay_tag");
                      var MC = $(this).attr("MC");
                      var Account_Money = $(this).attr("Account_Money");
                      var Account_Date = $(this).attr("Account_Date");
                      var Pay_Type = $(this).attr("Pay_Type");
                      openEditChargeDetailDiv(thisId, Pay_tag, MC, Account_Money, Account_Date, Pay_Type, DT_ID);
                      thirdDivShowHide(openDivName);
                      break;*/
                case "#customerDetailTabDiv":
                    show_M(openDivName);
                    secondDivShowHide(openDivName);
                    show_M("#customerTabDiv");
                    break;

            }
        };

        //檢查手機號碼是否存在之功能系結
        var hasMTelInputBinding = function () {
            $(".checkMobile").on("change", function () {
                var MTel = $(this).val();
                var id = $(this).attr("id");
                var data = "MTel=" + MTel + "&action=hasMTel";
                var success = function (back) {
                    var MTelval = $("#" + id + "Input").val();
                    if (!isEmptyStr(back)) {
                        if (MTelval == back) {

                        } else {
                            alert(back + "已存在請再次確認。");
                            $("#" + id).val("");
                        }
                    }
                };
                ajax_M(CustomerManageHandlerUrl_G, data, success);//<===
            });
        };


        //關閉div頁面
        var closeDiv = function () {
            var openDivName = $(this).attr("openDivName");
            $(openDivName).hide();
            if (openDivName == "#addTradeRecordDetailDiv" || openDivName == "#normalEditTradeDetailDiv" || openDivName == "#eCustomerDetailTabDiv" || openDivName == "#addBusinessConnectionDiv") {

                show_M("#customerDetailTabDiv");
                show_M("#customerTabDiv");

            }
        };

        //刪除交易紀錄
        //var deleteTradeRecordDetail = function (thisId) {
        //    var data = "T_ID=" + thisId + "&action=deleteTradeRecordDetail";
        //    var success = function (back) {
        //        alert("刪除資料" + back);
        //        location.reload();
        //    };
        //    ajax_M(CustomerManageHandlerUrl_G, data, success);
        //};

        //刪除通話紀錄紀錄
        //var deleteCallRecordDetail = function (thisId) {

        //    var data = "Auto_id=" + thisId + "&action=deleteCallRecordDetail";
        //    var success = function (back) {
        //        alert("刪除資料" + back);
        //        //location.reload();
        //        getCallRecordHtml();
        //    };
        //    ajax_M(CustomerManageHandlerUrl_G, data, success);
        //};
        //var click2023 = function trclick() { alert('tr clicked') };
        //取得交易紀錄html頁面
        //var getTradeRecordHtml = function () {
        //    var data = "M_ID=" + M_ID_G + "&action=getTradeRecord";
        //    var success = function (back) {
        //        var json = jsonParse_M(back);
        //        TradeRecordListJson_G = json;
        //        var sb = new string_M.StringBuilder();
        //        var typeName = undefined;
        //        $.each(json, function (i, v) {
        //            sb.append("<tr onclick='click();'><td class='textAlignCenter' onclick='click();'>");
        //            sb.append("<a href='javascript:void(0)' class='openTradeDetailDiv' openDivName='#tradeDetailDiv' tradeRecordDetailType='detail' thisId='");
        //            // sb.append("<a href='javascript:void(0)' class='openDiv' openDivName='#tradeDetailDiv' tradeRecordDetailType='detail' thisId='");
        //            sb.append(v.T_ID);
        //            sb.append("'>");
        //            sb.append(v.T_ID);
        //            sb.append("</a>");
        //            sb.append("</td><td class='textAlignCenter' onclick='click();'>");
        //            sb.append(v.MP_Name);
        //            sb.append("</td><td class='textAlignCenter' onclick='click();'>");
        //            sb.append(v.T_ItemName);
        //            sb.append("-");
        //            sb.append(v.T_TypeName);
        //            sb.append("</td><td class='textAlignCenter' onclick='click();'>");
        //            sb.append(v.maturityDays);
        //            sb.append("/");
        //            sb.append(v.contractDays);
        //            sb.append("</td><td class='textAlignCenter'>");
        //            sb.append(v.T_StartDate);
        //            sb.append("</td><td class='textAlignCenter'>");
        //            sb.append(v.T_EndDate);
        //            sb.append("</td><td class='textAlignCenter'>");

        //            if (v.T_Status == "暫停中") {
        //                sb.append("<font color='green'>");
        //            }
        //            sb.append(v.T_Status);
        //            if (v.T_Status == "暫停中") {
        //                sb.append("</font>");
        //            }
        //            sb.append("</td><td class='textAlignCenter'>");
        //            if (!isEmptyStr(v.ca_id)) {
        //                sb.append("<a href=https://www.hwa-guan.com.tw/file/RAPDF/");
        //                sb.append(v.Back_tagLink);
        //                sb.append(".pdf target=twcapdf>");
        //            }
        //            if (v.Back_tagName == "未歸") {
        //                sb.append("<font color='red'>");
        //            }
        //            sb.append(v.Back_tagName);
        //            if (v.Back_tagName == "未歸") {
        //                sb.append("</font>");
        //            }
        //            if (!isEmptyStr(v.ca_id)) {

        //                sb.append("</a>");
        //            }
        //            sb.append("</td><td class='textAlignCenter'>");
        //            sb.append(v.add_user);
        //            sb.append("</td><td class=''>");
        //            if (checkEnvelopeAble(v.MC)) {
        //                sb.append("<button type='button' class='btn btn-primary btn-flat envelopeAble btnSize2' id='envelopeBtn' thisId ='" + v.T_ID + "' >信封</button>");
        //            }
        //            sb.append("</td><td class=''>");
        //            if (checkEnvelopeAble(v.MC)) {
        //                sb.append("<button type='button' class='btn btn-primary btn-flat  btnSize2' id='openCDDbtn' thisId ='" + v.T_ID + "' >CDD</button>");
        //            }

        //            sb.append("</td><td class=''>");
        //            sb.append("<button type='button' class='btn btn-warning btn-flat tradeRecordDetailEditAble btnSize openDiv editPer' tradeRecordDetailType='normalEdit' openDivName='#normalEditTradeDetailDiv' thisId ='" + v.T_ID + "'>一</button>");
        //            sb.append("<button type='button' class='btn btn-success btn-flat tradeRecordDetailEditAble btnSize openDiv editPer' tradeRecordDetailType='renewalEdit' openDivName='#renewalEditTradeDetailDiv' thisId ='" + v.T_ID + "'>續</button>");
        //            if (v.T_Status == "進行中") {
        //                sb.append("<button type='button' class='btn btn-danger btn-flat tradeRecordDetailEditAble btnSize openDiv editPer' tradeRecordDetailType='stopEdit' openDivName='#stopEditTradeDetailDiv' thisId ='" + v.T_ID + "'>暫</button>");
        //            }

        //            if (v.T_Status == "暫停中") {
        //                sb.append("<button type='button' class='btn btn-primary btn-flat tradeRecordDetailEditAble btnSize openDiv editPer' tradeRecordDetailType='restoreEdit' openDivName='#restoreEditTradeDetailDiv' thisId ='" + v.T_ID + "'>恢</button>");
        //            }
        //            sb.append("</td><td class='textAlignCenter'><a href='#' class='deleteTradeRecordDetail delPer ' thisId='");
        //            sb.append(v.T_ID);
        //            sb.append("'>刪</a></td></tr>");
        //        });
        //        $("#tradeRecordTb").append(sb.toString());


        //        $(".deleteTradeRecordDetail").on("click", function () {
        //            var thisId = $(this).attr("thisId");
        //            var r = confirm("刪除後資料將無法恢復，確定刪除?");
        //            if (r == true) {
        //                deleteTradeRecordDetail(thisId);
        //            }
        //        });
        //        if (!checkTradeRecordDetailEditAble()) {
        //            $(".tradeRecordDetailEditAble").hide();
        //        }
        //        $(".envelopeAble").on("click", openEnvelope);
        //        $("#openCDDbtn").on("click", openCDD);
        //        //取得聯絡紀錄頁面
        //        getCallRecordHtml();
        //    };
        //    ajax_M(CustomerManageHandlerUrl_G, data, success);//<==================
        //};
        //var openTradeDetailDiv = function () {
        //    var openDivName = attr_M(this, "openDivName");
        //    var thisId = attr_M(this, "thisId");
        //    T_id_G = thisId;
        //    var type = attr_M(this, "tradeRecordDetailType");

        //    openTradeRecordDetailDiv(thisId);
        //    getChargeDetailList(thisId, type);
        //    // secondDivShowHide(openDivName);
        //};

        //取得聯絡紀錄頁面
        //var getCallRecordHtml = function () {
        //    var data = "M_ID=" + M_ID_G + "&action=getCallRecordList";
        //    var success = function (back) {
        //        var json = jsonParse_M(back);
        //        CallRecordList_G = json;
        //        var sb = new string_M.StringBuilder();
        //        $.each(json, function (i, v) {

        //            sb.append("<tr><td class='textAlignCenter'>");
        //            sb.append(i + 1);
        //            sb.append("</td><td class='textAlignCenter'>");
        //            sb.append(v.Q_Date);
        //            sb.append("</td><td class='textAlignCenter'>");
        //            sb.append(v.Question);
        //            sb.append("</td><td class='textAlignCenter'>");
        //            sb.append(v.Add_User);
        //            sb.append("</td><td class='textAlignCenter'><a href='#' class='openDiv' openDivName='#editCallRecordDetailDiv' thisId='");
        //            sb.append(v.Auto_id);
        //            sb.append("'>修</a></td><td class='textAlignCenter'><a href='#' class='deleteCallRecordDetail' thisId='");
        //            sb.append(v.Auto_id);
        //            sb.append("'>刪</td></tr>");

        //        });
        //        empty_M("#callRecordTb");
        //        $("#callRecordTb").append(sb.toString());
        //        $(".deleteCallRecordDetail").on("click", function () {
        //            var thisId = $(this).attr("thisId");
        //            var r = confirm("刪除後資料將無法恢復，確定刪除?");
        //            if (r == true) {
        //                deleteCallRecordDetail(thisId);
        //            } else {

        //            }
        //        });
        //        unBind_M(".closeDiv");
        //        unBind_M(".openDiv");
        //        onClick_M(".closeDiv", closeDiv);
        //        onClick_M(".openDiv", openDiv);
        //        onClick_M(".openTradeDetailDiv", openTradeDetailDiv);
        //        $(".closeDiv").on("click", closeDiv);
        //        $(".openDiv").on("click", openDiv);
        //    };
        //    ajax_M(CustomerManageHandlerUrl_G, data, success);//<=====================
        //};

        var afterSuccessFucMREGT03 = function () {
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept", "Dept", "option", "", "", Dept);
            //var SelectCom = val_M("#SelectCom_Title");//所選的公司
            //alert('!!!!');
            //////取得[部門]
            //$Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#SelectDept_Title", "Dept", SelectCom, "option", afterSuccFunc3);
            //////取得[公司]
            ////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom", "Com", "option");
            //////SelectCom_Title1
            ////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom_Title12", "Com", "option", "", afterSuccFunc3, "");
            //////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept_Title1", "", "Dept", "option", Com);//所選的公司別產生相對應的部門(中文)
            //////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "", "TownShip", "option", county);//所選的城市產生相對應的鄉鎮市區(中文)
            ////var SelectTownShip = val_M("#SelectTownShip");//所選的鄉鎮市區(代碼)
            ////alert(SelectTownShip);
            ////$("ZipCode").val(SelectTownShip);
            ////$("ZipCode1").val("123");

            //onChange_M("#MP", function () {
            //    //alert('MP Change!!!!');
            //    var type = val_M("#MP");
            //    //alert('MP Change!!!!');
            //    //alert(type);
            //    $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#MP_Item", type, "option");
            //});


        };
        var afterSuccessFuc = function () {
            //取得下拉示選單的值
            //alert('分析師option變動!!!');
            $(".closeDiv").on("click", closeDiv);
            $(".openDiv").on("click", openDiv);
            var MP_ID = val_M("#abcMP_ID");//所選的分析師會員編號
            //alert('分析師option變動!!!=>' + MP_ID);
            if (MP_ID != "") {
                // alert('分析師option變動!!!=>' + MP_ID);
                $Common.MITEM.getMP_ItemListHtmlTagOption(CommonHandlerUrl_M, "#abcMP_Item", MP_ID, "option");
            }
            //$Common.MITEM.getMP_ItemListHtmlTagOption(CommonHandlerUrl_M, "#abcMP_Item", MP_ID, "option");

            onChange_M("#abcMP_ID", function () {
                //alert('分析師option變動!!!');
                var MP_ID = val_M("#abcMP_ID");//所選的分析師會員編號
                $Common.MITEM.getMP_ItemListHtmlTagOption(CommonHandlerUrl_M, "#abcMP_Item", MP_ID, "option");
            });
            //var SelectValue = $("#SelectPosit").val();//職稱
            //alert(SelectValue);
        };
        //取得活動訊息頁面
        //var getActivityMessageHtml = function (M_Tel) {
        //    var data = "M_Tel=" + M_Tel + "&action=getActivityMessageList";
        //    var success = function (back) {
        //        var json = jsonParse_M(back);
        //        var sb = new string_M.StringBuilder();
        //        $.each(json, function (i, v) {
        //            sb.append("<tr><td class='textAlignCenter'>");
        //            sb.append(v.MFP_id);
        //            sb.append("</td><td class='textAlignCenter'>");
        //            sb.append(v.MFP_Name);
        //            sb.append("</td><td class='textAlignCenter'>");
        //            sb.append(v.MP_Name);
        //            sb.append("</td><td class='textAlignCenter'>");
        //            sb.append(v.add_date);
        //            sb.append("</td></tr>");
        //        });
        //        $("#activityMessageTb").append(sb.toString());
        //    };
        //    ajax_M(CustomerManageHandlerUrl_G, data, success);//<=======================
        //};

        //取得紀錄頁面
        //var getRecordHtml = function () {
        //    // getTradeRecordHtml();
        //};


        //頁籤切換功能
        //var tabChange = function () {
        //    var divId = $(this).attr("openDivName");
        //    var tabChanges = $(".tabChange");
        //    var thisCloseId = undefined;
        //    $.each(tabChanges, function (i, v) {
        //        thisCloseId = $(v).attr("openDivName");
        //        $(thisCloseId).hide();
        //    });
        //    $(divId).show();
        //};

        var INV_ItemSelectChange = function () {
            $(".INV_ItemSelect").on("change", function () {
                var type = $(this).val();
                var companyClassName = $(this).attr("companyClassName");
                if (type == "1") {
                    disabledTrue_M(companyClassName);
                } else {
                    disabledFalse_M(companyClassName);
                }
            });
        };

        var checkRequire = function (CF_Item) {
            var CF_Items = $(".CF_Item" + CF_Item);
            var emptyNum = 0;
            $.each(CF_Items, function (i, v) {
                tempVal = val_M(v);
                if (isEmptyStr(tempVal)) {
                    WarningMassage_G = "請輸入 '" + attr_M(v, "itemName") + "' 項目";
                    WarningID_G = "#" + attr_M(v, "id");
                    emptyNum += 1;
                    return emptyNum;
                }
            });
            return emptyNum;
        };

        var CF_ItemCheck = function (className) {
            var checks = $(className);
            var val = undefined;
            var errorItemName = undefined;
            var back = true;
            $.each(checks, function (i, v) {
                val = $(v).val();
                if (isEmptyStr(val)) {
                    errorItemName = $(v).attr("itemName");
                    alert(errorItemName + "欄位 請填入資料");
                    $(v).focus();
                    back = false;
                    return back;
                }
            });
            return back;
        };

        var CF_Item0006Check = function () {
            var TF = false;
            TF = emptyCheckInput_M(".CF_Item0006");
            if (val_M("#abcD_tag") == "1") {
                TF = emptyCheckInput_M(".CF_Item00061");
            }
            return TF;
        };

        var CF_Item0001Check = function () {
            var TF = true;
            //TF = emptyCheckInput_M(".CF_Item0001");
            //if (TF) {
            //    var PT_Item = val_M("#abcPT_Item");
            //    TF = emptyCheckInput_M(".PT_Item" + PT_Item);
            //}
            //if (TF) {
            //    var T_Type = val_M("#abcT_Type");
            //    if (T_Type != "0001") {
            //        TF = emptyCheckInput_M(".T_Type" + T_Type);
            //    }
            //}


            return TF;
        };
        //20230505要修改的地方!!!!!
        //按下新增業務聯絡單按鈕
        //(新增業務聯絡單函式)
        var addBusinessConnection = function () {
            var MessNEW;
            var goAjax = false;
            //20230419取得畫面欄位
            //20230524work!!這裡要驗證!!!!!!!!!
            var data = undefined;
            //var dataNew = undefined;
            var M_ID = M_ID_G;//案件編號
            var CF_Item = $("#abcCF_Item").val();//聯絡單種類
            alert("按下聯絡單種類編號!!" + CF_Item);
            //入會
            if (CF_Item == "0001") {
                //alert(CF_Item);
                //取得欄位資訊
                var mess_other3 = $("#mess_other3").val();//設訊[勾選]
                //alert("設訊:" + mess_other3);
                //var mess_other3_Check = document.getElementById("mess_other3");
                var mess_other3_Check_Value = $('#mess_other3').val();
                var fax_item_value = document.getElementById("fax_item_value");//傳真稿(選項)傳真稿的選項代號
                var mess_other3_Check_value = $(mess_other3).children("option:selected").val();//傳真稿(選項)傳真稿的選項代號
                var fax_item_value = document.getElementById("fax_item");//傳真稿(選項)傳真稿的選項代號
                //alert(mess_other3_Check_value);
                var mess_option = $("#mess_other3_Check").val();
                //alert("Option:" + mess_option);
                //if (mess_other3_Check[0].checked) { alert("!!!!!業務自帶勾選!!")};
                var mess_other5 = $("#mess_other5").val();//業務自帶
                //alert("業務自帶:" + mess_other5);
                var mess_other6 = $("#mess_other6").val();//特助或行政帶
                //alert("特助或行政帶:" + mess_other6);
                //
                var Results_Item = $("#abcResults_Item").val();//業績種類
                //入會-入帳資訊
                var Paymoney = $("#Paymoney").val();//會費(入賬資訊)[單筆]
                //alert("會費:" + Paymoney);
                //alert('付款類型:' + PT_Item);
                var PT_Item = $("#abcPT_Item").val();//付款類型(入賬資訊)[單筆]or[多筆]
                //alert('付款類型[單筆:1]or[多筆:2]:' + PT_Item);
                var U_Leader = $("#Select_Com_Sign").val();//簽核主管[公司]
                var U_LeaderCom = $("#Select_Dept_Sign").val();//簽核主管[部門]
                var U_LeaderName = $("#Select_Employ_Sign").val();//簽核主管[姓名]
                var Obj = $("#abcObj").val();//件別
                var PS = $("#abcPS").val();//備註
                var goAjax = false;
                /////////////////////////////////////////
                //var M_ID = $("#abcM_ID").val();//客戶資料
                var mess_other6_ = "";//設訊
                //入會方式
                var T_Type = $("#abcT_Type").val();//入會方式
                var MP_ID = $("#abcMP_ID").val();//分析師(入會方式)
                var MP_Item = $("#abcMP_Item").val();//會員種類(入會方式)
                var T_PType = $("#abcT_PType").val();//付款方式(入賬資訊)[單筆]
                //var Paymoney1 = $("#abcPaymoney1").val();//金額1(入賬資訊)[多筆]
                var T_PType1 = $("#abcT_PType1").val();//付款方式1(入賬資訊)[多筆]
                //var Paymoney2 = $("#abcPaymoney2").val();//金額2(入賬資訊)[多筆]
                var T_PType2 = $("#abcT_PType2").val();//付款方式2(入賬資訊)[多筆]
                //var CCard_4Num = $("#abcCCard_4Num").val();//信用卡末四碼
                //入會-入會時間
                var begindate_Date = $("#abcbegindate_Date").val();//入會日期
                var bcenddate_Date = $("#abcenddate_Date").val();//到期日期
                //電子委任契約書
                var ca_id = $("#abcca_id").val();//電子委任契約書
                //設定手機
                var CellPhone = $("#abcCellPhone").val();
                //傳真稿[設-網路傳真](checkb0x)[Fax]
                //20230504這邊要加判斷!!!!
                //20230504加入傳真拼接語法&加入訊息拼接語法
                //var mess = $("#mess_other").val();//傳真稿[設-網路傳真](checkb0x)
                //////傳真稿[設-網路傳真](選項)[Fax]
                var fax2 = $("#fax_item").val();//傳真稿[設-網路傳真](選項代號)
                ////傳真稿是否勾選
                var fax_Check = document.getElementById("fax");
                //alert("傳真稿是否勾選(設網路傳真):" + fax_Check.checked.toString());
                if (fax_Check.checked.toString() == "true") {
                    var Fax = "2," + fax2.toString();
                    //alert("傳真稿勾選項目代號:" + fax2.toString());
                    //alert("傳真稿勾選項目代號[OK]:" + Fax);
                }
                //var abcMess3_Check = document.getElementById("abcMess3");//$("#abcMess3").val();//設訊(選項代號)
                //var fax2 = $("#fax_item").val();//傳真稿[設-網路傳真](選項代號)
                //alert("Mess:" + abcMess3.checked.toString());
                //設訊是否勾選//abcMess3
                var abcMess = $("#abcMess3").val();//設訊勾選的項目[OK]

                //alert("設訊勾選的項目:" + abcMess);
                //var fax_item_ = $("#fax_item").val();//傳真稿勾選的項目[OK]
                //alert("傳真稿勾選的項目:" + fax_item_);
                var abcMess_Check = document.getElementById("mess_other3");
                //alert("設訊是否勾選:" + abcMess_Check.checked.toString());
                //alert("設訊勾選項目代號:" + abcMess.toString());
                //alert("設訊[選項代號]" + abcMess3);
                //設訊是否勾選
                
                var mess_other3_Check = document.getElementById("mess_other3");
                if (mess_other3_Check.checked.toString() == "true")//設訊是否勾選
                //if ($(mess_other3).prop("checked") == true) 
                {
                    //MessNEW
                    //alert("設訊勾選!");
                    MessNEW = "1" + "," + abcMess;
                    //alert("設訊:[OK]" + MessNEW);//ok
                }
                else if (mess_other3_Check.checked.toString() != "true")//不設
                {
                    //alert("設訊沒勾選!");
                    if (abcMess == "") {
                        MessNEW = "2";
                    }
                    else {
                        MessNEW = "2," + abcMess;
                    }
                }
                //20230810加入[業務自帶](mess_other5)[特助或行政帶](mess_other6)的判斷
                var mess_other5_Check = document.getElementById("mess_other5");//[業務自帶]
                if (mess_other5_Check.checked.toString() == "true")//[業務自帶]是否勾選
                {
                    //alert("[業務自帶]勾選");
                    MessNEW += ",3";
                }
                var mess_other6_Check = document.getElementById("mess_other6");//[特助或行政帶]
                if (mess_other6_Check.checked.toString() == "true")//[特助或行政帶]是否勾選
                {
                    //alert("[特助或行政帶]勾選");
                    MessNEW += ",4";
                }
                //if ($('#fax').is(":checked")) {
                //    alert("傳真稿[設-網路傳真]:勾選!!!")
                //}
                //checkBox = document.getElementById('#mess_other3');
                //if (checkBox.checked) {
                //    // Respond to the result
                //    alert("NEW傳真稿[設-網路傳真]:勾選!!!")
                //}
                ////傳真稿[設-網路傳真](選項)[Fax]
                if ($(mess_other5).prop("checked") == true) {
                    //alert("業務自帶勾選!!");//3
                    Mess = Mess + "3";
                }
                if ($(mess_other6).prop("checked") == true) {
                    //alert("特助或行政帶勾選!!");//4
                    if (Mess == "") {
                        Mess = Mess + "4";
                        alert(Mess);
                    }
                    else {
                        Mess = Mess + ",4";
                        alert(Mess);
                    }
                }
                alert("設訊_組合:[組合ok!!]" + Mess);
                var fax_item = $("#fax_item").val();//傳真稿[設-網路傳真](選項代號)
                var abcMess = $("#abcMess3").val();//設訊勾選的項目[OK]
                //alert("設訊勾選的項目:" + abcMess);//[OK]
                var fax_items = $("#fax_item").val();//傳真稿勾選的項目[OK]
                //alert("傳真稿勾選的項目:" + fax_items);//[OK]
                var fax_Check = document.getElementById("fax");
                var mess_other3_Check = document.getElementById("mess_other3");
                //傳真稿是否勾選
                //var fax_item_Check = document.getElementById("fax_item");//[OK]
                //var abcMess3_Check = document.getElementById("abcMess3");//[OK]
                //alert("傳真稿[設-網路傳真](是否勾選)" + fax_Check.checked);//[OK]
                //alert("[設訊](是否勾選)" + mess_other3_Check.checked);//[OK]
                var Mess;
                var Fax_New;

                if (fax_Check == "true")//傳真稿[設-網路傳真](是否勾選
                {
                    if (fax_items.toString() == "2") {
                        Fax_New = "2";
                    }
                    else {
                        Fax_New = "2," + fax_items;
                    }
                }
                else {
                    Fax_New = "3";
                }
                if (abcMess3_Check == "true")//[設訊](是否勾選)
                {

                }
                var mess_Check = document.getElementById("abcMess3");
                checkBox = document.getElementById('fax');//mess_other3
                var fax_item2 = $("#abcfax_item").val();//傳真稿[設-網路傳真](選項)
                //alert("傳真稿[設-網路傳真](選項)" + fax_item2);
                var fax_new = function (fax_Check, fax_item) {
                    if (fax_Check.checked == "true")//'設-網路傳真'
                    {
                        //if (fax_item = "2") {
                        //    fax = "2";
                        //}
                        //else if (fax_item != "2") {
                        //    fax = "2" + fax_item;
                        //}
                        fax = "2" + "," + fax_item;
                    }
                    else if (fax = "3")//不設
                    {
                        fax = "3";
                    }
                    alert("傳真:" + fax);
                    return fax;
                };
                //var Fax = fax_new(fax_Check)
                //fax_item2:傳真稿[設-網路傳真](選項)
                //var faxNew = fax_new(fax2,  );
                // alert("NEW:" + faxNew);
                //var mess_other6_ = "";//設訊

                //if ($(mess_other3).prop("checked") == true) {
                //    //alert("設訊:設勾選!!");
                //}
                //if ($(mess_other3).prop("checked") == true) {
                //    //alert("設訊:設勾選!!");
                //}
                //if ($(mess_other4).prop("checked") == true) {
                //    //alert("設訊:不設勾選!!");
                //}
                if ($(mess_other5).prop("checked") == true) {
                    //alert("業務自帶勾選!!");//3
                    //mess_other6_ = mess_other6_ + "3";
                }
                if ($(mess_other6).prop("checked") == true) {
                   // alert("特助或行政帶勾選!!");//4
                    //if (mess_other6_ == "") {
                    //    mess_other6_ = mess_other6_ + "4";
                    //}
                    //else {
                    //    mess_other6_ = mess_other6_ + ",4";
                    //}
                }
                //alert("勾選產生:" + mess_other6);
                var mess_other5_value = $("#mess_other5").val();
                var mess_other6_value = $("#mess_other6").val();
                //var fax2 = fax_new(fax)
                //訊息拼組語法
                /**
                 Mess = rep_txt(request("Mess"))
                 Mess_Item = rep_txt(request("Mess_Item"))
                 Mess_other = rep_txt(request("Mess_other"))
                 */
                //mess_Item
                //mess_other:業務自帶or特助或行政帶
                /**
                <select name="mess_item"   class=btn>
                        <option value="1" selected>一般</option>
                        <option value="5">解盤</option>
                        <option value="6">特別</option>
                        <option value="7">飆股</option>
                        <option value="10">專案</option>
                        </select>&nbsp;&nbsp;&nbsp;&nbsp;
                             */
                //mess_other:業務自帶/特助或行政帶
                //mess:設/不設
                //mess_Item:下拉式選單項目
                //mess_other: 業務自帶/特助或行政帶
                //mess_other用mess_other6帶入
                var mess_new = function (mess, mess_Item, mess_other, mess_other5_checked, mess_other6_checked) {
                    //var New_mess_other;
                    if (mess.toString() == "true")//設
                    {
                        if (mess_Item = "1" && mess_other == "" && mess_other5_checked == "true" && mess_other6_checked == "true") {
                            mess = "1,3,4";
                        }
                        else if (mess_Item = "1" && mess_other == "" && mess_other5_checked == "true" && mess_other6_checked != "true") {
                            mess = "1,3";
                        }
                        else if (mess_Item = "1" && mess_other == "" && mess_other5_checked != "true" && mess_other6_checked != "true") {
                            mess = "1,4";
                        }
                        else if (mess_Item = "1" && mess_other == "" && mess_other5_checked != "true" && mess_other6_checked != "true") {
                            mess = "1";
                        }
                        else if (mess_Item = "5" && mess_other == "" && mess_other5_checked == "true") {
                            //   elseif mess_Item = "5" and mess_other = "" then
                            mess = "1, 5";
                        }
                        else if (mess_Item = "6" && mess_other == "" && mess_other6_checked == "true") {
                            mess = "1, 6";
                        }
                        else if (mess_Item = "7" && mess_other == "") {
                            mess = "1, 7";
                        }
                        else if (mess_Item != "1" && mess_other == "") {
                            mess = "1," + mess_other + "," + mess_Item;
                        }
                        else if (mess_Item = "1" && mess_other == "") {
                            mess = "1," + mess_other;

                        }
                    }
                    else if (mess = "0002")//不設
                    {
                        if (mess_other.trim() == "") {
                            mess = "2";
                        }
                        else if (mess != "") {
                            mess = "2," + mess_other;
                        }
                    };//訊息拼接語法
                    alert("訊息拼接語法:" + mess);
                    return mess;
                };
                ////傳真稿(不設)[選項]
                var mess_other2 = $("#mess_other2").val();////傳真稿(不設)[選項]
                ////傳真稿(不設)[選項]
                if ($("#mess_other2").prop("checked")) {
                    alert("e")
                    alert("傳真稿不設:" + mess_other2);
                }
                //設訊[Mess]
                var Mess = $("#mess_other1").val();//設訊([設]:下拉選單)
                var mess_other3 = $("#mess_other3").val();//業務自帶
                var mess_other4 = $("#mess_other4").val();//特助或行政帶
                var INV_ITEM_UnifyNum = $("#abcINV_ITEM_UnifyNum").val();//統編
                var Select_Com = val_M("#Select_Com_Sign");//所選的公司
                var Select_Dept = val_M("#Select_Dept_Sign");//所選的部門
                var Select_Employ = val_M("#Select_Employ_Sign");//所選的人員姓名Select_Employ_Sign
                //alert('按下新增業務聯絡單按鈕123123!');
                //設鎖碼影音[Media]
                var Media = $("#abcMedia").val();//設鎖碼影音
                //設付費文章[P_Text]
                var P_text = $("#P_text").val();//設付費文章
                //設付費影片[P_video]
                var P_video = $("#P_video").val();//設付費影片
                //ATM後五碼
                var ATM = $("#abcATM").val();//ATM後五碼
                var CCard_4Num = $("#abcCCard_4Num").val();//信用卡末四碼
                //發票資料
                var INV_Open_Item = $("#abcINV_Open_Item").val();//發票開立方式
                var T_Ivo = $("#abcT_Ivo").val();//寄發狀況
                var INV_ITEM = $("#abcINV_ITEM").val();//發票種類
                var CarrierNumm = $("#abcCarrierNum").val();//載具編號
                var COMNAME = $("#abcCOMNAME").val();//公司抬頭
                var INV_ITEM_UnifyNum = $("#abcINV_ITEM_UnifyNum").val();//公司統編
                //簽核主管
                var U_Leader = $("#Select_Com_Sign").val();//簽核主管公司別
                var U_LeaderCom = $("#Select_Dept_Sign").val();//簽核主管部門別
                var U_LeaderName = $("#Select_Employ_Sign").val();//簽核主管姓名
                var Obj = $("#abcObj").val();//件別
                var PS = $("#abcPS").val();//備註
                ////傳真稿[設-網路傳真](選項)[Fax]
                var fax2 = $("#fax_item").val();//傳真稿[設-網路傳真](選項代號)
                //傳真稿是否勾選
                var fax_Check = document.getElementById("fax");

                ////////////////////////////////////////////////////
                //業績分類(業績歸屬類)
                var Select_Com_attach = val_M("#Select_Com_Attach");//所選的人員公司
                //alert(Select_Com_attach);
                var Select_Dept_Attach = val_M("#Select_Dept_Attach");//所選的人員部門
                //alert(Select_Dept_Attach);
                var Select_User_Attach = val_M("#Select_User_Attach");//所選的人員姓名
                //alert(Select_User_Attach);
                var abcCmonth2 = $("#abcCmonth2").val();//業績種類(當月or次月)
                alert("業績種類(當月or次月)" + abcCmonth2);
                var abcOther2 = $("#abcOther2").val();//業績種類(其他)
                alert("業績種類(其他)" + abcOther2);
                ////////////////////////////////////////////////////
                ////折讓
                //var data1 = $("#data1").val();//原案件折讓案件(案件編號)
                //var data2 = $("#data2").val();//原案件折讓案件(會員種類)
                //var abcD_MP = $("#abcD_MP").val(); //新案件(分析師)
                //var abcD_Item = $("#abcD_Item").val(); //新案件(分析師)
                //訂金件
                var abcV_ID = $("#abcV_IDandName").val();//選擇會場(編號)
                var abcV_Name = $("#abcV_IDandName").val();//選擇會場(名稱)
                var abcVD_paymoney = $("#abcVD_paymoney").val();//訂金金額
                var abcVD_Type = $("#abcVD_Type").val();//付款方式
                //退費
                var data3 = $("#data3").val();//退費案件(案件編號)
                var data4 = $("#data4").val();//退費案件(案件名稱)
                var abcB_Paymoney = $("#abcB_Paymoney").val();//退費金額
                //abcB_Paymoney
                //暫停/恢復
                var P_StartStop = $("#P_StartStop").val();//暫停/恢復
                var abcgetCase1 = $("#abcgetCase1").val();//暫停/恢復(案件編號)
                var abcgetCase2 = $("#abcgetCase2").val();//暫停/恢復(案件名稱)
                var abcSSdate_Date = $("#abcSSdate_Date").val();//暫停/恢復日期
            }
            //設訊
            else if (CF_Item == '0002') { }
            //設傳真稿
            else if (CF_Item == '0003') {

            }
            //業績歸屬
            else if (CF_Item == '0004')//業績歸屬
            {
                alert('業績歸屬!!');
                //業績分類(業績歸屬類)
                var Select_Com_attach = val_M("#Select_Com_Attach");//所選的人員公司
                //alert(Select_Com_attach);
                var Select_Dept_Attach = val_M("#Select_Dept_Attach");//所選的人員部門
                //alert(Select_Dept_Attach);
                var Select_User_Attach = val_M("#Select_User_Attach");//所選的人員員工編號
                //alert(Select_User_Attach);
                var abcCmonth2 = $("#abcCmonth2").val();//業績種類(當月or次月)
                alert("業績種類(當月or次月)" + abcCmonth2);
                var abcOther2 = $("#abcOther2").val();//業績種類(其他)
                alert("業績種類(其他)" + abcOther2);
                var U_LeaderCom = $("#Select_Com_Sign").val();//簽核主管公司別
                var U_LeaderDept = $("#Select_Dept_Sign").val();//簽核主管部門別
                var U_LeaderNum = $("#Select_Employ_Sign").val();//簽核主管員工編號
                var Obj = $("#abcObj").val();//件別
                var PS = $("#abcPS").val();//備註
            }
            //暫停/恢復
            else if (CF_Item == '0009') {
                alert(CF_Item);
                //取得欄位資訊
                var mess_other3 = $("#mess_other3").val();//設訊[勾選]
                alert("設訊勾選項目4:" + mess_other3);
                //var mess_other3_Check = document.getElementById("mess_other3");
                var mess_other3_Check_Value = $('#mess_other3').val();
                var fax_item_value = document.getElementById("fax_item_value");//傳真稿(選項)傳真稿的選項代號
                var mess_other3_Check_value = $(mess_other3).children("option:selected").val();//傳真稿(選項)傳真稿的選項代號
                var fax_item_value = document.getElementById("fax_item");//傳真稿(選項)傳真稿的選項代號
                //alert(mess_other3_Check_value);
                var mess_option = $("#mess_other3_Check").val();
                //alert("Option:" + mess_option);
                //if (mess_other3_Check[0].checked) { alert("!!!!!業務自帶勾選!!")};
                var mess_other5 = $("#mess_other5").val();//業務自帶
                //alert("業務自帶:" + mess_other5);
                var mess_other6 = $("#mess_other6").val();//特助或行政帶
                //alert("特助或行政帶:" + mess_other6);
                //
                var Results_Item = $("#abcResults_Item").val();//業績種類
                //入會-入帳資訊
                var Paymoney = $("#Paymoney").val();//會費(入賬資訊)[單筆]
                alert("會費:" + Paymoney);
                alert('付款類型:' + PT_Item);
                var PT_Item = $("#abcPT_Item").val();//付款類型(入賬資訊)[單筆]or[多筆]
                var U_Leader = $("#Select_Com_Sign").val();//簽核主管[公司]
                var U_LeaderCom = $("#Select_Dept_Sign").val();//簽核主管[部門]
                var U_LeaderName = $("#Select_Employ_Sign").val();//簽核主管[姓名]
                var Obj = $("#abcObj").val();//件別
                var PS = $("#abcPS").val();//備註
                var goAjax = false;
                /////////////////////////////////////////
                //var M_ID = $("#abcM_ID").val();//客戶資料

                //入會方式
                var T_Type = $("#abcT_Type").val();//入會方式
                var MP_ID = $("#abcMP_ID").val();//分析師(入會方式)
                var MP_Item = $("#abcMP_Item").val();//會員種類(入會方式)
                var T_PType = $("#abcT_PType").val();//付款方式(入賬資訊)[單筆]
                //var Paymoney1 = $("#abcPaymoney1").val();//金額1(入賬資訊)[多筆]
                var T_PType1 = $("#abcT_PType1").val();//付款方式1(入賬資訊)[多筆]
                //var Paymoney2 = $("#abcPaymoney2").val();//金額2(入賬資訊)[多筆]
                var T_PType2 = $("#abcT_PType2").val();//付款方式2(入賬資訊)[多筆]
                //var CCard_4Num = $("#abcCCard_4Num").val();//信用卡末四碼
                //入會-入會時間
                var begindate_Date = $("#abcbegindate_Date").val();//入會日期
                var bcenddate_Date = $("#abcenddate_Date").val();//到期日期
                //電子委任契約書
                var ca_id = $("#abcca_id").val();//電子委任契約書
                //設定手機
                var CellPhone = $("#abcCellPhone").val();
                //傳真稿[設-網路傳真](checkb0x)[Fax]
                //20230504這邊要加判斷!!!!
                //20230504加入傳真拼接語法&加入訊息拼接語法
                //var mess = $("#mess_other").val();//傳真稿[設-網路傳真](checkb0x)
                //////傳真稿[設-網路傳真](選項)[Fax]
                //var fax2 = $("#fax_item").val();//傳真稿[設-網路傳真](選項代號)
                ////傳真稿是否勾選
                //var fax_Check = document.getElementById("fax");
                //alert("傳真稿是否勾選:" + fax_Check.checked.toString());
                //alert("傳真稿勾選項目代號:" + fax2.toString());
                //var abcMess3_Check = document.getElementById("abcMess3");//$("#abcMess3").val();//設訊(選項代號)
                //var fax2 = $("#fax_item").val();//傳真稿[設-網路傳真](選項代號)
                //alert("Mess:" + abcMess3.checked.toString());
                //設訊是否勾選//abcMess3
                var abcMess = $("#abcMess3").val();
                var abcMess_Check = document.getElementById("mess_other3");
                //alert("設訊是否勾選:" + abcMess_Check.checked.toString());
                //alert("設訊勾選項目代號:" + abcMess.toString());
                //alert("設訊[選項代號]" + abcMess3);
                //設訊是否勾選
                var mess_other3_Check = document.getElementById("mess_other3");
                //if ($('#fax').is(":checked")) {
                //    alert("傳真稿[設-網路傳真]:勾選!!!")
                //}
                checkBox = document.getElementById('#mess_other3');
                //if (checkBox.checked) {
                //    // Respond to the result
                //    alert("NEW傳真稿[設-網路傳真]:勾選!!!")
                //}
                ////傳真稿[設-網路傳真](選項)[Fax]
                var fax2 = $("#fax_item").val();//傳真稿[設-網路傳真](選項代號)
                //傳真稿是否勾選
                var fax_Check = document.getElementById("fax");
                alert("傳真稿[設-網路傳真](是否勾選)" + fax2);
                checkBox = document.getElementById('fax');//mess_other3
                var fax_item2 = $("#abcfax_item").val();//傳真稿[設-網路傳真](選項)
                alert("傳真稿[設-網路傳真](選項)" + fax_item2);
                var fax_new = function (fax, fax_item) {
                    if (fax = "1")//'設-自取' |/目前沒用到(畫面沒有這個項目)
                    {
                        if (fax_item = "1") {
                            fax = "1";
                        }
                        else if (fax_item != "1") {

                        }
                    }
                    else if (fax = "2")//設-網路傳真
                    {
                        if (fax_item = "2") {
                            fax = "2";
                        }
                        else if (fax_item != "2") {
                            fax = "2," + fax_item;
                        }
                    }
                    else if (fax = "3")//不設
                    {
                        fax = "3";
                    }
                    return fax;
                };
                //fax_item2:傳真稿[設-網路傳真](選項)
                //var faxNew = fax_new(fax2,  );
                // alert("NEW:" + faxNew);


                if ($(mess_other3).prop("checked") == true) {
                    //alert("設訊:設勾選!!");
                }
                if ($(mess_other3).prop("checked") == true) {
                    //alert("設訊:設勾選!!");
                }
                if ($(mess_other4).prop("checked") == true) {
                    //alert("設訊:不設勾選!!");
                }
                //if ($(mess_other5).prop("checked") == true) {
                //    //alert("業務自帶勾選!!");//3
                //    mess_other6_ = mess_other6_ + "3";
                //}
                //if ($(mess_other6).prop("checked") == true) {
                //    //alert("特助或行政帶勾選!!");//4
                //    if (mess_other6_ == "") {
                //        mess_other6_ = mess_other6_ + "4";
                //    }
                //    else {
                //        mess_other6_ = mess_other6_ + ",4";
                //    }
                //}
                //alert("勾選產生:" + mess_other6);
                var mess_other5_value = $("#mess_other5").val();
                var mess_other6_value = $("#mess_other6").val();
                //var fax2 = fax_new(fax)
                //訊息拼組語法
                /**
                 Mess = rep_txt(request("Mess"))
                 Mess_Item = rep_txt(request("Mess_Item"))
                 Mess_other = rep_txt(request("Mess_other"))
                 */
                //mess_Item
                //mess_other:業務自帶or特助或行政帶
                /**
                <select name="mess_item"   class=btn>
                        <option value="1" selected>一般</option>
                        <option value="5">解盤</option>
                        <option value="6">特別</option>
                        <option value="7">飆股</option>
                        <option value="10">專案</option>
                        </select>&nbsp;&nbsp;&nbsp;&nbsp;
                             */
                //mess_other:業務自帶/特助或行政帶
                //mess:設/不設
                //mess_Item:下拉式選單項目
                //mess_other: 業務自帶/特助或行政帶
                //mess_other用mess_other6帶入
                //var mess_new = function (mess, mess_Item, mess_other) {

                //    //var New_mess_other;
                //    if (mess.toString() == "true")//設
                //    {
                //        if (mess_Item = "0001" && mess_other == "") {
                //            mess = "1";//一般
                //        }
                //        else if (mess_other = "0002" && mess_other == "") {
                //            //   elseif mess_Item = "5" and mess_other = "" then
                //            mess = "1, 2";//解盤
                //        }
                //        else if (mess_Item = "0003" && mess_other == "") {
                //            mess = "1, 3";
                //        }
                //        else if (mess_Item = "0004" && mess_other == "") {
                //            mess = "1, 4";
                //        }
                //        else if (mess_Item != "0005" && mess_other == "") {
                //            mess = "1," + mess_other + "," + mess_Item;
                //        }
                //        else if (mess_Item = "1" && mess_other == "") {
                //            mess = "1," + mess_other;

                //        }
                //    }
                //    else if (mess = "0002")//不設
                //    {
                //        if (mess_other.trim() == "") {
                //            mess = "2";
                //        }
                //        else if (mess != "") {
                //            mess = "2," + mess_other;
                //        }
                //    };//訊息拼接語法
                //    return mess;
                //};
                ////傳真稿(不設)[選項]
                var mess_other2 = $("#mess_other2").val();////傳真稿(不設)[選項]
                ////傳真稿(不設)[選項]
                if ($("#mess_other2").prop("checked")) {
                    alert("e")
                    alert("傳真稿不設:" + mess_other2);
                }
                //設訊[Mess]
                var Mess = $("#mess_other1").val();//設訊([設]:下拉選單)
                var mess_other3 = $("#mess_other3").val();//業務自帶
                var mess_other4 = $("#mess_other4").val();//特助或行政帶
                var INV_ITEM_UnifyNum = $("#abcINV_ITEM_UnifyNum").val();//統編
                var Select_Com = val_M("#Select_Com_Sign");//所選的公司
                var Select_Dept = val_M("#Select_Dept_Sign");//所選的部門
                var Select_Employ = val_M("#Select_Employ_Sign");//所選的人員姓名Select_Employ_Sign
                //alert('按下新增業務聯絡單按鈕123123!');
                //設鎖碼影音[Media]
                var Media = $("#abcMedia").val();//設鎖碼影音
                //設付費文章[P_Text]
                var P_text = $("#P_text").val();//設付費文章
                //設付費影片[P_video]
                var P_video = $("#P_video").val();//設付費影片
                //ATM後五碼
                var ATM = $("#abcATM").val();//ATM後五碼
                var CCard_4Num = $("#abcCCard_4Num").val();//信用卡末四碼
                //發票資料
                var INV_Open_Item = $("#abcINV_Open_Item").val();//發票開立方式
                var T_Ivo = $("#abcT_Ivo").val();//寄發狀況
                var INV_ITEM = $("#abcINV_ITEM").val();//發票種類
                var CarrierNumm = $("#abcCarrierNum").val();//載具編號
                var COMNAME = $("#abcCOMNAME").val();//公司抬頭
                var INV_ITEM_UnifyNum = $("#abcINV_ITEM_UnifyNum").val();//公司統編
                //簽核主管
                var U_Leader = $("#Select_Com_Sign").val();//簽核主管公司別
                var U_LeaderCom = $("#Select_Dept_Sign").val();//簽核主管部門別
                var U_LeaderName = $("#Select_Employ_Sign").val();//簽核主管姓名
                var Obj = $("#abcObj").val();//件別
                var PS = $("#abcPS").val();//備註
                ////傳真稿[設-網路傳真](選項)[Fax]
                var fax2 = $("#fax_item").val();//傳真稿[設-網路傳真](選項代號)
                //傳真稿是否勾選
                var fax_Check = document.getElementById("fax");

                ////////////////////////////////////////////////////
                //業績分類(業績歸屬類)
                var Select_Com_attach = val_M("#Select_Com_Attach");//所選的人員公司
                //alert(Select_Com_attach);
                var Select_Dept_Attach = val_M("#Select_Dept_Attach");//所選的人員部門
                //alert(Select_Dept_Attach);
                var Select_User_Attach = val_M("#Select_User_Attach");//所選的人員姓名
                //alert(Select_User_Attach);
                var abcCmonth2 = $("#abcCmonth2").val();//業績種類(當月or次月)
                alert("業績種類(當月or次月)" + abcCmonth2);
                var abcOther2 = $("#abcOther2").val();//業績種類(其他)
                alert("業績種類(其他)" + abcOther2);
                ////////////////////////////////////////////////////
                ////折讓
                //var data1 = $("#data1").val();//原案件折讓案件(案件編號)
                //var data2 = $("#data2").val();//原案件折讓案件(會員種類)
                //var abcD_MP = $("#abcD_MP").val(); //新案件(分析師)
                //var abcD_Item = $("#abcD_Item").val(); //新案件(分析師)
                //訂金件
                var abcV_ID = $("#abcV_IDandName").val();//選擇會場(編號)
                var abcV_Name = $("#abcV_IDandName").val();//選擇會場(名稱)
                var abcVD_paymoney = $("#abcVD_paymoney").val();//訂金金額
                var abcVD_Type = $("#abcVD_Type").val();//付款方式
                //退費
                var data3 = $("#data3").val();//退費案件(案件編號)
                var data4 = $("#data4").val();//退費案件(案件名稱)
                var abcB_Paymoney = $("#abcB_Paymoney").val();//退費金額
                //abcB_Paymoney
                //暫停/恢復
                var P_StartStop = $("#P_StartStop").val();//暫停/恢復
                var abcgetCase1 = $("#abcgetCase1").val();//暫停/恢復(案件編號)
                var abcgetCase2 = $("#abcgetCase2").val();//暫停/恢復(案件名稱)
                var abcSSdate_Date = $("#abcSSdate_Date").val();//暫停/恢復日期
            }
            //轉換老師
            else if (CF_Item == '0010') {
                alert("按下聯絡單種類編號:" + CF_Item);
                //是否折讓
                var C_tag = val_M("#abcC_tag");//是否折讓
                //取得欄位資訊
                var mess_other3 = $("#mess_other3").val();//設訊[勾選]
                //alert("設訊:" + mess_other3);
                //var mess_other3_Check = document.getElementById("mess_other3");
                var mess_other3_Check_Value = $('#mess_other3').val();
                var fax_item_value = document.getElementById("fax_item_value");//傳真稿(選項)傳真稿的選項代號
                var mess_other3_Check_value = $(mess_other3).children("option:selected").val();//傳真稿(選項)傳真稿的選項代號
                var fax_item_value = document.getElementById("fax_item");//傳真稿(選項)傳真稿的選項代號
                //alert(mess_other3_Check_value);
                //var mess_option = $("#mess_other3_Check").val();
                //alert("Option:" + mess_option);
                //if (mess_other3_Check[0].checked) { alert("!!!!!業務自帶勾選!!")};
                var mess_other5 = $("#mess_other5").val();//業務自帶
                //alert("業務自帶:" + mess_other5);
                var mess_other6 = $("#mess_other6").val();//特助或行政帶
                //alert("特助或行政帶:" + mess_other6);
                //
                var Results_Item = $("#abcResults_Item").val();//業績種類
                //入會-入帳資訊
                var Paymoney = $("#Paymoney").val();//會費(入賬資訊)[單筆]
                //alert("會費:" + Paymoney);
                //alert('付款類型:' + PT_Item);
                var PT_Item = $("#abcPT_Item").val();//付款類型(入賬資訊)[單筆]or[多筆]
                var U_Leader = $("#Select_Com_Sign").val();//簽核主管[公司]
                var U_LeaderCom = $("#Select_Dept_Sign").val();//簽核主管[部門]
                var U_LeaderName = $("#Select_Employ_Sign").val();//簽核主管[姓名]
                var Obj = $("#abcObj").val();//件別
                var PS = $("#abcPS").val();//備註
                var goAjax = false;
                /////////////////////////////////////////
                //var M_ID = $("#abcM_ID").val();//客戶資料

                //入會方式
                var T_Type = $("#abcT_Type").val();//入會方式
                var MP_ID = $("#abcMP_ID").val();//分析師(入會方式)
                var MP_Item = $("#abcMP_Item").val();//會員種類(入會方式)
                var T_PType = $("#abcT_PType").val();//付款方式(入賬資訊)[單筆]
                //var Paymoney1 = $("#abcPaymoney1").val();//金額1(入賬資訊)[多筆]
                var T_PType1 = $("#abcT_PType1").val();//付款方式1(入賬資訊)[多筆]
                //var Paymoney2 = $("#abcPaymoney2").val();//金額2(入賬資訊)[多筆]
                var T_PType2 = $("#abcT_PType2").val();//付款方式2(入賬資訊)[多筆]
                //var CCard_4Num = $("#abcCCard_4Num").val();//信用卡末四碼
                //入會-入會時間
                var begindate_Date = $("#abcbegindate_Date").val();//入會日期
                var bcenddate_Date = $("#abcenddate_Date").val();//到期日期
                //電子委任契約書
                var ca_id = $("#abcca_id").val();//電子委任契約書
                //設定手機
                var CellPhone = $("#abcCellPhone").val();
                //傳真稿[設-網路傳真](checkb0x)[Fax]
                //20230504這邊要加判斷!!!!
                //20230504加入傳真拼接語法&加入訊息拼接語法
                //var mess = $("#mess_other").val();//傳真稿[設-網路傳真](checkb0x)
                //////傳真稿[設-網路傳真](選項)[Fax]
                //var fax2 = $("#fax_item").val();//傳真稿[設-網路傳真](選項代號)
                ////傳真稿是否勾選
                //var fax_Check = document.getElementById("fax");
                //alert("傳真稿是否勾選:" + fax_Check.checked.toString());
                //alert("傳真稿勾選項目代號:" + fax2.toString());
                //var abcMess3_Check = document.getElementById("abcMess3");//$("#abcMess3").val();//設訊(選項代號)
                //var fax2 = $("#fax_item").val();//傳真稿[設-網路傳真](選項代號)
                //alert("Mess:" + abcMess3.checked.toString());
                //設訊是否勾選//abcMess3
                var abcMess = $("#abcMess3").val();
                var abcMess_Check = document.getElementById("mess_other3");
                //alert("設訊是否勾選:" + abcMess_Check.checked.toString());
                //alert("設訊勾選項目代號:" + abcMess.toString());
                //alert("設訊[選項代號]" + abcMess3);
                //設訊是否勾選
                var mess_other3_Check = document.getElementById("mess_other3");
                //if ($('#fax').is(":checked")) {
                //    alert("傳真稿[設-網路傳真]:勾選!!!")
                //}
                checkBox = document.getElementById('#mess_other3');
                //if (checkBox.checked) {
                //    // Respond to the result
                //    alert("NEW傳真稿[設-網路傳真]:勾選!!!")
                //}
                ////傳真稿[設-網路傳真](選項)[Fax]
                var fax2 = $("#fax_item").val();//傳真稿[設-網路傳真](選項代號)
                //傳真稿是否勾選
                var fax_Check = document.getElementById("fax");
                alert("傳真稿[設-網路傳真](是否勾選)" + fax2);
                checkBox = document.getElementById('fax');//mess_other3
                var fax_item2 = $("#abcfax_item").val();//傳真稿[設-網路傳真](選項)
                alert("傳真稿[設-網路傳真](選項)" + fax_item2);
                var fax_new = function (fax, fax_item) {
                    if (fax = "1")//'設-自取' |/目前沒用到(畫面沒有這個項目)
                    {
                        if (fax_item = "1") {
                            fax = "1";
                        }
                        else if (fax_item != "1") {

                        }
                    }
                    else if (fax = "2")//設-網路傳真
                    {
                        if (fax_item = "2") {
                            fax = "2";
                        }
                        else if (fax_item != "2") {
                            fax = "2," + fax_item;
                        }
                    }
                    else if (fax = "3")//不設
                    {
                        fax = "3";
                    }
                    return fax;
                };
                //fax_item2:傳真稿[設-網路傳真](選項)
                //var faxNew = fax_new(fax2,  );
                // alert("NEW:" + faxNew);
                var mess_other6_ = "";//設訊

                if ($(mess_other3).prop("checked") == true) {
                    //alert("設訊:設勾選!!");
                }
                if ($(mess_other3).prop("checked") == true) {
                    //alert("設訊:設勾選!!");
                }
                if ($(mess_other4).prop("checked") == true) {
                    //alert("設訊:不設勾選!!");
                }
                if ($(mess_other5).prop("checked") == true) {
                    //alert("業務自帶勾選!!");//3
                    mess_other6_ = mess_other6_ + "3";
                }
                if ($(mess_other6).prop("checked") == true) {
                    //alert("特助或行政帶勾選!!");//4
                    if (mess_other6_ == "") {
                        mess_other6_ = mess_other6_ + "4";
                    }
                    else {
                        mess_other6_ = mess_other6_ + ",4";
                    }
                }
                //alert("勾選產生:" + mess_other6);
                var mess_other5_value = $("#mess_other5").val();
                var mess_other6_value = $("#mess_other6").val();
                //var fax2 = fax_new(fax)
                //訊息拼組語法
                /**
                 Mess = rep_txt(request("Mess"))
                 Mess_Item = rep_txt(request("Mess_Item"))
                 Mess_other = rep_txt(request("Mess_other"))
                 */
                //mess_Item
                //mess_other:業務自帶or特助或行政帶
                /** 
                <select name="mess_item"   class=btn>
                        <option value="1" selected>一般</option>
                        <option value="5">解盤</option>
                        <option value="6">特別</option>
                        <option value="7">飆股</option>
                        <option value="10">專案</option>
                        </select>&nbsp;&nbsp;&nbsp;&nbsp;
                             */
                //mess_other:業務自帶/特助或行政帶
                //mess:設/不設
                //mess_Item:下拉式選單項目
                //mess_other: 業務自帶/特助或行政帶
                //mess_other用mess_other6帶入
                //var mess_new = function (mess, mess_Item, mess_other) {

                //    //var New_mess_other;
                //    if (mess.toString() == "true")//設
                //    {
                //        if (mess_Item = "1" && mess_other == "") {
                //            mess = "1";
                //        }
                //        else if (mess_other = "5" && mess_other == "") {
                //            //   elseif mess_Item = "5" and mess_other = "" then
                //            mess = "1, 5";
                //        }
                //        else if (mess_Item = "6" && mess_other == "") {
                //            mess = "1, 6";
                //        }
                //        else if (mess_Item = "7" && mess_other == "") {
                //            mess = "1, 7";
                //        }
                //        else if (mess_Item != "1" && mess_other == "") {
                //            mess = "1," + mess_other + "," + mess_Item;
                //        }
                //        else if (mess_Item = "1" && mess_other == "") {
                //            mess = "1," + mess_other;

                //        }
                //    }
                //    else if (mess = "0002")//不設
                //    {
                //        if (mess_other.trim() == "") {
                //            mess = "2";
                //        }
                //        else if (mess != "") {
                //            mess = "2," + mess_other;
                //        }
                //    };//訊息拼接語法
                //    return mess;
                //};
                ////傳真稿(不設)[選項]
                var mess_other2 = $("#mess_other2").val();////傳真稿(不設)[選項]
                ////傳真稿(不設)[選項]
                if ($("#mess_other2").prop("checked")) {
                    alert("e")
                    alert("傳真稿不設:" + mess_other2);
                }
                //設訊[Mess]
                var Mess = $("#mess_other1").val();//設訊([設]:下拉選單)
                var mess_other3 = $("#mess_other3").val();//業務自帶
                var mess_other4 = $("#mess_other4").val();//特助或行政帶
                var INV_ITEM_UnifyNum = $("#abcINV_ITEM_UnifyNum").val();//統編
                var Select_Com = val_M("#Select_Com_Sign");//所選的公司
                var Select_Dept = val_M("#Select_Dept_Sign");//所選的部門
                var Select_Employ = val_M("#Select_Employ_Sign");//所選的人員姓名Select_Employ_Sign
                //alert('按下新增業務聯絡單按鈕123123!');
                //設鎖碼影音[Media]
                var Media = $("#abcMedia").val();//設鎖碼影音
                //設付費文章[P_Text]
                var P_text = $("#P_text").val();//設付費文章
                //設付費影片[P_video]
                var P_video = $("#P_video").val();//設付費影片
                //ATM後五碼
                var ATM = $("#abcATM").val();//ATM後五碼
                var CCard_4Num = $("#abcCCard_4Num").val();//信用卡末四碼
                //發票資料
                var INV_Open_Item = $("#abcINV_Open_Item").val();//發票開立方式
                var T_Ivo = $("#abcT_Ivo").val();//寄發狀況
                var INV_ITEM = $("#abcINV_ITEM").val();//發票種類
                var CarrierNumm = $("#abcCarrierNum").val();//載具編號
                var COMNAME = $("#abcCOMNAME").val();//公司抬頭
                var INV_ITEM_UnifyNum = $("#abcINV_ITEM_UnifyNum").val();//公司統編
                //簽核主管
                var U_Leader = $("#Select_Com_Sign").val();//簽核主管公司別
                var U_LeaderCom = $("#Select_Dept_Sign").val();//簽核主管部門別
                var U_LeaderName = $("#Select_Employ_Sign").val();//簽核主管姓名
                var Obj = $("#abcObj").val();//件別
                var PS = $("#abcPS").val();//備註
                ////傳真稿[設-網路傳真](選項)[Fax]
                var fax2 = $("#fax_item").val();//傳真稿[設-網路傳真](選項代號)
                //傳真稿是否勾選
                var fax_Check = document.getElementById("fax");

                ////////////////////////////////////////////////////
                //業績分類(業績歸屬類)
                var Select_Com_attach = val_M("#Select_Com_Attach");//所選的人員公司
                //alert(Select_Com_attach);
                var Select_Dept_Attach = val_M("#Select_Dept_Attach");//所選的人員部門
                //alert(Select_Dept_Attach);
                var Select_User_Attach = val_M("#Select_User_Attach");//所選的人員姓名
                //alert(Select_User_Attach);
                var abcCmonth2 = $("#abcCmonth2").val();//業績種類(當月or次月)
                alert("業績種類(當月or次月)" + abcCmonth2);
                var abcOther2 = $("#abcOther2").val();//業績種類(其他)
                alert("業績種類(其他)" + abcOther2);
                ////////////////////////////////////////////////////
                ////折讓
                //var data1 = $("#data1").val();//原案件折讓案件(案件編號)
                //var data2 = $("#data2").val();//原案件折讓案件(會員種類)
                //var abcD_MP = $("#abcD_MP").val(); //新案件(分析師)
                //var abcD_Item = $("#abcD_Item").val(); //新案件(分析師)
                //訂金件
                var abcV_ID = $("#abcV_IDandName").val();//選擇會場(編號)
                var abcV_Name = $("#abcV_IDandName").val();//選擇會場(名稱)
                var abcVD_paymoney = $("#abcVD_paymoney").val();//訂金金額
                var abcVD_Type = $("#abcVD_Type").val();//付款方式
                //退費
                var data3 = $("#data3").val();//退費案件(案件編號)
                var data4 = $("#data4").val();//退費案件(案件名稱)
                var abcB_Paymoney = $("#abcB_Paymoney").val();//退費金額
                //abcB_Paymoney
                //暫停/恢復
                var P_StartStop = $("#P_StartStop").val();//暫停/恢復
                var abcgetCase1 = $("#abcgetCase1").val();//暫停/恢復(案件編號)
                var abcgetCase2 = $("#abcgetCase2").val();//暫停/恢復(案件名稱)
                var abcSSdate_Date = $("#abcSSdate_Date").val();//暫停/恢復日期
            }
            else {
                alert("選取編號:" + CF_Item);
                //取得欄位資訊
                var mess_other3 = $("#mess_other3").val();//設訊[勾選]
                alert("設訊勾選項目5:" + mess_other3);
                //var mess_other3_Check = document.getElementById("mess_other3");
                var mess_other3_Check_Value = $('#mess_other3').val();
                var fax_item_value = document.getElementById("fax_item_value");//傳真稿(選項)傳真稿的選項代號
                var mess_other3_Check_value = $(mess_other3).children("option:selected").val();//傳真稿(選項)傳真稿的選項代號
                var fax_item_value = document.getElementById("fax_item");//傳真稿(選項)傳真稿的選項代號
                //alert(mess_other3_Check_value);
                var mess_option = $("#mess_other3_Check").val();
                //alert("Option:" + mess_option);
                //if (mess_other3_Check[0].checked) { alert("!!!!!業務自帶勾選!!")};
                var mess_other5 = $("#mess_other5").val();//業務自帶
                //alert("業務自帶:" + mess_other5);
                var mess_other6 = $("#mess_other6").val();//特助或行政帶
                //alert("特助或行政帶:" + mess_other6);
                //
                var Results_Item = $("#abcResults_Item").val();//業績種類
                //入會-入帳資訊
                var Paymoney = $("#Paymoney").val();//會費(入賬資訊)[單筆]
                alert("會費:" + Paymoney);
                alert('付款類型:' + PT_Item);
                var PT_Item = $("#abcPT_Item").val();//付款類型(入賬資訊)[單筆]or[多筆]
                var U_Leader = $("#Select_Com_Sign").val();//簽核主管[公司]
                var U_LeaderCom = $("#Select_Dept_Sign").val();//簽核主管[部門]
                var U_LeaderName = $("#Select_Employ_Sign").val();//簽核主管[姓名]
                var Obj = $("#abcObj").val();//件別
                var PS = $("#abcPS").val();//備註
                var goAjax = false;
                /////////////////////////////////////////
                //var M_ID = $("#abcM_ID").val();//客戶資料

                //入會方式
                var T_Type = $("#abcT_Type").val();//入會方式
                var MP_ID = $("#abcMP_ID").val();//分析師(入會方式)
                var MP_Item = $("#abcMP_Item").val();//會員種類(入會方式)
                var T_PType = $("#abcT_PType").val();//付款方式(入賬資訊)[單筆]
                //var Paymoney1 = $("#abcPaymoney1").val();//金額1(入賬資訊)[多筆]
                var T_PType1 = $("#abcT_PType1").val();//付款方式1(入賬資訊)[多筆]
                //var Paymoney2 = $("#abcPaymoney2").val();//金額2(入賬資訊)[多筆]
                var T_PType2 = $("#abcT_PType2").val();//付款方式2(入賬資訊)[多筆]
                //var CCard_4Num = $("#abcCCard_4Num").val();//信用卡末四碼
                //入會-入會時間
                var begindate_Date = $("#abcbegindate_Date").val();//入會日期
                var bcenddate_Date = $("#abcenddate_Date").val();//到期日期
                //電子委任契約書
                var ca_id = $("#abcca_id").val();//電子委任契約書
                //設定手機
                var CellPhone = $("#abcCellPhone").val();
                //傳真稿[設-網路傳真](checkb0x)[Fax]
                //20230504這邊要加判斷!!!!
                //20230504加入傳真拼接語法&加入訊息拼接語法
                //var mess = $("#mess_other").val();//傳真稿[設-網路傳真](checkb0x)
                ////傳真稿[設-網路傳真](選項)[Fax]
                var fax2 = $("#fax_item").val();//傳真稿[設-網路傳真](選項代號)
                //傳真稿是否勾選
                var fax_Check = document.getElementById("fax");
                //alert("傳真稿是否勾選:" + fax_Check.checked.toString());
                //alert("傳真稿勾選項目代號:" + fax2.toString());
                //var abcMess3_Check = document.getElementById("abcMess3");//$("#abcMess3").val();//設訊(選項代號)
                //var fax2 = $("#fax_item").val();//傳真稿[設-網路傳真](選項代號)
                //alert("Mess:" + abcMess3.checked.toString());
                //設訊是否勾選//abcMess3
                var abcMess = $("#abcMess3").val();
                var abcMess_Check = document.getElementById("mess_other3");
                //alert("設訊是否勾選:" + abcMess_Check.checked.toString());
                //alert("設訊勾選項目代號:" + abcMess.toString());
                //alert("設訊[選項代號]" + abcMess3);
                //設訊是否勾選
                var mess_other3_Check = document.getElementById("mess_other3");
                if ($('#fax').is(":checked")) {
                    //alert("傳真稿[設-網路傳真]:勾選!!!")
                }
                checkBox = document.getElementById('#mess_other3');
                //if (checkBox.checked) {
                //    // Respond to the result
                //    alert("NEW傳真稿[設-網路傳真]:勾選!!!")
                //}
                alert("傳真稿[設-網路傳真](勾選)" + fax2);
                checkBox = document.getElementById('fax');//mess_other3
                if ($('#fax').is(":checked")) {
                    alert("傳真稿[設-網路傳真]:勾選!!!")
                }
                var fax_item2 = $("#abcfax_item").val();//傳真稿[設-網路傳真](選項)
                alert("傳真稿[設-網路傳真](選項)" + fax_item2);
                var fax_new = function (fax, fax_item) {
                    if (fax = "1")//'設-自取' |/目前沒用到(畫面沒有這個項目)
                    {
                        if (fax_item = "1") {
                            fax = "1";
                        }
                        else if (fax_item != "1") {

                        }
                    }
                    else if (fax = "2")//設-網路傳真
                    {
                        if (fax_item = "2") {
                            fax = "2";
                        }
                        else if (fax_item != "2") {
                            fax = "2," + fax_item;
                        }
                    }
                    else if (fax = "3")//不設
                    {
                        fax = "3";
                    }
                    return fax;
                };
                //fax_item2:傳真稿[設-網路傳真](選項)
                //var faxNew = fax_new(fax2,  );
                // alert("NEW:" + faxNew);
                var mess_other6_ = "";//設訊

                if ($(mess_other3).prop("checked") == true) {
                    //alert("設訊:設勾選!!");
                }
                if ($(mess_other3).prop("checked") == true) {
                    //alert("設訊:設勾選!!");
                }
                if ($(mess_other4).prop("checked") == true) {
                    //alert("設訊:不設勾選!!");
                }
                if ($(mess_other5).prop("checked") == true) {
                    //alert("業務自帶勾選!!");//3
                    mess_other6_ = mess_other6_ + "3";
                }
                if ($(mess_other6).prop("checked") == true) {
                    //alert("特助或行政帶勾選!!");//4
                    if (mess_other6_ == "") {
                        mess_other6_ = mess_other6_ + "4";
                    }
                    else {
                        mess_other6_ = mess_other6_ + ",4";
                    }
                }
                //alert("勾選產生:" + mess_other6);
                var mess_other5_value = $("#mess_other5").val();
                var mess_other6_value = $("#mess_other6").val();
                //var fax2 = fax_new(fax)
                //訊息拼組語法
                /**
                 Mess = rep_txt(request("Mess"))
                 Mess_Item = rep_txt(request("Mess_Item"))
                 Mess_other = rep_txt(request("Mess_other"))
                 */
                //mess_Item
                //mess_other:業務自帶or特助或行政帶
                /**
                <select name="mess_item"   class=btn>
                        <option value="1" selected>一般</option>
                        <option value="5">解盤</option>
                        <option value="6">特別</option>
                        <option value="7">飆股</option>
                        <option value="10">專案</option>
                        </select>&nbsp;&nbsp;&nbsp;&nbsp;
                             */
                //mess_other:業務自帶/特助或行政帶
                //mess:設/不設
                //mess_Item:下拉式選單項目
                //mess_other: 業務自帶/特助或行政帶
                //mess_other用mess_other6帶入
                //var mess_new = function (mess, mess_Item, mess_other) {

                //    //var New_mess_other;
                //    if (mess.toString() == "true")//設
                //    {
                //        if (mess_Item = "1" && mess_other == "") {
                //            mess = "1";
                //        }
                //        else if (mess_other = "5" && mess_other == "") {
                //            //   elseif mess_Item = "5" and mess_other = "" then
                //            mess = "1, 5";
                //        }
                //        else if (mess_Item = "6" && mess_other == "") {
                //            mess = "1, 6";
                //        }
                //        else if (mess_Item = "7" && mess_other == "") {
                //            mess = "1, 7";
                //        }
                //        else if (mess_Item != "1" && mess_other == "") {
                //            mess = "1," + mess_other + "," + mess_Item;
                //        }
                //        else if (mess_Item = "1" && mess_other == "") {
                //            mess = "1," + mess_other;

                //        }
                //    }
                //    else if (mess = "0002")//不設
                //    {
                //        if (mess_other.trim() == "") {
                //            mess = "2";
                //        }
                //        else if (mess != "") {
                //            mess = "2," + mess_other;
                //        }
                //    };//訊息拼接語法
                //    return mess;
                //};
                ////傳真稿(不設)[選項]
                var mess_other2 = $("#mess_other2").val();////傳真稿(不設)[選項]
                ////傳真稿(不設)[選項]
                if ($("#mess_other2").prop("checked")) {
                    alert("e")
                    alert("傳真稿不設:" + mess_other2);
                }
                //設訊[Mess]
                var Mess = $("#mess_other1").val();//設訊([設]:下拉選單)
                var mess_other3 = $("#mess_other3").val();//業務自帶
                var mess_other4 = $("#mess_other4").val();//特助或行政帶
                var INV_ITEM_UnifyNum = $("#abcINV_ITEM_UnifyNum").val();//統編
                var Select_Com = val_M("#Select_Com_Sign");//所選的公司
                var Select_Dept = val_M("#Select_Dept_Sign");//所選的部門
                var Select_Employ = val_M("#Select_Employ_Sign");//所選的人員姓名Select_Employ_Sign
                //alert('按下新增業務聯絡單按鈕123123!');
                //設鎖碼影音[Media]
                var Media = $("#abcMedia").val();//設鎖碼影音
                //設付費文章[P_Text]
                var P_text = $("#P_text").val();//設付費文章
                //設付費影片[P_video]
                var P_video = $("#P_video").val();//設付費影片
                //ATM後五碼
                var ATM = $("#abcATM").val();//ATM後五碼
                var CCard_4Num = $("#abcCCard_4Num").val();//信用卡末四碼
                //發票資料
                var INV_Open_Item = $("#abcINV_Open_Item").val();//發票開立方式
                var T_Ivo = $("#abcT_Ivo").val();//寄發狀況
                var INV_ITEM = $("#abcINV_ITEM").val();//發票種類
                var CarrierNumm = $("#abcCarrierNum").val();//載具編號
                var COMNAME = $("#abcCOMNAME").val();//公司抬頭
                var INV_ITEM_UnifyNum = $("#abcINV_ITEM_UnifyNum").val();//公司統編
                //簽核主管
                var U_Leader = $("#Select_Com_Sign").val();//簽核主管公司別
                var U_LeaderCom = $("#Select_Dept_Sign").val();//簽核主管部門別
                var U_LeaderName = $("#Select_Employ_Sign").val();//簽核主管姓名
                var Obj = $("#abcObj").val();//件別
                var PS = $("#abcPS").val();//備註


                ////////////////////////////////////////////////////
                //業績分類(業績歸屬類)
                var Select_Com_attach = val_M("#Select_Com_Attach");//所選的人員公司
                //alert(Select_Com_attach);
                var Select_Dept_Attach = val_M("#Select_Dept_Attach");//所選的人員部門
                //alert(Select_Dept_Attach);
                var Select_User_Attach = val_M("#Select_User_Attach");//所選的人員姓名
                //alert(Select_User_Attach);
                var abcCmonth2 = $("#abcCmonth2").val();//業績種類(當月or次月)
                alert("業績種類(當月or次月)" + abcCmonth2);
                var abcOther2 = $("#abcOther2").val();//業績種類(其他)
                alert("業績種類(其他)" + abcOther2);
                ////////////////////////////////////////////////////
                ////折讓
                //var data1 = $("#data1").val();//原案件折讓案件(案件編號)
                //var data2 = $("#data2").val();//原案件折讓案件(會員種類)
                //var abcD_MP = $("#abcD_MP").val(); //新案件(分析師)
                //var abcD_Item = $("#abcD_Item").val(); //新案件(分析師)
                //訂金件
                var abcV_ID = $("#abcV_IDandName").val();//選擇會場(編號)
                var abcV_Name = $("#abcV_IDandName").val();//選擇會場(名稱)
                var abcVD_paymoney = $("#abcVD_paymoney").val();//訂金金額
                var abcVD_Type = $("#abcVD_Type").val();//付款方式
                //退費
                var data3 = $("#data3").val();//退費案件(案件編號)
                var data4 = $("#data4").val();//退費案件(案件名稱)
                var abcB_Paymoney = $("#abcB_Paymoney").val();//退費金額
                //abcB_Paymoney
                //暫停/恢復
                var P_StartStop = $("#P_StartStop").val();//暫停/恢復
                var abcgetCase1 = $("#abcgetCase1").val();//暫停/恢復(案件編號)
                var abcgetCase2 = $("#abcgetCase2").val();//暫停/恢復(案件名稱)
                var abcSSdate_Date = $("#abcSSdate_Date").val();//暫停/恢復日期
            }

            //var tempVal = undefined;
            //var emptyNum = 0;
            //20230412進度
            //按下新增業務聯絡單會執行的動作
            //F_Status=1(處理中)
            //alert("Status:" + CF_Item);
            switch (CF_Item) {
                //其他CF_Item0011
                case "0011":
                    goAjax = emptyCheckInput_M(".CF_Item0011");
                    if (goAjax) {
                        data = "M_ID=" + M_ID_G
                            + "&CF_Item=" + CF_Item
                            //   + "&U_Leader=" + U_Leader
                            //   + "&U_LeaderName=" + U_LeaderName
                            + "&Obj=" + Obj
                            + "&F_Status=1&PS=" + PS
                            + "&add_user=" + U_Num_M
                            + "&add_com=" + ComID_G
                            + "&add_ip=" + IP_G
                            + "&U_LeaderCom=" + U_LeaderCom
                            + "&action=addBusinessConnection";
                    }
                    break;
                //轉換老師CF_Item0010
                case "0010":
                    goAjax = emptyCheckInput_M(".CF_Item0010");
                    if (goAjax) {
                        alert('轉換老師!!!');
                        data = "M_ID=" + M_ID_G
                            + "&CF_Item=" + CF_Item
                            + "&C_tag=" + C_tag
                            + "&U_Leader=" + U_Leader
                            + "&U_LeaderName=" + U_LeaderName
                            + "&Obj=" + Obj
                            + "&F_Status=1&PS=" + PS
                            + "&add_user=" + U_Num_M
                            + "&add_com=" + ComID_G
                            + "&add_ip=" + IP_G
                            + "&U_LeaderCom=" + U_LeaderCom
                            + "&action=addBusinessConnection";
                    }

                    break;
                //暫停/恢復CF_Item0009
                case "0009":
                    goAjax = emptyCheckInput_M(".CF_Item0009");
                    if (goAjax) {
                        /* //暫停/恢復
                         var P_StartStop = $("P_StartStop").val();//暫停/恢復
                          var abcgetCase1 = $("abcgetCase1").val();//暫停/恢復(案件編號)
                          var abcgetCase2 = $("abcgetCase2").val();//暫停/恢復(案件名稱)
                         var abcSSdate_Date = $("abcSSdate_Date").val();//暫停日期
                         * 
                         * **/
                        var S_tag = val_M("#P_StartStop");//決定[暫停]or[恢復]
                        //var S_ID = val_M("#abcS_IDandName");
                        //var S_Name = attr_M("#abcS_IDandName :selected", "S_Name");
                        var abcgetCase1 = $("#abcgetCase1").val();//暫停/恢復(案件編號)
                        //alert(abcgetCase1);
                        var abcgetCase2 = $("#abcgetCase2").val();//暫停/恢復(案件名稱)
                        //alert(abcgetCase2);
                        var SSDate = val_M("#abcSSdate_Date");//暫停/恢復日期
                        //20230425要修改的地方!!!!!
                        data = "M_ID=" + M_ID_G
                            + "&CF_Item=" + CF_Item
                            + "&U_Leader=" + U_Leader
                            + "&U_LeaderName=" + U_LeaderName
                            + "&U_LeaderCom=" + U_LeaderCom
                            + "&Obj=" + Obj
                            + "&PS=" + PS
                            + "&S_tag=" + S_tag //暫停/恢復
                            + "&S_ID=" + abcgetCase1//暫停/恢復(案件編號)
                            + "&S_Name=" + abcgetCase2//暫停/恢復(案件名稱)
                            + "&SSDate=" + SSDate
                            + "&F_Status=1&PS=" + PS
                            + "&add_user=" + U_Num_M
                            + "&add_com=" + ComID_G
                            + "&add_ip=" + IP_G
                            + "&action=addBusinessConnection";
                    }

                    break;
                //退費CF_Item0008
                case "0008":
                    goAjax = emptyCheckInput_M(".CF_Item0008");
                    if (goAjax) {
                        //var B_ID = val_M("#abcB_IDandName");//退費案件編號
                        //var B_Name = attr_M("#abcB_IDandName :selected", "B_Name");//退費案件名稱
                        //var B_Paymoney = val_M("#abcB_Paymoney");//退費金額
                        //data3:退費案件編號
                        //data4:退費案件名稱
                        /*
                         *  var data3 = $("#data3").val();//退費案件(案件編號)
                          var data4 = $("#data4").val();//退費案件(案件名稱)
                         * 
                         */
                        var B_ID = $("#data3").val();//退費案件編號
                        var B_Name = $("#data4").val();//退費案件名稱
                        var abcB_Paymoney = $("#abcB_Paymoney").val();//退費金額
                        //1&PS=" + PS
                        data = "M_ID=" + M_ID_G
                            + "&CF_Item=" + CF_Item
                            + "&B_Paymoney=" + abcB_Paymoney
                            + "&B_ID=" + B_ID
                            + "&B_Name=" + B_Name
                            + "&U_Leader=" + U_Leader
                            + "&U_LeaderName=" + U_LeaderName
                            + "&U_LeaderCom=" + U_LeaderCom
                            + "& PS=" + PS
                            + "&data3=" + data3
                            + "&data4" + data4
                            + "&Obj=" + Obj
                            + "&F_Status=1&PS=" + PS
                            + "&add_user=" + U_Num_M
                            + "&add_com=" + ComID_G
                            + "&add_ip=" + IP_G
                            + "&action=addBusinessConnection";
                    }


                    break;
                //訂金件CF_Item0007 
                case "0007":
                    goAjax = false;
                    //無案件可查詢 -- 待測試
                    alert("功能尚未開放，請洽資訊人員");
                    break;
                //折讓CF_Item0006
                case "0006":
                    //alert("選擇折讓!!!!!!!!!!20230428");
                    //goAjax = CF_Item0006Check();
                    goAjax = true;
                    if (goAjax) {
                        var T_Type_ = T_Type;//入會方式(一般件)
                        var C_tag = "0";
                        //折讓
                        //var data1 = $("#data1").val();//原案件折讓案件(案件編號)
                        //var data2 = $("#data2").val();//原案件折讓案件(會員種類)
                        //var abcD_MP = $("#abcD_MP").val(); //新案件(分析師)
                        //var abcD_Item = $("#abcD_Item").val(); //新案件(分析師)
                        //var T_ID = val_M("#abcT_IDandName");
                        //var T_Name = text_M("#abcD_MP :selected") + "-" + text_M("#abcD_Item :selected");
                        var T_ID = $("#data1").val();//原案件折讓案件(案件編號)
                        var T_Name = $("#data2").val();//原案件折讓案件(會員種類)
                        var D_MP = val_M("#abcD_MP");//新案件(分析師)
                        var D_Item = val_M("#abcD_Item");// 新案件(服務項目)
                        var D_tag = val_M("#abcD_tag");//是否補件
                        var D_Paymoney = val_M("#abcD_Paymoney");//補件金額
                        //var D_tag = val_M("#abcD_Type");//補件金額(付款方式)
                        var DSdate = val_M("#abcDSdate_Date");//新會期(起始)
                        var DEdate = val_M("#abcDEdate_Date");//新會期(終止)
                        var SelectMP_ID = val_M("#abcMP_ID");
                        //var Pay_Type = $("#atdT_PType").val();
                        data = "M_ID=" + M_ID_G +
                            "&CF_Item=" + CF_Item +//聯絡單種類
                            "&Results_Item=" + Results_Item +//業績種類
                            "&T_Type=" + T_Type_ +//入會方式
                            "&T_ID=" + T_ID +//折讓案件編號
                            "&T_Name=" + T_Name +//折讓案件名稱
                            "&Paymoney=" + Paymoney +//單筆[付款金額]
                            "&PT_Item=" + PT_Item +//1:單筆,2:多筆
                            "&T_PType=" + T_PType +//付款方式
                            "&CCard_4Num=" + CCard_4Num +
                            "&begindate_Date=" + DSdate +
                            "&bcenddate_Date" + DEdate +
                            "&Media=" + Media +//設鎖碼影音
                            "&P_text=" + P_text +//設付費文章
                            "&P_video " + P_video +////設付費影片
                            "&ATM=" + ATM +//ATM(沒用到)
                            "&T_Ivo=" + T_Ivo +//寄發狀況
                            "&INV_ITEM=" + INV_ITEM +//發票種類(3:特種)
                            "&COMNAME=" + COMNAME +
                            "&INV_ITEM_UnifyNum" + INV_ITEM_UnifyNum +
                            "&Select_Com=" + Select_Com +//簽核主管-公司別
                            "&Select_Dept=" + Select_Dept +//簽核主管-部門代號
                            "&Select_Employ=" + Select_Employ +//簽核主管-員工編號
                            "&Obj=" + Obj +//件別
                            "&PS=" + PS +//備註
                            "&F_Status=1" +
                            "&CellPhone=" + CellPhone +
                            "&Mess=" + Mess +
                            "&D_tag=" + D_tag +//是否補件
                            "&D_MP=" + D_MP +////新案件(分析師)
                            "&D_Item=" + D_Item +// 新案件(服務項目)
                            "&D_Paymoney=" + D_Paymoney +//補件金額
                            "&DSdate=" + DSdate +//新會期(始)
                            "&DEdate=" + DEdate +//新會期(終)
                            "&C_tag=" + C_tag +//轉換老師(是否折讓)
                            //簽核主管
                            "&U_Leader=" + U_Leader +////簽核主管(公司代號)
                            "&U_LeaderCom =" + U_LeaderCom +////簽核主管(部門代號)
                            "&U_LeaderName =" + U_LeaderName +///簽核主管(員工代號)
                            //"&U_LeaderName" + U_LeaderName +
                            //"&U_LeaderStatus" + U_LeaderStatus +
                            //"&U_LeaderStatusTime" + U_LeaderStatusTime+
                            //"&Com_Channge=" + Com_Channge +
                            //"&Dept_Channge=" + Dept_Channge +
                            //"&Name_Channge=" + Name_Channge +
                            "&add_user=" + U_Num_M +
                            "&add_com=" + ComID_G +
                            "&add_ip=" + IP_G +
                            "&action=addBusinessConnection";
                    }

                    break;
                //更改責任助理CF_Item0005
                case "0005":
                    goAjax = emptyCheckInput_M(".CF_Item0005");
                    if (goAjax) {
                        var U_Agent = $("#abcU_Agent").val();
                        var U_Agent_Name = $("#abcU_Agent :selected").text();
                        var U_Agent_Com = $("#abcU_Agent_Com :selected").text();
                        data = "action=addBusinessConnection"
                            + "&M_ID=" + M_ID//案件編號
                            + "&CF_Item=" + CF_Item//聯絡單種類
                            + "&T_Type=" + T_Type //入會方式
                            + "&MP_ID=" + MP_ID//分析師(入會方式)
                            + "&MP_Item=" + MP_Item//會員種類
                            + "&Results_Item=" + Results_Item//業績種類
                            + "&ca_id=" + ca_id//電子委任契約書
                            + "&T_PType=" + T_PType //付款類型(可能要修改)
                            + "&Paymoney" + Paymoney //會費(單筆付款金額)
                            + "&PT_Item=" + PT_Item // 付款類型(入賬資訊)[單筆]or[多筆]
                            + "&begindate_Date=" + begindate_Date//入會日期
                            + "&bcenddate_Date=" + bcenddate_Date//到期日期
                            + "&Select_Com=" + Select_Com +//簽核主管-公司別
                            + "&Select_Dept=" + Select_Dept +//簽核主管-部門
                            + "&Select_Employ=" + Select_Employ +//簽核主管-員工編號
                            + "&Media=" + Media//設鎖碼影音
                            + "&P_text=" + P_text//設付費文章
                            + "&P_video=" + P_video//設付費影片
                            + "&ATM=" + ATM//ATM後五碼
                            + "&CCard_4Num=" + CCard_4Num//信用卡末四碼
                            + "&INV_Open_Item=" + INV_Open_Item//發票開立方式
                            + "&T_Ivo=" + T_Ivo//寄發狀況
                            + "&U_Agent=" + U_Agent //更改責任助理(員工編號)
                            + "&U_Agent_Name=" + U_Agent_Name //更改責任助理*姓名()
                            + "&U_Agent_Com=" + U_Agent_Com //更改責任助理(公司-部門\)
                            //+ "&INV_ITEM=" + INV_ITEM//發票種類
                            //+ "&CarrierNumm=" + CarrierNumm//載具編號
                            //+ "&COMNAME=" + COMNAME//公司抬頭
                            //+ "&Select_Com=" + Select_Com +//簽核主管-公司別
                            //+ "&Select_Dept=" + Select_Dept +//簽核主管-部門
                            + "&INV_ITEM_UnifyNum=" + INV_ITEM_UnifyNum
                            + "&U_Leader=" + U_Leader +//簽核主管(公司別)
                            + "&U_LeaderCom =" + U_LeaderCom++//簽核主管(部門)
                            + "&U_LeaderName =" + U_LeaderName++//簽核主管(姓名)
                            + "&Obj=" + Obj//件別
                            + "&PS=" + PS//備註
                            //+ "&CellPhone=" + CellPhone//行動電話
                            + "&mess_other=" + mess_new_1//傳真稿
                            + "&abcMess=" + abcMess //傳真稿(設)[選項]
                            + "&add_user=" + U_Num_M
                            + "&add_com=" + ComID_G
                            + "&add_ip=" + IP_G
                            + "&Mess=" + mess_new_1;//設訊
                        + "&PT_Item=" + PT_Item;//付款類型wy0
                    }

                    break;
                //業績歸屬CF_Item0004
                case "0004":
                    goAjax = emptyCheckInput_M(".CF_Item0004");
                    if (goAjax) {
                        var Attach_User = $("#Select_User_Attach").val();
                        alert("選定的人!!!:" + Attach_User);
                        var Attach_Dept = $("#Select_Dept_Attach").val();
                        var Attach_Com = $("#Select_Com_Attach").val();
                        var CMonth = $("#abcCmonth").val();//業績歸屬(當月or次月)
                        var Other = $("#abcOther").val();
                        var Obj = $("#abcObj").val();//件別
                        var PS = $("#abcPS").val();//備註
                        data = "action=addBusinessConnection"
                            + "&M_ID=" + M_ID//案件編號
                            + "&CF_Item=" + CF_Item//聯絡單種類
                            + "&Select_Com_Attach=" + Attach_Com //簽核主管-公司別
                            + "&Select_Dept_Attach=" + Attach_Dept //簽核主管-部門
                            + "&Select_Employ_Attach=" + Attach_User //簽核主管-員工編號
                            //+ "&INV_ITEM=" + INV_ITEM//發票種類
                            //+ "&CarrierNumm=" + CarrierNumm//載具編號
                            //+ "&COMNAME=" + COMNAME//公司抬頭
                            //+ "&INV_ITEM_UnifyNum=" + INV_ITEM_UnifyNum
                            + "&U_Leader=" + U_Leader //簽核主管(公司別)
                            + "&U_LeaderCom =" + U_LeaderCom//簽核主管(部門)
                            + "&U_LeaderName =" + U_LeaderName//簽核主管(姓名)
                            + "&Obj=" + Obj//件別
                            + "&PS=" + PS//備註
                            + "&Other=" + Other//其他
                            + "&Attach_User=" + Attach_User//業績分類(歸屬)[員工編號]
                            / + "&Attach_Dept=" + Attach_Dept//業績分類[員工部門]
                            + "&Attach_Com=" + Attach_Com // 業績分類(歸屬)[員工公司-部門]
                            + "&CMonth=" + CMonth //月份(當月:1,次月:2)
                            + "&add_user=" + U_Num_M
                            + "&add_com=" + ComID_G
                            + "&add_ip=" + IP_G
                            + "&PT_Item=" + PT_Item;//付款類型
                    }

                    break;
                //設傳真稿CF_Item0003      
                case "0003":
                    goAjax = emptyCheckInput_M(".CF_Item0003");
                    if (goAjax) {
                        var Fax = $("#abcfax").val();
                        if (Fax == "0002") {
                            Fax = "2";
                        } else {
                            Fax = "3";
                        }
                        var fax_item = $("#abcfax_item").val();
                        if (fax_item != "2") {
                            Fax += ",";
                            Fax += fax_item;
                        }
                        data = "action=addBusinessConnection"
                            + "&M_ID=" + M_ID//案件編號
                            + "&CF_Item=" + CF_Item//聯絡單種類
                            + "&T_Type=" + T_Type //入會方式
                            + "&MP_ID=" + MP_ID//分析師(入會方式)
                            + "&MP_Item=" + MP_Item//會員種類
                            + "&Results_Item=" + Results_Item//業績種類
                            + "&ca_id=" + ca_id//電子委任契約書
                            + "&T_PType=" + T_PType //付款類型(可能要修改)
                            + "&Paymoney" + Paymoney //會費(單筆付款金額)
                            + "&PT_Item=" + PT_Item // 付款類型(入賬資訊)[單筆]or[多筆]
                            + "&begindate_Date=" + begindate_Date//入會日期
                            + "&bcenddate_Date=" + bcenddate_Date//到期日期
                            + "&Select_Com=" + Select_Com +//簽核主管-公司別
                            + "&Select_Dept=" + Select_Dept +//簽核主管-部門
                            + "&Media=" + Media//設鎖碼影音
                            + "&P_text=" + P_text//設付費文章
                            + "&P_video=" + P_video//設付費影片
                            + "&ATM=" + ATM//ATM後五碼
                            + "&CCard_4Num=" + CCard_4Num//信用卡末四碼
                            + "&INV_Open_Item=" + INV_Open_Item//發票開立方式
                            + "&T_Ivo=" + T_Ivo//寄發狀況
                            //+ "&INV_ITEM=" + INV_ITEM//發票種類
                            //+ "&CarrierNumm=" + CarrierNumm//載具編號
                            //+ "&COMNAME=" + COMNAME//公司抬頭
                            //+ "&Select_Com=" + Select_Com +//簽核主管-公司別
                            //+ "&Select_Dept=" + Select_Dept +//簽核主管-部門
                            //+ "&Select_Employ=" + Select_Employ +//簽核主管-員工編號
                            + "&INV_ITEM_UnifyNum=" + INV_ITEM_UnifyNum
                            + "&U_Leader=" + U_Leader +//簽核主管(公司別)
                            + "&U_LeaderCom =" + U_LeaderCom++//簽核主管(部門)
                            + "&U_LeaderName =" + U_LeaderName++//簽核主管(姓名)
                            + "&Obj=" + Obj//件別
                            + "&PS=" + PS//備註
                            //+ "&CellPhone=" + CellPhone//行動電話
                            + "&mess_other=" + mess_new_1//傳真稿
                            + "&abcMess=" + abcMess //傳真稿(設)[選項]
                            + "&add_user=" + U_Num_M
                            + "&add_com=" + ComID_G
                            + "&add_ip=" + IP_G
                            + "&Mess=" + mess_new_1;//設訊
                        + "&PT_Item=" + PT_Item;//付款類型
                    }

                    break;
                //設訊CF_Item0002
                case "0002":
                    alert('設訊!!!!!!!!!!!!!!');
                    //var mess_new = function (mess, mess_Item, mess_other) {

                    //    //var New_mess_other;
                    //    if (mess.toString() == "true")//設
                    //    {
                    //        if (mess_Item = "1" && mess_other == "") {
                    //            mess = "1";
                    //        }
                    //        else if (mess_other = "5" && mess_other == "") {
                    //            //   elseif mess_Item = "5" and mess_other = "" then
                    //            mess = "1, 5";
                    //        }
                    //        else if (mess_Item = "6" && mess_other == "") {
                    //            mess = "1, 6";
                    //        }
                    //        else if (mess_Item = "7" && mess_other == "") {
                    //            mess = "1, 7";
                    //        }
                    //        else if (mess_Item != "1" && mess_other == "") {
                    //            mess = "1," + mess_other + "," + mess_Item;
                    //        }
                    //        else if (mess_Item = "1" && mess_other == "") {
                    //            mess = "1," + mess_other;

                    //        }
                    //    }
                    //    else if (mess = "0002")//不設
                    //    {
                    //        if (mess_other.trim() == "") {
                    //            mess = "2";
                    //        }
                    //        else if (mess != "") {
                    //            mess = "2," + mess_other;
                    //        }
                    //    };//訊息拼接語法
                    //    return mess;
                    //};
                    //設訊是否勾選(mess_other3)
                    var mess_other3_Check = document.getElementById("mess_other3");
                    //alert("設訊是否勾選:"+mess_other3_Check.checked);
                    var abcMess3_value = $("#abcMess3").val();//設訊(選項)設訊的選項代號
                    //alert("*設訊(選項)設訊的選項代號:" + abcMess3_value);//設訊的選項代號
                    //mess_other:業務自帶(mess_other5)/特助或行政帶(mess_other6)
                    //mess:設/不設
                    //mess_Item:下拉式選單項目
                    //mess_other: 業務自帶/特助或行政帶
                    //var mess_new = function (mess, mess_Item, mess_other)
                    //這裡可能需要再修改!!!!!
                    var mess_other5 = $("#mess_other5").val();//業務自帶
                    //alert("業務自帶:" + mess_other5);
                    var mess_other6 = $("#mess_other6").val();//特助或行政帶
                    //alert("特助或行政帶:" + mess_other6);
                    var mess_other5_Check = document.getElementById("mess_other5");
                    var mess_other6_Check = document.getElementById("mess_other6");
                    var mess_new_1 = mess_new(mess_other3_Check.checked, abcMess3_value, mess_other5.checked, mess_other6.checked);
                    alert("設訊勾選項目3:" + mess_new_1);//設訊
                    var mess_new_2 = mess_new(mess_other3_Check.checked, abcMess3_value, mess_other6);
                    var CellPhone = $("#abcCellPhone").val();//設定手機
                    goAjax = true;
                    //var CellPhone = $("#abcCellPhone").val();
                    var Mess = $("#abcMess").val();
                    if (Mess == "0002") {
                        Mess = "2";
                    } else {
                        Mess = "1";
                    }
                    var mess_others = $("input[name='mess_other']");
                    $.each(mess_others, function (i, v) {
                        var TF = $(v).prop("checked");
                        if (TF) {
                            if (Mess != $(v).val()) {
                                Mess += ",";
                                Mess += $(v).val();
                            }

                        }
                    });
                    var Mess_item = $("#abcMess_item").val();
                    if (Mess_item != "1" && Mess != "2") {
                        Mess += ",";
                        Mess += Mess_item;
                    }
                    data = "action=addBusinessConnection"
                        + "&M_ID=" + M_ID//案件編號
                        + "&CF_Item=" + CF_Item//聯絡單種類
                        + "&T_Type=" + T_Type //入會方式
                        + "&MP_ID=" + MP_ID//分析師(入會方式)
                        + "&MP_Item=" + MP_Item//會員種類
                        + "&Results_Item=" + Results_Item//業績種類
                        + "&ca_id=" + ca_id//電子委任契約書
                        + "&T_PType=" + T_PType //付款類型(可能要修改)
                        + "&Paymoney" + Paymoney //會費(單筆付款金額)
                        + "&PT_Item=" + PT_Item // 付款類型(入賬資訊)[單筆]or[多筆]
                        + "&begindate_Date=" + begindate_Date//入會日期
                        + "&bcenddate_Date=" + bcenddate_Date//到期日期
                        + "&Select_Com=" + Select_Com +//簽核主管-公司別
                        + "&Select_Dept=" + Select_Dept +//簽核主管-部門
                        + "&Media=" + Media//設鎖碼影音
                        + "&P_text=" + P_text//設付費文章
                        + "&P_video=" + P_video//設付費影片
                        + "&ATM=" + ATM//ATM後五碼
                        + "&CCard_4Num=" + CCard_4Num//信用卡末四碼
                        + "&INV_Open_Item=" + INV_Open_Item//發票開立方式
                        + "&T_Ivo=" + T_Ivo//寄發狀況
                        + "&INV_ITEM=" + INV_ITEM//發票種類
                        + "&CarrierNumm=" + CarrierNumm//載具編號
                        + "&COMNAME=" + COMNAME//公司抬頭
                        + "&Select_Com=" + Select_Com +//簽核主管-公司別
                        + "&Select_Dept=" + Select_Dept +//簽核主管-部門
                        + "&Select_Employ=" + Select_Employ +//簽核主管-員工編號
                        + "&INV_ITEM_UnifyNum=" + INV_ITEM_UnifyNum
                        + "&U_Leader=" + U_Leader +//簽核主管(公司別)
                        + "&U_LeaderCom =" + U_LeaderCom++//簽核主管(部門)
                        + "&U_LeaderName =" + U_LeaderName++//簽核主管(姓名)
                        + "&Obj=" + Obj//件別
                        + "&PS=" + PS//備註
                        + "&CellPhone=" + CellPhone//行動電話
                        // + "&mess_other=" + mess_new_1//傳真稿
                        + "&abcMess=" + abcMess //傳真稿(設)[選項]
                        + "&add_user=" + U_Num_M
                        + "&add_com=" + ComID_G
                        + "&add_ip=" + IP_G
                        + "&Mess=" + mess_new_1;//設訊
                    + "&PT_Item=" + PT_Item;//付款類型


                    break;
                //入會CF_Item0001
                case "0001":
                    alert("!!!!!!入會");
                    goAjax = CF_Item0001Check();
                    var mess = $("#mess_other3").val(); //設訊是否勾選
                    var mess_other5_Check = document.getElementById("mess_other3");//[OK]//業務自帶
                    var mess_other6_Check = document.getElementById("mess_other6");//[OK]//特助或行政帶
                    alert("設訊是(是否勾選)" + mess_other5_Check.checked);//[OK]/設訊是否勾選
                    alert("傳真稿[設-網路傳真](是否勾選)" + fax_Check.checked);//[OK]//業務自帶
                    //if ($(fax).prop("checked") == true) {
                    //    alert("*設訊的[設]選項有勾選!!" );
                    //}
                    var abcMess = $("#abcMess3").val();//設訊勾選的項目[OK]
                    alert("設訊勾選的下拉式選單項目:" + abcMess);//[OK]
                    //傳真稿是否勾選(fax)fax
                    var fax_item_Check = document.getElementById("fax");
                    alert("傳真稿是否勾選" + fax_item_Check.checked.toString());
                    var mess_Check = document.getElementById("mess_other3");
                    alert("設訊是否勾選" + mess_Check.checked.toString());
                    //&&:and
                    //||:or
                    //mess_other:業務自帶(mess_other5)/特助或行政帶(mess_other6)
                    //if (mess_Check.checked.toString() == "true") {
                    //    if (abcMess != "1") {
                    //        if (mess_other5_Check.checked.toString() == "true") {
                    //            Mess = "1," + "3," + abcMess;
                    //        }
                    //        if (mess_other6_Check.checked.toString() == "true") {
                    //            Mess = "1," + "4," + abcMess;
                    //        }
                    //    }
                    //}
                    //else {
                    //    if (mess_other5_Check.checked.toString() == "true") {
                    //        Mess = "2," + "3," + abcMess;
                    //        if (mess_other6_Check.checked.toString() == "true") {
                    //            Mess = Mess + ",4";
                    //    }
                    //    else if (mess_other6_Check.checked.toString() == "true") {
                    //        Mess = "2," + "4," + abcMess;
                    //    }
                    //    else
                    //    {
                    //        Mess = "2";
                    //    }

                    //}


                    //alert("傳真稿是否勾選:" + fax_item_Check.checked);
                    var fax_item_value = $("#fax_item").val();//傳真稿(選項)傳真稿的選項代號
                    alert("傳真稿的選項代號:" + fax_item_value);//傳真稿(選項)傳真稿的選項代號
                    //設訊是否勾選(mess_other3)
                    var mess_other3_Check = document.getElementById("mess_other3");
                    //alert("設訊是否勾選:"+mess_other3_Check.checked);
                    var abcMess3_value = $("#abcMess3").val();//設訊(選項)設訊的選項代號
                    alert("設訊(選項)的選項代號:" + abcMess3_value);

                    var fax_item_Check = document.getElementById("fax_item");//[OK]
                    var abcMess3_Check = document.getElementById("abcMess3");//[OK]
                    alert("傳真稿[設-網路傳真](是否勾選)" + fax_Check.checked.toString());//[OK]
                    alert("[設訊](是否勾選)" + mess_other3_Check.checked.toString());//[OK]

                    //alert("*設訊(選項)設訊的選項代號:" + abcMess3_value);//設訊的選項代號
                    //mess_other:業務自帶(mess_other5)/特助或行政帶(mess_other6)
                    //mess:設/不設
                    //mess_Item:下拉式選單項目
                    //mess_other: 業務自帶/特助或行政帶
                    //var mess_new = function (mess, mess_Item, mess_other)
                    //這裡可能需要再修改!!!!!
                    var mess_other5 = $("#mess_other5").val();//業務自帶
                    //alert("業務自帶:" + mess_other5);
                    //var mess_other6 = $("#mess_other6").val();//特助或行政帶
                    var mess_other5_Check = document.getElementById("mess_other5");//[OK]//業務自帶
                    alert("傳真稿[設-網路傳真](是否勾選)" + fax_Check.checked);//[OK]//業務自帶
                    var mess_new_1 = mess_new(mess_other3_Check.checked, abcMess3_value, mess_other5);
                    alert("設訊勾選項目1:" + mess_new_1);
                    //var mess_new_2 = mess_new(mess_other3_Check.checked, abcMess3_value, mess_other6);
                    var fax_item = $("#fax_item").val();//傳真稿(選項)傳真稿的選項代號
                    //fax
                    //if ($(fax).prop("checked") == true) {
                    //    alert("*傳真稿的選項有勾選:" + mess);
                    //}
                    //alert("*傳真稿(選項)傳真稿的選項代號:" + fax_item);//傳真稿的選項代號
                    //var Mess=mess_new()
                    goAjax = true;
                    if (PT_Item == "1")//單筆(付款類型)
                    {
                        alert("設訊!" + MessNEW);
                        if ($(mess_other3).prop("checked") == true) {
                            alert("設訊:設勾選!!");
                            var mess_other3_ = "0001";
                        }
                        else {
                            var mess_other3_ = "0002";
                        }
                        alert("設訊勾選項目2:" + mess_new_1);
                        data = "action=addBusinessConnection"
                            + "&M_ID=" + M_ID//案件編號
                            + "&CF_Item=" + CF_Item//聯絡單種類
                            + "&T_Type=" + T_Type //入會方式
                            + "&MP_ID=" + MP_ID//分析師(入會方式)
                            + "&MP_Item=" + MP_Item//會員種類
                            + "&Results_Item=" + Results_Item//業績種類
                            + "&ca_id=" + ca_id//電子委任契約書
                            + "&T_PType=" + T_PType //付款類型(可能要修改)
                            + "&Paymoney" + Paymoney //會費(單筆付款金額)
                            + "&PT_Item=" + PT_Item // 付款類型(入賬資訊)[單筆]or[多筆]
                            + "&begindate_Date=" + begindate_Date//入會日期
                            + "&bcenddate_Date=" + bcenddate_Date//到期日期
                            + "&Select_Com=" + Select_Com +//簽核主管-公司別
                            + "&Select_Dept=" + Select_Dept +//簽核主管-部門
                            + "&Media=" + Media//設鎖碼影音
                            + "&P_text=" + P_text//設付費文章
                            + "&P_video=" + P_video//設付費影片
                            + "&ATM=" + ATM//ATM後五碼
                            + "&CCard_4Num=" + CCard_4Num//信用卡末四碼
                            + "&INV_Open_Item=" + INV_Open_Item//發票開立方式
                            + "&T_Ivo=" + T_Ivo//寄發狀況
                            + "&INV_ITEM=" + INV_ITEM//發票種類
                            + "&CarrierNumm=" + CarrierNumm//載具編號
                            + "&COMNAME=" + COMNAME//公司抬頭
                            + "&Select_Com=" + Select_Com +//簽核主管-公司別
                            + "&Select_Dept=" + Select_Dept +//簽核主管-部門
                            + "&Select_Employ=" + Select_Employ +//簽核主管-員工編號
                            + "&INV_ITEM_UnifyNum=" + INV_ITEM_UnifyNum
                            + "&U_Leader=" + U_Leader +//簽核主管(公司別)
                            + "&U_LeaderCom =" + U_LeaderCom++//簽核主管(部門)
                            + "&U_LeaderName =" + U_LeaderName++//簽核主管(姓名)
                            + "&Obj=" + Obj//件別
                            + "&PS=" + PS//備註
                            + "&CellPhone=" + CellPhone//行動電話
                            + "&Fax=" + Fax //傳真稿(設)[選項]
                            + "&add_user=" + U_Num_M
                            + "&add_com=" + ComID_G
                            + "&add_ip=" + IP_G
                            + "&Mess=" + MessNEW;//設訊
                            + "&PT_Item=" + PT_Item;//付款類型
                    }
                    else//多筆(付款類型)
                    {
                        data = "action=addBusinessConnection"
                            + "&M_ID=" + M_ID
                            + "&CF_Item=" + CF_Item //聯絡單種類
                            + "&T_Type=" + T_Type //入會方式
                            + "&MP_ID=" + MP_ID ////分析師(入會方式)
                            + "&MP_Item=" + MP_Item  //會員種類(入會方式)
                            + "&Results_Item=" + Results_Item//業績種類
                            + "&ca_id=" + ca_id//電子委任契約書
                            + "&PT_Item=" + PT_Item//付款類型
                            + "&Paymoney1" + abcPaymoney1 //會費(付款金額1)
                            + "&PT_Item1=" + abcT_PType1 //會費(付款方式1)
                            + "&Paymoney2=" + abcPaymoney2//會費(付款金額2)
                            + "&PT_Item2=" + abcT_PType2//會費(付款方式2)
                            + "&CCard_4Num=" + CCard_4Num //信用卡末四碼
                            + "&begindate_Date=" + begindate_Date//入會日期
                            + "&bcenddate_Date=" + bcenddate_Date//到期日期
                            + "&Select_Com=" + Select_Com +//簽核主管-公司別
                            + "&Select_Dept=" + Select_Dept +//簽核主管-部門
                            + "&Select_Employ=" + Select_Employ +//簽核主管-員工編號
                            + "&Media=" + Media  //設鎖碼影音
                            + "&P_text=" + P_text ////設付費文章
                            + "&P_video=" + P_video ////設付費影片
                            + "&ATM=" + ATM  ////ATM後五碼
                            + "&INV_Open_Item=" + INV_Open_Item ////發票開立方式
                            + "&INV_ITEM=" + INV_ITEM ////發票種類
                            + "&COMNAME=" + COMNAME ////公司抬頭
                            + "&INV_ITEM_UnifyNum=" + INV_ITEM_UnifyNum ////公司統編
                            + "&T_Ivo=" + T_Ivo ////寄發狀況
                            + "&Select_Com=" + Select_Com//%--簽核主管--%>公司
                            + "&Select_Dept=" + Select_Dept//%--簽核主管--%>部門
                            + "&Select_Employ=" + Select_Employ//%--簽核主管--%>姓名
                            + "&Obj=" + Obj//件別
                            + "&PS=" + PS//備註
                            + "&CellPhone=" + CellPhone//行動電話
                            + "&mess_other" + mess_other//傳真稿
                            + "&abcMess" + abcMess //傳真稿(設)[選項]
                            + "&Mess=" + Mess;//設訊
                    }

                    break;
            };

            alert(data);
            var Para = data;

            //data = "M_ID=" + M_ID_G + "&CF_Item=" + CF_Item + "&Fax=" + Fax + "&MP_ID=" + MP_ID + "&MP_Item=" + MP_Item + "&Results_Item=" + Results_Item + "&Paymoney=" + Paymoney + "&Paymoney1=" + Paymoney1 + "&Paymoney2=" + Paymoney2 + "&T_PType=" + T_PType + "&T_PType1=" + T_PType1 + "&T_PType2=" + T_PType2 + "&T_Type=" + T_Type + "&PT_Item=" + PT_Item + "&V_ID=" + V_ID + "&V_Name=" + V_Name + "&Special1_user=" + Special1_user + "&Special1_userName=" + Special1_userName + "&Special1_usercom=" + Special1_usercom + "&Special2_user=" + Special2_user + "&Special2_userName=" + Special2_userName + "&Special2_usercom=" + Special2_usercom + "&Special3_user=" + Special3_user + "&Special3_userName=" + Special3_userName + "&Special3_usercom=" + Special3_usercom + "&T_accountmoney1=" + T_accountmoney1 + "&T_accountmoney2=" + T_accountmoney2 + "&T_accountmoney3=" + T_accountmoney3 + "&begindate_Date=" + begindate_Date + "&enddate_Date=" + enddate_Date + "&Media=" + Media + "&CellPhone=" + CellPhone + "&Mess=" + Mess + "&ATM=" + ATM + "&T_Ivo=" + T_Ivo + "&INV_ITEM=" + INV_ITEM + "&INV_Open_Item=" + INV_Open_Item + "&COMNAME=" + COMNAME + "&INV_ITEM_UnifyNum=" + INV_ITEM_UnifyNum + "&CCard_4Num=" + CCard_4Num + "&ca_id=" + ca_id + "&U_Leader=" + U_Leader + "&U_LeaderName=" + U_LeaderName + "&Obj=" + Obj + "&F_Status=1&PS=" + PS + "&add_user=" + U_Num_M + "&add_com=" + ComID_G + "&add_ip=" + IP_G + "&U_LeaderCom=" + U_LeaderCom + "&action=addBusinessConnection";

            var success = function (back) {
                alert("資料新增 " + back)
                location.reload();
            };
            var error = function (e) { Log_M("addBusinessConnection error=" + e); unBlockUI_M(); };
            ajax_M(CustomerManageHandlerUrl_G, Para, success, error);//<=======================20230421

        };








        //if (goAjax) {
        //    Log_M(data);
        //    ajax_M(CustomerManageHandlerUrl_G, data, success, error);//<=======================
        //}
        //};

        var AnalystForCashFlowChangeFuc = function () {
            var analyst = $("#AnalystForCashFlow").val();
            var data = "analyst=" + analyst + "&action=getAnalystItem";
            var success = function (back) {

                var json = jsonParse_M(back);
                var sb = new string_M.StringBuilder();
                // sb.append("<option value=''>請選擇</option>");
                $.each(json, function (i, v) {
                    sb.append("<option value='");
                    sb.append(v.ditcode);
                    sb.append("'>");
                    sb.append(v.ddesc);
                    sb.append("</option>");
                });
                $("#AnalystItemForCashFlow").append(sb.toString());
            };
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<=======================
        };

        var pickCaid = function () {
            //alert('pickCaid!!!');
            var ca_id = $(this).attr("ca_id");
            val_M("#abcca_id", ca_id);
            $('#appointDataDialog').dialog("close");
        };

        var getAnalystForCashFlow = function () {
            var data = "ComID=" + ComID_G + "&action=getAnalystForCashFlow";
            var success = function (back) {
                var json = jsonParse_M(back);
                var sb = new string_M.StringBuilder();
                sb.append("<option value=''>請選擇</option>");
                $.each(json, function (i, v) {
                    sb.append("<option value='");
                    sb.append(v.U_Num);
                    sb.append("'>");
                    sb.append(v.empName);
                    sb.append("</option>");
                });
                $("#AnalystForCashFlow").append(sb.toString());
                $("#AnalystForCashFlow").on("change", AnalystForCashFlowChangeFuc);
            };
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<=======================
        };

        var SendAddcfasDataFuc = function () {

            var Pay_Serail = $CommonTool.Number.getRandomStr(5);
            var MC = U_Num_M;
            var MC_name = U_Name_G;
            var mc_com = ComID_G;
            var T_id = $("#cfasT_id :selected").val();
            var mp_item = $("#cfasmp_item :selected").val();
            var P_Name = $("#cfasT_id :selected").text() + "-" + $("#cfasmp_item :selected").text();
            var Price = $("#cfasPrice").val();
            var C_name = M_Name_G;
            var C_Tel = $("#MTel").text();
            var C_Email = $("#EMail").text();
            var VerifyNo = $CommonTool.Date.getNowDateTimeStr().toString();
            var SExpenses = EmptyEqualZero_M($("#cfasSExpenses").val());
            var TExpenses = EmptyEqualZero_M($("#cfasTExpenses").val());
            var CExpenses = EmptyEqualZero_M($("#cfasCExpenses").val());
            var OExpenses = EmptyEqualZero_M($("#cfasOExpenses").val());
            var SalesName = U_Name_G;
            var HeadsSign = U_LeaderName_G;
            var adminSign = U_Name_G;
            var PS = $("#cfasPS").val();
            var T_Sdate = $("#cfasT_Sdate").val();
            var T_Edate = $("#cfasT_Edate").val();
            var EffectiveDate = $CommonTool.Date.getSqlDateTimeStr();
            var Pay_Tag = $("#cfasPay_Tag").val();
            var add_user = U_Num_M;
            var add_com = ComID_G;
            if (dataCheckTF_M("cfasDataCheckTF")) {
                if (isEndDateBigThanStartDate_M(T_Sdate, T_Edate)) {
                    var data = "action=SendAddcfasDataFuc" + "&M_id=" + M_ID_G + "&MC=" + U_Num_M + "&MC_name=" + U_Name_G + "&mc_com=" + ComID_G + "&Pay_Serial=" + Pay_Serail + "&P_Name=" + P_Name + "&Price=" + Price + "&VerifyNo=" + VerifyNo + "&SExpenses=" + SExpenses + "&TExpenses=" + TExpenses + "&CExpenses=" + CExpenses + "&OExpenses=" + OExpenses + "&T_id=" + T_id + "&mp_item=" + mp_item + "&C_name=" + C_name + "&C_Email=" + C_Email + "&C_Tel=" + C_Tel + "&T_Sdate=" + T_Sdate + "&T_Edate=" + T_Edate + "&EffectiveDate=" + EffectiveDate + "&SalesName=" + SalesName + "&HeadsSign=" + HeadsSign + "&adminSign=" + adminSign + "&PS=" + PS + "&Pay_Tag=" + Pay_Tag + "&add_user=" + add_user + "&add_com=" + add_com;
                    var success = function (back) {
                        if (back == "成功") {
                            location.href = "/wealthManage/administrativeCheck/ERPcustomerWebPay/MCMCASH/ERPcustomerWebPay.aspx?MENU_no=" + ERPcustomerWebPayMENU_no_G + "&customerDetailMENU_no=" + MENU_no_G;
                        }
                    };
                    ajax_M(CustomerManageHandlerUrl_G, data, success);//<======================= 
                }
            }
        };

        //選擇委任資料
        var getAppointData = function () {
            var data = "M_ID=" + M_ID_G + "&action=getAppointData";
            var success = function (back) {
                var json = jsonParse_M(back);
                var sb = new string_M.StringBuilder();
                empty_M("#appointDataTb");
                $.each(json, function (i, v) {
                    alert(i.toString());
                    sb.append("<tr><td class='textAlignCenter'><a href='javascript:void(0)' class='pickCaid' ca_id='");
                    sb.append(v.ca_id);
                    sb.append("'>");
                    sb.append(v.Pay_Serial);
                    sb.append("</td><td class='textAlignCenter'>");
                    sb.append(v.C_name);
                    sb.append("</td><td class='textAlignCenter'>");
                    sb.append(v.P_Name);
                    sb.append("</td><td class='textAlignCenter'>");
                    sb.append(v.Price);
                    sb.append("</td><td class='textAlignCenter'>");
                    sb.append(v.T_Sdate);
                    sb.append(" - ");
                    sb.append(v.T_Edate);
                    sb.append("</td></tr>");
                });
                $("#appointDataTb").append(sb.toString());

                unBind_M(".pickCaid");
                onClick_M(".pickCaid", pickCaid);
                $('#appointDataDialog').dialog("open");
            };
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<=======================
        };
        function colorChanger(el) {
            alert('!!');
            el.style.backgroundColor = '#007d00';
        }
        //選擇暫停/恢復資料
        //20230417要修改的地方
        var getCaseData = function () {
            alert('選擇暫停/恢復資料');
            var data = "M_ID=" + M_ID_G + "&action=getCaseData";
            var success = function (back) {
                var json = jsonParse_M(back);
                var sbnew2 = new string_M.StringBuilder();
                empty_M("#appointDataTb2");
                $.each(json, function (i, v) {
                    sbnew2 = new string_M.StringBuilder();

                    var test5 = "click_TEST5(" + v.T_ID + ",\"" + v.MembershipType + "\");";
                    //sb.append("<tr><td class='textAlignCenter'><a href='javascript:void(0)' class='pickCaid' ca_id='");
                    //sb.append(v.ca_id);
                    //sb.append("'>");
                    //sbnew.append("<tr><td class='textAlignCenter'  onclick='click();'");
                    sbnew2.append("<tr>");
                    sbnew2.append("<td class='textAlignCenter'>");
                    sbnew2.append(v.T_StartDate);//入會日期
                    sbnew2.append("</td><td class='textAlignCenter'  onclick='click('9');'>");
                    sbnew2.append(v.T_EndDate);//到期日期
                    sbnew2.append("</td><td class='textAlignCenter'  onclick='" + test5 + "'>");
                    sbnew2.append(v.T_ID);//案件編號
                    // sb.append("</td><td class='textAlignCenter' onclick='click();'>");
                    sbnew2.append("</td><td class='textAlignCenter'   onclick='" + test5 + "'>");
                    sbnew2.append(v.MembershipType);//會員種類
                    //sb.append("</td><td class='textAlignCenter'>");
                    //sbnew2.append("</td><td class='textAlignCenter'  onclick='click();'><a href='#' class='deleteTradeRecordDetail delPer ' thisId='");
                    sbnew2.append("</td><td class='textAlignCenter'  onclick='" + test5 + "'>");
                    sbnew2.append(v.T_PayMoney);//入會金額
                    sbnew2.append("</td></tr>");
                    $("#appointDataTb2").append(sbnew2.toString());
                });
                //alert('append!!');
                //$("#appointDataTb2").append(sbnew2.toString());

                unBind_M(".pickCaid");
                onClick_M(".pickCaid", pickCaid);
                $('#appointDataDialog2').dialog("open");//顯示暫停恢復資料
            };
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<=======================
        };

        var getRefundData = function () {
            alert('選擇退費案件資料');
            var data = "M_ID=" + M_ID_G + "&action=getRefundData";
            var success = function (back) {
                var json = jsonParse_M(back);
                var sbnew2 = new string_M.StringBuilder();
                empty_M("#appointDataT4");
                $.each(json, function (i, v) {
                    sbnew2 = new string_M.StringBuilder();

                    var test5 = "click_TEST6(" + v.T_ID + ",\"" + v.MembershipType + "\");";
                    //sb.append("<tr><td class='textAlignCenter'><a href='javascript:void(0)' class='pickCaid' ca_id='");
                    //sb.append(v.ca_id);
                    //sb.append("'>");
                    //sbnew.append("<tr><td class='textAlignCenter'  onclick='click();'");
                    sbnew2.append("<tr>");
                    sbnew2.append("<td class='textAlignCenter'>");
                    sbnew2.append(v.T_StartDate);//入會日期
                    sbnew2.append("</td><td class='textAlignCenter'  onclick='click('9');'>");
                    sbnew2.append(v.T_EndDate);//到期日期
                    sbnew2.append("</td><td class='textAlignCenter'  onclick='" + test5 + "'>");
                    sbnew2.append(v.T_ID);//案件編號
                    // sb.append("</td><td class='textAlignCenter' onclick='click();'>");
                    sbnew2.append("</td><td class='textAlignCenter'   onclick='" + test5 + "'>");
                    sbnew2.append(v.MembershipType);//會員種類
                    //sb.append("</td><td class='textAlignCenter'>");
                    //sbnew2.append("</td><td class='textAlignCenter'  onclick='click();'><a href='#' class='deleteTradeRecordDetail delPer ' thisId='");
                    sbnew2.append("</td><td class='textAlignCenter'  onclick='" + test5 + "'>");
                    sbnew2.append(v.T_PayMoney);//入會金額
                    sbnew2.append("</td></tr>");
                    $("#appointDataT4").append(sbnew2.toString());
                });
                //alert('append!!');
                //$("#appointDataTb2").append(sbnew2.toString());

                unBind_M(".pickCaid");
                onClick_M(".pickCaid", pickCaid);
                $('#appointDataDialog4').dialog("open");//顯示退費資料
            };
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<=======================
        };
        var click_TEST = function () {
            //alert('click_TEST')
        };
        var click_TEST = function (ABC) {
            alert(ABC);
            //alert('click_TEST');
            val_M("#data1", ABC);
        };
        var click_TEST2 = function (ABC) {
            alert(ABC);
            //alert('click_TEST');
            val_M("#data2", ABC);
        };
        var click_TEST3 = function (ABC, DEF) {
            alert(ABC);
            alert(DEF);
            //alert('click_TEST');
            val_M("#data2", DEF);
            val_M("#data1", ABC)
        };
        var click_TEST4 = function (ABC, DEF) {
            alert(ABC);
            alert(DEF);
            //alert('click_TEST');
            val_M("#abcgetCase1", DEF);
            val_M("#abcgetCase2", ABC)
        };
        //0417
        var click_TEST5 = function (ABC, DEF) {
            alert("編號" + ABC);
            alert("名稱" + DEF);
            //alert('click_TEST');
            val_M("#abcgetCase1", ABC);//編號
            val_M("#abcgetCase2", DEF)//名稱
        };
        var click_TEST6 = function (ABC, DEF) {
            alert("編號" + ABC);
            alert("名稱" + DEF);
            //alert('click_TEST');
            val_M("#data3", ABC);//編號
            val_M("#data4", DEF)//名稱
        };

        //var ABC = "12345";//要傳入的值(20230331!!!)=>20230406進度!!!!!!!!!!

        //click_TEST:傳值到空格的函式
        var getOriDiscountData = function () {
            alert('選擇折讓案件!!');
            var data = "M_ID=" + M_ID_G + "&action=getOriDiscountData";
            //var test = "click_TEST(456)";
            /* var ABCDEFGFIJKLM = "123456";*/
            var success = function (back) {
                var json = jsonParse_M(back);
                var sb = new string_M.StringBuilder();
                empty_M("#appointDataTb");
                $.each(json, function (i, v) {
                    //click_TEST2
                    var ABCDEFGFIJKLM = "'123!@ABCDEDD'".trim();
                    var test = "click_TEST(" + v.T_ID + ");";//案件編號
                    var test2 = "click_TEST2(\"" + v.MembershipType + "\");";//會員種類
                    var test3 = "click_TEST3(" + v.T_ID + ",\"" + v.MembershipType + "\");";
                    //會員種類
                    //"click_TEST(" + v.T_ID + ");";//案件編號
                    // v.MembershipType
                    //var test2 = "click_TEST("+"'abcde'"+");";//會員種類
                    sb.append("<tr><td class='textAlignCenter'>");
                    sb.append(v.T_StartDate);//入會日期
                    sb.append("</td><td class='textAlignCenter' >");
                    sb.append(v.T_EndDate);//到期日期
                    //sb.append("</td><td class='textAlignCenter' >");
                    sb.append("</td><td class='textAlignCenter' onclick='" + test3 + "'>");
                    sb.append(v.T_ID);//案件編號
                    //sb.append("</td><td class='textAlignCenter' >");
                    /* sb.append("</td><td class='textAlignCenter' onclick='" + test2 + "'>");*/
                    sb.append("</td><td class='textAlignCenter' onclick='" + test3 + "'>");
                    sb.append(v.MembershipType);//會員種類
                    //sb.append("</td><td class='textAlignCenter' >");
                    sb.append("</td><td class='textAlignCenter' onclick='click_TEST();'>");
                    sb.append(v.T_PayMoney);//入會金額
                    sb.append("</td></tr>");
                });
                $("#appointDataT3").append(sb.toString());

                unBind_M(".pickCaid");
                onClick_M(".pickCaid", pickCaid);
                //$('#appointDataDialog3').dialog("open");//顯示選擇折讓案件資料
                var theDialog = $("#appointDataDialog3").dialog(open);
                theDialog.dialog("open");
            };
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<=======================
        };
        //選擇折讓案件(新案件)
        var getNewDiscountData = function () {
            var data = "M_ID=" + M_ID_G + "&action=getNewDiscountData";
            var success = function (back) {
                var json = jsonParse_M(back);
                var sb = new string_M.StringBuilder();
                empty_M("#appointDataTb");
                $.each(json, function (i, v) {
                    sb.append("<tr onclick='click();'><td class='textAlignCenter'>");
                    sb.append(v.T_StartDate);//入會日期
                    sb.append("</td><td class='textAlignCenter'>");
                    sb.append(v.T_EndDate);//到期日期
                    sb.append("</td><td class='textAlignCenter'>");
                    sb.append(v.T_ID);//案件編號
                    sb.append("</td><td class='textAlignCenter'>");
                    sb.append(v.MembershipType);//會員種類
                    sb.append("</td><td class='textAlignCenter'>");
                    sb.append(v.T_PayMoney);//入會金額
                    sb.append("</td></tr>");
                });
                $("#appointDataTb").append(sb.toString());

                unBind_M(".pickCaid");
                onClick_M(".pickCaid", pickCaid);
                $('#appointDataDialog').dialog("open");//顯示選擇折讓案件資料
            };
            ajax_M(CustomerManageHandlerUrl_G, data, success);//<=======================
        };
        var upload = function upload(id, fileNum) {
            var formData = new FormData();
            var totalFiles = document.getElementById(id).files.length;
            for (var i = 0; i < totalFiles; i++) {
                var file = document.getElementById(id).files[i];
                formData.append("id", id);
                formData.append("File_num", fileNum);
                formData.append("File_Folder", "MTRAT");
                formData.append("add_User", U_Num_M);
                formData.append("add_ip", IP_G);
                formData.append(id, file);
            }
            $.ajax({
                type: 'post',
                url: '../../../uploadfile/uploadFileHandler.ashx',
                data: formData,
                dataType: 'json',
                contentType: false,
                processData: false,
                success: function (response) {

                },
                error: function (error) {

                }
            });
        }
        var uploadFile = function () {
            var file1 = document.getElementById("File1").files;
            var file2 = document.getElementById("File2").files;
            if (file1.length != 0) {
                upload("File1", T_id_G);
            }
            file2 = document.getElementById("File2").files;
            if (file2.length != 0) {
                upload("File2", T_id_G);
            }
            openDiv("#normalEditTradeDetailDiv", T_id_G, "normalEdit");
            clearFileInput("File1");
            clearFileInput("File2");
            $("#uploadFileDialog").dialog("close");
        };
        var reseSendEditData = function () {
            if (dataCheckTF_M("reseeditDataCheckTF")) {
                var T_ID = val_M("#reseT_ID");

                var HistoryT_PS = $("#reseHistoryT_PS").html();
                var T_PS = $("#reseT_PS").val();
                if (isEmptyStr(T_PS)) {
                    T_PS = HistoryT_PS
                } else {
                    T_PS = $("#reseT_PS").val() + " (" + U_Name_G + "-" + getNowDateTimeStr() + ")" + "<br>" + HistoryT_PS;
                }
                var T_RestDate = $("#reseT_RestDate").val();
                var T_EndDate = $("#reseNewT_EndDate").val();
                var edit_user = U_Num_M;
                var edit_ip = IP_G;

                var data = "T_ID=" + T_ID + "&T_RestDate=" + T_RestDate + "&T_EndDate=" + T_EndDate + "&T_PS=" + T_PS + "&T_Status=1&edit_user=" + edit_user + "&edit_ip=" + edit_ip + "&action=reseSendEditData";
                var success = function (back) {
                    alert("執行" + back);
                    location.reload();
                };
                var error = function (e) {
                    alert("修改資料失敗");
                    Log_M("seSendEditData error")
                };
                ajax_M(CustomerManageHandlerUrl_G, data, success, error);//<==========================
            }
        };

        var seSendEditData = function () {
            if (dataCheckTF_M("seeditDataCheckTF")) {
                var T_ID = val_M("#seT_ID");
                var T_PauseDate = datePickDateTOsqlDate(val_M("#seT_PauseDate"));
                var HistoryT_PS = $("#seHistoryT_PS").html();
                var T_PS = $("#seT_PS").val();
                if (isEmptyStr(T_PS)) {
                    T_PS = HistoryT_PS
                } else {
                    T_PS = $("#seT_PS").val() + " (" + U_Name_G + "-" + getNowDateTimeStr() + ")" + "<br>" + HistoryT_PS;
                }
                var edit_user = U_Num_M;
                var edit_ip = IP_G;

                var data = "T_ID=" + T_ID + "&T_PauseDate=" + T_PauseDate + "&T_PS=" + T_PS + "&T_Status=2&edit_user=" + edit_user + "&edit_ip=" + edit_ip + "&action=seSendEditData";
                var success = function (back) {
                    alert("執行" + back);
                    location.reload();
                };
                var error = function (e) {
                    alert("修改資料失敗");
                    Log_M("seSendEditData error")
                };
                ajax_M(CustomerManageHandlerUrl_G, data, success, error);//<==========================
            }
        };
        var reSendEditData = function () {
            var T_Type = $("#reT_Type").val();
            if (reeditDataCheckTF(T_Type)) {
                var MP = $("#reMP_Name :selected").val();
                var MP_Name = $("#reMP_Name :selected").text();
                var MP_COM = $("#reMP_Name :selected").attr("comid");
                var T_Item = $("#reT_Item").val();

                var T_AccountDate = datePickDateTOsqlDate(val_M("#reT_AccountDate"));
                var MC = $("#reMC :selected").val();
                var MC_Name = (($("#reMC :selected").text()).split("-"))[0];
                var MC_COM = $("#reMC :selected").attr("comid");
                var T_AccountMoney1 = $("#reT_AccountMoney1").val();
                var MC2 = $("#reMC2 :selected").val();
                var MC_Name2 = (($("#reMC2 :selected").text()).split("-"))[0];
                var MC_COM2 = $("#reMC2 :selected").attr("comid");
                var T_AccountMoney2 = $("#reT_AccountMoney2").val();
                var V_ID = $("#reV_ID").val();
                var V_Name = $("#reV_ID :selected").text();
                var T_PayType = $("#reT_PayType").val();
                var T_PayMoney = $("#reT_PayMoney").val();
                var T_PType = $("#reT_PType").val();
                var T_StartDate = datePickDateTOsqlDate(val_M("#reT_StartDate"));
                var T_EndDate = datePickDateTOsqlDate(val_M("#reT_EndDate"));
                var T_Message = $("#reT_Message").val();
                var T_Fax = $("#reT_Fax").val();
                var OP_INV = $("#reOP_INV").val();
                var INV_Createdate = datePickDateTOsqlDate(val_M("#reINV_Createdate"));
                var INV_Item = $("#reINV_Item").val();
                var INV_COM = $("#reINV_COM :selected").text();
                var Inv_Num = $("#reInv_Num").val();
                var INV_SendState = $("#reINV_SendState").val();
                var T_PS = $("#reT_PS").val();
                var Invoice_UnifyNum = $("#reInvoice_UnifyNum").val();
                var Invoice_ComName = $("#reInvoice_ComName").val();
                var add_user = U_Num_M;
                var add_ip = IP_G;
                var T_ID = $CommonTool.Date.getNowDateTimeStr();;
                var data = "T_ID=" + T_ID + "&M_ID=" + M_ID_G + "&MP=" + MP + "&MP_Name=" + MP_Name + "&MP_COM=" + MP_COM + "&T_Item=" + T_Item + "&T_Type=" + T_Type + "&T_AccountDate=" + T_AccountDate + "&MC=" + MC + "&MC_Name=" + MC_Name + "&MC_COM=" + MC_COM + "&T_AccountMoney1=" + T_AccountMoney1 + "&MC2=" + MC2 + "&MC_Name2=" + MC_Name2 + "&MC_COM2=" + MC_COM2 + "&T_AccountMoney2=" + T_AccountMoney2 + "&V_ID=" + V_ID + "&T_PayType=" + T_PayType + "&T_PayMoney=" + T_PayMoney + "&T_PType=" + T_PType + "&T_StartDate=" + T_StartDate + "&T_EndDate=" + T_EndDate + "&T_Message=" + T_Message + "&T_Fax=" + T_Fax + "&OP_INV=" + OP_INV + "&INV_Createdate=" + INV_Createdate + "&INV_Item=" + INV_Item + "&INV_COM=" + INV_COM + "&Inv_Num=" + Inv_Num + "&INV_SendState=" + INV_SendState + "&T_PS=" + T_PS + "&add_user=" + add_user + "&add_ip=" + add_ip + "&U_MDEP=" + U_MDEP_G + "&U_POSITION=" + U_POSITION_G + "&Invoice_UnifyNum=" + Invoice_UnifyNum + "&Invoice_ComName=" + Invoice_ComName + "&action=reSendEditData";

                var success = function (back) {
                    alert("執行" + back);
                    location.reload();
                };
                var error = function (e) {
                    alert("修改資料失敗");
                    Log_M("reSendEditData error")
                };

                ajax_M(CustomerManageHandlerUrl_G, data, success, error);//<==========================
            }

        };

        var cddAddDataCheck = function () {
            var backTF = true;
            backTF = emptyCheckInput_M(".cdd");
            return backTF;

        };

        var cddAddData = function () {
            if (cddAddDataCheck()) {
                var M_id = M_ID_G;
                var CDD_date = datePickDateTOsqlDate_M(val_M("#CDD_date"));
                var CDD_Note = val_M("#CDD_Note");
                var OP01 = val_M("#OP01");
                var OP02 = val_M("#OP02");
                var OP03 = val_M("#OP03");
                var OP04 = val_M("#OP04");
                var CDD_Status = undefined;
                if (OP01 == "A" || OP02 == "A" || OP03 == "A" || OP04 == "A") {
                    CDD_Status = "A";
                } else if (OP01 == "B" || OP02 == "B" || OP03 == "B" || OP04 == "B") {
                    CDD_Status = "B";
                } else if (OP01 == "C" && OP02 == "C" && OP03 == "C" && OP04 == "C") {
                    CDD_Status = "C";
                }

                var MC = U_Num_M;
                var data = "action=cddAddData" + "&M_id=" + M_id + "&CDD_date=" + CDD_date + "&CDD_Note=" + CDD_Note + "&OP01=" + OP01 + "&OP02=" + OP02 + "&OP03=" + OP03 + "&OP04=" + OP04 + "&CDD_Status=" + CDD_Status + "&MC=" + MC;

                var success = function (back) {
                    alert("執行" + back);
                    location.reload();
                };
                var error = function (e) {
                    alert("修改資料失敗");
                    Log_M("cddAddData error")
                };

                ajax_M(CustomerManageHandlerUrl_G, data, success, error);//<==========================
            }
        };

        var startPage2 = function () {
            //取得分析師列表HtmlTagOption列表
            //var afterSuccessFuc = function () {
            //    $(".getAnalystListFuc").on("change", function () {
            //        var type = $(this).val();
            //        var itemId = $(this).attr("itemId");
            //        $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, itemId, type, "option");
            //    });
            //};
            //$Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, ".getAnalystListFuc", "", afterSuccessFuc);
            //$Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, ".getAnalystListFuc", emptyValue_M, "option", afterSuccessFuc);
            //$Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "#AnalystCheckBoxDiv", MC_Com_G, "checkbox");
            $Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "#abcMP_ID", ComID_G, "option", afterSuccessFuc);
            $(".T_Type").on("change", accountTypeShowHide);
            //取得商品列表HtmlTagOption列表
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getProductListFuc", "PRODT");
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getProductListFuc", "PRODT", "option");
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#ProductCheckBoxDiv", "PRODT", "checkbox");
            //取得電話來源HtmlTagOption列表
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getNCONTListFuc", "NCONT", "option");
            //取得電話來源HtmlTagOption列表
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getProgrmListFuc", "MPGOM");
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getProgrmListFuc", "MPGOM", "option");
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#ProgramCheckboxDiv", "MPGOM", "checkbox");
            //取得投資金額HtmlTagOption列表
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getInvestMoneyListFuc", "INVMY", "option");
            //取得付款方式option

            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getPayTypeListHtmlTagOption", "PITEM", "option");
            //abcD_Type
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#abcD_Type", "PITEM", "option");
            //取得歸檔狀態option
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#eBack_Status", "BKSTS", "option");
            //取得業務員工option
            //var afterSuccessFuc = function () {
            //    $(".getMClistHtmlTagOption").on("change", function () {
            //        var id = $(this).attr("id");
            //    });
            //};
            var afterSuccessFuc2 = function () {
                val_M("#atdT_Type", "0001");
            };
            $Common.MUSER.getMClistHtmlTagOption(CommonHandlerUrl_M, U_Num_M, ".getMClistHtmlTagOption", afterSuccessFuc);
            //取得入會方式option
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".T_Type", "TITEM", "option", afterSuccessFuc2);
            //控制只能輸入數字之功能系結
            $CommonTool.Number.onlyNumber(".onlyNumber");
            //取得電話區碼
            $CommonTool.Tel.getZoneCodeHtmlTagOption(".getZoneCode");
            //製作業務員selectTag
            makeMClistHtmlTagSelect("#ecMCdata");
            //頁面下方交易紀錄、通話紀錄、vip資料、活動訊息的頁面切換
            //$(".tabChange").on("click", tabChange);
            //發票種類改變時切換公司抬頭和公司統編的隱藏
            INV_ItemSelectChange();
            //日期選擇器
            $(".datepicker").datepicker();
            //按下新增資料(新增業務聯絡單)
            //addBusinessConnection(新增業務聯絡單函式)
            $("#abcSendAddData").on("click", addBusinessConnection);
            $(".comMdepChangeFuc_Transfer3").on("change", comMdepChangeFuc_Transfer3);
            $(".comMdepChangeFuc_Transfer2").on("change", comMdepChangeFuc_Transfer2);
            $(".comMdepChangeFuc_Transfer1").on("change", comMdepChangeFuc_Transfer1);
            $(".comMdepChangeFuc_Sign").on("change", comMdepChangeFuc);
            $(".comMdepChangeFuc").on("change", comMdepChangeFuc);
            $(".comMdepChangeFuc2").on("change", comMdepChangeFuc2);
            $(".comMdepChangeFuc3").on("change", comMdepChangeFuc3);
            $(".comMdepChangeFuc4").on("change", comMdepChangeFuc4);
            //送出新增交易紀錄資料按鈕綁定
            //sendAddTradeDetailBtnBinding();

            //送出修改交易紀錄資料按鈕綁定
            //sendNormalEditTradeDetailBtnBinding();



            //sendAddCallRecordDetailBtnBinding();

            //送出修改個人資料按鈕綁定
            //sendEditCustomerDataBtnBinding();

            //檢查手機號碼是否存在之功能系結
            //`hasMTelInputBinding();

            onClick_M(".blockUI", blockUI_M);
            //onClick_M(".openAddChargeDetailDialog", openAddChargeDetailDialog);
            onClick_M("#uploadFile", uploadFile);

            $('#uploadFileDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 800,
            });
            onClick_M("#openUploadFileDialog", function () {
                $('#uploadFileDialog').dialog("open");
            });
            $('#renewalEditTradeDetailDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 1300,
                height: 640
            });

            $('#stopEditTradeDetailDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 650,
                height: 400
            });

            $('#restoreEditTradeDetailDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 650,
                height: 400
            });
            $('#addChargeDetailDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 800,
            });
            $('#editChargeDetailDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 800,
            });
            $('#tagHistoryTabDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 800,
            });
            $('#tradeDetailTabDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 1000,
            });
            onClick_M("#openAddPayCashFlowAndAppointSignDialog", function () {
                $('#addPayCashFlowAndAppointSignDialog').dialog("open");
            });

            $('#addPayCashFlowAndAppointSignDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 480,
                height: 605
            });
            $('#addPayCashFlowAndAppointSignDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 480,
                height: 605
            });
            $('#appointDataDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 800,
                height: 405
            });
            $('#appointDataDialog2').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 800,
                height: 405
            });

            $('#appointDataDialog3').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 800,
                height: 405
            });

            $('#appointDataDialog4').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 800,
                height: 405
            });

            $('#CDDevaluationDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 800,
                height: 405
            });
            onClick_M("#addNaturePersonBtn", function () {
                $('#CDDevaluationDialog').dialog("open");
            });

            onClick_M("#acdSendAddData", acdSendAddData);
            onClick_M("#ecdSendEditData", ecdSendEditData);
            onClick_M("#getAppointData", getAppointData);
            onClick_M("#reSendEditData", reSendEditData);
            onClick_M("#seSendEditData", seSendEditData);
            onClick_M("#reseSendEditData", reseSendEditData);
            onClick_M("#cddAddData", cddAddData);
            onClick_M("#abcgetAppointData", getAppointData);//選擇委任資料
            onClick_M("#abcgetCaseData", getCaseData);//選擇暫停/恢復案件
            onClick_M("#getOriDiscountData", getOriDiscountData);//折讓案件： *原案件
            onClick_M("#getNewDiscountData", getNewDiscountData);//折讓案件： *新案件
            onClick_M("#abcgetCaseData3", getCaseData);//選擇折讓案件
            onClick_M("#getRefundData", getRefundData);//選擇退費案件

            //業績分類-歸屬


            getAnalystForCashFlow();
            onClick_M("#SendAddcfasDataFuc", SendAddcfasDataFuc);

            $(".setWebFaxFuc").on("click", setWebFaxFuc);

            //設定權限
            setPermission_M();
        };

        //pagestart
        $(function () {
            startThisPage();
            startPage2();
            checkUnum_M();
            $.blockUI();
            //查看權限
            //getUserAuthority_M(startThisPage);
        })

    </script>
</body>
</html>
