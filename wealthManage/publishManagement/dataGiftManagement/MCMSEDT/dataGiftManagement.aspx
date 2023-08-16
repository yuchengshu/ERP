<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="dataGiftManagement.aspx.cs" Inherits="wealthManage_publishManagement_dataGiftManagement_MCMSEDT_dataGiftManagement" %>

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
                        <h1 class="box-title"><b>ERP &gt; 贈送資料管理</b> </h1>
                        <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title="">
                            
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        
                        <div id="callMessageSearchDiv" class="tabDivMargin5 tabChangeDiv">
                            <p class="colorRed">注意：</p>
                            <p class="colorRed">1.【顯示】《顯》會顯示在官網的研究報告，《不》不會顯示。
</p>
                            <p class="colorRed">2.【簡訊】《關》不會發訊息給客戶。關後需選擇<聯絡>顯示方式。《業聯》業務主動聯絡客戶(客戶不會看到代表號)，《客聯》客戶需自行來電詢問(客戶會看到代表號)。如選擇《開》<br />，《聯絡》方式無作用，不需理會。</p>
                            <p class="colorRed">3.【活動】欄僅世雨及網事部操作，目前全選《開》。
</p>
                            <div id="callMessageSearchInerDiv" class="tabDivMargin4">
                            <table class="table">
                                <thead >
                                    <tr class="marginTop5px bgColor">
                                        <th class="textAlignCenter  leftSideWhite" style="width:4%">
                                            項次
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:8%">
                                            帳號
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:4%">
                                            密碼
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:8%">
                                          分析師
                                        </th>
                                         <th class="textAlignCenter  leftSideWhite" style="width:16%">
                                          贈送名稱
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:8%">
                                          開始日
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:8%">
                                          結束日
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:8%">
                                          圖片(home)
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:4%">
                                          顯示
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:4%">
                                          簡訊
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:4%">
                                          聯絡
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:4%">
                                          活動
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:8%">
                                          檔案名稱
                                        </th>
                                        <th class="textAlignCenter  leftSideWhite" style="width:4%">
                                          修
                                        </th>
                                    </tr>
                                </thead>
                                <tbody id="dataGifttableSearchTb">

                                </tbody>
                            </table>
                            </div>
                        </div>


                        <!--////***********-->
                        <div style="text-align:center" id="pageBarDiv" class="marginTop-130">
