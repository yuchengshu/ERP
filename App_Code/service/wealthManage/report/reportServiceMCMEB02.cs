using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Collections;

/// <summary>
/// reportServiceMCMEB02 的摘要描述
/// </summary>
public class reportServiceMCMEB02
{
    //引用時不用再NEW
    private static reportServiceMCMEB02 _instance = new reportServiceMCMEB02();
    public static reportServiceMCMEB02 Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public reportServiceMCMEB02()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<List<totalPerformanceEntity>> getTotalPerformanceTable(string StartDate, string EndDate, string ComID, string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'ComID' : " + ComID + " 'U_MDEP' : " + U_MDEP, className, methodName);
        List<indexBDdataEntity> analystList = MUSERhgDao.Instance.getEmpListForPerformance(StartDate, EndDate, common.Analyst, ComID, U_MDEP);//<==========
        List<indexBDdataEntity> assistantList = MUSERhgDao.Instance.getEmpListForPerformance(StartDate, EndDate, common.Assistant, ComID, U_MDEP);//<==========
        List<totalPerformanceEntity> tpeList = null;
        List<totalPerformanceEntity> allTpeList = MTRAThgDao.Instance.getTotalPerformanceData(string.Empty, string.Empty);
        totalPerformanceEntity tpe = null;
        List<paymentDataEntity> pdeList = null;
        List<paymentDataEntity> allPdeList = MTRATjoinDTRAThgDao.Instance.getEmpPaymentData(StartDate, EndDate, string.Empty, string.Empty);
        List<totalPerformanceEntity> assistantTpeList = new List<totalPerformanceEntity>();
        indexBDdataEntity ibdde = new indexBDdataEntity();
        ibdde.empName = "合計";
        
        
        analystList.Add(ibdde);
        assistantList.Add(ibdde);
        int endTotal = 0;
        int[] assistantTotalTradeCountArr = new int[assistantList.Count];
        int[] assistantNewAddTradeCountArr = new int[assistantList.Count];
        double[] assistantNewAddTradeMoneyArr = new double[assistantList.Count];
        for (var t = 0; t < assistantList.Count; t++)
        {
            assistantTotalTradeCountArr[t]= 0;
            assistantNewAddTradeCountArr[t] = 0;
            assistantNewAddTradeMoneyArr[t] = 0;
            tpe = new totalPerformanceEntity();
            tpe.MC = assistantList[t].U_Num;
            tpe.MC_Name = assistantList[t].empName;
            assistantTpeList.Add(tpe);
        }
        List<totalPerformanceEntity> backTpeList = null;
        List<List<totalPerformanceEntity>> backClassTpeList = new List<List<totalPerformanceEntity>>();
        string mp = string.Empty;
        string mc = string.Empty;
        int analystTotalTradeCount = 0;
        int analystNewAddTradeCount = 0;
        double analystNewAddTradeMoney = 0;
        double money = 0;
        
        string type = string.Empty;
        int assistantListCount = assistantList.Count - 1;
        int analystListCount = analystList.Count - 1;
        
        for (var i = 0; i < analystList.Count; i++)
        {
            backTpeList = new List<totalPerformanceEntity>();
            for (var k = 0; k < assistantList.Count; k++)
            {
                if (k == assistantListCount)
                {
                    mp = string.Empty;
                    mc = string.Empty;
                }
                else
                {
                    mp = analystList[i].U_Num;
                    mc = assistantList[k].U_Num;
                }
                //tpeList = MTRAThgDao.Instance.getTotalPerformanceData(mc, mp);
               tpeList = new List<totalPerformanceEntity>();
                for (var z = 0; z < allTpeList.Count; z++)
                {
                    if (mc == allTpeList[z].MC)
                    {
                        if (mp == allTpeList[z].MP)
                        {
                            tpeList.Add(allTpeList[z]);
                        }
                    }
                }
                tpe = new totalPerformanceEntity();
                tpe.MC = assistantList[k].U_Num;
                tpe.MC_Name = assistantList[k].empName;
                tpe.MP = analystList[i].U_Num;
                tpe.MP_Name = analystList[i].empName;
               //pdeList = MTRATjoinDTRAThgDao.Instance.getEmpPaymentData(StartDate, EndDate, mc, mp);
               pdeList = new List<paymentDataEntity>();
                for (var p = 0; p < allPdeList.Count; p++)
                {
                    if (mc == allPdeList[p].MC)
                    {
                        if (mp == allPdeList[p].MP)
                        {
                            pdeList.Add(allPdeList[p]);
                        }
                    }
                }
                
                for (var z = 0; z < pdeList.Count; z++)
                {
                    money += common.calculateAccountMoney("nor", pdeList[z].Pay_Type, pdeList[z].T_type, pdeList[z].Account_Money, string.Empty, pdeList.Count, pdeList[z].Pay_tag);
                }
                if (k == assistantListCount)
                {
                    tpe.totalTradeCount = analystTotalTradeCount;
                    tpe.newAddTradeCount = analystNewAddTradeCount;
                    tpe.newAddTradeMoney = analystNewAddTradeMoney;
                    endTotal += analystTotalTradeCount;
                    analystTotalTradeCount = 0;
                    analystNewAddTradeCount = 0;
                    analystNewAddTradeMoney = 0;
                    if (i == analystListCount)
                    {
                        tpe.totalTradeCount = endTotal;
                    }
                }
                else
                {
                    if (i == analystListCount)
                    {
                        tpe.totalTradeCount = assistantTotalTradeCountArr[k];
                        tpe.newAddTradeCount = assistantNewAddTradeCountArr[k];
                        tpe.newAddTradeMoney = assistantNewAddTradeMoneyArr[k];


                    }
                    else
                    {
                        tpe.totalTradeCount = tpeList.Count;
                        tpe.newAddTradeCount = pdeList.Count;
                        tpe.newAddTradeMoney = money;
                        assistantTotalTradeCountArr[k] += tpe.totalTradeCount;
                        assistantNewAddTradeCountArr[k] += tpe.newAddTradeCount;
                        assistantNewAddTradeMoneyArr[k] += tpe.newAddTradeMoney;
                        analystTotalTradeCount += tpe.totalTradeCount;



                    }
                   
                    analystNewAddTradeCount += tpe.newAddTradeCount;
                    analystNewAddTradeMoney += tpe.newAddTradeMoney;
                    /*tpe.newAddTradeCount = pdeList.Count;
                    analystNewAddTradeCount += tpe.newAddTradeCount;
                    tpe.newAddTradeMoney = money;
                    analystNewAddTradeMoney += tpe.newAddTradeMoney;*/

                }
                money = 0;
                backTpeList.Add(tpe);
            }
            backClassTpeList.Add(backTpeList);
            backTpeList = null;
        }
        log.endWrite("'backClassTpeList' : " + backClassTpeList.ToString(), className, methodName);
        return backClassTpeList;
    }

