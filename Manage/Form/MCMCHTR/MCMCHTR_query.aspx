<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MCMCHTR_query.aspx.cs" Inherits="Manage_Form_MCMCHTR_query" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 32px;
        }

        .auto-style2 {
            height: 49px;
        }

        .auto-style3 {
            width: 5%;
            height: 49px;
        }

        .auto-style4 {
            width: 815px;
        }

        .auto-style5 {
            height: 32px;
            width: 815px;
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
                            <h1 class="box-title"><b>系統維護 &gt;  案件轉檔維護</b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <%-- <form name="form1" method="post" action="MCMRYGC_EditDB.asp?MENU_no=" runat="server" onsubmit="return jsCheck();">--%>
                            <form name="form1" method="post" runat="server">
                                <div style="text-align: center">
                                    <%--<div id="pageBar" style="margin: 0 auto;">--%>
                                        <td align="center" valign="top">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="1">
                                                <tr>
                                                    <td height="197" align="center" valign="top">
                                                        <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#dddddd">
                                                            <tr bgcolor="#F7F6F3" class="12-k">

                                                            <tr align="center" bgcolor="#F7F6F3" class="12-k">
                                                                <td class="auto-style4">責任助理</td>

                                                                <td align="left">
                                                                    <%--                 <asp:DropDownList ID="Z_Item" runat="server" OnInit="Z_Item_Init" OnSelectedIndexChanged="Z_Item_SelectedIndexChanged" OnTextChanged="Z_Item_TextChanged">
                                                                        </asp:DropDownList>--%>
                                                                    <%-- <label for="Q_Analyst">分析師：</label>--%>
                                                                    <%--責任助理--%>
                                                                    <select id="Q_MC" class="form-control getQMCListFuc">
                                                                        <%-- <option value="">不拘123</option>
                                                                            <option value="">不拘456</option>--%>
                                                                    </select>

                                                                </td>
                                                                <tr align="center" bgcolor="#F7F6F3" class="12-k">
                                                                    <td class="auto-style5">客戶範圍</td>
                                                                    <td align="left" class="auto-style1">
                                                                        <%--<asp:DropDownList ID="Q_member" runat="server" OnInit="Q_member_Init" OnSelectedIndexChanged="Q_member_SelectedIndexChanged" OnTextChanged="Q_member_TextChanged">
                                                                            </asp:DropDownList>--%>
                                                                        <select id="Q_Member" class="form-control getTradingStatusListFuc">
                                                                            <option value="">不限</option>
                                                                            <option value="1">會員</option>
                                                                            <option value="2">非會員</option>
                                                                        </select>
                                                                        &nbsp;</td>
                                                                    <%--<tr align="center" bgcolor="#F7F6F3" class="12-k">
                                                                            <td>派發人員</font></td>
                                                                            <td align="left">
                                                                                <%-- <asp:CheckBoxList runat="server" ID="CB_list"></asp:CheckBoxList>--%>
                                                    </td>
                                                </tr>

                                                <tr align="center" height="15" bgcolor="#e5e5e5">
                                                    <td class="12-k" colspan="2">


                                                        <button type="button" class="btn btn-info btn-flat" id="QueryClick">送出查詢</button>
                                                    </td>
                                                </tr>


                                            </table>

                                        </td>
                                        </tr>

                                                <tr>
                                                    <td>
                                                        <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#dddddd">


                                                            <tr align="center" bgcolor="#F7F6F3" class="12-k">
                                                                <td width="50" class="auto-style1"><font>轉入責任助理:
                                                                        <select id="I_MC" class="form-control getI_MCFuc">
                                                                            <%-- <option value="">不拘123</option>
                                                                            <option value="">不拘456</option>--%>
                                                                        </select></font>

                                                                </td>
                                                            </tr>

                                                            <tr align="center" height="15" bgcolor="#e5e5e5">

                                                                <td height="197" align="center" valign="top">


                                                                    <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#dddddd">
                                                                        <thead>
                                                                            <tr align="center" bgcolor="#E5E5E5" class="12-k">
                                                                                <th width="5%" class="auto-style2">項次</th><%--1--%>
                                                                                <th class="auto-style3"><a class="BlueLink10" OnClick='Check()'">全選</a> / <a class="BlueLink10" OnClick='UnCheck()'">清除</a></th><%--2--%>
                                                                                <th width="10%" class="auto-style2">狀態</th><%--3--%>
                                                                                <th width="10%" class="auto-style2">會員</th><%--4--%>
                                                                                <th width="10%" class="auto-style2">拒聯</th><%--5--%>
                                                                                <th width="10%" class="auto-style2">姓名</th><%--6--%>
                                                                                <th width="10%" class="auto-style2">助理</th><%--7--%>
                                                                                <th width="10%" class="auto-style2">手機</th><%--8--%>
                                                                                <th width="5%" class="auto-style2">公司電話</th><%--9--%>
                                                                                <th width="5%" class="auto-style2">住家電話</th><%--10--%>
                                                                                <th width="5%" class="auto-style2">建檔日</th><%--11--%>
                                                                                <th width="5%" class="auto-style2">註記</th><%--12--%>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody id="MCMCHTRData">
                                                                        </tbody>

                                                                        <tr align="center" height="15" bgcolor="#E8E8E8">
                                                                            <td class="12-k" colspan="15" align="right">
                                                                                <%--<input type="submit" name="submit" class="btn" value="分派案件">--%></td>
                                                                            <tr align="center" height="15" bgcolor="#e5e5e5">
                                                                                <td class="12-k" colspan="15">筆數:</td>
                                                                    </table>

                                                                    <table width="800" border="0" cellpadding="0" cellspacing="0">
                                                                    </table>
                                                                </td>


                                                            </tr>


                                                        </table>
                                                        <button id="QueryClick0" class="btn btn-info btn-flat" type="button">
                                                            轉出案件
                                                        </button>
                                                    </td>


                                    </div>
                               <%-- </div>--%>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script src="<%=getRelativePath()%>js/pageList/muserPageList.js" type="text/javascript"></script>
    <script>
        //var CustomerManageHandlerUrl_G = "/Manage/User/MUSERHandler.ashx";
        var MCMCHTRDataHandlerUrl_G = "/Manage/MCMRYGC/MCMRYGCHandler.ashx";
        var MCMCHTRDataJson_G = null;
        //傳入操作者的員工編號
        var EditU_Num = "<%=getEditU_Num()%>";
        //alert(User_Num_M);
        var makeHtml = function () {
            $("#MCMCHTRData").empty();
            if (MCMCHTRDataJson_G.length != 0) {
                var sb = new string_M.StringBuilder();
                var n = 0;
                var startCount = (NowPage_G - 1) * 30 + 1;
                var endCount = 30 * NowPage_G;
                var isMember = false;
                $.each(MCMCHTRDataJson_G, function (i, v) {
                    n += 1;
                    if (n >= startCount && n <= endCount) {
                        sb.append("<tr><th class='text-center'>");
                        sb.append(n);//項次
                        sb.append("</th><th class='text-center'><input type='checkbox' aria-label='query' id='per_read_' name='");
                        sb.append(v.M_ID);//全選/清除//改成checkbox
                        sb.append("' ")
                        sb.append("</th><th class='text-center' style='background-color:");
                        //sb.append(v.Light_status);//狀態(燈號)//20221012要修改的地方*/
                        if (v.Light_status == "R") {
                            sb.append("red");//狀態(燈號)
                        } else if (v.Light_status == "Y") {
                            sb.append("Yellow");
                        } else if (v.Light_status == "G") {
                            sb.append("Green");
                        }
                        sb.append("'>");
                        sb.append("</th><th class='text-center'>");
                        //sb.append(v.Light_Status);//狀態(燈號)//20221012要修改的地方*/
                        /*  sb.append("<img style='width:25px;height:25px;' src=/img/icon/nocall.jpg alt=請勿聯絡>");*/
                        /* <img src="../../../img/icon/member2.jpg" />*/
                        if (v.M_Num !== 'undefined') {
                            /*  <img src="../../../img/icon/member2.jpg" />*/
                            sb.append("<img style='width:25px;height:25px;' src=/img/icon/member2.jpg >");
                        }
                        else {
                            sb.append("");
                        }

                        sb.append("</th><th class='text-center'>");
                        sb.append(v.N_Call_tag);//拒聯
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.M_Name);//姓名
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.MC_Name);//助理
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.M_Tel1);//手機
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.OTel);//公司電話
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.HTel);//住家電話
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.add_date);//建檔日
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.note);//註記2021011要修改:查詢是否有註記，且註記時間小約30天內，否則可註記

                        sb.append("</th>");
                        sb.append("</tr>");
                    }
                });


                //TotalPage_G = getTotalPage(n);
                //alert('append_M("#customerData", sb.toString());');
                append_M("#MCMCHTRData", sb.toString());//將表格資料填入畫面
                // $("#customerData").append(sb.toString());
                onClick_M(".deleteCustomerData", function () {
                    var MID = $(this).attr("MID");
                    var r = confirm("刪除後資料將無法恢復，確定刪除?");
                    console.log(r);
                    if (r == true) {
                        deleteCustomerData(MID);
                    }

                });
                /*$(".deleteCustomerData").on("click", function () {
                    var MID = $(this).attr("MID");
                    var r = confirm("刪除後資料將無法恢復，確定刪除?");
                    console.log(r);
                    if (r == true) {
                        deleteCustomerData(MID);
                    }
 
                });*/
            } else {
                alert("查無資料");
                NowPage_G = 1;
                TotalPage_G = 1;
            }
            //製作頁數列表
            getPageList();

            //頁面解鎖
            //unBlockUI_M();
        };
        var Check = function () {
            //alert('CHECK!');
            //$("[id='per_read_']").attr("checked", 'true');//全選
            $("input[id='per_read_']").prop("checked", true);//全選
        };
        var UnCheck = function () {
            //alert('UNCHECK!');
            //$("[id='per_read_']").attr("checked", 'false');//全選
            $("input[id='per_read_']").prop("checked", false);//全不選
        };
        //var makeHtml = function () {
        //    $("#MCMCHTRData").empty();
        //    if (MCMCHTRDataJson_G.length != 0) {
        //        var sb = new string_M.StringBuilder();
        //        var n = 0;
        //        var startCount = (NowPage_G - 1) * 30 + 1;
        //        var endCount = 30 * NowPage_G;
        //        var isMember = false;
        //        //MCMCHTRDataDataJson_G
        //        $.each(MCMCHTRDataJson_G, function (i, v) {
        //            n += 1;
        //            if (n >= startCount && n <= endCount) {
        //                sb.append("<tr><th class='text-center'>");
        //                sb.append(n);//1
        //                sb.append("</th><th class='text-center'>");
        //                sb.append(n);//2
        //                sb.append("</th><th class='text-center'>");
        //                sb.append(n);//3
        //                sb.append("</th><th class='text-center'>");
        //                sb.append(n);//4
        //                sb.append("</th><th class='text-center'>");
        //                sb.append(n);//5
        //                sb.append("</th><th class='text-center'>");
        //                sb.append(n);//6
        //                sb.append("</th><th class='text-center'>");
        //                sb.append(n);//7
        //                sb.append("</th><th class='text-center'>");
        //                sb.append(n);//8
        //                sb.append("</th><th class='text-center'>");
        //                sb.append(n);//9
        //                sb.append("</th><th class='text-center'>");
        //                sb.append(n);//10
        //                sb.append("</th><th class='text-center'>");
        //                sb.append(n);//11
        //                sb.append("</th><th class='text-center'>");
        //                sb.append(n);//12
        //                sb.append("</th>");

        //                sb.append("</tr>");
        //            }
        //        });


        //        //TotalPage_G = getTotalPage(n);
        //        //alert('append_M("#customerData", sb.toString());');
        //        append_M("#MCMCHTRData", sb.toString());
        //        // $("#customerData").append(sb.toString());
        //        onClick_M(".deleteMCMCHTRData", function () {
        //            var MID = $(this).attr("MID");
        //            var r = confirm("刪除後資料將無法恢復，確定刪除?");
        //            console.log(r);
        //            if (r == true) {
        //                deleteMCMCHTRData(MID);
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
        <%--var MENU_no_G = "<%=getMENU_no()%>";--%>
        //現在頁數
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

            $("#pageBar").append(sb.toString());
            append_M("#pageBar", sb.toString());
            empty_M("#pageNum");
            $("#pageNum").empty();
            append_M("#pageNum", NowPage_G + "/" + TotalPage_G);
            $("#pageNum").append(NowPage_G + "/" + TotalPage_G);
            onClick_M(".pageNum", pageNumClick);
            $(".pageNum").on("click", pageNumClick);
        };

        //}

        var IP_G = "<%=getIP()%>";
        //scriptH
        var MCMCHTRHandlerUrl_G = "/Manage/Form/MCMCHTR/MCMCHTRHandler.ashx";
        var jsonParse_M = function (str) {
            return JSON.parse(str);
        };
        //傳送資料 ajax_M
        var ajax_M = function (url, data, success, error) {
            /* alert('call customerManageHandler!!!!!'+url);*/
            $.ajax({
                url: url,
                data: data,
                method: 'POST',
                success: success,
                error: error
            });
        };
        var Check_Item;//被勾選的項目(派發人員)
        var Check_Item_Ary;//被勾選的項目(陣列)(派發人員)
        var getCheckBoxValueStr = function (objs, idOrClassName) {
            var back = "";
            var count = 0;
            $.each(objs, function (i, v) {
                if ($(v).prop("checked") == true) {
                    if (count > 0) {
                        back += ",";
                    }
                    back += val_M(v);
                    count += 1;
                }
            });
            val_M(idOrClassName, back);//back:被勾選的項目
            Check_Item = back;//被勾選的項目(派發人員)
        };
        //取得案件(輸出MCMCHTRData)/按下送出查詢後
        var QueryData = function () {
            var Q_MC = $("#Q_MC").val();//責任助理員工編號
            var Q_Member = $("#Q_Member").val();//客戶範圍
            //alert(Q_MC);//
            //alert(Q_Member);
            //alert('送出查詢');
            //
            //var data = "Q_Analyst=" + Q_Analyst + "&action=searchMCMSFTFData";
            var data = "Q_MC=" + Q_MC + "&Q_Member=" + Q_Member + "&action=searchMCMCHTRData";//取得[案件轉檔維護]資料
            console.log("Q_MC = " + Q_MC + "&Q_Member=" + Q_Member + " & action=searchMCMCHTRData");
            var searchMCMCHTRDataSuccess = function (back) {                  //searchMCMCHTRData
                MCMCHTRDataJson_G = jsonParse_M(back);
                //alert('show list2');
                makeHtml();//<==組成畫面20221006
                //hide_M("#customerAdvSearchDiv");

            };
            //MCMCHTRHandlerUrl_G
            //alert('Call CustomerManageHandlerUrl_G2');
            ajax_M(MCMCHTRHandlerUrl_G, data, searchMCMCHTRDataSuccess);//<===
        }
        var CaseTransfer = function () {
            var Transfer = false;
            var checkboxes = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有checkbox的值(有勾選到)
            //var checkboxes_all_num = checkboxes.length;//所有checkbox的數目
            var checkboxes_checked = document.querySelectorAll('input[type=checkbox]:checked');//求出畫面中所有有勾選checkbox的值(有功能的項目)
            var checkboxes_checked_num = checkboxes_checked.length;//被勾選checkbox的數目
            var Q_MC_2 = $("#Q_MC").val();//責任助理員工編號
            var I_MC = $("#I_MC").val();//轉入責任助理員工編號
            for (let i = 0; i < checkboxes_checked_num; i++) {
                //checkbox_name = checkboxes_checked[i].name.toString();//勾選到的項目(會員編號)
                checkbox_MID = checkboxes[i].name.toString()//全部的項目(有勾選到的項目MID)
                //alert("勾選到的項目___:" + checkbox_MID);//有勾選到的項目
                //20221007加入[案件轉檔維護]工作
                //取得責任助理
                var Q_MC_2 = $("#Q_MC").val();//責任助理員工編號
                //alert("原本責任助理:" + Q_MC_2);
                //取得轉入責任助理
                var I_MC = $("#I_MC").val();//轉入責任助理員工編號
                //alert("轉入責任助理:" + I_MC);
                var data = "MID=" + checkbox_MID + "&Q_MC=" + Q_MC_2 + "&I_MC=" + I_MC + "&action=CaseTransfer";;//進行案件轉換
                var addMCMCHTRDataSuccess = function (back) {
                    Transfer = true;
                    //新增轉換紀錄至MCHAG(action=CaseTransferRecord)
                    //var CaseTransferRecord = "MID=" + checkbox_MID + "&Q_MC=" + Q_MC_2 + "&I_MC=" + I_MC + "&EditU_Num" + EditU_Num + "&action=CaseTransferRecord";;//新增案件轉換紀錄
                };//新增成功後執行的函數
                var addMCMCHTRDataError = function (back) {
                    Transfer = false;
                }
                ajax_M(MCMCHTRHandlerUrl_G, data, addMCMCHTRDataSuccess, addMCMCHTRDataError);//<==呼叫執行案件轉換的動作


            };
            if (Transfer)
                alert('案件轉檔完成!!')
            else
                alert('案件轉檔失敗!!')
            QueryData();//依照原條件再執行一次查詢(重新整理)

        }
        //    ////MCMCHTRHandlerUrl_G
        //    ////alert('Call CustomerManageHandlerUrl_G2');
        //    //ajax_M(MCMCHTRHandlerUrl_G, data, searchMCMCHTRDataSuccess);//<===
        //}
        //派發案件(assignCase)
        //20220708
        var assignCase = function () {
            //var Analysts_Check = "";
            var Analysts = $('input[name="Analyst"]');
            //getCheckBoxValueStr(Analysts_Check, "#Analyst");
            getCheckBoxValueStr(Analysts, "#Analyst");
            alert("#Analyst");
            alert(Check_Item);
            Check_Item_Ary = Check_Item.split(',');//被勾選的項目(陣列)(派發人員)
            alert('派發案件');
            //var Analysts = $('input[name="Analyst"]');
            getCheckBoxValueStr(Analysts, "#Analyst");
            //20220708新增派發資料 ref:customerManage.aspx
            var data = "" + "&action=assignCase";;//進行派發案件
            var addMCMCHTRDataSuccess = function (back) {
                alert('案件轉檔完成!')
            };//新增成功後執行的函數
            ajax_M(MCMCHTRHandlerUrl_G, data, addMCMCHTRDataSuccess);//<==呼叫執行新增的動作

            //ref:C:\Work\WebSites\ERP\Manage\Form\SRMVENU\新增資料夾
            //alert('Query!');
            //var Q_Analyst = val_M("#smdM_MP") == null ? emptyValue_M : val_M("#smdM_MP");//分析師員工編號
            ////alert(Q_Analyst);
            ////var startDate = val_M("#StartDate");
            ////var endDate = val_M("#EndDate");
            ////var doNext = check_M.isEndDateBigThanStartDate(startDate,endDate);
            ////if (isEmptyStr(startDate) && isEmptyStr(endDate)) {
            //doNext = true;
            ////}
            //if (doNext) {
            //    NowPage_G = 1;
            //    blockUI_M();
            //    empty_M("#MPMMTELData");
            //    //var keyWord = val_M("#keyWord");
            //    var Q_Analyst = val_M("#smdM_MP") == null ? emptyValue_M : val_M("#smdM_MP");//分析師員工編號
            //    //var Q_Product = val_M("#Q_Product") == null ? emptyValue_M : val_M("#Q_Product");
            //    //var data = "keyWord=" + keyWord + "&U_MDEP=" + U_MDEP_M + "&U_Num=" + U_Num_M + "&ComID=" + ComID_M + "&Q_Name=" + $("#Q_Name").val() + "&Q_Tel=" + $("#Q_Tel").val() + "&StartDate=" + startDate + "&EndDate=" + endDate + "&Q_Analyst=" + Q_Analyst + "&Q_Grade=" + $("#Q_Grade").val() + "&Q_Member=" + $("#Q_Member").val() + "&Q_Product=" + Q_Product + "&action=searchMPMMTELData";
            //    var data = "Q_Analyst=" + Q_Analyst + "&action=searchMPMMTELData";

            //    console.log("Q_Analyst = " + Q_Analyst + " & action=searchMPMMTELData");
            //    var searchCustomerDataSuccess = function (back) {
            //        MPMMTELDataJson_G = jsonParse_M(back);
            //        //alert('show list2');
            //        makeHtml();//<===
            //        hide_M("#customerAdvSearchDiv");

            //    };
            //    //alert('Call CustomerManageHandlerUrl_G2');
            //    ajax_M(MPMMTELDataHandlerUrl_G, data, searchCustomerDataSuccess);//<===
            //} else {
            //    alert("請正確選擇建檔日期區間");
            //}

        };
        //var getMUSERquery = function () {
        //    var data = "action=getERPcustomerWebPay" + "&keyWord=" + val_M("#keyWord") + "&PayStatus=" + val_M("#PayStatus") + "&U_MDEP=" + U_MDEP_M + "&ComID=" + ComID_M + "&U_Num=" + U_Num_M;
        //    var success = function (back) {
        //        var json = jsonParse_M(back);
        //        $muserPageList.Table.makeTbody("#ERPcustomerWebPaySearchTb", json, 10, "#pageBar", deleteData, getMid);
        //    };
        //    var error = function (e) { Log_M("getERPcustomerWebPay error=" + e); unBlockUI_M(); };
        //    ajax_M(ERPcustomerWebPayHandlerUrl_G, data, success, error);
        //};
        var Check_Item_ALL;//被勾選的項目
        var Check_Item_Ary;//被勾選的項目(代碼)
        var getCheckBoxValueStr_ALL = function (objs, idOrClassName) {
            var back = "";
            var count = 0;
            $.each(objs, function (i, v) {
                //if ($(v).prop("checked") == true) {
                if (count > 0) {
                    back += ",";
                }
                //var Test = ($(v).prop("value");
                back += ($(v).prop("value"));//back內存有勾選的[代碼]
                count += 1;
                //}
            });
            val_M(idOrClassName, back);
            Check_Item = back;//被勾選的項目(回傳html中的value值:代碼)
            Check_Item_Ary = Check_Item.split(',');//畫面中被勾選的項目(代碼)


        };
        var checkboxes = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有checkbox的值(功能項目)
        var checkboxes_all_num = checkboxes.length;//所有checkbox的數目
        for (let i = 0; i < checkboxes_all_num; i++) {
            //checkbox_name = checkboxes_checked[i].name.toString();//勾選到的第2個項目(per_add_1)
            checkbox_name = checkboxes[i].name.toString();//勾選到的第2個項目(per_add_1)
            //alert(checkbox_name);//(per_read_1)
            //checkbox_value_true = checkboxes_checked[i].checked.toString();//勾選到的第2個項目(true)
            checkbox_value_true = checkboxes[i].checked.toString();//勾選到的第2個項目(TrueOrFalse)
            //alert(checkbox_value_true);//read
            checkbox_name_value = checkbox_name + "_" + checkbox_value_true + "/" + checkbox_name_value;//依照畫面報表及權限得出的結果組成字串
            //alert(checkbox_name_value);

        }
        var afterSuccessFucForSmd = function () {
            //alert('call afterSuccessFucForSmd');
            onChange_M(".messagePublic", function () {
                var type = val_M("#smdM_MP");
                var sendType = val_M("#smdType");
                var htmlTag = "";
                if (sendType == "single") {
                    htmlTag = "radio";
                    disabledFalse_M("#smdM_TEL");
                    hide_M("#allCheck");
                    $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#smdM_MP", type, htmlTag);
                } else {
                    htmlTag = "checkbox";
                    disabledTrue_M("#smdM_TEL");
                    show_M("#allCheck");
                    $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#smdM_MP", type, htmlTag, getListByViewtag0, emptyValue_M, true);
                }
            });
        };
        var startThisPage = function () {

            onClick_M("#assignCase", assignCase);//派發案件
            onClick_M("#QueryClick", QueryData);//送出查詢
            onClick_M("#QueryClick0", CaseTransfer);//案件轉檔
            //開始畫面()
            //20220705進度
            //ComID_M(HG01)
            //U_Num_M(B1103011)
            //取得交易狀態
            //取得派發人員
            //            //
            //取得資源帳號下拉式選單選項
            //$Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "getAnalystListFuc", emptyValue_M, "option");//20220704Test(取得資源帳號下拉式選單選項)
            //getZitemListFuc
            //取得資源帳號HtmlTagOption列表
            //$Common.MUSER.getZItemListHtmlTagOption(CommonHandlerUrl_M, "getAnalystListFuc", ComID_M, U_Num_M, "option", afterSuccessFucForSmd);
            //$Common.MUSER.getZItemListHtmlTagOption(CommonHandlerUrl_M, "getAnalystListFuc", ComID_M, U_Num_M, "option");//20220705Test(取得資源帳號下拉式選單選項)
            //20220705pm(取得資源帳號下拉式選單選項)
            //$Common.MUSER.getZItemListHtmlTagOption(CommonHandlerUrl_M, "getAnalystListFuc", ComID_M, U_Num_M, "option");//20220705Test(取得資源帳號下拉式選單選項)
            //Q_Analyst
            //$Common.MUSER.getTradingStatusListTagOption(CommonHandlerUrl_M, "TradingStatus", ComID_M, U_Num_M, "option");//20220706(取得交易狀態下拉式選單選項)

            $Common.MUSER.getMCListHtmlTagOption(CommonHandlerUrl_M, "#Q_MC", emptyValue_M, "option");//20221005取得責任助理
            //I_MC
            $Common.MUSER.getMCListHtmlTagOption(CommonHandlerUrl_M, "#I_MC", emptyValue_M, "option");//20221005取得轉入責任助理
            //$Common.MUSER.getResponsibleAssistantListHtmlTagOption(CommonHandlerUrl_M, "#Q_MC", emptyValue_M, "option");//20221005取得責任助理
            //取得派發人員勾選項目
            //$Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "#AnalystCheckBoxDiv", ComID_M, "checkbox");//取得派發人員勾選項目
            //取得派發人員勾選項目
            //$Common.MUSER.getDispatcherListHtmlTagOption(CommonHandlerUrl_M, "#AnalystCheckBoxDiv", ComID_M, U_Num_M, "checkbox");//取得派發人員勾選項目
            //var data = "U_Num=" + U_Num_M + "&action=getMUSERData";
            //var success = function (back) {
            //    var json = jsonParse_M(back);
            //    CustomerDataJson_G = json;//取回的資料內容
            //    if (back != "成功") {
            //        makeHtml();
            //    }
            //};
            //var error = function (e) { Log_M("deleteMailData error=" + e); unBlockUI_M(); };
            //ajax_M(CustomerManageHandlerUrl_G, data, success, error);//<===

        };
        //
        $(function () {
            $("span[errormessage]")
                .addClass("aspNetVldrMark") //add class mark for latter access
                .each(function () {
                    var $spn = $(this);
                    //set errormessage as title to display when hover
                    $spn.attr("title", $spn.attr("errormessage"))
                        //add wrapper on innerText
                        .html("<span>" + $spn.html() + "</span>");
                });
            //blinking effect
            setInterval(function () {
                $("span.aspNetVldrMark > span").toggle();
                //or blink only the visible spans
                //$("span.aspNetVldrMark").filter(function () {
                //    return this.style.visibility == "visible";
                //}).children("span").toggle();
            }, 400);
        });
        //

        //頁面載入後自動執行
        $(function () {

            startThisPage();
            //查看使用者權限
            //getUserAuthority_M(startThisPage);
        })


    </script>

    </div>

</asp:Content>

