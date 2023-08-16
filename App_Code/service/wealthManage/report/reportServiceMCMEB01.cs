using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Collections;

/// <summary>
/// reportServiceMCMEB01 的摘要描述
/// </summary>
public class reportServiceMCMEB01
{
    //引用時不用再NEW
    private static reportServiceMCMEB01 _instance = new reportServiceMCMEB01();
    public static reportServiceMCMEB01 Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public reportServiceMCMEB01()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<analystSinglePerformanceEntity> getAnalystSinglePerformance(string StartDate, string EndDate, string MP, string M_Item, string ComID, string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'MP' : " + MP + " 'M_Item' : " + M_Item + " 'ComID' : " + ComID + " 'U_Num' : " + U_Num, className, methodName);

        List<analystSinglePerformanceEntity> aspeList = MTRATjoinDTRAThgDao.Instance.getAnalystSinglePerformance(StartDate, EndDate, MP, M_Item, ComID, U_Num);//<============================
        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("PITEM");
        List<chargeDetailEntity> cddeList = null;
        customerDataEntity cde = null;
        for (var i = 0; i < aspeList.Count; i++)
        {
            cde = MMBERhgDao.Instance.getSingalCustomerData(aspeList[i].M_ID);
            aspeList[i].M_Name = cde.M_Name;
            cddeList = DTRAThgDao.Instance.getChargeDetail(aspeList[i].DT_ID, aspeList[i].T_ID, U_Num);
            aspeList[i].cdeList = cddeList;
            
            for (var ii = 0; ii < ddeList.Count; ii++)
            {
                for (var j = 0; j < aspeList[i].cdeList.Count; j++)
                {
                    aspeList[i].cdeList[j].Account_Money = common.calculateAccountMoney("nor", aspeList[i].Pay_Type, aspeList[i].T_Type, aspeList[i].cdeList[j].Account_Money, "", 0, "").ToString();
                    if (aspeList[i].cdeList[j].Pay_Type == ddeList[ii].ditcode)
                    {
                        aspeList[i].cdeList[j].Pay_TypeName = ddeList[ii].ddesc;
                    }
                }
                
            }
        }
        analystSinglePerformanceEntity aspe = new analystSinglePerformanceEntity();
        aspeList.Add(aspe);


        log.endWrite("'aspeList' : " + aspeList.ToString(), className, methodName);
        return aspeList;
    }
}