using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// reportServiceMCMEB13 的摘要描述
/// </summary>
public class reportServiceMCMEB13
{
    //引用時不用再NEW
    private static reportServiceMCMEB13 _instance = new reportServiceMCMEB13();
    public static reportServiceMCMEB13 Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public reportServiceMCMEB13()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<ResourceDistributionEntity> getResourceDistribution(string StartDate, string EndDate, string MC_COM, string type)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'MC_COM' : " + MC_COM + " 'type' : " + type, className, methodName);

        List<ResourceDistributionEntity> rdeList = null;
        if (type == "requestGift")
        {
            rdeList = MFRRPhgDao.Instance.getResourceDistribution(StartDate, EndDate, MC_COM);//<==========
        }
        else
        {
            rdeList = WEVENTjoinWAnalystsHgDao.Instance.getResourceDistribution(StartDate, EndDate, MC_COM);//<==========
        }
        List<indexBDdataEntity> ibddeList = MUSERhgDao.Instance.getEmpBDlist();
        for (var i = 0; i < rdeList.Count; i++)
        {
            for (var j = 0; j < ibddeList.Count; j++)
            {
                if (rdeList[i].Result_user == ibddeList[j].U_Num)
                {
                    rdeList[i].Result_userName = ibddeList[j].empName;
                }
            }
        }

        log.endWrite("'rdeList' : " + rdeList.ToString(), className, methodName);
        return rdeList;
    }

    public List<ResourceDistributionDetailEntity> getResourceDistributionDetail(string StartDate, string EndDate, string MC_COM, string Result_user, string Result_userName)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'MC_COM' : " + MC_COM + " 'Result_user' : " + Result_user + " 'Result_userName' : " + Result_userName, className, methodName);

        List<ResourceDistributionDetailEntity> rddeList = MFRRPhgDao.Instance.getResourceDistributionDetail(StartDate, EndDate, MC_COM, Result_user, Result_userName);//<==========

        log.endWrite("'rddeList' : " + rddeList.ToString(), className, methodName);
        return rddeList;
    }
}