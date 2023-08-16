using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;


/// <summary>
/// MCONThgDao 的摘要描述
/// </summary>
public class MCOTFhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MCOTFhgDao _instance = new MCOTFhgDao();
    public static MCOTFhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MCOTFhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }


    public string getMC_Name(string M_ID)
    {
        string MC_Name = "";
        return MC_Name;
    }
    //更改責任助理[新助理]
    public string getU_Agent_Name(string F_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;

        string commandText = "SELECT [getU_Agent_Name] FROM [HG].[dbo].[MCOTF] Where F_ID='" + F_ID + "' and del_tag='0'";
        //StringBuilder sbCommandText = new StringBuilder();
        //sbCommandText.Append(string.Format(commandText, f_id));
        //List<MPMCOTFDataEditRecordEntity> bce = MCOTFhgSql.Instance.getBusinessConnectionDataEditRecord(connectionStrings, commandText.ToString());//<=====================
        string U_Agent_Name = MCOTFhgSql.Instance.getU_Agent_Name(connectionStrings, commandText.ToString());
        return U_Agent_Name;
    }
    public string getM_ID(string F_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;

        string commandText = "SELECT [M_ID] FROM [HG].[dbo].[MCOTF] Where F_ID='" + F_ID + "' and del_tag='0'";
        //StringBuilder sbCommandText = new StringBuilder();
        //sbCommandText.Append(string.Format(commandText, f_id));
        //List<MPMCOTFDataEditRecordEntity> bce = MCOTFhgSql.Instance.getBusinessConnectionDataEditRecord(connectionStrings, commandText.ToString());//<=====================
        string M_ID = MCOTFhgSql.Instance.getOLD_MC_NAME(connectionStrings, commandText.ToString());
        return M_ID;
    }
    //更改責任助理[原助理]
    public string getOLD_MC_NAME(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;

        string commandText = "SELECT [MC_NAME] FROM MMBER Where M_ID='" + M_ID + "'";
        //StringBuilder sbCommandText = new StringBuilder();
        //sbCommandText.Append(string.Format(commandText, f_id));
        //List<MPMCOTFDataEditRecordEntity> bce = MCOTFhgSql.Instance.getBusinessConnectionDataEditRecord(connectionStrings, commandText.ToString());//<=====================
        string OLD_MC_NAME = MCOTFhgSql.Instance.getOLD_MC_NAME(connectionStrings, commandText.ToString());
        return OLD_MC_NAME;
    }
    public string getNEW_MC_NAME(string F_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;

        string commandText = "SELECT [U_Agent_Name] FROM MCOTF a where f_id = '" + F_ID + "' and del_tag = '0'";
        //StringBuilder sbCommandText = new StringBuilder();
        //sbCommandText.Append(string.Format(commandText, f_id));
        string NEW_MC_NAME = MCOTFhgSql.Instance.getNEW_MC_NAME(connectionStrings, commandText.ToString());//<=====================

        return NEW_MC_NAME;
    }
    //新增業務聯絡單
    public string addBusinessConnection(businessConnectionEntity bce)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'bce' : " + bce.ToString(), className, methodName);
        string commandText = string.Empty;
        StringBuilder sbCommandText = null;
        //依照不同的聯絡單種類產生不同的新增SQL語法
        switch (bce.CF_Item)//由聯絡單種類進行新增資料動作
        {
            //其他
            case "0011":
                commandText = " INSERT INTO [HG].[dbo].[MCOTF] ([M_ID],[CF_Item],[PS],[Obj],[F_Status],[add_date],[add_user],[add_com],[add_ip]) VALUES('{0}', '{1}', '{2}', '{3}', '1', GETDATE(), '{4}', '{5}', '{6}')";
                sbCommandText = new StringBuilder();
                sbCommandText.Append(string.Format(commandText, bce.M_ID, bce.CF_Item, bce.PS, bce.Obj, bce.add_user, bce.add_com, bce.add_ip));
                //                                                   0       1           2         3         4          5              6           
                break;
            //轉換老師
            case "0010":
                commandText = " INSERT INTO [HG].[dbo].[MCOTF] ([M_ID],[CF_Item],[C_tag],[U_Leader],[U_LeaderName],[PS],[Obj],[F_Status],[add_date],[add_user],[add_com],[add_ip],[U_LeaderCom]) VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '1', GETDATE(), '{8}', '{9}', '{10}', '{11}')";
                sbCommandText = new StringBuilder();
                sbCommandText.Append(string.Format(commandText, bce.M_ID, bce.CF_Item, bce.C_tag, bce.U_Leader, bce.U_LeaderName, bce.PS, bce.Obj, bce.F_Status, bce.add_user, bce.add_com, bce.add_ip, bce.U_LeaderCom));
                break;
            //暫停/恢復
            case "0009":
                commandText = " INSERT INTO [HG].[dbo].[MCOTF] ([M_ID],[CF_Item],[S_tag],[S_ID],[S_Name],[SSDate],[U_Leader],[U_LeaderName],[U_LeaderCom],[PS],[Obj],[F_Status],[add_date],[add_user],[add_com],[add_ip]) VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}', '{10}', '1', GETDATE(),'{12}','{13}','{14}')";
                sbCommandText = new StringBuilder();
                sbCommandText.Append(string.Format(commandText, bce.M_ID, bce.CF_Item, bce.S_tag, bce.S_ID, bce.S_Name, bce.SSDate, bce.U_Leader, bce.U_LeaderName, bce.U_LeaderCom, bce.PS, bce.Obj, bce.F_Status, bce.add_user, bce.add_com, bce.add_ip));
                break;
            //退費
            case "0008":
                commandText = " INSERT INTO [HG].[dbo].[MCOTF] ([M_ID],[CF_Item],[B_ID],[B_Name],[B_Paymoney],[U_Leader],[U_LeaderName],[U_LeaderCom],[PS],[Obj],[F_Status],[add_date],[add_user],[add_com],[add_ip]) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}', '1', GETDATE(),'{11}','{12}','{13}')";
                sbCommandText = new StringBuilder();
                sbCommandText.Append(string.Format(commandText, bce.M_ID, bce.CF_Item, bce.B_ID, bce.B_Name, bce.B_Paymoney, bce.U_Leader, bce.U_LeaderName, bce.U_LeaderCom, bce.PS, bce.Obj, bce.F_Status, bce.add_user, bce.add_com, bce.add_ip));
                break;
            //訂金件
            case "0007":
                commandText = " INSERT INTO [HG].[dbo].[MCOTF] ([M_ID],[CF_Item],[B_ID],[B_Name],[B_Paymoney],[U_Leader],[U_LeaderName],[U_LeaderCom],[PS],[Obj],[F_Status],[add_date],[add_user],[add_com],[add_ip])VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}', '1', GETDATE(),'{11}','{12}','{13}')";
                sbCommandText = new StringBuilder();
                sbCommandText.Append(string.Format(commandText, bce.M_ID, bce.CF_Item, bce.B_ID, bce.B_Name, bce.B_Paymoney, bce.U_Leader, bce.U_LeaderName, bce.U_LeaderCom, bce.PS, bce.Obj, bce.F_Status, bce.add_user, bce.add_com, bce.add_ip));
                break;
            //折讓
            case "0006":
                //[M_ID] ,[CF_Item],[Results_Item], [PT_Item],[Pay_Type] ,[CellPhone] ,[Fax],[Mess],[Media],[P_Text],[P_video],[discount],[CMonth],[T_ID],[T_Name],[D_MP],[D_Item] ,[D_Type] ,[D_Paymoney],[D_tag],[DSdate] ,[DEdate] ,[C_tag] ,[U_Leader],[U_LeaderName],[U_LeaderCom],[L_Ps],[U_LeaderStatus] ,[U_LeaderStatusTime],[EX],[EX_Name],[EX_Com],[EX_Ps],[EX_Status],[EX_StatusTime],[EXLeader],[EX_LeaderName],[EX_LeaderCom],[EXL_Ps],[EX_LeaderStatus],[EX_LeaderStatusTime],[PS],[Obj],[F_Status],[del_tag] ,[add_date],[add_user] ,[add_com] ,[add_ip] ,
                // //(M_ID,CF_Item,Results_Item,PT_Item,Pay_Type,CellPhone,Fax,Mess,Media,P_Text,P_video,discount,CMonth,T_ID,T_Name,D_MP,D_Item,D_Type,D_Paymoney,D_tag,DSdate,DEdate,C_tag,U_Leader,U_LeaderName,U_LeaderCom,L_Ps,U_LeaderStatus,U_LeaderStatusTime,EX,EX_Name,EX_Com,EX_Ps,EX_Status,EX_StatusTime,EXLeader,EX_LeaderName,EX_LeaderCom,EXL_Ps,EX_LeaderStatus,EX_LeaderStatusTime,PS,Obj,F_Status,del_tag ,add_date,add_user ,add_com ,add_ip

                //commandText = " INSERT INTO [HG].[dbo].[MCOTF] ([M_ID] ,[CF_Item],[Results_Item],[T_Type], [MP_ID],[MP_Item] ,[T_ID] ,[Paymoney],[Mess],[Media],[P_Text],[P_video],[discount],[CMonth],[T_ID],[T_Name],[D_MP],[D_Item] ,[D_Type] ,[D_Paymoney],[D_tag],[DSdate] ,[DEdate] ,[C_tag] ,[U_Leader],[U_LeaderName],[U_LeaderCom],[L_Ps],[U_LeaderStatus] ,[U_LeaderStatusTime],[EX],[EX_Name],[EX_Com],[EX_Ps],[EX_Status],[EX_StatusTime],[EXLeader],[EX_LeaderName],[EX_LeaderCom],[EXL_Ps],[EX_LeaderStatus],[EX_LeaderStatusTime],[PS],[Obj],[F_Status],[del_tag] ,[add_date],[add_user] ,[add_com] ,[add_ip]) " +
                commandText = "INSERT INTO [HG].[dbo].[MCOTF] ([M_ID] ,[CF_Item],[Results_Item], [PT_Item],[Pay_Type] ,[CellPhone] ,[Fax],[Mess],[Media],[P_Text],[P_video],[discount],[CMonth],[T_ID],[T_Name],[D_MP],[D_Item] ,[D_Type] ,[D_Paymoney],[D_tag],[DSdate] ,[DEdate] ,[C_tag] ,[U_Leader],[U_LeaderName],[U_LeaderCom],[L_Ps],[U_LeaderStatus] ,[U_LeaderStatusTime],[EX],[EX_Name],[EX_Com],[EX_Ps],[EX_Status],[EX_StatusTime],[EXLeader],[EX_LeaderName],[EX_LeaderCom],[EXL_Ps],[EX_LeaderStatus],[EX_LeaderStatusTime],[PS],[Obj],[F_Status],[del_tag] ,[add_date],[add_user] ,[add_com] ,[add_ip])" +
                    // 0        1          2               3       4               5       6       7      8       9       10          11         12     13      14      15     16         17          18         19      20       21        22        23          24             25         26        27                    28           29      30        31      32         33          34            35            36            37           38           39                   40           41   42         43        44       45         46        47          48                                                                                                                                                                                          
                    "VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}', '{10}', '{11}', '{12}', '{13}', '{14}', '{15}', '{16}','{17}','{18}','{19}','{20}','{21}','{22}','{23}','{24}','{25}','{26}','{27}','{28}','{29}','{30}','{31}','{32}','{33}','{34}','{35}','{36}','{37}','{38}','{39}','{40}','{41}','{42}','1','{44}',GETDATE(),'{45}','{46}','{47}')";
                sbCommandText = new StringBuilder();
                sbCommandText.Append(string.Format(commandText,
                  bce.M_ID,//0
                  bce.CF_Item,//1
                  bce.Results_Item,//2
                  bce.PT_Item,//3
                  bce.Pay_Type,//4null
                  bce.CellPhone,//5""
                  bce.Fax,//6null
                  bce.Mess,//7"undefined"
                  bce.Media,//8//1
                  bce.P_Text,//9//1
                  bce.P_video,//10null
                  bce.discount,//11
                  bce.CMonth,//12null
                  bce.T_ID,//132023030710460567
                  bce.T_Name,//14高閔漳--演講會"
                  bce.D_MP,//15null//null
                  bce.D_Item,//16null//null
                  bce.D_Type,//17mull//null
                  bce.D_Paymoney,//18//null
                  bce.D_tag,//19//null
                  bce.DSdate,//20//null
                  bce.DEdate,//21//null
                  bce.C_tag,//22//null
                  bce.U_Leader,//23//null//簽核主管(公司)
                  bce.U_LeaderName,//24//null//簽核主管(姓名)
                  bce.U_LeaderCom,//25//null//簽核主管(部門)
                  bce.L_Ps,//26//nullv
                  bce.U_LeaderStatus,//27//null
                  bce.U_LeaderStatusTime,//28//null
                  bce.EX,//29//null
                  bce.EX_Name,//30
                  bce.EX_Com,//31
                  bce.EX_Ps,//32
                  bce.EX_Status,//33
                  bce.EX_StatusTime,//34
                  bce.EXLeader,//35
                  bce.EX_LeaderName,//36
                  bce.EX_LeaderCom,//37
                  bce.EXL_Ps,//38
                  bce.EX_LeaderStatus,//39
                  bce.EX_LeaderStatusTime,//40
                  bce.PS,//41
                  bce.Obj,//42
                  bce.F_Status,//43
                  bce.del_tag,//44
                              //bce.add_date,//45
                  bce.add_user,//45
                  bce.add_com,//46
                  bce.add_ip));//47
                break;
            //更改責任助理
            case "0005":
                commandText = " INSERT INTO [HG].[dbo].[MCOTF] ([M_ID],[CF_Item],[U_Agent],[U_Agent_Name],[U_Agent_Com],[U_Leader],[U_LeaderName],[PS],[Obj],[F_Status],[add_date],[add_user],[add_com],[add_ip],[U_LeaderCom])VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '1', GETDATE(), '{10}', '{11}', '{12}', '{13}')";
                sbCommandText = new StringBuilder();
                sbCommandText.Append(string.Format(commandText, bce.M_ID, bce.CF_Item, bce.U_Agent, bce.U_Agent_Name, bce.U_Agent_Com, bce.U_Leader, bce.U_LeaderName, bce.PS, bce.Obj, bce.F_Status, bce.add_user, bce.add_com, bce.add_ip, bce.U_LeaderCom));
                break;
            //業績歸屬
            case "0004":
                commandText = " INSERT INTO [HG].[dbo].[MCOTF] ([M_ID],[CF_Item],[Attach_User],[Attach_Name],[Attach_Com],[CMonth],[Other],[U_Leader],[U_LeaderName],[PS],[Obj],[F_Status],[add_date],[add_user],[add_com],[add_ip],[U_LeaderCom])VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}', '{10}', '1', GETDATE(), '{12}', '{13}', '{14}', '{15}')";
                sbCommandText = new StringBuilder();
                sbCommandText.Append(string.Format(commandText, bce.M_ID, bce.CF_Item, bce.Attach_User, bce.Attach_Name, bce.Attach_Com, bce.CMonth, bce.Other, bce.U_Leader, bce.U_LeaderName, bce.PS, bce.Obj, bce.F_Status, bce.add_user, bce.add_com, bce.add_ip, bce.U_LeaderCom));
                break;
            //設傳真稿
            case "0003":
                commandText = "INSERT INTO [HG].[dbo].[MCOTF] ([M_ID],[CF_Item],[Fax],[U_Leader],[U_LeaderName],[Obj],[F_Status],[add_date],[add_user],[add_com],[add_ip],[U_LeaderCom],[PS] ) VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '1', GETDATE(), '{6}', '{7}', '{8}', '{9}', '{10}')";
                //                                               0          1       2         3          4       5       6         7           8          9         10      11  
                sbCommandText = new StringBuilder();
                sbCommandText.Append(string.Format(commandText, bce.M_ID, bce.CF_Item, bce.Fax, bce.U_Leader, bce.U_LeaderName, bce.Obj, bce.add_user, bce.add_com, bce.add_ip, bce.U_LeaderCom, bce.PS));
                //                                                  0       1           2               3               4           5       6           7                8           9                          
                break;
            //設訊
            case "0002":
                commandText = "INSERT INTO [HG].[dbo].[MCOTF] ([M_ID],[CF_Item],[CellPhone],[Mess],[U_Leader],[U_LeaderName],[PS],[Obj],[F_Status],[add_date],[add_user],[add_com],[add_ip],)VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '1', GETDATE(), '{8}', '{9}', '{10}', '{11}')";
                //                                                0     1           2           3       4           5         6    7        8                   9           10       11         12                                                        
                sbCommandText = new StringBuilder();
                sbCommandText.Append
                    (string.Format(commandText,
                    bce.M_ID, //0
                    bce.CF_Item, //1
                    bce.CellPhone,//2
                    bce.Mess, //3
                    bce.U_Leader,//4 
                    bce.U_LeaderName,//5 
                    bce.PS, //6
                    bce.Obj, //7
                    bce.add_user,//9
                    bce.add_com,//10
                    bce.add_ip,//11
                    bce.U_LeaderCom));//12
                break;
            //入會
            case "0001":
                commandText = "INSERT INTO [HG].[dbo].[MCOTF] ([M_ID],[MP_ID],[MP_Item],[CF_Item],[Results_Item],[Paymoney],[Paymoney1],[Paymoney2],[T_PType],[T_PType1],[T_PType2]," +
                    //                                          0        1      2           3           4           5           6           7           8           9       10   
                    "[PT_Item],[V_ID],[V_Name],[Special1_user],[Special1_userName],[Special1_usercom],[Special2_user],[Special2_userName],[Special2_usercom],[Special3_user]," +
                    // 11       12      13          14          15                      16                  17          18                      19                  20
                    "[Special3_userName],[Special3_usercom],[T_accountmoney1],[T_accountmoney2],[T_accountmoney3],[begindate_Date],[enddate_Date],[Media],[CellPhone],[Mess]," +
                    //      21                  22              23                  24              25                  26              27          28          29      30     
                    "[ATM],[T_Ivo],[INV_ITEM],[INV_Open_Item],[COMNAME],[INV_ITEM_UnifyNum],[CCard_4Num],[ca_id],[U_Leader],[U_LeaderName],[PS],[Obj],[F_Status],[add_date]," +
                    // 31    32         33          34          35          36                37            38          39      40          41    42      43       44          
                    "[add_user],[add_com],[add_ip],[U_LeaderCom],[Fax]) VALUES ({0},'{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}','{15}','{16}','{17}','{18}','{19}','{20}','{21}','{22}','{23}','{24}','{25}','{26}','{27}','{28}','{29}','{30}','{31}','{32}','{33}','{34}','{35}','{36}','{37}','{38}','{39}','{40}','{41}','{42}','1',GETDATE(),'{43}','{44}','{45}','{46}','{47}')";
                //   45         46         47       48        49                                                    
                sbCommandText = new StringBuilder();
                sbCommandText.Append(string.Format(commandText,
                    bce.M_ID,//0
                    bce.MP_ID,//1
                    bce.MP_Item,//2
                    bce.CF_Item,//3
                    bce.Results_Item,//4
                    bce.Paymoney,//5(這裡要修改!!!20230705)
                    bce.Paymoney1,//6
                    bce.Paymoney2,//7
                    bce.T_PType,//8
                    bce.T_PType1,//(多筆)付款方式1//9
                    bce.T_PType2,//(多筆)付款方式2//10
                    bce.PT_Item,//11
                    bce.V_ID,//12
                    bce.V_Name,//13
                    bce.Special1_user,//14
                    bce.Special1_userName,//15
                    bce.Special1_usercom,//16
                    bce.Special2_user,//17
                    bce.Special2_userName,//18
                    bce.Special2_usercom,//19
                    bce.Special3_user,//20
                    bce.Special3_userName,//21
                    bce.Special3_usercom,//22
                    bce.T_accountmoney1,//23
                    bce.T_accountmoney2,//24
                    bce.T_accountmoney3,//25
                    bce.begindate_Date,//26
                    bce.enddate_Date,//27
                    bce.Media,//28
                    bce.CellPhone,//設定手機29
                    bce.Mess,//30
                    bce.ATM, //信用卡末四碼31
                    bce.T_Ivo,//32
                    bce.INV_ITEM,//33
                    bce.INV_Open_Item,//34
                    bce.COMNAME,//35
                    bce.INV_ITEM_UnifyNum,//ATM後五碼36
                    bce.CCard_4Num,//37
                    bce.ca_id,//38
                    bce.U_Leader,//39
                    bce.U_LeaderName,//40
                    bce.PS,//41
                    bce.Obj,//42
                    bce.add_user,//43
                    bce.add_com,//44
                    bce.add_ip,//45
                    bce.U_LeaderCom,//46
                    bce.Fax//47
                    ));//初始設成[處理中]
                break;

        }

        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    public string getDetail_S_Date(string f_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;

        string commandText = "SELECT S_paymoney FROM [HG].[dbo].[MCOTF] where f_id='" + f_ID + "'";
        //StringBuilder sbCommandText = new StringBuilder();
        //sbCommandText.Append(string.Format(commandText, f_id));
        string S_Date = MCOTFhgSql.Instance.getDetail_S_Date(connectionStrings, commandText.ToString());//<=====================

        log.endWrite("'f_ID' : " + f_ID.ToString(), className, methodName);//當月or次月
        return S_Date;
    }

    public string getDetail_S_tag(string f_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;

        string commandText = "SELECT S_tag FROM [HG].[dbo].[MCOTF] where f_id='" + f_ID + "'";
        //StringBuilder sbCommandText = new StringBuilder();
        //sbCommandText.Append(string.Format(commandText, f_id));
        string S_tag = MCOTFhgSql.Instance.getDetail_S_tag(connectionStrings, commandText.ToString());//<=====================
        //加入判斷
        log.endWrite("'f_ID' : " + f_ID.ToString(), className, methodName);//當月or次月
        return S_tag;
    }

    public string getDetail_S_ID(string f_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;

        string commandText = "SELECT S_ID FROM [HG].[dbo].[MCOTF] where f_id='" + f_ID + "'";
        //StringBuilder sbCommandText = new StringBuilder();
        //sbCommandText.Append(string.Format(commandText, f_id));
        string S_ID = MCOTFhgSql.Instance.getDetail_S_ID(connectionStrings, commandText.ToString());//<=====================

        log.endWrite("'f_ID' : " + f_ID.ToString(), className, methodName);//當月or次月
        return S_ID;
    }

    public string getDetail_S_Name(string f_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;

        string commandText = "SELECT S_Name FROM [HG].[dbo].[MCOTF] where f_id='" + f_ID + "'";
        //StringBuilder sbCommandText = new StringBuilder();
        //sbCommandText.Append(string.Format(commandText, f_id));
        string S_Name = MCOTFhgSql.Instance.getDetail_S_Name(connectionStrings, commandText.ToString());//<=====================

        log.endWrite("'S_Name' : " + S_Name.ToString(), className, methodName);//當月or次月
        return S_Name;
    }



    //取得月份
    public string getCMonth(string f_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;

        string commandText = "SELECT CMonth FROM [HG].[dbo].[MCOTF] where f_id='" + f_ID + "'";
        //StringBuilder sbCommandText = new StringBuilder();
        //sbCommandText.Append(string.Format(commandText, f_id));
        string CMonth = MCOTFhgSql.Instance.getCmonth(connectionStrings, commandText.ToString());//<=====================

        log.endWrite("'CMonth' : " + CMonth.ToString(), className, methodName);//當月or次月
        return CMonth;
    }
    public string getAttachName(string f_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;

        string commandText = "SELECT Attach_Name FROM [HG].[dbo].[MCOTF] where f_id='" + f_ID + "'";
        //StringBuilder sbCommandText = new StringBuilder();
        //sbCommandText.Append(string.Format(commandText, f_id));
        string AttachName = MCOTFhgSql.Instance.getAttachName(connectionStrings, commandText.ToString());//<=====================

        log.endWrite("'AttachName' : " + AttachName.ToString(), className, methodName);//歸屬
        return AttachName;
    }
    public string getOther(string f_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;

        string commandText = "SELECT Other FROM [HG].[dbo].[MCOTF] where f_id='" + f_ID + "'";
        //StringBuilder sbCommandText = new StringBuilder();
        //sbCommandText.Append(string.Format(commandText, f_id));
        string Other = MCOTFhgSql.Instance.getOther(connectionStrings, commandText.ToString());//<=====================

        log.endWrite("'Other' : " + Other.ToString(), className, methodName);
        return Other;
    }
    public string getPS(string f_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;

        string commandText = "SELECT PS FROM [HG].[dbo].[MCOTF] where f_id='" + f_ID + "'";
        //StringBuilder sbCommandText = new StringBuilder();
        //sbCommandText.Append(string.Format(commandText, f_id));
        string PS = MCOTFhgSql.Instance.getPS(connectionStrings, commandText.ToString());//<=====================

        log.endWrite("'PS' : " + PS.ToString(), className, methodName);
        return PS;
    }
    public string getFAX(string f_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;

        string commandText = "SELECT Fax,f_id FROM [HG].[dbo].[MCOTF] where f_id='" + f_ID + "'";
        //StringBuilder sbCommandText = new StringBuilder();
        //sbCommandText.Append(string.Format(commandText, f_id));
        string FAX = MCOTFhgSql.Instance.getFAX(connectionStrings, commandText.ToString());//<=====================

        log.endWrite("'FAX' : " + FAX.ToString(), className, methodName);
        return FAX;
    }

    //取得案件修改明細
    public List<MPMCOTFDataEditRecordEntity> getBusinessConnectionDataEditRecord(string m_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;

        string commandText = "SELECT [M_ID],[edit_user],[M_Row],[M_text],[edit_date] FROM [HG].[dbo].[MLOGB] Where M_ID='" + m_ID + "'";
        //StringBuilder sbCommandText = new StringBuilder();
        //sbCommandText.Append(string.Format(commandText, f_id));
        List<MPMCOTFDataEditRecordEntity> bce = MCOTFhgSql.Instance.getBusinessConnectionDataEditRecord(connectionStrings, commandText.ToString());//<=====================

        log.endWrite("'bce' : " + bce.ToString(), className, methodName);
        return bce;
    }
    //取得兩個日期相差的天數
    public string GetTime(DateTime timeA)
    {
        //timeA:要計算的天數
        DateTime timeB = DateTime.Now;
        TimeSpan ts = timeB - timeA;//計算時間差
        string time = ts.TotalDays.ToString();//時間差(轉換為天數)
        return time;
    }


    //取得業務聯絡單詳細資料
    public MPMCOTFDetailEntity getBusinessConnectionDetail(string f_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("f_id' : " + f_id, className, methodName);
        //string commandText = "select CF_item,obj,add_user,add_date,(select M_Name from MMBER b where b.M_id=a.M_id) AS M_Name,"
        //                     + "(select Light_status from MMBER b where b.M_id = a.M_id) AS Light_status, f_id, MP_ID,"
        //                     + "T_PType, V_ID, V_Name, Paymoney, Special1_userName, T_accountmoney1, Special2_userName, T_accountmoney2,"
        //                     + "Special3_userName, T_accountmoney3, Results_Item, begindate_Date, enddate_Date, ca_id, cellphone,"
        //                     + "Fax, Mess, Media, P_Text, P_video, atm, CCard_4Num, INV_open_ITEM, INV_ITEM, COMNAME, INV_ITEM_UnifyNum,"
        //                     + "T_Ivo,MP_Item,M_ID,T_PType,T_PType1,T_PType2,PT_Item,Results_Item,c_tag,ca_id,PS,T_Type"
        //                     + " from MCOTF a where del_tag = '0' and MP_Item IS NOT NULL and f_id ='" + M_id + "'";
        //F_Status
        //U_LeaderStatus
        //EX_Status
        //EX_LeaderStatus
        //F_Status,U_LeaderStatus,EX_Status,EX_LeaderStatus
        //撈取業務聯絡單欄位資料(20230524)
        /*select CF_item,obj,add_user,add_date,(select M_Name from MMBER b where b.M_id=a.M_id) AS M_Name,
 (select Light_status from MMBER b where b.M_id = a.M_id) AS Light_status, f_id, MP_ID,T_PType, V_ID,
  V_Name, Paymoney, Special1_userName, T_accountmoney1, Special2_userName, T_accountmoney2,Special3_userName,
   T_accountmoney3, Results_Item, begindate_Date, enddate_Date, ca_id, cellphone,Fax, Mess, Media, P_Text, P_video,
    atm, CCard_4Num, INV_open_ITEM, INV_ITEM, COMNAME, INV_ITEM_UnifyNum,T_Ivo,MP_Item,M_ID,T_PType,T_PType1,
    T_PType2,PT_Item,Results_Item,c_tag,ca_id,PS,T_Type,T_ID,T_Name,F_Status,U_LeaderStatus,EX_Status,EX_LeaderStatus,
    U_Leader,F_Status,U_LeaderStatus,EX_Status,EX_LeaderStatus,U_Leader,U_LeaderName,EX_Name,EX_LeaderName
         */

        string commandText = "select CF_item,obj,a.add_user,a.add_date,(select M_Name from MMBER b where b.M_id=a.M_id) AS M_Name,"
                          + "(select Light_status from MMBER b where b.M_id = a.M_id) AS Light_status, f_id, MP_ID,"
                          + "a.T_PType,a.V_ID, a.V_Name, Paymoney, Special1_userName, T_accountmoney1, Special2_userName, T_accountmoney2,"
                          + "Special3_userName, T_accountmoney3, a.Results_Item, begindate_Date, enddate_Date, a.ca_id, cellphone,"
                          + "Fax, Mess, Media, P_Text, P_video, atm, a.CCard_4Num, a.INV_open_ITEM, a.INV_ITEM, COMNAME, INV_ITEM_UnifyNum,"
                          + "T_Ivo,MP_Item,a.M_ID,a.T_PType,T_PType1,T_PType2,PT_Item,a.Results_Item,c_tag,a.ca_id,PS,a.T_Type,a.T_ID,T_Name,"
                          + "F_Status,U_LeaderStatus,EX_Status,EX_LeaderStatus,U_Leader,U_LeaderName,EX_Name,EX_LeaderName,U_LeaderStatusTime,EX_LeaderStatusTime,EX_StatusTime,Attach_Name,Cmonth, "//20230324為判斷簽核明細備註欄未顯示與否加入的條件
                          + "D_MP,D_ITEM,DSdate,DEDate,D_Paymoney,T_PayMoney,B_Name,B_ID,B_Paymoney,S_tag,S_id,S_Paymoney,T_StartDate,T_EndDate "
                          + "from MCOTF a  left join MTRAT b "
                          + " on a.M_ID=b.M_ID "
                          + "where  f_id ='" + f_id + "'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, f_id));
        MPMCOTFDetailEntity bce = MCOTFhgSql.Instance.getBusinessConnectionDetail(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite("'bce' : " + bce.ToString(), className, methodName);
        return bce;
    }


    public MPMCOTFDetailEntity getBusinessConnectionDetail_MID(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("M_ID' : " + M_ID, className, methodName);
        //string commandText = "select CF_item,obj,add_user,add_date,(select M_Name from MMBER b where b.M_id=a.M_id) AS M_Name,"
        //                     + "(select Light_status from MMBER b where b.M_id = a.M_id) AS Light_status, f_id, MP_ID,"
        //                     + "T_PType, V_ID, V_Name, Paymoney, Special1_userName, T_accountmoney1, Special2_userName, T_accountmoney2,"
        //                     + "Special3_userName, T_accountmoney3, Results_Item, begindate_Date, enddate_Date, ca_id, cellphone,"
        //                     + "Fax, Mess, Media, P_Text, P_video, atm, CCard_4Num, INV_open_ITEM, INV_ITEM, COMNAME, INV_ITEM_UnifyNum,"
        //                     + "T_Ivo,MP_Item,M_ID,T_PType,T_PType1,T_PType2,PT_Item,Results_Item,c_tag,ca_id,PS,T_Type"
        //                     + " from MCOTF a where del_tag = '0' and MP_Item IS NOT NULL and f_id ='" + M_id + "'";
        string commandText = "select CF_item,obj,add_user,add_date,(select M_Name from MMBER b where b.M_id=a.M_id) AS M_Name,"
                          + "(select Light_status from MMBER b where b.M_id = a.M_id) AS Light_status, f_id, MP_ID,"
                          + "T_PType, V_ID, V_Name, Paymoney, Special1_userName, T_accountmoney1, Special2_userName, T_accountmoney2,"
                          + "Special3_userName, T_accountmoney3, Results_Item, begindate_Date, enddate_Date, ca_id, cellphone,"
                          + "Fax, Mess, Media, P_Text, P_video, atm, CCard_4Num, INV_open_ITEM, INV_ITEM, COMNAME, INV_ITEM_UnifyNum,"
                          + "T_Ivo,MP_Item,M_ID,T_PType,T_PType1,T_PType2,PT_Item,Results_Item,c_tag,ca_id,PS,T_Type"
                         + " from MCOTF a where del_tag = '0' and MP_Item IS NOT NULL and M_id ='" + M_ID + "'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, M_ID));
        MPMCOTFDetailEntity bce = MCOTFhgSql.Instance.getBusinessConnectionDetail(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite("'bce' : " + bce.ToString(), className, methodName);
        return bce;
    }
    //deleteMPMCOTFData
    /// <summary>
    /// 刪除業務聯絡單資料
    /// </summary>
    /// <param name="f_id"></param>
    /// <returns></returns>
    public string deleteMPMCOTFData(string f_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("f_id=" + f_id, className, methodName);

        string commandText = "UPDATE MCOTF SET del_tag = '1' WHERE f_id = '{0}'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, f_id));
        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<==========

        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }
    /// <summary>
    /// 刪除客戶資料
    /// </summary>
    /// <param name="M_ID"></param>
    /// <returns></returns>
    public string deleteCustomerData(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("M_ID=" + M_ID, className, methodName);

        string commandText = "UPDATE mcotf SET del_tag = '1' WHERE M_ID = '{0}'";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, M_ID));
        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<==========

        log.endWrite("backString : " + backString, className, methodName);
        return backString;
    }
    public string GetValueBYSQL(SqlConnection conn, string commandText)
    {
        string value = "";
        //using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        //{
        SqlConnection connection = conn;

        //conn.ConnectionString = connectionStrings;
        //conn.Open();
        //conn.ConnectionString = connectionStrings;
        //conn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = commandText;
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        //conn.ConnectionString = WebConfigurationManager.ConnectionStrings[connectionStrings].ToString();
        //conn.Open();
        //SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        //cmd.CommandText = tsql;
        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
        if (cmd.Connection.State.ToString() == "Closed")
            cmd.Connection.Open();

        adapter.Fill(ds);//取出所有會場編號
        foreach (DataRow datarow in ds.Tables[0].Rows)
        {
            value = datarow[0].ToString();
            //每個資料列的內容

        }

        //int V_ID_Count = dt.Rows.Count;
        /*
         *  foreach (DataRow row in dt.Rows)
        {
            //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
            value = row[0].ToString();
        }
        conn.Close();
         */
        foreach (DataRow row in dt.Rows)
        {
            //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
            value = row[0].ToString();
        }
        //List<SRMVENUEntity> SRMVENUEntityList = new List<SRMVENUEntity>();
        //for (int i = 0; i < V_ID_Count; i++)
        //{
        //    string V_ID = dt[i][0].ToString();
        //                           }
        //foreach (DataRow row in dt.Rows)
        //{
        //    //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
        //    value = row[0].ToString();
        //}
        // conn.Close();
        // }
        /*
         *  adapter.SelectCommand = cmd;//20220801修正!!!!!!!!!
         adapter.Fill(dt);//取出所有會場編號
                          //int V_ID_Count = dt.Rows.Count;
                          //List<SRMVENUEntity> SRMVENUEntityList = new List<SRMVENUEntity>();
                          //for (int i = 0; i < V_ID_Count; i++)
                          //{
                          //    string V_ID=dt[i][0].
                          //}
         foreach (DataRow row in dt.Rows)
         {
             //SRMVENUEntity SRMVENUEntity = new SRMVENUEntity();
             value = row[0].ToString();
         }
         conn.Close();
         //}
         return value;
         */
        return value;
    }
    ////進行簽核通過的動作!!!!!!!!!!!!!(20230720WORK!!!!!!!!!)
    ///實作簽核的動作(20230720WORK!!!!!!!!!)
    public string signStatus(signStatusEntity sse)
    {
        //var Type = sse.type;//聯絡單種類
        //var Type_tmp = Type.Split(',');
        //Type = Type_tmp[0];
        string F_ID = "";//sse.f_id//單號:
        string M_Num = "";
        string ComID = "";
        var M_Num_Chk = false;//判斷是否要新增會編
        string backStr = "";
        string SQL = "";
        if (sse.signerStatusType.ToUpper() == "U_LEADERSTATUS")
        {
            /*
             * UPDATE [dbo].[MCOTF]
                     SET 
                      U_LeaderStatus='1'
                    ,U_LeaderStatusTime='2023-02-02 00:00:00.000'
                    ,L_Ps='9999'
                    ,U_Leader='B1103011'
                    WHERE f_id='60143'
             */
            SQL = "UPDATE [dbo].[MCOTF]"
                + "SET "
                + "U_LeaderStatus = '" + 1 + "'"
                + " ,U_LeaderStatusTime = GETDATE() "
                + " ,L_Ps = '" + sse.ps + "'"
                + ", U_Leader = '" + sse.U_Num + "'"
                + " WHERE f_id = '" + sse.f_id + "'";
        }
        else if (sse.signerStatusType.ToUpper() == "EX_STATUS")
        {
            SQL = "UPDATE [dbo].[MCOTF]"
                + "SET "
                + "EX_STATUS = '" + 1 + "'"
                + " ,U_LeaderStatusTime = GETDATE() "
                + " ,L_Ps = '" + sse.ps + "'"
                + ", U_Leader = '" + sse.U_Num + "'"
                + " WHERE f_id = '" + sse.f_id + "'";
        }
        else if (sse.signerStatusType.ToUpper() == "EX_LEADERSTATUS")
        {
            SQL = "UPDATE [dbo].[MCOTF] (U_LeaderStatus,U_LeaderStatusTime,L_Ps,U_Leader)"
                + "SET"
                + " EX_LEADERSTATUS = '" + 1 + "'"
                + " ,U_LeaderStatusTime = GETDATE() "
                + " ,L_Ps = '" + sse.ps + "'"
                + ", U_Leader = '" + sse.U_Num + "'"
                + " WHERE f_id = '" + sse.f_id + "'";
        }
        var SQL_EX = SQL;
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        {
            string value = "";
            //using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
            //{
            SqlConnection connection = conn;
            SqlCommand command = new SqlCommand(SQL_EX, connection);
            command.Connection.Open();
            command.ExecuteNonQuery();


        }
        //    

        //入會(Join)
        //折讓(Discount)
        //訂金件(Deposit)
        //
        //if (Type == "入會")
        //{
        //    string GetMIDFromF_ID = "select M_ID from MCOTF where F_ID='" + sse.f_id + "'";
        //    string GetMPIDFromF_ID = "select MP_ID from MCOTF where F_ID='" + sse.f_id + "'";
        //    string GetAddUSERName = "select U_Num,U_Name,ComID From MUSER  where LeaveDate is nul and U_Num=" + sse.add_User;
        //    string GetAddUSERNum = "select U_Num,U_Name,ComID From MUSER  where LeaveDate is null and U_Num=" + sse.add_User;
        //    string GetAddUSERComID = "select U_Num,U_Name,ComID From MUSER  where LeaveDate is null and U_Num=" + sse.add_User;
        //    string AddUSERName = "";
        //    string AddUSERComID = "";
        //    //判斷是否第一次加入會員
        //    using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[connectionStrings].ToString()))
        //    {
        //        var M_ID = GetValueBYSQL(conn, GetMIDFromF_ID);
        //        string GetMTel1FromMID = "select MTel1 From MMBER where M_ID ='" + M_ID + "' and del_tag='0'";
        //        string GetMCFromMID = "select MC From MMBER where M_ID ='" + M_ID + "' and del_tag='0'";
        //        var MP_ID = GetValueBYSQL(conn, GetMPIDFromF_ID);//分析師編號
        //        string Mtel1 = GetValueBYSQL(conn, GetMTel1FromMID);//會員電話
        //        string GetM_NumFromMID = "select M_Num From MMBER where M_ID ='" + M_ID + "' and del_tag='0'";//會員姓名
        //        //找出分析師名稱、編號及公司別
        //        #region
        //        string GetU_NameBYSQL = "select U_Name From MUSER  where U_Position = '0005' and U_Num='" + MP_ID + "'";
        //        string U_Name = GetValueBYSQL(conn, GetU_NameBYSQL);//分析師名稱
        //        string GetComLandBYSQL = "select ComLand From MUSER  where U_Position = '0005' and U_Num='" + MP_ID + "'";
        //        string ComLand = GetValueBYSQL(conn, GetComLandBYSQL);//分析師公司別
        //        #endregion
        //        //找出業務(提案人)名稱、編號及公司別
        //        #region
        //        string GetAddUSERNameBYSQL = "select U_name from MUSER where LeaveDate is null and U_Num='" + sse.add_User + "'";
        //        AddUSERName = GetValueBYSQL(conn, GetAddUSERNameBYSQL);
        //        string GetAddUSERComIDBYSQL = "select ComID from MUSER where LeaveDate is null and U_Num='" + sse.add_User + "'";
        //        AddUSERComID = GetValueBYSQL(conn, GetAddUSERComIDBYSQL);
        //        #endregion
        //        //判斷是否第一次加入會員
        //        #region
        //        M_Num = GetValueBYSQL(conn, GetM_NumFromMID);
        //        if (M_Num.Length == 0)
        //        {
        //            M_Num_Chk = true;//判斷是否要新增會編
        //        }
        //        Random rnd = new Random();  //產生亂數初始值
        //        if (M_Num_Chk)//要新增會編
        //        {
        //            for (int i = 0; i < 201; i++)
        //            {
        //                string Text = (9999999 * rnd.Next()).ToString();
        //                var M_Num_Sub = Text.Substring(6, 1);
        //                var rndnum = rnd.Next();
        //                if (M_Num_Sub == "4")
        //                {
        //                    M_Num_Sub = ((9999999 * rndnum) + 1000001).ToString();
        //                    string M_Num_Sub_NEW = M_Num_Sub.Substring(0, 6);
        //                }
        //                else
        //                {
        //                    break;
        //                }
        //            }
        //        }
        //        #endregion
        //        //新增交易紀錄
        //        //T_id
        //        //M_id
        //        #region
        //        DateTime CurrTime = DateTime.Now;
        //        string year = CurrTime.Year.ToString();
        //        string month = CurrTime.Date.Month.ToString();
        //        string day = CurrTime.Date.Day.ToString();
        //        string hour = CurrTime.Hour.ToString();
        //        string min = CurrTime.Minute.ToString();
        //        string sec = CurrTime.Second.ToString();

        //        #region //產生交易編號
        //        if (month.Length < 2)
        //        {
        //            month = "0" + month;
        //        }
        //        if (day.Length < 2)
        //        {
        //            day = "0" + day;
        //        }
        //        if (day.Length < 2)
        //        {
        //            day = "0" + day;
        //        }
        //        if (hour.Length < 2)
        //        {
        //            hour = "0" + hour;
        //        }
        //        if (min.Length < 2)
        //        {
        //            min = "0" + min;
        //        }
        //        if (sec.Length < 2)
        //        {
        //            sec = "0" + sec;
        //        }
        //        string serial = year + month + day + hour + min + sec;
        //        Random rnd2 = new Random();  //產生亂數初始值
        //        var rndnum2 = rnd2.Next();
        //        var test = rndnum2 * 99999 + 10000;
        //        #endregion
        //        string TT_ID = test.ToString().Substring(0, 2);
        //        string T_ID = serial + TT_ID;//交易編號
        //        // 找出分析師名稱、編號及公司別
        //        MP_ID = GetValueBYSQL(conn, GetMPIDFromF_ID);//分析師編號
        //                                                     //找出分析師名稱、編號及公司別
        //                                                     //string GetU_NameBYSQL = "select U_Name From MUSER  where U_Position = '0005' and U_Num='" + MP_ID + "'";
        //                                                     //var U_Name = GetValueBYSQL(conn, GetU_NameBYSQL);//分析師名稱
        //                                                     // string GetComLandBYSQL = "select ComLand From MUSER  where U_Position = '0005' and U_Num='" + MP_ID + "'";
        //                                                     //var ComLand = GetValueBYSQL(conn, GetComLandBYSQL);//分析師公司別
        //                                                     //找出業務名稱、編號及公司別==
        //        string GetU_NUMBYMP_ID = "select U_Num,U_Name,ComID From MUSER  where U_Position = '0005' where U_Num='" + MP_ID + "'";
        //        string GetU_NameBYMP_ID = "select U_Num,U_Name,ComID From MUSER  where U_Position = '0005' where U_Num='" + MP_ID + "'";
        //        string MP_Uame = GetValueBYSQL(conn, GetU_NameBYMP_ID);//分析師姓名
        //        string GetCOMIDBYMP_ID = "select U_Num,U_Name,ComID From MUSER  where U_Position = '0005' where U_Num='" + MP_ID + "'";
        //        string COMID = GetValueBYSQL(conn, GetCOMIDBYMP_ID);//分析師公司名稱
        //        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //        log.startWrite("'f_id' : " + sse.f_id + "'signerStatusType' : " + sse.signerStatusType + "'status' : " + sse.status + "'psType' : " + sse.psType + "'ps' : " + sse.ps + "'signerType' : " + sse.signerType + "'signerNameType' : " + sse.signerNameType + "'U_Num' : " + sse.U_Num + "'U_Name' : " + sse.U_Name + "'timeType' : " + sse.timeType, className, methodName);
        //        string tempSQLtext = string.Empty;
        //        string commandText = "";
        //        if (sse.status == "2")//1:核准,2:退回
        //        {
        //            tempSQLtext = "F_Status=2";
        //            commandText = "UPDATE MCOTF SET " + sse.signerStatusType + "='" + sse.status + "'," + sse.psType + "='" + sse.ps + "'," + sse.signerType + "='" + sse.U_Num + "'," + sse.signerNameType + "='" + sse.U_Name + "'," + sse.timeType + "=GETDATE(), " + tempSQLtext + " WHERE f_id = '" + sse.f_id + "'";
        //        }
        //        else
        //        {
        //            commandText = "UPDATE MCOTF SET " + sse.signerStatusType + "='" + sse.status + "'," + sse.psType + "='" + sse.ps + "'," + sse.signerType + "='" + sse.U_Num + "'," + sse.signerNameType + "='" + sse.U_Name + "'," + sse.timeType + "=GETDATE() " + " WHERE f_id = '" + sse.f_id + "'";
        //        }

        //        backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);//<==========

        //        #endregion
        //        //新增發票資訊
        //        #region
        //        #endregion
        //    }
        //}
        //else if (Type == "折讓")
        //{ }
        //else if (Type == "訂金")
        //{ }
        //else if (Type == "退費")
        //{ }
        //string backStr = "";
        // log.endWrite("'backStr' : " + backStr, className, methodName);
        return backStr;
    }
}