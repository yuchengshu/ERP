using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// reportServiceMCMEB12 的摘要描述
/// </summary>
public class reportServiceMCMEB12
{
    //引用時不用再NEW
    private static reportServiceMCMEB12 _instance = new reportServiceMCMEB12();
    public static reportServiceMCMEB12 Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public reportServiceMCMEB12()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<WebMemberRegisteredActiveDetailEntity> getWebMemberRegisteredActiveDetail(string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'MP' : " + MP, className, methodName);

        List<WebMemberRegisteredActiveDetailEntity> wmradeList = MSOUSEhgDao.Instance.getWebMemberRegisteredActiveDetail(MP);//<==========
        List<string>strList = HGMEMBERhgDao.Instance.getAllSourceID();

        for (var i = 0; i < wmradeList.Count; i++)
        {
            for (var j = 0; j < strList.Count; j++)
            {
                if (wmradeList[i].Sur_id == strList[j])
                {
                    wmradeList[i].count += 1;
                }
            }
        }
        log.endWrite("'wmradeList' : " + wmradeList.ToString(), className, methodName);
        return wmradeList;
    }

    public List<hgmemberEntity> getAnalystActiveDetail(string Sur_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'Sur_id' : " + Sur_id, className, methodName);

        List<hgmemberEntity> hbeList = HGMEMBERhgDao.Instance.getAnalystActiveDetail(Sur_id);//<==========

        log.endWrite("'hbeList' : " + hbeList.ToString(), className, methodName);
        return hbeList;
    }
}