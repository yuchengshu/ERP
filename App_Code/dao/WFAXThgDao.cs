using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;


/// <summary>
/// WFAXThgDao 的摘要描述
/// </summary>
public class WFAXThgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static WFAXThgDao _instance = new WFAXThgDao();
    public static WFAXThgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public WFAXThgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<closingPriceThreeBigDataEntity> getClosingPriceThreeBigData()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        string commandText = "select * from WFAXT where del_Tag='0' order by WFT_date desc";
        List<closingPriceThreeBigDataEntity> cptbdeList = WFAXThgSql.Instance.getClosingPriceThreeBigData(connectionStrings, commandText);//<==========

        log.endWrite("'cptbdeList' :" + cptbdeList.ToString(), className, methodName);
        return cptbdeList;

    }

    public string deleteThreeBigData(string WFT_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'WFT_id' :" + WFT_id, className, methodName);

        string commandText = "UPDATE WFAXT SET del_tag = '1' WHERE WFT_id='" + WFT_id + "'";
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public string sendThreeBigData(closingPriceThreeBigDataEntity cptbde)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'cptbde':" + cptbde, className, methodName);
        string commandText = string.Empty;
        StringBuilder sb = new StringBuilder();
        if (cptbde.actionType == "add")
        {
            commandText = "INSERT INTO WFAXT ([WFT_date],[WFT_TSE_T1],[WFT_TSE_T2],[WFT_TSE_T3],[WFT_OTC_T1],[WFT_OTC_T2],[WFT_OTC_T3],[WFT_II_T1] ,[WFT_II_T2],[WFT_II_T3],[WFT_II_T4],[add_date])VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}' ,'{8}','{9}','{10}',GETDATE())";
            sb.Append(string.Format(commandText, cptbde.WFT_date, cptbde.WFT_TSE_T1, cptbde.WFT_TSE_T2, cptbde.WFT_TSE_T3, cptbde.WFT_OTC_T1, cptbde.WFT_OTC_T2, cptbde.WFT_OTC_T3, cptbde.WFT_II_T1, cptbde.WFT_II_T2, cptbde.WFT_II_T3, cptbde.WFT_II_T4));
        }
        else
        {
            commandText = "UPDATE WFAXT SET [WFT_date] = '{0}', [WFT_TSE_T1] = '{1}', [WFT_TSE_T2] = '{2}', [WFT_TSE_T3] = '{3}', [WFT_OTC_T1] = '{4}', [WFT_OTC_T2] = '{5}', [WFT_OTC_T3] = '{6}', [WFT_II_T1] = '{7}', [WFT_II_T2] = '{8}', [WFT_II_T3] = '{9}', [WFT_II_T4] = '{10}' WHERE WFT_id = '{11}'";
            sb.Append(string.Format(commandText, cptbde.WFT_date, cptbde.WFT_TSE_T1, cptbde.WFT_TSE_T2, cptbde.WFT_TSE_T3, cptbde.WFT_OTC_T1, cptbde.WFT_OTC_T2, cptbde.WFT_OTC_T3, cptbde.WFT_II_T1, cptbde.WFT_II_T2, cptbde.WFT_II_T3, cptbde.WFT_II_T4, cptbde.WFT_id));
        }

        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sb.ToString());

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
}