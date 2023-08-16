using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// WVideoHgDao 的摘要描述
/// </summary>
public class WCritiqueHgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static WCritiqueHgDao _instance = new WCritiqueHgDao();
    public static WCritiqueHgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public WCritiqueHgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<CritiqueDataEntity> getCritiqueData(string MR_DateY, string MR_DateM)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'MR_DateY' : " + MR_DateY + " 'MR_DateM' : " + MR_DateM, className, methodName);

        string sql_txt = getSqlTxt.getAnalystTidDataST(MR_DateY, MR_DateM, string.Empty);
        string commandText = "select P_id,hot_count from WCritique where 1=1" + sql_txt + " and del_tag='0'";

        List<CritiqueDataEntity> cdeList = WCritiqueHgSql.Instance.getCritiqueData(connectionStrings, commandText);

        log.endWrite("'cdeList' : " + cdeList.ToString(), className, methodName);
        return cdeList;
    }

    public List<ClickDetailEntity> getClickDetail(string MR_DateY, string MR_DateM, string t_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 't_id' : " + t_id + " 'MR_DateY' : " + MR_DateY + " 'MR_DateM' : " + MR_DateM , className, methodName);

        string sql1_txt = getSqlTxt.getAnalystTidDataST(MR_DateY, MR_DateM, t_id);
        string commandText = "select C_id,C_Title,C_Date,hot_count from WCritique where  open_tag='0' and del_tag='0'" + sql1_txt;
        List<ClickDetailEntity> cdeList = WMediaHgSql.Instance.getClickDetail(connectionStrings, commandText);

        log.endWrite("'cdeList' : " + cdeList.ToString(), className, methodName);
        return cdeList;
    }}