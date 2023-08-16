using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// envelopePrintWorkService 的摘要描述
/// </summary>
public class envelopePrintWorkService
{
    //引用時不用再NEW
    private static envelopePrintWorkService _instance = new envelopePrintWorkService();
    public static envelopePrintWorkService Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public envelopePrintWorkService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<string> getPrintData(string M_Num, string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_Num' :" + M_Num + "'StartDate' :" + StartDate + "'EndDate' :" + EndDate, className, methodName);

        List<string> strList = MTRATjoinMMBERhgDao.Instance.getPrintData(M_Num, StartDate, EndDate);//<==========

        log.endWrite("'strList' :" + strList.ToString(), className, methodName);
        return strList;
    }


}