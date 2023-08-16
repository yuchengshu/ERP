using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

/// <summary>
/// MMAILhgDao 的摘要描述
/// </summary>
public class MMAILhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MMAILhgDao _instance = new MMAILhgDao();
    public static MMAILhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MMAILhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string checkUnReadMail(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);

        string commandText = "select count(read_tag) as read_count from mmail where read_tag = '0' and del_tag = '0' and ms_receiver = '{0}'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, U_Num));
        string backString = MMAILhgSql.Instance.checkUnReadMail(connectionStrings, sbCommandText.ToString());

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    public List<emailBoxEntity> getEmailBox(string U_Num, string group, string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'U_Num' : {0}, 'group' : {1} , 'U_MDEP' : {2}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, U_Num, group, U_MDEP));
        log.startWrite(sb.ToString(), className, methodName);

        //string sqlTxt = getSqlTxt.PerformanceRankingST(group, U_MDEP);
        //string commandText = "select * from MMAIL where ms_receiver='{0}' and del_tag = '0' and read_tag='0' {1} order by add_Date desc";
        string commandText = "select * from MMAIL where ms_receiver='{0}' and del_tag = '0' and read_tag='0' order by add_Date desc";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, U_Num));
        List<emailBoxEntity> ebeList = MMAILhgSql.Instance.getEmailBox(connectionStrings, sbCommandText.ToString());
       
        log.endWrite(ebeList.ToString(), className, methodName);
        return ebeList;
    }

    public void sendEmail(emailEntity ee)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':"+ ee.MS_ID+ "'MS_Title':" + ee.MS_Title + "'MS_Text':" + ee.MS_Text + "'MS_Receiver':" + ee.MS_Receiver + "'MS_Sender':" + ee.MS_Sender + "'add_User':" + ee.add_User + "'add_ip':" + ee.add_ip , className, methodName);

        string commandText = "INSERT INTO MMAIL ([MS_ID],[MS_Sender],[MS_Receiver],[MS_Title],[MS_Text],[add_Date],[add_User],[add_ip])VALUES('{0}','{1}','{2}','{3}','{4}',GETDATE(),'{5}','{6}'); ";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, ee.MS_ID,ee.MS_Sender,ee.MS_Receiver,ee.MS_Title,ee.MS_Text,ee.add_User,ee.add_ip));
        noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());

        log.endWrite(common.nothing, className, methodName);
    }

    public emailEntity getMailDetail(string mailId)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'mailId':" + mailId, className, methodName);
        string commandText = "select MS_Sender,MS_Title,MS_Text from MMAIL where MS_ID='"+ mailId + "'";

        emailEntity ee = MMAILhgSql.Instance.getMailDetail(connectionStrings, commandText);

        log.endWrite("'ee' :" + ee.ToString(), className, methodName);
        return ee;
    }
    //取得郵件附件1
    public emailEntity getMailUPLoadDataDetail1(string connectionStrings, string commandText, string mailId)
    {
        emailEntity _emailEntity = new emailEntity();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            //SqlCommand File_Name_cmd = new SqlCommand();
            //File_Name_cmd.CommandText = commandText;
            //File_Name_cmd.Connection = conn;
            //using (SqlDataReader rdr = File_Name_cmd.ExecuteReader())
            //{
            //    while (rdr.Read())
            //    {
            //        if(rdr.HasRows)
            //        {
            //            MDE.File_Name = rdr.GetString(1);
            //            MDE.File_Title = rdr.GetString(2);
            //        }
            //        else
            //        {
            //            MDE.File_Title = "無";
            //        }
            //        //;
            //        //var adver_file = rdr.GetString(0); //The 0 stands for "the 0'th column", so the first column of the result.
            //        //                                   // Do somthing with this rows string, for example to put them in to a list
            //        //var File_Name = rdr.GetString(0);
            //        //var File_Folder = rdr.GetString(1);
            //        //var File_Title = rdr.GetString(2);
            //        //MDE.adver_file = rdr.GetString(0);
            //        //MDE.File_Name = File_Name.ToString();
            //        //MDE.File_Folder = File_Folder.ToString();
            //        //MDE.File_Title = File_Title.ToString();
            //        //MDE.File_Name = rdr.GetString(1);
            //        //MDE.File_Title = rdr.GetString(2);
            //    }
            //}
            //getUpLoadDataDetail1(
            using (SqlDataAdapter dataAdapter = new SqlDataAdapter(commandText, conn))
            {
                // create the DataSet 
                DataSet dataSet = new DataSet();
                // fill the DataSet using our DataAdapter 
                dataAdapter.Fill(dataSet);
                if (dataSet.Tables[0].Rows.Count > 0)
                {
                    //MDE.adver_content = dataSet.Tables[0].Rows[0]["adver_content"].ToString();
                    _emailEntity.File_Name = dataSet.Tables[0].Rows[0]["File_Name"].ToString();
                    _emailEntity.File_Title = dataSet.Tables[0].Rows[0]["File_Title"].ToString();

                }
            }

            noticeBoardEntity nbe = null;

        }
        return _emailEntity;
    }
    public emailEntity getMailUPLoadDataDetail2(string connectionStrings, string commandText, string mailId)
    {
        emailEntity _emailEntity = new emailEntity();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            //SqlCommand File_Name_cmd = new SqlCommand();
            //File_Name_cmd.CommandText = commandText;
            //File_Name_cmd.Connection = conn;
            //using (SqlDataReader rdr = File_Name_cmd.ExecuteReader())
            //{
            //    while (rdr.Read())
            //    {
            //        if(rdr.HasRows)
            //        {
            //            MDE.File_Name = rdr.GetString(1);
            //            MDE.File_Title = rdr.GetString(2);
            //        }
            //        else
            //        {
            //            MDE.File_Title = "無";
            //        }
            //        //;
            //        //var adver_file = rdr.GetString(0); //The 0 stands for "the 0'th column", so the first column of the result.
            //        //                                   // Do somthing with this rows string, for example to put them in to a list
            //        //var File_Name = rdr.GetString(0);
            //        //var File_Folder = rdr.GetString(1);
            //        //var File_Title = rdr.GetString(2);
            //        //MDE.adver_file = rdr.GetString(0);
            //        //MDE.File_Name = File_Name.ToString();
            //        //MDE.File_Folder = File_Folder.ToString();
            //        //MDE.File_Title = File_Title.ToString();
            //        //MDE.File_Name = rdr.GetString(1);
            //        //MDE.File_Title = rdr.GetString(2);
            //    }
            //}
            //getUpLoadDataDetail1(
            using (SqlDataAdapter dataAdapter = new SqlDataAdapter(commandText, conn))
            {
                // create the DataSet 
                DataSet dataSet = new DataSet();
                // fill the DataSet using our DataAdapter 
                dataAdapter.Fill(dataSet);
                if (dataSet.Tables[0].Rows.Count > 1)
                {
                    //MDE.adver_content = dataSet.Tables[0].Rows[0]["adver_content"].ToString();
                    _emailEntity.File_Name = dataSet.Tables[0].Rows[1]["File_Name"].ToString();
                    _emailEntity.File_Title = dataSet.Tables[0].Rows[1]["File_Title"].ToString();

                }
            }

            noticeBoardEntity nbe = null;

        }
        return _emailEntity;
    }
    public emailEntity getMailUPLoadDataDetail3(string connectionStrings, string commandText, string mailId)
    {
        emailEntity _emailEntity = new emailEntity();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            //SqlCommand File_Name_cmd = new SqlCommand();
            //File_Name_cmd.CommandText = commandText;
            //File_Name_cmd.Connection = conn;
            //using (SqlDataReader rdr = File_Name_cmd.ExecuteReader())
            //{
            //    while (rdr.Read())
            //    {
            //        if(rdr.HasRows)
            //        {
            //            MDE.File_Name = rdr.GetString(1);
            //            MDE.File_Title = rdr.GetString(2);
            //        }
            //        else
            //        {
            //            MDE.File_Title = "無";
            //        }
            //        //;
            //        //var adver_file = rdr.GetString(0); //The 0 stands for "the 0'th column", so the first column of the result.
            //        //                                   // Do somthing with this rows string, for example to put them in to a list
            //        //var File_Name = rdr.GetString(0);
            //        //var File_Folder = rdr.GetString(1);
            //        //var File_Title = rdr.GetString(2);
            //        //MDE.adver_file = rdr.GetString(0);
            //        //MDE.File_Name = File_Name.ToString();
            //        //MDE.File_Folder = File_Folder.ToString();
            //        //MDE.File_Title = File_Title.ToString();
            //        //MDE.File_Name = rdr.GetString(1);
            //        //MDE.File_Title = rdr.GetString(2);
            //    }
            //}
            //getUpLoadDataDetail1(
            using (SqlDataAdapter dataAdapter = new SqlDataAdapter(commandText, conn))
            {
                // create the DataSet 
                DataSet dataSet = new DataSet();
                // fill the DataSet using our DataAdapter 
                dataAdapter.Fill(dataSet);
                if (dataSet.Tables[0].Rows.Count > 2)
                {
                    //MDE.adver_content = dataSet.Tables[0].Rows[0]["adver_content"].ToString();
                    _emailEntity.File_Name = dataSet.Tables[0].Rows[2]["File_Name"].ToString();
                    _emailEntity.File_Title = dataSet.Tables[0].Rows[2]["File_Title"].ToString();

                }
            }

            noticeBoardEntity nbe = null;

        }
        return _emailEntity;
    }


    public List<emailEntity> getMailData(string U_Num, string keyWord)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num;':" + U_Num+ "'keyWord':" + keyWord, className, methodName);
        string commandText = string.Empty;
        if (!common.isEmpty(keyWord))
        {
            commandText = "select MS_ID,MS_Sender,MS_Title,MS_Text,read_tag,add_Date,add_User,add_ip from MMAIL where del_tag='0' and MS_Receiver='" + U_Num + "' and (MS_title like '%" + keyWord + "%' or ms_text like '%" + keyWord + "%') order by add_Date desc";
        }
        else
        {
            commandText = "select MS_ID,MS_Sender,MS_Title,MS_Text,read_tag,add_Date,add_User,add_ip from MMAIL where del_tag='0' and MS_Receiver='" + U_Num + "' order by add_Date desc";
        }
        List<emailEntity> eeList = MMAILhgSql.Instance.getMailData(connectionStrings, commandText);

        log.endWrite("'eeList' :" + eeList.ToString(), className, methodName);
        return eeList;
    }

    public string deleteMailData(string mailId)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'mailId':" + mailId, className, methodName);
        string commandText = "";
        string backStr = "";
        if (mailId.IndexOf(',') < 0)
        {
            commandText = "UPDATE MMAIL SET del_tag='1' where MS_ID='" + mailId + "'";
        }
        else
        {
            string[] MS_IDarr = mailId.Split(',');
            foreach (var ms in MS_IDarr)
            {
                commandText += "UPDATE MMAIL SET del_tag='1' where MS_ID='" + ms + "';";
                backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);//<==========
            }

        }
        backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
    //新增郵件資訊
    public string addMailData(emailEntity ee)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + ee.MS_ID + "'MS_Sender':" + ee.MS_Sender + "'MS_Receiver':" + ee.MS_Receiver + "'MS_Title':" + ee.MS_Title + "'MS_Text':" + ee.MS_Text + "'add_User':" + ee.add_User + "'add_ip':" + ee.add_ip, className, methodName);
        string commandText = "INSERT INTO MMAIL ([MS_ID],[MS_Sender],[MS_Receiver],[MS_Title],[MS_Text],[add_Date],[add_User],[add_ip]) VALUES('{0}', '{1}', '{2}', '{3}', '{4}',GETDATE(), '{5}', '{6}'); ";
        
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(commandText,ee.MS_ID, ee.MS_Sender, ee.MS_Receiver, ee.MS_Title, ee.MS_Text, ee.add_User, ee.add_ip));
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sb.ToString());//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public string updateReadtag(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        string commandText = "UPDATE MMAIL SET read_tag='1' where MS_ID='"+ MS_ID + "'";
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
}