using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// customerManageDetailService 的摘要描述
/// </summary>
public class customerDetailService
{
    //引用時不用再NEW
    private static customerDetailService _instance = new customerDetailService();
    public static customerDetailService Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public customerDetailService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    /// <summary>
    /// 取得交易紀錄
    /// </summary>
    /// <param name="M_ID"></param>
    /// <returns></returns>
    public List<tradeRecordEntity> getTradeRecord(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("M_ID=" + M_ID, className, methodName);

        List<tradeRecordEntity> treList = MTRAThgDao.Instance.getTradeRecord(M_ID, common.empty);//<==========
        List<ditcodedescEntity> BKSTSddeList = MITEMhgDao.Instance.getditcodedescEntityList("BKSTS");//<====
        for (var i = 0; i < treList.Count; i++)
        {
            List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList(treList[i].MP);//<====
            invoiceEntity ie = DINVOhgDao.Instance.getInvoiceData(treList[i].T_ID);
            if (!common.isEmpty(ie.Invoice_CreateDate))
            {
                treList[i].Invoice_CreateDate = ie.Invoice_CreateDate.Split(' ')[0];
                treList[i].invoice_num = ie.invoice_num;
            }
            
            for (var n = 0; n < ddeList.Count; n++)
            {
                if (ddeList[n].ditcode == treList[i].T_Item)
                {
                    treList[i].T_ItemName = ddeList[n].ddesc;
                }
            }
            for (var m = 0; m < BKSTSddeList.Count; m++)
            {
                if (BKSTSddeList[m].ditcode == treList[i].Back_Status)
                {
                    treList[i].Back_StatusName = BKSTSddeList[m].ddesc;
                }
            }

            switch (treList[i].T_Type)
            {
                case "0001":
                    treList[i].T_TypeName = "一般";
                        break;
                    case "0002":
                    treList[i].T_TypeName = "會場";
                        break;
                    case "0003":
                    treList[i].T_TypeName = "特殊";
                        break;
                    case "0004":
                    treList[i].T_TypeName = "獎勵";
                        break;
            }

            switch (treList[i].Light_Status)
            {
                case "G":
                    treList[i].Light_StatusName = "綠燈";
                    break;
                case "R":
                    treList[i].Light_StatusName = "紅燈";
                    break;
                case "Y":
                    treList[i].Light_StatusName = "黃燈";
                    break;
               
            }

            treList[i].T_AccountDate = (treList[i].T_AccountDate.Split(' '))[0];
            treList[i].T_StartDate = (treList[i].T_StartDate.Split(' '))[0];
            treList[i].INV_Createdate = (treList[i].INV_Createdate.Split(' '))[0];
            treList[i].T_EndDate = (treList[i].T_EndDate.Split(' '))[0];
            treList[i].T_PauseDate = (treList[i].T_PauseDate.Split(' '))[0];
            DateTime dn = DateTime.Now;
            DateTime d1 = Convert.ToDateTime(treList[i].T_StartDate);
            DateTime d2 = (Convert.ToDateTime(treList[i].T_EndDate)).AddDays(1);

            treList[i].contractDays = (common.getTwoDaysDifference(d1, d2)).ToString();
            treList[i].maturityDays = (common.getTwoDaysDifference(dn, d2)).ToString();
            if (!common.isEmpty(treList[i].T_PauseDate))
            {
                DateTime dp = Convert.ToDateTime(treList[i].T_PauseDate);
                treList[i].T_PauseDateDays = common.getTwoDaysDifference(dp, d2).ToString();
            }
            DateTime tempDt;
            int contractDaysLessWeekday = 0;
            int maturityDaysLessWeekday = 0;

            for (int t= 0; t < ((TimeSpan)(d2 - d1)).Days; t++)
            {
                tempDt = d1.AddDays(t);
                if (tempDt.DayOfWeek != DayOfWeek.Saturday && tempDt.DayOfWeek != DayOfWeek.Sunday)
                {
                    contractDaysLessWeekday++;
                }

            }

            for (int z = 0; z < ((TimeSpan)(d2 - dn)).Days; z++)
            {
                tempDt = dn.AddDays(z);
                if (tempDt.DayOfWeek != DayOfWeek.Saturday && tempDt.DayOfWeek != DayOfWeek.Sunday)
                {
                    maturityDaysLessWeekday++;
                }

            }

            treList[i].contractDaysLessWeekday = contractDaysLessWeekday.ToString();
            treList[i].maturityDaysLessWeekday = maturityDaysLessWeekday.ToString();


            int dnd2Result = DateTime.Compare(dn, d2);
            /*log.debug2("dn=" + dn, "", "");
            log.debug2("d2=" + d2, "", "");
            log.debug2("dnd2Result="+ dnd2Result, "","");
            log.debug2("T_Status=" + treList[i].T_Status, "", "");*/
            if (treList[i].T_Status == "1" && dnd2Result < 0)
            {
                treList[i].T_Status = "進行中";
            }
            else if (treList[i].T_Status != "2" && dnd2Result > 0)
            {
                treList[i].T_Status = "已到期";
            }
            else if (treList[i].T_Status == "2")
            {
                treList[i].T_Status = "暫停中";
                d1 = Convert.ToDateTime(treList[i].T_PauseDate);
                d2 = (Convert.ToDateTime(treList[i].T_EndDate));

                treList[i].T_StatusPS = (treList[i].T_PauseDate.Split(' ')[0])+ "暫停 剩" + (common.getTwoDaysDifference(d1, d2)).ToString() + "天";
            }
            if (treList[i].Back_tag == "0")
            {
                treList[i].Back_tagName = "未歸";
            }
            else if (treList[i].Back_tag == "1")
            {
                treList[i].Back_tagName = "已歸";
            }
            if (!common.isEmpty(treList[i].ca_id))
            {
                treList[i].Back_tagLink = MCASHhgDao.Instance.getBackTagLink(treList[i].ca_id);
            }
           
            mcDataEntity mde = MUSERhgDao.Instance.getMCdata(treList[i].add_user);
            treList[i].add_user = mde.U_Name;
        }

        log.endWrite(treList.ToString(), className, methodName);
        return treList;

    }

