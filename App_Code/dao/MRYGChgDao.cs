using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// MRYGChgDao 的摘要描述
/// </summary>
public class MRYGChgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MRYGChgDao _instance = new MRYGChgDao();
    public static MRYGChgDao Instance
    {
        get
        {
            return _instance;
        }
    }

    public MRYGChgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
   
    public assignNameDateEntity getAssignNameDate(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' :" + M_ID.ToString(), className, methodName);
        string commandText = "select Assign_Name,Assign_Date from MRYGC where M_ID='" + M_ID + "' and assign_tag='0'";
        assignNameDateEntity ande = MRYGChgSql.Instance.getAssignNameDate(connectionStrings, commandText);//<===
        string logBackString = string.Empty;
        if (ande != null)
        {
            logBackString = ande.ToString();
        }
        log.endWrite(logBackString, className, methodName);
        return ande;
    }

    /*
     *  /// <summary>
    /// 新增交易明細
    /// </summary>
    /// <param name="cde"></param>
    /// <returns></returns>
    public string sendDTRAT(chargeDetailEntity cde)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(cde.ToString(), className, methodName);
        string commandText = string.Empty;
        StringBuilder sbCommandText = new StringBuilder();
        if (common.isEmpty(cde.DT_ID))
        {
            commandText = "INSERT INTO [HG].[dbo].[DTRAT] ([T_ID],[Pay_tag],[Account_Date],[MC],[MC_Name],[MC_Com],[Account_Money],[Pay_Type],[add_user],[add_date],[add_ip],[edit_date],[T_Com])VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}',GETDATE(),'{9}',GETDATE(),'{10}')";
            sbCommandText = new StringBuilder();
            sbCommandText.Append(string.Format(commandText, cde.T_ID, cde.Pay_tag, cde.Account_Date, cde.MC, cde.MC_Name, cde.MC_Com, cde.Account_Money, cde.Pay_Type, cde.add_user, cde.add_ip,cde.T_Com));
        }
        else {
            commandText = "update [HG].[dbo].[DTRAT] set [Pay_tag]='{0}',[Account_Date]='{1}',[MC]='{2}',[MC_Name]='{3}',[MC_Com]='{4}',[Account_Money]='{5}',[Pay_Type]='{6}',[edit_user]='{7}',[edit_date]=GETDATE() ,[edit_ip]='{8}',[T_Com]='{10}' where DT_ID='{9}'";
            sbCommandText = new StringBuilder();
            sbCommandText.Append(string.Format(commandText, cde.Pay_tag, cde.Account_Date, cde.MC, cde.MC_Name, cde.MC_Com, cde.Account_Money, cde.Pay_Type, cde.add_user, cde.add_ip, cde.DT_ID, cde.T_Com));
        }
        
        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<======

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;

    }
     */
    //新增派發紀錄到MRYGC//由service呼叫
    public string addAssignCase(MRYGCEntity mRYGCEntity)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(mRYGCEntity.ToString(), className, methodName);
        string commandText = string.Empty;
        StringBuilder sbCommandText = new StringBuilder();
        if (common.isEmpty(mRYGCEntity.M_id))
        {
            commandText = "INSERT INTO [HG].[dbo].[MRYGC] ([M_id],[Assign_user],[Assign_Name],[Assign_Date],[Assign_EndDate],[Assign_tag],[del_tag],[add_user],[add_date],[add_ip]) VALUES";
           // commandText = "INSERT INTO [HG].[dbo].[DTRAT] ([T_ID],[Pay_tag],[Account_Date],[MC],[MC_Name],[MC_Com],[Account_Money],[Pay_Type],[add_user],[add_date],[add_ip],[edit_date],[T_Com])VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}',GETDATE(),'{9}',GETDATE(),'{10}')";
            sbCommandText = new StringBuilder();
            //  (M_id,Assign_user,Assign_Name,Assign_Date,Assign_EndDate,Assign_tag,del_tag,add_user,add_date,add_ip)
            //"INSERT INTO [HG].[dbo].[MRYGC] ([M_id],[Assign_user],[Assign_Name],[Assign_Date],[Assign_EndDate],[Assign_tag],[del_tag],[add_user],[add_date],[add_ip])
            sbCommandText.Append(string.Format(commandText, mRYGCEntity.M_id, mRYGCEntity.Assign_user, mRYGCEntity.Assign_Name, mRYGCEntity.Assign_Date, mRYGCEntity.Assign_EndDate, mRYGCEntity.Assign_tag, mRYGCEntity.del_tag, mRYGCEntity.add_date, mRYGCEntity.add_ip));
        }

        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<======

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }
}