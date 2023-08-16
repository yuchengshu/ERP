using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class wealthManage_customerManage_MMBER_printEnvelope : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterClientScriptInclude("myPrint", "Print.js");
    }
   
    public string getCDDdata()
    {
        string tId = Request.Params["T_ID"];
        //string tId = "2018121214400945";
        tradeRecordEntity tre = MTRAThgDao.Instance.getCDDdata(tId);
        return Newtonsoft.Json.JsonConvert.SerializeObject(tre);
    }
}