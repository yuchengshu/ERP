using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//文章總點閱
public partial class wealthManage_report_MREPO_MCMEB09_MCMEB09_critiquelist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //呼叫的網址
        //http://localhost:13333/wealthManage/report/MREPO/MCMEB09/MCMEB09_critiquelist.aspx?MP_ID=123&MR_SDATE=2022/11/07&MR_EDATE=2022/11/09
        //傳入的參數
        C_ID = Request.QueryString["C_ID"];
        MR_DateY = Request.QueryString["MR_DateY"];
        MR_DateM = Request.QueryString["MR_DateM"];
        //string C_ID2 = Request.QueryString["C_ID"];
        //string MR_DateY2 = Request.QueryString["MR_DateY"];
        //string MR_DateM2 = Request.QueryString["MR_DateM"];
        TestString = "啓/巊";
    }
    public string TestString { get; set; }
    public string C_ID { get; set; }
    public string MR_DateY { get; set; }
    public string MR_DateM { get; set; }
    public string C_ID2 { get; set; }
    public string MR_DateY2 { get; set; }
    public string MR_DateM2 { get; set; }
}
