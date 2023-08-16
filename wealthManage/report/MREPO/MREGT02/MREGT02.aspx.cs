using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class wealthManage_report_MREPO_MCMEB09_MCMEB09 : System.Web.UI.Page
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
    public string ComID { get; set; }
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


    public string getU_Num()
    {
        string U_Num = Context.Request["U_Num"];//所選到的員工編號
        //sql連線字串 webconfig的對應位置
        //private static string connectionStrings = "sqlConnectHG_Test";
        //string U_Num = "";
        //取得此類別名稱
        string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        //U_Num= context.Request["U_Num"];
        //U_Num = Session["U_Num"] == null ? "" : Session["U_Num"].ToString();


        log.endWrite("'U_Num' : " + U_Num, className, methodName);
        //string commandText = "SELECT [U_id],[U_Num],[U_Pwd],[U_Name],[U_MDEP],[U_Card],[U_Tel],[EMail],[U_POSITION],[ComID],[U_Item],[SlimDate],[LeaveDate] FROM [HG].[dbo].[MUSER] where U_Num='"+ U_Num + "'";
        //string commandText = "SELECT [U_id],[U_Num],[U_Pwd],[U_Name],[U_MDEP],[U_Card],[U_Tel],[EMail],[U_POSITION],[ComID],[U_Item],[SlimDate],[LeaveDate],[U_Agent],[U_AgentCom],[U_AgentName],[U_Leader],[U_LeaderCom],[U_LeaderName] FROM [HG].[dbo].[MUSER] where U_Num='" + U_Num + "'";
        string commandText = "SELECT [U_id],[U_Num],[U_Pwd],[U_Name],[U_MDEP],[U_Card],[U_Tel],[EMail],[U_POSITION],[ComID],[U_Item],CONVERT(varchar(12) ,[SlimDate],111),CONVERT(varchar(12),[LeaveDate],111),[U_Agent],[U_AgentCom],[U_AgentName],[U_Leader],[U_LeaderCom],[U_LeaderName] FROM [HG].[dbo].[MUSER] where U_Num='" + U_Num + "'";

        UNum = U_Num;
        //return U_Num;
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            muserEntity muse = new muserEntity();
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    muse = new muserEntity();
                    muse.U_id = sr[0].ToString().Trim();
                    muse.U_Num = sr[1].ToString().Trim();
                    muse.U_Pwd = sr[2].ToString().Trim();
                    muse.U_Name = sr[3].ToString().Trim();
                    muse.U_MDEP = sr[4].ToString().Trim();
                    muse.U_Card = sr[5].ToString().Trim();
                    muse.U_Tel = sr[6].ToString().Trim();
                    muse.EMail = sr[7].ToString().Trim();
                    muse.U_POSITION = sr[8].ToString().Trim();
                    muse.ComID = sr[9].ToString().Trim();
                    muse.U_Item = sr[10].ToString().Trim();
                    muse.SlimDate = sr[11].ToString();
                    muse.LeaveDate = sr[12].ToString().Trim();
                    muse.U_AgentNum = sr[13].ToString().Trim();
                    muse.U_AgentCom = sr[14].ToString().Trim();
                    muse.U_AgentName = sr[15].ToString().Trim();
                    muse.U_LeaderNum = sr[16].ToString().Trim();
                    muse.U_LeaderCom = sr[17].ToString().Trim();
                    muse.U_LeaderName = sr[18].ToString().Trim();
                    U_Name = muse.U_Name;//姓名
                    U_PWD = muse.U_Pwd;//密碼
                    EMail = sr[7].ToString().Trim();//電子郵件
                    ComID = sr[9].ToString().Trim();//所屬公司
                    U_MDEP = sr[4].ToString().Trim();//所屬部門
                    U_ITEM = sr[10].ToString().Trim();//職稱
                    Posit = sr[8].ToString().Trim();//等級
                    U_Card = sr[5].ToString().Trim();//磁卡號碼
                    U_Tel = sr[6].ToString().Trim();//分機號碼
                    Agent = sr[13].ToString().Trim();//代理人員工編號
                    AgentCom = sr[14].ToString().Trim();//代理人部門
                    AgentName = sr[15].ToString().Trim();//代理人姓名
                    LeaderNum = sr[16].ToString().Trim();//主管員工編號
                    LeaderCom = sr[17].ToString().Trim();//主管部門
                    LeaderName = sr[18].ToString().Trim();//主管姓名
                    //代理人
                    //主管
                    //是否打卡
                    if (sr[11].ToString().Trim() != "")
                    {
                        var SlimDate_ = DateTime.Parse(sr[11].ToString().Trim()).ToString("yyyy-MM-dd");
                        SlimDate = SlimDate_;
                    }
                    else
                    {
                        SlimDate = "";
                    }
                    //SlimDate = sr[11].ToString().Trim();//到職日(20220920要改成只取日期)原本:2010/3/31 上午 12:00:00
                    //SlimDate = SlimDate_;
                    //離職日
                    if (sr[12].ToString().Trim() != "")
                    {
                        LeaveDate_ = DateTime.Parse(sr[12].ToString().Trim()).ToString("yyyy-MM-dd");
                    }
                    else
                    {
                        LeaveDate_ = "";
                    }
                    LeaveDate = LeaveDate_;//離職日(20220920要改成只取日期)
                }
            }
        }
        return U_Num;


    }

    public string getU_Name()
    {
        string U_Name_ = U_Name;//員工編號
        return U_Name_;
    }

    public string getU_PWD()
    {
        string U_PWD_ = U_PWD;
        return U_PWD_;
    }

    public string getEmail()
    {
        string EMail_ = EMail;
        return EMail_;
    }

    public string getSlimDate()
    {
        string SlimDate_ = SlimDate;
        return SlimDate_;
    }

    public string getLeaveDate()
    {
        string LeaveDate_ = LeaveDate;
        return LeaveDate_;
    }
    public string getU_Card()
    {
        string U_Card_ = U_Card;
        return U_Card_;
    }
    public string getComID()
    {
        string ComId_ = ComID;
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