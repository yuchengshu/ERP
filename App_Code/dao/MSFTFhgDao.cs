using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MSFTFhgDao 的摘要描述
/// </summary>
public class MSFTFhgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public MSFTFhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    //引用時不用再NEW
    private static MSFTFhgDao _instance = new MSFTFhgDao();
    public static MSFTFhgDao Instance
    {
        get
        {
            return _instance;
        }
    }

    public List<MSFTFDataEntity> getMCMSFTFData()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        ////log.startWrite("'ComID' :" + ComID + "'U_MDEP' :" + U_MDEP, className, methodName);
        string commandText = string.Empty;

        ////if (U_MDEP == "0001" || U_MDEP == "0003" || U_MDEP == "0004" || U_MDEP == "0009" || U_MDEP == "0010")
        ////{
        //    commandText = "select * from MSFTF";
        ////}
        ////else
        ////{
        commandText = "select * from MSFTF ";//where MP_Com='" + ComID + "'";
        ////}
        List<MSFTFDataEntity> msftfList = MSFTFSql.Instance.getMSFTF(connectionStrings, commandText);//<==========

        log.endWrite("'msftfList' :" + msftfList.ToString(), className, methodName);
        return msftfList;
    }

    /*
*  public List<dataGiftTableEntity> getDataGiftTable(string ComID, string U_MDEP)
{
   string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
   log.startWrite("'ComID' :" + ComID + "'U_MDEP' :" + U_MDEP, className, methodName);
   string commandText = string.Empty;

   if (U_MDEP == "0001" || U_MDEP == "0003" || U_MDEP == "0004" || U_MDEP == "0009" || U_MDEP == "0010")
   {
       commandText = "select * from MSEDT";
   }
   else
   {
       commandText = "select * from MSEDT where MP_Com='"+ ComID + "'";
   }
   List<dataGiftTableEntity> dgteList = MSEDThgSql.Instance.getDataGiftTable(connectionStrings, commandText);//<==========

   log.endWrite("'dgteList' :" + dgteList.ToString(), className, methodName);
   return dgteList;
}
*/
    //U_Num, keyWord
    public List<msftfEntity> getMSftfList(string keyWord)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        ////log.startWrite("'ComID' :" + ComID + "'U_MDEP' :" + U_MDEP, className, methodName);
        string commandText = string.Empty;

        ////if (U_MDEP == "0001" || U_MDEP == "0003" || U_MDEP == "0004" || U_MDEP == "0009" || U_MDEP == "0010")
        ////{
        //    commandText = "select * from MSFTF";
        ////}
        ////else
        ////{
        commandText = "select * from MSFTF ";//where MP_Com='" + ComID + "'";
        ////}
        List<msftfEntity> msftfList = MSFTFSql.Instance.getmsftfList(connectionStrings, commandText);//<==========

        log.endWrite("'msftfList' :" + msftfList.ToString(), className, methodName);
        return msftfList;
    }

}