using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// MINVOhgSql 的摘要描述
/// </summary>
public class MINVOhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MINVOhgSql _instanct = new MINVOhgSql();
    public static MINVOhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MINVOhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public void addMINVOData(string connectionStrings, string commandText)
    { }

    public companyDataEntity getCompanyData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        companyDataEntity cde = new companyDataEntity();
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
                    cde.Com_id = sr[0].ToString().Trim();
                    cde.Com_Name = sr[1].ToString().Trim();
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(cde.ToString(), className, methodName);
        return cde;
    }
    //20221014要修改!!
    public List<MINVOEntity> getMINVOData(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<MINVOEntity> minvoList = new List<MINVOEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            MINVOEntity mINVO = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    mINVO = new MINVOEntity();
                    mINVO.Com_id = sr[0].ToString().Trim();
                    mINVO.Com_Name = sr[1].ToString().Trim();
                    mINVO.Uniform_Num = sr[2].ToString().Trim();
                    mINVO.Tax_Num = sr[3].ToString().Trim();
                    mINVO.del_tag = sr[4].ToString().Trim();
                    mINVO.add_ip = sr[5].ToString().Trim();
                    mINVO.add_user = sr[6].ToString().Trim();
                    mINVO.add_date = sr[7].ToString().Trim();
                    mINVO.edit_user = sr[8].ToString().Trim();
                    mINVO.edit_user = sr[9].ToString().Trim();
                    
                    minvoList.Add(mINVO);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'minvoList' :" + minvoList.ToString(), className, methodName);
        return minvoList;
    }
}