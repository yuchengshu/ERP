using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MCASHhgDao 的摘要描述
/// </summary>
public class MCASHhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MCASHhgDao _instance = new MCASHhgDao();
    public static MCASHhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MCASHhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string SendAddcfasData(SendAddcfasDataParamEntity saCFASdpe)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'saCFASdpe' : " + saCFASdpe.ToString(), className, methodName);

        string commandText = "INSERT INTO MCASH([M_id],[MC],[MC_name],[mc_com],[Pay_Serial],[P_Name],[Price],[VerifyNo],[SExpenses],[TExpenses],[T_id],[mp_item],[C_name],[C_Email],[C_Tel],[T_Sdate],[T_Edate],[EffectiveDate],[SalesName],[HeadsSign],[adminSign],[PS],[Pay_Tag],[add_date],[add_user],[add_com],[CExpenses],[OExpenses])VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}','{15}','{16}','{17}','{18}','{19}','{20}','{21}','{22}',GETDATE(),'{23}','{24}','{25}','{26}')";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(commandText, saCFASdpe.M_id, saCFASdpe.MC, saCFASdpe.MC_name, saCFASdpe.mc_com, saCFASdpe.Pay_Serial, saCFASdpe.P_Name, saCFASdpe.Price, saCFASdpe.VerifyNo, saCFASdpe.SExpenses, saCFASdpe.TExpenses, saCFASdpe.T_id, saCFASdpe.mp_item, saCFASdpe.C_name, saCFASdpe.C_Email, saCFASdpe.C_Tel, saCFASdpe.T_Sdate, saCFASdpe.T_Edate, saCFASdpe.EffectiveDate, saCFASdpe.SalesName, saCFASdpe.HeadsSign, saCFASdpe.adminSign, saCFASdpe.PS, saCFASdpe.Pay_Tag, saCFASdpe.add_user, saCFASdpe.add_com, saCFASdpe.CExpenses, saCFASdpe.OExpenses));

        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sb.ToString());

        log.endWrite("'backStr' : " + backStr, className, methodName);
        return backStr;
    }


    public string getBackTagLink(string ca_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ca_id' : " + ca_id.ToString(), className, methodName);

        string commandText = "select contractid from mcash where ca_id = '" + ca_id + "' and del_tag = '0' ";

        string backStr = MCASHhgSql.Instance.getBackTagLink(connectionStrings, commandText);

        log.endWrite("'backStr' : " + backStr, className, methodName);
        return backStr;
    }
    public List<appointDataEntity> getAppointData(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("M_ID=" + M_ID, className, methodName);

        string commandText = "select C_name, P_Name, Price, T_Sdate, T_Edate, Pay_Serial, ca_id from mcash where M_id = '" + M_ID + "'";
        List<appointDataEntity> adeList = MCASHhgSql.Instance.getAppointData(connectionStrings, commandText);//<==========

        log.endWrite("adeList : " + adeList.ToString(), className, methodName);
        return adeList;
    }

}