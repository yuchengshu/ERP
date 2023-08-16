using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Collections;

/// <summary>
/// reportService 的摘要描述
/// </summary>
public class reportServiceMPMEB01
{
    //引用時不用再NEW
    private static reportServiceMPMEB01 _instance = new reportServiceMPMEB01();
    public static reportServiceMPMEB01 Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public reportServiceMPMEB01()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<analystSinglePerformanceEntity> getMemberCountInSession(string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'MP' : " + MP, className, methodName);

        List<analystSinglePerformanceEntity> aspeList = MTRATjoinMMBERhgDao.Instance.getMemberCountInSession(MP);//<==========

        log.endWrite("'aspeList' : " + aspeList.ToString(), className, methodName);
        return aspeList;
    }

    public List<analystSinglePerformanceEntity> getAnalystSinglePerformance(string StartDate, string EndDate, string MP, string M_Item, string caseType)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'MP' : " + MP + " 'M_Item' : " + M_Item + " 'caseType' : " + caseType, className, methodName);

        List<paymentDataEntity> pdeList = MTRATjoinDTRAThgDao.Instance.getPaymentData(StartDate, EndDate, MP, M_Item, caseType);//<============================

        List<analystSinglePerformanceEntity> aspeList = MTRATjoinMMBERhgDao.Instance.getAnalystSinglePerformance(StartDate, EndDate, MP, M_Item, caseType);//<==========
        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList(MP);//==========================================================
        for (var m = 0; m < pdeList.Count; m++)
        {
            for (var n = 0; n < ddeList.Count; n++)
            {
                if (pdeList[m].T_Item == ddeList[n].ditcode)
                {
                    pdeList[m].T_ItemName = ddeList[n].ddesc;
                }
            }
        }
        string Pay_Type = string.Empty;
        string T_type = string.Empty;
        for (var i = 0; i < pdeList.Count; i++)
        {
            for (var k = 0; k < aspeList.Count; k++)
            {
                aspeList[k].MP = pdeList[i].MP;
                aspeList[k].MP_Name = pdeList[i].MP_Name;
                aspeList[k].MC = pdeList[i].MC;
                aspeList[k].MC_Name = pdeList[i].MC_Name;
                if (pdeList[i].T_ItemName == aspeList[k].t_item)
                {
                    Pay_Type = pdeList[i].Pay_Type;
                    T_type = pdeList[i].T_type;
                    aspeList[k].totalMoney += common.calculateAccountMoney(caseType, Pay_Type, T_type, pdeList[i].Account_Money, "Analyst", pdeList.Count, pdeList[i].Pay_tag);
                }
            }
        }

        log.endWrite("'aspeList' : " + aspeList.ToString(), className, methodName);
        return aspeList;
    }

}