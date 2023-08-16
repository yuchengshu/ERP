using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.IO;
using System.Xml;
using System.Net;


/// <summary>
/// callMessageManagementService 的摘要描述
/// </summary>
public class callMessageManagementService
{
    //引用時不用再NEW
    private static callMessageManagementService _instance = new callMessageManagementService();

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public static callMessageManagementService Instance
    {
        get
        {
            return _instance;
        }
    }
    public callMessageManagementService()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public static string decode(string text)
    {
        byte[] mybyte = System.Convert.FromBase64String(text);
        string returntext = System.Text.Encoding.UTF8.GetString(mybyte);
        return returntext;
    }


    private string xmlReader(string xmlStr,string readType)
    {
        string backStr = string.Empty;
        XmlDocument xml = new XmlDocument();
        xml.LoadXml(xmlStr);
        string RES = string.Empty;
        string Err = string.Empty;
        XmlNodeList NodeList = xml.SelectNodes("Result");
        foreach (XmlNode nodeData in NodeList)
        {
           RES = nodeData.SelectSingleNode("RES").InnerText;
           Err = nodeData.SelectSingleNode("ERR").InnerText;
        }
        if (readType == "RES")
        {
            backStr = RES;
        }
        else
        {
            backStr = Err;
        }
        return backStr;
    }

    public List<allPowerSendRecordEntity> getAllPowerSendRecord(getMessageListParam gmlp)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MP' :" + gmlp.MP + "'MP_Item' :" + gmlp.MP_Item + "'StartDate' :" + gmlp.StartDate + "'EndDate' :" + gmlp.EndDate + "'keyWord' :" + gmlp.keyWord + "'U_MDEP':" + gmlp.U_MDEP + "'U_POSITION':" + gmlp.U_POSITION + "'ComID':" + gmlp.ComID + "'U_Leader':" + gmlp.U_Leader + "'U_Num':" + gmlp.U_Num, className, methodName);
       // string destinationUrl = "http://ep1.ite2.com.tw/scripts/fpmsservice.asmx";

        List <allPowerSendRecordEntity> apsreList = MSGRPhgDao.Instance.getAllPowerSendRecord(gmlp);//<====
        List<indexBDdataEntity> lmList = MUSERhgDao.Instance.getEmpBDlist();
        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("all");
        List<ditcodedescEntity> MSENOddeList = MITEMhgDao.Instance.getditcodedescEntityList("MSENO");
        List<ditcodedescEntity> MSRNOddeList = MITEMhgDao.Instance.getditcodedescEntityList("MSRNO");
        string apsreListM_MP = string.Empty;
        string tempMP = string.Empty;
        string tempLmListEmpName = string.Empty;
        string tempAdd_user = string.Empty;
        string lmListU_Num = string.Empty;
        string lmListEmpName = string.Empty;

