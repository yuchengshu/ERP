using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// msftfService 的摘要描述
/// </summary>
public class msftfService
{
    private static msftfService _instance = new msftfService();

    public static msftfService Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public msftfService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //getmsftfListData(MS_ID,keyword);
    public List<msftfEntity> getmsftfListData(string U_Num, string keyWord)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num;':" + U_Num + "'keyWord':" + keyWord, className, methodName);
        mcDataEntity mde = null;
        List<msftfEntity> msftfList = MSFTFhgDao.Instance.getMSftfList(keyWord);//<==========
        for (var i = 0; i < msftfList.Count; i++)
        {
            //mde = MUSERhgDao.Instance.getMCdata(eeList[i].MS_Sender);
            //eeList[i].MS_SenderName = mde.U_Name;
        }
        log.endWrite("'msftfList' :" + msftfList.ToString(), className, methodName);
        return msftfList;
    }
    /*
     * //引用時不用再NEW
    private static mailService _instance = new mailService();
    public static mailService Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public mailService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
     */
}