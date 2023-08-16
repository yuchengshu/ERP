<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MCMEB09.aspx.cs" Inherits="wealthManage_report_MREPO_MCMEB09_MCMEB09" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                            <h1 class="box-title"><b>ERP &gt;  報表區 &gt;媒體點閱統計表</b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-hover" id="">
                                <thead id="">
                                    <tr class="active">
                                        <th class="width20percent">
                                            <label>日期年:</label>
                                            <select id="MR_DateY" class="form-control">
                                                <%--這裡設定撈取資料的日期年度--%>
                                                <option value="2011">2011</option>
                                                <option value="2012">2012</option>
                                                <option value="2013">2013</option>
                                                <option value="2014">2014</option>
                                                <option value="2015">2015</option>
                                                <option value="2016">2016</option>
                                                <option value="2017">2017</option>
                                                <option value="2018">2018</option>
                                                <option value="2019">2019</option>
                                                <option value="2020">2020</option>
                                                <option value="2021">2021</option>
                                                <option value="2022">2022</option>
                                            </select>
                                        </th>
                                        <th class="width20percent">
                                            <label>日期月:</label>
                                            <select id="MR_DateM" class="form-control">
                                                <%--這裡設定撈取資料的日期月份--%>
                                                <option value="1">01</option>
                                                <option value="2">02</option>
                                                <option value="3">03</option>
                                                <option value="4">04</option>
                                                <option value="5">05</option>
                                                <option value="6">06</option>
                                                <option value="7">07</option>
                                                <option value="8">08</option>
                                                <option value="9">09</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                            </select>
                                        </th>
                                        <th class="width20percent">
                                            <label>分析師:</label>
                                            <select id="MP" class="form-control">
                                            </select>
                                        </th>
                                        <th class="width20percent">
                                            <button type="button" class="btn btn-info btn-flat qPer" id="search">查詢</button>
                                            <button type="button" class="btn btn-info btn-flat" id="print">列印</button>
                                        </th>
                                    </tr>
                                </thead>
                            </table>
                            <table class="table table-hover marginTop10">
                                <thead id="">
                                    <tr class="bgGray">
                                        <th class="auto-style1">分析師</th>
                                        <th class="auto-style1">廣播-總點閱</th>
                                        <th class="auto-style1">日均</th>
                                        <th class="auto-style1">Youtube - 總點閱</th>
                                        <th class="auto-style1">日均</th>
                                        <th class="auto-style1">文章 - 總點閱</th>
                                        <th class="auto-style1">日均</th>
                                    </tr>

                                </thead>
                                <tbody id="Statistics">
                                </tbody>

                            </table>
                            <div id="printArea" class=" startHide">
                                <div class='textAlignCenter'>
                                    <h3 class='table table-hover'>媒體點閱統計表</h3>
                                </div>
                                <p><span>統計日期</span>:<span class="printYear"></span>年<span></span><span class="printMonth"></span>月</p>
                                <table class="table table-hover marginTop10">
                                    <thead id="">
                                        <tr class="bgGray">
                                            <th class="textAlignCenter">分析師</th>
                                            <th class="textAlignCenter">廣播-總點閱</th>
                                            <th class="textAlignCenter">日均</th>
                                            <th class="textAlignCenter">Youtube - 總點閱</th>
                                            <th class="textAlignCenter">日均</th>
                                            <th class="textAlignCenter">文章 - 總點閱</th>
                                            <th class="textAlignCenter">日均</th>
                                        </tr>

                                    </thead>
                                    <tbody id="printReportTb">
                                    </tbody>

                                </table>
                            </div>
                            <div id="clickDetailDialog" class="form-control startHide" title="點擊明細表">
                                <div class='textAlignCenter'>
                                    <h4 class='table table-hover title'></h4>
                                </div>
                                <p>
                                    <span>統計日期</span>:<span class="printYear"></span>年<span></span><span class="printMonth"></span>月<span>
                                        <button type="button" class="" id="printDialog">列印</button></span>
                                </p>

                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th class='textAlignCenter'>日期</th>
                                            <th class='textAlignCenter'>標題</th>
                                            <th class='textAlignCenter'>點級數</th>
                                        </tr>
                                    </thead>
                                    <tbody id="clickDetailTb">
                                    </tbody>
                                </table>

                                <div id="printDialogArea" class="startHide">
                                    <div class='textAlignCenter'>
                                        <h4 class='table table-hover title'></h4>
                                    </div>
                                    <p><span>統計日期</span>:<span class="printYear"></span>年<span></span><span class="printMonth"></span>月</p>

                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th class='textAlignCenter'>日期</th>
                                                <th class='textAlignCenter'>標題</th>
                                                <th class='textAlignCenter'>點級數</th>
                                            </tr>
                                        </thead>
                                        <tbody id="clickDetailDialogTb">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        var reportHandlerMCMEB09Url_G = "reportHandlerMCMEB09.ashx";
        var MR_DateY_G = undefined;
        var MR_DateM_G = undefined;
        var getStatistics = function () {
            var type = attr_M(this, "type");
            var t_id = attr_M(this, "t_id");
            MR_DateY_G = val_M("#MR_DateY");
            MR_DateM_G = val_M("#MR_DateM");
            var data = "action=getClickDetail&type=" + type + "&t_id=" + t_id + "&MR_DateY=" + MR_DateY_G + "&MR_DateM=" + MR_DateM_G;
            Log_M(" data=" + data);
            var success = function (back) {
                Log_M(" back=" + back);
                var json = jsonParse_M(back);
                $MCMEB09PageList.Table.makeTbody("#Statistics", json, 30, "#pageBar", getRecord);
                //var sb = new StringBuilder_M();
                //var psb = new StringBuilder_M();
                //empty_M("#clickDetailTb");
                //empty_M("#clickDetailDialogTb");

                //append_M("#clickDetailTb", sb.toString());
                //append_M("#clickDetailDialogTb", psb.toString());

                $('#clickDetailDialog').dialog("open");
                var textTitle = undefined;
                switch (type) {
                    case "media":
                        textTitle = "廣播-總點閱";
                        break;
                    case "video":
                        textTitle = "Youtube-總點閱";
                        break;
                    case "critique":
                        textTitle = "文章-總點閱";
                        break;

                }
                text_M(".title", textTitle);

            };
            var error = function (e) { Log_M("getClickDetail error=" + e); unBlockUI_M(); };

            ajax_M(reportHandlerMCMEB09Url_G, data, success, error);

        };
        var getRecord = function () {
            //var M_ID = attr_M(this, "M_ID");
            //getCustomerDataEditRecord(M_ID);
            //getTradeDataEditRecord(M_ID);
        };
        //按下查詢紐後執行的動作(20221108進度)
        var getMCMEB09DataList = function () {
            //alert('按下查詢紐!');
            var MP = $.trim(val_M("#MP"));//取得所選的分析師員工號碼
            //
            //取得下拉式選單中所有分析師

            //選到[請選擇](全選)
            //if (MP.length = 0) {
            var x = document.getElementById('MP');
            var txt = "";
            var val = "";
            for (var i = 0; i < x.length; i++) {
                txt += x[i].text + ",";
                val += x[i].value + ",";//所有分析師的員工編號
            }
            //alert(txt + '/' + val);
            // }
            //
            //alert('選到的分析師編號' + MP);
            if (MP.length > 0) {
                MR_DateY_G = val_M("#MR_DateY");
                MR_DateM_G = val_M("#MR_DateM");
                text_M(".printYear", MR_DateY_G);
                text_M(".printMonth", MR_DateM_G);
                /////////只查一位分析師
                var data = "MR_DateY=" + MR_DateY_G + "&MR_DateM=" + MR_DateM_G + "&MP=" + val_M("#MP") + "&action=getMCMEB09DataList";
                var success = function (back) {
                    Log_M(" back=" + back);
                    var json = jsonParse_M(back);
                    var sb = new StringBuilder_M();
                    var psb = new StringBuilder_M();
                    empty_M("#Statistics");
                    empty_M("#ReportTb");
                    empty_M("#printReportTb");
                    $.each(json, function (i, v) {
                        sb.append("<tr><th class='text-center'>");
                        sb.append(v.Ch);//改成分析師姓名
                        sb.append("</th>");
                        sb.append("<th class='text-center'>");
                        sb.append(v.WMEDIA_Count);
                        sb.append("</th>");
                        sb.append("<th class='text-center'>");
                        sb.append(v.WMEDIA_Count_Avg);
                        sb.append("</th>");
                        sb.append("<th class='text-center'>");
                        sb.append(v.WVideo_Count);
                        sb.append("</th>");
                        sb.append("<th class='text-center'>");
                        sb.append(v.WVideo_Count_Avg);
                        sb.append("</th>");
                        sb.append("<th class='text-center'>");
                        sb.append(v.WCRITIQUE_Count);
                        sb.append("</th>");
                        sb.append("<th class='text-center'>");
                        sb.append(v.WCRITIQUE_Count_Avg);
                        sb.append("</th>");
                    }),

                        //20221107進度
                        //Statistics
                        append_M("#Statistics", sb.toString());


                };
                var error = function (e) { Log_M("getMCMEB09DataList error=" + e); unBlockUI_M(); };

                ajax_M(reportHandlerMCMEB09Url_G, data, success, error);
            }
            else//MP.length=0(選擇全部分析師)
            {
                MR_DateY_G = val_M("#MR_DateY");
                MR_DateM_G = val_M("#MR_DateM");
                text_M(".printYear", MR_DateY_G);
                text_M(".printMonth", MR_DateM_G);
                /////////選擇全部分析師
                var data = "MR_DateY=" + MR_DateY_G + "&MR_DateM=" + MR_DateM_G + "&MP=" + val + "&action=getMCMEB09DataList";
                var success = function (back) {
                    Log_M(" back=" + back);
                    var json = jsonParse_M(back);
                    var sb = new StringBuilder_M();
                    var psb = new StringBuilder_M();
                    empty_M("#Statistics");
                    empty_M("#ReportTb");
                    empty_M("#printReportTb");
                    $.each(json, function (i, v) {
                        //分析師
                        sb.append("<tr><th class='text-center'>");
                        sb.append(v.Ch);//改成分析師姓名
                        sb.append("</th>");
                        //廣播-總點閱
                        sb.append("<th class='text-center'><a href='/wealthManage/report/MREPO/MCMEB09/MCMEB09_medialist.aspx?M_ID=");
                        sb.append(v.P_ID)
                        sb.append("&MR_DateY=");
                        sb.append(MR_DateY_G);
                        sb.append("&MR_DateM=");
                        sb.append(MR_DateM_G);
                        sb.append("' >");
                        sb.append(v.WMEDIA_Count);//廣播-總點閱
                        sb.append("</th>");
                        //廣播-總點閱(日均)
                        sb.append("<th class='text-center'>");
                        sb.append(v.WMEDIA_Count_Avg);//廣播-總點閱-日均(要修改!!!)
                        sb.append("</th>");
                        //[Youtube]
                        sb.append("<th class='text-center'><a href='/wealthManage/report/MREPO/MCMEB09/MCMEB09_youtubelist.aspx?P_ID=");
                        sb.append(v.P_ID)
                        sb.append("&MR_DateY=");
                        sb.append(MR_DateY_G);
                        sb.append("&MR_DateM=");
                        sb.append(MR_DateM_G);
                        sb.append("' >");
                        sb.append(v.WVideo_Count);//Youtube-總點閱
                        sb.append("</th>");
                        //Youtube(日均)
                        sb.append("<th class='text-center'>");
                        sb.append(v.WVideo_Count_Avg);//Youtube-日均
                        sb.append("</th>");
                        //文章-總點閱
                        sb.append("<th class='text-center'><a href='/wealthManage/report/MREPO/MCMEB09/MCMEB09_critiquelist.aspx?C_ID=");
                        sb.append(v.P_ID)
                        sb.append("&MR_DateY=");
                        sb.append(MR_DateY_G);
                        sb.append("&MR_DateM=");
                        sb.append(MR_DateM_G);
                        sb.append("' >");
                        sb.append(v.WCRITIQUE_Count);//廣播-總點閱(要修改!!!)
                        sb.append("</th>");
                        //文章-總點閱-日均
                        sb.append("<th class='text-center'>");
                        sb.append(v.WCRITIQUE_Count_Avg);//廣播-總點閱-日均(要修改!!!)
                        sb.append("</th>");
                        
                    }),

                        //20221107進度
                        //Statistics
                        append_M("#Statistics", sb.toString());


                };
                var error = function (e) { Log_M("getMCMEB09DataList error=" + e); unBlockUI_M(); };

                ajax_M(reportHandlerMCMEB09Url_G, data, success, error);
            }

            /////////只查一位分析師
            //20221108work
            /////////取得所有分析師
            /////////取得所有分析師
        };

        $(function () {
            $Common.MUSER.getAnalystListHtmlTagOption_MCMEB09(CommonHandlerUrl_M, "#MP", emptyValue_M, "option", emptyValue_M);
            onClick_M("#print", printScreen_M);
            onClick_M("#printDialog", printDialog_M);

            $('#clickDetailDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 600,
                height: 400,
            });
            onClick_M("#search", getMCMEB09DataList);
            getMCMEB09DataList();
        })

    </script>
</asp:Content>

