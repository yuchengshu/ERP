<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

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
    <form id="form1" runat="server">
    <div class="login-box">
        <div class="login-logo">
            <%--<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />--%>
            <a href="javascript: void(0)"><b>華冠投顧ERP</b></a>
        </div>
        <div class="login-box-body">
 
            <div class="form-group has-feedback">
                <input type="text"  id="U_Num" class="form-control uInput  loginChineseCheck" placeholder="帳號" itemName="帳號"/>
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password"  id="U_PWD" class="form-control uInput" placeholder="密碼"/>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-6">
                    <button  id="loginBtn" class="btn btn-primary btn-block btn-flat"> 登入</button>
                </div>
                <div class="col-xs-6">    
                    <button id="cancelBtn" class="btn btn-basic btn-block btn-flat"> 取消</button>               
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery 2.1.3 -->
    <script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/common/CommonTool.js" type="text/javascript"></script>
     <script src="js/tool/tool.js" type="text/javascript"></script>
    <script src="js/MasterPage.js" type="text/javascript"></script>
    <script>
    
        //取得密碼
        var getPassword = function () {
 

            var url = "loginHandler.ashx";
            var u_Num = $("#U_Num").val();
            var u_PWD = $("#U_PWD").val();
            //var u_Num = "B1103011";
            //var u_PWD = "1qaz2wsx";
            var data = "U_Num=" + u_Num + "&U_PWD=" + u_PWD;
            var success = function (back) {
                location.href = "index.aspx?" + "U_Num=" + u_Num;
                //if (u_PWD != "") {
                //    if (back == "登入成功") {
                //        location.href = "index.aspx?" + "U_Num=" + u_Num;
                //    } else {
                //        alert("您輸入的帳號或密碼錯誤！請重新輸入。");
                //    }
                //} else {
                //    $("#U_PWD").val(back);
                //}
            };
            var error = function (e) { console.log("getPassword error=" + e) };
           $CommonTool.Ajax.send(url, data, success, error);
        };
        
        $(function () {
            
     
            $("#U_Num").on("change", getPassword);//利用是否能取得正確的密碼來判斷是否有登入成功
            $("#loginBtn").on('click', getPassword);//利用是否能取得正確的密碼來判斷是否有登入成功
            $("#cancelBtn").on('click', function () {
                $(".uInput").text();
            })
        });
    </script>
    </form>
</body>
</html>
