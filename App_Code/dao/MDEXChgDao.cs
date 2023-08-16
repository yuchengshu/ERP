using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MDEXChgDao 的摘要描述
/// </summary>
public class MDEXChgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MDEXChgDao _instance = new MDEXChgDao();
    public static MDEXChgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MDEXChgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<compensatoryLeaveDetailEntity> getCompensatoryLeaveData(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num':" + U_Num, className, methodName);

        string commandText = "select DE_ID,DE_Name,DE_SDate,DE_EDate,DE_Ps from MDEXC where DE_User='" + U_Num + "' and del_tag = '0' order by add_Date";
        List<compensatoryLeaveDetailEntity> cldeList = MDEXChgSql.Instance.getCompensatoryLeaveData(connectionStrings, commandText);

        log.endWrite("'cldeList':" + cldeList.ToString(), className, methodName);
        return cldeList;
    }

    public List<compensatoryLeaveDetailEntity> getCompensatoryLeave(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num':" + U_Num, className, methodName);

        int year = DateTime.Now.Year;

        string commandText = "select DE_Day,DE_Hour from MDEXC where DE_user='" + U_Num + "' and DE_SDate>='" + year + "/1/1 23:59:59'  and DE_SDate<='" + year + "/12/31 23:59:59' and del_tag='0'";
        List<compensatoryLeaveDetailEntity> cldeList = MDEXChgSql.Instance.getCompensatoryLeave(connectionStrings, commandText);

        log.endWrite("'cldeList':" + cldeList.ToString(), className, methodName);
        return cldeList;
    }


    public List<compensatoryLeaveDetailEntity> getTakenCompensatoryLeave(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num':" + U_Num, className, methodName);

        int year = DateTime.Now.Year;

        string commandText = "select EX_Day,EX_Hour from MEXCU where EX_Type='0008'   and EX_sdate >= '" + year + "/1/1 00:00:00' and EX_Status = '6' and EX_User='" + U_Num + "' and del_tag = '0' ";
        List<compensatoryLeaveDetailEntity> cldeList = MDEXChgSql.Instance.getCompensatoryLeave(connectionStrings, commandText);

        log.endWrite("'cldeList':" + cldeList.ToString(), className, methodName);
        return cldeList;
    }


    
}