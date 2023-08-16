using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
//電話統計列表
public partial class Manage_Form_SRMVENU_SRMVENU_query : System.Web.UI.Page
{
    private string MS_ID = string.Empty;
    private string MENU_no = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Main.DataSource = GetMainData("");
            //Main.DataBind();
            //Main.PageIndex = 0;//預設頁面
            //取得所有分析師

            //DropDownList.
            //string U_MDEP = Session["U_MDEP"].ToString();
            //MP_ITem_DDL.DataSource = GetDropListItem();
            //DropDownList要顯示的內容
            //MP_ITem_DDL.DataTextField = "U_Name";
            //DropDownList顯示內容對應的值
            //MP_ITem_DDL.DataValueField = "U_Num";
            //MP_ITem_DDL.DataBind();
            //MP_ITem_DDL.Items.Insert(0, new ListItem("請選擇分析師", "NA"));//加入預設選項
        }
        else
        {
            string Analyst = "";
            if(Session["Analyst"]!=null)
            {
                Analyst = Session["Analyst"].ToString();
            }
            //Main.DataSource = GetMainData(Analyst);
            //Main.DataBind();
            //取得所有分析師
            //String U_MDEP = Session["U_MDEP"].ToString();
            //MP_ITem_DDL.DataSource = GetDropListItem();
            //DropDownList要顯示的內容
            //MP_ITem_DDL.DataTextField = "U_Name";
            //DropDownList顯示內容對應的值
            //MP_ITem_DDL.DataValueField = "U_Num";
            //MP_ITem_DDL.DataBind();
            //MP_ITem_DDL.Items.Insert(0, new ListItem("請選擇分析師", "NA"));//加入預設選項
        }
    }
    //取得所有分析師
    private DataTable GetDropListItem()
    {
        //string Com_ID = "";
        //string SQL = "";
        string U_num;
        string ComID;
        U_num = Session["U_num"].ToString();
        ComID = Session["ComID"].ToString();
        String U_MDEP = Session["U_MDEP"].ToString();
        string connectionStrings = "sqlConnectHG_Test_TEST";
        string tsql;
        if (U_MDEP == "0002" && U_MDEP == "0006" && U_MDEP == "0007" && U_MDEP == "0008")
        {
            tsql = "select U_Num,U_Name From MUSER  where U_Position = '0005' and Comid='" + ComID + "' and LeaveDate is null";
        }
        else
        {
            tsql = "select U_Num,U_Name From MUSER  where U_Position = '0005' and LeaveDate is null";
        }

        //List<EmpDataEntity> empDatas = new List<EmpDataEntity>();
        //EmpDataEntity empDataEntity = new EmpDataEntity();
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
    //取得主要資料
    private void GetMainData()
    {
        DataTable dt = new DataTable();
        string connectionStrings = "sqlConnectHG_Test_TEST";
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString());
        //DataTable dt = new DataTable();
        conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
        conn.Open();
        string tsql = "select a.MT_Date ,c.U_Name ,c.U_Num,d.ddesc ,b.P_Channel ,b.P_Time ,b.P_Date ,b.P_Name ,a.MT_Okey ,a.MT_Nkey ,e.U_Name from MMTEL as a  left join WProgram as b on a.MT_Program=b.P_ID left join MITEM as d on b.P_Item=d.ditcode left join MUSER as c on a.MT_Teacher=c.U_Num left join MUSER as e on a.add_user=e.U_Num where a.del_tag = '0' and d.mitcode='PROGM' order by a.add_date desc";
        //依照權限取得不同資料
        //        if session("U_MDEP") = "0002" OR session("U_MDEP")= "0006"  OR session("U_MDEP")= "0015"  OR session("U_MDEP")= "0016" THEN
        //       tsql = "select * from MMTEL where del_tag = '0' and (MT_Teacher_com = 'HG01' OR MT_Teacher_com = 'HG05')" & sql_txt & " order by Add_date desc"
        //elseif session("U_MDEP")= "0007" OR session("U_MDEP")= "0008" or session("U_MDEP")= "0011" OR session("U_MDEP")= "0012"  OR session("U_MDEP")= "0013"  OR session("U_MDEP")= "0014" THEN
        //        tsql = "select * from MMTEL where del_tag = '0' and MT_Teacher_com = '" & session("ComID") & "'" & sql_txt & " order by Add_date desc"
        //else
        //            tsql = "select * from MMTEL where del_tag = '0' " & sql_txt & " order by Add_date desc"
        //END IF
        string U_MDEP = "";
        string ComID = "";
        U_MDEP = Session["U_MDEP"].ToString();
        ComID = Session["ComID"].ToString();
        //string sql_txt = "";
        //觀看權限設定
        //if (U_MDEP=="0002" || U_MDEP == "0006" || U_MDEP == "0015" || U_MDEP == "0016")
        //{
        //    tsql = "select * from MMTEL where del_tag = '0' and (MT_Teacher_com = 'HG01' OR MT_Teacher_com = 'HG05')" & sql_txt & " order by Add_date desc";
        //}
        //判斷是否有指定分析師
        //else if(U_MDEP == "0007" || U_MDEP == "0008" || U_MDEP == "0011" || U_MDEP == "0012" || U_MDEP == "0013" || U_MDEP == "0014")
        //{
        //    tsql = "select * from MMTEL where del_tag = '0' and MT_Teacher_com = '" + ComID + "'" & sql_txt & " order by Add_date desc";
        //}
        //else
        //{
        //  tsql = "select * from MMTEL where del_tag = '0'  order by Add_date desc";
        //}
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = tsql;
        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand = cmd;
        adapter.Fill(dt);
        conn.Close();
        //Main.DataSource = dt;
        //Main.DataBind();

        //return dt;
    }

    private DataTable GetMainData(string Analyst)
    {
        DataTable dt = new DataTable();//從資料庫取出的資料
        if (Analyst.Trim()!="請選擇分析師")
        { //}
        //Analyst:分析師的員工編號
        //DataTable dt = new DataTable();//從資料庫取出的資料
        string connectionStrings = "sqlConnectHG_Test_TEST";
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString());
        //DataTable dt = new DataTable();
        conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
        conn.Open();
        string tsql = "";
        if(Analyst !="")
        {
            tsql = "select a.MT_Date ,c.U_Name ,c.U_Num,d.ddesc ,b.P_Channel ,b.P_Time ,b.P_Date ,b.P_Name ,a.MT_Okey ,a.MT_Nkey ,e.U_Name from MMTEL as a  left join WProgram as b on a.MT_Program=b.P_ID left join MITEM as d on b.P_Item=d.ditcode left join MUSER as c on a.MT_Teacher=c.U_Num left join MUSER as e on a.add_user=e.U_Num where a.del_tag = '0' and d.mitcode='PROGM' and c.U_Name='"+ Analyst + "' order by a.add_date desc";
        }
        else { 
        
            tsql = "select a.MT_Date ,c.U_Name ,c.U_Num,d.ddesc ,b.P_Channel ,b.P_Time ,b.P_Date ,b.P_Name ,a.MT_Okey ,a.MT_Nkey ,e.U_Name from MMTEL as a  left join WProgram as b on a.MT_Program=b.P_ID left join MITEM as d on b.P_Item=d.ditcode left join MUSER as c on a.MT_Teacher=c.U_Num left join MUSER as e on a.add_user=e.U_Num where a.del_tag = '0' and d.mitcode='PROGM' order by a.add_date desc";
        }
        //MP_ITem_DDL.SelectedValue = "請選擇";
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = tsql;
        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand = cmd;
        adapter.Fill(dt);
          //  conn.Close();

            if (dt.Rows.Count==0)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('查無資料!');", true);
        }


        //新建DataTable("Table_New");(來源dt)
        //https://javapig.pixnet.net/blog/post/48216502-c%23--datarow-%26-datacolumn
        DataTable dt_New = new DataTable("Table_New");//新建的datatable
        DataColumn workCol1 = dt_New.Columns.Add("No", typeof(System.String));
        DataColumn workCol2 = dt_New.Columns.Add("MT_Date", typeof(System.String));//日期
        DataColumn workCol3 = dt_New.Columns.Add("U_Name", typeof(System.String));//分析師
        DataColumn workCol4 = dt_New.Columns.Add("U_Num", typeof(System.String));
        DataColumn workCol5 = dt_New.Columns.Add("ddesc", typeof(System.String));///節目種類
        DataColumn workCol6 = dt_New.Columns.Add("P_Channel", typeof(System.String));
        DataColumn workCol7 = dt_New.Columns.Add("P_Date", typeof(System.String));
        DataColumn workCol8 = dt_New.Columns.Add("Name&Date", typeof(System.String));//節目名稱和時段
        DataColumn workCol9 = dt_New.Columns.Add("MT_Okey", typeof(System.String));//可key
        DataColumn workCol10 = dt_New.Columns.Add("MT_Nkey", typeof(System.String));//不可key
        DataColumn workCol11 = dt_New.Columns.Add("U_Name1", typeof(System.String));//建檔人員
        //dt_New.Columns.Add(workCol1);
        //dt_New.Columns.Add(workCol2);
        //dt_New.Columns.Add(workCol3);
        //dt_New.Columns.Add(workCol4);
        //dt_New.Columns.Add(workCol5);
        //dt_New.Columns.Add(workCol6);
        //dt_New.Columns.Add(workCol7);
        //dt_New.Columns.Add(workCol8);
        //dt_New.Columns.Add(workCol9);
        //dt_New.Columns.Add(workCol10);
        //dt_New.Columns.Add(workCol11);
        int i = 0;
        foreach (DataRow dr in dt.Rows)
        {
            DataRow row;
            row = dt_New.NewRow();
            row["No"] = i.ToString();
            row["MT_Date"] = dt.Rows[i]["MT_Date"].ToString();
            if (dt.Rows[0]["U_Name"].ToString() == "劉&#23032;希")
            {
                row["U_Name"] = "劉妍希";
                
            }
            else
            {
                row["U_Name"] = dt.Rows[0]["U_Name"].ToString();
                
            }
            //row["U_Name"] = dt.Rows[i]["U_Name"].ToString();
            row["U_Num"] = dt.Rows[i]["U_Num"].ToString();
            row["ddesc"] = dt.Rows[i]["ddesc"].ToString();
            row["P_Channel"] = dt.Rows[i]["P_Channel"].ToString();
            row["P_Date"] = dt.Rows[i]["P_Date"].ToString();
            //b.P_Date ,b.P_Name
            row["Name&Date"] ="["+ dt.Rows[i]["P_Channel"].ToString()+"]"+ dt.Rows[i]["P_Time"].ToString() + dt.Rows[i]["P_Date"].ToString(); 
            row["MT_Okey"] = dt.Rows[i]["MT_Okey"].ToString();
            row["MT_Nkey"] = dt.Rows[i]["MT_Nkey"].ToString();
            row["U_Name1"] = dt.Rows[i]["U_Name1"].ToString();
            dt_New.Rows.Add(row);
            i++;
        }
            //DataRow row;
            //row = dt_New.NewRow();
            //row["No"] = "1";
            //row["MT_Date"] = dt.Rows[0]["MT_Date"].ToString();
            //if (dt.Rows[0]["U_Name"].ToString() == "劉&#23032;希")
            //{
            //    row["U_Name"] = dt.Rows[0]["U_Name"].ToString();
            //}
            //else
            //{
            //    row["U_Name"] = "劉妍希";
            //}
            //row["U_Num"] = dt.Rows[0]["U_Num"].ToString();
            //row["ddesc"] = dt.Rows[0]["ddesc"].ToString();
            //row["P_Channel"] = dt.Rows[0]["P_Channel"].ToString();
            //row["P_Date"] = dt.Rows[0]["P_Date"].ToString();
            //row["P_Name"] = dt.Rows[0]["P_Name"].ToString();
            //row["MT_Okey"] = dt.Rows[0]["MT_Okey"].ToString();
            //row["MT_Nkey"] = dt.Rows[0]["MT_Nkey"].ToString();
            //row["U_Name1"] = dt.Rows[0]["U_Name1"].ToString();
            //dt_New.Rows.Add(row);
            //row["MT_Date"] = dt_New.Rows[0]["MT_Nkey"].ToString();
            //row["MT_Date"] = dt_New.Rows[0]["U_Name1"].ToString();
            //   }
            conn.Close();
        return dt_New;
    }
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

    //按下查詢紐
    protected void Query_Click(object sender, EventArgs e)
    {
        //string connectionStrings = "sqlConnectHG_Test_TEST";
        //string selectValue = MP_ITem_DDL.SelectedValue.ToString();//分析師的員工編號
        //string tsql = "";
        //string teacher = MP_ITem_DDL.SelectedItem.ToString();//分析師的姓名
        //SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString());
        //DataTable dt = new DataTable();
        //dt = GetMainData(selectValue);
        //Main.DataSource = dt;
        //Main.DataBind();
        //DropDownList ddl = MP_ITem_DDL;

        //string val = MP_ITem_DDL.SelectedItem.ToString();//選到的分析師
        //string val= MP_ITem_DDL.SelectedItem.Text;//選到的分析師
        //Session["U_MDEP"] = val;//選到的分析師
        //Main.DataSource = GetMainData(val);
        //Main.DataBind();
        ////取得所有分析師
        //String U_MDEP = Session["U_MDEP"].ToString();
        //MP_ITem_DDL.DataSource = GetDropListItem();
        ////DropDownList要顯示的內容
        //MP_ITem_DDL.DataTextField = "U_Name";
        ////DropDownList顯示內容對應的值
        //MP_ITem_DDL.DataValueField = "U_Num";
        //MP_ITem_DDL.DataBind();
        //MP_ITem_DDL.Items.Insert(0, new ListItem("請選擇分析師", "NA"));//加入預設選項


    }

    protected void Main_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //GridView1.DataSource = squeryTable(keyword);
       // Main.PageIndex = e.NewPageIndex;
      //  Main.DataBind();
    }

    protected void MP_ITem_DDL_DataBound(object sender, EventArgs e)
    {
        //MP_ITem_DDL.DataSource = GetDropListItem();
        ////DropDownList要顯示的內容
        //MP_ITem_DDL.DataTextField = "U_Name";
        ////DropDownList顯示內容對應的值
        //MP_ITem_DDL.DataValueField = "U_Num";
        //MP_ITem_DDL.DataBind(); 
        //string val = MP_ITem_DDL.SelectedItem.ToString();
        //MP_ITem_DDL.Items.Insert(0, new ListItem("請選擇分析師", "NA"));//加入預設選項
    }

    protected void MP_ITem_DDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Reference the DropDownList.

       // string selected = MP_ITem_DDL.SelectedItem.Text;//選到的分析師
       // DropDownList dropDownList = sender as DropDownList;
       
       //   Session["Analyst"]= selected;
       //Main.DataSource= GetMainData(selected);
       // Main.DataBind();
       //Get the ID of the DropDownList.


        ////Display the Selected Text of DropDownList.
        //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + dropDownList.SelectedItem.Text + "');", true);
        //string TEMP = MP_ITem_DDL.SelectedItem.Text;
        //MP_ITem_DDL.DataSource = GetDropListItem();
        //DropDownList ddl = MP_ITem_DDL;
        //string val = ddl.SelectedItem.ToString();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Server.Transfer("MPMMTEL_add.aspx");//轉向電話統計-新增
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        //string val = MP_ITem_DDL.SelectedItem.Text;//選到的分析師
        //Session["U_MDEP"] = val;//選到的分析師
        //Main.DataSource = GetMainData(val);
        //Main.DataBind();
        ////取得所有分析師
        //String U_MDEP = Session["U_MDEP"].ToString();
        //Session["MP_ITem_DDL_SelectedItem"] = MP_ITem_DDL.SelectedIndex;
        //MP_ITem_DDL.DataSource = GetDropListItem();
        ////DropDownList要顯示的內容
        //MP_ITem_DDL.DataTextField = "U_Name";
        ////DropDownList顯示內容對應的值
        //MP_ITem_DDL.DataValueField = "U_Num";
        //MP_ITem_DDL.DataBind();
        ////MP_ITem_DDL.SelectedValue = val;
        //MP_ITem_DDL.SelectedIndex = int.Parse(Session["MP_ITem_DDL_SelectedItem"].ToString());
    }
}