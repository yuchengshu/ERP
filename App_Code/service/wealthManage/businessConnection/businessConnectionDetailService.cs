using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// businessConnectionService 的摘要描述
/// </summary>
public class businessConnectionDetailService
{
    //引用時不用再NEW
    private static businessConnectionDetailService _instance = new businessConnectionDetailService();
    public static businessConnectionDetailService Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public businessConnectionDetailService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //getBusinessConnectionDataEditRecord
    public List<MPMCOTFDataEditRecordEntity> getBusinessConnectionDataEditRecord(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : " + M_ID, className, methodName);

        List<MPMCOTFDataEditRecordEntity> bce = MCOTFhgDao.Instance.getBusinessConnectionDataEditRecord(M_ID);//<==========
        List<ditcodedescEntity> ddeMCOTFList = MITEMhgDao.Instance.getditcodedescEntityList("MCOTF");//<==
        businessConnectionEntity businessConnectionEntity = new businessConnectionEntity();
        return bce;
    }
    //20230203進度
    /// <summary>
    /// 取得業務聯絡單明細
    /// </summary>
    /// <param name="f_id"></param>
    /// <returns></returns>
    public MPMCOTFDetailEntity getBusinessConnectionDetail(string f_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'f_ID' : " + f_ID, className, methodName);
        /// 取得業務聯絡單明細
        MPMCOTFDetailEntity bce = MCOTFhgDao.Instance.getBusinessConnectionDetail(f_ID);//<==========
        //List<ditcodedescEntity> ddeMCOTFList = MITEMhgDao.Instance.getditcodedescEntityList("MCOTF");//<==
        //businessConnectionEntity businessConnectionEntity = new businessConnectionEntity();
        return bce;
        //for (var i = 0; i < ddeMCOTFList.Count; i++)
        //{
        //    if (bce.CF_Item == ddeMCOTFList[i].ditcode)
        //    {
        //        bce.CF_ItemName = ddeMCOTFList[i].ddesc;
        //    }
        //}
        //List<ditcodedescEntity> ddeMTOBJList = MITEMhgDao.Instance.getditcodedescEntityList("MTOBJ");//<==
        //for (var j = 0; j < ddeMTOBJList.Count; j++)
        //{
        //    if (bce.Obj == ddeMTOBJList[j].ditcode)
        //    {
        //        bce.ObjName = ddeMTOBJList[j].ddesc;
        //    }
        //}
        //mcDataEntity mde = MUSERhgDao.Instance.getMCdata(bce.add_user);
        //bce.add_userName = mde.U_Name;
        //mcDataEntity anlyst = MUSERhgDao.Instance.getMCdata(bce.MP_ID);
        //bce.MP_IDName = anlyst.U_Name;
        //List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList(bce.MP_ID);//<====
        //for (var k = 0; k < ddeList.Count; k++)
        //{
        //    if (bce.MP_Item == ddeList[k].ditcode)
        //    {
        //        bce.MP_ItemName = ddeList[k].ddesc;
        //    }
        //}
        //assignNameDateEntity ande = MRYGChgDao.Instance.getAssignNameDate(bce.M_ID);
        //if (ande != null)
        //{
        //    bce.Assign_name = ande.Assign_Name;
        //    bce.Assign_date = ande.Assign_Date;
        //}
        //else
        //{
        //    bce.Assign_name = common.empty;
        //    bce.Assign_date = common.empty;
        //}
        //string[] fifteenDayAgo = (DateTime.Now.AddDays(-15).ToString()).Split(' ');
        //List<DMBERentity> deList = DMBERhgDao.Instance.getDMBERdata(bce.M_ID, common.empty, fifteenDayAgo[0]);//<==========
        //if (deList.Count != 0)
        //{
        //    bce.DM_MarkTime = deList[0].DM_MarkTime == null ? common.empty : deList[0].DM_MarkTime;
        //    bce.DM_MC_Name = deList[0].DM_MC_Name == null ? common.empty : deList[0].DM_MC_Name;
        //}
        //else
        //{
        //    bce.DM_MarkTime = common.empty;
        //    bce.DM_MC_Name = common.empty;
        //}
        //var str = common.empty;
        //int nowCount = 0;
        //string[] messArr = bce.Mess.Split(',');
        //string[] faxArr = bce.Fax.Split(',');
        //List<ditcodedescEntity> ddePITEMList = MITEMhgDao.Instance.getditcodedescEntityList("PITEM");//<==
        //switch (bce.CF_Item) {
        //    case "0001":
        //        bce.Results_ItemName = deCode.Results_Item(bce.Results_Item);
        //        bce.T_TypeName = deCode.T_Type(bce.T_Type);

        //        for (var m = 0; m < ddePITEMList.Count; m++)
        //        {
        //            if (bce.T_PType == ddePITEMList[m].ditcode)
        //            {
        //                bce.T_PTypeName = ddePITEMList[m].ddesc;
        //            }
        //            if (bce.T_PType1 == ddePITEMList[m].ditcode)
        //            {
        //                bce.T_PType1Name = ddePITEMList[m].ddesc;
        //            }
        //            if (bce.T_PType2 == ddePITEMList[m].ditcode)
        //            {
        //                bce.T_PType2Name = ddePITEMList[m].ddesc;
        //            }
        //            if (bce.VD_Type == ddePITEMList[m].ditcode)
        //            {
        //                bce.VD_TypeName = ddePITEMList[m].ddesc;
        //            }
        //            if (bce.D_Type == ddePITEMList[m].ditcode)
        //            {
        //                bce.D_TypeName = ddePITEMList[m].ddesc;
        //            }
        //        }
        //        str = common.empty;
        //        nowCount = 0;
        //        string[] MediaArr = bce.Media.Split(',');
        //        foreach (var ss in MediaArr)
        //        {
        //            if (nowCount > 0)
        //            {
        //                str += ",";
        //            }
        //            str += deCode.Media(ss);
        //            nowCount += 1;
        //        }
        //        str = common.empty;
        //        nowCount = 0;
        //        foreach (var ss in faxArr)
        //        {
        //            if (nowCount > 0)
        //            {
        //                str += ",";
        //            }
        //            str += deCode.Fax(ss.Trim());
        //            nowCount += 1;
        //        }
        //        bce.FaxName = str;
        //        str = common.empty;
        //        nowCount = 0;
        //        foreach (var ss in messArr)
        //        {
        //            if (nowCount > 0)
        //            {
        //                str += ",";
        //            }
        //            str += deCode.Mess(ss.Trim());
        //            nowCount += 1;
        //        }
        //        bce.MessName = str;
        //        bce.MediaName = str;
        //        bce.INV_Open_ItemName = deCode.INV_Open_Item(bce.INV_Open_Item);
        //        bce.INV_ITEMName = deCode.INV_ITEM(bce.INV_ITEM);
        //        bce.T_IvoName = deCode.T_Ivo(bce.T_Ivo);
        //        bce.Paymoney = common.stringToIntThousand(bce.Paymoney);
        //        break;
        //    case "0002":
        //        str = common.empty;
        //        nowCount = 0;
        //        foreach (var ss in messArr)
        //        {
        //            if (nowCount > 0)
        //            {
        //                str += ",";
        //            }
        //            str += deCode.Mess(ss.Trim());
        //            nowCount += 1;
        //        }
        //        bce.MessName = str;
        //        break;
        //    case "0003":
        //        str = common.empty;
        //        nowCount = 0;
        //        foreach (var ss in faxArr)
        //        {
        //            if (nowCount > 0)
        //            {
        //                str += ",";
        //            }
        //            str += deCode.Fax(ss.Trim());
        //            nowCount += 1;
        //        }
        //        bce.FaxName = str;
        //        break;
        //    case "0004":
        //        bce.CMonthName = deCode.CMonth(bce.CMonth.Trim());
        //        break;
        //    case "0005":
        //        bce.MC_Name = MMBERhgDao.Instance.getMCname(bce.M_ID);
        //        break;
        //    case "0006":
        //        mcDataEntity mde1 = MUSERhgDao.Instance.getMCdata(bce.D_MP);
        //        bce.D_MPname = mde1.U_Name;
        //        List<ditcodedescEntity> ddeD_MPList = MITEMhgDao.Instance.getditcodedescEntityList(bce.D_MP);//<==
        //        for (var i = 0; i < ddeD_MPList.Count; i++)
        //        {
        //            if (ddeD_MPList[i].ditcode == bce.D_Item)
        //            {
        //                bce.D_ItemName = ddeD_MPList[i].ddesc;
        //            }
        //        }
        //        tradeRecordEntity tre = MTRAThgDao.Instance.getTradeData(bce.T_ID);
        //        bce.T_PayMoney = common.stringToIntThousand(tre.T_PayMoney);
        //        bce.T_StartDate = tre.T_StartDate;
        //        bce.T_EndDate = tre.T_EndDate;

        //        for (var m = 0; m < ddePITEMList.Count; m++)
        //        {
        //            if (bce.D_Type == ddePITEMList[m].ditcode)
        //            {
        //                bce.D_TypeName = ddePITEMList[m].ddesc;
        //            }
        //        }
        //        DateTime dn = DateTime.Now;
        //        DateTime ds = Convert.ToDateTime(bce.T_StartDate);
        //        DateTime de = (Convert.ToDateTime(bce.T_EndDate)).AddDays(1);

        //        string dns = (common.getTwoDaysDifferenceBackDouble(ds,dn)).ToString();
        //        double Use_Day = double.Parse(dns);
        //        string des = (common.getTwoDaysDifferenceBackDouble(ds,de)).ToString();
        //        double All_Day = double.Parse(des);
        //        double T_PayMoney = double.Parse(tre.T_PayMoney);
        //        double Percent30 = T_PayMoney * 0.3;
        //        double New_PayMoney = 0;
        //        log.debug2("Use_Day=" + Use_Day + "&All_Day=" + All_Day + "&T_PayMoney=" + T_PayMoney + "&Percent30=" + Percent30, "", "");
        //        if (Use_Day >= 7)
        //        {
        //            New_PayMoney = T_PayMoney - (((T_PayMoney - Percent30) * Use_Day / All_Day) + Percent30);
        //        }
        //        else
        //        {
        //            New_PayMoney = T_PayMoney;
        //        }
        //        bce.New_PayMoney = common.stringToIntThousand(New_PayMoney.ToString());
        //        log.debug2("dns=" + dns + "&des=" + des, "", "");
        //        break;
        //    case "0007":
        //        break;
        //    case "0008":
        //        bce.B_Paymoney = common.stringToIntThousand(bce.B_Paymoney);
        //        break;
        //    case "0009":
        //        bce.S_tagName = deCode.S_tag(bce.S_tag);
        //        break;
        //    case "0010":
        //        bce.C_tagName = deCode.C_tag(bce.C_tag);
        //        break;
        //}
        //bce.U_LeaderStatusName = deCode.personStatus(bce.U_LeaderStatus);
        //bce.EX_LeaderStatusName = deCode.personStatus(bce.EX_LeaderStatus);
        //bce.EX_StatusName = deCode.personStatus(bce.EX_Status);
        //log.endWrite("'bce' : " + bce.ToString(), className, methodName);
        //return bce;
    }

