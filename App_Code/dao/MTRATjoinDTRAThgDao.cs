using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MTRATjoinDTRAThgDao 的摘要描述
/// </summary>
public class MTRATjoinDTRAThgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MTRATjoinDTRAThgDao _instance = new MTRATjoinDTRAThgDao();
    public static MTRATjoinDTRAThgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MTRATjoinDTRAThgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<paymentDataEntity> getPaymentData(string StartDate, string EndDate, string MP, string M_Item, string CaseType)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'MP' : " + MP + " 'M_Item' : " + M_Item + " 'CaseType' : " + CaseType , className, methodName);
        string sql_txt = getSqlTxt.analystSinglePerformanceST(StartDate, EndDate, MP, M_Item);
        string commandText = string.Empty;
        if (CaseType == "nor")
        {
            commandText = "select m.T_ID,d.Pay_Type,m.T_type,d.Account_Money,m.T_AccountDate,m.T_Item,m.MP,m.MP_Name,m.MC,m.MC_Name,m.Light_Status,d.Pay_tag,m.MC as MTRATmc from MTRAT m join DTRAT d on m.T_ID=d.T_ID where m.del_tag='0'and d.del_tag='0' and m.T_Type<>'0002'" + sql_txt;
        }
        else if (CaseType == "venue")
        {
            commandText = "select m.T_ID,d.Pay_Type,m.T_type,d.Account_Money,m.T_AccountDate,m.T_Item,m.MP,m.MP_Name,m.MC,m.MC_Name,m.Light_Status,d.Pay_tag,m.MC as MTRATmc from MTRAT m join DTRAT d on m.T_ID=d.T_ID where m.del_tag='0'and d.del_tag='0' and m.FS_tag='0' and d.FS_tag='0' and m.T_Type='0002'" + sql_txt;
        }

        List<paymentDataEntity> pdeList = MTRATjoinDTRAThgSql.Instance.getPaymentData(connectionStrings, commandText);//<==========

        log.endWrite("'pdeList' : " + pdeList.ToString(), className, methodName);
        return pdeList;
    }
    //個人業績報表
    public List<analystSinglePerformanceEntity> getAnalystSinglePerformance(string StartDate, string EndDate, string MP, string M_Item, string ComID,string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'MP' : " + MP + " 'M_Item' : " + M_Item + " 'ComID' : " + ComID + " 'U_Num' : " + U_Num, className, methodName);
        string sql_txt = getSqlTxt.analystSinglePerformanceST(StartDate, EndDate, MP, M_Item);

        string commandText = "select b.Light_Status,b.T_AccountDate,b.M_ID,b.T_Item,b.T_PayMoney,a.DT_ID,a.T_ID,b.T_StartDate,b.T_EndDate,b.T_Type from DTRAT a join mtrat b on a.t_id=b.t_id where a.del_tag='0' and b.del_tag='0'" + sql_txt + " and a.mc='" + U_Num + "' and a.mc_com='" + ComID + "' and b.T_Type<>'0002' order by b.T_AccountDate";

        List<analystSinglePerformanceEntity> aspeList = MTRATjoinDTRAThgSql.Instance.getAnalystSinglePerformance(connectionStrings, commandText);//<==========

        log.endWrite("'aspeList' : " + aspeList.ToString(), className, methodName);
        return aspeList;
    }
    /*
    public List<paymentDataEntity> getPaymentData(string StartDate, string EndDate, string MP, string M_Item, string CaseType, string PerformanceType, string MC, string EmpType)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'MP' : " + MP + " 'M_Item' : " + M_Item + " 'CaseType' : " + CaseType + " 'PerformanceType' : " + PerformanceType + " 'MC' : " + MC + " 'EmpType' : " + EmpType, className, methodName);
        string sql_txt = getSqlTxt.analystSinglePerformanceST(StartDate, EndDate, MP, M_Item);
        string commandText = string.Empty;
        if (CaseType == "nor")
        {
            if (PerformanceType == "MCgroup")
            {
                commandText = "select m.T_ID,d.Pay_Type,m.T_type,d.Account_Money,m.T_AccountDate,m.T_Item,m.MP,m.MP_Name,m.MC,m.MC_Name,m.Light_Status from MTRAT m join DTRAT d on m.T_ID=d.T_ID where m.mc ='{0}' and m.del_tag='0'and d.del_tag='0' and m.T_Type<>'0002'" + sql_txt;
            }
            else if (PerformanceType == "Discount")
            {
                commandText = "select m.T_ID,d.Pay_Type,m.T_type,d.Account_Money,m.T_AccountDate,m.T_Item,m.MP,m.MP_Name,m.MC,m.MC_Name,m.Light_Status from MTRAT m join DTRAT d on m.T_ID=d.T_ID where m.del_tag='0' and d.del_tag='0' and m.fs_tag='0' and d.FS_tag='0'  and m.T_Type<>'0002' and d.account_money LIKE '-%'" + sql_txt;
            }
            else
            {
                commandText = "select m.T_ID,d.Pay_Type,m.T_type,d.Account_Money,m.T_AccountDate,m.T_Item,m.MP,m.MP_Name,m.MC,m.MC_Name,m.Light_Status from MTRAT m join DTRAT d on m.T_ID=d.T_ID where m.del_tag='0'and d.del_tag='0' and m.T_Type<>'0002'" + sql_txt;
            }

        }
        else if (CaseType == "venue")
        {
            commandText = "select m.T_ID,d.Pay_Type,m.T_type,d.Account_Money,m.T_AccountDate,m.T_Item,m.MP,m.MP_Name,m.MC,m.MC_Name,m.Light_Status from MTRAT m join DTRAT d on m.T_ID=d.T_ID where m.del_tag='0'and d.del_tag='0' and m.FS_tag='0' and d.FS_tag='0' and m.T_Type='0002'" + sql_txt;
        }

        List<paymentDataEntity> pdeList = null;
        if (PerformanceType == "MCgroup")
        {
            StringBuilder sbCommandText = new StringBuilder();
            sbCommandText.Append(string.Format(commandText, MC));
            pdeList = MTRATjoinDTRAThgSql.Instance.getPaymentData(connectionStrings, sbCommandText.ToString());//<==========
        }
        else
        {
            pdeList = MTRATjoinDTRAThgSql.Instance.getPaymentData(connectionStrings, commandText);//<==========
        }

        log.endWrite("'pdeList' : " + pdeList.ToString(), className, methodName);
        return pdeList;
    }*/

    public List<paymentDataEntity> getEmpPaymentData(string StartDate, string EndDate, string U_Num, string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'U_Num' : " + U_Num + " 'MP' : " + MP, className, methodName);
        string sql_txt = getSqlTxt.analystSinglePerformanceST(StartDate, EndDate, MP, string.Empty);
        string commandText = string.Empty;
        if (common.isEmpty(U_Num))
        {
            commandText = "select m.T_ID,d.Pay_Type,m.T_type,d.Account_Money,m.T_AccountDate,m.T_Item,m.MP,m.MP_Name,d.MC,d.MC_Name,m.Light_Status,d.Pay_tag,m.MC as MTRATmc from MTRAT m join DTRAT d on m.T_ID=d.T_ID where m.del_tag='0'and d.del_tag='0'  and m.fs_tag='0' and d.fs_tag='0'" + sql_txt;
        }
        else
        {
            commandText = "select m.T_ID,d.Pay_Type,m.T_type,d.Account_Money,m.T_AccountDate,m.T_Item,m.MP,m.MP_Name,d.MC,d.MC_Name,m.Light_Status,d.Pay_tag,m.MC as MTRATmc from MTRAT m join DTRAT d on m.T_ID=d.T_ID where d.MC='{0}' and m.del_tag='0'and d.del_tag='0' and m.fs_tag='0' and d.fs_tag='0'" + sql_txt;
            StringBuilder sb = new StringBuilder();
            sb.Append(string.Format(commandText, U_Num));
            commandText = sb.ToString();
        }
        List<paymentDataEntity> pdeList = MTRATjoinDTRAThgSql.Instance.getPaymentData(connectionStrings, commandText);//<==========

        log.endWrite("'pdeList' : " + pdeList.ToString(), className, methodName);
        return pdeList;
    }


    public List<string> getMCcustomerData(string U_Num, string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'U_Num' : " + U_Num , className, methodName);

        string commandText = "select distinct a.m_id  from MTRAT a join DTRAT b on a.t_id=b.t_id where B.MC='" + U_Num + "' and (T_AccountDate >= '" + StartDate + "') AND (T_AccountDate <= '" + EndDate + "')  and a.del_tag='0'";

        List<string> strList = MTRATjoinDTRAThgSql.Instance.getMCcustomerData(connectionStrings, commandText);//<==========

        log.endWrite("'strList' : " + strList.ToString(), className, methodName);
        return strList;
    }

    public List<AccountMoneyDataEntity> getAccountMoneyData(string V_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'V_id' : " + V_id , className, methodName);

        string commandText = "select Account_Money,Pay_Type,T_type from MTRAT a join DTRAT b on a.t_id=b.t_id where V_id=" + V_id + " and a.del_tag = '0' AND  b.del_tag = '0'";

        List<AccountMoneyDataEntity> amdeList = MTRATjoinDTRAThgSql.Instance.getAccountMoneyData(connectionStrings, commandText);//<==========

        log.endWrite("'amdeList' : " + amdeList.ToString(), className, methodName);
        return amdeList;
    }

    public List<paymentDataEntity> getVenuePerformanceForMC(string StartDate, string EndDate, string MC)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate+ " 'EndDate' : " + EndDate + " 'MC' : " + MC , className, methodName);

        string sqltxt = getSqlTxt.getVenuePerformanceForMCst(StartDate,  EndDate,  MC);
        string commandText = "select b.M_ID,b.MP_Name,b.MP,b.T_Item,b.T_PayMoney,a.Pay_tag,a.Account_Money,a.Pay_Type,a.mc as mca,b.MC,b.MC_Name,b.T_AccountDate,b.T_id,b.V_ID from DTRAT a join MTRAT  b on a.T_id=b.T_id where a.del_tag='0' and b.del_tag='0' " + sqltxt+" and b.T_type='0002'";

        List<paymentDataEntity> pdeList = MTRATjoinDTRAThgSql.Instance.getVenuePerformanceForMC(connectionStrings, commandText);//<==========

        log.endWrite("'pdeList' : " + pdeList.ToString(), className, methodName);
        return pdeList;
    }

    public List<AccountMoneyDataEntity> getTodayPerformance(string today)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'today' : " + today , className, methodName);

        string commandText = "select Account_Money,Pay_Type,T_type from MTRAT a join DTRAT b on a.t_id=b.t_id where a.del_tag='0' and T_AccountDate='" + today + "' and b.del_tag='0' and a.fs_tag='0' and b.fs_tag='0' and a.T_Type<>'0002'";

        List<AccountMoneyDataEntity> amdeList = MTRATjoinDTRAThgSql.Instance.getAccountMoneyData(connectionStrings, commandText);//<==========

        log.endWrite("'amdeList' : " + amdeList.ToString(), className, methodName);
        return amdeList;
    }

   
    public List<AccountMoneyDataEntity> getMonthPerformance(string startDate, string endDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'startDate' : " + startDate+ "'endDate' : "+ endDate, className, methodName);

        string commandText = "select Account_Money,Pay_Type,T_type from MTRAT a join DTRAT b on a.t_id=b.t_id where a.del_tag='0' and T_AccountDate>='" + startDate + "' and T_AccountDate<='" + endDate + "' and b.del_tag='0' and a.fs_tag='0' and b.fs_tag='0' and a.T_Type<>'0002'";

        List<AccountMoneyDataEntity> amdeList = MTRATjoinDTRAThgSql.Instance.getAccountMoneyData(connectionStrings, commandText);//<==========

        log.endWrite("結果--'amdeList' : " + amdeList.ToString(), className, methodName);
        return amdeList;
    }
 
    public List<AccountMoneyDataEntity> getPerMonthRevenue(string startDate, string endDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'startDate' : " + startDate + "'endDate' : " + endDate, className, methodName);

        string commandText = "select Account_Money,Pay_Type,T_type,T_AccountDate,a.mc_com from MTRAT a join DTRAT b on a.t_id=b.t_id where a.del_tag='0' and T_AccountDate>='" + startDate + "' and T_AccountDate <'" + endDate + "' and b.del_tag='0' and a.T_Type<>'0002' order by T_AccountDate";

        List<AccountMoneyDataEntity> amdeList = MTRATjoinDTRAThgSql.Instance.getPerMonthRevenue(connectionStrings, commandText);//<==========

        log.endWrite("結果--'amdeList' : " + amdeList.ToString(), className, methodName);
        return amdeList;
    }

    public List<AccountMoneyDataEntity> getAnalystPerformanceForCP(string startDate, string endDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'startDate' : " + startDate + "'endDate' : " + endDate, className, methodName);

        string commandText = "select Account_Money,Pay_Type,T_type,a.MP,a.MC_COM from MTRAT a join DTRAT b on a.t_id=b.t_id where a.del_tag='0' and T_AccountDate>='" + startDate + "' and T_AccountDate <'" + endDate + "' and b.del_tag='0' and a.T_Type<>'0002' order by T_AccountDate";

        List<AccountMoneyDataEntity> amdeList = MTRATjoinDTRAThgSql.Instance.getAnalystPerformanceForCP(connectionStrings, commandText);//<==========

        log.endWrite("結果--'amdeList' : " + amdeList.ToString(), className, methodName);
        return amdeList;
    }
}