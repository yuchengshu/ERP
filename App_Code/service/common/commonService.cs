using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.IO;
//using System;
//using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
//using System.Linq;
//using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// commonService 的摘要描述
/// </summary>
public class commonService : System.Web.UI.Page
{

    //引用時不用再NEW
    private static commonService _instance = new commonService();

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;



    public static commonService Instance
    {
        get
        {
            return _instance;
        }
    }
    public commonService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //取得分析師
    public List<ditcodedescEntity> getCustomerDetailAnalyst(string ComID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        List<ditcodedescEntity> CustomerDetailAnalyst = MITEMhgDao.Instance.getCustomerDetailAnalyst(ComID);//<====

        log.endWrite(CustomerDetailAnalyst.ToString(), className, methodName);
        return CustomerDetailAnalyst;
    }
    //取得付款方式
    //getPITEMList
    public List<ditcodedescEntity> getPITEMList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        List<ditcodedescEntity> PITEMList = MITEMhgDao.Instance.getPITEMList();//<====

        log.endWrite(PITEMList.ToString(), className, methodName);
        return PITEMList;
    }


    //getMemberTypeList
    public List<ditcodedescEntity> getMP_ItemList(string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        List<ditcodedescEntity> MP_ItemList = MITEMhgDao.Instance.MP_ItemList(U_Num);//<====

        log.endWrite(MP_ItemList.ToString(), className, methodName);
        return MP_ItemList;
    }



    public List<ditcodedescEntity> getMemberTypeList(string TeacherUnum)
    {
        //D9907161
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        List<ditcodedescEntity> MemberTypeList = MITEMhgDao.Instance.getMemberTypeList(TeacherUnum);//<====

        log.endWrite(MemberTypeList.ToString(), className, methodName);
        return MemberTypeList;
    }
    //    List<ditcodedescEntity> SelectCF_ITemList = commonService.Instance.getCF_ITemList();//<==========

    //public List<BusinessConnectionDataEditRecordEntity> getBusinessConnectionDataEditRecord(string M_ID)
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    //string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
    //    StringBuilder sb = new StringBuilder();
    //    // sb.Append(string.Format(paramFormat, menu_no, U_Num));
    //    log.startWrite(sb.ToString(), className, methodName);

    //    List<ditcodedescEntity> SelectBankList = MUSERhgDao.Instance.getSelectEmployList(COMID, U_POSITION);//<====

    //    log.endWrite(SelectBankList.ToString(), className, methodName);
    //    return SelectBankList;
    //}


    //getCF_ITemList
    ////取得[聯絡單種類]
    public List<ditcodedescEntity> getCF_ITemList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        List<ditcodedescEntity> SelectBankList = MITEMhgDao.Instance.getCF_ITemList();//<====

        log.endWrite(SelectBankList.ToString(), className, methodName);
        return SelectBankList;
    }
    //getSelectEmployList
    public List<ditcodedescEntity> getSelectEmployList(string COMID,string  U_POSITION)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        List<ditcodedescEntity> SelectBankList = MUSERhgDao.Instance.getSelectEmployList(COMID, U_POSITION);//<====

        log.endWrite(SelectBankList.ToString(), className, methodName);
        return SelectBankList;
    }
    public List<ditcodedescEntity> getMPToMP_TypeList(string MPType)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        List<ditcodedescEntity> SelectBankList = MUSERhgDao.Instance.getMPToMP_TypeList(MPType);//<====

        log.endWrite(SelectBankList.ToString(), className, methodName);
        return SelectBankList;
    }


    //getLeaderList
    public List<ditcodedescEntity> getLeaderList(string SelectCom_Title, string SelectDept_Title)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        List<ditcodedescEntity> SelectBankList = MUSERhgDao.Instance.getLeaderList(SelectCom_Title, SelectDept_Title);//<====

        log.endWrite(SelectBankList.ToString(), className, methodName);
        return SelectBankList;
    }
    public List<ditcodedescEntity> getAgentList(string SelectCom_Title,string  SelectDept_Title) 
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        List<ditcodedescEntity> SelectBankList = MUSERhgDao.Instance.getAgentList(SelectCom_Title, SelectDept_Title);//<====

        log.endWrite(SelectBankList.ToString(), className, methodName);
        return SelectBankList;
    }
    public List<ditcodedescEntity> getTelZoneList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        List<ditcodedescEntity> SelectBankList = MITEMhgDao.Instance.getTelZoneList();//<====

        log.endWrite(SelectBankList.ToString(), className, methodName);
        return SelectBankList;
    }
    public List<ditcodedescEntity> getBankListList(string BankKeyWord)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        List<ditcodedescEntity> SelectBankList = MITEMhgDao.Instance.getSelectBankList(BankKeyWord);//<====

        log.endWrite(SelectBankList.ToString(), className, methodName);
        return SelectBankList;
    }
    //取得銀行列表getBankListList
    public List<ditcodedescEntity> getBankListList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        List<ditcodedescEntity> SelectBankList = MITEMhgDao.Instance.getSelectBankList();//<====

        log.endWrite(SelectBankList.ToString(), className, methodName);
        return SelectBankList;
    }
    //取得職稱列表
    public List<ditcodedescEntity> getSelectPositList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        List<ditcodedescEntity> SelectPositList = MITEMhgDao.Instance.getSelectPositList();//<====

        log.endWrite(SelectPositList.ToString(), className, methodName);
        return SelectPositList;
    }

    //getSelectTownShipList
    //取得鄉鎮區市(已知城市)
    public List<ditcodedescEntity> getSelectTownShipList(string county)
    {
     string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
    StringBuilder sb = new StringBuilder();
    // sb.Append(string.Format(paramFormat, menu_no, U_Num));
    log.startWrite(sb.ToString(), className, methodName);

        List<ditcodedescEntity> SelectTownShipList = MITEMhgDao.Instance.getSelectTownShipList(county);//<====

    log.endWrite(SelectTownShipList.ToString(), className, methodName);
        return SelectTownShipList;
    }
