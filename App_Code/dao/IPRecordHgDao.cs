using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// IPRecordHgDao 的摘要描述
/// </summary>
public class IPRecordHgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static IPRecordHgDao _instance = new IPRecordHgDao();
    public static IPRecordHgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public IPRecordHgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<WebsiteIPdetailEntity> getWebsiteIPdetail(string StartDate, string EndDate, string Report_Item)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'Report_Item' : " + Report_Item, className, methodName);

        string sql_txt = getSqlTxt.getWebsiteIPdetailST(StartDate,EndDate);
        string commandText = "SELECT Detail, StartDate, P_id FROM IPRecord WHERE ((StartDate IS NOT NULL) OR  (Detail IS NOT NULL)) and action='付費文章'"+ sql_txt + " GROUP BY Detail, StartDate, P_id ORDER BY StartDate DESC";
        List<WebsiteIPdetailEntity> wIPdeList = IPRecordHgSql.Instance.getWebsiteIPdetail(connectionStrings, commandText);//<==========

        log.endWrite("'wIPdeList' : " + wIPdeList.ToString(), className, methodName);
        return wIPdeList;
    }

    public List<MemberBrowseDataEntity> getMemberBrowseData(string Detail)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'Detail' : " + Detail, className, methodName);

        string commandText = "select M_id,M_Ch,LoginTime from (select * ,row_number() over (partition by m_id order by add_date desc) sn from iprecord WHERE (Detail = '"+ Detail + "')) R where R.sn='1' order by R.add_Date desc";
        List <MemberBrowseDataEntity> mbdeList = IPRecordHgSql.Instance.getMemberBrowseData(connectionStrings, commandText);//<==========

        log.endWrite("'mbdeList' : " + mbdeList.ToString(), className, methodName);
        return mbdeList;
    }

    public List<MemberBrowseDataEntity> getPersonBrowseData(string M_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'M_id' : " + M_id, className, methodName);

        string commandText = "select M_id,M_Ch,LoginTime,Action,Detail from iprecord  WHERE action='付費文章' and M_ID = '" + M_id + "' ORDER BY ADD_dATE desc";
        List<MemberBrowseDataEntity> mbdeList = IPRecordHgSql.Instance.getPersonBrowseData(connectionStrings, commandText);//<==========

        log.endWrite("'mbdeList' : " + mbdeList.ToString(), className, methodName);
        return mbdeList;
    }
}