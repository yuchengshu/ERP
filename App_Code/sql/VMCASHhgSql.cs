using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;
using System.Data;
using System.Reflection;

/// <summary>
/// VMCASHhgSql 的摘要描述
/// </summary>
public class VMCASHhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static VMCASHhgSql _instanct = new VMCASHhgSql();
    public static VMCASHhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public VMCASHhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<T> DataTableToList<T>(DataTable dt) where T : new()
    {
        //定义集合
        List<T> ts = new List<T>();
        //定义一个临时变量
        string tempName = string.Empty;
        //遍历dataTable中的数据行
        foreach (DataRow dr in dt.Rows)
        {
            T t = new T();
            //获得此模型的公共属性
            PropertyInfo[] propertys = t.GetType().GetProperties();
            //遍历该对象的所有属性
            foreach (PropertyInfo pi in propertys)
            {
                tempName = pi.Name;//将属性名称赋值给临时变量
                                   //检查datatable是否包含此列(列名==对象的属性名)
                if (dt.Columns.Contains(tempName))
                {
                    //取值

                    object value = dr[tempName];
                    //如果非空，则赋给对象的属性
                    if (value != DBNull.Value)
                    {
                        //这里添加判断的原因:比如double转folat不能隐式转换,而枚举类型又不能使用Convert.ChangeType
                        if (pi.PropertyType.IsEnum)
                        {
                            pi.SetValue(t, value, null);
                        }
                        else
                        {
                            //ChangeType属于强转可能存在数据丢失,但是pi.PropertyType是对应你类成员的类型
                            pi.SetValue(t, Convert.ChangeType(value, pi.PropertyType), null);
                        }

                    }
                }
            }
            //对象添加到泛型集合中
            ts.Add(t);
        }
        return ts;

    }
    private static List<T> ConvertDataTable<T>(DataTable dt)
    {
        List<T> data = new List<T>();
        foreach (DataRow row in dt.Rows)
        {
            T item = GetItem<T>(row);
            data.Add(item);
        }
        return data;
    }

    private static T GetItem<T>(DataRow dr)
    {
        Type temp = typeof(T);
        T obj = Activator.CreateInstance<T>();

        foreach (DataColumn column in dr.Table.Columns)
        {
            foreach (PropertyInfo pro in temp.GetProperties())
            {
                if (pro.Name == column.ColumnName)
                    pro.SetValue(obj, dr[column.ColumnName], null);
                else
                    continue;
            }
        }
        return obj;
    }


    public List<VMCASHDataEntity> getVMCASHData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<VMCASHDataEntity> vmcashDataList = new List<VMCASHDataEntity>();
        DataTable dt = new DataTable();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            VMCASHDataEntity vmcashData = null;
            string sql = "";

            // SqlDataAdapter adapter = new SqlDataAdapter();
            SqlDataAdapter adapter = new SqlDataAdapter(commandText, conn);
            adapter.Fill(dt);

            //加入所需要欄位

            dt.Columns.Add("PayStatus_Txt", typeof(string)); //付款狀態
            dt.Columns.Add("Done_Tag_Txt", typeof(string)); //簽署狀態
            int rows_count = 0;
            foreach (DataRow dr in dt.Rows)
            {
                string pay_tag = dt.Rows[rows_count][10].ToString();
                string o_id = dt.Rows[rows_count][13].ToString();
                string PayStatus = dt.Rows[rows_count][11].ToString();
                string Done_tag = dt.Rows[rows_count][12].ToString();
                dt.Rows[rows_count]["PayStatus_Txt"] = GetPayStatus_TxtByValue(pay_tag, o_id, PayStatus);
                dt.Rows[rows_count]["Done_Tag_Txt"] = Done_tag;//GetDone_Tag_TxtByValue(Done_tag);
                rows_count++;
            }
            //string pay_tag = dt.Rows[1][10].ToString();
            //string o_id = dt.Rows[1][13].ToString();
            //string PayStatus = dt.Rows[1][11].ToString();
            //string Done_tag = dt.Rows[1][12].ToString();
            //dt.Rows[0]["PayStatus_Txt"] = GetPayStatus_TxtByValue(pay_tag, o_id, PayStatus);
            //dt.Rows[0]["Done_Tag_Txt"] = GetDone_Tag_TxtByValue(Done_tag);

            //加入判斷式
            vmcashDataList = DataTableToList<VMCASHDataEntity>(dt);


            int i = 0;
            //foreach (var item in vmcashDataList)
            //{
            //    //vmcashData.M_id = item[6].ToString().Trim()
            //    if (item.M_id.Trim() != "")
            //    {
            //        string cmd_M_id = "select Name from iddata where M_id='" + item.M_id + "'";
            //        item.Member_Name = GetValueBYSQLwithConnNotClose(conn, cmd_M_id);
            //        vmcashDataList[i].Member_Name = item.Member_Name;//0714修改語法=>用join連接出得Member_Name
            //    }
            //    else
            //    {
            //        item.Member_Name = "";
            //    }
            //    i++;
            //}
            //using (SqlDataReader sr = cmd.ExecuteReader())
            //{

            //    while (sr.Read())
            //    {

            //        vmcashData = new VMCASHDataEntity();

            //        vmcashData.Pay_Tag = sr[9].ToString().Trim();//付款狀態(判斷用)

            //        vmcashData.PayStatus = sr[10].ToString().Trim();//付款狀態(判斷用)
            //        vmcashData.Done_Tag = sr[11].ToString().Trim();//簽署狀態
            //        vmcashData.o_id = sr[12].ToString().Trim();//說明(欄位1)
            //        vmcashData.OD_payOrderId = sr[13].ToString().Trim();//說明(欄位2)
            //        vmcashData.Payway = sr[14].ToString().Trim();//說明(欄位3)
            //        vmcashData.Card4NO = sr[15].ToString().Trim();////說明(欄位4:卡末4碼)
            //        vmcashData.Pay_Serial = sr[0].ToString().Trim();//登入代碼
            //        vmcashData.C_Tel = sr[1].ToString().Trim();//手機
            //        vmcashData.P_Name = sr[2].ToString().Trim();//產品
            //        vmcashData.Price = sr[8].ToString().Trim();//價格
            //        vmcashData.T_Sdate = sr[4].ToString().Trim();//期間(起)
            //        vmcashData.T_Edate = sr[5].ToString().Trim();//期間(迄)
            //                                                     //vmcashData.M_id = sr[6].ToString().Trim();//利用MID在iddata中找出相同的M_id並求出Name(會員姓名)
            //        vmcashData.M_id = sr[6].ToString().Trim();
            //        if (vmcashData.M_id.Trim() != "")
            //        {
            //            string cmd_M_id = "select Name from iddata where M_id='" + vmcashData.M_id + "'";
            //            vmcashData.Member_Name = GetValueBYSQLwithConnNotClose(conn, cmd_M_id);

            //        }
            //        else
            //        {
            //            vmcashData.Member_Name = "";
            //        }


            //        vmcashDataList.Add(vmcashData);

            //    }
            //}
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'vmcashDataList' : " + vmcashDataList.ToString(), className, methodName);

        return vmcashDataList;

    }
    //簽署狀態
    private string GetDone_Tag_TxtByValue(string done_tag)
    {
        string Value = "";
        if (done_tag == "1")
            Value = "未簽署";
        else if (done_tag == "0")
            Value = "成功";
        //Value= "<a href=https://www.hwa-guan.com.tw/file/RAPDF/" & VRS("contractid") & ".pdf target=twcapdf><font color=blue>成功</font></a><br>" & VRS("ca_id")";
        else
            Value = "失敗";
        return Value;

    }
    //付款狀態
    private string GetPayStatus_TxtByValue(string pay_tag, string o_id, string payStatus)
    {
        string Value = "";
        if (pay_tag == "0")
            Value = "----";
        else if (o_id == "" || o_id == null)
            Value = "尚未付款";
        else
        {
            if (payStatus == "1")
            {
                Value = "成功";
            }
            else
            {
                Value = "失敗";
            }
        }
        return Value;
    }

    public DataTable CreateTable()
    {
        //創建Table1
        DataTable dt = new DataTable();
        //對Table1添加列名，并設定列值型別
        DataTable dt1 = new DataTable();//創建Table1
        dt1.Columns.Add("Pay_Serial", typeof(string));
        dt1.Columns.Add("C_Tel", typeof(string));
        dt1.Columns.Add("P_Name", typeof(int));
        dt1.Columns.Add("Price", typeof(string));
        dt1.Columns.Add("T_Sdate", typeof(string));
        dt1.Columns.Add("T_Edate", typeof(string));
        dt1.Columns.Add("M_id", typeof(string));
        dt1.Columns.Add("Member_Name", typeof(string));
        dt1.Columns.Add("MC_name", typeof(string));
        //對Table1進行設定KEY
        dt1.PrimaryKey = new DataColumn[] { dt1.Columns["ID"] };
        //對Tabel添加數值
        for (int i = 0; i < 2; i++)
        {
            DataRow dr = dt1.NewRow();
            dr["ID"] = "00" + i.ToString();
            dr["NAME"] = "00-" + i.ToString();
            dr["AGE"] = 15 + i;
            dr["SEX"] = "M";
            dt1.Rows.Add(dr);
        }
        return dt1;
    }

    private string GetDone_tag_StatusByValue(string Done_tag, string ContractID, string ca_id)
    {
        string Done_tag_Status = "";
        if (Done_tag == "1")
        {
            Done_tag_Status = "未簽署";
        }
        else if (Done_tag == "0")
        {
            //response.write "<a href=https://www.hwa-guan.com.tw/file/RAPDF/"& VRS("contractid")&".pdf target=twcapdf><font color=blue>成功</font></a><br>"&   VRS("ca_id") 
            Done_tag_Status = "-連接網址-" + ContractID + "-連接網址-" + ca_id;
        }
        else
        {
            //response.write "<font color=RED>失敗</font>"
            Done_tag = "失敗";
        }

        return Done_tag_Status;
    }

    //取得付款狀態
    private string GetStateByValue(string Pay_Tag, string PayStatus, string o_id)
    {
        string State = "";
        if (Pay_Tag.Trim() == "0")
        {
            State = "------";
        }
        else if (o_id == "" || o_id == null)
        {
            State = "尚未付款";
        }
        else
        {
            if (PayStatus == "1")
                State = "成功";
            else
                State = "失敗";
        }
        return State;
    }

    public string GetValueBYSQL(SqlConnection conn, string commandText)
    {
        string connectionStrings = "sqlConnectHG_Test_TEST";
        string value = "";
        using (SqlConnection conn_ = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            //SqlConnection connection = conn;

            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            //conn.ConnectionString = connectionStrings;
            //conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn_;
            cmd.CommandText = commandText;
            DataTable dt = new DataTable();
            //conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
            //conn.Open();
            //SqlCommand cmd = new SqlCommand();
            //cmd.Connection = conn;
            //cmd.CommandText = tsql;
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = cmd;
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
        }
    }

    public string GetValueBYSQLwithConnNotClose(SqlConnection conn, string commandText)
    {
        string connectionStrings = "sqlConnectHG_Test_TEST";
        string value = "";
        //using (SqlConnection conn_ = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        //{
        //SqlConnection connection = conn;

        //conn.ConnectionString = connectionStrings;
        //conn.Open();
        //conn.ConnectionString = connectionStrings;
        //conn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = commandText;
        DataTable dt = new DataTable();
        //conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
        //conn.Open();
        //SqlCommand cmd = new SqlCommand();
        //cmd.Connection = conn;
        //cmd.CommandText = tsql;
        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand = cmd;
        try
        {
            adapter.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                value = row[0].ToString();
            }
            else
            {
                value = "";
            }
        }
        catch (Exception ex)
        {
            string command = commandText;
            throw ex;
        }
        //adapter.Fill(dt);//取出所有會場編號
        //int V_ID_Count = dt.Rows.Count;
        //List<SRMVENUEntity> SRMVENUEntityList = new List<SRMVENUEntity>();
        //for (int i = 0; i < V_ID_Count; i++)
        //{
        //    string V_ID=dt[i][0].
        //}
        //foreach (DataRow row in dt.Rows)
        //{
        //    //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
        //    value = row[0].ToString();
        //}
        //conn.Close();
        //}
        return value;
        //}
    }


    //20220713
    private string GetMC_NameFunc(string m_id)
    {
        string SQL_Condition = "select Name from iddata where m_id='" + m_id + "'";
        //string tsql = "select * from MRYGC where MRYGC_ID='9000066585'";
        string tsql = SQL_Condition;//調可派發之總案件語法
        string connectionStrings = "sqlConnectHG_Test_TEST";
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString());
        DataTable dt = new DataTable();
        conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
        conn.Open();//資料庫連線開啟
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = tsql;//調可派發之總案件
        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand = cmd;
        adapter.Fill(dt);//調可派發之總案件
        string MC_name = "";
        return MC_name;
    }
}