/**判斷是否是IE8瀏覽器*/
var isIE8 = navigator.userAgent.search("MSIE 8") > -1;

/**判斷是否是IE9瀏覽器*/
var isIE9 = navigator.userAgent.search("MSIE 9") > -1;
/**判斷是否是IE瀏覽器*/
var isIE = navigator.userAgent.search("MSIE") > -1;

// 如果是IE或是正式環境，就把console物件複寫掉
if (isIE || document.domain == "www.masterlink.com.tw") {
	console = {
		log : function() {
			var l = arguments.length, i, arr = [];
			for (i = 0; i < l; i++)
				arr[i] = arguments[i];
			// alert(arr.join("\n"));
		}
	};
}

/*
 * 20160712
 * 解決Android WebView 4.x版會出現CustomEvent is undefined狀況
 * Polyfill for adding CustomEvent
 * see : https://developer.mozilla.org/fr/docs/Web/API/CustomEvent
 */

if (!window.CustomEvent) { // Create only if it doesn't exist
    (function () {
        function CustomEvent ( event, params ) {
            params = params || { bubbles: false, cancelable: false, detail: undefined };
            var evt = document.createEvent( 'CustomEvent' );
            evt.initCustomEvent( event, params.bubbles, params.cancelable, params.detail );
            return evt;
        };

        CustomEvent.prototype = window.Event.prototype;

        window.CustomEvent = CustomEvent;
    })();
}

/**
 * @namespace 1.masterlink 專用的 plugin 2.使用時必須要引入jquery-1.10以上, jquery-1.11以下的版本
 */
$HG = {
	version : "1.0.0"
};

