using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// MSEDThgSql 的摘要描述
/// </summary>
public class MSEDThgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MSEDThgSql _instanct = new MSEDThgSql();
    public static MSEDThgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MSEDThgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<dataGiftTableEntity> getDataGiftTable(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        List<dataGiftTableEntity> dgteList = new List<dataGiftTableEntity>();
        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            dataGiftTableEntity dgte = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    dgte = new dataGiftTableEntity();
                    dgte.s_id = sr[0].ToString().Trim();
                    dgte.M_id = sr[1].ToString().Trim();
                    dgte.M_Password = sr[2].ToString().Trim();
                    dgte.MP_Num = sr[3].ToString().Trim();
                    dgte.MP_EN = sr[4].ToString().Trim();
                    dgte.MP_Name = sr[5].ToString().Trim();
                    dgte.ddesc = sr[7].ToString().Trim();
                    dgte.Start_date = sr[9].ToString().Trim();
                    dgte.End_date = sr[10].ToString().Trim();
                    dgte.Pay = sr[11].ToString().Trim();
                    dgte.Faxno = sr[14].ToString().Trim();
                    dgte.Tel_tag = sr[15].ToString().Trim();
                    dgte.Call_tag = sr[16].ToString().Trim();
                    dgte.Action_tag = sr[17].ToString().Trim();
                    dgte.Img = sr[18].ToString().Trim();
                    dgteList.Add(dgte);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'dgteList' : " + dgteList.ToString(), className, methodName);
        return dgteList;
    }
}