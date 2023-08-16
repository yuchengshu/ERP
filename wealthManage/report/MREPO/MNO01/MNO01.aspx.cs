using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class wealthManage_report_MREPO_MNO01_MNO01 : System.Web.UI.Page
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string getPerMonthRevenueForDraw()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'無'", className, methodName);

        List<List<string>> strListList = reportServiceMNO01.Instance.getPerMonthRevenueForDraw();//<==========

        log.endWrite("結果--'pmreList' : " + strListList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(strListList);
    }

    public string getAnalystCPvalue()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'無'", className, methodName);

        List<List<string>> strListList = reportServiceMNO01.Instance.getAnalystCPvalue();//<==========

        log.endWrite("結果--'strListList' : " + strListList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(strListList);
    }
}