(function(m) {
	
    /**
     * @namespace 工具類別
     */
    m.util = {
    		
    	/**
    	 * 判斷是否為行動裝置
    	 * @param os
    	 */
    	isMobileDevice: function(os) {    		
    		var ua = os || navigator.userAgent;
    		ua = ua.toLowerCase();
    	    var checker = {
    	    	iphone: ua.match(/(iphone|ipod|ipad)/),
    	      	blackberry: ua.match(/blackberry/),
    	      	android: ua.match(/android/)
    	    };
    	    return checker.android || checker.iphone || checker.blackberry;
    	},
    		
        /**
         * 計算兩個日期共差幾天
         *
         * @param d1
         * @param d2
         */
        betweenTwoDate: function(d1, d2) {
            var timeDiff = Math.abs(d2.getTime() - d1.getTime());
            var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
            return diffDays;
        },
        StringBuilder: function() {
            this.buffer = [];
            this.append = function(val) {
                this.buffer.push(val);
                return this;
            };
            this.appendWhiteSpace = function() {
                this.buffer.push(" ");
                return this;
            };
            this.appendAttr = function(key, val) {
                this.buffer.push(key);
                this.buffer.push("='");
                this.buffer.push(val);
                this.buffer.push("'");
                return this;
            };
            this.toString = function() {
                return this.buffer.join('');
            };
            this.release = function() {
                while (this.buffer.length > 0) {
                    this.buffer.pop();
                }
            };
        },
        /**
         * 判斷是否為空字串
         *
         * @param str
         * @returns {Boolean}
         */
        isEmptyStr: function(str) {
            var f = false;
            if (str === undefined || str === null || $.trim(str) === "" || str.length == "[]") {
                f = true;
            }
            return f;
        },
        isEmptyData: function(settings) {
            var _settings = {
                data: undefined,
                showdata: undefined,
                notEmptyCallback: undefined,
                isEmptyCallback: undefined
            };
            _settings = settings;
            if (_settings.data !== undefined && _settings.data !== null && _settings.data.length > 0) {
                return _settings.notEmptyCallback(_settings.data);
            } else {
                return _settings.isEmptyCallback(_settings.showdata);
            }
        },
        /**
         * 檢查是否為正確的身分證字號
         *
         * @param idStr
         *            中華民國身分證字號
         * @returns {Boolean}
         */
        checkROCID: function(idStr) {
            if (this.isEmptyStr(idStr)) {
                return false;
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
        /**
         * 取得client端日期(西元年) chrome, firefox的year取出來要加1900才會是現在的西元
         * ie的year取出來就是現在的西元年
         *
         * @returns {String}
         */
        getADDate: function(time) {
            var date = time ? new Date(time) : new Date();
            if (isIE) {
            	var year = date.getYear();
            	year = year < 2000 ? year+1900 : year;
                return year + "/" + (date.getMonth() + 1) + "/" + date.getDate();
            } else {
                return (date.getYear() + 1900) + "/" + (date.getMonth() + 1) + "/" + date.getDate();
            }
        },
        /**
		 * 日期格式化 yyyy-mm-dd
		 * @param time
		 * @returns {String}
		 */
		getADDateDash: function(time) {
			var date = new Date(time);
			var year = date.getFullYear() ;
			var month = date.getMonth() + 1 ;
			month = m.util.padLeft(month.toString(),2);
			var day = m.util.padLeft(date.getDate().toString(), 2);
			date = year + "-" + month + "-" + day;
			return date;
        },
        /**
		 * 日期格式化 yyyymmdd
		 * @param time
		 * @returns {String}
		 */
		getFormatDate: function(time) {
			var date = new Date(time);
			var year = date.getFullYear() ;
			var month = date.getMonth() + 1 ;
			month = m.util.padLeft(month.toString(),2);
			var day = m.util.padLeft(date.getDate().toString(), 2);
			date = year + month + day;
			return date;
        },
        /**
		 * 日期格式化 yyyymmdd hh:mm:ss
		 * @param time
		 * @returns {String}
		 */
		getFormatDate2: function(time) {
        	var date = "";
			if(!m.util.isEmptyStr(time)){
	        	date = new Date(time);
				var year = date.getFullYear() ;
				var month = date.getMonth() + 1 ;
				month = m.util.padLeft(month.toString(),2);
				var day = m.util.padLeft(date.getDate().toString(), 2);
				var hour = m.util.padLeft(date.getHours().toString(),2);
				var min = m.util.padLeft(date.getMinutes().toString(),2);
				var sec = m.util.padLeft(date.getSeconds().toString(),2);
				date = year + month + day+" "+hour+":"+min+":"+sec;
			}
			return date;
        },
        
        /**
         * 日期格式化 yyyy-mm-dd hh:mm:ss
         * @param time
         */
        getFullDate:function(time){
        	var date = "";
			if(!m.util.isEmptyStr(time)){
	        	date = new Date(time);
				var year = date.getFullYear() ;
				var month = date.getMonth() + 1 ;
				month = m.util.padLeft(month.toString(),2);
				var day = m.util.padLeft(date.getDate().toString(), 2);
				var hour = m.util.padLeft(date.getHours().toString(),2);
				var min = m.util.padLeft(date.getMinutes().toString(),2);
				var sec = m.util.padLeft(date.getSeconds().toString(),2);
				date = year + "-" + month + "-" + day+" "+hour+":"+min+":"+sec;
			}
			return date;
        },
        /**
         * 日期時間格式化 YYYYMMDDhhmmss
         * @param time
         */
        getTimeHHmmss:function(time){
        	var date = "";
			if(!m.util.isEmptyStr(time)){
	        	date = new Date(time);
				var year = date.getFullYear() ;
				var month = date.getMonth() + 1 ;
				month = m.util.padLeft(month.toString(),2);
				var day = m.util.padLeft(date.getDate().toString(), 2);
				var hour = m.util.padLeft(date.getHours().toString(),2);
				var min = m.util.padLeft(date.getMinutes().toString(),2);
				var sec = m.util.padLeft(date.getSeconds().toString(),2);
				date = year + month + day + hour + min + sec;
			}
			return date;
        },  
        /**
         * 日期時間自訂格式化
         * @param time 日期
         * @param format (ex:yyyy-MM-dd HH:mm:ss)
         */
        getCustomFormatDate:function(time,format){
        	var formatDate = format;
        		var date = new Date(time);
        		var year = date.getFullYear() ;
				var month = date.getMonth() + 1 ;
				month = m.util.padLeft(month.toString(),2);
				var day = m.util.padLeft(date.getDate().toString(), 2);
				var hour = m.util.padLeft(date.getHours().toString(),2);
				var min = m.util.padLeft(date.getMinutes().toString(),2);
				var sec = m.util.padLeft(date.getSeconds().toString(),2);
        		formatDate = formatDate.replace("yyyy",year);
        		formatDate = formatDate.replace("MM",month);
        		formatDate = formatDate.replace("dd",day);
        		formatDate = formatDate.replace("HH",hour);
        		formatDate = formatDate.replace("mm",min);
        		formatDate = formatDate.replace("ss",sec);
        	return formatDate;
        },
        /**
         * 字串補零
         * */
        padLeft: function(str, lenght) {
            if (str.length >= lenght) return str;
            else return m.util.padLeft("0" + str, lenght);
        },
        /**
         * 取得client端日期(民國年)
         *
         * @returns {String}
         */
        getROCDate: function(time) {
            var date = undefined;
            date = time ? new Date(time) : new Date();
            if (isIE) {
                return (date.getYear() - 1911) + "/" + (date.getMonth() + 1) + "/" + date.getDate();
            } else {
                return (date.getYear() + 1900 - 1911) + "/" + (date.getMonth() + 1) + "/" + date.getDate();
            }
        },
        /**
         * 取得中華民國時間
         *
         * @param time
         * @returns
         */
        getROCTime: function(time) {
            var date = undefined;
            date = time ? new Date(time) : new Date();
            if (isIE) {
                return "民國" + (date.getYear() - 1911) + "年" + (date.getMonth() + 1) + "月" + date.getDate() + "日 " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
            } else {
                return "民國" + (date.getYear() + 1900 - 1911) + "年" + (date.getMonth() + 1) + "月" + date.getDate() + "日 " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
            }
            return date;
        },
        /**
         * 取得url後面的parameter
         *
         * @param param
         * @returns
         */
        getURLParam: function(param) {
            var results = new RegExp('[\?&]' + param + '=([^&#]*)').exec(window.location.href);
            if (results == null) {
                return null;
            } else {
                return results[1] || 0;
            }
        },
        /**
         * 檢核email的格式
         *
         * @param email
         * @returns
         */
        checkEmail: function(email) {
            var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
            return re.test(email);
        },
        /**
         * 檢查是否為數字
         *
         * @param tel
         */
        checkNumber: function(tel) {
            var reg = /^\d+[.]?\d*$/;
            return reg.test(tel);
        },
        /**
         * 檢查是否為整數
         *
         * @param tel
         */
        checkIntegerNumber: function(tel) {
            var reg = /^\d+$/;
            return reg.test(tel);
        },
        /**
         * 檢查數字格式是否不超過小數點兩位
         *
         * @param number
         */
        checkDoubleNumber: function(number) {
        	re = /^[0-9]+(\.[0-9]{1,2})?$/;
            return re.test(number);
        },        
        formatDate: function(time) {
            var date = new Date(time);
            if (isIE) {
                return date.getYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate();
            } else {
                return (date.getYear() + 1900) + "/" + (date.getMonth() + 1) + "/" + date.getDate();
            }
        },
        /**
         * 金額千分位
         */
        getMoneyFormat: function(num) {
            var money = undefined;
            money = num.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
            return money;
        },
        getMoneyClassFormat: function() {
            var isNum = $(".num").htHG();
            $(".num").htHG($HG.util.getMoneyFormat(isNum));
        },
        blockUI: function(settings) {
            var _settings = {
                progressbarDiv: undefined,
                showStyle: 0, // 0:default, 1:progress bar
                ajaxStart: function() {
                    switch (_settings.showStyle) {
                        case 1:
                            $(_settings.progressbarDiv).htHG("<div id='progressbar' style='display:none;''><div class='progress-label' '></div></div>");
                            var progressbar = $("#progressbar"),
                                progressLabel = $(".progress-label");
                            progressbar.progressbar({
                                value: 0,
                                change: function() {
                                    progressLabel.text(progressbar.progressbar("value") + "%");
                                },
                                complete: function() {
                                    $.unblockUI();
                                }
                            });
                            $.blockUI({
                                message: progressbar
                            });
                            progress();
                            break;
                        default:
                            $.blockUI();
                            // setTimeout($.unblockUI, 2000);
                    }
                    //setTimeout( progress, 2000 );
                }
            };
            var progress = function() {
                var progressbar = $("#progressbar"),
                    progressLabel = $(".progress-label");
                var val = progressbar.progressbar("value") || 2;
                progressbar.progressbar("value", val + 10);
                if (val < 70) {
                    setTimeout(progress, 80);
                }
            }
            if (!$HG.util.isEmptyStr(settings)) {
                for (var key in _settings) {
                    _settings[key] = settings[key] == undefined ? _settings[key] : settings[key];
                }
            }
            $(document).ajaxStart(function() {
                _settings.ajaxStart();
            });
        },
        unblockUI: function(settings) {
            var _settings = {
                showStyle: 0, // 0:default, 1:progress bar
                ajaxStop: function() {
                    switch (_settings.showStyle) {
                        case 1:
                            var progressbar = $("#progressbar");
                            progressbar.progressbar("value", 100);
                            break;
                        default:
                            $.unblockUI();
                    }
                }
            };
            if (!$HG.util.isEmptyStr(settings)) {
                for (var key in _settings) {
                    _settings[key] = settings[key] == undefined ? _settings[key] : settings[key];
                }
            }
            $(document).ajaxStop(function() {
                _settings.ajaxStop();
            });
        },
        
        initTextPlaceholder: function() {
        	var rqs = $(".required");
            $.each(rqs, function(i, v) {
            	$(this).attr("placeholder", "必填");
            });
        },
        
    	//Blength() 傳回字串的byte長度
    	blength : function(string) { 
    		var arr = string.match(/[^\x00-\xff]/ig); 
    		return arr == null ? string.length : string.length + string.length; 
    	}
        
    };
    
    
    
    m.auth = {
        valid: function(customerCallback) {
            $(".alertMsg").htHG("");
            var va = $('[data-toggle="popover"]');
            $(va).removeAttr("data-content");
            $(va).removeAttr("data-container");
            //$(va).popover("hide"); 
            //$('.popover').remove();
            $(va).removeClass("warnning_input"); 
            $(va).removeAttr("data-toggle");            
            
            
            var flag = true;
            var rqs = $(".required");
            $.each(rqs, function(i, v) {
            	
                var val = $(this).val();
                if ($HG.util.isEmptyStr(val)) {
                   // $(this).after("<span class='alertMsg'>(此欄位必填)</span>");
                	$(this).attr("data-container","body");
                	$(this).attr("data-toggle","popover");
                	var errorMsg=$(this).attr("data-content")==undefined?"":$(this).attr("data-content");
                	$(this).attr("data-content", "(此欄位必填)");

                	//$(this).val("");
                    flag = false;
                }
                else {
                	console.log("destroy");
                	$(this).popover("destroy");
                }
            });
            var rocid = $(".rocid");
            $.each(rocid, function(i, v) {
                var val = $(this).val();
                if (!$HG.util.checkROCID(val)) {
                    //$(this).after("<span class='alertMsg'>格式錯誤</span>");
                	$(this).attr("data-container","body");
                	$(this).attr("data-toggle","popover");
                	var errorMsg=$(this).attr("data-content")==undefined?"":$(this).attr("data-content");
                	$(this).attr("data-content",errorMsg+"格式錯誤");
                    flag = false;
                }
            });
            var tel = $(".tel");
            $.each(tel, function(i, v) {
                var val = $(this).val();
                if (!$HG.util.checkNumber(val) || val.length < 5 ||  val.length > 8) {
                    //$(this).after("<span class='alertMsg'>格式錯誤，請全部填入數字</span>");
                	$(this).attr("data-container","body");
                	$(this).attr("data-toggle","popover");
                	var errorMsg=$(this).attr("data-content")==undefined?"":$(this).attr("data-content");
                	$(this).attr("data-content",errorMsg+"格式錯誤，請全部填入數字");
                    flag = false;
                }
            });
            var email = $(".email");
            $.each(email, function(i, v) {
                var val = $(this).val();
                if (val.length < 8 || !$HG.util.checkEmail(val)) {
                    //$(this).after("<span class='alertMsg'>email格式錯誤</span>");
                	$(this).attr("data-container","body");
                	$(this).attr("data-toggle","popover");
                	var errorMsg=$(this).attr("data-content")==undefined?"":$(this).attr("data-content");
                	$(this).attr("data-content",errorMsg+"email格式錯誤");
                    flag = false;
                }
            });
            var phone = $(".phone");
            $.each(phone, function(i, v) {
                var val = $(this).val();
                if (!$HG.util.checkNumber(val) || val.length != 10) {
                    //$(this).after("<span class='alertMsg'>格式錯誤，請全部填入數字</span>");
                	$(this).attr("data-container","body");
                	$(this).attr("data-toggle","popover");
                	var errorMsg=$(this).attr("data-content")==undefined?"":$(this).attr("data-content");
                	$(this).attr("data-content",errorMsg+"格式錯誤，請全部填入數字");
                    flag = false;
                }
            });
            var num = $(".number");
            $.each(num, function(i, v) {
                var val = $(this).val();
                if (!$HG.util.checkNumber(val)) {
                    //$(this).after("<span class='alertMsg'>格式錯誤，請全部填入數字</span>");
                	$(this).attr("data-container","body");
                	$(this).attr("data-toggle","popover");
                	var errorMsg=$(this).attr("data-content")==undefined?"":$(this).attr("data-content");
                	$(this).attr("data-content",errorMsg+"格式錯誤，請全部填入數字");
                    flag = false;
                }
            });
            var num = $(".intNumber");
            $.each(num, function(i, v) {
                var val = $(this).val();
                if (!$HG.util.checkIntegerNumber(val) || parseInt(val) < 1) {
                    //$(this).after("<span class='alertMsg'>格式錯誤，請填入大於1整數</span>");
                	$(this).attr("data-container","body");
                	$(this).attr("data-toggle","popover");
                	var errorMsg=$(this).attr("data-content")==undefined?"":$(this).attr("data-content");
                	$(this).attr("data-content",errorMsg+"格式錯誤，請填入大於1整數");
                    flag = false;
                }
            });
            var telArea = $(".telArea");
            $.each(telArea, function(i, v) {
                var val = $(this).val();
                if (!$HG.util.checkIntegerNumber(val) || val.length > 4 || val.length < 2) {
                    //$(this).after("<span class='alertMsg'>格式錯誤，請填入大於1整數</span>");
                	$(this).attr("data-container","body");
                	$(this).attr("data-toggle","popover");
                	var errorMsg=$(this).attr("data-content")==undefined?"":$(this).attr("data-content");
                	$(this).attr("data-content",errorMsg+"格式錯誤，請填入2~4碼數字區瑪");
                    flag = false;
                }
            });
            var compID = $(".compID");
            $.each(compID, function(i, v) {
                var val = $(this).val();
                if (!$HG.util.checkIntegerNumber(val) || val.length != 8) {
                    //$(this).after("<span class='alertMsg'>格式錯誤，請填入大於1整數</span>");
                	$(this).attr("data-container","body");
                	$(this).attr("data-toggle","popover");
                	var errorMsg=$(this).attr("data-content")==undefined?"":$(this).attr("data-content");
                	$(this).attr("data-content",errorMsg+"格式錯誤，請填入8碼數字");
                    flag = false;
                }
            });
            if (typeof(customerCallback) == "function") {
                flag = flag && customerCallback();
            }
            console.log(flag);
            if (!flag) {
            	
                
                va = $('[data-toggle="popover"]');
                $(va).popover({trigger:"focus"});                
                $(va).addClass("warnning_input");
                alert("請檢查輸入欄位是否有誤");
            }
            return flag;
        }
    };
})($HG);