using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.IO;

/// <summary>
/// webConsumptionOrderManagementService 的摘要描述
/// </summary>
public class webConsumptionOrderManagementService
{
    //引用時不用再NEW
    private static webConsumptionOrderManagementService _instance = new webConsumptionOrderManagementService();

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public static webConsumptionOrderManagementService Instance
    {
        get
        {
            return _instance;
        }
    }
    public webConsumptionOrderManagementService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<wAnalystEntity> getWAnalysts()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<wAnalystEntity> waeList = wAnalystshgDao.Instance.getWAnalysts();//<==========

        log.endWrite("'waeList' :" + waeList.ToString(), className, methodName);
        return waeList;
    }

    public List<webConsumptionOrderEntity> getWebConsumptionOrderList(getWebConsumptionOrderParamEntity gwcope)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'gwcope' :" + gwcope.ToString(), className, methodName);

        List<webConsumptionOrderEntity> wcoeList = HGOPLISThgDao.Instance.getWebConsumptionOrderList(gwcope);//<==========
        List<wAnalystEntity> waeList = wAnalystshgDao.Instance.getWAnalysts();
        for (var i = 0; i < wcoeList.Count; i++)
        {
            if (wcoeList[i].PayStatus == "0")
            {
                wcoeList[i].PayStatusName = "<span class='colorRed'>失敗</span>";
            }
            else
            {
                wcoeList[i].PayStatusName = "<span class='colorGreen'>成功</span>";
            }
            for (var j = 0; j < waeList.Count; j++)
            {
                if (wcoeList[i].P_id == waeList[j].T_id)
                {
                    wcoeList[i].P_idName = waeList[j].Ch;
                }
               
            }
            switch (wcoeList[i].Invoice_item)
            {
                case "1":
                    wcoeList[i].Invoice_itemName = "特店載具";
                    break;
                case "2":
                    wcoeList[i].Invoice_itemName = "自然人,";
                    break;
                case "3":
                    wcoeList[i].Invoice_itemName = "手機條碼,";
                    break;
                case "4":
                    wcoeList[i].Invoice_itemName = "捐贈,";
                    break;
                case "5":
                    wcoeList[i].Invoice_itemName = "統一編號,";
                    break;
            }
        }
        log.endWrite("'wcoeList' :" + wcoeList.ToString(), className, methodName);
        return wcoeList;
    }

    public string deleteData(string Auto_Id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Auto_Id' :" + Auto_Id, className, methodName);

        string backStr = HGOPLISThgDao.Instance.deleteData(Auto_Id);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
   

    public string changeOver(changeOverParamEntity cope)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'cope' :" + cope.ToString(), className, methodName);
        /*說明:測試會用到的sql 測試id2141
         select * from HGOPLIST where auto_id ='2141'
          update HGOPLIST set ch_tag='0' where Auto_Id='2141'

         select * from MMBER where M_ID ='20120331340258'
         update MMBER set del_tag='1' where M_ID ='20120331340308'

          select * from MTRAT where M_ID ='20120331340258'
          update MTRAT set del_tag='1' where M_ID ='20120331340308'

         select * from DTRAT where T_ID ='2018112814234155'
         update DTRAT set del_tag='1' where T_ID ='2018112916212036'

          select * From CashOrder where auto_id ='2141'
          update CashOrder set ch_tag='0' where Auto_Id='2141'
         */
        string backStr = string.Empty;
        //1.將分析師資料帶入要轉入資料中--------start
        List<wAnalystEntity> waeList = wAnalystshgDao.Instance.getWAnalysts();//<==========
        for (var i = 0; i < waeList.Count; i++)
        {
            if (waeList[i].T_id == cope.P_id)
            {
                cope.MPname = waeList[i].Ch;
                cope.MP = waeList[i].U_Num;
                mcDataEntity mde = MUSERhgDao.Instance.getMCdata(cope.MP);
                cope.ComID = mde.ComID;

            }
        }
        //2.用藥轉入的資料去查詢是否有此M_ID資料
        customerDataEntity tempcde = MMBERhgDao.Instance.getMMBERdata(cope.ComID,cope.Tel);

        //3.如果沒有M_ID資料，就新增新的資料
        customerDataEntity cde = new customerDataEntity();
        if (common.isEmpty(tempcde.M_ID))
        {
            
            cde.M_Name = cope.Name;
            cde.M_Sax = "M";
            cde.MTel1 = cope.Tel;
            cde.EMail = cope.EMail;
            cde.HCity = cope.City;
            cde.H_Address = cope.Address;
            cde.Analyst = cope.MP;
            cde.Program = "0012";
            cde.Product = "0001";
            string MC = string.Empty;
            string MC_Name = string.Empty;
            string MC_Com = string.Empty;
            switch (cope.ComID)
            {
                case "HG04":
                    MC = "A0501041";
                    MC_Name = "劉妍希";
                    MC_Com = "HG04";
                    break;
                case "HG01":
                    MC = "Z0000002";
                    MC_Name = "營1資源";
                    MC_Com = "HG01";
                    break;
                case "HG03":
                    MC = "Z0300001";
                    MC_Name = "財富資源A";
                    MC_Com = "HG03";
                    break;
                case "HG05":
                    MC = "Z0010001";
                    MC_Name = "營2資源A";
                    MC_Com = "HG05";
                    break;
                case "HG06":
                    MC = "Z6000001";
                    MC_Name = "網事資源";
                    MC_Com = "HG06";
                    break;
            }
            cde.MC = MC;
            cde.MC_Name = MC_Name;
            cde.MC_COM = MC_Com;
            cde.M_Note = "網站訂單編號:" + cope.O_Id;
            cde.BirthDay_Date = null;
            string backStrAddEditCustomerData = MMBERhgDao.Instance.addEditCustomerData(cde, "add");
            if (backStrAddEditCustomerData == "成功")
            {
                tempcde.M_ID = MMBERhgDao.Instance.getUpToDateMid();
            }

        }
        //4.新增交易紀錄
        string today = common.makeSqlDateTimeStr(0);
        tradeRecordEntity tre = new tradeRecordEntity();
        tre.T_ID = common.makeTidStr();
        tre.M_ID = tempcde.M_ID;
        tre.MP = cope.MP;
        tre.MP_Name = cope.MPname;
        tre.MP_COM = cope.ComID;
        tre.MC = cde.MC;
        tre.MC_Name = cde.MC_Name;
        tre.MC_COM = cde.MC_COM;
        tre.Results_Item = "0001";
        tre.T_Item = cope.DPRD_ID;
        tre.T_PayMoney = cope.Price;
        tre.T_PType = cope.Payway;
        tre.T_Type = "0001";
        tre.T_Message = "2";
        tre.T_Fax = "3";
        tre.T_Media = "2";
        tre.T_StartDate = today;
        tre.T_EndDate = common.makeSqlDateTimeStr(1);
        tre.INV_open_Item = "3";
 
        tre.INV_Item = "1";
        tre.INV_SendState = "1";
        tre.T_AccountDate = today;
        tre.Light_Status = "G";
        tre.add_user = "B9601151";
        tre.add_ip = cope.add_ip;
        tre.INV_tag = "2";
        tre.Back_intag = "0";
        tre.INV_Createdate = null;
        string backStrSendMTRAT = MTRAThgDao.Instance.sendMTRAT(tre);

        if (backStrSendMTRAT == "成功")
        {
            backStr += ",新增交易紀錄";
        }

        //5.DTRAT操作
        chargeDetailEntity chde = new chargeDetailEntity();
        chde.T_ID = tre.T_ID;
        chde.Account_Date = today;
        chde.MC = cde.MC;
        chde.MC_Name = cde.MC_Name;
        chde.MC_Com = cde.MC_COM;
        chde.Account_Money = cope.Price;
        chde.Pay_Type = cope.Payway;
        chde.add_user = "B9601151";
        chde.add_ip = cope.add_ip;
        chde.Pay_tag = "0";
        string backStrSendDTRAT = DTRAThgDao.Instance.sendDTRAT(chde);
        if (backStrSendDTRAT == "成功")
        {
            backStr += ",DTRAT操作";
        }
        //6.更新資料為已轉入
        string backStrCashOrderUpdateCh_tag = CashOrderhgDao.Instance.updateCh_tag(cope.Auto_Id);
        if (backStrCashOrderUpdateCh_tag == "成功")
        {
            backStr += ",CashOrderUpdateCh_tag";
        }
        string backStrHGOPLISTupdateCh_tag = HGOPLISThgDao.Instance.updateCh_tag(cope.Auto_Id);
        if (backStrHGOPLISTupdateCh_tag == "成功")
        {
            backStr += ",HGOPLISTupdateCh_tag";
        }

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
}