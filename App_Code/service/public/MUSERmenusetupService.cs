using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MUSERmenusetupService 的摘要描述
/// </summary>
public class MUSERmenusetupService
{
    //引用時不用再NEW
    private static MUSERmenusetupService _instance = new MUSERmenusetupService();
    public static MUSERmenusetupService Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public MUSERmenusetupService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    //setMFUNTreportData
    //public List<contentAuthorityEntity> setMUSERmenusetupData(string[] Value,string U_NUM)
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    log.startWrite("'Value':" + Value, className, methodName);

    //    List<contentAuthorityEntity> cAE = MFUNTjoinMFMAPhgDao.Instance.setMFUNTreportData(Value, U_NUM);
    //    //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('權限已完成更新!!');", true);
    //    log.endWrite("'cAE' :" + cAE.ToString(), className, methodName);
    //    return cAE;
    //}
    //取得功能清單
    public List<contentAuthorityEntity> getMUSERmenusetupData(string U_Num)
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