public List<ditcodedescEntity> getSelectTownShipList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        List<ditcodedescEntity> SelectTownShipList = MITEMhgDao.Instance.getSelectTownShipList();//<====

        log.endWrite(SelectTownShipList.ToString(), className, methodName);
        return SelectTownShipList;
    }

    public List<ditcodedescEntity> getSelectLevelList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        List<ditcodedescEntity> selectDepList = MITEMhgDao.Instance.getSelectLevelList();//<====

        log.endWrite(selectDepList.ToString(), className, methodName);
        return selectDepList;
    }

    //getSelectUITEMList
    //取得[職稱]列表
    public List<ditcodedescEntity> getSelectUITEMList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        List<ditcodedescEntity> selectDepList = MITEMhgDao.Instance.getSelectLevelList();//<====

        log.endWrite(selectDepList.ToString(), className, methodName);
        return selectDepList;
    }
    //getSelectPositList
    //取得等級列表
    //public List<ditcodedescEntity> getSelectPositList()
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
    //    StringBuilder sb = new StringBuilder();
    //    // sb.Append(string.Format(paramFormat, menu_no, U_Num));
    //    log.startWrite(sb.ToString(), className, methodName);

    //    List<ditcodedescEntity> selectDepList = MITEMhgDao.Instance.getSelectPositList();//<====

    //    log.endWrite(selectDepList.ToString(), className, methodName);
    //    return selectDepList;
    //}
    //getSelectCountyList
    public List<ditcodedescEntity> getSelectCountyList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        List<ditcodedescEntity> selectCountyList = MITEMhgDao.Instance.getSelectCountyList();//<====

        log.endWrite(selectCountyList.ToString(), className, methodName);
        return selectCountyList;
    }
    //取得所屬公司列表
    public List<ditcodedescEntity> getSelectComList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        List<ditcodedescEntity> selectDepList = MITEMhgDao.Instance.getSelectComList();//<====

        log.endWrite(selectDepList.ToString(), className, methodName);
        return selectDepList;
    }
    //取得縣市列表
    public List<ditcodedescEntity> getCountyList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        List<ditcodedescEntity> selectDepList = MITEMhgDao.Instance.getCountyList();//<====

        log.endWrite(selectDepList.ToString(), className, methodName);
        return selectDepList;
    }
    //getComOptionList
    //取得鄉鎮區列表
    public List<ditcodedescEntity> getTownShipList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        //List<ditcodedescEntity> selectDepList = MITEMhgDao.Instance.getSelectDeptList();//<====
        List<ditcodedescEntity> selectComList = MITEMhgDao.Instance.getTownShipOptionList();//<====

        log.endWrite(selectComList.ToString(), className, methodName);
        return selectComList;
    }
    //取得縣市列表
    //getCoumtyOptionList
    public List<ditcodedescEntity> getCountyOptionList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        List<ditcodedescEntity> selectDepList = MITEMhgDao.Instance.getCountyOptionList();//<====

        log.endWrite(selectDepList.ToString(), className, methodName);
        return selectDepList;
    }
    //取得鄉鎮市區列表
    //getTownShipOptionList
    public List<ditcodedescEntity> getTownShipOptionList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        List<ditcodedescEntity> selectDepList = MITEMhgDao.Instance.getTownShipOptionList();//<====

        log.endWrite(selectDepList.ToString(), className, methodName);
        return selectDepList;
    }
    
    public List<ditcodedescEntity> getAnalystMITEM(string mitcode)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        List<ditcodedescEntity> AnalystMITEMList = MITEMhgDao.Instance.getAnalystMITEM(mitcode);//<====

        log.endWrite(AnalystMITEMList.ToString(), className, methodName);
        return AnalystMITEMList;
    }

    //取得所屬部門列表
    public List<ditcodedescEntity> getSelectDeptList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
       // sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        List<ditcodedescEntity> selectDepList = MITEMhgDao.Instance.getSelectDeptList();//<====

        log.endWrite(selectDepList.ToString(), className, methodName);
        return selectDepList;
    }

    /// <summary>
    /// 查詢使用者頁面權限
    /// </summary>
    /// <param name="menu_no"></param>
    /// <param name="menu_id"></param>
    /// <param name="U_Num"></param>
    /// <returns></returns>
    public List<muserMenuSetupEntity> getUserAuthority(string menu_no, string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);

        List<muserMenuSetupEntity> mmcList = MUMAPhgDao.Instance.getUserAuthority(menu_no, U_Num);//<====

        log.endWrite(mmcList.ToString(), className, methodName);
        return mmcList;
    }

    //取得投資金額咧表
    //getInvestMoneyList
    // public List<InvestMoney> getInvestMoneyList(string menu_no, string U_Num)
    public List<InvestMoney> getInvestMoneyList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        string paramFormat = "'menu_no' : {0}, 'U_Num' : {1}";
        StringBuilder sb = new StringBuilder();
        //sb.Append(string.Format(paramFormat, menu_no, U_Num));
        log.startWrite(sb.ToString(), className, methodName);
        //List<InvestMoney> imList = MITEMhgDao.Instance.getInvestMoneyList(menu_no, U_Num);//<====
        List<InvestMoney> imList = MITEMhgDao.Instance.getInvestMoneyList();
        log.endWrite(imList.ToString(), className, methodName);
        return imList;
    }


    /// <summary>
    /// 查詢分析師資料
    /// </summary>
    /// <returns></returns>
    /* public List<indexBDdataEntity> getAnalystList(string U_Position, string ComID)
     {
         string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
         log.startWrite(common.nothing, className, methodName);
         List<indexBDdataEntity> cdeList = MUSERhgDao.Instance.getAnalystList("Y", U_Position, ComID);//<==========
         log.endWrite(cdeList.ToString(), className, methodName);
         return cdeList;
     }*/

    //取得資源帳號
    public List<Z_ItemEntity> getZitemList(string ComID, string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'ComID' : " + ComID, className, methodName);

        List<Z_ItemEntity> cdeList = MITEMhgDao.Instance.getZitemList(ComID, U_Num);//<==========

        log.endWrite(cdeList.ToString(), className, methodName);
        return cdeList;
    }

    //取得交易狀態
    public List<TradingStatus> getTradingStatusListFucList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'ComID' : " + ComID, className, methodName);

        List<TradingStatus> cdeList = MITEMhgDao.Instance.getTradingStatusList();//<==========

        log.endWrite(cdeList.ToString(), className, methodName);
        return cdeList;
    }
    public List<Z_ItemEntity> getZitemListFucList(string ComID, string U_Num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID' : " + ComID, className, methodName);

        List<Z_ItemEntity> cdeList = MITEMhgDao.Instance.getZitemList(ComID, U_Num);//<==========

        log.endWrite(cdeList.ToString(), className, methodName);
        return cdeList;
    }
    /// <summary>
    /// 查詢分析師資料
    /// </summary>
    /// <returns></returns>
    public List<indexBDdataEntity> getAnalystList(string ComID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID' : " + ComID, className, methodName);

        List<indexBDdataEntity> cdeList = MUSERhgDao.Instance.getAnalystList(ComID);//<==========

        log.endWrite(cdeList.ToString(), className, methodName);
        return cdeList;
    }

    public List<indexBDdataEntity> getAnalystList()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'ComID' : " + ComID, className, methodName);

        List<indexBDdataEntity> cdeList = MUSERhgDao.Instance.getAnalystList();//<==========

        log.endWrite(cdeList.ToString(), className, methodName);
        return cdeList;
    }

    /// <summary>
    /// 查詢派發人員資料
    /// </summary>
    /// <returns></returns>
    public List<indexBDdataEntity> getDispatcherList(string ComID, string U_num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID' : " + ComID, className, methodName);

        List<indexBDdataEntity> cdeList = MUSERhgDao.Instance.getDispatcherList(ComID, U_num);//<==========

        log.endWrite(cdeList.ToString(), className, methodName);
        return cdeList;
    }


    public List<indexBDdataEntity> getAnalystListForMessageSearch(string ComID, string U_MDEP, string U_Num, string U_Leader, string U_Position)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID':" + ComID + "'U_MDEP':" + U_MDEP + "'U_Num':" + U_Num + "'U_Leader':" + U_Leader, className, methodName);

        List<indexBDdataEntity> ibddeList = MUSERhgDao.Instance.getAnalystListForMessageSearch(ComID, U_MDEP, U_Num, U_Leader, U_Position);//<==========

        log.endWrite("'ibddeList' :" + ibddeList.ToString(), className, methodName);
        return ibddeList;
    }

    public List<indexBDdataEntity> getAnalystListForOItable(string ComID, string U_MDEP, string U_Num, string U_Leader, string U_Position)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID':" + ComID + "'U_MDEP':" + U_MDEP + "'U_Num':" + U_Num + "'U_Leader':" + U_Leader, className, methodName);

        List<indexBDdataEntity> ibddeList = MUSERhgDao.Instance.getAnalystListForOItable(ComID, U_MDEP, U_Num, U_Leader, U_Position);//<==========

        log.endWrite("'ibddeList' :" + ibddeList.ToString(), className, methodName);
        return ibddeList;
    }

    public List<indexBDdataEntity> getAnalystListAllPowerSendRecord(string ComID, string U_MDEP, string U_Num, string U_Leader, string U_Position)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID':" + ComID + "'U_MDEP':" + U_MDEP + "'U_Num':" + U_Num + "'U_Leader':" + U_Leader, className, methodName);

        List<indexBDdataEntity> ibddeList = MUSERhgDao.Instance.getAnalystListAllPowerSendRecord(ComID, U_MDEP, U_Num, U_Leader, U_Position);//<==========

        log.endWrite("'ibddeList' :" + ibddeList.ToString(), className, methodName);
        return ibddeList;
    }
    //20220517
    public List<muserEntity> getAnalystListForSRMSYSKQuery(string U_Position, string Comid, string U_Num, string LeaveDate)
    {
        string U_MDEP = Session["U_MDEP"].ToString(); ;
        string U_Leader = Session["U_Leader"].ToString();
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Position':" + U_Position + "'Comid':" + Comid + "'U_Num':" + U_Num + "'LeaveDate':" + LeaveDate, className, methodName);
        List<muserEntity> muserList = MUSERhgDao.Instance.getAnalystListForSRMSYSKQuery(U_Position, Comid, U_Num, LeaveDate, U_MDEP, U_Leader);//<==========

        log.endWrite("'muserList' :" + muserList.ToString(), className, methodName);
        return muserList;

    }
    //下拉式選單選項變動時
    public List<muserEntity> getEmplist(string ComID, string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("ComID : " + ComID + "&& U_MDEP : " + U_MDEP, className, methodName);

        List<muserEntity> lmList = MUSERhgDao.Instance.getEmplist(ComID, U_MDEP);

        log.endWrite(lmList.ToString(), className, methodName);
        return lmList;
    }

    public List<indexBDdataEntity> getEmpExtension(string ComID, string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("ComID : " + ComID + "U_MDEP : " + U_MDEP, className, methodName);
        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("UITEM");
        List<indexBDdataEntity> ibdeList = MUSERhgDao.Instance.getEmpExtension(ComID, U_MDEP);
        for (var i = 0; i < ibdeList.Count; i++)
        {
            for (var j = 0; j < ddeList.Count; j++)
            {
                if (ibdeList[i].U_Item == ddeList[j].ditcode)
                {
                    ibdeList[i].U_ItemName = ddeList[j].ddesc;
                }
            }
            ibdeList[i].U_TelNumber = getU_TelNumber(U_MDEP, ibdeList[i].U_Tel);
        }
        log.endWrite(ibdeList.ToString(), className, methodName);
        return ibdeList;
    }

    public List<ditcodedescEntity> getResponsibleAssistantListForMCMCHTR_query()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
       // log.startWrite("'ComID' :" + ComID + "'U_MDEP' :" + U_MDEP, className, methodName);

        List<ditcodedescEntity> ibddeList = MUSERhgDao.Instance.getResponsibleAssistantListForMCMCHTR_query();

        log.endWrite("'ibddeList' : " + ibddeList.ToString(), className, methodName);
        return ibddeList;
    }
    public List<indexBDdataEntity> getResponsibleAssistantList(string ComID, string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ComID' :" + ComID + "'U_MDEP' :" + U_MDEP, className, methodName);

        List<indexBDdataEntity> ibddeList = MUSERhgDao.Instance.getResponsibleAssistantList(ComID, U_MDEP);

        log.endWrite("'ibddeList' : " + ibddeList.ToString(), className, methodName);
        return ibddeList;
    }

    /*
    public List<indexBDdataEntity> getAnalystListForPerformance(string startDate,string endDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("startDate : " + startDate+ "'endDate' : "+ endDate, className, methodName);

        List<indexBDdataEntity> ibddeList = MUSERhgDao.Instance.getAnalystListForPerformance(startDate,endDate);

        log.endWrite("'ibddeList' : " + ibddeList.ToString(), className, methodName);
        return ibddeList;
    }*/
    public List<indexBDdataEntity> getEmpListForPerformance(string StartDate, string EndDate, string EmpType, string ComID, string U_MDEP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("StartDate :" + StartDate + "'EndDate' : " + EndDate + "'EmpType' : " + EmpType + "'ComID' : " + ComID + "'U_MDEP' : " + U_MDEP, className, methodName);

        List<indexBDdataEntity> ibddeList = MUSERhgDao.Instance.getEmpListForPerformance(StartDate, EndDate, EmpType, ComID, U_MDEP);//<==========

        log.endWrite("'ibddeList' : " + ibddeList.ToString(), className, methodName);
        return ibddeList;
    }

    public List<indexBDdataEntity> getGroupEmp(string startDate, string endDate, string groupType)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("startDate :" + startDate + "'endDate' : " + endDate + "'groupType' : " + groupType, className, methodName);

        List<indexBDdataEntity> ibddeList = MUSERhgDao.Instance.getGroupEmp(startDate, endDate, groupType);//<==========

        log.endWrite(ibddeList.ToString(), className, methodName);
        return ibddeList;
    }
    //getAnalystListHtmlTagOptionForSRMSYSKQuery
    public List<indexBDdataEntity> getAnalystListHtmlTagOptionForSRMSYSKQuery(string startDate, string endDate, string groupType)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("startDate :" + startDate + "'endDate' : " + endDate + "'groupType' : " + groupType, className, methodName);

        List<indexBDdataEntity> ibddeList = MUSERhgDao.Instance.getGroupEmp(startDate, endDate, groupType);//<==========

        log.endWrite(ibddeList.ToString(), className, methodName);
        return ibddeList;
    }
    private string getU_TelNumber(string U_MDEP, string U_Tel)
    {
        string backStr = string.Empty;
        string utel = U_Tel.Substring(1, 3);

        char[] utelArr = U_Tel.ToCharArray();
        string tel66303 = "6630-3";
        string tel66321 = "6632-1";
        string tel66303xxx = tel66303 + utelArr[1] + utelArr[2] + utelArr[3];
        string tel66321xxx = tel66321 + utelArr[1] + utelArr[2] + utelArr[3];

        if (U_MDEP == "0001")
        {
            if (U_Tel == "3250")
            {
                backStr = "2356-0105";
            }
            else
            {
                backStr = tel66303xxx;
            }
        }
        else if (U_MDEP == "0002" || U_MDEP == "0003" || U_MDEP == "0004" || U_MDEP == "0005" || U_MDEP == "0007" || U_MDEP == "0009" || U_MDEP == "0011" || U_MDEP == "0012" || U_MDEP == "0013" || U_MDEP == "0015" || U_MDEP == "0016")
        {
            if (utelArr[1] == '0')
            {
                backStr = tel66321xxx;
            }
            else
            {
                backStr = tel66303xxx;
            }
        }
        else if (U_MDEP == "0010")
        {
            if (U_Tel == "3250")
            {
                backStr = "2356-0105<br>6630-3275";
            }
            else
            {
                backStr = tel66303xxx;
            }
        }
        else if (U_MDEP == "0017")
        {
            backStr = tel66321xxx;
        }
        return backStr;
    }


    public string setUserAuthority(string FunName,string MenuNo,string U_Num,string Enable)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("startDate :" + startDate + "'endDate' : " + endDate + "'groupType' : " + groupType, className, methodName);

        string m = MUMAPhgDao.Instance.setUserAuthority(FunName, MenuNo, U_Num, Enable);//<==========

        //log.endWrite(ibddeList.ToString(), className, methodName);
        //return ibddeList;
        return m;
    }

}