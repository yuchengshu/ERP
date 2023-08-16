using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MQUSTjoinMMBERhgDao 的摘要描述
/// </summary>
public class MQUSTjoinMMBERhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MQUSTjoinMMBERhgDao _instance = new MQUSTjoinMMBERhgDao();
    public static MQUSTjoinMMBERhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MQUSTjoinMMBERhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<callRecordEntity> getCallRecordList(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : " + M_ID, className, methodName);
        //原來
        //string commandText = "select a.auto_id,a.Q_Date,a.Question,a.add_user,b.mc from MQUST a join MMBER b on a.m_id=b.m_id where a.del_tag='0' AND a.M_id='{0}' order by a.Add_date desc";
        string commandText = "select a.auto_id,a.Q_Date,a.Question,a.N_Date,a.N_Item,a.add_user,b.mc from MQUST a join MMBER b on a.m_id=b.m_id where a.del_tag='0' AND a.M_id='{0}' order by a.Add_date desc";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, M_ID));
        List<callRecordEntity> creList = MQUSTjoinMMBERhgSql.Instance.getCallRecordList(connectionStrings, sbCommandText.ToString());//<========

        log.endWrite(creList.ToString(), className, methodName);
        return creList;
    }
}