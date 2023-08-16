using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// idCheckhgDao 的摘要描述
/// </summary>
public class iddatahgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static iddatahgDao _instance = new iddatahgDao();
    public static iddatahgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public iddatahgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<widupServiceEntity> getwidupServiceDataList(string keyWord, string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'keyWord' :" + keyWord + "'StartDate' :" + StartDate + "'EndDate' :" + EndDate, className, methodName);

        string commandText = string.Empty;
        string sql_txt = getSqlTxt.getIdCheckListST(keyWord, StartDate, EndDate);
        commandText = "select id,Name,Tel,ID_Img_Pos,ID_Img_Obv,ID_Status,add_date,M_id from iddata where add_date is not null and del_tag='0' " + sql_txt + " order by add_Date desc";
        List<widupServiceEntity> iceList = idDatahgSql.Instance.getwidupServiceList(connectionStrings, commandText);//<==========
        //idDatahgSql.Instance.getwidupServiceList
        log.endWrite("'iceList' :" + iceList.ToString(), className, methodName);
        return iceList;
    }
    public List<idCheckEntity> getIdCheckList(string keyWord, string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'keyWord' :" + keyWord + "'StartDate' :" + StartDate + "'EndDate' :" + EndDate, className, methodName);

        string commandText = string.Empty;
        string sql_txt = getSqlTxt.getIdCheckListST(keyWord, StartDate, EndDate);
        commandText = "select id,Name,Tel,ID_Img_Pos,ID_Img_Obv,ID_Status,add_date,M_id from iddata where add_date is not null and del_tag='0' " + sql_txt + " order by add_Date desc";
        List<idCheckEntity> iceList = idCheckhgSql.Instance.getIdCheckList(connectionStrings, commandText);//<==========

        log.endWrite("'iceList' :" + iceList.ToString(), className, methodName);
        return iceList;
    }

    public string deleteData(string id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'id' :" + id, className, methodName);

        string commandText = common.makeSQLdeleteStr("IDData", "id", id);
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public string editData(string id, string M_id, string ID_Status)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'id' :" + id + "'M_id' :" + M_id + "'ID_Status' :" + ID_Status, className, methodName);

        string commandText = "update IDData set M_id='"+ M_id + "',ID_Status='"+ ID_Status + "' where id='" + id + "'";
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public List<idCheckEntity> getIddataByMid(string M_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'M_ID' : " + M_ID, className, methodName);

        string commandText = "select id,Name,Tel,ID_Img_Pos,ID_Img_Obv,ID_Status,add_date,M_id from iddata  where m_id='"+ M_ID + "' order by add_Date desc";
        List<idCheckEntity> iceList = idCheckhgSql.Instance.getIdCheckList(connectionStrings, commandText);//<==========

        log.endWrite("'iceList' : " + iceList.ToString(), className, methodName);
        return iceList;
    }

    internal List<widupServiceEntity> getwidupServiceData(string StartDate, string EndDate,string keyWord)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'StartDate':" + StartDate, className, methodName);
        string commandText = "SELECT a.id,a.add_date,a.ID_Status,a.Name,a.Tel,a.ID_Img_Pos,a.ID_Img_Obv FROM IDData a order by add_date desc";
        //string commandText = "SELECT id,M_id,Name,Tel,IDCardNumber,ID_Img_Pos,ID_Img_Obv,ID_Status,City,County,Address,del_tag,add_date,Web_Mid FROM IDData where id='" + id + "' order by add_Date desc";
        List<widupServiceEntity> iceList = idDatahgSql.Instance.getwidupServiceList(connectionStrings, commandText);//<==========

        log.endWrite("'iceList' : " + iceList.ToString(), className, methodName);
        return iceList;
    }
}