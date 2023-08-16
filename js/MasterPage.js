//權限參數
var per_read_M = false;
var per_add_M = false;
var per_edit_M = false;
var per_del_M = false;
var per_query_M = false;
//常用參數
//常用ashx
var RelativePath = "../../../../";
var CommonHandlerUrl_M = RelativePath +"commonHandler.ashx";

var Nothing_M = "nothing";
var emptyValue_M = "";
var Today_G = $CommonTool.Date.getNowDate();

//常用方法

var check_M = $CommonTool.Check;
var htmlTag_M = $CommonTool.HtmlTag;
var string_M = $CommonTool.String;
var error = function (e) { console.log("error=" + e); $.unblockUI(); };
var success = function (e) { console.log("success=" + e); $.unblockUI(); };
var jsonParse_M = function (str) {
    return JSON.parse(str);
};

var getMoneyFormat_M = function (num) {
    var money = undefined;
    money = num.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
    return money;
};

var Log_M = function (str) {
    console.log(str);
}
var disabledTrue_M = function (idOrClassName) {
    $(idOrClassName).attr("disabled", "disabled");
};
var disabledFalse_M = function (idOrClassName) {
    $(idOrClassName).attr("disabled", false);
};

var isEmptyStr = function (str) {
    var f = false;
    if (str === undefined || str === null || $.trim(str) === "" || str == "[]" || str == "[object Object]") {
        f = true;
    }
    return f;
};
var StringBuilder_M = function () {
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
};
//金額千分位
var getMoneyFormat_M = function (num) {
    var money = undefined;
    money = num.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
    return money;
};
var attr_M = function (idOrClassName, attrName, val) {
    if (!isEmptyStr(val)) {
        $(idOrClassName).attr(attrName, val);
    } else {
        return $(idOrClassName).attr(attrName);
    }
};
var val_M = function (idOrClassName, val) {
    if (!isEmptyStr(val)) {
        $(idOrClassName).val(val);
    } else {
        return $(idOrClassName).val();
    }
};
var addClass_M = function (idOrClassName,className) {
    $(idOrClassName).addClass(className);
};
var removeClass_M = function (idOrClassName, className) {
    $(idOrClassName).removeClass(className);
};

var append_M = function (idOrClassName, text) {
    $(idOrClassName).append(text);
};
var text_M = function (idOrClassName, text) {
    if (isEmptyStr(text)) {
        return $(idOrClassName).text();
    } else {
        $(idOrClassName).text(text);
    }
};
var html_M = function (idOrClassName, html) {
    if (isEmptyStr(html)) {
        return $(idOrClassName).html();
    } else {
        $(idOrClassName).html(html);
    }
};
var empty_M = function (idOrClassName) {
    $(idOrClassName).empty();
};
var show_M = function (idOrClassName) {
    $(idOrClassName).show();
};
var hide_M = function (idOrClassName) {
    $(idOrClassName).hide();
};
var onClick_M = function (idOrClassName, func) {
    $(idOrClassName).on("click", func);
};
var onChange_M = function (idOrClassName, func) {
    $(idOrClassName).on("change", func);
};
var unBind_M = function (idOrClassName) {
    $(idOrClassName).unbind();
};
var click_M = function (idOrClassName) {
    $(idOrClassName).click();//<===
};
var blockUI_M = function () {
    $.blockUI();
};
var unBlockUI_M = function () {
    $.unblockUI();
};
var split_M = function (str, splitChar, num) {
    return str.split(splitChar)[num];
};
var count_M = 0;
var logCount_M = function () {
    console.log("logCount_M" + count_M);
    count_M += 1;
};


var Today_M = $CommonTool.Date.getNowDate();


