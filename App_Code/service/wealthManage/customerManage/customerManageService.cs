using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// customerManageService 的摘要描述
/// </summary>
public class customerManageService
{
    //引用時不用再NEW
    private static customerManageService _instance = new customerManageService();
    public static customerManageService Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public customerManageService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<haltResumeEntity> getCaseData(string M_Id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        List<haltResumeEntity> mdeList = MTRAThgDao.Instance.getCaseData(M_Id);//<==========主要
        //public  List<ditcodedescEntity> getSelectEmployList(string cOMID, string U_MDEP)
        //List<ditcodedescEntity> SelectEmplist = MUSERhgDao.Instance.getSelectEmployList(ComID, U_MDEP);//<==========
        //List<ditcodedescEntity> DEPARddeList = MITEMhgDao.Instance.getditcodedescEntityList("DEPAR");//<==========
        return mdeList;
    }
    public List<ditcodedescEntity> getSelectEmplist(string U_MDEP,string  ComID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        List<mcDataEntity> mdeList = MUSERhgDao.Instance.getMClist(false);//<==========主要
        //public  List<ditcodedescEntity> getSelectEmployList(string cOMID, string U_MDEP)
        List<ditcodedescEntity> SelectEmplist = MUSERhgDao.Instance.getSelectEmployList(ComID,U_MDEP);//<==========
        //List<ditcodedescEntity> DEPARddeList = MITEMhgDao.Instance.getditcodedescEntityList("DEPAR");//<==========
        return SelectEmplist;
    }
    /// <summary>
    /// 取得客戶資料
    /// </summary>
    /// <returns></returns>
    public List<customerDataEntity> getCustomerData(getCustormerParams gcp)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'gcp' :" + gcp.ToString(), className, methodName);
        assignNameDateEntity ande = null;
        //20220720
        List<customerDataEntity> cdeList = MMBERhgDao.Instance.getCustomerData(gcp);//<==========
        if (cdeList != null && cdeList.Count != 0)
        {
            if (!common.isEmpty(gcp.M_ID))
            {
                ande = MRYGChgDao.Instance.getAssignNameDate(gcp.M_ID);//<==========
                string[] thirtyDayAgo = (DateTime.Now.AddDays(-30).ToString()).Split(' ');
                List<DMBERentity> deList = DMBERhgDao.Instance.getDMBERdata(gcp.M_ID, common.empty, thirtyDayAgo[0]);//<==========
                if (deList.Count != 0)
                {
                    cdeList[0].DM_MarkTime = deList[0].DM_MarkTime == null ? common.empty : deList[0].DM_MarkTime;
                    cdeList[0].DM_MC_Name = deList[0].DM_MC_Name == null ? common.empty : deList[0].DM_MC_Name;
                }
                else
                {
                    cdeList[0].DM_MarkTime = common.empty;
                    cdeList[0].DM_MC_Name = common.empty;
                }

                if (ande != null)
                {
                    cdeList[0].Assign_Name = ande.Assign_Name;
                    cdeList[0].Assign_Date = ande.Assign_Date;
                }
                else
                {
                    cdeList[0].Assign_Name = common.empty;
                    cdeList[0].Assign_Date = common.empty;
                }
            }

        
            List<ditcodedescEntity> ddeINVMYList = MITEMhgDao.Instance.getditcodedescEntityList("INVMY");//<==
            List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("COMID");//<=====
            string[] tempArr = null;
            for (var i = 0; i < cdeList.Count; i++)
            {
                for (var j = 0; j < ddeList.Count; j++)
                {
                    if (cdeList[i].MC_COM == ddeList[j].ditcode)
                    {
                        tempArr = ddeList[j].ddesc.Split('-');
                        cdeList[i].MC_COMCodeName = tempArr[1];
                    }
                }

                for (var k = 0; k < ddeINVMYList.Count; k++)
                {
                    if (cdeList[i].Inv_Money == ddeINVMYList[k].ditcode)
                    {
                        cdeList[i].Inv_MoneyCodeName = ddeINVMYList[k].ddesc;
                    }
                }
            }

            List<ditcodedescEntity> ddeMPGOMList = MITEMhgDao.Instance.getditcodedescEntityList("MPGOM");//<==
            if (!common.isEmpty(cdeList[0].Program))
            {
                string[] programArr = cdeList[0].Program.Split(',');
                string programs = string.Empty;
                int programCount = 0;
                foreach (var s in programArr)
                {
                    for (var m = 0; m < ddeMPGOMList.Count; m++)
                    {
                        if (s == ddeMPGOMList[m].ditcode)
                        {
                            if (programCount == 0)
                            {
                                programs += ddeMPGOMList[m].ddesc;
                            }
                            else
                            {
                                programs += ",";
                                programs += ddeMPGOMList[m].ddesc;
                            }
                            programCount += 1;
                        }
                    }
                }
                cdeList[0].ProgramCodeName = programs;
            }


            List<indexBDdataEntity> ibddeMUSERList = MUSERhgDao.Instance.getAnalystList(gcp.ComID);//<==
            if (!common.isEmpty(cdeList[0].Analyst))
            {
                string[] analystArr = cdeList[0].Analyst.Split(',');
                string analysts = string.Empty;
                int analystCount = 0;
               foreach (var s in analystArr)
                {
                    for (var n = 0; n < ibddeMUSERList.Count; n++)
                    {
                        if (s == ibddeMUSERList[n].U_Num)
                        {
                            if (analystCount == 0)
                            {
                                analysts += ibddeMUSERList[n].empName;
                            }
                            else
                            {
                                analysts += ",";
                                analysts += ibddeMUSERList[n].empName;
                            }
                            analystCount += 1;
                        }
                    }
                }
                cdeList[0].AnalystName = analysts;
            }

            List<ditcodedescEntity> ddePRODTList = MITEMhgDao.Instance.getditcodedescEntityList("PRODT");//<==
            if (!common.isEmpty(cdeList[0].Product))
            {
                string[] producttArr = cdeList[0].Product.Split(',');
                string products = string.Empty;
                int productCount = 0;
                foreach (var s in producttArr)
                {
                    for (var z = 0; z < ddePRODTList.Count; z++)
                    {
                        if (s == ddePRODTList[z].ditcode)
                        {
                            if (productCount == 0)
                            {
                                products += ddePRODTList[z].ddesc;
                            }
                            else
                            {
                                products += ",";
                                products += ddePRODTList[z].ddesc;
                            }
                            productCount += 1;
                        }
                    }
                }
                cdeList[0].ProductCodeName = products;
            }
        
        }

