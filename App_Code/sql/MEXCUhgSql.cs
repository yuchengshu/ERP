using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// MEXCUhgSql 的摘要描述
/// </summary>
public class MEXCUhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MEXCUhgSql _instanct = new MEXCUhgSql();
    public static MEXCUhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MEXCUhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<attendanceExRecordEntity> getAttendanceExRecord(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<attendanceExRecordEntity> aereList = new List<attendanceExRecordEntity>();
        attendanceExRecordEntity aere = null;
        string backString = string.Empty;
        string dateTimeStr = string.Empty;
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    aere = new attendanceExRecordEntity();
                    aere.EX_User = sr[0].ToString().Trim();
                    aere.EX_Type = sr[1].ToString().Trim();
                    dateTimeStr = sr[2].ToString().Trim();
                    if (!common.isEmpty(dateTimeStr))
                    {
                        aere.EX_SDate = dateTimeStr.Split(' ')[0];
                        aere.EX_STime = dateTimeStr.Split(' ')[1] + "-" + dateTimeStr.Split(' ')[2];
                    }

                    dateTimeStr = sr[3].ToString().Trim();
                    if (!common.isEmpty(dateTimeStr))
                    {
                        aere.EX_EDate = dateTimeStr.Split(' ')[0];
                        aere.EX_ETime = dateTimeStr.Split(' ')[1] + "-" + dateTimeStr.Split(' ')[2];
                    }

                    aere.EX_Day = int.Parse(sr[4].ToString());
                    aere.takeLeaveHour = double.Parse(sr[5].ToString());
                    aere.EX_Status = sr[6].ToString().Trim();
                    aereList.Add(aere);
                }
            }
        }

        log.endWrite("'aereList' : " + aereList.ToString(), className, methodName);
        return aereList;
    }



    public List<leaveDetailEntity> getLeaveData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<leaveDetailEntity> ldeList = new List<leaveDetailEntity>();
        leaveDetailEntity lde = null;

        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    lde = new leaveDetailEntity();
                    lde.EX_id = sr[0].ToString().Trim();
                    lde.EX_User = sr[1].ToString().Trim();
                    lde.EX_Name = sr[2].ToString().Trim();
                    lde.EX_Type = sr[3].ToString().Trim();
                    lde.EX_SDate = sr[4].ToString().Trim();
                    lde.EX_EDate = sr[5].ToString().Trim();
                    lde.EX_Day = sr[6].ToString().Trim();
                    lde.EX_Hour = sr[7].ToString().Trim();
                    lde.EX_Status = sr[8].ToString().Trim();
                    lde.EX_Govern_time = sr[9].ToString().Trim();
                    ldeList.Add(lde);
                }
            }
        }

        log.endWrite("'ldeList' : " + ldeList.ToString(), className, methodName);
        return ldeList;
    }

    internal List<MREGTEntity> getMREGE02ListFromMEXCU(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<MREGTEntity> ldeList = new List<MREGTEntity>();
        MREGTEntity lde = null;

        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    lde = new MREGTEntity();
                    //lde.EX_Day = sr[0].ToString().Trim();
                    //lde.EX_Hour = sr[1].ToString().Trim();
                    ldeList.Add(lde);
                }
            }
        }

        log.endWrite("'ldeList' : " + ldeList.ToString(), className, methodName);
        return ldeList;
    }

    public List<leaveDetailEntity> getTakenAnnualLeave(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<leaveDetailEntity> ldeList = new List<leaveDetailEntity>();
        leaveDetailEntity lde = null;

        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    lde = new leaveDetailEntity();
                    lde.EX_Day = sr[0].ToString().Trim();
                    lde.EX_Hour = sr[1].ToString().Trim();
                    ldeList.Add(lde);
                }
            }
        }

        log.endWrite("'ldeList' : " + ldeList.ToString(), className, methodName);
        return ldeList;
    }

    public leaveDetailEntity getLeaveDetail(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        leaveDetailEntity lde = null;

        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    lde = new leaveDetailEntity();
                    lde.EX_id = sr[0].ToString().Trim();
                    lde.EX_User = sr[1].ToString().Trim();
                    lde.EX_Name = sr[2].ToString().Trim();
                    lde.EX_Com = sr[3].ToString().Trim();
                    lde.EX_Type = sr[4].ToString().Trim();
                    lde.EX_SDate = sr[5].ToString().Trim();
                    lde.EX_EDate = sr[6].ToString().Trim();
                    lde.EX_Agent = sr[7].ToString().Trim();
                    lde.EX_Agent_Name = sr[8].ToString().Trim();
                    lde.EX_Agent_com = sr[9].ToString().Trim();
                    lde.EX_Sign1_user = sr[10].ToString().Trim();
                    lde.EX_Sign1_name = sr[11].ToString().Trim();
                    lde.EX_Sign1_com = sr[12].ToString().Trim();
                    lde.EX_Sign2_user = sr[13].ToString().Trim();
                    lde.EX_Sign2_name = sr[14].ToString().Trim();
                    lde.EX_Sign2_com = sr[15].ToString().Trim();
                    lde.EX_Sign3_user = sr[16].ToString().Trim();
                    lde.EX_Sign3_name = sr[17].ToString().Trim();
                    lde.EX_Sign3_com = sr[18].ToString().Trim();
                    lde.EX_Day = sr[19].ToString().Trim();
                    lde.EX_Hour = sr[20].ToString().Trim();
                    lde.EX_Reason = sr[21].ToString().Trim();
                    lde.EX_Status = sr[22].ToString().Trim();
                    lde.EX_Createtime = sr[23].ToString().Trim();
                    lde.EX_Agent_time = sr[24].ToString().Trim();
                    lde.EX_Agent_Status = sr[25].ToString().Trim();
                    lde.EX_Sign1_time = sr[26].ToString().Trim();
                    lde.EX_Sign1_Status = sr[27].ToString().Trim();
                    lde.EX_Sign2_time = sr[28].ToString().Trim();
                    lde.EX_Sign2_Status = sr[29].ToString().Trim();
                    lde.EX_Sign3_time = sr[30].ToString().Trim();
                    lde.EX_Sign3_Status = sr[31].ToString().Trim();
                    lde.EX_Govern = sr[32].ToString().Trim();
                    lde.EX_Govern_Name = sr[33].ToString().Trim();
                    lde.EX_Govern_com = sr[34].ToString().Trim();
                    lde.EX_Govern_Status = sr[35].ToString().Trim();
                    lde.EX_Govern_time = sr[36].ToString().Trim();
                    lde.EX_ps = sr[37].ToString().Trim();
                    lde.del_tag = sr[38].ToString().Trim();
                    lde.add_date = sr[39].ToString().Trim();
                    lde.add_ip = sr[40].ToString().Trim();
                    lde.add_user = sr[41].ToString().Trim();
                }
            }
        }

        log.endWrite("'lde' : " + lde.ToString(), className, methodName);
        return lde;
    }

}