var checkUnum_M = function () {
    if (isEmptyStr(U_Num_M)) {
        alert("等待時間過長，請再次登入");
        location.href = RelativePath+"login.aspx";
    }
};
var ajax_M = function (url, data, success, error) {
    $.ajax({
        url: url,
        data: data,
        method: 'POST',
        success: success,
        error: error
    });
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
var setPermission_M = function () {
    if (!per_add_M) {
        disabledTrue_M(".addPer");
    }
    if (!per_edit_M) {
        disabledTrue_M(".editPer");
    }
    if (!per_del_M) {
        disabledTrue_M(".delPer");
    }
};
var hasStr_M = function (str, chars) {
    var backBool = false;
    if (str.indexOf(chars) != -1) {
        backBool = true;
    }
    return backBool;
};
var ComIDUMDEPlist_M = [["HG01", "0002", "營運事業一部A組"],
                         ["HG01", "0006", "營運事業一部B組"],
                         ["HG05", "0015", "營運事業二部A組"],
                         ["HG05", "0016", "營運事業二部B組"],
                         ["HG02", "0007", "投資推廣部A組"],
                         ["HG02", "0008", "投資推廣部B組"],
                         ["HG03", "0011", "財富管理部A組"],
                         ["HG03", "0012", "財富管理部B組"],
                         ["HG04", "0013", "理財推廣部A組"],
                         ["HG04", "0014", "理財推廣部B組"],
                         ["HG06", "0017", "網路事業部A組"],
];
var getDepName_M = function (ComID, U_MDEP) {
    var backStr = undefined;
    switch (ComID) {
        case "HG01":
            if (U_MDEP == "0002") {
                backStr = "營運事業一部A組";
            } else if (U_MDEP == "0006") {
                backStr = "營運事業一部B組";
            }
            break;
        case "HG05":
            if (U_MDEP == "0015") {
                backStr = "營運事業二部A組";
            } else if (U_MDEP == "0016") {
                backStr = "營運事業二部B組";
            }
            break;
        case "HG02":
            if (U_MDEP == "0007") {
                backStr = "投資推廣部A組";
            } else if (U_MDEP == "0008") {
                backStr = "投資推廣部B組";
            }
            break;
        case "HG03":
            if (U_MDEP == "0011") {
                backStr = "財富管理部A組";
            } else if (U_MDEP == "0012") {
                backStr = "財富管理部B組";
            }
            break;
        case "HG04":
            if (U_MDEP == "0013") {
                backStr = "理財推廣部A組";
            } else if (U_MDEP == "0014") {
                backStr = "理財推廣部B組";
            }
            break;
        case "HG04":
            if (U_MDEP == "0013") {
                backStr = "理財推廣部A組";
            } else if (U_MDEP == "0014") {
                backStr = "理財推廣部B組";
            }
            break;
        case "HG06":
            backStr = "網路事業部A組";
            break;
    }
};
//取得使用者頁面權限
var getUserAuthority_M = function (startThisPage) {
    //alert('取得使用者頁面權限');
    var data = "menu_no=" + MENU_no_G + "&U_Num=" + U_Num_M + "&action=getUserAuthority";
    var success = function (back) {
        var json = jsonParse_M(back);
        $.each(json, function (i, v) {
            if (v.per_read == "1") {
                per_read_M = true;
            } else {
                per_read_M = false;
            }
            if (v.per_add == "1") {
                per_add_M = true;
            } else {
                per_add_M = false;
            }
            if (v.per_edit == "1") {
                per_edit_M = true;
            } else {
                per_edit_M = false;
            }
            if (v.per_del == "1") {
                per_del_M = true;
            } else {
                per_del_M = false;
            }
            if (v.per_query == "1") {
                per_query_M = true;
            } else {
                per_query_M = false;
               
            }
        });
        Log_M("per_read_M=" + per_read_M + "&per_add_M=" + per_add_M + "&per_edit_M=" + per_edit_M + "&per_del_M=" + per_del_M + "&per_query_M=" + per_query_M);
        if (per_query_M) {
            //alert("您的觀看權限為開放");
            startThisPage();//<===
        } else {
            //alert("您的觀看權限尚未開放");
            location.href = RelativePath+"index.aspx?" + "U_Num=" + U_Num_M;
            //startThisPage();//<===
        }
        
    };
    ajax_M(CommonHandlerUrl_M, data, success);//<====================
};