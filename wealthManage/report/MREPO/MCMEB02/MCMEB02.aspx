<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MCMEB02.aspx.cs" Inherits="wealthManage_report_MREPO_MCMEB02_MCMEB02" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-wrapper" style="min-height: 616px;">
        <!-- Content Header (Page header) -->
        <section class="content-header"></section>
        <!-- Main content -->
        <section class="content">
        <!-- Main row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-danger">
                        <div class="box-header">
                            <i class="fa fa-list-alt"></i>
                            <h1 class="box-title"><b>ERP &gt;  報表區 &gt;業績總表</b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-hover" id="">
                            <thead id="">
                                <tr class="active">
                                    <th class="width20percent">
                                        <label>列表方式:</label>
                                        <select id="Report_Item" class="form-control"><option value="1">總表</option><option value="2">細表</option><option value="3">分析師</option><option value="4">責任助理</option></select>
                                    </th>
                                   
                                    <th class="width20percent">
                                        <label>起始日:</label>
                                        <input type="text" id="StartDate" class="datepicker form-control " placeholder="開始日">
                                    </th>
                                    <th class="width20percent">
                                        <label>結束日:</label>
                                        <input type="text" id="EndDate" class="datepicker form-control " placeholder="結束日">
                                    </th>
                                     <th class="width20percent">
                                        <button type="button" class="btn btn-info btn-flat qPer" id="search">查詢</button>
                                        <button type="button" class="btn btn-info btn-flat" id="print">列印</button>
                                    </th>
                                    <th class="width20percent">
                                       
                                    </th>
                                   
                                    
                                    
          
                                </tr>
                                <tr class="active">
                                      <th class="width20percent">
                                        <label>公司:</label>
                                        <select id="ComID" class="form-control ComIDUMDEP">
                                            <option value="">不限</option>
                                            <option value="HG01">華冠-營1</option>
                                            <option value="HG02">華冠-投資</option>
                                            <option value="HG03">華冠-財富</option>
                                            <option value="HG04">華冠-理財</option>
                                            <option value="HG05">華冠-營2</option>
                                            <option value="HG06">華冠-網事</option>
                                        </select>
                                    </th>
                                    <th class="width20percent">
                                        <label>部門:</label>

                                        <select id="UMDEP" class="form-control ComIDUMDEP">
                                            <option value="">不限</option>
                                            
                                        </select>
                                    </th>
                                    <th class="width20percent">
                                        <label>分析師:</label>
                                        <select id="MP" class="form-control MPMclass" itemId="#T_Item" disabled="disabled"></select>
                                    </th>
                                    <th class="width20percent">
                                        <label>會員總類:</label>
                                         <select class="form-control MPMclass" id="T_Item" disabled="disabled">
                                             <option value="">請選擇</option>
                                         </select>
                                    </th>
                                    <th class="width20percent">
                                        <label>責任助理:</label>
                                        
                                        <select id="MC" class="form-control" disabled="disabled"></select>
                                    </th>
                                </tr>
                            </thead>
                        </table>
                        <div id="printArea">
                            <div class="startHide printArea" id="totalPerformanceTable">
                            </div>
                            <div class="startHide printArea" id="detailPerformanceTable" >
                            </div>
                            <div class="startHide printArea" id="assistantDetailPerformanceTable">
                            </div>
                         </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        var StartDateTime = undefined;
        var EndDateTime = undefined;
        var Date_C = undefined;
        var AnalystArr = [];
        var TotalPerformanceDataList = [];
        var TotalPerformanceData = function (depName,back) {
            return { "depName": depName, "back": back };
        }
        var TotalPerformanceDataListCount = 0;
        var DetailPerformanceDataList = [];
        var AssistantDetailPerformanceDataList = [];
       
        var DetailPerformanceDataListLastU_MDEP = undefined;
        var ComIDtotalMoneyList = [];
        var ComIDtotalMoney = function (ComID) {
            return {"ComID":ComID,"totalMoney":""};
        }
        var reportHandlerMCMEB02Url_G = "reportHandlerMCMEB02.ashx";
        var reportItemChange = function () {
            var type = val_M(this);
            switch (type) {
                case "1":
                    disabledFalse_M(".ComIDUMDEP");

                    disabledTrue_M("#MC");
                    break;
                case "2":
                    disabledFalse_M(".ComIDUMDEP");

                    disabledTrue_M("#MC");
                    break;
                case "3":
                    disabledTrue_M(".ComIDUMDEP");
                    disabledFalse_M(".MPMclass");
                    disabledTrue_M("#MC");
                    break;
                case "4":
                    disabledTrue_M(".MPMclass");
                    disabledFalse_M("#MC");
                    break;
                case "5":
                    disabledTrue_M(".MPMclass");
                    disabledFalse_M("#MC");
                    
                    break;
            }
           
        };
        var getResponsibleAssistantListHtmlTagOption = function () {
            var ComID = val_M("#ComID");
            var UMDEP = val_M("#UMDEP");
            if (!isEmptyStr(ComID)) {
                $Common.MUSER.getResponsibleAssistantListHtmlTagOption(CommonHandlerUrl_M, "#MC", ComID, "option", null, UMDEP);
            }
            
        };
        
        var getComIDUMDEPhtmlTagOption = function () {
            empty_M("#UMDEP");
            var ComID = val_M(this);
            var sb = new StringBuilder_M();
            sb.append("<option value=''>不限</option>");
            $.each(ComIDUMDEPlist_M, function (i, v) {
                if (ComID == v[0]) {
                    sb.append("<option value='");
                    sb.append(v[1]);
                    sb.append("'>");
                    sb.append(v[2]);
                    sb.append("</option>");
                }
            });
            append_M("#UMDEP", sb.toString());
            $Common.MUSER.getResponsibleAssistantListHtmlTagOption(CommonHandlerUrl_M, "#MC", ComID, "option");
        };
        var getComIDcode = function (num) {
            var back = undefined;
            switch (num) {
                case 0:
                    back = "HG01";
                    break;
                case 1:
                    back = "HG01";
                    break;
                case 2:
                    back = "HG05";
                    break;
                case 3:
                    back = "HG05";
                    break;
                case 4:
                    back = "HG02";
                    break;
                case 5:
                    back = "HG02";
                    break;
                case 6:
                    back = "HG03";
                    break;
                case 7:
                    back = "HG03";
                    break;
                case 8:
                    back = "HG04";
                    break;
                case 9:
                    back = "HG04";
                    break;
                case 10:
                    back = "HG06";
                    break;
            }
            return back;
        };
        var getUMDEPcode = function (num) {
            var back = 0;
            switch (num) {
                case 0:
                    back = "0002";
                    break;
                case 1:
                    back = "0006";
                    break;
                case 2:
                    back = "0015";
                    break;
                case 3:
                    back = "0016";
                    break;
                case 4:
                    back = "0007";
                    break;
                case 5:
                    back = "0008";
                    break;
                case 6:
                    back = "0011";
                    break;
                case 7:
                    back = "0012";
                    break;
                case 8:
                    back = "0013";
                    break;
                case 9:
                    back = "0014";
                    break;
                case 10:
                    back = "0017";
                    break;

            }
            return back;
        };
        //============================================================================總表start
        var getDepOrder = function (ComID, U_MDEP) {
            var back = 0;
            switch (ComID) {
                case "HG01":
                    if (U_MDEP == "0002") {
                        back = 0;
                    } else if (U_MDEP == "0006") {
                        back = 1;
                    }
                    break;
                case "HG05":
                    if (U_MDEP == "0015") {
                        back = 2;
                    } else if (U_MDEP == "0016") {
                        back = 3;
                    }
                    break;
                case "HG02":
                    if (U_MDEP == "0007") {
                        back = 4;
                    } else if (U_MDEP == "0008") {
                        back = 5;
                    }
                    break;
                case "HG03":
                    if (U_MDEP == "0011") {
                        back = 6;
                    } else if (U_MDEP == "0012") {
                        back = 7;
                    }
                    break;
                case "HG04":
                    if (U_MDEP == "0013") {
                        back = 8;
                    } else if (U_MDEP == "0014") {
                        back = 9;
                    }
                    break;
                case "HG06":
                    back = 10;
                    break;
            }
            return back;

        };
        var addTotalTotalTF = function(ComID,U_MDEP)
        {
            var backBool = false;
            switch (ComID)
            {
                case "HG01":
                    if (U_MDEP == "0006")
                    {
                        backBool = true;
                    }
                    break;
                case "HG05":
                    if (U_MDEP == "0016")
                    {
                        backBool = true;
                    }
                    break;
                case "HG02":
                    if (U_MDEP == "0008")
                    {
                        backBool = true;
                    }
                    break;
                case "HG03":
                    if (U_MDEP == "0012")
                    {
                        backBool = true;
                    }
                    break;
                case "HG04":
                    if (U_MDEP == "0014") {
                        backBool = true;
                    }
                    break;
                case "HG06":
                    backBool = true;
                    break;
            }
            return backBool;
        };
        var makeTotalPerformanceTabel = function (startDate, endDate) {
            Log_M("Start makeTotalPerformanceTabel");
            var ComID = undefined;
            var U_MDEP = undefined;
           
            var sb = new StringBuilder_M();
            sb.append("<div class='textAlignCenter'>");
            sb.append("<h3 class='table table-hover'>業績總表</h3>");
            sb.append("</div>");
            sb.append("<p><span>日期</span>:");
            sb.append(startDate);
            sb.append(" - ");
            sb.append(endDate);
            sb.append("</p>");
            $.each(TotalPerformanceDataList, function (k, jj) {
                var json = jsonParse_M(TotalPerformanceDataList[k].back);
                var num = json[0].length;
                var jsonlength = json.length-1;
                
                ComID = getComIDcode(k);
                U_MDEP = getUMDEPcode(k);
                
                sb.append("<h4>");
                sb.append(TotalPerformanceDataList[k].depName);
                sb.append("</h4>");
                sb.append("<table class='table table-hover'>");
                sb.append("<thead>");
                sb.append("<tr class ='bgBlue'>");
                sb.append("<th class='textAlignCenter'></th>");
                $.each(json, function (i, v) {
                    sb.append("<th class='textAlignCenter' colspan='3'>");
                    sb.append(json[i][0].MP_Name);
                    AnalystArr[i] = json[i][0].MP;
                    sb.append("</th>");
                });
                sb.append("</tr>");
                sb.append("<tr class ='bgBlue'>");
                sb.append("<th class='textAlignCenter '></th>");
                $.each(json, function (i, v) {
                    sb.append("<th class='textAlignCenter  '>總</th>");
                    sb.append("<th class='textAlignCenter  '>新</th>");
                    sb.append("<th class='textAlignCenter  '>額</th>");
                });
                sb.append("</tr>");
                sb.append("</thead>");
                sb.append("<tbody>");
                for (var j = 0; j < num; j++)
                {
                    if (j == num - 1) {
                        sb.append("<tr class ='bgBlue'>");
                    } else {
                        sb.append("<tr>");
                    }
                    
                    $.each(json, function (i, v) {
                        if (i == 0) {
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(v[j].MC_Name);
                            sb.append("</td>");
                        }
                        if (j == num - 1) {
                            sb.append("<td class='textAlignCenter colorBlue'>");
                        } else {
                            sb.append("<td class='textAlignCenter'>");
                        }
                        
                        sb.append(getMoneyFormat_M(Math.round(v[j].totalTradeCount)));
                        sb.append("</td>");
                        if (j == num - 1) {
                            sb.append("<td class='textAlignCenter colorBlue'>");
                        } else {
                            sb.append("<td class='textAlignCenter'>");
                        }
                        sb.append(getMoneyFormat_M(Math.round(v[j].newAddTradeCount)));
                        sb.append("</td>");
                        if (v[j].MC_Name == "合計") {
                            sb.append("<td class='textAlignCenter ComIDmpTotal colorBlue' ComIDMP='");
                            sb.append(ComID);
                            sb.append(v[j].MP);
                            sb.append("' ComIDmpTotalMoney='");
                            sb.append(v[j].newAddTradeMoney);
                            sb.append("' ComID='");
                            sb.append(ComID);
                            sb.append("'>");
                        } else {
                            sb.append("<td class='textAlignCenter'>");
                        }
                        
                                
                        sb.append(getMoneyFormat_M(Math.round(v[j].newAddTradeMoney)));
                        sb.append("</td>");
                    });
                    sb.append("</tr>");
                            
                }
                var tf = addTotalTotalTF(ComID, U_MDEP);
                if (tf) {
                    sb.append("<tr class ='bgBlue'>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append("總合計");
                    sb.append("</td>");
                    $.each(json, function (i, v) {
                        sb.append("<td class='textAlignCenter colorBlue'></td>");
                        sb.append("<td class='textAlignCenter colorBlue'></td>");
                        if (i == (json.length - 1)) {
                            sb.append("<td class='textAlignCenter total colorBlue' totalMoney='' id='");
                        } else {
                            sb.append("<td class='textAlignCenter colorBlue' id='");
                        }
                        
                        sb.append(ComID);
                        if (i < (json.length - 1)) {
                            if (isEmptyStr(AnalystArr[i])) {
                                $.each(AnalystArr, function (i, v) {
                                    sb.append(AnalystArr[i]);
                                })
                            } else {
                                sb.append(AnalystArr[i]);
                            }
                        }
                        sb.append("'>");
                    });
                    sb.append("</tr>");
                }
                sb.append("</tbody>");
                sb.append("</table>");
            });
            sb.append("<table class='table table-hover'>");
            sb.append("<thead>");
            sb.append("<tr class ='bgBlue'>");
            sb.append("<th class='textAlignCenter'>總業績</th>");
            sb.append("<th class='textAlignCenter'><span>入帳金額總計&nbsp;:&nbsp;</span><span id='total' class='colorBlue'></span></th>");
            sb.append("</tr>");
            sb.append("</thead>");
            sb.append("</table>");
            empty_M("#totalPerformanceTable");
            append_M("#totalPerformanceTable", sb.toString());
                var jsons = $(".ComIDmpTotal");
                var ComIDMP = undefined;
                var ComIDmpTotalMoney = 0;
                var idName = undefined;
                var tempComIDMP = undefined;
                var totalMoney = 0;
                var tempComIDmpTotalMoney =undefined;
                $.each(jsons, function (i, v) {
                    ComIDMP = attr_M(v, "ComIDMP");
                   
                    idName = ComIDMP;
                    $.each(jsons, function (ii, vv) {
                        tempComIDMP = attr_M(vv, "ComIDMP");
                        if (ComIDMP == tempComIDMP) {
                            tempComIDmpTotalMoney = attr_M(vv, "ComIDmpTotalMoney");
                            if (isEmptyStr(tempComIDmpTotalMoney))
                            {
                                tempComIDmpTotalMoney = "0";
                            }
                            ComIDmpTotalMoney += parseFloat(tempComIDmpTotalMoney);
                        }
                    });
                    attr_M("#" + idName, "totalMoney", ComIDmpTotalMoney);
                    text_M("#" + idName, getMoneyFormat_M(Math.round(ComIDmpTotalMoney)));
                    ComIDMP = undefined;
                    ComIDmpTotalMoney = 0;
                    idName = undefined;
                    tempComIDMP = undefined;
                });
                var totals = $(".total");
                $.each(totals, function (i,v) {
                    totalMoney += parseFloat(attr_M(v, "totalMoney"));
                    Log_M("totalMoney=" + totalMoney);
                });
                text_M("#total", getMoneyFormat_M(Math.round(totalMoney)));
                show_M("#totalPerformanceTable");
                TotalPerformanceDataList = [];
                unBlockUI_M();
          
        };
        var getTotalPerformanceTable = function (startDate, endDate, U_MDEP, ComID,DataListnum) {
            Log_M("Start  getTotalPerformanceTable");
            TotalPerformanceDataListCount += 1;
            var data = "StartDate=" + startDate + "&EndDate=" + endDate + "&U_MDEP=" + U_MDEP + "&ComID=" + ComID + "&action=getTotalPerformanceTable";
            var success = function (back) {
                Log_M("getTotalPerformanceTable back" + back);
                var depName = getDepName_M(ComID, U_MDEP);
                var tpd = new TotalPerformanceData(depName,back);
                TotalPerformanceDataList[DataListnum] = tpd;
                if (TotalPerformanceDataList.length == TotalPerformanceDataListCount) {
                    makeTotalPerformanceTabel(startDate, endDate);
                    TotalPerformanceDataListCount = 0;
                    }
            };
            var error = function (e) { Log_M("getTotalPerformanceTable error=" + e); unBlockUI_M(); };

            ajax_M(reportHandlerMCMEB02Url_G, data, success, error);
        };
        
        var getAllTotalPerformanceTable = function (startDate, endDate, U_MDEP, ComID) {
            Log_M("Start getAllTotalPerformanceTable");
            if (isEmptyStr(ComID)) {
                $.each(ComIDUMDEPlist_M, function (i, v) {
                    getTotalPerformanceTable(startDate, endDate, v[1], v[0],i);
                });
            } else {
                if (isEmptyStr(U_MDEP)) {
                    $.each(ComIDUMDEPlist_M, function (i, v) {
                        if (ComID == v[0]) {
                            getTotalPerformanceTable(startDate, endDate, v[1], v[0],i);
                        }
                    });
                } else {
                    getTotalPerformanceTable(startDate, endDate, U_MDEP, ComID,0);
                }
            }
            
        }
        //============================================================================總表end
        //============================================================================細表start
        var makeDetailPerformanceTabel = function (startDate, endDate) {
            var ComID = undefined;
            var U_MDEP = undefined;
            var tempMid = undefined;
            var totalT_PayMoney = 0;
            var totalT_PayMoneyDouble = 0;
            var comidTotalT_PayMoney = 0;
            var comidTotalT_PayMoneyDouble = 0;
            var AllTotalT_PayMoney = 0;
            var AllTotalT_PayMoneyDouble = 0;
            var tempT_PayMoney = 0;
            var tempT_PayMoneyDouble = 0;
            var sb = null;
            $.each(DetailPerformanceDataList, function (k, kk) {
                sb = new StringBuilder_M();
                var json = jsonParse_M(DetailPerformanceDataList[k]);
                ComID = getComIDcode(k);
                U_MDEP = getUMDEPcode(k);
                if (k == 0) {
                    sb.append("<div class='textAlignCenter'>");
                    sb.append("<h3 class='table table-hover'>業績明細表</h3>");
                    sb.append("</div>");
                    sb.append("<p><span>日期</span>:");
                    sb.append(startDate);
                    sb.append(" - ");
                    sb.append(endDate);
                    sb.append("</p>");
                }
                sb.append("<table class='table table-hover'>");
                sb.append("<thead>");
                sb.append("<tr class ='bgBlue'><th class='textAlignCenter'>");
                sb.append(getDepName_M(ComID, U_MDEP));
                sb.append("</th></tr>");
                sb.append("<tr class ='bgBlue'>");
                sb.append("<th class='textAlignCenter'>序號</th>");
                sb.append("<th class='textAlignCenter'>入帳日</th>");
                sb.append("<th class='textAlignCenter'>客戶姓名</th>");
                sb.append("<th class='textAlignCenter'>會員編號</th>");
                sb.append("<th class='textAlignCenter'>分析師</th>");
                sb.append("<th class='textAlignCenter'>種類</th>");
                sb.append("<th class='textAlignCenter'>責任助理</th>");
                sb.append("<th class='textAlignCenter'>入會金額</th>");
                sb.append("<th class='textAlignCenter'>入賬細節</th>");

                sb.append("</tr>");
                sb.append("</thead>");
                sb.append("<tbody>");
                $.each(json, function (i, v) {

                    sb.append("<tr>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(i + 1);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(split_M(v.T_AccountDate, " ", 0));
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.M_Name);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.M_Num);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.MP_Name);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.T_ItemName);
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append(v.mc_name);
                    sb.append("</td>");

                    if (hasStr_M(v.T_PayMoney, "-")) {
                        sb.append("<td class='textAlignCenter colorRed'>");
                    } else {
                        sb.append("<td class='textAlignCenter'>");
                    }
                    tempT_PayMoney = parseFloat(v.T_PayMoney);
                    totalT_PayMoney += tempT_PayMoney;
                    comidTotalT_PayMoney += tempT_PayMoney;
                    AllTotalT_PayMoney += tempT_PayMoney;
                    sb.append(getMoneyFormat_M(Math.round(v.T_PayMoney)));
                    sb.append("</td>");
                    sb.append("<td class=''>");
                    sb.append("<div ><span class='textAlignCenter span1'>");
                    sb.append(v.Pay_TypeName);
                    if (v.INV_open_Item == "2") {
                        sb.append("<span class='colorGreen'>(手開)</span>");
                    }
                    sb.append("</span>");
                    sb.append("  ");
                    sb.append("<span class='textAlignCenter span2'>");
                    sb.append(v.mc_name);
                    sb.append("</span>");
                    sb.append("  ");
                    tempT_PayMoneyDouble = parseFloat(v.T_PayMoneyDouble);
                    totalT_PayMoneyDouble += tempT_PayMoneyDouble;
                    comidTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                    AllTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                    if (hasStr_M(v.T_PayMoneyDouble, "-")) {
                        sb.append("<span class='textAlignCenter span3 colorRed'>");
                    } else {
                        sb.append("<span class='textAlignCenter span3'>");
                    }

                    sb.append(getMoneyFormat_M(Math.round(v.T_PayMoneyDouble)));
                    sb.append("</span></div>");
                    if (!isEmptyStr(v.Pay_TypeName2)) {
                        sb.append("<div class=''><span class='textAlignCenter span1'>");
                        sb.append(v.Pay_TypeName2);
                        if (v.INV_open_Item == "2") {
                            sb.append("<span class='colorGreen'>(手開)</span>");
                        }
                        sb.append("</span>");
                        sb.append("  ");
                        sb.append("<span class='textAlignCenter span2'>");
                        sb.append(v.mc_name2);
                        sb.append("</span>");
                        sb.append("  ");
                        tempT_PayMoneyDouble = parseFloat(v.T_PayMoneyDouble2);
                        totalT_PayMoneyDouble += tempT_PayMoneyDouble;
                        comidTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                        AllTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                        if (hasStr_M(v.T_PayMoneyDouble2, "-")) {
                            sb.append("<span class='textAlignCenter span3 colorRed'>");
                        } else {
                            sb.append("<span class='textAlignCenter span3'>");
                        }
                        sb.append(getMoneyFormat_M(Math.round(v.T_PayMoneyDouble2)));
                        sb.append("</span></div>");
                    }
                    if (!isEmptyStr(v.Pay_TypeName3)) {

                        sb.append("<div class=''><span class='textAlignCenter span1'>");
                        sb.append(v.Pay_TypeName3);
                        if (v.INV_open_Item == "2") {
                            sb.append("<span class='colorGreen'>(手開)</span>");
                        }
                        sb.append("</span>");
                        sb.append("  ");
                        sb.append("<span class='textAlignCenter span2'>");
                        sb.append(v.mc_name3);
                        sb.append("</span>");
                        sb.append("  ");
                        tempT_PayMoneyDouble = parseFloat(v.T_PayMoneyDouble3);
                        totalT_PayMoneyDouble += tempT_PayMoneyDouble;
                        comidTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                        AllTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                        if (hasStr_M(v.T_PayMoneyDouble3, "-")) {
                            sb.append("<span class='textAlignCenter span3 colorRed'>");
                        } else {
                            sb.append("<span class='textAlignCenter span3'>");
                        }
                        sb.append(getMoneyFormat_M(Math.round(v.T_PayMoneyDouble3)));
                        sb.append("</span></div>");
                    }
                    sb.append("</td>");
                    sb.append("</tr>");
                });
                sb.append("<tr class ='bgBlue'>");
                sb.append("<td class='textAlignCenter'>");
                sb.append("合計");
                sb.append("</td>");
                sb.append("<td class='textAlignCenter'>");
                sb.append("</td>");
                sb.append("<td class='textAlignCenter'>");
                sb.append("</td>");
                sb.append("<td class='textAlignCenter'>");
                sb.append("</td>");
                sb.append("<td class='textAlignCenter'>");
                sb.append("</td>");
                sb.append("<td class='textAlignCenter'>");
                sb.append("</td>");
                sb.append("<td class='textAlignCenter'>");
                sb.append("</td>");
                sb.append("<td class='textAlignCenter  colorBlue'>");
                sb.append(getMoneyFormat_M(Math.round(totalT_PayMoney)));
                totalT_PayMoney = 0;
                sb.append("</td>");
                sb.append("<td class=''>");
                sb.append("<div ><span class='textAlignCenter span1'>");
                sb.append("</span>");
                sb.append("  ");
                sb.append("<span class='textAlignCenter span2'>");
                sb.append("</span>");
                sb.append("  ");
                sb.append("<span class='textAlignCenter span4 colorBlue'>");

                sb.append(getMoneyFormat_M(Math.round(totalT_PayMoneyDouble)));
                totalT_PayMoneyDouble = 0;
                sb.append("</span></div>");
                sb.append("</td>");
                sb.append("</tr>");
                
                var tf = addTotalTotalTF(ComID, U_MDEP);
                if (tf) {
                    sb.append("<tr class ='bgBlue'>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append("部門合計");
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter  colorBlue'>");
                    sb.append(getMoneyFormat_M(Math.round(comidTotalT_PayMoney)));
                    comidTotalT_PayMoney = 0;
                    sb.append("</td>");
                    sb.append("<td class=''>");
                    sb.append("<div ><span class='textAlignCenter span1'>");
                    sb.append("</span>");
                    sb.append("  ");
                    sb.append("<span class='textAlignCenter span2'>");
                    sb.append("</span>");
                    sb.append("  ");
                    sb.append("<span class='textAlignCenter span4 colorBlue'>");

                    sb.append(getMoneyFormat_M(Math.round(comidTotalT_PayMoneyDouble)));
                    comidTotalT_PayMoneyDouble = 0;
                    sb.append("</span></div>");
                    sb.append("</td>");
                    sb.append("</tr>");
                }
                sb.append("</tbody>");
                sb.append("</table>");
                if (U_MDEP == "0017") {
                    sb.append("<table class='table table-hover'>");
                    sb.append("<thead>");
                    sb.append("<tr class ='bgBlue'>");
                    sb.append("<th class='textAlignCenter'>總業績</th>");
                    sb.append("<th class='textAlignCenter'></th>");
                    sb.append("<th class='textAlignCenter'></th>");
                    sb.append("<th class='textAlignCenter'</th>");
                    sb.append("<th class='textAlignCenter'></th>");
                    sb.append("<th class='textAlignCenter'>入會金額總計&nbsp;：&nbsp;</th>");
                    
                    sb.append("<th class='textAlignCenter colorBlue'>");
                    sb.append(getMoneyFormat_M(Math.round(AllTotalT_PayMoney)));
                    sb.append("</th>");
                    sb.append("<th class='textAlignCenter'>入帳金額總計&nbsp;：&nbsp;</th>");
                    sb.append("<th class='textAlignCenter'>");
                    sb.append("<span class='textAlignCenter colorBlue'>");
                    sb.append(getMoneyFormat_M(Math.round(AllTotalT_PayMoneyDouble)));
                    sb.append("</span>");
                    sb.append("</th>");
                    sb.append("</tr>");
                    sb.append("</thead>");
                    sb.append("</table>");
                }
                append_M("#detailPerformanceTable", sb.toString());
                
                show_M("#detailPerformanceTable");
                unBlockUI_M();
            });
        };
        var getDetailPerformanceTable = function (startDate, endDate, U_MDEP, ComID, nextU_MDEP, Num) {
            var data = "StartDate=" + startDate + "&EndDate=" + endDate + "&U_MDEP=" + U_MDEP + "&ComID=" + ComID + "&action=getDetailPerformanceTable";
            var success = function (back) {
                empty_M("#detailPerformanceTable");
                var num = 0;
                if (isEmptyStr(Num)) {
                    num = getDepOrder(ComID, U_MDEP);
                } else {
                    num = Num;
                }
               
                DetailPerformanceDataList[num] = back;
                
                if (isEmptyStr(nextU_MDEP)) {
                    if (DetailPerformanceDataListLastU_MDEP == U_MDEP) {
                        makeDetailPerformanceTabel(startDate, endDate);
                    } else {
                        if (DetailPerformanceDataList.length == ComIDUMDEPlist_M.length) {
                            makeDetailPerformanceTabel(startDate, endDate);
                        }
                    }
                } else {
                    getDetailPerformanceTable(startDate, endDate, nextU_MDEP, ComID,emptyValue_M,1);
                }
            };
            var error = function (e) { Log_M("getDetailPerformanceTable error=" + e); unBlockUI_M(); };

            ajax_M(reportHandlerMCMEB02Url_G, data, success, error);
        };
        var getAllDetailPerformanceTable = function (startDate, endDate, U_MDEP, ComID) {
            if (isEmptyStr(ComID)) {
                $.each(ComIDUMDEPlist_M, function (i, v) {
                    getDetailPerformanceTable(startDate, endDate, v[1], v[0]);
                });
                
            } else {
                if (isEmptyStr(U_MDEP)) {
                    var tempU_MDEP = [];
                    var num = 0;
                    $.each(ComIDUMDEPlist_M, function (i, v) {
                        if (ComID == v[0]) {
                            tempU_MDEP[num] = v[1];
                            DetailPerformanceDataListLastU_MDEP = v[1];
                            num += 1;
                        }
                    });
                    
                    getDetailPerformanceTable(startDate, endDate, tempU_MDEP[0], ComID, tempU_MDEP[1],0);
                } else {
                    DetailPerformanceDataListLastU_MDEP = U_MDEP;
                    getDetailPerformanceTable(startDate, endDate, U_MDEP, ComID);
                }
            }
        }
        //============================================================================細表end
        //============================================================================分析師start
        var makeAnalystDetailPerformanceTabel = function (ComID, U_MDEP, MP, T_Item, startDate, endDate) {
            var ComID = undefined;
            var U_MDEP = undefined;
            var tempMid = undefined;
            var totalT_PayMoney = 0;
            var totalT_PayMoneyDouble = 0;
            var comidTotalT_PayMoney = 0;
            var comidTotalT_PayMoneyDouble = 0;
            var AllTotalT_PayMoney = 0;
            var AllTotalT_PayMoneyDouble = 0;
            var tempT_PayMoney = 0;
            var tempT_PayMoneyDouble = 0;
            var sb = null;
            var checkType = undefined;
            
            $.each(DetailPerformanceDataList, function (k, kk) {
               
                sb = new StringBuilder_M();
                if (k == 0) {
                    sb.append("<div class='textAlignCenter'>");
                    sb.append("<h3 class='table table-hover'>業績總表-分析師</h3>");
                    sb.append("</div>");
                    sb.append("<p><span>日期</span>:");
                    sb.append(startDate);
                    sb.append(" - ");
                    sb.append(endDate);
                    sb.append("</p>");
                }
                var json = jsonParse_M(DetailPerformanceDataList[k]);
                var goNext = false;
                $.each(json, function (p, pp) {
                    Log_M("pp.MP=" + pp.MP+"&&MP="+MP);
                    if (!isEmptyStr(MP)) {
                        if (pp.MP == MP) {
                            if (!isEmptyStr(T_Item)) {
                                if (pp.T_Item == T_Item) {
                                    goNext = true;
                                    checkType = "MPT_Item";
                                }
                            } else {
                                goNext = true;
                                checkType = "MP";
                            }
                        }
                    } else {
                        goNext = true;
                    }
                });
                Log_M("checkType=" + checkType);
                Log_M("goNext=" + goNext);
                if (goNext) {
                    ComID = getComIDcode(k);
                    U_MDEP = getUMDEPcode(k);
                   
                    sb.append("<table class='table table-hover'>");
                    sb.append("<thead>");
                    sb.append("<tr class ='bgBlue'><th class='textAlignCenter'>");
                    sb.append(getDepName_M(ComID, U_MDEP));
                    sb.append("</th></tr>");
                    sb.append("<tr class ='bgBlue'>");
                    sb.append("<th class='textAlignCenter'>序號</th>");
                    sb.append("<th class='textAlignCenter'>入帳日</th>");
                    sb.append("<th class='textAlignCenter'>客戶姓名</th>");
                    sb.append("<th class='textAlignCenter'>會員編號</th>");
                    sb.append("<th class='textAlignCenter'>分析師</th>");
                    sb.append("<th class='textAlignCenter'>種類</th>");
                    sb.append("<th class='textAlignCenter'>責任助理</th>");
                    sb.append("<th class='textAlignCenter'>入會金額</th>");
                    sb.append("<th class='textAlignCenter'>入賬細節</th>");

                    sb.append("</tr>");
                    sb.append("</thead>");
                    sb.append("<tbody>");
                    var num = 1;
                    $.each(json, function (i, v) {
                        if (checkType == "MP") {
                            if (v.MP == MP) {
                                sb.append("<tr>");
                                sb.append("<td class='textAlignCenter'>");
                                sb.append(num);
                                num += 1
                                sb.append("</td>");
                                sb.append("<td class='textAlignCenter'>");
                                sb.append(split_M(v.T_AccountDate, " ", 0));
                                sb.append("</td>");
                                sb.append("<td class='textAlignCenter'>");
                                sb.append(v.M_Name);
                                sb.append("</td>");
                                sb.append("<td class='textAlignCenter'>");
                                sb.append(v.M_Num);
                                sb.append("</td>");
                                sb.append("<td class='textAlignCenter'>");
                                sb.append(v.MP_Name);
                                sb.append("</td>");
                                sb.append("<td class='textAlignCenter'>");
                                sb.append(v.T_ItemName);
                                sb.append("</td>");
                                sb.append("<td class='textAlignCenter'>");
                                sb.append(v.mc_name);
                                sb.append("</td>");

                                if (hasStr_M(v.T_PayMoney, "-")) {
                                    sb.append("<td class='textAlignCenter colorRed'>");
                                } else {
                                    sb.append("<td class='textAlignCenter'>");
                                }
                                tempT_PayMoney = parseFloat(v.T_PayMoney);
                                totalT_PayMoney += tempT_PayMoney;
                                comidTotalT_PayMoney += tempT_PayMoney;
                                AllTotalT_PayMoney += tempT_PayMoney;
                                sb.append(getMoneyFormat_M(Math.round(v.T_PayMoney)));
                                sb.append("</td>");
                                sb.append("<td class=''>");
                                sb.append("<div ><span class='textAlignCenter span1'>");
                                sb.append(v.Pay_TypeName);
                                if (v.INV_open_Item == "2") {
                                    sb.append("<span class='colorGreen'>(手開)</span>");
                                }
                                sb.append("</span>");
                                sb.append("  ");
                                sb.append("<span class='textAlignCenter span2'>");
                                sb.append(v.mc_name);
                                sb.append("</span>");
                                sb.append("  ");
                                tempT_PayMoneyDouble = parseFloat(v.T_PayMoneyDouble);
                                totalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                comidTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                AllTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                if (hasStr_M(v.T_PayMoneyDouble, "-")) {
                                    sb.append("<span class='textAlignCenter span3 colorRed'>");
                                } else {
                                    sb.append("<span class='textAlignCenter span3'>");
                                }

                                sb.append(getMoneyFormat_M(Math.round(v.T_PayMoneyDouble)));
                                sb.append("</span></div>");
                                if (!isEmptyStr(v.Pay_TypeName2)) {
                                    sb.append("<div class=''><span class='textAlignCenter span1'>");
                                    sb.append(v.Pay_TypeName2);
                                    if (v.INV_open_Item == "2") {
                                        sb.append("<span class='colorGreen'>(手開)</span>");
                                    }
                                    sb.append("</span>");
                                    sb.append("  ");
                                    sb.append("<span class='textAlignCenter span2'>");
                                    sb.append(v.mc_name2);
                                    sb.append("</span>");
                                    sb.append("  ");
                                    tempT_PayMoneyDouble = parseFloat(v.T_PayMoneyDouble2);
                                    totalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                    comidTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                    AllTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                    if (hasStr_M(v.T_PayMoneyDouble2, "-")) {
                                        sb.append("<span class='textAlignCenter span3 colorRed'>");
                                    } else {
                                        sb.append("<span class='textAlignCenter span3'>");
                                    }
                                    sb.append(getMoneyFormat_M(Math.round(v.T_PayMoneyDouble2)));
                                    sb.append("</span></div>");
                                }
                                if (!isEmptyStr(v.Pay_TypeName3)) {
                          
                                    sb.append("<div class=''><span class='textAlignCenter span1'>");
                                    sb.append(v.Pay_TypeName3);
                                    if (v.INV_open_Item == "2") {
                                        sb.append("<span class='colorGreen'>(手開)</span>");
                                    }
                                    sb.append("</span>");
                                    sb.append("  ");
                                    sb.append("<span class='textAlignCenter span2'>");
                                    sb.append(v.mc_name3);
                                    sb.append("</span>");
                                    sb.append("  ");
                                    tempT_PayMoneyDouble = parseFloat(v.T_PayMoneyDouble3);
                                    totalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                    comidTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                    AllTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                    if (hasStr_M(v.T_PayMoneyDouble3, "-")) {
                                        sb.append("<span class='textAlignCenter span3 colorRed'>");
                                    } else {
                                        sb.append("<span class='textAlignCenter span3'>");
                                    }
                                    sb.append(getMoneyFormat_M(Math.round(v.T_PayMoneyDouble3)));
                                    sb.append("</span></div>");
                                }
                                sb.append("</td>");
                                sb.append("</tr>");
                            }
                        } else {
                            if (v.MP == MP && v.T_Item == T_Item) {
                                
                                sb.append("<tr>");
                                sb.append("<td class='textAlignCenter'>");
                                sb.append(num);
                                num += 1;
                                sb.append("</td>");
                                sb.append("<td class='textAlignCenter'>");
                                sb.append(split_M(v.T_AccountDate, " ", 0));
                                sb.append("</td>");
                                sb.append("<td class='textAlignCenter'>");
                                sb.append(v.M_Name);
                                sb.append("</td>");
                                sb.append("<td class='textAlignCenter'>");
                                sb.append(v.M_Num);
                                sb.append("</td>");
                                sb.append("<td class='textAlignCenter'>");
                                sb.append(v.MP_Name);
                                sb.append("</td>");
                                sb.append("<td class='textAlignCenter'>");
                                sb.append(v.T_ItemName);
                                sb.append("</td>");
                                sb.append("<td class='textAlignCenter'>");
                                sb.append(v.mc_name);
                                sb.append("</td>");

                                if (hasStr_M(v.T_PayMoney, "-")) {
                                    sb.append("<td class='textAlignCenter colorRed'>");
                                } else {
                                    sb.append("<td class='textAlignCenter'>");
                                }
                                tempT_PayMoney = parseFloat(v.T_PayMoney);
                                totalT_PayMoney += tempT_PayMoney;
                                comidTotalT_PayMoney += tempT_PayMoney;
                                AllTotalT_PayMoney += tempT_PayMoney;
                                sb.append(getMoneyFormat_M(Math.round(v.T_PayMoney)));
                                sb.append("</td>");
                                sb.append("<td class=''>");
                                sb.append("<div ><span class='textAlignCenter span1'>");
                                sb.append(v.Pay_TypeName);
                                if (v.INV_open_Item == "2") {
                                    sb.append("<span class='colorGreen'>(手開)</span>");
                                }
                                sb.append("</span>");
                                sb.append("  ");
                                sb.append("<span class='textAlignCenter span2'>");
                                sb.append(v.mc_name);
                                sb.append("</span>");
                                sb.append("  ");
                                tempT_PayMoneyDouble = parseFloat(v.T_PayMoneyDouble);
                                totalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                comidTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                AllTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                if (hasStr_M(v.T_PayMoneyDouble, "-")) {
                                    sb.append("<span class='textAlignCenter span3 colorRed'>");
                                } else {
                                    sb.append("<span class='textAlignCenter span3'>");
                                }

                                sb.append(getMoneyFormat_M(Math.round(v.T_PayMoneyDouble)));
                                sb.append("</span></div>");
                                if (!isEmptyStr(v.Pay_TypeName2)) {
                                    sb.append("<div class=''><span class='textAlignCenter span1'>");
                                    sb.append(v.Pay_TypeName2);
                                    if (v.INV_open_Item == "2") {
                                        sb.append("<span class='colorGreen'>(手開)</span>");
                                    }
                                    sb.append("</span>");
                                    sb.append("  ");
                                    sb.append("<span class='textAlignCenter span2'>");
                                    sb.append(v.mc_name2);
                                    sb.append("</span>");
                                    sb.append("  ");
                                    tempT_PayMoneyDouble = parseFloat(v.T_PayMoneyDouble2);
                                    totalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                    comidTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                    AllTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                    if (hasStr_M(v.T_PayMoneyDouble2, "-")) {
                                        sb.append("<span class='textAlignCenter span3 colorRed'>");
                                    } else {
                                        sb.append("<span class='textAlignCenter span3'>");
                                    }
                                    sb.append(getMoneyFormat_M(Math.round(v.T_PayMoneyDouble2)));
                                    sb.append("</span></div>");
                                }
                                if (!isEmptyStr(v.Pay_TypeName3)) {
                                    sb.append("<div class=''><span class='textAlignCenter span1'>");
                                    sb.append(v.Pay_TypeName3);
                                    if (v.INV_open_Item == "2") {
                                        sb.append("<span class='colorGreen'>(手開)</span>");
                                    }
                                    sb.append("</span>");
                                    sb.append("  ");
                                    sb.append("<span class='textAlignCenter span2'>");
                                    sb.append(v.mc_name3);
                                    sb.append("</span>");
                                    sb.append("  ");
                                    tempT_PayMoneyDouble = parseFloat(v.T_PayMoneyDouble3);
                                    totalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                    comidTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                    AllTotalT_PayMoneyDouble += tempT_PayMoneyDouble;
                                    if (hasStr_M(v.T_PayMoneyDouble3, "-")) {
                                        sb.append("<span class='textAlignCenter span3 colorRed'>");
                                    } else {
                                        sb.append("<span class='textAlignCenter span3'>");
                                    }
                                    sb.append(getMoneyFormat_M(Math.round(v.T_PayMoneyDouble3)));
                                    sb.append("</span></div>");
                                }
                                sb.append("</td>");
                                sb.append("</tr>");
                            }
                        }
                    });
                    sb.append("<tr class ='bgBlue'>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append("合計");
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter'>");
                    sb.append("</td>");
                    sb.append("<td class='textAlignCenter  colorBlue'>");
                    sb.append(getMoneyFormat_M(Math.round(totalT_PayMoney)));
                    totalT_PayMoney = 0;
                    sb.append("</td>");
                    sb.append("<td class=''>");
                    sb.append("<div ><span class='textAlignCenter span1'>");
                    sb.append("</span>");
                    sb.append("  ");
                    sb.append("<span class='textAlignCenter span2'>");
                    sb.append("</span>");
                    sb.append("  ");
                    sb.append("<span class='textAlignCenter span4 colorBlue'>");

                    sb.append(getMoneyFormat_M(Math.round(totalT_PayMoneyDouble)));
                    totalT_PayMoneyDouble = 0;
                    sb.append("</span></div>");
                    sb.append("</td>");
                    sb.append("</tr>");

                    var tf = addTotalTotalTF(ComID, U_MDEP);
                    if (tf) {
                        sb.append("<tr class ='bgBlue'>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append("部門合計");
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter  colorBlue'>");
                        sb.append(getMoneyFormat_M(Math.round(comidTotalT_PayMoney)));
                        comidTotalT_PayMoney = 0;
                        sb.append("</td>");
                        sb.append("<td class=''>");
                        sb.append("<div ><span class='textAlignCenter span1'>");
                        sb.append("</span>");
                        sb.append("  ");
                        sb.append("<span class='textAlignCenter span2'>");
                        sb.append("</span>");
                        sb.append("  ");
                        sb.append("<span class='textAlignCenter span4 colorBlue'>");

                        sb.append(getMoneyFormat_M(Math.round(comidTotalT_PayMoneyDouble)));
                        comidTotalT_PayMoneyDouble = 0;
                        sb.append("</span></div>");
                        sb.append("</td>");
                        sb.append("</tr>");
                    }
                    sb.append("</tbody>");
                    sb.append("</table>");
                    if (U_MDEP == "0017") {
                        sb.append("<table class='table table-hover'>");
                        sb.append("<thead>");
                        sb.append("<tr class ='bgBlue'>");
                        sb.append("<th class='textAlignCenter'>總業績</th>");
                        sb.append("<th class='textAlignCenter'></th>");
                        sb.append("<th class='textAlignCenter'></th>");
                        sb.append("<th class='textAlignCenter'</th>");
                        sb.append("<th class='textAlignCenter'></th>");
                        sb.append("<th class='textAlignCenter'>入會金額總計&nbsp;：&nbsp;</th>");

                        sb.append("<th class='textAlignCenter colorBlue'>");
                        sb.append(getMoneyFormat_M(Math.round(AllTotalT_PayMoney)));
                        sb.append("</th>");
                        sb.append("<th class='textAlignCenter'>入帳金額總計&nbsp;：&nbsp;</th>");
                        sb.append("<th class='textAlignCenter'>");
                        sb.append("<span class='textAlignCenter colorBlue'>");
                        sb.append(getMoneyFormat_M(Math.round(AllTotalT_PayMoneyDouble)));
                        sb.append("</span>");
                        sb.append("</th>");
                        sb.append("</tr>");
                        sb.append("</thead>");
                        sb.append("</table>");
                    }
                    Log_M("sb.toString()=" + sb.toString());
                    append_M("#detailPerformanceTable", sb.toString());
                    show_M("#detailPerformanceTable");
                    unBlockUI_M();
                }
            });
        };

        var getAnalystDetailPerformanceTable = function (startDate, endDate,U_MDEP , ComID, MP, T_Item) {
            var data = "StartDate=" + startDate + "&EndDate=" + endDate + "&U_MDEP=" + U_MDEP + "&ComID=" + ComID + "&action=getDetailPerformanceTable";
            var success = function (back) {
                Log_M("getAnalystDetailPerformanceTable back="+back);
                empty_M("#detailPerformanceTable");
                var num = getDepOrder(ComID, U_MDEP);

                DetailPerformanceDataList[num] = back;
               
                if (DetailPerformanceDataList.length == ComIDUMDEPlist_M.length) {
                    Log_M(DetailPerformanceDataList.length + "------" + ComIDUMDEPlist_M.length);
                    makeAnalystDetailPerformanceTabel(ComID, U_MDEP, MP, T_Item, startDate, endDate);
                }
            };
            var error = function (e) { Log_M("getDetailPerformanceTable error=" + e); unBlockUI_M(); };

            ajax_M(reportHandlerMCMEB02Url_G, data, success, error);
        };
        var getAllAnalystDetailPerformanceTable = function (startDate, endDate, MP, T_Item) {
            Log_M("Start getAllAnalystDetailPerformanceTable ")
            $.each(ComIDUMDEPlist_M, function (i, v) {
                getAnalystDetailPerformanceTable(startDate, endDate, v[1], v[0], MP, T_Item);
            });
        };
        //============================================================================分析師END
        //============================================================================助理start
        var makeAssistantDetailPerformanceTabel = function (U_MDEP, ComID, U_MDEPName, startDate, endDate) {
            var sb = new StringBuilder_M();
            sb.append("<div class='textAlignCenter'>");
            sb.append("<h3 class='table table-hover'>業績總表-責任助理</h3>");
            sb.append("</div>");
            sb.append("<p><span>日期</span>:");
            sb.append(startDate);
            sb.append(" - ");
            sb.append(endDate);
            sb.append("</p>");
            $.each(AssistantDetailPerformanceDataList, function (t,tt) {
                var totalT_PayMoney = 0;
                var totalT_PayMoneyDouble = 0;
                var json = jsonParse_M(tt);
                
                $.each(json, function (i, v) {
                    if (v.length != 0) {
                       
                        sb.append("<table class='table table-hover'>");
                        sb.append("<thead>");
                        sb.append("<tr class ='bgBlue'><th class='textAlignCenter'>");
                        if (isEmptyStr(U_MDEPName)) {
                            sb.append(ComIDUMDEPlist_M[t][2]);
                        } else {
                            sb.append(U_MDEPName);
                        }
                        sb.append("</th></tr>");
                        sb.append("<tr class ='bgBlue'>");
                        sb.append("<th class='textAlignCenter'>序號</th>");
                        sb.append("<th class='textAlignCenter'>燈號</th>");
                        sb.append("<th class='textAlignCenter'>入帳日</th>");
                        sb.append("<th class='textAlignCenter'>客戶姓名</th>");
                        sb.append("<th class='textAlignCenter'>會員編號</th>");
                        sb.append("<th class='textAlignCenter'>分析師</th>");
                        sb.append("<th class='textAlignCenter'>種類</th>");
                        sb.append("<th class='textAlignCenter'>原助理</th>");
                        sb.append("<th class='textAlignCenter'>入會金額</th>");
                        sb.append("<th class='textAlignCenter'>入賬細節</th>");
                        sb.append("</tr>");
                        sb.append("</thead>");
                        sb.append("<tbody>");
                        $.each(v, function (ii, vv) {
                            sb.append("<tr>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(ii + 1);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");

                            sb.append("<img style='width:25px;height:25px;' src='../../../../img/");
                            sb.append(vv.Light_Status);
                            sb.append(".png'/>");
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(split_M(vv.T_AccountDate, " ", 0));
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(vv.M_Name);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(vv.M_Num);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(vv.MP_Name);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(vv.T_ItemName);
                            sb.append("</td>");
                            sb.append("<td class='textAlignCenter'>");
                            sb.append(vv.MTRATmc_name);
                            sb.append("</td>");

                            if (hasStr_M(vv.T_PayMoney, "-")) {
                                sb.append("<td class='textAlignCenter colorRed'>");
                            } else {
                                sb.append("<td class='textAlignCenter'>");
                            }
                            totalT_PayMoney += parseFloat(vv.T_PayMoney);
                            sb.append(getMoneyFormat_M(Math.round(vv.T_PayMoney)));
                            sb.append("</td>");
                            sb.append("<td class=''>");
                            sb.append("<div ><span class='textAlignCenter span1'>");
                            sb.append(vv.Pay_TypeName);
                            if (vv.INV_open_Item == "2") {
                                sb.append("<span class='colorGreen'>(手開)</span>");
                            }
                            sb.append("</span>");
                            sb.append("  ");
                            sb.append("<span class='textAlignCenter span2'>");
                            sb.append(vv.mc_name);
                            sb.append("</span>");
                            sb.append("  ");
                            totalT_PayMoneyDouble += parseFloat(vv.T_PayMoneyDouble);
                            if (hasStr_M(vv.T_PayMoneyDouble, "-")) {
                                sb.append("<span class='textAlignCenter span3 colorRed'>");
                            } else {
                                sb.append("<span class='textAlignCenter span3'>");
                            }
                            sb.append(getMoneyFormat_M(Math.round(vv.T_PayMoneyDouble)));
                            sb.append("</span></div>");
                            sb.append("</td>");
                            sb.append("</tr>");
                        });
                        sb.append("<tr class ='bgBlue'>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append("合計");
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter'>");
                        sb.append("</td>");
                        sb.append("<td class='textAlignCenter  colorBlue'>");
                        sb.append(getMoneyFormat_M(Math.round(totalT_PayMoney)));
                        totalT_PayMoney = 0;
                        sb.append("</td>");
                        sb.append("<td class=''>");
                        sb.append("<div ><span class='textAlignCenter span1'>");
                        sb.append("</span>");
                        sb.append("  ");
                        sb.append("<span class='textAlignCenter span2'>");
                        sb.append("</span>");
                        sb.append("  ");
                        sb.append("<span class='textAlignCenter span4 colorBlue'>");

                        sb.append(getMoneyFormat_M(Math.round(totalT_PayMoneyDouble)));
                        totalT_PayMoneyDouble = 0;
                        sb.append("</span></div>");
                        sb.append("</td>");
                        sb.append("</tr>");
                        sb.append("</tbody>");
                        sb.append("</table>");
                    }
                });
            });
            
            append_M("#assistantDetailPerformanceTable", sb.toString());
            AssistantDetailPerformanceDataList = [];
            show_M("#assistantDetailPerformanceTable");
            unBlockUI_M();
        };
        var getAssistantDetailPerformanceTable = function (startDate, endDate, U_MDEP, ComID,MC,selectAllTF) {
            Log_M("Start getAllAssistantDetailPerformanceTable");
            var data = "StartDate=" + startDate + "&EndDate=" + endDate + "&U_MDEP=" + U_MDEP + "&ComID=" + ComID + "&MC=" + MC + "&action=getAssistantDetailPerformanceTable";
            var success = function (back) {
                Log_M("getAssistantDetailPerformanceTable back=" + back)
                empty_M("#assistantDetailPerformanceTable");
                var num = undefined;
                if (selectAllTF) {
                    num = getDepOrder(ComID, U_MDEP);
                    AssistantDetailPerformanceDataList[num] = back;
                    if (AssistantDetailPerformanceDataList.length == ComIDUMDEPlist_M.length) {
                        makeAssistantDetailPerformanceTabel(U_MDEP, ComID, emptyValue_M, startDate, endDate);
                    }
                } else {
                    AssistantDetailPerformanceDataList[0] = back;
                    var U_MDEPName = undefined;
                    $.each(ComIDUMDEPlist_M, function (i, v) {
                        if (v[i] == U_MDEP) {
                            U_MDEPName = v[2];
                        }
                    })
                    makeAssistantDetailPerformanceTabel(U_MDEP, ComID, U_MDEPName, startDate, endDate);
                }   
            };
            var error = function (e) { Log_M("getDetailPerformanceTable error=" + e); unBlockUI_M(); };

            ajax_M(reportHandlerMCMEB02Url_G, data, success, error);
        };
        var getAllAssistantDetailPerformanceTable = function (startDate, endDate, ComID, U_MDEP, MC) {
            if (isEmptyStr(MC)) {
                if (isEmptyStr(ComID)) {
                    $.each(ComIDUMDEPlist_M, function (i, v) {
                        getAssistantDetailPerformanceTable(startDate, endDate, v[1], v[0], emptyValue_M, true);
                    });
                } else {
                    if (isEmptyStr(U_MDEP)) {
                        getAssistantDetailPerformanceTable(startDate, endDate, emptyValue_M, ComID, emptyValue_M,false);
                    } else {
                        getAssistantDetailPerformanceTable(startDate, endDate, U_MDEP, ComID, emptyValue_M, false);
                    }
                }
            } else {
                getAssistantDetailPerformanceTable(startDate, endDate, emptyValue_M, emptyValue_M, MC, false);
            }
            
        };
        //============================================================================助理end
        var getPerformanceTable = function (startDate, endDate) {
            blockUI_M();
            empty_M(".printArea");
            var startDate = val_M("#StartDate");
            var endDate = val_M("#EndDate");
            var U_MDEP = val_M("#UMDEP");
            var ComID = val_M("#ComID");
            var doNext = check_M.isEndDateBigThanStartDate(startDate, endDate);
            if (doNext) {
                var Report_Item = val_M("#Report_Item");
                switch (Report_Item) {
                    case "1":
                        getAllTotalPerformanceTable(startDate, endDate, U_MDEP, ComID);
                        break;
                    case "2":
                        DetailPerformanceDataList = [];
                        getAllDetailPerformanceTable(startDate, endDate, U_MDEP, ComID);
                        break;
                    case "3":
                        var MP = val_M("#MP");
                        var T_Item = val_M("#T_Item");
                        if (!isEmptyStr(MP)) {
                            getAllAnalystDetailPerformanceTable(startDate, endDate, MP, T_Item);
                        } else {
                            alert("請選擇分析師");
                            unBlockUI_M();
                        }
                        break;
                    case "4":
                        var MC = val_M("#MC");
                        getAllAssistantDetailPerformanceTable(startDate, endDate, ComID, U_MDEP,MC);
                        break;
                }
                
            } else {
                
                alert("請正確選擇日期區間");
                unBlockUI_M();
            }
        };
      
        //取得分析師列表HtmlTagOption列表
        var afterSuccessFuc = function () {
            $("#MP").on("change", function () {
                var type = val_M(this);
                var itemId = attr_M(this, "itemId");
                $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, itemId, type, "option");
            });
        };
        $(function () {

            $Common.MUSER.getResponsibleAssistantListHtmlTagOption(CommonHandlerUrl_M, "#MC", emptyValue_M, "option");
            onClick_M("#print", printScreen_M);
            onChange_M("#Report_Item", reportItemChange);
            onChange_M("#ComID", getComIDUMDEPhtmlTagOption);
            onChange_M("#UMDEP", getResponsibleAssistantListHtmlTagOption);
            onClick_M("#search", getPerformanceTable);
            disabledTrue_M("#MC");
            $Common.MUSER.getAnalystListHtmlTagOption(CommonHandlerUrl_M, "#MP", emptyValue_M, "option", afterSuccessFuc);
        })
    </script>
</asp:Content>

