
$Common = {
    version: "1.0.0"
};

(function (m) {

    m.Ajax = {
        send: function (url, data, success, error) {
            $.ajax({
                url: url,
                data: data,
                method: 'POST',
                success: success,
                error: error
            });
        }
    };
    m.util = {
        getUserAuthority: function (url, menu_no, U_Num, success, error) {
            var data = "menu_no=" + menu_no + "&U_Num=" + U_Num + "&action=getUserAuthority";
            m.Ajax.send(url, data, success, error);
        },
    };
    m.Check = {
        //是否為空字串
        isEmptyStr: function (str) {
            var f = false;
            if (str === undefined || str === null || $.trim(str) === "" || str == "[]" || str == "[object Object]") {
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
    m.MMBER = {

    };
    m.Code = {
        //取得各項列表
        deCode: function (codeType, code) {
            var str = undefined;
            switch (codeType) {
                case "Light_Status":
                    switch (code) {
                        case "Y":
                            str = "黃燈";
                            break;
                        case "G":
                            str = "綠燈";
                            break;
                        case "R":
                            str = "紅燈";
                            break;
                    }
                    break;

                case "M_Sax":
                    switch (code) {
                        case "M":
                            str = "先生";
                            break;
                        case "F":
                            str = "小姐";
                            break;
                    }
                    break;

                case "N_Call_tag":
                    switch (code) {
                        case "0":
                            str = "正常";
                            break;
                        case "1":
                            str = "請勿聯絡";
                            break;
                    }
                    break;
            }
            return str;
        },
    };
    m.MITEM = {
        getListHtmlTagOption: function (ul, idOrClassName, listType, htmlTagType) {
            if (listType == "PITEM") {
                data = "action=getPITEMListFuc";
               //alert("付款方式種類取得!!");

            }

            //if (listType == "INVMY") {
            //    data = "action=getInvestMoneyListFuc";
            //    //alert(listType);
            //}
            ////取得[部門]
            //else if (listType == "Dept") {
            //    data = "action=getDeptOptionListFuc" ;
            //    alert(data);
            //}
            ////取得[所屬公司]
            //else if (listType == "Com") {
            //    data = "action=getComOptionListFuc";
            //    //alert(listType);
            //}
            ////取得[等級]
            //else if (listType == "Level") {
            //    data = "action=getSelectLevelListFuc";
            //    //alert(listType);
            //}
            ////取得[縣/市]
            //else if (listType == "County") {
            //    data = "action=getCountyOptionListFuc";
            //    //alert(listType);

            //}
            //取得[鄉鎮區市]
            //帶入選定城市
            //else 
            //if (listType == "TownShip") {
            //    data = "action=getTownShipOptionListFuc" + "&County=" + county;
            //alert(data);
            //alert("Data:" + data);
            //alert("getListHtmlTagOption:County=>" + county);
            //alert(listType);
            //}
            //取得[職稱]
            //else if (listType == "Posit") {
            //    data = "action=getSelectPositListFuc";
            //    alert(listType);
            //}

            var success = function (back) {
                try {
                    var json = JSON.parse(back);
                } catch (e) {
                    //alert(listType);
                }
                //var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "Dept") {
                        sb.append("<option value=''>請選擇部門1111</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    }
                    $(idOrClassName).append(sb.toString());
                    if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                        afterSuccessFuc();
                    }
                };
                var error = function (e) { console.log(e); };
                m.Ajax.send(url, data, success, error);//<======================   
            }
            //取得資源帳號HtmlTagOption列表
        },
        //付款方式種類下拉選單取得
        getCFItemTagOption: function (ul, idOrClassName, listType, htmlTagType) {
            var url = ul;
            var data = "";
            if (listType == "PITEM") {
                data = "action=getPITEMListFuc";
                //alert("付款方式種類下拉選單取得!!");

            }
            else if (listType == "CF_ITem") {
                data = "action=getCF_ITemListFuc";
                //alert("付款方式種類下拉選單取得!!");
            }
            var success = function (back) {
                try {
                    //alert("付款方式種類下拉選單取得成功!!");
                    var json = JSON.parse(back);
                } catch (e) {
                    //alert("付款方式種類下拉選單取得失敗!!");
                    var json = JSON.parse(back);
                    //alert(listType);
                }
                //var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                //alert("idOrClassName:" + idOrClassName);
                //alert("listType:" + listType);
                //"付款方式種類下拉選單取得!!");
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "Dept") {
                        sb.append("<option value=''>請選擇部門1111</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "CF_ITem") {
                        //alert("生成聯絡單種類下拉式選單!!")
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    }
                    $(idOrClassName).append(sb.toString());
                    if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                        afterSuccessFuc();
                    }
                };
            };
            var error = function (e) {
                alert("error:" + e);
                console.log(e);
            };
            m.Ajax.send(url, data, success, error);//<======================   
            //取得資源帳號HtmlTagOption列表
        },
        //20221116進度!!!!!!!!!!!
        //取得各項列表Option
        getMVMEB08ListHtmlTagOption: function (ul, idOrClassName, listType, MP_UserNum, htmlTagType) {
            var url = ul;
            var data = "";
            alert("getMVMEB08List");
            if (listType == "getMVMEB08List") {
                data = "action=getMPToMP_Type&MP_UserNum=" + MP_UserNum;
                //data = "action=getDeptOptionListFuc";
                alert(listType);
            }
            else if (listType == "INVMY") {
                data = "action=getInvestMoneyListFuc&action1=123";
                //data = "action=getInvestMoneyListFuc";
                alert(listType);
            }
            //取得[部門]
            else if (listType == "DEPAR") {
                data = "action=getDeptOptionListFuc&action1=123";
                //data = "action=getDeptOptionListFuc";
                alert(listType);
            }
            //取得[所屬公司]
            else if (listType == "Com") {
                data = "action=getComOptionListFuc&action1=123";
                //data = "action=getComOptionListFuc";
                alert(listType);
            }
            //取得[等級]
            else if (listType == "Level") {
                data = "action=getSelectLevelListFuc&action1=123";
                //data = "action=getSelectLevelListFuc";
                alert(listType);
            }
            //取得[縣/市]
            else if (listType == "County") {
                // data = "action=getCountyOptionListFuc";
                data = "action=getCountyOptionListFuc&action1=123";
                alert(listType);

            }
            //取得[鄉鎮區市]
            else if (listType == "TownShip") {
                //data = "action=getTownShipOptionListFuc";
                data = "action=getTownShipOptionListFuc&action1=123";
                alert(listType);
            }
            //取得[職稱]
            else if (listType == "Posit") {
                //data = "action=getSelectPositListFuc";
                data = "action=getSelectPositListFuc&action1=123";
                alert(listType);
            }

            var success = function (back) {
                try {
                    var json = JSON.parse(back);
                } catch (e) {
                    alert(listType);
                }
                //var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });

                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    }


                    $(idOrClassName).append(sb.toString());
                    if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                        afterSuccessFuc();
                    }
                };


            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================   
            //取得資源帳號HtmlTagOption列表

        },
        getMREGT02ListHtmlTagOption: function (ul, idOrClassName, SelectCom_Title, SelectDept_Title, htmlTagType) {
            alert(SelectCom_Title);
            alert(SelectDept_Title);
            var url = ul;
            var data = "";
            alert("getMVMEB08List");
            if (listType == "getMVMEB08List") {
                data = "action=getMPToMP_Type&MP_UserNum=" + MP_UserNum;
                //data = "action=getDeptOptionListFuc";
                alert(listType);
            }
            else if (listType == "INVMY") {
                data = "action=getInvestMoneyListFuc&action1=123";
                //data = "action=getInvestMoneyListFuc";
                alert(listType);
            }
            //取得[部門]
            else if (listType == "Dept") {
                data = "action=getDeptOptionListFuc&action1=123";
                //data = "action=getDeptOptionListFuc";
                alert(listType);
            }
            else if (listType == "DEPAR") {
                data = "action=getSelectDeptListFuc";;//呼叫commonHandler.ashx中的case "getSelectDeptListFuc":
                //alert(listType);
            }
            //取得[所屬公司]
            else if (listType == "Com") {
                data = "action=getComOptionListFuc";
                //data = "action=getComOptionListFuc";
                alert(listType);
            }
            //取得[等級]
            else if (listType == "Level") {
                data = "action=getSelectLevelListFuc&action1=123";
                //data = "action=getSelectLevelListFuc";
                alert(listType);
            }
            //取得[縣/市]
            else if (listType == "County") {
                // data = "action=getCountyOptionListFuc";
                data = "action=getCountyOptionListFuc&action1=123";
                alert(listType);

            }
            //取得[鄉鎮區市]
            else if (listType == "TownShip") {
                //data = "action=getTownShipOptionListFuc";
                data = "action=getTownShipOptionListFuc&action1=123";
                alert(listType);
            }
            //取得[職稱]
            else if (listType == "Posit") {
                //data = "action=getSelectPositListFuc";
                data = "action=getSelectPositListFuc&action1=123";
                alert(listType);
            }

            var success = function (back) {
                try {
                    var json = JSON.parse(back);
                } catch (e) {
                    alert(listType);
                }
                //var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    }


                    $(idOrClassName).append(sb.toString());
                    if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                        afterSuccessFuc();
                    }
                };


            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================   
            //取得資源帳號HtmlTagOption列表

        },
        getMREGT04ListHtmlTagOption: function (ul, idOrClassName, listType, htmlTagType, afterSuccessFuc) {
            //alert(SelectCom_Title);
            //alert(SelectDept_Title);
            var url = ul;
            var data = "";
            // alert("getMVMEB08List");
            if (listType == "getMVMEB08List") {
                data = "action=getMPToMP_Type&MP_UserNum=" + MP_UserNum;
                //data = "action=getDeptOptionListFuc";
                alert(listType);
            }
            else if (listType == "INVMY") {
                data = "action=getInvestMoneyListFuc&action1=123";
                //data = "action=getInvestMoneyListFuc";
                alert(listType);
            }
            //取得[部門]
            else if (listType == "Dept") {
                data = "action=getDeptOptionListFuc&action1=123";
                //data = "action=getDeptOptionListFuc";
                alert(listType);
            }
            else if (listType == "DEPAR") {
                data = "action=getSelectDeptListFuc";;//呼叫commonHandler.ashx中的case "getSelectDeptListFuc":
                //alert(listType);
            }
            //取得[所屬公司]
            else if (listType == "Com") {
                data = "action=getComOptionListFuc";
                //data = "action=getComOptionListFuc";
                alert(listType);
            }
            //取得[等級]
            else if (listType == "Level") {
                data = "action=getSelectLevelListFuc&action1=123";
                //data = "action=getSelectLevelListFuc";
                alert(listType);
            }
            //取得[縣/市]
            else if (listType == "County") {
                // data = "action=getCountyOptionListFuc";
                data = "action=getCountyOptionListFuc&action1=123";
                alert(listType);

            }
            //取得[鄉鎮區市]
            else if (listType == "TownShip") {
                //data = "action=getTownShipOptionListFuc";
                data = "action=getTownShipOptionListFuc&action1=123";
                alert(listType);
            }
            //取得[職稱]
            else if (listType == "Posit") {
                //data = "action=getSelectPositListFuc";
                data = "action=getSelectPositListFuc&action1=123";
                alert(listType);
            }

            var success = function (back) {
                try {
                    var json = JSON.parse(back);
                } catch (e) {
                    alert(listType);
                }
                //var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    }


                    $(idOrClassName).append(sb.toString());
                    if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                        afterSuccessFuc();
                    }
                };


            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================   
            //取得資源帳號HtmlTagOption列表

        },
        getCustomerDetailListHtmlTagOption: function (ul, idOrClassName, listType, htmlTagType) {
            //alert("getListHtmlTagOption:County=>" + county);
            $(idOrClassName).empty();
            var url = ul;
            var data = "";
            //if (listType == "INVMY") {
            //    data = "action=getInvestMoneyListFuc";
            //    //alert(listType);
            //}
            ////取得[部門]
            //else if (listType == "Dept") {
            //    data = "action=getDeptOptionListFuc" ;
            //    alert(data);
            //}
            ////取得[所屬公司]
            //else if (listType == "Com") {
            //    data = "action=getComOptionListFuc";
            //    //alert(listType);
            //}
            ////取得[等級]
            //else if (listType == "Level") {
            //    data = "action=getSelectLevelListFuc";
            //    //alert(listType);
            //}
            ////取得[縣/市]
            //else if (listType == "County") {
            //    data = "action=getCountyOptionListFuc";
            //    //alert(listType);

            //}
            //取得[鄉鎮區市]
            //帶入選定城市
            //else 
            //if (listType == "TownShip") {
            //    data = "action=getTownShipOptionListFuc" + "&County=" + county;
            //alert(data);
            //alert("Data:" + data);
            //alert("getListHtmlTagOption:County=>" + county);
            //alert(listType);
            //}
            //取得[職稱]
            //else if (listType == "Posit") {
            //    data = "action=getSelectPositListFuc";
            //    alert(listType);
            //}

            var success = function (back) {
                try {
                    var json = JSON.parse(back);
                } catch (e) {
                    //alert(listType);
                }
                //var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='0001'>入會</option>");
                        sb.append("<option value='0002'>設訊</option>");
                        sb.append("<option value='0003'>設傳真稿</option>");
                        sb.append("<option value='0004'>業績歸屬</option>");
                        sb.append("<option value='0005'>更改責任助理</option>");
                        sb.append("<option value='0006'>折讓</option>");
                        sb.append("<option value='0007'>訂金件</option>");
                        sb.append("<option value='0008'>退費</option>");
                        sb.append("<option value='0009'>暫停/恢復</option>");
                        sb.append("<option value='0010'>轉老師</option>");
                        sb.append("<option value='0011'>其他</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "Dept") {
                        sb.append("<option value=''>請選擇部門1111</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        $.each(json, function (i, v) {
                            sb.append("<option value='0000'>不限</option>");
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    }


                    $(idOrClassName).append(sb.toString());
                    if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                        afterSuccessFuc();
                    }
                };


            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================   
            //取得資源帳號HtmlTagOption列表
        },
        getMP_ItemListHtmlTagOption: function (ul, idOrClassName, listType, htmlTagType) {
            //listType:所選的分析師編號
            listType = val_M("#abcMP_ID");//所選的分析師會員編號
            //alert("!!!!!listType=>" + listType);
            $(idOrClassName).empty();
            var url = ul;
            var data = "U_Num=" + listType + "&action=getMP_ItemList";
            if (listType == "MP_Item") {
                data = "action=getMP_ItemListFuc";
                //    //alert(listType);
            }
            var success = function (back) {
                $(idOrClassName).empty();
                var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='0001'>入會</option>");
                        sb.append("<option value='0002'>設訊</option>");
                        sb.append("<option value='0003'>設傳真稿</option>");
                        sb.append("<option value='0004'>業績歸屬</option>");
                        sb.append("<option value='0005'>更改責任助理</option>");
                        sb.append("<option value='0006'>折讓</option>");
                        sb.append("<option value='0007'>訂金件</option>");
                        sb.append("<option value='0008'>退費</option>");
                        sb.append("<option value='0009'>暫停/恢復</option>");
                        sb.append("<option value='0010'>轉老師</option>");
                        sb.append("<option value='0011'>其他</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "Dept") {
                        sb.append("<option value=''>請選擇部門1111</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        sb.append("<option value='0000'>不限</option>");
                        $.each(json, function (i, v) {
                            /*sb.append("<option value='0000'>不限</option>");*/
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    }


                    $(idOrClassName).append(sb.toString());
                    //if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    //    afterSuccessFuc();
                    //}
                };
            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================
        },
        getListHtmlTagOption: function (ul, idOrClassName, listType, htmlTagType, afterSuccessFuc) {
            //alert("getListHtmlTagOption:County=>" +county);
            $(idOrClassName).empty();
            var url = ul;
            var data = "";
            //if (listType == "INVMY") {
            //    data = "action=getInvestMoneyListFuc";
            //    //alert(listType);
            //}
            ////取得[部門]
            //else if (listType == "Dept") {
            //    data = "action=getDeptOptionListFuc" ;
            //    alert(data);
            //}
            ////取得[所屬公司]
            //else if (listType == "Com") {
            //    data = "action=getComOptionListFuc";
            //    //alert(listType);
            //}
            ////取得[等級]
            //else if (listType == "Level") {
            //    data = "action=getSelectLevelListFuc";
            //    //alert(listType);
            //}
            ////取得[縣/市]
            //else if (listType == "County") {
            //    data = "action=getCountyOptionListFuc";
            //    //alert(listType);

            //}
            //取得[鄉鎮區市]
            //帶入選定城市
            //else 
            //if (listType == "TownShip") {
            //    data = "action=getTownShipOptionListFuc" + "&County=" + county;
            //alert(data);
            //alert("Data:" + data);
            //alert("getListHtmlTagOption:County=>" + county);
            //alert(listType);
            //}
            //取得[職稱]
            //else if (listType == "Posit") {
            //    data = "action=getSelectPositListFuc";
            //    alert(listType);
            //}

            var success = function (back) {
                try {
                    var json = JSON.parse(back);
                } catch (e) {
                    //alert(listType);
                }
                //var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "Dept") {
                        sb.append("<option value=''>請選擇部門1111</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        $.each(json, function (i, v) {
                            sb.append("<option value='0000'>不限</option>");
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    }


                    $(idOrClassName).append(sb.toString());
                    if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                        afterSuccessFuc();
                    }
                };


            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================   
            //取得資源帳號HtmlTagOption列表

        },
        //取得[分析師對應的入會種類]
        getListHtmlTagOption: function (ul, idOrClassName, listType, MP_Type, htmlTagType) {
            //alert("getListHtmlTagOption:County=>" +county);
            $(idOrClassName).empty();
            var url = ul;
            var data = "action=getMPToMP_Type&MP_Type=" + MP_Type;;
            //if (listType == "INVMY") {
            //    data = "action=getInvestMoneyListFuc";
            //    //alert(listType);
            //}
            ////取得[部門]
            //else if (listType == "Dept") {
            //    data = "action=getDeptOptionListFuc" ;
            //    alert(data);
            //}
            ////取得[所屬公司]
            //else if (listType == "Com") {
            //    data = "action=getComOptionListFuc";
            //    //alert(listType);
            //}
            ////取得[等級]
            //else if (listType == "Level") {
            //    data = "action=getSelectLevelListFuc";
            //    //alert(listType);
            //}
            ////取得[縣/市]
            //else if (listType == "County") {
            //    data = "action=getCountyOptionListFuc";
            //    //alert(listType);

            //}
            //取得[鄉鎮區市]
            //帶入選定城市
            //else 
            //if (listType == "TownShip") {
            //    data = "action=getTownShipOptionListFuc" + "&County=" + county;
            //alert(data);
            //alert("Data:" + data);
            //alert("getListHtmlTagOption:County=>" + county);
            //alert(listType);
            //}
            //取得[職稱]
            //else if (listType == "Posit") {
            //    data = "action=getSelectPositListFuc";
            //    alert(listType);
            //}

            var success = function (back) {
                try {
                    var json = JSON.parse(back);
                } catch (e) {
                    //alert(listType);
                }
                //var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        $.each(json, function (i, v) {
                            sb.append("<option value='0000'>不限</option>");
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    }


                    $(idOrClassName).append(sb.toString());
                    if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                        afterSuccessFuc();
                    }
                };


            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================   
            //取得資源帳號HtmlTagOption列表

        },
        getListHtmlTagOption: function (ul, idOrClassName, listType, htmlTagType, afterSuccessFuc, DEPARtype, Viewtag0TF) {

            var url = ul;
            var data = undefined;
            if (Viewtag0TF) {
                data = "action=getListByViewtag0&listType=" + listType;
            } else {
                data = "action=getList&listType=" + listType;
            }
            var success = function (back) {

                var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    }
                    else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                    }
                    else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    }
                    else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    }
                    else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    }
                    else if (listType == "COMID") {
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    }
                    else {
                        sb.append("<option value=''>請選擇</option>");
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    }

                } else if (htmlTagType == "checkbox") {
                    $.each(json, function (i, v) {
                        sb.append("<input type='checkbox' class='multipleMPitem' name='");
                        sb.append(listType);
                        sb.append("' value='");
                        sb.append(v.ditcode);
                        sb.append("' txt='");
                        sb.append(v.ddesc);
                        sb.append("'>");
                        sb.append(v.ddesc);
                        if (Viewtag0TF) {
                            sb.append("<span class='colorBlue' id='");
                            sb.append(listType);
                            sb.append(v.ditcode);
                            sb.append("'></span>");
                        }
                        sb.append("&nbsp;&nbsp;");
                    });
                }
                else if (htmlTagType == "radio") {
                    $.each(json, function (i, v) {
                        sb.append("<input type='radio' class='singleMPitem' name='");
                        sb.append(listType);
                        sb.append("' value='");
                        sb.append(v.ditcode);
                        sb.append("' txt='");
                        sb.append(v.ddesc);
                        sb.append("'>");
                        sb.append(v.ddesc);
                        sb.append("&nbsp;&nbsp;");
                    });
                }
                if (DEPARtype == "all") {
                    sb.append("<option value='9999'>全公司11</option>");
                    sb.append("<option value='1111'>全營運事業部</option>");
                    sb.append("<option value='8888'>全營運1部</option>");
                    sb.append("<option value='2222'>全營運2部</option>");
                    sb.append("<option value='7777'>全投資推廣部</option>");
                    sb.append("<option value='5555'>全財富管理部</option>");
                    sb.append("<option value='3333'>全理財推廣部</option>");
                    sb.append("<option value='6666'>全行政部</option>");
                }

                if (Viewtag0TF) {
                    if (listType == "D0312152") {
                        sb.append("<br><font color=#CC0000 >(若有期貨買賣操作，請與主管確認後，再發訊息)</font>");
                    } else if (listType == "D0110011") {
                        sb.append("<br>(規定發訊格式)例：<font color=#CC0000 >(6422)君耀-KY<u>現在69.5元，請現價或市價直接買進</u>。</font>訊息結尾所帶時間，依老師丟過來的時間為主。");
                    }
                }

                $(idOrClassName).append(sb.toString());
                if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    afterSuccessFuc();
                }
            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================
        },
        getListHtmlTagOption: function (ul, idOrClassName, Temp, listType, htmlTagType, afterSuccessFuc, county) {
            var url = ul;
            var data = "";
            var county = "";

            //取得[銀行列表]
            if (listType == "Bank") {
                data = "action=getBankListFuc";
                //alert(listType);
            }
            //取得[部門]
            else if (listType == "Dept") {
                data = "action=getSelectDeptListFuc";;//呼叫commonHandler.ashx中的case "getSelectDeptListFuc":
                //alert(listType);
            }
            //DEPAR
            else if (listType == "DEPAR") {
                data = "action=getSelectDeptListFuc";;//呼叫commonHandler.ashx中的case "getSelectDeptListFuc":
                //alert(listType);
            }
            // //取得[所屬公司]
            else if (listType == "Com") {
                data = "action=getSelectComListFuc";;//呼叫commonHandler.ashx中的case "getSelectComListFuc":
                //alert(listType);
            }
            //取得[縣/市]
            else if (listType == "County") {
                data = "action=getCountyOptionListFuc";
                //alert(listType);

            }
            //取得[鄉鎮區市]
            else if (listType == "TownShip") {
                county = County;
                data = "action=getTownShipOptionListFuc" + "&County=" + county;
                //alert(data);
                //alert(listType);
            }
            //取得[等級]
            else if (listType == "Level") {
                //alert('1');
                data = "action=getSelectLevelListFuc";//呼叫commonHandler.ashx中的case "getSelectLevelListFuc":
                //alert(listType);
            }
            //取得[職稱]
            else if (listType == "UITEM") {
                data = "action=getSelectUITEMListFuc";
                //alert(listType);
            }

            var success = function (back) {

                var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");

                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='0000'>不限</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        sb.append("<option value='0000'>不限</option>");
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    }


                    $(idOrClassName).append(sb.toString());
                    if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                        afterSuccessFuc();
                    }
                };
                var error = function (e) { console.log(e); };
                m.Ajax.send(url, data, success, error);//<======================
            }
            //var error = function (e) { console.log(e); };
            //m.Ajax.send(url, data, success, error);//<======================
            //if (!m.Check.isEmptyStr(afterSuccessFuc)) {
            //    afterSuccessFuc();
            //}
        },
        getMREGT02ListHtmlTagOption: function (ul, idOrClassName, listType, htmlTagType, afterSuccessFuc) {
            var url = ul;
            var data = "";
            var county = "";

            //取得[銀行列表]
            if (listType == "Bank") {
                data = "action=getBankListFuc";
                //alert(listType);
            }
            //取得[部門]
            else if (listType == "Dept") {
                data = "action=getSelectDeptListFuc";;//呼叫commonHandler.ashx中的case "getSelectDeptListFuc":
                //alert(listType);
            }
            else if (listType == "DEPAR") {
                data = "action=getSelectDeptListFuc";;//呼叫commonHandler.ashx中的case "getSelectDeptListFuc":
                //alert(listType);
            }
            // //取得[所屬公司]
            else if (listType == "Com") {
                data = "action=getSelectComListFuc";;//呼叫commonHandler.ashx中的case "getSelectComListFuc":
                //alert(listType);
            }
            //取得[縣/市]
            else if (listType == "County") {
                data = "action=getCountyOptionListFuc";
                //alert(listType);

            }
            //取得[鄉鎮區市]
            else if (listType == "TownShip") {
                county = County;
                data = "action=getTownShipOptionListFuc" + "&County=" + county;
                //alert(data);
                //alert(listType);
            }
            //取得[等級]
            else if (listType == "Level") {
                //alert('1');
                data = "action=getSelectLevelListFuc";//呼叫commonHandler.ashx中的case "getSelectLevelListFuc":
                //alert(listType);
            }
            //取得[職稱]
            else if (listType == "UITEM") {
                data = "action=getSelectUITEMListFuc";
                //alert(listType);
            }
            else if (listType == "Tel_Zone") {
                data = "action=getSelectTelZoneListFuc";
            }

            var success = function (back) {

                var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        sb.append("<option value='0000'>不限</option>");
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    }


                    $(idOrClassName).append(sb.toString());
                    if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                        afterSuccessFuc();
                    }
                };
                //var error = function (e) { console.log(e); };
                //m.Ajax.send(url, data, success, error);//<======================
            }
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================
            if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                afterSuccessFuc();
            }
        },
        getListHtmlTagOption: function (ul, idOrClassName, listType, htmlTagType, afterSuccessFuc) {
            var url = ul;
            var data = "";
            var county = "";

            //取得[銀行列表]
            if (listType == "Bank") {
                data = "action=getBankListFuc";
                //alert(listType);
            }
            //取得[部門]
            else if (listType == "Dept") {
                data = "action=getSelectDeptListFuc";;//呼叫commonHandler.ashx中的case "getSelectDeptListFuc":
                //alert(listType);
            }
            else if (listType == "DEPAR") {
                data = "action=getSelectDeptListFuc";;//呼叫commonHandler.ashx中的case "getSelectDeptListFuc":
                //alert(listType);
            }
            // //取得[所屬公司]
            else if (listType == "Com") {
                data = "action=getSelectComListFuc";;//呼叫commonHandler.ashx中的case "getSelectComListFuc":
                //alert(listType);
            }
            //取得[縣/市]
            else if (listType == "County") {
                data = "action=getCountyOptionListFuc";
                //alert(listType);

            }
            //取得[鄉鎮區市]
            else if (listType == "TownShip") {
                county = County;
                data = "action=getTownShipOptionListFuc" + "&County=" + county;
                //alert(data);
                //alert(listType);
            }
            //取得[等級]
            else if (listType == "Level") {
                //alert('1');
                data = "action=getSelectLevelListFuc";//呼叫commonHandler.ashx中的case "getSelectLevelListFuc":
                //alert(listType);
            }
            //取得[職稱]
            else if (listType == "UITEM") {
                data = "action=getSelectUITEMListFuc";
                //alert(listType);
            }
            else if (listType == "Tel_Zone") {
                data = "action=getSelectTelZoneListFuc";
            }

            var success = function (back) {

                var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        sb.append("<option value='0000'>不限</option>");
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    }


                    $(idOrClassName).append(sb.toString());
                    if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                        afterSuccessFuc();
                    }
                };
                var error = function (e) { console.log(e); };
                m.Ajax.send(url, data, success, error);//<======================
            }
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================
            if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                afterSuccessFuc();
            }
        },
        getBusinessConnectionList: function (ul, idOrClassName, listType, htmlTagType) {
            //alert("使用者維護作業 0904: " + SelectedValue);
            //alert(idOrClassName);
            var url = ul;
            var data = "";
            //取得[銀行列表]
            if (listType == "Bank") {
                //data = "action=getBankListFuc" + "&" + "BankKeyWord=" + BankKeyWord;
                //alert(listType);
            }
            //業務聯絡單種類
            else if (listType == "CF_ITem") {
                data = "action=getCF_ITemListFuc";
            }
            else if (listType == "INVMY") {
                data = "action=getInvestMoneyListFuc";
            }
            //取得[部門]
            else if (listType == "Dept") {
                data = "action=getDeptOptionListFuc";
            }
            else if (listType == "DEPAR") {
                data = "action=getSelectDeptListFuc";;//呼叫commonHandler.ashx中的case "getSelectDeptListFuc":
                //alert(listType);
            }
            //取得[所屬公司]
            else if (listType == "Com") {
                data = "action=getComOptionListFuc";
            }
            //取得[等級]
            else if (listType == "Level") {
                data = "action=getSelectLevelListFuc";
            }
            //取得[縣/市]
            else if (listType == "County") {
                data = "action=getCountyOptionListFuc";
            }
            //取得[鄉鎮區市]
            else if (listType == "TownShip") {
                data = "action=getTownShipOptionListFuc" + "&" + "county=" + BankKeyWord;
            }
            //取得[職稱]
            else if (listType == "Posit") {
                data = "action=getSelectPositListFuc";  // alert(listType);
            }
            //取得[銀行列表]
            else if (listType == "Bank") {
                data = "action=getBankListFuc";
                //alert(listType);
            }
            else if (listType == "Tel_Zone") {
                data = "action=getSelectTelZoneListFuc";
            }


            var success = function (back) {
                try {
                    var json = JSON.parse(back);
                } catch (e) {
                    //alert(listType);
                }
                //var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        //202209141要修改的地方
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else if (listType == "ZipCode") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        var type = listType;
                        sb.append("<option value='0000'>不限</option>");
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    }


                    $(idOrClassName).append(sb.toString());
                    //if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    //    afterSuccessFuc();
                    //}
                };


            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================   
            //取得資源帳號HtmlTagOption列表

        },
        getListHtmlTagOption: function (ul, idOrClassName, listType, htmlTagType) {
            alert("!!!!!!getListHtmlTagOption:County=>" + county);
            //alert("使用者維護作業 0904: " + SelectedValue);
            //alert(idOrClassName);
            var url = ul;
            var data = "";
            //取得[銀行列表]
            if (listType == "Bank") {
                //data = "action=getBankListFuc" + "&" + "BankKeyWord=" + BankKeyWord;
                //alert(listType);
            }
            else if (listType == "INVMY") {
                data = "action=getInvestMoneyListFuc";
            }
            //取得[部門]
            else if (listType == "Dept") {
                data = "action=getDeptOptionListFuc";
            }
            else if (listType == "DEPAR") {
                data = "action=getSelectDeptListFuc";;//呼叫commonHandler.ashx中的case "getSelectDeptListFuc":
                //alert(listType);
            }
            //取得[所屬公司]
            else if (listType == "Com") {
                data = "action=getComOptionListFuc";
            }
            //取得[等級]
            else if (listType == "Level") {
                data = "action=getSelectLevelListFuc";
            }
            //取得[縣/市]
            else if (listType == "County") {
                data = "action=getCountyOptionListFuc";
            }
            //取得[鄉鎮區市]
            else if (listType == "TownShip") {
                data = "action=getTownShipOptionListFuc" + "&" + "county=" + BankKeyWord;
            }
            //取得[職稱]
            else if (listType == "Posit") {
                data = "action=getSelectPositListFuc";  // alert(listType);
            }
            //取得[銀行列表]
            else if (listType == "Bank") {
                data = "action=getBankListFuc";
                //alert(listType);
            }
            else if (listType == "Tel_Zone") {
                data = "action=getSelectTelZoneListFuc";
            }


            var success = function (back) {
                try {
                    var json = JSON.parse(back);
                } catch (e) {
                    //alert(listType);
                }
                //var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        //202209141要修改的地方
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else if (listType == "ZipCode") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        var type = listType;
                        sb.append("<option value='0000'>不限</option>");
                        $.each(json, function (i, v) {
                            //202209142要修改的地方
                            if (v.ditcode == SelectedValue) {
                                sb.append("<option value='");
                                sb.append(v.ditcode);
                                sb.append("' selected >");
                                sb.append(v.ddesc);
                                sb.append("</option>");
                            }
                            else {
                                sb.append("<option value='");
                                sb.append(v.ditcode);
                                sb.append("'>");
                                sb.append(v.ddesc);
                                sb.append("</option>");
                            }
                        });
                    }


                    //$(idOrClassName).append(sb.toString());
                    //if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    //    afterSuccessFuc();
                    //}
                };


            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================   
            //取得資源帳號HtmlTagOption列表

        },

        getListHtmlTagOption: function (ul, idOrClassName, listType, htmlTagType, county) {
            //alert("getListHtmlTagOption:County=>" +county);
            $(idOrClassName).empty();
            var url = ul;
            var data = "";
            //if (listType == "INVMY") {
            //    data = "action=getInvestMoneyListFuc";
            //    //alert(listType);
            //}
            ////取得[部門]
            //else if (listType == "Dept") {
            //    data = "action=getDeptOptionListFuc" ;
            //    alert(data);
            //}
            ////取得[所屬公司]
            //else if (listType == "Com") {
            //    data = "action=getComOptionListFuc";
            //    //alert(listType);
            //}
            ////取得[等級]
            //else if (listType == "Level") {
            //    data = "action=getSelectLevelListFuc";
            //    //alert(listType);
            //}
            ////取得[縣/市]
            //else if (listType == "County") {
            //    data = "action=getCountyOptionListFuc";
            //    //alert(listType);

            //}
            //取得[鄉鎮區市]
            //帶入選定城市
            //else 
            if (listType == "TownShip") {
                data = "action=getTownShipOptionListFuc" + "&County=" + county;
                //alert(data);
                //alert("Data:" + data);
                //alert("getListHtmlTagOption:County=>" + county);
                //alert(listType);
            }
            //取得[職稱]
            //else if (listType == "Posit") {
            //    data = "action=getSelectPositListFuc";
            //    alert(listType);
            //}

            var success = function (back) {
                try {
                    var json = JSON.parse(back);
                } catch (e) {
                    //alert(listType);
                }
                //var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        $.each(json, function (i, v) {
                            sb.append("<option value='0000'>不限</option>");
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    }


                    $(idOrClassName).append(sb.toString());
                    if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                        afterSuccessFuc();
                    }
                };


            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================   
            //取得資源帳號HtmlTagOption列表

        },
        getListHtmlTagOption: function (ul, idOrClassName, listType, htmlTagType, afterSuccessFuc) {
            //alert("使用者維護作業(//取得[縣/市])-修改執行這段" + test);
            //alert(test1);
            //alert(test2);
            var url = ul;
            var data = "";
            //取得[銀行列表]
            if (listType == "Bank") {
                //data = "action=getBankListFuc" + "&" + "BankKeyWord=" + BankKeyWord;
                //alert(listType);
            }
            else if (listType == "INVMY") {
                data = "action=getInvestMoneyListFuc";
            }
            //取得[部門]
            else if (listType == "Dept") {
                data = "action=getDeptOptionListFuc";
            }
            else if (listType == "DEPAR") {
                data = "action=getSelectDeptListFuc";;//呼叫commonHandler.ashx中的case "getSelectDeptListFuc":
                //alert(listType);
            }
            //取得[所屬公司]
            else if (listType == "Com") {
                data = "action=getComOptionListFuc";
            }
            //取得[等級]
            else if (listType == "Level") {
                data = "action=getSelectLevelListFuc";
            }
            //取得[縣/市]
            else if (listType == "County") {
                data = "action=getCountyOptionListFuc";
            }
            //取得[鄉鎮區市]
            else if (listType == "TownShip") {
                data = "action=getTownShipOptionListFuc" + "&" + "county=" + BankKeyWord;
            }
            //取得[職稱]
            else if (listType == "Posit") {
                data = "action=getSelectPositListFuc";  // alert(listType);
            }
            //取得[銀行列表]
            else if (listType == "Bank") {
                data = "action=getBankListFuc";
                //alert(listType);
            }
            else if (listType == "Tel_Zone") {
                data = "action=getSelectTelZoneListFuc";
            }


            var success = function (back) {
                try {
                    var json = JSON.parse(back);
                } catch (e) {
                    //alert(listType);
                }
                //var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else if (listType == "ZipCode") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        sb.append("<option value='0000'>不限</option>");
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    };


                    $(idOrClassName).append(sb.toString());
                    if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                        afterSuccessFuc();
                    }
                };
            }
        },
        getListHtmlTagOption: function (ul, idOrClassName, listType, htmlTagType, A, B, test) {
            //alert("使用者維護作業(//取得[縣/市])-修改執行這段" + test);
            //alert(test1);
            //alert(test2);
            var url = ul;
            var data = "";
            //取得[銀行列表]
            if (listType == "Bank") {
                //data = "action=getBankListFuc" + "&" + "BankKeyWord=" + BankKeyWord;
                //alert(listType);
            }
            else if (listType == "INVMY") {
                data = "action=getInvestMoneyListFuc";
            }
            //取得[部門]
            else if (listType == "Dept") {
                data = "action=getDeptOptionListFuc";
            }
            else if (listType == "DEPAR") {
                data = "action=getSelectDeptListFuc";;//呼叫commonHandler.ashx中的case "getSelectDeptListFuc":
                //alert(listType);
            }
            //取得[所屬公司]
            else if (listType == "Com") {
                data = "action=getComOptionListFuc";
            }
            //取得[等級]
            else if (listType == "Level") {
                data = "action=getSelectLevelListFuc";
            }
            //取得[縣/市]
            else if (listType == "County") {
                data = "action=getCountyOptionListFuc";
            }
            //取得[鄉鎮區市]
            else if (listType == "TownShip") {
                data = "action=getTownShipOptionListFuc" + "&" + "county=" + BankKeyWord;
            }
            //取得[職稱]
            else if (listType == "Posit") {
                data = "action=getSelectPositListFuc";  // alert(listType);
            }
            //取得[銀行列表]
            else if (listType == "Bank") {
                data = "action=getBankListFuc";
                //alert(listType);
            }
            else if (listType == "Tel_Zone") {
                data = "action=getSelectTelZoneListFuc";
            }
            else if (listType == "CF_ITem") {
                data = "action=getCF_ITemListFuc";
            }
            else if (listType == "PITEM") {
                data = "action=getPITEMListFuc";
            }
            var success = function (back) {
                try {
                    var json = JSON.parse(back);
                } catch (e) {
                    //alert(listType);
                }
                //var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });// data = "action=getPITEMListFuc";
                    } else if (listType == "ZipCode") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        //sb.append("<option value='0000'>不限</option>");
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });

                    };


                    $(idOrClassName).append(sb.toString());
                    //if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    //    afterSuccessFuc();
                    //}
                };
            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================  
        },
        getMREGT02ListHtmlTagOption: function (ul, idOrClassName, listType, htmlTagType, afterSuccessFuc) {
            var url = ul;
            var data = "";
            //個人業績表取得[何承唐]產品種類(MemberType)(action=getMemberTypeFunc)
            if (listType == "D9907161") {
                data = "action=getMemberTypeFunc" + "&" + "TeacherUnum=" + listType;
                //alert(listType);
            }
            //取得[銀行列表]
            else if (listType == "Bank") {
                data = "action=getBankListFuc" + "&" + "BankKeyWord=" + BankKeyWord;
                //alert(listType);
            }
            else if (listType == "INVMY") {
                data = "action=getInvestMoneyListFuc";
            }
            //取得[部門]
            else if (listType == "Dept") {
                data = "action=getDeptOptionListFuc";
            }
            else if (listType == "DEPAR") {
                data = "action=getSelectDeptListFuc";;//呼叫commonHandler.ashx中的case "getSelectDeptListFuc":
                //alert(listType);
            }
            //取得[所屬公司]
            else if (listType == "Com") {
                data = "action=getComOptionListFuc";
            }
            //取得[等級]
            else if (listType == "Level") {
                data = "action=getSelectLevelListFuc";
            }
            //取得[縣/市]
            else if (listType == "County") {
                data = "action=getCountyOptionListFuc";
            }
            //取得[鄉鎮區市]
            else if (listType == "TownShip") {
                data = "action=getTownShipOptionListFuc" + "&" + "county=" + BankKeyWord;
            }
            //取得[職稱]
            else if (listType == "Posit") {
                data = "action=getSelectPositListFuc";  // alert(listType);
            }
            //取得[銀行列表]
            else if (listType == "Bank") {
                data = "action=getBankListFuc";
                //alert(listType);
            }
            else if (listType == "Tel_Zone") {
                data = "action=getSelectTelZoneListFuc";
            }


            var success = function (back) {
                try {
                    var json = JSON.parse(back);
                } catch (e) {
                    //alert(listType);
                }
                //var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        //202209143要修改的地方
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else if (listType == "ZipCode") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        var type = listType;
                        sb.append("<option value='0000'>不限</option>");
                        $.each(json, function (i, v) {
                            //20220915555555要修改的地方
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("' selected >");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    }


                    $(idOrClassName).append(sb.toString());
                    if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                        afterSuccessFuc();
                    }
                };


            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================   
            //取得資源帳號HtmlTagOption列表

        },
        getMREGT02ListHtmlTagOption_1: function (ul, idOrClassName, listType, htmlTagType, afterSuccessFuc) {
            var url = ul;
            var data = "";
            //個人業績表取得[何承唐]產品種類(MemberType)(action=getMemberTypeFunc)
            if (listType == "D9907161") {
                data = "action=getMemberTypeFunc" + "&" + "TeacherUnum=" + listType;
                //alert(listType);
            }
            //取得[銀行列表]
            else if (listType == "Bank") {
                data = "action=getBankListFuc" + "&" + "BankKeyWord=" + BankKeyWord;
                //alert(listType);
            }
            else if (listType == "INVMY") {
                data = "action=getInvestMoneyListFuc";
            }
            //取得[部門]
            //else if (listType == "Dept") {
            //    data = "action=getDeptOptionListFuc" + "&" + "Com=" + SelectCom;
            //}
            else if (listType == "Dept") {
                data = "action=getSelectDeptListFuc";//呼叫commonHandler.ashx中的case "getSelectDeptListFuc":
                //alert(listType);
            }
            //取得[所屬公司]
            else if (listType == "Com") {
                data = "action=getComOptionListFuc";
            }
            //取得[等級]
            else if (listType == "Level") {
                data = "action=getSelectLevelListFuc";
            }
            //取得[縣/市]
            else if (listType == "County") {
                data = "action=getCountyOptionListFuc";
            }
            //取得[鄉鎮區市]
            else if (listType == "TownShip") {
                data = "action=getTownShipOptionListFuc" + "&" + "county=" + BankKeyWord;
            }
            //取得[職稱]
            else if (listType == "Posit") {
                data = "action=getSelectPositListFuc";  // alert(listType);
            }
            //取得[銀行列表]
            else if (listType == "Bank") {
                data = "action=getBankListFuc";
                //alert(listType);
            }
            else if (listType == "Tel_Zone") {
                data = "action=getSelectTelZoneListFuc";
            }


            var success = function (back) {
                try {
                    var json = JSON.parse(back);
                } catch (e) {
                    //alert(listType);
                }
                //var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        //202209144要修改的地方
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else if (listType == "ZipCode") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        var type = listType;
                        sb.append("<option value='0000'>不限</option>");
                        $.each(json, function (i, v) {
                            //202209145要修改的地方
                            //if (v.ditcode == SelectedValue) {
                            //    sb.append("<option value='");
                            //    sb.append(v.ditcode);
                            //    sb.append("' selected >");
                            //    sb.append(v.ddesc);
                            //    sb.append("</option>");
                            //}
                            //else {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                            //}
                        });
                    }


                    $(idOrClassName).append(sb.toString());
                    if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                        afterSuccessFuc();
                    }
                };


            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================   
            //取得資源帳號HtmlTagOption列表

        },
        //取得業務聯絡單-新增-新案件-分析師
        // $Common.MITEM.getCustomerDetailAnalyst(CommonHandlerUrl_M, "#abcD_MP", "option", Select_Com, afterSuccessFucMREGT03);//20221207進度(實做這個!!)
        //OK
        getCustomerDetailAnalyst: function (ul, idOrClassName, listType, htmlTagType, COMID, afterSuccessFuc) {
            var url = ul;
            var data = "";
            //由公司代碼[COMID]及部門編號[U_POSITION]取得人員下拉式選單選項
            if (listType == "GetAnalyst") {
                data = "action=getAnalyst" + "&" + "COMID=" + COMID;
                //alert(listType);
            }
            //取得[銀行列表]
            //else if (listType == "Bank") {
            //    data = "action=getBankListFuc" + "&" + "BankKeyWord=" + BankKeyWord;
            //    //alert(listType);
            //}
            //else if (listType == "INVMY") {
            //    data = "action=getInvestMoneyListFuc";
            //}
            //取得[部門]
            //else if (listType == "Dept") {
            //    data = "action=getDeptOptionListFuc";
            //}
            //else if (listType == "DEPAR") {
            //    data = "action=getSelectDeptListFuc";;//呼叫commonHandler.ashx中的case "getSelectDeptListFuc":
            //    //alert(listType);
            //}
            //取得[所屬公司]
            //else if (listType == "Com") {
            //    data = "action=getComOptionListFuc";
            //}
            ////取得[等級]
            //else if (listType == "Level") {
            //    data = "action=getSelectLevelListFuc";
            //}
            //取得[縣/市]
            //else if (listType == "County") {
            //    data = "action=getCountyOptionListFuc";
            //}
            ////取得[鄉鎮區市]
            //else if (listType == "TownShip") {
            //    data = "action=getTownShipOptionListFuc" + "&" + "county=" + BankKeyWord;
            //}
            ////取得[職稱]
            //else if (listType == "Posit") {
            //    data = "action=getSelectPositListFuc";  // alert(listType);
            //}
            //取得[銀行列表]
            //else if (listType == "Bank") {
            //    data = "action=getBankListFuc";
            //    //alert(listType);
            //}
            //else if (listType == "Tel_Zone") {
            //    data = "action=getSelectTelZoneListFuc";
            //}


            var success = function (back) {
                try {
                    var json = JSON.parse(back);
                } catch (e) {
                    //alert(listType);
                }
                //var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "GetAnalyst") {
                        //20230407
                        sb.append("<option value='0'>無</option>");
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.U_Num);
                            sb.append("'>");
                            sb.append(v.empName);
                            sb.append("</option>");
                        });
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        //202209146要修改的地方
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else if (listType == "ZipCode") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        var type = listType;
                        sb.append("<option value='0000'>不限</option>");
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                            //202209147要修改的地方
                            //if (v.ditcode == SelectedValue) {
                            //    sb.append("<option value='");
                            //    sb.append(v.ditcode);
                            //    sb.append("' selected >");
                            //    sb.append(v.ddesc);
                            //    sb.append("</option>");
                            //}
                            //else {
                            //    sb.append("<option value='");
                            //    sb.append(v.ditcode);
                            //    sb.append("'>");
                            //    sb.append(v.ddesc);
                            //    sb.append("</option>");
                            //}
                        });
                    }


                    $(idOrClassName).append(sb.toString());
                    if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                        afterSuccessFuc();
                    }
                };


            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================  
        },
        getCustomerDetailAnalyst_MITEM: function (ul, idOrClassName, listType, htmlTagType, SelectMP, afterSuccessFuc) {
            var url = ul;
            var data = "";
            //由公司代碼[COMID]及部門編號[U_POSITION]取得人員下拉式選單選項
            if (listType == "GetMITEM") {
                data = "action=getAnalystMITEM" + "&" + "MITCODE=" + SelectMP;
                //alert(listType);
            }
            //取得[銀行列表]
            //else if (listType == "Bank") {
            //    data = "action=getBankListFuc" + "&" + "BankKeyWord=" + BankKeyWord;
            //    //alert(listType);
            //}
            //else if (listType == "INVMY") {
            //    data = "action=getInvestMoneyListFuc";
            //}
            //取得[部門]
            //else if (listType == "Dept") {
            //    data = "action=getDeptOptionListFuc";
            //}
            //else if (listType == "DEPAR") {
            //    data = "action=getSelectDeptListFuc";;//呼叫commonHandler.ashx中的case "getSelectDeptListFuc":
            //    //alert(listType);
            //}
            //取得[所屬公司]
            //else if (listType == "Com") {
            //    data = "action=getComOptionListFuc";
            //}
            ////取得[等級]
            //else if (listType == "Level") {
            //    data = "action=getSelectLevelListFuc";
            //}
            //取得[縣/市]
            //else if (listType == "County") {
            //    data = "action=getCountyOptionListFuc";
            //}
            ////取得[鄉鎮區市]
            //else if (listType == "TownShip") {
            //    data = "action=getTownShipOptionListFuc" + "&" + "county=" + BankKeyWord;
            //}
            ////取得[職稱]
            //else if (listType == "Posit") {
            //    data = "action=getSelectPositListFuc";  // alert(listType);
            //}
            //取得[銀行列表]
            //else if (listType == "Bank") {
            //    data = "action=getBankListFuc";
            //    //alert(listType);
            //}
            //else if (listType == "Tel_Zone") {
            //    data = "action=getSelectTelZoneListFuc";
            //}


            var success = function (back) {
                try {
                    var json = JSON.parse(back);
                } catch (e) {
                    //alert(listType);
                }
                //var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "GetAnalyst") {
                        //20230407
                        sb.append("<option value='0'>無</option>");
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.U_Num);
                            sb.append("'>");
                            sb.append(v.empName);
                            sb.append("</option>");
                        });
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        //202209146要修改的地方
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else if (listType == "ZipCode") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        var type = listType;
                        sb.append("<option value='0000'>不限</option>");
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                            //202209147要修改的地方
                            //if (v.ditcode == SelectedValue) {
                            //    sb.append("<option value='");
                            //    sb.append(v.ditcode);
                            //    sb.append("' selected >");
                            //    sb.append(v.ddesc);
                            //    sb.append("</option>");
                            //}
                            //else {
                            //    sb.append("<option value='");
                            //    sb.append(v.ditcode);
                            //    sb.append("'>");
                            //    sb.append(v.ddesc);
                            //    sb.append("</option>");
                            //}
                        });
                    }


                    $(idOrClassName).append(sb.toString());
                    if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                        afterSuccessFuc();
                    }
                };


            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================  
        },
        //取得資源帳號HtmlTagOption列表},
        //取得業務聯絡單-新增-新案件-服務項目
        getCustomerDetailMITEM: function (ul, idOrClassName, listType, MITCODE) {
            var url = ul;
            var data = "";
            //由公司代碼[COMID]及部門編號[U_POSITION]取得人員下拉式選單選項
            if (listType == "GetEmploy") {
                data = "action=getSelectEmploy" + "&" + "MITCODE=" + MITCODE;
                //alert(listType);
            }
            //取得[銀行列表]
            else if (listType == "Bank") {
                data = "action=getBankListFuc" + "&" + "BankKeyWord=" + BankKeyWord;
                //alert(listType);
            }
            else if (listType == "INVMY") {
                data = "action=getInvestMoneyListFuc";
            }
            //取得[部門]
            else if (listType == "Dept") {
                data = "action=getDeptOptionListFuc";
            }
            else if (listType == "DEPAR") {
                data = "action=getSelectDeptListFuc";;//呼叫commonHandler.ashx中的case "getSelectDeptListFuc":
                //alert(listType);
            }
            //取得[所屬公司]
            else if (listType == "Com") {
                data = "action=getComOptionListFuc";
            }
            //取得[等級]
            else if (listType == "Level") {
                data = "action=getSelectLevelListFuc";
            }
            //取得[縣/市]
            else if (listType == "County") {
                data = "action=getCountyOptionListFuc";
            }
            //取得[鄉鎮區市]
            else if (listType == "TownShip") {
                data = "action=getTownShipOptionListFuc" + "&" + "county=" + BankKeyWord;
            }
            //取得[職稱]
            else if (listType == "Posit") {
                data = "action=getSelectPositListFuc";  // alert(listType);
            }
            //取得[銀行列表]
            else if (listType == "Bank") {
                data = "action=getBankListFuc";
                //alert(listType);
            }
            else if (listType == "Tel_Zone") {
                data = "action=getSelectTelZoneListFuc";
            }


            var success = function (back) {
                try {
                    var json = JSON.parse(back);
                } catch (e) {
                    //alert(listType);
                }
                //var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        //202209146要修改的地方
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else if (listType == "ZipCode") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        var type = listType;
                        sb.append("<option value='0000'>不限</option>");
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                            //202209147要修改的地方
                            //if (v.ditcode == SelectedValue) {
                            //    sb.append("<option value='");
                            //    sb.append(v.ditcode);
                            //    sb.append("' selected >");
                            //    sb.append(v.ddesc);
                            //    sb.append("</option>");
                            //}
                            //else {
                            //    sb.append("<option value='");
                            //    sb.append(v.ditcode);
                            //    sb.append("'>");
                            //    sb.append(v.ddesc);
                            //    sb.append("</option>");
                            //}
                        });
                    }


                    $(idOrClassName).append(sb.toString());
                    //if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    //    afterSuccessFuc();
                    //}
                };


            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================  
        },
        //getMREG2ListHtmlTagOption: function (ul, idOrClassName, listType, htmlTagType, BankKeyWord, afterSuccessFuc, SelectedValue)
        //$Common.MITEM.getMREG2ListHtmlTagOption(CommonHandlerUrl_M, "#Select_Com", "Com", "option", afterSuccessFucMREGT02);//公司別
        // $Common.MITEM.getMREGT02ListHtmlTagOption_2(CommonHandlerUrl_M, "#Select_Employ","getEmploy", Select_Com, Select_Dept, "option", afterSuccessFucMREGT03);//20221207進度(實做這個!!)
        getMREGT02ListHtmlTagOption_3: function (ul, idOrClassName, listType, COMID, U_POSITION, htmlTagType) {
            var url = ul;
            var data = "";
            //由公司代碼[COMID]及部門編號[U_POSITION]取得人員下拉式選單選項
            if (listType == "GetEmploy") {
                data = "action=getSelectEmploy" + "&" + "COMID=" + COMID + "&" + "U_POSITION=" + U_POSITION;
                //alert(listType);
            }
            //取得[銀行列表]
            else if (listType == "Bank") {
                data = "action=getBankListFuc" + "&" + "BankKeyWord=" + BankKeyWord;
                //alert(listType);
            }
            else if (listType == "INVMY") {
                data = "action=getInvestMoneyListFuc";
            }
            //取得[部門]
            else if (listType == "Dept") {
                data = "action=getDeptOptionListFuc";
            }
            else if (listType == "DEPAR") {
                data = "action=getSelectDeptListFuc";;//呼叫commonHandler.ashx中的case "getSelectDeptListFuc":
                //alert(listType);
            }
            //取得[所屬公司]
            else if (listType == "Com") {
                data = "action=getComOptionListFuc";
            }
            //取得[等級]
            else if (listType == "Level") {
                data = "action=getSelectLevelListFuc";
            }
            //取得[縣/市]
            else if (listType == "County") {
                data = "action=getCountyOptionListFuc";
            }
            //取得[鄉鎮區市]
            else if (listType == "TownShip") {
                data = "action=getTownShipOptionListFuc" + "&" + "county=" + BankKeyWord;
            }
            //取得[職稱]
            else if (listType == "Posit") {
                data = "action=getSelectPositListFuc";  // alert(listType);
            }
            //取得[銀行列表]
            else if (listType == "Bank") {
                data = "action=getBankListFuc";
                //alert(listType);
            }
            else if (listType == "Tel_Zone") {
                data = "action=getSelectTelZoneListFuc";
            }


            var success = function (back) {
                try {
                    var json = JSON.parse(back);
                } catch (e) {
                    //alert(listType);
                }
                //var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        //202209146要修改的地方
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else if (listType == "ZipCode") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        var type = listType;
                        sb.append("<option value='0000'>不限</option>");
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                            //202209147要修改的地方
                            //if (v.ditcode == SelectedValue) {
                            //    sb.append("<option value='");
                            //    sb.append(v.ditcode);
                            //    sb.append("' selected >");
                            //    sb.append(v.ddesc);
                            //    sb.append("</option>");
                            //}
                            //else {
                            //    sb.append("<option value='");
                            //    sb.append(v.ditcode);
                            //    sb.append("'>");
                            //    sb.append(v.ddesc);
                            //    sb.append("</option>");
                            //}
                        });
                    }


                    $(idOrClassName).append(sb.toString());
                    //if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    //    afterSuccessFuc();
                    //}
                };


            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================   
            //取得資源帳號HtmlTagOption列表

        },
        //取得所屬長官下拉式選單
        getLeaderListHtmlTagOption: function (ul, idOrClassName, listType, htmlTagType, SelectCom_Title1, SelectDept_Title1, afterSuccessFuc) {
            alert("SelectCom_Title1: " + SelectCom_Title1);//取得所屬公司
            alert("SelectDept_Title1" + SelectDept_Title1);//取得所屬部門
            //alert(idOrClassName);
            var url = ul;
            var data = "";

            //取得長官
            if (listType == "Leader") {
                data = "action=getLeaderListFuc" + "&" + "SelectCom_Title=" + SelectCom_Title1 + "&" + "SelectDept_Title=" + SelectDept_Title1;
                //alert(data);
            }
            //取得代理人
            else if (listType == "Agent") {

                data = "action=getAgentListFuc" + "&" + "SelectCom_Title=" + SelectCom_Title1 + "&" + "SelectDept_Title=" + SelectDept_Title1;
                //alert(data);
                //alert(listType);
            }
            //取得[銀行列表]
            else if (listType == "Bank") {
                data = "action=getBankListFuc" + "&" + "BankKeyWord=";
                //alert(listType);
            }
            else if (listType == "INVMY") {
                data = "action=getInvestMoneyListFuc";
            }
            //取得[部門]
            else if (listType == "Dept") {
                data = "action=getDeptOptionListFuc";
            }
            else if (listType == "DEPAR") {
                data = "action=getSelectDeptListFuc";;//呼叫commonHandler.ashx中的case "getSelectDeptListFuc":
                //alert(listType);
            }
            //取得[所屬公司]
            else if (listType == "Com") {
                data = "action=getComOptionListFuc";
            }
            //取得[等級]
            else if (listType == "Level") {
                data = "action=getSelectLevelListFuc";
            }
            //取得[縣/市]
            else if (listType == "County") {
                data = "action=getCountyOptionListFuc";
            }
            //取得[鄉鎮區市]
            else if (listType == "TownShip") {
                data = "action=getTownShipOptionListFuc" + "&" + "county=" + BankKeyWord;
            }
            //取得[職稱]
            else if (listType == "Posit") {
                data = "action=getSelectPositListFuc";  // alert(listType);
            }
            //取得[銀行列表]
            else if (listType == "Bank") {
                data = "action=getBankListFuc";
                //alert(listType);
            }
            else if (listType == "Tel_Zone") {
                data = "action=getSelectTelZoneListFuc";
            }
            else if (listType == "Agent") {
                data = "action=getAgentListFuc" + "&" + "SelectCom_Title=" + SelectCom_Title1 + "&" + "SelectDept_Title=" + SelectDept_Title1;;
            }


            var success = function (back) {
                try {
                    var json = JSON.parse(back);
                } catch (e) {
                    //alert(listType);
                }
                //var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        //202209148要修改的地方
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else if (listType == "ZipCode") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        $.each(json, function (i, v) {

                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    }


                    $(idOrClassName).append(sb.toString());
                    if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                        afterSuccessFuc();
                    }
                };


            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================   
            //取得資源帳號HtmlTagOption列表

        },
        getAgentListHtmlTagOption: function (ul, idOrClassName, listType, htmlTagType, SelectCom_Title1, SelectDept_Title1, afterSuccessFuc) {
            alert("SelectCom_Title1: " + SelectCom_Title1);
            alert("SelectDept_Title1" + SelectDept_Title1);
            //alert(idOrClassName);
            var url = ul;
            var data = "";
            //取得代理人
            if (listType == "Agent") {

                data = "action=getAgentListFuc" + "&" + "SelectCom_Title=" + SelectCom_Title1 + "&" + "SelectDept_Title=" + SelectDept_Title1;
                //alert(data);
                //alert(listType);
            }
            //取得[銀行列表]
            if (listType == "Bank") {
                data = "action=getBankListFuc" + "&" + "BankKeyWord=";
                //alert(listType);
            }
            else if (listType == "INVMY") {
                data = "action=getInvestMoneyListFuc";
            }
            //取得[部門]
            else if (listType == "Dept") {
                data = "action=getDeptOptionListFuc";
            }
            else if (listType == "DEPAR") {
                data = "action=getSelectDeptListFuc";;//呼叫commonHandler.ashx中的case "getSelectDeptListFuc":
                //alert(listType);
            }
            //取得[所屬公司]
            else if (listType == "Com") {
                data = "action=getComOptionListFuc";
            }
            //取得[等級]
            else if (listType == "Level") {
                data = "action=getSelectLevelListFuc";
            }
            //取得[縣/市]
            else if (listType == "County") {
                data = "action=getCountyOptionListFuc";
            }
            //取得[鄉鎮區市]
            else if (listType == "TownShip") {
                data = "action=getTownShipOptionListFuc" + "&" + "county=" + BankKeyWord;
            }
            //取得[職稱]
            else if (listType == "Posit") {
                data = "action=getSelectPositListFuc";  // alert(listType);
            }
            //取得[銀行列表]
            else if (listType == "Bank") {
                data = "action=getBankListFuc";
                //alert(listType);
            }
            else if (listType == "Tel_Zone") {
                data = "action=getSelectTelZoneListFuc";
            }
            else if (listType == "Agent") {
                data = "action=getAgentListFuc" + "&" + "SelectCom_Title=" + SelectCom_Title1 + "&" + "SelectDept_Title=" + SelectDept_Title1;;
            }


            var success = function (back) {
                try {
                    var json = JSON.parse(back);
                } catch (e) {
                    //alert(listType);
                }
                //var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                $(idOrClassName).empty();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();

                    if (listType == "BKSTS") {
                        sb.append("<option value='0'>無</option>");
                    }
                    else if (listType == "TradingStatus")//交易狀態
                    {
                        sb.append("<option value=''>不限</option>");
                        sb.append("<option value='N'>無交易</option>");
                        sb.append("<option value='Y'>有交易</option>");
                    } else if (listType == "MCOTF") {
                        sb.append("<option value=''>請選擇</option>");
                    } else if (listType == "DEPAR") {
                        sb.append("<option value=''>請選擇部門</option>");
                        //sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "DEPAR2") {
                        sb.append("<option value=''>請選擇部門</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                        sb.append("<option value='ALL'>全公司</option>");
                    } else if (listType == "WITEM") {
                        sb.append("<option value='0000'>不限</option>");
                    } else if (listType == "COMID") {
                        //202209149要修改的地方
                        sb.append("<option value=''>請選擇公司</option>");
                        sb.append("<option value='0000'>不限</option>");
                        sb.append("<option value='HG01'>華冠-營1</option>");
                        sb.append("<option value='HG02'>華冠-投資</option>");
                        sb.append("<option value='HG03'>華冠-財1</option>");
                        sb.append("<option value='HG04'>華冠-理財</option>");
                        sb.append("<option value='HG05'>華冠-營2</option>");
                        sb.append("<option value='HG06'>華冠-網事</option>");
                        sb.append("<option value='HG07'>華冠-財2</option>");
                        sb.append("<option value='HG08'>華冠-特1</option>");
                        sb.append("<option value='HG09'>華冠-營3</option>");
                        sb.append("<option value='HG10'>華冠-營5</option>");
                        sb.append("<option value='HG11'>華冠-特2</option>");
                    } else if (listType == "INVMY") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else if (listType == "ZipCode") {
                        $.each(json, function (i, v) {
                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    } else {
                        $.each(json, function (i, v) {

                            sb.append("<option value='");
                            sb.append(v.ditcode);
                            sb.append("'>");
                            sb.append(v.ddesc);
                            sb.append("</option>");
                        });
                    }


                    $(idOrClassName).append(sb.toString());
                    if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                        afterSuccessFuc();
                    }
                };


            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================   
            //取得資源帳號HtmlTagOption列表

        },

    };
    m.MUSER = {
        //getAnalystListHtmlTagOption
        //取得分析師OPTION(20220705)
        getAnalystListHtmlTagOption: function (ul, idOrClassName, ComID, htmlTagType, afterSuccessFuc) {
            //alert('取得分析師下拉示選單OPTION');
            var url = ul;
            var data = "ComID=" + ComID + "&action=getAnalystList";
            var success = function (back) {
                var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();
                    sb.append("<option value=''>請選擇</option>");
                    $.each(json, function (i, v) {
                        sb.append("<option value='");
                        sb.append(v.U_Num);
                        sb.append("' comid='");
                        sb.append(v.ComID);
                        sb.append("'>");
                        sb.append(v.empName);
                        sb.append("</option>");
                    });
                } else if (htmlTagType == "checkbox") {
                    $.each(json, function (i, v) {
                        sb.append("<input type='checkbox' name='Analyst' value='");
                        sb.append(v.U_Num);
                        sb.append("' txt='");
                        sb.append(v.empName);
                        sb.append("'>");
                        sb.append(v.empName);
                        sb.append("&nbsp;&nbsp;");
                    });
                }

                $(idOrClassName).append(sb.toString());
                if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    afterSuccessFuc();
                }
            };

            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================
        },
        getAnalystListHtmlTagOption_MCMEB09: function (ul, idOrClassName, ComID, htmlTagType, afterSuccessFuc) {
            //alert('取得分析師OPTION');
            var url = ul;
            var data = "ComID=" + ComID + "&action=getAnalystList";
            var success = function (back) {
                var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();
                    sb.append("<option value=''>不限</option>");
                    $.each(json, function (i, v) {
                        sb.append("<option value='");
                        sb.append(v.U_Num);
                        sb.append("' comid='");
                        sb.append(v.ComID);
                        sb.append("'>");
                        sb.append(v.empName);
                        sb.append("</option>");
                    });
                } else if (htmlTagType == "checkbox") {
                    $.each(json, function (i, v) {
                        sb.append("<input type='checkbox' name='Analyst' value='");
                        sb.append(v.U_Num);
                        sb.append("' txt='");
                        sb.append(v.empName);
                        sb.append("'>");
                        sb.append(v.empName);
                        sb.append("&nbsp;&nbsp;");
                    });
                }

                $(idOrClassName).append(sb.toString());
                if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    afterSuccessFuc();
                }
            };

            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================
        },
        //取得分析師資料表
        getAnalystList: function (ul, success) {
            var url = ul;
            var data = "action=getAnalystList";
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================
        },
        //取得分析師OPTION(20220812A)
        getAnalystListHtmlTagOptionForMessageSearch: function (ul, idOrClassName, ComID, U_MDEP, U_Position, U_Leader, U_Num, afterSuccessFuc) {

            var data = "ComID=" + ComID + "&U_MDEP=" + U_MDEP + "&U_Position=" + U_Position + "&U_Leader=" + U_Leader + "&U_Num=" + U_Num + "&action=getAnalystListForMessageSearch";
            var success = function (back) {
                var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();

                $(idOrClassName).empty();
                sb.append("<option value=''>請選擇</option>");
                $.each(json, function (i, v) {
                    sb.append("<option value='");
                    sb.append(v.U_Num);
                    sb.append("'>");
                    sb.append(v.empName);
                    sb.append("</option>");
                });

                $(idOrClassName).append(sb.toString());
                if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    afterSuccessFuc();
                }
            };

            var error = function (e) { console.log(e); };
            m.Ajax.send(ul, data, success, error);//<======================
        },
        //20220517取得分析師OPTIONgetAnalystListForSRMSYSKQuery
        getAnalystListHtmlTagOptionForSRMSYSKQuery: function (ul, idOrClassName, ComID, U_MDEP, U_Position, U_Leader, U_Num, afterSuccessFuc) {
            //alert('!@#');                                                                                                                              //getAnalystListHtmlTagOptionForSRMSYSKQuery
            var data = "ComID=" + ComID + "&U_MDEP=" + U_MDEP + "&U_Position=" + U_Position + "&U_Leader=" + U_Leader + "&U_Num=" + U_Num + "&action=getAnalystListHtmlTagOptionForSRMSYSKQuery";
            var success = function (back) {
                var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();

                $(idOrClassName).empty();
                sb.append("<option value=''>請選擇</option>");
                $.each(json, function (i, v) {
                    sb.append("<option value='");
                    sb.append(v.U_Num);
                    sb.append("'>");
                    sb.append(v.empName);
                    sb.append("</option>");
                });

                $(idOrClassName).append(sb.toString());
                if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    afterSuccessFuc();
                }
            };

            var error = function (e) { console.log(e); };
            m.Ajax.send(ul, data, success, error);//<======================
        },
        //取得收件人OPTION(20220623)這邊開始做
        getRecipientlistHtmlTagOption: function (ul, idOrClassName, ComID, U_MDEP, U_Position, U_Leader, U_Num, afterSuccessFuc) {
            var data = "ComID=" + ComID + "&U_MDEP=" + U_MDEP + "&U_Position=" + U_Position + "&U_Leader=" + U_Leader + "&U_Num=" + U_Num + "&action=getAnalystListAllPowerSendRecord";
            var success = function (back) {
                var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();

                $(idOrClassName).empty();
                sb.append("<option value=''>請選擇</option>");
                $.each(json, function (i, v) {
                    sb.append("<option value='");
                    sb.append(v.U_Num);
                    sb.append("'>");
                    sb.append(v.empName);
                    sb.append("</option>");
                });

                $(idOrClassName).append(sb.toString());
                if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    afterSuccessFuc();
                }
            };

            var error = function (e) { console.log(e); };
            m.Ajax.send(ul, data, success, error);//<======================
        },
        //取得分析師OPTION(20220812B)
        getAnalystListHtmlTagOptionForAllPowerSendRecord: function (ul, idOrClassName, ComID, U_MDEP, U_Position, U_Leader, U_Num, afterSuccessFuc) {

            var data = "ComID=" + ComID + "&U_MDEP=" + U_MDEP + "&U_Position=" + U_Position + "&U_Leader=" + U_Leader + "&U_Num=" + U_Num + "&action=getAnalystListAllPowerSendRecord";
            var success = function (back) {
                var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();

                $(idOrClassName).empty();
                sb.append("<option value=''>請選擇</option>");
                $.each(json, function (i, v) {
                    sb.append("<option value='");
                    sb.append(v.U_Num);
                    sb.append("'>");
                    sb.append(v.empName);
                    sb.append("</option>");
                });

                $(idOrClassName).append(sb.toString());
                if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    afterSuccessFuc();
                }
            };

            var error = function (e) { console.log(e); };
            m.Ajax.send(ul, data, success, error);//<======================
        },
        //取得分析師OPTION(20220705)
        getAnalystListHtmlTagOptionForOItable: function (ul, idOrClassName) {

            var data = "ComID=" + ComID_M + "&U_MDEP=" + U_MDEP_M + "&U_Position=" + U_POSITION_M + "&U_Leader=" + U_Leader_M + "&U_Num=" + U_Num_M + "&action=getAnalystListForOItable";
            var success = function (back) {
                var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();

                $(idOrClassName).empty();
                sb.append("<option value=''>請選擇</option>");
                $.each(json, function (i, v) {
                    sb.append("<option value='");
                    sb.append(v.U_Num);
                    sb.append("'>");
                    sb.append(v.empName);
                    sb.append("</option>");
                });

                $(idOrClassName).append(sb.toString());

            };

            var error = function (e) { console.log(e); };
            m.Ajax.send(ul, data, success, error);//<======================
        },
        //取得業務員option
        getMClistHtmlTagOption: function (ul, U_Num, idOrClassName, afterSuccessFuc) {
            $(idOrClassName).empty();
            var url = ul;
            var data = "U_Num=" + U_Num + "&action=getMClist";
            var success = function (back) {
                var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                sb.append("<option value = ''>請選擇</option>");
                $.each(json, function (i, v) {
                    sb.append("<option value = '");
                    sb.append(v.U_Num);
                    sb.append("' comid='");
                    sb.append(v.ComID);
                    sb.append("'>");
                    sb.append(v.U_Name);
                    sb.append("-");
                    sb.append(v.U_Num);
                    sb.append("-");
                    sb.append(v.ComIDname);
                    sb.append("</option>");
                });
                $(idOrClassName).append(sb.toString());
                if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    afterSuccessFuc();
                }
            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================
        },
        //取得業務員資料表
        getMClist: function (ul, U_Num, success) {
            var url = ul;
            var data = "U_Num=" + U_Num + "&action=getMClist";
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================
        },
        //取得業務員資料表
        getMCdata: function (ul, U_Num) {
            var url = ul;
            var data = "U_Num=" + U_Num + "&action=getMCdata";
            var success = function (back) {
                return back;
            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================
        },
        //取得責任助理OPTION
        /*getResponsibleAssistantListHtmlTagOption: function (ul, idOrClassName, ComID, htmlTagType, afterSuccessFuc) {
            console.log("ComID=" + ComID);
            var url = ul;
            var data = "ComID=" + ComID + "&action=getResponsibleAssistantList";
            var success = function (back) {
                var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();
                    sb.append("<option value=''>請選擇</option>");
                    $.each(json, function (i, v) {
                        sb.append("<option value='");
                        sb.append(v.U_Num);
                        sb.append("' ComID=");
                        sb.append(v.ComID);
                        sb.append("' U_MDEP=");
                        sb.append(v.U_MDEP);
                        sb.append("'>");
                        sb.append(v.empName);
                        sb.append("</option>");
                    });
                } else if (htmlTagType == "checkbox") {
                    $.each(json, function (i, v) {
                        sb.append("<input type='checkbox' name='ResponsibleAssistant' value='");
                        sb.append(v.U_Num);
                        sb.append("'>");
                        sb.append(v.empName);
                        sb.append("&nbsp;&nbsp;");
                    });
                }
     
                $(idOrClassName).append(sb.toString());
                if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    afterSuccessFuc();
                }
            };
     
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================
        },*/
        //Q_MC取得責任助理OPTION(for MCMCHTR_query.aspx)
        getMCListHtmlTagOption: function (ul, idOrClassName, ComID, htmlTagType) {
            var url = ul;
            //var data = "ComID=" + ComID + "&U_MDEP=" + U_MDEP + "&action=getResponsibleAssistantList
            //var data = "action=getResponsibleAssistantList";
            var data = "action=getResponsibleAssistantListForMCMCHTR_query";
            var success = function (back) {
                var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();
                    sb.append("<option value=''>請選擇</option>");
                    $.each(json, function (i, v) {
                        sb.append("<option value='");
                        sb.append(v.ditcode);
                        sb.append("'>");
                        sb.append(v.ddesc);
                        sb.append("-");
                        sb.append(v.ddesc2);
                        sb.append("-");
                        sb.append(v.ditcode);
                        sb.append("</option>");
                    });
                } else if (htmlTagType == "checkbox") {
                    $.each(json, function (i, v) {
                        sb.append("<input type='checkbox' name='ResponsibleAssistant' value='");
                        sb.append(v.U_Num);
                        sb.append("'>");
                        sb.append(v.empName);
                        sb.append("&nbsp;&nbsp;");
                    });
                }

                $(idOrClassName).append(sb.toString());
                //if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                //    afterSuccessFuc();
                //}
            };

            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================
        },
        //取得責任助理OPTION
        getResponsibleAssistantListHtmlTagOption: function (ul, idOrClassName, ComID, htmlTagType, afterSuccessFuc, U_MDEP) {
            var url = ul;
            var data = "ComID=" + ComID + "&U_MDEP=" + U_MDEP + "&action=getResponsibleAssistantList";
            var success = function (back) {
                var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();
                    sb.append("<option value=''>請選擇</option>");
                    $.each(json, function (i, v) {
                        sb.append("<option value='");
                        sb.append(v.U_Num);
                        sb.append("' ComID=");
                        sb.append(v.ComID);
                        sb.append("' U_MDEP=");
                        sb.append(v.U_MDEP);
                        sb.append("'>");
                        sb.append(v.empName);
                        sb.append("</option>");
                    });
                } else if (htmlTagType == "checkbox") {
                    $.each(json, function (i, v) {
                        sb.append("<input type='checkbox' name='ResponsibleAssistant' value='");
                        sb.append(v.U_Num);
                        sb.append("'>");
                        sb.append(v.empName);
                        sb.append("&nbsp;&nbsp;");
                    });
                }

                $(idOrClassName).append(sb.toString());
                if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    afterSuccessFuc();
                }
            };

            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================
        },
        //取得交易狀態下拉式選單選項
        getTradingStatusListTagOption: function (ul, idOrClassName, ComID, U_Num_M, htmlTagType) {
            var url = ul;
            var data = "ComID=" + ComID + "&U_Num_M=" + U_Num_M + "&action=getTradingStatusList";
            var success = function (back) {
                //alert('getTradingStatusListTagOption');
                var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                if (htmlTagType == "option") {
                    $(idOrClassName).empty();
                    sb.append("<option value=''>請選擇</option>");
                    $.each(json, function (i, v) {
                        sb.append("<option value='");
                        sb.append(v.Value);
                        sb.append("'>");
                        sb.append(v.Status);
                        sb.append("</option>");
                    });
                } else if (htmlTagType == "checkbox") {
                    $.each(json, function (i, v) {
                        sb.append("<input type='checkbox' name='ResponsibleAssistant' value='");
                        sb.append(v.U_Num);
                        sb.append("'>");
                        sb.append(v.empName);
                        sb.append("&nbsp;&nbsp;");
                    });
                }
                $("#TradingStatus").append(sb.toString());//加入資源帳號
                $(idOrClassName).append(sb.toString());
                //if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                //    afterSuccessFuc();
                //}
            };

            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<======================
        },
        //getSelectDeptListTagOption
        //取得所屬部門下拉式選單選項
        getSelectDeptListTagOption: function (ul, idOrClassName, ComID, U_Num_M, htmlTagType) {
            //alert('getZItemListHtmlTagOption20220706');
            var url = ul;
            var data = "ComID=" + ComID + "&U_Num=" + U_Num_M + "&action= getSelectDeptListFuc";
            var success = function (back) {

                var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                //sb.append("<option value=''>不拘987</option>");
                if (htmlTagType == "option") {
                    //alert('getZItemListHtmlTagOption20220706__1');
                    //$(idOrClassName).empty();
                    //<option value="">不拘123</option>
                    // <option value="">不拘456</option>
                    //sb.append("<option value=''>不拘789</option>");
                    //$("#Q_Analyst").append(sb.toString());
                    //alert('getZItemListHtmlTagOption20220706__2');

                    // sb.append("<option value='1'>");
                    // sb.append("請選擇Test")
                    // sb.append("</option>");
                    //alert('getZItemListHtmlTagOption20220706_11');
                    $.each(json, function (i, v) {
                        sb.append("<option no='");
                        sb.append(i);
                        sb.append("' value='");
                        sb.append(v.Value);
                        sb.append("'>");
                        sb.append(v.Text);
                        sb.append("</option>");
                    });
                    //if (htmlTagType == "checkbox") {
                    //    $.each(json, function (i, v) {
                    //        sb.append("<input type='checkbox' name='Analyst' value='");
                    //        sb.append(v.U_Num);
                    //        sb.append("' txt='");
                    //        sb.append(v.empName);
                    //        sb.append("'>");
                    //        sb.append(v.empName);
                    //        sb.append("&nbsp;&nbsp;");
                    //    });
                    //}
                    //20220705
                    //sb.append("<option value='1111'>1111</option>");
                    //sb.append("<option value='金門縣'>金門縣</option>");
                    //sb.append("<option value='連江縣'>連江縣</option>");
                    //sb.append("<option value='南海諸島'>南海諸島</option>");
                    $(idOrClassName).append(sb.toString());
                    //20220705
                    //window.alert('00');
                    //if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    //window.alert('01');
                    //$("$Q_Analyst").append(sb.toString());
                    //$("#Q_Analyst").append(sb.toString());
                    //window.alert('000011101');
                    //getZitemListFuc
                    //$("$getZitemListFuc").append(sb.toString());
                    //$("#getZitemListFuc").append(sb.toString());(語法錯誤)

                    //afterSuccessFuc();
                    //window.alert('02');
                    //}
                    //if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    //window.alert('03');
                    //$("$Q_Analyst").append(sb.toString());
                    $("#Q_Analyst").append(sb.toString());//加入資源帳號
                    //getZitemListFuc
                    //$("$getZitemListFuc").append(sb.toString());
                    // $("#getZitemListFuc").append(sb.toString());
                    //afterSuccessFuc();
                    window.alert('04');

                }
                else if (htmlTagType == "checkbox") {
                    $.each(json, function (i, v) {
                        sb.append("<input type='checkbox' name='Analyst' value='");
                        sb.append(v.U_Num);
                        sb.append("' txt='");
                        sb.append(v.empName);
                        sb.append("'>");
                        sb.append(v.empName);
                        sb.append("&nbsp;&nbsp;");
                    });
                };
                $(idOrClassName).append(sb.toString());
                //if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                //    afterSuccessFuc();
                //}

            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<=====
        },
        //getSelectComListTagOption
        //取得所屬公司下拉式選單選項
        getSelectComListTagOption: function (ul, idOrClassName, htmlTagType) {
            //alert('getZItemListHtmlTagOption20220706');
            var url = ul;
            var data = "ComID=" + ComID + "&U_Num=" + U_Num_M + "&action=getSelectComListFuc";
            var success = function (back) {

                var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                //sb.append("<option value=''>不拘987</option>");
                if (htmlTagType == "option") {
                    //alert('getZItemListHtmlTagOption20220706__1');
                    //$(idOrClassName).empty();
                    //<option value="">不拘123</option>
                    // <option value="">不拘456</option>
                    //sb.append("<option value=''>不拘789</option>");
                    //$("#Q_Analyst").append(sb.toString());
                    //alert('getZItemListHtmlTagOption20220706__2');

                    // sb.append("<option value='1'>");
                    // sb.append("請選擇Test")
                    // sb.append("</option>");
                    //alert('getZItemListHtmlTagOption20220706_11');
                    $.each(json, function (i, v) {
                        sb.append("<option no='");
                        sb.append(i);
                        sb.append("' value='");
                        sb.append(v.Value);
                        sb.append("'>");
                        sb.append(v.Text);
                        sb.append("</option>");
                    });
                    //if (htmlTagType == "checkbox") {
                    //    $.each(json, function (i, v) {
                    //        sb.append("<input type='checkbox' name='Analyst' value='");
                    //        sb.append(v.U_Num);
                    //        sb.append("' txt='");
                    //        sb.append(v.empName);
                    //        sb.append("'>");
                    //        sb.append(v.empName);
                    //        sb.append("&nbsp;&nbsp;");
                    //    });
                    //}
                    //20220705
                    //sb.append("<option value='1111'>1111</option>");
                    //sb.append("<option value='金門縣'>金門縣</option>");
                    //sb.append("<option value='連江縣'>連江縣</option>");
                    //sb.append("<option value='南海諸島'>南海諸島</option>");
                    $(idOrClassName).append(sb.toString());
                    //20220705
                    //window.alert('00');
                    //if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    //window.alert('01');
                    //$("$Q_Analyst").append(sb.toString());
                    //$("#Q_Analyst").append(sb.toString());
                    //window.alert('000011101');
                    //getZitemListFuc
                    //$("$getZitemListFuc").append(sb.toString());
                    //$("#getZitemListFuc").append(sb.toString());(語法錯誤)

                    //afterSuccessFuc();
                    //window.alert('02');
                    //}
                    //if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    //window.alert('03');
                    //$("$Q_Analyst").append(sb.toString());
                    $("#Q_Analyst").append(sb.toString());//加入資源帳號
                    //getZitemListFuc
                    //$("$getZitemListFuc").append(sb.toString());
                    // $("#getZitemListFuc").append(sb.toString());
                    //afterSuccessFuc();
                    window.alert('04');

                }
                else if (htmlTagType == "checkbox") {
                    $.each(json, function (i, v) {
                        sb.append("<input type='checkbox' name='Analyst' value='");
                        sb.append(v.U_Num);
                        sb.append("' txt='");
                        sb.append(v.empName);
                        sb.append("'>");
                        sb.append(v.empName);
                        sb.append("&nbsp;&nbsp;");
                    });
                };
                $(idOrClassName).append(sb.toString());
                //if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                //    afterSuccessFuc();
                //}

            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<=====
        },
        getZItemListHtmlTagOption: function (ul, idOrClassName, ComID, U_Num_M, htmlTagType) {
            //alert('getZItemListHtmlTagOption20220706');
            var url = ul;
            var data = "ComID=" + ComID + "&U_Num=" + U_Num_M + "&action=getZitemListFuc";
            var success = function (back) {

                var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                //sb.append("<option value=''>不拘987</option>");
                if (htmlTagType == "option") {
                    //alert('getZItemListHtmlTagOption20220706__1');
                    //$(idOrClassName).empty();
                    //<option value="">不拘123</option>
                    // <option value="">不拘456</option>
                    //sb.append("<option value=''>不拘789</option>");
                    //$("#Q_Analyst").append(sb.toString());
                    //alert('getZItemListHtmlTagOption20220706__2');

                    // sb.append("<option value='1'>");
                    // sb.append("請選擇Test")
                    // sb.append("</option>");
                    //alert('getZItemListHtmlTagOption20220706_11');
                    $.each(json, function (i, v) {
                        sb.append("<option no='");
                        sb.append(i);
                        sb.append("' value='");
                        sb.append(v.Value);
                        sb.append("'>");
                        sb.append(v.Text);
                        sb.append("</option>");
                    });
                    //if (htmlTagType == "checkbox") {
                    //    $.each(json, function (i, v) {
                    //        sb.append("<input type='checkbox' name='Analyst' value='");
                    //        sb.append(v.U_Num);
                    //        sb.append("' txt='");
                    //        sb.append(v.empName);
                    //        sb.append("'>");
                    //        sb.append(v.empName);
                    //        sb.append("&nbsp;&nbsp;");
                    //    });
                    //}
                    //20220705
                    //sb.append("<option value='1111'>1111</option>");
                    //sb.append("<option value='金門縣'>金門縣</option>");
                    //sb.append("<option value='連江縣'>連江縣</option>");
                    //sb.append("<option value='南海諸島'>南海諸島</option>");
                    $(idOrClassName).append(sb.toString());
                    //20220705
                    //window.alert('00');
                    //if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    //window.alert('01');
                    //$("$Q_Analyst").append(sb.toString());
                    //$("#Q_Analyst").append(sb.toString());
                    //window.alert('000011101');
                    //getZitemListFuc
                    //$("$getZitemListFuc").append(sb.toString());
                    //$("#getZitemListFuc").append(sb.toString());(語法錯誤)

                    //afterSuccessFuc();
                    //window.alert('02');
                    //}
                    //if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    //window.alert('03');
                    //$("$Q_Analyst").append(sb.toString());
                    $("#Q_Analyst").append(sb.toString());//加入資源帳號
                    //getZitemListFuc
                    //$("$getZitemListFuc").append(sb.toString());
                    // $("#getZitemListFuc").append(sb.toString());
                    //afterSuccessFuc();
                    window.alert('04');

                }
                else if (htmlTagType == "checkbox") {
                    $.each(json, function (i, v) {
                        sb.append("<input type='checkbox' name='Analyst' value='");
                        sb.append(v.U_Num);
                        sb.append("' txt='");
                        sb.append(v.empName);
                        sb.append("'>");
                        sb.append(v.empName);
                        sb.append("&nbsp;&nbsp;");
                    });
                };
                $(idOrClassName).append(sb.toString());
                //if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                //    afterSuccessFuc();
                //}

            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<=====
        },
        getDispatcherListHtmlTagOption: function (ul, idOrClassName, ComID, U_Num_M, htmlTagType) {
            //alert('getDispatcherListHtmlTagOption');
            var count = 0;
            var url = ul;
            var data = "ComID=" + ComID + "&U_Num=" + U_Num_M + "&action=getDispatcherList";
            var success = function (back) {
                var json = JSON.parse(back);
                var sb = new m.String.StringBuilder();
                //sb.append("<option value=''>不拘987</option>");
                if (htmlTagType == "option") {
                    //alert('getZItemListHtmlTagOption20220706__1');
                    //$(idOrClassName).empty();
                    //<option value="">不拘123</option>
                    // <option value="">不拘456</option>
                    //sb.append("<option value=''>不拘789</option>");
                    //$("#Q_Analyst").append(sb.toString());
                    //alert('getZItemListHtmlTagOption20220706__2');

                    // sb.append("<option value='1'>");
                    // sb.append("請選擇Test")
                    // sb.append("</option>");
                    //alert('getZItemListHtmlTagOption20220706_11');
                    $.each(json, function (i, v) {
                        sb.append("<option no='");
                        sb.append(i);
                        sb.append("' value='");
                        sb.append(v.Value);
                        sb.append("'>");
                        sb.append(v.Text);
                        sb.append("</option>");
                    });
                    //if (htmlTagType == "checkbox") {
                    //    $.each(json, function (i, v) {
                    //        sb.append("<input type='checkbox' name='Analyst' value='");
                    //        sb.append(v.U_Num);
                    //        sb.append("' txt='");
                    //        sb.append(v.empName);
                    //        sb.append("'>");
                    //        sb.append(v.empName);
                    //        sb.append("&nbsp;&nbsp;");
                    //    });
                    //}
                    //20220705
                    //sb.append("<option value='1111'>1111</option>");
                    //sb.append("<option value='金門縣'>金門縣</option>");
                    //sb.append("<option value='連江縣'>連江縣</option>");
                    //sb.append("<option value='南海諸島'>南海諸島</option>");
                    $(idOrClassName).append(sb.toString());
                    //20220705
                    //window.alert('00');
                    //if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    //window.alert('01');
                    //$("$Q_Analyst").append(sb.toString());
                    //$("#Q_Analyst").append(sb.toString());
                    //window.alert('000011101');
                    //getZitemListFuc
                    //$("$getZitemListFuc").append(sb.toString());
                    //$("#getZitemListFuc").append(sb.toString());(語法錯誤)

                    //afterSuccessFuc();
                    //window.alert('02');
                    //}
                    //if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                    //window.alert('03');
                    //$("$Q_Analyst").append(sb.toString());
                    $("#Q_Analyst").append(sb.toString());//加入資源帳號
                    //getZitemListFuc
                    //$("$getZitemListFuc").append(sb.toString());
                    // $("#getZitemListFuc").append(sb.toString());
                    //afterSuccessFuc();
                    window.alert('04');

                }
                else if (htmlTagType == "checkbox") {
                    $.each(json, function (i, v) {
                        sb.append("<input type='checkbox' name='Analyst' value='");
                        sb.append(v.U_Num);
                        sb.append("'>");
                        sb.append(v.U_Name);
                        sb.append("&nbsp;&nbsp;");
                        count = count + 1;
                        if (count > 4) {
                            sb.append("<br>")
                            count = 0;
                        }
                    });
                };
                $(idOrClassName).append(sb.toString());
                //if (!m.Check.isEmptyStr(afterSuccessFuc)) {
                //    afterSuccessFuc();
                //}

            };
            var error = function (e) { console.log(e); };
            m.Ajax.send(url, data, success, error);//<=====
        },


        //    getTradingStatusListTagOption: function (ul, idOrClassName, ComID, U_Num_M, htmlTagType){
        //    alert('getZItemListHtmlTagOption');
        //    var url = ul;
        //    var data = "ComID=" + ComID + "&U_Num=" + U_Num_M + "&action=getZitemListFuc";
        //    var success = function (back) {

        //        var json = JSON.parse(back);
        //        var sb = new m.String.StringBuilder();
        //        //sb.append("<option value=''>不拘987</option>");
        //        if (htmlTagType == "option") {
        //            //alert('getZItemListHtmlTagOption20220706__1');
        //            //$(idOrClassName).empty();
        //            //<option value="">不拘123</option>
        //            // <option value="">不拘456</option>
        //            //sb.append("<option value=''>不拘789</option>");
        //            //$("#Q_Analyst").append(sb.toString());
        //            //alert('getZItemListHtmlTagOption20220706__2');

        //            // sb.append("<option value='1'>");
        //            // sb.append("請選擇Test")
        //            // sb.append("</option>");
        //            //alert('getZItemListHtmlTagOption20220706_11');
        //            $.each(json, function (i, v) {
        //                sb.append("<option value='");
        //                sb.append(i);
        //                sb.append("' comid='");
        //                sb.append(v.ComID);
        //                sb.append("'>");
        //                sb.append(v.empName);
        //                sb.append("</option>");
        //            });
        //            //if (htmlTagType == "checkbox") {
        //            //    $.each(json, function (i, v) {
        //            //        sb.append("<input type='checkbox' name='Analyst' value='");
        //            //        sb.append(v.U_Num);
        //            //        sb.append("' txt='");
        //            //        sb.append(v.empName);
        //            //        sb.append("'>");
        //            //        sb.append(v.empName);
        //            //        sb.append("&nbsp;&nbsp;");
        //            //    });
        //            //}
        //            //20220705
        //            //sb.append("<option value='1111'>1111</option>");
        //            //sb.append("<option value='金門縣'>金門縣</option>");
        //            //sb.append("<option value='連江縣'>連江縣</option>");
        //            //sb.append("<option value='南海諸島'>南海諸島</option>");
        //            $(idOrClassName).append(sb.toString());
        //            //20220705
        //            //window.alert('00');
        //            //if (!m.Check.isEmptyStr(afterSuccessFuc)) {
        //            //window.alert('01');
        //            //$("$Q_Analyst").append(sb.toString());
        //            //$("#Q_Analyst").append(sb.toString());
        //            //window.alert('000011101');
        //            //getZitemListFuc
        //            //$("$getZitemListFuc").append(sb.toString());
        //            //$("#getZitemListFuc").append(sb.toString());(語法錯誤)

        //            //afterSuccessFuc();
        //            //window.alert('02');
        //            //}
        //            //if (!m.Check.isEmptyStr(afterSuccessFuc)) {
        //            //window.alert('03');
        //            //$("$Q_Analyst").append(sb.toString());
        //            $("#Q_Analyst").append(sb.toString());//加入資源帳號
        //            //getZitemListFuc
        //            //$("$getZitemListFuc").append(sb.toString());
        //            // $("#getZitemListFuc").append(sb.toString());
        //            //afterSuccessFuc();
        //            window.alert('04');

        //        }
        //        else if (htmlTagType == "checkbox") {
        //            $.each(json, function (i, v) {
        //                sb.append("<input type='checkbox' name='Analyst' value='");
        //                sb.append(v.U_Num);
        //                sb.append("' txt='");
        //                sb.append(v.empName);
        //                sb.append("'>");
        //                sb.append(v.empName);
        //                sb.append("&nbsp;&nbsp;");
        //            });
        //        }

        //        $(idOrClassName).append(sb.toString());
        //        if (!m.Check.isEmptyStr(afterSuccessFuc)) {
        //            afterSuccessFuc();
        //        }

        //    };
        //    var error = function (e) { console.log(e); };

    }
})($Common);