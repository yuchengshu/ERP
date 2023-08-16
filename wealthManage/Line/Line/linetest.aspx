<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="linetest.aspx.cs" Inherits="wealthManage_Line_Line_linetest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <style>
       
   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-wrapper" style="min-height: 616px;">
        <!-- Content Header (Page header) -->
        <section class="content-header"></section>
        <!-- Main content -->
        <section class="content">
        <!-- Main row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-danger">
                        <div class="box-header">
                            <i class="fa fa-list-alt"></i>
                            <h1 class="box-title"><b>ERP &gt; 報表區 &gt; 未到期會員總表 </b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-hover" id="">
                            <thead id="">
                                <tr class="active">
                                    <th class="width20percent">
                                        <label>發送人員:</label>
                                        <select id="MP" class="form-control"></select>
                                    </th>
                                    <th class="width20percent">
                                        <label>接收群組:</label>
                                        <select id="ReceiveGroup" class="form-control"></select>
                                    </th>
                                    <th class="width20percent">
                                        <label>發送類型:</label>
                                        <select id="SendType" class="form-control">
                                            <option value="0">立即</option>
                                            <option value="1">排程</option>
                                        </select>
                                    </th>
                                     <th class="width20percent">
                                        <label>排程日:</label>
                                        <input type="text" id="SendDate" class="datepicker form-control " placeholder="發送日期">
                                    </th>
                                     <th class="width20percent">
                                        <label>附件:</label>
                                        <form  runat="server">
                                            <asp:FileUpload type="file" id="File1" class="form-control uploadFileCheck  upLoadGroup" ClientIDMode="Static"  runat="server"/>
                                        </form>
                                    </th>
                                    <th class="width20percent">
                                        <span class="input-group-btn marginLeft">
                                            <button type="button" class="btn btn-info btn-flat adder" id="search">送出</button>
                                        </span>
                                    </th>
                                    <th></th>
          
                                </tr>
                            </thead>
                        </table>
                        
                        
                            <table class="table table-hover marginTop10">
                                <thead id="">
                                    <tr class="bgGray">
                                        <th colspan="2" class="textAlignCenter borderGray">會員數</th>
                                    </tr>
                                    <tr class="bgBlue">
                                        <th class="width50percent textAlignCenter borderGray">會員總類</th>
                                        <th class="width50percent textAlignCenter borderGray">數量</th>
                                    </tr>
                                </thead>
                                <tbody id="mcReportTb">

                                </tbody>
        
                        </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        var MVMEB07reportHandlerUrl_G = "reportHandlerMVMEB07.ashx";
        var uploadFileCheck = function () {
            alert('upload');
            var fileSize = this.files[0].size
            if (fileSize > 3670016) {
                $(this).val("");
                alert("上傳的檔案不得超過 3MB！");
            } else {
                //取得該filebox中的檔案資料：
                var id = attr_M(this, "id")
                var files = document.getElementById(id).files;
                var fileData = new FormData();
                fileData.append(files[0].name, files[0]);
                ajax_M(UploadFileHandlerUrl_M, fileData, success, Error);

            }
        };
      
        $(function () {
            val_M("#StartDate", getTodayDatepickerStr_M());
            val_M("#EndDate", getTodayDatepickerStr_M());
            //取得分析師ListHtmlTagOption
            $Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "#MP", emptyValue_M, "option", emptyValue_M);
            onClick_M("#search", getAnalystSinglePerformanceTab);
        })
    </script>
</asp:Content>

