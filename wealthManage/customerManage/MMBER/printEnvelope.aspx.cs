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
    public string getEnvelopeCount()
    {
        string count = Request.Params["count"];
        return count;
    }
    public string getEnvelope()
    {
        string tId = Request.Params["T_ID"];
        envelopeEntity eve = MTRATjoinMMBERhgDao.Instance.getEnvelopeData(tId);
        return Newtonsoft.Json.JsonConvert.SerializeObject(eve);
    }
}