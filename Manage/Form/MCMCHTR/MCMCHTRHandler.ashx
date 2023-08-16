<%@ WebHandler Language="C#" Class="MCMCHTRHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;

public class MCMCHTRHandler : IHttpHandler
{

    //此類別名稱G
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        //string MS_ID = string.Empty;
        string Q_Member = context.Request["Q_Member"];//客戶範圍
        string Q_MC = context.Request["Q_MC"];//責任助理
        string I_MC = context.Request["I_MC"];//要轉入的責任助理
        string MID = context.Request["MID"];//MMBER中的PK值
        string MS_ID = "";
        switch (action)
        {   //新增轉換紀錄至MCHAG
            //MID
            //var CaseTransferRecord = "MID=" + checkbox_MID + "&Q_MC=" + Q_MC_2 + "&I_MC=" + I_MC + "&action=CaseTransferRecord";;//新增案件轉換紀錄
            //var Q_MC_2 = $("#Q_MC").val();//責任助理員工編號
            //var I_MC = $("#I_MC").val();//轉入責任助理員工編號
            case "CaseTransferRecord":
                string EditU_Num = context.Request["EditU_Num"];//目前操作者的員工編號
                context.Response.Write(CaseTransferRecord(MID,Q_MC, I_MC,EditU_Num));//getMCMCHTRData
                break;
            //searchMCMCHTRData
            ////取得案件轉檔維護資料
            case "searchMCMCHTRData":
                //string Q_MC = context.Request["Q_MC"];//責任助理
                //string Q_Member = context.Request["Q_Member"];//客戶範圍
                context.Response.Write(getMCMCHTRData(Q_MC, Q_Member));//getMCMCHTRData
                break;
            case "CaseTransfer"://案件轉檔

                context.Response.Write(CaseTransfer(MID, Q_MC, I_MC));//getMCMCHTRData
                break;
            case "assignCase"://派發案件
                context.Response.Write(assignCase());
                break;
            case "getMCMRYGCData":
                string U_Num = context.Request["U_Num"];
                string keyWord = context.Request["keyWord"];
                context.Response.Write(getMCMRYGCData(U_Num, keyWord));
                break;
            case "deleteMCMRYGCData":
                MS_ID = context.Request["MS_ID"];
                //context.Response.Write(deleteMailData(MS_ID));
                break;
            case "addMCMRYGCData":
                //emailEntity ee = new emailEntity();
                //common.getDateTime();
                //ee.MS_ID = common.year + common.month + common.day + common.hour + common.minute + common.second + "_" + common.getRandom1();
                //ee.MS_Sender = context.Request["MS_Sender"];
                //ee.MS_Receiver = context.Request["MS_Receiver"];
                //ee.MS_Title = context.Request["MS_Title"];
                //ee.MS_Text = context.Request["MS_Text"];
                //ee.add_User = context.Request["add_User"];
                //ee.add_ip = context.Request["add_ip"];

                //context.Response.Write(addMailData(ee));
                break;
            //case "getMCMRYGCData":
            //    MS_ID = context.Request["MS_ID"];
            //    context.Response.Write(getUpLoadData(MS_ID));
            //    break;
            case "updateReadtag":
                MS_ID = context.Request["MS_ID"];
                context.Response.Write(updateReadtag(MS_ID));
                break;
            case "getMCMRYGCDetail":
                MS_ID = context.Request["MS_ID"];
                //context.Response.Write(getMailDetail(MS_ID));
                break;
            case "getZitemListFuc":
                MS_ID = context.Request["MS_ID"];
                break;

                //case "getMCMRYGCData"://取得員工資料
                //    MS_ID = context.Request["MS_ID"];
                //    context.Response.Write(getMUSERData(MS_ID));
                //    break;
                //getMSFTFData
                //case "getMCMRYGCData":// 專案客戶管理 >個股管理作業
                //    MS_ID = context.Request["MS_ID"];
                //    context.Response.Write(getMSFTFData(MS_ID));
                //    break;

        }

    }



    //public string getMUSERData(string U_Num, string keyWord)
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    log.startWrite("'U_Num;':" + U_Num + "'keyWord;':" + keyWord, className, methodName);

    //    List<muserEntity> eeList = muserService.Instance.getMUSERData(U_Num, keyWord);//<==========

    //    log.endWrite("'eeList' :" + eeList.ToString(), className, methodName);
    //    return Newtonsoft.Json.JsonConvert.SerializeObject(eeList);
    //}
    //
    // string Q_MC = context.Request["Q_MC"];//責任助理
    // string I_MC = context.Request["I_MC"];//要轉入的責任助理
    //新增轉換紀錄至MCHAG
    public string CaseTransferRecord(string MID,string Q_MC,string I_MC,string EditU_Num)
    {
            string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MID':" + MID + "'Q_MC:" + Q_MC + "'I_MC:" + I_MC, className, methodName);
        return "";
    }



    public string CaseTransfer(string MID, string Q_MC, string I_MC)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MID':" + MID + "'Q_MC:" + Q_MC + "'I_MC:" + I_MC, className, methodName);
        //取得要轉入的責任助理的姓名
        //string I_MC_Name = GetI_MC_NameByI_MC(I_MC);
        //取得要轉入的責任助理的公司
        //string I_MC_Com = GetI_MC_ComByI_MC(I_MC);
        //select Light_status,M_Num,N_Call_tag,M_Name,MC_Name,MTel1,MTel2,OTel,OTel1,HTel,HTel1,add_date from MMBER where del_tag = '0' and N_call_tag='0'
        //and  MC_Name like '王彥琦'
        //   List<emailEntity> eeList = mailService.Instance.getMailData(Q_MC, Q_Member);//<==========
        List<MCMCHTREntity> muserList = muserService.Instance.CaseTransfer(MID, Q_MC, I_MC);////取得案件轉檔維護資料
                                                                                            //log.endWrite("'eeList' :" + eeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(muserList);
    }

    public string GetI_MC_NameByI_MC(string I_MC)
    {
        return "";
    }

    public string GetI_MC_ComByI_MC(string I_MC)
    {
        return "";
    }
    //20221006work
    //取得案件轉檔維護資料
    //Q_MC:責任助理 Q_Member:客戶範圍(0:非會員 1:會員)
    public string getMCMCHTRData(string Q_MC, string Q_Member)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'Q_MC;':" + Q_MC + "'Q_Member;':" + Q_Member, className, methodName);
        //select Light_status,M_Num,N_Call_tag,M_Name,MC_Name,MTel1,MTel2,OTel,OTel1,HTel,HTel1,add_date from MMBER where del_tag = '0' and N_call_tag='0'
        //and  MC_Name like '王彥琦'
        //   List<emailEntity> eeList = mailService.Instance.getMailData(Q_MC, Q_Member);//<==========
        List<MCMCHTREntity> muserList = muserService.Instance.getMCMCHTRData(Q_MC, Q_Member);////取得案件轉檔維護資料
                                                                                             //log.endWrite("'eeList' :" + eeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(muserList);
    }


    public string getMCMRYGCData(string U_Num, string keyWord)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num;':" + U_Num + "'keyWord;':" + keyWord, className, methodName);

        List<emailEntity> eeList = mailService.Instance.getMailData(U_Num, keyWord);//<==========

        log.endWrite("'eeList' :" + eeList.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(eeList);
    }

    public string deleteMCMRYGCData(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        String backStr = mailService.Instance.deleteMailData(MS_ID);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public string addMCMRYGCData(emailEntity ee)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + ee.MS_ID + "'MS_Sender':" + ee.MS_Sender + "'MS_Receiver':" + ee.MS_Receiver + "'MS_Title':" + ee.MS_Title + "'MS_Text':" + ee.MS_Text + "'add_User':" + ee.add_User + "'add_ip':" + ee.add_ip, className, methodName);

        String backStr = mailService.Instance.addMailData(ee);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public string getUpLoadData(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        uploadFileEntity ufe = mailService.Instance.getUpLoadData(MS_ID);//<==========

        log.endWrite("'ufe' :" + ufe.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ufe);
    }

    public string updateReadtag(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        string backStr = mailService.Instance.updateReadtag(MS_ID);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }

    public string getMCMRYGCDataDetail(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);

        emailEntity ee = mailService.Instance.getMailDetail(MS_ID);//<==========

        log.endWrite("'ee' :" + ee.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ee);
    }
    //派發案件
    //20220708進度
    public string assignCase()
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'MS_ID':" + , className, methodName);
        string keyword = "";
        List<indexBDdataEntity> assignCase = MCMRYGCService.Instance.assignCase();
        //List<muserEntity> muser = muserService.Instance.getMUSERData(MS_ID, keyword);//<==========
        //log.endWrite("'eeList' :" + muser.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(assignCase);

    }
    //由前端呼叫
    //public string getMCMRYGCData(string MS_ID)
    //{
    //    string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
    //    log.startWrite("'MS_ID':"+MS_ID, className, methodName);
    //    string keyword = "";
    //    List<msftfEntity> msftf = msftfService.Instance.getmsftfListData(MS_ID,keyword);//<==========
    //    log.endWrite("'eeList' :"+msftf.ToString(), className, methodName);
    //    return Newtonsoft.Json.JsonConvert.SerializeObject(msftf);

    //}

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}