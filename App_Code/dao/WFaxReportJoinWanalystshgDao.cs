using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// WFaxReportJoinWanalystshgDao 的摘要描述
/// </summary>
public class WFaxReportJoinWanalystshgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static WFaxReportJoinWanalystshgDao _instance = new WFaxReportJoinWanalystshgDao();
    public static WFaxReportJoinWanalystshgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public WFaxReportJoinWanalystshgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<dailyResearchReportEntity> getDailyResearchReportList(getMessageListParam gmlp)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MP' :" + gmlp.MP + "'MP_Item' :" + gmlp.MP_Item + "'StartDate' :" + gmlp.StartDate + "'EndDate' :" + gmlp.EndDate + "'keyWord' :" + gmlp.keyWord + "'U_MDEP':" + gmlp.U_MDEP + "'U_POSITION':" + gmlp.U_POSITION + "'ComID':" + gmlp.ComID + "'U_Num':" + gmlp.U_Num, className, methodName);
        string commandText = string.Empty;
        string sql_txt = getSqlTxt.getDailyResearchReportListST(gmlp);
        string U_MDEP = gmlp.U_MDEP;
        if (U_MDEP == "0003" || U_MDEP == "0004" || U_MDEP == "0009" || U_MDEP == "0001" || U_MDEP == "0010")
        {
            
            commandText = "select a.F_id,a.P_id,a.Open_tag,a.Pay,a.U_Item,a.F_Item,a.F_Title,a.F_SDate,a.F_EDate,a.PDFUrl,b.u_num,a.F_VDate,a.F_Context,a.F_img1,a.F_img2,a.F_img3,a.Stock1,a.Stock_Text1,a.Stock_Note1,a.Stock2,a.Stock_Text2,a.Stock_Note2,a.Stock3,a.Stock_Text3,a.Stock_Note3,a.Stock4,a.Stock_Text4,a.Stock_Note4,a.Stock5,a.Stock_Text5,a.Stock_Note5,a.Stock6,a.Stock_Text6,a.Stock_Note6,a.Stock7,a.Stock_Text7,a.Stock_Note7,a.Stock8,a.Stock_Text8,a.Stock_Note8,a.Stock9,a.Stock_Text9,a.Stock_Note9,a.Stock10,a.Stock_Text10,a.Stock_Note10 from WFaxReport a join Wanalysts b on a.p_id=b.t_id where a.del_tag = '0' " + sql_txt + " order by a.F_SDate desc,a.P_id";
        }
        else if (U_MDEP == "0002" || U_MDEP == "0006" || U_MDEP == "0015" || U_MDEP == "0016")
        {
            commandText = "select a.F_id,a.P_id,a.Open_tag,a.Pay,a.U_Item,a.F_Item,a.F_Title,a.F_SDate,a.F_EDate,a.PDFUrl,b.u_num,a.F_VDate,a.F_Context,a.F_img1,a.F_img2,a.F_img3,a.Stock1,a.Stock_Text1,a.Stock_Note1,a.Stock2,a.Stock_Text2,a.Stock_Note2,a.Stock3,a.Stock_Text3,a.Stock_Note3,a.Stock4,a.Stock_Text4,a.Stock_Note4,a.Stock5,a.Stock_Text5,a.Stock_Note5,a.Stock6,a.Stock_Text6,a.Stock_Note6,a.Stock7,a.Stock_Text7,a.Stock_Note7,a.Stock8,a.Stock_Text8,a.Stock_Note8,a.Stock9,a.Stock_Text9,a.Stock_Note9,a.Stock10,a.Stock_Text10,a.Stock_Note10 from WFaxReport a join Wanalysts b on a.p_id=b.t_id where a.del_tag = '0' and a.open_tag='0' and (P_COM = 'HG01' or P_COM = 'HG05')" + sql_txt + " order by a.F_SDate desc,a.P_id";
        }
        else if (gmlp.U_POSITION == "0005")
        {
            commandText = "select a.F_id,a.P_id,a.Open_tag,a.Pay,a.U_Item,a.F_Item,a.F_Title,a.F_SDate,a.F_EDate,a.PDFUrl,b.u_num,a.F_VDate,a.F_Context,a.F_img1,a.F_img2,a.F_img3,a.Stock1,a.Stock_Text1,a.Stock_Note1,a.Stock2,a.Stock_Text2,a.Stock_Note2,a.Stock3,a.Stock_Text3,a.Stock_Note3,a.Stock4,a.Stock_Text4,a.Stock_Note4,a.Stock5,a.Stock_Text5,a.Stock_Note5,a.Stock6,a.Stock_Text6,a.Stock_Note6,a.Stock7,a.Stock_Text7,a.Stock_Note7,a.Stock8,a.Stock_Text8,a.Stock_Note8,a.Stock9,a.Stock_Text9,a.Stock_Note9,a.Stock10,a.Stock_Text10,a.Stock_Note10 from WFaxReport a join Wanalysts b on a.p_id=b.t_id where a.del_tag = '0' and a.open_tag='0' and b.U_num='" + gmlp.U_Num + "' " + sql_txt + " order by a.F_SDate desc,a.P_id";
        }
        else
        {
            commandText = "select a.F_id,a.P_id,a.Open_tag,a.Pay,a.U_Item,a.F_Item,a.F_Title,a.F_SDate,a.F_EDate,a.PDFUrl,b.u_num,a.F_VDate,a.F_Context,a.F_img1,a.F_img2,a.F_img3,a.Stock1,a.Stock_Text1,a.Stock_Note1,a.Stock2,a.Stock_Text2,a.Stock_Note2,a.Stock3,a.Stock_Text3,a.Stock_Note3,a.Stock4,a.Stock_Text4,a.Stock_Note4,a.Stock5,a.Stock_Text5,a.Stock_Note5,a.Stock6,a.Stock_Text6,a.Stock_Note6,a.Stock7,a.Stock_Text7,a.Stock_Note7,a.Stock8,a.Stock_Text8,a.Stock_Note8,a.Stock9,a.Stock_Text9,a.Stock_Note9,a.Stock10,a.Stock_Text10,a.Stock_Note10 from WFaxReport a join Wanalysts b on a.p_id=b.t_id where a.del_tag = '0' and a.open_tag='0' and P_COM = '" + gmlp.ComID + "'" + sql_txt + " order by a.F_SDate desc,a.P_id";
        }

        List<dailyResearchReportEntity> drreList = WFaxReportJoinWanalystshgSql.Instance.getDailyResearchReportList(connectionStrings, commandText);//<====

        log.endWrite("'drreList' :" + drreList.ToString(), className, methodName);
        return drreList;
    }
}