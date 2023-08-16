using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MCMEB05Service 的摘要描述
/// </summary>
public class MCMEB05Service
{
    //引用時不用再NEW
    private static MCMEB05Service _instance = new MCMEB05Service();
    public static MCMEB05Service Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public MCMEB05Service()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<customerDataEntity> getERPeditRecord(string keyWord, string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'keyWord' : " + keyWord + "'StartDate' : " + StartDate + "'EndDate' : " + EndDate, className, methodName);

        List<customerDataEntity> cdeList = MMBERhgDao.Instance.getERPeditRecord(keyWord,StartDate,EndDate);//<======

        log.endWrite("'cdeList':" + cdeList.ToString(), className, methodName);
        return cdeList;
    }

    public List<editCustomerDataRecord> getCustomerDataEditRecord(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : " + M_ID, className, methodName);

        List<editCustomerDataRecord> ecdrList = MLOGBhgDao.Instance.getCustomerDataEditRecord(M_ID);//<==========
        mcDataEntity mde = null;
        for (var i = 0; i < ecdrList.Count; i++)
        {
            mde = MUSERhgDao.Instance.getMCdata(ecdrList[i].edit_user);
            ecdrList[i].edit_userName = mde.U_Name;
        }
        log.endWrite("'ecdrList' : " + ecdrList.ToString(), className, methodName);
        return ecdrList;
    }

    public List<editCustomerDataRecord> getTradeDataEditRecord(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : " + M_ID, className, methodName);

        List<editCustomerDataRecord> ecdrList = MLOGBhgDao.Instance.getTradeDataEditRecord(M_ID);//<==========
        mcDataEntity mde = null;
        for (var i = 0; i < ecdrList.Count; i++)
        {
            mde = MUSERhgDao.Instance.getMCdata(ecdrList[i].edit_user);
            ecdrList[i].edit_userName = mde.U_Name;
        }

        log.endWrite("'ecdrList' : " + ecdrList.ToString(), className, methodName);
        return ecdrList;
    }


}