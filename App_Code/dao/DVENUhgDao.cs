using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// DVENUhgDao 的摘要描述
/// </summary>
public class DVENUhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static DVENUhgDao _instance = new DVENUhgDao();
    public static DVENUhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public DVENUhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string getVidCount(string V_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'V_ID' : " + V_ID, className, methodName);
        string commandText = "select count(V_ID) from DVENU where V_ID='" + V_ID + "' and del_tag = '0'";

        string backString = DVENUhgSql.Instance.getVidCount(connectionStrings, commandText);

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }
 
    public List<getVenueMCentity> getVenueMC(string StartDate, string EndDate, string MC)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'StartDate' : " + StartDate+ "'EndDate' : " + EndDate + "'MC' : " + MC, className, methodName);

        string sqltxt = getSqlTxt.getVenueMCst(StartDate, EndDate, MC);
        string commandText = "select DV_ID,V_ID,MC,MC_Name,add_date from DVENU where del_tag = '0'"+ sqltxt;
        
        log.debug2("commandText="+ commandText,"","");
        List<getVenueMCentity> gvceList = DVENUhgSql.Instance.getVenueMC(connectionStrings, commandText);

        log.endWrite("'gvceList' : " + gvceList.ToString(), className, methodName);
        return gvceList;
    }
}