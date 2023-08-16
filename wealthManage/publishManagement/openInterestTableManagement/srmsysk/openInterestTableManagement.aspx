<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="openInterestTableManagement.aspx.cs" Inherits="wealthManage_publishManagement_openInterestTableManagement_srmsysk_openInterestTableManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .tabDivMargin3 {
          margin-left:20px;
          margin-right:20px;
          margin-top:5px;
        }
        .width10Per {
            width:7%;
        }
        .bgColor {
            background-color :  #ddd;
        }
        .pageSpan {
         font-size:12px;
        }
        
        #sendEditMessage {
            margin-right:0px;
        }
        .marginLeft10 {
            margin-left:10px;
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
                        <h1 class="box-title"><b>ERP &gt; 留倉表發佈管理</b> </h1>
                        <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title="">
                            
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        
                        <div id="callMessageSearchDiv" class="tabDivMargin5 tabChangeDiv">
        
                            <div id="callMessageSearchInerDiv" class="tabDivMargin4">
                            <table class="table">
                                <thead >
                                     <tr class="active">
                                
                                    <th class=""  colspan="12">
                                        <div class="input-group marginBottom-7">
                                            <span class="inputSearch">
                                                <input type="text" id="StartDate" class="datepicker form-control today" placeholder="開始日">
                                            </span>
                                            <span class="inputSearch  marginRight20">
                                                <input type="text" id="EndDate" class="datepicker form-control today" placeholder="結束日">
                                            </span>
                                            <span class="inputSearch" style="">
                                                <select id="MP" class="form-control MP" ></select>
                                            </span>
                                            <span class="inputSearch">
                                              <button type="button" id="getOItable" class="btn btn-info btn-flat qPer marginTop-27">查詢</button>
                                            </span>
                                             <span class="inputSearch">
                                             
                                            </span>
                               
                                            <span class="inputSearch1">
                                              <button type="button" id="openAddOItableDialog" class="btn btn-primary btn-flat addPer marginTop-27">新增留倉表</button>
                                            </span>
                                            <span class="inputSearch pageSpan">
                                              <span class="">page</span>&nbsp; <span class="">：</span>&nbsp;<span id ="pageNum" class=""></span>
                                            </span>
                                  
                                      </div>
                                    </th>

                            
                                </tr>
                                    <tr class="marginTop5px bgColor">
                                        <th class="textAlignCenter  leftSideWhite" style="width:13%">
                                            項次
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:25%">
                                            分析師
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:25%">
                                            檔案
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:25%">
                                          日期
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:12%">
                                          刪
                                        </th>
                                    </tr>
                                </thead>
                                <tbody id="OItableSearchTb">

                                </tbody>
                            </table>
                            </div>
                        </div>


                        <!--////***********-->
                        <div style="text-align:center" id="pageBarDiv" class="marginTop-130">
　                        <div id="pageBar" style="margin:0 auto;"> </div>
                        </div>

                        <div id="addOItableDialog" class="form-control startHide" title="新增留倉表">
                            <form class="">
                                <p>分析師：<select class="MP form-control" id="addOItableMP"></select></p>
                                <p>附件：<form  runat="server">
                                            <asp:FileUpload type="file" id="File1" class="form-control uploadFileCheck  upLoadGroup" ClientIDMode="Static"  runat="server"/>
                                        </form></p>
                                <div style="text-align:center" class="">
                                   <input type="button" class="btn btn-primary addPer" id="addOItable" value="新增資料" />
                                </div>
                            </form>
                        </div>
                    </div><!--/.box-body-->

                </div><!--/.box-->
                
            </div>
          </div><!-- /.row (main row) -->

        </section><!-- /.content -->
        
      </div>
     <script src="<%=getRelativePath()%>js/MasterPage.js" type="text/javascript"></script>
    <script src="<%=getRelativePath()%>js/pageList/openInterestTableManagementPageList.js" type="text/javascript"></script> 
    <script>
        var OpenInterestTableManagementHandlerUrl_G = "openInterestTableManagementHandler.ashx";
        var MENU_no_G = "<%=getMENU_no()%>";
        var deleteMSYSKdata = function (MF_ID) {
            var data = "action=deleteMSYSKdata" + "&MF_ID=" + MF_ID;
            var success = function (back) {
                Log_M("deleteMSYSKdata back" + back);
                getOItable();
            };
            var error = function (e) { Log_M("deleteMSYSKdata error=" + e); unBlockUI_M(); };
            ajax_M(OpenInterestTableManagementHandlerUrl_G, data, success, error);
        };

        var deleteUpload_FileData = function (File_num) {
            var data = "action=deleteUpload_FileData" + "&File_num=" + File_num;
            var success = function (back) {
                Log_M("deleteUpload_FileData back" + back);
            };
            var error = function (e) { Log_M("deleteUpload_FileData error=" + e); unBlockUI_M(); };
            ajax_M(OpenInterestTableManagementHandlerUrl_G, data, success, error);

        };
        var deleteData = function () {
            var goNext = confirm("刪除後資料將無法恢復，確定刪除?");
            if (goNext) {
                var File_num = attr_M(this, "File_num");
                deleteMSYSKdata(File_num);
                deleteUpload_FileData(File_num);
            }
        };
        var getOItable = function () {
            var StartDate = val_M("#StartDate");
            var EndDate = val_M("#EndDate");
            var doNext = check_M.isEndDateBigThanStartDate(StartDate, EndDate);
            if (isEmptyStr(StartDate) && isEmptyStr(EndDate)) {
                doNext = true;
            }

            if (doNext) {
                var MP = val_M("#MP");
                var data = "action=getOItable" + "&StartDate=" + StartDate + "&EndDate=" + EndDate + "&MP=" + MP + "&U_MDEP=" + U_MDEP_M + "&U_POSITION=" + U_POSITION_M + "&ComID=" + ComID_M + "&U_Num=" + U_Num_M;

                var success = function (back) {
                    Log_M("getOItable back" + back);
                    empty_M("#OItableSearchTb");
                    var json = jsonParse_M(back);
                    $openInterestTableManagementPageList.Table.makeTbody("#OItableSearchTb", json, 10, "#pageBar",deleteData);
                };
                var error = function (e) { Log_M("getOItable error=" + e); unBlockUI_M(); };
                ajax_M(OpenInterestTableManagementHandlerUrl_G, data, success, error);
            } else {
                alert("請正確選擇建檔日期區間");
            }
            
        };
        var successFuc = function(){
            getOItable();
            $('#addOItableDialog').dialog('close');

        };
        var addOItable = function () {
            var MP = val_M("#addOItableMP");
            var doNext = false;
            if (!isEmptyStr(MP)) {
                doNext = true;
            }
            if (doNext) {
                var data = "action=addOItable" + "&MP=" + MP + "&add_user=" + U_Num_M + "&add_ip=" + IP_M ;
                var success = function (back) {
                    Log_M("addOItable back" + back);
                    if (!isEmptyStr(back)) {
                        upload_M("File1", back, "MSYSK", successFuc, successFuc);
                    } else {
                        alert("檔案上傳未完成");
                    }
                };
                var error = function (e) { Log_M("addOItable error=" + e); unBlockUI_M(); };
                ajax_M(OpenInterestTableManagementHandlerUrl_G, data, success, error);
            } else {
                alert("請選擇分析師");
            }
        };
        var startThisPage = function () {
            $Common.MUSER.getAnalystListHtmlTagOptionForOItable(CommonHandlerUrl_M, ".MP");
            val_M("#StartDate", getYesTodayDatepickerStr_M());
            val_M("#EndDate", getTodayDatepickerStr_M());
            $('#addOItableDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 380,
                height: 230
            });
            onClick_M("#openAddOItableDialog", function () {
                $('#addOItableDialog').dialog('open');
            });
            onClick_M("#getOItable", getOItable);
            onClick_M("#addOItable", addOItable);
            getOItable();
            //設定權限
            setPermission_M();
        };
      
        $(function () {
            //查看使用者權限
            getUserAuthority_M(startThisPage);
        })
    </script>
</asp:Content>

