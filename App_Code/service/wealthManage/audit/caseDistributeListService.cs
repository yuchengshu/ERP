using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Collections;

/// <summary>
/// caseDistributeListService 的摘要描述
/// </summary>
public class caseDistributeListService
{
    //引用時不用再NEW
    private static caseDistributeListService _instance = new caseDistributeListService();
    public static caseDistributeListService Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public caseDistributeListService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<caseDistributeDataEntity> getCaseDistributeList(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);

        List<caseDistributeDataEntity> cddeList = MRYGCjoinMMBERhgDao.Instance.getCaseDistributeList(U_Num);//<==========
        List<DMBERentity> deList = null;
        string[] DayAgo = null;
        for (var i = 0; i < cddeList.Count; i++)
        {
            DayAgo = (DateTime.Now.AddDays(-15).ToString()).Split(' ');
            deList = DMBERhgDao.Instance.getDMBERdata(cddeList[i].M_ID, common.empty, DayAgo[0]);//<==========
            if (deList.Count != 0)
            {
                cddeList[i].DM_MC = deList[0].DM_MC;
                cddeList[i].DM_MC_Name = deList[0].DM_MC_Name;
                cddeList[i].DM_MarkTime = deList[0].DM_MarkTime;
            }
            
        }

        log.endWrite("'cddeList' : " + cddeList.ToString(), className, methodName);
        return cddeList;
    }
}