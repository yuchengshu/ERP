using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

/// <summary>
/// MMBERjoinMCOTFhgSql 的摘要描述
/// </summary>
public class MMBERjoinMCOTFhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MMBERjoinMCOTFhgSql _instanct = new MMBERjoinMCOTFhgSql();
    public static MMBERjoinMCOTFhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MMBERjoinMCOTFhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public string GetValueBYSQL(SqlConnection conn, string commandText)
    {
        string value = "";
        //using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        using (SqlConnection conn_ = conn)

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

            adapter.Fill(dt);//取出所有會場編號

            //int V_ID_Count = dt.Rows.Count;
            foreach (DataRow row in dt.Rows)
            {
                //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
                value = row[0].ToString();
            }
            conn.Close();
            adapter.Dispose();
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
    }
    public List<businessConnectionDataEntity> getBusinessConnectionList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<businessConnectionDataEntity> bcdeList = new List<businessConnectionDataEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        //這裡整理資料!!!!20230131work
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(); 
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            businessConnectionDataEntity bcde = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    bcde = new businessConnectionDataEntity();
                    bcde.M_ID = sr[0].ToString().Trim();//單號
                    bcde.Obj = sr[1].ToString().Trim();//件別代號
                    //取得件別代號名稱
                    string GetObj_Name = "select ddesc from MITEM where mitcode = 'MTOBJ' and ditcode <> '0000' and del_tag = '0'  and ditcode='" + bcde.Obj + "'";
                    using (SqlConnection conn2 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
                    {
                        bcde.ObjName = GetValueBYSQL(conn2, GetObj_Name);//件別代號名稱
                    }
                    bcde.Light_Status = sr[2].ToString().Trim();//燈號
                    bcde.Contact = sr[3].ToString().Trim();//聯絡單種類
                    string Contact_Name = "select ddesc from MITEM where mitcode = 'MCOTF' and ditcode <> '0000' and del_tag = '0' and ditcode='" + bcde.Contact + "'";//聯絡單種類名稱
                    using (SqlConnection conn2 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
                    {
                        bcde.Contact_Name = GetValueBYSQL(conn2, Contact_Name);//聯絡單種類名稱
                    }
                    bcde.MC = sr[4].ToString().Trim();//分析師代號
                    //取得分析師名稱
                    string MC_Name = "select U_Name from MUSER where U_Num ='" + bcde.MC + "'";
                    using (SqlConnection conn2 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
                    {
                        bcde.MC_Name = GetValueBYSQL(conn2, MC_Name);//分析師名稱
                    }
                    bcde.Name = sr[5].ToString().Trim();//會員姓名
                    bcde.Propser_DEPT=sr[6].ToString().Trim();//提案人部門代號
                    string Dept = "";//提案人部門名稱
                    //取得提案人部門名稱
                    string GetPropser_DEPT_Name = "select ddesc from MITEM where mitcode = 'COMID' and ditcode <> '0000' and del_tag = '0' and ditcode='" + bcde.Propser_DEPT + "'";
                    using (SqlConnection conn2 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
                    {
                        var Com_Dept = GetValueBYSQL(conn2, GetPropser_DEPT_Name);//提案人公司部門名稱
                        //華冠-營1
                        if (Com_Dept.Contains('-'))
                        {
                            Dept= Com_Dept.Split('-')[1];
                        }
                        else
                        { }
                        //var ComDept = Com_Dept.Split('-');
                        bcde.Propser_DEPT = Dept;//提案人部門中文名稱
                    }
                    bcde.Propser = sr[6].ToString().Trim();//提案人部門編號
                    bcde.Date = sr[7].ToString().Trim();//提案日期
                    var Propser_Unum = sr[7].ToString().Trim();//提案人員工編號
                    //組成提案人部門中文名稱+提案人員工姓名
                    string GetPropser_UName = "SELECT [U_Name] FROM [HG].[dbo].[MUSER] where U_Num='"+ Propser_Unum + "'";
                    //
                    using (SqlConnection conn2 = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
                    {
                        var Propser_UName = GetValueBYSQL(conn2, GetPropser_UName);//提案人中文名稱
                        bcde.Propser = "[" + Dept + "]" + Propser_UName;//部門+提案人姓名
                        //bcde.Propser_Unum = Propser_UName;//提案人部門中文名稱
                    }
                    //

                    bcde.Date = sr[8].ToString().Trim();//提案日期
                    //狀態
                    bcde.U_LeaderName = sr[9].ToString().Trim();//單(姓名)
                    bcde.U_LeaderStatus = sr[10].ToString().Trim();//單(核可狀態)
                    if(bcde.U_LeaderStatus=="1")
                    {
                        bcde.U_LeaderStatus = "<font color=green>核准</font>";
                    }
                    else if (bcde.U_LeaderStatus == "2")
                    {
                        bcde.U_LeaderStatus = "<font color=red>退回</font>";
                    }
                    else
                    {
                        bcde.U_LeaderStatus = "<font color=GRAY>未簽核</font>";
                    }

                    bcde.EX_Name = sr[11].ToString().Trim();//行(姓名)
                    bcde.EX_Status = sr[12].ToString().Trim();//行(核可狀態)
                    if (bcde.EX_Status == "1")
                    {
                        bcde.EX_Status = "<font color=green>核准</font>";
                    }
                    else if (bcde.EX_Status == "2")
                    {
                        bcde.EX_Status = "<font color=red>退回</font>";
                    }
                    else
                    {
                        bcde.EX_Status = "<font color=GRAY>未簽核</font>";
                    }
                    //U_LeaderStatusName
                    bcde.EX_LeaderName = sr[13].ToString().Trim();//主(姓名)
                    bcde.EX_LeaderStatus = sr[14].ToString().Trim();//主(核可狀態)
                    if (bcde.EX_LeaderStatus == "1")
                    {
                        bcde.EX_LeaderStatus = "<font color=green>核准</font>";
                    }
                    else if (bcde.EX_LeaderStatus == "2")
                    {
                        bcde.EX_LeaderStatus = "<font color=red>退回</font>";
                    }
                    else
                    {
                        bcde.EX_LeaderStatus = "<font color=GRAY>未簽核</font>";
                    }
                    //Propser_DEPT_Name提案人部門名稱
                    //bcde.Obj = sr[14].ToString().Trim();
                    var Statsus = sr[19].ToString().Trim();//狀態
                    var F_id=sr[20].ToString().Trim(); //F_id
                    bcde.f_id=F_id;
                    if (Statsus.Trim()=="1")
                    {
                        bcde.F_Status = "<FONT COLOR=GRAY>處理中</FONT>";
                    }
                    else if(Statsus.Trim() == "2")
                    {
                        bcde.F_Status = "<font color=red>處理失敗</font>";
                    }
                    else if(Statsus.Trim() == "3")
                    {
                        bcde.F_Status = "已完成";
                    }
                    //bcde.F_Status = sr[15].ToString().Trim();
                    bcdeList.Add(bcde);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'bcdeList' : "+bcdeList.ToString(), className, methodName);
        return bcdeList;
    }
}