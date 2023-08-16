using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Collections;

/// <summary>
/// reportService 的摘要描述
/// </summary>
public class reportServiceMCMEB05
{
    //引用時不用再NEW
    private static reportServiceMCMEB05 _instance = new reportServiceMCMEB05();
    public static reportServiceMCMEB05 Instance
    {
        get
        {
            return _instance;
        }
    }
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public reportServiceMCMEB05()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<analystPerformanceEntity> getAllAnalystListForPerformance(string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate, className, methodName);
        string EmpType = "Analyst";
        List<indexBDdataEntity> cdeList = MUSERhgDao.Instance.getEmpListForPerformance(StartDate, EndDate, EmpType, string.Empty, string.Empty);//<==========
        analystPerformanceEntity ape = null;
        List<analystPerformanceEntity> apeList = new List<analystPerformanceEntity>();
        List<paymentDataEntity> pdeList = null;
        List<paymentDataEntity> allPdeList = new List<paymentDataEntity>();
        List<venueDataEntity> vdeList = MVENUhgDao.Instance.getVenueDataForPerformance(StartDate, EndDate);
        for (var i = 0; i < cdeList.Count; i++)
        {
            ape = new analystPerformanceEntity();
            ape.analyst = cdeList[i].U_Num;
            ape.analystName = cdeList[i].empName;
            apeList.Add(ape);
            pdeList = MTRATjoinDTRAThgDao.Instance.getEmpPaymentData(StartDate, EndDate, string.Empty, cdeList[i].U_Num);//<============================
            for (var k = 0; k < pdeList.Count; k++)
            {
                allPdeList.Add(pdeList[k]);
            }
        }

