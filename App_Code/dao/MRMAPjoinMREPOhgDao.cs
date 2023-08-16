using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MRMAPjoinMREPOhgDao 的摘要描述
/// </summary>
public class MRMAPjoinMREPOhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MRMAPjoinMREPOhgDao _instance = new MRMAPjoinMREPOhgDao();
    public static MRMAPjoinMREPOhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MRMAPjoinMREPOhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<reportTabEntity> getReportList(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("U_Num :" + U_Num, className, methodName);

        StringBuilder sbCommandText = new StringBuilder();
        string commandText = "select a.REPO_no,b.DEP_id,b.DEP_name,b.REPO_id,b.REPO_name,b.Note from MRMAP a left join MREPO b on a.REPO_no=b.REPO_no where a.del_tag = '0' and b.del_tag = '0'  and b.Type='報表' and a.per_open='1' and a.U_NUM='{0}'order by dep_id,sort";
        sbCommandText.Append(string.Format(commandText, U_Num));
        List<reportTabEntity> rteList = MRMAPjoinMREPOhgSql.Instance.getReportList(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite("'rteList' : "+rteList.ToString(), className, methodName);
        return rteList;
    }

    public List<reportTabEntity> getAuditList(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("U_Num :" + U_Num, className, methodName);

        StringBuilder sbCommandText = new StringBuilder();
        string commandText = "select a.REPO_no,b.DEP_id,b.DEP_name,b.REPO_id,b.REPO_name,b.Note from MRMAP a left join MREPO b on a.REPO_no=b.REPO_no where a.del_tag = '0' and b.del_tag = '0'  and b.Type='稽核' and a.per_open='1' and a.U_NUM='{0}'order by dep_id,sort";
        sbCommandText.Append(string.Format(commandText, U_Num));
        List<reportTabEntity> rteList = MRMAPjoinMREPOhgSql.Instance.getReportList(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite("'rteList' : " + rteList.ToString(), className, methodName);
        return rteList;
    }
}