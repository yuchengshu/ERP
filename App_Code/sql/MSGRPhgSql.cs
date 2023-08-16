using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// MSGRPhgSql 的摘要描述
/// </summary>
public class MSGRPhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MSGRPhgSql _instanct = new MSGRPhgSql();
    public static MSGRPhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }

    public MSGRPhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<sendMessageCostEntity> getSendMessageCost(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<sendMessageCostEntity> smceList = new List<sendMessageCostEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            sendMessageCostEntity smce = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    smce = new sendMessageCostEntity();
                    smce.auto_id = sr[0].ToString().Trim();
                    smce.MP = sr[1].ToString().Trim();
                    smce.M_SStatus = sr[2].ToString().Trim();
                    smce.M_Name = sr[3].ToString().Trim();
                    smceList.Add(smce);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'smceList' : "+smceList.ToString(), className, methodName);
        return smceList;
    }


    public List<allPowerSendRecordEntity> getAllPowerSendRecord(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<allPowerSendRecordEntity> apsreList = new List<allPowerSendRecordEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            allPowerSendRecordEntity apsre = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    apsre = new allPowerSendRecordEntity();
                    apsre.M_TEL = sr[0].ToString().Trim();
                    apsre.M_MP = sr[1].ToString().Trim();
                    apsre.M_MITem = sr[2].ToString().Trim();
                    apsre.M_SEQ = sr[3].ToString().Trim();
                    apsre.M_TStatus = sr[4].ToString().Trim();
                    apsre.M_Text = sr[5].ToString().Trim();
                    apsre.add_user = sr[6].ToString().Trim();
                    apsre.add_date = sr[7].ToString().Trim();
                    apsreList.Add(apsre);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'apsreList' : " + apsreList.ToString(), className, methodName);
        return apsreList;
    }


    
}