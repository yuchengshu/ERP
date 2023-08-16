using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MTRATjoinMMBERjoinMUSERhgDao 的摘要描述
/// </summary>
public class MTRATjoinMMBERjoinMUSERhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MTRATjoinMMBERjoinMUSERhgDao _instance = new MTRATjoinMMBERjoinMUSERhgDao();
    public static MTRATjoinMMBERjoinMUSERhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MTRATjoinMMBERjoinMUSERhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<detailPerformanceEntity> getDetailPerformanceTable(string StartDate, string EndDate, string ComID, string U_MDEP, string MC)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'ComID' : " + ComID + " 'U_MDEP' : " + U_MDEP + " 'MC' : " + MC, className, methodName);
        string sql_txt = getSqlTxt.analystSinglePerformanceST(StartDate, EndDate, string.Empty, string.Empty);
        bool type = true;
        string formatStr1 = string.Empty;

        string commandText = "select a.T_ID,a.M_ID,a.MP,a.MP_Name,a.T_Item,a.T_PayMoney, a.T_AccountDate ,d.mc,d.mc_name,d.mc_com,c.U_mdep,b.M_Num,b.M_Name,d.Pay_Type,d.Account_Money,a.T_Type,a.INV_open_Item,a.Light_Status,a.MC,a.MC_Name,b.MTel1,b.add_Date,a.add_Date from MTRAT a join mmber b on a.m_id=b.m_id join muser c on b.mc = c.U_Num join DTRAT d on CONVERT ( Varchar , a.T_ID )=d.T_ID where a.del_tag='0'  and a.fs_tag='0'and d.del_tag='0' and c.U_MdEP='{0}' and a.T_Type<>'0002' " + sql_txt + " order by a.Add_date";
        if (common.isEmpty(MC))
        {
            if (common.isEmpty(ComID) && !common.isEmpty(U_MDEP))
            {
                formatStr1 = U_MDEP;
                commandText = "select a.T_ID,a.M_ID,a.MP,a.MP_Name,a.T_Item,a.T_PayMoney, a.T_AccountDate ,d.mc,d.mc_name,d.mc_com,c.U_mdep,b.M_Num,b.M_Name,d.Pay_Type,d.Account_Money,a.T_Type,a.INV_open_Item,a.Light_Status,a.MC,a.MC_Name,b.MTel1,b.add_Date,a.add_Date from MTRAT a join mmber b on a.m_id=b.m_id join muser c on b.mc = c.U_Num join DTRAT d on CONVERT ( Varchar , a.T_ID )=d.T_ID where a.del_tag='0'  and a.fs_tag='0'and d.del_tag='0' and c.U_MdEP='{0}' and a.T_Type<>'0002' " + sql_txt + " order by a.Add_date";
            }
            else if (!common.isEmpty(ComID) && common.isEmpty(U_MDEP))
            {
                formatStr1 = ComID;
                commandText = "select a.T_ID,a.M_ID,a.MP,a.MP_Name,a.T_Item,a.T_PayMoney, a.T_AccountDate ,d.mc,d.mc_name,d.mc_com,c.U_mdep,b.M_Num,b.M_Name,d.Pay_Type,d.Account_Money,a.T_Type,a.INV_open_Item,a.Light_Status,a.MC,a.MC_Name,b.MTel1,b.add_Date,a.add_Date from MTRAT a join mmber b on a.m_id=b.m_id join muser c on b.mc = c.U_Num join DTRAT d on CONVERT ( Varchar , a.T_ID )=d.T_ID where a.del_tag='0'  and a.fs_tag='0'and d.del_tag='0' and c.ComID='{0}' and a.T_Type<>'0002' " + sql_txt + " order by a.Add_date";
            }
            else if (!common.isEmpty(ComID) && !common.isEmpty(U_MDEP))
            {
                formatStr1 = ComID;
                commandText = "select a.T_ID,a.M_ID,a.MP,a.MP_Name,a.T_Item,a.T_PayMoney, a.T_AccountDate ,d.mc,d.mc_name,d.mc_com,c.U_mdep,b.M_Num,b.M_Name,d.Pay_Type,d.Account_Money,a.T_Type,a.INV_open_Item,a.Light_Status,a.MC,a.MC_Name,b.MTel1,b.add_Date,a.add_Date from MTRAT a join mmber b on a.m_id=b.m_id join muser c on b.mc = c.U_Num join DTRAT d on CONVERT ( Varchar , a.T_ID )=d.T_ID where a.del_tag='0'  and a.fs_tag='0'and d.del_tag='0' and c.ComID='{0}' and c.U_MdEP='{1}' and a.T_Type<>'0002' " + sql_txt + " order by a.Add_date";
                type = false;
            }
            else if (common.isEmpty(ComID) && common.isEmpty(U_MDEP))
            {
                commandText = "select a.T_ID,a.M_ID,a.MP,a.MP_Name,a.T_Item,a.T_PayMoney, a.T_AccountDate ,d.mc,d.mc_name,d.mc_com,c.U_mdep,b.M_Num,b.M_Name,d.Pay_Type,d.Account_Money,a.T_Type,a.INV_open_Item,a.Light_Status,a.MC,a.MC_Name,b.MTel1,b.add_Date,a.add_Date from MTRAT a join mmber b on a.m_id=b.m_id join muser c on b.mc = c.U_Num join DTRAT d on CONVERT ( Varchar , a.T_ID )=d.T_ID where a.del_tag='0'  and a.fs_tag='0'and d.del_tag='0' and a.T_Type<>'0002' " + sql_txt + " order by a.Add_date";
                type = true;
            }
        }
        else
        {
            formatStr1 = MC;
            commandText = "select a.T_ID,a.M_ID,a.MP,a.MP_Name,a.T_Item,a.T_PayMoney, a.T_AccountDate ,d.mc,d.mc_name,d.mc_com,c.U_mdep,b.M_Num,b.M_Name,d.Pay_Type,d.Account_Money,a.T_Type,a.INV_open_Item,a.Light_Status,a.MC,a.MC_Name,b.MTel1,b.add_Date,a.add_Date from MTRAT a join mmber b on a.m_id=b.m_id join muser c on b.mc = c.U_Num join DTRAT d on CONVERT ( Varchar , a.T_ID )=d.T_ID where a.del_tag='0'  and a.fs_tag='0'and d.del_tag='0' and d.mc='{0}' and a.T_Type<>'0002' " + sql_txt + " order by a.Add_date";
        }
        StringBuilder sbCommandText = new StringBuilder();
        if (type)
        {
            sbCommandText.Append(string.Format(commandText, formatStr1));
        }
        else
        {
            sbCommandText.Append(string.Format(commandText, formatStr1, U_MDEP));
        }
        

        List<detailPerformanceEntity> dpeList = MTRATjoinMMBERjoinMUSERhgSql.Instance.getDetailPerformanceTable(connectionStrings, sbCommandText.ToString());//<==========

        log.endWrite("'dpeList' : " + dpeList.ToString(), className, methodName);
        return dpeList;
    }

    public List<detailPerformanceEntity> getInternetBusinessPerformance(string StartDate, string EndDate, string ComID, string type)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'ComID' : " + ComID  + " 'type' : " + type, className, methodName);
        string sql_txt = getSqlTxt.internetBusinessPerformanceST(StartDate, EndDate, ComID);
        string commandText = string.Empty;
        switch (type)
        {
          case "lockVideo":
                commandText = "select a.T_ID,a.M_ID,a.MP,a.MP_Name,a.T_Item,a.T_PayMoney, a.T_AccountDate ,d.mc,d.mc_name,d.mc_com,c.U_mdep,b.M_Num,b.M_Name,d.Pay_Type,d.Account_Money,a.T_Type,a.INV_open_Item,a.Light_Status,a.MC,a.MC_Name,b.MTel1,b.add_Date,a.add_Date from MTRAT a join mmber b on a.m_id=b.m_id join muser c on b.mc = c.U_Num join DTRAT d on CONVERT ( Varchar , a.T_ID )=d.T_ID where a.del_tag='0'  and a.fs_tag='0'and d.del_tag='0'and d.fs_tag='0' and a.T_item='0010' and a.T_Type<>'0002' " + sql_txt + " order by a.Add_date";
                break;
            case "activityFormTransaction":
                commandText = "select a.T_ID,a.M_ID,a.MP,a.MP_Name,a.T_Item,a.T_PayMoney, a.T_AccountDate ,d.mc,d.mc_name,d.mc_com,c.U_mdep,b.M_Num,b.M_Name,d.Pay_Type,d.Account_Money,a.T_Type,a.INV_open_Item,a.Light_Status,a.MC,a.MC_Name,b.MTel1,b.add_Date,a.add_Date from MTRAT a join mmber b on a.m_id=b.m_id join muser c on b.mc = c.U_Num join DTRAT d on CONVERT ( Varchar , a.T_ID )=d.T_ID where a.del_tag = '0'  and a.fs_tag = '0' and d.del_tag='0' and d.fs_tag='0' and b.mc_com <> 'HG02'  and a.T_item <> '0010' and a.T_Type <> '0002'" + sql_txt + " order by a.Add_date";
                break;
            case "importListTransaction":
                commandText = "select a.T_ID,a.M_ID,a.MP,a.MP_Name,a.T_Item,a.T_PayMoney, a.T_AccountDate ,d.mc,d.mc_name,d.mc_com,c.U_mdep,b.M_Num,b.M_Name,d.Pay_Type,d.Account_Money,a.T_Type,a.INV_open_Item,a.Light_Status,a.MC,a.MC_Name,b.MTel1,b.add_Date,a.add_Date from MTRAT a join mmber b on a.m_id=b.m_id join muser c on b.mc = c.U_Num join DTRAT d on CONVERT ( Varchar , a.T_ID )=d.T_ID where a.del_tag = '0'  and a.fs_tag = '0' and d.del_tag='0' and d.fs_tag='0' and b.mc_com<>'HG02' and a.T_item<>'0010' and  a.T_Type<>'0002' and sourcetag='HG06'" + sql_txt + " order by a.Add_date";
                break;
            case "getReportTransaction":
                commandText = "select a.T_ID,a.M_ID,a.MP,a.MP_Name,a.T_Item,a.T_PayMoney, a.T_AccountDate ,d.mc,d.mc_name,d.mc_com,c.U_mdep,b.M_Num,b.M_Name,d.Pay_Type,d.Account_Money,a.T_Type,a.INV_open_Item,a.Light_Status,a.MC,a.MC_Name,b.MTel1,b.add_Date,a.add_Date from MTRAT a join mmber b on a.m_id=b.m_id join muser c on b.mc = c.U_Num join DTRAT d on CONVERT ( Varchar , a.T_ID )=d.T_ID where a.del_tag = '0'  and a.fs_tag = '0' and d.del_tag='0' and d.fs_tag='0' and b.mc_com <> 'HG02'  and a.T_item <> '0010' and a.T_Type <> '0002'" + sql_txt + " order by a.Add_date";
                break;
        }
        

        List<detailPerformanceEntity> dpeList = MTRATjoinMMBERjoinMUSERhgSql.Instance.getDetailPerformanceTable(connectionStrings, commandText);//<==========

        log.endWrite("'dpeList' : " + dpeList.ToString(), className, methodName);
        return dpeList;
    }

    public List<detailPerformanceEntity> getPerformanceForGetReportTransaction(string StartDate, string EndDate, string ComID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'ComID' : " + ComID , className, methodName);
        string sql_txt = getSqlTxt.internetBusinessPerformanceST(StartDate, EndDate, ComID);
        string commandText = "select a.T_ID,a.M_ID,a.MP,a.MP_Name,a.T_Item,a.T_PayMoney, a.T_AccountDate ,c.U_mdep,b.M_Num,b.M_Name,a.T_Type,a.INV_open_Item,a.Light_Status,a.MC,a.MC_Name,b.MTel1,b.add_Date,a.add_Date from MTRAT a join mmber b on a.m_id=b.m_id join muser c on b.mc = c.U_Num where a.del_tag='0'  and a.fs_tag='0'  and b.mc_com<>'HG02' and  a.T_Type<>'0002'  and  a.T_item<>'0010' and (T_AccountDate >= '" + StartDate + "') AND (T_AccountDate <= '"+ EndDate + "') order by a.Add_date";


        List<detailPerformanceEntity> dpeList = MTRATjoinMMBERjoinMUSERhgSql.Instance.getPerformanceForGetReportTransaction(connectionStrings, commandText);//<==========

        log.endWrite("'dpeList' : " + dpeList.ToString(), className, methodName);
        return dpeList;
    }
}