    public string getM_IDFromF_ID(string F_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'F_ID' : " + F_ID, className, methodName);
        string M_ID = MCOTFhgDao.Instance.getM_ID(F_ID);

        return M_ID;
    }
    //取得更改責任助理[原助理]
    public string getOLD_MC_NAME(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : " + M_ID, className, methodName);
        string OLD_MC_NAME = MCOTFhgDao.Instance.getOLD_MC_NAME(M_ID);

        return OLD_MC_NAME;

    }

    public string getDetail_S_tag(string F_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'F_ID' : " + F_ID, className, methodName);

        string S_tag = MCOTFhgDao.Instance.getDetail_S_tag(F_ID);//<==========
        return S_tag;
    }
    public string getDetail_S_ID(string F_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'F_ID' : " + F_ID, className, methodName);

        string S_ID = MCOTFhgDao.Instance.getDetail_S_ID(F_ID);//<==========
        return S_ID;
    }

    public string getDetail_S_Name(string F_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'F_ID' : " + F_ID, className, methodName);

        string S_Name = MCOTFhgDao.Instance.getDetail_S_Name(F_ID);//<==========
        return S_Name;
    }

    public string getDetail_S_Date(string F_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'F_ID' : " + F_ID, className, methodName);

        string S_Date = MCOTFhgDao.Instance.getDetail_S_Date(F_ID);//<==========
        return S_Date;
    }


