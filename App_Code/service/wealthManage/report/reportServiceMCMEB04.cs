using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Collections;

/// <summary>
/// reportServiceMCMEB04 的摘要描述
/// </summary>
public class reportServiceMCMEB04
{
    //引用時不用再NEW
    private static reportServiceMCMEB04 _instance = new reportServiceMCMEB04();
    public static reportServiceMCMEB04 Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public reportServiceMCMEB04()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<VenuePerformanceEntity> getVenuePerformance(string StartDate, string EndDate, string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'MP' : " + MP , className, methodName);

        List<VenuePerformanceEntity> vpeList = MVENUhgDao.Instance.getVenuePerformance(StartDate, EndDate, MP);//<==========
        List<VenueDataEntity> vdeList = null;
        List<AccountMoneyDataEntity> amdeList = null;
        int AdmissionMoney = 0;
        double AccountMoney = 0;
        for (var i = 0;i < vpeList.Count; i++)
        {
            vpeList[i].V_Mem = (int.Parse(vpeList[i].V_MemCN)+ int.Parse(vpeList[i].V_MemC)).ToString();
            vpeList[i].DVENUvidCount = DVENUhgDao.Instance.getVidCount(vpeList[i].V_ID);
            vdeList = MTRAThgDao.Instance.getVenueData(vpeList[i].V_ID);
            vpeList[i].MTRATvidCount = vdeList.Count.ToString();
            for (var j = 0; j < vdeList.Count; j++)
            {
                AdmissionMoney += int.Parse(vdeList[j].T_PayMoney);
            }
            vpeList[i].AdmissionMoney = AdmissionMoney.ToString();
            AdmissionMoney = 0;
            amdeList = MTRATjoinDTRAThgDao.Instance.getAccountMoneyData(vpeList[i].V_ID);
            for (var k = 0; k < amdeList.Count; k++)
            {
                AccountMoney += calculateAccountMoney(amdeList[k].Account_Money, amdeList[k].Pay_Type, amdeList[k].T_type);
            }
            vpeList[i].AccountMoney = AccountMoney.ToString();
            AccountMoney = 0;
        }
        VenuePerformanceEntity vpe = new VenuePerformanceEntity();
        vpe.V_ID = "0";
        vpeList.Add(vpe);
        log.endWrite("'vpeList' : " + vpeList.ToString(), className, methodName);
        return vpeList;
    }

    

    public List<VenuePerformanceForMCentity> getVenuePerformanceForMC(string StartDate, string EndDate, string MC)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'MC' : " + MC, className, methodName);

        List<VenuePerformanceForMCentity> vpfmeList = new List<VenuePerformanceForMCentity>();
        List<VenuePerformanceForMCentity> tempList = MUSERhgDao.Instance.getVenuePerformanceForMC(StartDate, EndDate, MC);//<==========
        List<getVenueMCentity> gvMCeList = DVENUhgDao.Instance.getVenueMC(StartDate, EndDate, MC);
        VenuePerformanceForMCentity vpfmce = null;
        for (var j = 0; j < tempList.Count; j++)
        {
            for (var i = 0; i < gvMCeList.Count; i++)
            {
                if (tempList[j].MC == gvMCeList[i].MC)
                {
                    vpfmce = new VenuePerformanceForMCentity();
                    vpfmce.DV_ID = gvMCeList[i].DV_ID;
                    vpfmce.V_ID = gvMCeList[i].V_ID;
                    vpfmce.MC = gvMCeList[i].MC;
                    vpfmce.MCname = gvMCeList[i].MC_Name;
                    vpfmce.U_MDEP = tempList[j].U_MDEP;
                    vpfmce.add_date = gvMCeList[i].add_date;
                    vpfmeList.Add(vpfmce);
                }
                
            }
        }
        List<paymentDataEntity> pdeList = MTRATjoinDTRAThgDao.Instance.getVenuePerformanceForMC(StartDate, EndDate, MC);//<==========
        List<paymentDataEntity> payTag1pdeList = new List<paymentDataEntity>();
        
        
        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("DEPAR");
        List<ditcodedescEntity> allDdeList = MITEMhgDao.Instance.getditcodedescEntityList("all");
        List<ditcodedescEntity> PITEMddeList = MITEMhgDao.Instance.getditcodedescEntityList("PITEM");
        

