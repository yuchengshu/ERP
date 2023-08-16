using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// MREGThgSql 的摘要描述
/// </summary>
public class MREGThgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MREGThgSql _instanct = new MREGThgSql();
    public static MREGThgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MREGThgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    /// <summary>
    /// 執行chockonOrNo的sql命令
    /// </summary>
    /// <param name="connectionStrings">連接字串</param>
    /// <param name="commandText">命令字串</param>
    /// <returns></returns>
    public string chockonOrNo(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));

        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        string backString = string.Empty;

        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            int stringLength = 0;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    stringLength = sr[0].ToString().Length;
                    if (stringLength > 0)
                    {
                        backString = "已登入";
                    }
                    else
                    {
                        backString = "未登入";
                    }
                }
            }
        }

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }
    //取得出勤打卡資料
    public List<MREGTEntity> getMREGE02List(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<MREGTEntity> MREGE02List = new List<MREGTEntity>();
        MREGTEntity mRGT02 = null;
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

                    mRGT02 = new MREGTEntity();
                    mRGT02.MR_ID = sr[0].ToString().Trim().Split(' ')[0];
                    mRGT02.MR_Date= sr[1].ToString().Trim();//打卡日期
                    mRGT02.MR_Num = sr[2].ToString().Trim();
                    mRGT02.MR_Item = sr[3].ToString().Trim();
                    mRGT02.MR_Mdep = sr[4].ToString().Trim();
                    mRGT02.MR_RSTime = sr[5].ToString().Trim();
                    mRGT02.MR_RETime = sr[6].ToString().Trim();//上班打卡時間
                    mRGT02.MR_RS_IP= sr[7].ToString().Trim();
                    mRGT02.MR_RE_IP = sr[8].ToString();
                    mRGT02.MR_Money = sr[9].ToString();
                    mRGT02.del_tag = sr[10].ToString();
                    mRGT02.add_date = sr[11].ToString();
                    try
                    {
                       // mRGT02.add_ip = sr[12].ToString().Trim();
                    }
                    catch (Exception)
                    {

                        //throw;
                    }
                    //mRGT02.add_ip = sr[12].ToString().Trim();
                    //mRGT02.add_user = sr[13].ToString().Trim();
                    MREGE02List.Add(mRGT02);
                }
            }
        }

        log.endWrite("'areList' : " + MREGE02List.ToString(), className, methodName);
        return MREGE02List;
    }


    public List<attendanceRecordEntity> getAttendanceRecord(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<attendanceRecordEntity> areList = new List<attendanceRecordEntity>();
        attendanceRecordEntity are = null;
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

                    are = new attendanceRecordEntity();
                    are.MR_Date = sr[0].ToString().Trim().Split(' ')[0];
                    are.MR_Num = sr[1].ToString().Trim();
                    are.MR_Item = sr[2].ToString().Trim();
                    are.MR_Mdep = sr[3].ToString().Trim();
                    dateTimeStr = sr[4].ToString().Trim();
                    if (!common.isEmpty(dateTimeStr))
                    {
                        are.MR_RSDate = dateTimeStr.Split(' ')[0];
                        are.MR_RSTime = dateTimeStr.Split(' ')[1] +"-"+ dateTimeStr.Split(' ')[2];
                    }
                    dateTimeStr = sr[5].ToString().Trim();
                    if (!common.isEmpty(dateTimeStr))
                    {
                        are.MR_REDate = dateTimeStr.Split(' ')[0];
                        are.MR_RETime = dateTimeStr.Split(' ')[1] + "-" + dateTimeStr.Split(' ')[2];
                    }

                    areList.Add(are);
                }
            }
        }

        log.endWrite("'areList' : " + areList.ToString(), className, methodName);
        return areList;
    }
}