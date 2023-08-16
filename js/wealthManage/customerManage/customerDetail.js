
$customerDetail = {
	version : "1.0.0"
};

(function(m) {
     
    m.getAnalystList = {
        todo: function () {
            alert('call customerManageHandler');
            var url = "customerManageHandler.ashx";
            var data = "action=getAnalystList";
            var returnBack = undefined;
            var success = function (back) {
                var json = JSON.parse(back);
                return json;
            };
            var error = function (e) {
                console.log("customerManageHandler.ashx 方法:getAnalystList ="+e);
            };
            $Common.ajax.todo(url, data, success, error);//<======================
        }
    };

})($customerDetail);