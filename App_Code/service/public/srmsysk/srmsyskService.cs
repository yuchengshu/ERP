using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// noticeBoardService 的摘要描述
/// </summary>
public class srmsyskService
{
    //引用時不用再NEW
    private static srmsyskService _instance = new srmsyskService();
    public static srmsyskService Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public srmsyskService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string deleteSRMSYSKData(string MF_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MF_ID' :" + MF_ID, className, methodName);

        string backStr = MSYSKhgDao.Instance.deleteMSYSKdata(MF_ID);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    /// <summary>
    /// 取得所有會議資料
    /// </summary>
    /// <returns></returns>
    public string addSRMSYSKData(string MP,string FileName, string add_user, string add_IP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MP':" + MP + "'add_user':" + add_user + "'add_IP':" + add_IP , className, methodName);

        string MF_ID = MSYSKhgDao.Instance.addSRMSYSKData(MP, FileName, add_user,add_IP);//<==========================
        string backStr = MF_ID;
        if (backStr == "成功")
        {
            backStr = MF_ID;
        }
        log.endWrite("'backStr':" + backStr, className, methodName);
        return backStr;
    }

    //getSRMVENUData
    public List<SRMVENUEntity> searchSRMSYSKData(string MP_CName, string MeetingDate)
    { //}//)//0428加入查詢條件!!!
   
        //string U_MDEP = ""; string U_POSITION = ""; string fromClassName = "";
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string paramFormat = "'U_MDEP' : {0}, 'U_POSITION' : {1}, 'fromClassName' : {2}, 'adver_depart_id' : {3}, 'keyWord' : {4}";
        StringBuilder sb = new StringBuilder();
        //sb.Append(string.Format(paramFormat, U_MDEP, U_POSITION, fromClassName, adver_depart_id, keyWord));
        log.startWrite(sb.ToString(), className, methodName);

        string dep = string.Empty;
        //2022/04/22這邊開始寫!!!!!!!!!!
        List<SRMVENUEntity> SRMVENUEntityList = MVENUhgDao.Instance.getSRMVENUList(MP_CName, MeetingDate);// MUSERhgDao.Instance.getMClist(true);
        //List<noticeBoardEntity> nbeList = MBULThgDao.Instance.getNoticeBoard(U_MDEP, U_POSITION, common.empty, fromClassName, adver_depart_id, keyWord);//<======
        //List<ditcodedescEntity> comidList = MITEMhgDao.Instance.getditcodedescEntityList("COMID");//<============================================================
        //List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("DEPAR");//<============================================================
        //List<indexBDdataEntity> bdList = MUSERhgDao.Instance.getEmpBDlist();//<==================================================================================
        //List<uploadFileEntity> ufeList = UploadFilehgDao.Instance.getUploadFile("MBULT",string.Empty, string.Empty);//<=====================================================================
        //
        //for (var i = 0; i < nbeList.Count; i++)
        //{
        //    for (var j = 0; j < ddeList.Count; j++)
        //    {
        //        if (nbeList[i].adver_depart_id == ddeList[j].ditcode)
        //        {
        //            nbeList[i].adver_depart_Name = ddeList[j].ddesc;
        //        }
        //        if (nbeList[i].adver_dep == ddeList[j].ditcode)
        //        {
        //            nbeList[i].adver_depName = ddeList[j].ddesc;
        //        }

        //    }
        //    for (var k = 0; k < bdList.Count; k++)
        //    {
        //        if (nbeList[i].adver_employ_id == bdList[k].U_Num)
        //        {
        //            nbeList[i].adver_employ_Name = bdList[k].empName;
        //        }
        //    }

        //    for (var u = 0; u < ufeList.Count; u++)
        //    {
        //        if (nbeList[i].adver_id == ufeList[u].File_num)
        //        {
        //            nbeList[i].F_ID = ufeList[u].F_ID;
        //            nbeList[i].File_Folder = ufeList[u].File_Folder;
        //            nbeList[i].File_num = ufeList[u].File_num;
        //            nbeList[i].File_Title = ufeList[u].File_Title;
        //            nbeList[i].File_Name = ufeList[u].File_Name;

        //        }
        //    }
        //    ///////////////////////////////////////////////////////
        //    for (var z = 0; z < mdeList.Count; z++)
        //    {
        //        if (nbeList[i].adver_employ_id == mdeList[z].U_Num)
        //        {
        //            for (var j = 0; j < ddeList.Count; j++)
        //            {
        //                if (mdeList[z].U_MDEP == ddeList[j].ditcode)
        //                {
        //                    nbeList[i].adver_employ_U_MDEPname = ddeList[j].ddesc;
        //                }

        //            }
        //            for (var y = 0; y < comidList.Count; y++)
        //            {
        //                if (mdeList[z].ComID == comidList[y].ditcode)
        //                {
        //                    nbeList[i].adver_employ_ComIDname = comidList[y].ddesc;
        //                }

        //            }
        //        }
        //    }
        //}
        //for (var n = 0; n < nbeList.Count; n++)
        //{
        //    if (common.isEmpty(nbeList[n].adver_depName))
        //    {
        //        nbeList[n].adver_depName = parseDep(nbeList[n].adver_dep);
        //    }
        //}

        //log.endWrite(nbeList.ToString(), className, methodName);
        return SRMVENUEntityList;
    }

    //getSRMSYSKData
    public List<SRMSYSKentity> getSRMSYSKData()
    { //}//)//0428加入查詢條件!!!

        //string U_MDEP = ""; string U_POSITION = ""; string fromClassName = "";
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string paramFormat = "'U_MDEP' : {0}, 'U_POSITION' : {1}, 'fromClassName' : {2}, 'adver_depart_id' : {3}, 'keyWord' : {4}";
        StringBuilder sb = new StringBuilder();
        //sb.Append(string.Format(paramFormat, U_MDEP, U_POSITION, fromClassName, adver_depart_id, keyWord));
        log.startWrite(sb.ToString(), className, methodName);

        string dep = string.Empty;
        List<SRMSYSKentity> SRMSYSKentityList = MSYSKhgDao.Instance.getSRMSYSKList();// MUSERhgDao.Instance.getMClist(true);
        //List<noticeBoardEntity> nbeList = MBULThgDao.Instance.getNoticeBoard(U_MDEP, U_POSITION, common.empty, fromClassName, adver_depart_id, keyWord);//<======
        //List<ditcodedescEntity> comidList = MITEMhgDao.Instance.getditcodedescEntityList("COMID");//<============================================================
        //List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("DEPAR");//<============================================================
        //List<indexBDdataEntity> bdList = MUSERhgDao.Instance.getEmpBDlist();//<==================================================================================
        //List<uploadFileEntity> ufeList = UploadFilehgDao.Instance.getUploadFile("MBULT",string.Empty, string.Empty);//<=====================================================================
        //
        //for (var i = 0; i < nbeList.Count; i++)
        //{
        //    for (var j = 0; j < ddeList.Count; j++)
        //    {
        //        if (nbeList[i].adver_depart_id == ddeList[j].ditcode)
        //        {
        //            nbeList[i].adver_depart_Name = ddeList[j].ddesc;
        //        }
        //        if (nbeList[i].adver_dep == ddeList[j].ditcode)
        //        {
        //            nbeList[i].adver_depName = ddeList[j].ddesc;
        //        }

        //    }
        //    for (var k = 0; k < bdList.Count; k++)
        //    {
        //        if (nbeList[i].adver_employ_id == bdList[k].U_Num)
        //        {
        //            nbeList[i].adver_employ_Name = bdList[k].empName;
        //        }
        //    }

        //    for (var u = 0; u < ufeList.Count; u++)
        //    {
        //        if (nbeList[i].adver_id == ufeList[u].File_num)
        //        {
        //            nbeList[i].F_ID = ufeList[u].F_ID;
        //            nbeList[i].File_Folder = ufeList[u].File_Folder;
        //            nbeList[i].File_num = ufeList[u].File_num;
        //            nbeList[i].File_Title = ufeList[u].File_Title;
        //            nbeList[i].File_Name = ufeList[u].File_Name;

        //        }
        //    }
        //    ///////////////////////////////////////////////////////
        //    for (var z = 0; z < mdeList.Count; z++)
        //    {
        //        if (nbeList[i].adver_employ_id == mdeList[z].U_Num)
        //        {
        //            for (var j = 0; j < ddeList.Count; j++)
        //            {
        //                if (mdeList[z].U_MDEP == ddeList[j].ditcode)
        //                {
        //                    nbeList[i].adver_employ_U_MDEPname = ddeList[j].ddesc;
        //                }

        //            }
        //            for (var y = 0; y < comidList.Count; y++)
        //            {
        //                if (mdeList[z].ComID == comidList[y].ditcode)
        //                {
        //                    nbeList[i].adver_employ_ComIDname = comidList[y].ddesc;
        //                }

        //            }
        //        }
        //    }
        //}
        //for (var n = 0; n < nbeList.Count; n++)
        //{
        //    if (common.isEmpty(nbeList[n].adver_depName))
        //    {
        //        nbeList[n].adver_depName = parseDep(nbeList[n].adver_dep);
        //    }
        //}

        //log.endWrite(nbeList.ToString(), className, methodName);
        return SRMSYSKentityList;
    }

    public List<SRMSYSKentity> getSRMSYSKData(string Q_Analyst)
    { //}//)//0428加入查詢條件!!!

        //string U_MDEP = ""; string U_POSITION = ""; string fromClassName = "";
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string paramFormat = "'U_MDEP' : {0}, 'U_POSITION' : {1}, 'fromClassName' : {2}, 'adver_depart_id' : {3}, 'keyWord' : {4}";
        StringBuilder sb = new StringBuilder();
        //sb.Append(string.Format(paramFormat, U_MDEP, U_POSITION, fromClassName, adver_depart_id, keyWord));
        log.startWrite(sb.ToString(), className, methodName);

        string dep = string.Empty;
        List<SRMSYSKentity> SRMSYSKentityList = MSYSKhgDao.Instance.getSRMSYSKList(Q_Analyst);// MUSERhgDao.Instance.getMClist(true);
        //List<noticeBoardEntity> nbeList = MBULThgDao.Instance.getNoticeBoard(U_MDEP, U_POSITION, common.empty, fromClassName, adver_depart_id, keyWord);//<======
        //List<ditcodedescEntity> comidList = MITEMhgDao.Instance.getditcodedescEntityList("COMID");//<============================================================
        //List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("DEPAR");//<============================================================
        //List<indexBDdataEntity> bdList = MUSERhgDao.Instance.getEmpBDlist();//<==================================================================================
        //List<uploadFileEntity> ufeList = UploadFilehgDao.Instance.getUploadFile("MBULT",string.Empty, string.Empty);//<=====================================================================
        //
        //for (var i = 0; i < nbeList.Count; i++)
        //{
        //    for (var j = 0; j < ddeList.Count; j++)
        //    {
        //        if (nbeList[i].adver_depart_id == ddeList[j].ditcode)
        //        {
        //            nbeList[i].adver_depart_Name = ddeList[j].ddesc;
        //        }
        //        if (nbeList[i].adver_dep == ddeList[j].ditcode)
        //        {
        //            nbeList[i].adver_depName = ddeList[j].ddesc;
        //        }

        //    }
        //    for (var k = 0; k < bdList.Count; k++)
        //    {
        //        if (nbeList[i].adver_employ_id == bdList[k].U_Num)
        //        {
        //            nbeList[i].adver_employ_Name = bdList[k].empName;
        //        }
        //    }

        //    for (var u = 0; u < ufeList.Count; u++)
        //    {
        //        if (nbeList[i].adver_id == ufeList[u].File_num)
        //        {
        //            nbeList[i].F_ID = ufeList[u].F_ID;
        //            nbeList[i].File_Folder = ufeList[u].File_Folder;
        //            nbeList[i].File_num = ufeList[u].File_num;
        //            nbeList[i].File_Title = ufeList[u].File_Title;
        //            nbeList[i].File_Name = ufeList[u].File_Name;

        //        }
        //    }
        //    ///////////////////////////////////////////////////////
        //    for (var z = 0; z < mdeList.Count; z++)
        //    {
        //        if (nbeList[i].adver_employ_id == mdeList[z].U_Num)
        //        {
        //            for (var j = 0; j < ddeList.Count; j++)
        //            {
        //                if (mdeList[z].U_MDEP == ddeList[j].ditcode)
        //                {
        //                    nbeList[i].adver_employ_U_MDEPname = ddeList[j].ddesc;
        //                }

        //            }
        //            for (var y = 0; y < comidList.Count; y++)
        //            {
        //                if (mdeList[z].ComID == comidList[y].ditcode)
        //                {
        //                    nbeList[i].adver_employ_ComIDname = comidList[y].ddesc;
        //                }

        //            }
        //        }
        //    }
        //}
        //for (var n = 0; n < nbeList.Count; n++)
        //{
        //    if (common.isEmpty(nbeList[n].adver_depName))
        //    {
        //        nbeList[n].adver_depName = parseDep(nbeList[n].adver_dep);
        //    }
        //}

        //log.endWrite(nbeList.ToString(), className, methodName);
        return SRMSYSKentityList;
    }

    public List<SRMVENUEntity> searchSRMVENUData2(string keyWord, string U_MDEP, string U_Num, string MS_ID, string ComID, string StartDate, string EndDate, string Q_Analyst)
    {
        List<SRMVENUEntity> SRMVENUEntityList = MVENUhgDao.Instance.getSRMVENUList();
        return SRMVENUEntityList;
    }
    
    /// <summary>
    /// 新增布告欄細項資料
    /// </summary>
    public string addNoticeDetail(addNoticeDetail and)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'adver_item':" + and.adver_item + "'adver_depart_id':" + and.adver_depart_id + "'adver_subject':" + and.adver_subject + "'adver_content':" + and.adver_content + "'adver_depart_id':" + and.adver_depart_id + "'adver_employ_id':" + and.adver_employ_id + "'adver_Com':" + and.adver_Com + "'add_ip':" + and.add_ip, className, methodName);

        string backStr = MBULThgDao.Instance.addNoticeDetail(and);//<==========================
        if (backStr == "成功")
        {
            backStr = and.adver_id;
        }
        log.endWrite("'backStr':"+ backStr, className, methodName);
        return backStr;
    }

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

