using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_User_Muser_MenuSetup : System.Web.UI.Page
{
    private string MS_ID = string.Empty;
    private string MENU_no = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {

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

    public string getU_Num()
    {
        string U_Num = Context.Request["U_Num"];//所選到的員工編號
        //sql連線字串 webconfig的對應位置
        //private static string connectionStrings = "sqlConnectHG_Test";
        //string U_Num = "";
        //取得此類別名稱
        string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        //U_Num= context.Request["U_Num"];
        //U_Num = Session["U_Num"] == null ? "" : Session["U_Num"].ToString();


        log.endWrite("'U_Num' : " + U_Num, className, methodName);
        return U_Num;
    }

    public string getU_Name()
    {
        string U_Num = Context.Request["U_Num"];//所選到的員工編號
        string sqlCommand = "SELECT U_Name From MUSER where U_Num='" + U_Num+"'";
        string U_Name = GetValueBYSQL(sqlCommand);
        //sql連線字串 webconfig的對應位置
        //private static string connectionStrings = "sqlConnectHG_Test";
        //string U_Num = "";
        //取得此類別名稱
        string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        //U_Num= context.Request["U_Num"];
        //U_Num = Session["U_Num"] == null ? "" : Session["U_Num"].ToString();


        log.endWrite("'U_Num' : " + U_Num, className, methodName);
        return U_Name;
    }

    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";
    public string GetValueBYSQL(string commandText)
    {
        string value = "";
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            

            //conn.ConnectionString = connectionStrings;
            conn.Open();
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
            foreach (DataRow row in dt.Rows)
            {
                //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
                value = row[0].ToString();
            }
            conn.Close();
        }
        return value;
    }
}