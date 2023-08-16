using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// mailDetailService 的摘要描述
/// </summary>
public class MFUNTreportService
{
    //引用時不用再NEW
    private static MFUNTreportService _instance = new MFUNTreportService();
    public static MFUNTreportService Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public MFUNTreportService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }


    //setMFUNTreportData
    //設定首頁權限資料
    //public List<contentAuthorityEntity> setMFUNTreportData(string[] Check_Item_Ary_ALL, string[] Value, string U_NUM)
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    log.startWrite("'Value':" + Value, className, methodName);

    //    List<contentAuthorityEntity> cAE = MFUNTjoinMFMAPhgDao.Instance.setMFUNTreportData(Check_Item_Ary_ALL, Value, U_NUM);
    //    //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('權限已完成更新!!');", true);
    //    log.endWrite("'cAE' :" + cAE.ToString(), className, methodName);
    //    return cAE;
    //}

    //首頁權限更新
    //setUpdateHomePageData
    public List<contentAuthorityEntity> setUpdateHomePageData(string[] Check_Item_Ary_ALL, string[] Value, string U_NUM, string EditU_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Value':" + Value, className, methodName);
        //20221004要修改的地方
        List<contentAuthorityEntity> cAE = MFUNTjoinMFMAPhgDao.Instance.setUpdateHomePageData(Check_Item_Ary_ALL, Value, U_NUM, EditU_Num);
        //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('權限已完成更新!!');", true);
        log.endWrite("'cAE' :" + cAE.ToString(), className, methodName);
        return cAE;
    }

    //setMFUNTreportData
    //設定使用者報表權限
    //20221003
    public List<contentAuthorityEntity> setMFUNTreportData(string[] Check_Item_Ary_ALL,string[] Value, string U_NUM, string EditU_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Value':" + Value, className, methodName);

        List<contentAuthorityEntity> cAE = MFUNTjoinMFMAPhgDao.Instance.setMFUNTreportData(Check_Item_Ary_ALL,Value, U_NUM, EditU_Num);
        //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('權限已完成更新!!');", true);
        log.endWrite("'cAE' :" + cAE.ToString(), className, methodName);
        return cAE;
    }

    //setMFUNTreportData
    //設定使用者報表權限
    //public List<contentAuthorityEntity> setMFUNTreportData(string[] Value,string U_NUM,string EditU_Num)
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    log.startWrite("'Value':" + Value, className, methodName);

    //    List<contentAuthorityEntity> cAE = MFUNTjoinMFMAPhgDao.Instance.setMFUNTreportData(Value, U_NUM, EditU_Num);
    //    //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('權限已完成更新!!');", true);
    //    log.endWrite("'cAE' :" + cAE.ToString(), className, methodName);
    //    return cAE;
    //}
    //取得可執行的功能清單
    //取得首頁權限資料
    public List<contentAuthorityEntity> getMFUNTreportData(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num':" + U_Num, className, methodName);

        List<contentAuthorityEntity> cAE = MFUNTjoinMFMAPhgDao.Instance.searchContentAuthority(U_Num);//取得可執行的功能清單

        log.endWrite("'cAE' :" + cAE.ToString(), className, methodName);
        return cAE;
    }
    //public emailEntity getMailDetail(string mailId)
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    log.startWrite("'mailId':" + mailId, className, methodName);

    //    emailEntity ee = MMAILhgDao.Instance.getMailDetail(mailId);

    //    log.endWrite("'ee' :"+ ee.ToString(), className, methodName);
    //    return ee;
    //}
    ////20220624取得上傳檔案
    //public uploadFileEntity getMailAttachment(string mailId)
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    log.startWrite("'mailId;':" + mailId, className, methodName);

    //    uploadFileEntity ufe =  UploadFilehgDao.Instance.getUpLoadData(mailId);//<==========

    //    log.endWrite("'ufe' :" + ufe.ToString(), className, methodName);
    //    return ufe;
    //}
    ////20220624
    ///// <summary>
    ///// 新增上傳檔案
    ///// </summary>
    //public void addFileUpload(addFileUpload afu)
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    log.startWrite("'afu':" + afu, className, methodName);

    //    UploadFilehgDao.Instance.addFileUpload(afu);//<==========================

    //    log.endWrite(common.nothing, className, methodName);
    //}
    //public string deleteData(string mailId)
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    log.startWrite("'mailId' :" + mailId, className, methodName);

    //    string backStr = MBULThgDao.Instance.deleteData(mailId);//<==========

    //    log.endWrite("'backStr' :" + backStr, className, methodName);
    //    return backStr;
    //}
}