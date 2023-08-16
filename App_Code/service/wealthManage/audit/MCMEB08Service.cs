using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MCMEB08Service 的摘要描述
/// </summary>
public class MCMEB08Service
{
    //引用時不用再NEW
    private static MCMEB08Service _instance = new MCMEB08Service();
    public static MCMEB08Service Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public MCMEB08Service()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<ditcodedescEntity> getDepListForCaseDistribute()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getDepListForCaseDistribute();//<==========

        log.endWrite("'ddeList' : " + ddeList.ToString(), className, methodName);
        return ddeList;
    }

    public List<caseDistributeEntity> getCaseDistribute(string StartDate, string EndDate, string U_MDEP,string User_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'StartDate' :" + StartDate + "'EndDate' :" + EndDate + "'U_MDEP' :" + U_MDEP + "'User_MDEP' :" + User_MDEP, className, methodName);

        List<caseDistributeEntity> cdeList = MUSERhgDao.Instance.getMCListForCaseDistribute(StartDate,  EndDate,  U_MDEP, User_MDEP);
        string tempU_Num = string.Empty;
        int totalGreenCount = 0;
        int totalYellowCount = 0;
        int totalRedCount = 0;
        for (var i = 0; i < cdeList.Count; i++)
        {
            tempU_Num = cdeList[i].U_Num;
            cdeList[i].greenCount = MRYGCjoinMMBERhgDao.Instance.getLightCount(tempU_Num,"G");
            totalGreenCount += cdeList[i].greenCount;
            cdeList[i].yellowCount = MRYGCjoinMMBERhgDao.Instance.getLightCount(tempU_Num, "Y");
            totalYellowCount += cdeList[i].yellowCount;
            cdeList[i].redCount = MRYGCjoinMMBERhgDao.Instance.getLightCount(tempU_Num, "R");
            totalRedCount += cdeList[i].redCount;
            cdeList[i].distributeCount = cdeList[i].greenCount+ cdeList[i].yellowCount + cdeList[i].redCount;
        }
        caseDistributeEntity cde = new caseDistributeEntity();
        cde.U_Name = "合計";
        cde.greenCount = totalGreenCount;
        cde.yellowCount = totalYellowCount;
        cde.redCount = totalRedCount;
        cde.distributeCount = totalGreenCount + totalYellowCount + totalRedCount;
        cdeList.Add(cde);


        log.endWrite("'cdeList' : " + cdeList.ToString(), className, methodName);
        return cdeList;
    }
}