<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MCMEB09_youtubelist.aspx.cs" Inherits="wealthManage_report_MREPO_MCMEB09_MCMEB09_youtubelist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
       
        .auto-style1 {
            width: 30%;
            height: 25px;
        }
        .auto-style2 {
            width: 50%;
            height: 25px;
        }
        .auto-style3 {
            width: 20%;
            height: 25px;
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="content-wrapper" style="min-height: 668px;">
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
                            <h1 class="box-title"><b>Youtube - 總點閱</b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title="">
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <!-- <table class="table table-bordered table-condensed"> -->

                            <div style="text-align: center">
                            </div>
                            <%--新增客戶資料--%>
                            <div id="addCustomerDataDiv" class="divBorder startHide">
                                <div id="addCustomerDataTitle" class="marginLeftRight10 titleBottomBorder">
                                    <h2><span>新增客戶資料</span>
                                        <div id="closeAddCustomerDataDiv" class="btn" style="margin-right: 0 auto; float: right;">
                                            <button id="closeAddCustomerDataBtn" type="button" class="btn btn-flat closeSecondaryWindow closeBtn">X</button>
                                        </div>
                                    </h2>
                                </div>
                                <form id="addCustomerDataFm" class="marginTop10">
                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-2 inputDiv">
                                            <label for="M_Name"><span class="colorRed">*</span>姓名：</label>
                                            <input class="form-control addCustomerDataRequired addCustomerDataInput" requireditem="姓名" id="M_Name" type="text">
                                        </div>

                                        <div class="col-xs-2 inputDiv">
                                            <label for="M_Sax">性別：</label>
                                            <select id="M_Sax" class="form-control addCustomerDataInput">
                                                <option value="M">先生</option>
                                                <option value="F">小姐</option>
                                            </select>
                                        </div>

                                        <div class="col-xs-2 inputDiv">
                                            <label for="M_SD">身分證字號：</label><br />
                                            <input class="form-control checkIdFuc addCustomerDataInput" id="M_SD" type="text">
                                        </div>
                                        <div class="col-xs-2 inputDiv">
                                            <label for="BirthDay_Date">出生年月日：</label><br />
                                            <input class="form-control datepicker addCustomerDataInput" id="BirthDay_Date">
                                        </div>
                                        <div class="col-xs-2 inputDiv">
                                            <label for="EMail">電子信箱：</label><br />
                                            <input class="form-control checkEmailFuc addCustomerDataInput" id="EMail" type="email">
                                        </div>

                                        <div class="col-xs-2 inputDiv">
                                            <label for="M_Grade"><span class="colorRed">*</span>等級：</label><br />
                                            <select id="M_Grade" class="form-control addCustomerDataRequired addCustomerDataInput" requireditem="等級">
                                                <option value="">請選擇</option>
                                                <option value="A">A</option>
                                                <option value="B">B</option>
                                                <option value="C">C</option>
                                                <option value="D">D</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-2 inputDiv">
                                            <label for="HTel">住家電話1：</label>
                                            <select id="HTel_Zone" class="form-control getZoneCode addCustomerDataInput put02"></select>
                                            <input class="form-control onlyNumber addCustomerDataInput contact" id="HTel" type="text" placeholder="電話號碼">
                                        </div>
                                        <div class="col-xs-2 inputDiv">
                                            <label for="HTel1">住家電話2：</label>
                                            <select id="HTel_Zone1" class="form-control getZoneCode addCustomerDataInput put02"></select>
                                            <input class="form-control onlyNumber addCustomerDataInput contact" id="HTel1" type="text" placeholder="電話號碼">
                                        </div>
                                        <div class="col-xs-2 inputDiv">
                                            <label for="OTel">公司電話1：</label>
                                            <select id="OTel_Zone" class="form-control getZoneCode addCustomerDataInput put02"></select>
                                            <input class="form-control onlyNumber addCustomerDataInput contact" id="OTel" type="text" placeholder="電話號碼">
                                            <input class="form-control onlyNumber addCustomerDataInput" id="OTel_Sub" type="text" placeholder="分機">
                                        </div>
                                        <div class="col-xs-2 inputDiv">
                                            <label for="OTel1">公司電話2：</label>
                                            <select id="OTel_Zone1" class="form-control getZoneCode addCustomerDataInput put02"></select>
                                            <input class="form-control onlyNumber addCustomerDataInput contact" id="OTel1" type="text" placeholder="電話號碼">
                                            <input class="form-control onlyNumber addCustomerDataInput" id="OTel_Sub1" type="text" placeholder="分機">
                                        </div>
                                        <div class="col-xs-2 inputDiv">
                                            <label for="Fax">傳真1：</label>
                                            <select id="Fax_Zone" class="form-control getZoneCode addCustomerDataInput put02">
                                                <option value="">請選擇區碼</option>
                                            </select>
                                            <input class="form-control onlyNumber addCustomerDataInput" id="Fax" type="text" placeholder="電話號碼">
                                        </div>
                                        <div class="col-xs-2 inputDiv">
                                            <label for="Fax1">傳真2：</label>
                                            <select id="Fax_Zone1" class="form-control getZoneCode addCustomerDataInput put02">
                                                <option value="">請選擇區碼</option>
                                            </select>
                                            <input class="form-control onlyNumber addCustomerDataInput" id="Fax1" type="text" placeholder="電話號碼">
                                        </div>
                                    </div>
                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-3 inputDiv">
                                            <label for="MTel1">手機：</label>
                                            <input class="form-control onlyNumber addCustomerDataInput contact checkMobile" id="MTel1" type="text" placeholder="手機號碼1 ">
                                            <input class="form-control onlyNumber addCustomerDataInput contact checkMobile" id="MTel2" type="text" placeholder="手機號碼2 ">
                                            <input class="form-control onlyNumber addCustomerDataInput contact checkMobile" id="MTel3" type="text" placeholder="手機號碼3 ">
                                        </div>
                                        <div class="col-xs-3 inputDiv">
                                            <label for="H_Address">住家地址:</label>
                                            <select id="HCity" class="getCityListFuc form-control city addCustomerDataInput" towntype="HTown">
                                                <option value="">請選擇城市</option>
                                            </select>
                                            <select id="HTown" class="town form-control addCustomerDataInput">
                                                <option value="">請選擇區鄉鎮</option>
                                            </select>
                                            <!-- <input type="text" id="HZipCode" class="form-control"/>-->
                                            <input type="text" id="H_Address" class="form-control addCustomerDataInput" placeholder="地址" />
                                        </div>
                                        <div class="col-xs-3 inputDiv">
                                            <label for="H_Address">公司地址:</label>
                                            <select id="OCity" class="getCityListFuc form-control city addCustomerDataInput" towntype="OTown">
                                                <option value="">請選擇城市</option>
                                            </select>
                                            <select id="OTown" class="town form-control addCustomerDataInput">
                                                <option value="">請選擇區鄉鎮</option>
                                            </select>
                                            <!-- <input type="text" id="OZipCode" class="form-control" />-->
                                            <input type="text" id="O_Address" class="form-control addCustomerDataInput" placeholder="地址" />
                                        </div>
                                        <%--20220721要修改的地方--%>
                                        <div class="col-xs-3">
                                            <label for="Inv_Money">投資金額：</label>
                                            <select id="Inv_Money" class="getInvestMoneyListFuc form-control addCustomerDataInput ">
                                                <option value="0">一般</option>
                                                <option value="1">訂金件</option>
                                            </select>

                                        </div>
                                    </div>
                                    <div class="form-group row marginLeftRight10">
                                        <!--<div class="col-xs-4">
                                        <label for="Analyst"><span class="colorRed">*</span>詢問老師：</label>
                                        <select id="Analyst" class="form-control getAnalystListFuc addCustomerDataRequired addCustomerDataInput" requiredItem="詢問之分析師"><option value="">請選擇分析師</option></select>
                                    </div>-->
                                        <div class="col-xs-12" id="AnalystCheckBoxDiv">
                                            <label for="Analyst"><span class="colorRed">*</span>詢問老師：</label>

                                            <input id="Analyst" type="hidden" class="form-control addCustomerDataRequired addCustomerDataInput" requireditem="詢問之分析師" />
                                        </div>
                                    </div>
                                    <div class="form-group row marginLeftRight10">
                                        <!--<div class="col-xs-4" >
                                        <label for="Product" class=""><span class="colorRed">*</span>詢問商品：</label>
                                        <select id="Product" class="form-control getProductListFuc addCustomerDataRequired addCustomerDataInput" requiredItem="詢問之商品"><option value="">請選擇商品</option></select>
                                    </div>-->
                                        <div class="col-xs-12" id="ProductCheckBoxDiv">
                                            <label for="Product" class=""><span class="colorRed">*</span>詢問商品：</label>

                                            <input id="Product" type="hidden" class="form-control addCustomerDataRequired addCustomerDataInput" requireditem="詢問之商品" />
                                        </div>

                                    </div>
                                    <div class="form-group row marginLeftRight10">
                                        <!--<div class="col-xs-5">
                                        <label for="Program" class="marginTop10"><span class="colorRed">*</span>電話來源：</label>
                                    <select id="Program" class="form-control getProgrmListFuc addCustomerDataRequired addCustomerDataInput" requiredItem="電話來源"><option value="">請選擇電話來源</option></select>
                                    </div>-->
                                        <div class="col-xs-12" id="ProgramCheckboxDiv">
                                            <label for="Program" class=""><span class="colorRed">*</span>電話來源：</label>

                                            <input id="Program" type="hidden" class="form-control addCustomerDataRequired addCustomerDataInput" requireditem="詢問之電話來源" />
                                        </div>
                                    </div>
                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-5 inputDiv">
                                            <label for="M_Note">備註:</label>
                                            <textarea id="M_Note" class="form-control addCustomerDataInput"></textarea>
                                        </div>
                                        <div class="col-xs-5">
                                            <label for="MC" class="">業務人員:</label>
                                            <select id="MCdata" class="form-control addCustomerDataInput"></select>
                                        </div>
                                        <div class="col-xs-2">
                                            <div>
                                                <button class="btn form-control marginTop30" id="addCustomerDataBtn" style="background-color: #f4f4f4;" onclick="return false;">送出資料</button>
                                            </div>
                                        </div>


                                    </div>
                                </form>

                            </div>

                            <table class="table table detail startHide" id="todayContactTab">
                                <tbody>
                                    <tr class="detailHead">
                                        <th style="width: 5%; text-align: center"></th>
                                        <th style="width: 20%; text-align: center">時間</th>
                                        <th style="width: 18%; text-align: center">客戶姓名</th>
                                        <th style="width: 35%; text-align: center">聯絡內容</th>
                                        <th style="width: 20%; text-align: center">建檔人員</th>
                                        <th style="width: 2%; text-align: right">
                                            <div class="btn-group" data-toggle="btn-toggle" style="margin-right: 0 auto;">
                                                <button type="button" class="btn btn-default btn-flat closeSecondaryWindow">X</button>
                                            </div>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td colspan="6" style="text-align: center"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <div id="customerAdvSearchDiv" class="divBorder startHide">
                                <div id="customerAdvSearchTitle" class="marginLeftRight10 titleBottomBorder">
                                    <h2>客戶資料進階查詢
                                    <div class="btn-group" data-toggle="btn-toggle" style="margin-right: 0 auto; float: right;">
                                        <button id="" type="button" class="btn closeBtn btn-flat closeSecondaryWindow">X</button>
                                    </div>
                                    </h2>
                                </div>

                                <form id="customerAdvSearchFm" class="marginTop10 ">
                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-2">
                                            <label for="Q_Name">客戶名稱：</label>
                                            <input class="form-control " id="Q_Name" type="text">
                                        </div>
                                        <div class="col-xs-2">
                                            <label for="Q_Tel">電話：</label>
                                            <input class="form-control " id="Q_Tel" type="text">
                                        </div>

                                        <div class="col-xs-2">
                                            <label for="Q_Product">產品：</label>
                                            <select id="Q_Product" class="form-control getProductListFuc">
                                                <option value="">不限</option>
                                            </select>
                                        </div>
                                        <div class="col-xs-2">
                                            <label for="Q_Grade">等級：</label>
                                            <select id="Q_Grade" class="form-control ">
                                                <option value="">不限</option>
                                                <option value="A">A</option>
                                                <option value="B">B</option>
                                                <option value="C">C</option>
                                                <option value="D">D</option>
                                            </select>
                                        </div>

                                        <div class="col-xs-2">
                                            <label for="adver_item">建檔時間：</label><br />
                                            <input type="text" id="StartDate" class="datepicker form-control " placeholder="開始日">
                                        </div>
                                        <div class="col-xs-2">
                                            <label for="adver_item">建檔時間：</label><br />
                                            <input type="text" id="EndDate" class="datepicker form-control " placeholder="結束日">
                                        </div>
                                    </div>
                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-3">
                                            <label for="Q_Analyst">分析師：</label>
                                            <select id="Q_Analyst" class="form-control getAnalystListFuc ">
                                                <option value="">不拘</option>
                                            </select>
                                        </div>
                                        <div class="col-xs-3">
                                            <label for="Q_InvMoney">投資金額：</label>
                                            <select id="Q_InvMoney" class="form-control  getInvestMoneyListFuc">
                                            </select>
                                        </div>
                                        <div class="col-xs-2">
                                            <label for="Q_Member">是否為會員：</label>
                                            <select id="Q_Member" class="form-control ">
                                                <option value="">不拘</option>
                                                <option value="1">會員</option>
                                                <option value="2">非會員</option>
                                            </select>
                                        </div>
                                        <div class="col-xs-2">
                                            <label for="adver_item">排序欄位：</label>
                                            <select id="adver_item" class="form-control">
                                                <option value="Create_Date">建檔日期</option>
                                                <option value="Leave_Date">承接日期</option>
                                            </select>
                                        </div>
                                        <div class="col-xs-2 marginTop25" style="text-align: center" id="startSearchDiv">

                                            <button class="btn searchCustomerDataFuc" style="background-color: #f4f4f4;" onclick="return false;">開始查詢</button>

                                        </div>
                                    </div>
                                </form>
                            </div>

                            <table class="table table-hover" id="customerDataTab">
                                <thead>
                                    <tr class="active">

                                        <th class="" colspan="6">
                                            <div class="input-group">
                                                <input type="text" name="message" placeholder="查尋關鍵字..." class="form-control" id="keyWord">

                                                <span class="input-group-btn">
                                                    <button type="button" class="btn btn-info btn-flat searchCustomerDataFuc qPer" id="searchCustomerData">查詢</button>
                                                </span>
                                                <span class="input-group-btn ">
                                                    <button type="button" class="btn btn-info btn-flat marginLeft marginRight qPer" id="openSearchAdvancedWindow">進階查詢</button>
                                                </span>
                                                <span class="input-group-btn marginLeft">
                                                    <button type="button" class="btn btn-info btn-flat qPer" id="openTodayContactWindow">今日聯絡事項</button>
                                                </span>
                                            </div>
                                        </th>

                                        <th class="" colspan="1"></th>
                                        <th class="" colspan="1"></th>
                                        <th class="" colspan="1">
                                            <div class="btn-group" data-toggle="btn-toggle">
                                                <button type="button" id="openAddCustomerDataWindow" class="btn btn-primary btn-flat addPer">新增客戶資料</button>
                                            </div>
                                        </th>
                                        <th class="" colspan="1">page&nbsp;：&nbsp;<span id="pageNum"></span></th>
                                    </tr>

                                    <tr class="bgBlue">
                                        <th class="auto-style1" style="text-align: center;">日期</th>
                                        <th class="auto-style2" style="text-align: center;">標題</th>
                                        <th class="auto-style3" style="text-align: center;">點擊數</th>
                                    </tr>
                                </thead>
                                <tbody id="medialistData">
                                </tbody>

                            </table>
                            <div style="text-align: center">
                                <div id="pageBar" style="margin: 0 auto;"></div>
                            </div>

                        </div>
                        <!--/.box-body-->

                    </div>
                    <!--/.box-->

                </div>
            </div>
            <!-- /.row (main row) -->

        </section>
        <!-- /.content -->

    </div>

    <script>
        var P_ID ="<%=P_ID %>";/*從cs端取得值(分析師編號) */
        var MR_DateY ="<%=MR_DateY %>";/*從cs端取得值 */
        var MR_DateM = "<%=MR_DateM %>";/*從cs端取得值 */
        var check_M = $CommonTool.Check;
        var htmlTag_M = $CommonTool.HtmlTag;
        var string_M = $CommonTool.String;
        //現在頁數
        var NowPage_G = 1;
        //總頁數
        var TotalPage_G = 0;
        //每頁資料筆數
        var CountPerPage_G = 30;
        var ajax_M = function (url, data, success, error) {
            $.ajax({
                url: url,
                data: data,
                method: 'POST',
                success: success,
                error: error
            });
        };
        //取得總頁數
        var getTotalPage = function (count) {
            var pageCount = count / CountPerPage_G;
            var pageCount1 = Math.floor(pageCount);
            var remainder = count % CountPerPage_G;
            if (remainder > 0) {
                pageCount1 += 1;
                pageCount = pageCount1;
            }
            return pageCount;
        };
        var MCMEB09_youtubelistHandlerUrl_G = "/wealthManage/report/MREPO/MCMEB09/reportHandleMCMEB09_youtubelist.ashx";
        var makeHtml = function () {
            //alert('!!');
            $("#medialistData").empty();
            //alert('!!!!!');
            //MCMEB09_youtubelistDataJson_G
            //MCMEB09_youtubelistDataJson_G
            if (MCMEB09_youtubelistDataJson_G.length != 0) {
                var sb = new string_M.StringBuilder();
                var n = 0;
                var startCount = (NowPage_G - 1) * 30 + 1;
                var endCount = 30 * NowPage_G;
                var isMember = false;
                $.each(MCMEB09_youtubelistDataJson_G, function (i, v) {
                    n += 1;
                    if (n >= startCount && n <= endCount) {
                        sb.append("<tr><th class='text-center'>");
                        sb.append(v.Date);//日期
                        sb.append("</th><th class='text-center'>");
                        //sb.append(v.Title);//標題
                        sb.append("<a href='https://www.hwa-guan.com.tw/Wealth/ViewPoint/VideoDetail?V_id=");
                        sb.append(v.V_id);
                        sb.append("' target=");
                        sb.append(v.V_id);
                        sb.append(">")
                        sb.append(v.Title)
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.hot_count);//點擊數
                        sb.append("</th>");
                        sb.append("</tr>");
                    }
                });
                TotalPage_G = getTotalPage(n);
                append_M("#medialistData", sb.toString());

                //$(".editData").on("click", openEditDataGiftDialog);
                //onClick_M(".deleteCustomerData", function () {
                //    var MID = $(this).attr("MID");
                //    var r = confirm("刪除後資料將無法恢復，確定刪除?");
                //    console.log(r);
                //    if (r == true) {
                //        deleteCustomerData(MID);
                //    }

                //});
                /*$(".deleteCustomerData").on("click", function () {
                    var MID = $(this).attr("MID");
                    var r = confirm("刪除後資料將無法恢復，確定刪除?");
                    console.log(r);
                    if (r == true) {
                        deleteCustomerData(MID);
                    }
 
                });
            } else {
                alert("查無資料");
                NowPage_G = 1;
                TotalPage_G = 1;
            }
            */
                //製作頁數列表
                //getPageList();

                //頁面解鎖
                unBlockUI_M();
            };
        }
        var startThisPage = function () {
            var data = "P_ID=" + P_ID + "&MR_DateY=" + MR_DateY + "&MR_DateM=" + MR_DateM + "&action=getMCMEB09_youtubelistData";
            var searchCustomerDataSuccess = function (back) {
                MCMEB09_youtubelistDataJson_G = jsonParse_M(back);
                //MCMEB09_youtubelistDataJson_G = back;
                //alert('show list2');//ERP > 財富管理部 > 客戶管理
                makeHtml();//<===
                hide_M("#customerAdvSearchDiv");

            };
            var error = function (e) { Log_M("MCMEB09_youtubelistData error=" + e); unBlockUI_M(); };
            //alert('Call CustomerManageHandlerUrl_G2');
            ajax_M(MCMEB09_youtubelistHandlerUrl_G, data, searchCustomerDataSuccess, error);//<===
        }
        //
        var getMCMEB09_youtubelistData = function () {
            //var data = "action=getMUSER_MenuSetupData" + "&keyWord=" + val_M("#keyWord") + "&PayStatus=" + val_M("#PayStatus") + "&U_MDEP=" + U_MDEP_M + "&ComID=" + ComID_M;
            var data = "action = getyoutubelistData" + "&P_ID=" + P_ID + "&MR_DateY=" + MR_DateY + "&MR_DateM_G=" + MR_DateM_G;
            var success = function (back) {
                var json = jsonParse_M(back);
                getMCMEB09_youtubelistData = jsonParse_M(back);
                //$muser_MenuSetupPageList.Table.makeTbody("#MUSER_MenuSetupData", json, 10, "#pageBar", deleteData, getMid);
                makeHtml();//依所得資料產生畫面
            };
            var error = function (e) { Log_M("MCMEB09_youtubelistData error=" + e); unBlockUI_M(); };
            ajax_M(MCMEB09_youtubelistHandlerUrl_G, data, success, error);
        };
        //20221109
        $(function () {
            //alert('Start!!');
            //alert(P_ID);
            //alert(MR_SDATE);
            //alert(MR_EDATE);
            startThisPage();
        })
    </script>
</asp:Content>

