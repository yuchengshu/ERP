
$getMessageListPageList = {
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
        editDataFuc: undefined,
        openAddStockOIdataDialog: undefined,
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
        pageNumClick:function () {
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
                    m.Table.dataNowPage = (clickPage-1);
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
                showPageCount = m.Table.dataTotalPage-1;
            }

            var sb = new m.String.StringBuilder();
            sb.append("<span id='pageNum'></span><br /><br />");
            if (m.Table.dataNowPage > 0) {
                sb.append("<span class='pageList pageNum'><a class='qPer'  href='#'><<</a></span>");
            }

            for (var i = 0; i <= showPageCount ; i++) {
                if (startPageNum <= m.Table.dataTotalPage) {
                    sb.append("<span class='pageList pageNum' id='page");
                    sb.append(startPageNum);
                    sb.append("'><a class='qPer'  href='javascript: void(0)'>");
                    sb.append(startPageNum);
                    sb.append("</a></span>");
                    startPageNum += 1;
                }
           }
            if ((m.Table.dataNowPage+1) < m.Table.dataTotalPage) {
                sb.append("<span class='pageList pageNum'><a class='qPer'  href='#'>>></a></span>");
            }
            
            $(id).append(sb.toString());
            $("#page" + m.Table.dataNowPage).attr("style","color:red");
            $("#pageNum").empty();
            $("#pageNum").append((m.Table.dataNowPage+1) + "  /  " + m.Table.dataTotalPage+" 頁");
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
                
                if (itemClassNameArr.length !=0) {
                    sb.append(itemClassNameArr[i]);
                }
                sb.append("'>");
                sb.append(v);
                sb.append("</th>");
            });
            sb.append("</tr>");
            $(theadId).append(sb.toString());
        },
        makeTbody: function (tbId, dataArr, perCountOnePage, pageBarId, deleteDataFuc, editDataFuc, openAddStockOIdataDialog) {

            if (m.Check.isEmptyStr(tbId)) {
               
                tbId = m.Table.tbId;
                dataArr = m.Table.ThisdataArr;
                perCountOnePage = m.Table.perCountOnePage;
                pageBarId = m.Table.pageBarId;
                deleteDataFuc = m.Table.deleteDataFuc;
                editDataFuc = m.Table.editDataFuc;
                openAddStockOIdataDialog = m.Table.openAddStockOIdataDialog;
            } else {
                m.Table.dataNowPage = 0;
                m.Table.tbId = tbId;
                m.Table.ThisdataArr = dataArr;
                m.Table.perCountOnePage = perCountOnePage;
                m.Table.pageBarId = pageBarId;
                m.Table.deleteDataFuc = deleteDataFuc;
                m.Table.editDataFuc = editDataFuc;
                m.Table.openAddStockOIdataDialog = openAddStockOIdataDialog;
            }
            $(tbId).empty();
            var start = (0 + (m.Table.dataNowPage * perCountOnePage));
            var end = ((m.Table.dataNowPage + 1) * perCountOnePage);
            if (dataArr.length < end) {
                end = dataArr.length;
            }
            var sb = new m.String.StringBuilder();
            m.Table.dataTotalPage = m.Table.getTotalPage(dataArr.length, perCountOnePage);
            for (var i = start ; i < end ; i++) {
               
                    sb.append("<tr>");
                    sb.append("<td class='text-center'>");
                    sb.append(i + 1);
                    sb.append("</td>");
                    sb.append("<td class='text-center'>");
                    sb.append(dataArr[i].MS_TelName);
                    sb.append("</td>");
                    sb.append("<td class='text-center'>");
                    sb.append(dataArr[i].MPname);
                    sb.append("</td>");
                    /*sb.append("<td class='text-center'><a href='javascript:void(0)' class='openAddStockOIdataDialog' MP='");
                    sb.append(dataArr[i].MP);
                    sb.append("' MPname='");
                    sb.append(dataArr[i].MPname);
                    sb.append("' MP_ItemName='");
                    sb.append(dataArr[i].MP_ItemName);
                    sb.append("' MP_Item='");
                    sb.append(dataArr[i].MP_Item);
                    sb.append("'>");
                    sb.append(dataArr[i].MPname);
                    sb.append("</a></td>");*/
                    sb.append("<td class='text-center'>");
                    sb.append(dataArr[i].MP_ItemName);
                    sb.append("</td>");
                    sb.append("<td class='textAlignLeft'>");
                    sb.append(dataArr[i].msg_text);
                    
                    sb.append("</td>");
                    sb.append("<td class='text-center'>");
                    sb.append(dataArr[i].MS_TStatus);
                  
                    sb.append("</td>");
                    sb.append("<td class='text-center'>");
                    sb.append(dataArr[i].add_Date);
                    sb.append("</td>");
                    sb.append("<td class='text-center'>");
                    sb.append(dataArr[i].add_userName);
                    sb.append("</td>");
                    sb.append("<td class='text-center'><a class='qPer' href='javascript:void(0)");
                    sb.append("'>細</td>");
                    sb.append("<td class='text-center'><a class='editPer editDataFuc'  href='javascript:void(0)' msg_id='");
                    sb.append(dataArr[i].msg_id);
                    sb.append("' msg_text='");
                    sb.append(dataArr[i].msg_text);
                    sb.append("' MS_TStatus='");
                    sb.append(dataArr[i].MS_TStatus);
                    sb.append("'>修</td>");
                    sb.append("<td class='text-center'><a class='delPer deleteData'  href='javascript:void(0)' msg_id='");
                    sb.append(dataArr[i].msg_id);
                    sb.append("'>刪</td>");
                    sb.append("</td>");
                    sb.append("</tr>");
            }
            $(tbId).append(sb.toString());
            $(".deleteData").on("click", deleteDataFuc);
            $(".editDataFuc").on("click", editDataFuc);
            //$(".openAddStockOIdataDialog").on("click", openAddStockOIdataDialog);
            m.Table.makePageBar(pageBarId, perCountOnePage)
        }
    };


})($getMessageListPageList);