　                        <div id="pageBar" style="margin:0 auto;"> </div>
                        </div>

                        <div id="editDataGiftDialog" class="form-control startHide" title="修改贈送資料">
                            <form class="">
                                <p>帳號：<input type="hidden" id="s_id"/><input class="form-control" id="M_id"/></p>
                                <p>密碼：<input class="form-control" id="M_Password"/></p>
                                <p>分析師：<select class="MP form-control" id="MP_Num"></select></p>
                                <p>贈送名稱：<input class="form-control" id="ddesc"/></p>
                                <p>開始日：<input class="datepicker form-control" id="Start_date"/></p>
                                <p>結束日：<input class="datepicker form-control" id="End_date"/></p>
                                <p>圖片(home)：<input class="form-control" id="Img"/></p>
                                <p>顯示：<select class="form-control" id="Pay"><option value="1">顯示</option><option value="0">不顯示</option></select></p>
                                <p>簡訊：<select class="form-control" id="Tel_tag"><option value="2">閉</option><option value="0">開</option></select></p>
                                <p>聯絡：<select class="form-control" id="Call_tag"><option value="1">業聯</option><option value="0">客聯</option></select></p>
                                <p>活動：<select class="form-control" id="Action_tag"><option value="1">是</option><option value="0">否</option></select></p>
                                <p>檔案名稱：<input class="form-control" id="Faxno" disabled="disabled"/></p>

                                <div style="text-align:center" class="">
                                   <input type="button" class="btn btn-primary editPer" id="editData" value="修改資料" />
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
    <script src="<%=getRelativePath()%>js/pageList/dataGiftManagementPageList.js" type="text/javascript"></script> 
    <script>
        var DataGiftManagementHandlerUrl_G = "dataGiftManagementHandler.ashx";
        var MENU_no_G = "<%=getMENU_no()%>";

        var openEditDataGiftDialog = function () {
            val_M("#s_id", attr_M(this, "s_id"));
            val_M("#M_id", attr_M(this, "M_id"));
            val_M("#M_Password", attr_M(this, "M_Password"));
            val_M("#MP_Num", attr_M(this, "MP_Num"));
            val_M("#ddesc", attr_M(this, "ddesc"));
            val_M("#Start_date", datetimeStrToDatepickerStr_M(attr_M(this, "Start_date")));
            val_M("#End_date", datetimeStrToDatepickerStr_M(attr_M(this, "End_date")));
            val_M("#Pay", attr_M(this, "Pay"));
            val_M("#Faxno", attr_M(this, "Faxno"));
            val_M("#Tel_tag", attr_M(this, "Tel_tag"));
            val_M("#Call_tag", attr_M(this, "Call_tag"));
            val_M("#Action_tag", attr_M(this, "Action_tag"));
            val_M("#Img", attr_M(this, "Img"));
            $('#editDataGiftDialog').dialog('open');
           
        };

        var editData = function () {
            var goNext = confirm("刪除後資料將無法恢復，確定刪除?");
            if (goNext) {
                var s_id = val_M("#s_id");
                var M_id = val_M("#M_id");
                var M_Password = val_M("#M_Password");
                var MP_Num = val_M("#MP_Num");
                var ddesc = val_M("#ddesc");
                var Start_date = val_M("#Start_date");
                var End_date = val_M("#End_date");
                var Pay = val_M("#Pay");
                var Faxno = val_M("#Faxno");
                var Tel_tag = val_M("#Tel_tag");
                var Call_tag = val_M("#Call_tag");
                var Action_tag = val_M("#Action_tag");
                var Img = val_M("#Img");
                var data = "action=editData" + "&s_id=" + s_id + "&M_id=" + M_id + "&M_Password=" + M_Password + "&MP_Num=" + MP_Num + "&ddesc=" + ddesc + "&Start_date=" + Start_date + "&End_date=" + End_date + "&Pay=" + Pay + "&Faxno=" + Faxno + "&Tel_tag=" + Tel_tag + "&Call_tag=" + Call_tag + "&Action_tag=" + Action_tag + "&Img=" + Img;
                Log_M("data=" + data);
                var success = function (back) {
                    if (back="成功") {
                        alert("異動資料成功");
                        getDataGiftTable();
                        $('#editDataGiftDialog').dialog('close');
                    }
                };
                var error = function (e) { Log_M("editData error=" + e); unBlockUI_M(); };
               ajax_M(DataGiftManagementHandlerUrl_G, data, success, error);
            }
        };

        var getDataGiftTable = function () {
            var data = "action=getDataGiftTable" + "&ComID=" + ComID_M + "&U_MDEP=" + U_MDEP_M;
            var success = function (back) {
                Log_M("getDataGiftTable back" + back);
                empty_M("#dataGifttableSearchTb");
                var json = jsonParse_M(back);
                $dataGiftManagementPageList.Table.makeTbody("#dataGifttableSearchTb", json, 10, "#pageBar", emptyValue_M,  openEditDataGiftDialog);
            };
            var error = function (e) { Log_M("getDataGiftTable error=" + e); unBlockUI_M(); };
            ajax_M(DataGiftManagementHandlerUrl_G, data, success, error);
        };

            var startThisPage = function () {
                $Common.MUSER.getAnalystListHtmlTagOptionForOItable(CommonHandlerUrl_M, ".MP");
                getDataGiftTable();
                $('#editDataGiftDialog').dialog({  //创建dialog，并设置为非自启动
                    autoOpen: false,
                    width: 380,
                    height: 680
                });
                onClick_M("#editData", editData);
                //設定權限
                setPermission_M();
            };
      
        $(function () {
            //查看使用者權限
            getUserAuthority_M(startThisPage);
        })
    </script>
</asp:Content>

