using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.IO;

/// <summary>
/// idCheckService 的摘要描述
/// </summary>
public class idCheckService
{
    //引用時不用再NEW
    private static idCheckService _instance = new idCheckService();

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public static idCheckService Instance
    {
        get
        {
            return _instance;
        }
    }
    public idCheckService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<idCheckEntity> getIdCheckList(string keyWord, string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'keyWord' :" + keyWord + "'StartDate' :" + StartDate + "'EndDate' :" + EndDate, className, methodName);

        List<idCheckEntity> iceList = idCheckhgDao.Instance.getIdCheckList(keyWord, StartDate, EndDate);//<==========
        string Archived = "已歸檔";
        string idDataPath = "../../../../../img/idData/";
        for (var i = 0; i < iceList.Count; i++)
        {
            switch (iceList[i].ID_Status)
            {
                case "0":
                    iceList[i].ID_StatusName = "<span>尚未檢查</span>";
                    iceList[i].ID_Img_Obv = idDataPath + iceList[i].ID_Img_Obv;
                    iceList[i].ID_Img_Pos = idDataPath + iceList[i].ID_Img_Pos;

                    break;
                case "1":
                    iceList[i].ID_StatusName = "<span class='colorBlue'>成功</span>";
                    iceList[i].ID_Img_Obv = Archived;
                    iceList[i].ID_Img_Pos = Archived;

                    break;
                case "2":
                    iceList[i].ID_StatusName = "<span class='colorRed'>失敗</span>";
                    iceList[i].ID_Img_Obv = Archived;
                    iceList[i].ID_Img_Pos = Archived;
                    break;
            }
        } 

        log.endWrite("'iceList' :" + iceList.ToString(), className, methodName);
        return iceList;
    }

    

    public string deleteData(string id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'id' :" + id, className, methodName);

        string backStr = idCheckhgDao.Instance.deleteData(id);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public string editData(string id, string M_id, string ID_Status)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'id' :" + id + "'M_id' :" + M_id + "'ID_Status' :" + ID_Status, className, methodName);

        string backStr = idCheckhgDao.Instance.editData(id, M_id,ID_Status);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }


    public List<customerDataEntity> getCustomerDetail(string Tel)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Tel' :" + Tel, className, methodName);

        List<customerDataEntity> cdeList = MMBERhgDao.Instance.getCustomerDetail(Tel);//<==========

        log.endWrite("'cdeList' :" + cdeList.ToString(), className, methodName);
        return cdeList;
    }
}