    /// <summary>
    /// 取得收費明細
    /// </summary>
    /// <param name="T_ID"></param>
    /// <returns></returns>
    public List<chargeDetailEntity> getChargeDetailList(string T_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("T_ID=" + T_ID, className, methodName);

        List<chargeDetailEntity> cdeList = DTRAThgDao.Instance.getChargeDetailList(T_ID);//<==========
        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("PITEM");
        for (var i = 0; i < cdeList.Count; i++)
        {
            cdeList[i].Account_Date = cdeList[i].Account_Date.Split(' ')[0];
            for (var n = 0; n < ddeList.Count; n++)
            {
                if (cdeList[i].Pay_Type == ddeList[n].ditcode)
                {
                    cdeList[i].Pay_TypeName = ddeList[n].ddesc;
                }
            }
            if (cdeList[i].T_Com == "HG")
            {
                cdeList[i].T_ComName = "華冠";
            }
            else
            {
                cdeList[i].T_ComName = "天酷";
            }
        }
        log.endWrite(cdeList.ToString(), className, methodName);
        return cdeList;

    }


    /// <summary>
    /// 取得通話紀錄
    /// </summary>
    /// <param name="M_ID"></param>
    /// <returns></returns>
    public List<callRecordEntity> getCallRecordList(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("M_ID=" + M_ID, className, methodName);

        List<callRecordEntity> creList = MQUSTjoinMMBERhgDao.Instance.getCallRecordList(M_ID);//<==========
        List<mcDataEntity> mceList = MUSERhgDao.Instance.getMClist(false);
        for (var i = 0; i < creList.Count; i++)
        {
            creList[i].Q_Date = creList[i].Q_Date.Split(' ')[0];
            for (var n = 0; n < mceList.Count; n++)
            {
                if (mceList[n].U_Num == creList[i].Add_User)
                {
                    creList[i].Add_User = mceList[n].U_Name;
                }
            }
        }

        log.endWrite(creList.ToString(), className, methodName);
        return creList;
    }

