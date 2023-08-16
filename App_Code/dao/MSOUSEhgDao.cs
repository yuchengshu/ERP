using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MSOUSEhgDao 的摘要描述
/// </summary>
public class MSOUSEhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MSOUSEhgDao _instance = new MSOUSEhgDao();
    public static MSOUSEhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MSOUSEhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<WebMemberRegisteredActiveDetailEntity> getWebMemberRegisteredActiveDetail(string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'MP' : " + MP, className, methodName);

        string sql_text = string.Empty;
        if (!common.isEmpty(MP))
        {
            sql_text = "and T_id='"+ MP + "'";
        }
        string commandText = "select Sur_id,T_name,T_Text from msouce where del_tag='0'"+ sql_text;
        List<WebMemberRegisteredActiveDetailEntity> wmradeList = MSOUSEhgSql.Instance.getWebMemberRegisteredActiveDetail(connectionStrings, commandText);//<===

        log.endWrite("'wmradeList' : " + wmradeList.ToString(), className, methodName);
        return wmradeList;
    }
}