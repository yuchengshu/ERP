<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="envelopePrintWork.aspx.cs" Inherits="wealthManage_envelopePrintWork_MADINVO_envelopePrintWork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .box-body {
            height:280px;
        }
        #envelopeform {
             height:260px;
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
                        <h1 class="box-title"><b>ERP &gt; 信封列印作業</b> </h1>
                        <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title="">
                            
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div>
                            <form id="envelopeform" class="form-control">
                                <p><span>入帳日期(起):</span><input id="StartDate" class="form-control datepicker"/></p>
                                <p><span>入帳日期(止):</span><input id="EndDate" class="form-control datepicker"/></p>
                                <p><span>會員編號:</span><input id="M_Num" class="form-control"/></p>
                                <p style="text-align:center"> <button id="getPrintData" type="button"class="btn btn-primary btn-flat form-control">搜尋列印資料</button></p>
                            </form>
                        </div> 
                        <!--////***********-->
                    </div><!--/.box-body-->
                </div><!--/.box-->
            </div>
          </div><!-- /.row (main row) -->
        </section><!-- /.content -->
      </div>
     <script src="<%=getRelativePath()%>js/MasterPage.js" type="text/javascript"></script>
   
    <script>
        var EnvelopePrintWorkHandlerUrl_G = "envelopePrintWorkHandler.ashx";
        var MENU_no_G = "<%=getMENU_no()%>";
        var getPrintData = function () {
            var data = "action=getPrintData" + "&M_Num=" + val_M("#M_Num") + "&StartDate=" + val_M("#StartDate") + "&EndDate=" + val_M("#EndDate");
            var success = function (back) {
                var json = jsonParse_M(back);
                Log_M("getPrintData back=" + json[0] + "json.length=" + json.length);
                if (json.length > 0) {
                    window.open('printEnvelope.aspx?T_ID=' + json[0] + '&count=' + json.length, '信封列印', config = 'height=780,width=700');
                } else {
                    alert("查無資料");
                }
                
            };
            var error = function (e) { Log_M("getPrintData error=" + e); unBlockUI_M(); };
            Log_M("data=" + data);
            ajax_M(EnvelopePrintWorkHandlerUrl_G, data, success, error);
        };

        var startThisPage = function () {
            onClick_M("#getPrintData", getPrintData);
            //設定權限
            setPermission_M();
        };
      
        $(function () {
            //查看使用者權限
           getUserAuthority_M(startThisPage);
        })
    </script>
</asp:Content>

