using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MCONThgDao 的摘要描述
/// </summary>
public class MCONThgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MCONThgDao _instance = new MCONThgDao();
    public static MCONThgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MCONThgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    /// <summary>
    /// 取得節目合約提醒到期資料
    /// </summary>
    /// <returns></returns>
    public List<remindProgramContractMaturityEntity> getRemindProgramContractMaturity()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        string commandText = "select a.CE_Date,a.CN_Channel,a.CN_Time,a.CN_NameB,a.CN_NameS,a.CN_Teacher,Renew_id FROM MCONT a left join MUSER b on a.CN_Teacher=b.U_id where  a.del_tag='0' and CE_Date <DATEADD(MONTH, 1, getdate()) and CE_Date> getdate() ";//一個月內到期
        //string condition = "and CN_Names !=''";// --未續約
        //string condition = "and CE_Date<DATEADD(MONTH, 12, getdate()) and CE_Date> getdate() ";// --12個月內到期
        //string condition = "and CE_Date<DATEADD(MONTH, 3, getdate()) and CE_Date> getdate() ";// --3個月內到期
        //string condition = "and CE_Date<DATEADD(MONTH, 2, getdate()) and CE_Date> getdate() ";// --2個月內到期
        //string condition = "這and CE_Date<DATEADD(MONTH, 1, getdate()) and CE_Date> getdate() ";// --1個月內到期";
 
        List<remindProgramContractMaturityEntity> rpcmeList = MCONThgSql.Instance.getRemindProgramContractMaturity(connectionStrings, commandText);//<======

        log.endWrite(rpcmeList.ToString(), className, methodName);
        return rpcmeList;
    }

    public string getMonthCost(string endDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'endDate' : " + endDate, className, methodName);

        string commandText = "select Sum(cast(CN_MPrice  as int)) as CN_MPrice from MCONT where CE_Date >= '"+ endDate + "' and del_tag='0'";
        string backStr = MCONThgSql.Instance.getMonthCost(connectionStrings, commandText);//<==========


        log.endWrite("結果--'backStr' : " + backStr.ToString(), className, methodName);
        return backStr;
    }

    public List<remindProgramContractMaturityEntity> getProgramCost(string startDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        string commandText = "select CN_MPrice,CN_Teacher from MCONT where CE_Date >= '" + startDate + "'  and del_tag='0'";
        List<remindProgramContractMaturityEntity> rpcmeList = MCONThgSql.Instance.getProgramCost(connectionStrings, commandText);//<======

        log.endWrite(rpcmeList.ToString(), className, methodName);
        return rpcmeList;
    }
    
}