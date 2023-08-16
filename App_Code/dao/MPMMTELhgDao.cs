using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MMTELhgDao 的摘要描述
/// </summary>
public class MPMMTELhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MMTELhgDao _instance = new MMTELhgDao();
    public static MMTELhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MPMMTELhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<MPMMTELEntity> getMPMMTELhgdata()
    {
        getAnalystParamEntity gape = new getAnalystParamEntity();
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'gape' :" + gape.ToString(), className, methodName);

        string sql_txt = getSqlTxt.getMMTELdataST(gape.MR_DateY, gape.MR_DateM);
        string commandText = "select MT_Date,MT_Teacher,MT_Program,MT_Okey,MT_Nkey from MMTEL where del_tag = '0'"+ sql_txt;
        List<MPMMTELEntity> mdeList = new List<MPMMTELEntity>();
        ////MMTELhgSql.Instance.getMMTELdata(connectionStrings, commandText);//<====

        log.endWrite("'mdeList' :" + mdeList.ToString(), className, methodName);
        return mdeList;
    }
}