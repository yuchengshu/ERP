using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MSGPThgDao 的摘要描述
/// </summary>
public class MSGPThgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MSGPThgDao _instance = new MSGPThgDao();
    public static MSGPThgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MSGPThgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<publicMessageEntity> getPublicMessage()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        string commandText = "select auto_id,Msg_Context from MSGPT where del_tag = '0' order by ADD_DATE";

        List<publicMessageEntity> pmeList = MSGPThgSql.Instance.getPublicMessage(connectionStrings, commandText);//<===

        log.endWrite("'pmeList' :" + pmeList.ToString(), className, methodName);
        return pmeList;
    }

    public string mdAddDeleteEdit(string auto_id, string Msg_Context, string dataAction, string actionUser)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'auto_id' :" + auto_id + "'Msg_Context' :" + Msg_Context + "'dataAction' :" + dataAction + "'actionUser' :" + actionUser, className, methodName);
       
        string commandText = string.Empty;
        switch (dataAction)
        {
            case "mdAdd":
                commandText = "INSERT INTO MSGPT (Msg_Context, add_date, add_user)VALUES ('"+ Msg_Context + "', GETDATE(),'" + actionUser + "')";
                break;
            case "mdDelete":
                commandText = "UPDATE MSGPT SET del_tag = '1' WHERE auto_id = '"+ auto_id + "'";
                break;
            case "mdEdit":
                commandText = "UPDATE MSGPT SET Msg_Context = '"+ Msg_Context + "',edit_user = '"+ actionUser + "',edit_date = GETDATE() WHERE auto_id = '" + auto_id + "'";
                break;
        }
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
}