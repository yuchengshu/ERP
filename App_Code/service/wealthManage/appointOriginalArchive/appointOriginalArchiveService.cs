using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// appointOriginalArchiveService 的摘要描述
/// </summary>
public class appointOriginalArchiveService
{
    //引用時不用再NEW
    private static appointOriginalArchiveService _instance = new appointOriginalArchiveService();
    public static appointOriginalArchiveService Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public appointOriginalArchiveService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }


    public List<discountDataEntity> getDiscountData(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' :" + M_ID.ToString(), className, methodName);
        List<discountDataEntity> hRList = MTRAThgDao.Instance.getDiscountData(M_ID);
        return hRList;
    }


    //取得暫停恢復資料
    public List<haltResumeEntity> getCaseData(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' :" + M_ID.ToString(), className, methodName);
        List<haltResumeEntity> hRList = MTRAThgDao.Instance.getCaseData(M_ID);
        return hRList;
    }

    public List<appointOriginalArchiveWorkEntity> getAppointOriginalArchive(getOriginalArchiveParamEntity goape)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'goape' :" + goape.ToString(), className, methodName);

        List<appointOriginalArchiveWorkEntity> aoaweList = MTRATjoinMMBERhgDao.Instance.getAppointOriginalArchive(goape);//<==========
        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("all");
        List<ditcodedescEntity> COMIDList = MITEMhgDao.Instance.getditcodedescEntityList("COMID");

        for (var i = 0; i < aoaweList.Count; i++)
        {
            aoaweList[i].T_AccountDate = aoaweList[i].T_AccountDate.Split(' ')[0];
            if (aoaweList[i].Back_tag == "1")
            {
                aoaweList[i].Back_tagName = "歸";
            }
            else
            {
                aoaweList[i].Back_tagName = "<span class='colorRed'>未</span>";
            }
            for (var j = 0; j < ddeList.Count; j++)
            {
                if (aoaweList[i].MP == ddeList[j].mitcode)
                {
                    if (aoaweList[i].T_Item == ddeList[j].ditcode)
                    {
                        aoaweList[i].T_ItemName = ddeList[j].ddesc;
                        break;
                    }
                   
                }
            }
            for (var j = 0; j < COMIDList.Count; j++)
            {
                if (aoaweList[i].MC_COM == COMIDList[j].ditcode)
                {
                    aoaweList[i].MC_COMname = COMIDList[j].ddesc.Substring(3, 1);
                    break;
                }
            }
        }

        log.endWrite("'aoaweList' :" + aoaweList.ToString(), className, methodName);
        return aoaweList;
    }
    
    public string archive(string [] tidsArr, string [] Back_StatussArr)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'tidsArr' :" + tidsArr + "'Back_StatussArr' :" + Back_StatussArr , className, methodName);

        string backStr = string.Empty;
        for (var i = 0; i < tidsArr.Length; i++)
        {
            backStr = MTRAThgDao.Instance.archive(tidsArr[i], Back_StatussArr[i]);//<==========
        }

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

   
}