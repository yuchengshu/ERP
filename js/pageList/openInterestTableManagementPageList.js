
$openInterestTableManagementPageList = {
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
        makeTbody: function (tbId, dataArr, perCountOnePage, pageBarId, deleteDataFuc, editDataFuc) {

            if (m.Check.isEmptyStr(tbId)) {
               
                tbId = m.Table.tbId;
                dataArr = m.Table.ThisdataArr;
                perCountOnePage = m.Table.perCountOnePage;
                pageBarId = m.Table.pageBarId;
                deleteDataFuc = m.Table.deleteDataFuc;
                editDataFuc = m.Table.editDataFuc;
            } else {
                m.Table.dataNowPage = 0;
                m.Table.tbId = tbId;
                m.Table.ThisdataArr = dataArr;
                m.Table.perCountOnePage = perCountOnePage;
                m.Table.pageBarId = pageBarId;
                m.Table.deleteDataFuc = deleteDataFuc;
                m.Table.editDataFuc = editDataFuc;
            }
            $(tbId).empty();
            var start = (0 + (m.Table.dataNowPage * perCountOnePage));
            var end = ((m.Table.dataNowPage + 1) * perCountOnePage);
            if (dataArr.length < end) {
                end = dataArr.length;
            }
            var sb = new m.String.StringBuilder();
            var tempAdd_user = undefined;
            m.Table.dataTotalPage = m.Table.getTotalPage(dataArr.length, perCountOnePage);
            for (var i = start ; i < end ; i++) {
               
                    sb.append("<tr>");
                    sb.append("<td class='text-center'>");
                    sb.append(i + 1);
                    sb.append("</td>");
                    sb.append("<td class='text-center'>");
                    sb.append(dataArr[i].MPname);
                    sb.append("</td>");
                    sb.append("<td class='text-center'>");
                    sb.append("<a target='_blank' href='../../../uploadfile/msysk/");
                    sb.append(dataArr[i].File_Name);
                    sb.append("'>")
                    sb.append(dataArr[i].File_Title);
                    sb.append("</a>");
                    
                    sb.append("</td>");
                    sb.append("<td class='text-center'>");
                    sb.append(dataArr[i].add_date);
                    sb.append("</td>");

                    sb.append("<td class='text-center'>");
                    tempAdd_user = dataArr[i].add_user;
                    if (tempAdd_user == U_Num_M || tempAdd_user == "08158" || U_POSITION_M == "0004") {
                        sb.append("<a href='javascript:void(0)' class='deleteData delPer' File_num='");
                        sb.append(dataArr[i].File_num);
                        sb.append("'>刪</a>");
                    } else {
                        sb.append("-");
                    }
                    
                    sb.append("</td>");
                    sb.append("</td>");
                    sb.append("</tr>");
            }
            $(tbId).append(sb.toString());
            $(".deleteData").on("click", deleteDataFuc);
            m.Table.makePageBar(pageBarId, perCountOnePage)
        }
    };


})($openInterestTableManagementPageList);