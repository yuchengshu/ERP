<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MPMMTEL_query.aspx.cs" Inherits="wealthManage_custermerManage_MMBER_customerManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- <script src="<%=getRelativePath()%>js/common/CommonTool.js" type="text/javascript"></script>-->
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
                         <h1 class="box-title"><b>ERP &gt;  投資推廣部 &gt;電話統計作業</b> </h1>
                        <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title="">
                            
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <!-- <table class="table table-bordered table-condensed"> -->

                        <div style="text-align:center">
　                     
                        </div>
                        <div id="addCustomerDataDiv" class="divBorder startHide">
                            <div id="addCustomerDataTitle" class="marginLeftRight10 titleBottomBorder">
                                <h2 ><span >新增客戶資料</span> 
                                    <div id="closeAddCustomerDataDiv" class="btn" style="margin-right:0 auto;float: right;">
                                         <button id="closeAddCustomerDataBtn" type="button"  class="btn btn-flat closeSecondaryWindow closeBtn">X</button>
                                    </div>
                                </h2>
                            </div>
                            <form id="addCustomerDataFm"  class="marginTop10">
                                <div class="form-group row marginLeftRight10">
                                  <div class="col-xs-2 inputDiv">
                                    <label for="M_Name"><span class="colorRed">*</span>姓名：</label>
                                    <input class="form-control addCustomerDataRequired addCustomerDataInput" requiredItem="姓名" id="M_Name" type="text">
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
                                    <select id="M_Grade" class="form-control addCustomerDataRequired addCustomerDataInput" requiredItem="等級">
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
                                    <input class="form-control onlyNumber addCustomerDataInput" id="OTel_Sub" type="text"  placeholder="分機">
                                  </div>
                                  <div class="col-xs-2 inputDiv">
                                    <label for="OTel1">公司電話2：</label>
                                    <select id="OTel_Zone1" class="form-control getZoneCode addCustomerDataInput put02"></select>
                                    <input class="form-control onlyNumber addCustomerDataInput contact" id="OTel1" type="text" placeholder="電話號碼">
                                      <input class="form-control onlyNumber addCustomerDataInput" id="OTel_Sub1" type="text" placeholder="分機">
                                  </div>
                                  <div class="col-xs-2 inputDiv">
                                    <label for="Fax">傳真1：</label>
                                    <select id="Fax_Zone" class="form-control getZoneCode addCustomerDataInput put02"><option value="">請選擇區碼</option></select>
                                    <input class="form-control onlyNumber addCustomerDataInput" id="Fax" type="text" placeholder="電話號碼">
                                  </div>
                                  <div class="col-xs-2 inputDiv">
                                    <label for="Fax1">傳真2：</label>
                                    <select id="Fax_Zone1" class="form-control getZoneCode addCustomerDataInput put02"><option value="">請選擇區碼</option></select>
                                    <input class="form-control onlyNumber addCustomerDataInput" id="Fax1" type="text" placeholder="電話號碼">
                                  </div>
                                </div>
                                <div class="form-group row marginLeftRight10">
                                  <div class="col-xs-3 inputDiv">
                                    <label for="MTel1">手機：</label>
                                    <input class="form-control onlyNumber addCustomerDataInput contact checkMobile" id="MTel1" type="text" placeholder="手機號碼1 ">
                                    <input class="form-control onlyNumber addCustomerDataInput contact checkMobile" id="MTel2" type="text"  placeholder="手機號碼2 ">
                                    <input class="form-control onlyNumber addCustomerDataInput contact checkMobile" id="MTel3" type="text"  placeholder="手機號碼3 ">
                                  </div>
                                  <div class="col-xs-3 inputDiv">
                                    <label for="H_Address">住家地址:</label>
                                    <select id="HCity" class="getCityListFuc form-control city addCustomerDataInput" townType="HTown" ><option value="">請選擇城市</option></select>
                                    <select id="HTown" class="town form-control addCustomerDataInput"><option value="">請選擇區鄉鎮</option></select>
                                    <!-- <input type="text" id="HZipCode" class="form-control"/>-->
                                    <input type="text" id="H_Address" class="form-control addCustomerDataInput" placeholder="地址"/>
                                  </div>
                                  <div class="col-xs-3 inputDiv">
                                    <label for="H_Address">公司地址:</label>
                                      <select id="OCity" class="getCityListFuc form-control city addCustomerDataInput" townType="OTown"><option value="">請選擇城市</option></select>
                                      <select id="OTown" class="town form-control addCustomerDataInput"><option value="">請選擇區鄉鎮</option></select>
                                      <!-- <input type="text" id="OZipCode" class="form-control" />-->
                                    <input type="text" id="O_Address" class="form-control addCustomerDataInput" placeholder="地址"/>
                                  </div>
                                  <div class="col-xs-3">
                                    <label for="Inv_Money">投資金額：</label>
                                    <select id="Inv_Money" class="form-control addCustomerDataInput getInvestMoneyListFuc" >
                
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
                                       
                                        <input id="Analyst" type="hidden" class="form-control addCustomerDataRequired addCustomerDataInput" requiredItem="詢問之分析師" />
                                    </div>
                                </div>
                                <div class="form-group row marginLeftRight10">
                                    <!--<div class="col-xs-4" >
                                        <label for="Product" class=""><span class="colorRed">*</span>詢問商品：</label>
                                        <select id="Product" class="form-control getProductListFuc addCustomerDataRequired addCustomerDataInput" requiredItem="詢問之商品"><option value="">請選擇商品</option></select>
                                    </div>-->
                                    <div class="col-xs-12" id="ProductCheckBoxDiv">
                                        <label for="Product" class=""><span class="colorRed">*</span>詢問商品：</label>
                                       
                                        <input id="Product" type="hidden" class="form-control addCustomerDataRequired addCustomerDataInput" requiredItem="詢問之商品" />
                                    </div>
                                    
                                </div>
                                <div class="form-group row marginLeftRight10">
                                    <!--<div class="col-xs-5">
                                        <label for="Program" class="marginTop10"><span class="colorRed">*</span>電話來源：</label>
                                    <select id="Program" class="form-control getProgrmListFuc addCustomerDataRequired addCustomerDataInput" requiredItem="電話來源"><option value="">請選擇電話來源</option></select>
                                    </div>-->
                                    <div class="col-xs-12" id="ProgramCheckboxDiv">
                                        <label for="Program" class=""><span class="colorRed">*</span>電話來源：</label>
                                       
                                        <input id="Program" type="hidden" class="form-control addCustomerDataRequired addCustomerDataInput" requiredItem="詢問之電話來源" />
                                    </div>
                                </div>
                                <div class="form-group row marginLeftRight10">
                                    <div class="col-xs-5 inputDiv">
                                        <label for="M_Note">備註:</label>   
                                        <textarea id="M_Note"class="form-control addCustomerDataInput" ></textarea>
                                    </div>
                                    <div class="col-xs-5">
                                       <label for="MC" class="">業務人員:</label>
                                    <select id="MCdata" class="form-control addCustomerDataInput" ></select>
                                    </div>
                                    <div class="col-xs-2">
                                        <div>
                                            <button class="btn form-control marginTop30" id="addCustomerDataBtn" style="background-color:#f4f4f4;"  onclick="return false;" >送出資料</button>
                                        </div>
                                    </div>

                                     
                                </div>
                            </form>
                          
                        </div>
                       
                        <table class="table table detail startHide" id="todayContactTab">
                         <tbody>
                              <tr class="detailHead">
                                <th style="width:5%;text-align:center"></th>
                                <th style="width:20%;text-align:center">時間</th>
                                <th style="width:18%;text-align:center">客戶姓名</th>
                                <th style="width:35%;text-align:center">聯絡內容</th>
                                <th style="width:20%;text-align:center">建檔人員</th>
                                <th style="width:2%;text-align:right"><div class="btn-group" data-toggle="btn-toggle"  style="margin-right:0 auto;">
                                     <button  type="button" class="btn btn-default btn-flat closeSecondaryWindow">X</button>
                            </div></th>
                             </tr>
                             <tr >
                                 <td colspan="6" style="text-align:center"></td>
                             </tr>
                         </tbody>
                         </table>
                        <div id="customerAdvSearchDiv" class="divBorder startHide">
                            <div id="customerAdvSearchTitle" class="marginLeftRight10 titleBottomBorder">
                                <h2>客戶資料進階查詢
                                    <div class="btn-group" data-toggle="btn-toggle"  style="margin-right:0 auto;float: right;">
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
                                    <select id="Q_Product" class="form-control getProductListFuc"><option value="">不限</option></select>
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
                                        <select id="Q_Analyst" class="form-control getAnalystListFuc "><option value="">不拘</option></select>
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
                                  <div class="col-xs-2 marginTop25" style="text-align:center" id="startSearchDiv">
                                   
                                  <button class="btn searchCustomerDataFuc"  style="background-color:#f4f4f4;"  onclick="return false;" >開始查詢</button>
                                   
                                  </div>
                                </div>
                            </form>
                        </div>
            
                        <table class="table table-hover" id="customerDataTab" >
                            <thead>
                                <tr class="active">
                                
                                    <th class=""  colspan="6">
                                      <div class="input-group">
                                          分析師:&nbsp;<span><span class="inputSearch marginRight20"><%--<select id="MP_Item" class="form-control" ><option value="">請選擇</option></select>--%>
                                              <select id="smdM_MP" class="form-control messagePublic ssmRequired smmRequired" fieldname="分析師" name="D1">
                                                </select> </span></span>
                                        &nbsp;<span class="input-group-btn">
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
                          
                                    <th class=""  colspan="1"></th>
                                    <th class=""  colspan="1"></th>
                                    <th class=""  colspan="1">
                                        <div class="btn-group" data-toggle="btn-toggle">
                                            <button type="button" id="openAddCustomerDataWindow" class="btn btn-primary btn-flat addPer">新增客戶資料</button>
                                        </div>
                                    </th>
                                    <th class=""  colspan="1">page&nbsp;：&nbsp;<span id ="pageNum"></span></th>
                                </tr>
   
                                  <tr class ="bgBlue">
                                    <th class="" style="width: 2%;text-align:center;">項</th>
                                    <th class="" style="width: 20%;text-align:center;">日期</th>
                                    <th class="" style="width: 6%;text-align:center;">分析師</th>
                                    <th class="" style="width: 20%;text-align:center;">節目種類</th>
                                    <th class="" style="width: 30%;text-align:center;">節目名稱</th>
                                    <th class="" style="width: 17%;text-align:center;">可KEY</th>
                                    <th class="" style="width: 17%;text-align:center;">不可KEY</th>
                                    <th class="" style="width: 20%;text-align:center;" >建檔人員</th>
                                    <th class="" style="width: 2%;text-align:center;">刪</th>
                                      <th class="" style="width: 2%;text-align:center;">刪</th>
                                  </tr>
                            </thead>
                            <tbody id="MPMMTELData">
                              </tbody>

                        </table>
                        <div style="text-align:center">
