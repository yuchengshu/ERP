<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="takeLeaveDetail.aspx.cs" Inherits="public_TakeLeave_MEXCU_takeLeaveDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        #clTitle {
            font-size: 16px;
        }

        #closeCompensatoryLeaveDataBtn {
            background-color: white;
        }

        .width70 {
            width: 70px;
        }

        .width40 {
            width: 40px;
        }

        .EAgroup {
            float: left;
            margin-left: 10px;
        }

        .fontSize15 {
            font-size: 16px;
        }

        .borderBottomColorRed {
            border-bottom: 1px solid red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper" style="min-height: 668px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
        </section>

        <!-- Main content -->
        <section class="content">
            <!-- Main row -->

            <div class="row">
                <div class="col-md-12">
                    <div class="box box-danger">
                        <div class="box-header">
                            <i class="fa fa-list-alt"></i>
                            <h1 class="box-title"><b>ERP > 公用 > 請假明細</b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title="">
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <!-- <table class="table table-bordered table-condensed"> -->

                            <div style="text-align: center">
                            </div>
                            <!--假單明細START-->
                            <div id="leaveDetailDiv" class="divBorder startHide">
                                <div id="leaveDetailTitle" class="marginLeftRight10 titleBottomBorder">
                                    <h2><span>請假單</span>
                                        <div id="closeLeaveDetailDiv" class="btn" style="margin-right: 0 auto; float: right;">
                                            <button type="button" class="btn btn-flat closeSecondaryDiv closeBtn" closedivid="#leaveDetailDiv">X</button>
                                        </div>
                                    </h2>
                                </div>
                                <form id="leaveDetailFm" class="marginTop10">
                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-12 fontSize15">
                                            <label for="" class="colorBlue">假單明細</label>
                                        </div>
                                    </div>
                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-2">
                                            <label for=""><span class="borderBottomColorRed">假單編號</span>：</label><br />
                                            <label id="leaveEX_id"></label>
                                        </div>
                                        <div class="col-xs-2">
                                            <label for=""><span class="borderBottomColorRed">申請日期</span>：</label><br />
                                            <label id="leaveAdd_date"></label>
                                        </div>
                                        <div class="col-xs-2">
                                            <label for=""><span class="borderBottomColorRed">請假人員</span>：</label><br />
                                            <label id="leaveEX_Name"></label>
                                        </div>
                                        <div class="col-xs-2">
                                            <label for=""><span class="borderBottomColorRed">到職日</span>：</label><br />
                                            <label id="leaveSlimDate"></label>
                                        </div>
                                        <div class="col-xs-2">
                                            <label for=""><span class="borderBottomColorRed">假別</span>：</label><br />
                                            <label id="leaveEX_TypeName"></label>
                                        </div>

                                    </div>

                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-2">
                                            <label for=""><span class="borderBottomColorRed">事由</span>：</label><br />
                                            <label id="leaveEX_Reason"></label>
                                        </div>
                                        <div class="col-xs-2">
                                            <label for=""><span class="borderBottomColorRed">開始日期</span>：</label><br />
                                            <label id="leaveStartDate"></label>
                                        </div>
                                        <div class="col-xs-2">
                                            <label for=""><span class="borderBottomColorRed">結束日期</span>：</label><br />
                                            <label id="leaveEndDate"></label>
                                        </div>
                                        <div class="col-xs-2">
                                            <label for=""><span class="borderBottomColorRed">合計天數</span>：</label><br />
                                            <label id="leaveEX_Day"></label>
                                            <label>天</label><label id="leaveEX_Hour"></label><label>小時</label>
                                        </div>
                                    </div>

                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-2">
                                            <label for=""><span class="borderBottomColorRed">已請年假</span>：</label><br />
                                            <label id="" class="colorBlue takenAnnualLeaveDays"></label>
                                        </div>
                                        <div class="col-xs-2">
                                            <label for=""><span class="borderBottomColorRed">可請年假</span>：</label><br />
                                            <label id="" class="AnnualLeaveDays"></label>
                                        </div>
                                        <div class="col-xs-2">
                                            <label for=""><span class="borderBottomColorRed">已請補休</span>：</label><br />
                                            <label id="" class="takenCompensatoryLeaveDays"></label>
                                        </div>
                                        <div class="col-xs-2">
                                            <label for=""><span class="borderBottomColorRed">可請補休</span>：</label><br />
                                            <label id="" class="CompensatoryLeaveDays"></label>
                                        </div>
                                    </div>
                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-12 fontSize15">
                                            <label for="" class="colorBlue">簽核明細</label>
                                        </div>
                                    </div>
                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-3">
                                            <label for=""><span class="">代&nbsp;&nbsp;&nbsp;理&nbsp;&nbsp;&nbsp;人&nbsp;</span>：</label><label id="EX_Agent_Name"></label>
                                        </div>
                                        <div class="col-xs-3">
                                            <label for=""><span class="">簽核狀態</span>：</label><label id="EX_Agent_StatusName" class="colorRed"></label>
                                        </div>
                                        <div class="col-xs-3">
                                            <label for=""><span class="">簽核時間</span>：</label><label id="EX_Agent_time"></label>
                                        </div>
                                        <div class="col-xs-3 startHide" id="AgentGroup">
                                            <button type="button" status="1" statusname="EX_Agent" class="btn btn-primary btn-flat StatusBtn">核准</button>
                                            <button type="button" status="2" statusname="EX_Agent" class="btn btn-danger btn-flat StatusBtn">退回</button>
                                        </div>
                                    </div>
                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-3">
                                            <label for=""><span class="">簽核主管1</span>：</label><label id="EX_Sign1_name"></label>
                                        </div>
                                        <div class="col-xs-3">
                                            <label for=""><span class="">簽核狀態</span>：</label><label id="EX_Sign1_StatusName" class="colorRed"></label>
                                        </div>
                                        <div class="col-xs-3">
                                            <label for=""><span class="">簽核時間</span>：</label><label id="EX_Sign1_time"></label>
                                        </div>
                                        <div class="col-xs-3 startHide" id="Sign1Group">
                                            <button type="button" status="1" statusname="EX_Sign1" class="btn btn-primary btn-flat StatusBtn">核准</button>
                                            <button type="button" status="2" statusname="EX_Sign1" class="btn btn-danger btn-flat StatusBtn">退回</button>
                                        </div>
                                    </div>
                                    <div class="form-group row marginLeftRight10 startHide" id="EX_Sign2">
                                        <div class="col-xs-3">
                                            <label for=""><span class="">簽核主管2</span>：</label><label id="EX_Sign2_name"></label>
                                        </div>
                                        <div class="col-xs-3">
                                            <label for=""><span class="">簽核狀態</span>：</label><label id="EX_Sign2_StatusName" class="colorRed"></label>
                                        </div>
                                        <div class="col-xs-3">
                                            <label for=""><span class="">簽核時間</span>：</label><label id="EX_Sign2_time"></label>
                                        </div>
                                        <div class="col-xs-3 startHide" id="Sign2Group">
                                            <button type="button" status="1" statusname="EX_Sign2" class="btn btn-primary btn-flat StatusBtn">核准</button>
                                            <button type="button" status="2" statusname="EX_Sign2" class="btn btn-danger btn-flat StatusBtn">退回</button>
                                        </div>
                                    </div>
                                    <div class="form-group row marginLeftRight10  startHide" id="EX_Sign3">
                                        <div class="col-xs-3">
                                            <label for=""><span class="">簽核主管3</span>：</label><label id="EX_Sign3_name"></label>
                                        </div>
                                        <div class="col-xs-3">
                                            <label for=""><span class="">簽核狀態</span>：</label><label id="EX_Sign3_StatusName" class="colorRed"></label>
                                        </div>
                                        <div class="col-xs-3">
                                            <label for=""><span class="">簽核時間</span>：</label><label id="EX_Sign3_time"></label>
                                        </div>
                                        <div class="col-xs-3 startHide" id="Sign3Group">
                                            <button type="button" status="1" statusname="EX_Sign3" class="btn btn-primary btn-flat StatusBtn">核准</button>
                                            <button type="button" status="2" statusname="EX_Sign3" class="btn btn-danger btn-flat StatusBtn">退回</button>
                                        </div>
                                    </div>
                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-3">
                                            <label for=""><span class="">審核人員&nbsp;&nbsp;</span>：</label><label id="EX_Govern_Name"></label>
                                        </div>
                                        <div class="col-xs-3">
                                            <label for=""><span class="">簽核狀態</span>：</label><label id="EX_Govern_StatusName" class="colorRed"></label>
                                        </div>
                                        <div class="col-xs-3">
                                            <label for=""><span class="">簽核時間</span>：</label><label id="EX_Govern_time"></label>
                                        </div>
                                        <div class="col-xs-3 startHide" id="GovernGroup">
                                            <button type="button" status="1" statusname="EX_Govern" id="leaveDataReturnOkBtn" class="btn btn-primary btn-flat StatusBtn">核准</button>
                                            <button type="button" status="2" statusname="EX_Govern" id="leaveDataReturnBackBtn" class="btn btn-danger btn-flat StatusBtn">退回</button>
                                        </div>
                                    </div>
                                </form>

                            </div>
                            <!--假單明細END-->
                            <!--新增假單START-->
                            <div id="addLeaveDataDiv" class="divBorder startHide">
                                <div id="addLeaveDataTitle" class="marginLeftRight10 titleBottomBorder">
                                    <h2><span>新增請假單</span>
                                        <div id="closeAddLeaveDataDiv" class="btn" style="margin-right: 0 auto; float: right;">
                                            <button id="closeAddLeaveDataBtn" type="button" class="btn btn-flat closeSecondaryDiv closeBtn" closedivid="">X</button>
                                        </div>
                                    </h2>
                                </div>
                                <form id="addLeaveDataFm" class="marginTop10">

                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-12 fontSize15">
                                            <span class="colorRed">*</span><label for="">已請年假</label>&nbsp;&nbsp;/&nbsp;&nbsp;<label for="">可請年假：</label><label for="" id="takenAnnualLeaveDays" class="colorBlue"></label>&nbsp;/&nbsp;<label for="" id="AnnualLeaveDays"></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="colorRed">*</span><label for="">已請補休&nbsp;&nbsp;/&nbsp;&nbsp;可請補休：</label><label for="" id="takenCompensatoryLeaveDays" class="colorBlue"></label>/<label for="" id="CompensatoryLeaveDays"></label>

                                        </div>

                                    </div>
                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-12">
                                            <label for=""><span class="colorRed">*</span><span class="borderBottomColorRed">開始日期</span>：</label><br />
                                            <label>
                                                <input class="form-control datepicker  addLeaveRequired" id="addLeaveStartDate" requiredname="開始日期"></label>
                                            <label>
                                                <select class="form-control  getHourFuc addLeaveRequired" id="addLeaveStartHour" requiredname="開始時間"></select></label><label>時</label>
                                            <label>
                                                <select class="form-control  getMinFuc " id="addLeaveStartMin"></select></label><label>分</label>
                                        </div>

                                    </div>
                                    <div class="form-group row marginLeftRight10">

                                        <div class="col-xs-12">
                                            <label for=""><span class="colorRed">*</span><span class="borderBottomColorRed">結束日期</span>：</label><br />
                                            <label>
                                                <input class="form-control datepicker addLeaveRequired" id="addLeaveEndDate" requiredname="結束日期"></label>
                                            <label>
                                                <select class="form-control  getHourFuc addLeaveRequired" id="addLeaveEndHour" requiredname="結束時間"></select></label><label>時</label>
                                            <label>
                                                <select class="form-control  getMinFuc" id="addLeaveEndMin"></select></label><label>分</label>
                                        </div>

                                    </div>
                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-12">
                                            <label for=""><span class="colorRed">*</span><span class="borderBottomColorRed">合計天數</span>：</label><br />
                                            <label>
                                                <input class="form-control" id="addLeaveEX_Day"></label><label>天</label>
                                            <label>
                                                <select class="form-control " id="addLeaveEX_Hour">
                                                    <option value="0">0</option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7">7</option>
                                                </select></label><label>小時</label>
                                        </div>

                                    </div>
                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-12">
                                            <label for="M_Name"><span class="colorRed">*</span><span class="borderBottomColorRed">假別</span>：</label>
                                           <%-- 假別下拉式選單--%>
                                           <%--假別SQL語法:select ditcode,ddesc from MITEM where mitcode = 'EXCUE' and ditcode <> '0000' and del_tag = '0' order by rank--%>
                                             <%--<select id="EA_MDEP" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc EAgroup addLeaveRequired" com="EA_Com" mdep="EA_MDEP" emp="EA" requiredname="代理人部門別"></select>--%>
                                            <select id="addLeaveEX_Type" class="form-control getEX_TypeOption addLeaveRequired" requiredname="假別">
                                                <option value="">請選擇</option>
                                            </select>
                                        </div>

                                    </div>

                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-12">
                                            <label for=""><span class="colorRed">*</span><span class="borderBottomColorRed">事由</span>：</label><br />
                                            <input class="form-control addLeaveRequired" id="addLeaveEX_Reason" requiredname="事由">
                                        </div>
                                    </div>
                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-12">
                                            <span class="colorRed">注意事項:</span><label for="">請假三天以下(含三天)核准權責:代理人員 → 部門主管(簽核主管1)</label><br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="">請假四天以上(含四天)核准權責:代理人員 → 部門主管(簽核主管1) → 總管理處(簽核主管2) </label>
                                            <br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="">請假別為年假、補休者，請假時數最少為【半天】以上，不得以小時為計算單位。</label>

                                        </div>

                                    </div>
                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-12">
                                            <label for=""><span class="colorRed"></span><span class="borderBottomColorRed">代理人</span>：</label><br />
                                            <div class="form-inline">
                                                <label class="EAgroup marginTop5">公司別:</label>
                                                <select id="EA_Com" class="form-control getComIDlistHtmlTagOption comMdepChangeFuc EAgroup addLeaveRequired" com="EA_Com" mdep="EA_MDEP" emp="EA" requiredname="代理人公司別"></select>
                                                <label class="EAgroup marginTop5">部門別:</label>
                                                <select id="EA_MDEP" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc EAgroup addLeaveRequired" com="EA_Com" mdep="EA_MDEP" emp="EA" requiredname="代理人部門別"></select>
                                                <label class="EAgroup marginTop5">姓名:</label>
                                                <select id="EA" class="form-control EAgroup addLeaveRequired " requiredname="代理人部門別">
                                                    <option value="">請選擇</option>
                                                </select>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="form-group row marginLeftRight10">

                                        <div class="col-xs-12">
                                            <label for=""><span class="colorRed"></span><span class="borderBottomColorRed">簽核主管1</span>：</label><br />
                                            <div class="form-inline">
                                                <label class="EAgroup marginTop5">公司別:</label>
                                                <select id="ES1_Com" class="form-control getComIDlistHtmlTagOption comMdepChangeFuc EAgroup addLeaveRequired" com="ES1_Com" mdep="ES1_MDEP" emp="ES1" requiredname="簽核主管1公司別"></select>
                                                <label class="EAgroup marginTop5">部門別:</label>
                                                <select id="ES1_MDEP" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc EAgroup addLeaveRequired" com="ES1_Com" mdep="ES1_MDEP" emp="ES1" requiredname="簽核主管1部門別"></select>
                                                <label class="EAgroup marginTop5">姓名:</label>
                                                <select id="ES1" class="form-control EAgroup addLeaveRequired" requiredname="簽核主管1姓名">
                                                    <option value="">請選擇</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row marginLeftRight10">

                                        <div class="col-xs-12">
                                            <label for=""><span class="colorRed"></span><span class="borderBottomColorRed">簽核主管2</span>：</label><br />
                                            <div class="form-inline">
                                                <label class="EAgroup marginTop5">公司別:</label>
                                                <select id="ES2_Com" class="form-control getComIDlistHtmlTagOption comMdepChangeFuc EAgroup addLeaveRequired2" com="ES2_Com" mdep="ES2_MDEP" emp="ES2" requiredname="簽核主管2公司別"></select>
                                                <label class="EAgroup marginTop5">部門別:</label>
                                                <select id="ES2_MDEP" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc EAgroup addLeaveRequired2" com="ES2_Com" mdep="ES2_MDEP" emp="ES2" requiredname="簽核主管2部門別"></select>
                                                <label class="EAgroup marginTop5">姓名:</label>
                                                <select id="ES2" class="form-control EAgroup  addLeaveRequired2" requiredname="簽核主管2姓名">
                                                    <option value="">請選擇</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row marginLeftRight10">

                                        <div class="col-xs-12">
                                            <label for=""><span class="colorRed"></span><span class="borderBottomColorRed">簽核主管3</span>：</label><br />
                                            <div class="form-inline">
                                                <%--20220629要修改下拉式選單項目--%>
                                                <label class="EAgroup marginTop5">公司別:</label>
                                                <select id="ES3_Com" class="form-control getComIDlistHtmlTagOption comMdepChangeFuc EAgroup" com="ES3_Com" mdep="ES3_MDEP" emp="ES3"></select>
                                                <label class="EAgroup marginTop5">部門別:</label>
                                                <select id="ES3_MDEP" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc EAgroup" com="ES3_Com" mdep="ES3_MDEP" emp="ES3"></select>
                                                <label class="EAgroup marginTop5">姓名:</label>
                                                <select id="ES3" class="form-control EAgroup">
                                                    <option value="">請選擇</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-4">
                                            <div>
                                                <button class="btn btn-primary form-control  marginTop30" id="addLeaveDataBtn" onclick="return false;">送出資料</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!--新增假單END-->



                            <!--補修明細START-->
                            <table class="table table-hover startHide" id="compensatoryLeaveDataTab">
                                <thead>
                                    <tr class="active">
                                        <th class="textAlignCenter" colspan="3"><span id="clTitle">補修明細表</span></th>

                                        <th class=" textAlignRight" colspan="1"><span id="pageNum"></span></th>
                                        <th class=" textAlignRight" colspan="1">
                                            <button id="closeCompensatoryLeaveDataBtn" type="button" class="btn btn-flat closeSecondaryDiv closeBtn" closedivid="">X</button>
                                        </th>
                                    </tr>

                                    <tr class="bgBlue">
                                        <th class="" style="width: 2%; text-align: center;">補修單號</th>
                                        <th class="" style="width: 4%; text-align: center;">姓名</th>
                                        <th class="" style="width: 6%; text-align: center;">補休時間(起)</th>
                                        <th class="" style="width: 6%; text-align: center;">補休時間(止)</th>
                                        <th class="" style="width: 4%; text-align: center;">補修發生說明</th>
                                    </tr>
                                </thead>
                                <tbody id="compensatoryLeaveDataTb">
                                </tbody>

                            </table>
                            <!--補修明細END-->

                            <!--進階查詢START-->
                            <div id="leaveAdvSearchDiv" class="divBorder startHide leaveDataGroup">
                                <div id="leaveAdvSearchTitle" class="marginLeftRight10 titleBottomBorder">
                                    <h3>請假單資料進階查詢
                                    <div class="btn-group" data-toggle="btn-toggle" style="margin-right: 0 auto; float: right;">
                                        <button id="" type="button" class="btn closeBtn btn-flat closeSecondaryDiv" closedivid="#leaveAdvSearchDiv">X</button>
                                    </div>
                                    </h3>
                                </div>
                                <form id="leaveAdvSearchFm" class="marginTop10 ">
                                    <div class="form-group row marginLeftRight10">
                                        <div class="col-xs-3">
                                            <label for="EX_Status">公司別：</label>
                                            <select id="abcU_Com" class="form-control getComIDlistHtmlTagOption comMdepChangeFuc" com="abcU_Com" mdep="abcU_MDEP" emp="EX_User"></select>
                                        </div>
                                        <div class="col-xs-3">
                                            <label for="EX_Status">部門別：</label>
                                            <select id="abcU_MDEP" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc" com="abcU_Com" mdep="abcU_MDEP" emp="EX_User"></select>
                                        </div>
                                        <div class="col-xs-3">
                                            <label for="EX_Status">姓名：</label>
                                            <select id="EX_User" class="form-control"></select>
                                        </div>
                                        <div class="col-xs-3">
                                            <label for="EX_Status">假單狀態：</label>
                                            <select id="EX_Status" class="form-control">
                                                <option value="">請選擇</option>
                                                <option value="1">處理中</option>
                                                <option value="2">審查中</option>
                                                <option value="3">退回</option>
                                                <option value="4">銷假</option>
                                                <option value="5">審查失敗</option>
                                                <option value="6">完成</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row marginLeftRight10">

                                        <div class="col-xs-3">
                                            <label for="EX_Type">假別：</label>
                                            <select id="EX_Type" class="form-control getEX_TypeOption">
                                                <option value="">不限</option>
                                            </select>
                                        </div>
                                        <div class="col-xs-3">
                                            <label for="EX_SDate">請假時間(起)：</label><br />
                                            <input type="text" id="StartDate" class="datepicker form-control " placeholder="開始日">
                                        </div>
                                        <div class="col-xs-3">
                                            <label for="EX_EDate">請假時間(止)：</label><br />
                                            <input type="text" id="EndDate" class="datepicker form-control " placeholder="結束日">
                                        </div>
                                        <div class="col-xs-3 marginTop25" style="text-align: center" id="startSearchDiv">
                                            <button id="" class="btn getLeaveData" selecttype="adv" style="background-color: #f4f4f4;" onclick="return false;">開始查詢</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!--進階查詢END-->

                            <!--請假明細START-->
                            <table class="table table-hover leaveDataGroup" id="leaveDataTab">
                                <thead>
                                    <tr class="active">

                                        <th class="" colspan="6">
                                            <div class="input-group">

                                                <input type="text" name="message" placeholder="查尋關鍵字..." class="form-control" id="keyWord">
                                                <span class="input-group-btn">
                                                    <button type="button" class="btn btn-info btn-flat getLeaveData" selecttype="nor" id="searchLeaveData">查詢</button>
                                                </span>
                                                <span class="input-group-btn ">
                                                    <button type="button" class="btn btn-info btn-flat marginLeft marginRight getComIdMdepEmpList" id="openSearchAdvancedDiv">進階查詢</button>
                                                </span>
                                                <span class="input-group-btn marginLeft">
                                                    <button type="button" class="btn btn-info btn-flat" id="openCompensatoryLeaveDiv">補修明細</button>
                                                </span>
                                            </div>
                                        </th>

                                        <th class="" colspan="1"></th>
                                        <th class="" colspan="1"></th>
                                        <th class="" colspan="1">
                                            <div class="btn-group" data-toggle="btn-toggle">
                                                <button type="button" id="openAddLeaveDataDiv" class="btn btn-primary btn-flat getComIdMdepEmpList">新增假單</button>
                                            </div>
                                        </th>
                                        <th class="" colspan="1"><span id="pageNum"></span></th>
                                    </tr>

                                    <tr class="bgBlue">
                                        <th class="" style="width: 2%; text-align: center;">項</th>
                                        <th class="" style="width: 4%; text-align: center;">單號</th>
                                        <th class="" style="width: 6%; text-align: center;">假別</th>
                                        <th class="" style="width: 4%; text-align: center;">姓名</th>
                                        <th class="" style="width: 10%; text-align: center;">請假日期(起)</th>
                                        <th class="" style="width: 10%; text-align: center;">請假日期(止)</th>
                                        <th class="" style="width: 5%; text-align: center;">天數</th>
                                        <th class="" style="width: 5%; text-align: center;">狀態</th>
                                        <th class="" style="width: 10%; text-align: center;">審查時間</th>
                                        <th class="" style="width: 4%; text-align: center;">刪</th>
                                    </tr>
                                </thead>
                                <tbody id="leaveData">
                                </tbody>

                            </table>
                            <!--請假明細END-->
                            <div style="text-align: center">
                                <div id="pageBar" style="margin: 0 auto;"></div>
                            </div>

                        </div>
                        <!--/.box-body-->

                    </div>
                    <!--/.box-->

                </div>
            </div>
            <!-- /.row (main row) -->

        </section>
        <!-- /.content -->

    </div>
    <script src="<%=getRelativePath()%>js/pageList/takeLeaveDetailPageList.js" type="text/javascript"></script>
    <script src="<%=getRelativePath()%>js/pageList/getCompensatoryLeaveDataPageList.js" type="text/javascript"></script>
    <script>
        var first_G = true;
        var MenuNo_G = "<%=getMenuNo()%>";
        var EX_id_G = "<%=getEXid()%>";
        var U_Num_G = "<%=getUnum()%>";
        var MS_ID_G = "<%=getMS_ID()%>";
        var nextSigner_G = undefined;
        var tempMC_G = undefined;
        var tempLeader_G = undefined;
        var takeLeaveDetailHandlerUrl_G = "takeLeaveDetailHandler.ashx";
        var unTakenAnnualLeaveDays_G = 0;
        var unTakenCompensatoryLeaveDays_G = 0;
        var unTakenSickLeaveDays_G = 0;
        var deleteLeaveData = function () {
            blockUI_M();
            var r = confirm("刪除後資料將無法恢復，確定刪除?");
            if (r == true) {
                var deleteId = attr_M(this, "deleteId");
                var data = "deleteId=" + deleteId + "&action=deleteLeaveData";
                var success = function (back) {
                    if (back == "成功") {
                        alert("假單申請已刪除");
                        location.reload();
                    }
                };
                var error = function (e) { Log_M("deleteLeaveData error=" + e); unBlockUI_M(); };

                ajax_M(takeLeaveDetailHandlerUrl_G, data, success, error);
            }
        };
        var getLeaveDetail = function () {
            var exId = EX_id_G;
            if (isEmptyStr(EX_id_G)) {
                exId = attr_M(this, "exId");
            }
            var data = "EX_id=" + exId + "&action=getLeaveDetail";
            var success = function (back) {
                getAnnualLeaveAndCompensatoryLeaveData();
                var json = jsonParse_M(back);
                text_M("#leaveEX_id", json.EX_id);
                text_M("#leaveEX_Name", json.EX_Name);
                text_M("#leaveEX_TypeName", json.EX_TypeName);
                text_M("#leaveStartDate", json.EX_SDate);
                text_M("#leaveEndDate", json.EX_EDate);
                text_M("#leaveEX_Day", json.EX_Day);
                text_M("#leaveEX_Hour", json.EX_Hour);
                text_M("#leaveEX_Reason", json.EX_Reason);
                text_M("#EX_Agent_Name", json.EX_Agent_Name);
                text_M("#EX_Agent_time", json.EX_Agent_time);
                var tempStatusName = emptyValue_M;
                if (isEmptyStr(json.EX_Agent_StatusName)) {
                    tempStatusName = "尚未簽核";
                } else {
                    tempStatusName = json.EX_Agent_StatusName;
                }
                text_M("#EX_Agent_StatusName", tempStatusName);


                text_M("#EX_Sign1_name", json.EX_Sign1_name);
                text_M("#EX_Sign1_time", json.EX_Sign1_time);
                if (isEmptyStr(json.EX_Sign1_StatusName)) {
                    tempStatusName = "尚未簽核";
                } else {
                    tempStatusName = json.EX_Sign1_StatusName;
                }
                text_M("#EX_Sign1_StatusName", tempStatusName);

                text_M("#EX_Sign2_name", json.EX_Sign2_name);
                text_M("#EX_Sign2_time", json.EX_Sign2_time);

                if (isEmptyStr(json.EX_Sign2_StatusName)) {
                    tempStatusName = "尚未簽核";
                } else {
                    tempStatusName = json.EX_Sign2_StatusName;
                }
                text_M("#EX_Sign2_StatusName", tempStatusName);

                text_M("#EX_Sign3_name", json.EX_Sign3_name);
                text_M("#EX_Sign3_time", json.EX_Sign3_time);

                if (isEmptyStr(json.EX_Sign3_StatusName)) {
                    tempStatusName = "尚未簽核";
                } else {
                    tempStatusName = json.EX_Sign3_StatusName;
                }
                text_M("#EX_Sign3_StatusName", tempStatusName);

                text_M("#EX_Govern_time", json.EX_Govern_time);
                if (isEmptyStr(json.EX_Govern_StatusName)) {
                    tempStatusName = "尚未簽核";
                } else {
                    tempStatusName = json.EX_Govern_StatusName;
                }
                text_M("#EX_Govern_StatusName", tempStatusName);
                text_M("#EX_Govern_Name", json.EX_Govern_Name);
                text_M("#leaveSlimDate", json.SlimDate);
                text_M("#leaveAdd_date", json.add_date);
                if (json.EX_Agent == U_Num_M) {
                    if (json.EX_Agent_Status != "1" && json.EX_Agent_Status != "2") {
                        show_M("#AgentGroup");
                        nextSigner_G = json.EX_Sign1_user;
                    }
                }
                if (json.EX_Sign1_user == U_Num_M) {
                    if (json.EX_Sign1_Status != "1" && json.EX_Sign1_Status != "2") {
                        show_M("#Sign1Group");
                        if (!isEmptyStr(json.EX_Sign2_user)) {
                            nextSigner_G = json.EX_Sign2_user;
                        }
                    }
                }
                if (json.EX_Sign2_user == U_Num_M) {
                    if (json.EX_Sign2_Status != "1" && json.EX_Sign2_Status != "2") {
                        show_M("#Sign2Group");
                        if (!isEmptyStr(json.EX_Sign3_user)) {
                            nextSigner_G = json.EX_Sign3_user;
                        }
                    }
                }
                if (json.EX_Sign3_user == U_Num_M) {
                    if (json.EX_Sign3_Status != "1" && json.EX_Sign3_Status != "2") {
                        show_M("#Sign3Group");
                    }
                }
                if (json.EX_Govern == U_Num_M) {
                    if (json.EX_Govern_Status != "1" && json.EX_Govern_Status != "2") {
                        show_M("#GovernGroup");
                    } else {
                        show_M("#GovernGroup");
                        hide_M("#leaveDataReturnOkBtn")
                    }
                }
                if (!isEmptyStr(json.EX_Sign2_name)) {
                    text_M("#EX_Sign2_name", json.EX_Sign2_name);
                    text_M("#EX_Sign2_time", json.EX_Sign2_time);
                    text_M("#EX_Sign2_StatusName", json.EX_Sign2_StatusName);
                    show_M("#EX_Sign2");
                }
                if (!isEmptyStr(json.EX_Sign3_name)) {
                    text_M("#EX_Sign3_name", json.EX_Sign3_name);
                    text_M("#EX_Sign3_time", json.EX_Sign3_time);
                    text_M("#EX_Sign3_StatusName", json.EX_Sign3_StatusName);
                    show_M("#EX_Sign3");
                }
                show_M("#leaveDetailDiv");
                hide_M("#leaveDataTab");
                unBlockUI_M();
            };
            var error = function (e) { Log_M("getLeaveDetail error=" + e); unBlockUI_M(); };
            ajax_M(takeLeaveDetailHandlerUrl_G, data, success, error);
        };
        //取得假單明細
        var getLeaveData = function () {
            //alert('取得假單明細!!!!!!!!!!!!');
            var selectType = attr_M(this, "selectType");
            Log_M("getLeaveData start");
            var EX_User = val_M("#EX_User");
            var EX_Status = val_M("#EX_Status");
            var EX_Type = val_M("#EX_Type");
            var StartDate = val_M("#StartDate");
            var EndDate = val_M("#EndDate");
            var keyWord = val_M("#keyWord");
            if (first_G) {
                EX_User = U_Num_M;
                first_G = false;
            } else {
                if (selectType == "nor") {
                    EX_User = U_Num_M;
                }
            }

            var data = "U_Num=" + EX_User + "&EX_Status=" + EX_Status + "&EX_Type=" + EX_Type + "&StartDate=" + StartDate + "&EndDate=" + EndDate + "&MenuNo=" + MenuNo_G + "&keyWord=" + keyWord + "&action=getLeaveData";
            var success = function (back) {
                Log_M("getLeaveData back=" + back);
                empty_M("#leaveData");
                var json = jsonParse_M(back);
                $takeLeaveDetailPageList.Table.makeTbody("#leaveData", json, 10, "#pageBar", deleteLeaveData, getLeaveDetail);
            };
            var error = function (e) { Log_M("getLeaveData error=" + e); unBlockUI_M(); };

            ajax_M(takeLeaveDetailHandlerUrl_G, data, success, error);
        };

        var getMCdata = function () {
            var data = "U_Num=" + U_Num_M + "&action=getMCdata";
            var success = function (back) {
                var json = jsonParse_M(back);
                $("#abcU_MDEP").val(json.U_MDEP);
                $("#abcU_Com").val(json.ComID);
                $("#abcU_MDEP").change();
            };
            ajax_M(CommonHandlerUrl_M, data, success);//<======================
        };
        //20220628下拉式選單選項變動後觸發
        var comMdepChangeFuc = function () {
            var emp = $(this).attr("EMP");
            var com = $(this).attr("Com");
            var mdep = $(this).attr("MDEP");
            $("#" + emp).empty();
            var abcU_ComVal = $("#" + com).val();
            var abcU_MDEPVal = $("#" + mdep).val();
            var url = CommonHandlerUrl_M;
            var data = "ComID=" + abcU_ComVal + "&U_MDEP=" + abcU_MDEPVal + "&action=getEmplist";
            var success = function (back) {
                Log_M("comMdepChangeFuc success");
                if (!isEmptyStr(back)) {
                    var json = jsonParse_M(back);
                    var sb = new string_M.StringBuilder();
                    sb.append("<option value=''>請選擇</option>")
                    $.each(json, function (i, v) {
                        sb.append("<option value='");
                        sb.append(v.U_Num);
                        sb.append("'>");
                        sb.append(v.U_Name);
                        sb.append("</option>");
                    });
                    $("#" + emp).append(sb.toString());
                    if (emp == "ES1") {
                        $("#" + emp).val(tempLeader_G);
                        tempLeader_G = "";
                        unBlockUI_M();
                    } else if (emp == "EA") {
                        $("#" + emp).val(tempMC_G);
                        tempMC_G = "";
                    }
                }
            };
            ajax_M(url, data, success);//<======================
        };
        //var openSearchAdvancedDiv = function () {
        //    alert('openSearchAdvancedDiv');
        //    show_M("#leaveAdvSearchDiv");
        //};

        var openSearchAdvancedDiv = function () {
            show_M("#leaveAdvSearchDiv");
        };

        var getComIdMdepEmpList = function () {
            Log_M("getComIdMdepEmpList start");
            //取得公司option
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getComIDlistHtmlTagOption", "COMID", "option");
            //取得部門option
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getMDEPlistHtmlTagOption", "DEPAR", "option", getMCdata);
            unBind_M(".comMdepChangeFuc");
            //下拉式選項變動後觸發
            onChange_M(".comMdepChangeFuc", comMdepChangeFuc);
        };

        var closeSecondaryDiv = function () {
            blockUI_M();

            var closeId = attr_M(this, "closeDivId");
            hide_M(closeId);
            Log_M("closeId=" + closeId)
            if (closeId == "#leaveDetailDiv") {
                location.href = "../../../public/TakeLeave/MEXCU/takeLeaveDetail.aspx?MENU_no=" + MenuNo_G;
                //getLeaveData();
            } else {
                unBlockUI_M();
            }
            show_M("#leaveDataTab");
        };

        var closeAddLeaveDataDiv = function () {
            hide_M("#addLeaveDataDiv");
            show_M("#leaveDataTab");
            show_M("#pageBar");
        };


        var openCompensatoryLeaveDiv = function () {
            blockUI_M();
            var data = "U_Num=" + U_Num_M + "&action=getCompensatoryLeaveData";
            var success = function (back) {
                var json = jsonParse_M(back);
                $getCompensatoryLeaveDataPageList.Table.makeTbody("#compensatoryLeaveDataTb", json, 10, "#pageBar");
                hide_M(".leaveDataGroup");
                show_M("#compensatoryLeaveDataTab");
            };
            var error = function (e) { Log_M("getLeaveData error=" + e); unBlockUI_M(); };
            ajax_M(takeLeaveDetailHandlerUrl_G, data, success, error);
        };

        var closeCompensatoryLeaveDataDiv = function () {
            show_M("#leaveDataTab");
            hide_M("#compensatoryLeaveDataTab");
        };

        //取得年假和補休資料
        var getAnnualLeaveAndCompensatoryLeaveData = function () {
            var U_Num = U_Num_G;
            if (isEmptyStr(U_Num_G)) {
                U_Num = U_Num_M;
            }
            var data = "U_Num=" + U_Num + "&U_MDEP=" + U_MDEP_M + "&action=getAnnualLeaveAndCompensatoryLeaveAndSickLeaveData";
            var success = function (back) {
                var json = jsonParse_M(back);
                unTakenAnnualLeaveDays_G = parseFloat(json.AnnualLeaveDays) - parseFloat(json.takenAnnualLeaveDays);
                unTakenCompensatoryLeaveDays_G = parseFloat(json.CompensatoryLeaveDays) - parseFloat(json.takenCompensatoryLeaveDays);
                unTakenSickLeaveDays_G = 30 - parseFloat(json.takenSickLeaveDays);
                //alert("json.takenAnnualLeaveDays.toString()=" + json.takenAnnualLeaveDays.toString());
                text_M("#takenAnnualLeaveDays", json.takenAnnualLeaveDays.toString());
                text_M("#AnnualLeaveDays", json.AnnualLeaveDays.toString());
                text_M("#takenCompensatoryLeaveDays", json.takenCompensatoryLeaveDays.toString());
                text_M("#CompensatoryLeaveDays", json.CompensatoryLeaveDays.toString());
            };
            var error = function (e) { Log_M("getAnnualLeaveAndCompensatoryLeaveData error=" + e); unBlockUI_M(); };
            ajax_M(takeLeaveDetailHandlerUrl_G, data, success, error);
        };
        //下拉式選單觸發動作
        var getAgentAndLeaderData = function () {
            var data = "U_Num=" + U_Num_M + "&action=getAgentAndLeaderData";
            var success = function (back) {
                Log_M("getAgentAndLeaderData success=");
                var json = jsonParse_M(back);
                val_M("#EA_Com", json.U_AgentCom);
                val_M("#EA_MDEP", json.U_AgentMdep);
                tempMC_G = json.U_Agent;

                val_M("#ES1_Com", json.U_LeaderCom);
                val_M("#ES1_MDEP", json.U_LeaderMdep);
                tempLeader_G = json.U_Leader;
                change_M("#ES1_MDEP");
                change_M("#EA_MDEP");
            };
            var error = function (e) { Log_M("getAgentData error=" + e); unBlockUI_M(); };

            ajax_M(takeLeaveDetailHandlerUrl_G, data, success, error);
        };

        //新增請假單資料
        var openAddLeaveDataDiv = function () {
            hide_M(".leaveDataGroup");
            hide_M("#pageBar");
            hide_M("#compensatoryLeaveDataTab");
            var sbHour = new StringBuilder_M();
            var sbMin = new StringBuilder_M();
            for (var i = 6; i < 24; i++) {
                sbHour.append("<option value='");
                sbHour.append(i);
                sbHour.append("'>");
                sbHour.append(i);
                sbHour.append("</option>");
            }
            append_M(".getHourFuc", sbHour.toString());
            for (var i = 0; i < 60; i++) {
                sbMin.append("<option value='");
                sbMin.append(i);
                sbMin.append("'>");
                sbMin.append(i);
                sbMin.append("</option>");
            }
            append_M(".getMinFuc", sbMin.toString());
            getAnnualLeaveAndCompensatoryLeaveData();
            val_M("#addLeaveEndHour", "12");
            show_M("#addLeaveDataDiv");
        };
        var checkAddLeaveDataInput = function () {
            var backTF = true;
            var emptyTF = false;
            var addLeaveRequireds = $(".addLeaveRequired");
            var tempVal = undefined;
            var emptyCount = 0;
            //檢查各項必填是否填寫
            $.each(addLeaveRequireds, function (i, v) {
                tempVal = val_M(v);
                if (isEmptyStr(tempVal)) {
                    alert(attr_M(v, "RequiredName") + "不能為空值");
                    $("#" + attr_M(v, "id")).focus();
                    emptyTF = true;
                }
            });

            if (!emptyTF) {
                //檢查如果請假日期超過四天是否填寫第二主管
                if (parseFloat(val_M("#addLeaveEX_Day") >= 4)) {
                    var addLeaveRequireds2 = $(".addLeaveRequired2");
                    $.each(addLeaveRequireds2, function (i, v) {
                        tempVal = val_M(v);
                        if (isEmptyStr(tempVal)) {
                            alert(attr_M(v, "RequiredName") + "不能為空值");
                            $("#" + attr_M(v, "id")).focus();
                            backTF = false;
                        }
                    });
                }
                var addLeaveEX_Type = val_M("#addLeaveEX_Type");
                //檢查是否超過可請年假
                var addLeaveEX_Hour = parseFloat(val_M("#addLeaveEX_Day")) * 8 + parseFloat(val_M("#addLeaveEX_Hour"));
                if (addLeaveEX_Type == "0001") {
                    if (addLeaveEX_Hour > unTakenAnnualLeaveDays_G * 8) {
                        alert("請假時數超過可請年假");
                        backTF = false;
                    }
                }

                //檢查是否超過補修
                if (addLeaveEX_Type == "0008") {
                    if (addLeaveEX_Hour > unTakenCompensatoryLeaveDays_G * 8) {
                        alert("請假時數超過可補休時數");
                        backTF = false;
                    }
                }
            }
            return backTF;
        };
        //新增假單
        var addLeaveData = function () {
            blockUI_M();
            var addLeaveDataPerTF = checkAddLeaveDataInput();//檢查
            var EX_Type = val_M("#addLeaveEX_Type");
            var StartDate = val_M("#addLeaveStartDate");
            var StartHour = val_M("#addLeaveStartHour");
            var StartMin = val_M("#addLeaveStartMin");
            var EndDate = val_M("#addLeaveEndDate");
            var EndHour = val_M("#addLeaveEndHour");
            var EndMin = val_M("#addLeaveEndMin");
            var EX_Agent = val_M("#EA");
            var EX_Agent_Name = text_M("#EA :selected");
            var EX_Agent_com = val_M("#EA_Com");
            var EX_Sign1_user = val_M("#ES1");
            var EX_Sign1_name = text_M("#ES1 :selected");
            var EX_Sign1_com = val_M("#ES1_Com");
            var EX_Sign2_user = val_M("#ES2");
            var EX_Sign2_name = text_M("#ES2 :selected") == "請選擇" ? "" : text_M("#ES2 :selected");
            var EX_Sign2_com = val_M("#ES2_Com");
            var EX_Sign3_user = val_M("#ES3");
            var EX_Sign3_name = text_M("#ES3 :selected") == "請選擇" ? "" : text_M("#ES3 :selected");
            var EX_Sign3_com = val_M("#ES3_Com");
            var EX_Day = val_M("#addLeaveEX_Day");
            var EX_Hour = val_M("#addLeaveEX_Hour");
            var EX_Reason = val_M("#addLeaveEX_Reason");
            var add_ip = IP_M;
            var add_user = U_Num_M;
            if (addLeaveDataPerTF) {
                var data = "EX_User=" + U_Num_M + "&EX_Name=" + U_Name_M + "&EX_Com=" + ComID_M + "&EX_Type=" + EX_Type + "&StartDate=" + StartDate + "&StartHour=" + StartHour + "&StartMin=" + StartMin + "&EndDate=" + EndDate + "&EndHour=" + EndHour + "&EndMin=" + EndMin + "&EX_Agent=" + EX_Agent + "&EX_Agent_Name=" + EX_Agent_Name + "&EX_Agent_com=" + EX_Agent_com + "&EX_Sign1_user=" + EX_Sign1_user + "&EX_Sign1_name=" + EX_Sign1_name + "&EX_Sign1_com=" + EX_Sign1_com + "&EX_Sign2_user=" + EX_Sign2_user + "&EX_Sign2_name=" + EX_Sign2_name + "&EX_Sign2_com=" + EX_Sign2_com + "&EX_Sign3_user=" + EX_Sign3_user + "&EX_Sign3_name=" + EX_Sign3_name + "&EX_Sign3_com=" + EX_Sign3_com + "&EX_Day=" + EX_Day + "&EX_Hour=" + EX_Hour + "&EX_Reason=" + EX_Reason + "&add_ip=" + add_ip + "&add_user=" + add_user + "&action=addLeaveData";
                var success = function (back) {
                    if (back == "成功") {
                        alert("假單申請已送出");
                        location.reload();
                    }
                };
                var error = function (e) { Log_M("addLeaveData error=" + e); unBlockUI_M(); };
                ajax_M(takeLeaveDetailHandlerUrl_G, data, success, error);
            } else {
                unBlockUI_M();
            }
        };
        var leaveApproveTF = function () {
            blockUI_M();

            var EX_id = text_M("#leaveEX_id");
            var statusName = attr_M(this, "statusName");
            var status = attr_M(this, "status");
            var data = "EX_id=" + EX_id + "&statusName=" + statusName + "&status=" + status + "&MS_ID=" + MS_ID_G + "&nextSigner=" + nextSigner_G + "&U_Num=" + U_Num_M + "&add_ip=" + IP_M + "&action=leaveApproveTF";
            var success = function (back) {
                if (back == "成功") {
                    alert("假單審核已送出");

                    location.reload();
                }
            };
            var error = function (e) { Log_M("leaveApproveTF error=" + e); unBlockUI_M(); };
            ajax_M(takeLeaveDetailHandlerUrl_G, data, success, error);
        };
        var onClickAll = function () {
            onClick_M("#openSearchAdvancedDiv", openSearchAdvancedDiv);
            onClick_M(".closeSecondaryDiv", closeSecondaryDiv);
            onClick_M(".getLeaveData", getLeaveData);
            onClick_M("#openCompensatoryLeaveDiv", openCompensatoryLeaveDiv);
            onClick_M("#closeCompensatoryLeaveDataBtn", closeCompensatoryLeaveDataDiv);
            onClick_M("#openAddLeaveDataDiv", openAddLeaveDataDiv);
            onClick_M("#closeAddLeaveDataDiv", closeAddLeaveDataDiv);
            onClick_M("#addLeaveDataBtn", addLeaveData);
            onClick_M(".StatusBtn", leaveApproveTF)
        };
        var startThisPage = function () {
            //alert('startThisPage');
            getComIdMdepEmpList();
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getEX_TypeOption", "EXCUE", "option");
            getAgentAndLeaderData();
            if (isEmptyStr(EX_id_G)) {
                getLeaveData();
            } else {
                hide_M("#leaveDataTab");
                getLeaveDetail();

            }
        };

        $(function () {
            blockUI_M();
            startThisPage();
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getEX_TypeOption", "EXCUE", "option");
            onClickAll();
        })
    </script>
</asp:Content>

