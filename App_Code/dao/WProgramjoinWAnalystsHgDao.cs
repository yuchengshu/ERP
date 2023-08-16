using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// WProgramjoinWAnalystsHgDao 的摘要描述
/// </summary>
public class WProgramjoinWAnalystsHgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static WProgramjoinWAnalystsHgDao _instance = new WProgramjoinWAnalystsHgDao();
    public static WProgramjoinWAnalystsHgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public WProgramjoinWAnalystsHgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<ProgramEntity> getProgram(getAnalystParamEntity gape)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'gape' : " + gape.ToString(), className, methodName);

        string sql_txt = getSqlTxt.getProgramST(gape.MR_DateY, gape.MR_DateM);
        string commandText = " select a.P_Channel,a.P_Time,a.P_Date,b.U_num,a.P_ID from WProgram a join WAnalysts b on a.P_Teacher = b.T_id where a.open_tag='0'  and a.del_tag = '0' "+ sql_txt + "  order by P_Time";
        List<ProgramEntity> peList = WProgramjoinWAnalystsHgSql.Instance.getProgram(connectionStrings, commandText);//<==========

        log.endWrite("'peList' : " + peList.ToString(), className, methodName);
        return peList;
    }
}