using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// reportServiceMMTEL01 的摘要描述
/// </summary>
public class reportServiceMMTEL01
{
    //引用時不用再NEW
    private static reportServiceMMTEL01 _instance = new reportServiceMMTEL01();
    public static reportServiceMMTEL01 Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public reportServiceMMTEL01()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<TelStatisticsEntity> getAnalyst(getAnalystParamEntity gape)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'gape' : " + gape.ToString(), className, methodName);

        List<TelStatisticsEntity> tseList = MUSERhgDao.Instance.getAnalyst(gape);//<==========
        TelStatisticsEntity tse = new TelStatisticsEntity();
        tse.U_Name = "合計";
        tseList.Add(tse);
        log.endWrite("'tseList' : " + tseList.ToString(), className, methodName);
        return tseList;
    }
    public List<TelStatisticsEntity> getProgram(getAnalystParamEntity gape)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'gape' : " + gape.ToString(), className, methodName);

        List<TelStatisticsEntity> tseList = MUSERhgDao.Instance.getAnalyst(gape);//<==========
        TelStatisticsEntity tse = new TelStatisticsEntity();
        tse.U_Name = "合計";
        tseList.Add(tse);
        List<ProgramEntity> peList = WProgramjoinWAnalystsHgDao.Instance.getProgram(gape);//<==========
        for (var i = 0; i < tseList.Count; i++)
        {
            for (var j = 0; j < peList.Count; j++)
            {
                if (tseList[i].peList == null)
                {
                    tseList[i].peList = new List<ProgramEntity>();
                }
                else
                {
                    if (tseList[i].U_Num == peList[j].U_num)
                    {
                        peList[j].P_Channel = peList[j].P_Channel.Substring(0, 2);
                        peList[j].P_Time = peList[j].P_Time.Split('-')[0];
                        tseList[i].peList.Add(peList[j]);
                    }
                }
            }
        }
        log.endWrite("'tseList' : " + tseList.ToString(), className, methodName);
        return tseList;
    }

   
    public List<totalTelStatisticsEntity> getTotalTelStatistics(getAnalystParamEntity gape)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'gape' : " + gape.ToString(), className, methodName);
    
        List<totalTelStatisticsEntity> ttseList = new List<totalTelStatisticsEntity>();
        int days = DateTime.DaysInMonth(int.Parse(gape.MR_DateY), int.Parse(gape.MR_DateM))+1;
        totalTelStatisticsEntity ttse = null;
        TelStatisticsEntity tse = null;
        List<TelStatisticsEntity> tseList = MUSERhgDao.Instance.getAnalyst(gape);//<==========
        tse = new TelStatisticsEntity();
        tse.U_Name = "合計";
        tseList.Add(tse);

        List<ProgramEntity> peList = WProgramjoinWAnalystsHgDao.Instance.getProgram(gape);//<==========
        List <MMTELdataEntity> mdeList = MMTELhgDao.Instance.getMMTELdata(gape);
        ProgramEntity pe = null;
       
        List<TelStatisticsEntity> newTseList = null;
        List<ProgramEntity> newPeList = null;
        totalTelStatisticsEntity tempTtse = null;
        string datestr = string.Empty;
        int week = 0;
        for (var d = 1; d < days; d++)
        {
            ttse = new totalTelStatisticsEntity();
            ttse.date = gape.MR_DateY + "/" + gape.MR_DateM + "/" + d.ToString();
            ttse.DayOfWeek = "("+cDateTime.daysToWeekday(gape.MR_DateY, gape.MR_DateM, d)+")";
            
            ttse.week = week;
            ttse.day = d.ToString();
            newTseList = new List<TelStatisticsEntity>();
            for (var t = 0; t < tseList.Count; t++)
            {
                newPeList = new List<ProgramEntity>();
                tse = new TelStatisticsEntity();
                if (tseList[t].U_Name != "合計")
                {
                    tse.U_Name = tseList[t].U_Name;
                    tse.U_Num = tseList[t].U_Num;
                    for (var p = 0; p < peList.Count; p++)
                    {
                        if (tseList[t].U_Num == peList[p].U_num)
                        {
                            pe = new ProgramEntity();
                            pe.P_Channel = peList[p].P_Channel.Substring(0, 2);
                            pe.P_Time = peList[p].P_Time.Split('-')[0];
                            pe.P_Date = peList[p].P_Date;
                            pe.P_ID = peList[p].P_ID;
                            pe.U_num = peList[p].U_num;
                            newPeList.Add(pe);
                        }
                    }
                }
                else
                {
                    tse.U_Name = tseList[t].U_Name;
                    pe = new ProgramEntity();
                    pe.P_Channel = "合計";
                    newPeList.Add(pe);
                }
                tse.peList = newPeList;
                newTseList.Add(tse);
            }
            ttse.tseList = newTseList;
            ttseList.Add(ttse);

            //製作周計算------start
            if (ttse.DayOfWeek == "(日)"||d==(days-1))
            {
                tempTtse = ttse;

                //製作周小計----start
                ttse = new totalTelStatisticsEntity();
                ttse.day = "周小計";
                ttse.week = week;
                /*if (tempTtse.DayOfWeek == "(日)")
                {
                    week += 1;
                }*/
                newTseList = new List<TelStatisticsEntity>();
                for (var t = 0; t < tseList.Count; t++)
                {
                    newPeList = new List<ProgramEntity>();
                    tse = new TelStatisticsEntity();
                    if (tseList[t].U_Name != "合計")
                    {
                        tse.U_Name = tseList[t].U_Name;
                        tse.U_Num = tseList[t].U_Num;
                        for (var p = 0; p < peList.Count; p++)
                        {
                            if (tseList[t].U_Num == peList[p].U_num)
                            {
                                pe = new ProgramEntity();
                                pe.P_Channel = peList[p].P_Channel.Substring(0, 2);
                                pe.P_Time = peList[p].P_Time.Split('-')[0];
                                pe.P_Date = peList[p].P_Date;
                                pe.P_ID = peList[p].P_ID;
                                pe.U_num = peList[p].U_num;
                                newPeList.Add(pe);
                            }
                        }
                    }
                    else
                    {
                        tse.U_Name = tseList[t].U_Name;
                        pe = new ProgramEntity();
                        pe.P_Channel = "合計";
                        newPeList.Add(pe);
                    }
                    tse.peList = newPeList;
                    newTseList.Add(tse);
                }
                ttse.tseList = newTseList;
                ttseList.Add(ttse);
                //製作周小計----end

                //製作周可key率----start
                ttse = new totalTelStatisticsEntity();
                ttse.day = "周可key率";
                ttse.week = week;
                if (tempTtse.DayOfWeek == "(日)")
                {
                    week += 1;
                }
                newTseList = new List<TelStatisticsEntity>();
                for (var t = 0; t < tseList.Count; t++)
                {
                    newPeList = new List<ProgramEntity>();
                    tse = new TelStatisticsEntity();
                    if (tseList[t].U_Name != "合計")
                    {
                        tse.U_Name = tseList[t].U_Name;
                        tse.U_Num = tseList[t].U_Num;
                        for (var p = 0; p < peList.Count; p++)
                        {
                            if (tseList[t].U_Num == peList[p].U_num)
                            {
                                pe = new ProgramEntity();
                                pe.P_Channel = peList[p].P_Channel.Substring(0, 2);
                                pe.P_Time = peList[p].P_Time.Split('-')[0];
                                pe.P_Date = peList[p].P_Date;
                                pe.P_ID = peList[p].P_ID;
                                pe.U_num = peList[p].U_num;
                                newPeList.Add(pe);
                            }
                        }
                    }
                    else
                    {
                        tse.U_Name = tseList[t].U_Name;
                        pe = new ProgramEntity();
                        pe.P_Channel = "合計";
                        newPeList.Add(pe);
                    }
                    tse.peList = newPeList;
                    newTseList.Add(tse);
                }
                ttse.tseList = newTseList;
                ttseList.Add(ttse);
                //製作周可key率----end
            }
            //製作周計算------end

            //製作月計算------start
            if (d == (days - 1))
            {
               

                //製作月小計----start
                ttse = new totalTelStatisticsEntity();
                ttse.day = "月小計";
                ttse.week = week;
  
                newTseList = new List<TelStatisticsEntity>();
                for (var t = 0; t < tseList.Count; t++)
                {
                    newPeList = new List<ProgramEntity>();
                    tse = new TelStatisticsEntity();
                    if (tseList[t].U_Name != "合計")
                    {
                        tse.U_Name = tseList[t].U_Name;
                        tse.U_Num = tseList[t].U_Num;
                        for (var p = 0; p < peList.Count; p++)
                        {
                            if (tseList[t].U_Num == peList[p].U_num)
                            {
                                pe = new ProgramEntity();
                                pe.P_Channel = peList[p].P_Channel.Substring(0, 2);
                                pe.P_Time = peList[p].P_Time.Split('-')[0];
                                pe.P_Date = peList[p].P_Date;
                                pe.P_ID = peList[p].P_ID;
                                pe.U_num = peList[p].U_num;
                                newPeList.Add(pe);
                            }
                        }
                    }
                    else
                    {
                        tse.U_Name = tseList[t].U_Name;
                        pe = new ProgramEntity();
                        pe.P_Channel = "合計";
                        newPeList.Add(pe);
                    }
                    tse.peList = newPeList;
                    newTseList.Add(tse);
                }
                ttse.tseList = newTseList;
                ttseList.Add(ttse);
                //製作月小計----end

                //製作月可key率----start
                ttse = new totalTelStatisticsEntity();
                ttse.day = "月可key率";
                ttse.week = week;
               
                newTseList = new List<TelStatisticsEntity>();
                for (var t = 0; t < tseList.Count; t++)
                {
                    newPeList = new List<ProgramEntity>();
                    tse = new TelStatisticsEntity();
                    if (tseList[t].U_Name != "合計")
                    {
                        tse.U_Name = tseList[t].U_Name;
                        tse.U_Num = tseList[t].U_Num;
                        for (var p = 0; p < peList.Count; p++)
                        {
                            if (tseList[t].U_Num == peList[p].U_num)
                            {
                                pe = new ProgramEntity();
                                pe.P_Channel = peList[p].P_Channel.Substring(0, 2);
                                pe.P_Time = peList[p].P_Time.Split('-')[0];
                                pe.P_Date = peList[p].P_Date;
                                pe.P_ID = peList[p].P_ID;
                                pe.U_num = peList[p].U_num;
                                newPeList.Add(pe);
                            }
                        }
                    }
                    else
                    {
                        tse.U_Name = tseList[t].U_Name;
                        pe = new ProgramEntity();
                        pe.P_Channel = "合計";
                        newPeList.Add(pe);
                    }
                    tse.peList = newPeList;
                    newTseList.Add(tse);
                }
                ttse.tseList = newTseList;
                ttseList.Add(ttse);
                //製作月可key率----end
            }
            //製作月計算------end


        }

        int dayTotalMT_Okey = 0;
        int dayTotalMT_Nkey = 0;
        int dayTotalMT_Tkey = 0;
        int MT_Okey = 0;
        int MT_Nkey = 0;
        int MT_Tkey = 0;

        //將每天的資料帶入---start
        for (var t = 0; t < ttseList.Count; t++)
        {
            for (var i = 0; i < ttseList[t].tseList.Count; i++)
            {
                for (var p = 0; p < ttseList[t].tseList[i].peList.Count; p++)
                {
                    
                    if (ttseList[t].tseList[i].U_Num == ttseList[t].tseList[i].peList[p].U_num)
                    {
                        if (ttseList[t].tseList[i].U_Name == "合計")
                        {
                            ttseList[t].tseList[i].peList[p].MT_Okey += dayTotalMT_Okey;
                            ttseList[t].tseList[i].peList[p].MT_Nkey += dayTotalMT_Nkey;
                            ttseList[t].tseList[i].peList[p].MT_Tkey += dayTotalMT_Tkey;
                        }
                        else
                        {
                            for (var s = 0; s < mdeList.Count; s++)
                            {
                                if (ttseList[t].tseList[i].peList[p].P_ID == mdeList[s].MT_Program)
                                {
                                    if (ttseList[t].date == mdeList[s].MT_Date.Split(' ')[0])
                                    {
                                        //log.debug2("date=" + ttseList[t].date + "U_Name=" + ttseList[t].tseList[i].U_Name + "節目=" + ttseList[t].tseList[i].peList[p].P_Channel + ttseList[t].tseList[i].peList[p].P_Time + "MT_Okey=" + ttseList[t].tseList[i].peList[p].MT_Okey + "MT_Nkey=" + ttseList[t].tseList[i].peList[p].MT_Nkey + "MT_Tkey=" + ttseList[t].tseList[i].peList[p].MT_Tkey, "", "");
                                        //log.debug2("t=" + t + "i=" + i + "p=" + p + "s=" + s, "", "");

                                        MT_Okey = int.Parse(mdeList[s].MT_Okey);
                                        MT_Nkey = int.Parse(mdeList[s].MT_Nkey);
                                        MT_Tkey = MT_Okey + MT_Nkey;
                                        ttseList[t].tseList[i].peList[p].MT_Okey += MT_Okey;
                                        ttseList[t].tseList[i].peList[p].MT_Nkey += MT_Nkey;
                                        ttseList[t].tseList[i].peList[p].MT_Tkey += MT_Tkey;

                                        dayTotalMT_Okey += MT_Okey;
                                        dayTotalMT_Nkey += MT_Nkey;
                                        dayTotalMT_Tkey += MT_Tkey;
                                        //log.debug2("MT_Okey=" + mdeList[s].MT_Okey + "MT_Nkey=" + mdeList[s].MT_Nkey, "", "");
                                        // log.debug2("date=" + ttseList[t].date + "U_Name=" + ttseList[t].tseList[i].U_Name + "P_ID=" + ttseList[t].tseList[i].peList[p].P_ID + "P_Channel=" + ttseList[t].tseList[i].peList[p].P_Channel + ttseList[t].tseList[i].peList[p].P_Time + "MT_Okey=" + ttseList[t].tseList[i].peList[p].MT_Okey + "MT_Nkey=" + ttseList[t].tseList[i].peList[p].MT_Nkey + "MT_Tkey=" + ttseList[t].tseList[i].peList[p].MT_Tkey, "", "");
                                    }
                                }
                            }
                        }
                         
                   }
                }
            }
            dayTotalMT_Okey = 0;
            dayTotalMT_Nkey = 0;
            dayTotalMT_Tkey = 0;
        }
        //將每天的資料帶入---end

        //計算每周資料
        List<totalTelStatisticsEntity> weekTtseList = new List<totalTelStatisticsEntity>();
        for (var t = 0; t < ttseList.Count; t++)
        {
            if (ttseList[t].day == "周小計")
            {
                weekTtseList.Add(ttseList[t]);
            }
        }
        for (var w = 0; w < weekTtseList.Count; w++)
        {
            for (var tt = 0; tt < ttseList.Count; tt++)
            {
                if (ttseList[tt].day != "周小計")
                {
                    if (w == ttseList[tt].week)
                {
                    for (var t = 0; t < ttseList[tt].tseList.Count; t++)
                    {
                        for (var p = 0; p < ttseList[tt].tseList[t].peList.Count; p++)
                        {
                            weekTtseList[w].tseList[t].peList[p].MT_Okey += ttseList[tt].tseList[t].peList[p].MT_Okey;
                            weekTtseList[w].tseList[t].peList[p].MT_Nkey += ttseList[tt].tseList[t].peList[p].MT_Nkey;
                            weekTtseList[w].tseList[t].peList[p].MT_Tkey += ttseList[tt].tseList[t].peList[p].MT_Tkey;
   
                        }
                    }
                }
            }
            }
        }

       
        for (var tt = 0; tt < ttseList.Count; tt++)
        {
            if (ttseList[tt].day == "周小計")
            {
                for (var w = 0; w < weekTtseList.Count; w++)
                {
                   
                    if (ttseList[tt].week == w)
                    {
                        ttseList[tt].tseList = weekTtseList[w].tseList;
                    }
                }
            }
            if (ttseList[tt].day == "周可key率")
            {
                for (var w = 0; w < weekTtseList.Count; w++)
                {

                    if (ttseList[tt].week == w)
                    {
                        ttseList[tt].tseList = weekTtseList[w].tseList;
                    }
                }
            }
        }

        //計算月資料
        List<totalTelStatisticsEntity> monthTtseList = new List<totalTelStatisticsEntity>();
        for (var t = 0; t < ttseList.Count; t++)
        {
            if (ttseList[t].day == "月小計")
            {
                monthTtseList.Add(ttseList[t]);
            }
           
        }
        for (var m = 0; m < monthTtseList.Count; m++)
        {
            for (var tt = 0; tt < weekTtseList.Count; tt++)
            {

                        for (var t = 0; t < weekTtseList[tt].tseList.Count; t++)
                        {
                            for (var p = 0; p < weekTtseList[tt].tseList[t].peList.Count; p++)
                            {
                        monthTtseList[m].tseList[t].peList[p].MT_Okey += weekTtseList[tt].tseList[t].peList[p].MT_Okey;
                        monthTtseList[m].tseList[t].peList[p].MT_Nkey += weekTtseList[tt].tseList[t].peList[p].MT_Nkey;
                        monthTtseList[m].tseList[t].peList[p].MT_Tkey += weekTtseList[tt].tseList[t].peList[p].MT_Tkey;

                            }
                        }
            }
        }
        for (var tt = 0; tt < ttseList.Count; tt++)
        {
            if (ttseList[tt].day == "月小計"|| ttseList[tt].day == "月可key率")
            {
                ttseList[tt].tseList = monthTtseList[0].tseList;
            }
        }



            log.endWrite("'ttseList' : " + ttseList.ToString(), className, methodName);
        return ttseList;
    }

}