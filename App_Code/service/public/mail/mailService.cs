using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// mailService 的摘要描述
/// </summary>
public class mailService
{
    //引用時不用再NEW
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

    public List<emailEntity> getMailData(string U_Num, string keyWord)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num;':" + U_Num+ "'keyWord':" + keyWord, className, methodName);
        mcDataEntity mde = null;
        List<emailEntity> eeList = MMAILhgDao.Instance.getMailData(U_Num,keyWord);//<==========
        for (var i = 0; i < eeList.Count; i++)
        {
            mde = MUSERhgDao.Instance.getMCdata(eeList[i].MS_Sender);
            eeList[i].MS_SenderName = mde.U_Name;
        }
        log.endWrite("'eeList' :" + eeList.ToString(), className, methodName);
        return eeList;
    }

    public string deleteMailData(string mailId)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'mailId':" + mailId, className, methodName);

        String backStr = MMAILhgDao.Instance.deleteMailData(mailId);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public string addMailData(emailEntity ee)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + ee.MS_ID + "'MS_Sender':" + ee.MS_Sender + "'MS_Receiver':" + ee.MS_Receiver + "'MS_Title':" + ee.MS_Title + "'MS_Text':" + ee.MS_Text + "'add_User':" + ee.add_User + "'add_ip':" + ee.add_ip, className, methodName);

        string backStr = MMAILhgDao.Instance.addMailData(ee);//<==========
        if (backStr == "成功")
        {
            backStr = ee.MS_ID;
        }
        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public uploadFileEntity getUpLoadData(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        uploadFileEntity ufe = UploadFilehgDao.Instance.getUpLoadData(MS_ID);//<==========

        log.endWrite("'ufe' :" + ufe.ToString(), className, methodName);
        return ufe;
    }
    public emailEntity getUpLoadData1(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        emailEntity ufe = UploadFilehgDao.Instance.getMailUpLoadData1(MS_ID);//<==========

        log.endWrite("'ufe' :" + ufe.ToString(), className, methodName);
        return ufe;
    }
    public emailEntity getUpLoadData2(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        emailEntity ufe = UploadFilehgDao.Instance.getMailUpLoadData2(MS_ID);//<==========

        log.endWrite("'ufe' :" + ufe.ToString(), className, methodName);
        return ufe;
    }
    public emailEntity getUpLoadData3(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        emailEntity ufe = UploadFilehgDao.Instance.getMailUpLoadData3(MS_ID);//<==========

        log.endWrite("'ufe' :" + ufe.ToString(), className, methodName);
        return ufe;
    }

    public string updateReadtag(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        string backStr = MMAILhgDao.Instance.updateReadtag(MS_ID);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public emailEntity getMailDetail(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        emailEntity ee = MMAILhgDao.Instance.getMailDetail(MS_ID);//<==========
        mcDataEntity mde = MUSERhgDao.Instance.getMCdata(ee.MS_Sender);
        ee.MS_SenderName = mde.U_Name;
        log.endWrite("'ee' :" + ee.ToString(), className, methodName);
        return ee;
    }
}