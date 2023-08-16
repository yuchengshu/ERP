using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// WFORMjoinWDFORMhgDao 的摘要描述
/// </summary>
public class WFORMjoinWDFORMhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static WFORMjoinWDFORMhgDao _instance = new WFORMjoinWDFORMhgDao();
    public static WFORMjoinWDFORMhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public WFORMjoinWDFORMhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<activityFormTransactionEntity> getWFORMjoinWDFORMdata(string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'StartDate' :" + StartDate + "'EndDate' :" + EndDate, className, methodName);

        string commandText = "select b.dwf_id,b.add_date,a.P_id,b.Mtel from wform a join wdform b on a.wf_id=b.wf_id  where b.del_tag='0' and (b.add_date >= '" + StartDate + "') AND (b.add_date <= '" + EndDate + "') order by  b.add_date";

        List<activityFormTransactionEntity> ameList = WFORMjoinWDFORMhgSql.Instance.getWFORMjoinWDFORMdata(connectionStrings, commandText);//<======

        log.endWrite(ameList.ToString(), className, methodName);
        return ameList;
    }
}