    public List<detailPerformanceEntity> getDetailPerformanceTable(string StartDate, string EndDate, string ComID, string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'ComID' : " + ComID + " 'U_MDEP' : " + U_MDEP, className, methodName);
        List<indexBDdataEntity> analystList = MUSERhgDao.Instance.getEmpListForPerformance(StartDate, EndDate, common.Analyst, ComID, U_MDEP);//<==========
        List<ditcodedescEntity> allDdeList = new List<ditcodedescEntity>();
        List<ditcodedescEntity> PITEMList = MITEMhgDao.Instance.getditcodedescEntityList("PITEM");
        List<ditcodedescEntity> tempDdeList = null;
        List<detailPerformanceEntity> backDpeList = new List<detailPerformanceEntity>();
        string analystNum = string.Empty;
        for (var i = 0; i < analystList.Count; i++)
        {
            analystNum = analystList[i].U_Num;
            tempDdeList = MITEMhgDao.Instance.getditcodedescEntityList(analystNum);
            for (var j = 0; j < tempDdeList.Count; j++)
            {
                tempDdeList[j].MP = analystNum;
                allDdeList.Add(tempDdeList[j]);
            }
        }
        List<detailPerformanceEntity> dpeList = MTRATjoinMMBERjoinMUSERhgDao.Instance.getDetailPerformanceTable(StartDate,EndDate,ComID,U_MDEP,string.Empty);
        for (var k = 0; k < dpeList.Count; k++)
        {
            for (var z = 0; z < allDdeList.Count; z++)
            {
                if (allDdeList[z].MP == dpeList[k].MP)
                {
                    if (allDdeList[z].ditcode == dpeList[k].T_Item)
                    {
                        dpeList[k].T_ItemName = allDdeList[z].ddesc; 
                    }
                }
            }

            for (var u = 0; u < PITEMList.Count; u++)
            {
                if (PITEMList[u].ditcode == dpeList[k].Pay_Type)
                {
                    dpeList[k].Pay_TypeName = PITEMList[u].ddesc;
                }
            }
            dpeList[k].T_PayMoneyDouble = common.calculateAccountMoney("nor", dpeList[k].Pay_Type, dpeList[k].T_Type, dpeList[k].Account_Money, string.Empty, dpeList.Count, string.Empty);
        }
        string tempMid = string.Empty;
        string tempT_PayMoney = string.Empty;
        string tempT_Item = string.Empty;
        int backDpeListCount = 0;
        int mcCount = 1;
        for (var s = 0; s < dpeList.Count; s++)
        {
            if (tempMid != dpeList[s].M_ID || tempT_PayMoney != dpeList[s].T_PayMoney)
            {
                backDpeList.Add(dpeList[s]);
                
             }
             else
             {
                if (mcCount == 1)
                {
                    backDpeListCount = backDpeList.Count - 1;
                    backDpeList[backDpeListCount].mc2 = dpeList[s].mc;
                    backDpeList[backDpeListCount].mc_name2 = dpeList[s].mc_name;
                    backDpeList[backDpeListCount].Pay_Type2 = dpeList[s].Pay_Type;
                    backDpeList[backDpeListCount].Pay_TypeName2 = dpeList[s].Pay_TypeName;
                    backDpeList[backDpeListCount].T_PayMoney2 = dpeList[s].T_PayMoney;
                    backDpeList[backDpeListCount].T_PayMoneyDouble2 = dpeList[s].T_PayMoneyDouble;
                    mcCount += 1;
                }
                else
                {
                    if (tempT_Item != dpeList[s].T_Item)
                    {
                        backDpeList.Add(dpeList[s]);
                        mcCount = 1;
                    }
                    else
                    {
                        backDpeListCount = backDpeList.Count - 1;
                        backDpeList[backDpeListCount].mc3 = dpeList[s].mc;
                        backDpeList[backDpeListCount].mc_name3 = dpeList[s].mc_name;
                        backDpeList[backDpeListCount].Pay_Type3 = dpeList[s].Pay_Type;
                        backDpeList[backDpeListCount].Pay_TypeName3 = dpeList[s].Pay_TypeName;
                        backDpeList[backDpeListCount].T_PayMoney3 = dpeList[s].T_PayMoney;
                        backDpeList[backDpeListCount].T_PayMoneyDouble3 = dpeList[s].T_PayMoneyDouble;
                        mcCount = 1;
                    }
                    
                }
                
            }
            tempT_Item = dpeList[s].T_Item;
            tempMid = dpeList[s].M_ID;
            tempT_PayMoney = dpeList[s].T_PayMoney;
        }

        log.endWrite("'backDpeList' : " + backDpeList.ToString(), className, methodName);
        return backDpeList;
    }


