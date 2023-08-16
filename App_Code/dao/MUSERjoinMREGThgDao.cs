using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MUSERjoinMREGThgDao 的摘要描述
/// </summary>
public class MUSERjoinMREGThgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MUSERjoinMREGThgDao _instance = new MUSERjoinMREGThgDao();
    public static MUSERjoinMREGThgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MUSERjoinMREGThgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string getMonthPerformanceAims(string startDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'startDate' : " + startDate, className, methodName);

        string commandText = "select sum(cast(b.mr_money as int)) as MR_Money from MUSER a join  MREGT b on a.U_Num=b.MR_Num where b.MR_date='"+ startDate + "'and (U_Mdep='0002' or U_Mdep='0006' or U_Mdep='0007' or U_Mdep='0008'  or U_Mdep='0011' or U_Mdep='0012' or U_Mdep='0013' or U_Mdep='0014')and a.del_tag='0'  and LeaveDate is null";
        string backStr = MUSERjoinMREGThgSql.Instance.getMonthPerformanceAims(connectionStrings, commandText);

        log.endWrite("結果--'backStr' : " + backStr.ToString(), className, methodName);
        return backStr;
    }

    public string getMonthPerformanceAimsByComID(string startDate, string ComID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'startDate' : " + startDate+ " 'ComID':"+ ComID, className, methodName);

        string commandText = "select sum(cast(b.mr_money as int)) as MR_Money from MUSER a join  MREGT b on a.U_Num=b.MR_Num where b.MR_date='" + startDate + "' and COMID='"+ ComID + "' and (U_Mdep='0002' or U_Mdep='0006' or U_Mdep='0007' or U_Mdep='0008'  or U_Mdep='0011' or U_Mdep='0012' or U_Mdep='0013' or U_Mdep='0014')and a.del_tag='0'  and LeaveDate is null";
        string backStr = MUSERjoinMREGThgSql.Instance.getMonthPerformanceAims(connectionStrings, commandText);

        log.endWrite("結果--'backStr' : " + backStr.ToString(), className, methodName);
        return backStr;
    }


}