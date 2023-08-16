using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MMBERjoinMCOTFhgDao 的摘要描述
/// </summary>
public class MMBERjoinMCOTFhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MMBERjoinMCOTFhgDao _instance = new MMBERjoinMCOTFhgDao();
    public static MMBERjoinMCOTFhgDao Instance
    {
        get
        {
            return _instance;
        }
    }

    public MMBERjoinMCOTFhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    /// 取得業務聯絡單列表
    public List<businessConnectionDataEntity> getBusinessConnectionList(searchBusinessConnectionParamEntity sbcpe)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'sbcpe' : " + sbcpe.ToString(), className, methodName);

        string sqltxt = getSqlTxt.businessConnectionST(sbcpe.CF_ITem, sbcpe.F_Status, sbcpe.keyWord);//加入關鍵字查詢條件
        string commandText = getCommandText.businessConnectionCT(sbcpe.U_MDEP, sbcpe.U_Num, sqltxt);
        log.debug2("'commandText' : "+ commandText,className, "getBusinessConnectionList");
        
        List<businessConnectionDataEntity> bcdeList = MMBERjoinMCOTFhgSql.Instance.getBusinessConnectionList(connectionStrings, commandText);//取得業務聯絡單列表

        log.endWrite("'bcdeList' : "+ bcdeList.ToString(), className, methodName);
        return bcdeList;
    }
}