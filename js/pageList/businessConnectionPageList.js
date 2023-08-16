
$businessConnectionPageList = {
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
        deleteCustomerDataFuc: undefined,
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
            //if (m.Table.dataTotalPage >= 30) {
            //    showPageCount = 29;
            //} else {
            //    showPageCount = m.Table.dataTotalPage - 1;
            //}
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
        makeTbody: function (tbId, dataArr, perCountOnePage, pageBarId, deleteCustomerDataFuc) {

            if (m.Check.isEmptyStr(tbId)) {

                tbId = m.Table.tbId;
                dataArr = m.Table.ThisdataArr;
                perCountOnePage = m.Table.perCountOnePage;
                pageBarId = m.Table.pageBarId;
                deleteCustomerDataFuc = m.Table.deleteCustomerDataFuc;
            } else {
                m.Table.dataNowPage = 0;
                m.Table.tbId = tbId;
                m.Table.ThisdataArr = dataArr;
                m.Table.perCountOnePage = perCountOnePage;
                m.Table.pageBarId = pageBarId;
                m.Table.deleteCustomerDataFuc = deleteCustomerDataFuc;
            }
            $(tbId).empty();
            var start = (0 + (m.Table.dataNowPage * perCountOnePage));
            var end = ((m.Table.dataNowPage + 1) * perCountOnePage);
            if (dataArr.length < end) {
                end = dataArr.length;
            }
            var sb = new m.String.StringBuilder();
            var temp = "";
            m.Table.dataTotalPage = m.Table.getTotalPage(dataArr.length, perCountOnePage);
            for (var i = start; i < end; i++) {

                sb.append("<tr>");
                sb.append("<td class='text-center'>");
                sb.append(i + 1);//單號
                sb.append("</td>");
                sb.append("<td class='text-center'>");
                sb.append(dataArr[i].ObjName);//件別
                sb.append("</td>");
                sb.append("<td class='text-center'>");
                temp = dataArr[i].Light_Status;//燈號
                if (temp == "紅燈") {
                    //sb.append("<span class='colorRed'>");
                    sb.append("<span><img src='\\..\\..\\..\\img\\icon\\Green_Light.png' width=15 height=15>");

                    //sb.append(temp);
                } else if (temp == "黃燈") {
                    //sb.append("<span class='colorYellow'>");
                    sb.append("<span><img src='\\..\\..\\..\\img\\icon\\Green_Light.png' width=15 height=15>");
                    //sb.append(temp);
                } else {
                   // sb.append("<span class='colorGreen'>");
                    sb.append("<span><img src='\\..\\..\\..\\img\\icon\\Green_Light.png' width=15 height=15>");

                    //sb.append(temp);
                }
                sb.append("</span>");

                sb.append("</td>");
                sb.append("<td class='text-center'>");
                sb.append(dataArr[i].Contact_Name);//聯絡單種類
                sb.append("</td>");
                sb.append("<td class='text-center'>");
                sb.append(dataArr[i].MC_Name);//分析師
                sb.append("</td>");
                sb.append("<td class='text-center'>");
                sb.append("<a class='BlueLink10 qPer' href='/wealthManage/customerManage/MMBER/customerDetail.aspx?M_ID=");
                sb.append(dataArr[i].M_ID);//分析師M_ID
                sb.append("' target='_blank'>");
                sb.append(dataArr[i].Name);//會員姓名                                                   
                sb.append("</td>");
                //sb.append("</th><th class='text-center'>");
                //sb.append("<a class='BlueLink10 qPer' href='customerDetail.aspx?M_ID=");
                //sb.append(dataArr[i].M_ID);//分析師M_ID
                //sb.append("' target='_blank'>");
                //sb.append(dataArr[i].M_Name);
                //sb.append("</a></th><th class='text-center'>");
                ////if (v.M_Sax == "M") {
                ////    sb.append("先生");
                ////} else {
                ////    sb.append("小姐");
                ////}
                //sb.append("</th><th class='text-center'>");
                sb.append("<td class='text-center'>");
                sb.append(dataArr[i].Propser);//提案人(部門名稱+提案人姓名)
                sb.append("<br />");
                //sb.append(dataArr[i].Date);//提案日期
                sb.append("</td>");
                sb.append("<td class='text-center'>");
                sb.append(dataArr[i].Date);//提案日期
                sb.append("</td>");
                sb.append("<td class='text-center'>");
                sb.append(dataArr[i].F_Status);//狀態
                sb.append("</td>");
                sb.append("<td class='textAlignLeft'>單:");
                sb.append(dataArr[i].U_LeaderName);
                sb.append(" - ");
                sb.append(dataArr[i].U_LeaderStatus);
                sb.append("<br />行:");
                sb.append(dataArr[i].EX_Name);
                sb.append(" - ");
                sb.append(dataArr[i].EX_Status);
                sb.append("<br />主:");
                sb.append(dataArr[i].EX_LeaderName);
                sb.append(" - ");
                sb.append(dataArr[i].EX_LeaderStatus);
                sb.append("</td>");
                sb.append("<td class='text-center'><a class='qPer' target='_blank' href='/wealthManage/businessConnection/MPMCOTF/MPMCOTF_detail.aspx?f_id=");
                sb.append(dataArr[i].f_id);//這裡要再做修改!!!!!!(20230320進度)
                sb.append("&M_ID=")
                sb.append(dataArr[i].M_ID);//分析師M_ID
                sb.append("'>細</td>");
                //20230413修改這裡!!!!!!!!
                // //20230413修改這邊!!!
                //sb.append("<td class='text-center'><a class='delPer'  href='#' class='deleteCustomerData' f_id='");
                sb.append("<td class='text-center'><a class='delPer deleteData'  href='javascript:void(0)' f_id='");
                sb.append(dataArr[i].f_id);
                sb.append("'>刪</td>");
                sb.append("</td>");
                sb.append("</tr>");
            }
            $(tbId).append(sb.toString());
            $(".deleteCustomerData").on("click", deleteCustomerDataFuc);
            m.Table.makePageBar(pageBarId, perCountOnePage)
        }
    };


})($businessConnectionPageList);