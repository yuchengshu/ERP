using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MRYGCjoinMMBERhgDao 的摘要描述
/// </summary>
public class MRYGCjoinMMBERhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static MRYGCjoinMMBERhgDao _instance = new MRYGCjoinMMBERhgDao();
    public static MRYGCjoinMMBERhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public MRYGCjoinMMBERhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public int getLightCount(string U_Num,string LightType)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' :" + U_Num+ " 'LightType':"+ LightType, className, methodName);

        string commandText = "select * from MRYGC a join mmber b on a.m_id=b.m_id where Assign_tag='0' and a.Assign_user = '" + U_Num + "' and b.Light_status='"+ LightType + "' order by a.add_date desc";
        
        int count = MRYGCjoinMMBERhgSql.Instance.getLightCount(connectionStrings, commandText);//<===
      
        log.endWrite("'count':"+ count, className, methodName);
        return count;
    }

    public List<caseDistributeDataEntity> getCaseDistributeList(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);
        string commandText = "select b.Light_Status,b.M_ID,b.M_Name,b.MTel1,b.MTel2,b.MTel3,a.Assign_user,a.Assign_Name,a.Assign_Date,b.LongTag_Date,b.MC_Name from MRYGC a join mmber b on a.m_id = b.m_id where Assign_tag = '0' and a.Assign_user = '" + U_Num + "'"+" order by a.add_date desc";
        List <caseDistributeDataEntity> cddeList = MRYGCjoinMMBERhgSql.Instance.getCaseDistributeList(connectionStrings, commandText);//<==========

        log.endWrite("'cddeList' : " + cddeList.ToString(), className, methodName);
        return cddeList;
    }
}