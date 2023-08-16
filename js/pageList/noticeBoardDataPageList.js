
$noticeBoardDataPageList = {
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
        //顯示資料
        makeTbody: function (tbId, dataArr, perCountOnePage, pageBarId, deleteDataFuc,getDetailFuc) {

            if (m.Check.isEmptyStr(tbId)) {
                tbId = m.Table.tbId;
                dataArr = m.Table.ThisdataArr;
                perCountOnePage = m.Table.perCountOnePage;
                pageBarId = m.Table.pageBarId;
                deleteDataFuc = m.Table.deleteDataFuc;
                getDetailFuc = m.Table.getDetailFuc;
            } else {
                m.Table.dataNowPage = 0;
                m.Table.tbId = tbId;
                m.Table.ThisdataArr = dataArr;
                m.Table.perCountOnePage = perCountOnePage;
                m.Table.pageBarId = pageBarId;
                m.Table.deleteDataFuc = deleteDataFuc;
                m.Table.getDetailFuc = getDetailFuc;
            }
            $(tbId).empty();
            var start = (0 + (m.Table.dataNowPage * perCountOnePage));
            var end = ((m.Table.dataNowPage + 1) * perCountOnePage);
            if (dataArr.length < end) {
                end = dataArr.length;
            }
            var sb = new m.String.StringBuilder();
            var adver_dep_Name;//發佈對象
            m.Table.dataTotalPage = m.Table.getTotalPage(dataArr.length, perCountOnePage);
            //發佈對象
            for (var i = start; i < end; i++) {
                //
                //if (dataArr[i].adver_dep = "6666") {
                //    dataArr[i].adver_dep_Name = "全行政部"
                //}
                //else if (dataArr[i].adver_dep = "1111") {
                //    dataArr[i].adver_dep_Name = "全營運事業部"
                //}
                //else if (dataArr[i].adver_dep = "3333") {
                //    dataArr[i].adver_dep_Name = "全理財推廣部"
                //}
                //else if (dataArr[i].adver_dep = "5555") {
                //    dataArr[i].adver_dep_Name = "全財富1部"
                //}
                //else if (dataArr[i].adver_dep = "55551") {
                //    dataArr[i].adver_dep_Name = "全財富管理部"
                //}
                //else if (dataArr[i].adver_dep = "55552") {
                //    dataArr[i].adver_dep_Name = "全財富2部"
                //}
                //else if (dataArr[i].adver_dep = "7777") {
                //    dataArr[i].adver_dep_Name = "全投資推廣部"
                //}
                //else if (dataArr[i].adver_dep = "8888") {
                //    dataArr[i].adver_dep_Name = "全營運1部"
                //}
                //else if (dataArr[i].adver_dep = "8888") {
                //    dataArr[i].adver_dep_Name = "全營運1部"
                //}
                //else if (dataArr[i].adver_dep = "2222") {
                //    dataArr[i].adver_dep_Name = "全營運2部"
                //}
                //else if (dataArr[i].adver_dep = "9999") {
                //    dataArr[i].adver_dep_Name = "全公司"
                //}
                //else if (dataArr[i].adver_dep = "4444") {
                //    dataArr[i].adver_dep_Name = "全營特別部"
                //}
                //else if (dataArr[i].adver_dep = "1115") {
                //    dataArr[i].adver_dep_Name = "全營運5部"
                //}
                //else if (dataArr[i].adver_dep = "33333") {
                //    dataArr[i].adver_dep_Name = "全營運3部"
                //}

                //
                sb.append("<tr><th class='text-center'>");
                //sb.append("<input type='checkbox' class='form-check-input' value='");
                //sb.append(dataArr[i].MS_ID);
                //sb.append("'>");
                //sb.append("</th>");
                //sb.append("<th class='text-center'>");
                sb.append(i + 1);//項次
                sb.append("</th>");
                sb.append("<th class='text-center'>")
                sb.append("<a href = '#' class= 'getDetail qPer' MS_ID = '");
                sb.append(dataArr[i].adver_id);
                sb.append("' MS_Title='");
                sb.append(dataArr[i].adver_subject);//標題
                sb.append("' MS_Text='");
                //sb.append("/ERP/public/NoticeBoard/MBULT/noticeBoard.aspx?MS_ID='");//要轉向的網址
                sb.append(dataArr[i].adver_id);
                sb.append("</a></th>");
                

                sb.append(dataArr[i].MS_Title);//要顯示的文字
                sb.append("</a></th>");
                //
                sb.append("<th class='text-center'>");
                
                sb.append(dataArr[i].adver_subject);//標題
                sb.append("</th>");
                sb.append("<th class='text-center'>");
                sb.append(dataArr[i].adver_create_date);//發佈時間
                sb.append("</th>");
                sb.append("<th class='text-center'>");
                //sb.append(dataArr[i].adver_depart_Name);//發佈單位*/
                sb.append(dataArr[i].adver_depName);//發佈對象
                sb.append("</th>");
                sb.append("<th class='text-center'>");
                //sb.append(dataArr[i].adver_depName);//發佈對象
                sb.append(dataArr[i].adver_depart_Name);//發佈單位*/
                sb.append("</th>");
                sb.append("<th class='text-center'>");
                sb.append(dataArr[i].adver_employ_Name);//發佈人員
                sb.append("</th>");
                sb.append("<td class='text-center'><a class='delPer deleteData'  href='javascript:void(0)' adver_id='");
                sb.append(dataArr[i].adver_id);
                sb.append("'>刪</td>");
            }
            $(tbId).append(sb.toString());
            $(".deleteData").on("click", deleteDataFuc);
            $(".getDetail").on("click", getDetailFuc);
            m.Table.makePageBar(pageBarId, perCountOnePage);
            $.unblockUI();
        }
    };


})($noticeBoardDataPageList);