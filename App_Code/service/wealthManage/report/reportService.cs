using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Collections;

/// <summary>
/// reportService 的摘要描述
/// </summary>
public class reportService
{
    //引用時不用再NEW
    private static reportService _instance = new reportService();
    public static reportService Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public reportService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //設定報表權限為可用
    public int setReportRight(string item)
    {
        return 0;
    }

    public List<reportTabEntity> getReportList(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num : '" + U_Num, className, methodName);

        List<reportTabEntity> rteList = MRMAPjoinMREPOhgDao.Instance.getReportList(U_Num);//<====

        log.endWrite("'rteList' : "+rteList.ToString(), className, methodName);
        return rteList;
    }

   
}