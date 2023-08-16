    <%@ WebHandler Language="C#" Class="noticeBoardHandler" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;
using System.Data.SqlClient;



public class noticeBoardHandler : IHttpHandler
{
    //此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string action = context.Request["action"];
        string adver_depart_id = context.Request["adver_depart_id"];//發布部門代號
        string keyWord = context.Request["keyWord"];//關鍵字(標題)
        string MS_ID = context.Request["MS_ID"];
        string ComID = context.Request["ComID"];
        string id = string.Empty;
        string File_num = string.Empty;
        switch (action)
        //getnoticeBoardData
        {       //getnoticeBoardData
                //取得公佈欄資料列表
            case "getnoticeBoardData":
                //var data = "U_Num=" + U_Num_M + "&adver_depart_id=" + adver_depart_id + "&keyWord=" + keyword + "&action=getnoticeBoardData";
                string U_MDEP = context.Request["U_MDEP"];
                string U_POSITION = context.Request["U_POSITION"];
                //string keyWord = context.Request["keyWord"];
                //adver_depart_id = context.Request["adver_depart_id"];
                context.Response.Write(getNoticeBoard(U_MDEP, U_POSITION, keyWord, adver_depart_id));
                break;
            //按下新增公佈欄確定後addnoticeBoardData
            case "addnoticeBoardData":

                addNoticeDetail and = new addNoticeDetail();
                common.getDateTime();
                and.adver_id = common.year + common.month + common.day + common.hour + common.minute + common.second + "_" + common.getRandom1();
                and.adver_item = context.Request["adver_item"];//公布屬性
                and.adver_dep = context.Request["adver_dep"];////發布對象
                and.adver_content = context.Request["adver_content"];//內文
                and.adver_subject = context.Request["adver_subject"];//標題
                                                                     //and.adver_Com = context.Request["ComID_M"];//公司
                and.adver_depart_id = context.Request["adver_depart_id"];//使用者部門代號
                and.add_user = context.Request["U_Num"];//使用者員工編號
                and.add_ip = common.GetIP4Address();//發布者IP位址
                and.add_date = common.year + common.month + common.day + common.hour + common.minute + common.second;//發布時間

                context.Response.Write(addnoticeBoardData(and));
                break;
            case "getBoardDataDetail"://取得上傳檔案明細
                File_num = context.Request["File_num"];
                context.Response.Write(getBoardDataDetail(File_num));
                break;
            //取得詳細資料(附件1)
            case "getUpLoadData1"://取得上傳檔案明細//取得詳細資料(附件1)
                File_num = context.Request["File_num"];
                context.Response.Write(getUpLoadData1(File_num));
                break;
            //取得詳細資料(附件2)
            case "getUpLoadData2"://取得上傳檔案明細
                File_num = context.Request["File_num"];
                context.Response.Write(getUpLoadData2(File_num));
                break;
            //取得詳細資料(附件3)
            case "getUpLoadData3"://取得上傳檔案明細
                File_num = context.Request["File_num"];
                context.Response.Write(getUpLoadData3(File_num));
                break;
            case "deletenoticeBoardData":

                addNoticeDetail and2 = new addNoticeDetail();
                common.getDateTime();
                and2.adver_id = common.year + common.month + common.day + common.hour + common.minute + common.second + "_" + common.getRandom1();
                string adver_id = context.Request["adver_id"];
                //and2.adver_dep = context.Request["adver_dep"];
                //and2.adver_subject = context.Request["adver_subject"];
                //and2.File1 = context.Request["File1"];
                //and2.File2 = context.Request["File2"];
                //and2.File3 = context.Request["File3"];
                //and.adver_Com = context.Request["adver_Com"];
                //and.add_ip = context.Request["add_ip"];
                context.Response.Write(deleteNoticeDetail(adver_id));
                break;

            case "deleteData":
                id = context.Request["id"];
                context.Response.Write(deleteData(id));
                break;

            case "getSinglenoticeBoardDetail":
                id = context.Request["id"];
                context.Response.Write(deleteData(id));
                break;


        }

    }

    public string deleteData(string id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'id' :" + id, className, methodName);

        string backStr = MBULThgDao.Instance.deleteData(id);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
    //取得資料,搜尋資料
    public string getNoticeBoard(string U_MDEP, string U_POSITION, string keyWord, string adver_depart_id)
    {
        string advar_dep_name = "";//發佈對象
        string adver_depart_name = "";//發佈對象
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_MDEP':" + U_MDEP + "'U_POSITION':" + U_POSITION + "'keyWord':" + keyWord + "'adver_depart_id':" + adver_depart_id, className, methodName);
        List<noticeBoardEntity> nbeList = noticeBoardService.Instance.getNoticeBoard(U_MDEP, U_POSITION, string.Empty, adver_depart_id, keyWord);
       
        log.endWrite("'nbeList' : " + nbeList.ToString(), className, methodName);
        //發布單位
        SqlConnection con = new SqlConnection();


        advar_dep_name =    Getadver_depart_nameByID(adver_depart_id);
        adver_depart_name = Getadver_depart_nameByID(adver_depart_id);//由部門代號取得部門名稱(adver_depart_name)
        return Newtonsoft.Json.JsonConvert.SerializeObject(nbeList);
    }
    //取得詳細資料
    public string getBoardDataDetail(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);
        MBULTDetailEntity ufe = noticeBoardService.Instance.getBoardDataDetail(MS_ID);//<==========
        log.endWrite("'ufe' :" + ufe.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ufe);
    }
    //取得詳細資料(附件1)
    public string getUpLoadData1(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);
        MBULTDetailEntity ufe = noticeBoardService.Instance.getUpLoadData1(MS_ID);//<==========
        log.endWrite("'ufe' :" + ufe.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ufe);
    }
    //取得詳細資料(附件2)
    public string getUpLoadData2(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);
        MBULTDetailEntity ufe = noticeBoardService.Instance.getUpLoadData2(MS_ID);//<==========
        log.endWrite("'ufe' :" + ufe.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ufe);
    }
    //取得詳細資料(附件3)
    public string getUpLoadData3(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'MS_ID':" + MS_ID, className, methodName);
        MBULTDetailEntity ufe = noticeBoardService.Instance.getUpLoadData3(MS_ID);//<==========
        log.endWrite("'ufe' :" + ufe.ToString(), className, methodName);
        return Newtonsoft.Json.JsonConvert.SerializeObject(ufe);
    }
    //取得發布單位
    public string Getadver_depart_nameByID(string adver_depart_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'adver_item':"+and.adver_item+"'adver_depart_id':"+and.adver_depart_id+"'adver_subject':"+and.adver_subject+"'adver_content':"+and.adver_content+"'adver_depart_id':"+and.adver_depart_id+"'adver_employ_id':"+and.adver_employ_id+"'adver_Com':"+and.adver_Com+"'add_ip':"+and.add_ip, className, methodName);
        string backStr = noticeBoardService.Instance.getadver_depart_nameByID(adver_depart_id);
        log.endWrite("'backStr' : " + backStr, className, methodName);
        string depart_name = backStr;
        return depart_name;
    }
    /// <summary>
    /// 新增布告欄細項資料
    /// </summary>
    public string addnoticeBoardData(addNoticeDetail and)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'adver_item':" + and.adver_item + "'adver_depart_id':" + and.adver_depart_id + "'adver_subject':" + and.adver_subject + "'adver_content':" + and.adver_content + "'adver_depart_id':" + and.adver_depart_id + "'adver_employ_id':" + and.adver_employ_id + "'adver_Com':" + and.adver_Com + "'add_ip':" + and.add_ip, className, methodName);
        string backStr = noticeBoardService.Instance.addNoticeDetail(and);
        log.endWrite("'backStr' : " + backStr, className, methodName);
        return backStr;
    }

    /// <summary>
    /// 刪除布告欄細項資料
    /// </summary>
    public string deleteNoticeDetail(string adver_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //log.startWrite("'adver_item':" + and.adver_item + "'adver_depart_id':" + and.adver_depart_id + "'adver_subject':" + and.adver_subject + "'adver_content':" + and.adver_content + "'adver_depart_id':" + and.adver_depart_id + "'adver_employ_id':" + and.adver_employ_id + "'adver_Com':" + and.adver_Com + "'add_ip':" + and.add_ip, className, methodName);
        string backStr = noticeBoardService.Instance.deleteNoticeDetail(adver_id);
        log.endWrite("'backStr' : " + backStr, className, methodName);
        return backStr;
    }



    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}