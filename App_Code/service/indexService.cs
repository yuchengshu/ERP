using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.IO;

/// <summary>
/// indexService 的摘要描述
/// </summary>
public class indexService: System.Web.UI.Page 
{
    //引用時不用再NEW
    private static indexService _instance = new indexService();

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public static indexService Instance
    {
        get
        {
            return _instance;
        }
    }

    public indexService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    /// <summary>
    /// 處理getUserData的邏輯
    /// </summary>
    /// <param name="U_Num"></param>
    /// <returns></returns>
    public sessionEntity getUserData(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);

        sessionEntity se = MUSERhgDao.Instance.getUserData(U_Num);//<==============

        log.endWrite(se.ToString(), className, methodName);
        return se;
    }


    /// <summary>
    /// 處理saveLoginRecord的邏輯
    /// </summary>
    /// <param name="se">使用者登入資料</param>
    public void saveLoginRecord(sessionEntity se)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(se.ToString(), className, methodName);
        MUSIPhgDao.Instance.saveLoginRecord(se);//<================================
        log.endWrite(common.nothing, className, methodName);
    }


    /// <summary>
    /// 處理chockonOrNo的邏輯
    /// </summary>
    /// <param name="U_Num"></param>
    /// <returns></returns>
    public string chockonOrNo(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);

        string backString = MREGThgDao.Instance.chockonOrNo(U_Num);//<=============

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }


    /// <summary>
    /// 處理chockon的邏輯
    /// </summary>
    /// <param name="U_Num"></param>
    /// <returns></returns>
    public void chockon(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);
        MREGThgDao.Instance.chockon(U_Num);//<====================================
        log.endWrite(common.nothing, className, methodName);
    }


    /// <summary>
    /// 處理checkUnReadMail的邏輯
    /// </summary>
    /// <param name="U_Num"></param>
    /// <returns></returns>
    public string checkUnReadMail(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);
        string backString = MMAILhgDao.Instance.checkUnReadMail(U_Num);//<=========
        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    /// <summary>
    /// 查詢首頁內容觀看權限
    /// </summary>
    /// <returns></returns>
    public List<contentAuthorityEntity> searchContentAuthority(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num : '"+ U_Num, className, methodName);

        List<contentAuthorityEntity> caeList = MFMAPjoinMFUNThgDao.Instance.searchContentAuthority(U_Num);//<====

        log.endWrite(caeList.ToString(), className, methodName);
        return caeList;
    }


    /// <summary>
    /// 取得業績排行榜
    /// </summary>
    /// <returns></returns>
    public List<performanceRankingEntity> getPerformanceRanking(string U_MDEP, string group)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'U_MDEP' : {0}, 'group' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, U_MDEP, group));
        log.startWrite(sb.ToString(), className, methodName);

        List<performanceRankingEntity> preList = DTRATjoinMTRATjoinMMBERjoinMUSERhgDao.Instance.getPerformanceRanking(U_MDEP, group);//<=====

        log.endWrite(preList.ToString(), className, methodName);
        return preList;
    }


    /// <summary>
    /// 取得節目合約提醒到期資料
    /// </summary>
    /// <returns></returns>
    public List<remindProgramContractMaturityEntity> getRemindProgramContractMaturity()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<remindProgramContractMaturityEntity> rpcmeList = MCONThgDao.Instance.getRemindProgramContractMaturity();//<======
        List<indexBDdataEntity> ibddElist = MUSERhgDao.Instance.getAnalystList(common.empty);//<=============================
        for (var i = 0; i < rpcmeList.Count; i++)
        {
            for (var j = 0; j < ibddElist.Count; j++)
            {
              
            }
        }
        log.endWrite(rpcmeList.ToString(), className, methodName);
        return rpcmeList;
    }
    //華南信用卡額度提醒
    //getHnBankCredit
    public List<noticeBoardEntity> getHnBankCredit()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'U_MDEP' : {0}, 'U_POSITION' : {1}, 'group' : {2}, 'fromClassName' : {3}";
        StringBuilder sb = new StringBuilder();
        //sb.Append(string.Format(paramFormat, U_MDEP, U_POSITION, group, fromClassName));
        log.startWrite(sb.ToString(), className, methodName);
        List<noticeBoardEntity> nbeList = MBULThgDao.Instance.getHnBankCredit();//<======

        log.endWrite(nbeList.ToString(), className, methodName);
        return nbeList;
    }

    /// <summary>
    /// 取得公佈欄資料
    /// </summary>
    /// <returns></returns>
    public List<noticeBoardEntity> getNoticeBoard(string U_MDEP, string U_POSITION, string group, string fromClassName)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'U_MDEP' : {0}, 'U_POSITION' : {1}, 'group' : {2}, 'fromClassName' : {3}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, U_MDEP, U_POSITION, group, fromClassName));
        log.startWrite(sb.ToString(), className, methodName);

        List<noticeBoardEntity> nbeList = MBULThgDao.Instance.getNoticeBoard(U_MDEP, U_POSITION, group, fromClassName, common.empty, common.empty);//<======

        log.endWrite(nbeList.ToString(), className, methodName);
        return nbeList;
    }

    /// <summary>
    /// 取得所有員工生日列表
    /// </summary>
    /// <returns></returns>
    public List<indexBDdataEntity> getEmpBDlist()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<indexBDdataEntity> bdList = MUSERhgDao.Instance.getEmpBDlist();//<====
        string yy = common.getYearOrMonthOrDay("yy");
        string[] dateTimeArr = null;
        string[] date = null;
        string bdm = string.Empty; ;
        string bdd = string.Empty; ;
        List<indexBDdataEntity> justBdList = new  List<indexBDdataEntity>();
        for (var i = 0; i < bdList.Count; i++)
        {
            indexBDdataEntity bdde = new indexBDdataEntity();
            dateTimeArr = bdList[i].empBD.Split(' ');
            date = dateTimeArr[0].Split('/');
            bdm = date[1].Trim().Length == 1 ? "0" + date[1].Trim() : date[1].Trim();
            bdd = date[2].Trim().Length == 1 ? "0" + date[2].Trim() : date[2].Trim();
            bdde.empBD = bdm+"/"+ bdd+"/"+ yy;
            bdde.empName = bdList[i].empName;
            bdde.U_Num = bdList[i].U_Num;
            justBdList.Add(bdde);
        }
        log.endWrite(justBdList.ToString(), className, methodName);
        return justBdList;
    }

    /// <summary>
    /// 取得信件資料
    /// </summary>
    /// <returns>取得信件資料</returns>
    public List<emailBoxEntity> getEmailBox(string U_Num,string group,string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'U_Num' : {0}, 'group' : {1} , 'U_MDEP' : {2}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, U_Num, group, U_MDEP));
        log.startWrite(sb.ToString(), className, methodName);

        List<emailBoxEntity> ebeList = MMAILhgDao.Instance.getEmailBox(U_Num, group, U_MDEP);//<========
        List<indexBDdataEntity> dbdList = MUSERhgDao.Instance.getEmpBDlist();//<=======================
        for (var i = 0; i < ebeList.Count; i++)
        {
            for (var j = 0; j < dbdList.Count; j++)
            {
                if (ebeList[i].MS_Sender == dbdList[j].U_Num)
                {
                    ebeList[i].MS_Sender_Name = dbdList[j].empName;
                }

            }
        }
        log.endWrite(ebeList.ToString(), className, methodName);
        return ebeList;
    }


    /// <summary>
    /// 處理getTodayBDer的邏輯 
    /// </summary>
    /// <returns></returns>
    public List<indexBDdataEntity> getTodayBDer()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        List<indexBDdataEntity> bdList = getEmpBDlist();//<======================
        string nowdate = DateTime.Now.ToString("MM-dd-yyyy");
        string[] nowdateArr = nowdate.Split('-');
        string mm = nowdateArr[0];
        string dd = nowdateArr[1];
        List<indexBDdataEntity> tbdList = new List<indexBDdataEntity>();
        for (var i = 0; i < bdList.Count; i++)
        {
            if (Convert.ToDateTime(bdList[i].empBD)!= DateTime.Now)
            {
                File.AppendAllText("D://Log.txt", "\r\n" + bdList[i].empBD + "$$" + bdList[i].empName); 
            }
            /*
            string[] dateTimeArr = bdList[i].empBD.Split(' ');
            string[] date = dateTimeArr[0].Split('/');
            string bdm = date[1].Trim().Length == 1 ? "0" + date[1].Trim() : date[1].Trim();
            string bdd = date[2].Trim().Length == 1 ? "0" + date[2].Trim() : date[2].Trim();

            if (bdm == mm && bdd == dd)
            {
                indexBDdataEntity bdde = new indexBDdataEntity();
                bdde.empBD = bdList[i].empBD;
                bdde.empName = bdList[i].empName;
                tbdList.Add(bdde);
                File.AppendAllText("D://Log.txt", "\r\n" + bdList[i].empBD + "$$" + bdList[i].empName);
            }
            File.AppendAllText("D://Log.txt", "\r\n" + bdList[i].empBD + "$$" + bdList[i].empName);*/
        }
        log.startWrite(tbdList.ToString(), className, methodName);
        return tbdList;
    }


    /// <summary>
    /// 取得各種週期的員工生日列表
    /// </summary>
    /// <param name="start"></param>
    /// <param name="end"></param>
    /// <returns></returns>
    public List<indexBDdataEntity> getBDerList(int start,int end)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'start' : "+ start+ ",'end' : " + end, className, methodName);
        DateTime dt = Convert.ToDateTime(common.dateTimeToDate(DateTime.Now.AddDays(start).ToString()));
        DateTime dt7 = Convert.ToDateTime(common.dateTimeToDate(DateTime.Now.AddDays(end).ToString()));

        
        List<indexBDdataEntity> bdList = getEmpBDlist();//<===========================
        List<indexBDdataEntity> justbdList = new List<indexBDdataEntity>();
        for (var i = 0; i < bdList.Count; i++)
        {
            if (Convert.ToDateTime(bdList[i].empBD) >= dt && Convert.ToDateTime(bdList[i].empBD) <= dt7)
            {
                indexBDdataEntity bdde = new indexBDdataEntity();
                bdde.empBD = bdList[i].empBD;
                bdde.empName = bdList[i].empName;
                bdde.empBDdate = common.parseDate(Convert.ToDateTime(bdList[i].empBD).DayOfWeek.ToString("d"));
                justbdList.Add(bdde);
            }
        }
        log.endWrite(justbdList.ToString(), className, methodName);
        return justbdList;
    }

    /// <summary>
    /// 取得Call訊
    /// </summary>
    /// <returns></returns>
    public List<callMassageEntity> getCallMassage(string U_Num, string U_MDEP, string U_POSITION, string Comid, string group)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'U_MDEP' : {0}, 'U_POSITION' : {1}, 'Comid' : {2}, 'U_Num' : {3}, 'group' : {4}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, U_MDEP, U_POSITION, Comid, U_Num, group));
        log.startWrite(sb.ToString(), className, methodName);

        List<callMassageEntity> cmeList = MMSGEhgDao.Instance.getCallMassage(U_Num,U_MDEP,U_POSITION,Comid,group);//<======
        List<indexBDdataEntity> ibddElist = MUSERhgDao.Instance.getAnalystList(common.empty);//<=============================
        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("all");//<============================
        for (var i = 0; i < cmeList.Count; i++)
        {
            for (var j = 0; j < ibddElist.Count; j++)
            {
                if (cmeList[i].MP.Trim() == ibddElist[j].U_Num.Trim())
                {
                    cmeList[i].U_Name = ibddElist[j].empName;
                    cmeList[i].U_EName = ibddElist[j].U_EName;
                }
            }

            for (var k = 0; k < ddeList.Count; k++)
            {
                if (cmeList[i].MP_Item == ddeList[k].ditcode)
                {
                    cmeList[i].ddesc = ddeList[k].ddesc;
                }
            }

        }
       

        log.endWrite(cmeList.ToString(), className, methodName);
        return cmeList;
    }


    /// <summary>
    /// 取得今日聯絡事項
    /// </summary>
    /// <returns>取得今日聯絡事項</returns>
    public List<todayConnectionMatterEntity> getTodayConnectionMatter(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);

        List<todayConnectionMatterEntity> tcmeList = MQUSThgDao.Instance.getTodayConnectionMatter(U_Num);//<=====
        List<midMNameEntity> minList = MMBERhgDao.Instance.getMidMNameEntityList();//<===========================
        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("NCONT");//<===================
        List<indexBDdataEntity> dbdList = MUSERhgDao.Instance.getEmpBDlist();//<=============================
        for (var i = 0; i < tcmeList.Count; i++)
        {
            for (var j = 0; j < minList.Count; j++)
            {
                if (tcmeList[i].M_ID.Trim() == minList[j].M_id.Trim())
                {
                    tcmeList[i].MMBERm_idEqualMQUSTm_ID = true;
                    tcmeList[i].M_Name = minList[j].M_Name;
                }
            }

            for (var k = 0; k < ddeList.Count; k++)
            {
                if (tcmeList[i].N_Item.Trim() == ddeList[k].ditcode.Trim())
                {
                    tcmeList[i].MITEMditcodeEqualMQUSTn_Item = true;
                    tcmeList[i].ddesc = ddeList[k].ddesc;
                }
            }

            for (var g = 0; g < dbdList.Count; g++)
            {
                if (dbdList[g].U_Num.Trim() == tcmeList[i].Add_User.Trim())
                {
                    tcmeList[i].U_Name = dbdList[g].empName;
                }
            }
        }

        log.endWrite(tcmeList.ToString(), className, methodName);
        return tcmeList;
    }

    /*
    /// <summary>
    /// 取得MidMNameEntity
    /// </summary>
    public List<midMNameEntity> getMidMNameEntityList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<midMNameEntity> minList = indexDao.Instance.getMidMNameEntityList();//<====

        log.endWrite(minList.ToString(), className, methodName);
        return minList;
    }*/

    /// <summary>
    /// ditcodedescEntity
    /// </summary>
     public List<ditcodedescEntity> getditcodedescEntityList(string type,string ComID, string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList(type, ComID, U_Num);//<====

        log.endWrite(ddeList.ToString(), className, methodName);
        return ddeList;
    }


    public List<ditcodedescEntity> getditcodedescEntityListByViewtag0(string type)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityListByViewtag0(type);//<====

        log.endWrite(ddeList.ToString(), className, methodName);
        return ddeList;
    }


    public List<remindProgramContractMaturityEntity> videoOutofdateRemind()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<remindProgramContractMaturityEntity> ddList = MCONThgDao.Instance.getRemindProgramContractMaturity();
        log.endWrite(ddList.ToString(), className, methodName);
        return ddList;
    }
}