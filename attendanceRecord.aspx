<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="attendanceRecord.aspx.cs" Inherits="attendanceRecord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                            <h1 class="box-title"><b>ERP &gt;  報表區 &gt;出缺勤紀錄表</b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-hover" id="">
                                <thead id="">
                                    <tr class="active">
                                        <th class="width20percent">
                                            <label>年:</label>
                                            <select id="year" class="form-control"></select>
                                        </th>
                                        <th class="width20percent">
                                            <label>月:</label>
                                            <select id="month" class="form-control">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                            </select>
                                        </th>
                                        <th class="width20percent">
                                            <button type="button" class="btn btn-info btn-flat" id="search">查詢</button>
                                            <button type="button" class="btn btn-danger btn-flat" id="offWork">簽退</button>
                                        </th>
                                    </tr>
                                </thead>
                            </table>
                            <div id="printArea">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>

        var attendanceRecordHandlerUrl_G = "attendanceRecordHandler.ashx";
        var commonHandlerUrl_G = "commonHandler.ashx";
        var StartWorkYear_G = 0;
        var StartWorkMonth_G = 0;
        var FirstTF_G = true;
        var FirstTF2_G = true;
        var getDay = function (str) {
            var strArr = str.split("/");
            var backStr = undefined;
            var d = new Date(strArr[0], parseInt(strArr[1]) - 1, strArr[2]);
            switch (d.getDay()) {
                case 0:
                    backStr = "日";
                    break;
                case 1:
                    backStr = "一";
                    break;
                case 2:
                    backStr = "二";
                    break;
                case 3:
                    backStr = "三";
                    break;
                case 4:
                    backStr = "四";
                    break;
                case 5:
                    backStr = "五";
                    break;
                case 6:
                    backStr = "六";
                    break;

            }
            return backStr;
        };
        var getYearHtmlTagOption = function (startYear) {
            if (startYear < 2011) {
                startYear = 2011;
            }
            var dateStr = date_M.getNowDate();
            var nowYear = parseInt(dateStr.split("/")[0]);
            var sb = new StringBuilder_M();
            for (i = startYear; i <= nowYear; i++) {
                sb.append("<option value='");
                sb.append(i);
                sb.append("'>");
                sb.append(i);
                sb.append("</option>")
            }
            append_M("#year", sb.toString());
            val_M("#year", nowYear);
            onChange_M("#year", getMonthHtmlTagOption);
            change_M("#year");

            if (FirstTF_G) {
                click_M("#search");
                FirstTF_G = false;
            }
        };
        var getMonthHtmlTagOption = function () {
            var dateStr = date_M.getNowDate();
            var startMonth = 1;
            var endMonth = 12;
            var selectYear = parseInt(val_M("#year"));
            var nowYear = parseInt(dateStr.split("/")[0]);
            var nowMonth = parseInt(dateStr.split("/")[1]);

            if (nowYear == selectYear) {
                endMonth = nowMonth;
                if (StartWorkYear_G == selectYear) {
                    startMonth = StartWorkMonth_G;
                }
            } else {
                if (StartWorkYear_G == selectYear) {
                    startMonth = StartWorkMonth_G;
                }
            }


            var sb = new StringBuilder_M();
            sb.append("<option value='0'>請選擇</option>")
            for (i = startMonth; i <= endMonth; i++) {
                sb.append("<option value='");
                sb.append(i);
                sb.append("'>");
                sb.append(i);
                sb.append("</option>")
            }
            empty_M("#month");
            append_M("#month", sb.toString());
            if (FirstTF2_G) {
                val_M("#month", nowMonth);
                FirstTF2_G = false;
            }
        };
        var getMCdata = function () {

            var data = "U_Num=" + U_Num_M + "&action=getMCdata";
            var success = function (back) {

                var json = jsonParse_M(back);
                var dateStr = json.SlimDate.split(' ');
                StartWorkYear_G = parseInt(dateStr[0].split('/')[0]);
                StartWorkMonth_G = parseInt(dateStr[0].split('/')[1]);
                getYearHtmlTagOption(StartWorkYear_G);
            };
            var error = function (e) { Log_M("getMCdata error=" + e); unBlockUI_M(); };

            ajax_M(commonHandlerUrl_G, data, success, error);
        };
        var getAttendanceRecord = function () {
            blockUI_M();
            var y = parseInt(val_M("#year"));
            var m = parseInt(val_M("#month"));
            var firstDay = date_M.getNowDate(new Date(y, m - 1, 1));
            var lastDay = date_M.getNowDate(new Date(y, m + 1, 0));

            var data = "U_Num=" + U_Num_M + "&firstDay=" + firstDay + "&lastDay=" + lastDay + "&U_MDEP=" + U_MDEP_M + "&action=getAttendanceRecord";
            var success = function (back) {
                if (isEmptyStr(back)) {
                    alert("查無打卡紀錄");
                } else {
                    empty_M("#printArea");
                    var json = jsonParse_M(back);

                    var sb = new StringBuilder_M();
                    var tempDateTimeArr = [];
                    var tempTimeArr = [];
                    var tempHour = undefined;
                    sb.append("<table class='table table-hover'>");
                    sb.append("<thead>");
                    sb.append("<tr class ='bgBlue'>");
                    sb.append("<th class='textAlignCenter'></th>");
                    sb.append("<th class='textAlignCenter'>日期</th>");
                    sb.append("<th class='textAlignCenter'>人員</th>");
                    sb.append("<th class='textAlignCenter'>班別</th>");
                    sb.append("<th class='textAlignCenter'>簽到</th>");
                    sb.append("<th class='textAlignCenter'>簽退</th>");
                    sb.append("<th class='textAlignCenter'>出勤狀態</th>");
                    sb.append("<th class='textAlignCenter'>異常時數</th>");
                    sb.append("<th class='textAlignCenter'>請假資料</th>");
                    sb.append("</tr>");
                    sb.append("</thead>");
                    sb.append("<tbody>");
                    $.each(json, function (i, v) {
                        if (v.MR_Date.split('/')[1] == m) {
                            if (v.MR_Item == "0005") {
                                sb.append("<tr class='bgYellow'>");
                            } else {
                                sb.append("<tr>");
                            }

                            sb.append("<td class='textAlignCenter'>");
                            sb.append(i + 1);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.MR_Date);
                            sb.append("(");
                            sb.append(getDay(v.MR_Date));
                            sb.append(")");
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(U_Name_M);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.MR_ItemName);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");

                            if (!isEmptyStr(v.MR_RSTime)) {
                                tempDateTimeArr = (v.MR_RSTime).split('-');
                                tempTimeArr = tempDateTimeArr[1].split(":");
                                if (tempDateTimeArr[0] == "下午") {
                                    if (tempTimeArr[0] != "12") {
                                        tempHour = parseInt(tempTimeArr[0]) + 12;
                                    } else {
                                        tempHour = tempTimeArr[0];
                                    }
                                } else {
                                    tempHour = tempTimeArr[0];
                                }
                                sb.append(tempHour);
                                sb.append(":");
                                sb.append(tempTimeArr[1]);
                            } else {
                                if (v.MR_Item == "0005") {
                                    sb.append("-------");
                                }
                            }

                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            if (!isEmptyStr(v.MR_RETime)) {
                                tempDateTimeArr = (v.MR_RETime).split('-');
                                tempTimeArr = tempDateTimeArr[1].split(":");
                                if (tempDateTimeArr[0] == "下午") {
                                    if (tempTimeArr[0] != "12") {
                                        tempHour = parseInt(tempTimeArr[0]) + 12;
                                    } else {
                                        tempHour = tempTimeArr[0];
                                    }
                                } else {
                                    tempHour = tempTimeArr[0];
                                }
                                sb.append(tempHour);
                                sb.append(":");
                                sb.append(tempTimeArr[1]);
                            } else {
                                if (v.MR_Item == "0005") {
                                    sb.append("-------");
                                }
                            }

                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            //if (v.MR_Item == "0005") {
                            //    sb.append("休假");
                            //} else {
                            //    sb.append("<span class='colorRed'>");
                            //    sb.append(v.EX_Status);
                            //    sb.append("</span>");
                            //}
                            sb.append("<span class='colorRed'>");
                            sb.append(v.EX_Status);
                            sb.append("</span>");
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            if (v.EX_Hour > 0) {
                                sb.append(v.EX_Hour);
                            }

                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v.EX_Reason);
                            sb.append("</td>");
                            sb.append("</tr>");
                        }

                    });
                    sb.append("</tbody>");
                    sb.append("</table>");
                    append_M("#printArea", sb.toString());
                    unBlockUI_M();
                }

            };
            var error = function (e) { Log_M("getAttendanceRecord error=" + e); unBlockUI_M(); };

            ajax_M(attendanceRecordHandlerUrl_G, data, success, error);
        };

        var offWork = function () {
            blockUI_M();
            var data = "U_Num=" + U_Num_M + "&action=offWork";
            var success = function (back) {
                if (back == "成功") {
                    location.reload();

                }
            };
            var error = function (e) { Log_M("offWork error=" + e); unBlockUI_M(); };

            ajax_M(attendanceRecordHandlerUrl_G, data, success, error);
        };
        $(function () {
            getMCdata();
            onClick_M("#search", getAttendanceRecord);
            onClick_M("#offWork", offWork);
        })
    </script>
</asp:Content>

