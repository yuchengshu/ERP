using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// commandText 的摘要描述
/// </summary>
public class getCommandText
{
    
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";
    public getCommandText()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    /*
     * 行政、財務、資訊部、系統可查所有案件，業務只能看所屬公司及個人案件
     * 透個查詢者，可查全公司資料
     */
    public static string CustomerManageCT(getCustormerParams gcp, string sqlTxt)
    {
        string backString = string.Empty;
        if (gcp.U_MDEP.Trim() == "0001" || gcp.U_MDEP.Trim() == "0003" || gcp.U_MDEP.Trim() == "0004" || gcp.U_MDEP.Trim() == "0009")
        {
            backString = "select top 300 * from MMBER where del_tag = '0' " + sqlTxt + " order by add_date desc";
        }
        else if (gcp.keyWord != common.empty)
        {
            backString = "select top 300 * from MMBER where del_tag = '0'  and mc_COM = '" + gcp.ComID + "'" + sqlTxt + " order by add_date desc";
        }
        else
        {
            backString = "select top 300 * from MMBER where MC='" + gcp.U_Num + "' and mc_COM = '" + gcp.ComID + "' and del_tag = '0' " + sqlTxt + " order by add_date desc";
        }
        return backString;
    }

    /// <summary>
    /// 取得getPerformanceRankingCommandText字串
    /// </summary>
    /// <param name="U_MDEP"></param>
    /// <param name="sqlTxt"></param>
    /// <returns></returns>
    public static string PerformanceRankingCT(string U_MDEP, string sqlTxt)
    {
        string backString = "select a.mc,a.mc_com,a.mc_name,d.U_Mdep, sum(case a.pay_type when '0002' then cast(a.account_money  as int)*0.98 when '0007' then cast(a.account_money  as int)*0.98 when '0006' then (case b.T_Type when '0003' then cast(a.account_money  as int) - 10 else cast(a.account_money  as int) - 20 end) else  cast(a.account_money as int) end) as money  from DTRAT a join MTRAT b on a.T_id=b.T_id join MMBER c on b.M_id=C.M_id join MUSER d on a.mc= d.U_num where a.account_date >='{0}' and a.account_date <='{1}' and a.del_tag='0' and b.del_tag='0' {2} and b.T_type<>'0002' group by a.mc,a.mc_name,a.mc_com,d.u_mdep order by money desc";
        StringBuilder sb = new StringBuilder();
        string start = common.getYearOrMonthOrDay("yy") + "/" + common.getYearOrMonthOrDay("MM") + "/01";
        string end = common.getYearOrMonthOrDay("yy") + "/" + common.getYearOrMonthOrDay("MM") + "/" + common.getThisMonthLastDay();
        sb.Append(string.Format(backString, start, end, sqlTxt));
        return sb.ToString();
    }

