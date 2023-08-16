using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Net;
using System.IO;



/// <summary>
/// tbdInvoiceWorkService 的摘要描述
/// </summary>
public class tbdInvoiceWorkService
{
    //引用時不用再NEW
    private static tbdInvoiceWorkService _instance = new tbdInvoiceWorkService();
    public static tbdInvoiceWorkService Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public tbdInvoiceWorkService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public List<tbdInvoiceEntity> getTbdInvoice(string keyWord, string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'keyWord' :" + keyWord + "'StartDate' :" + StartDate + "'EndDate' :" + EndDate, className, methodName);

        List<tbdInvoiceEntity> tieList = null;
        List<chargeDetailEntity> cdeList = DTRAThgDao.Instance.getAllChargeDetail(string.Empty, string.Empty);
        List<invNumEntity> ineList = GDINVOhgDao.Instance.getInvNumList(string.Empty, string.Empty);
        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("PITEM");
        List<indexBDdataEntity> ibddeList = MUSERhgDao.Instance.getAnalystList("");
        List<ditcodedescEntity> mpItemList = null;
        if (common.isEmpty(keyWord))
        {
            tieList = VINVOhgDao.Instance.getTbdInvoice(StartDate, EndDate);//<==========
            
           
            for (var i = 0; i < tieList.Count; i++)
            {
                for (var d = 0; d < ineList.Count; d++)
                {
                    if (tieList[i].T_ID == ineList[d].T_id)
                    {
                        tieList[i].Inv_num = ineList[d].Inv_num;
                        break;
                    }
                }

                for (var p = 0; p < cdeList.Count; p++)
                {
                    if (tieList[i].T_ID == cdeList[p].T_ID)
                    {
                        tieList[i].Pay_Type = cdeList[p].Pay_Type;
                        break;
                    }
                }
                for (var j = 0; j < ddeList.Count; j++)
                {
                    if (tieList[i].Pay_Type == ddeList[j].ditcode)
                    {
                        tieList[i].Pay_TypeName = ddeList[j].ddesc;
                        break;
                    }
                }
                tieList[i].INV_Createdate = tieList[i].INV_Createdate.Split(' ')[0];
                for (var z = 0; z < ibddeList.Count; z++)
                {
                    if (tieList[i].MP == ibddeList[z].U_Num)
                    {
                        tieList[i].MPname = ibddeList[z].empName;
                        break;
                    }
                }
                mpItemList = MITEMhgDao.Instance.getditcodedescEntityList(tieList[i].MP);
                for (var b = 0; b < mpItemList.Count; b++)
                {
                    if (tieList[i].T_Item == mpItemList[b].ditcode)
                    {
                        tieList[i].T_ItemName = mpItemList[b].ddesc;
                        break;
                    }
                }
                tieList[i].INV_ItemName = deCode.INV_ITEM(tieList[i].INV_Item);
                tieList[i].INV_SendStateName = deCode.T_Ivo(tieList[i].INV_SendState);
                if (tieList[i].MT_COM == "HG")
                {
                    tieList[i].MT_COMname = "華冠";
                }
                else if(tieList[i].MT_COM == "TK")
                {
                    tieList[i].MT_COMname = "天酷";
                }

            }
        }
        else
        {
            tieList = new List<tbdInvoiceEntity>();
            tbdInvoiceEntity tie = VINVOhgDao.Instance.getTbdInvoiceByTid(keyWord);//<==========
            tie.Pay_Type = DTRAThgDao.Instance.getChargeDetailList(keyWord)[0].Pay_Type;
            for (var j = 0; j < ddeList.Count; j++)
            {
                if (tie.Pay_Type == ddeList[j].ditcode)
                {
                    tie.Pay_TypeName = ddeList[j].ddesc;
                    break;
                }
            }
            tie.Inv_num = GDINVOhgDao.Instance.getInvNumByTid(keyWord);
            tie.INV_Createdate = tie.INV_Createdate.Split(' ')[0];
            for (var z = 0; z < ibddeList.Count; z++)
            {
                if (tie.MP == ibddeList[z].U_Num)
                {
                    tie.MPname = ibddeList[z].empName;
                    break;
                }
            }
            mpItemList = MITEMhgDao.Instance.getditcodedescEntityList(tie.MP);
            for (var b = 0; b < mpItemList.Count; b++)
            {
                if (tie.T_Item == mpItemList[b].ditcode)
                {
                    tie.T_ItemName = mpItemList[b].ddesc;
                    break;
                }
            }
            tie.INV_ItemName = deCode.INV_ITEM(tie.INV_Item);
            tie.INV_SendStateName = deCode.T_Ivo(tie.INV_SendState);
            tieList.Add(tie);
        }

        log.endWrite("'tieList' :" + tieList.ToString(), className, methodName);
        return tieList;
    }

    public List<SendInvDataEntity> getInvoiceDataList(string tids)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'tids' :" + tids, className, methodName);

        string backStr = string.Empty;
        string[] tidArr = tids.Split(',');
        tradeRecordEntity tre = null;
        tbdInvoiceEntity tie = null;
        List<SendInvDataEntity> sideList = new List<SendInvDataEntity>();
        SendInvDataEntity side = null;
        string postDataBackStr = string.Empty;
        for (var i = 0; i < tidArr.Length; i++)
        {
            side = new SendInvDataEntity();
            tre = MTRAThgDao.Instance.getTradeData(tidArr[i]);
            side.Company = tre.MT_COM;
            if (tre.INV_SendState == "5")
            {
                side.Invoice_item = "4";
            }
            else if (tre.INV_Item == "1")
            {
                side.Invoice_item = "1";
            }
            else
            {
                side.Invoice_item = "1";
            }
            side.RelateNumber = tre.T_ID;
            side.CustomerID = tre.M_ID;
            if (tre.INV_Item == "2")
            {
                side.Invoice_item = "5";
                side.CustomerIdentifier = tre.INV_UnifyNum;
            }
            else
            {
                side.CustomerIdentifier = "";
            }

            tie = VINVOhgDao.Instance.getTbdInvoiceByTid(tidArr[i]);

            if (tie.INV_Item == "1")
            {
                side.CustomerName = tie.M_Name;
            }
            else if (tie.INV_Item == "2")
            {
                side.CustomerName = tie.INV_ComName;
            }
            side.CustomerAddr = tie.HCity + tie.HTown + tie.HZipCode + tie.H_Address;
            side.CustomerPhone = tie.MTel1;
            side.CustomerEMail = tie.EMail;
            side.CarruerNum = "";
            side.Print = "0";

            if (tie.INV_SendState == "5")
            {
                side.LoveCode = "55135";
            }
            else
            {
                side.LoveCode = "";
            }

            side.SalesAmount = tie.T_PayMoney;
            side.InoviceRemark = tie.M_Name;
            side.ItemName = "顧問費";
            side.ItemCount = "1";
            side.ItemWord = "項";
            side.ItemPrice = tie.T_PayMoney;
            side.ItemAmount = tie.T_PayMoney;
            sideList.Add(side);
        }


        log.endWrite("'sideList' :" + sideList.ToString(), className, methodName);
        return sideList;
    }


}