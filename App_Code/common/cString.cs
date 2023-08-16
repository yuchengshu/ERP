using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// cString 的摘要描述
/// </summary>
public class cString
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public cString()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    private static cString _instanct = new cString();
    public static cString Instance
    {
        get
        {
            return _instanct;
        }
    }

    public static bool hasWord(string str,string word)
    {
        bool backTF = false;
        int num = str.IndexOf(word);
        if (num > -1)
        {
            backTF = true;
        }
        return backTF;
    }
}