    //Demo:select * from MBULT where ((del_tag = '0' and (lower(adver_subject) like LOWER('%facebook%')))) or ((del_tag = '0' and ((convert([nvarchar](255),adver_content) like LOWER('%facebook%' ) )))) order by adver_Create_date desc
    public static string NoticeBoardCT(string U_MDEP, string U_POSITION, string sqlTxt, string fromClassName)
    {
        string backString = string.Empty;
        if (fromClassName == "index")
        {
            if (U_MDEP == "0002" || U_MDEP == "0006")
            {
                if (U_POSITION == "0003")
                {
                    backString = "select top 5 * from MBULT where del_tag = '0' and (adver_dep='0002' or adver_dep='0006' or adver_dep='8888' or adver_dep='9999') " + sqlTxt + " order by adver_Create_date desc";
                }
                else
                {
                    backString = "select top 5 * from MBULT where del_tag = '0' and (adver_dep='" + U_MDEP + "' or adver_dep='8888' or adver_dep='9999') " + sqlTxt + " order by adver_Create_date desc";
                }
            }
            else if (U_MDEP == "0007" || U_MDEP == "0008")
            {
                if (U_POSITION == "0003")
                {
                    backString = "select top 5 * from MBULT where del_tag = '0' and (adver_dep='0007' or adver_dep='0008' or adver_dep='7777' or adver_dep='9999') " + sqlTxt + " order by adver_Create_date desc";
                }
                else
                {
                    backString = "select top 5 * from MBULT where del_tag = '0' and (adver_dep='" + U_MDEP + "' or adver_dep='7777' or adver_dep='9999') " + sqlTxt + " order by adver_Create_date desc";
                }
            }
            else if (U_MDEP == "0004" || U_MDEP == "0003" || U_MDEP == "0009" || U_MDEP == "0001")
            {
                backString = "select top 5 * from MBULT where del_tag = '0'" + sqlTxt + " order by adver_Create_date desc";
            }
            else
            {
                backString = "select top 5 * from MBULT where del_tag = '0'" + sqlTxt + " order by adver_Create_date desc";
            }
        }
        else
        {
            if (U_MDEP == "0002" || U_MDEP == "0006")
            {
                if (U_POSITION == "0003")
                {
                    backString = "select * from MBULT where del_tag = '0' and (adver_dep='0002' or adver_dep='0006' or adver_dep='8888' or adver_dep='9999'  or adver_dep='1111') " + sqlTxt + " order by adver_Create_date desc";
                }
                else
                {
                    backString = "select * from MBULT where del_tag = '0' and (adver_dep='" + U_MDEP + "' or adver_dep='8888' or adver_dep='9999' or adver_dep='1111') " + sqlTxt + " order by adver_Create_date desc";
                }
            }
            else if (U_MDEP == "0015" || U_MDEP == "0016")
            {
                if (U_POSITION == "0003")
                {
                    backString = "select * from MBULT where del_tag = '0' and (adver_dep='0015' or adver_dep='0016' or adver_dep='2222' or adver_dep='9999' or adver_dep='1111') " + sqlTxt + " order by adver_Create_date desc";
                }
                else
                {
                    backString = "select * from MBULT where del_tag = '0' and (adver_dep='" + U_MDEP + "' or adver_dep='2222' or adver_dep='9999' or adver_dep='1111') " + sqlTxt + " order by adver_Create_date desc";
                }
            }
            else if (U_MDEP == "0007" || U_MDEP == "0008")
            {
                if (U_POSITION == "0003")
                {
                    backString = "select * from MBULT where del_tag = '0' and (adver_dep='0007' or adver_dep='0008' or adver_dep='7777' or adver_dep='9999') " + sqlTxt + " order by adver_Create_date desc";
                }
                else
                {
                    backString = "select * from MBULT where del_tag = '0' and (adver_dep='" + U_MDEP + "' or adver_dep='7777' or adver_dep='9999') " + sqlTxt + " order by adver_Create_date desc";
                }
            }
            else if (U_MDEP == "0011" || U_MDEP == "0012")
            {
                if (U_POSITION == "0003")
                {
                    backString = "select * from MBULT where del_tag = '0' and (adver_dep='0011' or adver_dep='0012' or adver_dep='5555' or adver_dep='9999') " + sqlTxt + " order by adver_Create_date desc";
                }
                else
                {
                    backString = "select * from MBULT where del_tag = '0' and (adver_dep='" + U_MDEP + "' or adver_dep='5555' or adver_dep='9999') " + sqlTxt + " order by adver_Create_date desc";
                }
            }
            else if (U_MDEP == "0013" || U_MDEP == "0014")
            {
                if (U_POSITION == "0003")
                {
                    backString = "select * from MBULT where del_tag = '0' and (adver_dep='0013' or adver_dep='0014' or adver_dep='3333' or adver_dep='9999') " + sqlTxt + " order by adver_Create_date desc";
                }
                else
                {
                    backString = "select * from MBULT where del_tag = '0' and (adver_dep='" + U_MDEP + "' or adver_dep='3333' or adver_dep='9999') " + sqlTxt + " order by adver_Create_date desc";
                }
            }
            else if (U_MDEP == "0010" || U_MDEP == "0009" || U_MDEP == "0004" || U_MDEP == "0003" || U_MDEP == "0001")
            {
                backString = "select * from MBULT where del_tag = '0'" + sqlTxt + " order by adver_Create_date desc";
            }
            else
            {
                //Demo:select * from MBULT where ((del_tag = '0' and (lower(adver_subject) like LOWER('%facebook%')))) or ((del_tag = '0' and ((convert([nvarchar](255),adver_content) like LOWER('%facebook%' ) )))) order by adver_Create_date desc
                //sqlTxt:((del_tag = '0' and (lower(adver_subject) like LOWER('%facebook%')))) or ((del_tag = '0' and ((convert([nvarchar](255),adver_content) like LOWER('%facebook%' ) ))))
                if(sqlTxt=="")
                {
                    backString = "select * from MBULT  order by adver_Create_date desc";
                }
                else
                {
                    backString = "select * from MBULT where " + sqlTxt + " order by adver_Create_date desc";
                }
                //backString = "select * from MBULT where " + sqlTxt + " order by adver_Create_date desc";
            }

        }

        return backString;
    }

