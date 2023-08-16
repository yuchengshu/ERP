using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.IO;

/// <summary>
/// AttendanceRecordService 的摘要描述
/// </summary>
public class AttendanceRecordService
{
    //引用時不用再NEW
    private static AttendanceRecordService _instance = new AttendanceRecordService();

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public static AttendanceRecordService Instance
    {
        get
        {
            return _instance;
        }
    }
    public AttendanceRecordService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<attendanceRecordEntity> getAttendanceRecord(string firstDay, string lastDay, string U_Num, string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'firstDay' : " + firstDay + "'lastDay' : " + lastDay + "'U_Num' : " + U_Num + "'U_MDEP' : " + U_MDEP, className, methodName);
        mcDataEntity userData = MUSERhgDao.Instance.getMCdata(U_Num);
        userData.SlimDate = common.split(userData.SlimDate, ' ', 0);
        bool leaveRecord = false;
        bool tempLateWorkTF = false;
        //取得出缺勤紀錄
        List<attendanceRecordEntity> areList = MREGThgDao.Instance.getAttendanceRecord(firstDay, lastDay, U_Num, userData.SlimDate, userData.LeaveDate);//<==========
        if (areList.Count != 0)
        {
            if (!common.isEmpty(userData.LeaveDate))
            {
                userData.LeaveDate = common.split(userData.LeaveDate, ' ', 0);
            }
            List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("MRGET");//<==========
            List<ditcodedescEntity> EXCUEddeList = MITEMhgDao.Instance.getditcodedescEntityList("EXCUE");//<==========

            //取得請假紀錄
            List<attendanceExRecordEntity> aereList = MEXCUhgDao.Instance.getAttendanceExRecord(firstDay, lastDay, U_Num);//<==========
            string year = firstDay.Split('/')[0];
            string month = firstDay.Split('/')[1];
            //取得各部門班表時間
            workTimeEntity wte = MCLAShgDao.Instance.getWorkTimeEntity(year, month);
            //取得個別部門上下班時間

  
            
            string[] inOutCompanyTimeArr = null;
            int lateForWorkCount = 0;
            for (var i = 0; i < areList.Count; i++)
            {
                if (areList[i].MR_Item != "0005")
                {
                    inOutCompanyTimeArr = common.getInOutCompanyTimeArr(areList[i].MR_Num, areList[i].MR_Mdep, areList[i].MR_Item, wte);
                    areList[i].inCompanyTime = inOutCompanyTimeArr[0];
                    areList[i].OutCompanyTime = inOutCompanyTimeArr[1];
                }
            }
            for (var i = 0; i < aereList.Count; i++)
            {
                for (var z = 0; z < areList.Count; z++)
                {
                    if (aereList[i].EX_SDate == areList[z].MR_Date)
                    {
                        aereList[i].inCompanyTime = areList[z].inCompanyTime;
                        aereList[i].OutCompanyTime = areList[z].OutCompanyTime;
                    }
                }
               
                for (var z = 0; z < EXCUEddeList.Count; z++)
                {
                    if (aereList[i].EX_Type == EXCUEddeList[z].ditcode)
                    {
                        aereList[i].EX_TypeName = EXCUEddeList[z].ddesc;
                    }
                }
            }
            List<attendanceExRecordEntity> aerePerDayList = null;
            if (U_MDEP != "0005")
            {
                //取得調整後的請假紀錄
                aerePerDayList = getAdjustAerePerDayList(aereList);
            }

     
            double lateHour = 0;
            DateTime dt = DateTime.Now;
            string thisYearStr = dt.Date.ToString().Split(' ')[0].Split('/')[0];
            string selectedYearStr = areList[0].MR_Date.Split('/')[0];
            string thisMonthStr = dt.Date.ToString().Split(' ')[0].Split('/')[1];
            string selectedMonthStr = areList[0].MR_Date.Split('/')[1];
            int nowDate = 0;
            if (thisMonthStr == selectedMonthStr && thisYearStr == selectedYearStr)
            {
                nowDate = int.Parse(dt.Date.ToString().Split(' ')[0].Split('/')[2]);
            }
            else
            {
                nowDate = DateTime.DaysInMonth(int.Parse(areList[0].MR_Date.Split('/')[0]), int.Parse(areList[0].MR_Date.Split('/')[1]));
            }

            int tempDateInt = 0;
            for (var i = 0; i < areList.Count; i++)
            {
                leaveRecord = false;
                for (var z = 0; z < aereList.Count; z++)
                {
                    if (areList[i].MR_Date == aereList[z].EX_SDate)
                    {
                        areList[i].EX_Day = aereList[z].EX_Day;
                    }
                }
                for (var z = 0; z < ddeList.Count; z++)
                {
                    if (areList[i].MR_Item == ddeList[z].ditcode)
                    {
                        areList[i].MR_ItemName = ddeList[z].ddesc;
                    }
                }
                if (areList[i].MR_Item != "0005")
                {
                    tempDateInt = int.Parse(areList[i].MR_Date.Split('/')[2]);
                    if (thisMonthStr != selectedMonthStr || (thisYearStr != selectedYearStr && thisMonthStr == selectedMonthStr))
                    {
                        tempDateInt = tempDateInt - 1;
                    }

                    if (tempDateInt < nowDate)
                    {
                        if (U_MDEP != "0005")
                        {
                            //判斷打卡時間是否有遲到或是曠職
                            tempLateWorkTF = lateWorkTF(areList[i].MR_RSTime, areList[i].MR_RETime, areList[i].inCompanyTime, areList[i].OutCompanyTime);
                            if (tempLateWorkTF)
                            {
                                lateHour = checkInOutTime(areList[i].MR_RSTime, areList[i].MR_RETime, areList[i].inCompanyTime, areList[i].OutCompanyTime);
                            }
                            else
                            {
                                lateHour = 0;
                            }
                            
                            areList[i].EX_Hour = lateHour;

                            //出勤異常
                            if (areList[i].EX_Hour > 0)
                            {
                                for (var z = 0; z < aerePerDayList.Count; z++)
                                {
                                    //是否當天有請假紀錄
                                    if (aerePerDayList[z].EX_SDate == areList[i].MR_Date)
                                    {
                                        leaveRecord = true;
                                        //請假時數大於曠職時數
                                        if (aerePerDayList[z].takeLeaveHour >= areList[i].EX_Hour)
                                        {
                                            if (areList[i].EX_Hour % 1 == 0.5)
                                            {
                                                if (areList[i].EX_Hour == 0.5)
                                                {
                                                    areList[i].EX_Status = "";
                                                    areList[i].EX_Hour = 1;
                                                    areList[i].takeLeaveTF = true;
                                                    areList[i].EX_Reason = aerePerDayList[z].EX_TypeName + " - " + aerePerDayList[z].takeLeaveHour + " 小時";
                                                }
                                                else
                                                {
                                                    areList[i].EX_Status = "";
                                                    areList[i].EX_Hour = (areList[i].EX_Hour / 1) + 1-0.5;
                                                    areList[i].takeLeaveTF = true;
                                                    areList[i].EX_Reason = aerePerDayList[z].EX_TypeName + " - " + aerePerDayList[z].takeLeaveHour + " 小時";
                                                }
                                            }
                                            else
                                            {
                                                areList[i].EX_Status = "";
                                                areList[i].takeLeaveTF = true;
                                                areList[i].EX_Reason = aerePerDayList[z].EX_TypeName + " - " + aerePerDayList[z].takeLeaveHour + " 小時";
                                            }

                                        }
                                        //請假時數小於曠職時數
                                        else
                                        {
                                            if (areList[i].EX_Hour % 1 == 0.5)
                                            {
                                                if (aerePerDayList[z].takeLeaveHour == (areList[i].EX_Hour-0.5))
                                                {
                                                    if (lateForWorkCount < 3)
                                                    {
                                                        lateForWorkCount += 1;
                                                        areList[i].EX_Hour = aerePerDayList[z].takeLeaveHour;
                                                        areList[i].EX_Status = "遲到" + " " + lateForWorkCount.ToString();
                                                        areList[i].EX_Reason = aerePerDayList[z].EX_TypeName + " - " + aerePerDayList[z].takeLeaveHour + " 小時";
                                                        areList[i].takeLeaveTF = true;
                                                    }
                                                    else
                                                    {
                                                        areList[i].EX_Hour = aerePerDayList[z].takeLeaveHour+1;
                                                        areList[i].EX_Status = "曠職";
                                                        areList[i].EX_Reason = aerePerDayList[z].EX_TypeName + " - " + aerePerDayList[z].takeLeaveHour + " 小時";
                                                    }
                                                    
                                                }
                                                else
                                                {
                                                    
                                                }
                                            }
                                            else
                                            {
                                                areList[i].EX_Status = "曠職";
                                                areList[i].EX_Reason = aerePerDayList[z].EX_TypeName + " - " + aerePerDayList[z].takeLeaveHour + " 小時";
                                            }
                                        }
                                    }
                                   
                                }
                                //無請假紀錄
                                if (!leaveRecord)
                                {
                                    log.debug2("'MR_Date' : " + areList[i].MR_Date + "'EX_Hour' : " + areList[i].EX_Hour, className, methodName);
                                    if (areList[i].EX_Hour % 1 == 0.5)
                                    {
                                        if (areList[i].EX_Hour == 0.5)
                                        {
                                            if (lateForWorkCount < 3)
                                            {
                                                lateForWorkCount += 1;
                                                areList[i].EX_Hour = 0;
                                                areList[i].EX_Status = "遲到" + " " + lateForWorkCount.ToString();
                                            }
                                            else
                                            {
                                                lateForWorkCount += 1;
                                                areList[i].EX_Hour = 1;
                                                areList[i].EX_Status = "遲到" + " " + lateForWorkCount.ToString();
                                            }
                                        }
                                        else
                                        {
                                            areList[i].EX_Hour = (areList[i].EX_Hour / 1) + 1;
                                            areList[i].EX_Status = "曠職";
                                        }
                                    }
                                    else
                                    {
                                        areList[i].EX_Status = "曠職";
                                    }
                                }
                                //屏除到職日
                                if (userData.SlimDate == areList[i].MR_Date)
                                {
                                    areList[i].EX_Hour = 0;
                                    areList[i].EX_Status = "";
                                    areList[i].EX_Reason = "到職日";
                                }
                            }
                        }
                    }
                }
            }
        }
        
        log.endWrite("'areList' : " + areList.ToString(), className, methodName);
        return areList;
    }

