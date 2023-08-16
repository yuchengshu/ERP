var emptyCheck_M = function (str) {
    var f = false;
    if (str === undefined || str === null || $.trim(str) === "" || str == "[]" || str == "[object Object]" || str == [] || str == "null") {
        f = true;
    }
    return f;
};
//工具總類
    //1.一般工具 simpleTool
    //2.檢驗工具 checkTool
    //3.貨幣工具 moneyTool
    //4.通用工具 commonTool
    //5.時間日期工具 dateTimeTool
    //6.通用資料工具 commonDataTool
    //7.HTML tag 製作工具 htmlTagMakeTool

//1.一般工具 simpleTool
var Log_M = function (str) {
    console.log(str);
}
var val_M = function (idOrClassName, val) {
    if (!emptyCheck_M(val)) {
        $(idOrClassName).val(val);
    } else {
        return $(idOrClassName).val();
    }
};
var text_M = function (idOrClassName, text) {
    if (emptyCheck_M(text)) {
        return $(idOrClassName).text();
    } else {
        $(idOrClassName).text(text);
    }
};
var html_M = function (idOrClassName, html) {
    if (emptyCheck_M(html)) {
        return $(idOrClassName).html();
    } else {
        $(idOrClassName).html(html);
    }
};
var attr_M = function (idOrClassName, attrName, val) {
    if (!emptyCheck_M(val)) {
        $(idOrClassName).attr(attrName, val);
    } else {
        return $(idOrClassName).attr(attrName);
    }
};
var addClass_M = function (idOrClassName, className) {
    $(idOrClassName).addClass(className);
};
var removeClass_M = function (idOrClassName, className) {
    $(idOrClassName).removeClass(className);
};

