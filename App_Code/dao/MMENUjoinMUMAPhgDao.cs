using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;


/// <summary>
/// MMENUjoinMUMAPhgDao 的摘要描述
/// </summary>
public class MMENUjoinMUMAPhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MMENUjoinMUMAPhgDao _instance = new MMENUjoinMUMAPhgDao();
    public static MMENUjoinMUMAPhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MMENUjoinMUMAPhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<masterPageLeftMenuEntity> getLeftMenu(string U_Num ,bool descTF)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);

        List<masterPageLeftMenuEntity> lmList = new List<masterPageLeftMenuEntity>();
        string commandText = string.Empty;
        if (descTF)
        {
            commandText = "SELECT item_id,sub_id,top_id,menu_name,href,MMENU.auto_id FROM MMENU INNER JOIN MUMAP ON MMENU.auto_id = MUMAP.menu_no WHERE MUMAP.U_Num = '{0}'  and (MUMAP.per_read = 1 or MUMAP.per_add = 1 or MUMAP.per_edit = 1 or MUMAP.per_del = 1) and MMENU.del_tag = '0' ORDER BY  MMENU.top_id desc, MMENU.sub_id desc, MMENU.item_id desc";
        }
        else
        {
            commandText = "SELECT item_id,sub_id,top_id,menu_name,href,MMENU.auto_id FROM MMENU INNER JOIN MUMAP ON MMENU.auto_id = MUMAP.menu_no WHERE MUMAP.U_Num = '{0}'  and (MUMAP.per_read = 1 or MUMAP.per_add = 1 or MUMAP.per_edit = 1 or MUMAP.per_del = 1) and MMENU.del_tag = '0' ORDER BY  MMENU.top_id, MMENU.sub_id, MMENU.item_id";
        }

        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, U_Num));
        lmList = MMENUjoinMUMAPhgSql.Instance.getLeftMenu(connectionStrings, sbCommandText.ToString());

        log.endWrite(lmList.ToString(), className, methodName);
        return lmList;
    }
}