    //月份
    public string getCMonth(string F_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'F_ID' : " + F_ID, className, methodName);

        string CMonth = MCOTFhgDao.Instance.getCMonth(F_ID);//<==========
        return CMonth;
    }
    //取得業績分類欄位明細
    //歸屬
    public string getAttachName(string F_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'F_ID' : " + F_ID, className, methodName);

        string AttachName = MCOTFhgDao.Instance.getAttachName(F_ID);//<==========
        return AttachName;
    }

    //其他
    public string getOther(string F_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'F_ID' : " + F_ID, className, methodName);

        string Other = MCOTFhgDao.Instance.getOther(F_ID);//<==========
        return Other;
    }
    //備註
    public string getPS(string F_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'F_ID' : " + F_ID, className, methodName);

        string SaleDetail = MCOTFhgDao.Instance.getPS(F_ID);//<==========
        return SaleDetail;
    }
    //取得傳真稿
    public string getFAX(string F_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'F_ID' : " + F_ID, className, methodName);

        string FAX = MCOTFhgDao.Instance.getFAX(F_ID);//<==========
        return FAX;
    }
    //取得更改責任助理[更改為]
    public string getNEW_MC_NAME(string F_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'F_ID' : " + F_ID, className, methodName);

        string NEW_MC_NAME = MCOTFhgDao.Instance.getNEW_MC_NAME(F_ID);//<==========
      return NEW_MC_NAME;
    }