    internal static string getHnBankCredit(string sqlTxt)
    {
        string backString = string.Empty;
        //取得上一個月月份
        string Month2 = DateTime.Parse(DateTime.Now.ToString("yyyy-MM-01")).AddMonths(-1).ToString("yyyy/MM");
        string DateA = Month2 + "/27";
        //取得本月月份
        string Month = DateTime.Now.Date.ToString("yyyy/MM");
        string DateB = Month + "/31";
        
        backString = "SELECT SUM(CAST(Account_Money AS int)) AS account_total  FROM DTRAT WHERE(Pay_Type = '0002' OR Pay_Type = '0012') AND(Account_Date >= '"+ DateA + "') AND(Account_Date <= CONVERT(DATETIME, '"+DateB+"', 102)) and del_Tag = '0'";
        return backString;
    }

    public static string CallMassageCT(string U_Num, string U_MDEP, string U_POSITION, string Comid, string sqlTxt)
    {
        string backString = string.Empty;
        if (U_Num == "A9612037")
        {
            backString = "select top 10 * from MMSGE where del_tag = '0' " + sqlTxt + " and (mp_com='" + Comid + "' or mp='C9502231') and add_Date >= Convert(varchar(10),getdate(),111)  order by add_date desc";
        }
        else if (U_MDEP == "0002" || U_MDEP == "0006" || U_MDEP == "0007" || U_MDEP == "0008" || U_MDEP == "0011" || U_MDEP == "0012" || U_MDEP == "0013" || U_MDEP == "0014" || U_MDEP == "0015" || U_MDEP == "0016" || U_MDEP == "0017")
        {
            backString = "select top 10 * from MMSGE where del_tag = '0' " + sqlTxt + " and mp_com='" + Comid + "' and add_Date >= Convert(varchar(10),getdate(),111)  order by add_date desc";
        }
        else if (U_POSITION == "0006")
        {
            backString = "select top 10 * from MMSGE where del_tag = '0' and mp='" + getU_Leader(U_Num) + "' " + sqlTxt + " and add_Date >= Convert(varchar(10),getdate(),111) order by add_date desc";
        }
        else if (U_POSITION == "0005")
        {
            backString = "select top 10 * from MMSGE where del_tag = '0' and mp='" + U_Num + "' " + sqlTxt + " and add_Date >= Convert(varchar(10),getdate(),111) order by add_date desc";
        }
        else
        {
            backString = "select top 10 * from MMSGE where del_tag = '0' " + sqlTxt + " and add_Date >= Convert(varchar(10),getdate(),111) order by add_date desc";
        }
        return backString;
    }

    public static string getU_Leader(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, "getCommandText", methodName);

