using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;
using System.Data;

/// <summary>
/// MCOTFhgSql 的摘要描述
/// </summary>
public class MCOTFhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    private static string connectionStrings = "sqlConnectHG_Test";
    private static MCOTFhgSql _instanct = new MCOTFhgSql();
    public static MCOTFhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MCOTFhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string getU_Agent_Name(string connectionStrings, string commandText)
    {
        string value = "";
        using (SqlConnection conn6 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            //SqlConnection connection = conn;

            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn6;
            cmd.CommandText = commandText;
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
            //conn.Open();

            SqlDataAdapter adapter = new SqlDataAdapter(commandText, conn6);
            adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
            if (cmd.Connection.State.ToString() == "Closed")
                cmd.Connection.Open();

            try
            {
                adapter.Fill(ds);//取出所有會場編號
            }
            catch (Exception ex)
            {

                throw ex;
            }
            //adapter.Fill(ds);//取出所有會場編號
            foreach (DataRow datarow in ds.Tables[0].Rows)
            {
                //每個資料列的內容
            }
            //int V_ID_Count = dt.Rows.Count;
            foreach (DataRow row in ds.Tables[0].Rows)
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
             }
             return value;
             */
            return value;
        }
    }
    public string getM_ID(string connectionStrings, string commandText)
    {
        string value = "";
        using (SqlConnection conn6 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            //SqlConnection connection = conn;

            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn6;
            cmd.CommandText = commandText;
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
            //conn.Open();

            SqlDataAdapter adapter = new SqlDataAdapter(commandText, conn6);
            adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
            if (cmd.Connection.State.ToString() == "Closed")
                cmd.Connection.Open();

            try
            {
                adapter.Fill(ds);//取出所有會場編號
            }
            catch (Exception ex)
            {

                throw ex;
            }
            //adapter.Fill(ds);//取出所有會場編號
            foreach (DataRow datarow in ds.Tables[0].Rows)
            {
                //每個資料列的內容
            }
            //int V_ID_Count = dt.Rows.Count;
            foreach (DataRow row in ds.Tables[0].Rows)
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
             }
             return value;
             */
            return value;
        }
    }
    public string getOLD_MC_NAME(string connectionStrings, string commandText)
    {
        string value = "";
        using (SqlConnection conn6 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            //SqlConnection connection = conn;

            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn6;
            cmd.CommandText = commandText;
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
            //conn.Open();

            SqlDataAdapter adapter = new SqlDataAdapter(commandText, conn6);
            adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
            if (cmd.Connection.State.ToString() == "Closed")
                cmd.Connection.Open();

            try
            {
                adapter.Fill(ds);//取出所有會場編號
            }
            catch (Exception ex)
            {

                throw ex;
            }
            //adapter.Fill(ds);//取出所有會場編號
            foreach (DataRow datarow in ds.Tables[0].Rows)
            {
                //每個資料列的內容
            }
            //int V_ID_Count = dt.Rows.Count;
            foreach (DataRow row in ds.Tables[0].Rows)
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
             }
             return value;
             */
            return value;
        }
    }

    public string getDetail_S_Date(string connectionStrings, string commandText)
    {
        string value = "";
        using (SqlConnection conn6 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            //SqlConnection connection = conn;

            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn6;
            cmd.CommandText = commandText;
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
            //conn.Open();

            SqlDataAdapter adapter = new SqlDataAdapter(commandText, conn6);
            adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
            if (cmd.Connection.State.ToString() == "Closed")
                cmd.Connection.Open();

            try
            {
                adapter.Fill(ds);//取出所有會場編號
            }
            catch (Exception ex)
            {

                throw ex;
            }
            //adapter.Fill(ds);//取出所有會場編號
            foreach (DataRow datarow in ds.Tables[0].Rows)
            {
                //每個資料列的內容
            }
            //int V_ID_Count = dt.Rows.Count;
            foreach (DataRow row in ds.Tables[0].Rows)
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
             }
             return value;
             */
            return value;
        }
    }

    public string getDetail_S_tag(string connectionStrings, string commandText)
    {
        string value = "";
        using (SqlConnection conn6 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            //SqlConnection connection = conn;

            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn6;
            cmd.CommandText = commandText;
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
            //conn.Open();

            SqlDataAdapter adapter = new SqlDataAdapter(commandText, conn6);
            adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
            if (cmd.Connection.State.ToString() == "Closed")
                cmd.Connection.Open();

            try
            {
                adapter.Fill(ds);//取出所有會場編號
            }
            catch (Exception ex)
            {

                throw ex;
            }
            //adapter.Fill(ds);//取出所有會場編號
            foreach (DataRow datarow in ds.Tables[0].Rows)
            {
                //每個資料列的內容
            }
            //int V_ID_Count = dt.Rows.Count;
            foreach (DataRow row in ds.Tables[0].Rows)
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
             }
             return value;
             */
            if(value=="1")
            {
                value = "暫停";
            }
            else
            {
                value = "恢復";
            }
            return value;
        }
    }
    public string getDetail_S_ID(string connectionStrings, string commandText)
    {
        string value = "";
        using (SqlConnection conn6 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            //SqlConnection connection = conn;

            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn6;
            cmd.CommandText = commandText;
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
            //conn.Open();

            SqlDataAdapter adapter = new SqlDataAdapter(commandText, conn6);
            adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
            if (cmd.Connection.State.ToString() == "Closed")
                cmd.Connection.Open();

            try
            {
                adapter.Fill(ds);//取出所有會場編號
            }
            catch (Exception ex)
            {

                throw ex;
            }
            //adapter.Fill(ds);//取出所有會場編號
            foreach (DataRow datarow in ds.Tables[0].Rows)
            {
                //每個資料列的內容
            }
            //int V_ID_Count = dt.Rows.Count;
            foreach (DataRow row in ds.Tables[0].Rows)
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
             }
             return value;
             */
            return value;
        }
    }

    public string getDetail_S_Name(string connectionStrings, string commandText)
    {
        string value = "";
        using (SqlConnection conn6 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            //SqlConnection connection = conn;

            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn6;
            cmd.CommandText = commandText;
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
            //conn.Open();

            SqlDataAdapter adapter = new SqlDataAdapter(commandText, conn6);
            adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
            if (cmd.Connection.State.ToString() == "Closed")
                cmd.Connection.Open();

            try
            {
                adapter.Fill(ds);//取出所有會場編號
            }
            catch (Exception ex)
            {

                throw ex;
            }
            //adapter.Fill(ds);//取出所有會場編號
            foreach (DataRow datarow in ds.Tables[0].Rows)
            {
                //每個資料列的內容
            }
            //int V_ID_Count = dt.Rows.Count;
            foreach (DataRow row in ds.Tables[0].Rows)
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
             }
             return value;
             */
            return value;
        }
    }


    public string getNEW_MC_NAME(string connectionStrings, string commandText)
    {
        string value = "";
        using (SqlConnection conn6 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            //SqlConnection connection = conn;

            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn6;
            cmd.CommandText = commandText;
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
            //conn.Open();

            SqlDataAdapter adapter = new SqlDataAdapter(commandText, conn6);
            adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
            if (cmd.Connection.State.ToString() == "Closed")
                cmd.Connection.Open();

            try
            {
                adapter.Fill(ds);//取出所有會場編號
            }
            catch (Exception ex)
            {

                throw ex;
            }
            //adapter.Fill(ds);//取出所有會場編號
            foreach (DataRow datarow in ds.Tables[0].Rows)
            {
                //每個資料列的內容
            }
            //int V_ID_Count = dt.Rows.Count;
            foreach (DataRow row in ds.Tables[0].Rows)
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
             }
             return value;
             */
            return value;
        }
    }
    public DataTable GetDataTableBYSQL(SqlConnection conn, string commandText)
    {
        string DM_Mark = "";
        string value = "";
        DataTable dt = new DataTable();
        using (SqlConnection conn2 = conn)
        {

            SqlCommand cmd = new SqlCommand(commandText, conn2);
            if (conn2.State.ToString() == "Closed")
            {
                conn2.Open();
            }

            SqlDataAdapter adapter = new SqlDataAdapter(commandText, conn2);

            //DataSet ds = new DataSet();
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);
            //foreach (DataRow row in dt.Rows)
            //{
            //    //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
            //    value = row[0].ToString();
            //}
            ////value = U_MDEP;

            //conn.Close();
            //    if (dt.Rows.Count != 0)
            //    { 
            //    string DM_MC_Name = dt.Rows[0][3].ToString();
            //    string DM_MarkTime = dt.Rows[0][5].ToString();
            //    DM_Mark = DM_MC_Name + "-" + DM_MarkTime;
            //}
        }
        return dt;
    }
    public string GetValueBYSQL(SqlConnection conn, string commandText)
    {
        string value = "";
        using (SqlConnection conn6 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            //SqlConnection connection = conn;

            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn6;
            cmd.CommandText = commandText;
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
            //conn.Open();

            SqlDataAdapter adapter = new SqlDataAdapter(commandText, conn);
            adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
            if (cmd.Connection.State.ToString() == "Closed")
                cmd.Connection.Open();

            try
            {
                adapter.Fill(ds);//取出所有會場編號
            }
            catch (Exception ex)
            {

                throw ex;
            }
            //adapter.Fill(ds);//取出所有會場編號
            foreach (DataRow datarow in ds.Tables[0].Rows)
            {
                //每個資料列的內容
            }
            //int V_ID_Count = dt.Rows.Count;
            foreach (DataRow row in ds.Tables[0].Rows)
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
             }
             return value;
             */
            return value;
        }
    }
    public DataSet GetSetBYSQL(SqlConnection conn, string commandText)
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
                         //foreach (DataRow datarow in ds.Tables[0].Rows)
                         //{
                         //    //每個資料列的內容
                         //}
                         ////int V_ID_Count = dt.Rows.Count;
                         //foreach (DataRow row in ds.Tables[0].Rows)
                         //{
                         //    //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
                         //    value = row[0].ToString();
                         //}
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
        return ds;
    }
    //[業務聯絡單]畫面資料
    public MPMCOTFDetailEntity getBusinessConnectionDetail(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        MPMCOTFDetailEntity mPMCOTFDetailEntity = new MPMCOTFDetailEntity();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            string CF_item_Name = "";
            string Obj_Name = "";
            string MP_ID_Name = "";
            string MP_ID_Name2 = "";
            string DM_MC_Name = "";
            string DM_MarkTime = "";
            string P_TypeName = "";
            string P_Type2Name = "";
            string P_Type3Name = "";
            string Add_USER_Name = "";
            string T_PType_Name = "";
            string T_PType2_Name = "";
            string T_PType3_Name = "";
            string Results_Item_Name = "";//業績種類中文名稱
            DataTable Mark = new DataTable();
            DataTable Assign = new DataTable();
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {   //20230203進度
                    mPMCOTFDetailEntity.CF_item = sr[0].ToString().Trim();//0聯絡單種類
                    mPMCOTFDetailEntity.Light_status = sr[5].ToString().Trim();//燈號
                    mPMCOTFDetailEntity.obj = sr[1].ToString().Trim();//1//件別中文名稱編號
                    mPMCOTFDetailEntity.MP_ID = sr[7].ToString().Trim();//分析師員工編號
                    //取得會員種類
                   
                    mPMCOTFDetailEntity.MP_Item = sr[35].ToString().Trim();//35
                    string GetMemberType = "select ditcode,ddesc from MITEM where mitcode = '" + mPMCOTFDetailEntity.MP_ID + "' and ditcode <> '0000' and del_tag = '0' order by rank";
                    //決定簽核明細備註顯示與否的條件
                    mPMCOTFDetailEntity.F_Status = sr[48].ToString().Trim();
                    //組成業務聯絡單取得[會員種類]語法
                    string GETmemberKindSQL = "SELECT [ddesc] FROM [HG].[dbo].[MITEM] where mitcode = '" + mPMCOTFDetailEntity.MP_ID + "' and ditcode='" + mPMCOTFDetailEntity.MP_Item + "'";
                    mPMCOTFDetailEntity.U_LeaderStatus = sr[49].ToString().Trim();
                    mPMCOTFDetailEntity.EX_Status = sr[50].ToString().Trim();
                    mPMCOTFDetailEntity.EX_LeaderStatus = sr[51].ToString().Trim();//50
                    mPMCOTFDetailEntity.U_Leader = sr[52].ToString().Trim();//50
                    mPMCOTFDetailEntity.U_LeaderName = sr[53].ToString().Trim();//51
                    mPMCOTFDetailEntity.EX_Name = sr[54].ToString().Trim();//52
                    mPMCOTFDetailEntity.EX_LeaderName = sr[55].ToString().Trim();//53
                    mPMCOTFDetailEntity.U_LeaderStatusTime = sr[56].ToString().Trim();
                    mPMCOTFDetailEntity.EX_LeaderStatusTime = sr[57].ToString().Trim();
                    mPMCOTFDetailEntity.EX_StatusTime = sr[58].ToString().Trim();
                    mPMCOTFDetailEntity.Attach_Name = sr[59].ToString().Trim();//業績分類[歸屬]
                    mPMCOTFDetailEntity.CMonth = sr[60].ToString().Trim();//業績分類[當月/次月]
                    mPMCOTFDetailEntity.D_MP = sr[61].ToString().Trim();
                    mPMCOTFDetailEntity.D_Item = sr[62].ToString().Trim();
                    mPMCOTFDetailEntity.DSdate = sr[63].ToString().Trim();//新會期(起)
                    mPMCOTFDetailEntity.DEdate = sr[64].ToString().Trim();//新回期(終)
                    mPMCOTFDetailEntity.T_Paymoney = sr[65].ToString().Trim();//原會費
                    mPMCOTFDetailEntity.B_Name = sr[67].ToString().Trim();//退費-案件編號
                    mPMCOTFDetailEntity.B_ID = sr[68].ToString().Trim();//退費-案件名稱
                    mPMCOTFDetailEntity.B_Paymoney = sr[69].ToString().Trim();//退費-案件金額
                    mPMCOTFDetailEntity.S_tag = sr[70].ToString().Trim();//暫停-恢復(s_tag)
                    mPMCOTFDetailEntity.S_id = sr[71].ToString().Trim();//暫停-恢復(案件)
                    mPMCOTFDetailEntity.S_Paymoney = sr[72].ToString().Trim();//暫停-恢復(S_paymoney)
                    mPMCOTFDetailEntity.T_StartDate= sr[73].ToString().Trim();
                    mPMCOTFDetailEntity.T_EndDate= sr[74].ToString().Trim();
                    //取得折讓案件[新轉案件]
                    string GetU_NameBYD_MPSQL = "select U_Name from Muser where U_Num = '" + mPMCOTFDetailEntity.D_MP + "' and del_tag= '0' ";
                    string GetDDESCBYD_MPSQ = "select ddesc from MITEM where mitcode = '" + mPMCOTFDetailEntity.D_MP + "' and ditcode='" + mPMCOTFDetailEntity.D_Item + "' and  del_tag = '0'";
                    mPMCOTFDetailEntity.D_Item = sr[62].ToString().Trim();
                    //取得[新轉案件]
                    mPMCOTFDetailEntity.M_ID = sr[36].ToString().Trim();//查詢是否有註記(20230320)
                    mPMCOTFDetailEntity.add_user = sr[2].ToString().Trim();//提案人會員編號
                    mPMCOTFDetailEntity.add_user_Unum = sr[2].ToString().Trim();//提案人會員編號
                    string GetCF_item_Name_SQL = "select ddesc from MITEM where mitcode='MCOTF' and ditcode='" + mPMCOTFDetailEntity.CF_item + "'";//聯絡單種類中文名稱
                    string GetObj_Name_SQL = "select ddesc from MITEM where mitcode='MTOBJ' and ditcode='" + mPMCOTFDetailEntity.obj + "'";
                    //分析師中文名稱
                    string GetMP_ID_Name_SQL = "select ddesc from MITEM where mitcode='" + mPMCOTFDetailEntity.MP_ID + "'  and ditcode <> '0000' and ditcode='" + mPMCOTFDetailEntity.MP_Item + "' and del_tag = '0' order by rank";//會員種類名稱
                    //分析師中文名稱                                                                                                                                                                                                               //分析師中文名稱                                                                                                                                                                                                      //分析師中文名稱                                                                                                                                                                                                               //取得分析師中文名稱
                    string GetMP_ID_Name2_SQL2 = "SELECT [U_Name] FROM [HG].[dbo].[MUSER] where U_Num='" + mPMCOTFDetailEntity.MP_ID + "'";
                    string GetAdd_USER_Name_SQL = "select U_Name from MUSER where U_Num = '" + mPMCOTFDetailEntity.add_user + "' and del_tag = '0'";
                    //查詢是否有派發(MRYGC)由M_ID
                    string GetAssign_SQL = "SELECT * from MRYGC where M_ID='" + mPMCOTFDetailEntity.M_ID + "'";
                    string GetAssignName_SQL = "SELECT [Assign_Name] FROM [HG].[dbo].[MRYGC] where M_id='" + mPMCOTFDetailEntity.M_ID + "'";
                    string GetAssignDate_SQL = "SELECT [Assign_Date] FROM [HG].[dbo].[MRYGC] where M_id='" + mPMCOTFDetailEntity.M_ID + "'";
                    //查詢是否有註記，且註記時間小約15天內，否則可註記
                    //取得目前日期前15天的日期Day15
                    /*
                     * select Convert(varchar(10),GetDate(),111) --取得今天年月日
                       SELECT DATEADD(DAY, -15,'2023/03/20') --取得今天年月日前15天
                     * 
                     */
                    string Day15 = DateTime.Now.AddDays(-15).ToShortDateString();//抓取15天前的日期(年月日)
                                                                                 //查詢是否有註記，且註記時間小約15天內，否則可註記
                    string GetMARK_SQL = "select * From DMBER  where M_ID ='" + mPMCOTFDetailEntity.M_ID + "' and DM_Marktime>'" + Day15 + "' and del_tag='0' and DM_Tag='1' order by DM_Marktime desc";
                    //Mark:註記
                    string GetDM_MC_Name_SQL = "select DM_MC_Name From DMBER  where M_ID ='" + mPMCOTFDetailEntity.M_ID + "' and DM_Marktime>'" + Day15 + " 00:00:00' and del_tag='0' and DM_Tag='1' order by DM_Marktime desc";
                    string GetDM_MarkTime_SQL = "select DM_MarkTime From DMBER  where M_ID ='" + mPMCOTFDetailEntity.M_ID + "' and DM_Marktime>'" + Day15 + " 00:00:00' and del_tag='0' and DM_Tag='1' order by DM_Marktime desc"; ;
                    //入帳資訊-付款方式
                    mPMCOTFDetailEntity.T_PType = sr[37].ToString().Trim();
                    string GetT_PType_Name_SQL = "select ddesc from MITEM where mitcode='PITEM'  and ditcode <> '0000' and ditcode='" + mPMCOTFDetailEntity.T_PType + "' and del_tag = '0' order by rank";//付款方式

                    mPMCOTFDetailEntity.T_PType1 = sr[38].ToString().Trim();
                    string GetT_PType2_Name_SQL = "select ddesc from MITEM where mitcode='PITEM'  and ditcode <> '0000' and ditcode='" + mPMCOTFDetailEntity.T_PType1 + "' and del_tag = '0' order by rank";//付款方式

                    mPMCOTFDetailEntity.T_PType2 = sr[39].ToString().Trim();
                    string GetT_PType3_Name_SQL = "select ddesc from MITEM where mitcode='PITEM'  and ditcode <> '0000' and ditcode='" + mPMCOTFDetailEntity.T_PType2 + "' and del_tag = '0' order by rank";//付款方式
                                                                                                                                                                                                            //string GetContractID_SQL=""

                    mPMCOTFDetailEntity.T_ID = sr[46].ToString().Trim();
                    string MemberKind = "";//會員種類
                    using (SqlConnection conn2 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
                    {
                        //string ditcode = GetValueBYSQL(conn2, GetMemberType);
                        string GetMemberType2 = "select ditcode from MITEM where ditcode = '" + mPMCOTFDetailEntity.MP_ID+ "' and ditcode <> '0000' and del_tag = '0' order by rank";
                        string ditcode=GetValueBYSQL(conn2, GetMemberType2);
                        string GetMemberType3 = "select ddesc from MITEM where ditcode = '" + mPMCOTFDetailEntity.MP_ID + "' and ditcode <> '0000' and del_tag = '0' order by rank";
                        string ddesc = GetValueBYSQL(conn2, GETmemberKindSQL);
                        //會員種類(MemberType)
                        //if(ditcode== mPMCOTFDetailEntity.MP_Item)
                       // {
                            string MemberType = ddesc;
                       // }
                        string U_Name = GetValueBYSQL(conn2, GetU_NameBYD_MPSQL);//折讓[新轉案件]
                        string DDESC = GetValueBYSQL(conn2, GetDDESCBYD_MPSQ);//折讓[新轉案件]
                        //Mark(註記表)
                        MemberKind = GetValueBYSQL(conn2, GETmemberKindSQL);//會員種類
                        mPMCOTFDetailEntity.MemberKind = MemberType;
                        Mark = GetDataTableBYSQL(conn2, GetMARK_SQL);//判斷是否有註記
                        SqlConnection conn3 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString());
                        conn3.Open();
                        Assign = GetDataTableBYSQL(conn3, GetAssign_SQL);//判斷是否有派發
                        conn3.Close();
                        int Assign_Num = Assign.Rows.Count;
                        int Mark_Num = Mark.Rows.Count;
                        if (Mark_Num == 0)
                        {
                            mPMCOTFDetailEntity.Mark = "無1";
                        }
                        else
                        {
                            //DataTable.Rows[rowindex][columnindex]
                            mPMCOTFDetailEntity.Mark = Mark.Rows[0][3] + "-" + Mark.Rows[0][5];//註記名稱
                                                                                               //20230321參考舊系統MPMCOTF_Detail.asp #554~~
                                                                                               // <%=vrs_Mitem("DM_MC_Name")%>-<%=formatdatetime(vrs_Mitem("DM_MarkTime"),2)%>
                        }
                        //派發
                        //if(conn2.State.ToString()=="Closed")
                        //{
                        //    conn2.Open();
                        //}
                        //Assign= GetDataTableBYSQL(conn2, GetAssign_SQL);//判斷是否有派發
                        //int Assign_Num = Assign.Rows.Count;
                        if (Assign_Num == 0)
                        {
                            mPMCOTFDetailEntity.Assign = "無2";
                        }
                        else
                        {
                            string AssignName = GetValueBYSQL(conn2, GetAssignName_SQL);
                            string AssignDate = GetValueBYSQL(conn2, GetAssignDate_SQL);
                            mPMCOTFDetailEntity.Assign = AssignName + "-" + AssignDate;//派發文字
                        }
                        //案件狀態

                        P_TypeName = GetValueBYSQL(conn2, GetT_PType_Name_SQL);//入帳資訊-付款方式中文名稱
                        CF_item_Name = GetValueBYSQL(conn2, GetCF_item_Name_SQL);//聯絡單種類中文名稱
                        Obj_Name = GetValueBYSQL(conn2, GetObj_Name_SQL);//件別中文名稱
                        MP_ID_Name = GetValueBYSQL(conn2, GetMP_ID_Name_SQL);//會員種類中文名稱
                        MP_ID_Name2 = GetValueBYSQL(conn2, GetMP_ID_Name2_SQL2);//取得分析師中文名稱
                        Add_USER_Name = GetValueBYSQL(conn2, GetAdd_USER_Name_SQL);//提案人姓名名稱
                        DM_MC_Name = GetValueBYSQL(conn2, GetDM_MC_Name_SQL);//註記(姓名)
                        DM_MarkTime = GetValueBYSQL(conn2, GetDM_MarkTime_SQL);//註記(時間)
                        T_PType_Name = GetValueBYSQL(conn2, GetT_PType_Name_SQL);///入帳資訊(付款方式中文名稱)
                        T_PType2_Name = GetValueBYSQL(conn2, GetT_PType2_Name_SQL);//付款方式2
                        T_PType3_Name = GetValueBYSQL(conn2, GetT_PType3_Name_SQL);//付款方式3

                        //mPMCOTFDetailEntity.ContractID = GetValueBYSQL()


                    }

                    mPMCOTFDetailEntity.T_PType_Name = T_PType_Name;//入帳資訊-付款方式中文名稱
                    mPMCOTFDetailEntity.T_PType2_Name = T_PType2_Name;//付款方式2中文名稱
                    mPMCOTFDetailEntity.T_PType3_Name = T_PType3_Name;//付款方式3中文名稱
                    mPMCOTFDetailEntity.CF_item_Name = CF_item_Name;//聯絡單種類中文名稱
                    mPMCOTFDetailEntity.Obj_Name = Obj_Name;//件別
                    mPMCOTFDetailEntity.MP_ID_Name = MP_ID_Name;//會員種類中文名稱
                    mPMCOTFDetailEntity.MP_ID_Name2 = MP_ID_Name2;//取得分析師中文名稱(劉&#23032;希[劉妍希])
                    mPMCOTFDetailEntity.DM_MC_Name = DM_MC_Name;//註記(姓名)[檢查!!!]
                    mPMCOTFDetailEntity.DM_MarkTime = DM_MarkTime;//註記(時間)[檢查!!!]
                                                                  //mPMCOTFDetailEntity.CF_item = CF_item_Name;//0聯絡單種類中文名稱
                                                                  //利用聯絡單種類(代號)取出聯絡單種類(中文名稱)
                                                                  //mPMCOTFDetailEntity.obj = sr[1].ToString().Trim();//1
                    mPMCOTFDetailEntity.add_user = Add_USER_Name;//提案人會員姓名
                    mPMCOTFDetailEntity.add_date = sr[3].ToString().Trim();//入會日期
                    mPMCOTFDetailEntity.M_Name = sr[4].ToString().Trim();//4會員姓名
                    mPMCOTFDetailEntity.Light_status = sr[5].ToString().Trim();//5
                    mPMCOTFDetailEntity.f_id = sr[6].ToString().Trim();//單號
                    mPMCOTFDetailEntity.MP_ID = sr[7].ToString().Trim();//7
                    mPMCOTFDetailEntity.T_Type = sr[8].ToString().Trim();//8
                    mPMCOTFDetailEntity.V_ID = sr[9].ToString().Trim();//9[檢查!!!]
                    mPMCOTFDetailEntity.V_Name = sr[10].ToString().Trim();//10[檢查!!!]
                    mPMCOTFDetailEntity.T_Paymoney= sr[66].ToString().Trim();//11入帳資訊(會費)
                    mPMCOTFDetailEntity.Special1_userName = sr[12].ToString().Trim();//12
                    mPMCOTFDetailEntity.T_accountmoney1 = sr[13].ToString().Trim();//13
                    mPMCOTFDetailEntity.Special2_userName = sr[14].ToString().Trim();//14
                    mPMCOTFDetailEntity.T_accountmoney2 = sr[15].ToString().Trim();//15
                    mPMCOTFDetailEntity.Special3_userName = sr[16].ToString().Trim();//16
                    mPMCOTFDetailEntity.T_accountmoney3 = sr[17].ToString().Trim();//17
                    mPMCOTFDetailEntity.Results_Item = sr[18].ToString().Trim();//18
                    mPMCOTFDetailEntity.begindate_Date = sr[19].ToString().Trim();//19入會時間
                    mPMCOTFDetailEntity.enddate_Date = sr[20].ToString().Trim();//20到期時間
                    mPMCOTFDetailEntity.ca_id = sr[21].ToString().Trim();//21電子委任編號
                    DateTime Today = DateTime.Now;//目前日期
                    TimeSpan AllDay = new TimeSpan();
                    string UseDay_Day = "";
                    string AllDay_Day = "";
                    //string AllDay = "";
                    int AllDay_int = 0;
                    int UseDay_Day_int = 0;
                    //計算折讓金額
                    if (!String.IsNullOrEmpty(mPMCOTFDetailEntity.T_StartDate))
                    {
                        DateTime T_StartDate = DateTime.Parse(mPMCOTFDetailEntity.T_StartDate);//入會日期
                        DateTime T_EndDate = DateTime.Parse(mPMCOTFDetailEntity.T_EndDate);//到期日期
                        TimeSpan UseDay = Today - T_StartDate;//使用天數
                        AllDay = T_StartDate - T_EndDate;
                        //UseDay_Day = UseDay.Days;//使用天數
                        UseDay_Day_int = int.Parse(UseDay.Days.ToString());//使用天數
                       // AllDay = beginDate- T_StartDate;//會期總天數
                        AllDay_Day = AllDay.TotalDays.ToString();//會期總天數
                        AllDay_int = int.Parse(AllDay_Day);//會期總天數
                    }
                    //DateTime endDate = DateTime.Parse(mPMCOTFDetailEntity.enddate_Date);//到期日期
                    //DateTime Today = DateTime.Now;//目前日期
                    //TimeSpan UseDay = Today - beginDate;//使用天數
                    //string UseDay_Day = UseDay.TotalDays.ToString();//使用天數
                    //int UseDay_Day_int = int.Parse(UseDay_Day);
                    //TimeSpan AllDay = endDate - beginDate;
                    AllDay_Day = AllDay.TotalDays.ToString();//使用天數
                    AllDay_int = int.Parse(AllDay_Day);
                    double Percent30_double = 0;
                    int Paymoney_int = 0;
                    if (!string.IsNullOrEmpty(mPMCOTFDetailEntity.T_Paymoney))
                    {
                        Percent30_double = int.Parse(mPMCOTFDetailEntity.T_Paymoney) * 0.3;
                        string Percent30 = (int.Parse(mPMCOTFDetailEntity.T_Paymoney)).ToString();
                        Paymoney_int = int.Parse(mPMCOTFDetailEntity.T_Paymoney);
                    }
                    //string Percent30 = (int.Parse(mPMCOTFDetailEntity.Paymoney)).ToString();
                    //int Paymoney_int = int.Parse(mPMCOTFDetailEntity.Paymoney);
                    if (UseDay_Day_int > 7)
                    {
                        //大於7天依比例收費
                        //double New_Paymoney = Paymoney_int - ((((Percent30_double - int.Parse(mPMCOTFDetailEntity.Paymoney))) * UseDay_Day_int / AllDay_int)+ Percent30_double);
                    }
                    else
                    {
                        //小於7天全額退費,不收費
                        double temp = Paymoney_int;

                    }
                    //'計算折讓金額===========================================================================
                    //string Day = UseDay.Days.ToString();//將時間差轉為天數(今天減去入會時間的天數)=>使用天數
                    using (SqlConnection conn3 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
                    {
                        string GetPaySerialBYCaIDSQL = "SELECT [Pay_Serial] FROM [HG].[dbo].[MCASH] where M_id='" + mPMCOTFDetailEntity.M_ID + "'";
                        // P_TypeName = GetValueBYSQL(conn2, GetT_PType_Name_SQL);//入帳資訊-付款方式中文名稱
                        mPMCOTFDetailEntity.pay_serial = GetValueBYSQL(conn3, GetPaySerialBYCaIDSQL);
                        string GetP_NameBYCaIDSQL = "SELECT [P_Name] FROM [HG].[dbo].[MCASH] where M_id='" + mPMCOTFDetailEntity.M_ID + "'";
                        mPMCOTFDetailEntity.p_name = GetValueBYSQL(conn3, GetP_NameBYCaIDSQL);
                        string GetPriceBYCaIDSQL = "SELECT [Price] FROM [HG].[dbo].[MCASH] where M_id='" + mPMCOTFDetailEntity.M_ID + "'";
                        mPMCOTFDetailEntity.price = GetValueBYSQL(conn3, GetPriceBYCaIDSQL);
                    }
                    mPMCOTFDetailEntity.cellphone = sr[22].ToString().Trim();//22設定手機
                                                                             //////////////////////////////////////////////
                    mPMCOTFDetailEntity.Fax = sr[23].ToString().Trim();//23傳真搞
                    mPMCOTFDetailEntity.Fax = GetNameByCODE("Fax", mPMCOTFDetailEntity.Fax);
                    mPMCOTFDetailEntity.Mess = sr[24].ToString().Trim();//24設訊
                    mPMCOTFDetailEntity.Mess = GetNameByCODE("Mess", mPMCOTFDetailEntity.Mess);
                    mPMCOTFDetailEntity.Media = sr[25].ToString().Trim();
                    mPMCOTFDetailEntity.Media = GetNameByCODE("Media", mPMCOTFDetailEntity.Media);
                    mPMCOTFDetailEntity.Text = sr[26].ToString().Trim();
                    mPMCOTFDetailEntity.Text = GetNameByCODE("P_Text", mPMCOTFDetailEntity.P_Text);
                    mPMCOTFDetailEntity.P_video = sr[27].ToString().Trim();
                    mPMCOTFDetailEntity.P_video = GetNameByCODE("P_video", mPMCOTFDetailEntity.P_video);
                    mPMCOTFDetailEntity.atm = sr[28].ToString().Trim();//27後4碼
                    mPMCOTFDetailEntity.CCard_4Num = sr[29].ToString().Trim();//28信用卡末四碼
                    mPMCOTFDetailEntity.INV_open_ITEM = sr[30].ToString().Trim();//29發票開立方式
                    mPMCOTFDetailEntity.INV_open_ITEM = GetNameByCODE("INV_open_ITEM", mPMCOTFDetailEntity.INV_open_ITEM);
                    mPMCOTFDetailEntity.INV_ITEM = sr[31].ToString().Trim(); //30發票種類
                    mPMCOTFDetailEntity.INV_ITEM = GetNameByCODE("INV_ITEM", mPMCOTFDetailEntity.INV_ITEM);
                    mPMCOTFDetailEntity.COMNAME = sr[32].ToString().Trim();//31
                    mPMCOTFDetailEntity.INV_ITEM_UnifyNum = sr[33].ToString().Trim();
                    mPMCOTFDetailEntity.T_Ivo = sr[34].ToString().Trim();//34
                    mPMCOTFDetailEntity.T_Ivo = GetNameByCODE("T_Ivo", mPMCOTFDetailEntity.T_Ivo);
                    mPMCOTFDetailEntity.MP_Item = sr[35].ToString().Trim();//35
                    //mPMCOTFDetailEntity.F_Status = sr[47].ToString().Trim();//35
                    //mPMCOTFDetailEntity.F_Status = sr[47].ToString().Trim();//35
                    //mPMCOTFDetailEntity.F_Status = sr[47].ToString().Trim();//35
                    //mPMCOTFDetailEntity.F_Status = sr[47].ToString().Trim();//35
                    mPMCOTFDetailEntity.Result_Item = sr[41].ToString().Trim();
                    mPMCOTFDetailEntity.c_tag = sr[42].ToString().Trim();
                    mPMCOTFDetailEntity.ca_id = sr[43].ToString().Trim().Trim();
                    mPMCOTFDetailEntity.PS = sr[44].ToString().Trim();//備註
                    //mPMCOTFDetailEntity.T_Type = sr[45].ToString().Trim();
                    //if (mPMCOTFDetailEntity.Result_Item.Trim()=="0001")
                    //{
                    //    mPMCOTFDetailEntity.Result_Item = "一般件";
                    //}
                    //else if (mPMCOTFDetailEntity.Result_Item.Trim() == "0002")
                    //{
                    //    mPMCOTFDetailEntity.Result_Item = "獎勵件";
                    //}



                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'mPMCOTFDetailEntity' : " + mPMCOTFDetailEntity.ToString(), className, methodName);
        return mPMCOTFDetailEntity;
    }
    //業績分類-備註
    public string getPS(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        //MPMCOTFDataEditRecordEntity mPMCOTFDataEditRecordEntity = new MPMCOTFDataEditRecordEntity();
        List<MPMCOTFDataEditRecordEntity> mdeList = new List<MPMCOTFDataEditRecordEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        string AttachName = "";
        string PS = "";//備註
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            DataTable dt = new DataTable();
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                dt.Load(sr);
                //while (sr.Read())
                //{
                if (dt.Rows.Count > 0)
                {
                    var data = dt.Rows[0];
                    PS = data[0].ToString();//備註
                 }

            }
        }
        log.endWrite("'PS' : " + PS.ToString(), className, methodName);
        return PS;
    }
    //業績分類-其他
    public string getOther(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        //MPMCOTFDataEditRecordEntity mPMCOTFDataEditRecordEntity = new MPMCOTFDataEditRecordEntity();
        List<MPMCOTFDataEditRecordEntity> mdeList = new List<MPMCOTFDataEditRecordEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        string AttachName = "";
        string Cmonth_text = "";
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            //string Cmonth_text = "";
            DataTable dt = new DataTable();
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                dt.Load(sr);
                //while (sr.Read())
                //{
                if (dt.Rows.Count > 0)
                {
                    var data = dt.Rows[0];
                    var Cmonth = data[0].ToString();//FAX判斷欄位
                                                    //var fax = sr[0].ToString().Trim();//23傳真搞
                                                    //var fax1 = sr[0];//23傳真搞
                                                    //var fax2 = sr[1];//23傳真搞
                                                    //var fax3 = sr[2];//23傳真搞
                                                    //if (fax.Length > 0)
                                                    //{
                    if (Cmonth == "1")
                    {
                        Cmonth_text = "當月";
                    }
                    else if (Cmonth == "2")
                    {
                        Cmonth_text = "次月";
                    }
                    //var fax_Combo = AttachName.Split(',');
                    //foreach (var item in fax_Combo)
                    //{
                    //    if (item == "1")
                    //    {
                    //        Cmonth_text += "設(自取)";
                    //    }
                    //    else if (item == "2")
                    //    {
                    //        Cmonth_text += "設(網路傳真)";
                    //    }
                    //    else if (item == "3")
                    //    {
                    //        Cmonth_text += "不設";
                    //    }
                    //    else if (item == "4")
                    //    {
                    //        Cmonth_text += "設解盤";
                    //    }
                    //    else if (item == "5")
                    //    {
                    //        Cmonth_text += "設特別";
                    //    }
                    //}
                    //}
                }

            }
        }
        log.endWrite("'Cmonth_text' : " + Cmonth_text.ToString(), className, methodName);
        return Cmonth_text;
    }
    //業績分類-月份
    public string getCmonth(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        //MPMCOTFDataEditRecordEntity mPMCOTFDataEditRecordEntity = new MPMCOTFDataEditRecordEntity();
        List<MPMCOTFDataEditRecordEntity> mdeList = new List<MPMCOTFDataEditRecordEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        string AttachName = "";
        string Cmonth_text = "";
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            //string Cmonth_text = "";
            DataTable dt = new DataTable();
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                dt.Load(sr);
                //while (sr.Read())
                //{
                if (dt.Rows.Count > 0)
                {
                    var data = dt.Rows[0];
                    var Cmonth = data[0].ToString();//FAX判斷欄位
                                                        //var fax = sr[0].ToString().Trim();//23傳真搞
                                                        //var fax1 = sr[0];//23傳真搞
                                                        //var fax2 = sr[1];//23傳真搞
                                                        //var fax3 = sr[2];//23傳真搞
                                                        //if (fax.Length > 0)
                                                        //{
                    if(Cmonth=="1")
                    {
                        Cmonth_text = "當月";
                    }
                    else if(Cmonth=="2")
                    {
                        Cmonth_text = "次月";
                    }
                    //var fax_Combo = AttachName.Split(',');
                    //foreach (var item in fax_Combo)
                    //{
                    //    if (item == "1")
                    //    {
                    //        Cmonth_text += "設(自取)";
                    //    }
                    //    else if (item == "2")
                    //    {
                    //        Cmonth_text += "設(網路傳真)";
                    //    }
                    //    else if (item == "3")
                    //    {
                    //        Cmonth_text += "不設";
                    //    }
                    //    else if (item == "4")
                    //    {
                    //        Cmonth_text += "設解盤";
                    //    }
                    //    else if (item == "5")
                    //    {
                    //        Cmonth_text += "設特別";
                    //    }
                    //}
                    //}
                }
               
            }
        }
        log.endWrite("'Cmonth_text' : " + Cmonth_text.ToString(), className, methodName);
        return Cmonth_text;
    }
    //業績分類-歸屬
    public string getAttachName(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        //MPMCOTFDataEditRecordEntity mPMCOTFDataEditRecordEntity = new MPMCOTFDataEditRecordEntity();
        List<MPMCOTFDataEditRecordEntity> mdeList = new List<MPMCOTFDataEditRecordEntity>();
        //string commandText = "SELECT AttachName FROM [HG].[dbo].[MCOTF] where f_id='" + f_ID + "'";
        //從資料庫把資料撈出來*************************************************************************************************start
        string AttachName = "";
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            string SaleDetail_text = "";
            DataTable dt = new DataTable();
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                dt.Load(sr);
                //while (sr.Read())
                //{
                if (dt.Rows.Count > 0)
                {
                    var data = dt.Rows[0];
                    AttachName = data[0].ToString();//AttachName(業績分類-歸屬)
                                                        //var fax = sr[0].ToString().Trim();//23傳真搞
                                                        //var fax1 = sr[0];//23傳真搞
                                                        //var fax2 = sr[1];//23傳真搞
                                                        //var fax3 = sr[2];//23傳真搞
                                                        //if (fax.Length > 0)
                                                        //{
                    var fax_Combo = AttachName.Split(',');
                    foreach (var item in fax_Combo)
                    {
                        if (item == "1")
                        {
                            AttachName += "設(自取)";
                        }
                        else if (item == "2")
                        {
                            AttachName += "設(網路傳真)";
                        }
                        else if (item == "3")
                        {
                            AttachName += "不設";
                        }
                        else if (item == "4")
                        {
                            AttachName += "設解盤";
                        }
                        else if (item == "5")
                        {
                            AttachName += "設特別";
                        }
                    }
                    //}
                }
                //20230707進度
                //var fax1 = sr[1].ToString().Trim();//23傳真搞
                //加入傳真文字判斷


                //}
            }
        }
        log.endWrite("'AttachName' : " + AttachName.ToString(), className, methodName);
        return AttachName;
    }
    public string getFAX(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        //MPMCOTFDataEditRecordEntity mPMCOTFDataEditRecordEntity = new MPMCOTFDataEditRecordEntity();
        List<MPMCOTFDataEditRecordEntity> mdeList = new List<MPMCOTFDataEditRecordEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        string FAX = "";
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            string fax_text = "";
            DataTable dt = new DataTable();
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                dt.Load(sr);
                //while (sr.Read())
                //{
                if (dt.Rows.Count > 0)
                {
                    var data = dt.Rows[0];
                    var fax = data[0].ToString();//FAX判斷欄位
                                                 //var fax = sr[0].ToString().Trim();//23傳真搞
                                                 //var fax1 = sr[0];//23傳真搞
                                                 //var fax2 = sr[1];//23傳真搞
                                                 //var fax3 = sr[2];//23傳真搞
                                                 //if (fax.Length > 0)
                                                 //{
                    var fax_Combo = fax.Split(',');
                    foreach (var item in fax_Combo)
                    {
                        if (item == "1")
                        {
                            fax_text += "設(自取)";
                        }
                        else if (item == "2")
                        {
                            fax_text += "設(網路傳真)";
                        }
                        else if (item == "3")
                        {
                            fax_text += "不設";
                        }
                        else if (item == "4")
                        {
                            fax_text += "設解盤";
                        }
                        else if (item == "5")
                        {
                            fax_text += "設特別";
                        }
                    }
                    //}
                }
                //20230707進度
                //var fax1 = sr[1].ToString().Trim();//23傳真搞
                //加入傳真文字判斷


                //}
            }
        }
        log.endWrite("'FAX' : " + FAX.ToString(), className, methodName);
        return FAX;
    }
    public static string GetNameByCODE(string type, string code)
    {
        string Value = "";
        if (type == "Fax")
        {
            if (code == "1")
            { Value = "設(自取)"; }
            else if (code == "2")
            { Value = "設(網路傳真)"; }
            else if (code == "3")
            { Value = "不設"; }
            else if (code == "4")
            { Value = "設解盤"; }
            else if (code == "5")
            { Value = "設特別"; }
            else if (code == "6")
            { Value = "設飆股"; }
        }
        else if (type == "Mess")
        {
            if (code == "1")
            { Value = "設"; }
            else if (code == "2")
            { Value = "不設"; }
            else if (code == "3")
            { Value = "業務自帶"; }
            else if (code == "4")
            { Value = "特助或行政帶"; }
            else if (code == "5")
            { Value = "設解盤"; }
            else if (code == "6")
            { Value = "設特別"; }
            else if (code == "7")
            { Value = "設飆股"; }
        }
        else if (type == "Media")
        {
            if (code == "1")
            { Value = "設"; }
            else if (code == "2")
            { Value = "不設"; }
            else
            { Value = "不設"; }
        }
        else if (type == "P_Text")
        {
            if (code == "1")
            { Value = "設"; }
            else if (code == "2")
            { Value = "不設"; }
            else
            { Value = "不設"; }
        }
        else if (type == "P_video")
        {
            if (code == "1")
            { Value = "設"; }
            else if (code == "2")
            { Value = "不設"; }
            else
            { Value = "不設"; }
        }
        else if (type == "INV_open_ITEM")
        {
            if (code == "1")
            { Value = "系統"; }
            else if (code == "2")
            { Value = "手開"; }
        }
        else if (type == "INV_ITEM")
        {
            if (code == "1")
            { Value = "二聯"; }
            else if (code == "2")
            { Value = "三聯"; }
        }
        else if (type == "T_Ivo")
        {
            if (code == "1")
            { Value = "正常"; }
            else if (code == "2")
            { Value = "空白信封"; }
            else if (code == "3")
            { Value = "發票轉交業務"; }
            else if (code == "4")
            { Value = "不寄"; }
            else if (code == "5")
            { Value = "捐贈"; }
        }
        return Value;
    }


    //取得案件修改明細
    public List<MPMCOTFDataEditRecordEntity> getBusinessConnectionDataEditRecord(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        //MPMCOTFDataEditRecordEntity mPMCOTFDataEditRecordEntity = new MPMCOTFDataEditRecordEntity();
        List<MPMCOTFDataEditRecordEntity> mdeList = new List<MPMCOTFDataEditRecordEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;


            //string M_ID = "";
            //string edit_user = "";
            //string M_Row = "";
            //string M_text = "";
            //string edit_date = "";
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {   //20230203進度
                    MPMCOTFDataEditRecordEntity mPMCOTFDataEditRecordEntity = new MPMCOTFDataEditRecordEntity();
                    mPMCOTFDataEditRecordEntity.M_ID = sr[0].ToString().Trim();//0聯絡單種類
                    mPMCOTFDataEditRecordEntity.edit_user = sr[1].ToString().Trim();//1修改人員工編號
                    string GetNameByNum = "SELECT [U_Name] FROM [HG].[dbo].[MUSER] where U_Num='" + mPMCOTFDataEditRecordEntity.edit_user + "'";
                    using (SqlConnection conn2 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
                    {
                        mPMCOTFDataEditRecordEntity.edit_user = GetValueBYSQL(conn2, GetNameByNum);
                    }
                    mPMCOTFDataEditRecordEntity.M_Row = sr[2].ToString().Trim();//7
                    mPMCOTFDataEditRecordEntity.M_text = sr[3].ToString().Trim();//35
                    mPMCOTFDataEditRecordEntity.edit_date = sr[4].ToString().Trim();//35
                                                                                    //                                                       //mPMCOTFDetailEntity.M_ID = sr[36].ToString().Trim();//35
                    mdeList.Add(mPMCOTFDataEditRecordEntity);


                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'mdeList' : " + mdeList.ToString(), className, methodName);
        return mdeList;
    }
}
