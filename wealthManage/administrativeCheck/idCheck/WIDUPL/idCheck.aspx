<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="idCheck.aspx.cs" Inherits="wealthManage_administrativeCheck_idCheck_WIDUPL_idCheck" %>

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
        width:150px;
        }

        #M_ID {
             width:150px;
        }
       
        
         .pageSpan2 {
             margin-left:60px;
        }
        #getCustomerData {
         margin-left:37px;
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
                        <h1 class="box-title"><b>ERP &gt; 行政部 &gt; 身份證檢查</b> </h1>
                        <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title="">
                            
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div id="idCheckSearchDiv" class="tabDivMargin5 tabChangeDiv1">
        
                            <div id="idCheckSearchInerDiv" class="tabDivMargin4">
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
                                            <span class="inputSearch" id="keyWordSpan">
                                               <input type="text" name="message" placeholder="查尋關鍵字..." class="form-control " id="keyWord">
                                            </span>
                                            <span class="inputSearch" id="getAppointOriginalArchiveSpan">
                                              <button type="button" class="btn btn-info btn-flat qPer marginTop-27" id="getIdCheckList">查詢</button>
                                            </span>
                                            <span class="inputSearch pageSpan3">
                                              <span class="">page</span>&nbsp; <span class="">：</span>&nbsp;<span id ="pageNum" class=""></span>
                                            </span>
                                      </div>
                                    </th>
                                </tr>
                                    <tr class="marginTop5px bgColor">
                                        <th class="textAlignCenter  leftSideWhite" style="width:5%">
                                            序
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:18%">
                                            日期
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:7%">
                                            狀態
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:9%">
                                            姓名
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:11%">
                                            電話
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:18%">
                                          正面
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:18%">
                                          反面
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:7%">
                                         修
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:7%">
                                         刪
                                        </th>
                                         
                                    </tr>
                                </thead>
                                <tbody id="idCheckListSearchTb">

                                </tbody>
                            </table>
                            </div>
                        </div>

                        <!--////***********-->
                        <div id="editDataDialog" class="form-control startHide" title="修改資料">
                            <form class="">
                                <input type="hidden" class="form-control" id="id" />
                                <p>日期：<input type="text" class="form-control" id="add_date" disabled="disabled"/></p>
                                <p>狀態：<select id="ID_Status" class="form-control"><option value="0">尚未檢查</option><option value="1">成功</option><option value="2">失敗</option></select></p>
                                <p>姓名：<input type="text" class="form-control" id="Name" disabled="disabled" /></p>
                                <p>電話：<input type="text" class="form-control" id="Tel" disabled="disabled" /></p>
                                <p><span>關連客戶選擇</span>：<select id="M_ID" class="form-control"></select></p>
                                <div style="text-align:center" class="">
                                    <input type="button" class="btn btn-primary editPer" id="editData" value="修改資料" />
                                </div>
                            </form>
                        </div>
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
    <script src="<%=getRelativePath()%>js/pageList/idCheckPageList.js" type="text/javascript"></script> 
    
    <script>
        var idCheckHandlerUrl_G = "idCheckHandler.ashx";
        var MENU_no_G = "<%=getMENU_no()%>";
        var CustomerDetailMENU_no_G = "<%=getCustomerDetailMENU_no()%>";

        var getCustomerData = function (Tel, M_id) {
            var data = "action=getCustomerDetail" + "&Tel=" + Tel;
            Log_M("Tel=" + Tel);
            var success = function (back) {
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                empty_M("#M_ID");
                sb.append("<option value=''>客戶名稱---業務人員---所屬公司</option>");
                $.each(json, function (i, v) {
                    sb.append("<option value='");
                    sb.append(v.M_ID);
                    sb.append("'>");
                    sb.append(v.M_Name);
                    sb.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                    sb.append(v.MC_Name);
                    sb.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                    sb.append(v.MC_COM);
                    sb.append("</option>");
                });
                append_M("#M_ID", sb.toString());
                val_M("#M_ID", M_id);
                $('#editDataDialog').dialog('open');
            };
            var error = function (e) { Log_M("getCustomerData error=" + e); unBlockUI_M(); };
            ajax_M(idCheckHandlerUrl_G, data, success, error);
        };

        var openEditDataDialog = function () {
            var Tel = attr_M(this, "Tel");
           
            val_M("#Tel", Tel);
            val_M("#id", attr_M(this, "id"));
            val_M("#add_date", attr_M(this, "add_date"));
            var ID_Status= attr_M(this, "ID_Status");
            if(isEmptyStr(ID_Status)){
                ID_Status="0";
            }
            val_M("#ID_Status", ID_Status);
            val_M("#Name", attr_M(this, "Name"));
            var M_id =attr_M(this, "M_id");
            getCustomerData(Tel, M_id);
        };

        var deleteData = function () {
            var deleteCheck = confirm("確定刪除?");
            var id = attr_M(this, "id");
            if (deleteCheck) {
                var data = "action=deleteData" + "&id=" + id;
                var success = function (back) {
                    if (back == "成功") {
                        getIdCheckList()
                        alert("資料異動成功");
                    }
                };
                var error = function (e) { Log_M("deleteData error=" + e); unBlockUI_M(); };
                ajax_M(idCheckHandlerUrl_G, data, success, error);
            }
        };
 
        var getIdCheckList = function () {
            var data = "action=getIdCheckList" + "&keyWord=" + val_M("#keyWord") + "&StartDate=" + val_M("#StartDate") + "&EndDate=" + val_M("#EndDate");
            var success = function (back) {
                Log_M("getIdCheckList back=" + back);
               var json = jsonParse_M(back);
               $idCheckPageList.Table.makeTbody("#idCheckListSearchTb", json, 10, "#pageBar", emptyValue_M, openEditDataDialog, deleteData);
            };
            var error = function (e) { Log_M("getIdCheckList error=" + e); unBlockUI_M(); };
            ajax_M(idCheckHandlerUrl_G, data, success, error);
        };

        var editData = function () {
            var data = "action=editData" + "&M_ID=" + val_M("#M_ID") + "&ID_Status=" + val_M("#ID_Status") + "&id=" + val_M("#id");
            $('#editDataDialog').dialog('close');
            var success = function (back) {
                Log_M("editData back=" + back);
                if (back == "成功") {
                    getIdCheckList();
                    alert("異動資料成功");
                }
            };
            var error = function (e) { Log_M("editData error=" + e); unBlockUI_M(); };
            ajax_M(idCheckHandlerUrl_G, data, success, error);
        };

        var startThisPage = function () {
            val_M("#StartDate", getTodayDatepickerStr_M());
            val_M("#EndDate", getTodayDatepickerStr_M());
            $('#editDataDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 300,
            });
            onClick_M("#getIdCheckList", getIdCheckList);
            onClick_M("#editData", editData);
            getIdCheckList();
            //設定權限
            setPermission_M();
        };
      
        $(function () {
          
            //查看使用者權限
            getUserAuthority_M(startThisPage);
        })
    </script>
</asp:Content>

