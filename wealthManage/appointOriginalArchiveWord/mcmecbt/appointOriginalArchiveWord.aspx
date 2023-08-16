<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="appointOriginalArchiveWord.aspx.cs" Inherits="wealthManage_appointOriginalArchiveWord_mcmecbt_appointOriginalArchiveWord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .pageSpan3 {
             display: inline-block; width:150px;margin-left:30px;
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
        #Back_tag,#MC_COM {
        width:80px;
        }
        #Back_tagSpan {
        width:80px;
        }
        #MC_COMSpan {
        width:80px;
        }
        #keyWord {
             width:100px;
        }
        #keyWordSpan {
             width:100px;
        }
         #getAppointOriginalArchive {
             width:50px;
        }
         #getAppointOriginalArchiveSpan {
             width:50px;
        }
         .pageSpan2 {
             margin-left:60px;
        }

        #Back_StatusSpan {
        width:250px;
        }
        #Back_Status {
        width:250px;
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
                        <h1 class="box-title"><b>ERP &gt; 行政部 &gt; 委任正本歸檔作業</b> </h1>
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
                                             <span class="inputSearch" id="MC_COMSpan">
                                                 <select id="MC_COM"  class="form-control">
                                                     <option value="">不限</option>
                                                                         <option value="HG01">營運</option>
                                                                         <option value="HG02">投資</option>
                                                                         <option value="HG03">財富</option>
                                                                         <option value="HG04">理財</option>
                                                                         <option value="HG06">網路</option>
                                                 </select>
                                            </span>
                                            <span class="inputSearch" id="Back_StatusSpan">
                                                 <select id="Back_Status"  class="form-control"></select>
                                            </span>
                                            <span class="inputSearch" id="Back_tagSpan">
                                                 <select id="Back_tag"  class="form-control">
                                                     <option value="">不限</option>
                                                     <option value="1">已歸</option>
                                                      <option value="0">未歸</option>
                                                 </select>
                                            </span>
                                            <span class="inputSearch" id="keyWordSpan">
                                               <input type="text" name="message" placeholder="查尋關鍵字..." class="form-control " id="keyWord">
                                            </span>
                                            <span class="inputSearch" id="getAppointOriginalArchiveSpan">
                                              <button type="button" class="btn btn-info btn-flat qPer marginTop-27" id="getAppointOriginalArchive">查詢</button>
                                            </span>
                                            <span class="inputSearch ">
                                              <button type="button" class="btn btn-success btn-flat qPer marginTop-27" id="archive">歸檔勾選案件</button>
                                            </span>
                                            <span class="inputSearch pageSpan3">
                                              <span class="">page</span>&nbsp; <span class="">：</span>&nbsp;<span id ="pageNum" class=""></span>
                                            </span>
                                      </div>
                                    </th>
                                </tr>
                                    <tr class="marginTop5px bgColor">
                                        <th class="textAlignCenter  leftSideWhite" style="width:6%">
                                            序
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:12%">
                                            入賬日期
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:7%">
                                            姓名
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:11%">
                                            分析師-種類
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:9%">
                                            金額
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:7%">
                                          業務-部門
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:28%">
                                          狀況
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:10%">
                                         歸檔
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:11%">
                                          <a href="javascript:void(0)" id="allCheck">全選</a>/<a href="javascript:void(0)" id="allCancel">清除</a>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody id="appointOriginalArchiveWordSearchTb">

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
    <script src="<%=getRelativePath()%>js/pageList/appointOriginalArchiveWorkPageList.js" type="text/javascript"></script> 
    
    <script>
        var appointOriginalArchiveWordHandlerUrl_G = "appointOriginalArchiveWordHandler.ashx";
        var MENU_no_G = "<%=getMENU_no()%>";
        var CustomerDetailMENU_no_G = "<%=getCustomerDetailMENU_no()%>";
 
        var getAppointOriginalArchive = function () {
            var Back_Status = val_M("#Back_Status") == "0" ? "" : val_M("#Back_Status");
            var data = "action=getAppointOriginalArchive" + "&keyWord=" + val_M("#keyWord") + "&StartDate=" + val_M("#StartDate") + "&EndDate=" + val_M("#EndDate") + "&MC_COM=" + val_M("#MC_COM") + "&Back_Status=" + Back_Status + "&Back_tag=" + val_M("#Back_tag");
            Log_M("getAppointOriginalArchive data=" + data);
            var success = function (back) {
               
               var json = jsonParse_M(back);
               
               $appointOriginalArchiveWorkPageList.Table.makeTbody("#appointOriginalArchiveWordSearchTb", json, 10, "#pageBar");
            };
            var error = function (e) { Log_M("getAppointOriginalArchive error=" + e); unBlockUI_M(); };
            ajax_M(appointOriginalArchiveWordHandlerUrl_G, data, success, error);
        };

        var allCheck = function () {
            $("input[name='archive']").prop("checked", true);
        };

        var allCancel = function () {
            $("input[name='archive']").prop("checked", false);
        };

        var archive = function () {
            var checkeds = $("input[name='archive']:checked");
            var tids = "";
            var Back_Statuss = "";
            var Back_tags = "";
            var tempTid = "";
            $.each(checkeds, function (i, v) {
                if (i != 0) {
                    tids += ",";
                    Back_Statuss += ",";
                    Back_tags += ",";
                }
                tempTid = attr_M(v, "T_ID");
                tids += tempTid;
                Back_Statuss += val_M("#E_Back_Status" + tempTid);
            });
            var data = "action=archive" + "&tids=" + tids + "&Back_Statuss=" + Back_Statuss;
            Log_M("data=" + data);
            var success = function (back) {
              
                Log_M("archive back=" + back);
                if (back == "成功") {
                    getAppointOriginalArchive();
                    alert("歸檔成功");
                }
               
            };
            var error = function (e) { Log_M("archive error=" + e); unBlockUI_M(); };
            ajax_M(appointOriginalArchiveWordHandlerUrl_G, data, success, error);

        };

        var startThisPage = function () {
            val_M("#StartDate", getTodayDatepickerStr_M());
            val_M("#EndDate", getTodayDatepickerStr_M());
           
            onClick_M("#allCheck", allCheck);
            onClick_M("#allCancel", allCancel);
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#Back_Status", "BKSTS", "option");
            onClick_M("#archive", archive);
            onClick_M("#getAppointOriginalArchive", getAppointOriginalArchive)
            getAppointOriginalArchive();
            //設定權限
            setPermission_M();
        };
      
        $(function () {
            //查看使用者權限
            getUserAuthority_M(startThisPage);
        })
    </script>
</asp:Content>