　                        <div id="pageBar" style="margin:0 auto;"></div>
                        </div>
                        
                    </div><!--/.box-body-->

                </div><!--/.box-->
                
            </div>
          </div><!-- /.row (main row) -->

        </section><!-- /.content -->
        
      </div>
   
   <script>
       var MPMMTELDataHandlerUrl_G = "MPMMTELHandler.ashx";
       var MPMMTELDataJson_G = null;
       var MENU_no_G = "<%=getMENU_no()%>";
       //現在頁數
       var NowPage_G = 1;
       //總頁數
       var TotalPage_G = 0;
       //每頁資料筆數
       var CountPerPage_G = 30;

       //業務員列表
       var McList_G = undefined;
       //業務員公司別
       var McComID_G = undefined;
       //業務員部門別
       var McMdep_G = undefined;
       //業務員姓名
       var McName_G = undefined;
      //=============================================================分頁工具start
       var pageNumClick = function () {
           var thisText = $(this).text();
           var goNext = true;
           if (thisText == ">>" || thisText == "<<") {
               if (NowPage_G <= TotalPage_G && NowPage_G >= 1) {
                   if (thisText == ">>") {
                       NowPage_G += 1;
                   } else if (thisText == "<<") {
                       NowPage_G -= 1;
                   }
               } else {
                   goNext = false;
               }
           } else {
               var clickPage = parseInt(thisText);
               if (clickPage <= TotalPage_G && clickPage >= 1) {
                   NowPage_G = clickPage;
               } else {
                   goNext = false;
               }
           }
           if (goNext) {
               //alert('show list1');
               makeHtml();
           }
       };
       
       var afterSuccessFucForSmd = function () {
           onChange_M(".messagePublic", function () {
               var type = val_M("#smdM_MP");
               var sendType = val_M("#smdType");
               var htmlTag = "";
               if (sendType == "single") {
                   htmlTag = "radio";
                   disabledFalse_M("#smdM_TEL");
                   hide_M("#allCheck");
                   $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#smdM_MP", type, htmlTag);
               } else {
                   htmlTag = "checkbox";
                   disabledTrue_M("#smdM_TEL");
                   show_M("#allCheck");
                   //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#smdM_MP", type, htmlTag, getListByViewtag0, emptyValue_M, true);
               }
           });
       };
       //取得下方分頁表列
       var getPageList = function () {
           $("#pageBar").empty();
           var startPageNum = NowPage_G - 5;
           if (startPageNum <= 0) {
               startPageNum = 1;
           }
           var showPageCount = 0;

           if (TotalPage_G >= 10) {
               showPageCount = 9;
           } else {
               showPageCount = TotalPage_G - 1;
           }

           var sb = new string_M.StringBuilder();

           if (NowPage_G > 1) {
               sb.append("<span class='pageList pageNum'><a class='qPer' href='#'><<</a></span>");
           }

           for (var i = 0; i <= showPageCount ; i++) {
               sb.append("<span class='pageList pageNum'><a class='qPer'  href='javascript: void(0)'>");
               sb.append(startPageNum);
               sb.append("</a></span>");
               startPageNum += 1;
           }

           if (NowPage_G < TotalPage_G) {
               sb.append("<span class='pageList pageNum'><a class='qPer' href='#'>>></a></span>");
           }

           //$("#pageBar").append(sb.toString());
           append_M("#pageBar", sb.toString());
           empty_M("#pageNum");
           //$("#pageNum").empty();
           append_M("#pageNum", NowPage_G + "/" + TotalPage_G);
           //$("#pageNum").append(NowPage_G + "/" + TotalPage_G);
           onClick_M(".pageNum", pageNumClick);
           //$(".pageNum").on("click", pageNumClick);
       };
       //=========================================================================================分頁工具end

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

       //刪除顧客資料
       var deleteMPMMTELData = function (MID) {
           var data = "M_ID=" + MID + "&action=deleteMPMMTELData";
           var success = function (back) {
               alert("刪除資料" + back);
               searchCustomerData();

           };
           //alert('Call CustomerManageHandlerUrl_G1');
           ajax_M(MPMMTELDataHandlerUrl_G, data, success);
       };

       var makeHtml = function () {
           $("#MPMMTELData").empty();
           if (MPMMTELDataJson_G.length != 0) {
               var sb = new string_M.StringBuilder();
               var n = 0;
               var startCount = (NowPage_G - 1) * 30 + 1;
               var endCount = 30 * NowPage_G;
               var isMember = false;
               $.each(MPMMTELDataJson_G, function (i, v) {
                   n += 1;
                   if (n >= startCount && n <= endCount) {
                       sb.append("<tr><th class='text-center'>");
                       sb.append(n);//項
                       sb.append("</th><th class='text-center'>");
                       sb.append(v.MT_Date);//日期
                       sb.append("</th><th class='text-center'>");
                       sb.append(v.MT_Teacher);//分析師
                       sb.append("</th><th class='text-center'>");
                       sb.append(v.ddesc);//節目種類
                       sb.append("</th><th class='text-center'>");
                       sb.append(v.TV_Program_Name);//節目名稱
                       sb.append("</th><th class='text-center'>");
                       sb.append(v.MT_Okey);//可Key
                       sb.append("</th><th class='text-center'>");
                       sb.append(v.MT_Nkey);//不可Key
                       sb.append("</th><th class='text-center'>");
                       sb.append(v.add_UserName);//建檔人員
                       sb.append("<th class='text-center'><a href='javascript:void(0)' class='deleteData delPer' Auto_Id='");
                       sb.append("'>刪</a></th>");
                       sb.append("</th>");
                       sb.append("</tr>");
                   }
               });
               TotalPage_G = getTotalPage(n);
               append_M("#MPMMTELData", sb.toString());
              // $("#customerData").append(sb.toString());
               onClick_M(".deleteCustomerData", function () {
                   var MID = $(this).attr("MID");
                   var r = confirm("刪除後資料將無法恢復，確定刪除?");
                   console.log(r);
                   if (r == true) {
                       deleteCustomerData(MID);
                   }

               });
               /*$(".deleteCustomerData").on("click", function () {
                   var MID = $(this).attr("MID");
                   var r = confirm("刪除後資料將無法恢復，確定刪除?");
                   console.log(r);
                   if (r == true) {
                       deleteCustomerData(MID);
                   }

               });*/
           } else {
               alert("查無資料");
               NowPage_G = 1;
               TotalPage_G = 1;
           }
           //製作頁數列表
           getPageList();

           //頁面解鎖
           unBlockUI_M();
       };

       //查詢客戶資料==============================================================================start
       var searchCustomerData = function () {
           //alert('Query!');
           var Q_Analyst = val_M("#smdM_MP") == null ? emptyValue_M : val_M("#smdM_MP");//分析師員工編號
           //alert(Q_Analyst);
           //var startDate = val_M("#StartDate");
           //var endDate = val_M("#EndDate");
           //var doNext = check_M.isEndDateBigThanStartDate(startDate,endDate);
           //if (isEmptyStr(startDate) && isEmptyStr(endDate)) {
           doNext = true;
           //}
           if (doNext) {
               NowPage_G = 1;
               blockUI_M();
               empty_M("#MPMMTELData");
               //var keyWord = val_M("#keyWord");
               var Q_Analyst = val_M("#smdM_MP") == null ? emptyValue_M : val_M("#smdM_MP");//分析師員工編號
               //var Q_Product = val_M("#Q_Product") == null ? emptyValue_M : val_M("#Q_Product");
               //var data = "keyWord=" + keyWord + "&U_MDEP=" + U_MDEP_M + "&U_Num=" + U_Num_M + "&ComID=" + ComID_M + "&Q_Name=" + $("#Q_Name").val() + "&Q_Tel=" + $("#Q_Tel").val() + "&StartDate=" + startDate + "&EndDate=" + endDate + "&Q_Analyst=" + Q_Analyst + "&Q_Grade=" + $("#Q_Grade").val() + "&Q_Member=" + $("#Q_Member").val() + "&Q_Product=" + Q_Product + "&action=searchMPMMTELData";
               var data = "Q_Analyst=" + Q_Analyst+ "&action=searchMPMMTELData";

               console.log("Q_Analyst = " + Q_Analyst+ " & action=searchMPMMTELData");
               var searchCustomerDataSuccess = function (back) {
                   MPMMTELDataJson_G = jsonParse_M(back);
                   //alert('show list2');
                   makeHtml();//<===
                   hide_M("#customerAdvSearchDiv");
                   
               };
               //alert('Call CustomerManageHandlerUrl_G2');
               ajax_M(MPMMTELDataHandlerUrl_G, data, searchCustomerDataSuccess);//<===
           } else {
               alert("請正確選擇建檔日期區間");
           }
          
       }; 
       //查詢客戶資料==============================================================================end


       //開啟進階搜尋視窗========================start
       var openSearchAdvancedWindow = function () {
           show_M("#customerAdvSearchDiv");
           hide_M("#todayContactTab");
           hide_M("#addCustomerDataDiv");
        };
       //開啟進階搜尋視窗========================end


       //關閉所有次級視窗========================start
       var closeSecondaryWindow = function () {
           hide_M("#customerAdvSearchDiv");
           hide_M("#addCustomerDataDiv");
           hide_M("#todayContactTab");
           show_M("#customerDataTab");
           show_M("#pageBar");
        };
       //關閉所有次級視窗========================end

       //打開新增客戶資料視窗========================start
       var openAddCustomerDataWindow = function () {
           hide_M("#customerAdvSearchDiv");
           hide_M("#customerDataTab");
           show_M("#addCustomerDataDiv");
           hide_M("#todayContactTab");
           hide_M("#pageBar");
        };
       //打開新增客戶資料視窗========================end


       //打開今日聯絡事項視窗========================start
       var openTodayContactWindow = function () {
           hide_M("#customerAdvSearchDiv");
           hide_M("#addCustomerDataDiv");
           show_M("#todayContactTab");
        };
       //打開今日聯絡事項視窗========================end


        //取得今日聯絡事項============================================================start
        var getTodayConnectionMatterHtml = function () {
            var data = "U_Num=" + U_Num_M + "&action=getTodayConnectionMatterHtml";
            var getTodayConnectionMatterHtmlSuccess = function (back) {
                $("#getTodayConnectionMatterHtml").append(back.toString());
            };
            //alert('Call CustomerManageHandlerUrl_G3');
            ajax_M(MPMMTELDataHandlerUrl_G, data, getTodayConnectionMatterHtmlSuccess);//<===
        };
       //取得今日聯絡事項============================================================end
        
       //取得分析師ListHtmlTagOption
       var afterSuccessFuc = function () {
           onChange_M("#MP", function () {
               var type = val_M("#MP");
               $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#MP_Item", type, "option");
           });
       };


       ////確認欄位資料是否正確==========================================================start
        var checkCol = function () {
            var back = false;
            if (check_M.AllRequiredNoEmpty(".addCustomerDataRequired", "requiredItem")) {
                if (check_M.isROCIDstr(".checkIdFuc",false)) {
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
       ////確認欄位資料是否正確==========================================================end


       //製作selectTag的業務員列表===============================start
        var makeMClistHtmlTagSelect = function (idOrClassName) {
            alert('製作selectTag的業務員列表');
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
                append_M(idOrClassName, sb.toString());
                val_M(idOrClassName, U_Num_M);
            };
            //1.取得業務員資料
            $Common.MUSER.getMClist(CommonHandlerUrl_M, U_Num_M, getMClistSuccess);//<=================
        };
        //製作selectTag的業務員列表===============================end
        

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


        //檢查手機號碼是否存在之功能系結
        var hasMTel = function () {
            var MTel = val_M(this);
            var id = attr_M(this, "id");
            var data = "MTel=" + MTel + "&action=hasMTel";
            var success = function (back) {
                if (!isEmptyStr(back)) {
                    alert(back + "已存在請再次確認。");
                    val_M("#" + id, emptyValue_M);
                }
            };
            //alert('Call CustomerManageHandlerUrl_G4');
            ajax_M(MPMMTELDataHandlerUrl_G, data, success);//<===
        };

        var getCheckBoxValueStr = function (objs,idOrClassName) {
            var back = "";
            var count = 0;
            $.each(objs, function (i, v) {
                if ($(v).prop("checked") == true) {
                    if (count > 0) {
                        back += ",";
                    }
                    back += val_M(v);
                    count += 1;
                }
            });
            val_M(idOrClassName, back);
        };

       //新增客戶資料===============================================start
        var addCustomerData = function () {
            var Analysts = $('input[name="Analyst"]');
            var PRODTs = $('input[name="PRODT"]');
            var MPGOMs = $('input[name="MPGOM"]');
            getCheckBoxValueStr(Analysts,"#Analyst");
            getCheckBoxValueStr(PRODTs,"#Product");
            getCheckBoxValueStr(MPGOMs, "#Program");
            //確認欄位資料是否正確
            if (checkCol()) {
                var OTown = $("#OTown :selected").text() == "請選擇區鄉鎮" ? emptyValue_M : $("#OTown :selected").text();
                var HTown = $("#HTown :selected").text() == "請選擇區鄉鎮" ? emptyValue_M : $("#HTown :selected").text();
                var data = "M_Name=" + val_M("#M_Name") +
                            "&M_Sax=" + val_M("#M_Sax") +
                            "&M_Grade=" + val_M("#M_Grade") +
                            "&BirthDay_Date=" + val_M("#BirthDay_Date") +
                            "&MCdata=" + val_M("#MCdata") +
                            "&MC_Name=" + attr_M("#MCdata :selected","uName") +
                            "&MC_COM=" + attr_M("#MCdata :selected","comid") +
                            "&OTel_Zone=" + val_M("#OTel_Zone") +
                            "&OTel=" + val_M("#OTel") +
                            "&OTel_Sub=" + val_M("#OTel_Sub") +
                            "&OTel_Zone1=" + val_M("#OTel_Zone1") +
                            "&OTel1=" + val_M("#OTel1") +
                            "&OTel_Sub1=" + val_M("#OTel_Sub1") +
                            "&HTel_Zone=" + val_M("#HTel_Zone") +
                            "&HTel=" + val_M("#HTel") +
                            "&HTel_Zone1=" + val_M("#HTel_Zone1") +
                            "&HTel1=" + val_M("#HTel1") +
                            "&MTel1=" + val_M("#MTel1") +
                            "&MTel2=" + val_M("#MTel2") +
                            "&MTel3=" + val_M("#MTel3") +
                            "&Fax_Zone=" + val_M("#Fax_Zone")+
                            "&Fax=" + val_M("#Fax") +
                            "&Fax_Zone1=" + val_M("#Fax_Zone1") +
                            "&Fax1=" + val_M("#Fax1") +
                            "&M_SD=" + val_M("#M_SD") +
                            "&EMail=" + val_M("#EMail") +
                            "&OCity=" + val_M("#OCity") +
                            "&OTown=" + OTown +
                            "&OZipCode=" + val_M("#OTown") +
                            "&O_Address=" + val_M("#O_Address") +
                            "&HCity=" + val_M("#HCity") +
                            "&HTown=" + HTown +
                            "&HZipCode=" + val_M("#HTown") +
                            "&H_Address=" + val_M("#H_Address") +
                            "&Inv_Money=" + val_M("#Inv_Money") +
                            "&Analyst=" + val_M("#Analyst") +
                            "&Product=" + val_M("#Product") +
                            "&Program=" + val_M("#Program") +
                            "&M_Note=" + val_M("#M_Note") +
                            "&Light_Status=" + getLightStatusFromUmdep() +
                            "&add_ip=" + IP_M +
                            "&add_user=" + U_Num_M + "&action=addEditCustomerData&addEditType=add";
                var addCustomerDataSuccess = function (back) {
                    alert("新增客戶資料" + back);
                    searchCustomerData();
                    val_M(".addCustomerDataInput", emptyValue_M);
                    val_M(".put02", "02");
                    val_M("#MCdata", U_Num_M);
                    val_M("#M_Sax", "M");
                    hide_M("#addCustomerDataDiv");
                    show_M("#customerDataTab");
                };
                Log_M("addCustomerData Ajax data=" + data);
                //alert('Call CustomerManageHandlerUrl_G5');
                ajax_M(MPMMTELDataHandlerUrl_G, data, addCustomerDataSuccess);//<===
            }
        };
       //新增客戶資料===============================================end

        var getKeywordList = function () {
            
           // var keyWord = val_M("#keyWord");
            var data = "keyWord=" + keyWord + "&action=getKeywordList";
            Log_M("getKeywordList data=" + data);
            var success = function (back) {
                Log_M("getKeywordList back=" + back);
                var json = jsonParse_M(back);
                $(function () {
                    $("#keyWord").autocomplete({
                        source: function (request, response) {
                            var results = $.ui.autocomplete.filter(json, request.term);
                            response(results.slice(0, 10));
                        },       
                    });
                })
            };
            var error = function (e) { Log_M("getKeywordList error=" + e); unBlockUI_M(); };
            //alert('Call CustomerManageHandlerUrl_G6');
            ajax_M(MPMMTELDataHandlerUrl_G, data, success, error);
        };

       //進行頁面處理===============================================start
       var startThisPage = function () {
           //alert('呼叫MPMMTELHandler.ashx中特定的action');
           $Common.MUSER.getAnalystListHtmlTagOptionForAllPowerSendRecord(CommonHandlerUrl_M, "#smdM_MP", ComID_M, U_MDEP_M, U_POSITION_M, U_Leader_M, U_Num_M, afterSuccessFucForSmd);

           var CustomerManageHandlerUrl_G = "/Manage/Form/MPMMTEL/MPMMTELHandler.ashx";
           var data = "U_Num=" + U_Num_M + "&action=getMPMMTELDataList";//呼叫MPMMTELHandler.ashx中特定的action
            var success = function (back) {
                var json = jsonParse_M(back);
                MPMMTELDataJson_G = json;//取回的資料內容
                if (back != "成功") {
                    makeHtml();
                }
           };
           //查詢之功能系結
           onClick_M(".searchCustomerDataFuc", searchCustomerData);
            var error = function (e) { Log_M("deleteMailData error=" + e); unBlockUI_M(); };
           ajax_M(MPMMTELDataHandlerUrl_G, data, success, error);//<===
            //onClick_M("#searchMSFTFData", searchMSFTFData);
                
        };
        
      
        $(function () {
            //查看使用者權限
            //getUserAuthority_M(startThisPage);
        })
   </script>
</asp:Content>

