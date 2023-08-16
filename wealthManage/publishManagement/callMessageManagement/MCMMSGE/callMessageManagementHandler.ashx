<%@ WebHandler Language="C#" Class="callMessageManagementHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;
using System.IO;
using System.Xml;


public class callMessageManagementHandler : IHttpHandler {
    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string msg_id = string.Empty;
        string MP = string.Empty;
        getMessageListParam gmlp = null;
        switch (action)
        {
            case"getMessageList":
                gmlp = new getMessageListParam();
                gmlp.MP = context.Request["MP"];
                gmlp.MP_Item = context.Request["MP_Item"];
                gmlp.StartDate = context.Request["StartDate"];
                gmlp.EndDate = context.Request["EndDate"];
                gmlp.keyWord = context.Request["keyWord"];
                gmlp.U_MDEP = context.Request["U_MDEP"];
                gmlp.U_POSITION = context.Request["U_POSITION"];
                gmlp.ComID = context.Request["ComID"];
                gmlp.U_Leader = context.Request["U_Leader"];
                gmlp.U_Num = context.Request["U_Num"];
                context.Response.Write(getMessageList(gmlp));
                break;
            case"getAllPowerSendRecord":
                gmlp = new getMessageListParam();
                gmlp.MP = context.Request["MP"];
                gmlp.MP_Item = context.Request["MP_Item"];
                gmlp.StartDate = context.Request["StartDate"];
                gmlp.EndDate = context.Request["EndDate"];
                gmlp.keyWord = context.Request["keyWord"];
                gmlp.U_MDEP = context.Request["U_MDEP"];
                gmlp.U_POSITION = context.Request["U_POSITION"];
                gmlp.ComID = context.Request["ComID"];
                gmlp.U_Leader = context.Request["U_Leader"];
                gmlp.U_Num = context.Request["U_Num"];
                context.Response.Write(getAllPowerSendRecord(gmlp));
                break;
            case"editMessageData":
                msg_id = context.Request["msg_id"];
                string msg_text = context.Request["msg_text"];
                string MS_TStatus = context.Request["MS_TStatus"];
                context.Response.Write(editMessageData(msg_id,msg_text,MS_TStatus));
                break;
            case"deleteMessageData":
                msg_id = context.Request["msg_id"];
                context.Response.Write(deleteMessageData(msg_id));
                break;
            case"getCallMessageDealData":
                MP = context.Request["MP"];
                string searchDate = context.Request["searchDate"];
                string U_MDEP = context.Request["U_MDEP"];
                string ComID = context.Request["ComID"];
                context.Response.Write(getCallMessageDealData(MP,searchDate,U_MDEP,ComID));
                break;
            case"getPublicMessage":
                context.Response.Write(getPublicMessage());
                break;
            case"mdAddDeleteEdit":
                string auto_id = context.Request["auto_id"];
                string Msg_Context = context.Request["Msg_Context"];
                string dataAction = context.Request["dataAction"];
                string actionUser = context.Request["actionUser"];
                context.Response.Write(mdAddDeleteEdit(auto_id,Msg_Context,dataAction,actionUser));
                break;
            case"getAnalystMessage":
                MP = context.Request["MP"];
                context.Response.Write(getAnalystMessage(MP));
                break;
            case"getMessageStatus":
                string seq = context.Request["seq"];
                context.Response.Write(getMessageStatus(seq));
                break;
            case"sendMessage":
                allPowerSendRecordEntity apsre = new allPowerSendRecordEntity();
                apsre.smdType = context.Request["smdType"];
                apsre.M_MP = context.Request["M_MP"];
                apsre.M_TEL = context.Request["M_TEL"];
                apsre.originalM_Text = context.Request["M_Text"];
                apsre.M_MITem = context.Request["M_MITem"];
                apsre.add_user = context.Request["add_user"];
                apsre.add_ip = context.Request["add_ip"];
                apsre.M_Name = context.Request["messageCount"];
                //log.debug2("apsre.smdType="+apsre.smdType+"&apsre.M_MP="+apsre.M_MP+"&apsre.M_TEL="+apsre.M_TEL+"&apsre.M_Text="+apsre.M_Text+"&apsre.M_MITem="+apsre.M_MITem+"&apsre.add_user="+apsre.add_user+"&apsre.add_ip="+apsre.add_ip+"&apsre.M_Name="+apsre.M_Name,"","");
                context.Response.Write(sendMessage(apsre));
                break;
            case"getMitemCount":
                MP = context.Request["MP"];
                string MP_Item = context.Request["MP_Item"];
                context.Response.Write(getMitemCount(MP,MP_Item));
                break;
        }
    }
    public string getMessageList(getMessageListParam gmlp)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MP' :"+gmlp.MP+"'MP_Item' :"+gmlp.MP_Item+"'StartDate' :"+gmlp.StartDate+"'EndDate' :"+gmlp.EndDate+"'keyWord' :"+gmlp.keyWord+ "'U_MDEP':" +gmlp.U_MDEP + "'U_POSITION':" + gmlp.U_POSITION+ "'ComID':" + gmlp.ComID+ "'U_Leader':" + gmlp.U_Leader+ "'U_Num':" + gmlp.U_Num, className, methodName);

        List<callMassageEntity> cmeList = callMessageManagementService.Instance.getMessageList(gmlp);//<==========

        log.endWrite("'cmeList' :"+cmeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cmeList);

    }

    public string getCallMessageDealData(string MP,string searchDate,string U_MDEP,string ComID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MP' :"+MP+"'searchDate' :"+searchDate+"'U_MDEP' :"+U_MDEP+"'ComID' :"+ComID, className, methodName);

        List<List<callMassageEntity>> cmeList = callMessageManagementService.Instance.getCallMessageDealData(MP,searchDate,U_MDEP,ComID);//<==========

        log.endWrite("'cmeList' :"+cmeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cmeList);

    }

    public string getAllPowerSendRecord(getMessageListParam gmlp)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MP' :"+gmlp.MP+"'MP_Item' :"+gmlp.MP_Item+"'StartDate' :"+gmlp.StartDate+"'EndDate' :"+gmlp.EndDate+"'keyWord' :"+gmlp.keyWord+ "'U_MDEP':" +gmlp.U_MDEP + "'U_POSITION':" + gmlp.U_POSITION+ "'ComID':" + gmlp.ComID+ "'U_Leader':" + gmlp.U_Leader+ "'U_Num':" + gmlp.U_Num, className, methodName);

        List<allPowerSendRecordEntity> apsreList = callMessageManagementService.Instance.getAllPowerSendRecord(gmlp);//<==========

        log.endWrite("'apsreList' :"+apsreList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(apsreList);

    }
    public string editMessageData(string msg_id,string msg_text,string MS_TStatus)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'msg_id' :"+msg_id+"'msg_text' :"+msg_text+"'MS_TStatus' :"+MS_TStatus, className, methodName);

        string backStr = callMessageManagementService.Instance.editMessageData( msg_id, msg_text, MS_TStatus);//<==========

        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;

    }

    public string deleteMessageData(string msg_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'msg_id' :"+msg_id, className, methodName);

        string backStr = callMessageManagementService.Instance.deleteMessageData(msg_id);//<==========

        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;

    }

    public string mdAddDeleteEdit(string auto_id,string Msg_Context,string dataAction,string actionUser)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'auto_id' :"+auto_id+"'Msg_Context' :"+Msg_Context+"'dataAction' :"+dataAction+"'actionUser' :"+actionUser, className, methodName);

        string backStr = callMessageManagementService.Instance.mdAddDeleteEdit(auto_id, Msg_Context, dataAction,actionUser);//<==========

        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;
    }


    public string getPublicMessage()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite(common.nothing, className, methodName);

        List<publicMessageEntity> pmeList = callMessageManagementService.Instance.getPublicMessage();//<==========

        log.endWrite("'pmeList' :"+pmeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(pmeList);
    }

    public string getAnalystMessage(string MP)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MP' :"+MP, className, methodName);

        List<callMassageEntity> cmeList = callMessageManagementService.Instance.getAnalystMessage(MP);//<==========

        log.endWrite("'cmeList' :"+cmeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(cmeList);
    }

    public string sendMessage(allPowerSendRecordEntity apsre)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'apsre' :"+apsre.ToString(), className, methodName);

        string backStr = string.Empty;
        if (apsre.smdType == "single")
        {
            backStr = callMessageManagementService.Instance.sendSingleMessage(apsre);//<==========
        }
        else
        {
            backStr = callMessageManagementService.Instance.sendMultipleMessage(apsre);//<==========
        }
        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;
    }

    public string getMessageStatus(string seq)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'seq' :"+seq, className, methodName);

        string pass = Convert.ToBase64String(Encoding.UTF8.GetBytes("hwa-guan6630"));
        string afBack = string.Empty;
        AllPower.fpMsService af = new AllPower.fpMsService();
        afBack = af.QuerySMS("hwa-guan", pass,seq);
        afBack = common.allPowerXmlReader(afBack, "RES");
        List<ditcodedescEntity> MSRNOddeList = MITEMhgDao.Instance.getditcodedescEntityList("MSRNO");
        for (var r = 0; r < MSRNOddeList.Count; r++)
        {
            if (afBack != "OK")
            {
                if (common.isEmpty(afBack))
                {
                    afBack = "確認中";
                }
                else
                {
                    if (afBack == MSRNOddeList[r].ditcode)
                    {
                        afBack = "<font color=red>" + MSRNOddeList[r].ddesc + "</font>";
                    }
                }
            }
            else
            {
                if (afBack == MSRNOddeList[r].ditcode)
                {
                    afBack = MSRNOddeList[r].ddesc;
                }
            }
        }
        log.endWrite("'afBack' :"+afBack, className, methodName);
        return afBack;
    }

    public string getMitemCount(string MP,string MP_Item)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MP' :"+MP+"'MP_Item' :"+MP_Item, className, methodName);

        string backStr = callMessageManagementService.Instance.getMitemCount(MP, MP_Item);//<==========

        log.endWrite("'backStr' :"+backStr, className, methodName);
        return backStr;
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}