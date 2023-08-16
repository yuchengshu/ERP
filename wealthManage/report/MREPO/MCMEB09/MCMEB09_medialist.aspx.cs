using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class wealthManage_report_MREPO_MCMEB09_MCMEB09_medialist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        M_ID = Request.QueryString["M_ID"];//編號
        MR_DateY = Request.QueryString["MR_DateY"];//年分
        MR_DateM = Request.QueryString["MR_DateM"];//月
    }

    public string M_ID { get; set; }
    public string MR_DateY { get; set; }
    public string MR_DateM { get; set; }
}