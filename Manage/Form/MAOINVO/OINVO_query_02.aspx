<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OINVO_query_02.aspx.cs" Inherits="OINVO_query_02" %>

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
                            <h1 class="box-title"><b>ERP > 人事財務部 > 待開發票作業-特種電子(瑞兔)</b></h1>
                            <br />
                            <br />
                            <br />
                            <input id="MeetingDate" class="datepicker" placeholder="會場日期(開始日)" type="text" />~
                                 <input id="MeetingDate0" class="datepicker" placeholder="會場日期(結束日)" type="text" />關鍵字:<input type="text" name="message" placeholder="查尋關鍵字..." id="keyWord"><input type="submit" name="submit0" class="btn" value="查詢" onclick="QueryData()">
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
                                <tbody id="OINVO_query_02Data">
                                </tbody>
                            </table>
                            <div style="text-align: center">
                                <div id="pageBar" style="margin: 0 auto;"></div>
                            </div>
                        </div>
                        <%--按下送出後更新--%>
                        <input type="submit" name="submit0" class="btn" value="開立發票1" onclick="InvoiceCreateURL1()">
                        <input type="submit" name="submit1" class="btn" value="開立發票2" onclick="InvoiceCreate()">
                        <input type="submit" name="submit2" class="btn" value="開立發票3" onclick="InvoiceCreate()">
                        <input type="submit" name="submit3" class="btn" value="開立發票4" onclick="InvoiceCreate()">
                        <input type="submit" name="submit4" class="btn" value="開立發票5" onclick="Add()">
                    <input type="submit" name="InvoiceCreateTest0" class="btn" value="20221101|API測試_NEW" onclick="InvoiceCreate_20221103()">
                    </div>
                    <span class="input-group-btn"></span>
                </div>
            </div>
    </div>

    <script src="<%=getRelativePath()%>js/pageList/muser_MenuSetupPageList.js" type="text/javascript"></script>
    <script>
        var OINVO_qyery_02DataHandlerUrl_G = "/Manage/Form/MAOINVO/OINVO_query_02Handler.ashx";
        //var TestRsbitInvoiceCreateByValue_URL = "https://www.hwa-guan.com.tw/Financial/TestRsbitInvoiceCreate";//開發票API的網址
        var TestRsbitInvoiceCreateByValue_URL = "https://www.hwa-guan.com.tw/Financial/TestRsbitInvoiceCreate";//開發票API的網址

        var OINVO_qyery_02DataJson_G = null;
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
        var CountPerPage_G = 2;
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

            //$("#pageBar").append(sb.toString());
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
        //生成畫面(20220809修改這裡)
        var makeHtml = function () {
            $("#OINVO_query_02Data").empty();
            if (OINVO_qyery_02DataJson_G.length != 0) {
                var sb = new string_M.StringBuilder();
                var n = 0;
                var startCount = (NowPage_G - 1) * 30 + 1;
                var endCount = 30 * NowPage_G;
                var isMember = false;
                $.each(OINVO_qyery_02DataJson_G, function (i, v) {
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
                        sb.append("<th class='text-center'><input type='checkbox' name='OINVO_TID_' id='OINVO_TID_");//讀取
                        sb.append(v.T_ID);//交易編號
                        sb.append("'");
                        //sb.append("<th class='text-center'><input type='checkbox'name='per_open'") +
                        //sb.append(v.REPO_no);
                        //sb.append("'");
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
                append_M("#OINVO_query_02Data", sb.toString());
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
        ////checkbox勾選時觸發
        //function statechenge(e) {
        //    //name='per_add_"
        //    var new_name = e.name.substring(8);//MENU_no的編號
        //    if (e.checked) {
        //        alert("[" + getUser_Num_M +"]"+e.name + "[" + new_name + "]" + ' open');
        //        //呼叫開啟權限function
        //        //boxTxt.innerText = "開";
        //    } else {
        //        alert("[" + getUser_Num_M + "]"+e.name + "[" + new_name + "]" + ' close');
        //        //呼叫關閉權限function
        //       // boxTxt.innerText = "關";
        //    }
        //}

        //取得checkbox全部的value用'，'串成字串並返回其值 getAllcheckBoxValue_M
        //var getAllcheckBoxValue_M = function (groupName) {
        //    var checkboxGroup = $(groupName);
        //    var backStr = undefined;
        //    var checkedCount = 0;
        //    $.each(checkboxGroup, function (i, v) {
        //        if ($(v).prop("checked")) {
        //            if (checkedCount == 0) {
        //                backStr = $(v).val();
        //                checkedCount += 1;
        //            } else {
        //                backStr += ",";
        //                backStr += $(v).val();
        //                checkedCount += 1;
        //            }
        //        }
        //    });
        //    return backStr;
        //};
        //scriptH
        //MREPOqueryDataHandlerUrl_G
        //var MREPOqueryDataHandlerUrl_G = "/Manage/Report/MREPO_queryHandler.ashx";
        //var jsonParse_M = function (str) {
        //    return JSON.parse(str);
        //};
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
            /* alert('call customerManageHandler!!!!!'+url);*/
            $.ajax({
                url: url,
                data: data,
                method: 'POST',
                success: success,
                error: error
            });
        };
        var dataJSON = {};
        // dataJSON["Company"] = "華冠";
        dataJSON["aaa"] = 1;
        dataJSON["bbb"] = 99;
        //var data = {
        //    "company": dataJSON["company"],
        //    "relateNumber": dataJSON["relateNumber"],
        //    "customerID": dataJSON["aaa"],
        //    "customerName": dataJSON["aaa"],
        //    "customerAddr": dataJSON["aaa"],
        //    "customerPhone": dataJSON["aaa"],
        //    "customerEMail": dataJSON["aaa"],
        //    "customerTrader": dataJSON["aaa"],
        //    "invoice_item": dataJSON["aaa"],
        //    "carrierType": dataJSON["aaa"],
        //    "carruerNum": dataJSON["aaa"],
        //    "print": dataJSON["aaa"],
        //    "loveCode": dataJSON["aaa"],
        //    "customerIdentifier": dataJSON["aaa"],
        //    "salesAmount": dataJSON["aaa"],
        //    "invoiceRemark": dataJSON["aaa"],
        //    "itemName": dataJSON["aaa"],
        //    "itemCount": dataJSON["aaa"],
        //    "itemWord": dataJSON["aaa"],
        //    "itemPrice": dataJSON["aaa"],
        //    "itemDiscount": dataJSON["aaa"],
        //    "itemAmount": dataJSON["aaa"]
        //}
        var data = { "aaa": dataJSON["aaa"], "bbb": dataJSON["bbb"] };
        var jsonData = JSON.stringify(data);//將傳入的資料轉成json後傳入到ajax內
        var InvoiceCreateURL1 = function () {
            var checkboxes_checked = document.querySelectorAll('input[type=checkbox]:checked');//求出畫面中所有有勾選checkbox的值(有功能的項目)
            var checkboxes_all_num = checkboxes_checked.length;//所有有勾選checkbox的數目
            if (checkboxes_all_num > 0) {
                alert('Click');
                //    var array = [];
                //要傳入發票API的參數
                var Invoice_item = "";
                var Company = "";
                var ProductTag = "";
                var RelateNumber = "";
                var CustomerID = [];
                var CustomerIdentifier;
                var CustomerName = "";
                var INV_CarrierNum = "";
                var CustomerAddr = "";
                var CustomerPhone = "";
                var CustomerEMail = "";
                var CarruerNum = "";
                var LoveCode = "";
                var SalesAmount = "";
                var InvoiceRemark = "";
                var ItemName = "";
                var ItemCount = "";
                var ItemWord = "";
                var ItemPrice = "";
                var ItemAmount = "";
                var array = [];
                //
                //var checkboxes = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有checkbox的值
                //var checkboxes_all = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有checkbox的值
                //var checkboxes_checked = document.querySelectorAll('input[type=checkbox]:checked');//求出畫面中所有有勾選checkbox的值(有功能的項目)
                var test = checkboxes_checked[0];
                //var T_ID_Array = checkboxes_checked[0].id.toString().split('_');
                //var T_ID = T_ID_Array[2];//勾選到的T_ID
                var checkboxes_all_num = checkboxes_checked.length;//所有有勾選checkbox的數目
                //ERPInvoice erpInvoice = new ERPInvoice();

                dataType = "json";
                for (let i = 0; i < checkboxes_all_num; i++) {
                    var T_ID_Array = checkboxes_checked[i].id.toString().split('_');
                    var T_ID = T_ID_Array[2];//勾選到的T_ID
                    alert(Test(T_ID));//20221026
                    //由T_ID取得其他參數(GetItemByT_ID)
                    //    t_id = checkboxes_checked[i].id.toString().split('_');//t_id[2]選到的交易編號
                    //    alert(t_id[2]);
                    //var data = "action=GetItemByT_ID" + "&T_ID=" + T_ID;//由T_ID取得其他參數(GetItemByT_ID)

                    // var data = { "Company": dataJSON["Company"]  };//要傳入的資料
                    //var jsonData = JSON.stringify(data);//將傳入的資料轉成json後傳入到ajax內
                    var jsonData_TEST = {
                        "Company": "HG",
                        "RelateNumber": "111111111",
                        "ItemName": "aaa",
                        "ItemDiscount": "0",
                        "ItemPrice": "100",
                        "CustomerID": "0",
                        "CarrierType": "3J0002"
                    }
                    //alert("InvoiceCreate");//開立發票
                    //////////////////////////////////////////
                    dataType = "json";
                    data: jsonData_TEST;//20221027這邊要修改
                    var data_InvoiceCreate_Success = function (back) {
                        alert("Sum:" + back);
                        alert('InvoiceCreate Success!!');
                    };
                    //var Back_string = JSON.parse(back);
                    //var jsonData = jsonParse_M(back);
                    //var jsonData = {
                    //    "company": "HG",
                    //    "relateNumber":"111111111",
                    //    //"customerID": dataJSON["aaa"],
                    //    //"customerName": dataJSON["aaa"],
                    //    //"customerAddr": dataJSON["aaa"],
                    //    //"customerPhone": dataJSON["aaa"],
                    //    //"customerEMail": dataJSON["aaa"],
                    //    //"customerTrader": dataJSON["aaa"],
                    //    //"invoice_item": dataJSON["aaa"],
                    //    //"carrierType": dataJSON["aaa"],
                    //    //"carruerNum": dataJSON["aaa"],
                    //    //"print": dataJSON["aaa"],
                    //    //"loveCode": dataJSON["aaa"],
                    //    //"customerIdentifier": dataJSON["aaa"],
                    //    //"salesAmount": dataJSON["aaa"],
                    //    //"invoiceRemark": dataJSON["aaa"],
                    //    "itemName": "aaa",
                    //    //"itemCount": dataJSON["aaa"],
                    //    "itemDiscount": "0",
                    //    "itemPrice": "100",
                    //    "CustomerID": "0",
                    //    "CarrierType": "3J0002"
                    //}
                    //alert(json);
                    //加入呼叫取回發票號碼API(ajax)
                    //20221027進度!!!
                    //var data_InvoiceCreate = jsonData;
                    //var data_InvoiceCreate_Success = function (back) {
                    //    var data_InvoiceCreate = jsonParse_M(back);
                    //};
                    //var data_InvoiceCreate_error = function (e) {
                    //    alert("InvoiceCreate Fail");

                    //}
                    ////20221027要修改
                    var data_InvoiceCreate_error = function (e) {
                        alert('InvoiceCreate Fail!!');
                    };
                    ajax_M(InvoiceCreateURL1, jsonData, data_InvoiceCreate_Success, data_InvoiceCreate_error);//利用產生的詳細資料呼叫開發票API

                };
                error = function (e) {
                    alert('InvoiceCreate Fail!!');
                };
                ajax_M(OINVO_qyery_02DataHandlerUrl_G, data, success, error);//選取T_ID後產生詳細資料


                //}
                //開立發票
                //alert("InvoiceCreate");//開立發票
            }
            else {
                alert("請勾選項目!");
            }

        };
        function Test(a) {
            alert(a);
        };
        var dataJson = {};
        dataJson["A"] = 1;
        dataJson["B"] = 9;
        var data ={ "aaa": dataJson["A"], "bbb": dataJson["B"] };
        var jsonData = JSON.stringify(data);
        var Add = function () {
            alert('Add');
            dataType = "json";
            data: jsonData;
            var success1 = function (back) {
                alert('Ajax Call Add Success!');
            };
            var error1 = function (back) {
                alert('Ajax Call Add Fail!');
            };
            ajax_M_GET(InvoiceCreateURL_Add, jsonData, success1, error1);
        }
        //20221103新增綠兔開發票功能
        var InvoiceCreate_20221103 = function () {
            //alert('');
            var checkboxes_checked = document.querySelectorAll('input[type=checkbox]:checked');//求出畫面中所有有勾選checkbox的值(有功能的項目)
            var checkboxes_all_num = checkboxes_checked.length;//所有有勾選checkbox的數目
            var getU_Name = function (numA) {
                return U_name;
            };
            var T_ID2 = "";
            //取得開發票相關資訊並進行開立發票動作
            for (let i = 0; i < checkboxes_all_num; i++) {
                var T_ID_Array = checkboxes_checked[i].id.toString().split('_');
                var T_ID = T_ID_Array[2];//勾選到的T_ID
                //alert('勾選到的T_ID' + T_ID);
                //var GetPara = function (T_ID) {
                //    var Para = "";
                //    T_ID2 = "999";
                //    alert("GET:" + T_ID);
                //    alert(T_ID2);
                //}
                //GetPara(T_ID);
                //alert('InvoiceCreate_20221031');
                var dataJSON = {};
                //20221101
                var data_GetItemByT_ID = "T_ID=" + T_ID + "&action=GetItemByT_ID";//透過T_ID取得其他參數

                ////取得所選擇發票號碼相關資訊完成,進行開立發票動作(20221101)
                var GetItemByT_IDDataSuccess = function (back) {
                    //alert('由T_ID取得資料成功!');
                    var InvoiceCreateData = jsonParse_M(back);//取得所選擇發票號碼相關資訊
                    //建立測試資料
                    //InvoiceCreateData.Company = "華冠投顧股份有限公司";
                    //InvoiceCreateData.RelateNumber = "2022103109523029";
                    //InvoiceCreate.CustomerID = "cccccccccc";
                    //InvoiceCreate.CustomerEMail = "tony@gmail.com";
                    //InvoiceCreate.CustomerTrader = "gggggggggggg";
                    //InvoiceCreate.Invoice_item = "1";
                    //InvoiceCreate.CarruerNum = "";
                    //InvoiceCreate.Print = "2222";
                    //InvoiceCreate.LoveCode = "55135";
                    //InvoiceCreate.CustomerIdentifier = "16167498";
                    //InvoiceCreate.SalesAmount = "1";
                    //InvoiceCreate.InvoiceRemark = "ttttt3333";
                    //InvoiceCreate.itemName = "uuuuu4444";
                    //InvoiceCreate.itemCount = "1";
                    //InvoiceCreate.itemWord = "www666";
                    //InvoiceCreate.itemPrice = "2222";
                    //InvoiceCreate.itemDiscount = "0";
                    //InvoiceCreate.ItemAmount = "zzzz9999";

                    var InvoiceCreatesuccess = function (back) {
                        //var InvoiceNumber = jsonParse_M(back);//取得所選擇發票號碼相關資訊
                        var InvoiceNumber = back;//取得所選擇發票號碼相關資訊
                        alert('傳入的T_ID' + T_ID);
                        alert('開出的發票號碼:' + InvoiceNumber);
                        var UpdateInvoiceNumber = "T_ID=" + T_ID + "&InvoiceNumber=" + InvoiceNumber + "&action=UpdateInvoiceNumber";//透過T_ID取得其他參數
                        var UpdateInvoiceNumberSuccess = function (e) {

                            alert('發票紀錄更新成功!!');
                        }
                        var UpdateInvoiceNumberError = function (e) {
                            alert('發票紀錄更新失敗!!');
                        }
                        //將發票號碼更新回資料庫
                        ajax_M(OINVO_qyery_02DataHandlerUrl_G, UpdateInvoiceNumber, UpdateInvoiceNumberSuccess, UpdateInvoiceNumberError);
                    }
                    var InvoiceCreateerror = function (e) {
                        alert('開發票 Fail!!');
                    }
                    //進行開發票動作(呼叫綠兔測試用開發票)(20221104進度)
                    ajax_M(TestRsbitInvoiceCreateByValue_URL, InvoiceCreateData, InvoiceCreatesuccess, InvoiceCreateerror);
                };
                var error = function (e) {
                    alert('取詳細資訊 Fail!!');
                }
                //呼叫取得勾選T_ID的相關資訊
                alert('開始由TID取詳細資訊!!');
                ajax_M(OINVO_qyery_02DataHandlerUrl_G, data_GetItemByT_ID, GetItemByT_IDDataSuccess, error);
            }

            var jsonData = JSON.stringify(GetItemByT_IDDataSuccess);//將傳入的資料轉成json後傳入到ajax內
            var InvocieCreateTest_URL1 = "https://www.hwa-guan.com.tw/Financial/TestRsbitInvoiceCreate";
            //var TestRsbitInvoiceCreateByValue_URL = "https://www.hwa-guan.com.tw/Financial/TestRsbitInvoiceCreate";//開發票API的網址

            // var InvoiceCreateURL1 = "https://www.hwa-guan.com.tw/Financial/TestRsbitInvoiceCreateTotal";
            //    var array = [];
            ////要傳入發票API的參數
            //var Invoice_item = "";
            //var Company = "";
            //var ProductTag = "";
            //var RelateNumber = "";
            //var CustomerID = [];
            //var CustomerIdentifier;
            //var CustomerName = "";
            //var INV_CarrierNum = "";
            //var CustomerAddr = "";
            //var CustomerPhone = "";
            //var CustomerEMail = "";
            //var CarruerNum = "";
            //var LoveCode = "";
            //var SalesAmount = "";
            //var InvoiceRemark = "";
            //var ItemName = "";
            //var ItemCount = "";
            //var ItemWord = "";
            //var ItemPrice = "";
            //var ItemAmount = "";
            //var array = [];
            //
            //var checkboxes = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有checkbox的值
            //var checkboxes_all = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有checkbox的值
            //var checkboxes_checked = document.querySelectorAll('input[type=checkbox]:checked');//求出畫面中所有有勾選checkbox的值(有功能的項目)
            //var test = checkboxes_checked[0];
            //var T_ID_Array = checkboxes_checked[0].id.toString().split('_');
            //var T_ID = T_ID_Array[2];//勾選到的T_ID
            //var checkboxes_all_num = checkboxes_checked.length;//所有有勾選checkbox的數目
            //ERPInvoice erpInvoice = new ERPInvoice();

            /*dataType = "json";*/
            //for (let i = 0; i < checkboxes_all_num; i++) {
            //    var T_ID_Array = checkboxes_checked[i].id.toString().split('_');
            //    var T_ID = T_ID_Array[2];//勾選到的T_ID
            //    alert(Test(T_ID));//20221026
            //    //由T_ID取得其他參數(GetItemByT_ID)
            //    //    t_id = checkboxes_checked[i].id.toString().split('_');//t_id[2]選到的交易編號
            //    //    alert(t_id[2]);
            //    var data = "action=GetItemByT_ID" + "&T_ID=" + T_ID;//由T_ID取得其他參數(GetItemByT_ID)

            //    // var data = { "Company": dataJSON["Company"]  };//要傳入的資料
            //    var jsonData = JSON.stringify(data);//將傳入的資料轉成json後傳入到ajax內
            //    //alert("InvoiceCreate");//開立發票
            //    //////////////////////////////////////////
            //    dataType = "json";
            //    data: jsonData;//20221027這邊要修改
            //    success = function (back) {
            //        //alert('InvoiceCreate Success!!');
            //        //var Back_string = JSON.parse(back);
            //        var jsonData = jsonParse_M(back);
            //        //alert(json);
            //        //加入呼叫取回發票號碼API(ajax)
            //        //20221027進度!!!
            //        var data_InvoiceCreate = jsonData;
            //        var data_InvoiceCreate_Success = function (back) {
            //            var data_InvoiceCreate = jsonParse_M(back);
            //        };
            //        var data_InvoiceCreate_error = function (e) {
            //            alert("InvoiceCreate Fail");

            //        }
            //        ajax_M(InvoiceCreateURL, data_InvoiceCreate, data_InvoiceCreate_Success, data_InvoiceCreate_error);//利用產生的詳細資料呼叫開發票API

            //    };
            //    error = function (e) {
            //        alert('InvoiceCreate Fail!!');
            //    };
            //    ajax_M(OINVO_qyery_01DataHandlerUrl_G, data, success, error);//選取T_ID後產生詳細資料

            //    //}
            //    //開立發票
            //    //alert("InvoiceCreate");//開立發票

            //};
            //function Test(a) {
            //    alert(a);
            //}
            //var data_Test = jsonData_Test;
            //var jsonData = JSON.stringify(data);//將傳入的資料轉成json後傳入到ajax內
            //data_Test: jsonData;
            //success = function (back) {
            //    alert('InvoiceCreate Success!!');
            //    var Back_string = JSON.parse(back);
            //    alert(Back_string);

            //};
            //error = function (e) {
            //    alert('InvoiceCreate Fail!!');
            //};

            //ajax_M_GET(InvoiceCreateURL, data, success, error);
            //alert('POST');
            //InvocieCreateTest_URL

            //var InvocieCreateTest_URL = "https://www.hwa-guan.com.tw/Financial/TestRsbitInvoiceCreate";

            ajax_M(InvocieCreateTest_URL1, jsonData, success, error);//POST
            //alert('GET')
            //ajax_M_GET(InvoiceCreateTest_URL, data_Test, success, error);//GET
            /////////////////////////////////////////
        }


        var getMUSER_MenuSetupquery = function () {
            var data = "action=getMUSER_MenuSetupData" + "&keyWord=" + val_M("#keyWord") + "&PayStatus=" + val_M("#PayStatus") + "&U_MDEP=" + U_MDEP_M + "&ComID=" + ComID_M;
            var success = function (back) {
                var json = jsonParse_M(back);
                $muser_MenuSetupPageList.Table.makeTbody("#MUSER_MenuSetupData", json, 10, "#pageBar", deleteData, getMid);
            };
            var error = function (e) { Log_M("MUSER_MenuSetupData error=" + e); unBlockUI_M(); };
            ajax_M(OINVO_qyery_02DataHandlerUrl_G, data, success, error);
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
        var obj = { key: 'value' };

        function getProperty(obj) {
            var o = obj.key;
            return (o);
        }
        //https://www.hwa-guan.com.tw/TestErpInvoiceCreate
        //https://www.hwa-guan.com.tw/Financial/TestRsbitInvoiceCreate
        var InvoiceCreateURL = "https://www.hwa-guan.com.tw/Financial/TestRsbitInvoiceCreate";
        var InvoiceCreateURL_Add = "https://www.hwa-guan.com.tw/Financial/Add";
        //var InvoiceCreateURL1 = "https://www.hwa-guan.com.tw/Financial/TestRsbitInvoiceCreate";
        //var InvoiceCreateURL1 = "https://www.hwa-guan.com.tw/Financial/TestRsbitInvoiceCreate";
        var UpdateData = function () {
            alert('Click!');//按下開立發票後!!(20220805)
            getchecked();
            var array = [];
            var checkboxes_checked_string = "";
            var checkbox_name_value = "";
            var checkboxes_checked_MenuNo_string = "";
            var checkboxes_checked_Fun_string = "";
            var Menu_no_all = [];
            var array = [];
            var checkboxes_all = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有checkbox的值
            True_False_Value = checkboxes_all[2].checked.toString();//checkbox是否勾選(True/False)
            Name = checkboxes_all[0].name.toString();
            var checkboxes = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有checkbox的值(功能項目)
            var checkboxes_after = document.querySelectorAll('input[type=checkbox]:checked');//求出畫面中所有有勾選checkbox的值
            var checkboxes_all_num = checkboxes_all.length;//所有checkbox的數目
            var checkboxes_checked = document.querySelectorAll('input[type=checkbox]:checked');//求出畫面中所有有勾選checkbox的值(有功能的項目)

            var column = checkboxes_all_num;//共幾行
            var checkboxname = document.getElementById(checkboxes_after[0].value);
            alert(checkboxname);
            for (let i = 0; i < checkboxes_all_num; i++) {
                //checkbox_name = checkboxes_checked[i].name.toString();//勾選到的第2個項目(per_add_1)
                checkbox_name = checkboxes[i].name.toString();//勾選到的第2個項目(per_add_1)
                //alert(checkbox_name);//(per_read_1)
                //checkbox_value_true = checkboxes_checked[i].checked.toString();//勾選到的第2個項目(true)
                checkbox_value_true = checkboxes[i].checked.toString();//勾選到的第2個項目(TrueOrFalse)
                //alert(checkbox_value_true);//read
                checkbox_name_value = checkbox_name + "_" + checkbox_value_true + "/" + checkbox_name_value;
                //alert(checkbox_name_value);

            }
            var tags = document.getElementsByTagName('input');
            for (var i = 0; i < tags.length; i++) {
                if (tags[i].name.substr(0, 3) == "per") {
                    if (tags[i].checked) {

                        //在這裡進行有核取的處理

                        // 被核取的值取法  tags[i].value
                    }
                }
            }

        };
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
        var Check_Item;//被勾選的項目
        var Check_Item_Ary;//被勾選的項目(代碼)
        var getCheckBoxValueStr = function (objs, idOrClassName) {
            var back = "";
            var count = 0;
            $.each(objs, function (i, v) {
                if ($(v).prop("checked") == true) {
                    if (count > 0) {
                        back += ",";
                    }
                    //var Test = ($(v).prop("value");
                    back += ($(v).prop("value"));//back內存有勾選的[代碼]
                    count += 1;
                }
            });
            val_M(idOrClassName, back);
            Check_Item = back;//被勾選的項目(回傳html中的value值:代碼)
            Check_Item_Ary = Check_Item.split(',');//畫面中被勾選的項目(代碼)


        };
        function handleCheck(e) {
            //alert('!!');
            let inBetween = false;

            if (this.checked) {
                checkboxes.forEach(checkbox => {
                    // 當前點選的checkbox開始記錄到最後一個點選的checkbox關閉標記
                    if (checkbox === this || checkbox === lastChecked) {
                        inBetween = !inBetween;
                        console.log('STarting to check them inbetween!');
                    }
                    // 勾選區間內為true的checkbox
                    if (inBetween) {
                        checkbox.checked = true;
                    }
                });
            }
            lastChecked = this;
        }
        var startThisPage = function () {

            var data = "U_Num=" + getUser_Num_M + "&action=getOINVO_qyery_02DataList";//20220810修改這裡!!!!!
            var success = function (back) {
                var json = jsonParse_M(back);
                OINVO_qyery_02DataJson_G = json;//取回的資料內容(MUSERMenuSetupDataJson_G)
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
            ajax_M(OINVO_qyery_02DataHandlerUrl_G, data, success, error);//<===

        };
        function Return() {
            //alert("Return!!");
            //Response.redirect("~/MUSER_query.aspx");
            this.close();
        }
        //執行報表權限更新
        function UpDate() {
            //UpdateData();
            alert('Update!!');
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
            //20221004
            //進行更新資料
            //報表權限紀錄資料表([MRMAP])
            for (var i = 0; i < checkboxes_all_num; i++) {
                temp = checkboxes[i].name.toString().split('_');;//勾選到的第2個項目(per_add_1)
                Fun_Name = temp[0] + "_" + temp[1];
                REPO_no = temp[2];
                /*if (temp[1] != "select") {*/
                TrurOrFalse = checkboxes_all[i].checked.toString();//checkbox是否勾選(True/False)
                //var data = "action=updateMREPO_queryData" + "&Fun_Name=" + Fun_Name + "&Menu_No=" + Menu_No + "&TrueOrFalse=" + TrurOrFalse + "&User_Num=" + getUser_Num_M;
                var data = "action=updateMREPO_queryData" + "&REPO_no=" + REPO_no + "&TrueOrFalse=" + TrurOrFalse + "&User_Num=" + getUser_Num_M;

                var success = function (back) {
                    var json = jsonParse_M(back);

                }
                var error = function (e) { Log_M("MUSER_MenuSetupData error=" + e); unBlockUI_M(); };
                ajax_M(OINVO_qyery_02DataHandlerUrl_G, data, success, error);
            }
            //var checkboxes_checked = document.querySelectorAll('input[type=checkbox]:checked');//求出畫面中所有有勾選checkbox的值(有功能的項目)
            //var checkboxes = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有checkbox的值(功能項目)
            //step1:將畫面上所有的checkbox設為false
            //var data = "Check_Item_Ary_ALL=" + checkboxes_all + "&U_Num=" + getUser_Num_M + "&action=Reset";
            //var searchCustomerDataSuccess = function (back) {
            //    MREPOqueryDataJson_G = jsonParse_M(back);
            //    ////alert('show list2');
            //    //makeHtml();//<===
            //    //hide_M("#customerAdvSearchDiv");
            //    alert('更新成功！回到上一頁！');
            //    window.close();//關閉此畫面
            //    // User / MUSER_query.aspx
            //    //Response.Redirect("~/User/MUSER_query.aspx");

            //}
            //ajax_M(MREPOqueryDataHandlerUrl_G, data, searchCustomerDataSuccess);
            ////Check_Item_Ary:被勾選到的報表代碼
            //將畫面上有勾取的checkbox設為true
            //var data = "Check_Item_Ary=" + Check_Item_Ary + "&U_Num=" + getUser_Num_M + "&U_Name" + getU_Name + "&getEditU_Num" + getEditU_Num + "&IP_M=" + IP_M + "&action=Update";
            //var searchCustomerDataSuccess = function (back) {
            //    MREPOqueryDataJson_G = jsonParse_M(back);
            //    ////alert('show list2');
            //    //makeHtml();//<===
            //    //hide_M("#customerAdvSearchDiv");
            //    alert('更新成功！回到上一頁！');
            //    window.close();//關閉此畫面
            //    // User / MUSER_query.aspx
            //    //Response.Redirect("~/User/MUSER_query.aspx");

            //}
            //ajax_M(MREPOqueryDataHandlerUrl_G, data, searchCustomerDataSuccess);
            ////var per_open = $('input[name="per_open_"]');
            //////window.alert('Hi!');
            //////window.alert('Bye!');
            //getCheckBoxValueStr(per_open, "#REPO_no");
            //var Check = Check_Item_Ary;
            ////var test = $("#per_open").val();
            ////var pere = per_open;
            //var test = per_open;
            //alert(test);
        }
        //頁面載入後自動執行
        $(function () {

            startThisPage();
            //查看使用者權限
            //getUserAuthority_M(startThisPage);
            //查詢之功能繫結
            //onClick_M(".UpdateDataFuc", UpdateData);
            //const checkboxes1 = document.querySelectorAll('input[type=checkbox]:checked');
            //var checkboxes999= document.querySelectorAll('input[type=checkbox]:checked');//求出畫面中所有有勾選checkbox的值
            //var checkboxes111 = document.querySelectorAll('input[type=checkbox]:checked');//求出畫面中所有有勾選checkbox的值
            //var checkboxes2 = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有有勾選checkbox的值
            //var checkboxes3 = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有有勾選checkbox的值
            //let lastChecked;
            //checkboxes.forEach(checkbox => checkbox.name.addEventListener('click', handleCheck));
            //checkboxes.forEach(checkbox => checkbox1.addEventListener('click', handleCheck)); \
            //var checkboxes1 = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有checkbox的值
            //var checkbox = document.querySelector("input[name=checkbox]");
            //checkboxes.addEventListener('change', (e) => {
            //    if (e.target.checked) {
            //        //boxTxt.innerText = `開 ${e.target.checked}`;
            //        alert('Open');
            //    } else {
            //        //boxTxt.innerText = `關 ${e.target.checked}`;
            //        alert('Close');
            //    }
            //});

            //checkboxes999.addEventListener('change', (e) => {
            //    if (e.target.checked) {
            //        alert('Open');
            //        //boxTxt.innerText = `開 ${e.target.checked}`;
            //    } else {
            //        alert('Close');
            //        //boxTxt.innerText = `關 ${e.target.checked}`;
            //    }
            //});




        })


    </script>
</asp:Content>