        string commandText = "select U_Leader from MUSER where U_Num='{0}' and del_tag = '0' and LeaveDate is null";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, U_Num));
        string U_Leader = MUSERhgSql.Instance.getU_Leader(connectionStrings, sbCommandText.ToString());//<========

        log.endWrite("'U_Leader' : " + U_Leader, "getCommandText", methodName);
        return U_Leader;
    }

    //取得業務聯絡單列表SQL語法
    //20230320加入觀看特定案件條件功能
    //業務只能看所屬公司及個人案件
    public static string businessConnectionCT(string U_MDEP, string U_Num, string sqltxt)
    {
        string backString = string.Empty;
        //and (CF_Item = '0000')  and (F_Status = '3') [sqltxt]

        //if (U_MDEP == "0003" || U_MDEP == "0004" || U_MDEP == "0009" || U_MDEP == "0008")
        //{
        //    backString = "select a.M_ID,a.M_Name,a.Light_Status,a.add_date,a.add_user,b.f_id,b.MP_ID,b.CF_Item,b.U_LeaderName,b.U_LeaderStatus,b.EX_Name,b.EX_Status,b.EX_LeaderName,b.EX_LeaderStatus,b.Obj,b.F_Status from mmber a join mcotf b on a.M_id=b.M_id where b.del_tag='0' " + sqltxt + " order by F_Status,b.add_date desc";
        //}
        //else
        //{
        //    if (U_Num == "A0111281" || U_Num == "A0309012" || U_Num == "A0309013" || U_Num == "A0111282")
        //    {
        //        backString = "select a.M_ID,a.M_Name,a.Light_Status,a.add_date,a.add_user,b.f_id,b.MP_ID,b.CF_Item,b.U_LeaderName,b.U_LeaderStatus,b.EX_Name,b.EX_Status,b.EX_LeaderName,b.EX_LeaderStatus,b.Obj,b.F_Status from mmber a join mcotf b on a.M_id=b.M_id where (b.U_Leader='A9501041'  or b.U_Leader='A9501042'  or b.add_user='" + U_Num + "') and b.del_tag = '0'" + sqltxt + " order by F_Status,b.add_date desc";
        //    }
        //    else
        //    {
        //        backString = "select a.M_ID,a.M_Name,a.Light_Status,a.add_date,a.add_user,b.f_id,b.MP_ID,b.CF_Item,b.U_LeaderName,b.U_LeaderStatus,b.EX_Name,b.EX_Status,b.EX_LeaderName,b.EX_LeaderStatus,b.Obj,b.F_Status from mmber a join mcotf b on a.M_id=b.M_id where (b.U_Leader='" + U_Num + "' or b.add_user='" + U_Num + "') and b.del_tag = '0'" + sqltxt + " order by F_Status,b.add_date desc";
        //    }
        //}

        backString = "SELECT TOP 300 b.M_ID,b.Obj 件別代號,c.Light_Status as 燈號,b.CF_Item 聯絡單種類,b.MP_ID 分析師編號,c.M_Name 會員姓名,b.add_com 提案人部門代號," +
                    "b.add_user as 提案人,b.add_date as 提案日期,b.U_LeaderName,b.U_LeaderStatus,b.EX_Name,b.EX_Status,b.EX_LeaderName,b.EX_LeaderStatus," +
                    "b.CF_Item 聯絡單種類,b.U_LeaderStatus 單_簽核狀態,b.EX_Status 行_簽核狀態,b.EX_LeaderStatus 主_簽核狀態,b.F_Status as 狀態,b.f_id " +
                    "FROM [HG].[dbo].[MCOTF] b left join MUSER a on b.MP_ID=a.U_num left join MMBER c on c.M_ID=b.M_ID  Where 1=1 and b.del_tag=0 " + sqltxt;//加入限制[處理中]2023/3/9
        //backString = "SELECT TOP 500 b.M_ID,b.Obj 件別代號,c.Light_Status as 燈號,b.CF_Item 聯絡單種類,b.MP_ID 分析師編號,c.M_Name 會員姓名,c.b.add_com 提案人部門代號," +
        //           "b.add_user as 提案人,b.add_date as 提案日期,b.U_LeaderName,b.U_LeaderStatus,b.EX_Name,b.EX_Status,b.EX_LeaderName,b.EX_LeaderStatus," +
        //           "b.CF_Item 聯絡單種類,b.U_LeaderStatus 單_簽核狀態,b.EX_Status 行_簽核狀態,b.EX_LeaderStatus 主_簽核狀態,b.F_Status as 狀態,b.f_id " +
        //           "FROM [HG].[dbo].[MCOTF] b left join MUSER a on b.MP_ID=a.U_num left join MMBER c on c.M_ID=b.M_ID Where 1=1 "+ sqltxt;//加入限制[處理中]2023/3/9

        return backString;
    }

}