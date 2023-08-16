using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// DMBERjoinMMBERhgDao 的摘要描述
/// </summary>
public class DMBERjoinMMBERhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static DMBERjoinMMBERhgDao _instance = new DMBERjoinMMBERhgDao();
    public static DMBERjoinMMBERhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public DMBERjoinMMBERhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<companyResourceTagEntity> getCompanyResourceTag(getCompanyResourceTagParamEntity gcrtpe)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' :" + gcrtpe.StartDate + " 'EndDate' :" + gcrtpe.EndDate + " 'U_MDEP' :" + gcrtpe.U_MDEP + " 'DM_tag' :" + gcrtpe.DM_tag + " 'MC' :" + gcrtpe.MC + " 'bMC' :" + gcrtpe.bMC, className, methodName);
        string sql_txt = getSqlTxt.getCompanyResourceTagST(gcrtpe);
        string commandText = "select a.M_ID, a.DM_MC_Name,a.DM_MarkTime,a.DM_tag,b.M_Name,b.MC_Name,b.MC_COM,b.OTel_Zone, b.OTel, b.OTel_Sub, b.OTel_Zone1, b.OTel1, b.OTel_Sub1, b.HTel_Zone, b.HTel, b.HTel_Zone1, b.HTel1, b.MTel1, b.MTel2, b.MTel3 from DMBER a join MMBER b on a.m_id=b.m_id where a.del_tag='0'" + sql_txt + " order by DM_MC";

         List<companyResourceTagEntity> crteList = DMBERjoinMMBERhgSql.Instance.getCompanyResourceTag(connectionStrings, commandText);//<==========

        log.endWrite("'crteList' : " + crteList.ToString(), className, methodName);
        return crteList;
    }
}