    public MPMCOTFDetailEntity getBusinessConnectionDetail_MID(string MID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MID' : " + MID, className, methodName);

        MPMCOTFDetailEntity bce = MCOTFhgDao.Instance.getBusinessConnectionDetail_MID(MID);//<==========
        //List<ditcodedescEntity> ddeMCOTFList = MITEMhgDao.Instance.getditcodedescEntityList("MCOTF");//<==
        //businessConnectionEntity businessConnectionEntity = new businessConnectionEntity();
        return bce;
        //for (var i = 0; i < ddeMCOTFList.Count; i++)
        //{
        //    if (bce.CF_Item == ddeMCOTFList[i].ditcode)
        //    {
        //        bce.CF_ItemName = ddeMCOTFList[i].ddesc;
        //    }
        //}
        //List<ditcodedescEntity> ddeMTOBJList = MITEMhgDao.Instance.getditcodedescEntityList("MTOBJ");//<==
        //for (var j = 0; j < ddeMTOBJList.Count; j++)
        //{
        //    if (bce.Obj == ddeMTOBJList[j].ditcode)
        //    {
        //        bce.ObjName = ddeMTOBJList[j].ddesc;
        //    }
        //}
        //mcDataEntity mde = MUSERhgDao.Instance.getMCdata(bce.add_user);
        //bce.add_userName = mde.U_Name;
        //mcDataEntity anlyst = MUSERhgDao.Instance.getMCdata(bce.MP_ID);
        //bce.MP_IDName = anlyst.U_Name;
        //List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList(bce.MP_ID);//<====
        //for (var k = 0; k < ddeList.Count; k++)
        //{
        //    if (bce.MP_Item == ddeList[k].ditcode)
        //    {
        //        bce.MP_ItemName = ddeList[k].ddesc;
        //    }
        //}
        //assignNameDateEntity ande = MRYGChgDao.Instance.getAssignNameDate(bce.M_ID);
        //if (ande != null)
        //{
        //    bce.Assign_name = ande.Assign_Name;
        //    bce.Assign_date = ande.Assign_Date;
        //}
        //else
        //{
        //    bce.Assign_name = common.empty;
        //    bce.Assign_date = common.empty;
        //}
        //string[] fifteenDayAgo = (DateTime.Now.AddDays(-15).ToString()).Split(' ');
        //List<DMBERentity> deList = DMBERhgDao.Instance.getDMBERdata(bce.M_ID, common.empty, fifteenDayAgo[0]);//<==========
        //if (deList.Count != 0)
        //{
        //    bce.DM_MarkTime = deList[0].DM_MarkTime == null ? common.empty : deList[0].DM_MarkTime;
        //    bce.DM_MC_Name = deList[0].DM_MC_Name == null ? common.empty : deList[0].DM_MC_Name;
        //}
        //else
        //{
        //    bce.DM_MarkTime = common.empty;
        //    bce.DM_MC_Name = common.empty;
        //}
        //var str = common.empty;
        //int nowCount = 0;
        //string[] messArr = bce.Mess.Split(',');
        //string[] faxArr = bce.Fax.Split(',');
        //List<ditcodedescEntity> ddePITEMList = MITEMhgDao.Instance.getditcodedescEntityList("PITEM");//<==
        //switch (bce.CF_Item) {
        //    case "0001":
        //        bce.Results_ItemName = deCode.Results_Item(bce.Results_Item);
        //        bce.T_TypeName = deCode.T_Type(bce.T_Type);

        //        for (var m = 0; m < ddePITEMList.Count; m++)
        //        {
        //            if (bce.T_PType == ddePITEMList[m].ditcode)
        //            {
        //                bce.T_PTypeName = ddePITEMList[m].ddesc;
        //            }
        //            if (bce.T_PType1 == ddePITEMList[m].ditcode)
        //            {
        //                bce.T_PType1Name = ddePITEMList[m].ddesc;
        //            }
        //            if (bce.T_PType2 == ddePITEMList[m].ditcode)
        //            {
        //                bce.T_PType2Name = ddePITEMList[m].ddesc;
        //            }
        //            if (bce.VD_Type == ddePITEMList[m].ditcode)
        //            {
        //                bce.VD_TypeName = ddePITEMList[m].ddesc;
        //            }
        //            if (bce.D_Type == ddePITEMList[m].ditcode)
        //            {
        //                bce.D_TypeName = ddePITEMList[m].ddesc;
        //            }
        //        }
        //        str = common.empty;
        //        nowCount = 0;
        //        string[] MediaArr = bce.Media.Split(',');
        //        foreach (var ss in MediaArr)
        //        {
        //            if (nowCount > 0)
        //            {
        //                str += ",";
        //            }
        //            str += deCode.Media(ss);
        //            nowCount += 1;
        //        }
        //        str = common.empty;
        //        nowCount = 0;
        //        foreach (var ss in faxArr)
        //        {
        //            if (nowCount > 0)
        //            {
        //                str += ",";
        //            }
        //            str += deCode.Fax(ss.Trim());
        //            nowCount += 1;
        //        }
        //        bce.FaxName = str;
        //        str = common.empty;
        //        nowCount = 0;
        //        foreach (var ss in messArr)
        //        {
        //            if (nowCount > 0)
        //            {
        //                str += ",";
        //            }
        //            str += deCode.Mess(ss.Trim());
        //            nowCount += 1;
        //        }
        //        bce.MessName = str;
        //        bce.MediaName = str;
        //        bce.INV_Open_ItemName = deCode.INV_Open_Item(bce.INV_Open_Item);
        //        bce.INV_ITEMName = deCode.INV_ITEM(bce.INV_ITEM);
        //        bce.T_IvoName = deCode.T_Ivo(bce.T_Ivo);
        //        bce.Paymoney = common.stringToIntThousand(bce.Paymoney);
        //        break;
        //    case "0002":
        //        str = common.empty;
        //        nowCount = 0;
        //        foreach (var ss in messArr)
        //        {
        //            if (nowCount > 0)
        //            {
        //                str += ",";
        //            }
        //            str += deCode.Mess(ss.Trim());
        //            nowCount += 1;
        //        }
        //        bce.MessName = str;
        //        break;
        //    case "0003":
        //        str = common.empty;
        //        nowCount = 0;
        //        foreach (var ss in faxArr)
        //        {
        //            if (nowCount > 0)
        //            {
        //                str += ",";
        //            }
        //            str += deCode.Fax(ss.Trim());
        //            nowCount += 1;
        //        }
        //        bce.FaxName = str;
        //        break;
        //    case "0004":
        //        bce.CMonthName = deCode.CMonth(bce.CMonth.Trim());
        //        break;
        //    case "0005":
        //        bce.MC_Name = MMBERhgDao.Instance.getMCname(bce.M_ID);
        //        break;
        //    case "0006":
        //        mcDataEntity mde1 = MUSERhgDao.Instance.getMCdata(bce.D_MP);
        //        bce.D_MPname = mde1.U_Name;
        //        List<ditcodedescEntity> ddeD_MPList = MITEMhgDao.Instance.getditcodedescEntityList(bce.D_MP);//<==
        //        for (var i = 0; i < ddeD_MPList.Count; i++)
        //        {
        //            if (ddeD_MPList[i].ditcode == bce.D_Item)
        //            {
        //                bce.D_ItemName = ddeD_MPList[i].ddesc;
        //            }
        //        }
        //        tradeRecordEntity tre = MTRAThgDao.Instance.getTradeData(bce.T_ID);
        //        bce.T_PayMoney = common.stringToIntThousand(tre.T_PayMoney);
        //        bce.T_StartDate = tre.T_StartDate;
        //        bce.T_EndDate = tre.T_EndDate;

        //        for (var m = 0; m < ddePITEMList.Count; m++)
        //        {
        //            if (bce.D_Type == ddePITEMList[m].ditcode)
        //            {
        //                bce.D_TypeName = ddePITEMList[m].ddesc;
        //            }
        //        }
        //        DateTime dn = DateTime.Now;
        //        DateTime ds = Convert.ToDateTime(bce.T_StartDate);
        //        DateTime de = (Convert.ToDateTime(bce.T_EndDate)).AddDays(1);

        //        string dns = (common.getTwoDaysDifferenceBackDouble(ds,dn)).ToString();
        //        double Use_Day = double.Parse(dns);
        //        string des = (common.getTwoDaysDifferenceBackDouble(ds,de)).ToString();
        //        double All_Day = double.Parse(des);
        //        double T_PayMoney = double.Parse(tre.T_PayMoney);
        //        double Percent30 = T_PayMoney * 0.3;
        //        double New_PayMoney = 0;
        //        log.debug2("Use_Day=" + Use_Day + "&All_Day=" + All_Day + "&T_PayMoney=" + T_PayMoney + "&Percent30=" + Percent30, "", "");
        //        if (Use_Day >= 7)
        //        {
        //            New_PayMoney = T_PayMoney - (((T_PayMoney - Percent30) * Use_Day / All_Day) + Percent30);
        //        }
        //        else
        //        {
        //            New_PayMoney = T_PayMoney;
        //        }
        //        bce.New_PayMoney = common.stringToIntThousand(New_PayMoney.ToString());
        //        log.debug2("dns=" + dns + "&des=" + des, "", "");
        //        break;
        //    case "0007":
        //        break;
        //    case "0008":
        //        bce.B_Paymoney = common.stringToIntThousand(bce.B_Paymoney);
        //        break;
        //    case "0009":
        //        bce.S_tagName = deCode.S_tag(bce.S_tag);
        //        break;
        //    case "0010":
        //        bce.C_tagName = deCode.C_tag(bce.C_tag);
        //        break;
        //}
        //bce.U_LeaderStatusName = deCode.personStatus(bce.U_LeaderStatus);
        //bce.EX_LeaderStatusName = deCode.personStatus(bce.EX_LeaderStatus);
        //bce.EX_StatusName = deCode.personStatus(bce.EX_Status);
        //log.endWrite("'bce' : " + bce.ToString(), className, methodName);
        //return bce;
    }
    /// <summary>
    /// 取得客戶資料修改紀錄
    /// </summary>
    /// <param name="M_ID"></param>
    /// <returns></returns>
    public List<editCustomerDataRecord> getCustomerDataEditRecord(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : " + M_ID, className, methodName);

        List<editCustomerDataRecord> ecdrList = MLOGBhgDao.Instance.getCustomerDataEditRecord(M_ID);//<==========
        List<mcDataEntity> mcdeList = MUSERhgDao.Instance.getMClist(true);
        for (var i = 0; i < ecdrList.Count; i++)
        {
            for (var j = 0; j < mcdeList.Count; j++)
            {
                if (ecdrList[i].edit_user == mcdeList[j].U_Num)
                {
                    ecdrList[i].edit_userName = mcdeList[j].U_Name;
                }
            }
        }
        log.endWrite("'ecdrList' : " + ecdrList.ToString(), className, methodName);
        return ecdrList;
    }
    ////進行簽核通過的動作!!!!!!!!!!!!!(20230525WORK!!!!!!!!!)
    ////進行簽核動作
    public string signStatus(signStatusEntity sse)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'f_id' : " + sse.f_id + "'signerStatusType' : " + sse.signerStatusType + "'status' : " + sse.status + "'psType' : " + sse.psType + "'ps' : " + sse.ps + "'signerType' : " + sse.signerType + "'signerNameType' : " + sse.signerNameType + "'U_Num' : " + sse.U_Num + "'U_Name' : " + sse.U_Name + "'timeType' : " + sse.timeType, className, methodName);
        string backStr = "";
        if (sse.status == "1")//1:核准
        {
            //  ////進行簽核通過的動作!!!!!!!!!!!!!(20230523WORK!!!!!!!!!)
            ///實作簽核的動作(202623WORK!!!!!!!!!
            backStr = MCOTFhgDao.Instance.signStatus(sse);//<==========
        }
        if (sse.status == "2")//2:退回
        {
            if (backStr == "成功")
            {
                string MS_ID = common.getDateTimeStr() + "_" + common.getRandom1();
                string MS_Title = "【通知】「" + sse.M_Name + "」業務聯絡單-簽核失敗 ";
                string MS_Text = "<a href=/wealthManage/businessConnection/MPMCOTF/businessConnectionDetail.aspx?f_id=" + sse.f_id + "&MENU_no=" + sse.MENU_no + " target=_blank>" + MS_Title + "</A>";
                string MS_Receiver = sse.MS_Receiver;
                string MS_Sender = sse.U_Num;
                string add_User = sse.U_Num;
                string add_ip = sse.add_ip;
                common.sendMail(MS_ID, MS_Title, MS_Text, MS_Receiver, MS_Sender, add_User, add_ip);

            }
        }

        log.endWrite("'backStr' : " + backStr, className, methodName);
        return backStr;
    }

}