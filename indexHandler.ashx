<%@ WebHandler Language="C#" Class="indexHandler" %>
using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class indexHandler : IHttpHandler
{

    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string U_Num = string.Empty;
        string U_MDEP = string.Empty;
        string U_POSITION = string.Empty;
        string ComID = string.Empty;
        string group = string.Empty;
        switch (action)
        {
            case "searchContentAuthority"://查詢首頁內容的觀看權限
                U_Num = context.Request["U_Num"];
                context.Response.Write(searchContentAuthority(U_Num));
                break;

            case "getHnBankCredit"://華南信用卡額度提醒
                U_Num = context.Request["U_Num"];
                //context.Response.Write(getHnBankCredit());
                context.Response.Write(getHnBankCredit());
                break;

            case "getPerformanceRanking"://業績排行榜
                U_MDEP = context.Request["U_MDEP"];
                group = context.Request["group"];
                context.Response.Write(getPerformanceRanking(U_MDEP, group));
                break;

            case "getRemindEmpBDtableHtml"://生日提醒
                context.Response.Write(getRemindEmpBDtableHtml());
                break;

            case "getNoticeBoard"://公佈欄
                U_MDEP = context.Request["U_MDEP"];
                U_POSITION = context.Request["U_POSITION"];
                group = context.Request["group"];
                context.Response.Write(getNoticeBoard(U_MDEP, U_POSITION, group));
                break;

            case "getCallMassage"://即時call訊
                U_Num = context.Request["U_Num"];
                U_MDEP = context.Request["U_MDEP"];
                U_POSITION = context.Request["U_POSITION"];
                group = context.Request["group"];
                context.Response.Write(getCallMassage( U_Num,U_MDEP, U_POSITION, group));
                break;


            case "getEmailBox"://電子郵件
                U_Num = context.Request["U_Num"];
                U_MDEP = context.Request["U_MDEP"];
                group = context.Request["group"];
                context.Response.Write(getEmailBox(U_Num, U_MDEP, group));
                break;

            case "getTodayConnectionMatter"://今日聯絡事項
                U_Num = context.Request["U_Num"];
                context.Response.Write(getTodayConnectionMatter(U_Num));
                break;

            case "getRemindProgramContractMaturity"://節目合約到期提醒
                U_Num = context.Request["U_Num"];
                context.Response.Write(getRemindProgramContractMaturity());
                break;

        };
    }

    /// <summary>
    /// 查詢首頁內容觀看權限
    /// </summary>
    /// <returns></returns>
    //public List<contentAuthorityEntity> searchContentAuthority(string U_Num)
    public string searchContentAuthority(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);
        List<contentAuthorityEntity> caeList = indexService.Instance.searchContentAuthority(U_Num);//<=======
        log.endWrite(caeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(caeList);
    }

    /// <summary>
    /// 取得公佈欄資料
    /// </summary>
    /// <returns></returns>
    public string getNoticeBoard(string U_MDEP, string U_POSITION, string group)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_MDEP':" + U_MDEP + "'U_POSITION':" + U_POSITION + "'group':" + group, className, methodName);
        List<noticeBoardEntity> nbeList = indexService.Instance.getNoticeBoard(U_MDEP, U_POSITION, group, className);//<==========
        log.endWrite("'nbeList' : " + nbeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(nbeList);
    }
    /// <summary>
    /// 取得即時call訊
    /// </summary>
    /// <returns></returns>
    public string getCallMassage(string U_Num,string U_MDEP, string U_POSITION, string group)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_MDEP':" + U_MDEP + "'U_POSITION':" + U_POSITION + "'group':" + group, className, methodName);
        List<callMassageEntity> nbeList = indexService.Instance.getCallMassage(U_Num,U_MDEP, U_POSITION, group, className);//<==========
        //List<noticeBoardEntity> nbeList = indexService.Instance.getNoticeBoard(U_MDEP, U_POSITION, group, className);//<==========
        log.endWrite("'nbeList' : " + nbeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(nbeList);
    }


    /// <summary>
    /// 取得華南銀行信用卡金額
    /// </summary>
    /// <returns></returns>
    public string getHnBankCredit()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        StringBuilder html = new StringBuilder();
        //html.Append("<div class='col-md-12'><div class='box box-danger'><div class='box-header'><i class='fa fa-calendar'></i><h3 class='box-title'>華南銀行信用卡金額</h3></div><!-- /.box-header --><div class='box-body'><table class='table table-bordered'><tr><th style = 'width: 30%' class='active'>本日壽星</th><th style = 'width: 30%' class='active'>近一週壽星</th><th style = 'width: 40%' class='active'>近月壽星</th></tr><tr><th>");
        List<noticeBoardEntity> nbeList = indexService.Instance.getHnBankCredit();
        log.endWrite("'nbeList' : " + nbeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(nbeList);
        //if (dbdList.Count == 0)
        //{
        //    html.Append("無");
        //}
        //else
        //{
        //    for (var i = 0; i < dbdList.Count; i++)
        //    {
        //        html.Append("<span class='label label-danger'>");
        //        html.Append(dbdList[0].adver_id);
        //        //html.Append(dbdList[i].empName);
        //        //html.Append("&nbsp;");
        //        //html.Append(dbdList[i].empBD);
        //        //html.Append("(");
        //        //html.Append(dbdList[i].empBDdate);
        //        html.Append("</span>");
        //    }
        //}
        //html.Append("</th><th>");
        //List<indexBDdataEntity> wbdList = indexService.Instance.getBDerList(1, 6);//<===============取未來一周生日者
        //if (wbdList.Count == 0)
        //{
        //    html.Append("無");
        //}
        //else
        //{
        //    for (var i = 0; i < wbdList.Count; i++)
        //    {
        //        html.Append("<span class='label label-danger label-lg'>");
        //        html.Append(wbdList[i].empName);
        //        html.Append("&nbsp;");
        //        html.Append(wbdList[i].empBD);
        //        html.Append("(");
        //        html.Append(wbdList[i].empBDdate);
        //        html.Append(")</span>");
        //    }
        //}
        //html.Append("</th><th>");

        //List<indexBDdataEntity> mbdList = indexService.Instance.getBDerList(1, 30);//<===============取未來一個月生日者
        //if (mbdList.Count == 0)
        //{
        //    html.Append("無");
        //}
        //else
        //{
        //    for (var i = 0; i < mbdList.Count; i++)
        //    {
        //        html.Append("<span class='label label-primary'>");
        //        html.Append(mbdList[i].empName);
        //        html.Append("&nbsp;");
        //        html.Append(mbdList[i].empBD);
        //        html.Append("(");
        //        html.Append(mbdList[i].empBDdate);
        //        html.Append(")</span>");

        //    }
        //}
        //html.Append("</th></tr></table></div><!--/.box-body--></div><!--/.box--></div>");
        log.endWrite("'html':" + html.ToString(), className, methodName);
        return html.ToString();
        //string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite(common.nothing, className, methodName);

        //StringBuilder html = new StringBuilder();
        //html.Append("<div class='col-md-12'><div class='box box-danger'><div class='box-header'><i class='fa fa-calendar'></i><h3 class='box-title'>華南銀行信用卡金額</h3></div><!-- /.box-header --><div class='box-body'><table class='table table-bordered'><tr><th style = 'width: 30%' class='active'>本日壽星11</th><th style = 'width: 30%' class='active'>近一週壽星</th><th style = 'width: 40%' class='active'>近月壽星</th></tr><tr><th>");
        //List<indexBDdataEntity> dbdList = indexService.Instance.getBDerList(0, 0);//<===============取當日生日者
        //if (dbdList.Count == 0)
        //{
        //    html.Append("無");
        //}
        //else
        //{
        //    for (var i = 0; i < dbdList.Count; i++)
        //    {
        //        html.Append("<span class='label label-danger'>");
        //        html.Append(dbdList[i].empName);
        //        html.Append("&nbsp;");
        //        html.Append(dbdList[i].empBD);
        //        html.Append("(");
        //        html.Append(dbdList[i].empBDdate);
        //        html.Append(")</span>");
        //    }
        //}
        //html.Append("</th><th>");
        //List<indexBDdataEntity> wbdList = indexService.Instance.getBDerList(1, 6);//<===============取未來一周生日者
        //if (wbdList.Count == 0)
        //{
        //    html.Append("無");
        //}
        //else
        //{
        //    for (var i = 0; i < wbdList.Count; i++)
        //    {
        //        html.Append("<span class='label label-danger label-lg'>");
        //        html.Append(wbdList[i].empName);
        //        html.Append("&nbsp;");
        //        html.Append(wbdList[i].empBD);
        //        html.Append("(");
        //        html.Append(wbdList[i].empBDdate);
        //        html.Append(")</span>");
        //    }
        //}
        //html.Append("</th><th>");

        //List<indexBDdataEntity> mbdList = indexService.Instance.getBDerList(1, 30);//<===============取未來一個月生日者
        //if (mbdList.Count == 0)
        //{
        //    html.Append("無");
        //}
        //else
        //{
        //    for (var i = 0; i < mbdList.Count; i++)
        //    {
        //        html.Append("<span class='label label-primary'>");
        //        html.Append(mbdList[i].empName);
        //        html.Append("&nbsp;");
        //        html.Append(mbdList[i].empBD);
        //        html.Append("(");
        //        html.Append(mbdList[i].empBDdate);
        //        html.Append(")</span>");

        //    }
        //}
        //html.Append("</th></tr></table></div><!--/.box-body--></div><!--/.box--></div>");
        //log.endWrite("'html':" + html.ToString(), className, methodName);
        //return html.ToString();
    }
    ///20220317功能=>生成畫面(生日提醒)
    /// <summary>
    /// 取得員工生日列表
    /// </summary>
    /// <returns>員工生日列表</returns>
    public string getRemindEmpBDtableHtml()
    {

        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        StringBuilder html = new StringBuilder();
        html.Append("<div class='col-md-12'><div class='box box-danger'><div class='box-header'><i class='fa fa-calendar'></i><h3 class='box-title'>生日提醒</h3></div><!-- /.box-header --><div class='box-body'><table class='table table-bordered'><tr><th style = 'width: 30%' class='active'>本日壽星</th><th style = 'width: 30%' class='active'>近一週壽星</th><th style = 'width: 40%' class='active'>近月壽星</th></tr><tr><th>");
        List<indexBDdataEntity> dbdList = indexService.Instance.getBDerList(0, 0);//<===============取當日生日者
        if (dbdList.Count == 0)
        {
            html.Append("無");
        }
        else
        {
            for (var i = 0; i < dbdList.Count; i++)
            {
                html.Append("<span class='label label-danger'>");
                html.Append(dbdList[i].empName);
                html.Append("&nbsp;");
                html.Append(dbdList[i].empBD);
                html.Append("(");
                html.Append(dbdList[i].empBDdate);
                html.Append(")</span>");
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
                html.Append(")</span>");
            }
        }
        html.Append("</th><th>");

        List<indexBDdataEntity> mbdList = indexService.Instance.getBDerList(1, 30);//<===============取未來一個月生日者
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
                html.Append(")</span>");

            }
        }
        html.Append("</th></tr></table></div><!--/.box-body--></div><!--/.box--></div>");
        log.endWrite("'html':" + html.ToString(), className, methodName);
        return html.ToString();
    }

    /// <summary>
    /// 取得信件資料
    /// </summary>
    public string getEmailBox(string U_Num, string U_MDEP, string group)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num':" + U_Num + "'U_MDEP':" + U_MDEP + "'group':" + group, className, methodName);

        List<emailBoxEntity> ebeList = indexService.Instance.getEmailBox(U_Num, group, U_MDEP);//<=======

        log.endWrite("'ebeList':" + ebeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ebeList);
    }

    /// <summary>
    /// 取得Call訊列表
    /// </summary>
    /// <returns>取得Call訊列表</returns>
    public string getCallMassage(string U_Num, string U_MDEP, string U_POSITION, string Comid, string group)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num':" + U_Num + "'U_MDEP':" + U_MDEP + "'U_POSITION':" + U_POSITION + "'Comid':" + Comid + "'group':" + group, className, methodName);
        List<callMassageEntity> cmeList = indexService.Instance.getCallMassage(U_Num, U_MDEP, U_POSITION, Comid, group);//<==========

        log.endWrite("'cmeList' :" + cmeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cmeList);
    }

    /// <summary>
    /// 取得今日聯絡事項
    /// </summary>
    /// <returns>取得今日聯絡事項</returns>
    public string getTodayConnectionMatter(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<todayConnectionMatterEntity> tcmeList = indexService.Instance.getTodayConnectionMatter(U_Num);//<====

        log.endWrite("'tcmeList':" + tcmeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(tcmeList);
    }

    /// <summary>
    /// 取得業績排行榜
    /// </summary>
    /// <returns></returns>
    public string getPerformanceRanking(string U_MDEP, string group)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_MDEP' : " + U_MDEP + "'group' : " + group, className, methodName);

        List<performanceRankingEntity> preLiST = indexService.Instance.getPerformanceRanking(U_MDEP, group);//<===========

        log.endWrite("'preLiST' :" + preLiST.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(preLiST);
    }
    
    //getRemindProgramContractMaturity
    /// <summary>
    /// 取得節目合約到期提醒
    /// </summary>
    /// <returns></returns>
    public string getRemindProgramContractMaturity()
    {
        //var data = "U_MDEP=" + U_MDEP_M + "&group=" + Group_G + "&action=videoOutofdateRemind";
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
       // log.startWrite("'U_MDEP' : " + U_MDEP + "'group' : " + group, className, methodName);

        List<remindProgramContractMaturityEntity> preLiST = indexService.Instance.getRemindProgramContractMaturity();//<===========

        log.endWrite("'preLiST' :" + preLiST.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(preLiST);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}