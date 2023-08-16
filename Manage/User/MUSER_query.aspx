<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MUSER_query.aspx.cs" Inherits="Manage_User_MUSER_query" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 10%;
            height: 23px;
        }

        .auto-style2 {
            width: 5%;
            height: 23px;
        }

        .auto-style3 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                            <h1 class="box-title"><b>ERP &gt;  員工資料維護作業</b> </h1>
                            <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title=""></div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div style="text-align: center">
                                <div id="main">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="1">
                                        <thead id="">
                                            <th class="" colspan="2">公司別：&nbsp;<span class="inputSearch marginRight20"></span><%--<select id="MP_Item" class="form-control" ><option value="">請選擇</option></select>--%>

                                                <select class="form-control" id="SelectCom_Title">
                                                    <option value="">不限123</option>
                                                </select>
                                            </th>
                                            <th class="" colspan="3">部門：&nbsp;<span><span class="inputSearch marginRight20"></span><%--<select id="MP_Item" class="form-control" ><option value="">請選擇</option></select>--%>
                                                <select class="form-control" id="SelectDept_Title">
                                                    <option value="">不限456</option>
                                                </select>
                                       
                                            </th>
                                            <th class="" colspan="3">關鍵字：&nbsp;<span><span class="inputSearch marginRight20"></span><%--<select id="MP_Item" class="form-control" ><option value="">請選擇</option></select>--%>
                                                <input type="text" name="keyWord" id="keyWord" placeholder="查尋關鍵字..." class="form-control">
                                        
                                            </th>
                                            
                                            <th class="" colspan="3">
                                                <button type="button" class="btn btn-info btn-flat searchCustomerDataFuc qPer" id="searchCustomerData">查詢</button>
                                                &nbsp; &nbsp;
                                                 <button type="button" id="CustomUserSETimeBtn" class="btn btn-primary btn-flat addPer">使用者自訂上下班時間</button>
                                            </th>
                                            <th class="" colspan="3">
                                                <%--員工資料維護作業-新增--%>
                                                <button type="button" id="AddMUSERDataWindowBtn" class="btn btn-primary btn-flat addPer">新增使用者</button>
                                            </th>


                                            <tr class="bgBlue">
                                                <th class="auto-style1" style="text-align: center;">員工編號</th>
                                                <th class="auto-style1" style="text-align: center;">姓名</th>
                                                <th class="auto-style2" style="text-align: center;">職稱</th>
                                                <th class="auto-style1" style="text-align: center;">主要部門</th>
                                                <th class="auto-style1" style="text-align: center;">所屬公司</th>
                                                <th class="auto-style2" style="text-align: center;">分機</th>
                                                <th class="auto-style1" style="text-align: center;">首頁權限</th>
                                                <th class="auto-style3" style="width 10%; text-align: center;">選單權限</th>
                                                <th class="auto-style1" style="text-align: center;">報表權限</th>
                                                <th class="auto-style1" style="text-align: center;">分析師產品權限</th>
                                                <th class="auto-style2" style="text-align: center;">修改</th>
                                                <th class="auto-style2" style="text-align: center;">刪除</th>
                                            </tr>

                                        </thead>
                                        <tbody id="muserData">
                                        </tbody>
                                    </table>
                                </div>
                                <div style="text-align: center">
                                    <div id="pageBar" style="margin: 0 auto;"></div>
                                </div>
                                <%--新增使用者畫面--%>
                                <div id="AddMUSERDataWindowDIV" class="divBorder startHide">
                                    <!--新增使用者START-->
                                    <td align="center">
                                        <table width="98%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td align="left" valign="top" colspan="4">
                                                    <h3>員工資料維護作業-新增</h3>
                                                </td>

                                                <td align="center" valign="top">
                                                    <table width="98%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td height="24"></td>
                                                        </tr>
                                                        <tr>
                                                            <td height="24"></td>
                                                        </tr>
                                                    </table>
                                                </td>


                                                <tr class="12-k">
                                                    <td colspan="4" align="center" bgcolor="e5e5e5">基本資料</td>
                                                </tr>
                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td width="15%" align="right">員工編號：</td>
                                                <td width="35%">
                                                    <input type="text" id="U_Num" maxlength="10">
                                                </td>
                                                <td width="15%" align="right">姓名：</td>
                                                <td width="35%">
                                                    <input type="text" id="U_Name" maxlength="10">
                                                </td>

                                            </tr>

                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td align="right">密碼：</td>
                                                <td width="35%">
                                                    <input type="text" id="U_PWD" maxlength="10">
                                                    <%--<td><input type="password" name="U_PWD"  maxlength="30" class="box"  --%>
                                                </td>
                                                <td align="right">密碼確認：</td>
                                                <td width="35%">
                                                    <input type="text" id="U_PWD_CHECK" maxlength="10">
                                                    <%--<td><input type="password" name="U_PWD_CHECK"  maxlength="30" class="box" ></td>--%>
                                            </tr>
                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td align="right">所屬部門：</td>
                                                <td>

                                                    <select id="SelectDept">
                                                    </select>
                                                </td>
                                                <td align="right">所屬公司：</td>
                                                <td>

                                                    <select id="SelectCom"></select>


                                                </td>
                                            </tr>

                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td width="15%" align="right">等級：</td>
                                                <td width="35%">
                                                    <select id="SelectLevel">
                                                    </select>

                                                </td>
                                                <td width="15%" align="right">職稱：</td>
                                                <td width="35%">
                                                    <select id="SelectPosit">
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td width="15%" align="right">磁卡號碼：</td>
                                                <td width="35%">
                                                    <input type="text" name="U_Card" id="U_Card" maxlength="10">
                                                </td>
                                                <td width="15%" align="right">分機號碼：</td>
                                                <td width="35%">
                                                    <input type="text" name="U_Tel" id="U_Tel" maxlength="10">
                                                </td>
                                            </tr>

                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td align="right">電子郵件：</td>
                                                <td>
                                                    <input type="text" name="EMail" id="EMail" maxlength="10">
                                                </td>
                                                <td align="right">是否打卡：</td>
                                                <td>
                                                    <input type="checkbox" id="PunchCard_tag" class="PunchCard_tag" name="PunchCard_tag" size="60" maxlength="100">
                                                </td>
                                            </tr>
                                            <tr class="12-k" bgcolor="#F7F6F3">

                                                <td align="right">到職日：</td>
                                                <td>
                                                    <input class="form-control datepicker addCustomerDataInput" id="StartDate">
                                                </td>
                                                <td align="right">離職日：</td>
                                                <td>

                                                    <input class="form-control datepicker addCustomerDataInput" id="LeaveDate">
                                                </td>
                                            </tr>

                                            <tr class="12-k">
                                                <td colspan="4" align="center" bgcolor="e5e5e5">詳細資料</td>
                                            </tr>
                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td align="right">夾帶附件：</td>
                                                <td colspan="3"></td>
                                            </tr>
                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td align="right">身分證字號：</td>
                                                <td>
                                                    <input type="text" id="U_PID" id="U_PID" size="15" maxlength="10">
                                                </td>
                                                <td align="right">出生年月日：</td>
                                                <td>
                                                    <input class="form-control datepicker addCustomerDataInput" id="BirthDay_Date">
                                                </td>
                                            </tr>

                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td colspan="4" align="center">
                                                    <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="E4E4E4">
                                                        <tr align="center" class="12-k">
                                                            <td width="15%" rowspan="4" bgcolor="F7F6F3" align="right">教育程度：</td>
                                                            <td width="28%" bgcolor="F7F6F3">學校名稱</td>
                                                            <td width="28%" bgcolor="F7F6F3">院系科別</td>
                                                            <td width="29%" bgcolor="F7F6F3">畢業或肄業</td>
                                                        </tr>

                                                        <tr class="12-k">
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="School_Name1" size="20" maxlength="20"></td>
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="School_Dep1" size="20" maxlength="20"></td>
                                                            <td bgcolor="F7F6F3">
                                                                <select id="School_Grd1">
                                                                    <option value="">請選擇</option>
                                                                    <option value="畢業">畢業</option>
                                                                    <option value="肄業">肄業</option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr class="12-k">
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="School_Name2" size="20" maxlength="20"></td>
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="School_Dep2" size="20" maxlength="20"></td>
                                                            <td bgcolor="F7F6F3">
                                                                <select id="School_Grd2">
                                                                    <option value="">請選擇</option>
                                                                    <option value="畢業">畢業</option>
                                                                    <option value="肄業">肄業</option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr class="12-k">
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="School_Name3" size="20" maxlength="20"></td>
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="School_Dep3" size="20" maxlength="20"></td>
                                                            <td bgcolor="F7F6F3">
                                                                <select id="School_Grd3">
                                                                    <option value="">請選擇</option>
                                                                    <option value="畢業">畢業</option>
                                                                    <option value="肄業">肄業</option>
                                                                </select>
                                                            </td>
                                                        </tr>

                                                    </table>
                                                </td>
                                            </tr>


                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td colspan="4" align="center">
                                                    <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="E4E4E4">
                                                        <tr align="center" class="12-k">
                                                            <td width="15%" rowspan="4" bgcolor="F7F6F3" align="right">重要經歷：</td>
                                                            <td width="20%" bgcolor="F7F6F3">服務機關</td>
                                                            <td width="10%" bgcolor="F7F6F3">職位</td>
                                                            <td width="15%" bgcolor="F7F6F3">工作內容</td>
                                                            <td width="15%" bgcolor="F7F6F3">任職期間</td>
                                                            <td width="15%" bgcolor="F7F6F3">離職原因</td>
                                                            <td width="10%" bgcolor="F7F6F3">薪給</td>
                                                        </tr>
                                                        <tr class="12-k">
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="Be_Com1" size="15" maxlength="20"></td>
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="Be_Job1" size="10" maxlength="20"></td>
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="Be_Res1" size="10" maxlength="50"></td>
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="Be_Date1" size="10" maxlength="30"></td>
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="Be_Leave1" size="10" maxlength="20"></td>
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="Be_Salary1" size="5" maxlength="20"></td>
                                                        </tr>
                                                        <tr class="12-k">
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="Be_Com2" size="15" maxlength="20"></td>
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="Be_Job2" size="10" maxlength="20"></td>
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="Be_Res2" size="10" maxlength="20"></td>
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="Be_Date2" size="10" maxlength="20"></td>
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="Be_Leave2" size="10" maxlength="20"></td>
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="Be_Salary2" size="5" maxlength="20"></td>
                                                        </tr>
                                                        <tr class="12-k">
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="Be_Com3" size="15" maxlength="20"></td>
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="Be_Job3" size="10" maxlength="20"></td>
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="Be_Res3" size="10" maxlength="20"></td>
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="Be_Date3" size="10" maxlength="20"></td>
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="Be_Leave3" size="10" maxlength="20"></td>
                                                            <td bgcolor="F7F6F3">
                                                                <input type="text" id="Be_Salary3" size="5" maxlength="20"></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td align="right">證照狀態：</td>
                                                <td colspan="3">
                                                    <input type="checkbox" id="License_I" class="License_I" name="License_I">投信投顧業務員
													<input type="checkbox" id="License_A" class="License_A" name="License_A">證券分析師
                                                </td>
                                            </tr>
                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td align="right">專業證照：</td>
                                                <td colspan="3">
                                                    <textarea name="License_Detail" id="License_Detail" rows="6" cols="80"></textarea></td>
                                            </tr>

                                            <tr bgcolor="#F7F6F3">
                                                <td align="right">戶籍地址：</td>
                                                <td align="left" colspan="3">縣/市：
                                                <span>
                                                    <select id="SelectCounty">
                                                    </select>
                                                </span>
                                                    鄉鎮市區：
                                                    <span>
                                                        <select id="SelectTownShip"></select>
                                                    </span>
                                                    <span>
                                                        <input name="ZipCode" id="ZipCode" type="text" size="5" maxlength="10">
                                                    </span>
                                                    <span>
                                                        <input name="HAddress" id="HAddress" type="text" size="40" maxlength="200">
                                                    </span>
                                                </td>
                                                <td align="left"></td>
                                                <td align="left"></td>
                                                <td align="left"></td>
                                            </tr>
                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td align="right">現居住所：</td>
                                                <td align="left" colspan="3">縣/市：
                                                <span>
                                                    <select id="CountyNow"></select>
                                                </span>
                                                    鄉鎮市區：
                                                    <span>
                                                        <select id="SelectTownShipNow">
                                                        </select>
                                                    </span>
                                                    <span>
                                                        <input name="ZipCodeNow" id="ZipCode_Now" type="text" size="5" maxlength="10">
                                                    </span>
                                                    <span>
                                                        <input name="HAddressNow" id="HAddress_Now" type="text" size="40" maxlength="200">
                                                    </span>
                                                    <span>
                                                        <%-- <input type="checkbox" id="add_same" name="add_same" value="true"><font color="005C9C">同戶籍地址</font>--%>
                                                        <input type="checkbox" id="add_same" class="add_same" name="add_same"><font color="005C9C">同戶籍地址</font>
                                                    </span>
                                                </td>
                                                <td align="left"></td>
                                                <td align="left"></td>
                                                <td align="left"></td>
                                            </tr>
                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td width="15%" align="right">住宅電話：</td>
                                                <td width="35%">
                                                    <span>
                                                        <select id="HTel_Zone"></select>
                                                    </span>
                                                    <%-- <%
													vrs_Mitem.Open "select ditcode,ddesc from MITEM where mitcode = 'IZONE' and ditcode <> '0000' and del_tag = '0' order by rank" ,conn,3,1
													%>
													<select name='HTel_Zone'>
													  <%for i=1 to vrs_Mitem.recordcount%>
													  <option value="<%=vrs_Mitem("ditcode")%>"><%=vrs_Mitem("ddesc")%></option>
													  <%vrs_Mitem.movenext
														 next%>
													</select>                      
												  <%vrs_Mitem.movefirst
												  vrs_Mitem.close%>--%>
                                                    <input type="text" id="HTel" size="15" maxlength="10">
                                                </td>
                                                <td width="15%" align="right">聯絡手機：</td>
                                                <td width="35%">
                                                    <input type="text" id="HMobile" size="15" maxlength="10">
                                                </td>
                                            </tr>
                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td width="15%" align="right">緊急連絡人：</td>
                                                <td width="35%">
                                                    <span>
                                                        <select id="ETel_Zone"></select>
                                                    </span>
                                                    <%--	<%
													vrs_Mitem.Open "select ditcode,ddesc from MITEM where mitcode = 'IZONE' and ditcode <> '0000' and del_tag = '0' order by rank" ,conn,3,1
													%>
													<select name='ETel_Zone'>
													  <%for i=1 to vrs_Mitem.recordcount%>
													  <option value="<%=vrs_Mitem("ditcode")%>"><%=vrs_Mitem("ddesc")%></option>
													  <%vrs_Mitem.movenext
														 next%>--%>
                                                    <%--</select>--%>
                                                    <%-- <%vrs_Mitem.movefirst
												  vrs_Mitem.close%>--%>
                                                    <input type="text" id="ETel" size="15" maxlength="10">
                                                </td>
                                                <td width="15%" align="right">緊急聯絡人手機：</td>
                                                <td width="35%">
                                                    <input type="text" id="EMobile" size="15" maxlength="10">
                                                </td>
                                            </tr>
                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td align="right">銀行帳號：</td>
                                                <td colspan="3">
                                                    <span>
                                                        <input name="BankCode_Text" id="BankCode_Text" type="text" size="15" maxlength="10" value="">
                                                    </span>

                                                    <%--開啟選擇銀行帳號動作 start--%>
                                                    <%--<input type="button" value="..." name="B16" onclick="ShowDialog('./bank_select.aspx')">--%>
                                                    <button type="button" id="BankSelectDataWindowBtn" class="btn btn-primary btn-flat addPer">..</button>
                                                    <%--開啟選擇銀行帳號動作 end--%>
                                                    <span>
                                                        <input id="BankCode_Value" type="text" size="5" maxlength="10" value="">
                                                    </span>
                                                    <input type="text" id="BankCodeName" size="25">
                                                </td>
                                            </tr>
                                            <tr class="12-k" bgcolor="#F7F6F3">
                                                <td align="right">備註：</td>
                                                <td colspan="3">
                                                    <textarea name="Note" id="Note" rows="6" cols="80"></textarea></td>
                                            </tr>
                                            <tr class="12-k" bgcolor="#E5E5E5">
                                                <td colspan="4" align="center">
                                                    <%-- <input type="submit" name="submit" class="btn" value="新增資料">--%>
                                                    <%--執行新增使用者動作--%>
                                                    <button type="button" class="btn btn-info btn-flat" id="AddMUSERDataClick">新增</button></td>
                                            </tr>
                                            <tr class="12-k" bgcolor="#E5E5E5">
                                                <td colspan="4" align="center">
                                                    <%-- <input type="submit" name="submit" class="btn" value="新增資料">--%>
                                                    <%--執行新增使用者動作--%>
                                                    <%--<button type="button" class="btn btn-info btn-flat" id="AddMUSERDataClick">新增</button></td>--%>
                                                    <input type="button" name="button" class="btn" value="回使用者列表" onclick="returntoMUSERquery()">
                                            </tr>
                                        </table>
                                    </td>

                                </div>
                                <%--使用者自訂上下班時間畫面TART--%>
                                <div id="AddCustomUSERSETimeMainDIV" class="divBorder startHide">
                                    <%--顯示目前自訂上下班時間資料--%>
                                    <%--============--%>
                                    


                                    <%--=============--%>
                                <!--新增使用者自訂上下班時間畫面START-->
                                   <label> <h3>新增使用者自訂上下班時間</h3></label>
                                    <table class="table table-hover" id="">
                                        <thead id="">

                                            <tr class="active">
                                                <th class="">
                                                    <label>所屬公司別:</label>
                                                    <select title="Select_Com" id="Select_Com" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc EAgroup addLeaveRequired">
                                                    </select>
                                                </th>
                                                <th class="">
                                                    <label>部門別:</label>
                                                    <select title="Select_Dept" id="Select_Dept" class="form-control getMDEPlistHtmlTagOption comMdepChangeFuc CF_Item0004" itemname="部門別" com="abcAttach_Com" mdep="abcAttach_MDEP" emp="abcAttach_User">
                                                    </select>
                                                </th>
                                                <th class="">
                                                    <label>人員:</label>
                                                    <select id="Select_Employ" class="form-control">
                                                    </select>
                                                </th>
                                                <th class="width20percent"></th>
                                            </tr>
                                             <tr class="active">
                                        <th class="width20percent">
                                            <label>上班時間:</label>
                                                                                       
                                            
                                                <label>
                                                <select class="form-control  getHourFuc addLeaveRequired" id="StartHour" requiredname="開始時間"></select></label><label>時</label>
                                            <label>
                                                <select class="form-control  getMinFuc " id="StartMin"></select></label><label>分</label>
                                           
                                            <%--<label>
                                                <select class="form-control  getHourFuc addLeaveRequired" id="addLeaveStartHour" requiredname="開始時間"></select></label><label>時</label>
                                            <label>
                                                <select class="form-control  getMinFuc " id="addLeaveStartMin"></select></label><label>分</label>
                                           --%>
                                        </th>
                                        <th class="width20percent">
                                          <label>下班時間:</label>
                                           
                                           
                                               <label>
                                                <select class="form-control  getHourFuc addLeaveRequired" id="EndHour" requiredname="開始時間"></select></label><label>時</label>
                                            <label>
                                                <select class="form-control  getMinFuc " id="EndMin"></select></label><label>分</label>
                                                 </span>
                                            </th>
                                        <th class="width20percent"> <button type="button" id="AddBtn" class="btn btn-primary btn-flat addPer">
                                        新增</th>
                                        <th class="width20percent"></th>
                                    </tr>
                                        </thead>
                                    </table>

                                    <!--使用者自訂上下班時間END-->
                       
                                     <div id="CustomUserSETimeDataListDiv" class="divBorder">
                                <table class="table table-hover leaveDataGroup" id="CustomUserSETimeDataTab">
                                    <thead>
                                        

                                        <tr class="bgBlue">
                                            <th class="auto-style1" style="text-align: center;">項次</th>
                                            <th class="auto-style2" style="text-align: center;">員工編號</th>
                                            <th class="auto-style3" style="text-align: center;">員工姓名</th>
                                            <th class="auto-style1" style="text-align: center;">自訂上班時間</th>
                                            <th class="auto-style1" style="text-align: center;">自訂下班時間</th>
                                            
                                        </tr>
                                    </thead>
                                   <%-- 使用者自訂上下班時間資料--%>
                                    <tbody id="CustomUserSETimeData">
                                    </tbody>

                                </table>
                            </div>
                               </div>


                           
                            </div>
                        </div>
                    </div>
        </section>
    </div>

    <script src="<%=getRelativePath()%>js/pageList/muserPageList.js" type="text/javascript"></script>
    <script>
        var MuserQueryHandlerUrl_G = "/Manage/User/MUSERHandler.ashx";
        var MuserQueryDataJson_G = null;
        //var MENU_no_G = "<%=getMENU_no()%>";
        //var M_ID_G = "<%=getM_ID()%>"; //客戶會員編號
        var NowPage_G = 1;
        //總頁數
        var TotalPage_G = 0;
        //每頁資料筆數
        var CountPerPage_G = 30;
        var pageNumClick = function () {
            var thisText = $(this).text();
            var goNext = true;
            if (thisText == ">>" || thisText == "<<") {
                if (NowPage_G <= TotalPage_G && NowPage_G >= 1) {
                    if (thisText == ">>") {
                        NowPage_G += 1;
                    } else if (thisText == "<<") {
                        NowPage_G -= 1;
                    }
                } else {
                    goNext = false;
                }
            } else {
                var clickPage = parseInt(thisText);
                if (clickPage <= TotalPage_G && clickPage >= 1) {
                    NowPage_G = clickPage;
                } else {
                    goNext = false;
                }
            }
            if (goNext) {

                makeHtml();
            }
        };
        //取得使用者資料============================================================start
        //使用者員工編號
        var U_Num_M = "<%=getU_Num()%>";
        //預設新使用者員工編號
        var newU_Num = "<%=newU_Num()%>";
        //var comMdepChangeFuc = function () {

        //    var SelectCom_Title = $.trim(val_M("#SelectCom_Title"));//取得所選的公司
        //    //alert(SelectCom_Title);
        //    var SelectDept_Title = $.trim(val_M("#SelectDept_Title"));//取得所選的分析師員工號碼
        //    var Select_Employ = $.trim(val_M("#Select_Employ"));//取得所選的分析師員工號碼
        //    var MR_DateY_Value = $.trim(val_M("#MR_DateY"));//取得所選的年
        //    var MR_DateM_Value = $.trim(val_M("#MR_DateM"));//取得所選的月
        //    //alert(SelectCom_Title);
        //    //var emp = $(this).attr("EMP");
        //    //var com = $(this).attr("Com");
        //    //var mdep = $(this).attr("MDEP");
        //    //$("#" + emp).empty();
        //    //var abcU_ComVal = $("#" + com).val();
        //    //var abcU_MDEPVal = $("#" + mdep).val();
        //    //var url = CommonHandlerUrl_M;
        //    var data = "ComID=" + abcU_ComVal + "&U_MDEP=" + abcU_MDEPVal + "&action=getEmplist";
        //    var success = function (back) {
        //        Log_M("comMdepChangeFuc success");
        //        if (!isEmptyStr(back)) {
        //            var json = jsonParse_M(back);
        //            var sb = new string_M.StringBuilder();
        //            sb.append("<option value=''>請選擇</option>")
        //            $.each(json, function (i, v) {
        //                sb.append("<option value='");
        //                sb.append(v.U_Num);
        //                sb.append("'>");
        //                sb.append(v.U_Name);
        //                sb.append("</option>");
        //            });
        //            $("#" + emp).append(sb.toString());
        //            if (emp == "ES1") {
        //                $("#" + emp).val(tempLeader_G);
        //                tempLeader_G = "";
        //                unBlockUI_M();
        //            } else if (emp == "EA") {
        //                $("#" + emp).val(tempMC_G);
        //                tempMC_G = "";
        //            }
        //        }
        //    };
        //    ajax_M(url, data, success);//<======================
        //};
        //取得下方分頁表列
        var getPageList = function () {
            $("#pageBar").empty();
            var startPageNum = NowPage_G - 5;
            if (startPageNum <= 0) {
                startPageNum = 1;
            }
            var showPageCount = 0;

            if (TotalPage_G >= 10) {
                showPageCount = 9;
            } else {
                showPageCount = TotalPage_G - 1;
            }

            var sb = new string_M.StringBuilder();
            //20220912mark
            //if (NowPage_G > 1) {
            //    sb.append("<span class='pageList pageNum'><a class='qPer' href='#'><<</a></span>");
            //}

            //for (var i = 0; i <= showPageCount; i++) {
            //    sb.append("<span class='pageList pageNum'><a class='qPer'  href='javascript: void(0)'>");
            //    sb.append(startPageNum);
            //    sb.append("</a></span>");
            //    startPageNum += 1;
            //}

            ////if (NowPage_G < TotalPage_G) {
            ////    sb.append("<span class='pageList pageNum'><a class='qPer' href='#'>>></a></span>");
            ////}

            //$("#pageBar").append(sb.toString());
            //append_M("#pageBar", sb.toString());
            //empty_M("#pageNum");
            ////$("#pageNum").empty();
            //append_M("#pageNum", NowPage_G + "/" + TotalPage_G);
            ////$("#pageNum").append(NowPage_G + "/" + TotalPage_G);
            //onClick_M(".pageNum", pageNumClick);
            ////$(".pageNum").on("click", pageNumClick);
            if (NowPage_G > 1) {
                sb.append("<span class='pageList pageNum'><a class='qPer' href='#'><<</a></span>");
            }

            for (var i = 0; i <= showPageCount; i++) {
                sb.append("<span class='pageList pageNum'><a class='qPer'  href='javascript: void(0)'>");
                sb.append(startPageNum);
                sb.append("</a></span>");
                startPageNum += 1;
            }

            if (NowPage_G < TotalPage_G) {
                sb.append("<span class='pageList pageNum'><a class='qPer' href='#'>>></a></span>");
            }

            //$("#pageBar").append(sb.toString());
            append_M("#pageBar", sb.toString());
            empty_M("#pageNum");
            //$("#pageNum").empty();
            append_M("#pageNum", NowPage_G + "/" + TotalPage_G);
            //$("#pageNum").append(NowPage_G + "/" + TotalPage_G);
            onClick_M(".pageNum", pageNumClick);
            //$(".pageNum").on("click", pageNumClick);
        };
        //var afterSuccessFuc = function () {
        //    onChange_M("#MP", function () {
        //        var type = val_M("#MP");
        //        $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#MP_Item", type, "option");
        //        ////取得[鄉鎮區市]
        //        //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "TownShip", "option");
        //    });
        //};
        //取得總頁數
        var getTotalPage = function (count) {
            var pageCount = count / CountPerPage_G;
            var pageCount1 = Math.floor(pageCount);
            var remainder = count % CountPerPage_G;
            if (remainder > 0) {
                pageCount1 += 1;
                pageCount = pageCount1;
            }
            return pageCount;
        };
        var getnoticeBoardDetail = function () {
            blockUI_M();
            //alert("取得公佈欄明細!!");
            var MS_ID = attr_M(this, "MS_ID");
            //var data = "File_num=" + File_num + "&action=getUpLoadData1";
            //alert("MS_ID" + MS_ID);
            //alert("MS_ID" + MS_ID);
            getBoardDataDetail(MS_ID);//取得詳細資料
            getUpLoadData1(MS_ID);//取得附件1
            getUpLoadData2(MS_ID);//取得附件2
            getUpLoadData3(MS_ID);//取得附件3
            Log_M("getnoticeBoardDetail start");
            var MS_Title = attr_M(this, "MS_Title");
            var adver_create_date = attr_M(this, "adver_create_date");
            var MS_ID = attr_M(this, "MS_ID");
            var MS_SenderName = attr_M(this, "MS_SenderName");
            var File_num = attr_M(this, "File_num");
            text_M("#mdMS_Title", MS_Title);//標題
            html_M("#mdMS_Text", adver_create_date);//mdMS_SenderName
            text_M("#mdMS_SenderName", adver_create_date);//發佈時間
            text_M("#file_num", File_num);
            //getUpLoadData(MS_ID);
            //getUpLoadData(MS_ID);
            //updateReadtag(MS_ID);
            show_M("#noticeBoardDetailDiv")
            hide_M("#NoticeBoardDataListDiv");
        };
        var deletenoticeBoardData = function () {
            var r = confirm("刪除後資料將無法恢復，確定刪除?");
            if (r) {
                var adver_id = attr_M(this, "adver_id");
                //alert(adver_id);
                Log_M("deletenoticeBoardData start");
                var data = "adver_id=" + adver_id + "&action=deletenoticeBoardData";
                var success = function (back) {
                    Log_M("deletenoticeBoardData back=" + back);
                    if (back == "成功") {
                        location.reload();
                    }

                };
                var error = function (e) { Log_M("deletenoticeBoardData error=" + e); unBlockUI_M(); };

                ajax_M(noticeBoardHandlerUrl_G, data, success, error);
                //startThisPage();
                location.reload();
            }
        };
        //生成資料畫面(20220726)
        var makeHtml = function () {
            $("#muserData").empty();
            if (MuserQueryDataJson_G.length != 0) {
                var sb = new string_M.StringBuilder();
                var n = 0;
                var startCount = (NowPage_G - 1) * 30 + 1;
                var endCount = 30 * NowPage_G;
                var isMember = false;
                $.each(MuserQueryDataJson_G, function (i, v) {
                    n += 1;
                    if (n >= startCount && n <= endCount) {
                        sb.append("<tr><th class='text-center'>");
                        sb.append(v.U_Num);//員工編號
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.U_Name);//姓名
                        /* sb.append("");*/
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.U_Item);//職稱
                        sb.append("</th><th class='text-center'>");
                        sb.append(v.DEPAR);//主要部門
                        //if (v.N_Call_tag == "1") {
                        //    sb.append("<img style='width:25px;height:25px;' src=/img/icon/nocall.jpg alt=請勿聯絡>");
                        //} else {
                        //    sb.append(v.ddesc);
                        //}
                        sb.append("</th><th class='text-center'>");
                        sb.append("<a class='' ");
                        sb.append("'>");
                        sb.append(v.ComLand);//所屬公司
                        //sb.append("</a></th><th class='text-center'>");
                        sb.append("</a></th><th class='text-center'>");
                        sb.append(v.U_Tel);//分機
                        sb.append("</th><th class='text-center'><a target='_blank' href='/Manage/User/Permission/MFUNT_report.aspx?U_Num=");//首頁權限網址
                        sb.append(v.U_Num);//員工編號
                        //sb.append("首頁權限");//首頁權限
                        //sb.append("'>首頁權限</th><th class='text-center'>");
                        sb.append("'>首頁權限");
                        sb.append("</th><th class='text-center'><a target='_blank' href='/Manage/User/Permission/MUSER_MenuSetup.aspx?U_Num=");//選單權限網址
                        sb.append(v.U_Num);//員工編號
                        //sb.append("首頁權限");//首頁權限
                        //sb.append("'>首頁權限</th><th class='text-center'>");
                        sb.append("'>選單權限");
                        sb.append("</th><th class='text-center'><a target='_blank' href='/Manage/Report/MREPO_query.aspx?U_Num=");//報表權限網址
                        sb.append(v.U_Num);//員工編號
                        //sb.append("首頁權限");//首頁權限
                        //sb.append("'>首頁權限</th><th class='text-center'>");
                        sb.append("'>報表權限");
                        sb.append("</th><th class='text-center'><a target='_blank' href='/Manage/User/Permission/MUSER_Analysts.aspx?U_Num=");//分析師產品權限網址
                        sb.append(v.U_Num);//員工編號
                        //sb.append("首頁權限");//首頁權限
                        //sb.append("'>首頁權限</th><th class='text-center'>");
                        sb.append("'>分析師產品權限");
                        //sb.append("</th><th class='text-center'><a target='_blank' href='/Manage/User/Permission/MFUNT_report.aspx?U_Num='");
                        //sb.append(v.U_Num);//員工編號
                        //sb.append("'></th>");
                        sb.append("</th><th class='text-center'><a target='_blank' href='/Manage/User/MUSER_edit.aspx?U_Num=");
                        sb.append(v.U_Num);//員工編號
                        sb.append("'>修</a></th>");
                        //if (v.OTel != "") {
                        //    sb.append("AA");
                        //    sb.append("-");
                        //    sb.append(v.OTel);
                        //    if (v.OTel_Sub != "") {
                        //        sb.append("#");
                        //        sb.append(v.ComLand);
                        //    }
                        //}
                        //if (v.OTel != "") {
                        //    sb.append(v.ComLand);
                        //    sb.append("-");
                        //    sb.append(v.ComLand);
                        //    if (v.OTel_Sub1 != "") {
                        //        sb.append("#");
                        //        sb.append(v.ComLand);
                        //    }
                        //}
                        //sb.append("<th class='text-center'>");

                        //if (v.HTel != "") {
                        //    sb.append(v.HTel_Zone);
                        //    sb.append("-");
                        //    sb.append(v.HTel);
                        //}
                        //if (v.HTel1 != "") {
                        //    sb.append(v.HTel_Zone1);
                        //    sb.append("-");
                        //    sb.append(v.HTel1);
                        //}
                        //sb.append("</th><th class='text-center'>");
                        //sb.append(v.add_date);
                        sb.append("</th>");
                        sb.append("<th class='text-center'><a href='#' class='deleteCustomerData delPer' MID='");
                        sb.append(v.M_ID);
                        sb.append("'>刪</a></th>");
                        sb.append("</tr>");
                    }
                });


                TotalPage_G = getTotalPage(n);
                //alert('append_M("#customerData", sb.toString());');
                append_M("#muserData", sb.toString());
                // $("#customerData").append(sb.toString());
                onClick_M(".deleteCustomerData", function () {
                    var MID = $(this).attr("MID");
                    var r = confirm("刪除後資料將無法恢復，確定刪除?");
                    console.log(r);
                    if (r == true) {
                        deleteCustomerData(MID);
                    }

                });
                /*$(".deleteCustomerData").on("click", function () {
                    var MID = $(this).attr("MID");
                    var r = confirm("刪除後資料將無法恢復，確定刪除?");
                    console.log(r);
                    if (r == true) {
                        deleteCustomerData(MID);
                    }
 
                });*/
            } else {
                alert("查無資料");
                NowPage_G = 1;
                TotalPage_G = 1;
            }
            //製作頁數列表
            getPageList();

            //頁面解鎖
            unBlockUI_M();
        };
        var IP_G = "<%=getIP()%>";
        //scriptH
        var MuserQueryHandlerUrl_G = "/Manage/User/MUSERHandler.ashx";
        //取得使用者自訂上下班時間資料列表(條件:adver_depart_id,keyword)[按下查詢後][20221227]
        var getCustomUserSETimeData = function () {
            //alert('getnoticeBoardData');
            var adver_depart_id = val_M("#abcAttach_MDEP");//發佈部門代號(查詢條件)
            var keyword = val_M("#keyWord");//關鍵字(查詢條件)
            //var adver_depart_id = val_M("#adver_depart_id");
            //alert(adver_depart_id);
            var data = "U_Num=" + U_Num_M + "&adver_depart_id=" + adver_depart_id + "&keyWord=" + keyword + "&action=getCustomUserSETimeData";
            //var data = "";//要帶入的參數
            var success = function (back) {
                var json = jsonParse_M(back);
                noticeBoardDataJson = json;
                $("#CustomUserSETimeData").empty();
                //顯示使用者自訂上下班時間資料列表(
                $muserPageList.Table.makeCustomUserSETimeDataTbody("#CustomUserSETimeData", json, 10, "#pageBar", deletenoticeBoardData, getnoticeBoardDetail);//取得公佈欄資料
            };
            var error = function (e) { Log_M("getnoticeBoardData error=" + e); unBlockUI_M(); };
            ajax_M(MuserQueryHandlerUrl_G, data, success, error);
        };
        
        var jsonParse_M = function (str) {
            return JSON.parse(str);
        };
        //傳送資料 ajax_M
        var ajax_M = function (url, data, success, error) {
            /* alert('call customerManageHandler!!!!!'+url);*/
            $.ajax({
                url: url,
                data: data,
                method: 'POST',
                success: success,
                error: error
            });
        };
        var returntoMUSERquery = function () {
            //alert('!!');
            //alert('returntoMUSERquery');
            show_M("#customerAdvSearchDiv");
            show_M("#customerDataTab");
            //show_M("#AddMCMSFTFDataWindow");
            //hide_M("#todayContactTab");
            show_M("#customerAdvSearchDiv");
            show_M("#customerDataTab");
            //show_M("#AddMCMSFTFDataWindow");
            show_M("#todayContactTab");
            show_M("#pageBar");
            show_M('#main');
            hide_M("#AddMUSERDataWindowDIV");
            // show_M("#customerAdvSearchDiv");
        };
        //打開新增使用者視窗========================start
        var openAddMUSERDataWindow = function () {
            //alert('!!');
            //alert('openAddMCMSFTFDataWindow');
            hide_M("#customerAdvSearchDiv");
            hide_M("#customerDataTab");
            //show_M("#AddMCMSFTFDataWindow");
            //hide_M("#todayContactTab");
            hide_M("#customerAdvSearchDiv");
            hide_M("#customerDataTab");
            //show_M("#AddMCMSFTFDataWindow");
            hide_M("#todayContactTab");
            hide_M("#pageBar");
            hide_M('#main');
            show_M("#AddMUSERDataWindowDIV");
            // show_M("#customerAdvSearchDiv");
        };
        //打開新增使用者視窗========================end
        //打開使用者自訂上下班時間視窗========================start
        var openCustomUserSETimeWindow = function () {
            //alert('!!');
            //alert('openAddMCMSFTFDataWindow');
            hide_M("#customerAdvSearchDiv");
            hide_M("#customerDataTab");
            //show_M("#AddMCMSFTFDataWindow");
            //hide_M("#todayContactTab");
            hide_M("#customerAdvSearchDiv");
            hide_M("#customerDataTab");
            //show_M("#AddMCMSFTFDataWindow");
            hide_M("#todayContactTab");
            hide_M("#pageBar");
            hide_M('#main');
            show_M("#CustomUSERSETimeDIV");
            // show_M("#customerAdvSearchDiv");
        };
        //打開使用者自訂上下班時間視窗========================end
        //CustomUserSETimeBtn
        //打開新增使用者自訂上下班時間視窗========================start

        var openAddCustomUserSETimeWindow = function () {
            hide_M("#customerAdvSearchDiv");
            hide_M("#customerDataTab");
            //show_M("#AddMCMSFTFDataWindow");
            //hide_M("#todayContactTab");
            hide_M("#customerAdvSearchDiv");
            hide_M("#customerDataTab");
            //show_M("#AddMCMSFTFDataWindow");
            hide_M("#todayContactTab");
            hide_M("#pageBar");
            hide_M('#main');
            hide_M("#CustomUSERSETimeDIV");
            hide_M("#AddCustomUSERSETimeDIV");
            show_M("#AddCustomUserSETimeDIV");
            show_M("#AddCustomUSERSETimeMainDIV");
            //alert('!!');
        };
        var getMCdata = function (type, num) {

        }
        // show_M("#customerAdvSearchDiv");
        //打開新增使用者自訂上下班時間視窗========================end
        //按下[新增(新增使用者)]按鈕後
        //將頁面的值傳給後端處理
        //var keyWord = val_M("#keyWord");//val_M("#keyWord");
        var addmuserData = function () {
            //對畫面欄位取值
            //PunchCard_tag_Value:是否打卡PunchCard_tag
            var PunchCard_tag_Value = $CommonTool.checkbox.getAllValue(".PunchCard_tag");//是否打卡是否勾選(有勾選擇為on)
            if (PunchCard_tag_Value == "on") {
                var PunchCard_tag_Value_Value = 1;
                //alert("是否打卡是否勾選.PunchCard_tag_Value:" + PunchCard_tag_Value + "__" + "是");//有勾選為1,沒有勾選為0
            }
            else {
                var PunchCard_tag_Value_Value = 0;
                //alert(".PunchCard_tag_Value:" + PunchCard_tag_Value + "__" + PunchCard_tag_Value_Value);

            }
            var add_same = $CommonTool.checkbox.getAllValue(".add_same");//同戶籍地址是否勾選(有勾選擇為on)
            //var add_same_value = val_M(document.getElementsByClassName('add_same'));//有勾選為1,沒有勾選為0
            //alert(add_same_value)
            if (add_same == "on") {
                var add_same_Value = 1;
                //alert("同戶籍地址是否勾選.add_same:" + add_same + "__" + "是");
            }
            else {
                var add_same_Value = 0;
                //alert(".add_same:" + add_same + "__" + add_same_Value);

            }
            var License_I = $CommonTool.checkbox.getAllValue(".License_I");//有勾選擇為on(投信投顧業務員)//有勾選為1,沒有勾選為0
            if (License_I == "on") {
                var License_I_Value = 1;//有勾選為1,沒有勾選為0
                //alert(License_I);
            }
            else {
                var License_I_Value = 0;//有勾選為1,沒有勾選為0
                //alert(License_I);
            }
            var License_A = $CommonTool.checkbox.getAllValue(".License_A");//證券分析師//有勾選為1,沒有勾選為0
            //alert(License_A);//證券分析師
            if (License_A == "on") {
                var License_A_Value = 1;//有勾選為1,沒有勾選為0
                //alert(License_A);
            }
            else {
                var License_A_Value = 0;//有勾選為1,沒有勾選為0
                //alert(License_A);
            }
            //對畫面欄位取值
            //基本資料
            //=========================
            var EmployID = $("#U_Num").val();//員工編號(EmployID)
            var EmployNAME = $("#U_Name").val();//員工姓名(EmployID)
            var U_PWD = $("#U_PWD").val();////密碼U_PWD
            var U_PWD_CHECK = $("#U_PWD_CHECK").val(); //密碼確認U_PWD_CHECK
            var SelectDept = val_M("#SelectDept");//所屬部門
            var SelectCom = val_M("#SelectCom");//所屬公司
            var SelecrCom_Text = $("#SelectCom option:selected").text();
            //alert(SelecrCom_Text);
            //var SelecrCom_Text = $("#SelectCom").find('option: selected').text();//所屬公司(中文)
            var SelectLevel = val_M("#SelectLevel");//等級
            var SelectPosit = val_M("#SelectPosit");//職稱
            var U_Card = val_M("#U_Card");//磁卡號碼
            var U_Tel = val_M("#U_Tel");//分機號碼
            var EMail = val_M("#EMail");//電子郵件EMail
            //var PunchCard_tag = val_M("#PunchCard_tag");//是否打卡(PunchCard_tag)
            var PunchCard_tag = PunchCard_tag_Value_Value;
            var StartDate = datePickDateTOsqlDate_M(val_M("#StartDate"));//到職日(StartDate)
            var LeaveDate = datePickDateTOsqlDate_M(val_M("#LeaveDate"));//離職日(LeaveDate)
            //=========================
            //詳細資料
            //=========================
            var U_PID = val_M("#U_PID");//身分證字號
            var BirthDay_Date = datePickDateTOsqlDate_M(val_M("#BirthDay_Date"));//出生年月日BirthDay_Date
            var School_Name1 = val_M("#School_Name1");//教育程度1[學校名稱]School_Name1
            var School_Dep1 = val_M("#School_Dep1");//教育程度1[院系科別]School_Dep1
            var School_Grd1 = val_M("#School_Grd1");//教育程度1[畢業或肄業]School_Grd1
            var School_Name2 = val_M("#School_Name2");//教育程度2[學校名稱]
            var School_Dep2 = val_M("#School_Dep2");//教育程度2[院系科別]
            var Schol_Grd2 = val_M("#School_Grd2");//教育程度2[畢業或肄業]
            var School_Name3 = val_M("#School_Name3");//教育程度3[學校名稱]
            var School_Dep3 = val_M("#School_Dep3");//教育程度3[院系科別]
            var School_Grd3 = val_M("#School_Grd3");//教育程度3[畢業或肄業]

            var Be_Com1 = val_M("#Be_Com1");//重要經歷1[服務機關]Be_Com1
            var Be_Job1 = val_M("#Be_Job1"); //重要經歷1[職位]Be_Job1
            var Be_Res1 = val_M("#Be_Res1");//重要經歷1[工作內容]Be_Res1
            var Be_Date1 = val_M("#Be_Date1"); //重要經歷1[任職期間]Be_Date1
            var Be_Leave1 = val_M("#Be_Leave1"); //重要經歷1[離職原因]Be_Leave1
            var Be_Salary1 = val_M("#Be_Salary1");  //重要經歷1[薪給]Be_Salary1

            var Be_Com2 = val_M("#Be_Com2");//重要經歷2[服務機關]Be_Com2
            var Be_Job2 = val_M("#Be_Job2");//重要經歷2[職位]Be_Job2
            var Be_Res2 = val_M("#Be_Res2");//重要經歷2[工作內容]Be_Res2
            var Be_Date2 = val_M("#Be_Date2");//重要經歷2[任職期間]Be_Date2
            var Be_Leave2 = val_M("#Be_Leave2"); //重要經歷2[離職原因]Be_Leave2
            var Be_Salary2 = val_M("#Be_Salary2");//重要經歷2[薪給]Be_Salary2

            var Be_Com3 = val_M("#Be_Com3");//重要經歷3服務機關]Be_Com3
            var Be_Job3 = val_M("#Be_Job3");//重要經歷3服務機關]Be_Com3
            var Be_Res3 = val_M("#Be_Res3"); //重要經歷3[工作內容]Be_Res3
            var Be_Date3 = val_M("#Be_Date3");//重要經歷2[任職期間]Be_Date3
            var Be_Leave3 = val_M("#Be_Leave3");//重要經歷3[離職原因]Be_Leave3
            var Be_Salary3 = val_M("#Be_Salary3");//重要經歷2[薪給]Be_Salary3



            var License_Detail = val_M("#License_Detail");
            var SelectCounty = val_M("#SelectCounty");//戶籍地址[縣市]
            var SelectTownShip = val_M("#SelectTownShip");//戶籍地址[鄉鎮市區]
            var CountyNow = val_M("#CountyNow");//現居住所[縣市]
            //現居住所[鄉鎮市區]
            var ZipCode = val_M("#ZipCode");//戶籍地址[郵遞區號]
            var HAddress = val_M("#HAddress")
            if (add_same_Value = 1) {
                var CountyNow = SelectCounty;
                var SelectTownShipNow = SelectTownShip
                var ZipCode_Now = ZipCode;
                var HAddress_Now = HAddress;
            }
            else {
                var CountyNow = val_M("#CountyNow"); //現居住所[縣市]
                var SelectTownShipNow = val_M("#SelectTownShipNow"); //現居住所[鄉鎮市區]
                var ZipCode_Now = val_M("#ZipCode_Now");//現居住所[郵遞區號]
                var HAddress_Now = val_M("#HAddress_Now");//現居住所[地址]
            }
            var HTel_Zone = val_M("#HTel_Zone");//住宅聯絡電話區碼
            var HTel = val_M("#HTel"); //住宅聯絡電話
            var HMobile = val_M("#HMobile");//聯絡手機
            var ETel_Zone = val_M("#ETel_Zone");//緊急聯絡電話區碼
            var ETel = val_M("#ETel");//緊急聯絡電話
            var EMobile = val_M("#EMobile");//緊急聯絡人手機
            var BankCode_Text = val_M("#BankCode_Text"); //銀行帳號(代碼)
            var BankCode_Value = val_M("#BankCode_Value");//銀行帳號(名稱)
            var BankCodeName = val_M("#BankCodeName"); //銀行帳號(帳號)
            var Note = val_M("#Note"); //備註

            var OCity = val_M("#OCity");
            var OTown = val_M("#OTown");
            var OAddress = val_M("#OAddress");
            //要傳入ashx的內容(要新增的資料內容)
            var data =
                //基本資料
                //=========================
                "EmployID=" + EmployID//員工編號(EmployID)=>U_Num
                + "&EmployNAME=" + EmployNAME//員工姓名(EmployID)
                + "&U_PWD=" + U_PWD// $("#U_PWD").val();////密碼U_PWD
                + "&U_PWD_CHECK=" + U_PWD_CHECK// $("#U_PWD_CHECK").val(); //密碼確認U_PWD_CHECK
                + "&SelectDept=" + SelectDept// val_M("#SelectDept");//所屬部門
                + "&SelectCom=" + SelectCom// val_M("#SelectCom");//所屬公司(
                + "&SelecrCom_Text=" + SelecrCom_Text// val_M("#SelectCom");//所屬公司(中文名稱)
                + "&SelectLevel=" + SelectLevel// val_M("#SelectLevel");//等級
                + "&SelectPosit=" + SelectPosit// val_M("#SelectPosit");//職稱
                + "&U_Card=" + U_Card// val_M("#U_Card");//磁卡號碼
                + "&U_Tel=" + U_Tel// val_M("#U_Tel");//分機號碼
                + "&EMail=" + EMail// val_M("#EMail");//電子郵件EMail
                + "&PunchCard_tag=" + PunchCard_tag// val_M("#PunchCard_tag");//是否打卡(PunchCard_tag)
                + "&StartDate=" + StartDate// datePickDateTOsqlDate_M(val_M("#StartDate"));//到職日(StartDate)
                + "&LeaveDate=" + LeaveDate// datePickDateTOsqlDate_M(val_M("#LeaveDate"));//離職日(LeaveDate)
                //=========================
                //詳細資料
                //=========================
                + "&U_PID=" + U_PID// val_M("#U_PID");//身分證字號
                + "&BirthDay_Date=" + BirthDay_Date// datePickDateTOsqlDate_M(val_M("#BirthDay_Date"));//出生年月日BirthDay_Date
                + "&School_Name1=" + School_Name1// val_M("#School_Name1");//教育程度1[學校名稱]School_Name1
                + "&School_Dep1=" + School_Dep1// val_M("#School_Dep1");//教育程度1[院系科別]School_Dep1
                + "&School_Grd1=" + School_Grd1// val_M("#School_Grd1");//教育程度1[畢業或肄業]School_Grd1
                + "&School_Name2=" + School_Name2// val_M("#School_Name3");//教育程度2[學校名稱]
                + "&School_Dep2=" + School_Dep2// val_M("#School_Dep2");//教育程度2[院系科別]
                + "&Schol_Grd2=" + Schol_Grd2// val_M("#School_Grd2");//教育程度2[畢業或肄業]
                + "&School_Name3=" + School_Name3// val_M("#School_Name3");//教育程度3[學校名稱]
                + "&School_Dep3=" + School_Dep3// val_M("#School_Dep3");//教育程度3[院系科別]
                + "&School_Grd3=" + School_Grd3// val_M("#School_Grd3");//教育程度3[畢業或肄業]
                + "&Be_Com1=" + Be_Com1// val_M("#Be_Com1");//重要經歷1[服務機關]Be_Com1
                + "&Be_Job1=" + Be_Job1// val_M("#Be_Job1"); //重要經歷1[職位]Be_Job1
                + "&Be_Res1=" + Be_Res1// val_M("#Be_Res1");//重要經歷1[工作內容]Be_Res1
                + "&Be_Date1=" + Be_Date1// val_M("#Be_Date1"); //重要經歷1[任職期間]Be_Date1
                + "&Be_Leave1=" + Be_Leave1// val_M("#Be_Leave1"); //重要經歷1[離職原因]Be_Leave1
                + "&Be_Salary1=" + Be_Salary1// val_M("#Be_Salary1"); //重要經歷1[薪給]Be_Salary1
                + "&Be_Com2=" + Be_Com2// val_M("#Be_Com2");//重要經歷2[服務機關]Be_Com2
                + "&Be_Job2=" + Be_Job2// val_M("#Be_Job2");//重要經歷2[職位]Be_Job2
                + "&Be_Res2=" + Be_Res2// val_M("#Be_Res2");//重要經歷2[工作內容]Be_Res2
                + "&Be_Date2=" + Be_Date2// val_M("#Be_Date2");//重要經歷2[任職期間]Be_Date2
                + "&Be_Leave2=" + Be_Leave2// val_M("#Be_Leave2"); //重要經歷2[離職原因]Be_Leave2
                + "&Be_Salary2=" + Be_Salary2// val_M("#Be_Salary2");//重要經歷2[薪給]Be_Salary2
                + "&Be_Com3=" + Be_Com3// val_M("#Be_Com3");//重要經歷3服務機關]Be_Com3
                + "&Be_Job3=" + Be_Job3// val_M("#Be_Job3");//重要經歷3服務機關]Be_Com3
                + "&Be_Res3=" + Be_Res3// val_M("#Be_Res3"); //重要經歷3[工作內容]Be_Res3
                + "&Be_Date3=" + Be_Date3// val_M("#Be_Date3");//重要經歷2[任職期間]Be_Date3
                + "&Be_Leave3=" + Be_Leave3// val_M("#Be_Leave3");//重要經歷3[離職原因]Be_Leave3
                + "&Be_Salary3=" + Be_Salary3// val_M("#Be_Salary3");//重要經歷2[薪給]Be_Salary3
                + "&License_Detail=" + License_Detail// val_M("#License_Detail");
                + "&SelectCounty=" + SelectCounty// val_M("#SelectCounty");//戶籍地址[縣市]
                + "&SelectTownShip=" + SelectTownShip// val_M("#SelectTownShip");//戶籍地址[鄉鎮市區]
                + "&ZipCode=" + ZipCode// val_M("#ZipCode");//戶籍地址[郵遞區號]
                + "&CountyNow=" + CountyNow// val_M("#CountyNow"); //現居住所[縣市]
                + "&SelectTownShipNow=" + SelectTownShipNow// val_M("#SelectTownShipNow"); //現居住所[鄉鎮市區]
                + "&ZipCode_Now=" + ZipCode_Now// val_M("#ZipCode_Now");//現居住所[郵遞區號]
                + "&HAddress_Now=" + HAddress_Now// val_M("#HAddress_Now");//現居住所[地址]
                + "&HTel_Zone=" + HTel_Zone//住宅聯絡電話區碼
                + "&HTel=" + HTel// val_M("#HTel"); //住宅電話
                + "&HMobile=" + HMobile// val_M("#HMobile");//聯絡手機
                + "&ETel_Zone=" + ETel_Zone//緊急聯絡電話區碼
                + "&ETel=" + ETel// val_M("#ETel");//緊急聯絡人
                + "&EMobile=" + EMobile// val_M("#EMobile");//緊急聯絡人手機
                + "&PayrollBankID=" + BankCode_Value// val_M("#BankCode_Text"); //銀行帳號(代碼)=>PayrollBankID]銀行分支代碼
                + "&PayrollBankName=" + BankCode_Text// val_M("#BankCode_Value");//銀行帳號(名稱)=>[PayrollBankName]銀行名稱
                + "&PayrollBranchName=" + BankCodeName// val_M("#BankCodeName"); //銀行帳號(帳號)=>[PayrollBranchName]銀行分支帳號
                + "&Note=" + Note// val_M("#Note"); //備註
                + "&License_A=" + License_A
                + "&License_I=" + License_I
                + "&OCity" + OCity
                + "&OTown" + OTown
                + "&OAddress" + OAddress
                + "&action=addMUSERData";
            //= "EmployID=" + EmployID
            //    + "&EmployNAME=" + EmployNAME
            //    + "&U_PWD=" + U_PWD
            //    + "&U_PWD_CHECK=" + U_PWD_CHECK
            //    + "&SelectDept=" + SelectDept
            //    + "&SelectCom=" + SelectCom
            //    + "&SelectLevel=" + SelectLevel
            //    + "&SelectPosit=" + SelectPosit
            //    + "&U_Card=" + U_Card
            //    + "&U_Tel=" + U_Tel
            //    + "&EMail=" + EMail
            //    + "&PunchCard_tag=" + PunchCard_tag
            //    + "&StartDate=" + StartDate
            //    + "LeaveDate=" + LeaveDate
            + "&action=addMUSERData";
            var success = function (back) {
                alert('新增員工資料成功!')
            };
            var error = function (e) { Log_M("addMUSERData error=" + e); unBlockUI_M(); };
            //alert(data);
            ajax_M(MuserQueryHandlerUrl_G, data, success, error);
            //20220906待修改!!!
            /*
             var data = "MS_Title=" + MS_Title
                + "&MS_Sender=" + U_Num_M
                + "&MS_Receiver=" + MS_Receiver
                + "&MS_Text=" + MS_Text
                + "&add_User=" + U_Num_M
                + "&add_ip=" + IP_M
                + "&action=addMailData";
                var success = function (back) {
                var file1 = undefined;
                var file2 = undefined;
                var file3 = undefined;
                //進行上傳檔案動作
                if (!isEmptyStr(back)) {
                    file1 = document.getElementById("File1").files;
                    if (file1.length != 0) {
                        upload("File1", back);
                    }
                    file2 = document.getElementById("File2").files;
                    if (file2.length != 0) {
                        upload("File2", back);
                    }
                    file3 = document.getElementById("File3").files;
                    if (file3.length != 0) {
                        upload("File3", back);
                    }
                }
                hide_M("#addMailDiv");
                alert("新增郵件成功");
                unBlockUI_M();
                show_M("#mailDataTab");
            };
            var error = function (e) { Log_M("addMailData error=" + e); unBlockUI_M(); };
            ajax_M(MuserQueryHandlerUrl_G, data, success, error);
            
             */
        }
        //AddCustomUSERSETime
        //新增使用者自訂上下班時間
        var AddCustomUSERSETime = function () {
            
            var StartHour = val_M("#StartHour");
            var StartMin = val_M("#StartMin");
            var EndHour = val_M("#EndHour");
            var EndMin = val_M("#EndMin");
            var Select_Employ = val_M("#Select_Employ");
            //alert(Select_Employ);//使用者員工編號
            //alert(StartHour);
            //alert(StartMin);
            //alert(EndHour);
            //alert(EndMin);
            //新增使用者自訂上班時間動作
            var data = "StartHour=" + StartHour
                + "&StartMin=" + StartMin
                + "&EndHour=" + EndHour
                + "&EndMin=" + EndMin
                + "&Select_Employ=" + Select_Employ// 員工編號
                + "&action=addCustomUSERSETime";
            var success = function (back) {
                alert('新增使用者自訂上班時間成功!');
                //回到員工資料畫面
                location.href = "/manage/User/MUSER_query.aspx";
            };
            var error = function (e) { Log_M("addCustomUSERSETime error=" + e); unBlockUI_M(); };
            //alert(data);
            ajax_M(MuserQueryHandlerUrl_G, data, success, error);
           }

        //按下查詢紐
        var searchCustomerData = function () {
            //alert('searchCustomerData');
            //alert('Search!!');
            $("#muserData").empty();
            var keyWord = val_M("#keyWord");//val_M("#keyWord");
            //取得公司別
            var Com = val_M("#SelectCom_Title");
            // var adver_depart_id = val_M("#abcAttach_MDEP");//發佈部門代號(查詢條件)
            //取得部門
            var Dept = val_M("#SelectDept_Title");
            var data = "Dept=" + Dept + "&Com=" + Com + "&keyWord=" + keyWord + "&action=getMUSERData";//取得員工資料維護作業
            var success = function (back) {
                var json = jsonParse_M(back);
                $("#muserData").empty();
                //alert('Empty!!');
                MuserQueryDataJson_G = json;//取回的資料內容
                if (back != "成功") {
                    $("#muserData").empty();
                    makeHtml();//生成畫面
                }
            };
            var error = function (e) { Log_M("searchCustomerData error=" + e); unBlockUI_M(); };
            //alert(data);
            ajax_M(MuserQueryHandlerUrl_G, data, success, error);
        }
        var searchBankData = function () {
            alert('執行新增使用者動作')
            //alert('searchBankData');
            var BankKeyword = val_M("#BankKeyWord");
            //alert(BankKeyword);
            // //選擇銀行:SelectBank
            //getListHtmlTagOption: function (ul, idOrClassName, listType, htmlTagType, BankKeyWord)
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectBank", "Bank", "option", BankKeyword);
        }
        //選擇銀行按下[送出]
        var SendSelectBankFuc = function () {
            //alert('SendSelectBankFuc');
            var BankKeyword = val_M("#BankKeyWord");
            //所屬部門
            var SelectBank_Value = val_M("#SelectBank");//所選的銀行
            var SelectBank_Text = $("#SelectBank").find("option:selected").text();
            //alert(SelectBank_Value);
            //alert(SelectBank_Text);
            $("#BankCode_Text").attr("value", SelectBank_Text);
            $("#BankCode_Value").attr("value", SelectBank_Value);
            show_M("#AddMUSERDataWindowDIV");
        }

        //公司列表下拉式選單變動
        var afterSuccessFucMREGT01 = function () {
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept", "Dept", "option", "", "", Dept);
            var Select_Com = val_M("#Select_Com");//所選的公司
            var Select_Dept = val_M("#Select_Dept");//所選的部門
            //alert(Select_Com);
            //alert(Select_Dept);
            ////取得[員工]
            $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#SelectDept_Title", "Dept", Select_Com, "option", afterSuccessFucMREGT03);
            //取得部門option
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getMDEPlistHtmlTagOption", "DEPAR", "option", getMCdata);
            //getMREGT02ListHtmlTagOption_2: function (ul, idOrClassName, listType1,listType2, htmlTagType, afterSuccessFuc) {
            $Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ", Select_Com, Select_Dept, "option", afterSuccessFucMREGT03);//20221207進度(實做這個!!)
            ////取得[公司]
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom", "Com", "option");
            ////SelectCom_Title1
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom_Title12", "Com", "option", "", afterSuccFunc3, "");
            ////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept_Title1", "", "Dept", "option", Com);//所選的公司別產生相對應的部門(中文)
            ////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "", "TownShip", "option", county);//所選的城市產生相對應的鄉鎮市區(中文)
            //var SelectTownShip = val_M("#SelectTownShip");//所選的鄉鎮市區(代碼)
            //alert(SelectTownShip);
            //$("ZipCode").val(SelectTownShip);
            //$("ZipCode1").val("123");

            onChange_M("#MP", function () {
                $Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ", Select_Com, Select_Dept, "option", afterSuccessFucMREGT03);//20221207進度(實做這個!!)
            });


        };
        //部門列表下拉式選單變動
        var afterSuccessFucMREGT02 = function () {
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept", "Dept", "option", "", "", Dept);
            var SelectCom = val_M("#SelectCom_Title");//所選的公司

            ////取得[部門]
            $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#SelectDept_Title", "Dept", SelectCom, "option", afterSuccessFucMREGT03);
            //取得部門option
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getMDEPlistHtmlTagOption", "DEPAR", "option", getMCdata);
            $Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ", Select_Com, Select_Dept, "option", afterSuccessFucMREGT03);//20221207進度(實做這個!!)

            ////取得[公司]
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom", "Com", "option");
            ////SelectCom_Title1
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom_Title12", "Com", "option", "", afterSuccFunc3, "");
            ////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept_Title1", "", "Dept", "option", Com);//所選的公司別產生相對應的部門(中文)
            ////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "", "TownShip", "option", county);//所選的城市產生相對應的鄉鎮市區(中文)
            //var SelectTownShip = val_M("#SelectTownShip");//所選的鄉鎮市區(代碼)
            //alert(SelectTownShip);
            //$("ZipCode").val(SelectTownShip);
            //$("ZipCode1").val("123");

            onChange_M("#MP", function () {
                $Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ", Select_Com, Select_Dept, "option", afterSuccessFucMREGT03);//20221207進度(實做這個!!)
            });


        };
        var afterSuccessFucMREGT03 = function () {
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept", "Dept", "option", "", "", Dept);
            var Select_Com = val_M("#Select_Com");//所選的公司
            var Select_Dept = val_M("#Select_Dept");//所選的部門
            //alert(Select_Com);
            //alert(Select_Dept);
            ////取得[員工]
            $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#SelectDept_Title", "Dept", Select_Com, "option", afterSuccessFucMREGT03);
            //取得部門option
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, ".getMDEPlistHtmlTagOption", "DEPAR", "option", getMCdata);
            //getMREGT02ListHtmlTagOption_2: function (ul, idOrClassName, listType1,listType2, htmlTagType, afterSuccessFuc) {
            $Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ", Select_Com, Select_Dept, "option", afterSuccessFucMREGT03);//20221207進度(實做這個!!)
            ////取得[公司]
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom", "Com", "option");
            ////SelectCom_Title1
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom_Title12", "Com", "option", "", afterSuccFunc3, "");
            ////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept_Title1", "", "Dept", "option", Com);//所選的公司別產生相對應的部門(中文)
            ////$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "", "TownShip", "option", county);//所選的城市產生相對應的鄉鎮市區(中文)
            //var SelectTownShip = val_M("#SelectTownShip");//所選的鄉鎮市區(代碼)
            //alert(SelectTownShip);
            //$("ZipCode").val(SelectTownShip);
            //$("ZipCode1").val("123");

            onChange_M("#MP", function () {
                $Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ", Select_Com, Select_Dept, "option", afterSuccessFucMREGT03);//20221207進度(實做這個!!)
            });


        };
        var comMdepChangeFuc = function () {

            var SelectCom_Title = $.trim(val_M("#SelectCom_Title"));//取得所選的公司
            //alert(SelectCom_Title);
            var SelectDept_Title = $.trim(val_M("#SelectDept_Title"));//取得所選的分析師員工號碼
            var Select_Employ = $.trim(val_M("#Select_Employ"));//取得所選的分析師員工號碼
            var MR_DateY_Value = $.trim(val_M("#MR_DateY"));//取得所選的年
            var MR_DateM_Value = $.trim(val_M("#MR_DateM"));//取得所選的月
            var emp = $(this).attr("EMP");
            var com = $(this).attr("Com");
            var mdep = $(this).attr("MDEP");
            $("#" + emp).empty();
            var abcU_ComVal = $("#" + com).val();
            var abcU_MDEPVal = $("#" + mdep).val();
            var url = CommonHandlerUrl_M;
            //alert(SelectCom_Title);
            //var emp = $(this).attr("EMP");
            //var com = $(this).attr("Com");
            //var mdep = $(this).attr("MDEP");
            //$("#" + emp).empty();
            //var abcU_ComVal = $("#" + com).val();
            //var abcU_MDEPVal = $("#" + mdep).val();
            //var url = CommonHandlerUrl_M;
            var data = "ComID=" + abcU_ComVal + "&U_MDEP=" + abcU_MDEPVal + "&action=getEmplist";
            var success = function (back) {
                if (!isEmptyStr(back)) {
                    var json = jsonParse_M(back);
                    var sb = new string_M.StringBuilder();
                    sb.append("<option value=''>請選擇</option>")
                    $.each(json, function (i, v) {
                        sb.append("<option value='");
                        sb.append(v.U_Num);
                        sb.append("'>");
                        sb.append(v.empName);
                        sb.append("</option>");
                    });
                    $("#" + emp).append(sb.toString());
                    $("#" + emp).val(tempMC_G);
                    tempMC_G = "";
                    unBlockUI_M();
                }
            };
            ajax_M(url, data, success);//<======================
        };
        //打開選擇銀行帳號作業 - 新增視窗========================start
        var openBankSelectDataWindow = function () {

            //alert('openBankSelectDataWindow');
            //show_M("#customerAdvSearchDiv");
            //show_M("#customerDataTab");
            //show_M("#AddMCMSFTFDataWindow");
            hide_M("#AddMUSERDataWindowDIV");
            //show_M("#customerAdvSearchDiv");
            //show_M("#customerDataTab");
            //show_M("#AddMCMSFTFDataWindow");
            //show_M("#todayContactTab");
            //show_M("#pageBar");
            //show_M('#main');
            show_M("#BankSelectWindowDIV");
            //alert('選擇銀行!!!!!');
        };
        //打開選擇銀行帳號作業 - 新增視窗========================end
        //openBankSelectDataWindow
        //進行新增動作(20220905work)
        //var addMUSERData = function () {
        //    //alert('addMUSERData_Click!!');
        //}
        var getMUSERquery = function () {
            var data = "action=getERPcustomerWebPay" + "&keyWord=" + val_M("#keyWord") + "&PayStatus=" + val_M("#PayStatus") + "&U_MDEP=" + U_MDEP_M + "&ComID=" + ComID_M + "&U_Num=" + U_Num_M;
            var success = function (back) {
                var json = jsonParse_M(back);
                $muserPageList.Table.makeTbody("#ERPcustomerWebPaySearchTb", json, 10, "#pageBar", deleteData, getMid);
            };
            var error = function (e) { Log_M("getERPcustomerWebPay error=" + e); unBlockUI_M(); };
            ajax_M(ERPcustomerWebPayHandlerUrl_G, data, success, error);
        };
        ////取得分析師ListHtmlTagOption
        //var afterSuccessFuc = function () {
        //    onChange_M("#MP", function () {
        //        var type = val_M("#MP");
        //        $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#MP_Item", type, "option");
        //    });
        //};
        //取得[縣/市]後觸發事件(戶籍地址)
        var afterSuccessFuc2 = function () {
            var county = val_M("#SelectCounty");//所選的縣/市
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "", "TownShip", "option", county);//所選的城市產生相對應的鄉鎮市區(中文)
            var SelectTownShip = val_M("#SelectTownShip");//所選的鄉鎮市區(代碼)
            //alert(SelectTownShip);
            $("ZipCode").val(SelectTownShip);
            $("ZipCode1").val("123");


        };

        //取得[縣/市](現居住所:County_Now)後觸發事件(目前居住)
        var afterSuccessFuc1 = function () {
            var SelectCountyNow = val_M("#SelectCountyNow");//所選的縣/市
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShipNow", "TownShip", "option", SelectCountyNow);//所選的城市產生相對應的鄉鎮市區(中文)
            var SelectTownShipNow = val_M("#SelectTownShipNow");//所選的鄉鎮市區(代碼)
            //ZipCode
            //$("ZipCode").html(TownShip);
            //alert(SelectTownShipNow);
            //$("ZipCode1").val(SelectTownShipNow);
            //$("ZipCodeNow").val(SelectTownShipNow);
            //onChange_M("#SelectCounty", function () {
            //    var SelectCounty = val_M("#SelectCounty");//所選的鄉鎮市區(代碼)
            ////    //ZipCode
            ////    //$("ZipCode").html(TownShip);
            ////    alert("ABCDE999"+SelectCounty);
            ////    $("ZipCode").val(SelectTownShip);
            ////    //alert("所選的鄉鎮市區(代碼)"+SelectTownShip);
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "TownShip", "option", SelectCounty);//所選的城市產生相對應的鄉鎮市區
            //});
            //var county_Now = val_M("#SelectCounty_Now");//所選的縣/市
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip_Now", "TownShip", "option", county_Now);//所選的城市產生相對應的鄉鎮市區(中文)

        };

        var sbHour = new StringBuilder_M();
        var sbMin = new StringBuilder_M();

        var startThisPage = function () {
            //alert("MUSER_query.aspx");
            var data = "U_Num=" + U_Num_M + "&action=getMUSERData";//取得員工資料維護作業
            var success = function (back) {
                var json = jsonParse_M(back);
                MuserQueryDataJson_G = json;//取回的資料內容
                if (back != "成功") {
                    makeHtml();//生成畫面
                }
            };
            var error = function (e) { Log_M("deleteMailData error=" + e); unBlockUI_M(); };
            ajax_M(MuserQueryHandlerUrl_G, data, success, error);
            //====================
            for (var i = 6; i < 24; i++) {
                sbHour.append("<option value='");
                sbHour.append(i);
                sbHour.append("'>");
                sbHour.append(i);
                sbHour.append("</option>");
            }
            append_M(".getHourFunc", sbHour.toString());
            for (var i = 0; i < 60; i++) {
                sbMin.append("<option value='");
                sbMin.append(i);
                sbMin.append("'>");
                sbMin.append(i);
                sbMin.append("</option>");
            }
            append_M(".getMinFunc", sbMin.toString());
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
            $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Com", "Com", "option", afterSuccessFucMREGT01);
            $Common.MITEM.getMREGT02ListHtmlTagOption_1(CommonHandlerUrl_M, "#Select_Dept", "Dept", "option", afterSuccessFucMREGT02);//會呼叫
            //戶籍地址
            onChange_M("#SelectCounty", function () {
                var SelectCounty = val_M("#SelectCounty");//所選的城市(代碼)[戶籍地址]
                //getListHtmlTagOption: function (ul, idOrClassName, listType, htmlTagType, county)
                $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "TownShip", "option", SelectCounty);//所選的[城市]產生相對應的[鄉鎮市區]
                var SelectTownShip = val_M("#SelectTownShip");//所選的鄉鎮市區(代碼)
                //    //ZipCode
                //$("ZipCode").html(TownShip);
                //alert("ABCDEFGHHJJ999"+SelectCounty);

                $("ZipCode").val(SelectTownShip);
                //    //alert("所選的鄉鎮市區(代碼)"+SelectTownShip);
                //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "TownShip", "option", SelectCounty);//所選的城市產生相對應的鄉鎮市區
            });
            //====================
            onChange_M("#SelectTownShip", function () {
                var SelectTownShip = val_M("#SelectTownShip");//所選的鄉鎮市區(代碼)
                //    //ZipCode
                //    //$("ZipCode").html(TownShip);
                //alert("ZipCode:" + SelectTownShip);
                $("#ZipCode").attr("value", SelectTownShip);
                //    //alert("所選的鄉鎮市區(代碼)"+SelectTownShip);
                //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "TownShip", "option", SelectCounty);//所選的城市產生相對應的鄉鎮市區
            });
            onChange_M("#CountyNow", function () {
                var CountyNow = val_M("#CountyNow");//所選的鄉鎮市區(代碼)
                //    //ZipCode
                //    //$("ZipCode").html(TownShip);
                //alert("ABCDEFGHHJJ999"+SelectCounty);
                //    $("ZipCode").val(SelectTownShip);
                //    //alert("所選的鄉鎮市區(代碼)"+SelectTownShip);

                $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShipNow", "TownShip", "option", CountyNow);//所選的城市產生相對應的鄉鎮市區
            });
            //====================
            onChange_M("#SelectTownShipNow", function () {
                var SelectTownShipNow = val_M("#SelectTownShipNow");//所選的鄉鎮市區(代碼)[現居住所]
                //    //ZipCode
                //    //$("ZipCode").html(TownShip);
                //alert("ZipCode:" + SelectTownShip);
                $("#ZipCode_Now").attr("value", SelectTownShipNow);
                //    //alert("所選的鄉鎮市區(代碼)"+SelectTownShip);
                //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "TownShip", "option", SelectCounty);//所選的城市產生相對應的鄉鎮市區
            });
            //====================
            onChange_M("#Select_Com", function () {
                //alert('!!!');;
                //alert('SelectCom_Title Change!!!!');
                var Select_Com = val_M("#Select_Com");
                var Select_Dept = val_M("#Select_Dept");
                //alert(Select_Com);
                //alert(Select_Dept);
                //var SelectDept_Title = val_M("#SelectDept_Title");
                //var type = val_M("#SelectCom_Title");
                //alert('SelectCom_Title Change!!!!');
                //alert(type);
                $Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ", "GetEmploy", Select_Com, Select_Dept, "option");
            });
            //SelectDept_Title
            onChange_M("#Select_Dept", function () {
                //alert('!!!');;
                //alert('SelectDept_Title Change!!!!');
                var Select_Com = val_M("#Select_Com");
                var Select_Dept = val_M("#Select_Dept");
                //var SelectDept_Title = val_M("#Select_Dept");
                //var type = val_M("#MP");
                //alert('SelectDept_Title Change!!!!');
                //alert(Select_Com);
                //alert(Select_Dept);
                $Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ", "GetEmploy", Select_Com, Select_Dept, "option");
            });
            //選擇[銀行]
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectBank", "Bank", "option");
            //取得[部門]
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept", "Dept", "option");
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectDept_Title", "Dept", "option");
            //取得[所屬公司]
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom", "Com", "option");//對應<select id="SelectCom"></select></td >
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCom_Title", "Com", "option");//對應<select id="SelectCom"></select></td >
            //取得[縣/市]
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectCounty", "County", "option", afterSuccessFuc2);
            //取得[縣/市](目前居住)[Now](現居住所)
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#CountyNow", "County", "option", afterSuccessFuc1);
            //取得[鄉鎮區市](目前居住)[Now](現居住所)
            //取得[等級]
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectLevel", "Level", "option");//對應<select id="SelectLevel"></select >
            //取得[職稱]
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectPosit", "Posit", "option");//對應<select id="SelectPosit"> </select >
            //取得[電話區碼](住宅電話
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#HTel_Zone", "Tel_Zone", "option");//對應<select id="SelectPosit"> </select >
            //取得[電話區碼](緊急連絡人)
            $Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#ETel_Zone", "Tel_Zone", "option");//對應<select id="SelectPosit"> </select >
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectPosit", "Posit", "option");
            onClick_M("#AddMUSERDataWindowBtn", openAddMUSERDataWindow);//顯示新增使用者畫面
            onClick_M("#CustomUserSETimeBtn", openAddCustomUserSETimeWindow);//顯示新增使用者自訂上下班時間畫面
            //onClick_M("AddBtn", AddCustomUserSETime);
            onClick_M("#BankSelectDataWindowBtn", openBankSelectDataWindow);//顯示選擇銀行畫面
            onClick_M("#AddMUSERDataClick", addmuserData);//執行新增使用者動作
            onClick_M("#searchBankDataFuc", searchBankData);//搜尋銀行關鍵字
            onClick_M("#AddBtn", AddCustomUSERSETime);//使用者自訂上下班時間
            onClick_M("#CustomUserSETimeBtn", openAddCustomUserSETimeWindow);//顯示新增使用者自訂上下班時間畫面
            //searchCustomerData
            onClick_M("#searchCustomerData", searchCustomerData);//搜尋員工資料維護作業關鍵字
            onClick_M("#SendSelectBankFuc", SendSelectBankFuc);//選擇銀行關鍵字
            hide_M("#customerAdvSearchDiv");
            hide_M("#extensionDialog");
            getCustomUserSETimeData();
            /////////////////////////////
            var county = val_M("#SelectCounty");//所選的縣/市

            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShip", "TownShip", "option", county);//所選的城市產生相對應的鄉鎮市區(中文)
            //$Common.MITEM.getListHtmlTagOption(CommonHandlerUrl_M, "#SelectTownShipNow", "TownShip", "option", county);//所選的城市產生相對應的鄉鎮市區(中文)



        };
        ///按下選擇銀行視窗
        function ShowDialog(Url) {
            //alert('@@@');
            var iWidth = 560; //模態視窗寬度
            var iHeight = 300;//模態視窗高度
            var iTop = (window.screen.height - iHeight - 100) / 2;
            var iLeft = (window.screen.width - iWidth) / 2;
            var returnValue = window.showModalDialog(Url, "newwindow", "dialogHeight:" + iHeight + "px; dialogWidth:" + iWidth + "px; toolbar:no; menubar:no; scrollbars:no; resizable:no; location:no; status:no; left:200px; top:100px;");
            document.getElementById("TextBox1").innerText = returnValue;
        }
        ///
        //頁面載入後自動執行
        $(function () {

            startThisPage();
            val_M("#U_Num", newU_Num);
            //查看使用者權限
            //getUserAuthority_M(startThisPage);
            onChange_M("#Select_Com", function () {
                //alert('!!!');;
                //alert('SelectCom_Title Change!!!!');
                var Select_Com = val_M("#Select_Com");
                var Select_Dept = val_M("#Select_Dept");
                //alert(Select_Com);
                //alert(Select_Dept);
                //var SelectDept_Title = val_M("#SelectDept_Title");
                //var type = val_M("#SelectCom_Title");
                //alert('SelectCom_Title Change!!!!');
                //alert(type);
                $Common.MITEM.getMREGT02ListHtmlTagOption_3(CommonHandlerUrl_M, "#Select_Employ", "GetEmploy", Select_Com, Select_Dept, "option");
            });
        })


    </script>

</asp:Content>

    