    /// <summary>
    /// 取得部門列表資訊
    /// </summary>
    /// <returns></returns>
    public List<ditcodedescEntity> getDepList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        StringBuilder html = new StringBuilder();
        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("DEPAR");
        ditcodedescEntity dde = null;
        dde = new ditcodedescEntity();
        dde.ditcode = "1111";
        dde.ddesc = "全營運事業部";
        ddeList.Add(dde);
        dde = null;
        dde = new ditcodedescEntity();
        dde.ditcode = "2222";
        dde.ddesc = "全營運2部";
        ddeList.Add(dde);
        dde = null;
        dde = new ditcodedescEntity();
        dde.ditcode = "3333";
        dde.ddesc = "全理財推廣部";
        ddeList.Add(dde);
        dde = null;
        dde = new ditcodedescEntity();
        dde.ditcode = "5555";
        dde.ddesc = "全財富管理部";
        ddeList.Add(dde);
        dde = null;
        dde = new ditcodedescEntity();
        dde.ditcode = "6666";
        dde.ddesc = "全行政部";
        ddeList.Add(dde);
        dde = null;
        dde = new ditcodedescEntity();
        dde.ditcode = "7777";
        dde.ddesc = "全投資推廣部";
        ddeList.Add(dde);
        dde = null;
        dde = new ditcodedescEntity();
        dde.ditcode = "8888";
        dde.ddesc = "全營運1部";
        ddeList.Add(dde);
        dde = null;
        dde = new ditcodedescEntity();
        dde.ditcode = "9999";
        dde.ddesc = "全公司222";
        ddeList.Add(dde);
        dde = null;
        log.endWrite(ddeList.ToString(), className, methodName);
        return ddeList;
    }

    public string parseDep(string dep)
    {
        string backString = string.Empty;
        switch (dep)
        {
            case "6666":
                backString = "全行政部";
                break;
            case "1111":
                backString = "全營運事業部";
                break;
            case "3333":
                backString = "全理財推廣部";
                break;
            case "5555":
                backString = "全財富管理部";
                break;
            case "7777":
                backString = "全投資推廣部";
                break;
            case "8888":
                backString = "全營運1部";
                break;
            case "2222":
                backString = "全營運2部";
                break;
            case "9999":
                backString = "全公司111";
                break;
        }
        return backString;
    }
}