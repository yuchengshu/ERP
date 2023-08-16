using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

public partial class MasterPage : System.Web.UI.MasterPage
{
    string U_Num = string.Empty;

    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    string CustomerDetailMENUno_G = string.Empty;
    string ERPcustomerWebPayMENUno_G = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string getRelativePath()
    {
        return "../../../../";
    }


    /// <summary>
    /// 取得員工編號
    /// </summary>
    /// <returns>員工編號</returns>
    public string getU_Num()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        U_Num = Session["U_Num"] == null ? "" : Session["U_Num"].ToString();


        log.endWrite("'U_Num' : " + U_Num, className, methodName);
        return U_Num;
    }

    /// <summary>
    /// 取得員工姓名
    /// </summary>
    /// <returns>員工姓名</returns>
    public string getU_Name()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        string U_Name = Session["U_Name"] == null ? "" : Session["U_Name"].ToString();

        log.endWrite("'U_Name' : " + U_Name, className, methodName);
        return U_Name;
    }
    //取得是否需要打卡資訊
    public string getPunchcard_Tag()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        string backString = string.Empty;
        if (Session["U_MDEP"] != null)
        {
            backString = masterPageService.Instance.getU_MDEP(Session["U_MDEP"].ToString().Trim());//<==============
        }

        return backString;
    }
    /// <summary>
    /// 取得左邊menu
    /// </summary>
    /// <returns></returns>
    public string getLeftMenu()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        StringBuilder html = new StringBuilder();
        if (!common.isEmpty(U_Num))
        {
            int level1Count = 0;
            int level2Count = 0;
            int level3Count = 0;
            bool hasThirdLevel = false;
            string tempSecond = string.Empty;
            string tempThird = string.Empty;
            List<string> strList = new List<string>();
            //取得製作LeftMenu的資料
            List<masterPageLeftMenuEntity> lmList = masterPageService.Instance.getLeftMenu(U_Num, false);
            List<masterPageLeftMenuEntity> lmDescList = masterPageService.Instance.getLeftMenu(U_Num, true);
            for (var i = 0; i < lmDescList.Count; i++)
            {
                if (tempSecond == lmDescList[i].level2)
                {
                    if (tempThird != lmDescList[i].level3)
                    {
                        if ("0" == lmDescList[i].level3)
                        {
                            strList.Add(lmDescList[i].auto_id);
                        }
                    }

                }
                tempSecond = lmDescList[i].level2;
                tempThird = lmDescList[i].level3;
            }
            //產出前端要用的html*********************************************************************************************************start
            string firstLevelMenuName = string.Empty;
            string secondLevelMenuName = string.Empty;
            for (var i = 0; i < lmList.Count; i++)
            {
                if (lmList[i].menuName == "身份證檢查")
                {
                    var test = 0;
                    //lmList[i].menuLocation = makeHref(lmList[i].menuName, lmList[i].menuLocation, lmList[i].level1, lmList[i].level2, lmList[i].level3, lmList);

                }
                if (lmList[i].menuName == "電子表單")
                {
                    var test = 0;
                }
                if (lmList[i].menuName == "華冠網站訂單管理")
                {
                    var test = 0;
                }
                if (lmList[i].menuName == "輕鬆學院訂單管理")
                {
                    var test = 0;
                }
                if (i == 115)
                {
                    if (lmList[i].menuName == "身份證檢查")
                    {//("/manage/WEB/widupl/widupl_query.asp
                        //lmList[i].menuLocation = "/Manage/Form/SRMVMEB/SRMVMEB_query.aspx?";//20230117修改這裡
                    }
                }
                if (lmList[i].menuName == "行政查核")
                {
                    var test = 0;
                }
                //foreach (var item in lmList[i])
                //{
                //    if (lmList[i].menuName == "華冠網站訂單管理")
                //    {

                //    }
                //    if (lmList[i].menuName == "華冠網站訂單管理")
                //    {

                //    }
                //    if (lmList[i].menuName == "輕鬆學院訂單管理")
                //    {

                //    }
                //}
                //線上付費暨委任契約書簽署
                //if (lmList[i].menuName != "線上付費暨委任契約書簽署")
                if (lmList[i].menuName != "")
                {
                    lmList[i].menuLocation = makeHref(lmList[i].menuName, lmList[i].menuLocation, lmList[i].level1, lmList[i].level2, lmList[i].level3, lmList);

                    switch (lmList[i].level)
                    {
                        //menu的第一層
                        case "first":
                            if (level1Count != 0)
                            {
                                if (level3Count > 0)
                                {
                                    html.Append("</ul></li></ul></li>");
                                }
                                else
                                {
                                    html.Append("</li></ul></li>");
                                }

                            }
                            level3Count = 0;
                            level2Count = 0;

                            html.Append("<li id='");
                            html.Append(lmList[i].menuName);
                            firstLevelMenuName = lmList[i].menuName;
                            html.Append("' class='treeview firstLevel'><a class='' href='");
                            if (lmList[i].menuLocation.Trim() == "#")
                            {
                                html.Append("");
                            }
                            else
                            {
                                html.Append(lmList[i].menuLocation);
                            }
                            html.Append("'><i class='fa fa-folder'></i><span>");
                            html.Append(lmList[i].menuName);
                            html.Append("</span><i class='fa fa-angle-left pull-right'></i>");
                            level1Count += 1;
                            break;

                        //menu的第二層
                        case "second":
                            level2Count += 1;
                            if (level2Count > 1)
                            {
                                if (level3Count > 1)
                                {
                                    html.Append("</li></ul></li></ul>");
                                    level3Count = 0;
                                }
                                else
                                {
                                    html.Append("</li></ul>");
                                }
                            }

                            //html.Append("<ul class='treeview-menu'><li><a href='");
                            html.Append("<ul class='all treeview-menu ");
                            html.Append(firstLevelMenuName);
                            html.Append("'>");

                            html.Append("<li id='");
                            html.Append(lmList[i].menuName);
                            secondLevelMenuName = lmList[i].menuName;
                            html.Append("' class='treeview  secondLevel'><a class='' href='");
                            if (lmList[i].menuLocation.Trim() == "#")
                            {
                                html.Append("");
                            }
                            else
                            {
                                if (lmList[i].menuName == "身份證檢查")
                                {
                                    //html.Append("/manage/Form/MPMMBER/MMBER_query.asp?MENU_no=120");
                                }
                                else
                                    html.Append(lmList[i].menuLocation);
                            }
                            for (var p = 0; p < strList.Count; p++)
                            {
                                if (lmList[i].auto_id == strList[p])
                                {
                                    hasThirdLevel = true;
                                }

                            }
                            if (hasThirdLevel)
                            {
                                html.Append("'><i class='fa fa-circle-o text-red'></i>");
                            }
                            else
                            {
                                html.Append("'><i class='fa fa-circle-o'></i>");
                            }
                            hasThirdLevel = false;
                            html.Append(lmList[i].menuName);
                            if (lmList[i].level3 == "0" && (lmList[i].menuLocation == "#" || lmList[i].menuLocation == "/manage/Form/MPMMBER/MMBER_query.asp?MENU_no=135"))
                            {
                                html.Append("<i class='fa fa-angle-left pull-right'></i></a>");
                            }
                            else
                            {
                                // html.Append("<small class='label pull-right bg-yellow'>12</small></a>");
                                html.Append("<small class='label pull-right bg-yellow'></small></a>");
                            }

                            break;

                        //menu的第三層
                        case "third":
                            level3Count += 1;
                            if (level3Count > 1)
                            {
                                html.Append("</li></ul>");
                            }
                            // html.Append("<ul class='treeview-menu'><li><a href='");
                            html.Append("<ul class='all treeview-menu ");
                            html.Append(firstLevelMenuName);
                            html.Append("'>");
                            html.Append("<li id='");
                            html.Append(lmList[i].menuName);
                            html.Append("' class='treeview  thirdLevel'><a class='' href='");

                            if (lmList[i].menuLocation.Trim() == "#")
                            {
                                html.Append("");
                            }
                            else
                            {
                                html.Append(lmList[i].menuLocation);
                            }
                            html.Append("'><i class='fa fa-book'></i>");
                            html.Append(lmList[i].menuName);
                            //html.Append("<small class='label pull-right bg-yellow'>12</small></a>");
                            html.Append("<small class='label pull-right bg-yellow'></small></a>");
                            break;
                    }
                }
            }
        }
        else
        {
            html.Append("");
        }


        //產出前端要用的html*********************************************************************************************************end
        log.endWrite("'html' : " + html.ToString(), className, methodName);
        return html.ToString();
    }

    /// <summary>
    /// 取得部門名稱
    /// </summary>
    /// <returns>部門名稱</returns>
    public string getU_MDEPname()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        string backString = string.Empty;
        if (Session["U_MDEP"] != null)
        {
            backString = masterPageService.Instance.getU_MDEP(Session["U_MDEP"].ToString().Trim());//<==============
        }

        return backString;
    }


    public string getU_MDEP()
    {
        return Session["U_MDEP"] == null ? "" : Session["U_MDEP"].ToString();
    }

    public string getU_EMail()
    {
        return Session["U_EMail"] == null ? "" : Session["U_EMail"].ToString();
    }
    public string getU_POSITION()
    {
        return Session["U_POSITION"] == null ? "" : Session["U_POSITION"].ToString();
    }
    public string getComID()
    {
        return Session["ComID"] == null ? "" : Session["ComID"].ToString();
    }
    public string getComLand()
    {
        return Session["ComLand"] == null ? "" : Session["ComLand"].ToString();
    }
    public string getIP()
    {
        return Session["IP"] == null ? "" : Session["IP"].ToString();
    }
    public string getU_Leader()
    {
        return Session["U_Leader"] == null ? "" : Session["U_Leader"].ToString();
    }

    public string getEmplist()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<muserEntity> lmList = MUSERhgDao.Instance.getEmplist(common.empty, common.empty);

        log.endWrite(lmList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(lmList);
    }
    public string getMenuMap()
    {
        List<masterPageLeftMenuEntity> lmList = masterPageService.Instance.getLeftMenu(U_Num, false);
        return Newtonsoft.Json.JsonConvert.SerializeObject(lmList);
    }

    public string getCustomerDetailMENUno()
    {
        return CustomerDetailMENUno_G;
    }
    public string getERPcustomerWebPayMENUno()
    {
        return ERPcustomerWebPayMENUno_G;
    }
    List<string> menu = new List<string>();
    public string makeHref(string menu_name, string href, string level1, string level2, string level3, List<masterPageLeftMenuEntity> mplmeList)
    {
        string backStr = string.Empty;
        string menuNo = string.Empty;

        if (href != "#")
        {
            if (href.Contains("?"))
            {
                menu.Add(menu_name);
                menuNo = href.Split('?')[1];
                if (menu_name == "電子表單")
                {
                    menuNo = "";
                }
                if (menu_name == "Call訊發佈管理")
                {
                    menuNo = "";
                }
                if (menu_name == "電子表單")
                {
                    menuNo = "";
                }
                if (menu_name == "線上付費暨委任契約書簽署")
                {
                    //menuNo = "";
                }
                if (menu_name == "行政查核")
                {
                    menuNo = "";
                }
                if (menu_name == "輕鬆學院訂單管理")
                {
                    menuNo = "";
                }
                if (menu_name == "華冠網站訂單管理")
                {
                    menuNo = "";
                }
                if (menu_name == "身份證檢查")
                {
                    menuNo = "";
                }
                //case "華冠網站訂單管理":
                //backStr = "/Manage/Form/SRMSYSK/SRMSYSK_query.aspx?" + menuNo;
                //break;
                //

                switch (menu_name)
                {///manage/form/SRMVMEB/SRMVMEB_query.asp?MENU_no=7
                    case "線上付費暨委任契約書簽署":
                        backStr = "/wealthManage/MCMCASH_query.aspx?" + menuNo;
                        break;

                    case "VIP會員管理":
                        backStr = "/Manage/Form/SRMVMEB/SRMVMEB_query.aspx?" + menuNo;//要改成"/Manage/Form/SRMVMEB/SRMVMEB_query.aspx?" + menuNo;
                        break;

                    case "智庫":
                        backStr = "/public/NoticeBoard/MBULT/noticeBoard12345.aspx?" + menuNo;
                        break;

                    case "電話統計作業":
                        backStr = "/Manage/Form/MPMMTEL/MPMMTEL_query.aspx?" + menuNo;
                        break;

                    case "請假單":
                        backStr = "/public/TakeLeave/MEXCU/takeLeaveDetail.aspx?" + menuNo;
                        break;

                    case "假單查詢":
                        backStr = "/public/TakeLeave/MEXCU/takeLeaveDetail.aspx?" + menuNo;
                        break;

                    case "電子郵件":
                        backStr = "/public/Mail/MMAIL/mail.aspx?" + menuNo;
                        break;

                    case "公佈欄":
                        backStr = "/public/NoticeBoard/MBULT/noticeBoard.aspx?" + menuNo;
                        break;

                    case "報表區":
                        backStr = "/wealthManage/report/MREPO/report.aspx?" + menuNo;
                        break;

                    case "稽核區":
                        backStr = "/wealthManage/audit/check/audit.aspx?" + menuNo;
                        break;

                    case "留倉資料管理":
                        backStr = "/Manage/Form/SRMSYSK/SRMSYSK_query.aspx?" + menuNo;
                        break;

                    case "業務聯絡單":
                        string tempStr = string.Empty;
                        for (var i = 0; i < mplmeList.Count; i++)
                        {
                            if (mplmeList[i].menuName == "客戶管理")
                            {
                                if (mplmeList[i].level1 == level1)
                                {
                                    tempStr = menuNo + "&CustomerDetailMENU_no=" + ((mplmeList[i].menuLocation).Split('?')[1]).Split('=')[1];
                                    break;
                                }
                                else
                                {
                                    tempStr = menuNo;
                                }
                            }
                            else
                            {
                                tempStr = menuNo;
                            }
                        }
                        backStr = "/wealthManage/businessConnection/MPMCOTF/MPMCOTF_query.aspx?" + menuNo;
                        break;
                    //case "輕鬆學院訂單管理":
                    //    backStr = "/Manage/Form/SRMSYSK/SRMSYSK_query.aspx?" + menuNo;
                    //    break;
                    case "華冠網站訂單管理"://20230117這邊要修改
                        //("/manage/WEB/Worder_NEW/order_query.asp?menu_no=226
                        backStr = "/Manage/Form/order_query.aspx?" + menuNo;
                        break;
                    case "身份證檢查":///20230117這邊要修改
                        // backStr = "/Manage/Form/SRMSYSK/widupl_query.aspx?" + menuNo;
                        backStr = "/manage/Form/widupl_query.aspx";
                        break;
                    case "行政查核":

                        string tempStr11 = string.Empty;
                        for (var i = 0; i < mplmeList.Count; i++)
                        {
                            foreach (var item in mplmeList)
                            {
                                if (item.menuName == "華冠網站訂單管理")
                                { };
                                if (item.menuName == "輕鬆學院訂單管理")
                                { };
                                if (item.menuName == "輕鬆學院訂單管理")
                                { };
                            }
                            if (mplmeList[i].menuName == "身份證檢查")
                            {
                                if (mplmeList[i].level1 == level1)
                                {
                                    tempStr11 = menuNo + "&CustomerDetailMENU_no=" + ((mplmeList[i].menuLocation).Split('?')[1]).Split('=')[1];
                                    break;
                                }
                                else
                                {
                                    tempStr11 = menuNo;
                                }
                            }
                            if (mplmeList[i].menuName == "華冠網站訂單管理")
                            {
                                if (mplmeList[i].level1 == level1)
                                {
                                    tempStr11 = menuNo + "&CustomerDetailMENU_no=" + ((mplmeList[i].menuLocation).Split('?')[1]).Split('=')[1];
                                    break;
                                }
                                else
                                {
                                    tempStr11 = menuNo;
                                }
                            }
                            if (mplmeList[i].menuName == "輕鬆學院訂單管理")
                            {
                                if (mplmeList[i].level1 == level1)
                                {
                                    tempStr11 = menuNo + "&CustomerDetailMENU_no=" + ((mplmeList[i].menuLocation).Split('?')[1]).Split('=')[1];
                                    break;
                                }
                                else
                                {
                                    tempStr11 = menuNo;
                                }
                            }
                            else if (mplmeList[i].menuName == "華冠網站訂單管理")
                            {
                                if (mplmeList[i].level1 == level1)
                                {
                                    tempStr11 = menuNo + "&CustomerDetailMENU_no=" + ((mplmeList[i].menuLocation).Split('?')[1]).Split('=')[1];
                                    break;
                                }
                                else
                                {
                                    tempStr11 = menuNo;
                                }
                            }
                            else if (mplmeList[i].menuName == "身份證檢查")
                            {
                                if (mplmeList[i].level1 == level1)
                                {
                                    tempStr11 = menuNo + "&CustomerDetailMENU_no=" + ((mplmeList[i].menuLocation).Split('?')[1]).Split('=')[1];
                                    break;
                                }
                                else
                                {
                                    tempStr11 = menuNo;
                                }
                            }
                            else
                            {
                                tempStr11 = menuNo;
                            }
                        }
                        backStr = "/wealthManage/administrativeCheck/idCheck/WIDUPL/idCheck.aspx?" + tempStr11;
                        break;



                    case "個股管理作業":
                        backStr = "/Manage/Form/MCMSFTF/MCMSFTF_query.aspx?" + menuNo;
                        CustomerDetailMENUno_G = menuNo;
                        break;

                    case "客戶管理":
                        backStr = "/wealthManage/customerManage/MMBER/customerManage.aspx?" + menuNo;
                        CustomerDetailMENUno_G = menuNo;
                        break;

                    case "業務通告":
                        backStr = "/wealthManage/businessConnectionCall/MCMPMPT/businessConnectionCall.aspx?" + menuNo;
                        break;

                    case "Call訊發佈查詢":
                        backStr = "/wealthManage/publishManagement/callMessageManagement/MCMMSGE/callMessageManagement.aspx?" + menuNo;
                        break;

                    case "Call訊發佈":
                        backStr = "/wealthManage/publishManagement/callMessageManagement/MCMMSGE/callMessageManagement.aspx?" + menuNo;
                        break;

                    case "內-Call訊發佈":
                        backStr = "/wealthManage/publishManagement/callMessageManagement/MCMMSGE/callMessageManagement.aspx?" + menuNo;
                        break;

                    case "詮力發送紀錄查詢":
                        backStr = "/wealthManage/publishManagement/callMessageManagement/MCMMSGE/callMessageManagement.aspx?" + menuNo;
                        break;

                    case "會員研究日報發佈查詢":
                        backStr = "/wealthManage/publishManagement/dailyResearchReportManagement/WFaxReport/dailyResearchReportManagement.aspx?" + menuNo;
                        break;

                    case "會員研究日報發佈管理":
                        backStr = "/wealthManage/publishManagement/dailyResearchReportManagement/WFaxReport/dailyResearchReportManagement.aspx?" + menuNo;
                        break;

                    //case "留倉表發佈查詢":
                    //    backStr = "/wealthManage/publishManagement/openInterestTableManagement/srmsysk/openInterestTableManagement.aspx?" + menuNo;
                    //    break;

                    case "留倉表發佈管理":
                        backStr = "/wealthManage/publishManagement/openInterestTableManagement/srmsysk/openInterestTableManagement.aspx?" + menuNo;
                        break;

                    case "贈送資料查詢":
                        backStr = "/wealthManage/publishManagement/dataGiftManagement/MCMSEDT/dataGiftManagement.aspx?" + menuNo;
                        break;

                    case "贈送資料管理":
                        backStr = "/wealthManage/publishManagement/dataGiftManagement/MCMSEDT/dataGiftManagement.aspx?" + menuNo;
                        break;

                    case "信封列印作業":
                        backStr = "/wealthManage/envelopePrintWork/MADINVO/envelopePrintWork.aspx?" + menuNo;
                        break;

                    case "待開發票作業":
                        string tempStr3 = string.Empty;
                        for (var i = 0; i < mplmeList.Count; i++)
                        {
                            if (mplmeList[i].menuName == "客戶管理")
                            {
                                if (mplmeList[i].level1 == level1)
                                {
                                    tempStr3 = menuNo + "&CustomerDetailMENU_no=" + ((mplmeList[i].menuLocation).Split('?')[1]).Split('=')[1];
                                    break;
                                }
                                else
                                {
                                    tempStr3 = menuNo;
                                }
                            }
                            else
                            {
                                tempStr3 = menuNo;
                            }
                        }
                        backStr = "/wealthManage/tbdInvoiceWork/MAoINVO/tbdInvoiceWork.aspx?" + tempStr3;
                        break;

                    case "委任正本歸檔作業":
                        string tempStr1 = string.Empty;
                        for (var i = 0; i < mplmeList.Count; i++)
                        {
                            if (mplmeList[i].menuName == "客戶管理")
                            {
                                if (mplmeList[i].level1 == level1)
                                {
                                    tempStr1 = menuNo + "&CustomerDetailMENU_no=" + ((mplmeList[i].menuLocation).Split('?')[1]).Split('=')[1];
                                    break;
                                }
                                else
                                {
                                    tempStr1 = menuNo;
                                }
                            }
                            else
                            {
                                tempStr1 = menuNo;
                            }
                        }
                        // backStr = "/wealthManage/businessConnection/MPMCOTF/businessConnection.aspx?" + tempStr;
                        backStr = "/wealthManage/appointOriginalArchiveWord/mcmecbt/appointOriginalArchiveWord.aspx?" + tempStr1;
                        break;

                    case "ERP客戶網站付費":
                        backStr = "/wealthManage/administrativeCheck/ERPcustomerWebPay/MCMCASH/ERPcustomerWebPay.aspx?" + menuNo;
                        ERPcustomerWebPayMENUno_G = menuNo;
                        break;


                    //case "身份證檢查":
                    //    tempStr1 = string.Empty;
                    //    for (var i = 0; i < mplmeList.Count; i++)
                    //    {
                    //        if(mplmeList[i].menuName == "身份證檢查")
                    //        {
                    //            if (mplmeList[i].level1 == level1)
                    //            {
                    //                tempStr1 = menuNo + "&CustomerDetailMENU_no=" + ((mplmeList[i].menuLocation).Split('?')[1]).Split('=')[1];
                    //                break;
                    //            }
                    //            else
                    //            {
                    //                tempStr1 = menuNo;
                    //            }
                    //        }
                    //        if (mplmeList[i].menuName == "客戶管理")
                    //        {
                    //            if (mplmeList[i].level1 == level1)
                    //            {
                    //                tempStr1 = menuNo + "&CustomerDetailMENU_no=" + ((mplmeList[i].menuLocation).Split('?')[1]).Split('=')[1];
                    //                break;
                    //            }
                    //            else
                    //            {
                    //                tempStr1 = menuNo;
                    //            }
                    //        }
                    //        else
                    //        {
                    //            tempStr1 = menuNo;
                    //        }
                    //    }
                    //    backStr = "/wealthManage/administrativeCheck/idCheck/WIDUPL/idCheck.aspx?" + tempStr1;
                    //    break;

                    case "網路消費訂單管理":
                        backStr = "/wealthManage/administrativeCheck/webConsumptionOrderManagement/Worder_NEW/webConsumptionOrderManagement.aspx?" + menuNo;
                        break;
                    //20230117這邊要修改
                    //("/manage/ezdiamond/AllPayorder_NEW2/AllPayorder_query.asp?MENU_no=227
                    case "輕鬆學院訂單管理":
                        //backStr = "/wealthManage/administrativeCheck/easySchoolOrderManagement/OPLIST_NEW/easySchoolOrderManagement.aspx?" + menuNo;
                        backStr = "/Manage/Form/AllPayorder_query.aspx";
                        break;
                    //case "身份證檢查":
                    //    backStr = "/wealthManage/administrativeCheck/easySchoolOrderManagement/OPLIST_NEW/easySchoolOrderManagement.aspx?" + menuNo;
                    //    break;




                    case "會場管理":
                        backStr = "/Manage/Form/SRMVENU/SRMVENU_query.aspx";
                        break;

                    ////C:\Work\WebSites\ERP\Manage\MCMRYGC 案件派發作業 
                    //C:\Work\WebSites\ERP\Manage\MCMRYGC
                    case "案件派發作業":
                        backStr = "/Manage/MCMRYGC/MCMRYGC_query.aspx";
                        break;
                    //20221004進度
                    case "案件轉檔維護":
                        backStr = "/Manage/Form/MCMCHTR/MCMCHTR_query.aspx";
                        break;
                    case "發票基本資料維護":
                        backStr = "/Manage/Form/MAMINVO/MINVO_query.aspx?MENU_no=85";
                        break;

                    case "待開發票作業-天酷綠界":
                        backStr = "/Manage/Form/MAOINVO/OINVO_query_01.aspx?MENU_no=97";
                        break;

                    //case "待開發票作業-特種(瑞兔)":
                    //    backStr = "/Manage/Form/MAOINVO/OINVO_query_02.aspx?MENU_no=262";
                    //    break;
                    default:
                        backStr = "javascript: void(0)";
                        break;
                };
            }
            else
            {
                backStr = href;
            }
        }
        else
        {
            backStr = "";
        }
        return backStr;
    }
}
