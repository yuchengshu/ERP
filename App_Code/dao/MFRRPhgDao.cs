using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MFRRPhgDao 的摘要描述
/// </summary>
public class MFRRPhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MFRRPhgDao _instance = new MFRRPhgDao();
    public static MFRRPhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MFRRPhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<activityMessageEntity> getActivityMessageList(string M_Tel)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("M_Tel :"+ M_Tel, className, methodName);
        string commandText = "select MFP_id,MFP_Name,MP_Name,add_date,M_Tel,MP_ID from mfrrp where del_tag='0' AND M_tel='{0}' order by add_date desc";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, M_Tel));
        List<activityMessageEntity> ameList = MFRRPhgSql.Instance.getActivityMessageList(connectionStrings, sbCommandText.ToString());//<======

        log.endWrite(ameList.ToString(), className, methodName);
        return ameList;
    }

    public List<activityMessageEntity> getMFRRPdata(string StartDate,string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'StartDate' :"+ StartDate+ "'EndDate' :"+ EndDate, className, methodName);

        string commandText = "select MFP_id,MFP_Name,MP_Name,add_date,M_Tel,MP_ID from mfrrp where del_tag='0' and (add_date >= '" + StartDate + "') and (add_date <= '" + EndDate + "') and action_tag='1' order by add_date";

        List<activityMessageEntity> ameList = MFRRPhgSql.Instance.getActivityMessageList(connectionStrings, commandText);//<======

        log.endWrite(ameList.ToString(), className, methodName);
        return ameList;
    }

    
    public List<ResourceDistributionEntity> getResourceDistribution(string StartDate, string EndDate, string MC_COM)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'StartDate' :" + StartDate + "'EndDate' :" + EndDate + "'MC_COM' :" + MC_COM, className, methodName);

        string sql_txt = getSqlTxt.getMFRRPresourceDistributionST(StartDate, EndDate, MC_COM);
        string commandText = "SELECT Result_user, COUNT(Result_user) AS RU FROM MFRRP WHERE del_tag='0' and sys_assjob_tag='1' " + sql_txt + " GROUP BY Result_user";

        List<ResourceDistributionEntity> rdeList = MFRRPhgSql.Instance.getResourceDistribution(connectionStrings, commandText);//<======

        log.endWrite("'rdeList':"+rdeList.ToString(), className, methodName);
        return rdeList;
    }

    public List<ResourceDistributionDetailEntity> getResourceDistributionDetail(string StartDate, string EndDate, string MC_COM, string Result_user, string Result_userName)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'MC_COM' : " + MC_COM + " 'Result_user' : " + Result_user + " 'Result_userName' : " + Result_userName, className, methodName);

        string sql_txt = getSqlTxt.getMFRRPresourceDistributionST(StartDate, EndDate, MC_COM);
        string commandText = "SELECT MFP_Name,M_Tel,Result_Date from MFRRP WHERE del_tag='0' and sys_assjob_tag='1' " + sql_txt+ " and Result_user='"+ Result_user + "'";
        List<ResourceDistributionDetailEntity> rddeList = MFRRPhgSql.Instance.getResourceDistributionDetail(connectionStrings, commandText, Result_userName);//<==========

        log.endWrite("'rddeList' : " + rddeList.ToString(), className, methodName);
        return rddeList;
    }

}