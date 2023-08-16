using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MUMAP_HG 的摘要描述
/// </summary>
public class MUMAPhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MUMAPhgDao _instance = new MUMAPhgDao();
    public static MUMAPhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MUMAPhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    /// <summary>
    ///  製作getUserAuthority執行sql時需要的連線字串、執行命令字串
    /// </summary>
    /// <param name="menu_no"></param>
    /// <param name="menu_id"></param>
    /// <param name="U_Num"></param>
    /// <returns></returns>
    public List<muserMenuSetupEntity> getUserAuthority(string menu_no, string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        string commandText = "SELECT * FROM [HG].[dbo].[MUMAP]  where menu_no='{0}' and U_Num='{1}'  and del_tag = '0'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, menu_no, U_Num));
        //20230130權限要修正
        List<muserMenuSetupEntity> mmcList = MUMAPhgSql.Instance.getUserAuthority(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite(mmcList.ToString(), className, methodName);
        return mmcList;
    }

    public string setUserAuthority(string Fun_Name, string Menu_No, string User_Num,string TrueOrFalse)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        string result = "";
        sb.Append(string.Format(paramFormat, Menu_No, User_Num));
        string commandText = "";
        log.startWrite(sb.ToString(), className, methodName);
        if (Fun_Name != "per_select")
        {
            if (TrueOrFalse == "true")
            {
                if (Fun_Name == "per_read")
                {
                    commandText = "UPDATE [dbo].[MUMAP] SET [per_read] = 1 where menu_no='{0}' and U_Num='{1}'";
                }
                else if (Fun_Name == "per_query")
                {
                    commandText = "UPDATE [dbo].[MUMAP] SET [per_query] = 1 where menu_no='{0}' and U_Num='{1}'";
                }
                else if (Fun_Name == "per_del")
                {
                    commandText = "UPDATE [dbo].[MUMAP] SET [per_del] = 1 where menu_no='{0}' and U_Num='{1}'";
                }
                else if (Fun_Name == "per_add")
                {
                    commandText = "UPDATE [dbo].[MUMAP] SET [per_add] = 1 where menu_no='{0}' and U_Num='{1}'";
                }
                else if (Fun_Name == "per_edit")
                {
                    commandText = "UPDATE [dbo].[MUMAP] SET [per_edit] = 1 where menu_no='{0}' and U_Num='{1}'";
                }
            }
            else if (TrueOrFalse == "false")
            {
                if (Fun_Name == "per_read")
                {
                    commandText = "UPDATE [dbo].[MUMAP] SET [per_read] = 0 where menu_no='{0}' and U_Num='{1}'";
                }
                else if (Fun_Name == "per_query")
                {
                    commandText = "UPDATE [dbo].[MUMAP] SET [per_query] = 0 where menu_no='{0}' and U_Num='{1}'";
                }
                else if (Fun_Name == "per_del")
                {
                    commandText = "UPDATE [dbo].[MUMAP] SET [per_del] = 0 where menu_no='{0}' and U_Num='{1}'";
                }
                else if (Fun_Name == "per_add")
                {
                    commandText = "UPDATE [dbo].[MUMAP] SET [per_add] = 0 where menu_no='{0}' and U_Num='{1}'";
                }
                else if (Fun_Name == "per_edit")
                {
                    commandText = "UPDATE [dbo].[MUMAP] SET [per_edit] = 0 where menu_no='{0}' and U_Num='{1}'";
                }
            }
            //}
            StringBuilder sbCommandText = new StringBuilder();
            sbCommandText.Append(string.Format(commandText, Menu_No, User_Num));
            result = MUMAPhgSql.Instance.setUserAuthority(connectionStrings, sbCommandText.ToString());
            //setUserAuthority
            //sbCommandText.Append(string.Format(commandText, menu_no, U_Num));
            //List<muserMenuSetupEntity> mmcList = MUMAPhgSql.Instance.getUserAuthority(connectionStrings, sbCommandText.ToString());//<=====================
        }
        else
        {
            result = "";
        }
        //log.endWrite(mmcList.ToString(), className, methodName);
        return result;
    }
}