    public List<List<detailPerformanceEntity>> getAssistantDetailPerformanceTable(string StartDate, string EndDate, string ComID, string U_MDEP, string MC)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'ComID' : " + ComID + " 'U_MDEP' : " + U_MDEP + " 'MC' : " + MC, className, methodName);
        List<indexBDdataEntity> analystList = MUSERhgDao.Instance.getEmpListForPerformance(StartDate, EndDate, common.Analyst, string.Empty, string.Empty);//<==========
        List<indexBDdataEntity> assistantList = null;
        if (!common.isEmpty(MC))
        {
            assistantList = new List<indexBDdataEntity>();
            mcDataEntity mde = MUSERhgDao.Instance.getMCdata(MC);
            indexBDdataEntity ibdde = new indexBDdataEntity();
            ibdde.U_Num = MC;
            ibdde.empName = mde.U_Name;
            assistantList.Add(ibdde);
        }
        else
        {
            assistantList = MUSERhgDao.Instance.getEmpListForPerformance(StartDate, EndDate, common.Assistant, ComID, U_MDEP);//<==========
        }
       
        List<ditcodedescEntity> allDdeList = new List<ditcodedescEntity>();
        List<ditcodedescEntity> tempDdeList = null;
        List<detailPerformanceEntity> tempAssistantDpeList = null;
        List<List<detailPerformanceEntity>> backAssistantDpeListList = new List<List<detailPerformanceEntity>>();
        List<ditcodedescEntity> PITEMList = MITEMhgDao.Instance.getditcodedescEntityList("PITEM");
        string analystNum = string.Empty;
        // 製作 對應每一個分析師的會員類別的allDdeList
        for (var i = 0; i < analystList.Count; i++)
        {
            analystNum = analystList[i].U_Num;
            tempDdeList = MITEMhgDao.Instance.getditcodedescEntityList(analystNum);
            for (var j = 0; j < tempDdeList.Count; j++)
            {
                tempDdeList[j].MP = analystNum;
                allDdeList.Add(tempDdeList[j]);
            }
        }
        List<detailPerformanceEntity> dpeList = MTRATjoinMMBERjoinMUSERhgDao.Instance.getDetailPerformanceTable(StartDate, EndDate, ComID, U_MDEP, MC);
        
        for (var z = 0; z < assistantList.Count; z++)
        {
            tempAssistantDpeList = new List<detailPerformanceEntity>();
            for (var k = 0; k < dpeList.Count; k++)
            {
                if (dpeList[k].mc == assistantList[z].U_Num)
                {
                    for (var j = 0; j < allDdeList.Count; j++)
                    {
                        if (allDdeList[j].MP == dpeList[k].MP)
                        {
                            if (allDdeList[j].ditcode == dpeList[k].T_Item)
                            {
                                dpeList[k].T_ItemName = allDdeList[j].ddesc;
                            }
                        }
                    }
                    for (var u = 0; u < PITEMList.Count; u++)
                    {
                        if (PITEMList[u].ditcode == dpeList[k].Pay_Type)
                        {
                            dpeList[k].Pay_TypeName = PITEMList[u].ddesc;
                        }
                    }
                    dpeList[k].T_PayMoneyDouble = common.calculateAccountMoney("nor", dpeList[k].Pay_Type, dpeList[k].T_Type, dpeList[k].Account_Money, string.Empty, dpeList.Count, string.Empty);

                    tempAssistantDpeList.Add(dpeList[k]);
                }
            }
            backAssistantDpeListList.Add(tempAssistantDpeList);
        }
        log.endWrite("'backAssistantDpeListList' : " + backAssistantDpeListList.ToString(), className, methodName);
        return backAssistantDpeListList;
    }
}