using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;
using System.Data;

/// <summary>
/// MITEMhgSql 的摘要描述
/// </summary>
public class MITEMhgSql
{

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MITEMhgSql _instanct = new MITEMhgSql();
    public static MITEMhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MITEMhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    
    //取得投資金額列表
    public List<InvestMoney> getInvestMoneyList(string connectionStrings, string commandText)
    {

        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        List<InvestMoney> gimList = new List<InvestMoney>();
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
                    InvestMoney dde = new InvestMoney();
                    dde.ditcode = sr[0].ToString().Trim();
                    dde.ddesc = sr[1].ToString().Trim();
                    gimList.Add(dde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(gimList.ToString(), className, methodName);
        return gimList;
    }

    public List<ditcodedescEntity> getditcodedescEntityList_GenNO(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        int i = 0;
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                //SELECT PostalCode,County  FROM [HG].[dbo].[ZipCode]
                while (sr.Read())
                {

                    ditcodedescEntity dde = new ditcodedescEntity();
                    dde.mitcode = "";
                    dde.ditcode = sr[0].ToString().Trim();//PostalCode
                    dde.ddesc = sr[1].ToString().Trim();//County
                    dde.MP = "";
                    ddeList.Add(dde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(ddeList.ToString(), className, methodName);
        return ddeList;
    }

    public List<ditcodedescEntity> getditcodedescEntityList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        int i = 0;
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                //SELECT PostalCode,County  FROM [HG].[dbo].[ZipCode]
                while (sr.Read())
                {

                    ditcodedescEntity dde = new ditcodedescEntity();
                    dde.mitcode = "";
                    dde.ditcode = sr[0].ToString().Trim();//PostalCode
                    dde.ddesc = sr[1].ToString().Trim();//County
                    dde.MP = "";
                    ddeList.Add(dde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(ddeList.ToString(), className, methodName);
        return ddeList;
    }

    public List<ditcodedescEntity> geSelectCountyList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            int i = 0;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    i++;
                    ditcodedescEntity dde = new ditcodedescEntity();
                    dde.mitcode = "";
                    dde.ditcode = sr[0].ToString().Trim();//PostalCode
                    dde.ddesc = sr[1].ToString().Trim();//County
                    dde.MP = "";
                    ddeList.Add(dde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(ddeList.ToString(), className, methodName);
        return ddeList;
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
    public List<CustomUSERSETimeEntity> getCustomUSERSETimeDataList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<CustomUSERSETimeEntity> RETimeList = new List<CustomUSERSETimeEntity>();
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
                    CustomUSERSETimeEntity RETime = new CustomUSERSETimeEntity();
                    RETime.mitcode = sr[0].ToString().Trim();//員工編號
                    RETime.ditcode = sr[0].ToString().Trim();//員工編號
                    RETime.U_Name= sr[1].ToString().Trim();//員工編號
                    RETime.ddesc= sr[3].ToString().Trim();//員工編號
                    //由員工編號取得員工姓名
                    //string getNameNyUMUM = "SELECT  [U_Name] FROM [HG].[dbo].[MUSER] Where U_Num='"+ RETime.mitcode + "'";
                    //RETime.ddesc2=GetValueBYSQL(conn, getNameNyUMUM);
                    try
                    {
                        var value = sr[2].ToString();
                        //RETime.ddesc = sr[2].ToString().Split('_')[1];//時間
                    }
                    catch (Exception ex)
                    {

                        throw ex;
                    }
                    //RETime.ddesc = sr[2].ToString().Split('_')[1];//時間
                    var Status = RETime.ddesc.Split('_')[0];
                    if(Status=="S")
                    {
                        RETime.status = "上班";
                        RETime.StartTime = sr[3].ToString().Split('_')[1];//時間
                    }
                    else
                    {
                        RETime.status = "下班";
                        RETime.EndTime = sr[3].ToString().Split('_')[1];//時間
                    }
                    //RETime.status = sr[2].ToString().Split('_')[0];//上/下班

                    RETimeList.Add(RETime);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(RETimeList.ToString(), className, methodName);
        return RETimeList;
    }


    public  List<Z_ItemEntity> getZitemListFucList(string ComID,string U_Num)
    {
        List<Z_ItemEntity> Z_ItemEntityList = new List<Z_ItemEntity>();
        Z_ItemEntity _Z_ItemEntity = new Z_ItemEntity();
        if (U_Num == "B9601151")
        {
            //Z_ItemEntity _Z_ItemEntity = new Z_ItemEntity();
            _Z_ItemEntity.Value = "Z0000002";
            _Z_ItemEntity.Text = "營1資源A(黃)";
            Z_ItemEntityList.Add(_Z_ItemEntity);
            _Z_ItemEntity.Value = "Z0000003";
            _Z_ItemEntity.Text = "營1資源B(紅)";
            Z_ItemEntityList.Add(_Z_ItemEntity);
            _Z_ItemEntity.Value = "Z0010001";
            _Z_ItemEntity.Text = "營2資源A(黃)";
            Z_ItemEntityList.Add(_Z_ItemEntity);
            _Z_ItemEntity.Value = "Z0010002";
            _Z_ItemEntity.Text = "營2資源A(紅)";
            Z_ItemEntityList.Add(_Z_ItemEntity);
            _Z_ItemEntity.Value = "Z0000010";
            _Z_ItemEntity.Text = "推廣資源A(黃)";
            Z_ItemEntityList.Add(_Z_ItemEntity);
            _Z_ItemEntity.Value = "Z0000011";
            _Z_ItemEntity.Text = "推廣資源B(紅)";
            Z_ItemEntityList.Add(_Z_ItemEntity);
            _Z_ItemEntity.Value = "Z0300001";
            _Z_ItemEntity.Text = "資源A(黃)";
            Z_ItemEntityList.Add(_Z_ItemEntity);
            _Z_ItemEntity.Value = "Z0300002";
            _Z_ItemEntity.Text = "資源B(紅)";
            Z_ItemEntityList.Add(_Z_ItemEntity);
            _Z_ItemEntity.Value = "Z7000001";
            _Z_ItemEntity.Text = "財1資源A(黃)";
            Z_ItemEntityList.Add(_Z_ItemEntity);
            _Z_ItemEntity.Value = "Z7000002";
            _Z_ItemEntity.Text = "財1資源B(紅)";
            Z_ItemEntityList.Add(_Z_ItemEntity);
        }
        else if(ComID=="HG01")
        {
            _Z_ItemEntity.Value = "Z0000002";
            _Z_ItemEntity.Text = "營1資源A(黃)";
            Z_ItemEntityList.Add(_Z_ItemEntity);
            _Z_ItemEntity.Value = "Z0000003";
            _Z_ItemEntity.Text = "營1資源B(紅)";
            Z_ItemEntityList.Add(_Z_ItemEntity);
        }
        else if (ComID == "HG05")
        {
            _Z_ItemEntity.Value = "Z0010001";
            _Z_ItemEntity.Text = "營2資源A(黃)";
            Z_ItemEntityList.Add(_Z_ItemEntity);
            _Z_ItemEntity.Value = "Z0010002";
            _Z_ItemEntity.Text = "營2資源A(紅)";
            Z_ItemEntityList.Add(_Z_ItemEntity);
        }
        else if (ComID == "HG02")
        {
            _Z_ItemEntity.Value = "Z0000010";
            _Z_ItemEntity.Text = "推廣資源A(黃)";
            Z_ItemEntityList.Add(_Z_ItemEntity);
            _Z_ItemEntity.Value = "Z0000011";
            _Z_ItemEntity.Text = "推廣資源B(紅)";
            Z_ItemEntityList.Add(_Z_ItemEntity);
        }
        else if (ComID == "HG03")
        {
            _Z_ItemEntity.Value = "Z0300001";
            _Z_ItemEntity.Text = "財1資源A(黃)";
            Z_ItemEntityList.Add(_Z_ItemEntity);
            _Z_ItemEntity.Value = "Z0300002";
            _Z_ItemEntity.Text = "財1資源B(紅)";
            Z_ItemEntityList.Add(_Z_ItemEntity);
        }
        else if (ComID == "HG07")
        {
            _Z_ItemEntity.Value = "Z7000001";
            _Z_ItemEntity.Text = "財2資源A(黃)";
            Z_ItemEntityList.Add(_Z_ItemEntity);
            _Z_ItemEntity.Value = "Z7000002";
            _Z_ItemEntity.Text = "財2資源B(紅)";
            Z_ItemEntityList.Add(_Z_ItemEntity);
        }
        return Z_ItemEntityList;
    }
    //取得交易狀態(20220706)
    public List<TradingStatus> getTradingStatusListFucList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
       //StringBuilder sb = new StringBuilder();
       // sb.Append(string.Format(paramFormat, connectionStrings, commandText));
       // log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<TradingStatus> tradingStatusList = new List<TradingStatus>();
        //從資料庫把資料撈出來*************************************************************************************************start
        //using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        //{
        //    conn.Open();
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.Connection = conn;
        //    cmd.CommandText = commandText;
        //    using (SqlDataReader sr = cmd.ExecuteReader())
        //    {
        //        while (sr.Read())
        //        {
        //            indexBDdataEntity TradingStatus = new indexBDdataEntity();
        //            TradingStatus = sr[0].ToString().Trim();
        //            TradingStatus.empName = sr[1].ToString().Trim();
        //            emp.U_EName = sr[2].ToString().Trim();
        //            emp.ComID = sr[3].ToString().Trim();
        //            eList.Add(emp);
        //        }
        //    }
        //}
        //不限
        //indexBDdataEntity TradingStatus = new indexBDdataEntity();
        //TradingStatus tradingStatus1 = new TradingStatus();
        //tradingStatus1.Value = "";
        //tradingStatus1.Status = "不限";
        //tradingStatusList.Add(tradingStatus1);
        TradingStatus tradingStatus2 = new TradingStatus();
        tradingStatus2.Value = "Y";
        tradingStatus2.Status = "有交易";
        tradingStatusList.Add(tradingStatus2);
        TradingStatus tradingStatus3 = new TradingStatus();
        tradingStatus3.Value = "N";
        tradingStatus3.Status = "無交易";
        tradingStatusList.Add(tradingStatus3);

        //無交易
        //有交易
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(tradingStatusList.ToString(), className, methodName);
        return tradingStatusList;
    }
    public List<ditcodedescEntity> getDepList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            ditcodedescEntity dde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    dde = new ditcodedescEntity();
                    dde.mitcode = "";
                    dde.ditcode = sr[0].ToString().Trim();//PostalCode
                    dde.ddesc = sr[1].ToString().Trim();//County
                    dde.MP = "";
                    ddeList.Add(dde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(ddeList.ToString(), className, methodName);
        return ddeList;//ditcodedescEntity
    }

    //getBankList
    public List<ditcodedescEntity> getBankList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<ditcodedescEntity> ddeList = new List<ditcodedescEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            ditcodedescEntity dde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    dde = new ditcodedescEntity();
                    dde.mitcode = "";
                    dde.ditcode = sr[0].ToString().Trim();//Ba_id
                    dde.ddesc = sr[1].ToString().Trim();//Ba_name
                    dde.MP = "";
                    ddeList.Add(dde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(ddeList.ToString(), className, methodName);
        return ddeList;//ditcodedescEntity
    }
    public string getU_Name(string connectionStrings, string commandText)
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
                    backString = sr[0].ToString();

                }
            }
        }

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    public string getU_MDEP(string connectionStrings, string commandText)
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
                    backString = sr[0].ToString();

                }
            }
        }

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }
}