using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// MUMAPhgSql 的摘要描述
/// </summary>
public class MUMAPhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MUMAPhgSql _instanct = new MUMAPhgSql();
    public static MUMAPhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MUMAPhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //取出此帳號可執行的功能(20220802)
    public List<muserMenuSetupEntity> getUserAuthorityList(string connectionStrings, string commandText, string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<muserMenuSetupEntity> mmcList = new List<muserMenuSetupEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            string cmd3 = "select auto_id,menu_no,menu_name,per_read,per_add,per_edit,per_del,per_query from MUMAP where U_Num='" + U_Num + "'";
            cmd.CommandText = cmd3;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                //    //20220804改這裡
                while (sr.Read())
                {
                    muserMenuSetupEntity mmc = new muserMenuSetupEntity();
                    mmc.menu_no = sr[1].ToString().Trim(); //選單編號
                    mmc.menu_name = sr[2].ToString().Trim(); //選單名稱
                    mmc.per_read = sr[3].ToString().Trim();//讀取權限
                    mmc.per_add = sr[4].ToString().Trim();//新增權限
                    mmc.per_edit = sr[5].ToString().Trim();//修改權限
                    mmc.per_del = sr[6].ToString().Trim();//刪除權限
                    mmc.per_query = sr[7].ToString().Trim();//進階查詢
                    mmcList.Add(mmc);

                }
                //從資料庫把資料撈出來*************************************************************************************************end
                log.endWrite(mmcList.ToString(), className, methodName);
                
            }
        }
        return mmcList;
    }
    public List<muserMenuSetupEntity> getUserAuthority(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<muserMenuSetupEntity> mmcList = new List<muserMenuSetupEntity>();
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
                    muserMenuSetupEntity mmc = new muserMenuSetupEntity();
                    mmc.auto_id = sr[0].ToString().Trim();//auto_id=menu_no
                    mmc.menu_no = sr[1].ToString().Trim();
                    mmc.menu_id = sr[2].ToString().Trim();
                    mmc.menu_name=sr[3].ToString().Trim();
                    mmc.per_read=sr[6].ToString().Trim();
                    mmc.per_add = sr[7].ToString().Trim();
                    mmc.per_edit = sr[8].ToString().Trim();
                    mmc.per_del = sr[9].ToString().Trim();
                    mmc.per_query = sr[10].ToString().Trim();
                    //mmc.per_read = sr[6].ToString().Trim();
                    //mmc.item_id = sr[3].ToString().Trim();
                    //mmc.href= sr[4].ToString().Trim();  
                    //mmc.menu_name=sr[5].ToString().Trim();
                    mmcList.Add(mmc);
                }
            }
            log.endWrite(mmcList.ToString(), className, methodName);
            return mmcList;
        }

    }
    public string setUserAuthority(string connectionStrings, string commandText)
    {

        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);//<======
        return backString;
    }
}