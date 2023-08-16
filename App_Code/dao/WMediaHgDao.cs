using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// WMediaHgDao 的摘要描述
/// </summary>
public class WMediaHgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static WMediaHgDao _instance = new WMediaHgDao();
    public static WMediaHgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public WMediaHgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<MediaDataEntity> getMediaData(string MR_DateY, string MR_DateM)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'MR_DateY' : " + MR_DateY + " 'MR_DateM' : " + MR_DateM , className, methodName);

        string sql1_txt = getSqlTxt.getAnalystTidDataST(MR_DateY, MR_DateM, string.Empty);
        string commandText = "select P_id,hot_count from wmedia where 1=1 " + sql1_txt + " and del_tag='0'";
        List<MediaDataEntity> mdeList = WMediaHgSql.Instance.getMediaData(connectionStrings, commandText);

        log.endWrite("'mdeList' : " + mdeList.ToString(), className, methodName);
        return mdeList;
    }

    public List<ClickDetailEntity> getClickDetail(string MR_DateY, string MR_DateM,string T_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'T_ID' : " + T_ID + " 'MR_DateY' : " + MR_DateY + " 'MR_DateM' : " + MR_DateM , className, methodName);

       
        string sql1_txt = getSqlTxt.getClickDetailST(MR_DateY, MR_DateM, T_ID);
        string commandText = " select M_id,M_Title,M_Date,hot_count from WMedia where open_tag='0' and del_tag='0'" + sql1_txt;
        
        List<ClickDetailEntity> cdeList = WMediaHgSql.Instance.getClickDetail(connectionStrings, commandText);

        log.endWrite("'cdeList' : " + cdeList.ToString(), className, methodName);
        return cdeList;
    }
}