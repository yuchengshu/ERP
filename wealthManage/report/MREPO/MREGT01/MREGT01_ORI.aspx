<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MREGT01_ORI.aspx.cs" Inherits="wealthManage_report_MREPO_MREGT01_MREGT01" %>

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
                            <h1 class="box-title"><b>ERP &gt;  報表區 &gt;出缺勤異常表</b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-hover" id="">
                                <thead id="">
                                    <tr class="active">
                                        <th class="width20percent">
                                            <label>日期(起):</label>
                                                                                       
                                            <span class="inputSearch">
                                                <input type="text" id="StartDate" class="datepicker form-control today" placeholder="開始日"></span>
                                           
                                           

                                           
                                        </th>
                                        <th class="width20percent">
                                          <label>日期(迄):</label>
                                           
                                            <span class="inputSearch">
                                                <input type="text" id="EndDate" class="datepicker form-control today" placeholder="結束日">
                                                 </span>
                                            </th>
                                        <th class="width20percent"></th>
                                        <th class="width20percent"></th>
                                    </tr>
                                    <tr class="active">
                                        <th class="width20percent">
                                            <label>所屬公司別:</label>
                                            <select title="Select_Com" id="Select_Com" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc EAgroup addLeaveRequired">
                                            </select>
                                        </th>
                                        <th class="width20percent">
                                            <label>部門別:</label>
                                            <select title="Select_Dept" id="Select_Dept" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc CF_Item0004" itemName="部門別" Com="abcAttach_Com" MDEP="abcAttach_MDEP" EMP="abcAttach_User">
                                            </select>
                                        </th>
                                        <th class="width20percent">
                                            <label>人員:</label>
                                            <select id="Select_Employ" class="form-control">
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
                                        <th class="auto-style1">  </th>
                                        <th class="auto-style1">日期</th>
                                        <th class="auto-style1">人員</th>
                                        <th class="auto-style1">班別</th>
                                        <th class="auto-style1">簽入</th>
                                        <th class="auto-style1">簽退</th>
                                        <th class="auto-style1">打卡狀態</th>
                                        <th class="auto-style1">請假狀態</th>
                                       
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
        var reportHandlerMREGE02Url_G = "reportHandlerMREGT02.ashx";
        var Selected_UNUM = undefined;
        var MR_DateY_G = undefined;
        var MR_DateM_G = undefined;
        var Dept = "<%=getDept()%>";//取得選到的員工部門
        var ComID = "<%=getComID()%>";////取得選到的員工公司
        var getStatistics = function () {
            var type = attr_M(this, "type");
            var t_id = attr_M(this, "t_id");
            MR_DateY_G = val_M("#MR_DateY");
            MR_DateM_G = val_M("#MR_DateM");
            //var data = "action=getMREGE02DataList&type=" + type + "&t_id=" + t_id + "&MR_DateY=" + MR_DateY_G + "&MR_DateM=" + MR_DateM_G;
            var data = "ComID=" + abcU_ComVal + "&U_MDEP=" + abcU_MDEPVal + "&action=getMREGE02DataList";
            Log_M(" data=" + data);
            var success = function (back) {
                Log_M(" back=" + back);
                var json = jsonParse_M(back);
                //$MCMEB09PageList.Table.makeTbody("#Statistics", json, 30, "#pageBar", getRecord);
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
        var afterSuccessFuc1 = function () {
            var SelectDept_Title = val_M("#SelectDept_Title");//取得所選的部門
            //alert(SelectDept_Title);
            
        };
        var afterSuccessFuc3 = function () {
            var SelectCom_Title = $.trim(val_M("#SelectCom_Title"));//取得所選的公司
            
        };
        var comMdepChangeFuc = function () {

            var SelectCom_Title = $.trim(val_M("#SelectCom_Title"));//取得所選的公司
            //alert(SelectCom_Title);
            var SelectDept_Title = $.trim(val_M("#SelectDept_Title"));//取得所選的分析師員工號碼
            var Select_Employ = $.trim(val_M("#Select_Employ"));//取得所選的分析師員工號碼
            var MR_DateY_Value = $.trim(val_M("#MR_DateY"));//取得所選的年
            var MR_DateM_Value = $.trim(val_M("#MR_DateM"));//取得所選的月
            //alert(SelectCom_Title);
            //var emp = $(this).attr("EMP");
            //var com = $(this).attr("Com");
            //var mdep = $(this).attr("MDEP");
            //$("#" + emp).empty();
            //var abcU_ComVal = $("#" + com).val();
            //var abcU_MDEPVal = $("#" + mdep).val();
            //var url = CommonHandlerUrl_M;
            var data = "ComID=" + abcU_ComVal + "&U_MDEP=" + abcU_MDEPVal + "&action=getEmplist";
            var success = function (back) {
                Log_M("comMdepChangeFuc success");
                if (!isEmptyStr(back)) {
                    var json = jsonParse_M(back);
                    var sb = new string_M.StringBuilder();
                    sb.append("<option value=''>請選擇</option>")
                    $.each(json, function (i, v) {
                        sb.append("<option value='");
                        sb.append(v.U_Num);
                        sb.append("'>");
                        sb.append(v.U_Name);
                        sb.append("</option>");
                    });
                    $("#" + emp).append(sb.toString());
                    if (emp == "ES1") {
                        $("#" + emp).val(tempLeader_G);
                        tempLeader_G = "";
                        unBlockUI_M();
                    } else if (emp == "EA") {
                        $("#" + emp).val(tempMC_G);
                        tempMC_G = "";
                    }
                }
            };
            ajax_M(url, data, success);//<======================
        };
        //按下查詢紐後執行的動作(20221128進度)//getMREGT02DataList
        var getMREGT02DataList = function () {
            alert('按下查詢紐!');
            //var SelectCom_Title = $.trim(val_M("#SelectCom_Title"));//取得所選的公司
            //var SelectDept_Title = $.trim(val_M("#SelectDept_Title"));//取得所選的分析師員工號碼
            //var Select_Employ = $.trim(val_M("#Select_Employ"));//取得所選的分析師員工號碼
            var StartDate = $.trim(val_M("#StartDate"));//取得所選的日期(起)
            var EndDate = $.trim(val_M("#EndDate"));//取得所選的日期(迄)
            Selected_UNUM = val_M("#Select_Employ");//所選到的人員員工編號
            Select_Com = val_M("#Select_Com");//所選到的公司別
            Select_Dept = val_M("#Select_Dept");//所選到的部門別,0000表示沒有限制
            MR_DateY_G = val_M("#MR_DateY");
            MR_DateM_G = val_M("#MR_DateM");
            text_M(".printYear", MR_DateY_G);
            text_M(".printMonth", MR_DateM_G);
            /////////選擇全部分析師
            //getMREGT02DataList                                                                                                                                                   //getMREGE02DataList
            var data = "StartDate=" + StartDate + "&EndDate=" + EndDate + "&Selected_UNUM=" + Selected_UNUM + "&Select_Com=" + Select_Com + "&Select_Dept=" + Select_Dept + "&action=getMREGT02DataList";
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
                    sb.append(v.U_Name);//姓名
                    sb.append("</th>");
                    //廣播-總點閱
                    sb.append("<th class='text-center'>");
                    sb.append(v.ComName)//公司
                    sb.append("</th>");
                    sb.append("<th class='text-center'>");
                    sb.append(v.DeptName)//部門
                    sb.append("</th>");
                    sb.append("<th class='text-center'>");
                    sb.append(v.SlimDate)//到職日
                    sb.append("</th>");
                    sb.append("<th class='text-center'>");
                    sb.append(v.LeaveDate)//離職日
                    sb.append("</th>");
                    sb.append("<th class='text-center'>");
                    sb.append(v.E1)//年假
                    sb.append("</th>");
                    sb.append("<th class='text-center'>");
                    sb.append(v.E2)//補休
                    sb.append("</th>");
                    sb.append("<th class='text-center'>");
                    sb.append(v.E3)//公假
                    sb.append("<th class='text-center'>");
                    sb.append(v.E4)//婚假
                    sb.append("<th class='text-center'>");
                    sb.append(v.E5)//喪假
                    sb.append("<th class='text-center'>");
                    sb.append(v.E6)//產假
                    sb.append("</th>");
                    sb.append("<th class='text-center'>");
                    sb.append(v.E7)//事假
                    sb.append("</th>");
                    sb.append("<th class='text-center'>");
                    sb.append(v.E8)//病假
                    sb.append("<th class='text-center'>");
                    sb.append(v.E14)//颱風假
                    sb.append("<th class='text-center'>");
                    sb.append(v.E15)//榮譽假
                    sb.append("</th>");
                    sb.append("<th class='text-center'>");
                    sb.append(v.E12)//曠職
                    sb.append("<th class='text-center'>");
                    sb.append(v.E16)//家庭照護
                    sb.append("<th class='text-center'>");
                    sb.append(v.E9)//遲到
                    sb.append("<th class='text-center'>");
                    sb.append(v.E10)//漏刷
                    sb.append("</th>");
                    sb.append("<th class='text-center'>");
                    sb.append(v.E11)//早退
                    //sb.append("</th>");
                    //sb.append("<th class='text-center'>");//詳細
                   
                    //sb.append("<a class='BlueLink10 qPer' href='MREGT02 _List.aspx?U_Num=");
                    //sb.append(v.U_Num);
                    //sb.append("&U_MDEP=");
                    //sb.append(v.Dept);
                    //sb.append("&MR_SDate=");
                    //sb.append(MR_DateY_G);
                    //sb.append("' target='_blank'>");
                    //sb.append("</a>");
                    
                    //sb.append("</th>");
                    sb.append("</th><th class='text-center'>");
                    sb.append("<a class='BlueLink10 qPer' href='MREGT02_DetailList.aspx?U_Num=");
                    sb.append(v.U_Num);//所選到的員工編號
                    sb.append("&U_Mdep=");
                    sb.append(v.Dept);//所選到的員工部門編號
                    sb.append("&ComID=");
                    sb.append(v.Com);//所選到的員工公司編號
                    sb.append("&StartDate=");
                    sb.append(StartDate);//起始日期
                    sb.append("&EndDate=");
                    sb.append(EndDate);//終止日期
                    sb.append("' target='_blank'>");
                    sb.append('詳');
                    sb.append("</a></th><th class='text-center'>");
                    sb.append("</tr>");

                 

                    //
                    //取得下拉式選單中所有分析師

                    //選到[請選擇](全選)
                    //if (MP.length = 0) {
                    //var x = document.getElementById('MP');
                    //var txt = "";
                    //var val = "";

                    //20221107進度
                    //Statistics
                    append_M("#Statistics", sb.toString());
                });
                
            };
            var error = function (e) { Log_M("getMCMEB09DataList error=" + e); unBlockUI_M(); };

            ajax_M(reportHandlerMREGE02Url_G, data, success, error);
       

        };
        var getMCdata = function (type, num) {

        }
        //公司列表下拉式選單變動
        var afterSuccessFucMREGT01 = function () {
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept", "Dept", "option", "", "", Dept);
            var Select_Com = val_M("#Select_Com");//所選的公司
            var Select_Dept = val_M("#Select_Dept");//所選的部門
            //alert(Select_Com);
            //alert(Select_Dept);
            ////取得[員工]
            $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#SelectDept_Title", "Dept", Select_Com, "option", afterSuccessFucMREGT03);
            //取得部門option
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getMDEPlistHtmlTagOption", "DEPAR", "option", getMCdata);
            //getMREGT02ListHtmlTagOption_2: function (ul, idOrClassName, listType1,listType2, htmlTagType, afterSuccessFuc) {
            $Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ", Select_Com, Select_Dept, "option", afterSuccessFucMREGT03);//20221207進度(實做這個!!)

            ////取得[公司]
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom", "Com", "option");
            ////SelectCom_Title1
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom_Title12", "Com", "option", "", afterSuccFunc3, "");
            ////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept_Title1", "", "Dept", "option", Com);//所選的公司別產生相對應的部門(中文)
            ////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "", "TownShip", "option", county);//所選的城市產生相對應的鄉鎮市區(中文)
            //var SelectTownShip = val_M("#SelectTownShip");//所選的鄉鎮市區(代碼)
            //alert(SelectTownShip);
            //$("ZipCode").val(SelectTownShip);
            //$("ZipCode1").val("123");

            onChange_M("#MP", function () {
                $Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ", Select_Com, Select_Dept, "option", afterSuccessFucMREGT03);//20221207進度(實做這個!!)
            });


        };
        //部門列表下拉式選單變動
        var afterSuccessFucMREGT02 = function () {
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept", "Dept", "option", "", "", Dept);
            var SelectCom = val_M("#SelectCom_Title");//所選的公司

            ////取得[部門]
            $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#SelectDept_Title", "Dept", SelectCom, "option", afterSuccessFucMREGT03);
            //取得部門option
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getMDEPlistHtmlTagOption", "DEPAR", "option", getMCdata);
            $Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ", Select_Com, Select_Dept, "option", afterSuccessFucMREGT03);//20221207進度(實做這個!!)

            ////取得[公司]
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom", "Com", "option");
            ////SelectCom_Title1
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom_Title12", "Com", "option", "", afterSuccFunc3, "");
            ////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept_Title1", "", "Dept", "option", Com);//所選的公司別產生相對應的部門(中文)
            ////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "", "TownShip", "option", county);//所選的城市產生相對應的鄉鎮市區(中文)
            //var SelectTownShip = val_M("#SelectTownShip");//所選的鄉鎮市區(代碼)
            //alert(SelectTownShip);
            //$("ZipCode").val(SelectTownShip);
            //$("ZipCode1").val("123");
           
            onChange_M("#MP", function () {
                $Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ", Select_Com, Select_Dept, "option", afterSuccessFucMREGT03);//20221207進度(實做這個!!)
            });


        };
        var afterSuccessFucMREGT03 = function () {
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept", "Dept", "option", "", "", Dept);
            var SelectCom = val_M("#SelectCom_Title");//所選的公司

            ////取得[部門]
            //$Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#SelectDept_Title", "Dept", SelectCom, "option", afterSuccFunc3);
            ////取得[公司]
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom", "Com", "option");
            ////SelectCom_Title1
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom_Title12", "Com", "option", "", afterSuccFunc3, "");
            ////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept_Title1", "", "Dept", "option", Com);//所選的公司別產生相對應的部門(中文)
            ////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "", "TownShip", "option", county);//所選的城市產生相對應的鄉鎮市區(中文)
            //var SelectTownShip = val_M("#SelectTownShip");//所選的鄉鎮市區(代碼)
            //alert(SelectTownShip);
            //$("ZipCode").val(SelectTownShip);
            //$("ZipCode1").val("123");

            onChange_M("#MP", function () {
                //alert('MP Change!!!!');
                var type = val_M("#MP");
                //alert('MP Change!!!!');
                //alert(type);
                $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#MP_Item", type, "option");
            });


        };
        var startThisPage = function () {
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept_Title1", "Dept", "option");
        };
        //getListHtmlTagOption: function (ul, idOrClassName, listType, htmlTagType, afterSuccessFuc) 
        $(function () {
            startThisPage();
            $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Com", "Com", "option", afterSuccessFucMREGT01);
            $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Dept", "Dept", "option", afterSuccessFucMREGT02);//會呼叫
           
            /*
             * //個人業績表選定分析師後連動產品種類
        //20221116

        getListHtmlTagOption: function (ul, idOrClassName, listType, htmlTagType, BankKeyWord, afterSuccessFuc, SelectedValue)
             */
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#Select_Dept", "Dept", "option");//部門別
            $Common.MUSER.getAnalystListHtmlTagOption_MCMEB09(CommonHandlerUrl_M, "#MP", emptyValue_M, "option", emptyValue_M);
            onClick_M("#print", printScreen_M);
            onClick_M("#printDialog", printDialog_M);

            $('#clickDetailDialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                width: 600,
                height: 400,
            });
            //getMREGT02DataList
            onClick_M("#search", getMREGT02DataList);
            //getMCMEB09DataList();
            onChange_M("#Select_Com", function () {
                //alert('!!!');;
                //alert('SelectCom_Title Change!!!!');
                var Select_Com = val_M("#Select_Com");
                var Select_Dept = val_M("#Select_Dept");
                //alert(Select_Com);
                //alert(Select_Dept);
                //var SelectDept_Title = val_M("#SelectDept_Title");
                //var type = val_M("#SelectCom_Title");
                //alert('SelectCom_Title Change!!!!');
                //alert(type);
                $Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ", "GetEmploy", Select_Com, Select_Dept, "option");
            });
            //SelectDept_Title
            onChange_M("#Select_Dept", function () {
                //alert('!!!');;
                //alert('SelectDept_Title Change!!!!');
                var Select_Com = val_M("#Select_Com");
                var Select_Dept = val_M("#Select_Dept");
                //var SelectDept_Title = val_M("#Select_Dept");
                //var type = val_M("#MP");
                //alert('SelectDept_Title Change!!!!');
                //alert(Select_Com);
                //alert(Select_Dept);
                $Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ", "GetEmploy", Select_Com, Select_Dept, "option");
            });
        })

    </script>
</asp:Content>

