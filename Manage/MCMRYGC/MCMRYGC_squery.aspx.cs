using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

//單筆案件派發
public partial class Manage_MCMRYGC_MCMRYGC_squery : System.Web.UI.Page
{
    private string MS_ID = string.Empty;
    private string MENU_no = string.Empty;
    string tsql = "";
    string tsql_2 = "";
    string keyword = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)//第一次載入
        { 
        //sql連線字串 webconfig的對應位置
        string connectionStrings = "sqlConnectHG_Test_TEST";
        if (Session["Q_keyword"] != null)
        {
            keyword = Session["Q_keyword"].ToString();
            string ComID;
            //U_num = Session["U_num"].ToString();
            ComID = Session["ComID"].ToString();
            //單筆案件查詢
            //string tsql = "select* from VRYGC where mc_com = '" + ComID + "' and del_tag = '0' ";

            if (!IsPostBack)
            {
                /*
                 * if session("ComID")="HG01" THEN 																														                          
			       tsql = "select U_Num,U_Name,COMID From MUSER where LeaveDate is null and (U_MDEP='0002' or U_MDEP='0006' ) AND u_NUM<>'Z0000001' AND u_NUM<>'Z0000002' AND u_NUM<>'Z0000003' order by U_MDEP" 												                          	
				    elseif session("ComID")="HG02" THEN
						tsql = "select  U_Num,U_Name,COMID From MUSER where LeaveDate is null and (U_MDEP='0007' or U_MDEP='0008' ) AND u_NUM<>'Z0000011' AND u_NUM<>'Z0000012' order by U_MDEP"
					elseif session("ComID")="HG03" THEN
						tsql = "select  U_Num,U_Name,COMID From MUSER where LeaveDate is null and (U_MDEP='0011' or U_MDEP='0012' ) AND u_NUM<>'Z0300001' AND u_NUM<>'Z0300002'  order by U_MDEP" 
                    elseif session("ComID")="HG05" THEN
						tsql = "select U_Num,U_Name,COMID From MUSER where LeaveDate is null and (U_MDEP='0015' or U_MDEP='0016' ) AND u_NUM<>'Z0010001' AND u_NUM<>'Z0010002'  order by U_MDEP" 
					end if
                 */
                //取得下拉式選單中的分派人員列表(DropDownList:MC)
                if (Session["ComID"].ToString().Trim() == "HG01")
                {
                    tsql_2 = "select U_Num,U_Name,COMID From MUSER where LeaveDate is null and (U_MDEP='0002' or U_MDEP='0006' ) AND u_NUM<>'Z0000001' AND u_NUM<>'Z0000002' AND u_NUM<>'Z0000003' order by U_MDEP";
                }
                else if (Session["ComID"].ToString().Trim() == "HG02")
                {
                    tsql_2 = "select  U_Num,U_Name,COMID From MUSER where LeaveDate is null and (U_MDEP='0007' or U_MDEP='0008' ) AND u_NUM<>'Z0000011' AND u_NUM<>'Z0000012' order by U_MDEP";
                }
                if (Session["ComID"].ToString().Trim() == "HG03")
                {
                    tsql_2 = "select  U_Num,U_Name,COMID From MUSER where LeaveDate is null and (U_MDEP='0011' or U_MDEP='0012' ) AND u_NUM<>'Z0300001' AND u_NUM<>'Z0300002'  order by U_MDEP";
                }
                if (Session["ComID"].ToString().Trim() == "HG05")
                {
                    tsql_2 = "select U_Num,U_Name,COMID From MUSER where LeaveDate is null and (U_MDEP='0015' or U_MDEP='0016' ) AND u_NUM<>'Z0010001' AND u_NUM<>'Z0010002'  order by U_MDEP";
                }
                SqlConnection conn_2 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString());
                DataTable dt = new DataTable();
                conn_2.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
                conn_2.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn_2;
                cmd.CommandText = tsql_2;
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;

                adapter.Fill(dt);
                MC.DataSource = dt;
                MC.DataTextField = "U_Name";
                MC.DataValueField = "U_Num";
                MC.DataBind();
                //MC(GV中的下拉式選單)

                //GV中的資料來源
                if (Session["Q_keyword"] != null)
                {
                    var Q_keyword = Session["Q_keyword"].ToString();//輸入查詢的關鍵字
                                                                    //  RepeatColumns = "5" RepeatDirection = "Horizontal"
                    string sql_txt = "";
                    sql_txt = sql_txt + " and (M_Num = '" + Q_keyword + "' or M_Name = '" + Q_keyword + "' or MTel1 = '" + Q_keyword + "'";
                    sql_txt = sql_txt + " or MTel2 = '" + Q_keyword + "' or MTel3 = '" + Q_keyword + "'";
                    sql_txt = sql_txt + " or ((OTel_Zone +  OTel = '" + Q_keyword + "')  ";
                    sql_txt = sql_txt + " or (OTel_Zone1 +  OTel1 = '" + Q_keyword + "') ";
                    sql_txt = sql_txt + " or (HTel_Zone +  HTel = '" + Q_keyword + "') ";
                    sql_txt = sql_txt + " or (HTel_Zone1 +  HTel1 = '" + Q_keyword + "'))) ";
                    sql_txt = sql_txt + " or (mc_name like '%" + Q_keyword + "%')  ";
                    sql_txt = sql_txt + " or (m_name like '%" + Q_keyword + "%')  ";
                    tsql = "select MTel1, OTel1,HTel1,mg_count,m_name, mc_name from VRYGC where mc_com='" + Session["ComID"].ToString() + "' and del_tag = '0' " + sql_txt;//含關鍵字的SQL查詢語法
                }
                else
                {
                    Server.Transfer("login.aspx");//返回登入頁
                    tsql = "";
                }
                ////sql連線字串 webconfig的對應位置
                //string connectionStrings = "sqlConnectHG_Test_TEST";
                //List<muserEntity> muserList
                //string connectionStrings = "sqlConnectHG_Test_TEST";
                List<muserEntity> DLData = new List<muserEntity>();
                muserEntity DLDataEntity = new muserEntity();
                //List<EmpDataEntity> empDatas_New = new List<EmpDataEntity>();
                SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString());
                DataTable dt_2 = new DataTable();
                conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
                conn.Open();
                SqlCommand cmd_2 = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = tsql;
                SqlDataAdapter adapter_2 = new SqlDataAdapter();
                adapter_2.SelectCommand = cmd;

                adapter_2.Fill(dt_2);
                //GridView1.DataSource = squeryTable(keyword);
                //GridView1.DataBind();
                int DataCount = squeryTable(keyword).Rows.Count;
                //DataCount_LB.Text = DataCount.ToString();//資料筆數
                //string connectionStrings = "sqlConnectHG_Test_TEST";
                List<EmpDataEntity> empDatas = new List<EmpDataEntity>();
                EmpDataEntity empDataEntity = new EmpDataEntity();
                List<EmpDataEntity> empDatas_New = new List<EmpDataEntity>();
                SqlConnection conn2 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString());
                DataTable dt2 = new DataTable();
                conn2.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
                conn2.Open();
                SqlCommand cmd2 = new SqlCommand();
                cmd2.Connection = conn2;
                cmd2.CommandText = tsql;
                SqlDataAdapter adapter2 = new SqlDataAdapter();
                adapter.SelectCommand = cmd2;

                adapter.Fill(dt2);
                //GridView1.DataSource = dt2;
                //GridView1.DataBind();

            }
            //Session["ComID"] = se.ComID;
            if (IsPostBack)//按下分派案件後
            {
                //CheckBox cb = (CheckBox)GridView1.SelectedRow.Cells[6].Controls[0];
                // GridView1.DataSource = dt;
                // GridView1.DataBind();

                //載入下拉式選單的選項
                /*
                 *  if session("ComID")="HG01" THEN 																														                          
                 tsql = "select U_Num,U_Name,COMID From MUSER where LeaveDate is null and (U_MDEP='0002' or U_MDEP='0006' ) AND u_NUM<>'Z0000001' AND u_NUM<>'Z0000002' AND u_NUM<>'Z0000003' order by U_MDEP" 												                          	
                elseif session("ComID")="HG02" THEN
                tsql = "select  U_Num,U_Name,COMID From MUSER where LeaveDate is null and (U_MDEP='0007' or U_MDEP='0008' ) AND u_NUM<>'Z0000011' AND u_NUM<>'Z0000012' order by U_MDEP"
                elseif session("ComID")="HG03" THEN
                tsql = "select  U_Num,U_Name,COMID From MUSER where LeaveDate is null and (U_MDEP='0011' or U_MDEP='0012' ) AND u_NUM<>'Z0300001' AND u_NUM<>'Z0300002'  order by U_MDEP" 
                elseif session("ComID")="HG05" THEN
                 tsql = "select U_Num,U_Name,COMID From MUSER where LeaveDate is null and (U_MDEP='0015' or U_MDEP='0016' ) AND u_NUM<>'Z0010001' AND u_NUM<>'Z0010002'  order by U_MDEP" 
                end if
                 */
                //CB_list.Items.Clear();
                ////List<EmpDataEntity> _EmpData = new List<EmpDataEntity>();
                //DataTable _EmpData = new DataTable();
                //CB_list.RepeatDirection = RepeatDirection.Horizontal;//文字和框框對齊方式
                //_EmpData = GetCheckBoxListItem();
                //CB_list.RepeatColumns = 5;//一行的個數
                //                          //CB_list.TextAlign=
                //                          //CB_list.Width = 10;
                //                          //派發人員CheckBox項目設定
                //int i = 0;
                //foreach (DataRow dr in _EmpData.Rows)
                //{
                //    CB_list.Items.Add(dr["U_Name"].ToString());
                //}
                ////資源帳號下拉式選單項目
                //DataTable _ResourceItemData = new DataTable();
                //_ResourceItemData = GetDropDowmLisZ_Item();
                //Z_Item.DataSource = _ResourceItemData;
                //Z_Item.DataValueField = "Id";
                //Z_Item.DataTextField = "Value";
                //Z_Item.DataBind();
                ////交易狀態下拉式選單項目
                //DataTable Q_memberData = new DataTable();
                //Q_memberData = GetDropDowmListQ_memberItem();
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
    }
        else//按下派發案件後(單筆案件派發)
        {
            var U_NUM = MC.SelectedValue;//U_NUM
            var U_NAME = MC.SelectedItem;//U_NAME
        }
    }
    //派發人員
    //private DataTable GetCheckBoxListItem()
    //{
    //    //string Com_ID = "";
    //    //string SQL = "";
    //    string U_num;
    //    string ComID;
    //    U_num = Session["U_num"].ToString();
    //    ComID = Session["ComID"].ToString();
    //    string connectionStrings = "sqlConnectHG_Test_TEST";
    //    string tsql = "";
    //    if (U_num == "B9601151")
    //    {
    //        tsql = "select U_Num,U_Name From MUSER where LeaveDate is null and (U_MDEP='0002' or U_MDEP='0006' or U_MDEP='0007' or U_MDEP='0008' or U_MDEP='0011' or U_MDEP='0012') AND u_NUM<>'Z0000001' AND u_NUM<>'Z0000002' AND u_NUM<>'Z0000003' order by U_MDEP";
    //    }
    //    else if (ComID == "HG01")
    //    {
    //        tsql = "select U_Num,U_Name From MUSER where LeaveDate is null and (U_MDEP='0002' or U_MDEP='0006' ) AND u_NUM<>'Z0000001' AND u_NUM<>'Z0000002' AND u_NUM<>'Z0000003' order by U_MDEP";
    //    }
    //    else if (ComID == "HG02")
    //    {
    //        tsql = "select U_Num,U_Name From MUSER where LeaveDate is null and (U_MDEP='0007' or U_MDEP='0008' ) AND u_NUM<>'Z0000011' AND u_NUM<>'Z0000012' order by U_MDEP";
    //    }
    //    else if (ComID == "HG03")
    //    {
    //        tsql = "select U_Num,U_Name From MUSER where LeaveDate is null and (U_MDEP='0011' or U_MDEP='0012' ) AND u_NUM<>'Z0300001' AND u_NUM<>'Z0300002'  order by U_MDEP";
    //    }
    //    else if (ComID == "HG07")
    //    {
    //        tsql = "select U_Num,U_Name From MUSER where LeaveDate is null and (U_MDEP='0018' or U_MDEP='0019' ) AND u_NUM<>'Z7000001' AND u_NUM<>'Z7000002'  order by U_MDEP";
    //    }
    //    else if (ComID == "HG05")
    //    {
    //        tsql = "select U_Num,U_Name From MUSER where LeaveDate is null and (U_MDEP='0015' or U_MDEP='0016' ) AND u_NUM<>'Z0010001' AND u_NUM<>'Z0010002'  order by U_MDEP";
    //    }
    //    List<EmpDataEntity> empDatas = new List<EmpDataEntity>();
    //    EmpDataEntity empDataEntity = new EmpDataEntity();
    //    List<EmpDataEntity> empDatas_New = new List<EmpDataEntity>();
    //    SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString());
    //    DataTable dt = new DataTable();
    //    conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
    //    conn.Open();
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.Connection = conn;
    //    cmd.CommandText = tsql;
    //    SqlDataAdapter adapter = new SqlDataAdapter();
    //    adapter.SelectCommand = cmd;
    //    adapter.Fill(dt);


    //    //using (SqlDataReader sr = cmd.ExecuteReader())
    //    //    {
    //    //        while (sr.Read())
    //    //        {
    //    //            empDataEntity.U_Num = sr[0].ToString();
    //    //            empDataEntity.U_Name = sr[1].ToString();
    //    //            empDatas.Add(empDataEntity);

    //    //        }

    //    //    }
    //    //empDatas_New = ;
    //    conn.Close();
    //    //break;
    //    //return empDatas;


    //    return dt;


    //}
    //資源帳號
    //private DataTable GetDropDowmLisZ_Item()
    //{
    //    string U_num;
    //    string ComID;
    //    U_num = Session["U_num"].ToString();
    //    ComID = Session["ComID"].ToString();
    //    string connectionStrings = "sqlConnectHG_Test_TEST";
    //    SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString());
    //    DataTable dt = new DataTable();
    //    //dt.Columns.AddRange(new DataColumn[2] { new DataColumn("Id"), new DataColumn("Option") });
    //    //dt.Columns["Id"].DefaultValue = 0;
    //    dt.Columns.Add("Id", typeof(String));
    //    dt.Columns.Add("Value", typeof(String));
    //    //dt.Columns["Id"].DefaultValue = 0;
    //    if (U_num == "B9601151")
    //    {
    //        dt.Rows.Add("Z0000002", "營1資源A(黃)");
    //        dt.Rows.Add("Z0000003", "營1資源B(紅)");
    //        dt.Rows.Add("Z0010001", "營2資源A(黃)");
    //        dt.Rows.Add("Z0010002", "營2資源A(紅)");
    //        dt.Rows.Add("Z0000010", "推廣資源A(黃)");
    //        dt.Rows.Add("Z0000011", "推廣資源B(紅)");
    //        dt.Rows.Add("Z0300001", "資源A(黃)");
    //        dt.Rows.Add("Z0300002", "資源B(紅)");
    //        dt.Rows.Add("Z7000001", "財1資源A(黃)");
    //        dt.Rows.Add("Z7000002", "財1資源B(紅)");

    //    }
    //    else if (ComID == "HG01")
    //    {
    //        dt.Rows.Add("Z0000002", "營1資源A(黃)");
    //        dt.Rows.Add("Z0000003", "營1資源B(紅)");
    //    }
    //    else if (ComID == "HG05")
    //    {
    //        dt.Rows.Add("Z0010001", "營2資源A(黃)");
    //        dt.Rows.Add("Z0000002", "營2資源A(紅)");
    //    }
    //    else if (ComID == "HG02")
    //    {
    //        dt.Rows.Add("Z0000010", "推廣資源A(黃)");
    //        dt.Rows.Add("Z0000011", "推廣資源B(紅)");
    //    }
    //    else if (ComID == "HG03")
    //    {
    //        dt.Rows.Add("Z0300001", "財1資源A(黃)");
    //        dt.Rows.Add("Z0300002", "財1資源B(紅)");
    //    }
    //    else if (ComID == "HG02")
    //    {
    //        dt.Rows.Add("Z7000001", "財2資源A(黃)");
    //        dt.Rows.Add("Z7000002", "財2資源B(紅)");
    //    };

    //    return dt;
    //}
    //交易狀態

    private DataTable squeryTable(string keyword)
    {
        string Q_keyword = "";
        if (Session["Q_keyword"] != null)
        {
            Q_keyword = Session["Q_keyword"].ToString();//輸入查詢的關鍵字
        }                                              //  RepeatColumns = "5" RepeatDirection = "Horizontal"
        string sql_txt = "";
        sql_txt = sql_txt + " and (M_Num = '" + Q_keyword + "' or M_Name = '" + Q_keyword + "' or MTel1 = '" + Q_keyword + "'";
        sql_txt = sql_txt + " or MTel2 = '" + Q_keyword + "' or MTel3 = '" + Q_keyword + "'";
        sql_txt = sql_txt + " or ((OTel_Zone +  OTel = '" + Q_keyword + "')  ";
        sql_txt = sql_txt + " or (OTel_Zone1 +  OTel1 = '" + Q_keyword + "') ";
        sql_txt = sql_txt + " or (HTel_Zone +  HTel = '" + Q_keyword + "') ";
        sql_txt = sql_txt + " or (HTel_Zone1 +  HTel1 = '" + Q_keyword + "'))) ";
        tsql = "select MTel1, OTel1,HTel1,mg_count,m_name, mc_name from VRYGC where mc_com='" + Session["ComID"].ToString() + "' and del_tag = '0' " + sql_txt;//含關鍵字的SQL查詢語法

        //sql連線字串 webconfig的對應位置
        string connectionStrings = "sqlConnectHG_Test_TEST";
        //List<muserEntity> muserList
        //string connectionStrings = "sqlConnectHG_Test_TEST";
        List<muserEntity> DLData = new List<muserEntity>();
        muserEntity DLDataEntity = new muserEntity();
        //List<EmpDataEntity> empDatas_New = new List<EmpDataEntity>();
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
        return dt;

    }
    private DataTable GetDropDowmListQ_memberItem()
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

        dt.Rows.Add("", "不限");
        dt.Rows.Add("N", "無交易");
        dt.Rows.Add("Y", "有交易");




        return dt;
    }

    public string getRelativePath()
    {
        return "../../../";
    }
    public string getIP()
    {
        string IP = Session["IP"] == null ? "" : Session["IP"].ToString();
        return IP;

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
        DataTable _EmpData = new DataTable();
        //CB_list.RepeatDirection = RepeatDirection.Horizontal;//文字和框框對齊方式
        //_EmpData = GetCheckBoxListItem();
        //int num = _EmpData.Rows.Count;//資料筆數
        //int CB_list_Coumt = CB_list.Items.Count;//個數
        //DataTable dt = GetCheckBoxListItem();
        //List<string> Check = new List<string>();//有勾選的人名
        //for (int i = 0; i < num; i++)
        //{
        //    if (CB_list.Items[i].Selected)
        //    {
        //        Check.Add(_EmpData.Rows[i]["U_Num"].ToString());//有勾選的人名(工號)
        //                                                        //= dataTable.Rows[0]["ColumnNameOrIndex"];
        //    }
        //}
        ////取得派發筆數(Case_count)
        //int Case_count = 0;
        //Case_count = int.Parse(Case_count_TB.ToString());//派發筆數
        //AssignCase(Check, Case_count);//進行派發工作


        //foreach (var item in CB_list)
        //{

        //}
        //if (CB_list.Items[1].Selected == true)
        //{
        //    CB_list.Items[2].Selected = true;
        //}
    }
    //進行派發工作
    private void AssignCase(List<string> check, int case_count)
    {
        string tsql = "select * from MRYGC where MRYGC_ID='9000066585'";
        string connectionStrings = "sqlConnectHG_Test_TEST";
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
        foreach (var item in check)
        {

        }
        throw new NotImplementedException();
    }



    //查詢案件
    protected void Button2_Click1(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:checknull(); ", true);
        Server.Transfer("MCMRYGC_squery.aspx");
    }
    //設定GridView中的DropDownList
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //宣告DropDownList
        DropDownList GV_DDL1;
        string sql = "";
        DataView dv;
        string U_num;
        string ComID;
        U_num = Session["U_num"].ToString();
        ComID = Session["ComID"].ToString();
        //要特別注意一下這邊，如果不用這個if包起來的話，RowDataBound會跑Header，Footer，Pager
        //我們的DropDownList是放在DataRow裡，所以只有在這邊才會找到DropDownList控制項
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //用FindControl(你的DropDownList的ID)，來找我們的DropDownList，記得要轉型喔!
            GV_DDL1 = (DropDownList)e.Row.FindControl("GV_DDL1");
            //string U_num;
            //string ComID;
            //U_num = Session["U_num"].ToString();
            //ComID = Session["ComID"].ToString();
            //string sql;
            if (ComID == "HG01")
            {
                sql = "select U_Num,U_Name,COMID From MUSER where LeaveDate is null and (U_MDEP='0002' or U_MDEP='0006' ) AND u_NUM<>'Z0000001' AND u_NUM<>'Z0000002' AND u_NUM<>'Z0000003' order by U_MDEP";
            }
            else if (ComID == "HG02")
            {
                sql = "select  U_Num,U_Name,COMID From MUSER where LeaveDate is null and (U_MDEP='0007' or U_MDEP='0008' ) AND u_NUM<>'Z0000011' AND u_NUM<>'Z0000012' order by U_MDEP";
            }
            else if (ComID == "HG03")
            {
                sql = "";
            }
            else if (ComID == "HG05")
            {
                sql = "select U_Num,U_Name,COMID From MUSER where LeaveDate is null and (U_MDEP='0015' or U_MDEP='0016' ) AND u_NUM<>'Z0010001' AND u_NUM<>'Z0010002'  order by U_MDEP";
            }
            //  sql = "select tp,tpname from itemtp";
            dv = GetDV(sql);
            //繫結DropDownList
            GV_DDL1.DataSource = dv;


            //DropDownList要顯示的內容
            GV_DDL1.DataTextField = "U_Name";

            //DropDownList顯示內容對應的值
            GV_DDL1.DataValueField = "U_Num";
            GV_DDL1.DataBind();
            GV_DDL1.Items.Insert(0, new ListItem("請選擇", "NA"));//加入預設選項
        }
    }
    private DataView GetDV(string sql)
    {
        //string U_num;
        //string ComID;
        //U_num = Session["U_num"].ToString();
        //ComID = Session["ComID"].ToString();
        //string SqlConStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
        string connectionStrings = "sqlConnectHG_Test_TEST";
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString());
        DataView dv;
        SqlDataAdapter sqlAdp = new SqlDataAdapter();
        SqlCommand cmd;
        DataSet ds = new DataSet();
        conn.Open();
        cmd = new SqlCommand(sql, conn);
        sqlAdp.SelectCommand = cmd;
        sqlAdp.Fill(ds);
        dv = new DataView(ds.Tables[0]);
        conn.Close();
        return dv;

    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //GridView1.DataSource = squeryTable(keyword);
        //GridView1.PageIndex = e.NewPageIndex;
        //GridView1.DataBind();
    }

    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        //GridView1.PageIndex = e.NewPageIndex;
        //GridView1.DataBind();
    }
    //取得有被勾選的資料列
    protected void Button2_Click(object sender, EventArgs e)
    {
        DataTable selected = new DataTable();
        selected = GetSelectedRecords();
        //新增派發紀錄到MRYGC
    }


    //取得勾選的項目
    protected DataTable GetSelectedRecords()
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[2] { new DataColumn("Name"), new DataColumn("Country") });
        //foreach (GridViewRow row in GridView1.Rows)
        //{
        //    if (row.RowType == DataControlRowType.DataRow)
        //    {
        //        CheckBox chkRow = (row.Cells[0].FindControl("GV1_CheckBox") as CheckBox);
        //        if (chkRow.Checked)
        //        {
        //            string name = row.Cells[5].Text;
        //            //string country = (row.Cells[2].FindControl("GV1_CheckBox") as Label).Text;
        //            dt.Rows.Add(name);
        //        }
        //    }
        //}
        var temp = dt;
        return dt;
        //gvSelected.DataSource = dt;
        //gvSelected.DataBind();
    }

    protected void Button2_Click2(object sender, EventArgs e)
    {

    }
}

