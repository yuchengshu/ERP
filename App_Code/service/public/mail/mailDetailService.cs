using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// mailDetailService 的摘要描述
/// </summary>
public class mailDetailService
{
    //引用時不用再NEW
    private static mailDetailService _instance = new mailDetailService();
    public static mailDetailService Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public mailDetailService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public emailEntity getMailDetail(string mailId)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'mailId':" + mailId, className, methodName);

        emailEntity ee = MMAILhgDao.Instance.getMailDetail(mailId);

        log.endWrite("'ee' :"+ ee.ToString(), className, methodName);
        return ee;
    }
    //20220624取得上傳檔案
    public uploadFileEntity getMailAttachment(string mailId)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'mailId;':" + mailId, className, methodName);

        uploadFileEntity ufe =  UploadFilehgDao.Instance.getUpLoadData(mailId);//<==========

        log.endWrite("'ufe' :" + ufe.ToString(), className, methodName);
        return ufe;
    }
    //20220624
    /// <summary>
    /// 新增上傳檔案
    /// </summary>
    public void addFileUpload(addFileUpload afu)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'afu':" + afu, className, methodName);

        UploadFilehgDao.Instance.addFileUpload(afu);//<==========================

        log.endWrite(common.nothing, className, methodName);
    }
    public string deleteData(string mailId)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'mailId' :" + mailId, className, methodName);

        string backStr = MBULThgDao.Instance.deleteData(mailId);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
}