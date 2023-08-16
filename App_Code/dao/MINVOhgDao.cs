using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MINVOhgDao 的摘要描述
/// </summary>
public class MINVOhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MINVOhgDao _instance = new MINVOhgDao();
    public static MINVOhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MINVOhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<MINVOEntity> getMINVOData()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        string commandText = "select * from MINVO WHERE del_tag = '0' order by COM_ID";
        //MINVOEntity _MINVOEntity= MINVOhgSql.Instance.getMINVOData(connectionStrings, commandText);
        List<MINVOEntity> _MINVOEntity= MINVOhgSql.Instance.getMINVOData(connectionStrings, commandText);//<==========
        log.endWrite(_MINVOEntity.ToString(), className, methodName);
        return _MINVOEntity;


    }
    public companyDataEntity getCompanyData()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        string commandText = "select COM_ID,COM_NAME from MINVO WHERE del_tag = '0' order by COM_ID";
        companyDataEntity cde = MINVOhgSql.Instance.getCompanyData(connectionStrings, commandText);

        log.endWrite(cde.ToString(), className, methodName);
        return cde;
    }
    //新增發票公司資料(在[MINVO]中新增一筆資料)
    public void addMINVOData(MINVOEntity mINVOEntity)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'mINVOEntity':" + mINVOEntity, className, methodName);
                              //                             0            1          2          3       4          5           6                    
        string commandText = "INSERT INTO [dbo].[MINVO] ([Com_Name],[Uniform_Num],[Tax_Num],[del_tag],[add_ip],[add_user],[add_date]) VALUES('{0}', '{1}', '{2}', '{3}', '{4}',  '{5}',GETDATE(),'{6}',GETDATE())";
        StringBuilder sbCommandText = new StringBuilder();       //0                1                           2               3                       4                       5   
        sbCommandText.Append(string.Format(commandText, mINVOEntity.Com_Name, mINVOEntity.Uniform_Num, mINVOEntity.Tax_Num, mINVOEntity.del_tag, mINVOEntity.add_ip, mINVOEntity.add_user, mINVOEntity.edit_user));
        noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite(common.nothing, className, methodName);
        //string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite(common.nothing, className, methodName);

        //string commandText = "select COM_ID,COM_NAME from MINVO WHERE del_tag = '0' order by COM_ID";
        ////companyDataEntity cde = 
        //    MINVOhgSql.Instance.addCompanyData(connectionStrings, commandText);
        ////20221014
        /*
         *  if (common.isEmpty(cde.DT_ID))
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
         */
        // log.endWrite(cde.ToString(), className, methodName);
        // return cde;
    }

    //更新公司資料(在[MINVO]中更新一筆資料)
    public void updateMINVOData(MINVOEntity mINVOEntity)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'mINVOEntity':" + mINVOEntity, className, methodName);
        //                                                       0                1                2               3                                                      4                                     
        string commandText = "UPDATE [dbo].[MINVO] SET [Com_Name] ='{0}',[Uniform_Num] ='{1}',[Tax_Num] = '{2}',[edit_user] = '{3}',[edit_date] =GETDATE()  WHERE [Com_id]='{4}'";
        StringBuilder sbCommandText = new StringBuilder();       //0                1                           2                       3               4                                                     
        sbCommandText.Append(string.Format(commandText, mINVOEntity.Com_Name, mINVOEntity.Uniform_Num, mINVOEntity.Tax_Num, mINVOEntity.edit_user, mINVOEntity.Com_id));
        noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite(common.nothing, className, methodName);
        //string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite(common.nothing, className, methodName);

        //string commandText = "select COM_ID,COM_NAME from MINVO WHERE del_tag = '0' order by COM_ID";
        ////companyDataEntity cde = 
        //    MINVOhgSql.Instance.addCompanyData(connectionStrings, commandText);
        ////20221014
        /*
         *  if (common.isEmpty(cde.DT_ID))
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
         */
        // log.endWrite(cde.ToString(), className, methodName);
        // return cde;
    }
}