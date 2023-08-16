/**判斷是否是IE瀏覽器*/
var isIE = navigator.userAgent.search("MSIE") > -1;

$CommonTool = {
	version : "1.0.0"
};

(function(m) {
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
    m.HtmlTag = {
        disabledTrue: function (idOrClassName) {
            $(idOrClassName).attr("disabled", "disabled");
        },
        disabledFalse: function (idOrClassName) {
            $(idOrClassName).attr("disabled", false);
        },
    };
    m.Date = {
        /**
         * 取得client端日期(西元年) chrome, firefox的year取出來要加1900才會是現在的西元
         * ie的year取出來就是現在的西元年
         *
         * @returns {String}
         */
        getNowDate: function (time) {
            var date = time ? new Date(time) : new Date();
            if (isIE) {
                var year = date.getYear();
                year = year < 2000 ? year + 1900 : year;
                return year + "/" + (date.getMonth() + 1) + "/" + date.getDate();
            } else {
                return (date.getYear() + 1900) + "/" + (date.getMonth() + 1) + "/" + date.getDate();
            }
        },
        getNowDateTimeStr: function () {
            var d = new Date();
            return d.getFullYear().toString() + m.String.plusZero((d.getMonth()+1).toString()) +  m.String.plusZero(d.getDate().toString()) +  m.String.plusZero(d.getHours().toString()) +  m.String.plusZero(d.getMinutes().toString()) +  m.String.plusZero(d.getSeconds().toString()) +m.String.getTwoChar( d.getMilliseconds().toString());
        },
        getDatepickerDateTimeStr: function (str) {
            var backStr = str.split("/");
            return backStr[1] + "/" + backStr[2] + "/" + backStr[0];
        },
        getSqlDateTimeStr: function () {
            var d = new Date();
            return d.getFullYear().toString() + "-" + m.String.plusZero((d.getMonth() + 1).toString()) + "-" + m.String.plusZero(d.getDate().toString());
        },
        putInputValueWithDatepickerDateTimeStr: function (idOrClassName,str) {
            var strArr = str.split(" ");
            var backStr = strArr[0].split("/");
            backStr = backStr[1] + "/" + backStr[2] + "/" + backStr[0];
            $(idOrClassName).val(backStr);
        },
    };
    m.Number = {
        //控制只能輸入數字--參數idOrClassName : id或是class的名稱
        onlyNumber: function (idOrClassName) {
            $(idOrClassName).on("keypress", function (e) {
                if (e.keyCode < 48 || e.keyCode > 58) {
                    e.preventDefault();
                }
            });
        },
        getRandomStr: function (num) {
            var str = Math.random().toString();
            var strArr = str.split(".");
            var backStr = strArr[1].substr(0, num);
            return backStr;
        },
    };
    m.Sql = {
        makeUpdateStr: function (itemArr) {
            var str = undefined;
            $.each(itemArr, function (i, v) {
                if (i != 0) {
                    str += ", set ";
                    str += v;
                    str += "='{";
                    str += i;
                    str += "}'";
                } else {
                    str += "set ";
                    str += v;
                    str += "='{";
                    str += i;
                    str += "}'";
                }

            });
            return str;
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
        plusZero: function (str) {
            var backStr = undefined;
            if (str.length < 2) {
                backStr = "0" + str;
            } else {
                backStr =  str;
            }
            return backStr;
        },
        getTwoChar: function (str) {
            var backStr = undefined;
            if (str.length < 2) {
                backStr = "0" + str;
            } else {
                backStr = str.charAt(0).toString() + str.charAt(1).toString();
            }
            return backStr;
        },
    };
    m.Check = {
        //是否為空字串
        isEmptyStr: function (str) {
            var f = false;
            if (str === undefined ||str == "undefined" || str === null || $.trim(str) === "" || str == "[]" || str == "[object Object]") {
                f = true;
            }
            return f;
        },
        //是否為空字串
        isEmptyDate: function (str) {
            var f = false;
            var strArr = str.split(' ');
            if (strArr[0] === "1900/1/1" || strArr[0] === undefined || strArr[0] === null || $.trim(strArr[0]) === "" || strArr[0] == "[]" || strArr[0] == "[object Object]") {
                f = true;
            }
            return f;
        },
        //是否為手機號碼
        isMobileNum: function (idOrClassName, requireOrNot) {
            var checkMobiles = $(idOrClassName);
            if (m.Check.isEmptyStr(checkMobiles)) {
                if (requireOrNot) {
                    return false;
                } else {
                    return true;
                }
            }
            var vval = "";
            $.each(checkMobiles, function (i,v) {
                vval = $(v).val()
                if (!m.Check.isEmptyStr(vval)) {
                    if (vval.length != 10) {
                        alert("請正確填寫手機號碼");
                        return false;
                    }
                }
            });
            return true;
        },

        //是否為email格式
        isEmailFormat: function (idOrClassName, requireOrNot) {
            var emailVal = $(idOrClassName).val();
            if (m.Check.isEmptyStr(emailVal)) {
                if (requireOrNot) {
                    return false;
                } else {
                    return true;
                }
            }
            var back = undefined;
            var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
            back = re.test(emailVal);
            if (!back) {
                alert("請填寫正確email格式");
            } 
            return back;
        },
        //是否為身分證字號格式
        isROCIDstr: function (id,requireOrNot) {
            var idStr = $(id).val();
           
            if (m.Check.isEmptyStr(idStr)) {
                if (requireOrNot) {
                    return false;
                } else {
                    return true;
                }
            }
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
                alert("請仔細填寫身分證號碼");
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
                alert("身分證號碼寫錯了");
                return false;
            }
            // 規則二餘數與檢查碼需相符
            if (lastNum != 0 && (10 - (total % 10)) != lastNum) {
                alert("身分證號碼寫錯了");
                return false;
            }
            return true;
        },
        //檢查至少留一種聯絡方式
        AtLeastContact: function (idOrClassName) {
            var contacts = $(idOrClassName);
            var n = 0;
            $.each(contacts, function (i, v) {
                if (!m.Check.isEmptyStr($(v).val())) {
                    n += 1;
                }
            });
            if (n == 0) {
                alert("手機或電話至少填寫一種聯絡方式");
                return false;
            }
            return true;
        },
        //檢查所有必填欄位已填
        AllRequiredNoEmpty: function (idOrClassName, requiredItemAttrName) {
            var requireds = $(idOrClassName);
            var goNext = true;
            $.each(requireds, function (i, v) {
                if (m.Check.isEmptyStr($(v).val())) {
                    alert($(v).attr(requiredItemAttrName) + "為必填欄位");
                    $(v).focus();
                    goNext = false;
                    return false;
                }
            });
            return goNext;
        },
        //檢查結束日是否大於開始日
        isEndDateBigThanStartDate: function (startDate, endDate) {

            var doNext = false;
            if (!m.Check.isEmptyStr(startDate) && !m.Check.isEmptyStr(endDate)) {
                doNext = true;
                var startDateT = new Date(startDate);
                var endDateT = new Date(endDate);
                if (startDateT > endDateT) {
                    doNext = false;
                }
            } else if (m.Check.isEmptyStr(startDate) && m.Check.isEmptyStr(endDate)) {
                doNext = false;
            }
           
            return doNext;
        },

    };
  
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
    m.checkbox = {
        //取得checkbox全部的value用'，'串成字串並返回其值
        getAllValue: function (groupName) {
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
        },
    };
    m.Tel = {
        getZoneCodeHtmlTagOption : function (idOrClassName) {
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
        },
    };

    m.test = {
        todo: function () {
            alert("aaaaa");
        }
    };

})($CommonTool);