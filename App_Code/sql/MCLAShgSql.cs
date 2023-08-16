using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

/// <summary>
/// MCLAShgSql 的摘要描述
/// </summary>
public class MCLAShgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MCLAShgSql _instanct = new MCLAShgSql();
    public static MCLAShgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MCLAShgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public workTimeEntity getWorkTimeEntity(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log

        workTimeEntity wte = new workTimeEntity();
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

                    wte.C_ID = sr[0].ToString().Trim();
                    wte.C_Year = sr[1].ToString().Trim();
                    wte.C_Month = sr[2].ToString().Trim();
                    wte.C_SDate = sr[3].ToString().Trim();
                    wte.C_EDate = sr[4].ToString().Trim();
                    wte.A_MTime_S = sr[5].ToString().Trim();
                    wte.A_MTime_E = sr[6].ToString().Trim();
                    wte.A_NTime_S = sr[7].ToString().Trim();
                    wte.A_NTime_E = sr[8].ToString().Trim();
                    wte.A_OTime_S = sr[9].ToString().Trim();
                    wte.A_OTime_E = sr[10].ToString().Trim();
                    wte.A_OBTime_S = sr[11].ToString().Trim();
                    wte.A_OBTime_E = sr[12].ToString().Trim();
                    wte.B_MTime_S = sr[13].ToString().Trim();
                    wte.B_MTime_E = sr[14].ToString().Trim();
                    wte.B_NTime_S = sr[15].ToString().Trim();
                    wte.B_NTime_E = sr[16].ToString().Trim();
                    wte.B_OTime_S = sr[17].ToString().Trim();
                    wte.B_OTime_E = sr[18].ToString().Trim();
                    wte.B_OBTime_S = sr[19].ToString().Trim();
                    wte.B_OBTime_E = sr[20].ToString().Trim();
                    wte.C_OTime_S = sr[21].ToString().Trim();
                    wte.C_OTime_E = sr[22].ToString().Trim();
                    wte.C_MTime_S = sr[23].ToString().Trim();
                    wte.C_MTime_E = sr[24].ToString().Trim();
                    wte.D_MTime_S = sr[25].ToString().Trim();
                    wte.D_MTime_E = sr[26].ToString().Trim();
                    wte.D_NTime_S = sr[27].ToString().Trim();
                    wte.D_NTime_E = sr[28].ToString().Trim();
                    wte.D_OTime_S = sr[29].ToString().Trim();
                    wte.D_OTime_E = sr[30].ToString().Trim();
                    wte.D_OBTime_S = sr[31].ToString().Trim();
                    wte.D_OBTime_E = sr[32].ToString().Trim();
                    wte.E_MTime_S = sr[33].ToString().Trim();
                    wte.E_MTime_E = sr[34].ToString().Trim();
                    wte.E_NTime_S = sr[35].ToString().Trim();
                    wte.E_NTime_E = sr[36].ToString().Trim();
                    wte.E_OTime_S = sr[37].ToString().Trim();
                    wte.E_OTime_E = sr[38].ToString().Trim();
                    wte.E_OBTime_S = sr[39].ToString().Trim();
                    wte.E_OBTime_E = sr[40].ToString().Trim();
                    wte.F_MTime_S = sr[41].ToString().Trim();
                    wte.F_MTime_E = sr[42].ToString().Trim();
                    wte.F_NTime_S = sr[43].ToString().Trim();
                    wte.F_NTime_E = sr[44].ToString().Trim();
                    wte.F_OTime_S = sr[45].ToString().Trim();
                    wte.F_OTime_E = sr[46].ToString().Trim();
                    wte.F_OBTime_S = sr[47].ToString().Trim();
                    wte.F_OBTime_E = sr[48].ToString().Trim();
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'wte' : "+ wte.ToString(), className, methodName);
        return wte;
    }

    public List<MCLASEntity> getMCLASEntity(string connectionStrings, string commandText)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'connectionStrings' : {0}, 'commandText' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, connectionStrings, commandText));
        log.startWrite(sb.ToString(), className, methodName);
        //======================================================================================================================以上為log
        MCLASEntity mCLASEntity = new MCLASEntity();
        List<MCLASEntity> MCLASEntityList=new List<MCLASEntity> ();
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
                    mCLASEntity.C_ID = sr[0].ToString().Trim();
                    mCLASEntity.C_Year = sr[1].ToString().Trim();
                    mCLASEntity.C_Month = sr[2].ToString().Trim();
                    mCLASEntity.C_SDate = sr[3].ToString().Trim();
                    mCLASEntity.C_EDate = sr[4].ToString().Trim();
                    mCLASEntity.A_MTime_S = sr[5].ToString().Trim();
                    mCLASEntity.A_MTime_E = sr[6].ToString().Trim();
                    mCLASEntity.A_NTime_S = sr[7].ToString().Trim();
                    mCLASEntity.A_NTime_E = sr[8].ToString().Trim();
                    mCLASEntity.A_OTime_S = sr[9].ToString().Trim();
                    mCLASEntity.A_OTime_E = sr[10].ToString().Trim();
                    mCLASEntity.A_OBTime_S = sr[11].ToString().Trim();
                    mCLASEntity.A_OBTime_E = sr[12].ToString().Trim();
                    mCLASEntity.B_MTime_S = sr[13].ToString().Trim();
                    mCLASEntity.B_MTime_E = sr[14].ToString().Trim();
                    mCLASEntity.B_NTime_S = sr[15].ToString().Trim();
                    mCLASEntity.B_NTime_E = sr[16].ToString().Trim();
                    mCLASEntity.B_OTime_S = sr[17].ToString().Trim();
                    mCLASEntity.B_OTime_E = sr[18].ToString().Trim();
                    mCLASEntity.B_OBTime_S = sr[19].ToString().Trim();
                    mCLASEntity.B_OBTime_E = sr[20].ToString().Trim();
                    mCLASEntity.C_OTime_S = sr[21].ToString().Trim();
                    mCLASEntity.C_OTime_E = sr[22].ToString().Trim();
                    mCLASEntity.C_MTime_S = sr[23].ToString().Trim();
                    mCLASEntity.C_MTime_E = sr[24].ToString().Trim();
                    mCLASEntity.D_MTime_S = sr[25].ToString().Trim();
                    mCLASEntity.D_MTime_E = sr[26].ToString().Trim();
                    mCLASEntity.D_NTime_S = sr[27].ToString().Trim();
                    mCLASEntity.D_NTime_E = sr[28].ToString().Trim();
                    mCLASEntity.D_OTime_S = sr[29].ToString().Trim();
                    mCLASEntity.D_OTime_E = sr[30].ToString().Trim();
                    mCLASEntity.D_OBTime_S = sr[31].ToString().Trim();
                    mCLASEntity.D_OBTime_E = sr[32].ToString().Trim();
                    mCLASEntity.E_MTime_S = sr[33].ToString().Trim();
                    mCLASEntity.E_MTime_E = sr[34].ToString().Trim();
                    mCLASEntity.E_NTime_S = sr[35].ToString().Trim();
                    mCLASEntity.E_NTime_E = sr[36].ToString().Trim();
                    mCLASEntity.E_OTime_S = sr[37].ToString().Trim();
                    mCLASEntity.E_OTime_E = sr[38].ToString().Trim();
                    mCLASEntity.E_OBTime_S = sr[39].ToString().Trim();
                    mCLASEntity.E_OBTime_E = sr[40].ToString().Trim();
                    mCLASEntity.F_MTime_S = sr[41].ToString().Trim();
                    mCLASEntity.F_MTime_E = sr[42].ToString().Trim();
                    mCLASEntity.F_NTime_S = sr[43].ToString().Trim();
                    mCLASEntity.F_NTime_E = sr[44].ToString().Trim();
                    mCLASEntity.F_OTime_S = sr[45].ToString().Trim();
                    mCLASEntity.F_OTime_E = sr[46].ToString().Trim();
                    mCLASEntity.F_OBTime_S = sr[47].ToString().Trim();
                    mCLASEntity.F_OBTime_E = sr[48].ToString().Trim();
                    MCLASEntityList.Add(mCLASEntity);
                }
            }
        }
        //從資料庫把資料撈出來*************************************************************************************************end
        log.endWrite("'MCLASEntityList' : " + MCLASEntityList.ToString(), className, methodName);
        return MCLASEntityList;
    }
}