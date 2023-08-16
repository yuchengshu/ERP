using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.IO;
using System.Xml;
using System.Net;

/// <summary>
/// openInterestTableManagementService 的摘要描述
/// </summary>
public class openInterestTableManagementService
{
    //引用時不用再NEW
    private static openInterestTableManagementService _instance = new openInterestTableManagementService();

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public static openInterestTableManagementService Instance
    {
        get
        {
            return _instance;
        }
    }
    public openInterestTableManagementService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<uploadFileEntity> getOItable(searchOItableParamEntity soitp)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'soitp' :" + soitp.ToString(), className, methodName);

        List<uploadFileEntity> ufeList = UploadFilehgDao.Instance.getUploadFile("MSYSK", soitp.StartDate, soitp.EndDate);//<==========
        if (soitp.U_POSITION == "0006")
        {
            mcDataEntity mde = MUSERhgDao.Instance.getMCdata(soitp.U_Num);
            soitp.MP = mde.U_Leader;
        }
        else if (soitp.U_POSITION == "0005")
        {
            soitp.MP = soitp.U_Num;
        }

        List<MSYSKentity> meList = MSYSKhgDao.Instance.getOItable(soitp);//<==========
        List<indexBDdataEntity> ibddeList = MUSERhgDao.Instance.getAnalystList(string.Empty);
        List<uploadFileEntity> backList = new List<uploadFileEntity>();

        for (var i = 0; i < ufeList.Count; i++)
        {
            for (var j = 0; j < meList.Count; j++)
            {
                if (ufeList[i].File_num == meList[j].MF_ID)
                {
                    ufeList[i].MP = meList[j].MP;
                    backList.Add(ufeList[i]);
                }
            }
           
        }

        for (var i = 0; i < backList.Count; i++)
        {
            for (var z = 0; z < ibddeList.Count; z++)
            {
                if (backList[i].MP == ibddeList[z].U_Num)
                {
                    backList[i].MPname = ibddeList[z].empName;
                }
            }
        }

          

        log.endWrite("'backList' :" + backList.ToString(), className, methodName);
        return backList;
    }

    public string addOItable(string MF_ID, string MP, string add_user, string add_ip)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MF_ID' :" + MF_ID + "'MP' :" + MP + "'add_user' :" + add_user + "'add_ip' :" + add_ip, className, methodName);

        mcDataEntity mde = MUSERhgDao.Instance.getMCdata(MP);

        string backStr = MSYSKhgDao.Instance.addOItable(MF_ID, MP,mde.ComID, add_user, add_ip);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public string deleteMSYSKdata(string MF_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MF_ID' :" + MF_ID, className, methodName);

        string backStr = MSYSKhgDao.Instance.deleteMSYSKdata(MF_ID);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public string deleteUpload_FileData(string File_num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'File_num' :" + File_num, className, methodName);

        string backStr = UploadFilehgDao.Instance.deleteUpload_FileData(File_num);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
}