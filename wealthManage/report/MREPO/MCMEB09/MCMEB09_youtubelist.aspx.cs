using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//YouTube總點閱
public partial class wealthManage_report_MREPO_MCMEB09_MCMEB09_youtubelist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //呼叫的網址
        //http://localhost:13333/wealthManage/report/MREPO/MCMEB09/MCMEB09_youtubelist.aspx?MP_ID=123&MR_SDATE=%272022/11/09%27&MR_EDATE=%272022/11/09%27
        //http://localhost:13333/wealthManage/report/MREPO/MCMEB09/MCMEB09_youtubelist.aspx?MP_ID=123&MR_SDATE='2022/11/09'&MR_EDATE='2022/11/09'
        //                       wealthManage/report/MREPO/MCMEB09/reportHandleMCMEB09_youtubelist.ashx
        //
        //傳入的參數
        P_ID = Request.QueryString["P_ID"];//分析師編號
        MR_DateY = Request.QueryString["MR_DateY"];//年分
        MR_DateM = Request.QueryString["MR_DateM"];//月
    }

    public string P_ID { get; set; }
    public string MR_DateY { get; set; }
    public string MR_DateM { get; set; }
}