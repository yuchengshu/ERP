using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
//http://localhost:13333/wealthManage/report/MREPO/MREGT02/MREGT02_List.aspx
//?U_Num=B1103011&U_Mdep=&StartDate=02/01/2022&EndDate=12/08/2022
public partial class wealthManage_report_MREPO_MREGT04 : System.Web.UI.Page
{
    private string MS_ID = string.Empty;
    private string MENU_no = string.Empty;
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string getRelativePath()
    {
        return "../../../";
    }
    public string getIP()
    {
        string IP = Session["IP"] == null ? "" : Session["IP"].ToString();
        return IP;

    }

    public string getMENU_no()
    {
        return MENU_no;
    }
    //public string getMENU_no()
    //{
    // return Request.Params["MENU_no"].ToString();
    //}
    public string getM_ID()
    {
        string M_ID = string.Empty;
        try
        {
            if (Request.Params["M_ID"] != null)
            {
                M_ID = Request.Params["M_ID"].ToString();
            }
            else
            {
                M_ID = "";
            }

        }
        catch (Exception)
        {

            M_ID = "";
        }
        return M_ID;
    }

    /// <summary>
    /// 取得員工編號
    /// </summary>
    /// <returns>員工編號</returns>
    //public string getU_Num()
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    log.startWrite(common.nothing, className, methodName);

    //    string U_Num = Session["U_Num"] == null ? "" : Session["U_Num"].ToString();


    //    log.endWrite("'U_Num' : " + U_Num, className, methodName);
    //    return U_Num;
    //}
    //員工編號
    public string UNum { get; set; }
    //姓名
    public string UNAME { get; set; }
    //密碼
    public string U_PWD { get; set; }
    //所屬公司
    public string ComId { get; set; }

    //所屬部門
    public string U_MDEP { get; set; }
    //等級
    public string Posit { get; set; }
    //磁卡號碼
    public string U_Card { get; set; }
    //電子郵件
    public string EMail { get; set; }
    //到職日
    public string SlimDate { get; set; }
    //離職日
    public string LeaveDate { get; set; }
    //姓名
    public string U_Name { get; set; }
    //所屬公司
    //ComID
    public string ComId_ { get; set; }
    //職稱 U_ITEM
    public string U_ITEM { get; set; }
    //分機號碼 U_Tel
    public string U_Tel { get; set; }
    //代理人員工編號
    public string Agent { get; set; }
    //代理人部門
    public string AgentCom { get; set; }
    //代理人姓名
    public string AgentName { get; set; }
    //主管員工編號
    public string LeaderNum { get; set; }
    //主管部門
    public string LeaderCom { get; set; }
    //主管姓名
    public string LeaderName { get; set; }
    public string LeaveDate_ { get; set; }

    public string StartDate_ { get; set; }


    public string getU_Num()
    {
        string U_Num = Context.Request["U_Num"];//所選到的員工編號
                return U_Num;
    }

    public string getU_MDEP()
    {
        string Select_Dept = Context.Request["U_Mdep"];//所選到的員工部門
        return Select_Dept;
    }
    ////?U_Num=B1103011&U_Mdep=&StartDate=02/01/2022&EndDate=12/08/2022
    public string getMR_SDate()
    {
        string StartDate = Context.Request["StartDate"];
        return StartDate;
    }

    public string getMR_EDate()
    {
        string EndDate = Context.Request["EndDate"];
        return EndDate;
    }
    //報到日期
    public string getSlimDate()
    {
        string SlimDate_ = SlimDate;
        return SlimDate_;
    }
    //離職日期
    public string getLeaveDate()
    {
        string LeaveDate_ = LeaveDate;
        return LeaveDate;
    }
    public string getU_Card()
    {
        string U_Card_ = U_Card;
        return U_Card_;
    }
    public string getComID()
    {
        string ComId_ = Context.Request["ComID"]; ;//所選到的員工公司別
        return ComId_;
    }

    public string getU_Tel()
    {
        string U_Tel_ = U_Tel;
        return U_Tel_;
    }

    public string getDept()
    {
        string U_MDEP_ = U_MDEP;
        return U_MDEP_;
    }
    //取得選到的員工職稱
    public string getUITEM()
    {
        string UITEM_ = U_ITEM;
        return UITEM_;
    }
    //取得選到的員工等級
    public string getPosit()
    {
        string Posit_ = Posit;
        return Posit;
    }
    //取得代理人員工編號
    public string getAgentNum()
    {
        string AgentNum_ = Agent;
        return Agent;
    }
    //取得代理人姓名
    public string getAgentName()
    {
        string AgentName_ = AgentName;
        return AgentName_;
    }
    //取得代理人部門
    public string getAgentCom()
    {
        string AgentCom_ = AgentCom;
        return AgentCom_;
    }
    //取得主管員工編號
    public string getLeaderNum()
    {
        string LeaderNum_ = LeaderNum;
        return LeaderNum_;
    }
    //取得主管姓名
    public string getLeaderName()
    {
        string LeaderName_ = LeaderName;
        return LeaderName_;
    }
    //取得主管部門
    public string getLeaderCom()
    {
        string getLeaderCom_ = LeaderCom;
        return getLeaderCom_;
    }



    /*員工編號
姓名
密碼
所屬部門
代理人
等級
磁卡號碼
電子郵件
到職日
姓名
密碼確認
所屬公司
部門主管
職稱
分機號碼
是否打卡
離職日
     */

}