        for (var i = 0; i < apsreList.Count; i++)
        {
            apsreListM_MP = apsreList[i].M_MP;
            if (tempMP != apsreListM_MP)
            {
                for (var z = 0; z < lmList.Count; z++)
                {
                    tempMP = apsreListM_MP;
                    lmListU_Num = lmList[z].U_Num;
                    lmListEmpName = lmList[z].empName;
                    if (lmListU_Num == apsreListM_MP)
                    {
                        apsreList[i].M_MPname = lmListEmpName;
                        tempLmListEmpName = lmListEmpName;
                    }
                    if (lmListU_Num == apsreList[i].add_user)
                    {
                        apsreList[i].add_userName = lmListEmpName;
                        tempAdd_user = lmListEmpName;
                    }
                }
            }
            else
            {
                apsreList[i].M_MPname = tempLmListEmpName;
                apsreList[i].add_userName = tempAdd_user;
            }
            for (var k = 0; k < MSENOddeList.Count; k++)
            {
                if(apsreList[i].M_TStatus == MSENOddeList[k].ditcode)
                {
                    apsreList[i].M_TStatusName = MSENOddeList[k].ddesc;
                }
            }
            for (var r = 0; r < MSRNOddeList.Count; r++)
            {
                if (apsreList[i].getMessageStatus == MSRNOddeList[r].ditcode)
                {
                    apsreList[i].getMessageStatusName = MSRNOddeList[r].ddesc;
                }
                else
                {
                    if (apsreList[i].getMessageStatus != "OK")
                    {
                        if (common.isEmpty(apsreList[i].getMessageStatus))
                        {
                            apsreList[i].getMessageStatusName = "確認中";
                        }
                        else
                        {
                            apsreList[i].getMessageStatusName = "<font color=red>" + apsreList[i].getMessageStatusName + "</font>";
                        }
                    }
                }
            }
            for (var j = 0; j < ddeList.Count; j++)
            {
                if (ddeList[j].mitcode == apsreListM_MP)
                {
                    if (apsreList[i].M_MITem == "1000")
                    {
                        apsreList[i].M_MITemName = "索取贈送";
                        break;
                    }
                    else if (ddeList[j].ditcode == apsreList[i].M_MITem)
                    {
                        apsreList[i].M_MITemName = ddeList[j].ddesc;
                        break;
                    }
                }
                /* if (apsreList[i].M_MITem == "1000")
                 {
                     apsreList[i].M_MITemName = "索取贈送";
                     break;
                 }
                 else
                 {
                     if (ddeList[j].mitcode == apsreListM_MP)
                     {
                         if (ddeList[j].ditcode == apsreList[i].M_MITem)
                         {
                             apsreList[i].M_MITemName = ddeList[j].ddesc;
                             break;
                         }
                     }
                 }*/
            }
        }
        log.endWrite("'apsreList' :" + apsreList.ToString(), className, methodName);
        return apsreList;
    }

    public List<List<callMassageEntity>> getCallMessageDealData(string MP, string searchDate, string U_MDEP, string ComID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MP' :" + MP + "'searchDate' :" + searchDate + "'U_MDEP' :" + U_MDEP + "'ComID' :" + ComID, className, methodName);

        List<callMassageEntity> cmeList = MMSGEhgDao.Instance.getCallMessageDealData(searchDate);//<====
        List<indexBDdataEntity> lmList = MUSERhgDao.Instance.getEmpBDlist();
        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("all");
        List<callMassageEntity> tempCmeList = null;
        List<indexBDdataEntity> allAnalystList = null;
        List<List<callMassageEntity>> cmeListList = new List<List<callMassageEntity>>();
        if (!common.isEmpty(MP))
        {
            tempCmeList = new List<callMassageEntity>();
            for (var i = 0; i < cmeList.Count; i++)
            {
                if (cmeList[i].MP == MP)
                {
                    tempCmeList.Add(cmeList[i]);
                }
            }
            cmeListList.Add(decode(tempCmeList, lmList, ddeList));
        }
        else
        {
            allAnalystList = MUSERhgDao.Instance.getAllAnalystListForCallMessage(U_MDEP, ComID);
            for (var j = 0; j < allAnalystList.Count; j++)
            {
                tempCmeList = new List<callMassageEntity>();
                for (var i = 0; i < cmeList.Count; i++)
                {
                    if (cmeList[i].MP == allAnalystList[j].U_Num)
                    {
                        tempCmeList.Add(cmeList[i]);
                    }
                }
                cmeListList.Add(decode(tempCmeList, lmList, ddeList));
            }
        }
        log.endWrite("'cmeListList' :" + cmeListList.ToString(), className, methodName);
        return cmeListList;
    }

    public List<callMassageEntity> getMessageList(getMessageListParam gmlp)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MP' :" + gmlp.MP + "'MP_Item' :" + gmlp.MP_Item + "'StartDate' :" + gmlp.StartDate + "'EndDate' :" + gmlp.EndDate + "'keyWord' :" + gmlp.keyWord + "'U_MDEP':" + gmlp.U_MDEP + "'U_POSITION':" + gmlp.U_POSITION + "'ComID':" + gmlp.ComID + "'U_Leader':" + gmlp.U_Leader + "'U_Num':" + gmlp.U_Num, className, methodName);

        List<callMassageEntity> cmeList = MMSGEhgDao.Instance.getMessageList(gmlp);//<====
        List<indexBDdataEntity> lmList = MUSERhgDao.Instance.getEmpBDlist();
        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("all");
        mcDataEntity mde = null;
        for (var i = 0; i < cmeList.Count; i++)
        {
            if (common.isEmpty(cmeList[i].MS_Tel))
            {
                cmeList[i].MS_TelName = "批次";
            }
            else
            {
                cmeList[i].MS_TelName = "單筆";
            }
            for (var z = 0; z < lmList.Count; z++)
            {
                if (lmList[z].U_Num == cmeList[i].MP)
                {
                    cmeList[i].MPname = lmList[z].empName;
                }
                if (lmList[z].U_Num == cmeList[i].add_user)
                {
                    cmeList[i].add_userName = lmList[z].empName;
                }
            }
            for (var j = 0; j < ddeList.Count; j++)
            {
                if (ddeList[j].mitcode == cmeList[i].MP)
                {
                    if (ddeList[j].ditcode == cmeList[i].MP_Item)
                    {
                        cmeList[i].MP_ItemName = ddeList[j].ddesc;
                        break;
                    }
                }
            }
        }
        log.endWrite("'cmeList' :"+ cmeList.ToString(), className, methodName);
        return cmeList;
    }

    public string editMessageData(string msg_id, string msg_text, string MS_TStatus)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'msg_id' :" + msg_id + "'msg_text' :" + msg_text + "'MS_TStatus' :" + MS_TStatus, className, methodName);

        string backStr = MMSGEhgDao.Instance.editMessageData(msg_id, msg_text, MS_TStatus);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }


    public string deleteMessageData(string msg_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'msg_id' :" + msg_id, className, methodName);

        string backStr = MMSGEhgDao.Instance.deleteMessageData(msg_id);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public List<callMassageEntity> decode(List<callMassageEntity> backCmeList , List<indexBDdataEntity> lmList, List<ditcodedescEntity> ddeList)
    {
        for (var i = 0; i < backCmeList.Count; i++)
        {
            for (var z = 0; z < lmList.Count; z++)
            {
                if (lmList[z].U_Num == backCmeList[i].MP)
                {
                    backCmeList[i].MPname = lmList[z].empName;
                }
                if (lmList[z].U_Num == backCmeList[i].add_user)
                {
                    backCmeList[i].add_userName = lmList[z].empName;
                }
            }
            for (var j = 0; j < ddeList.Count; j++)
            {
                if (ddeList[j].mitcode == backCmeList[i].MP)
                {
                    if (ddeList[j].ditcode == backCmeList[i].MP_Item)
                    {
                        backCmeList[i].MP_ItemName = ddeList[j].ddesc;
                        break;
                    }
                }
            }
        }
        return backCmeList;
    }
    public List<publicMessageEntity> getPublicMessage()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<publicMessageEntity> pmeList = MSGPThgDao.Instance.getPublicMessage();//<==========

        log.endWrite("'pmeList' :" + pmeList.ToString(), className, methodName);
        return pmeList;
    }

    public string mdAddDeleteEdit(string auto_id, string Msg_Context, string dataAction, string actionUser)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'auto_id' :" + auto_id + "'Msg_Context' :" + Msg_Context + "'dataAction' :" + dataAction + "'actionUser' :" + actionUser, className, methodName);

        string backStr = MSGPThgDao.Instance.mdAddDeleteEdit(auto_id, Msg_Context, dataAction, actionUser);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public List<callMassageEntity> getAnalystMessage(string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MP' :" + MP, className, methodName);

        List<callMassageEntity> cmeList = MMSGEhgDao.Instance.getAnalystMessage(MP);//<==========
        List<indexBDdataEntity> lmList = MUSERhgDao.Instance.getEmpBDlist();
        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList(MP);
        for (var i = 0; i < cmeList.Count; i++)
        {
            for (var j = 0; j < lmList.Count; j++)
            {
                if (cmeList[i].MP == lmList[j].U_Num)
                {
                    cmeList[i].MPname = lmList[j].empName;
                }
            }
            for (var z = 0; z < ddeList.Count; z++)
            {
                if (cmeList[i].MP_Item == ddeList[z].ditcode)
                {
                    cmeList[i].MP_ItemName = ddeList[z].ddesc;
                }
            }
        }
        log.endWrite("'cmeList' :" + cmeList.ToString(), className, methodName);
        return cmeList;
    }

    public string sendSingleMessage(allPowerSendRecordEntity apsre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'apsre' :" + apsre.ToString(), className, methodName);
        
        string pass = Convert.ToBase64String(Encoding.UTF8.GetBytes("hwa-guan6630"));
        string afSendDyncSMSBack = string.Empty;
        
        AllPower.fpMsService af = new AllPower.fpMsService();
        //將簡訊內容傳送到詮力
        //afSendDyncSMSBack = af.SendDyncSMS(apsre.M_TEL, apsre.M_Text, "hwa-guan", pass, "", "", "", true);
        afSendDyncSMSBack = af.SendDyncSMS(apsre.M_TEL, apsre.originalM_Text, "hwa-guan", pass, "", "", "", true);
        apsre.M_SEQ = allPowerSendDyncSMSXmlReader(afSendDyncSMSBack, "SEQ");
        apsre.M_TStatus = allPowerSendDyncSMSXmlReader(afSendDyncSMSBack, "ERR");
        //查詢簡訊的寄送狀況
        string afQuerySMSBack = af.QuerySMS("hwa-guan", pass, apsre.M_SEQ);
        //xml格式讀取查詢簡訊的回傳直
        apsre.M_SStatus = common.allPowerXmlReader(afQuerySMSBack, "RES");
        
        //新增詮力傳送狀況資料庫
        string backStr = MSGRPhgDao.Instance.sendSingleMessage(apsre);//<==========*/
        //log.debug2("apsre.M_TEL="+ apsre.M_TEL+ "&apsre.smdType=" + apsre.smdType + "&apsre.M_MP=" + apsre.M_MP + "&apsre.M_MITem=" + apsre.M_MITem + "&apsre.M_SEQ=" + apsre.M_SEQ + "&apsre.M_TStatus=" + apsre.M_TStatus + "&apsre.M_SStatus=" + apsre.M_SStatus + "&apsre.M_Text=" + apsre.M_Text + "&apsre.add_user=" + apsre.add_user + "&apsre.add_date=" + apsre.add_date + "&apsre.add_ip=" + apsre.add_ip + "&apsre.M_Name=" + apsre.M_Name + "&apsre.M_MITemName=" + apsre.M_MITemName + "&apsre.M_MITemTotal=" + apsre.M_MITemTotal + "&apsre.M_MPname=" + apsre.M_MPname + "&apsre.M_MPcom=" + apsre.M_MPcom + "&apsre.add_userName=" + apsre.add_userName + "&apsre.M_TStatusName=" + apsre.M_TStatusName + "&apsre.getMessageStatus=" + apsre.getMessageStatus + "&apsre.getMessageStatusName=" + apsre.getMessageStatusName, "","");
        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public string sendMultipleMessage(allPowerSendRecordEntity apsre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'apsre' :" + apsre.ToString(), className, methodName);

        
        List<string> strList = new List<string>();
        bool hasWordTF = cString.hasWord(apsre.M_MITem,",");
        if (hasWordTF)
        {
            string[] M_MITemArr = apsre.M_MITem.Split(',');
            for (var i = 0; i < M_MITemArr.Length; i++)
            {

                strList.Add(M_MITemArr[i]);
            }
        }
        else
        {
            strList.Add(apsre.M_MITem);
        }
        string MP = apsre.M_MP;

        string backStr = string.Empty;
        for (var i = 0; i < strList.Count; i++)
        {
            apsre.M_MITem = strList[i];
            //1.抓分析師資料
            mcDataEntity mde = MUSERhgDao.Instance.getMCdata(MP);
            apsre.M_MPname = mde.U_Name;
            apsre.M_MPcom = mde.ComID;
            
            //2.抓產品
            List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList(apsre.M_MP);
            for (var j = 0; j < ddeList.Count; j++)
            {
                if (strList[i] == ddeList[j].ditcode)
                {
                    apsre.M_MITemName = ddeList[j].ddesc;
                }
            }
            //3.
            List<callMassageEntity> cmeList = MMSGEhgDao.Instance.getMitemCount(MP, strList[i]);//<==========
            apsre.M_MITemTotal = (cmeList.Count + 1).ToString();

            //4.一般簡訊發訊(不另外發特別、解盤、專案、飆股)
            
            sendMessage(apsre,"normal");
            switch (apsre.M_MITem)
            {
                case "0002":
                    if (apsre.M_MP == "D0509211") //'劉設專案(冠軍)
                    {
                        sendMessage(apsre, "D0509211champion");
                    }
                    break;
                case "0003": //設(特別)
                    sendMessage(apsre, "special");
                    break;
                case "0004": //解盤
                    sendMessage(apsre, "solution");
                    break;
                case "0005": //設(飆股)
                    switch (apsre.M_MP)
                    {
                        case "D9907161"://'何丞唐-飆股'
                            sendMessage(apsre, "fastStock");
                            break;
                        case "D9406012"://'陳武傑-飆股'
                            sendMessage(apsre, "fastStock");
                            break;
                        case "D0508161"://'黃睿緯-飆股'
                            sendMessage(apsre, "fastStock");
                            break;
                        case "D0601031"://'林幸蓉-飆股'
                            sendMessage(apsre, "fastStock");
                            break;
                        case "D0301062"://'林幸蓉-飆股'
                            sendMessage(apsre, "fastStock");
                            break;
                        case "D0302051"://'藍登耀-飆股'
                            sendMessage(apsre, "fastStock");
                            break;
                    }
                    
                    break;
                case "0008": //設(飆股)
                    if (apsre.M_MP == "D0110011") //'林驛銘-飆股'
                    {
                        sendMessage(apsre, "fastStock");
                    }
                    break;
                case "0011": //設(飆股)
                    if (apsre.M_MP == "D0312152") //'王曈-飆股=儲備'
                    {
                        sendMessage(apsre, "fastStock");
                    }
                    break;
            }
            //5.發送特別發送人員簡訊
            
            sendMessage(apsre, "specailPeople");
            
            //6.'新增簡訊到訊息資料庫
           MMSGEhgDao.Instance.addMessageData(apsre);

            //7.發訊給相關單位，通知有新的Call訊
           backStr = sendMessageToConcernedDepartment(apsre);
        }

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
    public string getMitemCount(string MP, string MP_Item)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MP' :" + MP + "'MP_Item' :" + MP_Item, className, methodName);

        List<callMassageEntity> cmeList = MMSGEhgDao.Instance.getMitemCount(MP, MP_Item);//<==========
        string backCount = cmeList.Count.ToString();

        log.endWrite("'backCount' :" + backCount, className, methodName);
        return backCount;
    }

    private string allPowerSendDyncSMSXmlReader(string xmlStr, string readType)
    {
        string backStr = string.Empty;
        XmlDocument xml = new XmlDocument();
        xml.LoadXml(xmlStr);
        string RES = string.Empty;
        string Err = string.Empty;
        XmlNodeList NodeList = xml.SelectNodes("Result");
        foreach (XmlNode nodeData in NodeList)
        {
            RES = nodeData.SelectSingleNode("SEQ").InnerText;
            Err = nodeData.SelectSingleNode("ERR").InnerText;
        }
        if (readType == "SEQ")
        {
            backStr = RES;
        }
        else
        {
            backStr = Err;
        }
        return backStr;
    }

   

    //一般簡訊發訊(不另外發特別、解盤、專案、飆股),批次發訊種類
    private void sendMessage(allPowerSendRecordEntity apsre,string messageType)
    {
        string backStr = string.Empty;
       
        bool substringNameTF = true;
        List<string> strList = null;
        
        //1.根據發訊類別 撈取客戶手機電話
        switch (messageType)
        {
            case "normal":
                strList = MTRATjoinMMBERhgDao.Instance.getMTEl1ListForNormalMessage(apsre.M_MP, apsre.M_MITem);
                break;
            case "solution":
                strList = MTRATjoinMMBERhgDao.Instance.getMTEl1ListForSolutionMessage(apsre.M_MP);
                break;
            case "special":
                strList = MTRATjoinMMBERhgDao.Instance.getMTEl1ListForSpecialMessage(apsre.M_MP);
                break;
            case "fastStock":
                strList = MTRATjoinMMBERhgDao.Instance.getMTEl1ListForFastStockMessage(apsre.M_MP);
                if (apsre.M_MP != "D9907161")
                {
                    substringNameTF = false;
                }
                break;
            case "D0509211champion":
                strList = MTRATjoinMMBERhgDao.Instance.getMTEl1ListForD0509211championMessage(apsre.M_MP);
                break;
            case "specailPeople":
                strList = MTRATjoinMMBERhgDao.Instance.getMTEl1ListForSpecailPeopleMessage(apsre.M_MP,apsre.M_MITem);
                break;
        }

        //2.處理簡訊內容並寄送簡訊
        string tempMtext = string.Empty;
        string originalM_Text = apsre.originalM_Text;
        string dateTimeStr = cDateTime.getNowDateTimeForMsgtext();
        for (var i = 0; i < strList.Count; i++)
        {
          
            apsre.M_TEL = strList[i];
            //2-1處理簡訊內容
            if (substringNameTF)
            {
                if (apsre.M_MP == "D9406011")//'林驛銘的名字抓第三碼
                {
                    tempMtext = apsre.M_MPname.Substring(2, 1) + apsre.M_MITemName.Substring(0, 1) + apsre.M_MITemTotal+":" + originalM_Text+ dateTimeStr;
                }
                else if (apsre.M_MP == "D0601031")//'林幸蓉的名字抓第二碼「幸」
                {
                    tempMtext = apsre.M_MPname.Substring(1, 1) + apsre.M_MITemName.Substring(0, 1) + apsre.M_MITemTotal + ":" + originalM_Text+ dateTimeStr;
                }
                else
                {
                    tempMtext = apsre.M_MPname.Substring(0, 1) + apsre.M_MITemName.Substring(0, 1) + apsre.M_MITemTotal + ":" + originalM_Text+ dateTimeStr;
                }
               
            }
            else
            {
                tempMtext = apsre.M_MPname.Substring(2, 1) + apsre.M_MITemName.Substring(0, 1) + apsre.M_MITemTotal + ":" + originalM_Text+ dateTimeStr;
            }
            apsre.M_Text = tempMtext;

            //2-2寄送簡訊
            sendSingleMessage(apsre);//<==================================寄送簡訊
        }
    }

    //'發訊給相關單位，通知有新的Call訊
    private string sendMessageToConcernedDepartment(allPowerSendRecordEntity apsre)
    {
        //1.撈取相關人員員編
        List<string> PeopleList =  MUSERhgDao.Instance.getConcernedPeople(apsre.M_MPcom);//<==========
        string peopleStr = string.Empty;
        for (var i = 0; i < PeopleList.Count; i++)
        {
            if (i != 0)
            {
                peopleStr += "," ;
                peopleStr += PeopleList[i];
            }
            else
            {
                peopleStr = PeopleList[i];
            }
        }
        //2.通知相關單位人員
        addMINFOdataEntity amde = new addMINFOdataEntity();
        amde.MI_Item = "Call訊";
        amde.MI_Title = "「" + apsre.M_MPname + "-" + apsre.M_MITemName + "」Cell訊";
        amde.MI_Note = apsre.M_Text;
        amde.MI_People = peopleStr;
        amde.add_user = apsre.add_user;
        amde.add_ip = apsre.add_ip;

        string backStr = MINFOhgDao.Instance.addData(amde);//<============
        return backStr;
    }



}