using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MBULThgDao 的摘要描述
/// </summary>
public class MBULThgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MBULThgDao _instance = new MBULThgDao();
    public static MBULThgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MBULThgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    /// <summary>
    /// 新增公佈欄資料細項
    /// </summary>
    public string addNoticeDetail(addNoticeDetail and)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'adver_item':" + and.adver_item + "'adver_depart_id':" + and.adver_depart_id + "'adver_subject':" + and.adver_subject + "'adver_content':" + and.adver_content + "'adver_depart_id':" + and.adver_depart_id + "'adver_employ_id':" + and.adver_employ_id + "'adver_Com':" + and.adver_Com + "'add_ip':" + and.add_ip, className, methodName);
                                                           //('{0}', '{1}',         '{2}',      '{3}',       '{4}',          '{5}',     '{6}',           '{7}',          GETDATE(),     '{8}',    '{9}', '{10}', GETDATE())";
        //20220610下午進度
        string commandText = "INSERT INTO [HG].[dbo].MBULT (adver_id,adver_item,adver_dep,adver_subject,adver_content,adver_depart_id,adver_employ_id,adver_Com,adver_create_date,adver_direct,add_user,add_ip,add_date) VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', GETDATE(), '{8}', '{9}', '{10}',  GETDATE())";
        StringBuilder sbCommandText = new StringBuilder();//  {0}',   '{1}',    '{2}',    '{3}',       '{4}',        '{5}',           '{6}',           '{7}',     GETDATE(),       '{8}',       '{9}',   '{10}', GETDATE()
                                                          //(adver_id,      adver_item,      adver_dep,     adver_subject,      adver_content,  adver_depart_id,  adver_employ_id,  adver_Com,  adver_create_date, adver_direct, add_user,add_ip,add_date) 
                                                          //('{0}',      '{1}',           '{2}',            '{3}',           '{4}',            '{5}', '            {6}',            '{7}',            GETDATE(), '  {8}',      '{9}', '{10}',  GETDATE())"
        sbCommandText.Append(string.Format(commandText, and.adver_id, and.adver_item, and.adver_dep, and.adver_subject, and.adver_content, and.adver_depart_id, and.add_user, and.adver_dep, and.adver_direct, and.add_user, and.add_ip,and.add_date));
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite(common.nothing, className, methodName);
        return backStr;
    }

    public List<noticeBoardEntity> getNoticeBoard(string U_MDEP, string U_POSITION, string group, string fromClassName, string adver_depart_id, string keyword)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'U_MDEP' : {0}, 'U_POSITION' : {1}, 'group' : {2}, 'fromClassName' : {3}, 'adver_depart_id' : {4}, 'keyword' : {5}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, U_MDEP, U_POSITION, group, fromClassName, adver_depart_id, keyword));
        log.startWrite(sb.ToString(), className, methodName);

        string sqlTxt = string.Empty;
        if (fromClassName == "index")
        {
           //sqlTxt = getSqlTxt.PerformanceRankingST(group, U_MDEP);
        }
        else
        {
            // //Demo:select * from MBULT where ((del_tag = '0' and (lower(adver_subject) like LOWER('%facebook%')))) or ((del_tag = '0' and ((convert([nvarchar](255),adver_content) like LOWER('%facebook%' ) )))) order by adver_Create_date desc
            //adver_depart_id:發布部門代號;keyword:關鍵字        
            sqlTxt = getSqlTxt.noticeBoardST(adver_depart_id, keyword);
        }

        string commandText = getCommandText.NoticeBoardCT(U_MDEP, U_POSITION, sqlTxt, fromClassName);//撈取資料語法
        List<noticeBoardEntity> nbeList = MBULThgSql.Instance.getNoticeBoard(connectionStrings, commandText);//<======撈取資料

        log.endWrite(nbeList.ToString(), className, methodName);
        return nbeList;
    }

    public string deleteNoticeData(string adver_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'adver_id' :" + adver_id, className, methodName);

        string commandText = "UPDATE MBULT SET del_tag='1' WHERE adver_id='" + adver_id + "'";
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;

    }
    internal List<noticeBoardEntity> getHnBankCredit()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string paramFormat = "'U_MDEP' : {0}, 'U_POSITION' : {1}, 'group' : {2}, 'fromClassName' : {3}, 'adver_depart_id' : {4}, 'keyword' : {5}";
        //StringBuilder sb = new StringBuilder();
        //sb.Append(string.Format(paramFormat, U_MDEP, U_POSITION, group, fromClassName, adver_depart_id, keyword));
        //log.startWrite(sb.ToString(), className, methodName);

        string sqlTxt = string.Empty;
        //if (fromClassName == "index")
        //{
        //    //sqlTxt = getSqlTxt.PerformanceRankingST(group, U_MDEP);
        //}
        //else
        //{
        //    sqlTxt = getSqlTxt.NoticeBoardST(adver_depart_id, keyword);
        //}
        DateTime currentTime = System.DateTime.Now;

        //取當前年

        int year = currentTime.Year;//取當前年
        
        

        int month = currentTime.Month;// 取當前月
        int month_LastMonth = month - 1;//上一個月
        string day1 = year + "/" + month_LastMonth + "/27";
        string day2 = "";
        //統計期間[day1~day2]
        if (month == 1)//當前月
        {
            day1 = (year - 1) + "/12 /27";//去年12月
            day2 = year + "/" + month + "/31";
        }
        else if (month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12)
        {
            day1 = year + "/" + month_LastMonth + "/27";
            day2 = year + "/" + month + "/31";
        }
        else //if (month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12)
        {
            day1 = year + "/" + month_LastMonth + "/27";
            if (month == 2)
            {
                //判斷是否為閏年
                if (year % 400 == 0 || year % 4 == 0 && year % 100 != 0)
                {
                    //Console.WriteLine("西元{0}年是閏年喔", year);
                    day2 = year + "/" + month + "/29";
                }
                else
                {
                    day2 = year + "/" + month + "/28";
                }
                //
               // day2 = year + "/" + month + "/28";
            }
            else
            { 
            day2 = year + "/" + month + "/30";
        }
        }
        //string day2= year + "/" + month + "/31";
        //sqlTxt = "SELECT SUM(CAST(Account_Money AS int)) AS account_total  FROM DTRAT WHERE(Pay_Type = '0002' OR Pay_Type = '0012')  AND(Account_Date >= '" + day1 + "') AND(Account_Date <= '" + day2 + "' and del_Tag = '0')";
        sqlTxt = "SELECT ISNULL(SUM(CAST(Account_Money AS int)),'0') AS account_total  FROM DTRAT WHERE(Pay_Type = '0002' OR Pay_Type = '0012')  AND(Account_Date >= '" + day1 + "') AND(Account_Date <= '" + day2 + "' and del_Tag = '0')";
        //string commandText = getCommandText.getHnBankCredit(sqlTxt);
        string commandText = sqlTxt;
        List<noticeBoardEntity> nbeList = MBULThgSql.Instance.getHnBankCredit(connectionStrings, commandText,day1,day2);//<======
       
        log.endWrite(nbeList.ToString(), className, methodName);
        return nbeList;
    }

    public string deleteData(string adver_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'adver_id' :" + adver_id, className, methodName);

        string commandText = common.makeSQLdeleteStr("MBULT", "adver_id", adver_id);
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
}