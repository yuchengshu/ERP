using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;
using System.Data;

/// <summary>
/// MBULThgSql 的摘要描述
/// </summary>
public class MBULThgSql : System.Web.UI.Page
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MBULThgSql _instanct = new MBULThgSql();
    public static MBULThgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MBULThgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";
    public string getadUserNameByUserID(string UserID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'UserID:' : " + UserID, className, methodName);
        /**/
        // where T_ID='{0}'
        string backString = string.Empty;
        string commandText = "SELECT U_Name FROM MUSER Where U_Num='" + UserID + "'";// +
                                                                                     // and ditcode = '{0}'";
                                                                                     //StringBuilder sbCommandText = new StringBuilder();
                                                                                     //sbCommandText.Append(string.Format(commandText, adver_dep));

        backString = MITEMhgSql.Instance.getU_Name(connectionStrings, commandText);

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }
    public string getadver_dep_NameByID(string adver_dep)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'adver_dep' : " + adver_dep, className, methodName);
        /**/
        // where T_ID='{0}'
        string backString = string.Empty;
        string commandText = "SELECT ddesc FROM [HG].[dbo].[MITEM] where mitcode = 'DEPAR' and ditcode <> '0000' and del_tag = '0' and ditcode='{0}'order by rank";// +
                                                                                                                                                                   // and ditcode = '{0}'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, adver_dep));

        backString = MITEMhgSql.Instance.getU_MDEP(connectionStrings, sbCommandText.ToString());

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }
    public string getadver_depart_nameByID(string adver_depart_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'adver_depart_id' : " + adver_depart_id, className, methodName);
        // where T_ID='{0}'
        string backString = string.Empty;
        string commandText = "SELECT ddesc FROM [HG].[dbo].[MITEM] where mitcode = 'DEPAR' and ditcode <> '0000' and del_tag = '0' and ditcode='{0}'order by rank";// +
                                                                                                                                                                   // and ditcode = '{0}'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, adver_depart_id));

        backString = MITEMhgSql.Instance.getU_MDEP(connectionStrings, sbCommandText.ToString());

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }
    public List<noticeBoardEntity> getNoticeBoard(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<noticeBoardEntity> nbeList = new List<noticeBoardEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            noticeBoardEntity nbe = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    nbe = new noticeBoardEntity();
                    nbe.adver_id = sr[0].ToString().Trim();
                    nbe.adver_item = sr[1].ToString().Trim();
                    nbe.adver_dep = sr[2].ToString().Trim();
                    nbe.adver_depName = getadver_depart_nameByID(nbe.adver_dep);
                    //nbe.adver_depName
                    nbe.adver_subject = sr[3].ToString().Trim();
                    nbe.adver_content = sr[4].ToString().Trim();
                    nbe.adver_depart_id = sr[5].ToString().Trim();
                    //nbe.adver_depart_id_Name
                    nbe.adver_depart_Name = getadver_depart_nameByID(nbe.adver_depart_id);
                    if (sr[6] != null)
                    {
                        nbe.adver_employ_id = sr[6].ToString().Trim();
                    }
                    nbe.adver_employ_Name = getadUserNameByUserID(nbe.adver_employ_id);//發布人員姓名
                    nbe.adver_create_date = sr[8].ToString().Trim();
                    nbeList.Add(nbe);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(nbeList.ToString(), className, methodName);
        if(nbeList.Count==0)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('查無資料!');", true);
        }
        return nbeList;
    }
    public List<noticeBoardEntity> getHnBankCredit(string connectionStrings, string commandText, string day1, string day2)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<noticeBoardEntity> nbeList = new List<noticeBoardEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            noticeBoardEntity nbe = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    nbe = new noticeBoardEntity();
                    nbe.adver_id = sr[0].ToString().Trim();
                    nbe.adver_create_date = day1;//起始日期
                    nbe.adver_item = day2;//截止日期
                    //nbe.adver_item = sr[1].ToString().Trim();
                    //nbe.adver_dep = sr[2].ToString().Trim();
                    //nbe.adver_subject = sr[3].ToString().Trim();
                    //nbe.adver_content = sr[4].ToString().Trim();
                    //nbe.adver_depart_id = sr[5].ToString().Trim();
                    //nbe.adver_employ_id = sr[6].ToString().Trim();
                    //nbe.adver_create_date = sr[8].ToString().Trim();
                    nbeList.Add(nbe);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(nbeList.ToString(), className, methodName);
        return nbeList;
    }
    //取得詳細資料(標題 發佈時間 發佈人員[[U_Num-COMID-DEPAR] 內文(不含附件1))
    public MBULTDetailEntity getUpLoadDataDetail(string connectionStrings, string commandText, string adver_id)
    {

        MBULTDetailEntity MDE = new MBULTDetailEntity();
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand File_Name_cmd = new SqlCommand();
            SqlCommand GetDetail = new SqlCommand();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            noticeBoardEntity nbe = null;

            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {

                    nbe = new noticeBoardEntity();
                    MDE.adver_subject = sr[0].ToString().Trim();//標題
                    MDE.adver_create_date = sr[8].ToString().Trim();//發布時間
                    MDE.COMID = getadver_depart_nameByID(sr[5].ToString().Trim());//公司
                    MDE.DEPAR = common.getComIDfullName(sr[7].ToString().Trim());//部門
                    MDE.adver_employ_id = sr[6].ToString().Trim();
                    MDE.adver_employ_Name = getadUserNameByUserID(sr[6].ToString().Trim());//姓名
                    MDE.adver_employ_Name = MDE.adver_employ_Name + "-" + MDE.COMID + "-" + MDE.DEPAR;//發布人員(藍世傑-財富管理一部A組- 財富管理部)
                    MDE.adver_content = sr[4].ToString().Trim();//內文

                }
            }
        }
        return MDE;
    }
    //取得詳細資料(標題 發佈時間 發佈人員[[U_Num-COMID-DEPAR] 附件1 內文)
    public MBULTDetailEntity getUpLoadDataDetail1(string connectionStrings, string commandText, string adver_id)
    {
        MBULTDetailEntity MDE = new MBULTDetailEntity();
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
                    MDE.File_Name = dataSet.Tables[0].Rows[0]["File_Name"].ToString();
                    MDE.File_Title = dataSet.Tables[0].Rows[0]["File_Title"].ToString();

                }
            }

            noticeBoardEntity nbe = null;

        }
        return MDE;
    }
    //取得詳細資料(標題 發佈時間 發佈人員[[U_Num-COMID-DEPAR] 附件2 內文)
    public MBULTDetailEntity getUpLoadDataDetail2(string connectionStrings, string commandText, string adver_id)
    {
        MBULTDetailEntity MDE = new MBULTDetailEntity();
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
            //getUpLoadDataDetail2(
            using (SqlDataAdapter dataAdapter = new SqlDataAdapter(commandText, conn))
            {
                // create the DataSet 
                DataSet dataSet = new DataSet();
                // fill the DataSet using our DataAdapter 
                dataAdapter.Fill(dataSet);
                if (dataSet.Tables[0].Rows.Count > 1)
                {
                    MDE.File_Name = dataSet.Tables[0].Rows[1]["File_Name"].ToString();
                    MDE.File_Title = dataSet.Tables[0].Rows[1]["File_Title"].ToString();
                }
            }

            noticeBoardEntity nbe = null;

        }
        return MDE;
    }
    //取得詳細資料(標題 發佈時間 發佈人員[[U_Num-COMID-DEPAR] 附件3 內文)
    public MBULTDetailEntity getUpLoadDataDetail3(string connectionStrings, string commandText, string adver_id)
    {
        MBULTDetailEntity MDE = new MBULTDetailEntity();
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
            //getUpLoadDataDetail3(
            using (SqlDataAdapter dataAdapter = new SqlDataAdapter(commandText, conn))
            {
                // create the DataSet 
                DataSet dataSet = new DataSet();
                // fill the DataSet using our DataAdapter 
                dataAdapter.Fill(dataSet);
                if (dataSet.Tables[0].Rows.Count > 2)
                {
                    MDE.File_Name = dataSet.Tables[0].Rows[2]["File_Name"].ToString();
                    MDE.File_Title = dataSet.Tables[0].Rows[2]["File_Title"].ToString();
                }
            }

            noticeBoardEntity nbe = null;

        }
        return MDE;
    }
}