    public string offWork(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);

        string backStr = MREGThgDao.Instance.offWork(U_Num);//<==========

        log.endWrite("'backStr' : " + backStr, className, methodName);
        return backStr;
    }
    /// <summary>
    /// 計算打卡時間跟應到時間差了幾小時
    /// </summary>
    /// <param name="pTime"></param>
    /// <param name="cTime"></param>
    /// <param name="typeTime"></param>
    /// <returns></returns>
    private double getTimeDifferenceInHour(string pTime, string cTime, string typeTime)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'pTime' : " + pTime + "'cTime' : " + cTime + "'typeTime' : " + typeTime , className, methodName);
        double backHour = 0;
        double minDifference = 0;
        double pTimeMin = timeToMin(pTime);
        double cTimeMin = timeToMin(cTime);
    
        if (typeTime == "in")
        {
            minDifference = pTimeMin - cTimeMin;
        }
        else
        {
            minDifference = cTimeMin - pTimeMin;
        }

        double temp = 0;
        if (minDifference >= 30 && minDifference < 60)
        {
            backHour = 1;
        }
        else if (minDifference < 30 && minDifference > -1)
        {
            if (typeTime == "in")
            {
                backHour = 0.5;
            }
            else
            {
                if (minDifference == 0)
                {
                    backHour = 0;
                }
                else
                {
                    backHour = 1;
                }
                
            }
            
        }
        else if (minDifference > 60)
        {
            temp = (minDifference / 60);
            if ((minDifference % 60) > 0)
            {
                
                backHour = Math.Floor(temp + 1) ;
         
            }
            else
            {
                backHour = temp;
            }

            if (backHour > 4)
            {
                backHour = 4;
            }
        }
        else
        {
            backHour = 0;
        }
        log.endWrite("'backHour' : " + backHour.ToString(), className, methodName);
        return backHour;
    }
    
    /// <summary>
    /// 計算出缺勤狀況
    /// </summary>
    /// <param name="pInTime"></param>
    /// <param name="pOutTime"></param>
    /// <param name="cInTime"></param>
    /// <param name="cOutTime"></param>
    /// <returns></returns>
    private double checkInOutTime(string pInTime, string pOutTime, string cInTime, string cOutTime)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'pInTime' : " + pInTime + "'pOutTime' : " + pOutTime + "'cInTime' : " + cInTime + "'cOutTime' : " + cOutTime, className, methodName);
        
        //應到時間與打卡時間差
       double inTimeDifference = 0;
        //應下班時間與打卡時間差
        double outTimeDifference = 0;
        double backHour = 0;
        if (!common.isEmpty(pInTime) && !common.isEmpty(pOutTime))
        {
            inTimeDifference = getTimeDifferenceInHour(pInTime, cInTime, "in");
            outTimeDifference = getTimeDifferenceInHour(pOutTime, cOutTime, "out");
        }
        else
        {
            inTimeDifference = 4;
            outTimeDifference = 4;
        }
        backHour = outTimeDifference + inTimeDifference;
        log.endWrite("'backHour' : " + backHour, className, methodName);
        return backHour;
    }


    private List<attendanceExRecordEntity> getAdjustAerePerDayList(List<attendanceExRecordEntity> aereList)
    {
        attendanceExRecordEntity aere = null;
        string[] EX_SDateArr = null;
        string[] EX_EDateArr = null;
        int EX_EDateYearInt = 0;
        int EX_SDateYearInt = 0;
        int EX_EDateMonthInt = 0;
        int EX_SDateMonthInt = 0;
        int EX_EDateDayInt = 0;
        int EX_SDateDayInt = 0;
        double EX_Hour = 0;
        DateTime dt = DateTime.Now;
        int nowMonth = dt.Month;
       
        List<attendanceExRecordEntity> backList = new List<attendanceExRecordEntity>();
        for (var i = 0; i < aereList.Count; i++)
        {
            if (aereList[i].EX_Day > 0)
            {
                log.debug2("1", "", "");
                aereList[i].takeLeaveHour=(aereList[i].EX_Day * 8) + aereList[i].takeLeaveHour;
            }
            
            if (!common.isEmpty(aereList[i].EX_STime) && !common.isEmpty(aereList[i].EX_ETime))
            {
                log.debug2("2", "", "");
                EX_SDateArr = aereList[i].EX_SDate.Split('/');
                EX_EDateArr = aereList[i].EX_EDate.Split('/');
                EX_SDateYearInt = int.Parse(EX_SDateArr[0]);
                EX_SDateMonthInt = int.Parse(EX_SDateArr[1]);
                EX_SDateDayInt = int.Parse(EX_SDateArr[2]);
                EX_EDateYearInt = int.Parse(EX_EDateArr[0]);
                EX_EDateMonthInt = int.Parse(EX_EDateArr[1]);
                EX_EDateDayInt = int.Parse(EX_EDateArr[2]);

                //請假開始月份等於請假結束月份
                if (EX_SDateMonthInt == EX_EDateMonthInt)
                {
                    log.debug2("3", "", "");
                    //請假開始日與結束日不同天
                    if (aereList[i].EX_SDate != aereList[i].EX_EDate)
                    {
                        log.debug2("4", "", "");
                        for (var z = EX_SDateDayInt; z <= EX_EDateDayInt; z++)
                        {
                           
                            if (z == EX_SDateDayInt)
                            {
                                log.debug2("5", "", "");
                               
                                EX_Hour = getTimeDifferenceInHour(aereList[i].EX_STime, aereList[i].inCompanyTime, "in");
                                aere = new attendanceExRecordEntity();
                                EX_Hour = 8 - EX_Hour;
                                aere.takeLeaveHour = EX_Hour;
                                aere.EX_SDate = EX_SDateArr[0] + "/" + EX_SDateArr[1] + "/" + z.ToString();
                               
                            }
                            else if (z == EX_EDateDayInt)
                            {
                                log.debug2("6", "", "");
                                EX_Hour = getTimeDifferenceInHour(aereList[i].EX_ETime, aereList[i].OutCompanyTime, "out");
                                aere = new attendanceExRecordEntity();
                                EX_Hour = 8 - EX_Hour;
                                aere.takeLeaveHour = EX_Hour;
                                aere.EX_SDate = EX_SDateArr[0] + "/" + EX_SDateArr[1] + "/" + z.ToString();
                            }
                            else
                            {
                                log.debug2("7", "", "");
                                aere = new attendanceExRecordEntity();
                                aere.EX_SDate = EX_SDateArr[0] + "/" + EX_SDateArr[1] + "/" + z.ToString();
                                aere.takeLeaveHour = 8;
                            }
                            aere.EX_TypeName = aereList[i].EX_TypeName;
                            backList.Add(aere);
                        }
                    }
                    else
                    {
                        log.debug2("8", "", "");
                        backList.Add(aereList[i]);
                    }
                }
                //請假開始月份小於請假結束月份
                else if (EX_SDateMonthInt < nowMonth)
                {
                    log.debug2("9", "", "");
                    for (int z = 1; z <= EX_EDateDayInt; z++)
                    {
                        if (z == EX_EDateDayInt)
                        {
                            log.debug2("10", "", "");
                            EX_Hour = getTimeDifferenceInHour(aereList[i].EX_ETime, aereList[i].OutCompanyTime, "out");
                            aere = new attendanceExRecordEntity();
                            aere.takeLeaveHour = EX_Hour;
                            aere.EX_SDate = EX_SDateArr[0] + "/" + nowMonth.ToString() + "/" + z.ToString();
     
                        }
                        else
                        {
                            log.debug2("11", "", "");
                            aere = new attendanceExRecordEntity();
                            aere.takeLeaveHour = 8;
                            aere.EX_SDate = EX_SDateArr[0] + "/" + nowMonth.ToString() + "/" + z.ToString();
                           
                        }
                        aere.EX_TypeName = aereList[i].EX_TypeName;
                        backList.Add(aere);
                    }
                }
                //請假開始月份大於請假結束月份
                else if (nowMonth < EX_EDateMonthInt)
                {
                    log.debug2("12", "", "");
                    //計算這個月的最後一天
                    int thisMonthLastDay = DateTime.DaysInMonth(EX_SDateYearInt, EX_SDateMonthInt);

                    for (int z = EX_SDateDayInt; z <= thisMonthLastDay; z++)
                    {
                        if (z == EX_SDateDayInt)
                        {
                            log.debug2("13", "", "");
                            EX_Hour = getTimeDifferenceInHour(aereList[i].EX_STime, aereList[i].inCompanyTime, "in");
                            aere = new attendanceExRecordEntity();
                            aere.takeLeaveHour = EX_Hour;
                            aere.EX_SDate = EX_SDateArr[0] + "/" + nowMonth.ToString() + "/" + z.ToString();
                  
                        }
                        else
                        {
                            log.debug2("14", "", "");
                            aere = new attendanceExRecordEntity();
                            aere.takeLeaveHour = 8;
                            aere.EX_SDate = EX_SDateArr[0] + "/" + nowMonth.ToString() + "/" + z.ToString();
                            
                        }
                        aere.EX_TypeName = aereList[i].EX_TypeName;
                        backList.Add(aere);
                    }
                }
            }
            
        }
        return backList;
    }

    /// <summary>
    /// 將時間字串轉換成分鐘
    /// </summary>
    /// <param name="time"></param>
    /// <returns></returns>
    private int timeToMin(string time)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'time' : " + time, className, methodName);
        bool hasExist = time.Contains("午");
        int backMin = 0;
        string[] timeArr = null;
        if (hasExist)
        {
            int plus = 0;
            string[] timeAr = time.Split('-');
            string[] timeAr1Arr = timeAr[1].Split(':');
            if (timeAr[0] == "下午")
            {
                if (timeAr1Arr[0] != "12")
                {
                    plus = 12;
                }
               
            }
            else
            {
                plus = 0;
            }
            timeArr = timeAr[1].Split(':');
            backMin = (int.Parse(timeArr[0]) + plus) * 60 + int.Parse(timeArr[1]);
        }
        else
        {
            timeArr = time.Split(':');
            backMin = int.Parse(timeArr[0]) * 60 + int.Parse(timeArr[1]);
        }
        log.endWrite("'backMin' : " + backMin.ToString(), className, methodName);
        return backMin;
       
    }

    private bool lateWorkTF(string pInTime, string pOutTime, string cInTime, string cOutTime)
    {
        bool tf = true;
        if (common.isEmpty(pInTime) || common.isEmpty(pOutTime) || common.isEmpty(cInTime) || common.isEmpty(cOutTime))
        {

        }
        else
        {
            int pInTimeMin = timeToMin(pInTime);
            int pOutTimeMin = timeToMin(pOutTime);
            int cInTimeMin = timeToMin(cInTime);
            int cOutTimeMin = timeToMin(cOutTime);
            if (cInTimeMin > pInTimeMin && pOutTimeMin >= cOutTimeMin)
            {
                tf = false;
            }
        }
        
        return tf;
    }
}