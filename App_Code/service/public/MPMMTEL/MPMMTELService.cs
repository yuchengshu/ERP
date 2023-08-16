using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// msftfService 的摘要描述
/// </summary>
public class MPMMTELService
{
    private static MPMMTELService _instance = new MPMMTELService();

    public static MPMMTELService Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public MPMMTELService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    // <summary>
    /// 取得取得全部電話統計作業列表(2022/05/05)
    /// </summary>
    /// <returns></returns>

    public List<MMTELdataEntity> getMPMMTELData()
    {
        //取得所有電話統計作業
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num;':" + U_Num + "'keyWord':" + keyWord, className, methodName);
        mcDataEntity mde = null;
        getAnalystParamEntity gape = null;
        // 取得所有電話統計作業
        List<MMTELdataEntity> MMTELdataList = MPMMTELhgDao.Instance.getAllMMTELdata();//<==========
        //List<MPMMTELEntity> MPMMTELList = new List<MPMMTELEntity>();
        //for (var i = 0; i < MMTELdataList.Count; i++)
        //{
        //    //mde = MUSERhgDao.Instance.getMCdata(eeList[i].MS_Sender);
        //    //eeList[i].MS_SenderName = mde.U_Name;
        //}
        log.endWrite("'MPMTELList' :" + MMTELdataList.ToString(), className, methodName);
        return MMTELdataList;
    }

    //Q_Analyst:分析師員工編號
    public List<MMTELdataEntity> searchMPMMTELDataList(string Q_Analyst)
    {
        //取得所有電話統計作業
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'U_Num;':" + U_Num + "'keyWord':" + keyWord, className, methodName);
        mcDataEntity mde = null;
        getAnalystParamEntity gape = null;
        // 取得所有電話統計作業
        List<MMTELdataEntity> MMTELdataList = MPMMTELhgDao.Instance.getAllMMTELdata(Q_Analyst);//<==========
        //List<MPMMTELEntity> MPMMTELList = new List<MPMMTELEntity>();
        //for (var i = 0; i < MMTELdataList.Count; i++)
        //{
        //    //mde = MUSERhgDao.Instance.getMCdata(eeList[i].MS_Sender);
        //    //eeList[i].MS_SenderName = mde.U_Name;
        //}
        log.endWrite("'MPMTELList' :" + MMTELdataList.ToString(), className, methodName);
        return MMTELdataList;
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