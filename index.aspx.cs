using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net;
using System.Text;

public partial class index : System.Web.UI.Page
{ 
    string U_Num = string.Empty;

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //群組類別
    string group = string.Empty;

    sessionEntity se = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        //1.取得基本資料並塞入session
        getUserData();

        //2.記錄登入紀錄
        saveLoginRecord();

        //3.判斷是否為第一次登入，如果是就打卡
        chockonOrNo();

        //4.確認信箱是否有未讀取信件
        checkUnReadMail();

        //5.製作右邊網頁內容
        makeRightHtml(); 

    }


    /// <summary>
    /// 取得基本資料並塞入session
    /// </summary>
    public void getUserData()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;

        if (common.isEmpty(Request.Params["U_Num"]))
        {
            U_Num = Session["U_Num"].ToString();
        }
        else
        {
            U_Num = Request.Params["U_Num"];
            //Session["U_Num"] = U_Num;
            HttpContext.Current.Session["U_Num"] = U_Num;
        }
       
        string ip = common.GetIP4Address();
        log.ip = ip;
        log.U_Num = U_Num;
        log.U_Name = "尚未取得使用者姓名";
        log.startWrite(common.nothing, className, methodName);
        //=================================================================以上為log
        //se = indexService.Instance.getUserData(U_Num);
        se = indexService.Instance.getUserData(U_Num);//<===========================
        
        Session["U_Name"] = se.U_Name;
        Session["U_MDEP"] = se.U_MDEP;
        Session["U_EMail"] = se.U_EMail;
        Session["U_POSITION"] = se.U_POSITION;
        Session["ComID"] = se.ComID;
        Session["ComLand"] = se.ComLand;
        //Session["U_Leader"] = se.U_Leader;
        Session["U_Leader"] = "D0002081";//行政主管:吳念純
        Session["U_LeaderName"] = se.U_LeaderName;
        Session["U_LeaderCom"] = "HG01";
        se.IP = ip;
        Session["IP"] = se.IP;

        //分組類別
        group = getGroup(se.U_MDEP, se.U_Num, se.ComID);

        log.endWrite(se.ToString(), className, methodName);
    }

    /// <summary>
    /// 記錄登入紀錄
    /// </summary>
    public void saveLoginRecord()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
       
        indexService.Instance.saveLoginRecord(se);//<=========================

        log.endWrite(common.nothing, className, methodName);
    }

    /// <summary>
    /// 判斷是否為第一次登入，如果是就打卡
    /// </summary>
    public void chockonOrNo()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);
        //=================================================================以上為log

        //查詢今日是否登入過
        string loginOrNo = indexService.Instance.chockonOrNo(U_Num);//<====================

        //如果未登入就註記登入時間
        if (loginOrNo.Trim() == "未登入")
        {
            indexService.Instance.chockon(U_Num);//<========
        }

        log.endWrite(common.nothing, className, methodName);
    }

    /// <summary>
    /// 確認信箱是否有未讀取信件
    /// </summary>
    public string checkUnReadMail()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);
        string backString = indexService.Instance.checkUnReadMail(U_Num);//<========
        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    /// <summary>
    /// 製作右邊網頁內容
    /// </summary>
    /// <returns></returns>
    public String makeRightHtml()
    {
        StringBuilder html = new StringBuilder();

        //查詢首頁內容觀看權限
        //List<contentAuthorityEntity> caeList = searchContentAuthority();//<========
        // for (var i = 0; i < caeList.Count; i++)
        // {
        //     switch (caeList[i].info_id)
        //     {
        //         //業績排行榜
        //         case "MF001":
        //           //html.Append(getPerformanceRankingHtml());
        //            break;
        //        //華南信用卡額度提醒
        //        case "MF008":
        //           //html.Append(getHnBankCreditHtml());
        //            break;
        //        //公佈欄
        //        case "MF004":
        //            html.Append(getNoticeBoardHtml());
        //            break;

        //         //電子郵件
        //         case "MF005":
        //            html.Append(getEmailBoxHtml());
        //             break;

        //         //今日聯絡事項
        //         case "MF007":
        //           html.Append(getTodayConnectionMatterHtml());
        //            break;

        //         //生日提醒
        //         case "MF002":
        //            //html.Append(getRemindEmpBDtableHtml());
        //             break;

        //         //節目合約到期提醒
        //         case "MF003":
        //            html.Append(getRemindProgramContractMaturityHtml());
        //            //html.Append(getEmailBoxHtml());
        //            //html.Append(getCallMassageHtml());
        //            break;

        //         //即時Call訊
        //         case "MF006":
        //            html.Append(getCallMassageHtml());
        //            break;
        //     }
        // }
        return html.ToString();
    }

    /// <summary>
    /// 查詢首頁內容觀看權限
    /// </summary>
    /// <returns></returns>
    public List<contentAuthorityEntity> searchContentAuthority()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        List<contentAuthorityEntity> caeList = indexService.Instance.searchContentAuthority(U_Num);//<=======
        log.endWrite(caeList.ToString(), className, methodName);
        return caeList;
    }


    /// <summary>
    /// 取得業績排行榜
    /// </summary>
    /// <returns></returns>
    public string getPerformanceRankingHtml()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        StringBuilder html = new StringBuilder();
        string U_MDEP = Session["U_MDEP"].ToString();
        string U_POSITION = Session["U_POSITION"].ToString();
        List<performanceRankingEntity> preLiST = indexService.Instance.getPerformanceRanking(U_MDEP, group);//<===========
        html.Append("<div class='col-md-12'><div class='box box-danger'><div class='box-header'><i class='fa fa-bar-chart-o'></i><h3 class='box-title'>業績排行榜</h3>");
        if (U_Num == "A9501041" || U_Num == "B9601151")
        {
            html.Append("<div class='box-tools pull-right' data-toggle='tooltip' title='近三月業績排行'><div class='btn-group' data-toggle='btn-toggle' ><a href = 'infro_001.asp'><button type='button' class='btn btn-danger btn-sm'><i class='fa fa-bars'></i></button></a></div></div>");
        }
        html.Append("</div><!-- /.box-header --><div class='box-body'><table class='table table-bordered table-condensed'><tr class='active'><th style = 'width: 50px' class='text-center'>排名</th><th class='text-center'>業務人員</th><th class='text-center'>業績總數</th></tr>");
        for (var i = 0; i < preLiST.Count; i++)
        {
            html.Append("<tr><th class='text-center'>");
            html.Append(i+1);
            html.Append("</th><th class='text-center'>");
            html.Append(preLiST[i].mc_name);
            html.Append("</th><th class='text-center'>");
            html.Append(common.stringToIntThousand(preLiST[i].money));
            html.Append("</th></tr>");
        }
        html.Append("</table></div><!--/.box-body--></div><!--/.box--></div>");
        log.endWrite(html.ToString(), className, methodName);
        return html.ToString();
    }


    /// <summary>
    /// 取得華南信用卡額度提醒
    /// </summary>
    /// <returns></returns>
    public string getHnBankCreditHtml()
    {
        //string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite(common.nothing, className, methodName);
        //StringBuilder html = new StringBuilder();
        //string U_MDEP = Session["U_MDEP"].ToString();
        //string U_POSITION = Session["U_POSITION"].ToString();
        //List<noticeBoardEntity> preLiST = indexService.Instance.getHnBankCredit(U_MDEP, group);//<===========
        //html.Append("<div class='col-md-12'><div class='box box-danger'><div class='box-header'><i class='fa fa-bar-chart-o'></i><h3 class='box-title'>業績排行榜</h3>");
        //if (U_Num == "A9501041" || U_Num == "B9601151")
        //{
        //    html.Append("<div class='box-tools pull-right' data-toggle='tooltip' title='近三月業績排行'><div class='btn-group' data-toggle='btn-toggle' ><a href = 'infro_001.asp'><button type='button' class='btn btn-danger btn-sm'><i class='fa fa-bars'></i></button></a></div></div>");
        //}
        //html.Append("</div><!-- /.box-header --><div class='box-body'><table class='table table-bordered table-condensed'><tr class='active'><th style = 'width: 50px' class='text-center'>排名</th><th class='text-center'>業務人員</th><th class='text-center'>業績總數</th></tr>");
        //for (var i = 0; i < preLiST.Count; i++)
        //{
        //    html.Append("<tr><th class='text-center'>");
        //    html.Append(i + 1);
        //    html.Append("</th><th class='text-center'>");
        //    html.Append(preLiST[0]);
        //    html.Append("</th><th class='text-center'>");
        //   // html.Append(common.stringToIntThousand(account_total[i]));
        //    html.Append("</th></tr>");
        //}
        //html.Append("</table></div><!--/.box-body--></div><!--/.box--></div>");
        //log.endWrite(html.ToString(), className, methodName);
        //return html.ToString();
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        StringBuilder html = new StringBuilder();
        string U_MDEP = Session["U_MDEP"].ToString();
        string U_POSITION = Session["U_POSITION"].ToString();
        List<performanceRankingEntity> preLiST = indexService.Instance.getPerformanceRanking(U_MDEP, group);//<===========
        html.Append("<div class='col-md-12'><div class='box box-danger'><div class='box-header'><i class='fa fa-bar-chart-o'></i><h3 class='box-title'>業績排行榜</h3>");
       
        html.Append("</div><!-- /.box-header --><div class='box-body'><table class='table table-bordered table-condensed'><tr class='active'><th style = 'width: 50px' class='text-center'>排名</th><th class='text-center'>業務人員</th><th class='text-center'>業績總數</th></tr>");
        for (var i = 0; i < preLiST.Count; i++)
        {
            html.Append("<tr><th class='text-center'>");
            html.Append(i + 1);
            html.Append("</th><th class='text-center'>");
            html.Append(preLiST[i].mc_name);
            html.Append("</th><th class='text-center'>");
            html.Append(common.stringToIntThousand(preLiST[i].money));
            html.Append("</th></tr>");
        }
        html.Append("</table></div><!--/.box-body--></div><!--/.box--></div>");
        log.endWrite(html.ToString(), className, methodName);
        return html.ToString();
    }



    /// <summary>
    /// 取得節目合約快到期資料
    /// </summary>
    /// <returns></returns>
    public string getRemindProgramContractMaturity()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        StringBuilder html = new StringBuilder();
        //string U_MDEP = Session["U_MDEP"].ToString();
        //string U_POSITION = Session["U_POSITION"].ToString();
        //List<remindProgramContractMaturityEntity> preLiST = indexService.Instance.getRemindProgramContractMaturity();//<===========
        //html.Append("<div class='col-md-12'><div class='box box-danger'><div class='box-header'><i class='fa fa-bar-chart-o'></i><h3 class='box-title'>節目合約快到期資料</h3>");
        //      html.Append("</div><!-- /.box-header --><div class='box-body'><table class='table table-bordered table-condensed'><tr class='active'><th style = 'width: 50px' class='text-center'>排名</th><th class='text-center'>業務人員</th><th class='text-center'>業績總數</th></tr>");
        //for (var i = 0; i < preLiST.Count; i++)
        //{
        //    html.Append("<tr><th class='text-center'>");
        //    html.Append(i + 1);
        //    html.Append("</th><th class='text-center'>");
        //   // html.Append(preLiST[i].mc_name);
        //    html.Append("</th><th class='text-center'>");
        //   // html.Append(common.stringToIntThousand(preLiST[i].money));
        //    html.Append("</th></tr>");
        //}
        //html.Append("</table></div><!--/.box-body--></div><!--/.box--></div>");
        //log.endWrite(html.ToString(), className, methodName);
        return html.ToString();
    }



    /// <summary>
    /// 取得公佈欄資料
    /// </summary>
    /// <returns></returns>
    public string getNoticeBoardHtml()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        StringBuilder html = new StringBuilder();
        string U_MDEP = Session["U_MDEP"].ToString();
        string U_POSITION = Session["U_POSITION"].ToString();
        List<noticeBoardEntity> nbeList = indexService.Instance.getNoticeBoard(U_MDEP, U_POSITION,group, className);//<==========
        html.Append("<div class='col-md-6'><div class='box box-danger'><div class='box-header'><i class='fa fa-list-alt'></i><h3 class='box-title'>公佈欄</h3><div class='box-tools pull-right' data-toggle='tooltip' title='' data-original-title='看更多'><div class='btn-group' data-toggle='btn-toggle'><a href = ''><button type='button' id='noticeBoardBtn' class='btn btn-danger btn-sm' location = '/public/noticeBoard'><i class='fa fa-bars'></i></button></a></div></div></div><!-- /.box-header --><div class='box-body'><table class='table table-bordered table-condensed'><tbody><tr class='active'><th style = 'width: 5%'> </th><th style='width: 55%'>標題</th><th style = 'width: 40%'>發佈時間</th></tr>");
      
            for (var i = 0; i < nbeList.Count; i++)
            {
               
                //html.Append("<tr><th class='text-center'>");
                //html.Append(i+1);
                //html.Append("</th><th><a class='BlueLink10' href='../public/NoticeBord/MBULT/noticeBoard.aspx?detail=");
                //html.Append(nbeList[i].adver_id);
                //html.Append("'>");
                //html.Append(nbeList[i].adver_subject);
                //html.Append("</a></th><th>");
                //html.Append(nbeList[i].adver_create_date);
                //html.Append("</th></tr>");
        }
        html.Append("</tbody></table></div><!--/.box-body--></div><!--/.box--></div>");
        log.endWrite(html.ToString(), className, methodName);
        return html.ToString();
    }

    /// <summary>
    /// 取得員工生日列表
    /// </summary>
    /// <returns>員工生日列表</returns>
    public string getRemindEmpBDtableHtml() 
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        StringBuilder html = new StringBuilder();
        html.Append("<div class='col-md-6'><div class='box box-danger'><div class='box-header'><i class='fa fa-calendar'></i><h3 class='box-title'>生日提醒</h3></div><!-- /.box-header --><div class='box-body'><table class='table table-bordered'><tr><th style = 'width: 30%' class='active'>本日壽星123</th><th style = 'width: 30%' class='active'>近一週壽星</th><th style = 'width: 40%' class='active'>近月壽星</th></tr><tr><th>");
        List<indexBDdataEntity> dbdList = indexService.Instance.getBDerList(0, 0);//<===============取當日生日者
        if (dbdList.Count == 0)
        {
            html.Append("無");
        }
        else
        {
            for (var i = 0; i < dbdList.Count;i++)
            {
                html.Append("<span class='label label-danger'>");
                html.Append(dbdList[i].empName);
                html.Append("&nbsp;");
                html.Append(dbdList[i].empBD);
                html.Append("(");
                html.Append(dbdList[i].empBDdate);
                html.Append(")</span><br>");
            }
        }
        html.Append("</th><th>");
        List<indexBDdataEntity> wbdList = indexService.Instance.getBDerList(1, 6);//<===============取未來一周生日者
        if (wbdList.Count == 0)
        {
            html.Append("無");
        }
        else
        {
            for (var i = 0; i < wbdList.Count; i++)
            {
                html.Append("<span class='label label-danger label-lg'>");
                html.Append(wbdList[i].empName);
                html.Append("&nbsp;");
                html.Append(wbdList[i].empBD);
                html.Append("(");
                html.Append(wbdList[i].empBDdate);
                html.Append(")</span><br>");
            }
        }
        html.Append("</th><th>");

        List<indexBDdataEntity> mbdList = indexService.Instance.getBDerList(1,30);//<===============取未來一個月生日者
        if (mbdList.Count == 0)
        {
            html.Append("無");
        }
        else
        {
            for (var i = 0; i < mbdList.Count; i++)
            {
                html.Append("<span class='label label-primary'>");
                html.Append(mbdList[i].empName);
                html.Append("&nbsp;");
                html.Append(mbdList[i].empBD);
                html.Append("(");
                html.Append(mbdList[i].empBDdate);
                html.Append(")</span><br>");
               
            }
        }
        html.Append("</th></tr></table></div><!--/.box-body--></div><!--/.box--></div>");
        log.endWrite(html.ToString(), className, methodName);
        return html.ToString();
    }


    /// <summary>
    /// 取得信件資料
    /// </summary>
    /// <returns>取得信件資料</returns>
    public string getEmailBoxHtml()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        StringBuilder html = new StringBuilder();
        string U_MDEP = Session["U_MDEP"].ToString();
        html.Append("<div class='col-md-6'><div class='box box-danger'><div class='box-header'><i class='fa fa-envelope'></i><h3 class='box-title'>電子郵件</h3><div class='box-tools pull-right' data-toggle='tooltip' title='看更多'><div class='btn-group' data-toggle='btn-toggle'><a href='infro_001.asp'><button type='button' class='btn btn-danger btn-sm'><i class='fa fa-bars'></i></button></a></div></div></div><!--/.box-header--><div class='box-body'><table class='table table-bordered'>");
        List<emailBoxEntity> ebeList = indexService.Instance.getEmailBox(U_Num, group, U_MDEP);//<=======
        if (ebeList.Count == 0)
        {
            html.Append("<tr class='active'><th>無未讀取信件</th></tr>");
        }
        else
        {
            html.Append("<tr class='active'><th></font></td><th>標題</font></th><th>日期</font></th><th>寄件人</th></tr>");
            for (var i = 0; i < ebeList.Count; i++)
            {
                html.Append("<tr align='center' class='12-k'><th>");
                html.Append(i+1);
                html.Append("</th><th align='left'><a class='BlueLink10' href ='../ Public / MMAIL / MMAIL_Detail.asp?auto_id=");
                html.Append(ebeList[i].auto_id);
                html.Append("'>");
                html.Append(ebeList[i].MS_Title);
                html.Append("</a></th><th>");
                html.Append(ebeList[i].add_Date);
                html.Append("</th><th>");
                html.Append(ebeList[i].MS_Sender_Name);
                html.Append("</th></tr>");
                if (i == 3)
                {
                    i = ebeList.Count;
                }
            }
        }
        html.Append("</table></div><!--/.box-body--></div><!--/.box--></div>");
        log.endWrite(html.ToString(), className, methodName);
        return html.ToString();
    }


    /// <summary>
    /// 取得Call訊列表
    /// </summary>
    /// <returns>取得Call訊列表</returns>
    public string getCallMassageHtml()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        StringBuilder html = new StringBuilder();
        string U_MDEP = Session["U_MDEP"].ToString();
        string U_POSITION = Session["U_POSITION"].ToString();
        string Comid = Session["ComID"].ToString();
        //U_Num = "A9612037";//測試
        List<callMassageEntity> cmeList = indexService.Instance.getCallMassage(U_Num, U_MDEP, U_POSITION, Comid,group);//<==========
        html.Append("<div class='col-md-6'>" +
                    "<div class='box box-danger'>" +
                    "<div class='box-header'>" +
            "<i class='fa fa-comments-o'>" +
            "</i><h3 class='box-title'>Call訊22</h3><div class='box-tools pull-right' data-toggle='tooltip' title='看更多'>" +
            "<div class='btn-group' data-toggle='btn-toggle' ><button type = 'button' class='btn btn-danger btn-sm '>" +
            "<i class='fa fa-bars'></i></button></div></div></div><div class='box-body chat' id='chat-box'>");

        for (var i = 0; i < cmeList.Count; i++)
        {
            html.Append("<div class='item'><img src = 'img/teacher/");
            html.Append(cmeList[i].U_EName);
            html.Append("_180.jpg' alt='user image' class='offline'/><p class='message'><a href = '#' class='name'><small class='text-muted pull-right'><i class='fa fa-clock-o'></i>");
            html.Append(cmeList[i].add_Date);
            html.Append("</small>");
            html.Append(cmeList[i].U_Name);
            html.Append("-");
            html.Append(cmeList[i].ddesc);
            html.Append("</a>");
            html.Append(cmeList[i].msg_text);
            html.Append("</p></div>");
        }
        html.Append("</div><!--/.chat--></div><!--/.box(chat box)--></div>");
        log.endWrite(html.ToString(), className, methodName);
        return html.ToString();
    }

    /// <summary>
    /// 取得今日聯絡事項
    /// </summary>
    /// <returns>取得今日聯絡事項</returns>
    public string getTodayConnectionMatterHtml()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        StringBuilder html = new StringBuilder();
        html.Append("<div class='col-md-6'><div class='box box-danger'><div class='box-header'><i class='fa fa-list-alt'></i><h3 class='box-title'>今日聯絡事項</h3></div><!--/.box-header--><div class='box-body'><table class='table table-bordered'>");
        //U_Num = "A9607021";//測試 
        List<todayConnectionMatterEntity> tcmeList = indexService.Instance.getTodayConnectionMatter(U_Num);//<====
        //List<midMNameEntity> minList = indexService.Instance.getMidMNameEntityList();//<==========================
        //List<ditcodedescEntity> ddeList = indexService.Instance.getditcodedescEntityList();//<==================
        List<indexBDdataEntity> dbdList = indexService.Instance.getEmpBDlist();//<================================
        if (tcmeList.Count == 0)
        {
            html.Append("<tr><th>無近日聯絡事項</th></tr>");
        }
        else
        {
            html.Append("<tr align='center' bgcolor='#E5E5E5' class='12-k'><td WIDTH ='5%'></td><td WIDTH = '20%'>時間</td><td width = '20%'>客戶姓名</td><td width = '35%'>再聯絡項目</td><td WIDTH = '20%'>建檔人員</td></tr>");
            for (var i = 0; i < tcmeList.Count; i++)
            {
                html.Append("<tr align = 'center' class='12-k'><td>");
                html.Append(i+1);
                html.Append("</td><td>");
                html.Append(common.dateTimeToDate(tcmeList[i].N_Date));
                html.Append("</td><td>");
                if (tcmeList[i].M_ID.Length > 0)
                {
                    /*for (var j = 0; j < minList.Count; j++)
                    {*/
                        if (tcmeList[i].MMBERm_idEqualMQUSTm_ID)
                        {
                            html.Append("<a class='BlueLink10' href='../MPMMBER/MMBER_Detail.asp?M_ID=");
                            html.Append(tcmeList[i].M_ID);
                            html.Append("' target='");
                            html.Append(tcmeList[i].M_ID);
                            html.Append("'>");
                            html.Append(tcmeList[i].M_Name);
                            //html.Append(minList[j].M_Name);
                            html.Append("</a>");
                        }
                        
                    /*}*/
                }
                else
                {
                    html.Append(tcmeList[i].Q_Name);
                }
                html.Append("</td><td align ='left'>");
                /* for (var k = 0; k < ddeList.Count; k++)
                 {
                     if (tcmeList[i].N_Item.Trim() == ddeList[k].ditcode.Trim())*/
                if (tcmeList[i].MITEMditcodeEqualMQUSTn_Item)
                {
                        html.Append("<b>【");
                    html.Append(tcmeList[i].ddesc);
                    // html.Append(ddeList[k].ddesc);
                    html.Append("】</b>");
                }
               /* }*/
                html.Append("<br>");
                html.Append(tcmeList[i].Question);
                html.Append("</td><td>");
                if (tcmeList[i].Add_User == U_Num)
                {
                    /*for (var g = 0; g < dbdList.Count; g++)
                    {
                        if (dbdList[g].U_Num.Trim() == U_Num)
                        {*/
                        // html.Append(dbdList[g].empName.Trim());
                        html.Append(tcmeList[i].U_Name);
                    /* }
                 }*/
                }
                html.Append("</td></tr>");
            }
        }
        html.Append("</table></div><!--/.box-body--></div><!--/.box--></div>");
        log.endWrite(html.ToString(), className, methodName);
        return html.ToString();
    }


    /// <summary>
    /// 取得群組類別
    /// </summary>
    /// <returns></returns>
    public string getGroup(string U_Mdep, string U_NUM, string Comid)
    {
        string backString = string.Empty;
        if (U_Mdep == "0004" || U_NUM == "B9903311" || U_Mdep == "0001")
        {
            backString = "1";//資訊部財務部顯示
        }
        else if (Comid == "HG01" && U_NUM == "A9501041")
        {
            backString = "2";//營運顯示
        }
        else if (Comid == "HG01" && U_Mdep == "0006")
        {
            backString = "3";//營運B顯示AB組 
        }
        else if (Comid == "HG01")
        {
            backString = "4";//營運A顯示
        }
        else if (Comid == "HG02")
        {
            backString = "5";//投資AB組同時顯示  
        }
        else if (Comid == "HG03")
        {
            backString = "6";//財富AB組同時顯示  
        }
        return backString;
    }

    public string getGroupCode()
    {
        string backString = string.Empty;
        string U_Mdep = Session["U_MDEP"].ToString();
        string U_NUM = Session["U_Num"].ToString();
        string Comid = Session["ComID"].ToString();
        if (U_Mdep == "0004" || U_NUM == "B9903311" || U_Mdep == "0001")
        {
            backString = "1";//資訊部財務部顯示
        }
        else if (Comid == "HG01" && U_NUM == "A9501041")
        {
            backString = "2";//營運顯示
        }
        else if (Comid == "HG01" && U_Mdep == "0006")
        {
            backString = "3";//營運B
        }
        else if (Comid == "HG01" && U_Mdep == "0002")
        {
            backString = "4";//營運A顯示
        }
        else if (Comid == "HG02")
        {
            backString = "5";//投資AB組同時顯示  
        }
        else if (Comid == "HG03")
        {
            backString = "6";//財富AB組同時顯示  
        }
        else if (Comid == "HG04")
        {
            backString = "7";//理財AB組同時顯示  
        }
        else if (Comid == "HG05")
        {
            backString = "8";//理財AB組同時顯示  
        }
        else if (Comid == "HG06")
        {
            backString = "9";//網路事業顯示  
        }
        return backString;
    }

}