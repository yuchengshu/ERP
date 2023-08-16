<%@ WebHandler Language="C#" Class="MUSERHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class MUSERHandler : IHttpHandler
{

    //此類別名稱G
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string Dept = context.Request["Dept"];
        string Com = context.Request["Com"];
        string MS_ID = string.Empty;
        string Punchcard_tag = context.Request["Punchcard_tag"];
        string Keyword = context.Request["Keyword"];
        string U_Num = context.Request["U_Num"];
        string auto_id = context.Request["auto_id"];
        string ProductName = context.Request["ProductName"];
        string Code = context.Request["Code"];
        string Sort = context.Request["Sort"];
        muserService muserService = new muserService();
        switch (action)
        {
            case "getCustomUserSETimeData":////取得使用者自訂上下班時間資料列表
                context.Response.Write(getCustomUserSETimeData());
                break;

            case "addCustomUSERSETime"://新增使用者自訂上下班時間
                string StartHour = context.Request["StartHour"];
                string StartMin = context.Request["StartMin"];
                string EndHour = context.Request["EndHour"];
                string EndMin = context.Request["EndMin"];
                string Select_Employ = context.Request["Select_Employ"];
                context.Response.Write(addCustomUSERSETime(StartHour, StartMin, EndHour, EndMin, Select_Employ));
                break;
            case "SaveEditDataAnalystsData":
                //    string auto_id = context.Request["auto_id"];
                //string ProductName = context.Request["ProductName"];
                //string Code = context.Request["Code"];
                //string Sort = context.Request["Sort"];
                context.Response.Write(SaveEditDataAnalystsData(U_Num, auto_id, ProductName, Code, Sort));
                break;

            //分析師產品修改
            case "UpdateMUSERAnalysts":
                //string ProductName = context.Request["ProductName"];
                //string Code = context.Request["Code"];
                //string Sort = context.Request["Sort"];
                //string auto_id = context.Request["auto_id"];
                context.Response.Write(UpdateMUSERAnalysts(U_Num, auto_id, ProductName, Code, Sort));
                break;
            case "getMUserAnalystsEDITData":
                //string U_Num_M = context.Request["U_Num"];
                //string auto_id_ = context.Request["auto_id"];
                //auto_id=365&U_Num=D0110011
                //   string U_Num = context.Request["U_Num"];
                //string auto_id = context.Request["auto_id"];
                //string U_Num_M =context.Request.QueryString["U_Num"];
                //string auto_id_ = context.Request.QueryString["auto_id"];
                context.Response.Write(getMUserAnalystsEDITData(U_Num, auto_id));
                break;

            case "getEditAnalystsData":

                // string auto_id = context.Request["Auto_id"];
                context.Response.Write(getEditAnalystsData(auto_id));
                break;
            case "getAnalystsData":
                //string U_Num = context.Request["U_Num"];
                //string keyWord = context.Request["keyWord"];
                context.Response.Write(getAnalystsData(U_Num));
                break;
            case "getSingleMUSERData":
                break;
            case "getMailData":
                //string U_Num = context.Request["U_Num"];
                string keyWord = context.Request["keyWord"];
                context.Response.Write(getMailData(U_Num, keyWord));
                break;
            case "deleteMailData":
                MS_ID = context.Request["MS_ID"];
                context.Response.Write(deleteMailData(MS_ID));
                break;
            ////進行使用者新增動作
            case "addMUSERData":
                //從頁面取得欄位內容
                muserEntity musE = new muserEntity();
                common.getDateTime();

                //=====基本資料=====
                musE.U_Num = context.Request["EmployID"];//員工編號U_Num(EmployID)
                musE.U_Name = context.Request["EmployNAME"];//姓名U_Name(EmployNAME)
                musE.Tag = "0";
                //musE.U_Pwd = context.Request["U_PWD"].ToString();//密碼U_PWD//ok
                musE.U_Pwd = context.Request["U_PWD"];//密碼U_PWD
                musE.U_PWD_CHECK = context.Request["U_PWD_CHECK"];//======密碼確認U_PWD(此欄位用來檢查用,不用存入資料庫)
                musE.U_MDEP = context.Request["SelectDept"];//所屬部門U_MDEP
                musE.ComID = context.Request["SelectCom"];//所屬部門ComID
                musE.ComLand = context.Request["SelecrCom_Text"];//所屬公司ComID(中文名稱)
                musE.U_POSITION = context.Request["SelectLevel"];//等級U_POSITION
                musE.U_Item = context.Request["SelectPosit"];//職稱U_ITEM
                musE.U_Card = context.Request["U_Card"];//磁卡號碼U_Card
                musE.U_Tel = context.Request["U_Tel"];//分機號碼U_Tel
                musE.EMail = context.Request["EMail"];//電子郵件EMail
                musE.Punchcard_tag = context.Request["Punchcard_tag"];//是否打卡PunchCard_tag
                musE.SlimDate = context.Request["SlimDate"];//到職日SlimDate
                if (context.Request["LeaveDate"].ToString() != "undefined--undefined 00:00:00.000")
                {
                    musE.LeaveDate = context.Request["LeaveDate"];//離職日LeaveDate
                }
                else
                {
                    musE.LeaveDate = "";
                }
                //musE.LeaveDate = context.Request["LeaveDate"];//離職日LeaveDate
                //=====詳細資料=====
                musE.U_PID = context.Request["U_PID"];//身分證字號U_PID
                                                      //musE.BirthDayDate = context.Request["BirthDay_Date"];//出生年月日
                if (context.Request["BirthDay_Date"].ToString() != "undefined--undefined 00:00:00.000")
                {
                    musE.BirthDayDate = context.Request["BirthDay_Date"];//出生年月日
                }
                else
                {
                    musE.BirthDayDate = "";
                }
                musE.School_name1 = context.Request["School_Name1"];//學校名稱(教育程度1)School_Name1
                musE.School_Dep1 = context.Request["School_Dep1"];//院系科別(教育程度1)School_Dep1
                musE.School_Grd1 = context.Request["School_Grd1"];//畢業或肄業(教育程度1)School_Grd1
                                                                  //===
                musE.School_name2 = context.Request["School_Name2"];//學校名稱(教育程度2)School_Name2
                musE.School_Dep2 = context.Request["School_Dep2"];//院系科別(教育程度2)School_Dep2
                musE.School_Grd2 = context.Request["Schol_Grd2"];//畢業或肄業(教育程度2)School_Dep2
                                                                 //===
                musE.School_name3 = context.Request["School_Name3"];//學校名稱(教育程度3)School_Name3
                musE.School_Dep3 = context.Request["School_Dep3"];//院系科別(教育程度3)School_Dep3
                musE.School_Grd3 = context.Request["School_Grd3"];//畢業或肄業(教育程度3)School_Grd3
                                                                  //===
                musE.Be_Com1 = context.Request["Be_Com1"];//服務機關(重要經歷1)Be_Com1
                musE.Be_Job1 = context.Request["Be_Job1"];//職位(重要經歷1)Be_Job1
                musE.Be_Res1 = context.Request["Be_Res1"];//工作內容(重要經歷1)Be_Res1
                musE.Be_Date1 = context.Request["Be_Date1"];//任職期間(重要經歷1)Be_Date1
                musE.Be_Leave1 = context.Request["Be_Leave1"];//離職原因(重要經歷1)Be_Leave1
                musE.Be_Salary1 = context.Request["Be_Salary1"];//薪給(重要經歷1)Be_Salary1
                                                                //===
                musE.Be_Com2 = context.Request["Be_Com2"];//服務機關(重要經歷2)Be_Com2
                musE.Be_Job2 = context.Request["Be_Job2"];//職位(重要經歷2)Be_Job2
                musE.Be_Res2 = context.Request["Be_Res2"];//工作內容(重要經歷2)Be_Res2
                musE.Be_Date2 = context.Request["Be_Date2"];//任職期間(重要經歷2)Be_Date2
                musE.Be_Leave2 = context.Request["Be_Leave2"];//離職原因(重要經歷2)Be_Leave2
                musE.Be_Salary2 = context.Request["Be_Salary2"];//薪給(重要經歷2)Be_Salary2
                                                                //===
                musE.Be_Com3 = context.Request["Be_Com3"];//服務機關(重要經歷3)Be_Com3
                musE.Be_Job3 = context.Request["Be_Job3"];//職位(重要經歷3)Be_Job3
                musE.Be_Res3 = context.Request["Be_Res3"];//工作內容(重要經歷3)Be_Res3
                musE.Be_Date3 = context.Request["Be_Date3"];//任職期間(重要經歷3)Be_Date3
                musE.Be_Leave3 = context.Request["Be_Leave3"];//離職原因(重要經歷3)Be_Leave3
                musE.Be_Salary3 = context.Request["Be_Salary3"];//薪給(重要經歷3)Be_Salary3
                                                                //===
                musE.License_I = context.Request["License_I"];//投信投顧業務員(證照狀態)License_I(有勾選為on)
                if (musE.License_I == "on")
                    musE.License_I = "1";
                else
                    musE.License_I = "0";
                musE.License_A = context.Request["License_A"];//證卷分析師(證照狀態)License_A
                if (musE.License_A == "on")
                    musE.License_A = "1";
                else
                    musE.License_A = "0";

                musE.License_Detial = context.Request["License_Detial"];//專業證照
                musE.HTel = context.Request["HTel"];//連絡電話
                musE.HTel_Zone = context.Request["HTel_Zone"];//連絡電話區碼
                musE.HMobile = context.Request["HMobile"];
                musE.ETel = context.Request["ETel"];//緊急連絡電話
                musE.ETel_Zone = context.Request["ETel_Zone"];//緊急連絡電話區碼
                musE.EMobile = context.Request["EMobile"];
                musE.EMail = context.Request["Email"];//電子郵件
                musE.PayrollBankID = context.Request["PayrollBankID"];//=>PayrollBankID]銀行分支代碼
                musE.PayrollBankName = context.Request["PayrollBankName"];//=>PayrollBankName銀行名稱
                musE.PayrollBranchName = context.Request["PayrollBranchName"];//=>PayrollBranchName銀行分支帳號
                musE.Note = context.Request["Note"];//備註
                musE.OCity = context.Request["OCity"];
                musE.OTown = context.Request["OTown"];
                musE.OAddress = context.Request["OAddress"];





                context.Response.Write(addMuserData(musE));//新增員工資料動作
                break;
            //儲存員工資料維護作業-修改
            case "updateEditMuserData":
                muserEntity savemusE = new muserEntity();
                common.getDateTime();
                // + "&SelectDept=" + SelectDept// val_M("#SelectDept");//所屬部門
                //=====基本資料=====
                savemusE.U_Num = context.Request["EmployID"];//員工編號U_Num(EmployID)
                savemusE.U_Name = context.Request["EmployNAME"];//姓名U_Name(EmployNAME)
                savemusE.Tag = "0";
                //musE.U_Pwd = context.Request["U_PWD"].ToString();//密碼U_PWD//ok
                savemusE.U_Pwd = context.Request["U_PWD"];//密碼U_PWD
                savemusE.U_PWD_CHECK = context.Request["U_PWD_CHECK"];//======密碼確認U_PWD(此欄位用來檢查用,不用存入資料庫)
                                                                      //    savemusE.
                                                                      //savemusE.U_MDEP = context.Request["SelectDept"];//所屬部門U_MDEP
                savemusE.ComID = context.Request["SelectCom"];//所屬部門ComID
                                                              //savemusE.ComLand = context.Request["SelecrCom_Text"];//所屬公司ComID(中文名稱)
                                                              //string ComLand_ID = muserService.GetNumByName(savemusE.ComID.ToString(), "ComId");//代理人員工公司編號ComLand_ID
                                                              //savemusE.ComID = ComLand_ID;
                savemusE.U_POSITION = context.Request["SelectLevel"];//等級U_POSITION
                savemusE.U_Item = context.Request["SelectPosit"];//職稱U_ITEM
                savemusE.U_Card = context.Request["U_Card"];//磁卡號碼U_Card
                savemusE.U_Tel = context.Request["U_Tel"];//分機號碼U_Tel
                savemusE.EMail = context.Request["EMail"];//電子郵件EMail
                savemusE.Punchcard_tag = context.Request["Punchcard_tag"];//是否打卡PunchCard_tag
                savemusE.SlimDate = context.Request["SlimDate"];//到職日SlimDate
                savemusE.LeaveDate = context.Request["LeaveDate"];//離職日LeaveDate
                savemusE.U_AgentNum = context.Request["U_AgentNum"];//代理人員工編號U_AgentNum
                savemusE.U_AgentName = context.Request["U_AgentName"];//代理人員工姓名U_AgentName
                savemusE.U_AgentCom = context.Request["U_AgentComLand"];//代理人員工部門名稱U_AgentComLand
                string U_AgentComLand_ID = muserService.GetNumByName(savemusE.U_AgentCom.ToString(), "COMID");//代理人員工部門編號U_AgentComLand_ID
                savemusE.U_AgentCom = U_AgentComLand_ID;//代理人員工部門編號U_AgentComLand_ID
                savemusE.U_LeaderNum = context.Request["U_LeaderNum"];//部門主管員工編號U_AgentNum
                savemusE.U_LeaderName = context.Request["U_LeaderName"];//部門主管員工姓名U_AgentName
                savemusE.U_LeaderCom = context.Request["U_LeaderComLand"];//部門主管員工部門名稱U_AgentComLand
                string U_LeaderCom_ID = muserService.GetNumByName(savemusE.U_LeaderCom.ToString(), "COMID");//部門主管員工部門編號U_AgentComLand_ID
                savemusE.U_LeaderCom = U_LeaderCom_ID;//部門主管員工部門編號U_AgentComLand_ID
                                                      //=====詳細資料=====
                                                      //musE.U_PID = context.Request["U_PID"];//身分證字號U_PID
                                                      //musE.BirthDayDate = context.Request["BirthDay_Date"];//出生年月日
                                                      //musE.School_name1 = context.Request["School_Name1"];//學校名稱(教育程度1)School_Name1
                                                      //musE.School_Dep1 = context.Request["School_Dep1"];//院系科別(教育程度1)School_Dep1
                                                      //musE.School_Grd1 = context.Request["School_Grd1"];//畢業或肄業(教育程度1)School_Grd1
                                                      //                                                  //===
                                                      //musE.School_name2 = context.Request["School_Name2"];//學校名稱(教育程度2)School_Name2
                                                      //musE.School_Dep2 = context.Request["School_Dep2"];//院系科別(教育程度2)School_Dep2
                                                      //musE.School_Grd2 = context.Request["Schol_Grd2"];//畢業或肄業(教育程度2)School_Dep2
                                                      //                                                 //===
                                                      //musE.School_name3 = context.Request["School_Name3"];//學校名稱(教育程度3)School_Name3
                                                      //musE.School_Dep3 = context.Request["School_Dep3"];//院系科別(教育程度3)School_Dep3
                                                      //musE.School_Grd3 = context.Request["School_Grd3"];//畢業或肄業(教育程度3)School_Grd3
                                                      //                                                  //===
                                                      //musE.Be_Com1 = context.Request["Be_Com1"];//服務機關(重要經歷1)Be_Com1
                                                      //musE.Be_Job1 = context.Request["Be_Job1"];//職位(重要經歷1)Be_Job1
                                                      //musE.Be_Res1 = context.Request["Be_Res1"];//工作內容(重要經歷1)Be_Res1
                                                      //musE.Be_Date1 = context.Request["Be_Date1"];//任職期間(重要經歷1)Be_Date1
                                                      //musE.Be_Leave1 = context.Request["Be_Leave1"];//離職原因(重要經歷1)Be_Leave1
                                                      //musE.Be_Salary1 = context.Request["Be_Salary1"];//薪給(重要經歷1)Be_Salary1
                                                      //                                                //===
                                                      //musE.Be_Com2 = context.Request["Be_Com2"];//服務機關(重要經歷2)Be_Com2
                                                      //musE.Be_Job2 = context.Request["Be_Job2"];//職位(重要經歷2)Be_Job2
                                                      //musE.Be_Res2 = context.Request["Be_Res2"];//工作內容(重要經歷2)Be_Res2
                                                      //musE.Be_Date2 = context.Request["Be_Date2"];//任職期間(重要經歷2)Be_Date2
                                                      //musE.Be_Leave2 = context.Request["Be_Leave2"];//離職原因(重要經歷2)Be_Leave2
                                                      //musE.Be_Salary2 = context.Request["Be_Salary2"];//薪給(重要經歷2)Be_Salary2
                                                      //                                                //===
                                                      //musE.Be_Com3 = context.Request["Be_Com3"];//服務機關(重要經歷3)Be_Com3
                                                      //musE.Be_Job3 = context.Request["Be_Job3"];//職位(重要經歷3)Be_Job3
                                                      //musE.Be_Res3 = context.Request["Be_Res3"];//工作內容(重要經歷3)Be_Res3
                                                      //musE.Be_Date3 = context.Request["Be_Date3"];//任職期間(重要經歷3)Be_Date3
                                                      //musE.Be_Leave3 = context.Request["Be_Leave3"];//離職原因(重要經歷3)Be_Leave3
                                                      //musE.Be_Salary3 = context.Request["Be_Salary3"];//薪給(重要經歷3)Be_Salary3
                                                      //                                                //===
                                                      //musE.License_I = context.Request["License_I"];//投信投顧業務員(證照狀態)License_I(有勾選為on)
                                                      //if (musE.License_I == "on")
                                                      //    musE.License_I = "1";
                                                      //else
                                                      //    musE.License_I = "0";
                                                      //musE.License_A = context.Request["License_A"];//證卷分析師(證照狀態)License_A
                                                      //if (musE.License_A == "on")
                                                      //    musE.License_A = "1";
                                                      //else
                                                      //    musE.License_A = "0";

                //musE.License_Detial = context.Request["License_Detial"];//專業證照
                //musE.HTel = context.Request["HTel"];//連絡電話
                //musE.HTel_Zone = context.Request["HTel_Zone"];//連絡電話區碼
                //musE.HMobile = context.Request["HMobile"];
                //musE.ETel = context.Request["ETel"];//緊急連絡電話
                //musE.ETel_Zone = context.Request["ETel_Zone"];//緊急連絡電話區碼
                //musE.EMobile = context.Request["EMobile"];
                //musE.EMail = context.Request["Email"];//電子郵件
                //musE.PayrollBankID = context.Request["PayrollBankID"];//=>PayrollBankID]銀行分支代碼
                //musE.PayrollBankName = context.Request["PayrollBankName"];//=>PayrollBankName銀行名稱
                //musE.PayrollBranchName = context.Request["PayrollBranchName"];//=>PayrollBranchName銀行分支帳號
                //musE.Note = context.Request["Note"];//備註
                //musE.OCity = context.Request["OCity"];
                //musE.OTown = context.Request["OTown"];
                //musE.OAddress = context.Request["OAddress"];





                context.Response.Write(updateEditMuserData(savemusE));//儲存更新員工資料動作
                break;
            case "editMUSERData":
                muserEntity editmusE = new muserEntity();
                common.getDateTime();

                //=====基本資料=====
                editmusE.U_Num = context.Request["EmployID"];//員工編號U_Num(EmployID)
                editmusE.U_Name = context.Request["EmployNAME"];//姓名U_Name(EmployNAME)
                editmusE.Tag = "0";
                //musE.U_Pwd = context.Request["U_PWD"].ToString();//密碼U_PWD//ok
                editmusE.U_Pwd = context.Request["U_PWD"];//密碼U_PWD
                editmusE.U_PWD_CHECK = context.Request["U_PWD_CHECK"];//======密碼確認U_PWD(此欄位用來檢查用,不用存入資料庫)
                editmusE.U_MDEP = context.Request["SelectDept"];//所屬部門U_MDEP
                editmusE.ComID = context.Request["SelectCom"];//所屬部門ComID
                editmusE.ComLand = context.Request["SelecrCom_Text"];//所屬公司ComID(中文名稱)
                editmusE.U_POSITION = context.Request["SelectLevel"];//等級U_POSITION
                editmusE.U_Item = context.Request["SelectPosit"];//職稱U_ITEM
                editmusE.U_Card = context.Request["U_Card"];//磁卡號碼U_Card
                editmusE.U_Tel = context.Request["U_Tel"];//分機號碼U_Tel
                editmusE.EMail = context.Request["EMail"];//電子郵件EMail
                editmusE.Punchcard_tag = context.Request["Punchcard_tag"];//是否打卡PunchCard_tag
                editmusE.SlimDate = context.Request["SlimDate"];//到職日SlimDate
                editmusE.LeaveDate = context.Request["LeaveDate"];//離職日LeaveDate
                                                                  //=====詳細資料=====
                editmusE.U_PID = context.Request["U_PID"];//身分證字號U_PID
                editmusE.BirthDayDate = context.Request["BirthDay_Date"];//出生年月日
                editmusE.School_name1 = context.Request["School_Name1"];//學校名稱(教育程度1)School_Name1
                editmusE.School_Dep1 = context.Request["School_Dep1"];//院系科別(教育程度1)School_Dep1
                editmusE.School_Grd1 = context.Request["School_Grd1"];//畢業或肄業(教育程度1)School_Grd1
                                                                      //===
                editmusE.School_name2 = context.Request["School_Name2"];//學校名稱(教育程度2)School_Name2
                editmusE.School_Dep2 = context.Request["School_Dep2"];//院系科別(教育程度2)School_Dep2
                editmusE.School_Grd2 = context.Request["Schol_Grd2"];//畢業或肄業(教育程度2)School_Dep2
                                                                     //===
                editmusE.School_name3 = context.Request["School_Name3"];//學校名稱(教育程度3)School_Name3
                editmusE.School_Dep3 = context.Request["School_Dep3"];//院系科別(教育程度3)School_Dep3
                editmusE.School_Grd3 = context.Request["School_Grd3"];//畢業或肄業(教育程度3)School_Grd3
                                                                      //===
                editmusE.Be_Com1 = context.Request["Be_Com1"];//服務機關(重要經歷1)Be_Com1
                editmusE.Be_Job1 = context.Request["Be_Job1"];//職位(重要經歷1)Be_Job1
                editmusE.Be_Res1 = context.Request["Be_Res1"];//工作內容(重要經歷1)Be_Res1
                editmusE.Be_Date1 = context.Request["Be_Date1"];//任職期間(重要經歷1)Be_Date1
                editmusE.Be_Leave1 = context.Request["Be_Leave1"];//離職原因(重要經歷1)Be_Leave1
                editmusE.Be_Salary1 = context.Request["Be_Salary1"];//薪給(重要經歷1)Be_Salary1
                                                                    //===
                editmusE.Be_Com2 = context.Request["Be_Com2"];//服務機關(重要經歷2)Be_Com2
                editmusE.Be_Job2 = context.Request["Be_Job2"];//職位(重要經歷2)Be_Job2
                editmusE.Be_Res2 = context.Request["Be_Res2"];//工作內容(重要經歷2)Be_Res2
                editmusE.Be_Date2 = context.Request["Be_Date2"];//任職期間(重要經歷2)Be_Date2
                editmusE.Be_Leave2 = context.Request["Be_Leave2"];//離職原因(重要經歷2)Be_Leave2
                editmusE.Be_Salary2 = context.Request["Be_Salary2"];//薪給(重要經歷2)Be_Salary2
                                                                    //===
                editmusE.Be_Com3 = context.Request["Be_Com3"];//服務機關(重要經歷3)Be_Com3
                editmusE.Be_Job3 = context.Request["Be_Job3"];//職位(重要經歷3)Be_Job3
                editmusE.Be_Res3 = context.Request["Be_Res3"];//工作內容(重要經歷3)Be_Res3
                editmusE.Be_Date3 = context.Request["Be_Date3"];//任職期間(重要經歷3)Be_Date3
                editmusE.Be_Leave3 = context.Request["Be_Leave3"];//離職原因(重要經歷3)Be_Leave3
                editmusE.Be_Salary3 = context.Request["Be_Salary3"];//薪給(重要經歷3)Be_Salary3
                                                                    //===
                editmusE.License_I = context.Request["License_I"];//投信投顧業務員(證照狀態)License_I(有勾選為on)
                if (editmusE.License_I == "on")
                    editmusE.License_I = "1";
                else
                    editmusE.License_I = "0";
                editmusE.License_A = context.Request["License_A"];//證卷分析師(證照狀態)License_A
                if (editmusE.License_A == "on")
                    editmusE.License_A = "1";
                else
                    editmusE.License_A = "0";

                editmusE.License_Detial = context.Request["License_Detial"];//專業證照
                editmusE.HTel = context.Request["HTel"];//連絡電話
                editmusE.HTel_Zone = context.Request["HTel_Zone"];//連絡電話區碼
                editmusE.HMobile = context.Request["HMobile"];
                editmusE.ETel = context.Request["ETel"];//緊急連絡電話
                editmusE.ETel_Zone = context.Request["ETel_Zone"];//緊急連絡電話區碼
                editmusE.EMobile = context.Request["EMobile"];
                editmusE.EMail = context.Request["Email"];//電子郵件
                editmusE.PayrollBankID = context.Request["PayrollBankID"];//=>PayrollBankID]銀行分支代碼
                editmusE.PayrollBankName = context.Request["PayrollBankName"];//=>PayrollBankName銀行名稱
                editmusE.PayrollBranchName = context.Request["PayrollBranchName"];//=>PayrollBranchName銀行分支帳號
                editmusE.Note = context.Request["Note"];//備註
                editmusE.OCity = context.Request["OCity"];
                editmusE.OTown = context.Request["OTown"];
                editmusE.OAddress = context.Request["OAddress"];





                context.Response.Write(addMuserData(editmusE));//新增員工資料動作
                break;
            case "getUpLoadData":
                MS_ID = context.Request["MS_ID"];
                context.Response.Write(getUpLoadData(MS_ID));
                break;
            case "updateReadtag":
                MS_ID = context.Request["MS_ID"];
                context.Response.Write(updateReadtag(MS_ID));
                break;
            case "getMailDetail":
                MS_ID = context.Request["MS_ID"];
                context.Response.Write(getMailDetail(MS_ID));
                break;

            case "getMUSERData"://取得員工資料
                MS_ID = context.Request["MS_ID"];
                string Dept_ = context.Request["Dept"];
                string Com_ = context.Request["Com"];
                //keyWord = "110";
                //if (Keyword != "")
                //{
                context.Response.Write(getMUSERData(MS_ID, Keyword, Com_, Dept_));
                //}
                //else
                // {
                //     context.Response.Write(getMUSERData(MS_ID,Com_,Dept_));
                // }
                break;
            case "getEditMUSERData"://取得要編輯的員工資料
                string U_Num_ = context.Request["U_Num"];
                break;
        }

    }
    public string getCustomUserSETimeData()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num;':" + U_Num + "'keyWord;':" + keyWord, className, methodName);

         List<CustomUSERSETimeEntity> CustomUSERSETimeList = MITEMService.Instance.getCustomUSERSETimeData();//<==========

        //log.endWrite("'eeList' :" + eeList.ToString(), className, methodName);
        
            return Newtonsoft.Json.JsonConvert.SerializeObject(CustomUSERSETimeList);
        
    }
    //新增使用者自訂上下班時間
    //addCustomUSERSETime
    //context.Response.Write(addCustomUSERSETime(StartHour, StartMin,EndHour,EndMin,Select_Employ));
    public string addCustomUSERSETime(string StartHour, string StartMin, string EndHour, string EndMin, string Select_Employ)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num;':" + U_Num + "'keyWord;':" + keyWord, className, methodName);

        string result = MITEMService.Instance.addCustomUSERSETime(StartHour, StartMin, EndHour, EndMin, Select_Employ);//<==========

        //log.endWrite("'eeList' :" + eeList.ToString(), className, methodName);
        //return Newtonsoft.Json.JsonConvert.SerializeObject(eeList);
        return result;
    }
    //接收畫面傳回的資料
    public string SaveEditDataAnalystsData(string U_Num, string auto_id, string ProductName, string Code, string Sort)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num;':" + U_Num + "'keyWord;':" + keyWord, className, methodName);

        MUSERalystsEntity eeList = muserService.Instance.updateMUserAnalystsEDITData(auto_id, ProductName, Code, Sort);//<==========

        log.endWrite("'eeList' :" + eeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(eeList);
    }
    public string UpdateMUSERAnalysts(string U_Num_M, string auto_id, string ProductName, string Code, string Sort)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num;':" + U_Num + "'keyWord;':" + keyWord, className, methodName);

        MUSERalystsEntity eeList = muserService.Instance.updateMUserAnalystsEDITData(auto_id, ProductName, Code, Sort);//<==========

        log.endWrite("'eeList' :" + eeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(eeList);
    }
    public string getMUserAnalystsEDITData(string U_Num_M, string auto_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num;':" + U_Num + "'keyWord;':" + keyWord, className, methodName);

        MUSERalystsEntity eeList = muserService.Instance.getMUserAnalystsEDITData(U_Num_M, auto_id);//<==========

        log.endWrite("'eeList' :" + eeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(eeList);
    }

    public string getEditAnalystsData(string Auto_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num;':" + U_Num + "'keyWord;':" + keyWord, className, methodName);

        List<MUSERalystsEntity> eeList = muserService.Instance.getAnalystsItemData(Auto_id);//<==========

        log.endWrite("'eeList' :" + eeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(eeList);
    }

    //取得員工資料維護作業-分析師產品權限 資料
    public string getAnalystsData(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num;':" + U_Num + "'keyWord;':" + keyWord, className, methodName);

        List<MUSERalystsEntity> eeList = muserService.Instance.getAnalystsData(U_Num);//<==========

        log.endWrite("'eeList' :" + eeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(eeList);
    }
    //使用者維護作業-修改(取得原有資料)
    //員工編號
    //姓名
    //密碼
    //所屬部門
    //所屬公司
    //代理人
    //部門主管
    //等級
    //職稱
    //磁卡號碼
    //分機號碼
    //電子郵件
    //到職日
    //離職日
    public string getMUSERData(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num;':" + U_Num + "'keyWord;':" + keyWord, className, methodName);

        List<muserEntity> eeList = muserService.Instance.getMUSERData(U_Num);//<==========

        log.endWrite("'eeList' :" + eeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(eeList);
    }

    public string getMUSERData(string U_Num, string keyWord, string Com_, string Dept_)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num;':" + U_Num + "'keyWord;':" + keyWord, className, methodName);

        List<muserEntity> eeList = muserService.Instance.getMUSERData(U_Num, keyWord, Com_, Dept_);//<==========

        log.endWrite("'eeList' :" + eeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(eeList);
    }

    public string getMailData(string U_Num, string keyWord)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num;':" + U_Num + "'keyWord;':" + keyWord, className, methodName);

        List<emailEntity> eeList = mailService.Instance.getMailData(U_Num, keyWord);//<==========

        log.endWrite("'eeList' :" + eeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(eeList);
    }

    public string deleteMailData(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        String backStr = mailService.Instance.deleteMailData(MS_ID);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public string addMuserData(muserEntity mse)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'MS_ID':" + ee.MS_ID + "'MS_Sender':" + ee.MS_Sender + "'MS_Receiver':" + ee.MS_Receiver + "'MS_Title':" + ee.MS_Title + "'MS_Text':" + ee.MS_Text + "'add_User':" + ee.add_User + "'add_ip':" + ee.add_ip, className, methodName);

        String backStr = muserService.Instance.addMUSERData(mse);//<==========
                                                                 //    String backStr = muserService.Instance.getMUSERData(ee);//<==========
                                                                 //log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
    //儲存員工資料修改動作
    public string updateEditMuserData(muserEntity mse)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'MS_ID':" + ee.MS_ID + "'MS_Sender':" + ee.MS_Sender + "'MS_Receiver':" + ee.MS_Receiver + "'MS_Title':" + ee.MS_Title + "'MS_Text':" + ee.MS_Text + "'add_User':" + ee.add_User + "'add_ip':" + ee.add_ip, className, methodName);

        String backStr = muserService.Instance.updateMuserEditData(mse);//<==========
                                                                        //    String backStr = muserService.Instance.getMUSERData(ee);//<==========
                                                                        //log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
    public string getUpLoadData(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        uploadFileEntity ufe = mailService.Instance.getUpLoadData(MS_ID);//<==========

        log.endWrite("'ufe' :" + ufe.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ufe);
    }

    public string updateReadtag(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        string backStr = mailService.Instance.updateReadtag(MS_ID);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public string getMailDetail(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        emailEntity ee = mailService.Instance.getMailDetail(MS_ID);//<==========

        log.endWrite("'ee' :" + ee.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ee);
    }
    //取得所有員工資料
    //public string getMUSERData(string MS_ID)
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    log.startWrite("'MS_ID':" + MS_ID, className, methodName);
    //    string keyword = "";
    //    List<muserEntity> muser = muserService.Instance.getMUSERData(MS_ID, keyword);//<==========
    //    log.endWrite("'eeList' :" + muser.ToString(), className, methodName);
    //    return Newtonsoft.Json.JsonConvert.SerializeObject(muser);

    //}
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}