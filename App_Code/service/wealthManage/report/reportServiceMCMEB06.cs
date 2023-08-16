using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Collections;

/// <summary>
/// reportService 的摘要描述
/// </summary>
public class reportServiceMCMEB06
{
    //引用時不用再NEW
    private static reportServiceMCMEB06 _instance = new reportServiceMCMEB06();
    public static reportServiceMCMEB06 Instance
    {
        get
        {
            return _instance;
        }
    }
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public reportServiceMCMEB06()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<sendMessageCostEntity> getSendMessageCost(string StartDate, string EndDate, string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'MP' : " + MP, className, methodName);
        List<indexBDdataEntity> analystList = MUSERhgDao.Instance.getEmpListForPerformance(StartDate, EndDate, common.Analyst, string.Empty, string.Empty);//<==========
        indexBDdataEntity ibde = new indexBDdataEntity();
        ibde.U_Num = "";
        ibde.empName = "";
        analystList.Add(ibde);
        List<sendMessageCostEntity> smceList = MSGRPhgDao.Instance.getSendMessageCost(StartDate, EndDate, MP);//<==========
        List<sendMessageCostEntity> backSmceList = new List<sendMessageCostEntity>();
        sendMessageCostEntity smce = null;
        for (var i = 0; i < analystList.Count; i++) {
            smce = new sendMessageCostEntity();
            smce.MP = analystList[i].U_Num;
            smce.MP_Name = analystList[i].empName;
            smce.sendSuccessCount = 0;
            smce.sendFailCount = 0;
            backSmceList.Add(smce);
        }
        for (var i = 0; i < backSmceList.Count; i++) {
            for (var z = 0; z < smceList.Count; z++)
            {
                if (backSmceList[i].MP == smceList[z].MP)
                {
                    if (smceList[z].M_SStatus == "OK"|| smceList[z].M_SStatus == "ok")
                    {
                        if (smceList[z].M_Name == "2")
                        {
                            backSmceList[i].sendSuccessCount += 2;
                        }
                        else
                        {
                            backSmceList[i].sendSuccessCount += 1;
                        }
                        
                    }
                    else
                    {
                        if (smceList[z].M_Name == "2")
                        {
                            backSmceList[i].sendFailCount += 2;
                        }
                        else
                        {
                            backSmceList[i].sendFailCount += 1;
                        }
                    }
                }
            }
        }

        log.endWrite("'backSmceList' : " + backSmceList.ToString(), className, methodName);
        return backSmceList;
    }


}