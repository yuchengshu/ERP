using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// reportServiceMCMEB11 的摘要描述
/// </summary>
public class reportServiceMCMEB11
{
    //引用時不用再NEW
    private static reportServiceMCMEB11 _instance = new reportServiceMCMEB11();
    public static reportServiceMCMEB11 Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public reportServiceMCMEB11()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<detailPerformanceEntity> getPerformanceForLockVideo(string StartDate, string EndDate, string ComID, string type)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'ComID' : " + ComID + " 'type' : " + type, className, methodName);
        List<indexBDdataEntity> analystList = MUSERhgDao.Instance.getEmpListForPerformance(StartDate, EndDate, common.Analyst, ComID, string.Empty);//<==========
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
        List<detailPerformanceEntity> dpeList = MTRATjoinMMBERjoinMUSERhgDao.Instance.getInternetBusinessPerformance(StartDate, EndDate, ComID, type);
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
            dpeList[k].T_PayMoneyDouble = common.calculateAccountMoneyForInternetBusinessPerformance(dpeList[k].Pay_Type, dpeList[k].T_Type, dpeList[k].Account_Money);
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


    public List<detailPerformanceEntity> getPerformanceForImportListTransaction(string StartDate, string EndDate, string ComID, string type)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'ComID' : " + ComID + " 'type' : " + type, className, methodName);
        List<indexBDdataEntity> analystList = MUSERhgDao.Instance.getEmpListForPerformance(StartDate, EndDate, common.Analyst, ComID, string.Empty);//<==========
        List<ditcodedescEntity> allDdeList = new List<ditcodedescEntity>();
        List<ditcodedescEntity> PITEMList = MITEMhgDao.Instance.getditcodedescEntityList("PITEM");
        List<ditcodedescEntity> tempDdeList = null;
        List<detailPerformanceEntity> backDpeList = new List<detailPerformanceEntity>();
        List<midMNameEntity> ameList = MMBERhgDao.Instance.getMMBERdata();
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
        List<detailPerformanceEntity> dpeList = MTRATjoinMMBERjoinMUSERhgDao.Instance.getInternetBusinessPerformance(StartDate, EndDate, ComID, type);
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
            dpeList[k].T_PayMoneyDouble = common.calculateAccountMoneyForInternetBusinessPerformance(dpeList[k].Pay_Type, dpeList[k].T_Type, dpeList[k].Account_Money);
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

                dpeList[s].TransactionCount = ameList.Count.ToString();
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

    
    public List<detailPerformanceEntity> getPerformanceForGetReportTransaction(string StartDate, string EndDate, string ComID, string type)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'ComID' : " + ComID + " 'type' : " + type, className, methodName);
        List<indexBDdataEntity> analystList = MUSERhgDao.Instance.getEmpListForPerformance(StartDate, EndDate, common.Analyst, ComID, string.Empty);//<==========
        List<ditcodedescEntity> allDdeList = new List<ditcodedescEntity>();
        List<ditcodedescEntity> PITEMList = MITEMhgDao.Instance.getditcodedescEntityList("PITEM");
        List<ditcodedescEntity> tempDdeList = null;
        List<detailPerformanceEntity> backDpeList = new List<detailPerformanceEntity>();
        List<activityMessageEntity> ameList = MFRRPhgDao.Instance.getMFRRPdata(StartDate, EndDate);
        List<activityMessageEntity> filterAmeList = new List<activityMessageEntity>();
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

        List<detailPerformanceEntity> dpeList = MTRATjoinMMBERjoinMUSERhgDao.Instance.getInternetBusinessPerformance(StartDate, EndDate, ComID, type);


        for (var i = 0; i < dpeList.Count; i++)
        {
            for (var z = 0; z < ameList.Count; z++)
            {
                if (dpeList[i].MTel1 == ameList[z].M_Tel)
                {
                    filterAmeList.Add(ameList[z]);
                }
            }
        }
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
            dpeList[k].T_PayMoneyDouble = common.calculateAccountMoneyForInternetBusinessPerformance(dpeList[k].Pay_Type, dpeList[k].T_Type, dpeList[k].Account_Money);
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
                dpeList[s].TransactionCount = ameList.Count.ToString();
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

