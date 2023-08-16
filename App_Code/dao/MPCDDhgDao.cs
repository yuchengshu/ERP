using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MPCDDhgDao 的摘要描述
/// </summary>
public class MPCDDhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MPCDDhgDao _instance = new MPCDDhgDao();
    public static MPCDDhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MPCDDhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    
    public string cddAddData(CDDDataEntity cdee)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(cdee.ToString(), className, methodName);

        string commandText = string.Empty;
        StringBuilder sbCommandText = new StringBuilder();

        commandText = "INSERT INTO [HG].[dbo].[MPCDD] ([M_id],[CDD_date],[MC],[CDD_Note],[OP01],[OP02],[OP03],[OP04],[CDD_Status],[add_Date])VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}',GETDATE())";
        sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, cdee.M_id, cdee.CDD_date, cdee.MC, cdee.CDD_Note, cdee.OP01, cdee.OP02, cdee.OP03, cdee.OP04, cdee.CDD_Status));

        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<======

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;

    }
    public List<CDDDataEntity> getCDDlist(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID':" + M_ID, className, methodName);

        string commandText = "select M_id,CDD_date,CDD_Status,MC from MPCDD WHERE M_id = '" + M_ID + "'";
        List<CDDDataEntity> cdddeList = MPCDDhgSql.Instance.getCDDlist(connectionStrings, commandText);//<==========

        log.endWrite(cdddeList.ToString(), className, methodName);
        return cdddeList;
    }
}