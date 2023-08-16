using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.IO;

/// <summary>
/// easySchoolOrderManagementService 的摘要描述
/// </summary>
public class easySchoolOrderManagementService
{
    //引用時不用再NEW
    private static easySchoolOrderManagementService _instance = new easySchoolOrderManagementService();

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public static easySchoolOrderManagementService Instance
    {
        get
        {
            return _instance;
        }
    }
    public easySchoolOrderManagementService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<easySchoolOrderEntity> getEasySchoolOrderList(getEasySchoolOrderParamEntity gesope)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'gesope' :" + gesope.ToString(), className, methodName);

        List<easySchoolOrderEntity> esoeList = OPLIST_NEWezDiamondDao.Instance.getEasySchoolOrderList(gesope);//<==========
        string failStr = "<span class='colorRed'>失敗</span>";
        string successStr = "<span class='colorGreen'>成功</span>";
        string unPayStr = "<span>尚未繳款</span>";
        double DFday = 0;
        double DF2day = 0;
        string Payway = string.Empty;
        string PayStatusName = string.Empty;
        string tempP_EDate = string.Empty;
        string [] tempP_EDateArr = null;
        char Slash = '/';
        for (var i = 0; i < esoeList.Count; i++)
        {
            DFday = common.getTwoDaysDifferenceBackDouble(common.stringToDateTime(esoeList[i].Add_Date), DateTime.Now);
            DF2day = common.getTwoDaysDifferenceBackDouble(common.stringToDateTime(esoeList[i].Add_Date), common.stringToDateTime("2018-4-10 00:00:00.000"));
            if (DF2day > 0)
            {
                esoeList[i].InvoiceType = "2";
            }
            else
            {
                esoeList[i].InvoiceType = "1";
            }

            if (esoeList[i].PayStatus == "0")
            {
                Payway = esoeList[i].Payway;
                if (Payway == "信用卡付款")
                {
                    PayStatusName = failStr;
                }
                else if (Payway == "超商代碼付款"|| Payway == "超商條碼付款")
                {
                    if (DFday <= 7)
                    {
                        PayStatusName = unPayStr;
                    }
                    else
                    {
                        PayStatusName = failStr;
                    }
                }
                else if (Payway == "ATM付款")
                {
                    if (DFday <= 2)
                    {
                        PayStatusName = unPayStr;
                    }
                    else
                    {
                        PayStatusName = failStr;
                    }
                }
                else if (Payway == "網路ATM付款")
                {
                    if (DFday <= 2)
                    {
                        PayStatusName = unPayStr;
                    }
                    else
                    {
                        PayStatusName = failStr;
                    }
                }
            }
            else
            {
                PayStatusName = successStr;
            }
            esoeList[i].PayStatusName = PayStatusName;
            switch (esoeList[i].Invoice_item)
            {
                case "1":
                    esoeList[i].Invoice_itemName = "特店載具";
                    break;
                case "2":
                    esoeList[i].Invoice_itemName = "自然人,";
                    break;
                case "3":
                    esoeList[i].Invoice_itemName = "手機條碼,";
                    break;
                case "4":
                    esoeList[i].Invoice_itemName = "捐贈,";
                    break;
                case "5":
                    esoeList[i].Invoice_itemName = "統一編號,";
                    break;
            }
            tempP_EDate = esoeList[i].P_EDate.Split(' ')[0];
            tempP_EDateArr = tempP_EDate.Split(Slash);
            esoeList[i].P_EDate = tempP_EDateArr[1]+ Slash + tempP_EDateArr[2] + Slash + tempP_EDateArr[0];
        }
        log.endWrite("'esoeList' :" + esoeList.ToString(), className, methodName);
        return esoeList;
    }

    public string editData(string Auto_Id, string P_EDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Auto_Id' :" + Auto_Id + "'P_EDate' :" + P_EDate, className, methodName);

        string [] P_EDateArr = P_EDate.Split('/');
        P_EDate = P_EDateArr[2] + "-" + P_EDateArr[0] + "-" + P_EDateArr[1]+ " 23:59:59.000";
        string backStr = CashOrderhgDao.Instance.editData(Auto_Id, P_EDate);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public string deleteData(string Auto_Id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Auto_Id' :" + Auto_Id, className, methodName);

        string backStr = easySchoolOrderManagementService.Instance.deleteData(Auto_Id);//<==========

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
        //1.判別mp
        switch (cope.T_id)
        {
            case "2":
                cope.MP = "D0606201";
                cope.MPname = "黃錦川";
                cope.T_Item = "0002";
                break;
            case "1":
                cope.MP = "D0307071";
                cope.MPname = "陳飛龍";
                cope.T_Item = "0002";
                break;
        }
        //2.用藥轉入的資料去查詢是否有此M_ID資料
        customerDataEntity tempcde = MMBERhgDao.Instance.getMMBERdataByTel(cope.Tel);

        //3.如果沒有M_ID資料，就新增新的資料
        customerDataEntity cde = new customerDataEntity();
        if (common.isEmpty(tempcde.M_ID))
        {

            cde.M_Name = cope.U_Name;
            cde.M_Sax = "M";
            cde.MTel1 = cope.Tel;
            cde.EMail = cope.EMail;
            cde.MC = "A0502221";
            cde.MC_Name = "蔡淑鶯";
            cde.MC_COM = "HG02";
            cde.Analyst = "D0307071";
            cde.Program = "0001";
            cde.Product = "0001";
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
        tre.MP_COM = "HG02";
        tre.MC = "A0502221";
        tre.MC_Name = "蔡淑鶯";
        tre.MC_COM = "HG02";
        tre.Results_Item = "0001";
        tre.T_Item = cope.T_Item;
        tre.T_PayMoney = cope.Price;
        tre.T_PType = cope.Payway;
        tre.T_Type = "0001";
        tre.T_StartDate = today;
        tre.T_EndDate = common.makeSqlDateTimeStr(1);
        tre.INV_open_Item = "3";
        tre.INV_tag = "2";
        tre.INV_Createdate = today;
        if (cope.Invoice == "2")
        {
            tre.INV_Item = "1";
        } else if (cope.Invoice == "3")
        {
            tre.INV_Item = "2";
            tre.INV_ComName = cope.Invoice_Com;
            tre.INV_UnifyNum = cope.Invoice_Vat;
        }
        tre.INV_SendState = "1";
        tre.T_AccountDate = today;
        tre.Light_Status = "G";
        tre.add_user = "EZ000001";
        tre.add_ip = cope.add_ip;
        string backStrSendMTRAT = MTRAThgDao.Instance.sendMTRAT(tre);

        if (backStrSendMTRAT == "成功")
        {
            backStr += ",新增交易紀錄";
        }

        //5.DTRAT操作
        chargeDetailEntity chde = new chargeDetailEntity();
        chde.T_ID = tre.T_ID;
        chde.Account_Date = today;
        chde.MC = "A0502221";
        chde.MC_Name = "蔡淑鶯";
        chde.MC_Com = "HG02";
        chde.Account_Money = cope.Price;
        chde.Pay_Type = cope.Payway;
        chde.add_user = "EZ000001";
        chde.add_ip = cope.add_ip;
        string backStrSendDTRAT = DTRAThgDao.Instance.sendDTRAT(chde);
        if (backStrSendDTRAT == "成功")
        {
            backStr += ",DTRAT操作";
        }
        //6.更新資料為已轉入
        string backStrOPLIST_NEWupdateCh_tag = OPLIST_NEWezDiamondDao.Instance.updateCh_tag(cope.Auto_Id);
        
        if (backStrOPLIST_NEWupdateCh_tag == "成功")
        {
            backStr += ",OPLIST_NEWupdateCh_tag";
        }
        string backStrEZOrderDetailUpdateCh_tag = EZOrderDetailEZDiamondDao.Instance.updateCh_tag(cope.Auto_Id);
        if (backStrEZOrderDetailUpdateCh_tag == "成功")
        {
            backStr += ",EZOrderDetailUpdateCh_tag";
        }

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
}