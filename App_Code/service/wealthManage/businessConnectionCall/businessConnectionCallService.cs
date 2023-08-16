using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// businessConnectionCallService 的摘要描述
/// </summary>
public class businessConnectionCallService
{
    //引用時不用再NEW
    private static businessConnectionCallService _instance = new businessConnectionCallService();
    public static businessConnectionCallService Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public businessConnectionCallService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<nextMonthSoonFallDueMemberEntity> getNextMonthSoonFallDueMember(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);
        string start = DateTime.Now.ToShortDateString();
        string end = DateTime.Now.AddDays(30).ToShortDateString();
        List<nextMonthSoonFallDueMemberEntity> nmsfdmeList = MTRATjoinMMBERhgDao.Instance.getNextMonthSoonFallDueMember(U_Num, start, end);//<==========

        List<ditcodedescEntity> ddeList = null;
        
        for (var i = 0; i < nmsfdmeList.Count; i++)
        {
            ddeList = MITEMhgDao.Instance.getditcodedescEntityList(nmsfdmeList[i].MP);//<====

            for (var k = 0; k < ddeList.Count; k++)
            {
                if (nmsfdmeList[i].T_Item == ddeList[k].ditcode)
                {
                    nmsfdmeList[i].T_ItemName = ddeList[k].ddesc;
                }
            }
           
           
        }
        log.endWrite("'nmsfdmeList' : " + nmsfdmeList.ToString(), className, methodName);
        return nmsfdmeList;
    }

    public List<customerDataEntity> getCustomerInTheLastOneMonth(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);
        string dateStr = DateTime.Now.AddDays(-30).ToShortDateString();
        List<customerDataEntity> cdeList = MMBERhgDao.Instance.getCustomerInTheLastOneMonth(U_Num, dateStr);//<==========

        log.endWrite("'cdeList' : " + cdeList.ToString(), className, methodName);
        return cdeList;
    }

    public List<customerDataEntity> getExpiredCustomer(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);
        string before3Month = DateTime.Now.AddDays(-90).ToShortDateString();
        string today = DateTime.Now.ToShortDateString();
        string after3Month = DateTime.Now.AddDays(30).ToShortDateString();

        List<customerDataEntity> cdeList = MTRATjoinMMBERhgDao.Instance.getExpiredCustomer(U_Num, before3Month, today, after3Month);//<==========

        log.endWrite("'cdeList' : " + cdeList.ToString(), className, methodName);
        return cdeList;
    }



    public List<customerDataEntity> getBirthDayCustomer(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);

        List<customerDataEntity> cdeList = MMBERhgDao.Instance.getBirthDayCustomer(U_Num);//<==========

        log.endWrite("'cdeList' : " + cdeList.ToString(), className, methodName);
        return cdeList;
    }

}