        List<midMNameEntity> mMnE = MMBERhgDao.Instance.getMidMNameEntityList();

        for (var p = 0; p < pdeList.Count; p++)
        {

            pdeList[p].T_ItemName = MITEM.getMPtitemName(allDdeList, pdeList[p].MP, pdeList[p].T_Item);
   

            for (var c = 0; c < mMnE.Count; c++)
            {
                if (pdeList[p].M_ID == mMnE[c].M_id)
                {
                    pdeList[p].MC = mMnE[c].M_Num;
                    pdeList[p].MC_Name = mMnE[c].M_Name;
                }
            }
        }
        for (var z = 0; z < pdeList.Count; z++)
        {

            if (pdeList[z].Pay_tag == "1")
            {
                payTag1pdeList.Add(pdeList[z]);
                pdeList.Remove(pdeList[z]);
                z = 0;
            }
        }
        for (var i = 0; i < vpfmeList.Count; i++)
        {
            vpfmeList[i].pdeList = new List<paymentDataEntity>();
            for (var j = 0; j < ddeList.Count; j++)
            {
                if (vpfmeList[i].U_MDEP == ddeList[j].ditcode)
                {
                    vpfmeList[i].U_MDEPname = ddeList[j].ddesc;
                }
            }
            for (var u = 0; u < pdeList.Count; u++)
            {
                if (vpfmeList[i].MC == pdeList[u].mca)
                {
                    vpfmeList[i].pdeList.Add(pdeList[u]);
                }
            }
            for (var p = 0; p < payTag1pdeList.Count; p++)
            {
                 if (vpfmeList[i].V_ID == payTag1pdeList[p].V_ID)
                 {
                     vpfmeList[i].pdeList.Add(payTag1pdeList[p]);
                 }
            }
            for (var y = 0; y < PITEMddeList.Count; y++)
            {
                for (var r = 0; r < vpfmeList[i].pdeList.Count; r++)
                {
                    if (vpfmeList[i].pdeList[r].Pay_Type == PITEMddeList[y].ditcode)
                    {
                        vpfmeList[i].pdeList[r].Pay_TypeName = PITEMddeList[y].ddesc;
                    }
                    if (vpfmeList[i].pdeList[r].Pay_tag == "1")
                    {
                        vpfmeList[i].pdeList[r].Pay_tagName = "會場共分";
                    }
                    else
                    {
                        vpfmeList[i].pdeList[r].Pay_tagName = "案件人員分紅";
                    }
                }
                    
            }
        }
      