        List<indexBDdataEntity> AibddeList = MUSERhgDao.Instance.getGroupEmp(StartDate, EndDate, "A");//<==========
        List<indexBDdataEntity> BibddeList = MUSERhgDao.Instance.getGroupEmp(StartDate, EndDate, "B");//<==========
        for (var j = 0; j < allPdeList.Count; j++)
        {
            for (var z = 0; z < apeList.Count; z++)
            {
                if (apeList[z].analyst == allPdeList[j].MP)
                {
                    //非會場交易
                    if (allPdeList[j].T_type != "0002")
                    {
                        //業績總額
                        apeList[z].totalPerformanceMoney += common.calculateAccountMoney("nor", allPdeList[j].Pay_Type, allPdeList[j].T_type, allPdeList[j].Account_Money, EmpType, allPdeList.Count, allPdeList[j].Pay_tag);
                        //會費總額
                        apeList[z].totalMemberMoney += double.Parse(allPdeList[j].Account_Money);
                        //a組
                        for (var u = 0; u < AibddeList.Count; u++)
                        {
                            if (AibddeList[u].U_Num == allPdeList[j].MC)
                            {
                                apeList[z].aGroupMoney += common.calculateAccountMoney("nor", allPdeList[j].Pay_Type, allPdeList[j].T_type, allPdeList[j].Account_Money, EmpType, allPdeList.Count, allPdeList[j].Pay_tag);
                            }
                        }
                        //b組
                        for (var x = 0; x < BibddeList.Count; x++)
                        {
                            if (BibddeList[x].U_Num == allPdeList[j].MC)
                            {
                                apeList[z].bGroupMoney += common.calculateAccountMoney("nor", allPdeList[j].Pay_Type, allPdeList[j].T_type, allPdeList[j].Account_Money, EmpType, allPdeList.Count, allPdeList[j].Pay_tag);
                            }
                        }

                        //折讓
                        if ((allPdeList[j].Account_Money).IndexOf("-") > -1)
                        {
                            apeList[z].discount += common.calculateAccountMoney("nor", allPdeList[j].Pay_Type, allPdeList[j].T_type, allPdeList[j].Account_Money, EmpType, allPdeList.Count, allPdeList[j].Pay_tag);
                        }
                    }
                    else
                    {
                        //會場
                        apeList[z].venueMoney += common.calculateAccountMoney("venue", allPdeList[j].Pay_Type, allPdeList[j].T_type, allPdeList[j].Account_Money, EmpType, allPdeList.Count, allPdeList[j].Pay_tag);
                    }
                }

                //其他收入
                for (var t = 0; t < vdeList.Count; t++)
                {
                    if (apeList[z].analyst == vdeList[t].MP)
                    {
                        apeList[z].otherIncome += double.Parse(vdeList[t].V_Fees);
                    }
                }
            }  
        }
        double totalPerformanceMoney = 0;
        double totalMemberMoney = 0;
        double venueMoney = 0;
        double aGroupMoney = 0;
        double bGroupMoney = 0;
        double bonusCost = 0;
        double otherIncome = 0;
        double discount = 0;
        for (var p = 0; p < apeList.Count; p++)
        {
            totalPerformanceMoney += apeList[p].totalPerformanceMoney;
            totalMemberMoney += apeList[p].totalMemberMoney;
            venueMoney += apeList[p].venueMoney;
            aGroupMoney += apeList[p].aGroupMoney;
            bGroupMoney += apeList[p].bGroupMoney;
            apeList[p].bonusCost = (apeList[p].aGroupMoney * 0.12) + (apeList[p].bGroupMoney * 0.3) + (apeList[p].venueMoney * 0.12);
            bonusCost += apeList[p].bonusCost;
            otherIncome += apeList[p].otherIncome;
            discount += apeList[p].discount;
        }
        ape = new analystPerformanceEntity();
        ape.analystName = "總計";
        ape.totalPerformanceMoney = totalPerformanceMoney;
        ape.totalMemberMoney = totalMemberMoney;
        ape.venueMoney = venueMoney;
        ape.aGroupMoney = aGroupMoney;
        ape.bGroupMoney = bGroupMoney;
        ape.bonusCost = bonusCost;
        ape.otherIncome = otherIncome;
        ape.discount = discount;
        apeList.Add(ape);
        log.endWrite("'apeList' : " + apeList.ToString(), className, methodName);
        return apeList;
    }
    public List<assistantPerformanceEntity> getAssistantPerformance(string StartDate, string EndDate, string U_MDEP, string ComID, string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'U_MDEP' : " + U_MDEP + " 'ComID' : " + ComID + " 'MP' : " + MP, className, methodName);
        string EmpType = "Assistant";
        List<indexBDdataEntity> cdeList = MUSERhgDao.Instance.getEmpListForPerformance(StartDate, EndDate, EmpType, ComID, U_MDEP);//<==========
        assistantPerformanceEntity ape = null;
        List<assistantPerformanceEntity> apeList = new List<assistantPerformanceEntity>();
        List<paymentDataEntity> pdeList = null;
        List<paymentDataEntity> allPdeList = new List<paymentDataEntity>();
        for (var i = 0; i < cdeList.Count; i++)
        {
            ape = new assistantPerformanceEntity();
            ape.assistant = cdeList[i].U_Num;
            ape.assistantName = cdeList[i].empName;
            apeList.Add(ape);
            pdeList = MTRATjoinDTRAThgDao.Instance.getEmpPaymentData(StartDate, EndDate, cdeList[i].U_Num, MP);//<============================
            for (var k = 0; k < pdeList.Count; k++)
            {
                allPdeList.Add(pdeList[k]);
            }
        }
        for (var j = 0; j < allPdeList.Count; j++)
        {
            for (var z = 0; z < apeList.Count; z++)
            {
                if (apeList[z].assistant == allPdeList[j].MC)
                {
                    //非會場交易
                    if (allPdeList[j].T_type != "0002")
                    {
                        //業績總額
                        apeList[z].totalPerformanceMoney += common.calculateAccountMoney("nor", allPdeList[j].Pay_Type, allPdeList[j].T_type, allPdeList[j].Account_Money, EmpType, allPdeList.Count, allPdeList[j].Pay_tag);
                        //會費總額
                        apeList[z].totalMemberMoney += double.Parse(allPdeList[j].Account_Money);
                        switch (allPdeList[j].Light_Status)
                        {
                            //紅燈
                            case "R":
                                apeList[z].redLightMoney += common.calculateAccountMoney("nor", allPdeList[j].Pay_Type, allPdeList[j].T_type, allPdeList[j].Account_Money, EmpType, allPdeList.Count, allPdeList[j].Pay_tag);
                                break;
                            //黃燈
                            case "Y":
                                apeList[z].yellowLightMoney += common.calculateAccountMoney("nor", allPdeList[j].Pay_Type, allPdeList[j].T_type, allPdeList[j].Account_Money, EmpType, allPdeList.Count, allPdeList[j].Pay_tag);
                                break;
                            //綠燈
                            case "G":
                                apeList[z].greenLightMoney += common.calculateAccountMoney("nor", allPdeList[j].Pay_Type, allPdeList[j].T_type, allPdeList[j].Account_Money, EmpType, allPdeList.Count, allPdeList[j].Pay_tag);
                                break;
                        }
                    }
                    else
                    {
                        //會場
                        apeList[z].venueMoney += common.calculateAccountMoney("venue", allPdeList[j].Pay_Type, allPdeList[j].T_type, allPdeList[j].Account_Money, EmpType, allPdeList.Count, allPdeList[j].Pay_tag);
                    }
                }
            }
        }
        double totalPerformanceMoney = 0;
        double totalMemberMoney = 0;
        double venueMoney = 0;
        double redLightMoney = 0;
        double yellowLightMoney = 0;
        double greenLightMoney = 0;
        for (var p = 0; p < apeList.Count; p++)
        {
            totalPerformanceMoney += apeList[p].totalPerformanceMoney;
            totalMemberMoney += apeList[p].totalMemberMoney;
            venueMoney += apeList[p].venueMoney;
            redLightMoney += apeList[p].redLightMoney;
            yellowLightMoney += apeList[p].yellowLightMoney;
            greenLightMoney += apeList[p].greenLightMoney;
        }
        ape = new assistantPerformanceEntity();
        ape.assistantName = "總計";
        ape.totalPerformanceMoney = totalPerformanceMoney;
        ape.totalMemberMoney = totalMemberMoney;
        ape.venueMoney = venueMoney;
        ape.redLightMoney = redLightMoney;
        ape.yellowLightMoney = yellowLightMoney;
        ape.greenLightMoney = greenLightMoney;
        apeList.Add(ape);
        log.endWrite("'apeList' : " + apeList.ToString(), className, methodName);
        return apeList;

    }

}