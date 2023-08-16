<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <div>

    </div>
    <style>
        #chat-box {
            margin-top: 15px;
        }

        .item {
            height: 30px;
            margin-bottom: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper" style="min-height: 668px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>首頁
               
            </h1>
            目前時間:<h1><p id="show"></p></h1>

            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>首頁</a></li>
                <li class="active">首頁</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <!-- Small boxes (Stat box) -->
            <!-- <div class="row">
            <div class="col-lg-3 col-xs-6">

              <div class="small-box bg-aqua">
                <div class="inner">
                  <h3>10</h3>
                  <p>新訂單</p>
                </div>
                <div class="icon">
                  <i class="ion ion-bag"></i>
                </div>
                <a href="#" class="small-box-footer">更多資訊 <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div>
            <div class="col-lg-3 col-xs-6">
 
              <div class="small-box bg-green">
                <div class="inner">
                  <h3>53<sup style="font-size: 20px">%</sup></h3>
                  <p>本月業績達成率</p>
                </div>
                <div class="icon">
                  <i class="ion ion-stats-bars"></i>
                </div>
                <a href="#" class="small-box-footer">更多資訊 <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div>
            
            
            <div class="col-lg-3 col-xs-6">
 
              <div class="small-box bg-yellow">
                <div class="inner">
                  <h3>3</h3>
                  <p>本月新增會員</p>
                </div>
                <div class="icon">
                  <i class="ion ion-person-add"></i>
                </div>
                <a href="#" class="small-box-footer">更多資訊 <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div>
            
            
            <div class="col-lg-3 col-xs-6">
    
              <div class="small-box bg-red">
                <div class="inner">
                  <h3>200000</h3>
                  <p>本月業績</p>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
                <a href="#" class="small-box-footer">更多資訊 <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div>
          </div>-->


            <!-- Main row -->

            <div class="row" id="showIndexPage">
            </div>
            <!-- /.row (main row) -->

        </section>
        <!-- /.content -->
    </div>
    <script>
        /*顯示畫面*/
        var indexHandlerUrl_G = "indexHandler.ashx";
        var carouselMassageJson_G = undefined;
        var carouselNum_G = 0;
        var Group_G = "<%=getGroupCode()%>";
        //取得公佈欄
        var getNoticeBoard = function (Menu_no) {
            var data = "U_MDEP=" + U_MDEP_M + "&U_POSITION=" + U_POSITION_M + "&group=" + Group_G + "&action=getNoticeBoard";
            var success = function (back) {
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                sb.append("<div class='col-md-12'><div class='box box-danger'><div class='box-header'><i class='fa fa-list-alt'></i><h3 class='box-title'>公佈欄</h3><div class='box-tools pull-right' data-toggle='tooltip' title='' data-original-title='看更多'><div class='btn-group' data-toggle='btn-toggle'><a href='/public/NoticeBoard/MBULT/noticeBoard.aspx?MENU_no=" + Menu_no + "' ><button type='button'class='btn btn-danger btn-sm'><i class='fa fa-bars'></i></button></a></div></div></div><!-- /.box-header --><div class='box-body'><table class='table table-bordered table-condensed'><tbody><tr class='active'><th style = 'width: 5%'> </th><th style='width: 55%'>標題</th><th style = 'width: 40%'>發佈時間</th></tr>");
                $.each(json, function (i, v) {
                    if (i <= 4) {
                        sb.append("<tr><th class='text-center'>");
                        sb.append(i + 1);
                        if (v.adver_item == "1") {
                            sb.append("</th><th>公告:<a class='BlueLink10' href='../public/NoticeBoard/MBULT/noticeBoard.aspx?detail=");
                        } else {
                            sb.append("</th><th><a class='BlueLink10' href='../public/NoticeBoard/MBULT/noticeBoard.aspx?detail=");
                        }

                        sb.append(v.adver_id);
                        sb.append("'>");
                        sb.append(v.adver_subject);
                        sb.append("</a></th><th>");
                        sb.append(v.adver_create_date);
                        sb.append("</th></tr>");
                    }
                });
                sb.append("</tbody></table></div><!--/.box-body--></div><!--/.box--></div>");
                append_M("#showIndexPage", sb.toString());
            };
            var error = function (e) { Log_M("searchContentAuthority error=" + e); unBlockUI_M(); };

            ajax_M(indexHandlerUrl_G, data, success, error);
        };
        //生日提醒欄
        var getRemindEmpBDtableHtml = function () {
            var data = "action=getRemindEmpBDtableHtml";
            var success = function (back) {
                append_M("#showIndexPage", back);
            };
            var error = function (e) { Log_M("getRemindEmpBDtable error=" + e); unBlockUI_M(); };

            ajax_M(indexHandlerUrl_G, data, success, error);
        };
        //取得信箱資料
        var getEmailBox = function (Menu_no) {
            //alert('取得信箱資料');
            var data = "U_MDEP=" + U_MDEP_M + "&U_Num=" + U_Num_M + "&group=" + Group_G + "&action=getEmailBox";
            var success = function (back) {
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();

                sb.append("<div class='col-md-12'><div class='box box-danger'><div class='box-header'><i class='fa fa-envelope'></i><h3 class='box-title'>電子郵件</h3><div class='box-tools pull-right' data-toggle='tooltip' title='看更多'><div class='btn-group' data-toggle='btn-toggle'><a href='/public/Mail/MMAIL/mail.aspx?MENU_no=" + Menu_no + "' ><button type='button' class='btn btn-danger btn-sm'><i class='fa fa-bars'></i></button></a></div></div></div><!--/.box-header--><div class='box-body'><table class='table table-bordered'>");
                if (json.length == 0) {
                    sb.append("<tr class='active'><th>無未讀取信件</th></tr>");
                }
                else {
                    sb.append("<tr class='active'><th></font></td><th>標題</font></th><th>日期</font></th><th>寄件人</th></tr>");
                    $.each(json, function (i, v) {
                        if (i <= 3) {
                            sb.append("<tr align='center' class='12-k'><th>");
                            sb.append(i + 1);
                            sb.append("</th><th align='left'><a class='BlueLink10' href ='../public/Mail/MMAIL/mail.aspx?MS_ID=");
                            sb.append(v.MS_ID);
                            sb.append("'>");
                            sb.append(v.MS_Title);
                            sb.append("</a></th><th>");
                            sb.append(v.add_Date);
                            sb.append("</th><th>");
                            sb.append(v.MS_Sender_Name);
                            sb.append("</th></tr>");
                        }
                    });
                }
                sb.append("</table></div><!--/.box-body--></div><!--/.box--></div>");
                append_M("#showIndexPage", sb.toString());
            };
            var error = function (e) { Log_M("getEmailBox error=" + e); unBlockUI_M(); };

            ajax_M(indexHandlerUrl_G, data, success, error);
        };
        //取得Call訊列表
        var getCallMassage = function (Menu_no) {
            var data = "U_MDEP=" + U_MDEP_M +"&U_Num =" + U_Num_M+ "&U_POSITION=" + U_POSITION_M + "&group=" + Group_G + "&action=getCallMassage";
            //由action=getCallMassage中可呼叫indexHandler.ashx
            /**
             * case "getNoticeBoard"://公佈欄
                U_MDEP = context.Request["U_MDEP"];
                U_POSITION = context.Request["U_POSITION"];
                group = context.Request["group"];
                context.Response.Write(getNoticeBoard(U_MDEP, U_POSITION, group));
                break;
             * 之後取回資料後再透過
             * $.each(json, function (i, v) {...}的  [v] 即為回傳的值
             * 然後再顯示到畫面上
             * sb.append(v.adver_id);
                        sb.append("'>");
                        sb.append(v.msg_text);
                        sb.append("</a></th><th>");
                        sb.append(v.add_Date);
                        sb.append("</th></tr>");
             */
            var success = function (back) {
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                sb.append("<div class='col-md-12'><div class='box box-danger'><div class='box-header'><i class='fa fa-list-alt'></i><h3 class='box-title'>Call訊</h3><div class='box-tools pull-right' data-toggle='tooltip' title='' data-original-title='看更多'><div class='btn-group' data-toggle='btn-toggle'><a href='/public/NoticeBoard/MBULT/noticeBoard.aspx?MENU_no=" + Menu_no + "' ><button type='button'class='btn btn-danger btn-sm'><i class='fa fa-bars'></i></button></a></div></div></div><!-- /.box-header --><div class='box-body'><table class='table table-bordered table-condensed'><tbody><tr class='active'><th style = 'width: 5%'> </th><th style='width: 55%'>標題</th><th style = 'width: 40%'>發佈時間</th></tr>");
                $.each(json, function (i, v) {
                    if (i <= 4) {
                        sb.append("<tr><th class='text-center'>");
                        sb.append(i + 1);
                        if (v.adver_item == "1") {
                            sb.append("</th><th>公告:<a class='BlueLink10' href='../public/NoticeBoard/MBULT/noticeBoard.aspx?detail=");
                        } else {
                            sb.append("</th><th><a class='BlueLink10' href='../public/NoticeBoard/MBULT/noticeBoard.aspx?detail=");
                        }

                        sb.append(v.adver_id);
                        sb.append("'>");
                        sb.append(v.msg_text);
                        sb.append("</a></th><th>");
                        sb.append(v.add_Date);
                        sb.append("</th></tr>");
                    }
                });
                sb.append("</tbody></table></div><!--/.box-body--></div><!--/.box--></div>");
                append_M("#showIndexPage", sb.toString());
            };
            var error = function (e) { Log_M("searchContentAuthority error=" + e); unBlockUI_M(); };

            ajax_M(indexHandlerUrl_G, data, success, error);
        };
        ////今日聯絡事項
        var getTodayConnectionMatter = function () {
            var data = "U_Num=" + U_Num_M + "&action=getTodayConnectionMatter";
            var success = function (back) {
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                sb.append("<div class='col-md-12'><div class='box box-danger'><div class='box-header'><i class='fa fa-list-alt'></i><h3 class='box-title'>今日聯絡事項</h3></div><!--/.box-header--><div class='box-body'><table class='table table-bordered'>");
                if (json.length == 0) {
                    sb.append("<tr><th>無近日聯絡事項</th></tr>");
                }
                else {
                    sb.append("<tr align='center' bgcolor='#E5E5E5' class='12-k'><td WIDTH ='5%'></td><td WIDTH = '20%'>時間</td><td width = '20%'>客戶姓名</td><td width = '35%'>再聯絡項目</td><td WIDTH = '20%'>建檔人員</td></tr>");
                    $.each(json, function (i, v) {
                        sb.append("<tr align = 'center' class='12-k'><td>");
                        sb.append(i + 1);
                        sb.append("</td><td>");
                        sb.append(v.N_Date);
                        sb.append("</td><td>");
                        if (v.M_ID.Length > 0) {
                            if (v.MMBERm_idEqualMQUSTm_ID) {
                                sb.append("<a class='BlueLink10' href='../MPMMBER/MMBER_Detail.asp?M_ID=");
                                sb.append(v.M_ID);
                                sb.append("' target='");
                                sb.append(v.M_ID);
                                sb.append("'>");
                                sb.append(v.M_Name);
                                sb.append("</a>");
                            }
                        }
                        else {
                            sb.append(v.Q_Name);
                        }
                        sb.append("</td><td align ='left'>");

                        if (v.MITEMditcodeEqualMQUSTn_Item) {
                            sb.append("<b>【");
                            sb.append(v.ddesc);
                            sb.append("】</b>");
                        }
                        sb.append("<br>");
                        sb.append(v.Question);
                        sb.append("</td><td>");
                        if (v.Add_User == U_Num_M) {
                            sb.append(v.U_Name);
                        }
                        sb.append("</td></tr>");
                    });
                }
                sb.append("</table></div><!--/.box-body--></div><!--/.box--></div>");
                append_M("#showIndexPage", sb.toString());
            };
            var error = function (e) { Log_M("getTodayConnectionMatter error=" + e); unBlockUI_M(); };

            ajax_M(indexHandlerUrl_G, data, success, error);
        };
        //華南信用卡額度提醒
        var getHnBankCredit = function () {
            //alert('華南信用卡額度提醒');
            var data = "U_MDEP=" + U_MDEP_M + "&group=" + Group_G + "&action=getHnBankCredit";
            //由action==getHnBankCredit中可呼叫indexHandler.ashx
            var success = function (back) {
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                sb.append("<div class='col-md-12'><div class='box box-danger'><div class='box-header'><i class='fa fa-list-alt'></i><h3 class='box-title'>華南信用卡額度提醒</h3></div><!--/.box-header--><div class='box-body'><table class='table table-bordered'>");
                $.each(json, function (i, v) {
                        sb.append("<tr><th class='text-center'>");
                    sb.append("統計期間:" + v.adver_create_date+" ~ "+v.adver_item);
                        if (v.adver_item == "1") {
                            sb.append("</th><th>華南信用卡額度提醒公告:");
                        } else {
                            sb.append("</th><th>華南信用卡額度提醒公告:");
                            sb.append(v.adver_id);
                            //sb.append("'>");
                            //sb.append(v.adver_subject);
                            sb.append("</a></th><th>");
                            //sb.append(v.adver_create_date);
                            sb.append("</th></tr>");
                    }
                });
                sb.append("</tbody></table></div><!--/.box-body--></div><!--/.box--></div>");
                append_M("#showIndexPage", sb.toString());
            };
            var error = function (e) { Log_M("getHnBankCredit error=" + e); unBlockUI_M(); };

            ajax_M(indexHandlerUrl_G, data, success, error);
        }
        ///業績排行榜
        var getPerformanceRanking = function () {
                var data = "U_MDEP=" + U_MDEP_M + "&group=" + Group_G + "&action=getPerformanceRanking";
                var success = function (back) {
                    var json = jsonParse_M(back);
                    var sb = new StringBuilder_M();
                    sb.append("<div class='col-md-12'><div class='box box-danger'><div class='box-header'><i class='fa fa-bar-chart-o'></i><h3 class='box-title'>業績排行榜</h3>");
                    if (U_Num_M == "A9501041" || U_Num_M == "B9601151") {
                        sb.append("<div class='box-tools pull-right' data-toggle='tooltip' title='近三月業績排行'><div class='btn-group' data-toggle='btn-toggle' ><a href = '#'><button type='button' class='btn btn-danger btn-sm'><i class='fa fa-bars'></i></button></a></div></div>");
                    }
                    sb.append("</div><!-- /.box-header --><div class='box-body'><table class='table table-bordered table-condensed'><tr class='active'><th style = 'width: 50px' class='text-center'>排名</th><th class='text-center'>業務人員</th><th class='text-center'>業績總數</th></tr>");
                    $.each(json, function (i, v) {
                        if (U_Name_M == v.mc_name) {
                            sb.append("<tr class='bgYellow'><th class='text-center'>");
                        } else {
                            sb.append("<tr><th class='text-center'>");
                        }

                        sb.append(i + 1);
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.mc_name);
                        sb.append("</th><th class='text-center'>");
                        sb.append(getMoneyFormat_M(parseInt(v.money)));
                        sb.append("</th></tr>");
                    });

                    sb.append("</table></div><!--/.box-body--></div><!--/.box--></div>");
                    append_M("#showIndexPage", sb.toString());
                };
                var error = function (e) { Log_M("getPerformanceRanking error=" + e); unBlockUI_M(); };

                ajax_M(indexHandlerUrl_G, data, success, error);
        };
        //節目合約到期提醒
        var videoOutofdateRemind = function () {
            var data = "U_MDEP=" + U_MDEP_M + "&group=" + Group_G + "&action=getRemindProgramContractMaturity";//節目合約到期提醒
            var success = function (back) {
                var json = jsonParse_M(back);
                var sb = new StringBuilder_M();
                sb.append("<div class='col-md-12'><div class='box box-danger'><div class='box-header'><i class='fa fa-bar-chart-o'></i><h3 class='box-title'>節目合約到期提醒</h3>");
                sb.append("</div><!-- /.box-header --><div class='box-body'><table class='table table-bordered table-condensed'><tr class='active'><th style = 'width: 50px' class='text-center'>編號</th><th class='text-center'>節目名稱</th><th class='text-center'>分析師</th></tr>");
                     $.each(json, function (i, v) {
                    if (U_Name_M == v.mc_name) {
                        sb.append("<tr class='bgYellow'><th class='text-center'>");
                    } else {
                        sb.append("<tr><th class='text-center'>");
                    }

                    sb.append(i + 1);
                    sb.append("</th><th class='text-center'>");
                    sb.append(v.CN_NameS);
                    sb.append("</th><th class='text-center'>");
                    sb.append(v.CN_Teacher);
                    sb.append("</th></tr>");
                });

                sb.append("</table></div><!--/.box-body--></div><!--/.box--></div>");
                append_M("#showIndexPage", sb.toString());
            };
            var error = function (e) { Log_M("getRemindProgramContractMaturity error=" + e); unBlockUI_M(); };

            ajax_M(indexHandlerUrl_G, data, success, error);
           
        };
        function setTime() {
            var date = new Date();
            var HH = date.getHours(),
                MM = date.getMinutes(),
                SS = date.getSeconds(),
                date = date.getDate();
            if (SS < 10) {
                SS = "0" + SS
            }
            $("#show").text(HH + ":" + MM + ":" + SS);
        }
        //設置時間間隔
        setInterval(setTime, 1000);

        function current_time() {
            document.getElementById('current').innerHTML = new Date();
            setTimeout('current_time()', 1000); //每秒呼叫一次功能: current_time()
        }


        //取得首頁觀看權限項目
        var searchContentAuthority = function () {
                //alert('取得首頁權限!');
                var data = "U_Num=" + U_Num_M + "&action=searchContentAuthority";
                var success = function (back) {
                    var json = jsonParse_M(back);
                    var menuNo = undefined;
                    $.each(json, function (i, v) {
                        menuNo = split_M(v.link_page, "=", 1);
                        switch (v.info_id) {
                            //業績排行榜
                            case "MF001":
                                getPerformanceRanking()
                                break;

                            //生日提醒
                            case "MF002":
                                getRemindEmpBDtableHtml()
                                break;

                            //節目合約到期提醒
                            case "MF003":
                                videoOutofdateRemind()
                                break;

                            //公佈欄
                            case "MF004":
                                getNoticeBoard(menuNo)
                                break;

                            //電子郵件
                            case "MF005":
                                getEmailBox(menuNo)
                                break;

                            //即時Call訊
                            case "MF006":
                                //alert('CALL getCallMassage');
                                getCallMassage()
                                break;

                            //今日聯絡事項
                            case "MF007":
                                //alert('取得今日聯絡事項')
                                getTodayConnectionMatter()
                                break;


                            //華南信用卡額度提醒(getHnBankCredit)
                            case "MF008":
                                //alert('華南信用卡額度提醒(getHnBankCredit)');
                                getHnBankCredit()
                                break;
                        }

                    });

                };
                var error = function (e) { Log_M("searchContentAuthority error=" + e); unBlockUI_M(); };

                ajax_M(indexHandlerUrl_G, data, success, error);
            };

        $(function () {
                searchContentAuthority();
                $(".btn-sm").on('click', function () {
                    alert("功能尚未建置");
                    //location.href = "../public/NoticeBord/MBULT/noticeBoard.aspx";
                });
                setSessionStorage_M("firstLevel", "");
                setSessionStorage_M("secondLevel", "");
                setSessionStorage_M("thirdLevel", "");

            });
    </script>
</asp:Content>

