using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// MSOUSEhgSql 的摘要描述
/// </summary>
public class MSFTFSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MSFTFSql _instanct = new MSFTFSql();
    public static MSFTFSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MSFTFSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<MSFTFDataEntity> getMSFTF(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<MSFTFDataEntity> MSFTFList = new List<MSFTFDataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            MSFTFDataEntity MSFTF = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    MSFTF = new MSFTFDataEntity();
                    MSFTF.Auto_id = sr[0].ToString().Trim();
                    MSFTF.Sk_No = sr[1].ToString().Trim();
                    MSFTF.Sk_Name = sr[2].ToString().Trim();
                    MSFTF.Industrial= Industrial_Name(connectionStrings, sr[3].ToString().Trim());//產業別(中文)
                    MSFTF.Buy_date = sr[4].ToString().Trim();
                    MSFTF.Close_Price = sr[5].ToString().Trim();
                    MSFTF.EPS = sr[6].ToString().Trim();
                    MSFTF.Tg_Price= sr[7].ToString().Trim();
                    MSFTF.Sk_text = sr[8].ToString().Trim();
                    MSFTF.del_tag = sr[9].ToString().Trim();
                    MSFTF.add_date=sr[10].ToString().Trim();
                    MSFTF.add_user=sr[11].ToString().Trim();
                    MSFTF.add_ip=sr[12].ToString().Trim();
                    MSFTFList.Add(MSFTF);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("MSFTFList' : " + MSFTFList.ToString(), className, methodName);
        return MSFTFList;
    }
    public string Industrial_Name(string connectionStrings, string Industrial_ditcode)
    {

        //  using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        //  {
        //      conn.Open();
        //SqlCommand cmd = new SqlCommand();
        //cmd.Connection = conn;
        string commandText = "SELECT[ddesc] FROM[HG].[dbo].[MITEM] where mitcode = 'STKIT' and ditcode = '" + Industrial_ditcode + "'";
        //cmd.CommandText = commandText;
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            msftfEntity msftf = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    msftf = new msftfEntity();

                    msftf.Auto_id = sr[0].ToString().Trim();//產業別(中文)
                                                            //msftf.Sk_text = sr[1].ToString().Trim();//股票
                                                            //msftf.Sk_Name = sr[2].ToString().Trim();
                                                            //msftf.Industrial = sr[3].ToString().Trim();//產業別
                                                            //msftf.Buy_date = sr[4].ToString().Trim();
                                                            //msftf.Close_Price = sr[5].ToString().Trim();//收盤價
                                                            //msftf.EPS = sr[6].ToString().Trim();//今年EPS
                                                            //msftf.Tg_Price = sr[7].ToString().Trim();//目標價
                                                            //msftf.Sk_text = sr[8].ToString().Trim();//個股說明
                                                            //msftf.del_tag = sr[9].ToString().Trim();
                                                            //msftf.add_date = sr[10].ToString().Trim();
                                                            //msftf.add_user = sr[11].ToString().Trim();
                                                            //msftf.add_ip = sr[12].ToString().Trim();
                                                            //msftfList.Add(msftf);
                }
            }
            return msftf.Auto_id;//產業別(中文)
        }
        
        //        }


    }
    public List<msftfEntity> getmsftfList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<msftfEntity> msftfList = new List<msftfEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            msftfEntity msftf = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    msftf = new msftfEntity();

                    msftf.Auto_id = sr[0].ToString().Trim();
                    msftf.Sk_text = sr[1].ToString().Trim();//股票(代號)
                    msftf.Sk_Name = sr[2].ToString().Trim();//股票(中文)
                    msftf.Industrial = Industrial_Name(connectionStrings,sr[3].ToString().Trim());//產業別(中文)
                    msftf.Buy_date = sr[4].ToString().Trim();
                    msftf.Close_Price = sr[5].ToString().Trim(); //收盤價
                    msftf.EPS = sr[6].ToString().Trim();//今年EPS
                    msftf.Tg_Price = sr[7].ToString().Trim();//目標價
                    msftf.Sk_text = sr[8].ToString().Trim();//個股說明
                    msftf.del_tag = sr[9].ToString().Trim();
                    msftf.add_date = sr[10].ToString().Trim();
                    msftf.add_user = sr[11].ToString().Trim();
                    msftf.add_ip = sr[12].ToString().Trim();
                    msftfList.Add(msftf);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'msftfList' : " + msftfList.ToString(), className, methodName);
        return msftfList;
    }
}