using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MMBERService 的摘要描述
/// </summary>
public class MMBERService
{
    //引用時不用再NEW
    private static MMBERService _instance = new MMBERService();

    public static MMBERService Instance
    {
        get
        {
            return _instance;
        }
    }
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public MMBERService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string getID_tag(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' :" + M_ID.ToString(), className, methodName);
        string M_SD_tag = MMBERhgDao.Instance.getID_tag(M_ID);
        
        return M_SD_tag;
        
    }
    

    public string getKYC_tag(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' :" + M_ID.ToString(), className, methodName);
        string KYC_tag = MMBERhgDao.Instance.getKYC_tag(M_ID);

        return KYC_tag;
    }

    public string getCDD_tag(string M_ID) {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' :" + M_ID.ToString(), className, methodName);
        string CDD_tag = MMBERhgDao.Instance.getCDD_tag(M_ID);

        return CDD_tag;
    }
}