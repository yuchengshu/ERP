using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// takeLeaveDetailService 的摘要描述
/// </summary>
public class takeLeaveDetailService
{
    //引用時不用再NEW
    private static takeLeaveDetailService _instance = new takeLeaveDetailService();
    public static takeLeaveDetailService Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public takeLeaveDetailService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<leaveDetailEntity> getLeaveData(string U_Num, string EX_Status, string EX_Type, string StartDate, string EndDate, string MenuNo, string keyWord)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num':" + U_Num + "'EX_Status':" + EX_Status + "'EX_Type':" + EX_Type + "'StartDate':" + StartDate + "'EndDate':" + EndDate + "'MenuNo':" + MenuNo + "'keyWord':" + keyWord, className, methodName);

        List<leaveDetailEntity> ldeList =  MEXCUhgDao.Instance.getLeaveData(U_Num, EX_Status, EX_Type, StartDate, EndDate, MenuNo, keyWord);//<==========
        List<ditcodedescEntity> EXCUEddeList = MITEMhgDao.Instance.getditcodedescEntityList("EXCUE");//<==========
        for (var i = 0; i < ldeList.Count; i++)
        {
            ldeList[i].EX_StatusName = getEX_StatusName(ldeList[i].EX_Status);
            for (var z = 0; z < EXCUEddeList.Count; z++)
            {
                if (ldeList[i].EX_Type == EXCUEddeList[z].ditcode)
                {
                    ldeList[i].EX_TypeName = EXCUEddeList[z].ddesc;
                }
            }
        }
        log.endWrite("'ldeList':" + ldeList.ToString(), className, methodName);
        return ldeList;
    }

    public List<compensatoryLeaveDetailEntity> getCompensatoryLeaveData(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num':" + U_Num, className, methodName);

        List<compensatoryLeaveDetailEntity> cldeList = MDEXChgDao.Instance.getCompensatoryLeaveData(U_Num);

        log.endWrite("'cldeList':" + cldeList.ToString(), className, methodName);
        return cldeList;
    }

    public annualLeaveAndCompensatoryLeaveAndSickLeaveDataEntity getAnnualLeaveAndCompensatoryLeaveAndSickLeaveData(string U_Num, string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num':" + U_Num+ "'U_MDEP':" + U_MDEP, className, methodName);

        mcDataEntity mde = MUSERhgDao.Instance.getMCdata(U_Num);
        DateTime date1 = Convert.ToDateTime(mde.SlimDate);
        DateTime date2 = new DateTime(DateTime.Now.Year, 12, 31);
        DateTime dateNOW = DateTime.Now;
        int difLastDateDays = new TimeSpan(date2.Ticks - date1.Ticks).Days;
        int difNowDays = new TimeSpan(dateNOW.Ticks - date1.Ticks).Days;
        double seniority = difLastDateDays / 365;

        List<leaveDetailEntity> ldeList = MEXCUhgDao.Instance.getTakenAnnualLeave(U_Num);
        List<leaveDetailEntity> sldeList = MEXCUhgDao.Instance.getTakenSickLeave(U_Num);
        List<compensatoryLeaveDetailEntity> cldeLsit = MDEXChgDao.Instance.getCompensatoryLeave(U_Num);
        List<compensatoryLeaveDetailEntity> takenCldeLsit = MDEXChgDao.Instance.getTakenCompensatoryLeave(U_Num);
        annualLeaveAndCompensatoryLeaveAndSickLeaveDataEntity alaclde = new annualLeaveAndCompensatoryLeaveAndSickLeaveDataEntity();
        
        alaclde.AnnualLeaveDays = getAnnualLeaveDays(seniority, difNowDays, U_Num, U_MDEP);
        alaclde.takenAnnualLeaveDays = getTakenAnnualLeaveDays(ldeList);
        alaclde.takenSickLeaveDays = getTakenAnnualLeaveDays(sldeList);
        alaclde.CompensatoryLeaveDays = getCompensatoryLeaveDays(cldeLsit);
        alaclde.takenCompensatoryLeaveDays = getCompensatoryLeaveDays(takenCldeLsit);
       
        log.endWrite("'alaclde':" + alaclde.ToString(), className, methodName);
        return alaclde;
    }

    public agentAndLeaderDataEntity getAgentAndLeaderData(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num':" + U_Num, className, methodName);

        mcDataEntity Umde = MUSERhgDao.Instance.getMCdata(U_Num);
        mcDataEntity Amde = MUSERhgDao.Instance.getMCdata(Umde.U_Agent);
        mcDataEntity Lmde = MUSERhgDao.Instance.getMCdata(Umde.U_Leader);
        agentAndLeaderDataEntity aalde = new agentAndLeaderDataEntity();
        aalde.U_Agent = Amde.U_Num;
        aalde.U_AgentName = Amde.U_Name;
        aalde.U_AgentCom = Amde.ComID;
        aalde.U_AgentMdep = Amde.U_MDEP;
        aalde.U_Leader = Lmde.U_Num;
        aalde.U_LeaderName = Lmde.U_Name;
        aalde.U_LeaderCom = Lmde.ComID;
        aalde.U_LeaderMdep = Lmde.U_MDEP;

        log.endWrite("'aalde':" + aalde.ToString(), className, methodName);
        return aalde;
    }

    public string addLeaveData(leaveDetailEntity lde)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'lde':" + lde.ToString(), className, methodName);

        string backStr = MEXCUhgDao.Instance.addLeaveData(lde);
        leaveDetailEntity thislde = MEXCUhgDao.Instance.getLeaveDetail(lde.EX_User, "EX_User");
        if (backStr == "成功")
        {
          
            string MS_ID = common.getDateTimeStr() + "_" + common.getRandom1();
            string MS_Title = "「" + lde.EX_Name + "」" + lde.EX_SDate + "請假單-請點選進入簽核";
            string MS_Text = "<a href=/public/TakeLeave/MEXCU/takeLeaveDetail.aspx?EX_id=" + thislde.EX_id + "&U_Num=" + lde.EX_User + "&MS_ID=" + MS_ID + ">「" + lde.EX_Name + "」" + lde.EX_SDate + "請假單-請點選進入簽核</A>";
            string MS_Receiver = lde.EX_Agent;
            string MS_Sender = lde.EX_User;
            string add_User = lde.EX_User;
            string add_ip = lde.add_ip;
            common.sendMail(MS_ID, MS_Title, MS_Text, MS_Receiver, MS_Sender, add_User, add_ip);

        }
        log.endWrite("'backStr':" + backStr, className, methodName);
        return backStr;
    }

    public string deleteLeaveData(string id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'id':" + id, className, methodName);

        string backStr = MEXCUhgDao.Instance.deleteLeaveData(id);

        log.endWrite("'backStr':" + backStr, className, methodName);
        return backStr;
    }

    public leaveDetailEntity getLeaveDetail(string id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'id':" + id, className, methodName);
        List<ditcodedescEntity> EXCUEddeList = MITEMhgDao.Instance.getditcodedescEntityList("EXCUE");//<==========
        leaveDetailEntity lde = MEXCUhgDao.Instance.getLeaveDetail(id,"EX_id");
        for (var i = 0; i < EXCUEddeList.Count; i++)
        {
            if (lde.EX_Type == EXCUEddeList[i].ditcode)
            {
                lde.EX_TypeName = EXCUEddeList[i].ddesc;
            }
        }
        lde.EX_Agent_StatusName = getStausName(lde.EX_Agent_Status);
        lde.EX_Sign1_StatusName = getStausName(lde.EX_Sign1_Status);
        lde.EX_Sign2_StatusName = getStausName(lde.EX_Sign2_Status);
        lde.EX_Sign3_StatusName = getStausName(lde.EX_Sign3_Status);
        lde.EX_Govern_StatusName = getStausName(lde.EX_Govern_Status);
        mcDataEntity mde = MUSERhgDao.Instance.getMCdata(lde.EX_User);
        lde.SlimDate = mde.SlimDate;
        log.endWrite("'lde':" + lde.ToString(), className, methodName);
        return lde;
    }

    public string leaveApproveTF(string EX_id, string statusName, string status, string MS_ID, string nextSigner,string U_Num, string add_ip)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'EX_id':" + EX_id + "'statusName':" + statusName + "'status':" + status + "'MS_ID':" + MS_ID + "'nextSigner':" + nextSigner + "'U_Num':" + U_Num + "'add_ip':" + add_ip, className, methodName);

        string backStr = MEXCUhgDao.Instance.leaveApproveTF( EX_id,  statusName,  status);
        if (status == "1") {
            if (backStr == "成功")
            {
                emailEntity ee = MMAILhgDao.Instance.getMailDetail(MS_ID);
                ee.MS_ID = common.getDateTimeStr() + "_" + common.getRandom1();
                ee.MS_Text = "<a href=/public/TakeLeave/MEXCU/takeLeaveDetail.aspx?EX_id=" + EX_id + "&U_Num=>" + ee.MS_Text + "</a>";
                ee.MS_Receiver = nextSigner;
                ee.MS_Sender = U_Num;
                ee.add_User = U_Num;
                ee.add_ip = add_ip;
                MMAILhgDao.Instance.sendEmail(ee);
            }
        }

        log.endWrite("'backStr':" + backStr, className, methodName);
        return backStr;
    }

    private string getStausName(string status)
    {
        string backStr = string.Empty;
        switch (status)
        {
            case "0":
                backStr = "";
                break;
            case "1":
                backStr = "已核准";
                break;
            case "2":
                backStr = "已退回";
                break;
        }
        return backStr;
    }

    private double getCompensatoryLeaveDays(List<compensatoryLeaveDetailEntity> cldeLsit)
    {
        double backInt = 0;
        for (var i = 0; i < cldeLsit.Count; i++)
        {
            backInt += double.Parse(cldeLsit[i].DE_Day) + (double.Parse(cldeLsit[i].DE_Hour) * 0.125);
        }
        return backInt;
    }

    private double getTakenAnnualLeaveDays(List<leaveDetailEntity> ldeList)
    {
        double backInt = 0;
        for (var i = 0; i < ldeList.Count; i++)
        {
            backInt += double.Parse(ldeList[i].EX_Day) + (double.Parse(ldeList[i].EX_Hour) * 0.125);
        }
        return backInt;
    }

    private int getAnnualLeaveDays(double seniority,int difNowDays, string U_Num, string U_MDEP)
    {
        log.debug2("seniority=" + seniority + "&difNowDays=" + difNowDays + "&U_Num=" + U_Num + "&U_MDEP=" + U_MDEP, "", "");
        int backStr = 0;
        if (seniority < 0.5)
        {
            backStr = 0;
        }
        else if (seniority < 1)
        {
            if (difNowDays > 182)
            {
                backStr = 3;
            }
            else
            {
                backStr = 0;
            }
            
        }
        else if (seniority < 2)
        {
            backStr = 7;
        }
        else if (seniority < 3)
        {
            backStr = 10;
        }
        else if (seniority < 5)
        {
            backStr = 14;
        }
        else if (seniority < 10)
        {
            backStr = 15;
        }
        else if (seniority >= 10)
        {
            backStr = 15+ Convert.ToInt16(Math.Floor(seniority - 9));
            if (backStr > 30)
            {
                backStr = 30;
            }
        }

        if (U_MDEP == "0005" || U_Num == "B0301241" || U_Num == "barby0205")
        {
            backStr = 0;
        }

        return backStr;

    }


    private string getEX_StatusName(string code)
    {
        string backStr = string.Empty;
        switch (code)
        {
            case "1":
                backStr = "<font color=gray>處理中</font>";
                break;
            case "2":
                backStr = "<font color=gray>審查中</font>";
                break;
            case "3":
                backStr = "<font color=#990000>退回</font>";
                break;
            case "4":
                backStr = "<font color=gray>銷假</font>";
                break;
            case "5":
                backStr = "<font color=#990000>審查失敗</font>";
                break;
            case "6":
                backStr = "<font color=#005C9C>完成</font>";
                break;
        }
        return backStr;

    }
}