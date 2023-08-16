using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MCMEB04Service 的摘要描述
/// </summary>
public class MCMEB04Service
{
    //引用時不用再NEW
    private static MCMEB04Service _instance = new MCMEB04Service();
    public static MCMEB04Service Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public MCMEB04Service()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<ditcodedescEntity> getDepList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getDepList();//<==========

        log.endWrite("'ddeList' : " + ddeList.ToString(), className, methodName);
        return ddeList;
    }

    public List<businessERPstatusEntity> getBusinessERPstatus(string StartDate, string EndDate, string U_MDEP, string User_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'StartDate' :" + StartDate + "'EndDate' :" + EndDate + "'U_MDEP' :" + U_MDEP + "'User_MDEP' :" + User_MDEP, className, methodName);

        List<businessERPstatusEntity> beseList = MUSERhgDao.Instance.getMCdataForBusinessERPstatus(U_MDEP, User_MDEP);//<==========
        List<string> strList = null;
        string traded = "traded";
        string nonTraded = "nonTraded";
        int totalTradedCustomerCount = 0;
        int totalTradedCustomerCountThisPeriod = 0;
        int totalNonTradedCustomerCount = 0;
        int totalNonTradedCustomerCountThisPeriod = 0;
        for (var i = 0; i < beseList.Count; i++)
        {
            strList = MMBERhgDao.Instance.getMCcustomerData(beseList[i].U_Num, traded,string.Empty,string.Empty);
            totalTradedCustomerCount += strList.Count;
            beseList[i].tradedCustomerCount = strList.Count.ToString();
            strList = null;
            strList = MTRATjoinDTRAThgDao.Instance.getMCcustomerData(beseList[i].U_Num, StartDate, EndDate);
            totalTradedCustomerCountThisPeriod += strList.Count;
            beseList[i].tradedCustomerCountThisPeriod = strList.Count.ToString();
            strList = null;
            strList = MMBERhgDao.Instance.getMCcustomerData(beseList[i].U_Num, nonTraded, string.Empty, string.Empty);
            totalNonTradedCustomerCount += strList.Count;
            beseList[i].NonTradedCustomerCount = strList.Count.ToString();
            strList = null;
            strList = MMBERhgDao.Instance.getMCcustomerData(beseList[i].U_Num, nonTraded, StartDate, EndDate);
            totalNonTradedCustomerCountThisPeriod += strList.Count;
            beseList[i].NonTradedCustomerCountThisPeriod = strList.Count.ToString();
        }
        businessERPstatusEntity bese = new businessERPstatusEntity();
        bese.U_Name = "合計";
        bese.tradedCustomerCount = totalTradedCustomerCount.ToString();
        bese.tradedCustomerCountThisPeriod = totalTradedCustomerCountThisPeriod.ToString();
        bese.NonTradedCustomerCount = totalNonTradedCustomerCount.ToString();
        bese.NonTradedCustomerCountThisPeriod = totalNonTradedCustomerCountThisPeriod.ToString();
        beseList.Add(bese);
        log.endWrite("'beseList' : " + beseList.ToString(), className, methodName);
        return beseList;
    }


}