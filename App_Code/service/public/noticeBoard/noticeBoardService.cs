using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.IO;
//using System;
//using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
//using System.Linq;
//using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// noticeBoardService 的摘要描述
/// </summary>
public class noticeBoardService : System.Web.UI.Page
{
    //引用時不用再NEW
    private static noticeBoardService _instance = new noticeBoardService();
    public static noticeBoardService Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public noticeBoardService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }


    public string deleteNoticeDetail(string adver_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'adver_id:" + adver_id, className, methodName);

        string backStr = MBULThgDao.Instance.deleteData(adver_id);//<==========================
        if (backStr == "成功")
        {
            backStr = adver_id;
        }
        log.endWrite("'backStr':" + backStr, className, methodName);
        return backStr;
    }
    //按下清單列表的項目後20220607從這裡開始!!
    //取得詳細資料(標題 發佈時間 發佈人員[[U_Num-COMID-DEPAR]中的附件 內文)
    //取得附件1
    public MBULTDetailEntity getBoardDataDetail(string MS_ID)//adver_id
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        MBULTDetailEntity ufe = UploadFilehgDao.Instance.getBoardDataDetail(MS_ID);//<==========

        log.endWrite("'ufe' :" + ufe.ToString(), className, methodName);
        return ufe;
    }
    //取得附件1
    public MBULTDetailEntity getUpLoadData1(string MS_ID)//adver_id
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        MBULTDetailEntity ufe = UploadFilehgDao.Instance.getUpLoadData1(MS_ID);//<==========

        log.endWrite("'ufe' :" + ufe.ToString(), className, methodName);
        return ufe;
    }
    //取得附件2
    public MBULTDetailEntity getUpLoadData2(string MS_ID)//adver_id
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        MBULTDetailEntity ufe = UploadFilehgDao.Instance.getUpLoadData2(MS_ID);//<==========

        log.endWrite("'ufe' :" + ufe.ToString(), className, methodName);
        return ufe;
    }
    //取得附件3
    public MBULTDetailEntity getUpLoadData3(string MS_ID)//adver_id
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        MBULTDetailEntity ufe = UploadFilehgDao.Instance.getUpLoadData3(MS_ID);//<==========

        log.endWrite("'ufe' :" + ufe.ToString(), className, methodName);
        return ufe;
    }
    /// <summary>
    /// 取得公佈欄資料
    /// </summary>
    /// <returns></returns>
    /// adver_depart_id:發布單位代號
    public List<noticeBoardEntity> getNoticeBoard(string U_MDEP, string U_POSITION, string fromClassName, string adver_depart_id, string keyWord)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'U_MDEP' : {0}, 'U_POSITION' : {1}, 'fromClassName' : {2}, 'adver_depart_id' : {3}, 'keyWord' : {4}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, U_MDEP, U_POSITION, fromClassName, adver_depart_id, keyWord));
        log.startWrite(sb.ToString(), className, methodName);

        string dep = string.Empty;

        List<mcDataEntity> mdeList = MUSERhgDao.Instance.getMClist(true);
        List<noticeBoardEntity> nbeList = MBULThgDao.Instance.getNoticeBoard(U_MDEP, U_POSITION, common.empty, fromClassName, adver_depart_id, keyWord);//<======
        List<ditcodedescEntity> comidList = MITEMhgDao.Instance.getditcodedescEntityList("COMID");//<============================================================
        //發布單位
        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("DEPAR");//<============================================================
        //發布人員
        List<indexBDdataEntity> bdList = MUSERhgDao.Instance.getEmpBDlist();//<==================================================================================
        List<uploadFileEntity> ufeList = UploadFilehgDao.Instance.getUploadFile("MBULT", string.Empty, string.Empty);//<=====================================================================
        string adver_depart_Name = MITEMhgDao.Instance.getadver_depart_nameByID(adver_depart_id);//<============================================================
        List<noticeBoardEntity> nbeList_new = new List<noticeBoardEntity>();
        if (keyWord.Length == 0)
        {
            for (var i = 0; i < nbeList.Count; i++)
            {
                for (var j = 0; j < ddeList.Count; j++)
                {
                    if (nbeList[i].adver_depart_id == ddeList[j].ditcode)//發布單位名稱代號
                    {
                        nbeList[i].adver_depart_Name = ddeList[j].ddesc;//發布單位名稱
                    }

                    if (nbeList[i].adver_dep == ddeList[j].ditcode)//發佈對象
                    {
                        nbeList[i].adver_depName = ddeList[j].ddesc;//發佈對象名稱
                    }
                    //
                    if (nbeList[i].adver_dep == "6666")//發佈對象
                    {
                        nbeList[i].adver_depName = "全行政部";//發佈對象名稱
                    }
                    //
                    if (nbeList[i].adver_dep == "1111")//發佈對象
                    {
                        nbeList[i].adver_depName = "全營運事業部";//發佈對象名稱
                    }
                    //
                    if (nbeList[i].adver_dep == "3333")//發佈對象
                    {
                        nbeList[i].adver_depName = "全理財推廣部";//發佈對象名稱
                    }
                    //
                    if (nbeList[i].adver_dep == "5555")//發佈對象
                    {
                        nbeList[i].adver_depName = "全財富1部";//發佈對象名稱
                    }
                    //
                    if (nbeList[i].adver_dep == "55551")//發佈對象
                    {
                        nbeList[i].adver_depName = "全財富管理部";//發佈對象名稱
                    }
                    //
                    if (nbeList[i].adver_dep == "55552")//發佈對象
                    {
                        nbeList[i].adver_depName = "全財富2部";//發佈對象名稱
                    }
                    //
                    if (nbeList[i].adver_dep == "7777")//發佈對象
                    {
                        nbeList[i].adver_depName = "全投資推廣部";//發佈對象名稱
                    }
                    //
                    if (nbeList[i].adver_dep == "8888")//發佈對象
                    {
                        nbeList[i].adver_depName = "全營運1部";//發佈對象名稱
                    }
                    //
                    if (nbeList[i].adver_dep == "2222")//發佈對象
                    {
                        nbeList[i].adver_depName = "全營運2部";//發佈對象名稱
                    }
                    //
                    if (nbeList[i].adver_dep == "9999")//發佈對象
                    {
                        nbeList[i].adver_depName = "全公司";//發佈對象名稱
                    }
                    //
                    if (nbeList[i].adver_dep == "4444")//發佈對象
                    {
                        nbeList[i].adver_depName = "全營特別部";//發佈對象名稱
                    }
                    //
                    if (nbeList[i].adver_dep == "1115")//發佈對象
                    {
                        nbeList[i].adver_depName = "全營運5部";//發佈對象名稱
                    }
                    //
                    if (nbeList[i].adver_dep == "33333")//發佈對象
                    {
                        nbeList[i].adver_depName = "全營運3部";//發佈對象名稱
                    }

                }

                for (var k = 0; k < bdList.Count; k++)
                {
                    if (nbeList[i].adver_employ_id== bdList[k].U_Num)
                    {
                        nbeList[i].adver_employ_Name = bdList[k].empName;//發布人員名稱
                    }
                }

                for (var u = 0; u < ufeList.Count; u++)
                {
                    if (nbeList[i].adver_id == ufeList[u].add_user)
                    {
                        nbeList[i].F_ID = ufeList[u].F_ID;
                        nbeList[i].File_Folder = ufeList[u].File_Folder;
                        nbeList[i].File_num = ufeList[u].File_num;
                        nbeList[i].File_Title = ufeList[u].File_Title;
                        nbeList[i].File_Name = ufeList[u].File_Name;

                    }
                }
                ///////////////////////////////////////////////////////
                for (var z = 0; z < mdeList.Count; z++)
                {
                    if (nbeList[i].adver_employ_id == mdeList[z].U_Num)
                    {
                        for (var j = 0; j < ddeList.Count; j++)
                        {
                            if (mdeList[z].U_MDEP == ddeList[j].ditcode)
                            {
                                nbeList[i].adver_employ_U_MDEPname = ddeList[j].ddesc;//發佈對象
                            }

                        }
                        for (var y = 0; y < comidList.Count; y++)
                        {
                            if (mdeList[z].ComID == comidList[y].ditcode)
                            {
                                nbeList[i].adver_employ_ComIDname = comidList[y].ddesc;//發佈單位名稱
                            }

                        }
                    }
                }
            }
            if (nbeList.Count == 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('查無資料!');", true);
            }
            return nbeList;
        }
        else
        {
            for (var i = 0; i < nbeList.Count; i++)
            {
                // for (var j = 0; j < ddeList.Count; j++)
                // {
                //if (nbeList[i].adver_depart_id == ddeList[j].ditcode)
                //if (nbeList[i].adver_content.Contains(keyWord))
                //{
                //    //nbeList[i].adver_depart_Name = ddeList[j].ddesc;//發布單位
                //    nbeList_new.Add(nbeList[i]);    
                //}
                //if (nbeList[i].adver_content.Contains(keyWord))
                //{
                //    nbeList_new.Add(nbeList[i]);
                //   // nbeList[i].adver_depName = ddeList[j].ddesc;
                //}
                //if (nbeList[i].adver_dep.Contains(keyWord))//發布單位代號
                //{
                //    nbeList_new.Add(nbeList[i]);
                //    // nbeList[i].adver_depName = ddeList[j].ddesc;
                //}
                if (nbeList[i].adver_content.ToUpper().Contains(keyWord.ToUpper())|| nbeList[i].adver_subject.Contains(keyWord)|| nbeList[i].adver_dep.Contains(keyWord))//發布內容
                {
                    nbeList_new.Add(nbeList[i]);
                    // nbeList[i].adver_depName = ddeList[j].ddesc;
                }
                //if (nbeList[i].adver_subject.Contains(keyWord))//發布主題
                //{
                //    nbeList_new.Add(nbeList[i]);
                //    // nbeList[i].adver_depName = ddeList[j].ddesc;
                //}
                //20220531
                //if (common.isEmpty(nbeList[i].adver_depName))
                //{
                //    nbeList[i].adver_depName = parseDep(nbeList[i].adver_dep);
                //}

                //   }
                log.endWrite(nbeList_new.ToString(), className, methodName);

            }
            if (nbeList_new.Count == 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('查無資料!');", true);
            }
            return nbeList_new;
        }

        for (var n = 0; n < nbeList.Count; n++)
        {
            if (common.isEmpty(nbeList[n].adver_depName))
            {
                nbeList[n].adver_depName = parseDep(nbeList[n].adver_dep);
            }
        }

        log.endWrite(nbeList.ToString(), className, methodName);
        if (nbeList.Count == 0)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('查無資料!');", true);
        }
        return nbeList;
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
    /// <summary>
    /// //由發布單位代號(adver_depart_id)求得發布單位名稱(depart_name)
    /// </summary>
    public string getadver_depart_nameByID(string adver_depart_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'depart_ID':" + adver_depart_id, className, methodName);

        string backStr = MITEMhgDao.Instance.getadver_depart_nameByID(adver_depart_id);//<==========================
        if (backStr == "成功")
        {
            backStr = adver_depart_id;
        }
        log.endWrite("'backStr':" + backStr, className, methodName);
        return backStr;
    }
    /// <summary>
    /// 新增布告欄細項資料
    /// </summary>
    public string addNoticeDetail(addNoticeDetail and)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string ComID = Session["ComID"] == null ? "" : Session["ComID"].ToString();
        //string Comid = Session["ComID"].ToString();
        //string adver_Com = Session["ComID"].ToString();
        //string ip = common.GetIP4Address();
        //and.add_ip = ip; 
        log.startWrite("'adver_item':" + and.adver_item + "'adver_depart_id':" + and.adver_depart_id + "'adver_subject':" + and.adver_subject + "'adver_content':" + and.adver_content + "'adver_depart_id':" + and.adver_depart_id + "'adver_employ_id':" + and.adver_employ_id + "'adver_Com':" + and.adver_Com + "'add_ip':" + and.add_ip, className, methodName);
        //Session["U_Leader"].ToString();
        var se = indexService.Instance.getUserData(and.add_user);
        string ComID = se.ComID;
        and.adver_Com = ComID;
        and.adver_depart_id = se.U_MDEP;//部門代號
        //and.adver_dep = se.U_MDEP;
        string backStr = MBULThgDao.Instance.addNoticeDetail(and);//<==========================
        if (backStr == "成功")
        {
            backStr = and.adver_id;
        }
        log.endWrite("'backStr':" + backStr, className, methodName);
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
        dde.ddesc = "全公司99999";
        ddeList.Add(dde);
        dde = null;
        log.endWrite(ddeList.ToString(), className, methodName);
        return ddeList;
    }

    //public string parseDep(string dep)
    //{
    //    string backString = string.Empty;
    //    switch (dep)
    //    {
    //        case "6666":
    //            backString = "全行政部";
    //            break;
    //        case "1111":
    //            backString = "全營運事業部";
    //            break;
    //        case "3333":
    //            backString = "全理財推廣部";
    //            break;
    //        case "5555":
    //            backString = "全財富管理部";
    //            break;
    //        case "7777":
    //            backString = "全投資推廣部";
    //            break;
    //        case "8888":
    //            backString = "全營運1部";
    //            break;
    //        case "2222":
    //            backString = "全營運2部";
    //            break;
    //        case "9999":
    //            backString = "全公司111";
    //            break;
    //    }
    //    return backString;
    //}

    public string deleteData(string adver_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'adver_id' :" + adver_id, className, methodName);

        string backStr = MBULThgDao.Instance.deleteData(adver_id);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }


}