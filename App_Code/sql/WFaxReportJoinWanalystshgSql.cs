using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// WFaxReportJoinWanalystshgSql 的摘要描述
/// </summary>
public class WFaxReportJoinWanalystshgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static WFaxReportJoinWanalystshgSql _instanct = new WFaxReportJoinWanalystshgSql();
    public static WFaxReportJoinWanalystshgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public WFaxReportJoinWanalystshgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<dailyResearchReportEntity> getDailyResearchReportList(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        List<dailyResearchReportEntity> drreList = new List<dailyResearchReportEntity>();

        //從資料庫把資料撈出來*************************************************************************************************start
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = commandText;
            dailyResearchReportEntity drre = null;
            using (SqlDataReader sr = cmd.ExecuteReader())
            {
                while (sr.Read())
                {
                    drre = new dailyResearchReportEntity();
                    drre.F_id = sr[0].ToString().Trim();
                    drre.P_id = sr[1].ToString().Trim();
                    drre.Open_tag = sr[2].ToString().Trim();
                    drre.Pay = sr[3].ToString().Trim();
                    drre.U_Item = sr[4].ToString().Trim();
                    drre.F_Item = sr[5].ToString().Trim();
                    drre.F_Title = sr[6].ToString().Trim();
                    drre.F_SDate = sr[7].ToString().Trim();
                    drre.F_EDate = sr[8].ToString().Trim();
                    drre.PDFurl = sr[9].ToString().Trim();
                    drre.u_num = sr[10].ToString().Trim();
                    drre.F_VDate = sr[11].ToString().Trim();
                    drre.F_Context = sr[12].ToString().Trim();
                    drre.F_img1 = sr[13].ToString().Trim();
                    drre.F_img2 = sr[14].ToString().Trim();
                    drre.F_img3 = sr[15].ToString().Trim();
                    drre.Stock1 = sr[16].ToString().Trim();
                    drre.Stock_Text1 = sr[17].ToString().Trim();
                    drre.Stock_Note1 = sr[18].ToString().Trim();
                    drre.Stock2 = sr[19].ToString().Trim();
                    drre.Stock_Text2 = sr[20].ToString().Trim();
                    drre.Stock_Note2 = sr[21].ToString().Trim();
                    drre.Stock3 = sr[22].ToString().Trim();
                    drre.Stock_Text3 = sr[23].ToString().Trim();
                    drre.Stock_Note3 = sr[24].ToString().Trim();
                    drre.Stock4 = sr[25].ToString().Trim();
                    drre.Stock_Text4 = sr[26].ToString().Trim();
                    drre.Stock_Note4 = sr[27].ToString().Trim();
                    drre.Stock5 = sr[28].ToString().Trim();
                    drre.Stock_Text5 = sr[29].ToString().Trim();
                    drre.Stock_Note5 = sr[30].ToString().Trim();
                    drre.Stock6 = sr[31].ToString().Trim();
                    drre.Stock_Text6 = sr[32].ToString().Trim();
                    drre.Stock_Note6 = sr[33].ToString().Trim();
                    drre.Stock7 = sr[34].ToString().Trim();
                    drre.Stock_Text7 = sr[35].ToString().Trim();
                    drre.Stock_Note7 = sr[36].ToString().Trim();
                    drre.Stock8 = sr[37].ToString().Trim();
                    drre.Stock_Text8 = sr[38].ToString().Trim();
                    drre.Stock_Note8 = sr[39].ToString().Trim();
                    drre.Stock9 = sr[40].ToString().Trim();
                    drre.Stock_Text9 = sr[41].ToString().Trim();
                    drre.Stock_Note9 = sr[42].ToString().Trim();
                    drre.Stock10 = sr[43].ToString().Trim();
                    drre.Stock_Text10 = sr[44].ToString().Trim();
                    drre.Stock_Note10 = sr[45].ToString().Trim();
                    drreList.Add(drre);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'drreList' : " + drreList.ToString(), className, methodName);
        return drreList;
    }
}