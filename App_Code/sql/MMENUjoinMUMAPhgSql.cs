using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// MMENUjoinMUMAPhgSql 的摘要描述
/// </summary>
public class MMENUjoinMUMAPhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MMENUjoinMUMAPhgSql _instanct = new MMENUjoinMUMAPhgSql();
    public static MMENUjoinMUMAPhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
  
    public MMENUjoinMUMAPhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<masterPageLeftMenuEntity> getLeftMenu(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<masterPageLeftMenuEntity> lmList = new List<masterPageLeftMenuEntity>();
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
                    masterPageLeftMenuEntity lm = new masterPageLeftMenuEntity();
                    lm.level1 = sr[2].ToString().Trim();
                    lm.level2 = sr[1].ToString().Trim();
                    lm.level3 = sr[0].ToString().Trim();
                    lm.menuLocation = sr[4].ToString().Trim();
                    lm.menuName = sr[3].ToString().Trim();
                    lm.auto_id = sr[5].ToString().Trim();
                    //把資料分階層---------------start
                    if (lm.level3 != "0")
                    {
                        lm.level = "third";
                    }
                    else
                    {
                        if (lm.level2 != "0")
                        {
                            lm.level = "second";
                        }
                        else
                        {
                            lm.level = "first";
                        }
                    }
                    //把資料分階層---------------end
                    lmList.Add(lm);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite(lmList.ToString(), className, methodName);
        return lmList;
    }
}