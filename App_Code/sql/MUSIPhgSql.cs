using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MUSIPhgSql 的摘要描述
/// </summary>
public class MUSIPhgSql
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    private static MUSIPhgSql _instanct = new MUSIPhgSql();
    public static MUSIPhgSql Instance
    {
        get
        {
            return _instanct;
        }
    }
    public MUSIPhgSql()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
}