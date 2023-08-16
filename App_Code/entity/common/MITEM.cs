using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MITEM 的摘要描述
/// </summary>
public class MITEM
{
    public MITEM()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public static string getMPtitemName(List<ditcodedescEntity> allDdeList, string MP, string T_Item)
    {
        string backString = string.Empty;

        for (var a = 0; a < allDdeList.Count; a++)
        {
            if (MP == allDdeList[a].mitcode)
            {
                if (T_Item == allDdeList[a].ditcode)
                {
                    backString = allDdeList[a].ddesc;
                }
            }
        }
        return backString;
    }

    public static string getPayTypeName(List<ditcodedescEntity> DdeList, string PayType)
    {
        string backString = string.Empty;

        for (var a = 0; a < DdeList.Count; a++)
        {
            if (PayType == DdeList[a].ditcode)
            {
                backString = DdeList[a].ddesc;
            }
        }
        return backString;
    }
}