<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html>
<head runat="server">
<meta charset="UTF-8">
    <title>華冠投顧ERP |  登入</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
</head>
<body  style="font-family:Microsoft JhengHei;" class="">
   <span id="index" style="font-size:400px;"></span><br /><span id="indexTime" style="font-size:100px;"></span>

    <!-- jQuery 2.1.3 -->
    <script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/common/CommonTool.js" type="text/javascript"></script>
     <script src="js/tool/tool.js" type="text/javascript"></script>
    <script src="js/MasterPage.js" type="text/javascript"></script>
    <script>
        var settnt = undefined;
        //取得密碼
        var getData = function () {
            var url = "testHandler.ashx";
            var data = "";
            var success = function (back) {
                text_M("#index", back);
                text_M("#indexTime", getNowTime_M());
                Log_M(back);
                var num= parseInt(back)
                if (num < 11950) {
                    clearInterval(settnt);
                    window.open('alertTest.aspx', 'Yahoo', config = 'height=800,width=1600');

                }
            };
            var error = function (e) { console.log("getPassword error=" + e) };
           $CommonTool.Ajax.send(url, data, success, error);
        };
        
        $(function () {
     
            function show() {
                location.replace('https://info512.taifex.com.tw/Future/ImgChartDetail.ashx?type=1&contract=TX010');
                setTimeout(function () {
                    getData();
                }, 4000);
            }
          settnt = setInterval(show, 5000);// 注意函数名没有引号和括弧！
        });
    </script>
</body>
</html>
