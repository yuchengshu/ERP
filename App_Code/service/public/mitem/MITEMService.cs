using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MITEMService 的摘要描述
/// </summary>
public class MITEMService
{
    private static MITEMService _instance = new MITEMService();

    public static MITEMService Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public MITEMService()
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


    public List<CustomUSERSETimeEntity> getCustomUSERSETimeData()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        List<CustomUSERSETimeEntity> CustomUSERSETimeEntityList = MITEMhgDao.Instance.getCustomUSERSETimeDataList();
        log.endWrite(CustomUSERSETimeEntityList.ToString(), className, methodName);
        return CustomUSERSETimeEntityList;
    }
    //20221227work
    //新增自訂上班時間及新增自訂下班時間
    public string  addCustomUSERSETime(string StartHour, string StartMin, string EndHour, string EndMin, string Select_Employ)
    {
        if(StartHour.Length.ToString()=="1")
        {
            StartHour = "0" + StartHour;
        }
        if (StartMin.Length.ToString() == "1")
        {
            StartMin = "0" + StartMin;
        }
        if (EndHour.Length.ToString() == "1")
        {
            EndHour = "0" + EndHour;
        }
        if (EndMin.Length.ToString() == "1")
        {
            EndMin = "0" + EndMin;
        }
        //INSERT INTO [dbo].[MITEM] ([mitcode],[ditcode],[ddesc])VALUES　('MCLAS','B1103011','S_07:01:00')
        //自訂上班時間
        string StartTime = "S_"+ StartHour+":"+StartMin+":"+"00";
        //自訂下班時間
        string EndTime = "E_" + EndHour + ":" + EndMin + ":" + "00";
        string backStr = MITEMhgDao.Instance.addCustomUSERSETime(StartTime, EndTime, Select_Employ);
        if (backStr == "成功")
        {
            //  backStr = ee.MS_ID;
        }
        //log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
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