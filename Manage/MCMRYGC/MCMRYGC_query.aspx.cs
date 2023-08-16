using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_User_MUSER_query : System.Web.UI.Page
{
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    private string MS_ID = string.Empty;
    private string MENU_no = string.Empty;
    string U_Num = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        //調可派發總案件
        //select * from vrygc where mrygc_tag='0'
        //  RepeatColumns = "5" RepeatDirection = "Horizontal"
        if (!IsPostBack)
        {

            //CB_list.Items.Clear();
            ////List<EmpDataEntity> _EmpData = new List<EmpDataEntity>();
            //DataTable _EmpData = new DataTable();
            //CB_list.RepeatDirection = RepeatDirection.Horizontal;//文字和框框對齊方式
            //_EmpData = GetCheckBoxListItem();
            //CB_list.RepeatColumns = 5;//一行的個數
            //                          //CB_list.TextAlign=
            //                          //CB_list.Width = 10;
            //                          //派發人員CheckBox項目設定
            int i = 0;
            //foreach (DataRow dr in _EmpData.Rows)
            //{
            //    CB_list.Items.Add(dr["U_Name"].ToString());
            //}
            ////資源帳號下拉式選單項目
            //DataTable _ResourceItemData = new DataTable();
            //_ResourceItemData = GetDropDowmListZ_Item();
            //Z_Item.DataSource = _ResourceItemData;
            //Z_Item.DataValueField = "Id";
            //Z_Item.DataTextField = "Value";
            //Z_Item.DataBind();
            //交易狀態下拉式選單項目
            DataTable Q_memberData = new DataTable();
            Q_memberData = GetDropDowmListQ_memberItem();
            //Q_member.DataSource = Q_memberData;
            //Q_member.DataValueField = "Id";
            //Q_member.DataTextField = "Value";
            //Q_member.DataBind();



            /*
      * <%if session("U_num")="B9601151" THEN%>
        <OPTION value="Z0000002" <%if Z_Item="Z0000002" then response.write "selected"%>>	營1資源A(黃)</OPTION>
		<OPTION value="Z0000003" <%if Z_Item="Z0000003" then response.write "selected"%>>	營1資源B(紅)</OPTION>
            <OPTION value="Z0010001" <%if Z_Item="Z0010001" then response.write "selected"%>>	營2資源A(黃)</OPTION>
		<OPTION value="Z0010002" <%if Z_Item="Z0010002" then response.write "selected"%>>	營2資源A(紅)</OPTION>	
            <OPTION value="Z0000010" <%if Z_Item="Z0000010" then response.write "selected"%>>	推廣資源A(黃)</OPTION>
		<OPTION value="Z0000011" <%if Z_Item="Z0000011" then response.write "selected"%>>	推廣資源B(紅)</OPTION>
        <OPTION value="Z0300001" <%if Z_Item="Z0300001" then response.write "selected"%>>	資源A(黃)</OPTION>
		<OPTION value="Z0300002" <%if Z_Item="Z0300002" then response.write "selected"%>>	資源B(紅)</OPTION>
			<OPTION value="Z7000001" <%if Z_Item="Z7000001" then response.write "selected"%>>	財1資源A(黃)</OPTION>
		<OPTION value="Z7000002" <%if Z_Item="Z7000002" then response.write "selected"%>>	財1資源B(紅)</OPTION>
		<%elseif session("ComID")="HG01" THEN%>	 																														                          
		<OPTION value="Z0000002" <%if Z_Item="Z0000002" then response.write "selected"%>>	營1資源A(黃)</OPTION>
		<OPTION value="Z0000003" <%if Z_Item="Z0000003" then response.write "selected"%>>	營1資源B(紅)</OPTION>	
        <%elseif session("ComID")="HG05" THEN%>
		<OPTION value="Z0010001" <%if Z_Item="Z0010001" then response.write "selected"%>>	營2資源A(黃)</OPTION>
		<OPTION value="Z0010002" <%if Z_Item="Z0010002" then response.write "selected"%>>	營2資源A(紅)</OPTION>													                          	
		<%elseif session("ComID")="HG02" THEN%>
		<OPTION value="Z0000010" <%if Z_Item="Z0000010" then response.write "selected"%>>	推廣資源A(黃)</OPTION>
		<OPTION value="Z0000011" <%if Z_Item="Z0000011" then response.write "selected"%>>	推廣資源B(紅)</OPTION>	
		<%elseif session("ComID")="HG03" THEN%>
		<OPTION value="Z0300001" <%if Z_Item="Z0300001" then response.write "selected"%>>	財1資源A(黃)</OPTION>
		<OPTION value="Z0300002" <%if Z_Item="Z0300002" then response.write "selected"%>>	財1資源B(紅)</OPTION>
        <%elseif session("ComID")="HG07" THEN%>
		<OPTION value="Z7000001" <%if Z_Item="Z7000001" then response.write "selected"%>>	財2資源A(黃)</OPTION>
		<OPTION value="Z7000002" <%if Z_Item="Z7000002" then response.write "selected"%>>	財2資源B(紅)</OPTION>
                                                  	
																				<%end if%>
             */
        }
        else
        {
            //if (CB_list.Items[1].Selected == true)
            //{
            //    CB_list.Items[2].Selected = true;
            //}


        }




        //
        //for (int i = 0; i < CB_list.Items.Count; i++)
        //{
        //    if (CB_list.Items[i].Selected)
        //        Response.Write("你选的是" + CB_list.Items[i].Value + CB_list.Items[i].Text + "<br>");
        //}
        //List<int> SupporFacilities_CheckBoxList = new List<int>();
        //foreach (var showlist in myLists)
        //{
        //    //if (CB_list.Items[i].Selected)
        //        Response.Write("你选的是" + showlist. + showlist.Items[i].Text + showlist + "<br>");
        //}
        //Console.WriteLine(showlist);
    }
    //派發人員(20220707進度)=>將這個轉成由前端產生
    private DataTable GetCheckBoxListItem()
    {
        //string Com_ID = "";
        //string SQL = "";
        string U_num;
        string ComID;
        U_num = Session["U_num"].ToString();
        ComID = Session["ComID"].ToString();
        string connectionStrings = "sqlConnectHG_Test_TEST";
        string tsql = "";
        //取得派發人員列表
        if (U_num == "B9601151")
        {
            tsql = "select U_Num,U_Name From MUSER where LeaveDate is null and (U_MDEP='0002' or U_MDEP='0006' or U_MDEP='0007' or U_MDEP='0008' or U_MDEP='0011' or U_MDEP='0012') AND u_NUM<>'Z0000001' AND u_NUM<>'Z0000002' AND u_NUM<>'Z0000003' order by U_MDEP";
        }
        else if (ComID == "HG01")
        {
            tsql = "select U_Num,U_Name From MUSER where LeaveDate is null and (U_MDEP='0002' or U_MDEP='0006' ) AND u_NUM<>'Z0000001' AND u_NUM<>'Z0000002' AND u_NUM<>'Z0000003' order by U_MDEP";
        }
        else if (ComID == "HG02")
        {
            tsql = "select U_Num,U_Name From MUSER where LeaveDate is null and (U_MDEP='0007' or U_MDEP='0008' ) AND u_NUM<>'Z0000011' AND u_NUM<>'Z0000012' order by U_MDEP";
        }
        else if (ComID == "HG03")
        {
            tsql = "select U_Num,U_Name From MUSER where LeaveDate is null and (U_MDEP='0011' or U_MDEP='0012' ) AND u_NUM<>'Z0300001' AND u_NUM<>'Z0300002'  order by U_MDEP";
        }
        else if (ComID == "HG07")
        {
            tsql = "select U_Num,U_Name From MUSER where LeaveDate is null and (U_MDEP='0018' or U_MDEP='0019' ) AND u_NUM<>'Z7000001' AND u_NUM<>'Z7000002'  order by U_MDEP";
        }
        else if (ComID == "HG05")
        {
            tsql = "select U_Num,U_Name From MUSER where LeaveDate is null and (U_MDEP='0015' or U_MDEP='0016' ) AND u_NUM<>'Z0010001' AND u_NUM<>'Z0010002'  order by U_MDEP";
        }
        List<EmpDataEntity> empDatas = new List<EmpDataEntity>();
        EmpDataEntity empDataEntity = new EmpDataEntity();
        List<EmpDataEntity> empDatas_New = new List<EmpDataEntity>();
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString());
        DataTable dt = new DataTable();
        conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
        conn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = tsql;
        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand = cmd;
        adapter.Fill(dt);


        //using (SqlDataReader sr = cmd.ExecuteReader())
        //    {
        //        while (sr.Read())
        //        {
        //            empDataEntity.U_Num = sr[0].ToString();
        //            empDataEntity.U_Name = sr[1].ToString();
        //            empDatas.Add(empDataEntity);

        //        }

        //    }
        //empDatas_New = ;
        conn.Close();
        //break;
        //return empDatas;


        return dt;


    }
    //資源帳號
    private DataTable GetDropDowmListZ_Item()
    {
        string U_num;
        string ComID;
        U_num = Session["U_num"].ToString();
        ComID = Session["ComID"].ToString();
        string connectionStrings = "sqlConnectHG_Test_TEST";
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString());
        DataTable dt = new DataTable();
        //dt.Columns.AddRange(new DataColumn[2] { new DataColumn("Id"), new DataColumn("Option") });
        //dt.Columns["Id"].DefaultValue = 0;
        dt.Columns.Add("Id", typeof(String));
        dt.Columns.Add("Value", typeof(String));
        //dt.Columns["Id"].DefaultValue = 0;
        if (U_num == "B9601151")
        {
            dt.Rows.Add("Z0000002", "營1資源A(黃)");
            dt.Rows.Add("Z0000003", "營1資源B(紅)");
            dt.Rows.Add("Z0010001", "營2資源A(黃)");
            dt.Rows.Add("Z0010002", "營2資源A(紅)");
            dt.Rows.Add("Z0000010", "推廣資源A(黃)");
            dt.Rows.Add("Z0000011", "推廣資源B(紅)");
            dt.Rows.Add("Z0300001", "資源A(黃)");
            dt.Rows.Add("Z0300002", "資源B(紅)");
            dt.Rows.Add("Z7000001", "財1資源A(黃)");
            dt.Rows.Add("Z7000002", "財1資源B(紅)");

        }
        else if (ComID == "HG01")
        {
            dt.Rows.Add("Z0000002", "營1資源A(黃)");
            dt.Rows.Add("Z0000003", "營1資源B(紅)");
        }
        else if (ComID == "HG05")
        {
            dt.Rows.Add("Z0010001", "營2資源A(黃)");
            dt.Rows.Add("Z0000002", "營2資源A(紅)");
        }
        else if (ComID == "HG02")
        {
            dt.Rows.Add("Z0000010", "推廣資源A(黃)");
            dt.Rows.Add("Z0000011", "推廣資源B(紅)");
        }
        else if (ComID == "HG03")
        {
            dt.Rows.Add("Z0300001", "財1資源A(黃)");
            dt.Rows.Add("Z0300002", "財1資源B(紅)");
        }
        else if (ComID == "HG02")
        {
            dt.Rows.Add("Z7000001", "財2資源A(黃)");
            dt.Rows.Add("Z7000002", "財2資源B(紅)");
        };

        return dt;
    }
    //交易狀態
    private DataTable GetDropDowmListQ_memberItem()
    {
        string U_num;
        string ComID;
        U_num = Session["U_num"].ToString();
        ComID = Session["ComID"].ToString();
        string connectionStrings = "sqlConnectHG_Test";
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString());
        DataTable dt = new DataTable();
        //dt.Columns.AddRange(new DataColumn[2] { new DataColumn("Id"), new DataColumn("Option") });
        //dt.Columns["Id"].DefaultValue = 0;
        dt.Columns.Add("Id", typeof(String));
        dt.Columns.Add("Value", typeof(String));
        //dt.Columns["Id"].DefaultValue = 0;

        dt.Rows.Add("", "不限");
        dt.Rows.Add("N", "無交易");
        dt.Rows.Add("Y", "有交易");




        return dt;
    }
    //依條件撈取可派發案件(GetAssignCaseByCondition)
    //條件:MC=Z_item(資源帳號)
    //條件:Q_Member(交易狀態):Y=> (M_num = '' or M_num is null)"
    //條件:Q_Member(交易狀態):N=> (M_num = '' or M_num is null)"
    public string GetAssignCaseByCondition()
    {
        //string Z_item = Z_Item.SelectedValue.ToString();//資源帳號(Z0000003)
        //string Q_member_Value = Q_member.SelectedValue.ToString();//無交易(N)
        //調可派發之總案件
        string sql = "select * from vrygc where mrygc_tag='0'";
        //if (Z_item != "")
        //{
        //    sql = sql + " and MC='" + Z_item + "'";
        //}
        //if (Q_member_Value == "N")
        //{
        //    sql = sql + " and (M_num = '' or M_num is null)";
        //}
        //else if (Q_member_Value == "Y")
        //{
        //    sql = sql + " and (M_num <>'')";
        //}





        return sql;
    }


    //調可派發之總案件(GetAllAssignCase)


    //新增派發紀錄到MRYGC(AssignCaseToMRYGC)


    //更新MMBER會員資料庫的派發紀錄(UpdateAssignInMEMBer)=>派發成功


    public string getRelativePath()
    {
        return "../../../";
    }
    public string getIP()
    {
        string IP = Session["IP"] == null ? "" : Session["IP"].ToString();
        return IP;

    }

    public string getU_Num()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        U_Num = Session["U_Num"] == null ? "" : Session["U_Num"].ToString();

        log.endWrite("'U_Num' : " + U_Num, className, methodName);
        return U_Num;
    }
    public string getMENU_no()
    {
        return MENU_no;
    }
    //public string getMENU_no()
    //{
    // return Request.Params["MENU_no"].ToString();
    //}
    //查詢案件
    //派發案件
    protected void Button1_Click(object sender, EventArgs e)
    {

        //var items = Request.Form["items"];
        //string args = Request.Form["__EVENTTARGET"];
        //string[] arg = args.Split('$');
        //int index = int.Parse(arg[arg.Length - 1]);
        //string CheckedOrUncheckedItem = CB_list.Items[index].Text + " is " + ((CB_list.Items[index].Selected) ? " checked." : " unchecked.");
        //GetAssignCaseByCondition();
        DataTable _EmpData = new DataTable();
        //CB_list.RepeatDirection = RepeatDirection.Horizontal;//文字和框框對齊方式
        _EmpData = GetCheckBoxListItem();
        int num = _EmpData.Rows.Count;//派發人員數目
        //int CB_list_Coumt = CB_list.Items.Count;//派發人員數目
        //DataTable dt = GetCheckBoxListItem();
        //List<string> Check = new List<string>();//有勾選的人名
        //for (int i = 0; i < num; i++)
        //{
        //    if (CB_list.Items[i].Selected)
        //    {
        //        Check.Add(_EmpData.Rows[i]["U_Num"].ToString());//有勾選的人名(工號)[派發人員]
        //                                                        //= dataTable.Rows[0]["ColumnNameOrIndex"];
        //    }
        //}
        //取得派發筆數(Case_count)
        int Case_count;
        if (Case_count_TB.Text.Trim() != "")
        {
            Case_count = int.Parse(Case_count_TB.Text.Trim());//派發筆數(筆/人)
        }
        else
        {
            Case_count = 0;//派發筆數(筆/人)
        }
        //AssignCase(Check, Case_count);//進行派發工作[Check:有勾選的人名.Case_count:派發筆數]


        //foreach (var item in CB_list)
        //{

        //}
        //if (CB_list.Items[1].Selected == true)
        //{
        //    CB_list.Items[2].Selected = true;
        //}
    }
    //進行派發工作
    private void AssignCase(List<string> check, int Case_count)
    {
        //check:有勾選的人名(工號)
        //調可派發之總案件語法
        string SQL_Condition = GetAssignCaseByCondition();////依條件產生撈取可派發案件語法(GetAssignCaseByCondition)
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
        int m = 0;
        /*
         * INSERT INTO [HG].[dbo].[MRYGC]
         * ([M_id],[Assign_user],[Assign_Name],[Assign_Date],[Assign_EndDate],[Assign_tag],[del_tag],[add_user],[add_date],[add_ip]) 
         * VALUES
            (M_id,Assign_user,Assign_Name,Assign_Date,Assign_EndDate,Assign_tag,del_tag,add_user,add_date,add_ip)
         */
        //dt:可派發之總案件
        //conn.Open();
        foreach (var item1 in dt.Rows)
        {
            DataRow row = dt.Rows[m];
            string M_ID = row["M_ID"].ToString();//會員編號(由調可派發之總案件中取得)
            m++;
            //check:有勾選的人名(派發人員:員工編號)
            foreach (var item2 in check)
            {
                //check:有勾選的人名(工號)
                //調可派發之總案件
                //新增派發紀錄到MRYGC(由調可派發之總案件中取得)
                //INSERT INTO [HG].[dbo].[MRYGC]([M_id],[Assign_user],[Assign_Name],[Assign_Date],[Assign_EndDate],[Assign_tag],[del_tag],[add_user],[add_date],[add_ip]) VALUES
                //(M_id, Assign_user, Assign_Name, Assign_Date, Assign_EndDate, Assign_tag, del_tag, add_user, add_date, add_ip)
                //Case_count:分配筆數
                for (int i = 0; i < Case_count; i++)
                {
                    //INSERT INTO [HG].[dbo].[MRYGC]([M_id],[Assign_user],[Assign_Name],[Assign_Date],[Assign_EndDate],[Assign_tag],[del_tag],[add_user],[add_date],[add_ip]) VALUES
                    //(M_id, Assign_user, Assign_Name, Assign_Date, Assign_EndDate, Assign_tag, del_tag, add_user, add_date, add_ip)
                    string sqlstr = "INSERT INTO [HG].[dbo].[MRYGC]([M_id],[Assign_user],[Assign_Name],[Assign_Date],[Assign_EndDate],[Assign_tag],[del_tag],[add_user],[add_date],[add_ip]) VALUES (@M_id, @Assign_user, @Assign_Name, @Assign_Date, @Assign_EndDate, @Assign_tag, @del_tag, @add_user, @add_date, @add_ip)"; //免除sql注入攻擊
                    SqlCommand cmd_NEWMRYGC = new SqlCommand();
                    cmd_NEWMRYGC.Connection = conn;
                    cmd_NEWMRYGC.CommandText = sqlstr;
                    SqlParameter M_id = new SqlParameter();
                    SqlParameter Assign_user = new SqlParameter();
                    SqlParameter Assign_Name = new SqlParameter();
                    SqlParameter Assign_Date = new SqlParameter();
                    SqlParameter Assign_EndDate = new SqlParameter();
                    SqlParameter Assign_tag = new SqlParameter();
                    SqlParameter del_tag = new SqlParameter();
                    SqlParameter add_user = new SqlParameter();
                    SqlParameter add_date = new SqlParameter();
                    SqlParameter add_ip = new SqlParameter();
                    //(@M_id, @Assign_user, @Assign_Name, @Assign_Date, @Assign_EndDate, @Assign_tag, @del_tag, @add_user, @add_date, @add_ip)
                    M_id = new SqlParameter("@M_id", SqlDbType.VarChar, 15);
                    Assign_user = new SqlParameter("@Assign_user", SqlDbType.VarChar, 8);
                    Assign_Name = new SqlParameter("@Assign_Name", SqlDbType.VarChar, 15);
                    Assign_Date = new SqlParameter("@Assign_Date", SqlDbType.DateTime);
                    Assign_EndDate = new SqlParameter("@Assign_EndDate", SqlDbType.DateTime);
                    Assign_tag = new SqlParameter("@Assign_tag", SqlDbType.NVarChar, 100);
                    del_tag = new SqlParameter("@del_tag", SqlDbType.Char, 1);
                    add_user = new SqlParameter("@add_user", SqlDbType.VarChar, 8);
                    add_date = new SqlParameter("@add_date", SqlDbType.DateTime);
                    add_ip = new SqlParameter("@add_ip", SqlDbType.VarChar, 15);
                    //設定要加入的資料數值
                    M_id.Value = M_ID;
                    Assign_user.Value = Session["U_Num"];
                    Assign_Name.Value = Session["U_Name"];
                    var test = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss.fff");
                    Assign_Date.Value = DateTime.Parse(test);
                    Assign_EndDate.Value = DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss.fff")); ;
                    Assign_tag.Value = "1";
                    del_tag.Value = "0";
                    add_user.Value = Session["U_Num"];
                    add_date.Value = DateTime.Parse(test);
                    add_ip.Value = Session["IP"];
                    //
                    cmd_NEWMRYGC.Parameters.Add(M_id);
                    cmd_NEWMRYGC.Parameters.Add(Assign_user);
                    cmd_NEWMRYGC.Parameters.Add(Assign_Name);
                    cmd_NEWMRYGC.Parameters.Add(Assign_Date);
                    cmd_NEWMRYGC.Parameters.Add(Assign_EndDate);
                    cmd_NEWMRYGC.Parameters.Add(Assign_tag);
                    cmd_NEWMRYGC.Parameters.Add(del_tag);
                    cmd_NEWMRYGC.Parameters.Add(add_user);
                    cmd_NEWMRYGC.Parameters.Add(add_date);
                    cmd_NEWMRYGC.Parameters.Add(add_ip);
                    int Result = cmd_NEWMRYGC.ExecuteNonQuery(); //執行sql語句，並且返回影響的行數。
                    //更新MMBER會員資料庫的派發紀錄
                    SqlCommand cmd_NEWMRYGC2 = new SqlCommand();
                    cmd_NEWMRYGC2.Connection = conn;
                    string sqlstr2 = "UPDATE [dbo].[MMBER] SET[MRYGC_tag] = 0 WHERE M_ID = '" + M_ID + "'";
                    cmd_NEWMRYGC2.CommandText = sqlstr2;
                    //int Result2 = cmd_NEWMRYGC2.ExecuteNonQuery();//執行sql語句，並且返回影響的行數。
                    ;

                    //'更新MMBER會員資料庫的派發紀錄
                    //MRYGC:Assign_user:item.A
                }

            }
        }
        conn.Close();//資料庫連線關閉

    }
    //回傳可取得多少筆數的資料
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
        //conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
        //conn.Open();
        //SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        //cmd.CommandText = tsql;
        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
        adapter.Fill(dt);//取出所有會場編號
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
        value = dt.Rows.Count.ToString();
        //}
        return value;
    }

    //查詢案件
    protected void Button2_Click1(object sender, EventArgs e)
    {
        Session["Q_keyword"] = KeyWord.Text.Trim();
        Server.Transfer("MCMRYGC_squery.aspx");
    }

    protected void Z_Item_SelectedIndexChanged(object sender, EventArgs e)
    {
        var test = "";
    }

    protected void Z_Item_TextChanged(object sender, EventArgs e)
    {
        var test = "";
    }

    protected void Q_member_SelectedIndexChanged(object sender, EventArgs e)
    {
        var test = "";
    }

    protected void Q_member_TextChanged(object sender, EventArgs e)
    {
        var test = "";
    }

    protected void Q_member_Init(object sender, EventArgs e)
    {
        var test = "";
    }

    protected void Z_Item_Init(object sender, EventArgs e)
    {
        var test = "";
    }
}