var append_M = function (idOrClassName, text) {
    $(idOrClassName).append(text);
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
var disabledTrue_M = function (idOrClassName) {
    $(idOrClassName).attr("disabled", "disabled");
};
var disabledFalse_M = function (idOrClassName) {
    $(idOrClassName).attr("disabled", false);
};
var unBind_M = function (idOrClassName) {
    $(idOrClassName).unbind();
};
var change_M = function (idOrClassName) {
    $(idOrClassName).change();
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
var onClick_M = function (idOrClassName, func) {
    $(idOrClassName).on("click", func);
};
var onChange_M = function (idOrClassName, func) {
    $(idOrClassName).on("change", func);
};


//2.檢驗工具 checkTool
    //2-1.檢查是否有空值 emptyCheck_M
    //2-2.檢查字串中是否存在某些字元 hasStr_M
    //2-3.字體型別檢測 strTypeCheck_M
    //2-4.檢查是否為中文 chineseCheck_M
    //2-5.檢查是否為英文 englishCheck_M
    //2-6.檢查是否為數字 numberCheck_M
    //2-7.檢查日期順序 endDateBigThanStartDateCheck_M
    //2-8.檢查手機號碼是否正確 mobileCheckInputs_M
    //2-9.檢查email格式是否正確 emailFormatCheck_M
    //2-10.是否為身分證字號格式 idCheck_M
    //2-11.檢查至少留一種聯絡方式 atLeastContact_M

//檢查是否有空值 emptyCheck_M
var emptyCheck_M = function (str) {
    var f = false;
    if (str === undefined || str === null || $.trim(str) === "" || str == "[]" || str == "[object Object]" || str == [] || str == "null") {
        f = true;
    }
    return f;
};
var emptyCheckInputs_M = function (groupName) {
    var val = undefined;
    var errorItemName = undefined;
    var back = true;

    var checks = $(groupName + "EmptyCheck");
    if (checks.length != 0) {
        $.each(checks, function (i, v) {
            val = $(v).val();
            if (emptyCheck_M(val)) {
                errorItemName = $(v).attr("itemName");
                alert(errorItemName + "欄位 請填入資料");
                $(v).focus();
                back = false;
                return false;
            }
        });
    }
    return back;
};
//檢查字串中是否存在某些字元 hasStr_M
var hasStr_M = function (str, chars) {
    var backBool = false;
    if (str.toString().indexOf(chars) != -1) {
        backBool = true;
    }
    return backBool;
};
//字體型別檢測 strTypeCheck_M
var strTypeCheck_M = function (str) {
    var pattern = new RegExp("[\u4E00-\u9FA5]+");
    var backStr = "";
    if (pattern.test(str)) {
        backStr = "中";
    } else {
        var pattern2 = new RegExp("[A-Za-z]+");
        if (pattern2.test(str)) {
            backStr = "英";
        } else {
            var pattern3 = new RegExp("[0-9]+");
            if (pattern3.test(str)) {
                backStr = "數";
            }
        }
    }
    return backStr;
};
//檢查是否為中文 chineseCheck_M
var chineseCheck_M = function (str) {
    var pattern = new RegExp("[\u4E00-\u9FA5]+");
    return pattern.test(str);
};
var wordCheckInputs_M = function (groupName, typeCheck,warningStr) {
    var val = undefined;
    var errorItemName = undefined;
    var back = true;
    var RegExpStr = "";
    switch (typeCheck) {
        case "ChineseCheck":
            RegExpStr = "[\u4E00-\u9FA5]+";
            break;
        case "NumberCheck":
            RegExpStr = "[0-9]+";
            break;
        case "EnglishCheck":
            RegExpStr = "[A-Za-z]+";
            break;
    
    }
    var pattern = new RegExp(RegExpStr);
    var checks = $(groupName + typeCheck);
    if (checks.length != 0) {
        $.each(checks, function (i, v) {
            val = $(v).val();
            if (!emptyCheck_M(val)) {
                if (!pattern.test(val)) {
                    errorItemName = $(v).attr("itemName");
                    alert(errorItemName + "欄位 " + warningStr);
                    $(v).focus();
                    back = false;
                    return false;
                }
            }
        });
    }
    return back;
};

//檢查是否為英文 englishCheck_M
var englishCheck_M = function (str) {
    var pattern = new RegExp("[A-Za-z]+");
    return pattern.test(str);
};
//檢查是否為數字 numberCheck_M
var numberCheck_M = function (str) {
    var pattern = new RegExp("[0-9]+");
    return pattern.test(str);
};
//檢查日期順序 endDateBigThanStartDateCheck_M
var endDateBigThanStartDateCheck_M = function (startDate, endDate) {

    var doNext = false;
    if (!emptyCheck_M(startDate) && !emptyCheck_M(endDate)) {
        doNext = true;
        var startDateT = new Date(startDate);
        var endDateT = new Date(endDate);
        if (startDateT > endDateT) {
            doNext = false;
            alert("請正確選取日期");
        }
    } else if (emptyCheck_M(startDate) && emptyCheck_M(endDate)) {
        doNext = false;
        alert("請正確選取日期");
    }
    return doNext;
}
//檢查手機號碼是否正確 mobileCheckInputs_M
var mobileCheckInputs_M = function (idOrClassName) {
    var backTF = true;
    var checks = $(idOrClassName + "MobileCheck");
    var vval = "";
    
    $.each(checks, function (i, v) {
        vval = $(v).val()
        if (!emptyCheck_M(vval)) {
            if (vval.length != 10) {
                $(v).focus();
                alert("請正確填寫手機號碼");
                backTF = false;
                return false;
            }
        }
    });

    return backTF;
};
//檢查email格式是否正確 emailFormatCheck_M
var emailCheckInputs_M = function (idOrClassName) {
    var emailVal = $(idOrClassName).val();
    var back = true;
    if (!emptyCheck_M(emailVal)) {
        var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
        back = re.test(emailVal);
        if (!back) {
            $(idOrClassName).focus();
            alert("請填寫正確email格式");
        }
    }
    return back;
};
//是否為身分證字號格式 idCheck_M
var idCheckInput_M = function (id) {
    var idStr = $(id).val();
    var backTF = true;
    if (!emptyCheck_M(idStr)) {
        // 依照字母的編號排列，存入陣列備用。
        var letters = new Array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'X', 'Y', 'W', 'Z', 'I', 'O');
        // 儲存各個乘數
        var multiply = new Array(1, 9, 8, 7, 6, 5, 4, 3, 2, 1);
        var nums = new Array(2);
        var firstChar;
        var firstNum;
        var lastNum;
        var total = 0;
        // 撰寫「正規表達式」。第一個字為英文字母，
        // 第二個字為1或2，後面跟著8個數字，不分大小寫。
        var regExpID = /^[a-z](1|2)\d{8}$/i;
        // 使用「正規表達式」檢驗格式
        if (idStr.search(regExpID) == -1) {
            // 基本格式錯誤
            backTF = false;
            alert("請仔細填寫身分證號碼");
            $(id).focus();
            return false;
        } else {
            // 取出第一個字元和最後一個數字。
            firstChar = idStr.charAt(0).toUpperCase();
            lastNum = idStr.charAt(9);
        }
        // 找出第一個字母對應的數字，並轉換成兩位數數字。
        for (var i = 0; i < 26; i++) {
            if (firstChar == letters[i]) {
                firstNum = i + 10;
                nums[0] = Math.floor(firstNum / 10);
                nums[1] = firstNum - (nums[0] * 10);
                break;
            }
        }
        // 執行加總計算
        for (var i = 0; i < multiply.length; i++) {
            if (i < 2) {
                total += nums[i] * multiply[i];
            } else {
                total += parseInt(idStr.charAt(i - 1)) * multiply[i];
            }
        }
        // 和最後一個數字比對
        // 規則一餘數為零，且檢查碼需為零
        if (lastNum == 0 && (total % 10) != lastNum) {
            $(id).focus();
            backTF = false;
            alert("身分證號碼寫錯了");
            return false;
        }
        // 規則二餘數與檢查碼需相符
        if (lastNum != 0 && (10 - (total % 10)) != lastNum) {
            $(id).focus();
            backTF = false;
            alert("身分證號碼寫錯了");
            return false;
        }
    }
    
    return backTF;
};
//檢查至少留一種聯絡方式 atLeastContact_M
var atLeastContact_M = function (idOrClassName) {
    var contacts = $(idOrClassName);
    var n = 0;
    $.each(contacts, function (i, v) {
        if (!emptyCheck_M($(v).val())) {
            n += 1;
        }
    });
    if (n == 0) {
        alert("手機或電話至少填寫一種聯絡方式");
        return false;
    }
    return true;
};

//3.貨幣工具 moneyTool
//3-1.貨幣數字格式 getMoneyFormat_M

//3-1.貨幣數字格式 getMoneyFormat_M
var getMoneyFormat_M = function (num) {
    var money = undefined;
    money = num.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
    return money;
};
//4.通用工具commonTool
//4-1. SessionStorage設定 setSessionStorage_M
//4-2.擷取頁面 printScreen_M
//4-3.將字串轉成JSON物件 jsonParse_M
//4-4.切割字體 split_M
//4-5.字串串接工具 StringBuilder_M
//4-6.補零 plusZero_M
//4-7.傳送資料 ajax_M
//4-8.取得隨機數 getRandom_M
//4-9.取得checkbox全部的value用'，'串成字串並返回其值 getAllcheckBoxValue_M
//4-10.取得RadioButton的值 getRadioButtonValue_M

//SessionStorage設定 setSessionStorage_M
var setSessionStorage_M = function (key, value) {
    sessionStorage[key] = value;
};
var getSessionStorage_M = function (key) {
    return sessionStorage[key];
};
//擷取頁面 printScreen_M
var printScreen_M = function (idOrClassName) {
    document.body.innerHTML = $(idOrClassName).html();
    window.print();
}
//將字串轉成JSON物件 jsonParse_M
var jsonParse_M = function (str) {
    return JSON.parse(str);
    
};

//切割字體 split_M
var split_M = function (str, splitChar, num) {
    return str.split(splitChar)[num];
};

// 字串串接工具 StringBuilder_M
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
//補零 plusZero_M
var plusZero_M = function (str) {
    var backStr = undefined;
    if (str.length < 2) {
        backStr = "0" + str;
    } else {
        backStr = str;
    }
    return backStr;
};
//傳送資料 ajax_M
var ajax_M = function (url, data, success, error) {
    $.ajax({
        url: url,
        dataType: "json",//20221024test
        data: JSON.parse(data),//20221024test
        method: 'POST',
        success: success,
        error: error
    });
};
//取得隨機數 getRandom_M
var getRandom_M = function (min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
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
    return backStr
};
//取得RadioButton的值 getRadioButtonValue_M
var getRadioButtonValue_M = function (groupName) {
    var checkboxGroup = $(groupName);
    var backStr = undefined;

    $.each(checkboxGroup, function (i, v) {
        if ($(v).prop("checked")) {
             backStr = $(v).val();
        }
    });
    return backStr;
};

//5.時間日期工具 dateTimeTool
    //5-1.取得昨日日期 getYesTodayStr_M
    //5-2.取得今日日期 getTodayStr_M
    //5-3.sql日期格式轉換成datePicker格式 sqlDateTOdatePickDate_M
//5-4.datePicker格式換成sql日期格式 datePickDateTOsqlDate_M
//5-5sql日期格式轉換成正常日期格式 sqlDateTONormalDate_M
//5-6取得現在時間 getNowTime_M


var today = new Date();
var todayY_M = today.getFullYear();
var todayM_M = today.getMonth() + 1;
var todayD_M = today.getDate();
var yesToday = new Date();
yesToday.setDate(yesToday.getDate() - 1);
var yesTodayY_M = yesToday.getFullYear();
var yesTodayM_M = yesToday.getMonth() + 1;
var yesTodayD_M = yesToday.getDate();
//取得昨日日期 getYesTodayStr_M
var getYesTodayStr_M = function (dateType) {
    if (dateType == "dp") { //Datepicker =dp
        return yesTodayM_M + "/" + yesTodayD_M + "/" + yesTodayY_M;
    } else if (dateType == "sql") {
        return yesTodayY_M + "-" + yesTodayM_M + "-" + yesTodayD_M + " 00:00:00.000";
    } else if (dateType == "normal") {
        return yesTodayY_M+"/"+yesTodayM_M + "/" + yesTodayD_M;
    }
};
//取得今日日期 getTodayStr_M
var getTodayStr_M = function (dateType) {
    if (dateType == "dp") { //Datepicker =dp
        return todayM_M + "/" + todayD_M + "/" + todayY_M;
    } else if (dateType == "sql") {
        return todayY_M + "-" + todayM_M + "-" + todayD_M + " 00:00:00.000";
    } else if (dateType == "normal") {
        return todayY_M + "/" + todayM_M + "/" + todayD_M;
    }
};
//sql日期格式轉換成datePicker格式 sqlDateTOdatePickDate_M
var sqlDateTOdatePickDate_M = function (date) {
    var dateArr1 = date.split(' ');
    var dateArr = dateArr1.split('/');
    return dateArr[1] + "/" + dateArr[2] + "/" + dateArr[0];
};
//datePicker格式換成sql日期格式 datePickDateTOsqlDate_M
var datePickDateTOsqlDate_M = function (date) {
    var dateArr = date.split('/');
    return dateArr[2] + "-" + dateArr[0] + "-" + dateArr[1] + " 00:00:00.000";
};
//sql日期格式轉換成正常日期格式 sqlDateTONormalDate_M
var sqlDateTONormalDate_M = function (date) {
    var dateArr1 = date.split(' ');
    var dateArr = dateArr1[0].split('/');
    return dateArr[0] + "/" + dateArr[1] + "/" + dateArr[2];
};
//取得現在時間 getNowTime_M
var getNowTime_M = function () {
    var now = new Date();
    var hh = now.getHours();
    var mm = now.getMinutes();
    var ss = now.getSeconds();
    return hh + ":" + mm + ":" + ss;
};
//6.通用資料工具 commonDataTool
//6-1.製作台灣各縣市selectOption getCityListHtmlTagOption_M
//6-2.取得電話區碼列表 getZoneCodeHtmlTagOption_M

//製作台灣各縣市selectOption getCityListHtmlTagOption_M
/*
 m.Address = {
        getCityListHtmlTagOption: function (idOrClassName,val) {
            $(idOrClassName).empty();
            var sb = new m.String.StringBuilder();;
            sb.append("<option value=''>請選擇城市</option>");
            sb.append("<option value='台北市'>台北市</option>");
            sb.append("<option value='基隆市'>基隆市</option>");
            sb.append("<option value='新北市'>新北市</option>");
            sb.append("<option value='宜蘭縣'>宜蘭縣</option>");
            sb.append("<option value='新竹市'>新竹市</option>");
            sb.append("<option value='新竹縣'>新竹縣</option>");
            sb.append("<option value='桃園市'>桃園市</option>");
            sb.append("<option value='苗栗縣'>苗栗縣</option>");
            sb.append("<option value='台中市'>台中市</option>");
            sb.append("<option value='彰化縣'>彰化縣</option>");
            sb.append("<option value='南投縣'>南投縣</option>");
            sb.append("<option value='嘉義市'>嘉義市</option>");
            sb.append("<option value='嘉義縣'>嘉義縣</option>");
            sb.append("<option value='雲林縣'>雲林縣</option>");
            sb.append("<option value='台南市'>台南市</option>");
            sb.append("<option value='高雄市'>高雄市</option>");
            sb.append("<option value='澎湖縣'>澎湖縣</option>");
            sb.append("<option value='屏東縣'>屏東縣</option>");
            sb.append("<option value='台東縣'>台東縣</option>");
            sb.append("<option value='花蓮縣'>花蓮縣</option>");
            sb.append("<option value='金門縣'>金門縣</option>");
            sb.append("<option value='連江縣'>連江縣</option>");
            sb.append("<option value='南海諸島'>南海諸島</option>");
            $(idOrClassName).append(sb.toString());
            if (!m.Check.isEmptyStr(val)) {
                $(idOrClassName).val(val);
            }
            
        },
        TownList: {
            "台北市": ["100-中正區", "103-大同區", "104-中山區", "105-松山區", "106-大安區", "108-萬華區", "110-信義區", "111-士林區", "112-北投區", "114-內湖區", "115-南港區", "116-文山區"],
            "基隆市": ["200-仁愛區", "201-信義區", "202-中正區", "203-中山區", "204-安樂區", "205-暖暖區", "206-七堵區"],
            "新北市": ["207-萬里區", "208-金山區", "220-板橋區", "221-汐止區", "222-深坑區", "223-石碇區", "224-瑞芳區", "226-平溪區", "227-雙溪區", "228-貢寮區", "231-新店區", "232-坪林區", "233-烏來區", "234-永和區", "235-中和區", "236-土城區", "237-三峽區", "238-樹林區", "239-鶯歌區", "241-三重區", "242-新莊區", "243-泰山區", "244-林口區", "247-蘆洲區", "248-五股區", "249-八里區", "251-淡水區", "252-三芝區", "253-石門區"],
            "宜蘭縣": ["260-宜蘭市", "261-頭城鎮", "262-礁溪鄉", "263-壯圍鄉", "264-員山鄉", "265-羅東鎮", "266-三星鄉", "267-大同鄉", "268-五結鄉", "269-冬山鄉", "270-蘇澳鎮", "272-南澳鄉"],
            "新竹市": ["300-東區", "300-北區", "300-香山區"],
            "新竹縣": ["302-竹北市", "303-湖口鄉", "304-新豐鄉", "305-新埔鎮", "306-關西鎮", "307-芎林鄉", "308-寶山鄉", "310-竹東鎮", "311-五峰鄉", "312-橫山鄉", "313-尖石鄉", "314-北埔鄉", "315-峨嵋鄉"],
            "桃園市": ["320-中壢區", "324-平鎮區", "325-龍潭區", "326-楊梅區", "327-新屋區", "328-觀音區", "330-桃園區", "333-龜山區", "334-八德區", "335-大溪區", "336-復興區", "337-大園區", "338-蘆竹區"],
            "苗栗縣": ["350-竹南鎮", "351-頭份鎮", "352-三灣鄉", "353-南庄鄉", "354-獅潭鄉", "356-後龍鎮", "357-通霄鎮", "358-苑裡鎮", "360-苗栗市", "361-造橋鄉", "362-頭屋鄉", "363-公館鄉", "364-大湖鄉", "365-泰安鄉", "366-銅鑼鄉", "367-三義鄉", "368-西湖鄉", "369-卓蘭鄉"],
            "台中市": ["400-中區", "401-東區", "402-南區", "403-西區", "404-北區", "406-北屯區", "407-西屯區", "408-南屯區", "411-太平區", "412-大里區", "413-霧峰區", "414-烏日區", "420-豐原區", "421-后里區", "422-石岡區", "423-東勢區", "424-和平區", "426-新社區", "427-潭子區", "428-大雅區", "429-神岡區", "432-大肚區", "433-沙鹿區", "434-龍井區", "435-梧棲區", "436-清水區", "437-大甲區", "438-外埔區", "439-大安區"],
            "彰化縣": ["500-彰化市", "502-芬園鄉", "503-花壇鄉", "504-秀水鄉", "505-鹿港鎮", "506-福興鄉", "507-線西鄉", "508-和美鎮", "509-伸港鄉", "510-員林鎮", "511-社頭鄉", "5112-永靖鄉", "513-埔心鄉", "514-溪湖鎮", "515-大村鄉", "516-埔鹽鄉", "520-田中鎮", "521-北斗鎮", "522-田尾鄉", "523-埤頭鄉", "524-溪州鄉", "525-竹塘鄉", "526-二林鎮", "527-大城鄉", "528-芳苑鄉", "530-二水鄉"],
            "南投縣": ["540-南投市", "541-中寮鄉", "542-草屯鎮", "544-國姓鄉", "545-埔里鎮", "546-仁愛鄉", "551-名間鄉", "552-集集鄉", "553-水里鄉", "555-魚池鄉", "556-信義鄉", "557-竹山鎮", "558-鹿谷鄉"],
            "嘉義市": ["600-東區", "600-西區"],
            "嘉義縣": ["602-番路鄉", "603-梅山鄉", "604-竹崎鄉", "605-阿里山鄉", "606-中埔鄉", "607-大埔鄉", "608-水上鄉", "611-鹿草鄉", "612-太保市", "613-朴子市", "614-東石鄉", "615-六腳鄉", "616-新港鄉", "621-民雄鄉", "622-大林鎮", "623-溪口鄉", "624-義竹鄉", "625-布袋鎮"],
            "雲林縣": ["630-斗南鎮", "631-大埤鄉", "632-虎尾鎮", "633-土庫鎮", "634-褒忠鄉", "635-東勢鄉", "636-臺西鄉", "637-崙背鄉", "638-麥寮鄉", "640-斗六市", "643-林內鄉", "646-古坑鄉", "647-莿桐鄉", "648-西螺鎮", "649-二崙鄉", "651-北港鎮", "652-水林鄉", "653-口湖鄉", "654-四湖鄉", "655-元長鄉"],
            "台南市": ["700-中西區", "701-東區", "702-南區", "704-北區", "708-安平區", "709-安南區", "710-永康區", "711-歸仁區", "712-新化區", "713-左鎮區", "714-玉井區", "715-楠西區", "716-南化區", "717-仁德區", "718-關廟區", "719-龍崎區", "720-官田區", "721-麻豆區", "722-佳里區", "723-西港區", "724-七股區", "725-將軍區", "726-學甲區", "727-北門區", "730-新營區", "731-後壁區", "732-白河區", "733-東山區", "734-六甲區", "735-下營區", "736-柳營區", "737-鹽水區", "741-善化區", "742-大內區", "743-山上區", "744-新市區", "745-安定區"],
            "高雄市": ["800-新興區", "801-前金區", "802-苓雅區", "803-鹽埕區", "804-鼓山區", "805-旗津區", "806-前鎮區", "807-三民區", "811-楠梓區", "812-小港區", "813-左營區", "814-仁武區", "815-大社區", "820-岡山區", "821-路竹區", "822-阿蓮區", "823-田寮區", "824-燕巢區", "825-橋頭區", "826-梓官區", "827-彌陀區", "828-永安區", "829-湖內區", "830-鳳山區", "831-大寮區", "832-林園區", "833-鳥松區", "840-大樹區", "842-旗山區", "843-美濃區", "844-六龜區", "845-內門區", "846-杉林區", "847-甲仙區", "848-桃源區", "849-那碼夏", "851-茂林區", "852-茄萣區"],
            "澎湖縣": ["880-馬公市", "881-西嶼鄉", "882-望安鄉", "883-七美鄉", "884-白沙鄉", "885-湖西鄉"],
            "屏東縣": ["900-屏東市", "901-三地門鄉", "902-霧台鄉", "903-瑪家鄉", "904-九如鄉", "905-里港鄉", "906-高樹鄉", "907-鹽埔鄉", "908-長治鄉", "909-麟洛鄉", "911-竹田鄉", "912-內埔鄉", "913-萬丹鄉", "920-潮州鎮", "921-泰武鄉", "922-來義鄉", "923-萬巒鄉", "924-嵌頂鄉", "925-新埤鄉", "926-南州鄉", "927-林邊鄉", "928-東港鎮", "929-琉球鄉", "931-佳冬鄉", "932-新園鄉", "940-枋寮鄉", "941-枋山鄉", "942-春日鄉", "943-獅子鄉", "944-車城鄉", "945-牡丹鄉", "946-恆春鎮", "947-滿州鄉"],
            "台東縣": ["950-台東市", "951-綠島鄉", "952-蘭嶼鄉", "953-延平鄉", "954-卑南鄉", "955-鹿野鄉", "956-關山鎮", "957-海端鄉", "958-池上鄉", "959-東河鄉", "961-成功鎮", "962-長濱鄉", "963-太麻里鄉", "964-金峰鄉", "965-大武鄉", "966-達仁鄉"],
            "花蓮縣": ["970-花蓮市", "971-新城鄉", "972-秀林鄉", "973-吉安鄉", "974-壽豐鄉", "975-鳳林鎮", "976-光復鄉", "977-豐濱鄉", "978-瑞穗鄉", "979-萬榮鄉", "981-玉里鎮", "982-卓溪鄉", "983-富里鄉"],
            "金門縣": ["890-金沙鎮", "891-金湖鎮", "892-金寧鄉", "893-金城鎮", "894-烈嶼鄉", "896-烏坵鄉"], "連江縣": ["209-南竿鄉", "210-北竿鄉", "211-莒光鄉", "212-東引"],
            "南海諸島": ["817-東沙", "819-西沙"]
        },
        makeCityListAndTownListHtmlTagSelect: function (cityIdOrClassName, townIdOrClassName, cityCode, townCode) {
            //取得htmlTagOption城市列表
            this.getCityListHtmlTagOption(cityIdOrClassName, cityCode);
            //取得htmlTagOption區鄉鎮列表
            var getTownList = function (code) {
                console.log("getTownList start");
                $(townIdOrClassName).empty();
                var city = undefined;
                if (m.Check.isEmptyStr(cityCode)) {
                    city = $(this).val();
                    console.log("getTownList city1=" + city);
                } else {
                    city = cityCode;
                    cityCode = undefined;
                    console.log("getTownList city2=" + city);
                }
                var sb = new m.String.StringBuilder();
                sb.append("<option value=' '>請選擇區鄉鎮</option>");
                console.log("TownList=" + m.Address.TownList);
                $.each(m.Address.TownList, function (i, v) {
                    if (i == city) {
                        $.each(v, function (ii, vv) {
                            townAndCode = vv.split("-");
                            sb.append("<option value = '");
                            sb.append(townAndCode[0]);
                            sb.append("'>");
                            sb.append(townAndCode[1]);
                            sb.append("</option>");
                        });
                    }
                });
                $(townIdOrClassName).append(sb.toString());
                console.log("code=" + code.toString());
                if (!m.Check.isEmptyStr(code.toString())) {
                    console.log("code=aaa");
                    $(townIdOrClassName).val(code);
                }
            };

            //將取得htmlTagOption區鄉鎮列表的方法系結再城市select上面
            $(cityIdOrClassName).on("change", getTownList);
            if (!m.Check.isEmptyStr(townCode)) {
                getTownList(townCode);
            } 

        },
        //製作selectTag的城市及鄉鎮列表=====================================end
    };
*/
//取得電話區碼列表 getZoneCodeHtmlTagOption_M
var getZoneCodeHtmlTagOption_M = function (idOrClassName) {
    $(idOrClassName).empty();
    var sb = new m.String.StringBuilder();
    sb.append("<option value='02'>02</option>");
    sb.append("<option value='03'>03</option>");
    sb.append("<option value='037'>037</option>");
    sb.append("<option value='04'>04</option>");
    sb.append("<option value='049'>049</option>");
    sb.append("<option value='05'>05</option>");
    sb.append("<option value='06'>06</option>");
    sb.append("<option value='07'>07</option>");
    sb.append("<option value='08'>08</option>");
    sb.append("<option value='089'>089</option>");
    sb.append("<option value='082'>082</option>");
    sb.append("<option value='0826'>0826</option>");
    sb.append("<option value='0836'>0836</option>");
    $(idOrClassName).append(sb.toString());
};
//7.HTML tag 製作工具 htmlTagMakeTool
//7-1.tr製作 makeTrTag_M
//7-2.Img製作 makeImgTag_M
//7-3.td製作 makeTdTag_M
//7-4.th製作 makeThTag_M
//7-5.body製作 makeTb_M

//tr製作 makeTrTag_M
var makeTrTag_M = function (sb, trInner, attr) {
sb.append("<tr ");
sb.append(attr);
sb.append(">");
sb.append(trInner);
sb.append("</tr>");
};

//Img製作 makeImgTag_M
var makeImgTag_M = function (attr) {
    var sb = new StringBuilder_M();
    sb.append("<img ");
    sb.append(attr);
    sb.append("/>");
    return sb.toString();
};
//td製作 makeTdTag_M
var makeTdTag_M = function (sb, tdInner, attr) {
    sb.append("<td ");
    sb.append(attr);
    sb.append(">");
    sb.append(tdInner);
    sb.append("</td>");
};
//th製作 makeThTag_M
var makeThTag_M = function (sb, thInner, attr) {
    sb.append("<th ");
    sb.append(attr);
    sb.append(">");
    sb.append(thInner);
    sb.append("</th>");
};
//body製作 makeTb_M
var makeTb_M = function (dataArr, tbID, affterAppendFuc) {
    var sbtr = new StringBuilder_M();
    var sbtd = undefined;;
    $.each(dataArr, function (i, v) {
        sbtd = new StringBuilder_M();
        $.each(v, function (ii, vv) {
            makeTdTag_M(sbtd, vv[0], vv[1]);
        });
        makeTrTag_M(sbtr, sbtd.toString());
        sbtd = null;
    });
    append_M(tbID, sbtr.toString());
    if (affterAppendFuc != null) {
        affterAppendFuc();
    };
            
};











