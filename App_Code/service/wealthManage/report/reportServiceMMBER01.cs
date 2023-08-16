using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// reportServiceMMBER01 的摘要描述
/// </summary>
public class reportServiceMMBER01
{
    //引用時不用再NEW
    private static reportServiceMMBER01 _instance = new reportServiceMMBER01();
    public static reportServiceMMBER01 Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public reportServiceMMBER01()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<EmpDataEntity> getEmpData(string StartDate, string EndDate, string dateType, string inoutService,string empName)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'dateType' : " + dateType + " 'inoutService' : " + inoutService + " 'empName' : " + empName, className, methodName);

        List<EmpDataEntity> edeList = MUSERhgDao.Instance.getEmpData(StartDate, EndDate, dateType, inoutService, empName);//<==========
        for (var i = 0; i < edeList.Count; i++)
        {
            edeList[i].BirthDayDate = edeList[i].BirthDayDate.Split(' ')[0];
            edeList[i].SlimDate = edeList[i].SlimDate.Split(' ')[0];
            if (!common.isEmpty(edeList[i].LeaveDate))
            {
                edeList[i].LeaveDate = edeList[i].LeaveDate.Split(' ')[0];
            }
        }

        EmpDataEntity ede = new EmpDataEntity();
        ede.U_Name = "total";
        edeList.Add(ede);
        log.endWrite("'edeList' : " + edeList.ToString(), className, methodName);
        return edeList;
    }
}