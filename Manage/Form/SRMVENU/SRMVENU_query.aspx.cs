using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Form_SRMVENU_query : System.Web.UI.Page
{
    private string MS_ID = string.Empty;
    private string MENU_no = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //SRMVENUH_DDL.DataSource = GetDropListItem();
            ////DropDownList要顯示的內容
            //SRMVENUH_DDL.DataTextField = "U_Name";
            ////DropDownList顯示內容對應的值
            //SRMVENUH_DDL.DataValueField = "U_Num";
            //SRMVENUH_DDL.DataBind();
            //string val = SRMVENUH_DDL.SelectedItem.ToString();//所選到的日期
            //SRMVENUH_DDL.Items.Insert(0, new ListItem("請選擇分析師", "NA"));//加入預設選項
        }
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
        return Request.Params["MENU_no"].ToString();
    }

    protected void MP_ITem_DDL_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    //查詢
    protected void Button5_Click(object sender, EventArgs e)
    {
       // DateTime selectedday = Calendar1.SelectedDate;//所選的日期
        //string val = SRMVENUH_DDL.SelectedItem.ToString();//所選的分析師的名稱

    }

    protected void MP_ITem_DDL_DataBound(object sender, EventArgs e)
    {
        //SRMVENUH_DDL.DataSource = GetDropListItem();
        ////DropDownList要顯示的內容
        //SRMVENUH_DDL.DataTextField = "U_Name";
        ////DropDownList顯示內容對應的值
        //SRMVENUH_DDL.DataValueField = "U_Num";
        //SRMVENUH_DDL.DataBind();    
        //string val = SRMVENUH_DDL.SelectedItem.ToString();
        //SRMVENUH_DDL.Items.Insert(0, new ListItem("請選擇分析師", "NA"));//加入預設選項
    }

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

    protected void MP_ITem_DDL_Init(object sender, EventArgs e)
    {

    }



    protected void SRMVENUH_DDL_DataBound(object sender, EventArgs e)
    {

    }

    protected void SRMVENUH_DDL_Init(object sender, EventArgs e)
    {

    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //if (Calendar1.Visible == false)
        //    Calendar1.Visible = true;
        //else
        //    Calendar1.Visible = false;
        //MeetingDate.Text = Calendar1.SelectedDate.ToString();

    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        //DateTime selectedday = Calendar1.SelectedDate;//所選的日期
        //int year = selectedday.Year;
        //int month = selectedday.Month;
        //int day = selectedday.Day;
        ////Year.Text = year.ToString();
        ////Month.Text = month.ToString();
        ////Day.Text = day.ToString();
        //Calendar1.Visible=false;
    }
}