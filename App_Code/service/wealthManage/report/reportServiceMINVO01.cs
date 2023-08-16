using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// reportServiceMINVO01 的摘要描述
/// </summary>
public class reportServiceMINVO01
{
    //引用時不用再NEW
    private static reportServiceMINVO01 _instance = new reportServiceMINVO01();
    public static reportServiceMINVO01 Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public reportServiceMINVO01()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public List<ElectronicCalculatorInvoiceDetailEntity> getElectronicCalculatorInvoiceDetail(string StartDate, string EndDate, string Invoice_Item)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(" 'StartDate' : " + StartDate + " 'EndDate' : " + EndDate + " 'Invoice_Item' : " + Invoice_Item, className, methodName);

        List<ElectronicCalculatorInvoiceDetailEntity> ecideList = DINVOhgDao.Instance.getElectronicCalculatorInvoiceDetail(StartDate, EndDate, Invoice_Item);//<==========
        List<tradeRecordEntity> treList = MTRAThgDao.Instance.getElectronicCalculatorInvoiceData(StartDate, EndDate);//<==========
        List<midMNameEntity> mmneList = MMBERhgDao.Instance.getMidMNameEntityList();
        double Invoice_PayAmount = 0;
        double Invoice_PayAmountLessTax = 0;
        double Tax = 0;
        double totalInvoice_PayAmount = 0;
        double totalInvoice_PayAmountLessTax = 0;
        double totalTax = 0;
        for (var i = 0; i < ecideList.Count; i++)
        {
            if (!common.isEmpty(ecideList[i].M_id))
            {
                for (var j = 0; j < mmneList.Count; j++)
                {
                    if (ecideList[i].M_id == mmneList[j].M_id)
                    {
                        ecideList[i].Invoice_ARMame = mmneList[j].M_Name;
                    }
                }
                for (var p = 0; p < treList.Count; p++)
                {
                    if (ecideList[i].T_id == treList[p].T_ID)
                    {
                        ecideList[i].Invoice_PayAmount = treList[p].T_PayMoney;
                        ecideList[i].Invoice_Item = treList[p].INV_Item;
                    }
                }
            }
            if (ecideList[i].Invoice_Item =="1")
            {
                ecideList[i].Invoice_ItemName = "二聯式";
            }
            else
            {
                ecideList[i].Invoice_ItemName = "三聯式";
            }
            if (common.isEmpty(ecideList[i].Invoice_PName))
            {
                ecideList[i].Invoice_PName = "顧問費";
            }
            ecideList[i].Invoice_CreateDate = ecideList[i].Invoice_CreateDate.Split(' ')[0];
            Invoice_PayAmount = double.Parse(ecideList[i].Invoice_PayAmount);
            totalInvoice_PayAmount += Invoice_PayAmount;
            Invoice_PayAmountLessTax = Math.Round(Invoice_PayAmount / 1.05);
            totalInvoice_PayAmountLessTax += Invoice_PayAmountLessTax;
            Tax = Invoice_PayAmount - Invoice_PayAmountLessTax;
            totalTax += Tax;
            ecideList[i].Invoice_PayAmountLessTax = Invoice_PayAmountLessTax.ToString();
            ecideList[i].Tax = Tax.ToString();
        }
        ElectronicCalculatorInvoiceDetailEntity ecide = new ElectronicCalculatorInvoiceDetailEntity();
        ecide.Invoice_ARMame = "合計";
        ecide.Tax = totalTax.ToString();
        ecide.Invoice_PayAmount = totalInvoice_PayAmount.ToString();
        ecide.Invoice_PayAmountLessTax = totalInvoice_PayAmountLessTax.ToString();
        ecideList.Add(ecide);
        log.endWrite("'ecideList' : " + ecideList.ToString(), className, methodName);
        return ecideList;
    }

    public List<string> getHandOpenInvoiceDetail(string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'StartDate' : " + StartDate + "'EndDate' : " + EndDate , className, methodName);

        List<string> strList = MTRATjoinMMBERhgDao.Instance.getHandOpenInvoiceDetail(StartDate, EndDate);//<==========

        log.endWrite("'strList' : " + strList.ToString(), className, methodName);
        return strList;
    }
    public List<InvoiceDetailEntity> getWebElectronicInvoiceDetail(string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'StartDate' : " + StartDate + "'EndDate' : " + EndDate, className, methodName);

        List<InvoiceDetailEntity> ideList = HGOPLISThgDao.Instance.getWebElectronicInvoiceDetail(StartDate, EndDate);//<==========
        double Price = 0;
        double PriceLessTax = 0;
        double Tax = 0;

        for (var i = 0; i < ideList.Count; i++)
        {
            Price = double.Parse(ideList[i].Price);
            PriceLessTax = Math.Round(Price*0.95);
            Tax = Price - PriceLessTax;
            ideList[i].PriceLessTax = PriceLessTax.ToString();
            ideList[i].Tax = Tax.ToString();
        }

        log.endWrite("'ideList' : " + ideList.ToString(), className, methodName);
        return ideList;
    }

    public List<InvoiceDetailEntity> getSchoolElectronicInvoiceDetail(string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'StartDate' : " + StartDate + "'EndDate' : " + EndDate, className, methodName);

        List<InvoiceDetailEntity> ideList = OPLIST_NEWezDiamondDao.Instance.getSchoolElectronicInvoiceDetail(StartDate, EndDate);//<==========
        double Price = 0;
        double PriceLessTax = 0;
        double Tax = 0;

        for (var i = 0; i < ideList.Count; i++)
        {
            Price = double.Parse(ideList[i].Price);
            PriceLessTax = Math.Round(Price * 0.95);
            Tax = Price - PriceLessTax;
            ideList[i].PriceLessTax = PriceLessTax.ToString();
            ideList[i].Tax = Tax.ToString();
        }

        log.endWrite("'ideList' : " + ideList.ToString(), className, methodName);
        return ideList;
    }
}