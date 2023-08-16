using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// DMBERhgDao 的摘要描述
/// </summary>
public class DMBERhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static DMBERhgDao _instance = new DMBERhgDao();
    public static DMBERhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public DMBERhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<DMBERentity> getDMBERdata(string M_ID, string U_Num, string timeString)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'M_ID' : {0}, 'U_Num' : {1}, 'timeString' : {2}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, M_ID, U_Num, timeString));
        log.startWrite(sb.ToString(), className, methodName);

        string commandText = string.Empty;
        StringBuilder sbCommandText = new StringBuilder();
        if (common.isEmpty(timeString))
        {
            commandText = "select DM_MC_Name,DM_MarkTime,DM_tag, DM_MC from Dmber where del_tag='0' AND M_id='{0}' order by DM_MarkTime desc";
            sbCommandText.Append(string.Format(commandText, M_ID));
        }
        else
        {
            if (common.isEmpty(U_Num))
            {
                commandText = "select DM_MC_Name,DM_MarkTime,DM_tag, DM_MC from DMBER where M_ID='{0}'and DM_MarkTime>='{1}' and del_tag='0' and DM_tag='1' order by DM_MarkTime desc";
                sbCommandText.Append(string.Format(commandText, M_ID, timeString));
            }
            else
            {
                commandText = "select DM_MC_Name,DM_MarkTime,DM_tag, DM_MC from DMBER where M_ID='{0}' and DM_MC='{1}' and DM_MarkTime>='{2}' and del_tag='0' and DM_tag='2'";
                sbCommandText.Append(string.Format(commandText, M_ID, U_Num, timeString));
            }
        }

        List<DMBERentity> deList = DMBERhgSql.Instance.getDMBERdata(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite(deList.ToString(), className, methodName);
        return deList;
    }

    public void addDMBER(string M_ID, string DM_MC, string DM_MC_Name, string DM_MC_Com, string DM_Tag)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'M_ID' : {0}, 'DM_MC' : {1}, 'DM_MC_Name' : {2}, 'DM_MC_Com' : {3}, 'DM_Tag' : {4}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, M_ID, DM_MC, DM_MC_Name, DM_MC_Com, DM_Tag));
        log.startWrite(sb.ToString(), className, methodName);

        string commandText = "INSERT INTO DMBER (M_ID, DM_MC,DM_MC_Name,DM_MC_Com,DM_MarkTime,DM_Tag)VALUES ('{0}','{1}','{2}','{3}', GETDATE(),'{4}')";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, M_ID, DM_MC, DM_MC_Name, DM_MC_Com, DM_Tag));
        noSelectSql.Instance.doLongTag(connectionStrings, sbCommandText.ToString());//<==========

        log.endWrite(common.nothing, className, methodName);
    }
}