        DateTime bdAddDate =  DateTime.Now;
        DateTime bdAddDatePlusThirtyDay = DateTime.Now;
        DateTime ameAddDate = DateTime.Now;
        string one = "1";
        for (var i = 0; i < backDpeList.Count; i++)
        {
            for (var z = 0; z < filterAmeList.Count; z++)
            {
                bdAddDatePlusThirtyDay = Convert.ToDateTime((backDpeList[i].MMBERadd_Date)).AddDays(30);
                ameAddDate = (Convert.ToDateTime((filterAmeList[z].add_date)));
                bdAddDate = Convert.ToDateTime((backDpeList[i].MTRATadd_Date));
               
                if (ameAddDate > bdAddDatePlusThirtyDay && ameAddDate <= bdAddDate && filterAmeList[z].MP_ID == backDpeList[i].MP && filterAmeList[z].M_Tel == backDpeList[i].MTel1)
                {
                    backDpeList[i].showTag = one;
                }
                if (ameAddDate <= bdAddDate && filterAmeList[z].MP_ID == backDpeList[i].MP && filterAmeList[z].M_Tel == backDpeList[i].MTel1)
                {
                    backDpeList[i].showTag = one;
                }
                else if (ameAddDate >= bdAddDate && ameAddDate >= bdAddDatePlusThirtyDay && filterAmeList[z].MP_ID == backDpeList[i].MP && filterAmeList[z].M_Tel == backDpeList[i].MTel1)
                {
                    backDpeList[i].showTag = one;
                }
            }
        }
        log.endWrite("'backDpeList' : " + backDpeList.ToString(), className, methodName);
        return backDpeList;
    }

    public List<detailPerformanceEntity> getPerformanceForActivityFormTransaction(string StartDate, string EndDate, string ComID, string type)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'ComID' : " + ComID + " 'type' : " + type, className, methodName);
        List<indexBDdataEntity> analystList = MUSERhgDao.Instance.getEmpListForPerformance(StartDate, EndDate, common.Analyst, ComID, string.Empty);//<==========
        List<ditcodedescEntity> allDdeList = new List<ditcodedescEntity>();
        List<ditcodedescEntity> PITEMList = MITEMhgDao.Instance.getditcodedescEntityList("PITEM");
        List<ditcodedescEntity> tempDdeList = null;
        List<detailPerformanceEntity> backDpeList = new List<detailPerformanceEntity>();
        List<activityFormTransactionEntity> ameList = WFORMjoinWDFORMhgDao.Instance.getWFORMjoinWDFORMdata(StartDate, EndDate);
        List<activityFormTransactionEntity> filterAmeList = new List<activityFormTransactionEntity>();
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

        List<detailPerformanceEntity> dpeList = MTRATjoinMMBERjoinMUSERhgDao.Instance.getInternetBusinessPerformance(StartDate, EndDate, ComID, type);


        for (var i = 0; i < dpeList.Count; i++)
        {
            for (var z = 0; z < ameList.Count; z++)
            {
                if (dpeList[i].MTel1 == ameList[z].M_Tel)
                {
                    filterAmeList.Add(ameList[z]);
                }
            }
        }
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
            dpeList[k].T_PayMoneyDouble = common.calculateAccountMoneyForInternetBusinessPerformance(dpeList[k].Pay_Type, dpeList[k].T_Type, dpeList[k].Account_Money);
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
                dpeList[s].TransactionCount = ameList.Count.ToString();
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

        DateTime bdAddDate = DateTime.Now;
        DateTime bdAddDatePlusThirtyDay = DateTime.Now;
        DateTime ameAddDate = DateTime.Now;
        string one = "1";
        for (var i = 0; i < backDpeList.Count; i++)
        {
            for (var z = 0; z < filterAmeList.Count; z++)
            {
                bdAddDatePlusThirtyDay = Convert.ToDateTime((backDpeList[i].MMBERadd_Date)).AddDays(30);
                ameAddDate = (Convert.ToDateTime((filterAmeList[z].add_date)));
                bdAddDate = Convert.ToDateTime((backDpeList[i].MTRATadd_Date));

                if (ameAddDate <= bdAddDate && (filterAmeList[z].P_id == backDpeList[i].MP || filterAmeList[z].P_id == "00000000") && filterAmeList[z].M_Tel == backDpeList[i].MTel1)
                {
                    backDpeList[i].showTag = one;
                }
                else if (ameAddDate >= bdAddDate && ameAddDate >= bdAddDatePlusThirtyDay && (filterAmeList[z].P_id == backDpeList[i].MP || filterAmeList[z].P_id == "00000000") && filterAmeList[z].M_Tel == backDpeList[i].MTel1)
                {
                    backDpeList[i].showTag = one;
                }

            }
        }
        log.endWrite("'backDpeList' : " + backDpeList.ToString(), className, methodName);
        return backDpeList;
    }

    public List<string> getTransactionCount(string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate, className, methodName);
        List<string> strList = new List<string>();
        strList.Add("nothing");
        List<activityFormTransactionEntity> afteList = WFORMjoinWDFORMhgDao.Instance.getWFORMjoinWDFORMdata(StartDate, EndDate);
        strList.Add(afteList.Count.ToString());
        List<midMNameEntity> midmneList = MMBERhgDao.Instance.getMMBERdata();
        strList.Add(midmneList.Count.ToString());
        List<activityMessageEntity> ameList = MFRRPhgDao.Instance.getMFRRPdata(StartDate, EndDate);
        strList.Add(ameList.Count.ToString());
        log.endWrite("'strList' : " + strList.ToString(), className, methodName);
        return strList;
    }

}