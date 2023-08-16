using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// masterPageService 的摘要描述
/// </summary>
public class masterPageService
{
    //引用時不用再NEW
    private static masterPageService _instance = new masterPageService();

    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public static masterPageService Instance
    {
        get
        {
            return _instance;
        }
    }

    public masterPageService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }


    /// <summary>
    /// 處理 getLeftMenu的邏輯
    /// </summary>
    /// <param name="U_Num"></param>
    /// <returns></returns>
    public List<masterPageLeftMenuEntity> getLeftMenu(string U_Num,bool descTF)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num, className, methodName);
        List<masterPageLeftMenuEntity> bdList = MMENUjoinMUMAPhgDao.Instance.getLeftMenu(U_Num, descTF);//<=============
        int i = 0;
        foreach (var item in bdList)
        {
            if (item.menuName == "身份證檢查")
            {
                item.menuLocation = "/manage/Form/widupl_query.aspx";
                bdList[i].menuLocation = "/manage/Form/widupl_query.aspx";
            }


            if (item.menuName== "員工資料維護")
            {
                item.menuLocation = "/manage/User/MUSER_query.aspx";
                bdList[i].menuLocation = "/manage/User/MUSER_query.aspx";
            }
            i++;
        }
        log.startWrite(bdList.ToString(), className, methodName);
        return bdList;
    }

    /// <summary>
    /// 處理getU_MDEP的邏輯
    /// </summary>
    /// <param name="U_MDEP"></param>
    /// <returns></returns>
    public string getU_MDEP(string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_MDEP' : "+ U_MDEP, className, methodName);
        string backString = MITEMhgDao.Instance.getU_MDEP(U_MDEP);//<==========
        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }

    /// <summary>
    /// 處理getPunchcard_Tag的邏輯
    /// </summary>
    /// <param name="MP"></param>
    /// <returns></returns>
    public string getPunchcard_Tag(string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MP' : " + MP, className, methodName);
        string backString = MUSERhgDao.Instance.getPunchcard_Tag(MP);//<==========
        log.endWrite("'backString' : " + backString, className, methodName);
        return backString;
    }
}