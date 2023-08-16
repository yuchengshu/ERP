using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// dailyResearchReportManagementService 的摘要描述
/// </summary>
public class dailyResearchReportManagementService
{
    //引用時不用再NEW
    private static dailyResearchReportManagementService _instance = new dailyResearchReportManagementService();

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public static dailyResearchReportManagementService Instance
    {
        get
        {
            return _instance;
        }
    }
    public dailyResearchReportManagementService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<dailyResearchReportEntity> getDailyResearchReportList(getMessageListParam gmlp)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MP' :" + gmlp.MP + "'MP_Item' :" + gmlp.MP_Item + "'StartDate' :" + gmlp.StartDate + "'EndDate' :" + gmlp.EndDate + "'keyWord' :" + gmlp.keyWord + "'U_MDEP':" + gmlp.U_MDEP + "'U_POSITION':" + gmlp.U_POSITION + "'ComID':" + gmlp.ComID + "'U_Num':" + gmlp.U_Num, className, methodName);

        List<dailyResearchReportEntity> cmeList = WFaxReportJoinWanalystshgDao.Instance.getDailyResearchReportList(gmlp);//<====
        List<indexBDdataEntity> lmList = MUSERhgDao.Instance.getEmpBDlist();
        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("WITEM");
        List<ditcodedescEntity> MitemddeList = MITEMhgDao.Instance.getditcodedescEntityList("Mitem");

        for (var i = 0; i < cmeList.Count; i++)
        {
            cmeList[i].F_EDate = cmeList[i].F_EDate.Split(' ')[0];
            cmeList[i].F_SDate = cmeList[i].F_SDate.Split(' ')[0];
            if (cmeList[i].Open_tag == "0")
            {
                cmeList[i].Open_tagName = "開啟";
            }
            else
            {
                cmeList[i].Open_tagName = "關閉";
            }
            if (cmeList[i].F_Item == "0")
            {
                cmeList[i].F_ItemName = "研究日報";
            }
            else
            {
                cmeList[i].F_ItemName = "研究報告";
            }
            for (var z = 0; z < lmList.Count; z++)
            {
                if (lmList[z].U_Num == cmeList[i].u_num)
                {
                    cmeList[i].u_numName = lmList[z].empName;
                }
            }
            for (var j = 0; j < ddeList.Count; j++)
            {
                if (ddeList[j].ditcode == cmeList[i].U_Item)
                {
                    cmeList[i].U_ItemName = ddeList[j].ddesc;
                    break;
                }
            }
            for (var j = 0; j < MitemddeList.Count; j++)
            {
                if (MitemddeList[j].ditcode == cmeList[i].Pay)
                {
                    cmeList[i].PayName = MitemddeList[j].ddesc;
                    break;
                }
            }
        }
        log.endWrite("'cmeList' :" + cmeList.ToString(), className, methodName);
        return cmeList;
    }

    public string deleteDailyResearchReportFuc(string F_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'F_id' :" + F_id, className, methodName);

        string backStr = WFaxReporthgDao.Instance.deleteDailyResearchReportFuc(F_id);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public string deleteThreeBigData(string WFT_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'WFT_id' :" + WFT_id, className, methodName);

        string backStr = WFAXThgDao.Instance.deleteThreeBigData(WFT_id);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public List<closingPriceThreeBigDataEntity> getClosingPriceThreeBigData()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<closingPriceThreeBigDataEntity> cptbdeList = WFAXThgDao.Instance.getClosingPriceThreeBigData();//<==========

        log.endWrite("'cptbdeList' :" + cptbdeList.ToString(), className, methodName);
        return cptbdeList;

    }

    public string sendThreeBigData(closingPriceThreeBigDataEntity cptbde)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'cptbde':" + cptbde, className, methodName);

        string backStr = WFAXThgDao.Instance.sendThreeBigData(cptbde);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public List<wAnalystEntity> getWAnalysts()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<wAnalystEntity> wAnalystList = wAnalystshgDao.Instance.getWAnalysts();//<==========

        log.endWrite("'wAnalystList' :" + wAnalystList.ToString(), className, methodName);
        return wAnalystList;
    }

    public string sendReseachReportData(dailyResearchReportEntity drre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'drre':" + drre.ToString(), className, methodName);

        string backStr = WFaxReporthgDao.Instance.sendReseachReportData(drre);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
}