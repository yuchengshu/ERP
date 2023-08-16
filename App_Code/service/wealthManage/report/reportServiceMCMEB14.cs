using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


/// <summary>
/// reportServiceMCMEB14 的摘要描述
/// </summary>
public class reportServiceMCMEB14
{
    //引用時不用再NEW
    private static reportServiceMCMEB14 _instance = new reportServiceMCMEB14();
    public static reportServiceMCMEB14 Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public reportServiceMCMEB14()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<WebsiteIPdetailEntity> getWebsiteIPdetail(string StartDate, string EndDate, string Report_Item)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'Report_Item' : " + Report_Item, className, methodName);

        List<WebsiteIPdetailEntity> wIPdeList = IPRecordHgDao.Instance.getWebsiteIPdetail(StartDate, EndDate, Report_Item);//<==========
        List<wAnalystEntity> waeList = wAnalystshgDao.Instance.getWAnalysts();
        for (var i = 0; i < wIPdeList.Count; i++)
        {
            for (var j = 0; j < waeList.Count; j++)
            {
                if (wIPdeList[i].P_id == waeList[j].T_id)
                {
                    wIPdeList[i].P_idName = waeList[j].Ch;
                }
            }
        }
       
        log.endWrite("'wIPdeList' : " + wIPdeList.ToString(), className, methodName);
        return wIPdeList;
    }

    public List<MemberBrowseDataEntity> getMemberBrowseData(string Detail)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'Detail' : " + Detail, className, methodName);

        List<MemberBrowseDataEntity> mbdeList = IPRecordHgDao.Instance.getMemberBrowseData(Detail);//<==========
        List<hgmemberEntity> heList = HGMEMBERhgDao.Instance.getAllMidandTel();
        List<customerDataEntity> cdeList = MMBERhgDao.Instance.getMCnameList();
        for (var i = 0; i < mbdeList.Count; i++)
        {
            for (var j = 0; j < heList.Count; j++)
            {
                if (mbdeList[i].M_id == heList[j].M_id)
                {
                    mbdeList[i].Tel = heList[j].Tel;
                }
            }
            for (var k = 0; k < cdeList.Count; k++)
            {
                if (mbdeList[i].Tel == cdeList[k].MTel1)
                {
                    mbdeList[i].MC_Name = cdeList[k].MC_Name;
                }
            }

        }
        log.endWrite("'mbdeList' : " + mbdeList.ToString(), className, methodName);
        return mbdeList;
    }

    public List<MemberBrowseDataEntity> getPersonBrowseData(string M_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'M_id' : " + M_id, className, methodName);

        List<MemberBrowseDataEntity> mbdeList = IPRecordHgDao.Instance.getPersonBrowseData(M_id);//<==========

        log.endWrite("'mbdeList' : " + mbdeList.ToString(), className, methodName);
        return mbdeList;
    }
}