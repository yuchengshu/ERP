using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// msftfService 的摘要描述
/// </summary>
public class DTRATService
{
    private static DTRATService _instance = new DTRATService();

    public static DTRATService Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public DTRATService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<OINVO_query_02Entity> getOINVO_qyery_02DataList()
    {
        //取得所有電話統計作業
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string T_ID = "";
        List<OINVO_query_02Entity> OINVO_qyery_02DataList = DTRAThgDao.Instance.getOINVO_query_02DataList();
        return OINVO_qyery_02DataList;
    }

    public List<OINVO_query_01Entity> getOINVO_qyery_01DataList()
    {
        //取得所有電話統計作業
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string T_ID = "";
        List<OINVO_query_01Entity> OINVO_qyery_01DataList = DTRAThgDao.Instance.getOINVO_query_01DataList();
        return OINVO_qyery_01DataList;
    }

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