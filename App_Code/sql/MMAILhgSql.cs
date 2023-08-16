using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;
using System.Data;

/// <summary>
/// MMAILhgSql 的摘要描述
/// </summary>
public class MMAILhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MMAILhgSql _instanct = new MMAILhgSql();
    public static MMAILhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }

    public MMAILhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string checkUnReadMail(string connectionStrings, string commandText)
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
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    backString = sr[0].ToString().Trim();

                }
            }
        }

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    public List<emailBoxEntity> getEmailBox(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<emailBoxEntity> ebeList = new List<emailBoxEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
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
                    emailBoxEntity ebe = new emailBoxEntity();
                    ebe.auto_id = sr[0].ToString().Trim();
                    ebe.MS_ID = sr[1].ToString().Trim();
                    ebe.MS_Sender = sr[2].ToString().ToUpper().Trim();
                    ebe.MS_Title = sr[4].ToString().Trim();
                    ebe.MS_Text = sr[5].ToString().Trim();
                    ebe.add_Date = sr[8].ToString().Trim();
                    ebeList.Add(ebe);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(ebeList.ToString(), className, methodName);
        return ebeList;
    }

    //取得詳細資料(標題 發佈時間 發佈人員[[U_Num-COMID-DEPAR] 內文(不含附件))
    public emailEntity getMailDetail(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        emailEntity ee = null;
        //從資料庫把資料撈出來*************************************************************************************************start
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
                    ee = new emailEntity();
                    ee.MS_Sender = sr[0].ToString().Trim();
                    ee.MS_Title = sr[1].ToString().Trim();
                    ee.MS_Text = sr[2].ToString().Trim();
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'ee' :"+ ee.ToString(), className, methodName);
        return ee;
    }
    //取得詳細資料(標題 發佈時間 發佈人員[[U_Num-COMID-DEPAR] 附件1 內文)
    public emailEntity getUpLoadDataDetail1(string connectionStrings, string commandText,string mailID) 
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
    //取得詳細資料(標題 發佈時間 發佈人員[[U_Num-COMID-DEPAR] 附件2 內文)
    public emailEntity getUpLoadDataDetail2(string connectionStrings, string commandText)
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
                    _emailEntity.File_Name = dataSet.Tables[0].Rows[1]["File_Name"].ToString();
                    _emailEntity.File_Title = dataSet.Tables[0].Rows[1]["File_Title"].ToString();

                }
            }

            noticeBoardEntity nbe = null;

        }
        return _emailEntity;
    }
    //取得詳細資料(標題 發佈時間 發佈人員[[U_Num-COMID-DEPAR] 附件3 內文)
    public emailEntity getUpLoadDataDetail3(string connectionStrings, string commandText)
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
                    _emailEntity.File_Name = dataSet.Tables[0].Rows[2]["File_Name"].ToString();
                    _emailEntity.File_Title = dataSet.Tables[0].Rows[2]["File_Title"].ToString();

                }
            }

            noticeBoardEntity nbe = null;

        }
        return _emailEntity;
    }


    public List<emailEntity> getMailData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<emailEntity> eeList = new List<emailEntity>();
        emailEntity ee = null;
        //從資料庫把資料撈出來*************************************************************************************************start
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
                    ee = new emailEntity();
                    ee.MS_ID = sr[0].ToString().Trim();
                    ee.MS_Sender = sr[1].ToString().Trim();
                    ee.MS_Title = sr[2].ToString().Trim();
                    ee.MS_Text = sr[3].ToString().Trim();
                    ee.read_tag = sr[4].ToString().Trim();
                    ee.add_Date = sr[5].ToString().Trim();
                    ee.add_User = sr[6].ToString().Trim();
                    ee.add_ip = sr[7].ToString().Trim();
                    eeList.Add(ee);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'eeList' :" + eeList.ToString(), className, methodName);
        return eeList;
    }
}