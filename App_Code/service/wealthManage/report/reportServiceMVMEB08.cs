using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Collections;

/// <summary>
/// reportServiceMVMEB08 的摘要描述
/// </summary>
public class reportServiceMVMEB08
{
    //引用時不用再NEW
    private static reportServiceMVMEB08 _instance = new reportServiceMVMEB08();
    public static reportServiceMVMEB08 Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public reportServiceMVMEB08()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //取得預收剩餘金額表
    public List<memberSessionStatusEntity> getAdvancesRemainingMoney(getAdvancesRemainingMoneyParamEntity garmpe)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'garmpe' : " + garmpe.ToString(), className, methodName);

        List<memberSessionStatusEntity> msseList = MTRATjoinMMBERhgDao.Instance.getAdvancesRemainingMoney(garmpe);
        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("all");
        DateTime dtStartDate = DateTime.Now;
        DateTime dtEndDate = DateTime.Now;
        DateTime dtNow = DateTime.Now;
        DateTime dtMoneyBasedate = DateTime.Now;
        string [] start2DateArr = garmpe.start2Date.Split('/');
        string start2Date = start2DateArr[2] + "-" + start2DateArr[0] + "-" + start2DateArr[1] + " 00:00:00.000";
        dtMoneyBasedate = Convert.ToDateTime(start2Date);
        double totalRemainingMoney = 0;
        double totalpercentageMoney = 0;
        double totalSixpointMethodMoney = 0;
        double totalT_PayMoney = 0;
        for (var i = 0; i < msseList.Count; i++)
        {
            msseList[i].T_AccountDate = msseList[i].T_AccountDate.Split(' ')[0];
            msseList[i].T_EndDate = msseList[i].T_EndDate.Split(' ')[0];
            msseList[i].T_StartDate = msseList[i].T_StartDate.Split(' ')[0];
            totalT_PayMoney += double.Parse(msseList[i].T_PayMoney);
            for (var j = 0; j < ddeList.Count; j++)
            {
                if (ddeList[j].mitcode == msseList[i].MP)
                {
                    if (ddeList[j].ditcode == msseList[i].T_Item)
                    {
                        msseList[i].T_ItemName = ddeList[j].ddesc;
                    }
                }
            }

            dtStartDate = Convert.ToDateTime(msseList[i].T_AccountDate);
            dtEndDate = Convert.ToDateTime(msseList[i].T_EndDate);
            msseList[i].Tdate = (common.getTwoDaysDifference(dtStartDate, dtEndDate)).ToString();
            msseList[i].Ldate = (common.getTwoDaysDifference(dtMoneyBasedate, dtEndDate)).ToString();
            msseList[i].Sdate = (common.getTwoDaysDifference(dtStartDate, dtMoneyBasedate)).ToString();
            if (checkTPayMoneyTdateLdateTF(msseList[i].T_PayMoney, msseList[i].Tdate, msseList[i].Ldate))
            {
                msseList[i].Ldate = "0";
                msseList[i].RemainingMoney = "0";
                msseList[i].percentageMoney = "0";
                msseList[i].SixpointMethodMoney = "0";
                msseList[i].percentage = "100";
            }
            else
            {
                double Tdate = double.Parse(msseList[i].Tdate);
                double Ldate = double.Parse(msseList[i].Ldate);
                double Sdate = double.Parse(msseList[i].Sdate);
                double T_PayMoney = double.Parse(msseList[i].T_PayMoney);
                double percentage = (Sdate / Tdate) * 100;
                double percentageMoney = 0;
                double SixpointMethodMoney = 0;
                double RemainingMoney = (T_PayMoney / Tdate) * Ldate;//剩餘金額
                totalRemainingMoney += RemainingMoney;
                msseList[i].percentage = Math.Ceiling(percentage).ToString();
                //1.剩餘金額
                msseList[i].RemainingMoney = Math.Round(RemainingMoney, 0).ToString();
                //2.百分比法
                if (Sdate <= 15)//'自 簽約之日起15日內者，扣除顧問費30%
                {
                    percentageMoney = T_PayMoney * 0.7;
                }
                else if (percentage<25)//'自簽約之日起未達會期四分之一者，扣除顧問費50%
                {
                    percentageMoney = T_PayMoney * 0.5;
                }
                else if (percentage >= 25 && percentage < 50)//'自簽約之日起，未達會期二分之一者，扣除顧問費60%
                {
                    percentageMoney = T_PayMoney * 0.4;
                }
                else if (percentage >= 50 && percentage < 75)//'自簽約之日起，未達會期二分之一者，扣除顧問費60%
                {
                    percentageMoney = T_PayMoney * 0.3;
                }
                else if (percentage >= 75)//'自簽約之日起，未達會期二分之一者，扣除顧問費60%
                {
                    percentageMoney = 0;
                }
                totalpercentageMoney += percentageMoney;
                msseList[i].percentageMoney = Math.Round(percentageMoney, 0).ToString();

                //3.六分法
                if (Tdate >= 90)//' 大於3個月會期
                {
                    if (Sdate < 30)//'自簽約之日起未達會期3/6者，扣除顧問費3/6
                    {
                        SixpointMethodMoney = (T_PayMoney / 6) * 3;
                    }
                    else if (Sdate >= 30 && Sdate < 50)//'自簽約之日起，未達會期4/6者，扣除顧問費4/6
                    {
                        SixpointMethodMoney = (T_PayMoney / 6) * 2;
                    }
                    else if (Sdate >= 50 && Sdate < 60)//'自簽約之日起，未達會期3/2者，扣除顧問費5/6
                    {
                        SixpointMethodMoney = (T_PayMoney / 6) * 1;
                    }
                    else if (Sdate >= 60 && Sdate <= 90)//'剩1/6者，顧問費是0  
                    {
                        SixpointMethodMoney = 0;
                    }
                   
                }
                else//' 小於3個月會期
                {
                    if (Sdate < 33)//'自簽約之日起未達會期1/3者，扣除顧問費1/3
                    {
                        SixpointMethodMoney = T_PayMoney * 0.66;
                    }
                    else if (Sdate >= 33 && Sdate < 66)//'自簽約之日起，未達會期3/2者，扣除顧問費5/6
                    {
                        SixpointMethodMoney = T_PayMoney * 0.33;
                    }
                    else if (Sdate >= 66 && Sdate <= 100)//'自簽約之日起，會期超過2/3者，顧問費為0
                    {
                        SixpointMethodMoney =0;
                    }
                }
                totalSixpointMethodMoney += SixpointMethodMoney;
                msseList[i].SixpointMethodMoney = Math.Round(SixpointMethodMoney, 0).ToString();

            }
        }
        memberSessionStatusEntity msse = new memberSessionStatusEntity();
        msse.totalRemainingMoney = Math.Round(totalRemainingMoney, 0).ToString();
        msse.totalpercentageMoney = Math.Round(totalpercentageMoney, 0).ToString();
        msse.totalSixpointMethodMoney = Math.Round(totalSixpointMethodMoney, 0).ToString();
        msse.totalT_PayMoney = totalT_PayMoney.ToString();
        msse.M_Name = "total";
        msse.totalCount = msseList.Count.ToString();
        msseList.Add(msse);

        log.endWrite("'msseList' : " + msseList.ToString(), className, methodName);
        return msseList;
    }
    private bool checkTPayMoneyTdateLdateTF(string T_PayMoney, string Tdate, string Ldate)
    {
        bool backTF = false;

        if (!common.isEmpty(T_PayMoney))
        {
            if (int.Parse(T_PayMoney) <= 0)
            {
                backTF = true;
            }
        }
        else
        {
            backTF = true;
        }

        if (common.isEmpty(Ldate))
        {
            backTF = true;
        }

        if (!common.isEmpty(Ldate))
        {
            if (int.Parse(Ldate) <= 0)
            {
                backTF = true;
            }
        }
        else
        {
            backTF = true;
        }


        return backTF;

    }

}