using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MSEDThgDao 的摘要描述
/// </summary>
public class MSEDThgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MSEDThgDao _instance = new MSEDThgDao();
    public static MSEDThgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MSEDThgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<dataGiftTableEntity> getDataGiftTable(string ComID, string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID' :" + ComID + "'U_MDEP' :" + U_MDEP, className, methodName);
        string commandText = string.Empty;

        if (U_MDEP == "0001" || U_MDEP == "0003" || U_MDEP == "0004" || U_MDEP == "0009" || U_MDEP == "0010")
        {
            commandText = "select * from MSEDT";
        }
        else
        {
            commandText = "select * from MSEDT where MP_Com='"+ ComID + "'";
        }
        List<dataGiftTableEntity> dgteList = MSEDThgSql.Instance.getDataGiftTable(connectionStrings, commandText);//<==========

        log.endWrite("'dgteList' :" + dgteList.ToString(), className, methodName);
        return dgteList;
    }

    public string editData(dataGiftTableEntity dgte)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'dgte' :" + dgte.ToString(), className, methodName);

        string commandText = "update MSEDT set M_id = '{0}',M_Password = '{1}',MP_Num = '{2}',MP_Name = '{3}',MP_Com = '{4}',ddesc = '{5}',[Start_date] = '{6}',End_date = '{7}',Pay = '{8}',Tel_tag = '{9}',Call_tag = '{10}',Action_tag = '{11}',Img = '{12}',edit_date = GETDATE() where s_id='{13}'";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(commandText, dgte.M_id, dgte.M_Password,dgte.MP_Num,dgte.MP_Name,dgte.MP_Com,dgte.ddesc,dgte.Start_date,dgte.End_date, dgte.Pay,dgte.Tel_tag,dgte.Call_tag,dgte.Action_tag,dgte.Img,dgte.s_id));
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sb.ToString());//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
}