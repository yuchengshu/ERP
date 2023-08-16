using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MVENUhgDao 的摘要描述
/// </summary>
public class MVENUhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MVENUhgDao _instance = new MVENUhgDao();
    public static MVENUhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MVENUhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<venueDataEntity> getVenueDataLis2t2()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        string commandText = commandText = "select V_ID,V_Date,MP_Name,V_Site,V_Fees from MVENU where V_Date >= DateAdd(d,-14,GETDATE()) and del_tag = '0' order by V_date";

        List<venueDataEntity> vde = MVENUhgSql.Instance.getVenueDataList(connectionStrings, commandText);

        log.endWrite(vde.ToString(), className, methodName);
        return vde;
    }

    public List<venueDataEntity> getVenueDataList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        string commandText = commandText = "select V_ID,V_Date,MP_Name,V_Site,V_Fees from MVENU where V_Date >= DateAdd(d,-14,GETDATE()) and del_tag = '0' order by V_date";

        List<venueDataEntity> vde = MVENUhgSql.Instance.getVenueDataList(connectionStrings, commandText);

        log.endWrite(vde.ToString(), className, methodName);
        return vde;
    }
    //設定搜尋條件進行搜尋(MeetingDate:會議日期)
    public List<SRMVENUEntity> getSRMVENUList(string MP_CName, string MeetingDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        
        string commandText = "";
        if (MP_CName.Trim() != "" && MeetingDate !="")
        {
             commandText = "SELECT distinct d.V_ID, d.V_Date,d.V_Site,d.MP_Name,d.V_ID,d.del_tag FROM [dbo].[MVENU] d where d.del_tag=0 and convert(varchar(10),d.V_Date,120)='" + MeetingDate + "' and MP_Name='" + MP_CName + "'";//取出所有會場編號
        }
        else if (MP_CName.Trim() != "" && MeetingDate == "")
        {
             commandText = "SELECT distinct d.V_ID, d.V_Date,d.V_Site,d.MP_Name,d.V_ID,d.del_tag FROM [dbo].[MVENU] d where d.del_tag=0 and MP_Name='" + MP_CName + "'";//取出所有會場編號
        }
        else if (MP_CName.Trim() == "" && MeetingDate == "")
        {
            commandText = "SELECT distinct d.V_ID, d.V_Date,d.V_Site,d.MP_Name,d.V_ID,d.del_tag FROM [dbo].[MVENU] d where d.del_tag=0 ";//取出所有會場編號
        }
        else if (MP_CName.Trim() == "" && MeetingDate != "")
        {
            commandText = "SELECT distinct d.V_ID, d.V_Date,d.V_Site,d.MP_Name,d.V_ID,d.del_tag FROM [dbo].[MVENU] d where convert(varchar(10),d.V_Date,120)='" + MeetingDate + "'";//取出所有會場編號
        }

        List<SRMVENUEntity> SRMVENUList = MVENUhgSql.Instance.getSRMVENUList(connectionStrings, commandText);//<==========

        log.endWrite("'vpeList' : " + SRMVENUList.ToString(), className, methodName);
        return SRMVENUList;
        ;
    }

    public List<SRMVENUEntity> getSRMVENUList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'MP' : " + MP, className, methodName);

        //string sql_txt = getSqlTxt.getVenuePerformanceST(StartDate, EndDate, MP);
        //
        string commandText = "SELECT distinct d.V_ID, d.V_Date,d.V_Site,d.MP_Name,d.V_ID,d.del_tag FROM [dbo].[MVENU] d where d.del_tag=0";//取出所有會場編號

        List<SRMVENUEntity> SRMVENUList = MVENUhgSql.Instance.getSRMVENUList(connectionStrings, commandText);//<==========

        log.endWrite("'vpeList' : " + SRMVENUList.ToString(), className, methodName);
        return SRMVENUList;
        ;
    }

    public List<venueDataEntity> getVenueDataForPerformance(string startDate, string endDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'startDate' : " + startDate + "'endDate' : " + endDate, className, methodName);

        string commandText = "select MP,MP_Name,V_Fees from MVENU where del_tag = '0' and (V_DAte >= '" + startDate + "') AND (V_DAte <= DATEADD(d, 1, '" + endDate + "'))  order by add_date ";
        List<venueDataEntity> vdeList = MVENUhgSql.Instance.getVenueDataForPerformance(connectionStrings, commandText);

        log.endWrite("'vdeList' : " + vdeList.ToString(), className, methodName);
        return vdeList;
    }

    public List<VenuePerformanceEntity> getVenuePerformance(string StartDate, string EndDate, string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'MP' : " + MP, className, methodName);

        string sql_txt = getSqlTxt.getVenuePerformanceST(StartDate, EndDate, MP);
        string commandText = "select V_ID,V_Date,V_Site,MP_Name,V_MemC,V_MemCN from MVENU where del_tag = '0' " + sql_txt + "order by add_date ";
        List<VenuePerformanceEntity> vpeList = MVENUhgSql.Instance.getVenuePerformance(connectionStrings, commandText);//<==========

        log.endWrite("'vpeList' : " + vpeList.ToString(), className, methodName);
        return vpeList;
    }
}