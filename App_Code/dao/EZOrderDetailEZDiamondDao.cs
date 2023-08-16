using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// EZOrderDetailhgDao 的摘要描述
/// </summary>
public class EZOrderDetailEZDiamondDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectEZDiamond";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static EZOrderDetailEZDiamondDao _instance = new EZOrderDetailEZDiamondDao();
    public static EZOrderDetailEZDiamondDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public EZOrderDetailEZDiamondDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string updateCh_tag(string OD_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'OD_id' : " + OD_id, className, methodName);
        string commandText = "update EZOrderDetail set ch_tag ='1' where OD_id='" + OD_id + "'";

        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);//<======

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }
}