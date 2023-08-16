using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// HGMEMBERhgDao 的摘要描述
/// </summary>
public class HGMEMBERhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static HGMEMBERhgDao _instance = new HGMEMBERhgDao();
    public static HGMEMBERhgDao Instance
    {
        get
        {
            return _instance;
        }
    }

    public HGMEMBERhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string getMid(string M_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_Num' : " + M_Num, className, methodName);
        string commandText = "select M_id From hgmember where ERP_num='" + M_Num+"'";
        string backString = HGMEMBERhgSql.Instance.getMid(connectionStrings, commandText);//<==========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    public string addData(hgmemberEntity he)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ERP_num' : " + he.ERP_num + "'Open_tag' : " + he.Open_tag + "'M_Item' : " + he.M_Item + "'ContactEmail' : " + he.ContactEmail + "'M_Pws' : " + he.M_Pws + "'M_Ch' : " + he.M_Ch + "'City' : " + he.City + "'County' : " + he.County + "'Address' : " + he.Address + "'Tel' : " + he.Tel + "'add_user' : " + he.add_user + "'add_ip' : " + he.add_ip, className, methodName);
        string commandText = "insert into [HG].[dbo].[HGMember]([ERP_num],[Open_tag],[M_Item],[Email],[ContactEmail],[M_Pws],[M_Ch],[City],[County],[Address],[Tel],[add_date],[add_user],[add_ip])VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}',GETDATE(),'{11}','{12}')";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(commandText, he.ERP_num, he.Open_tag,  he.M_Item, he.ContactEmail, he.ContactEmail, he.M_Pws, he.M_Ch, he.City, he.County, he.Address, he.Tel, he.add_user, he.add_ip));
        string backString = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);//<==========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }


    public string getTop1Mid()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        string commandText = "select TOP 1 M_id From hgmember order by add_date desc";
        string backString = HGMEMBERhgSql.Instance.getMid(connectionStrings, commandText);//<==========

        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    public List<string> getAllSourceID()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        string commandText = "select Source_id From hgmember";
        List<string> backStringList = HGMEMBERhgSql.Instance.getAllSourceID(connectionStrings, commandText);//<==========

        log.endWrite("'backStringList' : " + backStringList, className, methodName);
        return backStringList;
    }

    public List<hgmemberEntity> getAnalystActiveDetail(string Sur_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'Sur_id' : " + Sur_id, className, methodName);

        string commandText = "select M_Ch,Tel,add_date From hgmember where Source_id='"+ Sur_id + "' order by add_Date desc";
        List<hgmemberEntity> hbeList = HGMEMBERhgSql.Instance.getAnalystActiveDetail(connectionStrings, commandText);//<==========

        log.endWrite("'hbeList' : " + hbeList.ToString(), className, methodName);
        return hbeList;
    }

    public List<hgmemberEntity> getAllMidandTel()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);
        string commandText = "select M_id,Tel From hgmember";
        List<hgmemberEntity>heList = HGMEMBERhgSql.Instance.getAllMidandTel(connectionStrings, commandText);//<==========

        log.endWrite("'heList' : " + heList.ToString(), className, methodName);
        return heList;
    }
}