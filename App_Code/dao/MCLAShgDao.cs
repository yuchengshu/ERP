using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MCLAShgDao 的摘要描述
/// </summary>
public class MCLAShgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MCLAShgDao _instance = new MCLAShgDao();
    public static MCLAShgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MCLAShgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public workTimeEntity getWorkTimeEntity(string year, string month)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        string commandText = "select * From MCLAS where C_Year ='" + year + "' and C_Month='" + month + "' ";
        workTimeEntity wte = MCLAShgSql.Instance.getWorkTimeEntity(connectionStrings, commandText);//<======

        log.endWrite("'wte':" + wte.ToString(), className, methodName);
        return wte;
    }
    //(StartDate, EndDate, MP)

    public List<MCLASEntity> getMCLASList(string StartDate, string EndDate, string MP)
    {
        //StartDate
        //EndDate

        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        string commandText = "";
        string[] DATE_Split = StartDate.Split('/');
        string MR_DateY = "";
        string MR_DateM = "";
        if (DATE_Split.Length > 1)
        {
            MR_DateY = (int.Parse(DATE_Split[2])).ToString();
            MR_DateM = (int.Parse(DATE_Split[0])).ToString();
        }
        else
        {
            MR_DateY = StartDate;
            MR_DateM = EndDate;
        }
        string temp="";
        if(MR_DateY.Length<MR_DateM.Length)
        {
            temp = MR_DateM;
            MR_DateM = MR_DateY;
            MR_DateY = temp;
        }
       
        if (MP.Trim() == "")//如果MP為空值,則查詢所有人
        {
            commandText = "select * From MCLAS where C_Year ='" + MR_DateY + "' and C_Month='" + MR_DateM + "' ";
        }
        else
        {
            commandText = "select * From MCLAS where C_Year ='" + MR_DateY + "' and C_Month='" + MR_DateM + "' ";
        }
        List<MCLASEntity> MCLAS = MCLAShgSql.Instance.getMCLASEntity(connectionStrings, commandText);//<======取得當年當月的規定上下班時間
        log.endWrite("'wte':" + MCLAS.ToString(), className, methodName);
        return MCLAS;
    }

    public List<MCLASEntity> getMCLASList_(string MR_DateY, string MR_DateM, string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        string commandText = "";
        if (MP.Trim() == "")//如果MP為空值,則查詢所有人
        {
            commandText = "select * From MCLAS where C_Year ='" + MR_DateY + "' and C_Month='" + MR_DateM + "' ";
        }
        else
        {
            commandText = "select * From MCLAS where C_Year ='" + MR_DateY + "' and C_Month='" + MR_DateM + "' ";
        }
        List<MCLASEntity> MCSE = MCLAShgSql.Instance.getMCLASEntity(connectionStrings, commandText);//<======
        log.endWrite("'wte':" + MCSE.ToString(), className, methodName);
        return MCSE;
    }
}