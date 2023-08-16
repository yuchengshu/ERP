using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Collections;

/// <summary>
/// reportServiceMVMEB07 的摘要描述
/// </summary>
public class reportServiceMVMEB07
{
    //引用時不用再NEW
    private static reportServiceMVMEB07 _instance = new reportServiceMVMEB07();
    public static reportServiceMVMEB07 Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public reportServiceMVMEB07()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<analystSinglePerformanceEntity> getAnalystSinglePerformance(string StartDate, string EndDate, string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'MP' : " + MP , className, methodName);

        List<analystSinglePerformanceEntity>  aspeList = MTRATjoinMMBERhgDao.Instance.getAnalystSinglePerformance(StartDate, EndDate, MP, string.Empty, string.Empty);

        log.endWrite("'aspeList' : " + aspeList.ToString(), className, methodName);
        return aspeList;
    }
}