    /// <summary>
    /// 取得活動資料
    /// </summary>
    /// <param name="M_Tel"></param>
    /// <returns></returns>
    public List<activityMessageEntity> getActivityMessageList(string M_Tel)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("M_Tel=" + M_Tel, className, methodName);

        List<activityMessageEntity> cmeList = MFRRPhgDao.Instance.getActivityMessageList(M_Tel);//<==========

        log.endWrite(cmeList.ToString(), className, methodName);
        return cmeList;

    }

    /// <summary>
    /// 取得公司資料
    /// </summary>
    /// <returns></returns>
    public companyDataEntity getCompanyData()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        companyDataEntity cde = MINVOhgDao.Instance.getCompanyData();

        log.endWrite(cde.ToString(), className, methodName);
        return cde;
    }

    /// <summary>
    /// 取得會場資料
    /// </summary>
    /// <returns></returns>
    public List<venueDataEntity> getVenueDataList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<venueDataEntity> vde = MVENUhgDao.Instance.getVenueDataList();

        log.endWrite(vde.ToString(), className, methodName);
        return vde;
    }

    /// <summary>
    /// 取得員工個人資料
    /// </summary>
    /// <param name="U_Num"></param>
    /// <returns></returns>
    public mcDataEntity getMCdata(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("U_Num :" + U_Num, className, methodName);

        mcDataEntity mde = MUSERhgDao.Instance.getMCdata(U_Num);//<==========

        log.endWrite(mde.ToString(), className, methodName);
        return mde;
    }

    /// <summary>
    /// 取得訂金資料
    /// </summary>
    /// <param name="M_ID"></param>
    /// <returns></returns>
    public downPaymentEntity getDownpayment(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : " + M_ID, className, methodName);

        downPaymentEntity dpe = MDEIThgDao.Instance.getDownpayment(M_ID);

        log.endWrite("'dpe' : " + dpe, className, methodName);
        return dpe;
    }

    /// <summary>
    /// 新增交易入帳資訊
    /// </summary>
    /// <param name="tre"></param>
    /// <returns></returns>
    public string sendMTRAT(tradeRecordEntity tre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'tre' : " + tre.ToString(), className, methodName);

        string backString  = MTRAThgDao.Instance.sendMTRAT(tre);

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    public string updateNormalEditTradeDetail(tradeRecordEntity tre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'tre' : " + tre.ToString(), className, methodName);

        string backString = MTRAThgDao.Instance.updateNormalEditTradeDetail(tre);

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }
    public string reSendEditData(tradeRecordEntity tre, chargeDetailEntity cde1, chargeDetailEntity cde2, ElectronicCalculatorInvoiceDetailEntity ecide)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("tre=" + tre + "&cde1=" + cde1 + "&cde2=" + cde2 + "ecide=" + ecide, className, methodName);
        string backString = MTRAThgDao.Instance.reSendEditData(tre);
        string backString2 = string.Empty;
        string backString3 = string.Empty;
        if (tre.T_Type == "1")
        {
            backString2 =DTRAThgDao.Instance.reSendEditData(cde1);
        }
        else if (tre.T_Type == "2")
        {

        }
        else if (tre.T_Type == "3")
        {
            backString2 = DTRAThgDao.Instance.reSendEditData(cde1);
            backString3 = DTRAThgDao.Instance.reSendEditData(cde2);
        }
        

        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }
    public string seSendEditData(tradeRecordEntity tre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("tre=" + tre.ToString(), className, methodName);

        string backString = MTRAThgDao.Instance.seSendEditData(tre);//<==========

        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }

    public string reseSendEditData(tradeRecordEntity tre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("tre=" + tre.ToString(), className, methodName);

        string backString = MTRAThgDao.Instance.reseSendEditData(tre);//<==========

        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }
    public string cddAddData(CDDDataEntity cdee)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("cdee=" + cdee.ToString(), className, methodName);

        string backString = MPCDDhgDao.Instance.cddAddData(cdee);//<==========

        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }
    /// <summary>
    /// 修改會員編號及密碼
    /// </summary>
    /// <param name="M_ID"></param>
    /// <param name="M_Num"></param>
    /// <param name="M_Password"></param>
    /// <returns></returns>
    public string updateMnumMpassword(string M_ID, string M_Num, string M_Password)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'M_ID' : {0}, 'M_Num' : {1}, 'M_Password' : {2}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, M_ID, M_Num, M_Password));
        log.startWrite(sb.ToString(), className, methodName);


        string backString = MMBERhgDao.Instance.updateMnumMpassword(M_ID, M_Num, M_Password); //<==========

        log.endWrite("'backString' :" + backString, className, methodName);
        return backString;
    }


    /// <summary>
    /// 查詢是否有會員編號
    /// </summary>
    /// <param name="M_Num"></param>
    /// <returns></returns>
    public string hasMnum(string M_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_Num' :" + M_Num, className, methodName);


        string backString = MMBERhgDao.Instance.hasMnum(M_Num); //<==========

        log.endWrite("'backString' :" + backString, className, methodName);
        return backString;
    }

    /// <summary>
    /// 新增交易明細
    /// </summary>
    /// <param name="cde"></param>
    /// <returns></returns>
    public string sendDTRAT(chargeDetailEntity cde)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(cde.ToString(), className, methodName);

        string backString = DTRAThgDao.Instance.sendDTRAT(cde);//<==========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;

    }

    /// <summary>
    /// 儲存修改客戶基本資料的歷程
    /// </summary>
    /// <param name="ecdr"></param>
    /// <returns></returns>
    public string saveEditCustomerDataRecord(editCustomerDataRecord ecdr)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ecdr' : " + ecdr.ToString(), className, methodName);

        string backString = MLOGBhgDao.Instance.saveEditCustomerDataRecord(ecdr);//<==========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }


    /// <summary>
    /// 儲存修改客戶業務員的歷程
    /// </summary>
    /// <param name="ecmdr"></param>
    /// <returns></returns>
    public string saveEditCustomerMCdataRecord(editCustomerMCdataRecord ecmdr)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ecmdr' : " + ecmdr.ToString(), className, methodName);

        string backString = MCHAGBhgDao.Instance.saveEditCustomerMCdataRecord(ecmdr);//<==========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }


    /// <summary>
    /// 新增業務聯絡單
    /// </summary>
    /// <param name="bce"></param>
    /// <returns></returns>
    public string addBusinessConnection(businessConnectionEntity bce)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'bce' : " + bce.ToString(), className, methodName);
       
        string backString = MCOTFhgDao.Instance.addBusinessConnection(bce);//<==========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    /// <summary>
    /// 新增通話紀錄
    /// </summary>
    /// <param name="tcme"></param>
    /// <returns></returns>
    public string addCallRecordDetail(callRecordEntity cre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'cre' : " + cre.ToString(), className, methodName);

        string backString = MQUSThgDao.Instance.addCallRecordDetail(cre);//<==========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }


    /// <summary>
    /// 刪除通話紀錄
    /// </summary>
    /// <param name="Auto_id"></param>
    /// <returns></returns>
    public string deleteCallRecordDetail(string Auto_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Auto_id' : " + Auto_id, className, methodName);

        string backString = MQUSThgDao.Instance.deleteCallRecordDetail(Auto_id);//<==========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }


    /// <summary>
    /// 修改通話紀錄
    /// </summary>
    /// <param name="cre"></param>
    /// <returns></returns>
    public string editCallRecordDetail(callRecordEntity cre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'cre' : " + cre.ToString(), className, methodName);

        string backString = MQUSThgDao.Instance.editCallRecordDetail(cre);//<==========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    /// <summary>
    /// 刪除收費明細
    /// </summary>
    /// <param name="DT_ID"></param>
    /// <returns></returns>
    public string deleteChargeDetail(string DT_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'DT_ID' : " + DT_ID, className, methodName);

        string backString = DTRAThgDao.Instance.deleteChargeDetail(DT_ID);//<==========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }
    
    public string setWebFax(string T_id, string add_ip,string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'T_id' : " + T_id + "'add_ip' : " + add_ip + "'M_ID' : " + M_ID, className, methodName);
        string backString = "";
        //1.提取會員ERP基本資料
        customerDataEntity cde = MMBERhgDao.Instance.getSingalCustomerData(M_ID);
        //2.提取會員入會資料
        tradeRecordEntity tre = MTRAThgDao.Instance.getTradeRecordByTid(T_id);
        List<wAnalystEntity> waeList = wAnalystshgDao.Instance.getWAnalysts();
        string P_id = string.Empty;
        for (var i = 0; i < waeList.Count; i++)
        {
            if (waeList[i].U_Num == tre.MP)
            {
                P_id = waeList[i].T_id;
            }
        }
        List<RecordPeriodEntity> rpeList = new List<RecordPeriodEntity>();
        RecordPeriodEntity rpe = null;
        string[] T_FaxArr = tre.T_Fax.Split(',');
        string T_EndDate = tre.T_EndDate.Split(' ')[0] + " 23:59:59.000";
        for (var i = 0; i < T_FaxArr.Length; i++)
        {
            rpe = new RecordPeriodEntity();
            rpe.T_id = T_id;
            rpe.P_id = P_id;
            rpe.Open_tag = "0";
            
            rpe.Del_tag = "0";
            rpe.Add_user = "REX";
            switch (T_FaxArr[i])
            {
                case "4"://設解盤
                    rpe.MPRD_ID = "A0001";
                    rpe.DPRD_ID = "0004";
                    rpe.MClass = "VIP";
                    rpe.Mlevel = T_EndDate;
                    rpe.P_Tag = "1";
                    break;
                case "5"://設特別
                    rpe.MPRD_ID = "A0001";
                    rpe.DPRD_ID = "0003";
                    rpe.MClass = "特別";
                    rpe.Mlevel = T_EndDate;
                    rpe.P_Tag = "1";
                    break;
                case "6"://設特別
                    rpe.MPRD_ID = "A0001";
                    rpe.DPRD_ID = "0006";
                    rpe.MClass = "飆股";
                    rpe.Mlevel = T_EndDate;
                    rpe.P_Tag = "1";
                    break;
            }
            if (common.isEmpty(rpe.P_Tag))
            {
                switch (tre.T_Item)
                {
                    case "0001"://簡訊
                        rpe.MPRD_ID = "A0001";
                        rpe.DPRD_ID = "0001";
                        rpe.MClass = "簡訊";
                        break;
                    case "0002"://冠軍
                        rpe.MPRD_ID = "A0001";
                        rpe.DPRD_ID = "0002";
                        rpe.MClass = "冠軍";
                        break;
                    case "0003"://特別
                        rpe.MPRD_ID = "A0001";
                        rpe.DPRD_ID = "0003";
                        rpe.MClass = "特別";
                        break;
                    case "0004"://VIP
                        rpe.MPRD_ID = "A0001";
                        rpe.DPRD_ID = "0004";
                        rpe.MClass = "VIP";
                        break;
                    case "0005"://選股寶
                        if (tre.MP == "D0510241"|| tre.MP == "D0602021")//鍾騏遠||謝宗霖
                        {
                            rpe.MPRD_ID = "A0001";
                            rpe.DPRD_ID = "0005";
                            rpe.MClass = "選股寶";
                        }
                        break;
                    case "0009"://一指賺
                        if (tre.MP == "D0602021")
                        {
                            rpe.MPRD_ID = "A0001";
                            rpe.DPRD_ID = "0009";
                            rpe.MClass = "一指賺";
                        }
                        break;
                    case "0010"://鎖碼影音
                        if (tre.MP == "D0602021")
                        {
                            rpe.MPRD_ID = "B0001";
                            rpe.DPRD_ID = "0001";
                            rpe.MClass = "鎖碼影音";
                        }
                        break;
                }
                //飆股
                if ((tre.MP == "D0312152" && tre.T_Item == "0011") || (tre.MP == "D0510241" && tre.T_Item == "0007") || (tre.MP == "D0602021" && tre.T_Item == "0007") || (tre.MP == "D0509011" && tre.T_Item == "0005") || (tre.MP == "D0302051" && tre.T_Item == "0005") || (tre.MP == "D0110011" && tre.T_Item == "0008") || (tre.MP == "D9907161" && tre.T_Item == "0005") || (tre.MP == "D0508161" && tre.T_Item == "0009") || (tre.MP == "C9502231" && tre.T_Item == "0008") || (tre.MP == "C9404012" && tre.T_Item == "0009") || (tre.MP == "C9404011" && tre.T_Item == "0009") || (tre.MP == "D9505291" && tre.T_Item == "0009") || (tre.MP == "D0301062" && tre.T_Item == "0005") || (tre.MP == "D9406012" && tre.T_Item == "0005"))
                {
                    rpe.MPRD_ID = "B0001";
                    rpe.DPRD_ID = "0006";
                    rpe.MClass = "飆股";
                }
                rpeList.Add(rpe);
            }
        }

        //三、查詢網站上是否有此會員資料 
        string backMid = HGMEMBERhgDao.Instance.getMid(cde.M_Num);//<==========

        if (common.isEmpty(backMid))
        {
            //新增網站會員資料
            hgmemberEntity he = new hgmemberEntity();
            he.ERP_num = cde.M_Num;
            he.Open_tag = "0";
            he.M_Item = "0002";
            he.ContactEmail = cde.EMail;
            he.M_Pws = cde.M_Password;
            he.M_Ch = cde.M_Name;
            he.City = cde.HCity;
            he.County = cde.HZipCode + cde.HTown;
            he.Address = cde.H_Address;
            he.Tel = cde.MTel1;
            he.add_user = "rex";
            he.add_ip = add_ip;
            string tempBack = HGMEMBERhgDao.Instance.addData(he);//<==========
            if (tempBack == "成功")
            {
                string mid = HGMEMBERhgDao.Instance.getTop1Mid();
                //新增權限資料
                for (var i = 0; i < rpeList.Count; i++)
                {
                    rpeList[i].M_id = mid;
                    backString = RecordPeriodhgDao.Instance.add(rpeList[i]);
                }
                
            }
        }
        else
        {
            string Mid = RecordPeriodhgDao.Instance.getMid(T_id);
            if (common.isEmpty(Mid))
            {
                for (var i = 0; i < rpeList.Count; i++)
                {
                    rpeList[i].M_id = backMid;
                    backString = RecordPeriodhgDao.Instance.add(rpeList[i]);
                }
            }
            else
            {
                backString = "本交易已新增過網站權限資料，請勿重覆新增！";
            }
        }

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    public string deleteTradeRecordDetail(string T_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("T_ID=" + T_ID, className, methodName);
        MTRAThgDao.Instance.deleteTradeRecordDetail(T_ID);//<==========
        string backString = DTRAThgDao.Instance.deleteTradeRecordDetail(T_ID);//<==========

        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }

    public string SendAddcfasData(SendAddcfasDataParamEntity saCFASdpe)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'saCFASdpe' : " + saCFASdpe.ToString(), className, methodName);

        string backStr = MCASHhgDao.Instance.SendAddcfasData(saCFASdpe);

        log.endWrite("'backStr' : " + backStr, className, methodName);
        return backStr;
    }


}