using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MCMEB01Service 的摘要描述
/// </summary>
public class MCMEB01Service
{
    //引用時不用再NEW
    private static MCMEB01Service _instance = new MCMEB01Service();
    public static MCMEB01Service Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public MCMEB01Service()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<ditcodedescEntity> getDepListForCompanyResourceTag()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getDepListForCompanyResourceTag();//<==========

        log.endWrite("'ddeList' : " + ddeList.ToString(), className, methodName);
        return ddeList;
    }

    public List<businessERPstatusEntity> getMCListForCompanyResourceTag(string ComID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID' :"+ ComID, className, methodName);

        List<businessERPstatusEntity> beseList = MUSERhgDao.Instance.getMCListForCompanyResourceTag(ComID);//<==========

        log.endWrite("'beseList' : " + beseList.ToString(), className, methodName);
        return beseList;
    }

    public List<companyResourceTagEntity> getCompanyResourceTag(getCompanyResourceTagParamEntity gcrtpe)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' :" + gcrtpe.StartDate + " 'EndDate' :" + gcrtpe.EndDate + " 'U_MDEP' :" + gcrtpe.U_MDEP + " 'DM_tag' :" + gcrtpe.DM_tag + " 'MC' :" + gcrtpe.MC + " 'bMC' :" + gcrtpe.bMC, className, methodName);

        List<companyResourceTagEntity> crteList = DMBERjoinMMBERhgDao.Instance.getCompanyResourceTag(gcrtpe);//<==========
        for (var i = 0; i < crteList.Count; i++)
        {
            if (crteList[i].DM_tag == "2")
            {
                crteList[i].DM_tagName = "長註記";
            }
            else if (crteList[i].DM_tag == "1")
            {
                crteList[i].DM_tagName = "短註記";
            }
            else
            {
                crteList[i].DM_tagName = "舊註記";
            }
        }

        log.endWrite("'crteList' : " + crteList.ToString(), className, methodName);
        return crteList;
    }

}