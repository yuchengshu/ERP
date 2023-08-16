<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Muser_MenuSetup.aspx.cs" Inherits="Manage_User_Muser_MenuSetup" %>

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
                            <h1 class="box-title"><b>ERP &gt;  員工資料維護作業-選單權限</b> </h1>
                            <br />
                            <br />
                            <br />
                            <a>使用者姓名：</a><a><%=getU_Name()%></a>　<a>員工代碼:<a><%=getU_Num()%></a></a>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table width="100%" border="0" cellspacing="0" cellpadding="1" id="Table1">
                                <thead id="">
                                    <tr class="bgBlue">
                                        <th class="" style="width: 10%; text-align: center;">MENU_no</th>
                                        <th class="" style="width: 10%; text-align: center;">選單代碼</th>
                                        <th class="" style="width: 20%; text-align: center;">選單名稱</th>
                                        <th class="" style="width: 10%; text-align: center;">查詢權限</th>
                                        <th class="" style="width: 10%; text-align: center;">新增權限</th>
                                        <th class="" style="width: 10%; text-align: center;">修改權限</th>
                                        <th class="" style="width: 10%; text-align: center;">刪除權限</th>
                                        <th class="" style="width: 10%; text-align: center;">進階查詢</th>
                                        <th class="" style="width: 10%; text-align: center;">全選/清除</th>


                                    </tr>

                                </thead>
                                <tbody id="MUSERSetupData">
                                </tbody>
                            </table>
                            <div style="text-align: center">
                                <div id="pageBar" style="margin: 0 auto;"></div>
                            </div>
                            <span class="input-group-btn"></span>
                        </div>
                    </div>
                </div>
                <%--按下送出後更新--%>
                <input type="submit" name="submit" class="btn" value="送　出" onclick="UpDate()">
                <input type="submit" name="submit" class="btn" value="回到員工資料維護作業" onclick="Return()">
            </div>
        </section>
    </div>
    <script src="<%=getRelativePath()%>js/pageList/muser_MenuSetupPageList.js" type="text/javascript"></script>
    <script>
        var MUSERMenuSetupHandlerUrl_G = "/Manage/User/Permission/MUSER_MenuSetupHandler.ashx";
        var MUSERMenuSetupDataJson_G = null;
        var MENU_no_G = "<%=getMENU_no()%>";
        //傳入的使用者員工編號
        var User_Num_M = "<%=getU_Num()%>";
        var checkboxes_after = [];//所有勾選到的權限項目
        <%--//傳入的使用者員工編號
        var getUser_Num_M = "<%=getU_Num()%>";--%>
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
        //生成畫面(20220808修改這裡)
        var makeHtml = function () {
            $("#MUSERSetupData").empty();
            if (MUSERMenuSetupDataJson_G.length != 0) {
                var sb = new string_M.StringBuilder();
                var n = 0;
                var startCount = (NowPage_G - 1) * 30 + 1;
                var endCount = 30 * NowPage_G;
                var isMember = false;
                $.each(MUSERMenuSetupDataJson_G, function (i, v) {
                    n += 1;
                    if (n >= startCount && n <= endCount) {
                        sb.append("<tr><th class='text-center'>");
                        sb.append(v.auto_id);//MENU_no
                        //sb.append("</th><th class='text-center'>");
                        sb.append("</th><th class=''>");
                        //加入顯示判斷條件(20220809)
                        if (v.top_id != 0 && v.sub_id == 0 && v.item_id == 0) {
                            sb.append("<font color=#005C9C><b>" + v.top_id + "</b></font>");
                            sb.append("<input type='hidden' name='menu_id_" + v.auto_id + "' value='" + v.top_id + "'>");
                        }
                        else if (v.top_id != 0 && v.sub_id != 0 && v.item_id == 0) {
                            sb.append("<p>&ensp;&ensp;&ensp;<font color=C40000><b>" + v.sub_id + "</b></font></p>");
                            sb.append("<input type='hidden' name='menu_id_" + v.auto_id + "' value='" + v.sub_id + "'>");
                        }
                        else if (v.top_id != 0 && v.sub_id != 0 && v.item_id != 0) {
                            //sb.append("<p>&ensp;&ensp;&ensp;&ensp;&ensp;</p>" + v.item_id);

                            sb.append("<p>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<b>" + v.item_id + "</b></font></p>");
                            // sb.append("<input type='hidden' name='menu_id" + v.auto_id) + "' value='" + v.iten_id + "'>");
                            sb.append("<input type='hidden' name='menu_id_" + v.auto_id + "' value='" + v.sub_id + "'>");
                        }
                        else if (v.top_id != 0 && v.sub_id == 0 && v.iten_id == 0) {
                            sb.append("<font color=#005C9><b>" + v.top_id + "</b></font>");
                            sb.append("<input type='hidden' name='menu_id_" + v.auto_id + "' value='" + v.top_id + "'>");
                        }
                        //sb.append(v.menu_id);//選單代碼
                        //
                        sb.append("</th><th class=''>");
                        //加入顯示判斷條件(20220809)
                        if (v.top_id != 0 && v.sub_id == 0 && v.item_id == 0) {
                            sb.append("<font color=#005C9C><b>" + v.menu_name + "</b></font>");
                            sb.append("<input type='hidden' name='menu_id" + v.auto_id + "' value='" + v.top_id + "'>");
                        }
                        else if (v.top_id != 0 && v.sub_id != 0 && v.item_id == 0) {
                            sb.append("<p>&ensp;&ensp;&ensp;<font color=C40000><b>" + v.menu_name + "</b></font></p>");
                            sb.append("<input type='hidden' name='menu_id" + v.auto_id + "' value='" + v.sub_id + "'>");
                        }
                        else if (v.top_id != 0 && v.sub_id != 0 && v.item_id != 0) {
                            //sb.append("<p>&ensp;&ensp;&ensp;&ensp;&ensp;</p>" + v.item_id);

                            sb.append("<p>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<b>" + v.menu_name + "</b></font></p>");
                            // sb.append("<input type='hidden' name='menu_id" + v.auto_id) + "' value='" + v.iten_id + "'>");
                            sb.append("<input type='hidden' name='menu_id" + v.auto_id + "' value='" + v.sub_id + "'>");
                        }
                        else if (v.top_id != 0 && v.sub_id == 0 && v.iten_id == 0) {
                            sb.append("<font color=#005C9><b>" + v.menu_name + "</b></font>");
                            sb.append("<input type='hidden' name='menu_id" + v.auto_id + "' value='" + v.top_id + "'>");
                        }
                        //sb.append(v.c);//選單名稱
                        sb.append("</th>");
                        sb.append("<th class='text-center'><input type='checkbox' aria-label='query' id='per_read_' name ='per_read_");//查詢
                        sb.append(v.auto_id);//代碼
                        sb.append("'");
                        sb.append(' class="form-check-input" value ="');
                        sb.append(v.auto_id);//代碼
                        sb.append('"');
                        var checkboxvalue = parseInt(v.per_edit);//修改權限
                        if (checkboxvalue == 1) {
                            sb.append(" checked='true'></th>");//有勾
                        }
                        else {
                            /* sb.append(" checked='false'></th>");//沒*/
                            sb.append(" ></th>");//沒
                        }
                        sb.append("</th>");
                        sb.append("<th class='text-center'><input type='checkbox' aria-label='add' id='per_add_' name='per_add_");//新增
                        sb.append(v.auto_id);//代碼
                        sb.append("'");
                        sb.append(' class="form-check-input" value ="');
                        sb.append(v.auto_id);//代碼
                        sb.append('"');
                        var checkboxvalue = parseInt(v.per_edit);//修改權限
                        if (checkboxvalue == 1) {
                            sb.append(" checked='true'></th>");//有勾
                        }
                        else {
                            /* sb.append(" checked='false'></th>");//沒*/
                            sb.append(" ></th>");//沒
                        }
                        sb.append("</th>");
                        sb.append("<th class='text-center'><input type='checkbox' aria-label='edit' id='per_edit_' name='per_edit_");//修改
                        sb.append(v.auto_id);//代碼
                        sb.append("'");
                        sb.append(' class="form-check-input" value ="');
                        sb.append(v.auto_id);//代碼
                        sb.append('"');
                        var checkboxvalue = parseInt(v.per_edit);//修改權限
                        if (checkboxvalue == 1) {
                            sb.append(" checked='true'></th>");//有勾
                        }
                        else {
                            /* sb.append(" checked='false'></th>");//沒*/
                            sb.append(" ></th>");//沒
                        }

                        sb.append("<th class='text-center'><input type='checkbox' aria-label='del' id='per_del_' name='per_del_");//刪除
                        sb.append(v.auto_id);//代碼
                        sb.append("'");
                        sb.append(' class="form-check-input" value ="');
                        sb.append(v.auto_id);//代碼
                        sb.append('"');
                        var checkboxvalue = parseInt(v.per_del);//刪除權限
                        if (checkboxvalue == 1) {
                            sb.append(" checked='true'></th>");//有勾
                        }
                        else {
                            /* sb.append(" checked='false'></th>");//沒*/
                            sb.append(" ></th>");//沒
                        }
                        //per_del
                        sb.append("<th class='text-center'><input type='checkbox' aria-label='query' id='per_query_' name='per_query_");//進階查詢
                        sb.append(v.auto_id);//代碼
                        sb.append("'");
                        sb.append(" class='form-check-input' value =");
                        sb.append(v.auto_id);//代碼
                        sb.append("'");
                        var checkboxvalue = parseInt(v.per_query);//進階查詢
                        if (checkboxvalue == 1) {
                            sb.append(" checked='true'></th>");//有勾
                        }
                        else {
                            /* sb.append(" checked='false'></th>");//沒*/
                            sb.append(" ></th>");//沒
                        }
                        //全選/清除欄位
                        //sb.append("<th class='text-center'><input type='checkbox' name='per_select'");
                        sb.append("<th class='text-center'><input type='checkbox' aria-label='select' id='per_select' name='per_select_");
                        sb.append(v.auto_id);//代碼
                        sb.append("'");
                        sb.append(" onchange=statechenge(this); class='form-check-input' value = '");
                        sb.append(v.auto_id);//代碼
                        sb.append("'");
                        var per = 0;
                        per = parseInt(v.per_edit) + parseInt(v.per_del) + parseInt(v.per_edit) + parseInt(v.per_add) + parseInt(v.per_read);
                        var checkboxvalue = parseInt(v.per_edit);//全選/清除
                        if (per == 5)//表示全部勾選
                        {
                            sb.append(" checked='true'></th>");//有勾
                        }
                        else
                        {
                            //sb.append(" checked='false'></th>");//沒
                            sb.append(" ></th>");//沒
                        }

                        //        <th class='text-center'>");
                        //sb.append(v.query);
                        //sb.append("</th>");
                        //if (isMember) {
                        //    sb.append("<th class='text-center'>-</th>");
                        //    isMember = false;
                        //} else {
                        //    sb.append("<th class='text-center'><a href='#' class='deleteCustomerData delPer' MID='");
                        //    sb.append(v.M_ID);
                        //    sb.append("'>刪</a></th>");
                        //}

                        sb.append("</tr>");
                    }

                });


                TotalPage_G = getTotalPage(n);
                //alert('append_M("#customerData", sb.toString());');
                append_M("#MUSERSetupData", sb.toString());



                //20220921加入全選/清除javaScript/jQuery語法
                //value:per_select19
                $("#per_select1").change(function () {
                    alert("CheckBox changed!");
                });

                $("#per_select20").change(function () {
                    alert("CheckBox changed!");
                });



                /////////////////////////////////////////////
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
        function Return() {
            this.close();
        }
        //按下[送出]
        function UpDate() {
            UpdateData();//進行權限更新
            alert('更新完畢!!');
            //var per_read = $('input[name="per_read"]');
            //var per_add = $('input[name="per_add"]');
            //var per_edit = $('input[name="per_edit"]');
            //var per_del = $('input[name="per_del"]');

            //getCheckBoxValueStr(per_read, "#per_read");
            //getCheckBoxValueStr(per_add, "#per_add");
            //getCheckBoxValueStr(per_edit, "#per_edit");
            //getCheckBoxValueStr(per_del, "#per_del");
            //var Check = Check_Item_Ary;
            //var test = $("#per_open").val();
            //var pere = per_open;
            /*var test = per_re*/ad;
            alert(test);
        }
        var getchecked = function () {
            //var array = []
            //var checkboxes = document.querySelectorAll('input[type=checkbox]:checked')

            //for (var i = 0; i < checkboxes.length; i++) {
            //    array.push(checkboxes[i].value);
            //    console.log(checkboxes[i].value);
            //}

        }
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
        //scriptH
        var Check_Item;//被勾選的項目
        var Check_Item_Ary;//被勾選的項目(代碼)
        //按下送出後,取得所有勾選項目,並針對勾選項目對資料庫進行更新動作
        var getCheckBoxValueStr = function (objs, idOrClassName) {
            var back = "";
            var count = 0;
            $.each(objs, function (i, v) {
                if ($(v).prop("checked") == true) {
                    alert(v.auto_id);
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
            //針對勾選項目對資料庫進行更新動作
            //var data = "Check_Item_Ary=" + Check_Item_Ary + "&U_Num=" + User_Num_M + "&action=getMUSER_MenuSetupDataUpdate";
            //UpdateData
            var data = "Check_Item_Ary=" + Check_Item_Ary + "&U_Num=" + User_Num_M + "&action=UpdateData";
            var upDateDBDataSuccess = function (back) {
                MPMMTELDataJson_G = jsonParse_M(back);
                ////alert('show list2');
                makeHtml();//<===
                //hide_M("#customerAdvSearchDiv");
                alert('更新成功！回到上一頁！');
                window.close();//關閉此畫面
                // User / MUSER_query.aspx
                //Response.Redirect("~/User/MUSER_query.aspx");

            }
            //var MUSERMenuSetupHandlerUrl_G = "/Manage/User/Permission/MUSER_MenuSetupHandler.ashx";
            ajax_M(MUSERMenuSetupHandlerUrl_G, data, upDateDBDataSuccess);

        };
        //var MUSERMenuSetupHandlerUrl_G = "/Manage/User/Permission/MUSER_MenuSetupHandler.ashx";
        //var jsonParse_M = function (str) {
        //    return JSON.parse(str);
        //};
        //checkbox勾選時觸發
        //20220922加入勾選連動CheckBox一起變動!!
        function statechenge(e) {
            //全選/清除(per_select)
            //alert($("per_select").prop("checked"));
            //alert($("input[name='" + per_read + "']").prop("checked"));
            var value = e.value;//MENU_no

            var per_read = "per_read_" + value;
            var per_add = "per_add_" + value;
            var per_edit = "per_edit_" + value;
            var per_del = "per_del_" + value;
            var per_query = "per_query_" + value;
            var per_select = "per_select_" + value;
            //per_select = "per_edit" + value;
            //alert(per_select);
            //var CB = document.getElementsByName(name);
            //document.getElementsByName(name).checked = true;
            //document.getElementsByName(name).removeAttribute('checked');
            //var checkbox = document.getElementsByName(name);
            //checkbox.prop("checked", false);
            if (!e.checked) {
                $("input[name='" + per_read + "']").prop("checked", false);
                $("input[name='" + per_add + "']").prop("checked", false);
                $("input[name='" + per_edit + "']").prop("checked", false);
                $("input[name='" + per_del + "']").prop("checked", false);
                $("input[name='" + per_query + "']").prop("checked", false);
                $("input[name='" + per_select + "']").prop("checked", false);
                //per_select
                var checkbox = document.getElementsByName(per_read);
                //alert(checkbox.check);
            }
            else {
                $("input[name='" + per_read + "']").prop("checked", true);
                $("input[name='" + per_add + "']").prop("checked", true);
                $("input[name='" + per_edit + "']").prop("checked", true);
                $("input[name='" + per_del + "']").prop("checked", true);
                $("input[name='" + per_query + "']").prop("checked", true);
                $("input[name='" + per_select + "']").prop("checked", true);
                var checkbox = document.getElementsByName(per_read);
                //alert(checkbox.check);
            }
            //checkbox.checked = true;
            //$("#checkboxid").removeAttr("checked");
            //alert(document.getElementById("'" +name.toString() + "'").checked);
            //var state = document.getElementsByName(name).checked;
            //if (checkbox.checked) {
            //    alert("CheckBox Checked");
            //}
            //var state = e.name.substring(4, 5);//決定要執行的修改的權限種類 e:編輯權限,a:新增權限,d:刪除權限,r:讀取權限
            //var menu_no = e.name.substring(8, 11);//取出menu_no
            //alert("!!"+state);//要執行的修改的權限
            ////alert(menu_no);//要修改的功能代碼
            ////alert(getUser_Num_M);//要修改的員工編號
            //var data = "&User_Num_M=" + User_Num_M + "&menu_no=" + menu_no + "&state=" + state + "&action=ChangeState";
            //var success = function (back) {
            //    var json = jsonParse_M(back);
            //    $muser_MenuSetupPageList.Table.makeTbody("#MUSER_MenuSetupData", json, 10, "#pageBar", deleteData, getMid);
            //};
            //var error = function (e) { Log_M("MUSER_MenuSetupData error=" + e); unBlockUI_M(); };
            ////ajax_M(MUSERMenuSetupHandlerUrl_G, data, success, error);

            ////name='per_add_"
            ////var new_name = e.name.substring(8);//MENU_no的編號
            //if (e.checked) {
            //    // alert("[" +  + "]" + e.name + "[" + new_name + "]" + ' open');
            //    //呼叫開啟權限function
            //    //boxTxt.innerText = "開";
            //} else {
            //    // alert("[" + getUser_Num_M + "]" + e.name + "[" + new_name + "]" + ' close');
            //    //呼叫關閉權限function
            //    // boxTxt.innerText = "關";
            //}
            ////startThisPage();
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
        var getMUSER_MenuSetupquery = function () {
            var data = "action=getMUSER_MenuSetupData" + "&keyWord=" + val_M("#keyWord") + "&PayStatus=" + val_M("#PayStatus") + "&U_MDEP=" + U_MDEP_M + "&ComID=" + ComID_M;
            var success = function (back) {
                var json = jsonParse_M(back);
                //$muser_MenuSetupPageList.Table.makeTbody("#MUSER_MenuSetupData", json, 10, "#pageBar", deleteData, getMid);
                //MUSERSetupData
                $muser_MenuSetupPageList.Table.makeTbody("#MUSERSetupData", json, 10, "#pageBar", deleteData, getMid);
            };
            var error = function (e) { Log_M("MUSER_MenuSetupData error=" + e); unBlockUI_M(); };
            ajax_M(MUSERMenuSetupHandlerUrl_G, data, success, error);
        };
        var obj = { key: 'value' };
        var checkboxes_after_MenuNO
        function getProperty(obj) {
            var o = obj.key;
            return (o);
        }
        ////進行權限更新
        var UpdateData = function () {
            //alert('權限更新!!');//按下更新後!!(20220805)
            //getMUSER_MenuSetupquery();
            //getchecked();
            var array = [];
            var checkboxes_checked_string = "";
            var checkbox_name_value = "";
            var checkboxes_checked_MenuNo_string = "";
            var checkboxes_checked_Fun_string = "";
            var Menu_no_all = [];
            var checkboxes_all = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有checkbox的值
            Name = checkboxes_all[0].name.toString();
            //var isChecked = $(Name).prop("checked");
            //var Checked = checkboxes_all[0].isChecked;
            //alert(isChecked);
            True_False_Value = checkboxes_all[11].checked.toString();//checkbox是否勾選(True/False)


            var checkboxes_all_num = checkboxes_all.length;//所有checkbox的數目
            var checkboxes_checked = document.querySelectorAll('input[type=checkbox]:checked');//求出畫面中所有有勾選checkbox的值(有功能的項目)
            var checkboxes = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有checkbox的值(功能項目)
            var column = checkboxes_all_num / 6;//共幾行
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
            //alert(checkbox_name_value);
            /*
             * per_select_74_false/per_query_74_false/per_del_74_false/per_edit_74_false/
             * per_add_74_false/per_read_74_false/per_select_106_false/per_query_106_false/
             * per_del_106_false/per_edit_106_false/per_add_106_false/per_read_106_false/per_select_207_false/
             * per_query_207_false/per_del_207_false/per_edit_207_false/per_add_207_false/per_read_207_false/
             * per_select_116_false/per_query_116_false/per_del_116_false/per_edit_116_false/per_add_116_false/per_read_116_false/per_select_73_false/per_query_73_false/per_del_73_false/per_edit_73_false/per_add_73_false/per_read_73_false/per_select_230_false/per_query_230_false/per_del_230_false/per_edit_230_false/per_add_230_false/per_read_230_false/per_select_30_false/per_query_30_false/per_del_30_false/per_edit_30_false/per_add_30_false/per_read_30_false/per_select_62_false/per_query_62_false/per_del_62_false/per_edit_62_false/per_add_62_false/per_read_62_false/per_select_16_false/per_query_16_false/per_del_16_false/per_edit_16_false/per_add_16_false/per_read_16_false/per_select_91_false/per_query_91_false/per_del_91_false/per_edit_91_false/per_add_91_false/per_read_91_false/per_select_109_false/per_query_109_false/per_del_109_false/per_edit_109_false/per_add_109_false/per_read_109_false/per_select_82_false/per_query_82_false/per_del_82_false/per_edit_82_false/per_add_82_false/per_read_82_false/per_select_69_false/per_query_69_false/per_del_69_false/per_edit_69_false/per_add_69_false/per_read_69_false/per_select_26_false/per_query_26_false/per_del_26_false/per_edit_26_false/per_add_26_false/per_read_26_false/per_select_132_false/per_query_132_false/per_del_132_false/per_edit_132_false/per_add_132_false/per_read_132_false/per_select_147_false/per_query_147_false/per_del_147_false/per_edit_147_false/per_add_147_false/per_read_147_false/...
             * */
            //var checkboxes_checked = document.querySelectorAll('input[type=checkbox]:checked');//求出畫面中所有有勾選checkbox的值(有功能的項目)
            //var checkboxes = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有checkbox的值(功能項目)
            //var checked = checkboxes_checked[i].checked;//是否勾選
            //var checkboxes_checked_num = checkboxes_checked.length;//勾選的數目
            //var test2 = checkboxes_checked[1].name.toString();//勾選到的第2個項目
            //var test3 = checkboxes_checked[2].name.toString();//勾選到的第3個項目
            //var test4 = checkboxes_checked[3].name.toString();//勾選到的第4個項目
            //var test5 = checkboxes_checked[4].name.toString();//勾選到的第5個項目
            //var test6 = checkboxes_checked[5].name.toString();//勾選到的第6個項目
            //var Item = checkboxes_checked[0].name.toString();//勾選到的第1個項目
            //var Item_Split = Item.split("_");
            //所有功能Menu_no
            //for (let i = 0; i < checkboxes_all_num; i++) {
            //    var checkboxes_checked_Split = checkboxes_checked[i].split("_");
            //    //checkboxes_checked_Fun.push(checkboxes_checked_Split[1]);//功能
            //    checkboxes_checked_Fun_string += checkboxes_checked_Split[1];
            //    //checkboxes_checked_MenuNO.push(checkboxes_checked_Split[2]);//Menu_No
            //    checkboxes_checked_MenuNO_string += checkboxes_checked_Fun_string;//Menu_No
            //}
            //有權限的功能Menu_no
            //var checkboxes_checked_MenuNO = [];
            //var checkboxes_checked_Fun = [];
            //var Menu_no;
            //for (let i = 0; i < checkboxes_checked_num; i++) {
            //    var test = checkboxes_checked[i];
            //    var test2 = checkboxes_checked[i].name;
            //    var test_name = test.name;
            //    var checkboxes_checked_Split = checkboxes_checked[i].name.toString().split("_");
            //    checkboxes_checked_Fun_string = checkboxes_checked_Fun_string + checkboxes_checked_Split[1]+"_";
            //    checkboxes_checked_MenuNo_string = checkboxes_checked_MenuNo_string + checkboxes_checked_Split[2]+"_";
            //    //checkboxes_checked_MenuNO_string[i] = checkboxes_checked_MenuNO_string[i] + checkboxes_checked_Split[2] + ",";

            //}
            //先將所有功能取消



            //var js = document.querySelector('#query1');

            /*進行更新動作參考
             * var data = "action=getMUSER_MenuSetupData" + "&keyWord=" + val_M("#keyWord") + "&PayStatus=" + val_M("#PayStatus") + "&U_MDEP=" + U_MDEP_M + "&ComID=" + ComID_M;
            var success = function (back) {
                var json = jsonParse_M(back);
                $muser_MenuSetupPageList.Table.makeTbody("#MUSER_MenuSetupData", json, 10, "#pageBar", deleteData, getMid);
            };
            var error = function (e) { Log_M("MUSER_MenuSetupData error=" + e); unBlockUI_M(); };
            ajax_M(MUSERMenuSetupHandlerUrl_G, data, success, error);
             * 
             **/
            //var data = "action=getMUSER_MenuSetupData" + "&checkboxes_checked_Fun_string=" + checkbox_name_value + "&checkboxes_checked_MenuNo_string=" + checkbox_name_value + "&User_Num_M=" + User_Num_M;
            //var success = function (back) {
            //    var json = jsonParse_M(back);
            //    //$muser_MenuSetupPageList.Table.makeTbody("#MUSER_MenuSetupData", json, 10, "#pageBar", deleteData, getMid);
            //};
            //var error = function (e) { Log_M("MUSER_MenuSetupData error=" + e); unBlockUI_M(); };
            //ajax_M(MUSERMenuSetupHandlerUrl_G, data, success, error);

            //開啟資料庫連線
            //OpenDBConnection();
            //進行更新資料
            //權限紀錄資料表(MUMAP)
            for (var i = 0; i < checkboxes_all_num; i++) {
                temp = checkboxes[i].name.toString().split('_');;//勾選到的第2個項目(per_add_1)
                Fun_Name = temp[0] + "_" + temp[1];
                Menu_No = temp[2];
                if (temp[1] != "select") {
                    TrurOrFalse = checkboxes_all[i].checked.toString();//checkbox是否勾選(True/False)
                    var data = "action=updateMUSER_MenuSetupData" + "&Fun_Name=" + Fun_Name + "&Menu_No=" + Menu_No + "&TrueOrFalse=" + TrurOrFalse + "&User_Num=" + User_Num_M;
                    var success = function (back) {
                        var json = jsonParse_M(back);
                        //$muser_MenuSetupPageList.Table.makeTbody("#MUSER_MenuSetupData", json, 10, "#pageBar", deleteData, getMid);
                    };
                    var error = function (e) { Log_M("MUSER_MenuSetupData error=" + e); unBlockUI_M(); };
                    ajax_M(MUSERMenuSetupHandlerUrl_G, data, success, error);
                }
            }
            //ExecuteCommaned(test1);
            //關閉資料庫連線
            //CloseDBConnection();


            //checkboxes1_after.addEventListener('change', (e) => {
            //    if (e.target.checked) {
            //        // alert(e.name + 'open');
            //        //boxTxt.innerText = `開 ${e.target.checked}`;
            //    } else {
            //        // alert(e.name + 'close');
            //        // boxTxt.innerText = `關 ${e.target.checked}`;
            //    }
            //});

            // var checkboxes199 = checkboxes[0];//第一個勾選到的項目
            //var name = checkboxes1[0].getProperty['name'];
            //alert(name);
            var str = "How\are\you\doing\today?";
            var n = str.split("\\ ");
            var check0 = checkboxes_after[0];
            //var object_name = getProperty(check0, 'name');//XXXX
            //alert(object_name);//XXXX
            //var check0outerhtml = check0.split("\\ ");
            //var check = check0.checked;//被勾選的項目
            //var name = check0.name;//被勾選的項目名稱
            //alert(check);
            //alert(name);

            //for (var i = 0; i < checkboxes.length; i++) {
            //    array.push(checkboxes[i].value)
            //}
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
        var getMid = function () {
            getMFUNTreportData
            var M_id = attr_M(this, "M_id")
            location.href = "/wealthManage/customerManage/MMBER/customerDetail.aspx?M_ID=" + M_id + "&MENU_no=" + CustomerDetailMENU_no_G + "&ERPcustomerWebPayMENU_no=" + MENU_no_G;
        };
        /*進行更新動作參考
            * var data = "action=getMUSER_MenuSetupData" + "&keyWord=" + val_M("#keyWord") + "&PayStatus=" + val_M("#PayStatus") + "&U_MDEP=" + U_MDEP_M + "&ComID=" + ComID_M;
           var success = function (back) {
               var json = jsonParse_M(back);
               $muser_MenuSetupPageList.Table.makeTbody("#MUSER_MenuSetupData", json, 10, "#pageBar", deleteData, getMid);
           };
           var error = function (e) { Log_M("MUSER_MenuSetupData error=" + e); unBlockUI_M(); };
           ajax_M(MUSERMenuSetupHandlerUrl_G, data, success, error);
            *
            **/
        //開啟資料庫連線
        var OpenDBConnection = function () {
            var data = "action=OpenDBConnection";
            var success = function (back) {
                var json = jsonParse_M(back);
                //$muser_MenuSetupPageList.Table.makeTbody("#MUSER_MenuSetupData", json, 10, "#pageBar", deleteData, getMid);
            };
            var error = function (e) { Log_M("MUSER_MenuSetupData error=" + e); unBlockUI_M(); };
            ajax_M(MUSERMenuSetupHandlerUrl_G, data, success, error);
        };
        //關閉資料庫連線
        var CloseDBConnection = function () {
            var data = "action=CloseDBConnection";
            var success = function (back) {
                var json = jsonParse_M(back);
                //$muser_MenuSetupPageList.Table.makeTbody("#MUSER_MenuSetupData", json, 10, "#pageBar", deleteData, getMid);
            };
            var error = function (e) { Log_M("MUSER_MenuSetupData error=" + e); unBlockUI_M(); };
            ajax_M(MUSERMenuSetupHandlerUrl_G, data, success, error);
        };
        //執行權限更新語法
        var ExecuteCommaned = function () { };

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
        var deleteData = function () {
            var deleteCheck = confirm("是否刪除資料");
            if (deleteCheck) {
                var ca_id = attr_M(this, "ca_id");
                var data = "action=deleteData" + "&ca_id=" + ca_id;
                var success = function (back) {
                    if (back == "成功") {
                        getERPcustomerWebPay();
                        alert("資料異動成功");
                    }
                };
                var error = function (e) { Log_M("deleteData error=" + e); unBlockUI_M(); };
                ajax_M(MUSERMenuSetupHandlerUrl_G, data, success, error);
            }
        };
        var startThisPage = function () {

            var data = "U_Num=" + User_Num_M + "&action=getMUSER_MenuSetupData";//20220802修改這裡!!!!!
            var success = function (back) {
                var json = jsonParse_M(back);
                MUSERMenuSetupDataJson_G = json;//取回的資料內容(MUSERMenuSetupDataJson_G)
                if (back != "成功") {
                    $muser_MenuSetupPageList.Table.makeTbody("#MUSERSetupData", json, 10, "#pageBar", deleteData, getMid);
                    //makeHtml();//20220927要修改的地方
                    //$muser_MenuSetupPageList.Table.makeTbody("#MUSERSetupData", json, 10, "#pageBar", deleteData, getMid);
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
            ajax_M(MUSERMenuSetupHandlerUrl_G, data, success, error);//<===

        };
        //頁面載入後自動執行
        $(function () {

            startThisPage();
            //查看使用者權限
            //getUserAuthority_M(startThisPage);
            //送出功能繫結
            //UpdateData:更新權限
            onClick_M(".UpdateDataFuc", UpdateData);
            //const checkboxes1 = document.querySelectorAll('input[type=checkbox]:checked');
            //var checkboxes999= document.querySelectorAll('input[type=checkbox]:checked');//求出畫面中所有有勾選checkbox的值
            //var checkboxes111 = document.querySelectorAll('input[type=checkbox]:checked');//求出畫面中所有有勾選checkbox的值
            //var checkboxes2 = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有有勾選checkbox的值
            //var checkboxes3 = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有有勾選checkbox的值
            //let lastChecked;
            //checkboxes.forEach(checkbox => checkbox.name.addEventListener('click', handleCheck));
            //checkboxes.forEach(checkbox => checkbox1.addEventListener('click', handleCheck)); \
            //var checkboxes1 = document.querySelectorAll('input[type=checkbox]');//求出畫面中所有checkbox的值
            var checkbox = document.querySelector("input[name=checkbox]");
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

