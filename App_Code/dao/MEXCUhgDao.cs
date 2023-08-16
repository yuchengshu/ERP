using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

/// <summary>
/// MEXCUhgDao 的摘要描述
/// </summary>
public class MEXCUhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MEXCUhgDao _instance = new MEXCUhgDao();
    public static MEXCUhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MEXCUhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<attendanceExRecordEntity> getAttendanceExRecord(string firstDay, string lastDay, string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'firstDay' : " + firstDay + "'lastDay' : " + lastDay + "'U_Num' : " + U_Num, className, methodName);

        string commandText = "select EX_User,EX_Type,EX_SDate,EX_EDate,EX_Day,EX_Hour,EX_Status from MEXCU where EX_User='" + U_Num + "' and EX_EDate>='" + firstDay + "' and EX_EDate<'" + lastDay + "' and del_tag = '0' and EX_Status='6'  order by EX_SDate";
        List<attendanceExRecordEntity> aereList = MEXCUhgSql.Instance.getAttendanceExRecord(connectionStrings, commandText);//<=======================

        log.endWrite("'aereList' : " + aereList.ToString(), className, methodName);
        return aereList;
    }

    public List<leaveDetailEntity> getLeaveData(string U_Num, string EX_Status, string EX_Type, string StartDate, string EndDate, string MenuNo, string keyWord)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num':" + U_Num + "'EX_Status':" + EX_Status + "'EX_Type':" + EX_Type + "'StartDate':" + StartDate + "'EndDate':" + EndDate + "'MenuNo':" + MenuNo + "'keyWord':" + keyWord, className, methodName);
        string commandText = string.Empty;
        string sqlTxt = getSqlTxt.leaveDataST(U_Num, EX_Status, EX_Type, StartDate, EndDate, keyWord); ;
        if (MenuNo == "64") //人事部人員，可查詢所有假單
        {
            commandText = "select EX_id,EX_User,EX_Name,EX_Type,EX_SDate,EX_EDate,EX_Day,EX_Hour,EX_Status,EX_Govern_time from MEXCU where del_tag = '0' " + sqlTxt + "order by  ex_id desc";
        }
        //else if (MenuNo == "108" || MenuNo == "109" || MenuNo == "111")
        else if (MenuNo == "108" || MenuNo == "111")
        {//執行這個
            commandText = "select EX_id,EX_User,EX_Name,EX_Type,EX_SDate,EX_EDate,EX_Day,EX_Hour,EX_Status,EX_Govern_time " +
                "from MEXCU where (EX_Sign1_user='" + U_Num + "' or EX_Sign2_user='" + U_Num + "' or EX_Sign3_user='" + U_Num + "' )" +
                "and del_tag = '0' " + sqlTxt + "order by ex_id desc";
        }
        else
        {//要跑這個才正確
            commandText = "select EX_id,EX_User,EX_Name,EX_Type,EX_SDate,EX_EDate,EX_Day,EX_Hour,EX_Status,EX_Govern_time from MEXCU where del_tag = '0' " + sqlTxt + "order by ex_id desc";
        }

        List<leaveDetailEntity> ldeList = MEXCUhgSql.Instance.getLeaveData(connectionStrings, commandText);

        log.endWrite("'ldeList':" + ldeList.ToString(), className, methodName);
        return ldeList;
    }

    //public MREGTEntity getMREGE02ListFromMEXCU(string StartDate, string EndDate, string mP, string U_name, string Select_Com, string Select_Dept)
    //{
    //    //MREGTEntity MEXCUList = new MREGTEntity;
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    log.startWrite(common.nothing, className, methodName);
    //    string commandText = "";
    //    MREGTEntity mREGTEntity = new MREGTEntity();
    //    reportServiceMREGT02 reportServiceMREGT02 = new reportServiceMREGT02();
    //    //string Type = "";//假別種類
    //    //var test=GetEX_DayFromMEXCUbyTYPE(mP, mR_DateY, mR_DateM,Type);//依照不同請假類別取得請假天數
    //    //年假("EX_Type")="0001"
    //    string getCOMIDNAMEBY_COMID = "SELECT [ddesc] FROM [HG].[dbo].[MITEM]  where ditcode='" + Select_Dept + "'";
    //    string COMIDNAME = reportServiceMREGT02.GetValueBYSQL(conn, getCOMIDNAMEBY_COMID);//公司名稱
    //    mREGTEntity.COM = Select_Com;//公司
    //    mREGTEntity.U_MDEP = Select_Dept;//部門
    //    string EX_Type_0001 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0001");
    //    if (EX_Type_0001 == "")
    //        EX_Type_0001 = "0";
    //    mREGTEntity.E1 = int.Parse(EX_Type_0001);
    //    //補休("EX_Type")="0008"
    //    string EX_Type_0008 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0008");
    //    if (EX_Type_0008 == "")
    //        EX_Type_0008 = "0";
    //    mREGTEntity.E8 = int.Parse(EX_Type_0008);
    //    //公假("EX_Type")="0004"
    //    string EX_Type_0004 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0004");
    //    if (EX_Type_0004 == "")
    //        EX_Type_0004 = "0";
    //    mREGTEntity.E4 = int.Parse(EX_Type_0004);
    //    //婚假("EX_Type")="0006"
    //    string EX_Type_0006 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0006");
    //    if (EX_Type_0006 == "")
    //        EX_Type_0006 = "0";
    //    mREGTEntity.E6 = int.Parse(EX_Type_0006);
    //    //喪假("EX_Type")="0005"
    //    string EX_Type_0005 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0005");
    //    if (EX_Type_0005 == "")
    //        EX_Type_0005 = "0";
    //    mREGTEntity.E5 = int.Parse(EX_Type_0005);
    //    //產假("EX_Type")="0007"
    //    string EX_Type_0007 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0007");
    //    if (EX_Type_0007 == "")
    //        EX_Type_0007 = "0";
    //    mREGTEntity.E7 = int.Parse(EX_Type_0007);
    //    //事假("EX_Type")="0002"
    //    string EX_Type_0002 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0002");
    //    if (EX_Type_0002 == "")
    //        EX_Type_0002 = "0";
    //    mREGTEntity.E2 = int.Parse(EX_Type_0002);
    //    //病假("EX_Type")="0003" or ("EX_Type")="0012"
    //    string EX_Type_0003 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0003");
    //    if (EX_Type_0003 == "")
    //        EX_Type_0003 = "0";
    //    mREGTEntity.E3 = int.Parse(EX_Type_0003);
    //    //病假("EX_Type")="0003" or ("EX_Type")="0012"
    //    string EX_Type_0012 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0012");
    //    if (EX_Type_0012 == "")
    //        EX_Type_0012 = "0";
    //    mREGTEntity.E12 = int.Parse(EX_Type_0012);
    //    //補刷卡("EX_Type")="0015"
    //    string EX_Type_0015 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0015");
    //    if (EX_Type_0015 == "")
    //        EX_Type_0015 = "0";
    //    mREGTEntity.E15 = int.Parse(EX_Type_0015);
    //    //出勤調整("EX_Type")="0013"
    //    string EX_Type_0013 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0013");
    //    if (EX_Type_0013 == "")
    //        EX_Type_0013 = "0";
    //    mREGTEntity.E13 = int.Parse(EX_Type_0013);
    //    //颱風假("EX_Type")="0018"
    //    string EX_Type_0018 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0018");
    //    if (EX_Type_0018 == "")
    //        EX_Type_0018 = "0";
    //    mREGTEntity.E14 = int.Parse(EX_Type_0018);
    //    //颱風假("EX_Type")="0018"
    //    // string EX_Type_0014 = GetEX_DayFromMEXCUbyTYPE(mP, mR_DateY, mR_DateM, "0014");
    //    // mREGTEntity.E14 = int.Parse(EX_Type_0005);
    //    //榮譽假("EX_Type")="0019"
    //    string EX_Type_0019 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0019");
    //    if (EX_Type_0019 == "")
    //        EX_Type_0019 = "0";
    //    mREGTEntity.E15 = int.Parse(EX_Type_0019);
    //    //家庭照護("EX_Type")="0020"
    //    string EX_Type_0020 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0020");
    //    if (EX_Type_0020 == "")
    //        EX_Type_0020 = "0";
    //    mREGTEntity.E16 = int.Parse(EX_Type_0020);
    //    mREGTEntity.U_Name = U_name;
    //    //MEXCUList.Add(mREGTEntity);
    //    /*
    //        if vrs_Mitem("EX_Type")="0001" then '年假
    //                         E1 = E1 + vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")
    //                       elseif vrs_Mitem("EX_Type")="0008" then '補休
    //                         E2 = E2 + vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")
    //                       elseif vrs_Mitem("EX_Type")="0004" then '公假
    //                         E3 = E3 + vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")
    //                       elseif vrs_Mitem("EX_Type")="0006" then '婚假
    //                         E4 = E4 + vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")
    //                       elseif vrs_Mitem("EX_Type")="0005" then '喪假
    //                         E5 = E5 + vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")
    //                       elseif vrs_Mitem("EX_Type")="0007" then '產假
    //                         E6 = E6 + vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")
    //                       elseif vrs_Mitem("EX_Type")="0002" then '事假                                               
    //                         E7 = E7 + vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")                             
    //                       elseif vrs_Mitem("EX_Type")="0003" or vrs_Mitem("EX_Type")="0012" then '病假
    //                         E8 = E8 + vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")
    //                       elseif vrs_Mitem("EX_Type")="0015" then '補刷卡                           
    //                         E10 = E10 + 1
    //                       elseif vrs_Mitem("EX_Type")="0015" then '出勤調整
    //                         E13 = E13 + vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")
    //                       elseif vrs_Mitem("EX_Type")="0018" then '颱風假
    //                         E14 = E14+ vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")
    //                      elseif vrs_Mitem("EX_Type")="0019" then '榮譽假
    //                         E15 = E15+ vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")
    //                 elseif vrs_Mitem("EX_Type")="0020" then '家庭照護
    //                         E16 = E16+ vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")
    //     */

    //    //if (mP.Trim() == "")//如果MP為空值,則查詢所有人
    //    //{
    //    //    commandText = "select * From MEXCU where C_Year ='" + mR_DateY + "' and C_Month='" + mR_DateM + "' ";
    //    //}
    //    //else
    //    //{
    //    //    commandText = "select * From MEXCU where C_Year ='" + mR_DateY + "' and C_Month='" + mR_DateM + "' ";
    //    //}
    //    //List<MREGTEntity> MCSE = MEXCUhgSql.Instance.getMREGE02ListFromMEXCU(connectionStrings, commandText);//<======
    //    //log.endWrite("'wte':" + MCSE.ToString(), className, methodName);
    //    return mREGTEntity;
    //}
    //取得請假紀錄StartDate, EndDate,
    public MREGTEntity getMREGE02ListFromMEXCU(SqlConnection Conn,string StartDate, string EndDate, string mP,string U_name,string Select_Com,string Select_Dept,string DEPAR_Name)
    {
        //MREGTEntity MEXCUList = new MREGTEntity;
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        string commandText = "";
        MREGTEntity mREGTEntity = new MREGTEntity();
        reportServiceMREGT02 reportServiceMREGT02 = new reportServiceMREGT02();
        //string Type = "";//假別種類
        //var test=GetEX_DayFromMEXCUbyTYPE(mP, mR_DateY, mR_DateM,Type);//依照不同請假類別取得請假天數
        //年假("EX_Type")="0001"
        //string getCOMIDNAMEBY_COMID = "SELECT [ddesc] FROM [HG].[dbo].[MITEM]  where ditcode='" + Select_Com + "'";
        //string COMIDNAME = reportServiceMREGT02.GetValueBYSQL(Conn, getCOMIDNAMEBY_COMID);//公司名稱
        //string getDEPARNAMEBY_DEPAR= "SELECT [ddesc] FROM [HG].[dbo].[MITEM]  where  mitcode='DEPAR' and ditcode='"+Select_Dept + "'";
        //string DEPARNAME = reportServiceMREGT02.GetValueBYSQL(Conn,getDEPARNAMEBY_DEPAR);//部門名稱
        //mREGTEntity.Com = COMIDNAME;//公司名稱
        //mREGTEntity.Dept = DEPARNAME;//部門名稱
        //年假("EX_Type")="0001"
        string EX_Type_0001 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0001");
        if (EX_Type_0001 == "")
            EX_Type_0001 = "0";
        mREGTEntity.E1 = int.Parse(EX_Type_0001);
        //補休("EX_Type")="0008"
        string EX_Type_0008 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0008");
        if (EX_Type_0008 == "")
            EX_Type_0008 = "0";
        mREGTEntity.E2 = int.Parse(EX_Type_0008);
        //公假("EX_Type")="0004"
        string EX_Type_0004 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0004");
        if (EX_Type_0004 == "")
            EX_Type_0004 = "0";
        mREGTEntity.E3 = int.Parse(EX_Type_0004);
        //婚假("EX_Type")="0006"
        string EX_Type_0006 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0006");
        if (EX_Type_0006 == "")
            EX_Type_0006 = "0";
        mREGTEntity.E4 = int.Parse(EX_Type_0006);
        //喪假("EX_Type")="0005"
        string EX_Type_0005 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0005");
        if (EX_Type_0005 == "")
            EX_Type_0005 = "0";
        mREGTEntity.E5 = int.Parse(EX_Type_0005);
        //產假("EX_Type")="0007"
        string EX_Type_0007 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0007");
        if (EX_Type_0007 == "")
            EX_Type_0007 = "0";
        mREGTEntity.E6 = int.Parse(EX_Type_0007);
        //事假("EX_Type")="0002"
        string EX_Type_0002 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0002");
        if (EX_Type_0002 == "")
            EX_Type_0002 = "0";
        mREGTEntity.E7 = int.Parse(EX_Type_0002);
        //病假("EX_Type")="0003" or ("EX_Type")="0012"
        string EX_Type_0003 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0003");
        if (EX_Type_0003 == "")
            EX_Type_0003 = "0";
        mREGTEntity.E8 = int.Parse(EX_Type_0003);
        //病假("EX_Type")="0003" or ("EX_Type")="0012"
        string EX_Type_0012 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0012");
        if (EX_Type_0012 == "")
            EX_Type_0012 = "0";
        mREGTEntity.E8 = int.Parse(EX_Type_0012)+ int.Parse(EX_Type_0003);//病假
        int Sum00030012 = int.Parse(EX_Type_0003)+ int.Parse(EX_Type_0012);
        mREGTEntity.E8 = Sum00030012;//病假
        //補刷卡("EX_Type")="0015"
        string EX_Type_0015 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0015");
        if (EX_Type_0015 == "")
            EX_Type_0015 = "0";
        mREGTEntity.E10 = int.Parse(EX_Type_0015);
        //出勤調整("EX_Type")="0017"
        string EX_Type_0017 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0017");
        if (EX_Type_0017 == "")
            EX_Type_0017 = "0";
        mREGTEntity.E13 = int.Parse(EX_Type_0017);
        //颱風假("EX_Type")="0018"
        string EX_Type_0018 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0018");
        if (EX_Type_0018 == "")
            EX_Type_0018 = "0";
        mREGTEntity.E14 = int.Parse(EX_Type_0018);
        string EX_Type_0019 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0019");
        if (EX_Type_0019 == "")
            EX_Type_0019 = "0";
        mREGTEntity.E15 = int.Parse(EX_Type_0019);
        //家庭照護("EX_Type")="0020"
        string EX_Type_0020 = GetEX_DayFromMEXCUbyTYPE(mP, StartDate, EndDate, "0020");
        if (EX_Type_0020 == "")
            EX_Type_0020 = "0";
        mREGTEntity.E16 = int.Parse(EX_Type_0020);
        mREGTEntity.U_Name = U_name;
        mREGTEntity.Dept = Select_Dept;
        mREGTEntity.Com = Select_Com;
        //mREGTEntity.Dept = DEPAR_Name;
        //MEXCUList.Add(mREGTEntity);
        /*
            if vrs_Mitem("EX_Type")="0001" then '年假
                             E1 = E1 + vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")
                           elseif vrs_Mitem("EX_Type")="0008" then '補休
                             E2 = E2 + vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")
                           elseif vrs_Mitem("EX_Type")="0004" then '公假
                             E3 = E3 + vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")
                           elseif vrs_Mitem("EX_Type")="0006" then '婚假
                             E4 = E4 + vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")
                           elseif vrs_Mitem("EX_Type")="0005" then '喪假
                             E5 = E5 + vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")
                           elseif vrs_Mitem("EX_Type")="0007" then '產假
                             E6 = E6 + vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")
                           elseif vrs_Mitem("EX_Type")="0002" then '事假                                               
                             E7 = E7 + vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")                             
                           elseif vrs_Mitem("EX_Type")="0003" or vrs_Mitem("EX_Type")="0012" then '病假
                             E8 = E8 + vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")
                           elseif vrs_Mitem("EX_Type")="0015" then '補刷卡                           
                             E10 = E10 + 1
                           elseif vrs_Mitem("EX_Type")="0015" then '出勤調整
                             E13 = E13 + vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")
                           elseif vrs_Mitem("EX_Type")="0018" then '颱風假
                             E14 = E14+ vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")
                          elseif vrs_Mitem("EX_Type")="0019" then '榮譽假
                             E15 = E15+ vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")
                     elseif vrs_Mitem("EX_Type")="0020" then '家庭照護
                             E16 = E16+ vrs_mitem("ex_day")* 8 + vrs_mitem("ex_Hour")
         */

        //if (mP.Trim() == "")//如果MP為空值,則查詢所有人
        //{
        //    commandText = "select * From MEXCU where C_Year ='" + mR_DateY + "' and C_Month='" + mR_DateM + "' ";
        //}
        //else
        //{
        //    commandText = "select * From MEXCU where C_Year ='" + mR_DateY + "' and C_Month='" + mR_DateM + "' ";
        //}
        //List<MREGTEntity> MCSE = MEXCUhgSql.Instance.getMREGE02ListFromMEXCU(connectionStrings, commandText);//<======
        //log.endWrite("'wte':" + MCSE.ToString(), className, methodName);
        return mREGTEntity;
    }
    //type:假別種類StartDate, EndDate,
    public string GetEX_DayFromMEXCUbyTYPE(string mP, string StartDate, string EndDate, string type)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'mP':" + mP, className, methodName);
        string Day = "";
        //統計期間[day1~day2]
        //if (MR_DateM == "2")
        //{
        //    Day = "28";
        //}
        //else if (MR_DateM == "4" | MR_DateM == "6" | MR_DateM == "9" | MR_DateM == "11")
        //{
        //    Day = "30";
        //}
        //else
        //{
        //    Day = "31";

        //}
        // string StartDate = StartDate;8/12/2022
        // string EndDate = EndDate;
        //string commandText = "select EX_Day,EX_Hour from MEXCU where EX_Type='"+type+"' and EX_sdate >= '" + DateTime.Now.Year + "/1/1 00:00:00' and EX_Status = '6' and EX_User='" + mP + "' and del_tag = '0' ";
        string commandText = "SELECT sum(CONVERT(float, EX_Day)) FROM [HG].[dbo].[MEXCU] a where a.EX_Day<>'.5' and a.EX_Day>='1' and EX_EDate >'" + StartDate + "' and EX_EDate < '" + EndDate + "' and a.EX_User='"+mP+"'  and a.EX_Type='"+ type + "' ";
        string commandText_ = "SELECT sum(CONVERT(float, EX_Hour)) FROM [HG].[dbo].[MEXCU] a where a.EX_Day<>'.5' and a.EX_Day>='1' and EX_EDate >'" + StartDate + "' and EX_EDate < '" + EndDate + "' and a.EX_User='" + mP + "'  and a.EX_Type='" + type + "' "; string EX_Day = "";
        reportServiceMREGT02 reportServiceMREGT02 = new reportServiceMREGT02();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            EX_Day = reportServiceMREGT02.GetValueBYSQL(conn, commandText);//請假天數
            if (EX_Day == "")
                EX_Day = "0";
        }
        //List<leaveDetailEntity> ldeList = MEXCUhgSql.Instance.getTakenAnnualLeave(connectionStrings, commandText);

        //log.endWrite("'ldeList':" + ldeList.ToString(), className, methodName);
        //天數要換成小時
        EX_Day =(int.Parse(EX_Day) * 8).ToString();
        return EX_Day;
    }

    public string GetValueBYSQL(SqlConnection conn, string commandText)
    {
        string value = "";
        //using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        //{
        SqlConnection connection = conn;

        //conn.ConnectionString = connectionStrings;
        //conn.Open();
        //conn.ConnectionString = connectionStrings;
        //conn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = commandText;
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        //conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
        //conn.Open();
        //SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        //cmd.CommandText = tsql;
        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
        if (cmd.Connection.State.ToString() == "Closed")
            cmd.Connection.Open();
         
        adapter.Fill(ds);//取出所有會場編號
        foreach (DataRow datarow in ds.Tables[""].Rows)
        {
            //每個資料列的內容
        }
        //int V_ID_Count = dt.Rows.Count;
        foreach (DataRow row in dt.Rows)
        {
            //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
            value = row[0].ToString();
        }
        //List<SRMVENUEntity> SRMVENUEntityList = new List<SRMVENUEntity>();
        //for (int i = 0; i < V_ID_Count; i++)
        //{
        //    string V_ID = dt[i][0].ToString();
        //                           }
        //foreach (DataRow row in dt.Rows)
        //{
        //    //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
        //    value = row[0].ToString();
        //}
        // conn.Close();
        // }
        /*
         *  adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
         adapter.Fill(dt);//取出所有會場編號
                          //int V_ID_Count = dt.Rows.Count;
                          //List<SRMVENUEntity> SRMVENUEntityList = new List<SRMVENUEntity>();
                          //for (int i = 0; i < V_ID_Count; i++)
                          //{
                          //    string V_ID=dt[i][0].
                          //}
         foreach (DataRow row in dt.Rows)
         {
             //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
             value = row[0].ToString();
         }
         conn.Close();
         //}
         return value;
         */
        return value;
    }

    public List<leaveDetailEntity> getTakenAnnualLeave(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num':" + U_Num, className, methodName);
        string commandText = "select EX_Day,EX_Hour from MEXCU where EX_Type='0001' and EX_sdate >= '" + DateTime.Now.Year + "/1/1 00:00:00' and EX_Status = '6' and EX_User='" + U_Num + "' and del_tag = '0' ";


        List<leaveDetailEntity> ldeList = MEXCUhgSql.Instance.getTakenAnnualLeave(connectionStrings, commandText);

        log.endWrite("'ldeList':" + ldeList.ToString(), className, methodName);
        return ldeList;
    }

    public List<leaveDetailEntity> getTakenSickLeave(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num':" + U_Num, className, methodName);
        string commandText = "select EX_Day,EX_Hour from MEXCU where EX_Type='0003' and EX_sdate >= '" + DateTime.Now.Year + "/1/1 00:00:00' and EX_Status = '6' and EX_User='" + U_Num + "' and del_tag = '0' ";


        List<leaveDetailEntity> ldeList = MEXCUhgSql.Instance.getTakenAnnualLeave(connectionStrings, commandText);

        log.endWrite("'ldeList':" + ldeList.ToString(), className, methodName);
        return ldeList;
    }

    public string addLeaveData(leaveDetailEntity lde)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'lde':" + lde.ToString(), className, methodName);

        string commandText = "INSERT INTO MEXCU ([EX_User],[EX_Name],[EX_Com],[EX_Type],[EX_SDate],[EX_EDate],[EX_Agent],[EX_Agent_Name],[EX_Agent_com],[EX_Sign1_user],[EX_Sign1_name],[EX_Sign1_com],[EX_Sign2_user],[EX_Sign2_name],[EX_Sign2_com],[EX_Sign3_user],[EX_Sign3_name],[EX_Sign3_com],[EX_Day],[EX_Hour],[EX_Reason],[add_date],[add_ip],[add_user]) VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}', '{10}', '{11}', '{12}', '{13}', '{14}', '{15}', '{16}', '{17}', '{18}', '{19}', '{20}', GETDATE(), '{21}', '{22}')";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(commandText, lde.EX_User, lde.EX_Name, lde.EX_Com, lde.EX_Type, lde.EX_SDate, lde.EX_EDate, lde.EX_Agent, lde.EX_Agent_Name, lde.EX_Agent_com, lde.EX_Sign1_user, lde.EX_Sign1_name, lde.EX_Sign1_com, lde.EX_Sign2_user, lde.EX_Sign2_name, lde.EX_Sign2_com, lde.EX_Sign3_user, lde.EX_Sign3_name, lde.EX_Sign3_com, lde.EX_Day, lde.EX_Hour, lde.EX_Reason, lde.add_ip, lde.add_user));
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sb.ToString());

        log.endWrite("'backStr':" + backStr, className, methodName);
        return backStr;
    }

    public string deleteLeaveData(string id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'id':" + id, className, methodName);

        string commandText = "UPDATE MEXCU SET del_tag = 1 WHERE EX_id='" + id + "'";

        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);

        log.endWrite("'backStr':" + backStr, className, methodName);
        return backStr;
    }

    public leaveDetailEntity getLeaveDetail(string id, string whereType)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'id':" + id + "'whereType':" + whereType, className, methodName);
        string commandText = string.Empty;
        if (whereType == "EX_id")
        {
            commandText = "select * from MEXCU where " + whereType + "='" + id + "'";
        }
        else if (whereType == "EX_User")
        {
            commandText = "select top 1 * from MEXCU where " + whereType + "='" + id + "' order by add_date desc";
        }
        leaveDetailEntity lde = MEXCUhgSql.Instance.getLeaveDetail(connectionStrings, commandText);

        log.endWrite("'lde':" + lde.ToString(), className, methodName);
        return lde;
    }

    public string leaveApproveTF(string EX_id, string statusName, string status)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'EX_id':" + EX_id + "'statusName':" + statusName + "'status':" + status, className, methodName);
        string commandText = string.Empty;
        if (status == "1")
        {
            commandText = "UPDATE MEXCU SET " + statusName + "_Status='" + status + "'," + statusName + "_time=GETDATE()" + " where EX_id=" + EX_id;
        }
        else if (status == "2")
        {
            commandText = "UPDATE MEXCU SET " + statusName + "_Status='" + status + "',EX_Status='3'" + "," + statusName + "_time=GETDATE()" + " where EX_id=" + EX_id;
        }

        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);

        log.endWrite("'backStr':" + backStr, className, methodName);
        return backStr;
    }
}