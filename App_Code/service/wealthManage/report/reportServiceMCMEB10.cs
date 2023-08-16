using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Collections;

/// <summary>
/// reportServiceMCMEB10 的摘要描述
/// </summary>
public class reportServiceMCMEB10
{
    //引用時不用再NEW
    private static reportServiceMCMEB10 _instance = new reportServiceMCMEB10();
    public static reportServiceMCMEB10 Instance
    {
        get
        {
            return _instance;
        }
    }
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public reportServiceMCMEB10()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<appointOriginalArchiveWorkEntity> getAppointOriginalArchive(getOriginalArchiveParamEntity goape)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'goape' : " + goape.ToString(), className, methodName);

        List<appointOriginalArchiveWorkEntity> aoaweList = MTRATjoinMMBERhgDao.Instance.getAppointOriginalArchive(goape);
        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("all");
        List<ditcodedescEntity> COMIDList = MITEMhgDao.Instance.getditcodedescEntityList("COMID");
        List<ditcodedescEntity> BKSTSList = MITEMhgDao.Instance.getditcodedescEntityList("BKSTS");
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
            if (aoaweList[i].Back_Status == "0")
            {
                aoaweList[i].Back_StatusName = "無";
            }
            else
            {
                for (var j = 0; j < BKSTSList.Count; j++)
                {
                    if (aoaweList[i].Back_Status == BKSTSList[j].ditcode)
                    {
                        aoaweList[i].Back_StatusName = BKSTSList[j].ddesc;
                        break;
                    }
                }
                
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
            aoaweList[i].differenceT_AccountDateAndNow  = common.getTwoDaysDifferenceBackDouble(common.stringToDateTime(aoaweList[i].T_AccountDate), DateTime.Now).ToString();
        }
        log.endWrite("'aoaweList' : " + aoaweList.ToString(), className, methodName);
        return aoaweList;
    }
}