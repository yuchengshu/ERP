using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.IO;
using System.Xml;
using System.Net;

/// <summary>
/// dataGiftManagementService 的摘要描述
/// </summary>
public class dataGiftManagementService
{
    //引用時不用再NEW
    private static dataGiftManagementService _instance = new dataGiftManagementService();

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public static dataGiftManagementService Instance
    {
        get
        {
            return _instance;
        }
    }
    public dataGiftManagementService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    
    public List<dataGiftTableEntity> getDataGiftTable(string ComID, string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID' :" + ComID + "'U_MDEP' :" + U_MDEP, className, methodName);
        List<dataGiftTableEntity> dgteList = MSEDThgDao.Instance.getDataGiftTable(ComID, U_MDEP);//<==========
        for (var i = 0; i < dgteList.Count; i++)
        {
            dgteList[i].Start_date = dgteList[i].Start_date.Split(' ')[0];
            dgteList[i].End_date = dgteList[i].End_date.Split(' ')[0];
            if (dgteList[i].Pay == "0")
            {
                dgteList[i].PayName = "<font class='colorRed'>否</font>";
            }
            else
            {
                dgteList[i].PayName = "顯";
            }
            if (dgteList[i].Tel_tag == "0")
            {
                dgteList[i].Tel_tagName = "開";
            }
            else
            {
                dgteList[i].Tel_tagName = "<font class='colorRed'>閉</font>";
            }
            if (dgteList[i].Call_tag == "0")
            {
                dgteList[i].Call_tagName = "客聯";
            }
            else
            {
                dgteList[i].Call_tagName = "<font class='colorRed'>業聯</font>";
            }
            if (dgteList[i].Action_tag == "0")
            {
                dgteList[i].Action_tagName = "否";
            }
            else
            {
                dgteList[i].Action_tagName = "<font class='colorRed'>是</font>";
            }
        }
        log.endWrite("'dgteList' :" + dgteList.ToString(), className, methodName);
        return dgteList;
    }

    public string editData(dataGiftTableEntity dgte)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'dgte' :" + dgte.ToString(), className, methodName);

        mcDataEntity mde = MUSERhgDao.Instance.getMCdata(dgte.MP_Num);
        dgte.MP_Name = mde.U_Name;
        dgte.MP_Com = mde.ComID;

        string backStr = MSEDThgDao.Instance.editData(dgte);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
}