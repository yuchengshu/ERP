using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

/// <summary>
/// MSYSKhgDao 的摘要描述
/// </summary>
public class MSYSKhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MSYSKhgDao _instance = new MSYSKhgDao();
    public static MSYSKhgDao Instance
    {
        get
        {
            return _instance;
        }
    }

    public MSYSKhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
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
        foreach (DataRow datarow in ds.Tables[0].Rows)
        {
            value = datarow[0].ToString();
            //每個資料列的內容

        }

        //int V_ID_Count = dt.Rows.Count;
        /*
         *  foreach (DataRow row in dt.Rows)
        {
            //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
            value = row[0].ToString();
        }
        conn.Close();
         */
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
    //取得全部資料
    public List<SRMSYSKentity> getSRMSYSKList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string commandText = string.Empty;
        commandText = "select U_Name, b.File_Title,b.File_num,'../../../UploadFile/msysk/' + b.File_Name File_Name,File_num,b.add_date,a.MF_ID,'<A class=bluelink10 href=\"../ ../../UploadFile/msysk/' + b.File_Name + 'target = ' + b.File_num + ' > ' + b.File_Title + '</A>' File_Path from MSYSK a left join Upload_File b on a.MF_ID = b.File_num left join MUSER c on a.MP = c.U_Num order by add_date desc";
        List<SRMSYSKentity> MSYSKList = MSYSKhgSql.Instance.getSRMSYSKList(connectionStrings, commandText);//<===
        log.endWrite("'MSYSKList' :" + MSYSKList.ToString(), className, methodName);

        return MSYSKList;
    }

    public string addSRMSYSKData(string MP, string FileName, string add_user, string add_IP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MP' :" + MP + "'FileName' :" + FileName + "'add_user' :" + add_user + "'add_IP' :" + add_IP, className, methodName);
        //產收MP_COM
        string GetMP_Com = "SELECT ComID from MUSER where U_Num='" + MP + "'";
        // MF_ID = common.year + common.month + common.day + common.hour + common.minute + common.second + "_" + common.getRandom1();
        string MF_ID = common.year + common.month + common.day + common.hour + common.minute + common.second + "_" + common.getRandom1();
        string backStr = "";
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            string MP_Com = GetValueBYSQL(conn, GetMP_Com);
            //產生MF_ID,用來回傳當給Upload_File用
            string commandText = "insert into MSYSK(MF_ID,MP,MP_Com,add_date,add_user,add_ip) VALUES('{0}','{1}','{2}',GETDATE(),'{3}','{4}')";
            StringBuilder sb = new StringBuilder();
            sb.Append(string.Format(commandText, MF_ID, MP, MP_Com, add_user, add_IP));
            backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sb.ToString());
        }
        //產生MF_ID,用來回傳當給Upload_File用

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return MF_ID;
    }



    //加入條件(分析師編號:Q_Analyst)
    public List<SRMSYSKentity> getSRMSYSKList(string Q_Analyst)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string commandText = string.Empty;
        if (Q_Analyst.Length == 0)
        {
            Q_Analyst = "";
        }
        if (Q_Analyst == "")
        {
            Q_Analyst = "";
        }
        if (string.IsNullOrEmpty(Q_Analyst))
        {
            Q_Analyst = "";
        }
        if (Q_Analyst.ToString() == "null")
        {
            Q_Analyst = "";
        }
        if (!string.IsNullOrEmpty(Q_Analyst))
        {
            commandText = "select U_Name, b.File_Title,b.File_num,'../../../UploadFile/msysk/' + b.File_Name File_Name,File_num,b.add_date,a.MF_ID,'<A class=bluelink10 href=\"../ ../../UploadFile/msysk/' + b.File_Name + 'target = ' + b.File_num + ' > ' + b.File_Title + '</A>' File_Path from MSYSK a left join Upload_File b on a.MF_ID = b.File_num left join MUSER c on a.MP = c.U_Num where c.U_num='" + Q_Analyst + "' and a.del_tag=0 order by add_date desc";
        }
        else
        {
            commandText = "select U_Name, b.File_Title,b.File_num,'../../../UploadFile/msysk/' + b.File_Name File_Name,File_num,b.add_date,a.MF_ID,'<A class=bluelink10 href=\"../ ../../UploadFile/msysk/' + b.File_Name + 'target = ' + b.File_num + ' > ' + b.File_Title + '</A>' File_Path from MSYSK a left join Upload_File b on a.MF_ID = b.File_num left join MUSER c on a.MP = c.U_Num where a.del_tag=0 order by add_date desc";
        }
        List<SRMSYSKentity> MSYSKList = MSYSKhgSql.Instance.getSRMSYSKList(connectionStrings, commandText);//<===
        log.endWrite("'MSYSKList' :" + MSYSKList.ToString(), className, methodName);

        return MSYSKList;
    }
    public List<MSYSKentity> getOItable(searchOItableParamEntity soitp)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'soitp' :" + soitp.ToString(), className, methodName);

        string commandText = string.Empty;
        string U_MDEP = soitp.U_MDEP;
        string sql_txt = getSqlTxt.getOItable(soitp.MP, soitp.StartDate, soitp.EndDate);

        if (U_MDEP == "0002" || U_MDEP == "0006" || U_MDEP == "0015" || U_MDEP == "0016")
        {
            commandText = "select MF_ID,MP from MSYSK where del_tag = '0' " + sql_txt + " and (mp_com='HG01' OR mp_com='HG05') order by add_date desc";
        }
        else if (U_MDEP == "0007" || U_MDEP == "0008" || U_MDEP == "0011" || U_MDEP == "0012" || U_MDEP == "0013" || U_MDEP == "0014" || U_MDEP == "0015" || U_MDEP == "0016" || U_MDEP == "0017")
        {
            commandText = "select MF_ID,MP from MSYSK where del_tag = '0' " + sql_txt + " and mp_com='" + soitp.ComID + "' order by add_date desc";
        }
        else
        {
            commandText = "select MF_ID,MP from MSYSK where del_tag = '0'" + sql_txt + " order by add_date desc";
        }

        List<MSYSKentity> meList = MSYSKhgSql.Instance.getOItable(connectionStrings, commandText);//<===

        log.endWrite("'meList' :" + meList.ToString(), className, methodName);
        return meList;
    }

    public string addOItable(string MF_ID, string MP, string MP_Com, string add_user, string add_ip)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MF_ID' :" + MF_ID + "'MP' :" + MP + "'MP_Com' :" + MP_Com + "'add_user' :" + add_user + "'add_ip' :" + add_ip, className, methodName);

        string commandText = "insert into MSYSK(MF_ID,MP,MP_Com,add_date,add_user,add_ip)VALUES('{0}','{1}','{2}',GETDATE(),'{3}','{4}')";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(commandText, MF_ID, MP, MP_Com, add_user, add_ip));
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sb.ToString());

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public string deleteMSYSKdata(string MF_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MF_ID' :" + MF_ID, className, methodName);

        string commandText = "update MSYSK set del_tag='1' where MF_ID='" + MF_ID + "'";
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }


}