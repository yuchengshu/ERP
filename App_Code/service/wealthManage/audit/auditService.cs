using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Collections;

/// <summary>
/// auditService 的摘要描述
/// </summary>
public class auditService
{
    //引用時不用再NEW
    private static auditService _instance = new auditService();
    public static auditService Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public auditService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<reportTabEntity> getAuditList(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num : '" + U_Num, className, methodName);

        List<reportTabEntity> rteList = MRMAPjoinMREPOhgDao.Instance.getAuditList(U_Num);//<====

        log.endWrite("'rteList' : " + rteList.ToString(), className, methodName);
        return rteList;
    }
}