        log.endWrite(cdeList.ToString(), className, methodName);
        return cdeList;
    }
    /// <summary>
    /// 查詢是否有長注記過
    /// </summary>
    /// <param name="M_ID"></param>
    /// <param name="U_Num"></param>
    /// <returns></returns>
    public List<DMBERentity> isLongTag(string M_ID, string U_Num,string tagType)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' :" + M_ID + "&'U_Num' :" + U_Num, className, methodName);
        int days = 0;
        if (tagType == "long")
        {
            days = -90;
        }
        else
        {
            days = -60;
        }
        string [] daysAgo = (DateTime.Now.AddDays(days).ToString()).Split(' ');
        List<DMBERentity> deList = DMBERhgDao.Instance.getDMBERdata(M_ID, U_Num, daysAgo[0]);//<==========
        log.endWrite(deList.ToString(), className, methodName);
        return deList;
    }


    public List<DMBERentity> getTagHistory(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID':" + M_ID, className, methodName);

        List<DMBERentity> deList = DMBERhgDao.Instance.getDMBERdata(M_ID,common.empty, common.empty);//<=====================
        for (var i = 0; i < deList.Count; i++)
        {
            deList[i].DM_tagName = deCode.DM_tag(deList[i].DM_tag);
        }
        log.endWrite(deList.ToString(), className, methodName);
        return deList;
    }

    public string getKYC(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID':" + M_ID, className, methodName);

        string Kid = KYChgDao.Instance.getKYC(M_ID);//<==========
        log.endWrite(Kid, className, methodName);
        return Kid;
    }
    public string getCDD(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID':" + M_ID, className, methodName);

        string Kid = CDDhgDao.Instance.getCDD(M_ID);//<==========
        log.endWrite(Kid, className, methodName);
        return Kid;
    }
    public List<CDDDataEntity> getCDDlist(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID':" + M_ID, className, methodName);
        List<indexBDdataEntity> ibddeList = MUSERhgDao.Instance.getEmpBDlist();
        List<CDDDataEntity> cdddeList = MPCDDhgDao.Instance.getCDDlist(M_ID);//<==========
        string CDD_StatusName = string.Empty;
        for (var i = 0; i < cdddeList.Count; i++)
        {
            switch (cdddeList[i].CDD_Status)
            {
                case "A":
                    CDD_StatusName = "<FONT COLOR=RED>高風險</FONT>";
                    break;
                case "B":
                    CDD_StatusName = "一般";
                    break;
                case "C":
                    CDD_StatusName = "低風險";
                    break;
            }
            cdddeList[i].CDD_StatusName = CDD_StatusName;
            for (var j = 0; j < ibddeList.Count; j++)
            {
                if (cdddeList[i].MC == ibddeList[j].U_Num)
                {
                    cdddeList[i].MCname = ibddeList[j].empName;
                }
            }
        }

        log.endWrite(cdddeList.ToString(), className, methodName);
        return cdddeList;
    }


    /// <summary>
    /// 註記長注記
    /// </summary>
    /// <param name="M_ID"></param>
    /// <param name="MC"></param>
    /// <param name="MC_Name"></param>
    /// <param name="MC_Com"></param>
    /// <param name="Light_Status"></param>
    public void doLongTag(string M_ID, string MC, string MC_Name, string MC_Com, string Light_Status)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'M_ID' : {0}, 'MC' : {1}, 'MC_Name' : {2}, 'MC_Com' : {3}, 'Light_Status' : {4}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, M_ID, MC, MC_Name, MC_Com, Light_Status));
        log.startWrite(sb.ToString(), className, methodName);

        MMBERhgDao.Instance.updateMMBER(M_ID, MC, MC_Name, MC_Com, Light_Status);//<==========
        string DM_Tag = "2";
        DMBERhgDao.Instance.addDMBER(M_ID, MC, MC_Name, MC_Com, DM_Tag);//<==========

        log.endWrite(common.nothing, className, methodName);
    }
    /// <summary>
    /// 查詢分析師資料
    /// </summary>
    /// <returns></returns>
    /*public List<indexBDdataEntity> getEmpList(string U_Position, string ComID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        List<indexBDdataEntity> cdeList = MUSERhgDao.Instance.getEmpList("Y", U_Position, ComID);//<==========
        log.endWrite(cdeList.ToString(), className, methodName);
        return cdeList;
    }*/

    public List<mcDataEntity> getMClist(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        mcDataEntity mde = MUSERhgDao.Instance.getMCdata(U_Num);//<==========
        List <mcDataEntity> mdeList = MUSERhgDao.Instance.getMClist(false);//<==========主要
        mdeList.Add(mde);
        List<ditcodedescEntity> COMIDddeList = MITEMhgDao.Instance.getditcodedescEntityList("COMID");//<==========
        List<ditcodedescEntity> DEPARddeList = MITEMhgDao.Instance.getditcodedescEntityList("DEPAR");//<==========
        for (var i = 0; i < mdeList.Count; i++)
        {
            for (var m = 0; m < COMIDddeList.Count; m++)
            {
                if (mdeList[i].ComID == COMIDddeList[m].ditcode)
                {
                    mdeList[i].ComIDname = COMIDddeList[m].ddesc;
                }
            }
            for (var n = 0; n < DEPARddeList.Count; n++)
            {
                if (mdeList[i].U_MDEP == DEPARddeList[n].ditcode)
                {
                    mdeList[i].U_MDEPname = DEPARddeList[n].ddesc;
                }
            }
        }
           
        log.endWrite(mdeList.ToString(), className, methodName);
        return mdeList;
    }

    /// <summary>
    /// 新增客戶資料
    /// </summary>
    /// <param name="cde"></param>
    public string addEditCustomerData(customerDataEntity cde, string addEditType)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(cde.ToString(), className, methodName);

        string backString = MMBERhgDao.Instance.addEditCustomerData(cde, addEditType);//<==========

        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }
    /// <summary>
    /// 刪除業務聯絡單資料
    /// </summary>
    /// <param name="M_ID"></param>
    /// <returns></returns>
    public string deleteMPMCOTFData(string f_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("f_ID=" + f_ID, className, methodName);

        string backString = MMBERhgDao.Instance.deleteMPMCOTFData(f_ID);//<==========
        MCOTFhgDao.Instance.deleteMPMCOTFData(f_ID);
        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }
    /// <summary>
    /// 刪除客戶資料
    /// </summary>
    /// <param name="M_ID"></param>
    /// <returns></returns>
    public string deleteCustomerData(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("M_ID=" + M_ID, className, methodName);

        string backString = MMBERhgDao.Instance.deleteCustomerData(M_ID);//<==========
        MCOTFhgDao.Instance.deleteCustomerData(M_ID);
        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }

    /// <summary>
    /// 查詢是否有此手機號碼
    /// </summary>
    /// <param name="MTelList"></param>
    /// <returns></returns>
    public string hasMTel(string MTel)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MTel' : " + MTel, className, methodName);

        string backSting = MMBERhgDao.Instance.hasMTel(MTel);//<==========

        log.endWrite("'backSting' : " + backSting, className, methodName);
        return backSting;

    }

    public List<string> getKeywordList(string keyWord)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'keyWord' : " + keyWord, className, methodName);
        List<string> backList = new List<string>();
        string[] itemArr = { "MTel1", "MTel2", "MTel3", "M_Name" };
        List<string> tempList = null;
        for (var i = 0; i < itemArr.Length; i++)
        {
            tempList = MMBERhgDao.Instance.getKeyWordList(keyWord, itemArr[i]);//<==========
            for (var j = 0; j < tempList.Count; j++)
            {
                backList.Add(tempList[j]);
            }
        }
        log.endWrite("'backList' : " + backList.ToString(), className, methodName);
        return backList;
    }

    public List<idCheckEntity> getIddataByMid(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : " + M_ID, className, methodName);

        List<idCheckEntity> iceList = idCheckhgDao.Instance.getIddataByMid(M_ID);//<==========

        log.endWrite("'iceList' : " + iceList.ToString(), className, methodName);
        return iceList;
    }

    public customerDataEntity getCustomerDataByMid(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : " + M_ID, className, methodName);

        customerDataEntity cde = MMBERhgDao.Instance.getCustomerDataByMid(M_ID);//<==========

        log.endWrite("'cde' : " + cde.ToString(), className, methodName);
        return cde;
    }
    
    public mcDataEntity getMCdata(string MC)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MC' : " + MC, className, methodName);

        mcDataEntity mde = MUSERhgDao.Instance.getMCdata(MC);//<==========

        log.endWrite("'mde' : " + mde.ToString(), className, methodName);
        return mde;
    }
    public List<appointDataEntity> getAppointData(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("M_ID=" + M_ID, className, methodName);

        List<appointDataEntity> adeList = MCASHhgDao.Instance.getAppointData(M_ID);//<==========
        for (var i = 0; i < adeList.Count; i++)
        {
            adeList[i].T_Sdate = adeList[i].T_Sdate.Split(' ')[0];
            adeList[i].T_Edate = adeList[i].T_Edate.Split(' ')[0];
        }
        log.endWrite("adeList : " + adeList.ToString(), className, methodName);
        return adeList;
    }


}