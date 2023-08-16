
$easySchoolOrderManagementPageList = {
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
        changeoverFuc: undefined,
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
            $("#pageNum").append((m.Table.dataNowPage+1) + "  /  " + m.Table.dataTotalPage);
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
        makeTbody: function (tbId, dataArr, perCountOnePage, pageBarId,  changeoverFuc, editDataFuc, deleteDataFuc) {

            if (m.Check.isEmptyStr(tbId)) {
                tbId = m.Table.tbId;
                dataArr = m.Table.ThisdataArr;
                perCountOnePage = m.Table.perCountOnePage;
                pageBarId = m.Table.pageBarId;
                deleteDataFuc = m.Table.deleteDataFuc;
                changeoverFuc = m.Table.changeoverFuc;
            } else {
                m.Table.dataNowPage = 0;
                m.Table.tbId = tbId;
                m.Table.ThisdataArr = dataArr;
                m.Table.perCountOnePage = perCountOnePage;
                m.Table.pageBarId = pageBarId;
                m.Table.deleteDataFuc = deleteDataFuc;
                m.Table.changeoverFuc = changeoverFuc;
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
                sb.append("<tr><th class='text-center'>");
                sb.append(i + 1);
                sb.append("</th>");
                sb.append("<th class='text-center'>");
                sb.append(dataArr[i].O_Id);
                sb.append("</th>");
                sb.append("<th class='text-center'>");
                sb.append(dataArr[i].PayStatusName);
                sb.append("</th>");
                sb.append("<th class='text-center'>");
                sb.append(dataArr[i].U_Name);
                sb.append("</th>");
                sb.append("<th class='textAlignLeft'>");
                sb.append(dataArr[i].Tel);
                sb.append("<br/>");
                sb.append(dataArr[i].EMail);
                sb.append("<br/>");
                sb.append(dataArr[i].MU_PW);
                sb.append("</th>");
                sb.append("<th class='textAlignLeft'>");

                if (dataArr[i].MPRD_ID == "A0001") {
                    sb.append("(線上)");
                } else if (dataArr[i].MPRD_ID == "D0001") {
                    sb.append("(現場)");
                }
                sb.append(dataArr[i].P_Name);
                sb.append("<ul>");
                sb.append("<li>付款方式：");
                sb.append(dataArr[i].Payway);
                sb.append("</li>");
                if (dataArr[i].InvoiceType == "2") {
                    sb.append("<li>發票號碼：");
                    sb.append(dataArr[i].InvoiceNumber);
                    sb.append("<br/>");
                    sb.append("發票載具：");
                    sb.append(dataArr[i].Invoice_itemName);
                    switch (dataArr[i].Invoice_item) {
                        case "1":

                            break;
                        case "2":
                            sb.append(dataArr[i].CarruerNum);
                            break;
                        case "3":
                            sb.append(dataArr[i].CarruerNum);
                            break;
                        case "4":
                            sb.append(dataArr[i].LoveCode);
                            break;
                        case "5":
                            sb.append(dataArr[i].CustomerIdentifier);
                            break;

                    }
                    sb.append("</li>");
                } else {
                    sb.append("<li>發票資訊：");
                    sb.append(dataArr[i].Invoice);
                    sb.append("聯");
                    if (dataArr[i].Invoice == "3") {
                        sb.append("<br/>公司名稱：");
                        sb.append(dataArr[i].Invoice_Com);
                        sb.append("<br/>統一發票：");
                        sb.append(dataArr[i].Invoice_Vat);
                    }
                    sb.append("</li>");
                }
                sb.append("<li>訂單日期：");
                sb.append(dataArr[i].Add_Date);
                sb.append("</li>");
                sb.append("</ul>");
                sb.append("</th>");

                sb.append("<th class='text-center'>");
                sb.append(dataArr[i].d_price);
                sb.append("</th>");
                sb.append("<th class='text-center'>");
                sb.append(dataArr[i].Quantity);
                sb.append("</th>");
                sb.append("<th class='text-center'>");
                sb.append(dataArr[i].Price);
                sb.append("</th>");



               
                sb.append("<th class='text-center'>");
                if(dataArr[i].PayStatus=="0"){
                    sb.append("-");
                }else if(dataArr[i].ch_tag=="1"){
                    sb.append("已轉入");
                }else{
                    sb.append("<a href='javascript:void(0)' class='editPer changeover' Auto_Id='");
                    sb.append(dataArr[i].Auto_Id);
                    sb.append("' T_id='");
                    sb.append(dataArr[i].T_id);
                    sb.append("' O_Id='");
                    sb.append(dataArr[i].O_Id);
                    sb.append("' U_Name='");
                    sb.append(dataArr[i].U_Name);
                    sb.append("' Tel='");
                    sb.append(dataArr[i].Tel);
                    sb.append("' EMail='");
                    sb.append(dataArr[i].EMail);
                    sb.append("' Payway='");
                    sb.append(dataArr[i].Payway);
                    sb.append("' Price='");
                    sb.append(dataArr[i].Price);
                    sb.append("' OD_id='");
                    sb.append(dataArr[i].OD_id);
                    sb.append("' Invoice='");
                    sb.append(dataArr[i].Invoice);
                    sb.append("' Invoice_Com='");
                    sb.append(dataArr[i].Invoice_Com);
                    sb.append("' Invoice_Vat='");
                    sb.append(dataArr[i].Invoice_Vat);
                    sb.append("'>");
                    sb.append("<img src='../../../../img/icon/arrow.png'/></a>");
                }
                sb.append("</th>");
                sb.append("<th class='text-center'><a href='javascript:void(0)' class='editDataFuc editPer' Auto_Id='");
                sb.append(dataArr[i].Auto_Id);
                sb.append("' U_Name='");
                sb.append(dataArr[i].U_Name);
                sb.append("' Tel='");
                sb.append(dataArr[i].Tel);
                sb.append("' EMail='");
                sb.append(dataArr[i].EMail);
                sb.append("' Add_Date='");
                sb.append(dataArr[i].Add_Date);
                sb.append("' P_EDate='");
                sb.append(dataArr[i].P_EDate);


                sb.append("'>修</a></th>");
                sb.append("<th class='text-center'><a href='javascript:void(0)' class='deleteData delPer' Auto_Id='");
                sb.append(dataArr[i].Auto_Id);
                sb.append("'>刪</a></th>");
            }
            $(tbId).append(sb.toString());
            $(".changeover").on("click", changeoverFuc);
            $(".deleteData").on("click", deleteDataFuc);
            $(".editDataFuc").on("click", editDataFuc);
            m.Table.makePageBar(pageBarId, perCountOnePage);
            $.unblockUI();
        }
    };


})($easySchoolOrderManagementPageList);