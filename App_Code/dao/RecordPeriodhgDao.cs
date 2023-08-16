using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// RecordPeriodhgDao 的摘要描述
/// </summary>
public class RecordPeriodhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static RecordPeriodhgDao _instance = new RecordPeriodhgDao();
    public static RecordPeriodhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public RecordPeriodhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string add(RecordPeriodEntity rpe)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'rpe' : " + rpe.ToString(), className, methodName);

        string commandText = "INSERT INTO RecordPeriod ([M_id],[T_id],[P_id],[Open_tag],[MPRD_ID],[DPRD_ID],[MClass],[MLevel],[Del_tag],[Add_user])VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}')";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(commandText, rpe.M_id,rpe.T_id,rpe.P_id,rpe.Open_tag,rpe.MPRD_ID,rpe.DPRD_ID,rpe.MClass,rpe.Mlevel,rpe.Del_tag,rpe.Add_user));
        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sb.ToString());//<======

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    public string getMid(string Tid)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Tid' : " + Tid, className, methodName);

        string commandText = "select M_id From RecordPeriod where T_id='" + Tid + "' and Del_tag='0'";

        string backString = RecordPeriodhgSql.Instance.getMid(connectionStrings, commandText);//<======

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

}