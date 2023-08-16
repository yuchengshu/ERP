using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// businessConnectionService 的摘要描述
/// </summary>
public class businessConnectionService
{
    //引用時不用再NEW
    private static businessConnectionService _instance = new businessConnectionService();
    public static businessConnectionService Instance
    {
        get
        {
            return _instance;
        }
    }

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public businessConnectionService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //20230131work
    /// <summary>
    /// 取得業務聯絡單列表
    /// </summary>
    /// <returns></returns>
    public List<businessConnectionDataEntity> getBusinessConnectionList(searchBusinessConnectionParamEntity sbcpe)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'sbcpe' : "+ sbcpe.ToString(), className, methodName);
        List<businessConnectionDataEntity> bcdeList = MMBERjoinMCOTFhgDao.Instance.getBusinessConnectionList(sbcpe);//<==========
        //List<ditcodedescEntity> MTOBJddeList = MITEMhgDao.Instance.getditcodedescEntityList("MTOBJ");//<====
        //List<ditcodedescEntity> MCOTFddeList = MITEMhgDao.Instance.getditcodedescEntityList("MCOTF");//<====
        //List<ditcodedescEntity> COMIDddeList = MITEMhgDao.Instance.getditcodedescEntityList("COMID");//<====

        //for (var i = 0; i < bcdeList.Count; i++) {
            //進行欄位判斷重整:件別,燈號
            //bcdeList[i].Light_Status = deCode.Light_Status(bcdeList[i].Light_Status);
            //bcdeList[i].F_StatusName = deCode.F_Status(bcdeList[i].F_Status);
            //bcdeList[i].U_LeaderName = deCode.personStatus(bcdeList[i].U_LeaderName);
            //bcdeList[i].EX_Name = deCode.personStatus(bcdeList[i].EX_Name);
            //bcdeList[i].EX_LeaderName = deCode.personStatus(bcdeList[i].EX_LeaderName);

            //for (var k = 0; k < COMIDddeList.Count; k++)
            //{
            //    //if (bcdeList[i].addUserComID == COMIDddeList[k].ditcode)
            //    //{
            //    //    bcdeList[i].addUserComIDName = COMIDddeList[k].ddesc;
            //    //}
            //}
            //for (var j = 0; j < MTOBJddeList.Count; j++)
            //{
            //    if (bcdeList[i].Obj == MTOBJddeList[j].ditcode)
            //    {
            //        bcdeList[i].ObjName = MTOBJddeList[j].ddesc;
            //    }
            //}
            //for (var z = 0; z < MCOTFddeList.Count; z++)
            //{
            //    if (bcdeList[i].CF_Item == MCOTFddeList[z].ditcode)
            //    {
            //        bcdeList[i].CF_ItemName = MCOTFddeList[z].ddesc;
            //    }
            //}
        //}
        log.endWrite("'bcdeList' : "+bcdeList.ToString(), className, methodName);
        return bcdeList;
    }

}