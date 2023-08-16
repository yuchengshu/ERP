using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// WFaxReporthgDao 的摘要描述
/// </summary>
public class WFaxReporthgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static WFaxReporthgDao _instance = new WFaxReporthgDao();
    public static WFaxReporthgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public WFaxReporthgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string deleteDailyResearchReportFuc(string F_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'F_id' :" + F_id, className, methodName);
        string commandText = "UPDATE WFaxReport SET del_tag = '1' WHERE F_id='"+ F_id + "'";
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public string sendReseachReportData(dailyResearchReportEntity drre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'drre':" + drre.ToString(), className, methodName);
        string commandText = string.Empty;
        StringBuilder sb = null;
        if (drre.actionType == "add")
        {
            commandText = "insert into WFaxReport ([P_id],[Open_tag],[Pay],[U_Item],[F_Item],[F_Title],[F_SDate],[F_EDate],[F_VDate],[F_Context],[PDFurl],[F_img1],[F_img2],[F_img3],[add_date],[add_ip],[add_user])values('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}', '{10}', '{11}', '{12}', '{13}', GETDATE(), '{14}', '{15}')";
            sb = new StringBuilder();
            sb.Append(string.Format(commandText, drre.P_id, drre.Open_tag, drre.Pay, drre.U_Item, drre.F_Item, drre.F_Title, drre.F_SDate, drre.F_EDate, drre.F_VDate, drre.F_Context, drre.PDFurl, drre.F_img1, drre.F_img2, drre.F_img3, drre.add_ip, drre.add_user));
        }
        else
        {
            commandText = "UPDATE WFaxReport SET P_id = '{0}',Open_tag = '{1}',Pay = '{2}',U_Item = '{3}',F_Item = '{4}',F_Title = '{5}',F_SDate = '{6}',F_EDate = '{7}',F_VDate = '{8}',F_Context = '{9}',PDFurl = '{10}',Stock1 = '{11}',Stock_Text1 = '{12}',Stock_Note1 = '{13}',Stock2 = '{14}',Stock_Text2 = '{15}',Stock_Note2 = '{16}',Stock3 = '{17}',Stock_Text3 = '{18}',Stock_Note3 = '{19}',Stock4 = '{20}',Stock_Text4 = '{21}',Stock_Note4 = '{22}',Stock5 = '{23}',Stock_Text5 = '{24}',Stock_Note5 = '{25}',Stock6 = '{26}',Stock_Text6 = '{27}',Stock_Note6 = '{28}',Stock7 = '{29}',Stock_Text7 = '{30}',Stock_Note7 = '{31}',Stock8 = '{32}',Stock_Text8 = '{33}',Stock_Note8 = '{34}',Stock9 = '{35}',Stock_Text9 = '{36}',Stock_Note9 = '{37}',Stock10 = '{38}',Stock_Text10 = '{39}',Stock_Note10 = '{40}',edit_date=GETDATE(),edit_ip = '{41}',edit_user = '{42}' WHERE F_id='{43}' ";
            sb = new StringBuilder();
            sb.Append(string.Format(commandText, drre.P_id, drre.Open_tag, drre.Pay, drre.U_Item, drre.F_Item, drre.F_Title, drre.F_SDate, drre.F_EDate, drre.F_VDate, drre.F_Context, drre.PDFurl, drre.Stock1, drre.Stock_Text1, drre.Stock_Note1, drre.Stock2, drre.Stock_Text2, drre.Stock_Note2, drre.Stock3, drre.Stock_Text3, drre.Stock_Note3, drre.Stock4, drre.Stock_Text4, drre.Stock_Note4, drre.Stock5, drre.Stock_Text5, drre.Stock_Note5, drre.Stock6, drre.Stock_Text6, drre.Stock_Note6, drre.Stock7, drre.Stock_Text7, drre.Stock_Note7, drre.Stock8, drre.Stock_Text8, drre.Stock_Note8, drre.Stock9, drre.Stock_Text9, drre.Stock_Note9, drre.Stock10, drre.Stock_Text10, drre.Stock_Note10, drre.add_ip,drre.add_user,drre.F_id));
        }
       
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sb.ToString());

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }


}