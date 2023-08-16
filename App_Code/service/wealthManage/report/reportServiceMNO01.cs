using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// reportServiceMNO01 的摘要描述
/// </summary>
public class reportServiceMNO01
{
    //引用時不用再NEW
    private static reportServiceMNO01 _instance = new reportServiceMNO01();
    public static reportServiceMNO01 Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public reportServiceMNO01()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string getTodayPerformance(string today)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'today' : " + today, className, methodName);

        string backStr = string.Empty;
        List<AccountMoneyDataEntity> amdeList = MTRATjoinDTRAThgDao.Instance.getTodayPerformance(today);//<==========
        double backAccount_Money = 0;
        for (var i = 0; i < amdeList.Count; i++)
        {
            backAccount_Money += calculate(amdeList[i].Pay_Type, amdeList[i].Account_Money, amdeList[i].T_type);
        }
        backStr = backAccount_Money.ToString();

        log.endWrite("結果--'backStr' : " + backStr, className, methodName);
        return backStr;
    }
    
    public string getMonthPerformanceAims(string startDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'startDate' : " + startDate, className, methodName);
 
        string backStr = MUSERjoinMREGThgDao.Instance.getMonthPerformanceAims(startDate);//<==========

        log.endWrite("結果--'backStr' : " + backStr.ToString(), className, methodName);
        return backStr;
    }

    public string getMonthCost(string endDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'endDate' : " + endDate, className, methodName);


        string backStr = MCONThgDao.Instance.getMonthCost(endDate);//<==========
       

        log.endWrite("結果--'backStr' : " + backStr.ToString(), className, methodName);
        return backStr;
    }

    public string getMonthPerformance(string startDate, string endDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'startDate' : " + startDate + "'endDate' : " + endDate, className, methodName);

        string backStr = string.Empty;
        List<AccountMoneyDataEntity> amdeList = MTRATjoinDTRAThgDao.Instance.getMonthPerformance(startDate, endDate);//<==========
        double backAccount_Money = 0;
        for (var i = 0; i < amdeList.Count; i++)
        {
            backAccount_Money += calculate(amdeList[i].Pay_Type, amdeList[i].Account_Money, amdeList[i].T_type);
        }
        backStr = backAccount_Money.ToString();

        log.endWrite("結果--'backStr' : " + backStr.ToString(), className, methodName);
        return backStr;
    }
  
    public List<PerMonthRevenueEntity> getPerMonthRevenue()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'無'", className, methodName);

        string backStr = string.Empty;
        string endDateStr = cDateTime.getLastMonthFirstDate(0);
        string startDateStr = cDateTime.getLastMonthFirstDate(25);
        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("COMID");
        List<AccountMoneyDataEntity> amdeList = MTRATjoinDTRAThgDao.Instance.getPerMonthRevenue(startDateStr, endDateStr);//<==========
        List<nameAccountMoneyDataEntity> comidNAmdeList = new List<nameAccountMoneyDataEntity>();

        List<PerMonthRevenueEntity> pmreList = new List<PerMonthRevenueEntity>();
        PerMonthRevenueEntity pmre = null;
        MonthRevenueEntity mre = null;
        nameAccountMoneyDataEntity namde = null;
        nameAccountMoneyDataEntity Mnamde = null;
        for (var d = 0; d < ddeList.Count; d++)
        {
            if (ddeList[d].ditcode != "0000")
            {
                pmre = new PerMonthRevenueEntity();
                pmre.MCcom = ddeList[d].ditcode;
                pmre.MCcomName = ddeList[d].ddesc.Split('-')[1];
                pmre.mreList = new List<MonthRevenueEntity>();
                for (int lm = 25; lm > 0; lm--)
                {
                    mre = new MonthRevenueEntity();
                    mre.Month = cDateTime.getLastMonth(lm);
                    pmre.mreList.Add(mre);
                }
                pmreList.Add(pmre);

                namde = new nameAccountMoneyDataEntity();
                namde.code = ddeList[d].ditcode;
                namde.codeName = ddeList[d].ddesc.Split('-')[1];
                namde.nAmdeList = new List<nameAccountMoneyDataEntity>();
                for (int lm = 25; lm > 0; lm--)
                {
                    Mnamde = new nameAccountMoneyDataEntity();
                    Mnamde.codeName = cDateTime.getLastMonth(lm);
                    Mnamde.amdeList = new List<AccountMoneyDataEntity>();
                    namde.nAmdeList.Add(Mnamde);
                }
                comidNAmdeList.Add(namde);
            }
            if (d== (ddeList.Count-1))
            {
                pmre = new PerMonthRevenueEntity();
                pmre.MCcom = "total";
                pmre.MCcomName = "總業績";
                pmre.mreList = new List<MonthRevenueEntity>();
                for (int lm = 25; lm > 0; lm--)
                {
                    mre = new MonthRevenueEntity();
                    mre.Month = cDateTime.getLastMonth(lm);
                    pmre.mreList.Add(mre);
                }
                pmreList.Add(pmre);

                pmre = new PerMonthRevenueEntity();
                pmre.MCcom = "total";
                pmre.MCcomName = "YOY";
                pmre.mreList = new List<MonthRevenueEntity>();
                for (int lm = 25; lm > 0; lm--)
                {
                    mre = new MonthRevenueEntity();
                    mre.Month = cDateTime.getLastMonth(lm);
                    pmre.mreList.Add(mre);
                }
                pmreList.Add(pmre);

                namde = new nameAccountMoneyDataEntity();
                namde.code = "total";
                namde.codeName = "總業績";
                namde.nAmdeList = new List<nameAccountMoneyDataEntity>();
                for (int lm = 25; lm > 0; lm--)
                {
                    Mnamde = new nameAccountMoneyDataEntity();
                    Mnamde.codeName = cDateTime.getLastMonth(lm);
                    Mnamde.amdeList = new List<AccountMoneyDataEntity>();
                    namde.nAmdeList.Add(Mnamde);
                }
                comidNAmdeList.Add(namde);
                namde = new nameAccountMoneyDataEntity();
                namde.code = "total";
                namde.codeName = "YOY";
                namde.nAmdeList = new List<nameAccountMoneyDataEntity>();
                for (int lm = 25; lm > 0; lm--)
                {
                    Mnamde = new nameAccountMoneyDataEntity();
                    Mnamde.codeName = cDateTime.getLastMonth(lm);
                    Mnamde.amdeList = new List<AccountMoneyDataEntity>();
                    namde.nAmdeList.Add(Mnamde);
                }
                comidNAmdeList.Add(namde);
            }
        }

        for (var c = 0; c < comidNAmdeList.Count; c++)
        {
            for (var a = 0; a < amdeList.Count; a++)
            {
                if (comidNAmdeList[c].code =="total" || comidNAmdeList[c].code == amdeList[a].mc_com)
                {
                    for (var n = 0; n < comidNAmdeList[c].nAmdeList.Count; n++)
                    {
                        if (comidNAmdeList[c].nAmdeList[n].codeName == amdeList[a].T_AccountDate)
                        {
                            comidNAmdeList[c].nAmdeList[n].amdeList.Add(amdeList[a]);
                        }
                    }
                }
            }
        }
     
        for (var c = 0; c < comidNAmdeList.Count; c++)
        {
            for (var n = 0; n < comidNAmdeList[c].nAmdeList.Count; n++)
            {
                for (var a = 0; a < comidNAmdeList[c].nAmdeList[n].amdeList.Count; a++)
                {
                    comidNAmdeList[c].nAmdeList[n].backAccount_Money += calculateForPerMonthRevenue(comidNAmdeList[c].nAmdeList[n].amdeList[a].Pay_Type, comidNAmdeList[c].nAmdeList[n].amdeList[a].Account_Money, comidNAmdeList[c].nAmdeList[n].amdeList[a].T_type);
                }
            }
        }

        for (var c = 0; c < comidNAmdeList.Count; c++)
        {
            for (var p = 0; p < pmreList.Count; p++)
            {
                if (comidNAmdeList[c].code == pmreList[p].MCcom)
                {
                    for (var n = 0; n < comidNAmdeList[c].nAmdeList.Count; n++)
                    {
                        for (var m = 0; m < pmreList[p].mreList.Count; m++)
                        {
                            if (comidNAmdeList[c].nAmdeList[n].codeName == pmreList[p].mreList[m].Month)
                            {
                                pmreList[p].mreList[m].MonthRevenue = comidNAmdeList[c].nAmdeList[n].backAccount_Money;
                            }
                        }
                    }
                }
            }
        }

        for (var p = 0; p < pmreList.Count; p++)
        {
            if (pmreList[p].MCcomName == "YOY")
            {
                for (var m = 0; m < pmreList[p].mreList.Count; m++)
                {
                    if ( m== 24)
                    {
                        pmreList[p].mreList[m].MonthRevenue = pmreList[p].mreList[m].MonthRevenue - pmreList[p].mreList[(m - 12)].MonthRevenue;
                    }
                }
                for (var m = 0; m < pmreList[p].mreList.Count; m++)
                {
                    if (m >= 12 && m < 24)
                    {
                        pmreList[p].mreList[m].MonthRevenue = pmreList[p].mreList[m].MonthRevenue - pmreList[p].mreList[(m - 12)].MonthRevenue;
                    }
                }
                for (var m = 0; m < pmreList[p].mreList.Count; m++)
                {
                    if (m < 12)
                    {
                        pmreList[p].mreList[m].MonthRevenue = 0;
                    }
                }
            }
        }

        log.endWrite("結果--'pmreList' : " + pmreList.ToString(), className, methodName);
        return pmreList;
    }


    public List<List<string>> getPerMonthRevenueForDraw()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'無'", className, methodName);

        string backStr = string.Empty;
        string endDateStr = cDateTime.getLastMonthFirstDate(0);
        string startDateStr = cDateTime.getLastMonthFirstDate(25);

        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("COMID");
        List<AccountMoneyDataEntity> amdeList = MTRATjoinDTRAThgDao.Instance.getPerMonthRevenue(startDateStr, endDateStr);//<==========
        List<nameAccountMoneyDataEntity> comidNAmdeList = new List<nameAccountMoneyDataEntity>();

        List<PerMonthRevenueEntity> pmreList = new List<PerMonthRevenueEntity>();
        PerMonthRevenueEntity pmre = null;
        MonthRevenueEntity mre = null;
        nameAccountMoneyDataEntity namde = null;
        nameAccountMoneyDataEntity Mnamde = null;
        for (var d = 0; d < ddeList.Count; d++)
        {
            if (ddeList[d].ditcode != "0000")
            {
                pmre = new PerMonthRevenueEntity();
                pmre.MCcom = ddeList[d].ditcode;
                pmre.MCcomName = ddeList[d].ddesc.Split('-')[1];
                pmre.mreList = new List<MonthRevenueEntity>();
                for (int lm = 25; lm > 0; lm--)
                {
                    mre = new MonthRevenueEntity();
                    mre.Month = cDateTime.getLastMonth(lm);
                    log.debug2(mre.Month, "","");
                   pmre.mreList.Add(mre);
                }
                pmreList.Add(pmre);

                namde = new nameAccountMoneyDataEntity();
                namde.code = ddeList[d].ditcode;
                namde.codeName = ddeList[d].ddesc.Split('-')[1];
                namde.nAmdeList = new List<nameAccountMoneyDataEntity>();
                for (int lm = 25; lm > 0; lm--)
                {
                    Mnamde = new nameAccountMoneyDataEntity();
                    Mnamde.codeName = cDateTime.getLastMonth(lm);
                    Mnamde.amdeList = new List<AccountMoneyDataEntity>();
                    namde.nAmdeList.Add(Mnamde);
                }
                comidNAmdeList.Add(namde);
            }
            if (d == (ddeList.Count - 1))
            {
                pmre = new PerMonthRevenueEntity();
                pmre.MCcom = "total";
                pmre.MCcomName = "總業績";
                pmre.mreList = new List<MonthRevenueEntity>();
                for (int lm = 25; lm > 0; lm--)
                {
                    mre = new MonthRevenueEntity();
                    mre.Month = cDateTime.getLastMonth(lm);
                    pmre.mreList.Add(mre);
                }
                pmreList.Add(pmre);

                pmre = new PerMonthRevenueEntity();
                pmre.MCcom = "total";
                pmre.MCcomName = "YOY";
                pmre.mreList = new List<MonthRevenueEntity>();
                for (int lm = 25; lm > 0; lm--)
                {
                    mre = new MonthRevenueEntity();
                    mre.Month = cDateTime.getLastMonth(lm);
                    pmre.mreList.Add(mre);
                }
                pmreList.Add(pmre);

                namde = new nameAccountMoneyDataEntity();
                namde.code = "total";
                namde.codeName = "總業績";
                namde.nAmdeList = new List<nameAccountMoneyDataEntity>();
                for (int lm = 25; lm > 0; lm--)
                {
                    Mnamde = new nameAccountMoneyDataEntity();
                    Mnamde.codeName = cDateTime.getLastMonth(lm);
                    Mnamde.amdeList = new List<AccountMoneyDataEntity>();
                    namde.nAmdeList.Add(Mnamde);
                }
                comidNAmdeList.Add(namde);
                namde = new nameAccountMoneyDataEntity();
                namde.code = "total";
                namde.codeName = "YOY";
                namde.nAmdeList = new List<nameAccountMoneyDataEntity>();
                for (int lm = 25; lm > 0; lm--)
                {
                    Mnamde = new nameAccountMoneyDataEntity();
                    Mnamde.codeName = cDateTime.getLastMonth(lm);
                    Mnamde.amdeList = new List<AccountMoneyDataEntity>();
                    namde.nAmdeList.Add(Mnamde);
                }
                comidNAmdeList.Add(namde);
            }
        }

        for (var c = 0; c < comidNAmdeList.Count; c++)
        {
            for (var a = 0; a < amdeList.Count; a++)
            {
                if (comidNAmdeList[c].code == "total" || comidNAmdeList[c].code == amdeList[a].mc_com)
                {
                    for (var n = 0; n < comidNAmdeList[c].nAmdeList.Count; n++)
                    {
                        if (comidNAmdeList[c].nAmdeList[n].codeName == amdeList[a].T_AccountDate)
                        {
                            comidNAmdeList[c].nAmdeList[n].amdeList.Add(amdeList[a]);
                        }
                    }
                }
            }
        }

        for (var c = 0; c < comidNAmdeList.Count; c++)
        {
            for (var n = 0; n < comidNAmdeList[c].nAmdeList.Count; n++)
            {
                for (var a = 0; a < comidNAmdeList[c].nAmdeList[n].amdeList.Count; a++)
                {
                    comidNAmdeList[c].nAmdeList[n].backAccount_Money += calculateForPerMonthRevenue(comidNAmdeList[c].nAmdeList[n].amdeList[a].Pay_Type, comidNAmdeList[c].nAmdeList[n].amdeList[a].Account_Money, comidNAmdeList[c].nAmdeList[n].amdeList[a].T_type);
                }
            }
        }

        for (var c = 0; c < comidNAmdeList.Count; c++)
        {
            for (var p = 0; p < pmreList.Count; p++)
            {
                if (comidNAmdeList[c].code == pmreList[p].MCcom)
                {
                    for (var n = 0; n < comidNAmdeList[c].nAmdeList.Count; n++)
                    {
                        for (var m = 0; m < pmreList[p].mreList.Count; m++)
                        {
                            if (comidNAmdeList[c].nAmdeList[n].codeName == pmreList[p].mreList[m].Month)
                            {
                                pmreList[p].mreList[m].MonthRevenue = comidNAmdeList[c].nAmdeList[n].backAccount_Money;
                            }
                        }
                    }
                }
            }
        }

        for (var p = 0; p < pmreList.Count; p++)
        {
            if (pmreList[p].MCcomName == "YOY")
            {
                for (var m = 0; m < pmreList[p].mreList.Count; m++)
                {
                    if (m == 24)
                    {
                        pmreList[p].mreList[m].MonthRevenue = pmreList[p].mreList[m].MonthRevenue - pmreList[p].mreList[(m - 12)].MonthRevenue;
                    }
                }
                for (var m = 0; m < pmreList[p].mreList.Count; m++)
                {
                    if (m >= 12 && m < 24)
                    {
                        pmreList[p].mreList[m].MonthRevenue = pmreList[p].mreList[m].MonthRevenue - pmreList[p].mreList[(m - 12)].MonthRevenue;
                    }
                }
                for (var m = 0; m < pmreList[p].mreList.Count; m++)
                {
                    if (m < 12)
                    {
                        pmreList[p].mreList[m].MonthRevenue = 0;
                    }
                }
            }
        }
        List<List<string>> strListList = new List<List<string>>();
        List<string> strList = null;
        strList = new List<string>();
        strList.Add("年度");
        for (var p = 0; p < pmreList.Count; p++)
        {
            if (pmreList[p].MCcomName != "YOY")
            {
                strList.Add(pmreList[p].MCcomName);
            }
        }
        strListList.Add(strList);
        for (var s = 0; s < 24; s++)
        {
            strList = new List<string>();
            strList.Add(pmreList[0].mreList[s].Month);
            strListList.Add(strList);
        }

        
            for (var p = 0; p < pmreList.Count; p++)
            {
                if (pmreList[p].MCcomName != "YOY")
                {
                    for (var m = 0; m < pmreList[p].mreList.Count; m++)
                    {
                        for (var s = 1; s < strListList.Count; s++)
                        {
                            if (strListList[s][0] == pmreList[p].mreList[m].Month)
                            {
                                strListList[s].Add(pmreList[p].mreList[m].MonthRevenue.ToString());
                            }
                        }
                    }
                }
                
            }
        
        

        log.endWrite("結果--'strListList' : " + strListList.ToString(), className, methodName);
        return strListList;
    }


    
    public List<List<string>> getAnalystCPvalue()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'無'", className, methodName);

        List<AnalystCPvalueEntity> aCPveList = new List<AnalystCPvalueEntity>();
        AnalystCPvalueEntity aCPve = null;
        List<indexBDdataEntity> ibddeList = MUSERhgDao.Instance.getAnalystList(string.Empty);
        for (var i = 0; i < ibddeList.Count; i++)
        {
            aCPve = new AnalystCPvalueEntity();
            aCPve.MP = ibddeList[i].U_Num;
            aCPve.MPname = ibddeList[i].empName;
            aCPveList.Add(aCPve);
        }
        string startDate = cDateTime.getLastMonthFirstDate(0);
        string endDate = cDateTime.getLastMonthFirstDate(-1);
        //計算收入
        List<AccountMoneyDataEntity> amdeList = MTRATjoinDTRAThgDao.Instance.getAnalystPerformanceForCP(startDate, endDate);
        for (var a = 0; a < amdeList.Count; a++)
        {
            for (var ac = 0; ac < aCPveList.Count; ac++)
            {
                if (amdeList[a].MP == aCPveList[ac].MP)
                {
                    aCPveList[ac].accountMoney += calculateForPerMonthRevenue(amdeList[a].Pay_Type, amdeList[a].Account_Money, amdeList[a].T_type);
                }
            }
        }
        //計算節目成本
        List<remindProgramContractMaturityEntity> rpcmeList = MCONThgDao.Instance.getProgramCost(startDate);
        string[] mpArr = null;
        string nameStr = string.Empty;
        for (var a = 0; a < rpcmeList.Count; a++)
        {
            for (var ac = 0; ac < aCPveList.Count; ac++)
            {
                nameStr = rpcmeList[a].CN_Teacher;
                if (nameStr.IndexOf(",") > -1)
                {
                    mpArr = nameStr.Split(',');
                }
                else
                {
                    mpArr = new string[1]; 
                    mpArr[0] = nameStr;
                 }
                for (var r = 0; r < mpArr.Length; r++)
                {
                    if (mpArr[r] == aCPveList[ac].MP)
                    {
                        if (mpArr.Length == 1)
                        {
                            aCPveList[ac].programCost += double.Parse(rpcmeList[a].CN_MPrice);
                        }
                        else
                        {
                            aCPveList[ac].programCost += (double.Parse(rpcmeList[a].CN_MPrice)/2);
                        }
                    }
                }
            }
        }
        List<List<string>> strListList = new List<List<string>>();
        List<string> strList = null;
        strList = new List<string>();
        strList.Add("分析師");
        strList.Add("個人營收(萬)");
        strList.Add("節目成本(萬)");
        strListList.Add(strList);
        for (var ac = 0; ac < aCPveList.Count; ac++)
        {
            strList = new List<string>();
            strList.Add(aCPveList[ac].MPname);
            strList.Add(aCPveList[ac].accountMoney.ToString());
            strList.Add(aCPveList[ac].programCost.ToString());
            strListList.Add(strList);
        }
        log.endWrite("結果--'strListList' : " + strListList.ToString(), className, methodName);
        return strListList;
    }

    public List<DepRevenueEntity> getDepRevenue()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'無':", className, methodName);

        List<DepRevenueEntity> dreList = new List<DepRevenueEntity>();
        DepRevenueEntity dre = null;
        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("COMID");
        MpRevenueEntity mre = null;
        for (var d = 0; d < ddeList.Count; d++)
        {
            if (ddeList[d].ditcode != "0000")
            {
                dre = new DepRevenueEntity();
                dre.ComID = ddeList[d].ditcode;
                dre.ComIDname = common.getComIDfullName(ddeList[d].ditcode);
                dre.mreList = new List<MpRevenueEntity>();
                dreList.Add(dre);
            }
        }

        string startDate = cDateTime.getLastMonthFirstDate(0);
        string endDate = cDateTime.getLastMonthFirstDate(-1);
        List<indexBDdataEntity> ibddeList = MUSERhgDao.Instance.getAnalystListForDate(startDate,endDate);

        for (var d = 0; d < dreList.Count; d++)
        {
            for (var i = 0; i < ibddeList.Count; i++)
            {
                if (dreList[d].ComID == ibddeList[i].ComID)
                {
                    mre = new MpRevenueEntity();
                    mre.MP = ibddeList[i].U_Num;
                    mre.MPname = ibddeList[i].empName;
                    dreList[d].mreList.Add(mre);
                }
            }

        }
        
        //1計算月績效
        //1-1計算分析師月收入
        List<AccountMoneyDataEntity> amdeList = MTRATjoinDTRAThgDao.Instance.getAnalystPerformanceForCP(startDate, endDate);
        for (var a = 0; a < amdeList.Count; a++)
        {
            for (var d = 0; d < dreList.Count; d++)
            {
                for (var dm = 0; dm < dreList[d].mreList.Count; dm++)
                {
                    if (amdeList[a].MP == dreList[d].mreList[dm].MP)
                    {
                        dreList[d].mreList[dm].Revenue += calculate(amdeList[a].Pay_Type, amdeList[a].Account_Money, amdeList[a].T_type);
                    }
                }
            }
        }
        //1-2計算分析師節目月成本
        List<remindProgramContractMaturityEntity> rpcmeList = MCONThgDao.Instance.getProgramCost(startDate);
        string[] mpArr = null;
        string nameStr = string.Empty;
        for (var a = 0; a < rpcmeList.Count; a++)
        {
            for (var d = 0; d < dreList.Count; d++)
            {
                for (var dm = 0; dm < dreList[d].mreList.Count; dm++)
                {
                    nameStr = rpcmeList[a].CN_Teacher;
                    if (nameStr.IndexOf(",") > -1)
                    {
                        mpArr = nameStr.Split(',');
                    }
                    else
                    {
                        mpArr = new string[1];
                        mpArr[0] = nameStr;
                    }
                    for (var r = 0; r < mpArr.Length; r++)
                    {
                        if (mpArr[r] == dreList[d].mreList[dm].MP)
                        {
                            if (mpArr.Length == 1)
                            {
                                dreList[d].mreList[dm].Cost += double.Parse(rpcmeList[a].CN_MPrice);
                            }
                            else
                            {
                                dreList[d].mreList[dm].Cost += (double.Parse(rpcmeList[a].CN_MPrice) / 2);
                            }
                        }
                    }
                }
            }
        }
        //1-3計算部門月績效
        for (var d = 0; d < dreList.Count; d++)
        {
            for (var dm = 0; dm < dreList[d].mreList.Count; dm++)
            {
                dreList[d].monthRevenue += dreList[d].mreList[dm].Revenue;
                dreList[d].monthCost += dreList[d].mreList[dm].Cost;
            }
            //計算月目標
            dreList[d].RevenueAim = double.Parse(MUSERjoinMREGThgDao.Instance.getMonthPerformanceAimsByComID(startDate, dreList[d].ComID));
            if (dreList[d].RevenueAim != 0 && dreList[d].monthRevenue != 0)
            {
                dreList[d].RevenueAimRate = dreList[d].monthRevenue / dreList[d].RevenueAim;
            }
            else
            {
                dreList[d].RevenueAimRate = 0;
            }
            
        }
        //2計算日績效
        string startDateD = cDateTime.getAddDayDate(0);
        string endDateD = cDateTime.getAddDayDate(1);
        //2-1計算部門日收入
        amdeList = MTRATjoinDTRAThgDao.Instance.getAnalystPerformanceForCP(startDateD, endDateD);
        for (var a = 0; a < amdeList.Count; a++)
        {
            for (var d = 0; d < dreList.Count; d++)
            {
                if (amdeList[a].mc_com == dreList[d].ComID)
                {
                    dreList[d].dayRevenue += calculate(amdeList[a].Pay_Type, amdeList[a].Account_Money, amdeList[a].T_type);
                }
            }
        }
        //2-2計算部門日收入
        rpcmeList = MCONThgDao.Instance.getProgramCost(startDateD);
        mpArr = null;
        nameStr = string.Empty;
        for (var a = 0; a < rpcmeList.Count; a++)
        {
            for (var d = 0; d < dreList.Count; d++)
            {
                for (var dm = 0; dm < dreList[d].mreList.Count; dm++)
                {
                    nameStr = rpcmeList[a].CN_Teacher;
                    if (nameStr.IndexOf(",") > -1)
                    {
                        mpArr = nameStr.Split(',');
                    }
                    else
                    {
                        mpArr = new string[1];
                        mpArr[0] = nameStr;
                    }
                    for (var r = 0; r < mpArr.Length; r++)
                    {
                        if (mpArr[r] == dreList[d].mreList[dm].MP)
                        {
                            if (mpArr.Length == 1)
                            {
                                dreList[d].dayCost += double.Parse(rpcmeList[a].CN_MPrice);
                            }
                            else
                            {
                                dreList[d].dayCost += (double.Parse(rpcmeList[a].CN_MPrice) / 2);
                            }
                        }
                    }
                }
            }
        }
        log.endWrite("結果--'dreList' : " + dreList.ToString(), className, methodName);
        return dreList;
    }

    public List<List<List<string>>> getRevenueAimRateDetail(string ComID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("帶入參數--'ComID':" + ComID, className, methodName);

        List<List<List<string>>> strListListList = new List<List<List<string>>>();
        string startDate = cDateTime.getLastMonthFirstDate(0);
        string endDate = cDateTime.getLastMonthFirstDate(-1);
        List<indexBDdataEntity> AnalystList = MUSERhgDao.Instance.getAnalystListByDateAndComID(startDate, endDate, ComID);
        List<indexBDdataEntity> McList = null;
        List<List<string>> trListList = null;
        List<string> thStrList = null;
        List<string> tbList = null;
        
        List<DEPARentity> depList = common.getDeplist(ComID);
        for (var d = 0; d < depList.Count; d++)
        {
            //製作表頭
            trListList = new List<List<string>>();
            thStrList = new List<string>();
            thStrList.Add(depList[d].DEPARname);
            for (var i = 0; i < AnalystList.Count; i++)
            {
                thStrList.Add(AnalystList[i].U_Num);
            }
            thStrList.Add("合計");
            thStrList.Add("應達");
            thStrList.Add("未達");
            thStrList.Add("達成率");
            trListList.Add(thStrList);
            //製作表內容
            McList = MUSERhgDao.Instance.getMcListByDateAndComIDAndDep(startDate, endDate, ComID, depList[d].DEPAR);
            for (var m = 0; m < McList.Count; m++)
            {
                tbList = new List<string>();
                tbList.Add(McList[m].U_Num);
                for (var th = 0; th < (thStrList.Count-1); th++)
                {
                    tbList.Add("");
                }
                trListList.Add(tbList);
            }
            tbList = new List<string>();
            tbList.Add("合計");
            for (var th = 0; th < (thStrList.Count - 1); th++)
            {
                tbList.Add("");
            }
            trListList.Add(tbList);
            tbList = new List<string>();
            tbList.Add("營運總合計");
            for (var th = 0; th < (thStrList.Count - 1); th++)
            {
                tbList.Add("");
            }
            trListList.Add(tbList);
        }
        
        log.endWrite("結果--'strListListList' : " + strListListList.ToString(), className, methodName);
        return strListListList;
    }

    private double calculate(string Pay_Type, string Account_Money,string T_type)
    {
        double backAccount_Money = 0;
        if (Pay_Type == "0002" || Pay_Type == "0007" || Pay_Type == "0008" || Pay_Type == "0012")
        {
            backAccount_Money += (double.Parse(Account_Money) * 0.98);
        }
        else if (Pay_Type == "0006" || Pay_Type == "0009" || Pay_Type == "0010")
        {
            if (T_type == "0003")
            {
                backAccount_Money += (double.Parse(Account_Money) - 10);
            }
            else
            {
                backAccount_Money += (double.Parse(Account_Money) - 20);
            }
        }
        else
        {
            backAccount_Money += double.Parse(Account_Money);
        }

        return backAccount_Money;
   }



    private double calculateForPerMonthRevenue(string Pay_Type, string Account_Money, string T_type)
    {
        double backAccount_Money = 0;
        if (Pay_Type == "0002" || Pay_Type == "0007")
        {
            backAccount_Money += (double.Parse(Account_Money) * 0.98);
        }
        else if (Pay_Type == "0006")
        {
            if (T_type == "0003")
            {
                backAccount_Money += (double.Parse(Account_Money) - 10);
            }
            else
            {
                backAccount_Money += (double.Parse(Account_Money) - 20);
            }
        }
        else
        {
            backAccount_Money += double.Parse(Account_Money);
        }

        return backAccount_Money;
    }

}