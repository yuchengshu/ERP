using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using System.Reflection;

/// <summary>
/// MMTELhgSql 的摘要描述
/// </summary>
public class MMTELhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MMTELhgSql _instanct = new MMTELhgSql();
    public static MMTELhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MMTELhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<MMTELdataEntity> getMMTELdata(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<MMTELdataEntity> mdeList = new List<MMTELdataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            MMTELdataEntity mde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    mde = new MMTELdataEntity();
                    //mde.MT_Date = sr[0].ToString().Trim();
                    //mde.MT_Teacher = sr[1].ToString().Trim();
                    //mde.MT_Program = sr[2].ToString().Trim();
                    //mde.MT_Okey = sr[3].ToString().Trim();
                    //mde.MT_Nkey = sr[4].ToString().Trim();
                    mdeList.Add(mde);
                }
                sr.Close();
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'mdeList':" + mdeList.ToString(), className, methodName);
        return mdeList;
    }
    //2020510(取得所有電話統計資料)
    public List<MMTELdataEntity> getMPMMTELdata(string sqlcommandTXT)
    {

        string connectionStrings = "sqlConnectHG_Test_TEST";
        //sqlcommandTXT = "select a.MT_Date,a.MT_Teacher,a.MT_Program,a.MT_Okey,a.MT_Nkey,a.add_user,b.P_Channel,b.P_Time from MMTEL a left join WProgram b on a.MT_Program=b.P_ID;";
        //sqlcommandTXT = "select a.MT_Date,c.U_Name,a.MT_Program,a.MT_Okey,a.MT_Nkey,a.add_user,b.P_Channel,b.P_Time from MMTEL a left join WProgram b on a.MT_Program=b.P_ID left join MUSER c on a.MT_Teacher=c.U_Num order by MT_Date desc;";
        //sqlcommandTXT = "select a.MT_Date,c.U_Name,a.MT_Program,a.MT_Okey,a.MT_Nkey,a.add_user,b.P_Channel+'【'+b.P_Time+'】' AS TV_Program from MMTEL a left join WProgram b on a.MT_Program=b.P_ID left join MUSER c on a.MT_Teacher=c.U_Num order by MT_Date desc;";
        ///用這個20220510
        //sqlcommandTXT = "select a.MT_Date,c.U_Name,a.MT_Program,a.MT_Okey,a.MT_Nkey,a.add_user,b.P_Channel+'【'+b.P_Time+'】' AS TV_Program from MMTEL a left join WProgram b on a.MT_Program=b.P_ID left join MUSER c on a.MT_Teacher=c.U_Num order by MT_Date desc;";
        ///用這個20220510new
        //sqlcommandTXT = "select d.ddesc,a.MT_Date,c.U_Name AS MT_Teacher,a.MT_Program,a.MT_Okey,a.MT_Nkey,a.add_user,b.P_Channel+'【'+b.P_Time +b.P_Date+'】'  AS TV_Program  from MMTEL a left join WProgram b on a.MT_Program=b.P_ID left join MUSER c on a.MT_Teacher=c.U_Num  left join MITEM d on d.ditcode=b.P_Item Where d.mitcode='PROGM' order by MT_Date desc;";
        //sqlcommandTXT = "select d.ddesc, a.MT_Date,c.U_Name,a.MT_Program,a.MT_Okey,a.MT_Nkey,a.add_user,b.P_Channel+'【'+b.P_Time+'】' as 節目名稱 ,d.ddesc from MMTEL a left join WProgram b on a.MT_Program=b.P_ID left join MUSER c on a.MT_Teacher=c.U_Num left join MITEM d on b.P_Item=d.ditcode order by MT_Date desc;";
        ///用這個20220511
        //sqlcommandTXT = "select a.MT_Date,c.U_Name AS MT_Teacher,d.ddesc,b.P_Channel+'【'+b.P_Time +b.P_Date+'】' AS TV_Program_Name,a.MT_Okey,a.MT_Nkey,e.U_Name add_UserName  from MMTEL a left join WProgram b on a.MT_Program=b.P_ID left join MUSER c on a.MT_Teacher=c.U_Num left join MUSER e on a.add_user=e.U_Num left join MITEM d on d.ditcode=b.P_Item Where d.mitcode='PROGM' order by MT_Date desc;";
        string commandText = sqlcommandTXT;
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, sqlcommandTXT));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<MMTELdataEntity> mdeList = new List<MMTELdataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = sqlcommandTXT;
            MMTELdataEntity mde = null;
            string MT_Program_Value = "";
            var table = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter(sqlcommandTXT, conn);
            DataSet customers = new DataSet();
            adapter.Fill(customers, "MPMMTELdata");
            DataTable MPMMTELdata;
            MPMMTELdata = customers.Tables["MPMMTELdata"];
            for (int i = 0; i < MPMMTELdata.Rows.Count; i++)
            {

                if (MPMMTELdata.Rows[i][2].ToString().Trim()== "劉&#23032;希")
                {
                    MPMMTELdata.Rows[i][2] = "劉妍希";
                }
               
            }
            mdeList = ConvertToList<MMTELdataEntity>(MPMMTELdata);


        }

        //從資料庫把資料撈出來*************************************************************************************************end
        //log.endWrite("'mdeList':" + mdeList.ToString(), className, methodName);
        //return mdeList;
        return mdeList;
    }
    //從DataTable轉List
    public List<T> ConvertToList<T>(DataTable dt)
    {
        var columnNames = dt.Columns.Cast<DataColumn>()
                .Select(c => c.ColumnName)
                .ToList();
        var properties = typeof(T).GetProperties();
        return dt.AsEnumerable().Select(row =>
        {
            var objT = Activator.CreateInstance<T>();
            foreach (var pro in properties)
            {
                if (columnNames.Contains(pro.Name))
                {
                    PropertyInfo pI = objT.GetType().GetProperty(pro.Name);
                    pro.SetValue(objT, row[pro.Name] == DBNull.Value ? null : Convert.ChangeType(row[pro.Name], pI.PropertyType));
                }
            }
            return objT;
        }).ToList();
    }

    //取得節目名稱(P_Channel_P_Time)
    private string GetMT_Program_P_Channel_P_Time(string mT_Program_Value, SqlConnection GetMT_Program_ddsec_conn)
    {
        string P_Channel_Time = "";
        //sql連線字串 webconfig的對應位置
        //private static string connectionStrings = "sqlConnectHG_Test";
        string connectionStrings = "sqlConnectHG_Test_TEST"; ;
        //string commandText = sqlcommandTXT;
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        string commandText = "SELECT P_Channel,P_Time,P_Date FROM WProgram WHERE P_ID=" + mT_Program_Value;
        //sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<MMTELdataEntity> mdeList = new List<MMTELdataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.Connection = GetMT_Program_ddsec_conn;
            cmd.CommandText = commandText;
            MMTELdataEntity mde = null;
            string MT_Program_Value = "";
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                //select MT_Date,MT_Teacher,MT_Program,MT_Okey,MT_Nkey,add_user from MMTEL where del_tag = '0'
                try
                {
                    while (sr.Read())
                    {
                        var P_Channel = sr[0].ToString().Trim();//P_Channel[頻道名稱]
                        var P_Time = sr[1].ToString().Trim();//P_Time[頻道時間]
                        var P_Date = sr[2].ToString().Trim();//P_Time[頻道時間]
                        P_Channel_Time = P_Channel + "【" + P_Time + P_Date + "】";//節目名稱
                                                                                 //SqlCommand cmd2 = new SqlCommand();
                                                                                 //cmd2.Connection = conn;
                                                                                 //string commandText2 = "SELECT DDSEC FROM MITEM WHERE DITCODE=" + PITEM;

                        //cmd2.CommandText = commandText2;
                        //MMTELdataEntity mde2 = null;
                        //mde = new MMTELdataEntity();
                        //mde.MT_Date = sr[0].ToString().Trim();
                        //mde.MT_Teacher = sr[1].ToString().Trim();
                        ////mde.MT_Program = sr[2].ToString().Trim();
                        //MT_Program_Value = sr[2].ToString().Trim();
                        //mde.MT_Program = GetMT_Program(MT_Program_Value);
                        //mde.MT_Okey = sr[3].ToString().Trim();
                        //mde.MT_Nkey = sr[4].ToString().Trim();
                        //mdeList.Add(mde);
                        //return P_Channel_Time;
                    }
                }
                catch (Exception)
                {


                }
                finally { sr.Close(); }
                return P_Channel_Time;
            }
        }
        //return P_Channel_Time;
    }

    //struct Values
    //{
    //    public string PITEM;
    //    public string P_Channel;
    //    public string P_Time;
    //    public string ddsec;
    //}
    //取得節目 1種類 2名稱[標題][時段]
    private Values GetMT_Program_ddsec(string mT_Program_Value, SqlConnection conn_GetMT_Program_ddsec)
    {
        //string ddsec = "";
        //sql連線字串 webconfig的對應位置
        //private static string connectionStrings = "sqlConnectHG_Test";
        string connectionStrings = "sqlConnectHG_Test_TEST"; ;
        //string commandText = sqlcommandTXT;
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        //string commandText = "SELECT P_Item FROM WProgram WHERE P_ID=" + mT_Program_Value;
        //sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        string commandText = "";
        string commandText3 = "";
        string commandText4 = "";
        List<MMTELdataEntity> mdeList = new List<MMTELdataEntity>();
        Values value = new Values();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {

            commandText = "SELECT A.ddesc,B.P_Item,B.P_Channel FROM MITEM A Left join WProgram B on A.ditcode=B.P_Item Where a.mitcode='PROGM' and B.P_ID=" + mT_Program_Value;


            string ddsec = "";//節目種類
                              //conn.Open();
            SqlCommand cmd = new SqlCommand();
            conn_GetMT_Program_ddsec.Close();
            cmd.Connection = conn_GetMT_Program_ddsec;
            cmd.Connection.Open();
            cmd.CommandText = commandText;
            MMTELdataEntity mde = null;
            string MT_Program_Value3 = "";
            SqlDataReader sr = cmd.ExecuteReader();
            int i = 0;
            ////不指定維度
            //string [,,] para = new string[,,]
            //{
            //};

            while (sr.Read())
            {
                value.ddsec = sr[0].ToString().Trim();//節目種類
                //value.P_Channel = sr[1].ToString().Trim();//節目名稱[標題](0002)
                //value.P_Time = sr[2].ToString().Trim();//節目名稱[時段]
            }
            sr.Close();
            //SqlCommand cmd2 = new SqlCommand();
            //SqlCommand cmd3 = new SqlCommand();
            //while (sr.Read())
            //{
            //    i++;
            //    V.PITEM = sr[0].ToString().Trim();//002
            //    vP_Channel = sr[1].ToString().Trim();//節目名稱[標題]
            //    var P_Time=sr[2].ToString().Trim();//節目名稱[時段]
            //    V.PITEM = PITEM;
            //    V.P_Channel = P_Channel;
            //    V.P_Time = P_Time;
            //    //cmd.Connection.Close();

            //    cmd2.Connection = conn_GetMT_Program_ddsec;
            //    //cmd2.Connection.Open();//有問題
            //    string commandText2 = "SELECT DDESC FROM MITEM WHERE mitcode='PROGM' and DITCODE='" + PITEM + "'";
            //    cmd2.CommandText=commandText2; ;
            //    //cmd2.CommandText = commandText2;
            //    //MMTELdataEntity mde2 = null;
            //    //cmd2.Connection.Open();
            //    //cmd2.Connection.Open();
            //    SqlDataReader sr2 = cmd2.ExecuteReader();//有問題
            //    while (sr2.Read())
            //    {
            //        V.ddsec = sr2[0].ToString().Trim();//DDSEC[節目種類](廣播)

            //    }
            //    //using (SqlDataReader sr3 = cmd3.ExecuteReader())
            //    //{
            //    //    while (sr3.Read())
            //    //    {

            //    //        MT_Program_Value3 = sr[0].ToString().Trim();
            //    //        //sr.Close();

            //    //    }
            //    //    sr.Close();
            //    //}
            //    //cmd2.Connection.Close();
            //    //}
            //}
            //using (SqlConnection conn3 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
            //{
            //    try
            //    {
            //        //while (sr.Read())
            //        //{
            //        //    var PITEM = sr[0].ToString().Trim();//002
            //        //    sr.Close();
            //        //    //cmd.Connection.Close();

            //        //    cmd2.Connection = conn_GetMT_Program_ddsec;
            //        //    //cmd2.Connection.Open();//有問題
            //        //    string commandText2 = "SELECT DDESC FROM MITEM WHERE mitcode='PROGM' and DITCODE='" + PITEM + "'";
            //        //    cmd2.CommandText = commandText2;
            //        //    MMTELdataEntity mde2 = null;
            //        //    //cmd2.Connection.Open();
            //        //    //cmd2.Connection.Open();
            //        //    SqlDataReader sr2 = cmd2.ExecuteReader();
            //        //    while (sr2.Read())
            //        //    {
            //        //        ddsec = sr2[0].ToString().Trim();//DDSEC[節目種類](廣播)

            //        //    }
            //        //    using (SqlDataReader sr3 = cmd2.ExecuteReader())
            //        //    {
            //        //        while (sr3.Read())
            //        //        {

            //        //            MT_Program_Value3 = sr[0].ToString().Trim();
            //        //            //sr.Close();

            //        //        }
            //        //        sr.Close();
            //        //    }
            //        //    //cmd2.Connection.Close();
            //        //    //}
            //        //}

            //    }
            //    catch (Exception ex)
            //    {
            //        throw ex;

            //    }
            //    cmd.Connection.Close();
            //    //  return ddsec;//節目種類
            //}
            conn.Close();
            //return value;//節目種類
        }
        return value;//節目種類
        //conn.Close();
    }
    //取得分析師姓名
    private string GetMUSER_U_Name(string mT_Program_Value, SqlConnection conn2)
    {
        string P_Channel_Time = "";
        string connectionStrings = "sqlConnectHG_Test_TEST"; ;
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        string commandText = "SELECT U_Name FROM MUSER WHERE U_Num='" + mT_Program_Value + "'";
        string MT_Program_Value = "";
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<MMTELdataEntity> mdeList = new List<MMTELdataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            string U_Name = "";

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.Connection.Open();
            cmd.CommandText = commandText;
            MMTELdataEntity mde = null;
            //string MT_Program_Value = "";
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    if (sr[0].ToString().Trim() == "劉&#23032;希")
                    {
                        MT_Program_Value = "劉妍希";
                    }
                    else
                    {
                        MT_Program_Value = sr[0].ToString().Trim();
                    }
                    //sr.Close();

                }
                sr.Close();
            }

            conn.Close();

        }


        return MT_Program_Value;
    }
};