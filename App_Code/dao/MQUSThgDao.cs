using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MQUST 的摘要描述
/// </summary>
public class MQUSThgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MQUSThgDao _instance = new MQUSThgDao();
    public static MQUSThgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MQUSThgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<todayConnectionMatterEntity> getTodayConnectionMatter(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);
        //測試
        //string commandText = "select top 100 * from MQUST ";
        string commandText = "select top 5 * from MQUST where del_tag='0'  and N_date<=GETDATE () and N_date>=dateadd(d,-7,GETDATE ())  AND add_user='{0}'  order by Add_date desc";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, U_Num));
        List<todayConnectionMatterEntity> tcmeList = MQUSThgSql.Instance.getTodayConnectionMatter(connectionStrings, sbCommandText.ToString());//<========

        log.endWrite(tcmeList.ToString(), className, methodName);
        return tcmeList;
    }

    public string addCallRecordDetail(callRecordEntity cre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'cre' : " + cre.ToString(), className, methodName);
        string commandText = "insert into [HG].[dbo].[MQUST]([M_ID],[Q_Date],[Question],[N_Date],[N_Item],[Add_User],[Add_Date])values('{0}','{1}','{2}','{3}','{4}','{5}',GETDATE())";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, cre.M_ID, cre.Q_Date, cre.Question, cre.N_Date, cre.N_Item, cre.Add_User));
        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<========

        log.endWrite("'backString' : "+ backString, className, methodName);
        return backString;
    }

    /// <summary>
    /// 刪除通話紀錄
    /// </summary>
    /// <param name="Auto_id"></param>
    /// <returns></returns>
    public string deleteCallRecordDetail(string Auto_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Auto_id' : " + Auto_id, className, methodName);

        string commandText = "update MQUST set del_tag ='1' where Auto_id='{0}'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, Auto_id));
        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    /// <summary>
    /// 修改通話紀錄
    /// </summary>
    /// <param name="Auto_id"></param>
    /// <returns></returns>
    public string editCallRecordDetail(callRecordEntity cre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'cre' : " + cre.ToString(), className, methodName);
        string commandText = "update MQUST set Q_Date ='{0}',Question ='{1}',N_Date ='{2}',N_Item ='{3}',Add_User ='{4}' where Auto_id='{5}'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, cre.Q_Date, cre.Question, cre.N_Date, cre.N_Item, cre.Add_User, cre.Auto_id));
        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }



}