using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MMTELhgDao 的摘要描述
/// </summary>
public class MMTELhgDao
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
    public MMTELhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<MMTELdataEntity> getMMTELdata(getAnalystParamEntity gape)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'gape' :" + gape.ToString(), className, methodName);

        string sql_txt = getSqlTxt.getMMTELdataST(gape.MR_DateY, gape.MR_DateM);
        string commandText = "select MT_Date,MT_Teacher,MT_Program,MT_Okey,MT_Nkey from MMTEL where del_tag = '0'"+ sql_txt;
        List<MMTELdataEntity> mdeList = MMTELhgSql.Instance.getMMTELdata(connectionStrings, commandText);//<====

        log.endWrite("'mdeList' :" + mdeList.ToString(), className, methodName);
        return mdeList;
    }
    //取得全部電話統計作業資料
    public List<MMTELdataEntity> getMMTELdata()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'gape' :" + gape.ToString(), className, methodName);

        //string sql_txt = getSqlTxt.getMMTELdataST(gape.MR_DateY, gape.MR_DateM);
        string commandText = "select MT_Date,MT_Teacher,MT_Program,MT_Okey,MT_Nkey from MMTEL where del_tag = '0'";// + sql_txt;
        List<MMTELdataEntity> mdeList = MMTELhgSql.Instance.getMMTELdata(connectionStrings, commandText);//<====

        log.endWrite("'mdeList' :" + mdeList.ToString(), className, methodName);
        return mdeList;
    }
    //20200505要修改的地方
    //取得全部電話統計作業列表(種類,節目名稱(名稱),節目名稱(時段))
    public List<MMTELdataEntity> getAllMMTELdata()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'gape' :" + gape.ToString(), className, methodName);

        //string sql_txt = getSqlTxt.getMMTELdataST(gape.MR_DateY, gape.MR_DateM);
        string sql_txt = "";
        //SELECT B.P_Item,B.P_Channel,b.P_ID FROM MITEM A Left join WProgram B on A.ditcode=B.P_Item Where b.P_ID=20
        //SELECT B.P_Item,B.P_Channel,b.P_ID FROM MITEM A Left join WProgram B on A.ditcode=B.P_Item Where b.P_ID=20
        //string commandText = "SELECT A.ddesc,B.P_Item,B.P_Channel,B.P_Date,B.P_ID FROM MITEM A Left join WProgram B on A.ditcode=B.P_Item Where a.mitcode='PROGM' and P_Item is not null";// and B.P_ID=36";//求出所有電話統計作業資料\
        string commandText = "select a.MT_Date,c.U_Name AS MT_Teacher,d.ddesc,b.P_Channel+'【'+b.P_Time +b.P_Date+'】' AS TV_Program_Name,a.MT_Okey,a.MT_Nkey,e.U_Name add_UserName  from MMTEL a left join WProgram b on a.MT_Program=b.P_ID left join MUSER c on a.MT_Teacher=c.U_Num left join MUSER e on a.add_user=e.U_Num left join MITEM d on d.ditcode=b.P_Item Where d.mitcode='PROGM' order by MT_Date desc;";

        //取得全部電話統計作業列表
        List<MMTELdataEntity> mdeList = MMTELhgSql.Instance.getMPMMTELdata(commandText);//<====

        log.endWrite("'mdeList' :" + mdeList.ToString(), className, methodName);
        return mdeList;
    }
    //Q_Analyst:分析師員工編號
    public List<MMTELdataEntity> getAllMMTELdata(string Q_Analyst)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'gape' :" + gape.ToString(), className, methodName);

        //string sql_txt = getSqlTxt.getMMTELdataST(gape.MR_DateY, gape.MR_DateM);
        string sql_txt = "and c.U_Num='"+ Q_Analyst + "'"+ "order by MT_Date desc;";
        //SELECT B.P_Item,B.P_Channel,b.P_ID FROM MITEM A Left join WProgram B on A.ditcode=B.P_Item Where b.P_ID=20
        //SELECT B.P_Item,B.P_Channel,b.P_ID FROM MITEM A Left join WProgram B on A.ditcode=B.P_Item Where b.P_ID=20
        string commandText = "select a.MT_Date,c.U_Name AS MT_Teacher,d.ddesc,b.P_Channel+'【'+b.P_Time +b.P_Date+'】' AS TV_Program_Name,a.MT_Okey,a.MT_Nkey,e.U_Name add_UserName  from MMTEL a left join WProgram b on a.MT_Program=b.P_ID left join MUSER c on a.MT_Teacher=c.U_Num left join MUSER e on a.add_user=e.U_Num left join MITEM d on d.ditcode=b.P_Item Where d.mitcode='PROGM'";
        commandText = commandText + sql_txt;
        //取得全部電話統計作業列表
        List<MMTELdataEntity> mdeList = MMTELhgSql.Instance.getMPMMTELdata(commandText);//<====

        log.endWrite("'mdeList' :" + mdeList.ToString(), className, methodName);
        return mdeList;
    }
}