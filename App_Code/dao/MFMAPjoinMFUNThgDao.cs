using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// MFMAPhgDao 的摘要描述
/// </summary>
public class MFMAPjoinMFUNThgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MFMAPjoinMFUNThgDao _instance = new MFMAPjoinMFUNThgDao();
    public static MFMAPjoinMFUNThgDao Instance
    {
        get
        {
            return _instance;
        }
    }

    public MFMAPjoinMFUNThgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<contentAuthorityEntity> searchContentAuthority(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num : '" + U_Num, className, methodName);

        //string commandText = "select b.link_page,b.info_id,a.MF_id,U_Num,U_Name,b.Info_Name from MFMAP a left join MFUNT b on a.MF_id=b.Auto_id where a.del_tag = '0' and b.del_tag = '0' and a.U_NUM='{0}' and a.Per_open='1' order by I_sort";
        string commandText = "select b.link_page,b.info_id,a.MF_id,U_Num,U_Name,b.Info_Name from MFMAP a left join MFUNT b on a.MF_id=b.Auto_id where a.del_tag = '0' and b.del_tag = '0' and a.U_NUM='{0}' order by I_sort";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, U_Num));
        List<contentAuthorityEntity> caeList = MFMAPjoinMFUNThgSql.Instance.searchContentAuthority(connectionStrings, sbCommandText.ToString());

        log.endWrite(caeList.ToString(), className, methodName);
        return caeList;
    }
}