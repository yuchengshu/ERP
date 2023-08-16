using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MTRATjoinMMBERhgDao 的摘要描述
/// </summary>
public class MTRATjoinMMBERhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MTRATjoinMMBERhgDao _instance = new MTRATjoinMMBERhgDao();
    public static MTRATjoinMMBERhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MTRATjoinMMBERhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public envelopeEntity getEnvelopeData(string T_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("T_ID :" + T_ID, className, methodName);

        string commandText = "SELECT * from MTRAT a join MMBER b on a.M_id=b.M_id where a.del_tag='0' and b.del_Tag='0' and a.T_id = '{0}' ";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, T_ID));
        envelopeEntity eve = MTRATjoinMMBERhgSql.Instance.getEnvelopeData(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite(eve.ToString(), className, methodName);
        return eve;
    }

    public List<string> getMTEl1ListForNormalMessage(string MP,string MPitem)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("MP :" + MP+ "MPitem :" + MPitem, className, methodName);

        string commandText = "select b.MTEl1 from MTRAT a join MMBER b on a.M_ID=b.M_ID where a.MP='" + MP + "' and a.T_Item='" + MPitem + "' and a.T_Status<>'2' and a.T_EndDate>='" + cDateTime.getNowDateTimeForSql() + "' and a.T_Message not like '%" + 5 + "%'  and a.T_Message not like '%" + 6 + "%' and a.T_Message not like '%" + 7 + "%'  and a.T_Message not like '%" + 8 + "%'  and a.T_Message not like '%" + 9 + "%' and a.T_Message like '%" + 1 + "%'  and a.T_Message not like '%" + 10 + "%'  and a.del_tag='0'";

        List<string> strList = MTRATjoinMMBERhgSql.Instance.getMTEl1List(connectionStrings, commandText);//<=====================

        log.endWrite("strList="+strList.ToString(), className, methodName);
        return strList;
    }
    public List<string> getMTEl1ListForSolutionMessage(string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("MP :" + MP , className, methodName);

        string commandText = "select b.MTEl1 from MTRAT a join MMBER b on a.M_ID=b.M_ID where a.MP='" + MP + "' and a.T_EndDate>='" + cDateTime.getNowDateTimeForSql() + "'  and a.T_Status<>'2' and a.T_Message like '%" + 5 + "%' and a.T_Message like '%" + 1 + "%'  and a.del_tag='0'";

        List<string> strList = MTRATjoinMMBERhgSql.Instance.getMTEl1List(connectionStrings, commandText);//<=====================

        log.endWrite("strList=" + strList.ToString(), className, methodName);
        return strList;
    }

    public List<string> getMTEl1ListForSpecialMessage(string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("MP :" + MP, className, methodName);
        
        string commandText = "select b.MTEl1 from MTRAT a join MMBER b on a.M_ID=b.M_ID where a.MP='" + MP + "' and a.T_EndDate>='" + cDateTime.getNowDateTimeForSql() + "'  and a.T_Status<>'2' and a.T_Message like '%" + 6 + "%' and a.T_Message like '%" + 1 + "%'  and a.del_tag='0'";

        List<string> strList = MTRATjoinMMBERhgSql.Instance.getMTEl1List(connectionStrings, commandText);//<=====================

        log.endWrite("strList=" + strList.ToString(), className, methodName);
        return strList;
    }

    public List<string> getMTEl1ListForD0509211championMessage(string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("MP :" + MP, className, methodName);
        
        string commandText = "select b.MTEl1 from MTRAT a join MMBER b on a.M_ID=b.M_ID where a.MP='" + MP + "' and a.T_EndDate>='" + cDateTime.getNowDateTimeForSql() + "'  and a.T_Status<>'2' and a.T_Message like '%" + 10 + "%' and a.T_Message like '%" + 1 + "%'  and a.del_tag='0'";

        List<string> strList = MTRATjoinMMBERhgSql.Instance.getMTEl1List(connectionStrings, commandText);//<=====================

        log.endWrite("strList=" + strList.ToString(), className, methodName);
        return strList;
    }

    public List<string> getMTEl1ListForSpecailPeopleMessage(string MP, string MPitem)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("MP :" + MP, className, methodName);
        
        string commandText = "select MTel from MSGVT where MP='" + MP + "' and MP_Item='" + MPitem + "' and E_date>='" + cDateTime.getNowDateTimeForSql() + "' and del_tag='0'";

        List<string> strList = MTRATjoinMMBERhgSql.Instance.getMTEl1List(connectionStrings, commandText);//<=====================

        log.endWrite("strList=" + strList.ToString(), className, methodName);
        return strList;
    }

    public List<string> getMTEl1ListForFastStockMessage(string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("MP :" + MP, className, methodName);
        
        string commandText = "select b.MTEl1 from MTRAT a join MMBER b on a.M_ID=b.M_ID where a.MP='" + MP + "' and a.T_EndDate>='" + cDateTime.getNowDateTimeForSql() + "'  and a.T_Status<>'2' and a.T_Message like '%" + 7 + "%' and a.T_Message like '%" + 1 + "%'  and a.del_tag='0'";

        List<string> strList = MTRATjoinMMBERhgSql.Instance.getMTEl1List(connectionStrings, commandText);//<=====================

        log.endWrite("strList=" + strList.ToString(), className, methodName);
        return strList;
    }

    public List<analystSinglePerformanceEntity> getAnalystSinglePerformance(string StartDate, string EndDate, string MP, string M_Item, string type)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'MP' : " + MP + " 'M_Item' : " + M_Item + " 'type' : " + type, className, methodName);

        string sql_txt = getSqlTxt.analystSinglePerformanceST( StartDate,  EndDate,  MP,  M_Item);
        string commandText = string.Empty;
        if (!common.isEmpty(M_Item))
        {
            if (type == "nor")
            {
                commandText = "select (select  ddesc from mitem c where c.ditcode=b.t_item and c.mitcode='{0}') as t_item , count(b.t_item) as T_item_count , sum(cast(b.T_PayMoney as int)) as T_PayMoney from  MTRAT b  join mmber a on b.m_id=a.m_id where a.del_tag='0' and b.del_tag='0' and b.T_Type<>'0002'  and b.mp='{1}'" + sql_txt + "group by b.t_item";
            }
            else
            {
                commandText = "select (select  ddesc from mitem c where c.ditcode=b.t_item and c.mitcode='{0}') as t_item , count(b.t_item) as T_item_count , sum(cast(b.T_PayMoney as int)) as T_PayMoney from  MTRAT b  join mmber a on b.m_id=a.m_id where a.del_tag='0' and b.del_tag='0' and b.T_Type='0002'  and b.mp='{1}'" + sql_txt + "group by b.t_item";
            }
        }
        else
        {
            commandText = "select (select  ddesc from mitem c where c.ditcode=b.t_item and c.mitcode='{0}') as t_item, count(b.t_item) as T_item_count , sum(cast(b.T_PayMoney as int)) as T_PayMoney from  MTRAT b  join mmber a on b.m_id=a.m_id where a.del_tag='0' and b.del_tag='0' and b.mp='{1}'" + sql_txt + "group by b.t_item";
        }
        
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, MP, MP));

        List<analystSinglePerformanceEntity> aspeList = MTRATjoinMMBERhgSql.Instance.getAnalystSinglePerformance(connectionStrings, sbCommandText.ToString());//<==========

        log.endWrite("'aspeList' : " + aspeList.ToString(), className, methodName);
        return aspeList;
    }
  

    public List<analystSinglePerformanceEntity> getMemberCountInSession(string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'MP' : " + MP , className, methodName);
        string today = common.getMMddyyyyStr("/");
        string commandText = "select (select  ddesc from mitem c where c.ditcode=b.t_item and c.mitcode='{0}') as t_item , count(b.t_item) as T_item_count , sum(cast(b.T_PayMoney as int)) as T_PayMoney from  MTRAT b  join mmber a on b.m_id=a.m_id where a.del_tag='0' and b.del_tag='0' and b.T_EndDate>='"+ today + "' and b.mp='{1}' group by b.t_item";

        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, MP, MP));

        List<analystSinglePerformanceEntity> aspeList = MTRATjoinMMBERhgSql.Instance.getAnalystSinglePerformance(connectionStrings, sbCommandText.ToString());//<==========

        log.endWrite("'aspeList' : " + aspeList.ToString(), className, methodName);
        return aspeList;
    }

    public List<nextMonthSoonFallDueMemberEntity> getNextMonthSoonFallDueMember(string U_Num, string start, string end)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'U_Num' : " + U_Num+ " 'start' : " + start + " 'end' : " + end, className, methodName);

        string commandText = "SELECT a.T_ID,a.M_ID,a.MP_Name,a.T_Item,a.T_StartDate,a.T_EndDate,b.M_Name,a.MP FROM MTRAT a join MMBER B on a.M_id=b.M_id WHERE a.T_EndDate >=  '" + start + "' and a.T_EndDate <=  '" + end + "' and a.del_tag='0' and b.MC='" + U_Num + "' order by a.T_EndDate desc";
        List<nextMonthSoonFallDueMemberEntity> nmsfdmeList = MTRATjoinMMBERhgSql.Instance.getNextMonthSoonFallDueMember(connectionStrings, commandText);//<==========

        log.endWrite("'nmsfdmeList' : " + nmsfdmeList.ToString(), className, methodName);
        return nmsfdmeList;
    }

    public List<customerDataEntity> getExpiredCustomer(string U_Num, string before3Month, string today, string after3Month)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'U_Num' : " + U_Num + " 'before3Month' : " + before3Month + " 'today' : " + today + " 'after3Month' : " + after3Month, className, methodName);
        //測試
        //string commandText = "SELECT b.M_Name,b.BirthDay_Date,b.MTel1,b.MTel2,b.MTel3,b.OTel_Zone,b.OTel_Zone1,b.OTel,b.OTel1,b.OTel_Sub,b.OTel_Sub1,b.HTel_Zone,b.HTel_Zone1,b.HTel,b.HTel1,b.M_ID,b.add_date FROM MTRAT a join MMBER B on a.M_id=b.M_id WHERE a.del_tag='0' order by a.T_EndDate desc";
        //正試
        string commandText = "SELECT b.M_Name,b.BirthDay_Date,b.MTel1,b.MTel2,b.MTel3,b.OTel_Zone,b.OTel_Zone1,b.OTel,b.OTel1,b.OTel_Sub,b.OTel_Sub1,b.HTel_Zone,b.HTel_Zone1,b.HTel,b.HTel1,b.M_ID,b.add_date FROM MTRAT a join MMBER B on a.M_id=b.M_id WHERE a.T_EndDate >  '" + before3Month + "' and a.T_EndDate <  '"+ today + "' and a.T_EndDate <=  '" + after3Month + "' and a.del_tag='0' and b.MC='" + U_Num + "' order by a.T_EndDate desc";

        List <customerDataEntity> nmsfdmeList = MTRATjoinMMBERhgSql.Instance.getExpiredCustomer(connectionStrings, commandText);//<==========

        log.endWrite("'nmsfdmeList' : " + nmsfdmeList.ToString(), className, methodName);
        return nmsfdmeList;
    }

    public List<string> getPrintData(string M_Num, string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_Num' :" + M_Num + "'StartDate' :" + StartDate + "'EndDate' :" + EndDate, className, methodName);

        string sql_txt = getSqlTxt.getPrintDataST(M_Num, StartDate, EndDate);
        string commandText = "SELECT a.T_ID from MTRAT a join MMBER b on a.M_id=b.M_id where a.del_tag='0' and b.del_Tag='0' and Inv_SendState<>'4' and Inv_tag<>'2' and Inv_SendState<>'5' and mp<>'D0307071' and mp<>'D0606201'"+ sql_txt;
        List<string> strList = MTRATjoinMMBERhgSql.Instance.getPrintData(connectionStrings, commandText);//<==========

        log.endWrite("'strList' :" + strList.ToString(), className, methodName);
        return strList;
    }
    /*
    public List<appointOriginalArchiveWorkEntity> getAppointOriginalArchive(getOriginalArchiveParamEntity goape)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'goape' :" + goape.ToString(), className, methodName);

        string sql_txt = getSqlTxt.getAppointOriginalArchiveST(goape);
        string commandText = "SELECT b.M_Name,a.T_ID,a.M_ID,a.MP,a.MP_Name,a.MC,a.MC_Name,a.MC_COM,a.T_Item,a.T_PayMoney,a.T_AccountDate,a.Back_Status,a.Back_tag from MTRAT a join MMBER b on a.M_id=b.M_id where a.back_intag='0' and a.del_tag='0'"+ sql_txt +" order by a.T_AccountDate desc,a.mc_com,a.add_date";
        List<appointOriginalArchiveWorkEntity> aoaweList = MTRATjoinMMBERhgSql.Instance.getAppointOriginalArchive(connectionStrings, commandText);//<==========

        log.endWrite("'aoaweList' :" + aoaweList.ToString(), className, methodName);
        return aoaweList;
    }*/
    public List<appointOriginalArchiveWorkEntity> getAppointOriginalArchive(getOriginalArchiveParamEntity goape)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'goape' :" + goape.ToString(), className, methodName);

        string sql_txt = getSqlTxt.getAppointOriginalArchiveST(goape);
        string commandText = string.Empty;
        if (!common.isEmpty(goape.U_MDEP))
        {
            string U_MDEP = goape.U_MDEP;
            if (U_MDEP == "0003" || U_MDEP == "0004" || U_MDEP == "0009" || U_MDEP == "0001")
            {
                commandText = " select b.M_Name,a.T_ID,a.M_ID,a.MP,a.MP_Name,a.MC,a.MC_Name,a.MC_COM,a.T_Item,a.T_PayMoney,a.T_AccountDate,a.Back_Status,a.Back_tag from MTRAT a join MMBER b on a.M_id=b.M_id  where  a.T_AccountDate>='2015/9/1' and a.del_tag='0' " + sql_txt + " order by a.T_AccountDate,a.mc_com,a.add_date";
            }
            else
            {
                commandText = " select b.M_Name,a.T_ID,a.M_ID,a.MP,a.MP_Name,a.MC,a.MC_Name,a.MC_COM,a.T_Item,a.T_PayMoney,a.T_AccountDate,a.Back_Status,a.Back_tag from MTRAT a join MMBER b on a.M_id=b.M_id  where a.T_AccountDate>='2015/9/1' and a.mc_com='" + goape.ComID + "' and a.del_tag='0' " + sql_txt + " order by a.T_AccountDate,a.mc_com,a.add_date";
            }
        }
        else
        {
            commandText = "SELECT b.M_Name,a.T_ID,a.M_ID,a.MP,a.MP_Name,a.MC,a.MC_Name,a.MC_COM,a.T_Item,a.T_PayMoney,a.T_AccountDate,a.Back_Status,a.Back_tag from MTRAT a join MMBER b on a.M_id=b.M_id where a.back_intag='0' and a.del_tag='0'" + sql_txt + " order by a.T_AccountDate desc,a.mc_com,a.add_date";
        }
        

        List<appointOriginalArchiveWorkEntity> aoaweList = MTRATjoinMMBERhgSql.Instance.getAppointOriginalArchive(connectionStrings, commandText);//<==========

        log.endWrite("'aoaweList' :" + aoaweList.ToString(), className, methodName);
        return aoaweList;
    }

    public List<memberSessionStatusEntity> getMemberSessionStatus(getMemberSessionStatusParamEntity gmsspe)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'gmsspe' : " + gmsspe.ToString(), className, methodName);
        string sql_txt = getSqlTxt.getMemberSessionStatusST(gmsspe);

        string commandText = "select b.M_Num,a.M_ID,b.M_Name,a.MC_Name,b.M_SD,b.MTel1,b.MTel2,b.MTel3,b.OTel_Zone,b.OTel,b.OTel_Sub,b.HTel_Zone,b.HTel,a.MP_Name,a.MP,a.T_AccountDate,a.T_PayMoney,a.T_StartDate,a.T_EndDate,a.T_Item from MTRAT a  join mmber b on a.m_id=b.m_id where b.del_tag='0' " + sql_txt + " order by T_STARTDATE desc";


        List<memberSessionStatusEntity> msseList = MTRATjoinMMBERhgSql.Instance.getMemberSessionStatus(connectionStrings, commandText);//<==========

        log.endWrite("'msseList' : " + msseList.ToString(), className, methodName);
        return msseList;
    }
    //預收剩餘金額表(查詢動作)
    public List<memberSessionStatusEntity> getAdvancesRemainingMoney(getAdvancesRemainingMoneyParamEntity garmpe)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'garmpe' : " + garmpe.ToString(), className, methodName);

        string sql_txt = getSqlTxt.getAdvancesRemainingMoneyST(garmpe);//組成SQL查詢條件語法
        //取得預收剩餘金額表
        //string commandText = "select b.M_ID,b.M_Name,b.M_Num,b.MC_Name,b.M_SD,b.MTel1,b.MTel2,b.MTel3,b.OTel_Zone,b.OTel,b.OTel_Sub,b.HTel_Zone,b.HTel,a.MP_Name,a.MP,a.T_Item,a.T_AccountDate,a.T_PayMoney,a.T_EndDate,a.T_StartDate from MTRAT a  join mmber b on a.m_id=b.m_id where a.inv_tag='1' and b.del_tag='0' and a.del_tag='0' " + sql_txt + "  and (a.T_AccountDate <= '" + garmpe.start2Date + "') and (a.T_StartDate <= '" + garmpe.start2Date + "')  and ('" + garmpe.endDate + "'<=a.T_EndDate)order by a.T_StartDate desc";
        string commandText = "select b.M_ID,b.M_Name,b.M_Num,b.MC_Name,b.M_SD,b.MTel1,b.MTel2,b.MTel3,b.OTel_Zone,b.OTel,b.OTel_Sub,b.HTel_Zone,b.HTel,a.MP_Name,a.MP,a.T_Item,a.T_AccountDate,a.T_PayMoney,a.T_EndDate,a.T_StartDate from MTRAT a  join mmber b on a.m_id=b.m_id where a.inv_tag='1' and b.del_tag='0' and a.del_tag='0' " + sql_txt + " order by a.T_StartDate desc";

        List<memberSessionStatusEntity> msseList = MTRATjoinMMBERhgSql.Instance.getAdvancesRemainingMoney(connectionStrings, commandText);//<==========

        log.endWrite("'msseList' : " + msseList.ToString(), className, methodName);
        return msseList;
    }
 
    public List<getVidPaymentDataEntity> getVidPaymentData(string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate+ " 'EndDate' : " + EndDate, className, methodName);

        string commandText = "select a.V_ID,a.T_AccountDate,b.M_Name,b.M_Num,a.MP,a.MP_Name,a.T_Item,a.T_PayMoney,a.T_ID,b.mc,b.mc_name,b.mc_com,c.U_mdep from MTRAT a join mmber b on a.m_id=b.m_id join muser c on b.mc = c.U_Num where a.del_tag='0' and b.del_tag='0' and a.V_ID IS NOT NULL   and (a.add_date >= '" + StartDate + "') and (a.add_date <= '" + EndDate + "')   order by a.Add_date";

        List<getVidPaymentDataEntity> gvpdeList = MTRATjoinMMBERhgSql.Instance.getVidPaymentData(connectionStrings, commandText);//<==========

        log.endWrite("'gvpdeList' : " + gvpdeList.ToString(), className, methodName);
        return gvpdeList;
    }

    public List<string> getHandOpenInvoiceDetail(string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'StartDate' : " + StartDate + "'EndDate' : " + EndDate , className, methodName);

        string commandText = "SELECT  a.T_AccountDate FROM MTRAT a join mmber b on a.m_id=b.m_id WHERE a.DEL_TAG='0' and a.inv_mnum<>'' and a.T_AccountDate >='"+ StartDate + "' and a.T_AccountDate <='"+ EndDate + "' order by a.T_accountdate";

        List<string> strList = MTRATjoinMMBERhgSql.Instance.getHandOpenInvoiceDetail(connectionStrings, commandText);//<==========

        log.endWrite("'strList' : " + strList.ToString(), className, methodName);
        return strList;
    }



}