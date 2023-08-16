using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// DMBERjoinMMBERhgSql 的摘要描述
/// </summary>
public class DMBERjoinMMBERhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static DMBERjoinMMBERhgSql _instanct = new DMBERjoinMMBERhgSql();
    public static DMBERjoinMMBERhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public DMBERjoinMMBERhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<companyResourceTagEntity> getCompanyResourceTag(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<companyResourceTagEntity> crteList = new List<companyResourceTagEntity>();

        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            companyResourceTagEntity crte = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    crte = new companyResourceTagEntity();
                    crte.M_ID = sr[0].ToString().Trim();
                    crte.DM_MC_Name = sr[1].ToString().Trim();
                    crte.DM_MarkTime = sr[2].ToString().Trim();
                    crte.DM_tag = sr[3].ToString().Trim();
                    crte.M_Name = sr[4].ToString().Trim();
                    crte.MC_Name = sr[5].ToString().Trim();
                    crte.MC_COM = sr[6].ToString().Trim();
                    crte.OTel_Zone = sr[7].ToString().Trim();
                    crte.OTel = sr[8].ToString().Trim();
                    crte.OTel_Sub = sr[9].ToString().Trim();
                    crte.OTel_Zone1 = sr[10].ToString().Trim();
                    crte.OTel1 = sr[11].ToString().Trim();
                    crte.OTel_Sub1 = sr[12].ToString().Trim();
                    crte.HTel_Zone = sr[13].ToString().Trim();
                    crte.HTel = sr[14].ToString().Trim();
                    crte.HTel_Zone1 = sr[15].ToString().Trim();
                    crte.HTel1 = sr[16].ToString().Trim();
                    crte.MTel1 = sr[17].ToString().Trim();
                    crte.MTel2 = sr[18].ToString().Trim();
                    crte.MTel3 = sr[19].ToString().Trim();
               
                    crteList.Add(crte);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'crteList' :"+crteList.ToString(), className, methodName);
        return crteList;
    }
}