//員工資料維護作業-選單權限
$muser_MenuSetupPageList = {
    version: "1.0.0"
};

(function (m) {

    m.Check = {
        //是否為空字串
        isEmptyStr: function (str) {
            var f = false;
            if (str === undefined || str === null || $.trim(str) === "" || str == "[]" || str == "undefined") {
                f = true;
            }
            return f;
        },
    };
    m.String = {
        StringBuilder: function () {
            this.buffer = [];
            this.append = function (val) {
                this.buffer.push(val);
                return this;
            };
            this.appendWhiteSpace = function () {
                this.buffer.push(" ");
                return this;
            };
            this.appendAttr = function (key, val) {
                this.buffer.push(key);
                this.buffer.push("='");
                this.buffer.push(val);
                this.buffer.push("'");
                return this;
            };
            this.toString = function () {
                return this.buffer.join('');
            };
            this.release = function () {
                while (this.buffer.length > 0) {
                    this.buffer.pop();
                }
            };
        },
    };

    m.Table = {
        dataNowPage: 0,
        dataTotalPage: 0,
        tbId: undefined,
        ThisdataArr: undefined,
        perCountOnePage: undefined,
        pageBarId: undefined,
        deleteDataFuc: undefined,
        getDetailFuc: undefined,

        getTotalPage: function (totalDataCount, perCountOnePage) {
            var pageCount = totalDataCount / perCountOnePage;
            var pageCount1 = Math.floor(pageCount);
            var remainder = totalDataCount % perCountOnePage;
            if (remainder > 0) {
                pageCount1 += 1;
                pageCount = pageCount1;
            }
            return pageCount;
        },
        pageNumClick: function () {
            var thisText = $(this).text();
            var goNext = true;
            if (thisText == ">>" || thisText == "<<") {
                console.log("dataNowPage=" + m.Table.dataNowPage + "&&dataTotalPage=" + m.Table.dataTotalPage);
                if (m.Table.dataNowPage <= m.Table.dataTotalPage && m.Table.dataNowPage >= 0) {
                    if (thisText == ">>") {
                        console.log(">>");
                        m.Table.dataNowPage += 1;

                    } else if (thisText == "<<") {
                        m.Table.dataNowPage -= 1;
                    }
                } else {
                    console.log("<>");
                    goNext = false;
                }
            } else {
                var clickPage = parseInt(thisText);
                if (clickPage <= m.Table.dataTotalPage && clickPage >= 1) {
                    m.Table.dataNowPage = (clickPage - 1);
                } else {
                    goNext = false;
                }
            }
            if (goNext) {
                m.Table.makeTbody();
            }
        },
        makePageBar: function (id, perCountOnePage) {
            $(id).empty();
            var startPageNum = m.Table.dataNowPage - 5;
            if (startPageNum <= 0) {
                startPageNum = 1;
            }
            var showPageCount = 0;

            if (m.Table.dataTotalPage >= 10) {
                showPageCount = 9;
            } else {
                showPageCount = m.Table.dataTotalPage - 1;
            }

            var sb = new m.String.StringBuilder();
            sb.append("<span id='pageNum'></span><br /><br />");
            if (m.Table.dataNowPage > 0) {
                sb.append("<span class='pageList pageNum'><a class='qPer'  href='#'><<</a></span>");
            }

            for (var i = 0; i <= showPageCount; i++) {
                if (startPageNum <= m.Table.dataTotalPage) {
                    sb.append("<span class='pageList pageNum' id='page");
                    sb.append(startPageNum);
                    sb.append("'><a class='qPer'  href='javascript: void(0)'>");
                    sb.append(startPageNum);
                    sb.append("</a></span>");
                    startPageNum += 1;
                }
            }
            if ((m.Table.dataNowPage + 1) < m.Table.dataTotalPage) {
                sb.append("<span class='pageList pageNum'><a class='qPer'  href='#'>>></a></span>");
            }

            $(id).append(sb.toString());
            $("#page" + m.Table.dataNowPage).attr("style", "color:red");
            $("#pageNum").empty();
            $("#pageNum").append((m.Table.dataNowPage + 1) + "  /  " + m.Table.dataTotalPage + " 頁");
            $(".pageNum").on("click", m.Table.pageNumClick);
            $.unblockUI();
        },

        makeThead: function (theadId, threadClassName, trClassName, itemNameArr, itemClassNameArr) {
            var sb = new m.String.StringBuilder();
            sb.append("<tr class='");
            sb.append(trClassName);
            sb.append("'>");
            $.each(itemNameArr, function (i, v) {
                sb.append("<th class='");

                if (itemClassNameArr.length != 0) {
                    sb.append(itemClassNameArr[i]);
                }
                sb.append("'>");
                sb.append(v);
                sb.append("</th>");
            });
            sb.append("</tr>");
            $(theadId).append(sb.toString());
        },
        makeTbody: function (tbId, dataArr, perCountOnePage, pageBarId, deleteDataFuc) {

            if (m.Check.isEmptyStr(tbId)) {
                tbId = m.Table.tbId;
                dataArr = m.Table.ThisdataArr;
                perCountOnePage = m.Table.perCountOnePage;
                pageBarId = m.Table.pageBarId;
                deleteDataFuc = m.Table.deleteDataFuc;
                //getDetailFuc = m.Table.getDetailFuc;
            } else {
                m.Table.dataNowPage = 0;
                m.Table.tbId = tbId;
                m.Table.ThisdataArr = dataArr;
                m.Table.perCountOnePage = perCountOnePage;
                m.Table.pageBarId = pageBarId;
                m.Table.deleteDataFuc = deleteDataFuc;
                //m.Table.getDetailFuc = getDetailFuc;
            }
            $(tbId).empty();
            var start = (0 + (m.Table.dataNowPage * perCountOnePage));
            var end = ((m.Table.dataNowPage + 1) * perCountOnePage);
            if (dataArr.length < end) {
                end = dataArr.length;
            }
            var sb = new m.String.StringBuilder();
            //表格資料顯示2022927修改這裡!!!!
            m.Table.dataTotalPage = m.Table.getTotalPage(dataArr.length, perCountOnePage);
            for (var i = start; i < end; i++) {
                sb.append("<tr><th class='text-center'>");
                sb.append(dataArr[i].auto_id);//MENU_no
                //sb.append("</th><th class='text-center'>");
                sb.append("</th><th class=''>");
                //加入顯示判斷條件(20220809)
                if (dataArr[i].top_id != 0 && dataArr[i].sub_id == 0 && dataArr[i].item_id == 0) {
                    sb.append("<font color=#005C9C><b>" + dataArr[i].top_id + "</b></font>");
                    sb.append("<input type='hidden' name='menu_id_" + dataArr[i].auto_id + "' value='" + dataArr[i].top_id + "'>");
                }
                else if (dataArr[i].top_id != 0 && dataArr[i].sub_id != 0 && dataArr[i].item_id == 0) {
                    sb.append("<p>&ensp;&ensp;&ensp;<font color=C40000><b>" + dataArr[i].sub_id + "</b></font></p>");
                    sb.append("<input type='hidden' name='menu_id_" + dataArr[i].auto_id + "' value='" + dataArr[i].sub_id + "'>");
                }
                else if (dataArr[i].top_id != 0 && dataArr[i].sub_id != 0 && dataArr[i].item_id != 0) {
                    //sb.append("<p>&ensp;&ensp;&ensp;&ensp;&ensp;</p>" + v.item_id);

                    sb.append("<p>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<b>" + dataArr[i].item_id + "</b></font></p>");
                    // sb.append("<input type='hidden' name='menu_id" + v.auto_id) + "' value='" + v.iten_id + "'>");
                    sb.append("<input type='hidden' name='menu_id_" + dataArr[i].auto_id + "' value='" + dataArr[i].sub_id + "'>");
                }
                else if (dataArr[i].top_id != 0 && dataArr[i].sub_id == 0 && dataArr[i].iten_id == 0) {
                    sb.append("<font color=#005C9><b>" + dataArr[i].top_id + "</b></font>");
                    sb.append("<input type='hidden' name='menu_id_" + dataArr[i].auto_id + "' value='" + dataArr[i].top_id + "'>");
                }
                //sb.append(v.menu_id);//選單代碼
                //
                sb.append("</th><th class=''>");
                //加入顯示判斷條件(20220809)
                if (dataArr[i].top_id != 0 && dataArr[i].sub_id == 0 && dataArr[i].item_id == 0) {
                    sb.append("<font color=#005C9C><b>" + dataArr[i].menu_name + "</b></font>");
                    sb.append("<input type='hidden' name='menu_id" + dataArr[i].auto_id + "' value='" + dataArr[i].top_id + "'>");
                }
                else if (dataArr[i].top_id != 0 && dataArr[i].sub_id != 0 && dataArr[i].item_id == 0) {
                    sb.append("<p>&ensp;&ensp;&ensp;<font color=C40000><b>" + dataArr[i].menu_name + "</b></font></p>");
                    sb.append("<input type='hidden' name='menu_id" + dataArr[i].auto_id + "' value='" + dataArr[i].sub_id + "'>");
                }
                else if (dataArr[i].top_id != 0 && dataArr[i].sub_id != 0 && dataArr[i].item_id != 0) {
                    //sb.append("<p>&ensp;&ensp;&ensp;&ensp;&ensp;</p>" + v.item_id);

                    sb.append("<p>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<b>" + dataArr[i].menu_name + "</b></font></p>");
                    // sb.append("<input type='hidden' name='menu_id" + v.auto_id) + "' value='" + v.iten_id + "'>");
                    sb.append("<input type='hidden' name='menu_id" + dataArr[i].auto_id + "' value='" + dataArr[i].sub_id + "'>");
                }
                else if (dataArr[i].top_id != 0 && dataArr[i].sub_id == 0 && dataArr[i].iten_id == 0) {
                    sb.append("<font color=#005C9><b>" + dataArr[i].menu_name + "</b></font>");
                    sb.append("<input type='hidden' name='menu_id" + dataArr[i].auto_id + "' value='" + dataArr[i].top_id + "'>");
                }
                //sb.append(v.c);//選單名稱
                sb.append("</th>");
                sb.append("<th class='text-center'><input type='checkbox' aria-label='query' id='per_read_' name ='per_read_");//查詢
                sb.append(dataArr[i].auto_id);//代碼
                sb.append("'");
                sb.append(' class="form-check-input" value ="');
                sb.append(dataArr[i].auto_id);//代碼
                sb.append('"');
                var checkboxvalue = parseInt(dataArr[i].per_edit);//修改權限
                if (checkboxvalue == 1) {
                    sb.append(" checked='true'></th>");//有勾
                }
                else {
                    /* sb.append(" checked='false'></th>");//沒*/
                    sb.append(" ></th>");//沒
                }
                sb.append("</th>");
                sb.append("<th class='text-center'><input type='checkbox' aria-label='add' id='per_add_' name='per_add_");//新增
                sb.append(dataArr[i].auto_id);//代碼
                sb.append("'");
                sb.append(' class="form-check-input" value ="');
                sb.append(dataArr[i].auto_id);//代碼
                sb.append('"');
                var checkboxvalue = parseInt(dataArr[i].per_edit);//修改權限
                if (checkboxvalue == 1) {
                    sb.append(" checked='true'></th>");//有勾
                }
                else {
                    /* sb.append(" checked='false'></th>");//沒*/
                    sb.append(" ></th>");//沒
                }
                sb.append("</th>");
                sb.append("<th class='text-center'><input type='checkbox' aria-label='edit' id='per_edit_' name='per_edit_");//修改
                sb.append(dataArr[i].auto_id);//代碼
                sb.append("'");
                sb.append(' class="form-check-input" value ="');
                sb.append(dataArr[i].auto_id);//代碼
                sb.append('"');
                var checkboxvalue = parseInt(dataArr[i].per_edit);//修改權限
                if (checkboxvalue == 1) {
                    sb.append(" checked='true'></th>");//有勾
                }
                else {
                    /* sb.append(" checked='false'></th>");//沒*/
                    sb.append(" ></th>");//沒
                }

                sb.append("<th class='text-center'><input type='checkbox' aria-label='del' id='per_del_' name='per_del_");//刪除
                sb.append(dataArr[i].auto_id);//代碼
                sb.append("'");
                sb.append(' class="form-check-input" value ="');
                sb.append(dataArr[i].auto_id);//代碼
                sb.append('"');
                var checkboxvalue = parseInt(dataArr[i].per_del);//刪除權限
                if (checkboxvalue == 1) {
                    sb.append(" checked='true'></th>");//有勾
                }
                else {
                    /* sb.append(" checked='false'></th>");//沒*/
                    sb.append(" ></th>");//沒
                }
                //per_del
                sb.append("<th class='text-center'><input type='checkbox' aria-label='query' id='per_query_' name='per_query_");//進階查詢
                sb.append(dataArr[i].auto_id);//代碼
                sb.append("'");
                sb.append(" class='form-check-input' value =");
                sb.append(dataArr[i].auto_id);//代碼
                sb.append("'");
                var checkboxvalue = parseInt(dataArr[i].per_query);//進階查詢
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
                sb.append(dataArr[i].auto_id);//代碼
                sb.append("'");
                sb.append(" onchange=statechenge(this); class='form-check-input' value = '");
                sb.append(dataArr[i].auto_id);//代碼
                sb.append("'");
                var per = 0;
                per = parseInt(dataArr[i].per_edit) + parseInt(dataArr[i].per_del) + parseInt(dataArr[i].per_edit) + parseInt(dataArr[i].per_add) + parseInt(dataArr[i].per_read);
                var checkboxvalue = parseInt(dataArr[i].per_edit);//全選/清除
                if (per == 5)//表示全部勾選
                {
                    sb.append(" checked='true'></th>");//有勾
                }
                else {
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
                //sb.append("<tr><th class='text-center'>");
                //sb.append(v.auto_id);//MENU_no
                ////sb.append("</th><th class='text-center'>");
                //sb.append("</th><th class=''>");
                ////加入顯示判斷條件(20220809)
                //if (v.top_id != 0 && v.sub_id == 0 && v.item_id == 0) {
                //    sb.append("<font color=#005C9C><b>" + v.top_id + "</b></font>");
                //    sb.append("<input type='hidden' name='menu_id_" + v.auto_id + "' value='" + v.top_id + "'>");
                //}
                //else if (v.top_id != 0 && v.sub_id != 0 && v.item_id == 0) {
                //    sb.append("<p>&ensp;&ensp;&ensp;<font color=C40000><b>" + v.sub_id + "</b></font></p>");
                //    sb.append("<input type='hidden' name='menu_id_" + v.auto_id + "' value='" + v.sub_id + "'>");
                //}
                //else if (v.top_id != 0 && v.sub_id != 0 && v.item_id != 0) {
                //    //sb.append("<p>&ensp;&ensp;&ensp;&ensp;&ensp;</p>" + v.item_id);

                //    sb.append("<p>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<b>" + v.item_id + "</b></font></p>");
                //    // sb.append("<input type='hidden' name='menu_id" + v.auto_id) + "' value='" + v.iten_id + "'>");
                //    sb.append("<input type='hidden' name='menu_id_" + v.auto_id + "' value='" + v.sub_id + "'>");
                //}
                //else if (v.top_id != 0 && v.sub_id == 0 && v.iten_id == 0) {
                //    sb.append("<font color=#005C9><b>" + v.top_id + "</b></font>");
                //    sb.append("<input type='hidden' name='menu_id_" + v.auto_id + "' value='" + v.top_id + "'>");
                //}
                ////sb.append(v.menu_id);//選單代碼
                ////
                //sb.append("</th><th class=''>");
                ////加入顯示判斷條件(20220809)
                //if (v.top_id != 0 && v.sub_id == 0 && v.item_id == 0) {
                //    sb.append("<font color=#005C9C><b>" + v.menu_name + "</b></font>");
                //    sb.append("<input type='hidden' name='menu_id" + v.auto_id + "' value='" + v.top_id + "'>");
                //}
                //else if (v.top_id != 0 && v.sub_id != 0 && v.item_id == 0) {
                //    sb.append("<p>&ensp;&ensp;&ensp;<font color=C40000><b>" + v.menu_name + "</b></font></p>");
                //    sb.append("<input type='hidden' name='menu_id" + v.auto_id + "' value='" + v.sub_id + "'>");
                //}
                //else if (v.top_id != 0 && v.sub_id != 0 && v.item_id != 0) {
                //    //sb.append("<p>&ensp;&ensp;&ensp;&ensp;&ensp;</p>" + v.item_id);

                //    sb.append("<p>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<b>" + v.menu_name + "</b></font></p>");
                //    // sb.append("<input type='hidden' name='menu_id" + v.auto_id) + "' value='" + v.iten_id + "'>");
                //    sb.append("<input type='hidden' name='menu_id" + v.auto_id + "' value='" + v.sub_id + "'>");
                //}
                //else if (v.top_id != 0 && v.sub_id == 0 && v.iten_id == 0) {
                //    sb.append("<font color=#005C9><b>" + v.menu_name + "</b></font>");
                //    sb.append("<input type='hidden' name='menu_id" + v.auto_id + "' value='" + v.top_id + "'>");
                //}
                ////sb.append(v.c);//選單名稱
                //sb.append("</th>");
                //sb.append("<th class='text-center'><input type='checkbox' aria-label='query' id='per_read_' name ='per_read_");//查詢
                //sb.append(v.auto_id);//代碼
                //sb.append("'");
                //sb.append(' class="form-check-input" value ="');
                //sb.append(v.auto_id);//代碼
                //sb.append('"');
                //var checkboxvalue = parseInt(v.per_edit);//修改權限
                //if (checkboxvalue == 1) {
                //    sb.append(" checked='true'></th>");//有勾
                //}
                //else {
                //    /* sb.append(" checked='false'></th>");//沒*/
                //    sb.append(" ></th>");//沒
                //}
                //sb.append("</th>");
                //sb.append("<th class='text-center'><input type='checkbox' aria-label='add' id='per_add_' name='per_add_");//新增
                //sb.append(v.auto_id);//代碼
                //sb.append("'");
                //sb.append(' class="form-check-input" value ="');
                //sb.append(v.auto_id);//代碼
                //sb.append('"');
                //var checkboxvalue = parseInt(v.per_edit);//修改權限
                //if (checkboxvalue == 1) {
                //    sb.append(" checked='true'></th>");//有勾
                //}
                //else {
                //    /* sb.append(" checked='false'></th>");//沒*/
                //    sb.append(" ></th>");//沒
                //}
                //sb.append("</th>");
                //sb.append("<th class='text-center'><input type='checkbox' aria-label='edit' id='per_edit_' name='per_edit_");//修改
                //sb.append(v.auto_id);//代碼
                //sb.append("'");
                //sb.append(' class="form-check-input" value ="');
                //sb.append(v.auto_id);//代碼
                //sb.append('"');
                //var checkboxvalue = parseInt(v.per_edit);//修改權限
                //if (checkboxvalue == 1) {
                //    sb.append(" checked='true'></th>");//有勾
                //}
                //else {
                //    /* sb.append(" checked='false'></th>");//沒*/
                //    sb.append(" ></th>");//沒
                //}

                //sb.append("<th class='text-center'><input type='checkbox' aria-label='del' id='per_del_' name='per_del_");//刪除
                //sb.append(v.auto_id);//代碼
                //sb.append("'");
                //sb.append(' class="form-check-input" value ="');
                //sb.append(v.auto_id);//代碼
                //sb.append('"');
                //var checkboxvalue = parseInt(v.per_del);//刪除權限
                //if (checkboxvalue == 1) {
                //    sb.append(" checked='true'></th>");//有勾
                //}
                //else {
                //    /* sb.append(" checked='false'></th>");//沒*/
                //    sb.append(" ></th>");//沒
                //}
                ////per_del
                //sb.append("<th class='text-center'><input type='checkbox' aria-label='query' id='per_query_' name='per_query_");//進階查詢
                //sb.append(v.auto_id);//代碼
                //sb.append("'");
                //sb.append(" class='form-check-input' value =");
                //sb.append(v.auto_id);//代碼
                //sb.append("'");
                //var checkboxvalue = parseInt(v.per_query);//進階查詢
                //if (checkboxvalue == 1) {
                //    sb.append(" checked='true'></th>");//有勾
                //}
                //else {
                //    /* sb.append(" checked='false'></th>");//沒*/
                //    sb.append(" ></th>");//沒
                //}
                ////全選/清除欄位
                ////sb.append("<th class='text-center'><input type='checkbox' name='per_select'");
                //sb.append("<th class='text-center'><input type='checkbox' aria-label='select' id='per_select' name='per_select_");
                //sb.append(v.auto_id);//代碼
                //sb.append("'");
                //sb.append(" onchange=statechenge(this); class='form-check-input' value = '");
                //sb.append(v.auto_id);//代碼
                //sb.append("'");
                //var per = 0;
                //per = parseInt(v.per_edit) + parseInt(v.per_del) + parseInt(v.per_edit) + parseInt(v.per_add) + parseInt(v.per_read);
                //var checkboxvalue = parseInt(v.per_edit);//全選/清除
                //if (per == 5)//表示全部勾選
                //{
                //    sb.append(" checked='true'></th>");//有勾
                //}
                //else {
                //    //sb.append(" checked='false'></th>");//沒
                //    sb.append(" ></th>");//沒
                //}

                ////        <th class='text-center'>");
                ////sb.append(v.query);
                ////sb.append("</th>");
                ////if (isMember) {
                ////    sb.append("<th class='text-center'>-</th>");
                ////    isMember = false;
                ////} else {
                ////    sb.append("<th class='text-center'><a href='#' class='deleteCustomerData delPer' MID='");
                ////    sb.append(v.M_ID);
                ////    sb.append("'>刪</a></th>");
                ////}

                //sb.append("</tr>");
            }
            //MFUT_report(tbId)
            $(tbId).append(sb.toString());
            $(".deleteData").on("click", deleteDataFuc);
            $(".getDetail").on("click", getDetailFuc);
            m.Table.makePageBar(pageBarId, perCountOnePage);
            $.unblockUI();
        }
    };


})($muser_MenuSetupPageList);