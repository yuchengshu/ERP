using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Collections;

/// <summary>
/// reportServiceMVMEB06 的摘要描述
/// </summary>
public class reportServiceMVMEB06
{
    //引用時不用再NEW
    private static reportServiceMVMEB06 _instance = new reportServiceMVMEB06();
    public static reportServiceMVMEB06 Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public reportServiceMVMEB06()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<memberSessionStatusEntity> getMemberSessionStatus(getMemberSessionStatusParamEntity gmsspe)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'gmsspe' : " + gmsspe.ToString(), className, methodName);

        List<memberSessionStatusEntity> msseList = MTRATjoinMMBERhgDao.Instance.getMemberSessionStatus(gmsspe);
        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("all");
        DateTime dtStartDate = DateTime.Now;
        DateTime dtEndDate = DateTime.Now;
        DateTime dtNow = DateTime.Now;
        double L_PayMoney = 0;
        double totalL_PayMoney = 0;
        double totalT_PayMoney = 0;
        for (var i = 0; i < msseList.Count; i++)
        {
            msseList[i].T_AccountDate = msseList[i].T_AccountDate.Split(' ')[0];
            msseList[i].T_StartDate = msseList[i].T_StartDate.Split(' ')[0];
            msseList[i].T_EndDate = msseList[i].T_EndDate.Split(' ')[0];
            dtStartDate = Convert.ToDateTime(msseList[i].T_AccountDate);
            dtEndDate = Convert.ToDateTime(msseList[i].T_EndDate);
            msseList[i].Tdate = (common.getTwoDaysDifference(dtStartDate, dtEndDate)).ToString();
            msseList[i].Ldate = (common.getTwoDaysDifference(dtNow, dtEndDate.AddDays(1))).ToString();
           
            if (checkTPayMoneyTdateLdateTF(msseList[i].T_PayMoney, msseList[i].Tdate, msseList[i].Ldate))
            {
                msseList[i].Ldate = "0";
                msseList[i].L_PayMoney = "0";
            }
            else
            {
                L_PayMoney = ((double.Parse(msseList[i].T_PayMoney) / double.Parse(msseList[i].Tdate)) * double.Parse(msseList[i].Ldate));
                L_PayMoney = Math.Round(L_PayMoney, 0);
                msseList[i].L_PayMoney = L_PayMoney.ToString();
            }
            totalT_PayMoney += double.Parse(msseList[i].T_PayMoney);
            totalL_PayMoney += double.Parse(msseList[i].L_PayMoney);
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

        }
        memberSessionStatusEntity msse = new memberSessionStatusEntity();
        msse.totalL_PayMoney = totalL_PayMoney.ToString();
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