        log.endWrite("'vpfmeList' : " + vpfmeList.ToString(), className, methodName);
        return vpfmeList;
    }

  
    public List<VenuePerformanceEntity> getVenuePerformanceDetail(string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate , className, methodName);

        List<VenuePerformanceEntity> vpeList = MVENUhgDao.Instance.getVenuePerformance(StartDate, EndDate,string.Empty);//<==========
        List<VenueDataEntity> vdeList = null;
        List<AccountMoneyDataEntity> amdeList = null;
        int AdmissionMoney = 0;
        double AccountMoney = 0;
        for (var i = 0; i < vpeList.Count; i++)
        {
            vpeList[i].V_Mem = (int.Parse(vpeList[i].V_MemCN) + int.Parse(vpeList[i].V_MemC)).ToString();
            vpeList[i].DVENUvidCount = DVENUhgDao.Instance.getVidCount(vpeList[i].V_ID);
            vdeList = MTRAThgDao.Instance.getVenueData(vpeList[i].V_ID);
            vpeList[i].MTRATvidCount = vdeList.Count.ToString();
            for (var j = 0; j < vdeList.Count; j++)
            {
                AdmissionMoney += int.Parse(vdeList[j].T_PayMoney);
            }
            vpeList[i].AdmissionMoney = AdmissionMoney.ToString();
            AdmissionMoney = 0;
            amdeList = MTRATjoinDTRAThgDao.Instance.getAccountMoneyData(vpeList[i].V_ID);
            for (var k = 0; k < amdeList.Count; k++)
            {
                AccountMoney += calculateAccountMoney(amdeList[k].Account_Money, amdeList[k].Pay_Type, amdeList[k].T_type);
            }
            vpeList[i].AccountMoney = AccountMoney.ToString();
            AccountMoney = 0;
        }

        //==========================================================================================以上為總表
        //以下為細表
        List<getVidPaymentDataEntity> gvpdeList = MTRATjoinMMBERhgDao.Instance.getVidPaymentData(StartDate,EndDate);
        List<ditcodedescEntity> allDdeList = MITEMhgDao.Instance.getditcodedescEntityList("all");
        List<ditcodedescEntity> PITEMddeList = MITEMhgDao.Instance.getditcodedescEntityList("PITEM");
        List<chargeDetailEntity> cdeList = null;
       
        for (var i = 0; i < vpeList.Count; i++)
        {
            for (var j = 0; j < gvpdeList.Count; j++)
            {
                 
                if (vpeList[i].V_ID == gvpdeList[j].V_ID)
                {
                    gvpdeList[j].cdeList = DTRAThgDao.Instance.getChargeDetailList(gvpdeList[j].T_ID);
                    for (var z = 0; z < gvpdeList[j].cdeList.Count; z++)
                    {
                        gvpdeList[j].cdeList[z].Pay_TypeName = MITEM.getPayTypeName(PITEMddeList, gvpdeList[j].cdeList[z].Pay_Type);
                        gvpdeList[j].cdeList[z].Account_Money = calculateAccountMoney2(gvpdeList[j].cdeList[z].Account_Money, gvpdeList[j].cdeList[z].Pay_Type, gvpdeList[j].cdeList.Count).ToString();


                    }
                    if (vpeList[i].pdeList==null)
                    {
                        vpeList[i].pdeList = new List<getVidPaymentDataEntity>();
                    }
                    gvpdeList[j].T_ItemName = MITEM.getMPtitemName(allDdeList, gvpdeList[j].MP, gvpdeList[j].T_Item); 
                    vpeList[i].pdeList.Add(gvpdeList[j]);
                }
            }
        }
        log.endWrite("'vpeList' : " + vpeList.ToString(), className, methodName);
        return vpeList;
    }
    private double calculateAccountMoney2(string AccountMoney, string Pay_Type,int count)
    {
        string backStr = string.Empty;
   
        double dAccountMoney = double.Parse(AccountMoney);
        if (Pay_Type == "0002" || Pay_Type == "0007")
        {
            dAccountMoney = dAccountMoney * 0.98;
        }
        else if (Pay_Type == "0006")
        {
            if (count >= 2)
            {
                dAccountMoney = dAccountMoney - 10;
            }
            else
            {
                dAccountMoney = dAccountMoney - 20;
            }
            
        }

        return dAccountMoney;
    }

    private double calculateAccountMoney(string AccountMoney, string Pay_Type, string T_type)
    {
        string backStr = string.Empty;
        bool T_typeTF = true;
        double dAccountMoney = double.Parse(AccountMoney);
        if (Pay_Type == "0002" || Pay_Type == "0007")
        {
            dAccountMoney = dAccountMoney * 0.98;
        }
        else if (Pay_Type == "0006")
        {
            if (T_type == "0003")
            {
                dAccountMoney = dAccountMoney - 10;
            }
            else
            {
                if (T_typeTF)
                {
                    dAccountMoney = dAccountMoney - 20;
                }
            }
        }

        return dAccountMoney;
    }
}