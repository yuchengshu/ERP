<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OINVO_query_01.aspx.cs" Inherits="OINVO_query_01" %>

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
                            <h1 class="box-title"><b>ERP > 人事財務部 > 待開發票作業-線上</b></h1>
                            <br />
                            <br />
                            <br />


                            <input id="MeetingDate" class="datepicker" placeholder="會場日期(開始日)" type="text" />~
                                 <input id="MeetingDate0" class="datepicker" placeholder="會場日期(結束日)" type="text" />關鍵字:<input type="text" name="message" placeholder="查尋關鍵字..." id="keyWord"><input type="submit" name="submit0" class="btn" value="查詢" onclick="QueryData()">
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table width="100%" border="0" cellspacing="0" cellpadding="1">
                            <thead id="">
                                <tr class="bgBlue">
                                    <th class="" style="width: 10%; text-align: center;">交易編號</th>
                                    <th class="" style="width: 10%; text-align: center;">開立日期</th>
                                    <th class="" style="width: 5%; text-align: center;">姓名</th>
                                    <th class="" style="width: 10%; text-align: center;">分析師-種類</th>
                                    <th class="" style="width: 10%; text-align: center;">金流</th>
                                    <th class="" style="width: 10%; text-align: center;">付款方式</th>
                                    <th class="" style="width: 10%; text-align: center;">金額</th>
                                    <th class="" style="width: 15%; text-align: center;">發票明細</th>
                                    <th class="" style="width: 15%; text-align: center;">發票號碼</th>
                                    <th class="" style="width: 5%; text-align: center;">全選 / 清除</th>


                                </tr>

                            </thead>
                            <tbody id="OINVO_query_01Data">
                            </tbody>
                        </table>
                        <div style="text-align: center">
                            <div id="pageBar" style="margin: 0 auto;"></div>
                        </div>
                    </div>
                    <%--按下送出後更新--%>
                    <input type="submit" name="submit" class="btn" value="開立發票" onclick="InvoiceCreate()">
                </div>
                <span class="input-group-btn"></span>
            </div>
    </div>
    <%-- </div>
    </div>
        </section>
    </div>--%>
    <script src="<%=getRelativePath()%>js/pageList/OINVOqueryDataPageList.js" type="text/javascript"></script>
    <script>
        var OINVO_qyery_01DataHandlerUrl_G = "/Manage/Form/MAOINVO/OINVO_query_01Handler.ashx";
        var OINVO_qyery_01DataJson_G = null;
        var MENU_no_G = "<%=getMENU_no()%>";
        //傳入的使用者員工編號
        var getUser_Num_M = "<%=getU_Num()%>";
        ////傳入的使用者員工姓名
        var getU_Name = "<%=getU_Name()%>";
        //操作者的員工編號
        var getEditU_Num = "<%=getEditU_Num()%>";
        var IP_M = "<%=getIP()%>";
        var getU_Num = "<%=getU_Num()%>";
        //alert(User_Num_M);
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
                startThisPage();
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
            //$("#pageNum").empty();
            append_M("#pageNum", NowPage_G + "/" + TotalPage_G);
            //$("#pageNum").append(NowPage_G + "/" + TotalPage_G);
            onClick_M(".pageNum", pageNumClick);
            //$(".pageNum").on("click", pageNumClick);
        };

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
        //生成畫面(20221019修改這裡)
        var makeHtml = function () {
            $("#OINVO_query_01Data").empty();
            if (OINVO_qyery_01DataJson_G.length != 0) {
                var sb = new string_M.StringBuilder();
                var n = 0;
                var startCount = (NowPage_G - 1) * 30 + 1;
                var endCount = 30 * NowPage_G;
                var isMember = false;
                $.each(OINVO_qyery_01DataJson_G, function (i, v) {
                    n += 1;
                    if (n >= startCount && n <= endCount) {
                        sb.append("<tr><th class='text-center'>");
                        sb.append(v.T_ID);//交易編號
                        //sb.append("</th><th class='text-center'>");
                        sb.append("</th>");
                        sb.append("<th class='text-center'>");
                        sb.append(v.inv_createdate);////開立日期
                        sb.append("</th>");
                        sb.append("<th class='text-center'>");
                        sb.append(v.M_Name);//姓名
                        sb.append("</th>");
                        sb.append("<th class='text-center'>");
                        sb.append(v.Analyst_Kind);//分析師-種類
                        sb.append("</th>");
                        sb.append("<th class='text-center'>");
                        sb.append(v.mt_com);//金流
                        sb.append("</th>");
                        sb.append("<th class='text-center'>");
                        sb.append(v.Pay_Type);//付款方式
                        sb.append("</th>");
                        sb.append("<th class='text-center'>");
                        sb.append(v.T_PayMoney);//金額
                        sb.append("</th>");
                        sb.append("<th class='text-center'>");
                        //sb.append(v.T_PayMoney);//發票明細(20221020這裡要修改!!!!!!!)
                        sb.append("發票種類:");
                        sb.append(v.Inv_item);
                        sb.append("<BR>")
                        sb.append("公司抬頭:");
                        sb.append(v.Inv_item);
                        sb.append("<BR>")
                        sb.append("公司統編：");
                        sb.append(v.Inv_Uniform);
                        sb.append("<BR>")
                        sb.append("寄發狀況：");
                        sb.append(v.Inv_SendState);
                        sb.append("</th>");
                        sb.append("<th class='text-center'>");
                        sb.append(v.Inv_num);//發票號碼
                        //sb.append("<td align=left>");
                        //sb.append("發票種類:")
                        //sb.append(v.Inv_num);//發票號碼
                        sb.append("</th>");
                        sb.append("<th class='text-center'><input type='checkbox' id='OINVO_TID_' name='OINVO_TID_");//讀取
                        sb.append(v.T_ID);//交易編號
                        sb.append("</th>");
                        //sb.append("<th class='text-center'><input type='checkbox'name='per_open'") +
                        sb.append(v.REPO_no);
                        sb.append("'");
                        //sb.append("onchange=reportstatechenge(this); class='form-check-input' value =");//加入勾選變動時觸發事件statge(this
                        sb.append(" class='form-check-input' value ='");
                        sb.append(v.REPO_no);
                        sb.append("'");
                        var checkboxvalue = parseInt(v.per_open);//查詢權限
                        if (checkboxvalue == 1) {
                            //sb.append("checked></th></tr>");//有勾
                            sb.append("' checked='checked'></th>");//有勾
                            //  sb.append("'></th>");//沒
                        }
                        else {
                            sb.append("'></th>");//沒
                        }

                        sb.append("</tr>");
                    }

                });


                TotalPage_G = getTotalPage(n);
                //alert('append_M("#customerData", sb.toString());');
                append_M("#OINVO_query_01Data", sb.toString());
                // $("#customerData").append(sb.toString());
                onClick_M(".deleteCustomerData", function () {
                    var MID = $(this).attr("MID");
                    var r = confirm("刪除後資料將無法恢復，確定刪除?");
                    console.log(r);
                    if (r == true) {
                        deleteCustomerData(MID);
                    }

                });
                $(".deleteCustomerData").on("click", function () {
                    var MID = $(this).attr("MID");
                    var r = confirm("刪除後資料將無法恢復，確定刪除?");
                    console.log(r);
                    if (r == true) {
                        deleteCustomerData(MID);
                    }

                });
            } else {
                alert("查無資料");
                NowPage_G = 1;
                TotalPage_G = 1;
            }
            //製作頁數列表
            getPageList();

            //頁面解鎖
            unBlockUI_M();
        };
        var IP_G = "<%=getIP()%>";

        var getchecked = function () {
            var array = []
            var checkboxes = document.querySelectorAll('input[type=checkbox]:checked')

            for (var i = 0; i < checkboxes.length; i++) {
                array.push(checkboxes[i].value);
                console.log(checkboxes[i].value);
            }

        };
        //取得checkbox全部的value用'，'串成字串並返回其值 getAllcheckBoxValue_M
        var getAllcheckBoxValue_M = function (groupName) {
            var checkboxGroup = $(groupName);
            var backStr = undefined;
            var checkedCount = 0;
            $.each(checkboxGroup, function (i, v) {
                if ($(v).prop("checked")) {
                    if (checkedCount == 0) {
                        backStr = $(v).val();
                        checkedCount += 1;
                    } else {
                        backStr += ",";
                        backStr += $(v).val();
                        checkedCount += 1;
                    }
                }
            });
            return backStr;
        };

        var ajax_M_GET = function (url, data, success, error) {
            $.ajax({
                url: url,
                data: data,
                method: 'GET',
                success: success,
                error: error
            });
        };
        var OINVO_qyery_01DataHandlerUrl_G = "/Manage/Form/MAOINVO/OINVO_query_01Handler.ashx";
        //var OINVO_qyery_01DataJson_G = null;
        //var MREPOqueryDataHandlerUrl_G = "/Manage/Report/MREPO_queryHandler.ashx";
        var jsonParse_M = function (str) {
            return JSON.parse(str);
        };

        var InvoiceCreateURL = "https://www.hwa-guan.com.tw/Financial/Add";
        var InvoiceCreate = function () {
            //
            $.ajax({
                type: 'post',
                url: "InvoiceCreateURL" + "?aaa=" + 1 + "&bbb=" + 2,
                contentType: "application/json;utf-8",
                data: {},
                dataType: "json",
                async: false,
                success: function (result) {
                    alert(result.d);
                },
                error: function (result) {
                    var error = $.evalJSON(result.responseText);
                    alert(error.Message);
                }
            });


            //
            var checkboxes_all = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有checkbox的值(功能項目)
            var checkboxes_checked = document.querySelectorAll('input[type=checkbox]:checked');//求出畫面中所有有勾選checkbox的值(有功能的項目)
            var checkboxes = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有checkbox的值(功能項目)
            var checkbox_name_value = "";
            var per_all = $('input[name="REPO_no"]');
            var per_open = $('input[name="REPO_no"]');
            //getCheckBoxValueStr_ALL(per_all, "#REPO_no");//20221004修正WORK
            //getCheckBoxValueStr(per_open, "#REPO_no");
            var checkboxes = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有checkbox的值
            var True_False_Value = checkboxes[2].checked.toString();//checkbox是否勾選(True/False)
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
            //
            var checklength = $("input:checkbox[id='OINVO_TID_']:checked").length;
            $("input[type='checkbox']").each(function () {
                if ($(this).prop("checked")) {
                    var delei = $(this).closest)('tr').find('td').eq(1).text();
            alert(delei);
        }
        // });
        alert("InvoiceCreate");//開立發票
        var data = "action=TestErpInvoiceCreate+ &aaa=" + "12345678" + " &bbb=" + "12345678";
        //+ val_M("#keyWord") + "&PayStatus=" + val_M("#PayStatus") + "&U_MDEP=" + U_MDEP_M + "&ComID=" + ComID_M;
        var success = function (back) {
            alert('InvoiceCreate Success!');
            //var json = jsonParse_M(back);
            //OINVO_qyery_01DataJson_G = jsonParse_M(back);
            ////$muser_MenuSetupPageList.Table.makeTbody("#MUSER_MenuSetupData", json, 10, "#pageBar", deleteData, getMid);
            //makeHtml();
        };
        var error = function (e) {
            alert('InvoiceCreate Fail!!');
        };
        //ajax_M_GET(InvoiceCreateURL, data, success, error);
        ajax_M(InvoiceCreateURL, data, success, error);

        //checkbox勾選時觸發
        //function reportstatechenge(e) {
        //    alert('reportstatechenge');
        //    var state = e.name.substring(4, 5);//決定要執行的修改的權限種類 e:編輯權限,a:新增權限,d:刪除權限,r:讀取權限
        //    var menu_no = e.name.substring(8, 11);//取出menu_no
        //    //alert(state);//要執行的修改的權限
        //    //alert(menu_no);//要修改的功能代碼
        //    //alert(getUser_Num_M);//要修改的員工編號
        //    var data = "&User_Num_M=" + getUser_Num_M + "&menu_no=" + menu_no + "&state=" + state + "&action=reportstatechenge";
        //    var success = function (back) {
        //        var json = jsonParse_M(back);
        //        $muser_MenuSetupPageList.Table.makeTbody("#MUSER_MenuSetupData", json, 10, "#pageBar", deleteData, getMid);
        //    };
        //    var error = function (e) { Log_M("MUSER_MenuSetupData error=" + e); unBlockUI_M(); };
        //    ajax_M(MREPOqueryDataHandlerUrl_G, data, success, error);

        //    //name='per_add_"
        //    //var new_name = e.name.substring(8);//MENU_no的編號
        //    if (e.checked) {
        //        // alert("[" +  + "]" + e.name + "[" + new_name + "]" + ' open');
        //        //呼叫開啟權限function
        //        //boxTxt.innerText = "開";
        //    } else {
        //        // alert("[" + getUser_Num_M + "]" + e.name + "[" + new_name + "]" + ' close');
        //        //呼叫關閉權限function
        //        // boxTxt.innerText = "關";
        //    }
        //    //startThisPage();
        //};
        //傳送資料 ajax_M
        var ajax_M = function (url, data, success, error) {
            alert('call AJAX!');
            $.ajax({
                url: url,
                data: data,
                method: 'POST',
                success: success,
                error: error
            });
        };
        var getOINVO_qyery_01Data = function () {
            var data = "action=getMUSER_MenuSetupData" + "&keyWord=" + val_M("#keyWord") + "&PayStatus=" + val_M("#PayStatus") + "&U_MDEP=" + U_MDEP_M + "&ComID=" + ComID_M;
            var success = function (back) {
                var json = jsonParse_M(back);
                OINVO_qyery_01DataJson_G = jsonParse_M(back);
                //$muser_MenuSetupPageList.Table.makeTbody("#MUSER_MenuSetupData", json, 10, "#pageBar", deleteData, getMid);
                makeHtml();
            };
            var error = function (e) { Log_M("MUSER_MenuSetupData error=" + e); unBlockUI_M(); };
            ajax_M(OINVO_qyery_01DataHandlerUrl_G, data, success, error);
        };
        //var getMUSER_MenuSetupquery = function () {
        //    var data = "action=getMUSER_MenuSetupData" + "&keyWord=" + val_M("#keyWord") + "&PayStatus=" + val_M("#PayStatus") + "&U_MDEP=" + U_MDEP_M + "&ComID=" + ComID_M;
        //    var success = function (back) {
        //        var json = jsonParse_M(back);
        //        $muser_MenuSetupPageList.Table.makeTbody("#MUSER_MenuSetupData", json, 10, "#pageBar", deleteData, getMid);
        //    };
        //    var error = function (e) { Log_M("MUSER_MenuSetupData error=" + e); unBlockUI_M(); };
        //    ajax_M(MREPOqueryDataHandlerUrl_G, data, success, error);
        //};
        var obj = { key: 'value' };

        function getProperty(obj) {
            var o = obj.key;
            return (o);
        }

        //var UpdateData = function () {
        //    alert('Click!');//按下更新後!!(20220805)
        //    getchecked();
        //    var array = [];
        //    var checkboxes_checked_string = "";
        //    var checkbox_name_value = "";
        //    var checkboxes_checked_MenuNo_string = "";
        //    var checkboxes_checked_Fun_string = "";
        //    var Menu_no_all = [];
        //    var array = [];
        //    var checkboxes_all = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有checkbox的值
        //    True_False_Value = checkboxes_all[2].checked.toString();//checkbox是否勾選(True/False)
        //    Name = checkboxes_all[0].name.toString();
        //    var checkboxes = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有checkbox的值(功能項目)
        //    var checkboxes_after = document.querySelectorAll('input[type=checkbox]:checked');//求出畫面中所有有勾選checkbox的值
        //    var checkboxes_all_num = checkboxes_all.length;//所有checkbox的數目
        //    var checkboxes_checked = document.querySelectorAll('input[type=checkbox]:checked');//求出畫面中所有有勾選checkbox的值(有功能的項目)

        //    var column = checkboxes_all_num;//共幾行
        //    var checkboxname = document.getElementById(checkboxes_after[0].value);
        //    alert(checkboxname);
        //    for (let i = 0; i < checkboxes_all_num; i++) {
        //        //checkbox_name = checkboxes_checked[i].name.toString();//勾選到的第2個項目(per_add_1)
        //        checkbox_name = checkboxes[i].name.toString();//勾選到的第2個項目(per_add_1)
        //        //alert(checkbox_name);//(per_read_1)
        //        //checkbox_value_true = checkboxes_checked[i].checked.toString();//勾選到的第2個項目(true)
        //        checkbox_value_true = checkboxes[i].checked.toString();//勾選到的第2個項目(TrueOrFalse)
        //        //alert(checkbox_value_true);//read
        //        checkbox_name_value = checkbox_name + "_" + checkbox_value_true + "/" + checkbox_name_value;
        //        //alert(checkbox_name_value);

        //    }
        //    var tags = document.getElementsByTagName('input');
        //    for (var i = 0; i < tags.length; i++) {
        //        if (tags[i].name.substr(0, 3) == "per") {
        //            if (tags[i].checked) {

        //                //在這裡進行有核取的處理

        //                // 被核取的值取法  tags[i].value
        //            }
        //        }
        //    }

        //};
        //var Check_Item_ALL;//被勾選的項目
        //var Check_Item_Ary;//被勾選的項目(代碼)
        //var getCheckBoxValueStr_ALL = function (objs, idOrClassName) {
        //    var back = "";
        //    var count = 0;
        //    $.each(objs, function (i, v) {
        //        //if ($(v).prop("checked") == true) {
        //        if (count > 0) {
        //            back += ",";
        //        }
        //        //var Test = ($(v).prop("value");
        //        back += ($(v).prop("value"));//back內存有勾選的[代碼]
        //        count += 1;
        //        //}
        //    });
        //    val_M(idOrClassName, back);
        //    Check_Item = back;//被勾選的項目(回傳html中的value值:代碼)
        //    Check_Item_Ary = Check_Item.split(',');//畫面中被勾選的項目(代碼)


        //};
        //var Check_Item;//被勾選的項目
        //var Check_Item_Ary;//被勾選的項目(代碼)
        //var getCheckBoxValueStr = function (objs, idOrClassName) {
        //    var back = "";
        //    var count = 0;
        //    $.each(objs, function (i, v) {
        //        if ($(v).prop("checked") == true) {
        //            if (count > 0) {
        //                back += ",";
        //            }
        //            //var Test = ($(v).prop("value");
        //            back += ($(v).prop("value"));//back內存有勾選的[代碼]
        //            count += 1;
        //        }
        //    });
        //    val_M(idOrClassName, back);
        //    Check_Item = back;//被勾選的項目(回傳html中的value值:代碼)
        //    Check_Item_Ary = Check_Item.split(',');//畫面中被勾選的項目(代碼)


        //};
        //function handleCheck(e) {
        //    //alert('!!');
        //    let inBetween = false;

        //    if (this.checked) {
        //        checkboxes.forEach(checkbox => {
        //            // 當前點選的checkbox開始記錄到最後一個點選的checkbox關閉標記
        //            if (checkbox === this || checkbox === lastChecked) {
        //                inBetween = !inBetween;
        //                console.log('STarting to check them inbetween!');
        //            }
        //            // 勾選區間內為true的checkbox
        //            if (inBetween) {
        //                checkbox.checked = true;
        //            }
        //        });
        //    }
        //    lastChecked = this;
        //}
        var startThisPage = function () {

            //            var data = "U_Num=" + getUser_Num_M + "&action=getMREPO_qyeryDataList";//20220810修改這裡!!!!!
            //取得待開發票作業-線上
            var data = "U_Num=" + getUser_Num_M + "&action=getOINVO_qyery_01DataList";//20220810修改這裡!!!!!
            var success = function (back) {
                var json = jsonParse_M(back);
                //OINVO_qyery_01DataJson_G = jsonParse_M(back);
                OINVO_qyery_01DataJson_G = json;//取回的資料內容(MUSERMenuSetupDataJson_G)
                if (back != "成功") {
                    makeHtml();
                }
            };
            var checkboxes1_before = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有checkbox的值
            var checkboxes_before = document.querySelectorAll('input[type=checkbox]:checked');//求出畫面中所有有勾選checkbox的值
            const checkboxes1 = document.querySelectorAll('input[type=checkbox]:checked');
            var checkboxes999 = document.querySelectorAll('input[type=checkbox]:checked');//求出畫面中所有有勾選checkbox的值
            var checkboxes111 = document.querySelectorAll('input[type=checkbox]:checked');//求出畫面中所有有勾選checkbox的值
            var checkboxes2 = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有有勾選checkbox的值
            var checkboxes3 = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有有勾選checkbox的值
            let lastChecked;
            var error = function (e) { Log_M("deleteMailData error=" + e); unBlockUI_M(); };
            ajax_M(OINVO_qyery_01DataHandlerUrl_G, data, success, error);//<===

        };
        function Return() {
            //alert("Return!!");
            //Response.redirect("~/MUSER_query.aspx");
            this.close();
        }

        //頁面載入後自動執行
        $(function () {
            startThisPage();
            //查看使用者權限
            //getUserAuthority_M(startThisPage);
        })


    </script>
</asp:Content>

