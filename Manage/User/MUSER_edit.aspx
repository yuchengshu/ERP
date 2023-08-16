<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MUSER_edit.aspx.cs" Inherits="Manage_User_MUSER_edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper" style="min-height: 616px;">
        <!-- Content Header (Page header) -->
        <section class="content-header"></section>
        <!-- Main content -->
        <section class="content">
            <!-- Main row -->
<%--            <select id="selectId">
                <option value="firstEl">First Element</option>
                <option value="secondEl">Second Element</option>
            </select>
            <select id="SelectDept2">
            </select>--%>
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-danger">
                        <div class="box-header">
                            <%--<i class="fa fa-list-alt"></i>--%>
                            <h1 class="box-title"></h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div style="text-align: center">

                                <div id="main">
                                    <%--新增使用者畫面--%>
                                    <div id="AddMUSERDataWindowDIV" class="divBorder">
                                        <!--新增使用者START-->
                                        <td align="center">
                                            <table width="98%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td align="left" valign="top" colspan="4">
                                                        <h3>&nbsp; 員工資料維護作業-修改</h3>
                                                    </td>

                                                    <td align="center" valign="top">
                                                        <table width="98%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td height="24"></td>
                                                            </tr>
                                                            <tr>
                                                                <td height="24"></td>
                                                            </tr>
                                                        </table>
                                                    </td>


                                                    <tr class="12-k">
                                                        <td colspan="4" align="center" bgcolor="e5e5e5">基本資料</td>
                                                    </tr>

                                                <tr class="12-k" bgcolor="#F7F6F3">
                                                    <td width="15%" align="right">員工編號：</td>
                                                    <td width="35%">
                                                        <input type="text" id="U_Num" maxlength="10">
                                                        <%--原始系統預設內容--%>
                                                        <%--<%="A"&right((year(date())-1911),2)&right("0"&month(date),2)&right("0"&day(date),2)&"1"%>> --%>
                                                    </td>
                                                    <td width="15%" align="right">姓名：</td>
                                                    <td width="35%">
                                                        <input type="text" id="U_Name" maxlength="10">
                                                    </td>

                                                </tr>

                                                <tr class="12-k" bgcolor="#F7F6F3">
                                                    <td align="right">密碼：</td>
                                                    <td width="35%">
                                                        <input type="text" id="U_PWD" maxlength="10">
                                                        <%--<td><input type="password" name="U_PWD"  maxlength="30" class="box"  --%>
                                                    </td>
                                                    <td align="right">密碼確認：</td>
                                                    <td width="35%">
                                                        <input type="text" id="U_PWD_CHECK" maxlength="10">
                                                        <%--<td><input type="password" name="U_PWD_CHECK"  maxlength="30" class="box" ></td>--%>
                                                </tr>
                                                <%-- 所屬部門--%><%--所屬公司--%>
                                                <tr class="12-k" bgcolor="#F7F6F3">
                                                    <td align="right">所屬部門：</td>
                                                    <td>

                                                        <select id="SelectDept">
                                                        </select>
                                                    </td>
                                                    <td align="right">所屬公司：</td>
                                                    <td>

                                                        <select id="SelectCom"></select>


                                                    </td>
                                                </tr>
                                                <%--代理人--%><%--部門主管--%>
                                                <tr class="12-k" bgcolor="#F7F6F3">
                                                    <td align="right">代理人：</td>
                                                    <td>

                                                        <input type="text" name="U_AgentNum" id="U_AgentNum" maxlength="10">
                                                        <button type="button" id="AgentNameSelectDataWindowBtn" class="btn btn-primary btn-flat addPer">..</button>
                                                        <input type="text" name="U_AgentName" id="U_AgentName" maxlength="10">
                                                        <input type="text" name="U_AgentComLand" id="U_AgentComLand" maxlength="10">
                                                    </td>
                                                    <td align="right">部門主管：</td>
                                                    <td>
                                                        <input type="text" name="U_LeaderNum" id="U_LeaderNum" maxlength="10">
                                                        <button type="button" id="LeaderNameDataWindowBtn" class="btn btn-primary btn-flat addPer">..</button>
                                                        <input type="text" name="U_LeaderName" id="U_LeaderName" maxlength="10">
                                                        <input type="text" name="U_LeaderComLand" id="U_LeaderComLand" maxlength="10">
                                                    </td>
                                                </tr>
                                                <tr class="12-k" bgcolor="#F7F6F3">
                                                    <td width="15%" align="right">等級：</td>
                                                    <td width="35%">
                                                        <select id="SelectLevel">
                                                        </select>

                                                    </td>
                                                    <td width="15%" align="right">職稱：</td>
                                                    <td width="35%">
                                                        <select id="SelectPosit">
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr class="12-k" bgcolor="#F7F6F3">
                                                    <td width="15%" align="right">磁卡號碼：</td>
                                                    <td width="35%">
                                                        <input type="text" name="U_Card" id="U_Card" maxlength="10">
                                                    </td>
                                                    <td width="15%" align="right">分機號碼：</td>
                                                    <td width="35%">
                                                        <input type="text" name="U_Tel" id="U_Tel" maxlength="10">
                                                    </td>
                                                    <td></td>
                                                </tr>

                                                <tr class="12-k" bgcolor="#F7F6F3">
                                                    <td align="right">電子郵件：</td>
                                                    <td>
                                                        <input type="text" name="U_Email" id="U_Email" maxlength="10">
                                                    </td>
                                                    <td align="right">是否打卡：</td>
                                                    <td>
                                                        <input type="checkbox" id="PunchCard_tag" class="PunchCard_tag" name="PunchCard_tag" size="60" maxlength="100">
                                                    </td>
                                                </tr>
                                                <tr class="12-k" bgcolor="#F7F6F3">

                                                    <td align="right">到職日：</td>
                                                    <td>
                                                        <input class="form-control datepicker addCustomerDataInput" id="SlimDate">
                                                    </td>
                                                    <td align="right">離職日：</td>
                                                    <td>

                                                        <input class="form-control datepicker addCustomerDataInput" id="LeaveDate">
                                                    </td>
                                                </tr>
                                                 <tr class="12-k" bgcolor="#E5E5E5">
                                                <td colspan="4" align="center">
                                                    <%-- <input type="submit" name="submit" class="btn" value="新增資料">--%>
                                                    <%--執行新增使用者動作--%>
                                                    <button type="button" class="btn btn-info btn-flat" id="saveMUSERDataClick">儲存</button>

                                                </td>
                                            </tr>
                                            <tr class="12-k" bgcolor="#E5E5E5">
                                                <td colspan="4" align="center">
                                                    <%-- <input type="submit" name="submit" class="btn" value="新增資料">--%>
                                                    <%--執行新增使用者動作--%>
                                                    <%--<button type="button" class="btn btn-info btn-flat" id="AddMUSERDataClick">新增</button></td>--%>
                                                    <input type="button" name="button" class="btn" value="回使用者列表" onclick="returntoMUSERquery()">
                                            </tr>
                                            </table>
                                        </td>
                                    </div>
                                </div>
                                <%--選擇代理人畫面--%>
                                <div id="AgentSelectWindowDIV1" class="divBorder startHide">
                                    <td align="center">
                                        <table width="98%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td align="left" valign="top" colspan="4">
                                                    <h3>選擇代理人</h3>
                                                </td>

                                                <td align="center" valign="top">
                                                    <table width="98%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td height="24"></td>
                                                        </tr>
                                                        <tr>
                                                            <td height="24"></td>
                                                        </tr>
                                                    </table>
                                                </td>

                                                <tr class="12-k">
                                                    <td colspan="4" align="center" bgcolor="e5e5e5">基本資料</td>
                                                </tr>
                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td width="30%" align="right">公司別：</td>
                                                <td width="70%">
                                                    <select id="SelectCom_Title1">
                                                    </select>
                                                    <%--<td><input type="password" name="U_PWD"  maxlength="30" class="box"  --%>
                                                </td>

                                            </tr>

                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td width="30%" align="right">部門：</td>
                                                <td width="70%">
                                                    <select id="SelectDept_Title1">
                                                    </select>
                                                    <%--<td><input type="password" name="U_PWD"  maxlength="30" class="box"  --%>
                                                </td>

                                            </tr>
                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td width="30%" align="right">姓名(代理人)：</td>
                                                <td width="70%">
                                                    <%--<input type="text" id="AgentName" maxlength="10">--%>
                                                    <select id="SelectAgentName">
                                                    </select>
                                                   
                                                </td>
                                                <td>
                                                    <button type="button" class="btn btn-info btn-flat searchAgentDataFuc qPer" id="searchAgentDataFuc">搜尋</button>

                                                </td>


                                            </tr>
                                            <%--20220919進度,資料帶回原畫面--%>
                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td class="textAlignCenter" colspan="2">
                                                    <button type="button" class="btn btn-primary btn-flat SendSelectAgentDataFuc form-control" id="SendSelectAgentDataFuc">送出</button>

                                                </td>
                                                <td colspan="2" align="center">
                                                    <input type="button" name="button" class="btn" value="回使用者列表" onclick="returntoMUSERquery()">
                                                </td>

                                            </tr>
                                        </table>
                                    </td>

                                </div>
                                <%--選擇部門主管畫面Start--%>
                                <div id="LeaderSelectWindowDIV1" class="divBorder startHide">
                                    <td align="center">
                                        <table width="98%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td align="left" valign="top" colspan="4">
                                                    <h3>選擇部門主管</h3>
                                                </td>

                                                <td align="center" valign="top">
                                                    <table width="98%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td height="24"></td>
                                                        </tr>
                                                        <tr>
                                                            <td height="24"></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <%--選擇部門主管--%>

                                            <tr class="12-k">
                                                <td colspan="4" align="center" bgcolor="e5e5e5">基本資料</td>
                                            </tr>
                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td align="right">公司別：</td>
                                                <td width="35%">
                                                    <select id="SelectCom_Title">
                                                    </select>
                                                    <%--<td><input type="password" name="U_PWD"  maxlength="30" class="box"  --%>
                                                </td>
                                                <td width="15%" align="right"></td>
                                                <td width="35%"></td>
                                            </tr>

                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td align="right">部門：</td>
                                                <td width="35%">
                                                    <select id="SelectDept_Title">
                                                    </select>
                                                    <%--<td><input type="password" name="U_PWD"  maxlength="30" class="box"  --%>
                                                </td>
                                                <td width="15%" align="right"></td>
                                                <td width="35%"></td>
                                            </tr>
                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td width="5%" align="right">姓名：</td>
                                                <td width="35%">
                                                    <select id="SelectLeaderName">
                                                    </select>
                                                </td>
                                                <td>
                                                    <button type="button" class="btn btn-info btn-flat searchLeaderDataFuc qPer" id="searchLeaderDataFuc">搜尋</button>

                                                </td>

                                            </tr>
                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td class="textAlignCenter" colspan="2">
                                                    <button type="button" class="btn btn-primary btn-flat SendSelectLeaderDataFuc form-control" id="SendSelectLeaderDataFuc">送出</button>

                                                </td>
                                                <td colspan="2" align="center">
                                                    <input type="button" name="button" class="btn" value="回使用者列表" onclick="returntoMUSERquery()">
                                                </td>

                                            </tr>
                                        </table>
                                    </td>

                                    <!--新增使用者END-->

                                    <!--新增使用者END-->

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <script src="<%=getRelativePath()%>js/pageList/muserPageList.js" type="text/javascript"></script>
    <script>
        var MuserQueryHandlerUrl_G = "/Manage/User/MUSERHandler.ashx";
        var MuserQueryDataJson_G = null;
        //var MENU_no_G = "<%=getMENU_no()%>";
        //var M_ID_G = "<%=getM_ID()%>"; //客戶會員編號
        var NowPage_G = 1;
        //總頁數
        var TotalPage_G = 0;
        //每頁資料筆數
        var CountPerPage_G = 30;
        var pageNumClick = function () {
            var thisText = $(this).text();
            var goNext = true;
            if (thisText == ">>" || thisText == "<<") {
                if (NowPage_G <= TotalPage_G && NowPage_G >= 1) {
                    if (thisText == ">>") {
                        NowPage_G += 1;
                    } else if (thisText == "<<") {
                        NowPage_G -= 1;
                    }
                } else {
                    goNext = false;
                }
            } else {
                var clickPage = parseInt(thisText);
                if (clickPage <= TotalPage_G && clickPage >= 1) {
                    NowPage_G = clickPage;
                } else {
                    goNext = false;
                }
            }
            if (goNext) {

                makeHtml();
            }
        };
        //取得使用者資料============================================================start
        //使用者員工編號
        //var U_Num_M = "<%=getU_Num()%>";
        //取得原有的資料內容!!!(20220913WORK!!!!)
        //取得下方分頁表列
        var getPageList = function () {
            $("#pageBar").empty();
            var startPageNum = NowPage_G - 5;
            if (startPageNum <= 0) {
                startPageNum = 1;
            }
            var showPageCount = 0;

            if (TotalPage_G >= 10) {
                showPageCount = 9;
            } else {
                showPageCount = TotalPage_G - 1;
            }

            var sb = new string_M.StringBuilder();
            //20220912mark
            //if (NowPage_G > 1) {
            //    sb.append("<span class='pageList pageNum'><a class='qPer' href='#'><<</a></span>");
            //}

            //for (var i = 0; i <= showPageCount; i++) {
            //    sb.append("<span class='pageList pageNum'><a class='qPer'  href='javascript: void(0)'>");
            //    sb.append(startPageNum);
            //    sb.append("</a></span>");
            //    startPageNum += 1;
            //}

            ////if (NowPage_G < TotalPage_G) {
            ////    sb.append("<span class='pageList pageNum'><a class='qPer' href='#'>>></a></span>");
            ////}

            //$("#pageBar").append(sb.toString());
            //append_M("#pageBar", sb.toString());
            //empty_M("#pageNum");
            ////$("#pageNum").empty();
            //append_M("#pageNum", NowPage_G + "/" + TotalPage_G);
            ////$("#pageNum").append(NowPage_G + "/" + TotalPage_G);
            //onClick_M(".pageNum", pageNumClick);
            ////$(".pageNum").on("click", pageNumClick);
            if (NowPage_G > 1) {
                sb.append("<span class='pageList pageNum'><a class='qPer' href='#'><<</a></span>");
            }

            for (var i = 0; i <= showPageCount; i++) {
                sb.append("<span class='pageList pageNum'><a class='qPer'  href='javascript: void(0)'>");
                sb.append(startPageNum);
                sb.append("</a></span>");
                startPageNum += 1;
            }

            if (NowPage_G < TotalPage_G) {
                sb.append("<span class='pageList pageNum'><a class='qPer' href='#'>>></a></span>");
            }

            //$("#pageBar").append(sb.toString());
            append_M("#pageBar", sb.toString());
            empty_M("#pageNum");
            //$("#pageNum").empty();
            append_M("#pageNum", NowPage_G + "/" + TotalPage_G);
            //$("#pageNum").append(NowPage_G + "/" + TotalPage_G);
            onClick_M(".pageNum", pageNumClick);
            //$(".pageNum").on("click", pageNumClick);
        };
        //afterSuccFunc3
        var afterSuccFunc3 = function () {
            alert('!!');
            onChange_M("#MP", function () {
                var type = val_M("#MP");
                $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#MP_Item", type, "option");
                ////取得[鄉鎮區市]
                //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "TownShip", "option");
            });
        };
        //var afterSuccessFuc = function () {
        //    onChange_M("#MP", function () {
        //        var type = val_M("#MP");
        //        $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#MP_Item", type, "option");
        //        ////取得[鄉鎮區市]
        //        //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "TownShip", "option");
        //    });
        //};
        //取得總頁數
        var getTotalPage = function (count) {
            var pageCount = count / CountPerPage_G;
            var pageCount1 = Math.floor(pageCount);
            var remainder = count % CountPerPage_G;
            if (remainder > 0) {
                pageCount1 += 1;
                pageCount = pageCount1;
            }
            return pageCount;
        };
        //生成資料畫面(20220726)
        //var makeHtml = function () {
        //    $("#muserData").empty();
        //    if (MuserQueryDataJson_G.length != 0) {
        //        var sb = new string_M.StringBuilder();
        //        var n = 0;
        //        var startCount = (NowPage_G - 1) * 30 + 1;
        //        var endCount = 30 * NowPage_G;
        //        var isMember = false;
        //        $.each(MuserQueryDataJson_G, function (i, v) {
        //            n += 1;
        //            if (n >= startCount && n <= endCount) {
        //                sb.append("<tr><th class='text-center'>");
        //                sb.append(v.U_Num);//員工編號
        //                sb.append("</th><th class='text-center'>");
        //                sb.append(v.U_Name);//姓名
        //                /* sb.append("");*/
        //                sb.append("</th><th class='text-center'>");
        //                sb.append(v.U_Item);//職稱
        //                sb.append("</th><th class='text-center'>");
        //                sb.append(v.DEPAR);//主要部門
        //                //if (v.N_Call_tag == "1") {
        //                //    sb.append("<img style='width:25px;height:25px;' src=/img/icon/nocall.jpg alt=請勿聯絡>");
        //                //} else {
        //                //    sb.append(v.ddesc);
        //                //}
        //                sb.append("</th><th class='text-center'>");
        //                sb.append("<a class='' ");
        //                sb.append("'>");
        //                sb.append(v.ComLand);//所屬公司
        //                //sb.append("</a></th><th class='text-center'>");
        //                sb.append("</a></th><th class='text-center'>");
        //                sb.append(v.U_Tel);//分機
        //                sb.append("</th><th class='text-center'><a target='_blank' href='/Manage/User/Permission/MFUNT_report.aspx?U_Num=");//首頁權限網址
        //                sb.append(v.U_Num);//員工編號
        //                //sb.append("首頁權限");//首頁權限
        //                //sb.append("'>首頁權限</th><th class='text-center'>");
        //                sb.append("'>首頁權限");
        //                sb.append("</th><th class='text-center'><a target='_blank' href='/Manage/User/Permission/MUSER_MenuSetup.aspx?U_Num=");//選單權限網址
        //                sb.append(v.U_Num);//員工編號
        //                //sb.append("首頁權限");//首頁權限
        //                //sb.append("'>首頁權限</th><th class='text-center'>");
        //                sb.append("'>選單權限");
        //                sb.append("</th><th class='text-center'><a target='_blank' href='/Manage/Report/MREPO_query.aspx?U_Num=");//報表權限網址
        //                sb.append(v.U_Num);//員工編號
        //                //sb.append("首頁權限");//首頁權限
        //                //sb.append("'>首頁權限</th><th class='text-center'>");
        //                sb.append("'>報表權限");
        //                sb.append("</th><th class='text-center'><a target='_blank' href='/Manage/Report/Permission/MREPO_query.aspx?U_Num=");//分析師產品權限網址
        //                sb.append(v.U_Num);//員工編號
        //                //sb.append("首頁權限");//首頁權限
        //                //sb.append("'>首頁權限</th><th class='text-center'>");
        //                sb.append("'>分析師產品權限");
        //                sb.append("</th><th class='text-center'><a target='_blank' href='/Manage/User/Permission/MFUNT_report.aspx?U_Num='");
        //                sb.append(v.U_Num);//員工編號
        //                sb.append("</th>");
        //                sb.append("</td > <td class='textAlignCenter'><a href='#' class='openDiv' openDivName='#editCallRecordDetailDiv' thisId='");
        //                sb.append("'>修</a></th>");
        //                //if (v.OTel != "") {
        //                //    sb.append("AA");
        //                //    sb.append("-");
        //                //    sb.append(v.OTel);
        //                //    if (v.OTel_Sub != "") {
        //                //        sb.append("#");
        //                //        sb.append(v.ComLand);
        //                //    }
        //                //}
        //                //if (v.OTel != "") {
        //                //    sb.append(v.ComLand);
        //                //    sb.append("-");
        //                //    sb.append(v.ComLand);
        //                //    if (v.OTel_Sub1 != "") {
        //                //        sb.append("#");
        //                //        sb.append(v.ComLand);
        //                //    }
        //                //}
        //                //sb.append("<th class='text-center'>");

        //                //if (v.HTel != "") {
        //                //    sb.append(v.HTel_Zone);
        //                //    sb.append("-");
        //                //    sb.append(v.HTel);
        //                //}
        //                //if (v.HTel1 != "") {
        //                //    sb.append(v.HTel_Zone1);
        //                //    sb.append("-");
        //                //    sb.append(v.HTel1);
        //                //}
        //                //sb.append("</th><th class='text-center'>");
        //                //sb.append(v.add_date);
        //                sb.append("</th>");
        //                sb.append("<th class='text-center'><a href='#' class='deleteCustomerData delPer' MID='");
        //                sb.append(v.M_ID);
        //                sb.append("'>刪</a></th>");
        //                sb.append("</tr>");
        //            }
        //        });


        //        TotalPage_G = getTotalPage(n);
        //        //alert('append_M("#customerData", sb.toString());');
        //        append_M("#muserData", sb.toString());
        //        // $("#customerData").append(sb.toString());
        //        onClick_M(".deleteCustomerData", function () {
        //            var MID = $(this).attr("MID");
        //            var r = confirm("刪除後資料將無法恢復，確定刪除?");
        //            console.log(r);
        //            if (r == true) {
        //                deleteCustomerData(MID);
        //            }

        //        });
        //        /*$(".deleteCustomerData").on("click", function () {
        //            var MID = $(this).attr("MID");
        //            var r = confirm("刪除後資料將無法恢復，確定刪除?");
        //            console.log(r);
        //            if (r == true) {
        //                deleteCustomerData(MID);
        //            }

        //        });*/
        //    } else {
        //        alert("查無資料");
        //        NowPage_G = 1;
        //        TotalPage_G = 1;
        //    }
        //    //製作頁數列表
        //    getPageList();

        //    //頁面解鎖
        //    unBlockUI_M();
        //};
        var IP_G = "<%=getIP()%>";
        //scriptH
        var MuserQueryHandlerUrl_G = "/Manage/User/MUSERHandler.ashx";
        var jsonParse_M = function (str) {
            return JSON.parse(str);
        };
        //傳送資料 ajax_M
        //var ajax_M = function (url, data, success, error) {
        //    /* alert('call customerManageHandler!!!!!'+url);*/
        //    $.ajax({
        //        url: url,
        //        data: data,
        //        method: 'POST',
        //        success: success,
        //        error: error
        //    });
        //};
        var returntoMUSERquery = function () {
            //$("#U_AgentNum").attr("value", "12345");
            //window.open('', '_self', ''); window.close();//IE、Chrome、Safari均可關閉視窗。
            //document.location.href = "/Managve/User/MUSER_query.aspx";//員工資料維護作業 
            //window.open('', '_self', ''); window.close();//IE、Chrome、Safari均可關閉視窗。
            //alert('openAddMCMSFTFDataWindow');
            //hide_M("#customerAdvSearchDiv");
            //hide_M("#customerDataTab");
            ////show_M("#AddMCMSFTFDataWindow");
            //hide_M("#todayContactTab");
            //show_M("#pageBar");
            //show_M('#main');
            ////"#AddMUSERDataWindowDIV"
            //hide_M("#AddMUSERDataWindowDIV");
            ////
            //alert('!!');
            //alert('openAddMCMSFTFDataWindow');
            //show_M("#customerAdvSearchDiv");
            //show_M("#customerDataTab");
            ////show_M("#AddMCMSFTFDataWindow");
            ////hide_M("#todayContactTab");
            //show_M("#customerAdvSearchDiv");
            //show_M("#customerDataTab");
            ////show_M("#AddMCMSFTFDataWindow");
            //show_M("#todayContactTab");
            //show_M("#pageBar");
            show_M('#main');
            hide_M("#LeaderSelectWindowDIV1");
            hide_M("#AgentSelectWindowDIV1");
            show_M("#customerAdvSearchDiv");
            //alert('return!!!!!!@@@!!!!!!');
            show_M("AddMUSERDataWindowDIV");

        };
        //打開新增使用者視窗========================start
        var openAddMUSERDataWindow = function () {
            //alert('!!');
            //alert('openAddMCMSFTFDataWindow');
            hide_M("#customerAdvSearchDiv");
            hide_M("#customerDataTab");
            //show_M("#AddMCMSFTFDataWindow");
            //hide_M("#todayContactTab");
            hide_M("#customerAdvSearchDiv");
            hide_M("#customerDataTab");
            //show_M("#AddMCMSFTFDataWindow");
            hide_M("#todayContactTab");
            hide_M("#pageBar");
            hide_M('#main');
            show_M("#AddMUSERDataWindowDIV");
            // show_M("#customerAdvSearchDiv");
        };
        //打開新增使用者視窗========================end
        //按下[新增(新增使用者)]按鈕後
        //將頁面的值傳給後端處理
        //var keyWord = val_M("#keyWord");//val_M("#keyWord");
        //儲存畫面欄位
        var savemuserData = function () {
            //(sessionStorage["First"]="T"
            //sessionStorage["Modify"] = "T";//進行儲存動作
            //alert(sessionStorage["First"]);
            //alert('Save!!');
            //對畫面欄位取值(20220919)
            //代理人員工編號U_AgentNum
            //代理人員工姓名U_AgentName
            //代理人員工部門U_AgentComLand
            //部門主管員工編號U_AgentNum
            //部門主管員工姓名U_AgentName
            //部門主管員工部門U_AgentComLand
            //部門主管
            //PunchCard_tag_Value:是否打卡PunchCard_tag
            var PunchCard_tag_Value = $CommonTool.checkbox.getAllValue(".PunchCard_tag");//是否打卡是否勾選(有勾選擇為on)
            if (PunchCard_tag_Value == "on") {
                var PunchCard_tag_Value_Value = 1;
                //alert("是否打卡是否勾選.PunchCard_tag_Value:" + PunchCard_tag_Value + "__" + "是");//有勾選為1,沒有勾選為0
            }
            else {
                var PunchCard_tag_Value_Value = 0;
                //alert(".PunchCard_tag_Value:" + PunchCard_tag_Value + "__" + PunchCard_tag_Value_Value);

            }
            var SlimDate = $("#SlimDate").val();//到職日(StartDate)
            var LeaveDate = $("#LeaveDate").val();//離職日(LeaveDate)
            //var add_same = $CommonTool.checkbox.getAllValue(".add_same");//同戶籍地址是否勾選(有勾選擇為on)
            //var add_same_value = val_M(document.getElementsByClassName('add_same'));//有勾選為1,沒有勾選為0
            //alert(add_same_value)
            //if (add_same == "on") {
            //    var add_same_Value = 1;
                //alert("同戶籍地址是否勾選.add_same:" + add_same + "__" + "是");
            //}
            //else {
            //    var add_same_Value = 0;
            //    //alert(".add_same:" + add_same + "__" + add_same_Value);

            //}
            //var License_I = $CommonTool.checkbox.getAllValue(".License_I");//有勾選擇為on(投信投顧業務員)//有勾選為1,沒有勾選為0
            //if (License_I == "on") {
            //    var License_I_Value = 1;//有勾選為1,沒有勾選為0
                //alert(License_I);
            //}
            //else {
            //   var License_I_Value = 0;//有勾選為1,沒有勾選為0
                //alert(License_I);
            //}
            //var License_A = $CommonTool.checkbox.getAllValue(".License_A");//證券分析師//有勾選為1,沒有勾選為0
            //alert(License_A);//證券分析師
            //if (License_A == "on") {
            //   var License_A_Value = 1;//有勾選為1,沒有勾選為0
                //alert(License_A);
            //}
            //else {
            //    var License_A_Value = 0;//有勾選為1,沒有勾選為0
                //alert(License_A);
            //}
            //對畫面欄位取值
            //基本資料
            //=========================
            var EmployID = $("#U_Num").val();//員工編號(EmployID)
            var EmployNAME = $("#U_Name").val();//員工姓名(EmployID)
            var U_PWD = $("#U_PWD").val();////密碼U_PWD
            var U_PWD_CHECK = $("#U_PWD_CHECK").val(); //密碼確認U_PWD_CHECK
            var SelectDept = $("#SelectDept").val();//所屬部門
            var SelectCom = $("#SelectCom").val();//所屬公司
            var SelecrCom_Text = $("#SelectCom option:selected").text();
            //代理人U_Agent
            var U_AgentNum = $("#U_AgentNum").val();//代理人員工編號
            var U_AgentName = $("#U_AgentName").val();//代理人員工姓名
            var U_AgentComLand = $("#U_AgentComLand").val();//代理人公司編號
            ////代理人部門名稱
            ////var U_AgentComLandName=
            var U_LeaderNum = $("#U_LeaderNum").val();//部門主管員工編號
            var U_LeaderName = $("#U_LeaderName").val();//部門主管員工姓名
            var U_LeaderComLand = $("#U_LeaderComLand").val();//部門主管公司編號
            //部門主管部門名稱
            //部門主管U_Leader
            var SelectLevel = $("#SelectLevel").val();//等級
            var SelectPosit = $("#SelectPosit").val();//職稱
            var U_Card = $("#U_Card").val();//磁卡號碼
            var U_Tel = $("#U_Tel").val();//分機號碼
            var U_Email = $("#EMail").val();//電子郵件EMail
            //var PunchCard_tag = val_M("#PunchCard_tag");//是否打卡(PunchCard_tag)
            var PunchCard_tag = PunchCard_tag_Value_Value;
            //var BirthDayDate = datePickDateTOsqlDate_M(val_M("#BirthDayDate"));//員工生日
            var SlimDate = $("#SlimDate").val();//到職日(StartDate)
            var LeaveDate = $("#LeaveDate").val();//離職日(LeaveDate)
            //=========================
            //詳細資料
            //=========================
            var U_PID = val_M("#U_PID");//身分證字號
            //var BirthDay_Date = datePickDateTOsqlDate_M(val_M("#BirthDay_Date"));//出生年月日BirthDay_Date
            //var School_Name1 = val_M("#School_Name1");//教育程度1[學校名稱]School_Name1
            //var School_Dep1 = val_M("#School_Dep1");//教育程度1[院系科別]School_Dep1
            //var School_Grd1 = val_M("#School_Grd1");//教育程度1[畢業或肄業]School_Grd1
            //var School_Name2 = val_M("#School_Name2");//教育程度2[學校名稱]
            //var School_Dep2 = val_M("#School_Dep2");//教育程度2[院系科別]
            //var Schol_Grd2 = val_M("#School_Grd2");//教育程度2[畢業或肄業]
            //var School_Name3 = val_M("#School_Name3");//教育程度3[學校名稱]
            //var School_Dep3 = val_M("#School_Dep3");//教育程度3[院系科別]
            //var School_Grd3 = val_M("#School_Grd3");//教育程度3[畢業或肄業]

            //var Be_Com1 = val_M("#Be_Com1");//重要經歷1[服務機關]Be_Com1
            //var Be_Job1 = val_M("#Be_Job1"); //重要經歷1[職位]Be_Job1
            //var Be_Res1 = val_M("#Be_Res1");//重要經歷1[工作內容]Be_Res1
            //var Be_Date1 = val_M("#Be_Date1"); //重要經歷1[任職期間]Be_Date1
            //var Be_Leave1 = val_M("#Be_Leave1"); //重要經歷1[離職原因]Be_Leave1
            //var Be_Salary1 = val_M("#Be_Salary1");  //重要經歷1[薪給]Be_Salary1

            //var Be_Com2 = val_M("#Be_Com2");//重要經歷2[服務機關]Be_Com2
            //var Be_Job2 = val_M("#Be_Job2");//重要經歷2[職位]Be_Job2
            //var Be_Res2 = val_M("#Be_Res2");//重要經歷2[工作內容]Be_Res2
            //var Be_Date2 = val_M("#Be_Date2");//重要經歷2[任職期間]Be_Date2
            //var Be_Leave2 = val_M("#Be_Leave2"); //重要經歷2[離職原因]Be_Leave2
            //var Be_Salary2 = val_M("#Be_Salary2");//重要經歷2[薪給]Be_Salary2

            //var Be_Com3 = val_M("#Be_Com3");//重要經歷3服務機關]Be_Com3
            //var Be_Job3 = val_M("#Be_Job3");//重要經歷3服務機關]Be_Com3
            //var Be_Res3 = val_M("#Be_Res3"); //重要經歷3[工作內容]Be_Res3
            //var Be_Date3 = val_M("#Be_Date3");//重要經歷2[任職期間]Be_Date3
            //var Be_Leave3 = val_M("#Be_Leave3");//重要經歷3[離職原因]Be_Leave3
            //var Be_Salary3 = val_M("#Be_Salary3");//重要經歷2[薪給]Be_Salary3



            //var License_Detail = val_M("#License_Detail");
            //var SelectCounty = val_M("#SelectCounty");//戶籍地址[縣市]
            //var SelectTownShip = val_M("#SelectTownShip");//戶籍地址[鄉鎮市區]
            //var CountyNow = val_M("#CountyNow");//現居住所[縣市]
            ////現居住所[鄉鎮市區]
            //var ZipCode = val_M("#ZipCode");//戶籍地址[郵遞區號]
            //var HAddress = val_M("#HAddress")
            //if (add_same_Value = 1) {
            //    var CountyNow = SelectCounty;
            //    var SelectTownShipNow = SelectTownShip
            //    var ZipCode_Now = ZipCode;
            //    var HAddress_Now = HAddress;
            //}
            //else {
            //    var CountyNow = val_M("#CountyNow"); //現居住所[縣市]
            //    var SelectTownShipNow = val_M("#SelectTownShipNow"); //現居住所[鄉鎮市區]
            //    var ZipCode_Now = val_M("#ZipCode_Now");//現居住所[郵遞區號]
            //    var HAddress_Now = val_M("#HAddress_Now");//現居住所[地址]
            //}
            //var HTel_Zone = val_M("#HTel_Zone");//住宅聯絡電話區碼
            //var HTel = val_M("#HTel"); //住宅聯絡電話
            //var HMobile = val_M("#HMobile");//聯絡手機
            //var ETel_Zone = val_M("#ETel_Zone");//緊急聯絡電話區碼
            //var ETel = val_M("#ETel");//緊急聯絡電話
            //var EMobile = val_M("#EMobile");//緊急聯絡人手機
            //var BankCode_Text = val_M("#BankCode_Text"); //銀行帳號(代碼)
            //var BankCode_Value = val_M("#BankCode_Value");//銀行帳號(名稱)
            //var BankCodeName = val_M("#BankCodeName"); //銀行帳號(帳號)
            //var Note = val_M("#Note"); //備註

            //var OCity = val_M("#OCity");
            //var OTown = val_M("#OTown");
            //var OAddress = val_M("#OAddress");
            //要傳入ashx的內容(要更新的資料內容)
            var data =
                //基本資料
                //=========================
                "EmployID=" + EmployID//員工編號(EmployID)=>U_Num
                + "&EmployNAME=" + EmployNAME//員工姓名(EmployID)
                + "&U_PWD=" + U_PWD// $("#U_PWD").val();////密碼U_PWD
                + "&U_PWD_CHECK=" + U_PWD_CHECK// $("#U_PWD_CHECK").val(); //密碼確認U_PWD_CHECK
                + "&SelectDept=" + SelectDept// val_M("#SelectDept");//所屬部門
                + "&SelectCom=" + SelectCom// val_M("#SelectCom");//所屬公司(
                //+ "&SelecrCom_Text=" + SelecrCom_Text// val_M("#SelectCom");//所屬公司(中文名稱)
                + "&SelectLevel=" + SelectLevel// val_M("#SelectLevel");//等級
                + "&SelectPosit=" + SelectPosit// val_M("#SelectPosit");//職稱
                + "&U_Card=" + U_Card// val_M("#U_Card");//磁卡號碼
                + "&U_Tel=" + U_Tel// val_M("#U_Tel");//分機號碼
                + "&EMail=" + U_Email// val_M("#EMail");//電子郵件EMail
                + "&PunchCard_tag=" + PunchCard_tag// val_M("#PunchCard_tag");//是否打卡(PunchCard_tag)
                + "&SlimDate=" + SlimDate// datePickDateTOsqlDate_M(val_M("#StartDate"));//到職日(StartDate)
                + "&LeaveDate=" + LeaveDate// datePickDateTOsqlDate_M(val_M("#LeaveDate"));//離職日(LeaveDate)
                //+ "&BirthDayDate" + BirthDayDate//員工生日
                //=========================
                //代理人資料
                //代理人員工編號U_AgentNum
                //代理人員工姓名U_AgentName
                //代理人員工部門U_AgentComLand
                //=========================
                + "&U_AgentNum=" + U_AgentNum
                + "&U_AgentName=" + U_AgentName
                + "&U_AgentComLand=" + U_AgentComLand
                //部門主管資料
                //部門主管編號U_AgentNum
                //部門主管姓名U_AgentName
                //部門主管部門U_AgentComLand
                //=========================
                + "&U_LeaderNum=" + U_LeaderNum
                + "&U_LeaderName=" + U_LeaderName
                + "&U_LeaderComLand=" + U_LeaderComLand
                //詳細資料
                //=========================
                + "&U_PID=" + U_PID// val_M("#U_PID");//身分證字號
                
                + "&action=updateEditMuserData";
           
            var success = function (back) {
                alert('更新員工資料成功!')
            };
            var error = function (e) { Log_M("updateEditMuserData error=" + e); unBlockUI_M(); };
            //alert(data);
            ajax_M(MuserQueryHandlerUrl_G, data, success, error);
            //20220906待修改!!!
            /*
             var data = "MS_Title=" + MS_Title
                + "&MS_Sender=" + U_Num_M
                + "&MS_Receiver=" + MS_Receiver
                + "&MS_Text=" + MS_Text
                + "&add_User=" + U_Num_M
                + "&add_ip=" + IP_M
                + "&action=addMailData";
                var success = function (back) {
                var file1 = undefined;
                var file2 = undefined;
                var file3 = undefined;
                //進行上傳檔案動作
                if (!isEmptyStr(back)) {
                    file1 = document.getElementById("File1").files;
                    if (file1.length != 0) {
                        upload("File1", back);
                    }
                    file2 = document.getElementById("File2").files;
                    if (file2.length != 0) {
                        upload("File2", back);
                    }
                    file3 = document.getElementById("File3").files;
                    if (file3.length != 0) {
                        upload("File3", back);
                    }
                }
                hide_M("#addMailDiv");
                alert("新增郵件成功");
                unBlockUI_M();
                show_M("#mailDataTab");
            };
            var error = function (e) { Log_M("addMailData error=" + e); unBlockUI_M(); };
            ajax_M(MuserQueryHandlerUrl_G, data, success, error);
            
             */
        }
        //按下查詢紐
        var searchCustomerData = function () {
            alert('searchCustomerData');
            alert('Search!!');
            $("#muserData").empty();
            var keyWord = val_M("#keyWord");//val_M("#keyWord");
            //取得公司別
            var Com = val_M("#SelectCom_Title");
            // var adver_depart_id = val_M("#abcAttach_MDEP");//發佈部門代號(查詢條件)
            //取得部門
            var Dept = val_M("#SelectDept_Title");
            var data = "Dept=" + Dept + "&Com=" + Com + "&keyWord=" + keyWord + "&action=getMUSERData";//取得員工資料維護作業
            var success = function (back) {
                var json = jsonParse_M(back);
                $("#muserData").empty();
                alert('Empty!!');
                MuserQueryDataJson_G = json;//取回的資料內容
                if (back != "成功") {
                    $("#muserData").empty();
                    makeHtml();//生成畫面
                }
            };
            var error = function (e) { Log_M("searchCustomerData error=" + e); unBlockUI_M(); };
            alert(data);
            ajax_M(MuserQueryHandlerUrl_G, data, success, error);
        }
        //SendSelectUSERDataFuc
        var SendSelectAgentDataFuc = function () {
            $selecttext = $(this).find(':selected').text();
            var SelectAgentName_Value = val_M("#SelectAgentName");//所選的員工代碼
            var SelectAgentName_Text = $("#SelectAgentName").find("option:selected").text();//所選的員工名稱
            var SelectAgentComLand = $("#SelectCom_Title1").find("option:selected").text();//所選的員工公司別
            //var AgentName = $("SelectAgentName").find("option:selected").text();
            //$("#ddlregtype").find("option:selected").text();
            //alert('!!');
            alert(SelectAgentName_Value);
            alert(SelectAgentName_Text);
            $("#U_AgentNum").attr("value", SelectAgentName_Value);
            $("#U_AgentName").attr("value", SelectAgentName_Text);
            $("#U_AgentComLand").attr("value", SelectAgentComLand);
            returntoMUSERquery()
            //alert('搜尋代理人')
            //alert('searchAgentData');
            //var SelectCom_Title1 = val_M("#SelectCom_Title1");//取得公司別
            //var SelectDept_Title1 = val_M("#SelectDept_Title1");//取得部門
            //alert(SelectCom_Title1);
            //alert(SelectDept_Title1);
            // //選擇銀行:SelectBank
            //getListHtmlTagOption: function (ul, idOrClassName, listType, htmlTagType, BankKeyWord)
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectBank", "Bank", "option", BankKeyword);
            //傳入條件(公司別,部門)取得姓名填入條件(SelectCom_Title1,SelectDept_Title1)(SelectAgentName)
            //$Common.MITEM.getAgentListHtmlTagOption(CommonHandlerUrl_M, "#SelectAgentName", "Bank", "option", SelectCom_Title1, SelectDept_Title1);
        }
        var SendSelectLeaderDataFuc = function () {
            $selecttext = $(this).find(':selected').text();
            var SelectLeaderName_Value = val_M("#SelectLeaderName");//所選的員工代碼
            var SelectLeaderName_Text = $("#SelectLeaderName").find("option:selected").text();//所選的員工名稱
            //var SelectAgentName_Text = $("#SelectAgentName").find("option:selected").text();//所選的員工名稱
            var SelectLeaderComLand = $("#SelectCom_Title").find("option:selected").text();//所選的長官公司別
            //var AgentName = $("SelectAgentName").find("option:selected").text();
            //$("#ddlregtype").find("option:selected").text();
            //alert('!!');
            alert(SelectLeaderName_Value);//員工編號
            alert(SelectLeaderName_Text);//員工姓名
            $("#U_LeaderNum").attr("value", SelectLeaderName_Value);
            $("#U_LeaderName").attr("value", SelectLeaderName_Text);
            $("#U_LeaderComLand").attr("value", SelectLeaderComLand);
            returntoMUSERquery()
            //alert('搜尋代理人')
            //alert('searchAgentData');
            //var SelectCom_Title1 = val_M("#SelectCom_Title1");//取得公司別
            //var SelectDept_Title1 = val_M("#SelectDept_Title1");//取得部門
            //alert(SelectCom_Title1);
            //alert(SelectDept_Title1);
            // //選擇銀行:SelectBank
            //getListHtmlTagOption: function (ul, idOrClassName, listType, htmlTagType, BankKeyWord)
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectBank", "Bank", "option", BankKeyword);
            //傳入條件(公司別,部門)取得姓名填入條件(SelectCom_Title1,SelectDept_Title1)(SelectAgentName)
            //$Common.MITEM.getAgentListHtmlTagOption(CommonHandlerUrl_M, "#SelectAgentName", "Bank", "option", SelectCom_Title1, SelectDept_Title1);
        }
        var afterSuccessFuc3 = function () {
            alert('!!!1');

        };
        var searchAgentDataFuc = function () {
            //alert('搜尋代理人')
            //alert('searchAgentData');
            var SelectCom_Title1 = val_M("#SelectCom_Title1");//取得公司別
            var SelectDept_Title1 = val_M("#SelectDept_Title1");//取得部門
            //alert(SelectCom_Title1);
            //alert(SelectDept_Title1);
            $Common.MITEM.getAgentListHtmlTagOption(CommonHandlerUrl_M, "#SelectAgentName", "Agent", "option", SelectCom_Title1, SelectDept_Title1, afterSuccessFuc3);
        }
        //設定條件取得所屬長官下拉式選單
        var searchLeaderDataFuc = function () {
            //alert('搜尋長官')
            //alert('searchLeaderData');
            var SelectCom_Title1 = val_M("#SelectCom_Title");//取得公司別
            var SelectDept_Title1 = val_M("#SelectDept_Title");//取得部門
            //alert(SelectCom_Title1);
            //alert(SelectDept_Title1);
            //取得所屬長官下拉式選單
            $Common.MITEM.getLeaderListHtmlTagOption(CommonHandlerUrl_M, "#SelectLeaderName", "Leader", "option", SelectCom_Title1, SelectDept_Title1, afterSuccessFuc3);
        }
        //選擇銀行按下[送出]
        var SendSelectBankFuc = function () {
            alert('SendSelectBankFuc');
            var BankKeyword = val_M("#BankKeyWord");
            //所屬部門
            var SelectBank_Value = val_M("#SelectBank");//所選的銀行
            var SelectBank_Text = $("#SelectBank").find("option:selected").text();
            alert(SelectBank_Value);
            alert(SelectBank_Text);
            $("#BankCode_Text").attr("value", SelectBank_Text);
            $("#BankCode_Value").attr("value", SelectBank_Value);
            show_M("#AddMUSERDataWindowDIV");
        }
        //打開選擇銀行帳號作業========================start
        //var openBankSelectDataWindow = function () {

        //    alert('openBankSelectDataWindow');
        //    //show_M("#customerAdvSearchDiv");
        //    //show_M("#customerDataTab");
        //    //show_M("#AddMCMSFTFDataWindow");
        //    hide_M("#AddMUSERDataWindowDIV");
        //    //show_M("#customerAdvSearchDiv");
        //    //show_M("#customerDataTab");
        //    //show_M("#AddMCMSFTFDataWindow");
        //    //show_M("#todayContactTab");
        //    //show_M("#pageBar");
        //    //show_M('#main');
        //    show_M("#BankSelectWindowDIV");
        //    alert('選擇銀行!!!!!');
        //};
        //顯示選擇代理人========================end
        var openAgentNameSelectDataWindow = function () {

            //alert('openAgentNameSelectDataWindow');
            //show_M("#customerAdvSearchDiv");
            //show_M("#customerDataTab");
            //show_M("#AddMCMSFTFDataWindow");
            //hide_M("#EditMUSERDataWindowDIV");
            //show_M("#customerAdvSearchDiv");
            //show_M("#customerDataTab");
            //show_M("#AddMCMSFTFDataWindow");
            //show_M("#todayContactTab");
            //show_M("#pageBar");
            //show_M('#main');
            hide_M("#main");
            hide_M("#LeaderSelectWindowDIV1");
            show_M("#AgentSelectWindowDIV1");
            //alert('選擇代理人!!!!!');
        };
        //顯示選擇部門主管
        var openLeaderNameSelectDataWindow = function () {
            //alert('openLeaderNameSelectDataWindow');
            //show_M("#customerAdvSearchDiv");
            //show_M("#customerDataTab");
            //show_M("#AddMCMSFTFDataWindow");
            //hide_M("#EditMUSERDataWindowDIV");
            //show_M("#customerAdvSearchDiv");
            //show_M("#customerDataTab");
            //show_M("#AddMCMSFTFDataWindow");
            //show_M("#todayContactTab");
            //show_M("#pageBar");
            //show_M('#main');
            hide_M("#main");
            hide_M("#AgentSelectWindowDIV1");
            show_M("#LeaderSelectWindowDIV1");
            //alert('選擇主管!!!!!');
        };
        //openBankSelectDataWindow
        //進行新增動作(20220905work)
        var addMUSERData = function () {
            alert('addMUSERData_Click!!');
        }
        var getMUSERquery = function () {
            var data = "action=getERPcustomerWebPay" + "&keyWord=" + val_M("#keyWord") + "&PayStatus=" + val_M("#PayStatus") + "&U_MDEP=" + U_MDEP_M + "&ComID=" + ComID_M + "&U_Num=" + U_Num_M;
            var success = function (back) {
                var json = jsonParse_M(back);
                $muserPageList.Table.makeTbody("#ERPcustomerWebPaySearchTb", json, 10, "#pageBar", deleteData, getMid);
            };
            var error = function (e) { Log_M("getERPcustomerWebPay error=" + e); unBlockUI_M(); };
            ajax_M(ERPcustomerWebPayHandlerUrl_G, data, success, error);
        };
        ////取得分析師ListHtmlTagOption
        //var afterSuccessFuc = function () {
        //    onChange_M("#MP", function () {
        //        var type = val_M("#MP");
        //        $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#MP_Item", type, "option");
        //    });
        //};
        //取得[縣/市]後觸發事件(戶籍地址)
        //var afterSuccessFuc2 = function () {
        //    var county = val_M("#SelectCounty");//所選的縣/市
        //    $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "", "TownShip", "option", county);//所選的城市產生相對應的鄉鎮市區(中文)
        //    var SelectTownShip = val_M("#SelectTownShip");//所選的鄉鎮市區(代碼)
        //    alert(SelectTownShip);
        //    $("ZipCode").val(SelectTownShip);
        //    $("ZipCode1").val("123");


        //};

        //取得[縣/市](現居住所:County_Now)後觸發事件(目前居住)
        var afterSuccessFuc1 = function () {
            var SelectCountyNow = val_M("#SelectCountyNow");//所選的縣/市
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShipNow", "TownShip", "option", SelectCountyNow);//所選的城市產生相對應的鄉鎮市區(中文)
            var SelectTownShipNow = val_M("#SelectTownShipNow");//所選的鄉鎮市區(代碼)
            //ZipCode
            //$("ZipCode").html(TownShip);
            alert(SelectTownShipNow);
            //$("ZipCode1").val(SelectTownShipNow);
            //$("ZipCodeNow").val(SelectTownShipNow);
            //onChange_M("#SelectCounty", function () {
            //    var SelectCounty = val_M("#SelectCounty");//所選的鄉鎮市區(代碼)
            ////    //ZipCode
            ////    //$("ZipCode").html(TownShip);
            ////    alert("ABCDE999"+SelectCounty);
            ////    $("ZipCode").val(SelectTownShip);
            ////    //alert("所選的鄉鎮市區(代碼)"+SelectTownShip);
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "TownShip", "option", SelectCounty);//所選的城市產生相對應的鄉鎮市區
            //});
            //var county_Now = val_M("#SelectCounty_Now");//所選的縣/市
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip_Now", "TownShip", "option", county_Now);//所選的城市產生相對應的鄉鎮市區(中文)

        };
        //var getSingleMUSERData = function (U_Num) {
        //    alert(U_Num);
        //    //alert('getSingleMailDetail');
        //    var data = "U_Num=" + U_Num + "&action=getSingleMUSERData";
        //    var success = function (back) {
        //        Log_M("getSingleMUSERData back=" + back);
        //        var json = jsonParse_M(back);
        //        //20220913將取回資料綁定回畫面
        //        text_M("#mdMS_Title", json.MS_Title);

        //        html_M("#mdMS_Text", json.MS_Text);


        //        text_M("#mdMS_SenderName", json.MS_SenderName);
        //        getUpLoadData(MS_ID_G);
        //        updateReadtag(MS_ID_G);
        //        hide_M("#mailDataTab");
        //    };
        //    var error = function (e) { Log_M("getMailData error=" + e); unBlockUI_M(); };

        //    ajax_M(MuserQueryHandlerUrl_G, data, success, error);
        //};
        //var getSingleMUSERDetail = function () {
        //    //alert('getSingleMailDetail');
        //    var data = "MS_ID=" + MS_ID_G + "&action=getMailDetail";
        //    var success = function (back) {
        //        Log_M("getMailData back=" + back);
        //        var json = jsonParse_M(back);
        //        text_M("#mdMS_Title", json.MS_Title);

        //        html_M("#mdMS_Text", json.MS_Text);
        //        text_M("#mdMS_SenderName", json.MS_SenderName);
        //        getUpLoadData(MS_ID_G);
        //        updateReadtag(MS_ID_G);
        //        hide_M("#mailDataTab");
        //    };
        //    var error = function (e) { Log_M("getMailData error=" + e); unBlockUI_M(); };

        //    ajax_M(MuserQueryHandlerUrl_G, data, success, error);
        //};
        //取得原有資料內容
        function addOption() {
            optText = 'New elemenet1';
            optValue = 'newElement1';
            //#SelectDept
            //$('#SelectDept').append('<option value="${' + optValue + '}">${' + optText + '}</option>');
            //$('#SelectDept2').append('<option value="${' + optValue + '}" selected>${' + optText + '}</option>');//no
            //$('#selectId').append('<option value="${' + optValue + '}" selected>${' + optText + '}</option>');//ok
            //SelectDept
            //$('#selectId').append('<option value="${optValue}">${optText}</option>');
            //$('#selectId option[value="secondEl"]').attr("selected", true);
            //$('#selectId option[value="firstEl"]').attr("selected", true);//設定預設選項
            //$('#SelectDept option[value="0002"]').attr("selected", true);//設定預設選項
            //alert('SETUP!!');
            //$('#selectId option[value="newElement"]').attr("selected", true);
        }

        var afterSuccessFuc2 = function () {
            
            //var Com = val_M("#SelectCom_Title1");//所選的縣/市
            ////取得[部門]
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept_Title1", "Dept", "option","", afterSuccFunc3,"");
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
            alert('!!!!');

        };
        var startThisPage = function () {
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept_Title1", "Dept", "option");
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom_Title1", "Com", "option", afterSuccessFuc2);
            //addOption();
            //取得原有的資料並設定畫面(20220913work)
            var U_Num_M = "<%=getU_Num()%>";//取得選到的員工編號
            var U_Name = "<%=getU_Name()%>";//取得選到的員工姓名
            var Dept = "<%=getDept()%>";//取得選到的員工部門
            var U_ITEM = "<%=getUITEM()%>";//取得選到的員工職稱
            var Posit = "<%=getPosit()%>";//取得選到的員工等級
            var ComID = "<%=getComID()%>";////取得選到的員工公司
            var U_PWD = "<%=getU_PWD()%>";//取得密碼
            var U_Email = "<%=getEmail()%>";//取得電子郵件Email
            var U_Tel = "<%=getU_Tel()%>";//取得分機號碼
            var U_Card = "<%=getU_Card()%>";//取得磁卡號碼
            var SlimDate = "<%=getSlimDate()%>"//取得到職日
            var LeaveDate = "<%=getLeaveDate()%>"//取得離職日
            var AgentNum = "<%=getAgentNum()%>"//取得代理人員工編號
            var AgentName = "<%=getAgentName()%>"//取得代理人姓名
            var AgentCom = "<%=getAgentCom()%>"//取得代理人部門
            var LeaderNum = "<%=getLeaderNum()%>"//取得主管員工編號
            var LeaderName = "<%=getLeaderName()%>"//取得主管姓名
            var LeaderCom = "<%=getLeaderCom()%>"//取得主管部門
            //取得所屬部門
            //取得所屬公司COMID
            //取得等級
            //取得職稱UITEM
            //alert("MUSER_query.aspx");
            //代回原本畫面
            $("#U_Num").val(U_Num_M);//員工編號
            $("#U_Name").val(U_Name);//員工姓名
            $("#U_PWD").val(U_PWD);//密碼
            $("#U_Email").val(U_Email);//電子郵件Email
            $("#U_Tel").val(U_Tel);//分機號碼
            $("#U_Card").val(U_Card);//磁卡號碼
            $("#SlimDate").val(SlimDate);//到職日
            $("#LeaveDate").val(LeaveDate);//離職日
            $("#U_AgentNum").val(AgentNum);//代理人員工編號
            $("#U_AgentName").val(AgentName);//代理人員工姓名
            $("#U_AgentComLand").val(AgentCom);//代理人員工部門
            $("#U_LeaderNum").val(LeaderNum);//部門主管員工編號
            $("#U_LeaderName").val(LeaderName);//部門主管員工姓名
            $("#U_LeaderComLand").val(LeaderCom);//部門主管員工部門
            //alert('FreshFromDB!!');
            //20220920代回資料庫內的值
            //sessionStorage["First"] = "T";
            //alert(sessionStorage["First"]);
            if (sessionStorage["Modify"]=="T") {
                $("#U_AgentNum").val(AgentNum);//代理人員工編號
                $("#U_AgentName").val(AgentName);//代理人員工姓名
                $("#U_AgentComLand").val(AgentCom);//代理人員工部門
                $("#U_LeaderNum").val(LeaderNum);//主管員工編號
                $("#U_LeaderName").val(LeaderName);//主管員工姓名
                $("#U_LeaderComLand").val(LeaderCom);//主管員工部門
            }
            //$("#U_AgentNum").val(AgentNum);//代理人員工編號
            //$("#U_AgentName").val(AgentName);//代理人員工姓名
            //$("#U_AgentComLand").val(AgentCom);//代理人員工部門
            //$("#U_LeaderNum").val(LeaderNum);//主管員工編號
            //$("#U_LeaderName").val(LeaderName);//主管員工姓名
            //$("#U_LeaderComLand").val(LeaderCom);//主管員工部門

            //text_M("#U_PWD", U_PWD);
            //html_M("#U_PWD", "123456");
            //text_M("#U_PWD", "123");
            //alert(U_Name);
            //text_M("#U_Num", U_Num_M);
            //getSingleMUSERData(U_Num_M);
            var data = "U_Num=" + U_Num_M + "&action=getEditMUSERData";//取得員工資料維護作業
            var success = function (back) {
                var json = jsonParse_M(back);
                MuserQueryDataJson_G = json;//取回的資料內容
                if (back != "成功") {
                    makeHtml();//生成畫面
                }
            };
            var error = function (e) { Log_M("deleteMailData error=" + e); unBlockUI_M(); };
            //ajax_M(MuserQueryHandlerUrl_G, data, success, error);
            //====================
            //戶籍地址
            onChange_M("#SelectCounty", function () {
                var SelectCounty = val_M("#SelectCounty");//所選的城市(代碼)[戶籍地址]
                //getListHtmlTagOption: function (ul, idOrClassName, listType, htmlTagType, county)
                $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "TownShip", "option", SelectCounty);//所選的[城市]產生相對應的[鄉鎮市區]
                var SelectTownShip = val_M("#SelectTownShip");//所選的鄉鎮市區(代碼)
                //    //ZipCode
                //$("ZipCode").html(TownShip);
                //alert("ABCDEFGHHJJ999"+SelectCounty);
                $("ZipCode").val(SelectTownShip);
                //    //alert("所選的鄉鎮市區(代碼)"+SelectTownShip);
                //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "TownShip", "option", SelectCounty);//所選的城市產生相對應的鄉鎮市區
            });
            //====================
            onChange_M("#SelectTownShip", function () {
                var SelectTownShip = val_M("#SelectTownShip");//所選的鄉鎮市區(代碼)
                //    //ZipCode
                //    //$("ZipCode").html(TownShip);
                //alert("ZipCode:" + SelectTownShip);
                $("#ZipCode").attr("value", SelectTownShip);
                //    //alert("所選的鄉鎮市區(代碼)"+SelectTownShip);
                //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "TownShip", "option", SelectCounty);//所選的城市產生相對應的鄉鎮市區
            });
            onChange_M("#CountyNow", function () {
                var CountyNow = val_M("#CountyNow");//所選的鄉鎮市區(代碼)
                //    //ZipCode
                //    //$("ZipCode").html(TownShip);
                //alert("ABCDEFGHHJJ999"+SelectCounty);
                //    $("ZipCode").val(SelectTownShip);
                //    //alert("所選的鄉鎮市區(代碼)"+SelectTownShip);

                $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShipNow", "TownShip", "option", CountyNow);//所選的城市產生相對應的鄉鎮市區
            });
            //====================
            onChange_M("#SelectTownShipNow", function () {
                var SelectTownShipNow = val_M("#SelectTownShipNow");//所選的鄉鎮市區(代碼)[現居住所]
                //    //ZipCode
                //    //$("ZipCode").html(TownShip);
                //alert("ZipCode:" + SelectTownShip);
                $("#ZipCode_Now").attr("value", SelectTownShipNow);
                //    //alert("所選的鄉鎮市區(代碼)"+SelectTownShip);
                //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "TownShip", "option", SelectCounty);//所選的城市產生相對應的鄉鎮市區
            });
            //====================

            //選擇[銀行]
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectBank", "Bank", "option");
            //取得[部門]
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept", "Dept", "option", "", "", Dept);
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept2", "Dept", "option", "", "", "2");
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept_Title", "Dept", "option", "3");
            //取得[所屬公司]
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom", "Com", "option", "", "", ComID);//對應<select id="SelectCom"></select></td >
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom_Title1", "Com", "option", "", "", afterSuccessFuc2);//對應<select id="SelectCom"></select></td >
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom_Title", "Com", "option", "", "", afterSuccessFuc2);//對應<select id="SelectCom"></select></td >
            //取得[縣/市]
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCounty", "County", "option", afterSuccessFuc2);
            //取得[縣/市](目前居住)[Now](現居住所)
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#CountyNow", "County", "option", afterSuccessFuc1);
            //取得[鄉鎮區市](目前居住)[Now](現居住所)
            //取得[等級]
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectLevel", "Level", "option", "", "", Posit);//對應<select id="SelectLevel"></select >
            //SelectLevel2
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectLevel2", "Level", "option");//對應<select id="SelectLevel"></select >
            //取得[職稱]
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectPosit", "Posit", "option", "", "", U_ITEM);//對應<select id="SelectPosit"> </select >
            //取得[電話區碼](住宅電話
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#HTel_Zone", "Tel_Zone", "option");//對應<select id="SelectPosit"> </select >
            //取得[電話區碼](緊急連絡人)
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#ETel_Zone", "Tel_Zone", "option");//對應<select id="SelectPosit"> </select >
            //取得[代理人]searchAgentDataFuc(依照[公司別][部門])

            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectPosit", "Posit", "option");
            /*$('#SelectID')[0].selectedIndex = 1; //選取第二個欄位 單位B (索引從0開始)
                $('#SelectID').get(0).selectedIndex = 1; //效果同上
                $('#SelectID').val(selectedValue); //selectedValue是變數，裡面是select option其中一個的value值
                $('#SelectID').val('B') //選擇第二欄位，效果同上
                $('#SelectID option').filter('[value="'+selectedValue+'"]').attr("selected",true); //filter選項後設定屬性
             */
            //AgentNameSelectDataWindowBtn
            onClick_M("#AgentNameSelectDataWindowBtn", openAgentNameSelectDataWindow);//顯示選擇代理人
            //LeaderNameDataWindowBtn
            onClick_M("#LeaderNameDataWindowBtn", openLeaderNameSelectDataWindow);//顯示選擇部門主管
            ////HG01
            $('#SelectCom thead tr th select').each(function () {
                console.log($(this).val());
                alert($(this).val());
            });
            //$('#SelectCom option').filter('[value="HG01"]').attr("selected", true);
            //$('#SelectLevel').val("0001");
            ////SelectPosit
            //$('#SelectPosit').val("0001");
            // $('#SelectDept').val("0001");
            // $('#SelectLevel2').val("0002");
            // $("#SelectLevel2").append("<option value='0123'>TEST</option>");
            // $('#SelectLevel2 option[value="0002"]').attr("selected", true);
            // //$(".selector").val("pxx");
            // ////SelectCom
            // //$('#SelectCom').val('HG01');
            // //$('#SelectDept').val("0001");
            // $('#SelectLevel2 option').filter('[value=' + 0002 + ']').attr("selected", true);
            //// $('#SelectLevel2 option')[2].attr('selected', 'selected');
            // var test = $("#SelectDept option:selected").text();
            // alert(test);
            // $('#SelectLevel2')[0].selectedIndex = 3; //選取第二個欄位 單位B (索引從0開始)
            //$('#SelectLevel2').get(0).selectedIndex = 3; //效果同上
            //$('#SelectLevel2').val(selectedValue); //selectedValue是變數，裡面是select option其中一個的value值
            $('#SelectLevel2').val('0001') //選擇第二欄位，效果同上
            $('#SelectLevel2 option').filter('[value="' + 0001 + '"]').attr("selected", true); //filter選項後設定屬性
            //alert('--123456789--');
            ////20220913加入綁定原有資料的設定
            ////REF:https://stackoverflow.com/questions/13343566/set-select-option-selected-by-value
            ////jQuery設定/變更select物件預設值的方法
            ////REF:http://radio-idea.blogspot.com/2014/05/jqueryselect.html

            onClick_M("#AddMUSERDataWindowBtn", openAddMUSERDataWindow);//顯示新增使用者畫面
            //onClick_M("#BankSelectDataWindowBtn", openBankSelectDataWindow);//顯示選擇銀行畫面
            onClick_M("#saveMUSERDataClick", savemuserData);//儲存使用者動作
            onClick_M("#searchAgentDataFuc", searchAgentDataFuc);//搜尋代理人
            onClick_M("#searchLeaderDataFuc", searchLeaderDataFuc);//searchLeaderDataFuc搜尋部門主管
            //searchCustomerData
            onClick_M("#searchCustomerData", searchCustomerData);//搜尋員工資料維護作業關鍵字
            onClick_M("#SendSelectAgentDataFuc", SendSelectAgentDataFuc);//選擇代理人
            onClick_M("#SendSelectLeaderDataFuc", SendSelectLeaderDataFuc);//選擇部門主管
            hide_M("#customerAdvSearchDiv");
            hide_M("#extensionDialog");
            /////////////////////////////
            var county = val_M("#SelectCounty");//所選的縣/市

            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "TownShip", "option", county);//所選的城市產生相對應的鄉鎮市區(中文)
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShipNow", "TownShip", "option", county);//所選的城市產生相對應的鄉鎮市區(中文)
            addOption();


        };
        ///按下選擇銀行視窗
        function ShowDialog(Url) {
            alert('@@@');
            var iWidth = 560; //模態視窗寬度
            var iHeight = 300;//模態視窗高度
            var iTop = (window.screen.height - iHeight - 100) / 2;
            var iLeft = (window.screen.width - iWidth) / 2;
            var returnValue = window.showModalDialog(Url, "newwindow", "dialogHeight:" + iHeight + "px; dialogWidth:" + iWidth + "px; toolbar:no; menubar:no; scrollbars:no; resizable:no; location:no; status:no; left:200px; top:100px;");
            document.getElementById("TextBox1").innerText = returnValue;
        }
        ///
        //頁面載入後自動執行
        $(function () {
            sessionStorage["Modify"] = "F";
            //Session[""] = "F";
            //alert('startThisPage');
            startThisPage();
            //查看使用者權限

        })


    </script>
</asp:Content>

