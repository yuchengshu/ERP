using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// noticeBoardDao 的摘要描述
/// </summary>
public class UploadFilehgDao
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static UploadFilehgDao _instance = new UploadFilehgDao();
    public static UploadFilehgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public UploadFilehgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    /// <summary>
    /// 製作getUploadFile執行sql時需要的連線字串、執行命令字串
    /// </summary>
    /// <param name="U_Num"></param>
    /// <returns></returns>
    public List<uploadFileEntity> getUploadFile(string dataBase,string StartDate, string EndDate)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("dataBase : "+ dataBase+ "StartDate : " + StartDate + "EndDate : " + EndDate, className, methodName);

        string sql_txt = string.Empty;
        if (!common.isEmpty(StartDate) && !common.isEmpty(EndDate))
        {
            sql_txt = " and(add_date >= '" + StartDate + "') AND(add_date<= DATEADD(d, 1, '" + EndDate + "'))";
        }

        string commandText = "select * from Upload_File where File_Folder = '{0}' and  del_tag = '0'"+ sql_txt+"order by add_date desc";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, dataBase));
        List<uploadFileEntity> ufeList = UploadFilehgSql.Instance.getUploadFile(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite(ufeList.ToString(), className, methodName);
        return ufeList;
    }
    //取得公佈欄詳細資料(標題_發佈時間_發佈人員([[U_Num-COMID-DEPAR])_附件_內文)(含附件1)
    public MBULTDetailEntity getBoardDataDetail(string adver_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("adver_id : " + adver_id, className, methodName);
        string commandText = "select * from MBULT where adver_id ='"+ adver_id + "' and  del_tag = '0' order by add_date desc";
        ////取得詳細資料(標題 發佈時間 發佈人員[[U_Num-COMID-DEPAR] 內文(不含附件1))
        MBULTDetailEntity MBULTDetail = MBULThgSql.Instance.getUpLoadDataDetail(connectionStrings, commandText, adver_id);//<=====================
        //MBULTDetailEntity ufeList = MBULThgSql.Instance.getUpLoadDataDetail(connectionStrings, commandText);//<=====================
        MBULTDetailEntity ufe = new MBULTDetailEntity();
        log.endWrite(MBULTDetail.ToString(), className, methodName);
        return MBULTDetail;
    }
    //取得公佈欄詳細資料(標題_發佈時間_發佈人員([[U_Num-COMID-DEPAR])_附件1_內文)
    public MBULTDetailEntity getUpLoadData1(string adver_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("adver_id : " + adver_id, className, methodName);
        //string commandText = "IF object_id('tempdb..#temptable1') IS NOT NULL BEGIN DROP Table #temptable1 END;select  IDENTITY (INT, 1, 1) AS ROW_ID,b.File_Folder,b.File_Name,b.File_Title,a.*　into #temptable1 from MBULT a left join Upload_File b on a.adver_id=b.File_num WHERE a.adver_id='" + adver_id + "';Select ROW_ID,File_Name,File_Title　From #temptable1 Where ROW_ID=1;";
        //string commandText = "select rowno ROW_ID,File_Name,File_Title from (select  rowno=row_number() over (order by a.add_date desc),b.File_Folder,b.File_Name,b.File_Title,a.*　from MBULT a left join Upload_File b on a.adver_id=b.File_num  WHERE a.adver_id='" + adver_id + "') as A where A.rowno=1";
        string commandText = "select a.adver_create_date,b.File_Name,b.File_Title,a.* from MBULT a left join Upload_File b on CONVERT(varchar(30),a.adver_id)=CONVERT(varchar(30),b.File_num) where a.adver_id='" + adver_id + "' order by a.adver_create_date desc";
        MBULTDetailEntity MBULTDetail = MBULThgSql.Instance.getUpLoadDataDetail1(connectionStrings, commandText, adver_id);//<=====================
        //MBULTDetailEntity ufeList = MBULThgSql.Instance.getUpLoadDataDetail(connectionStrings, commandText);//<=====================
        MBULTDetailEntity ufe = new MBULTDetailEntity();
        log.endWrite(MBULTDetail.ToString(), className, methodName);
        return MBULTDetail;
    }
    //取得公佈欄詳細資料(標題_發佈時間_發佈人員([[U_Num-COMID-DEPAR])_附件2_內文)
    public MBULTDetailEntity getUpLoadData2(string adver_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("adver_id : " + adver_id, className, methodName);
        //string commandText = "IF object_id('tempdb..#temptable2') IS NOT NULL BEGIN DROP Table #temptable2 END;select  IDENTITY (INT, 1, 1) AS ROW_ID,b.File_Folder,b.File_Name,b.File_Title,a.*　into #temptable2 from MBULT a left join Upload_File b on a.adver_id=b.File_num WHERE a.adver_id='" + adver_id + "';Select ROW_ID,File_Name,File_Title　From #temptable2 Where ROW_ID=2;";
        //string commandText = "select rowno ROW_ID,File_Name,File_Title from (select  rowno=row_number() over (order by a.add_date desc),b.File_Folder,b.File_Name,b.File_Title,a.*　from MBULT a left join Upload_File b on a.adver_id=b.File_num  WHERE a.adver_id='" + adver_id + "') as A where A.rowno=2";
        string commandText= "select a.adver_create_date,b.File_Name,b.File_Title,a.* from MBULT a left join Upload_File b on CONVERT(varchar(30), a.adver_id) = CONVERT(varchar(30), b.File_num) where a.adver_id = '" + adver_id + "' order by a.adver_create_date desc";
        MBULTDetailEntity MBULTDetail = MBULThgSql.Instance.getUpLoadDataDetail2(connectionStrings, commandText, adver_id);//<=====================
        //MBULTDetailEntity ufeList = MBULThgSql.Instance.getUpLoadDataDetail(connectionStrings, commandText);//<=====================
        MBULTDetailEntity ufe = new MBULTDetailEntity();
        log.endWrite(MBULTDetail.ToString(), className, methodName);
        return MBULTDetail;
    }
    //取得公佈欄詳細資料(標題_發佈時間_發佈人員([[U_Num-COMID-DEPAR])_附件3_內文)
    public MBULTDetailEntity getUpLoadData3(string adver_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("adver_id : " + adver_id, className, methodName);
        //string commandText = "IF object_id('tempdb..#temptable3') IS NOT NULL BEGIN DROP Table #temptable3 END;select  IDENTITY (INT, 1, 1) AS ROW_ID,b.File_Folder,b.File_Name,b.File_Title,a.*　into #temptable3 from MBULT a left join Upload_File b on a.adver_id=b.File_num WHERE a.adver_id='" + adver_id + "';Select ROW_ID,File_Name,File_Title　From #temptable3 Where ROW_ID=3;";
        //string commandText = "select rowno ROW_ID,File_Name,File_Title from (select  rowno=row_number() over (order by a.add_date desc),b.File_Folder,b.File_Name,b.File_Title,a.*　from MBULT a left join Upload_File b on a.adver_id=b.File_num  WHERE a.adver_id='" + adver_id + "') as A where A.rowno=3";
        string commandText = "select a.adver_create_date,b.File_Name,b.File_Title,a.* from MBULT a left join Upload_File b on CONVERT(varchar(30), a.adver_id) = CONVERT(varchar(30), b.File_num) where a.adver_id = '" + adver_id + "' order by a.adver_create_date desc";

        MBULTDetailEntity MBULTDetail = MBULThgSql.Instance.getUpLoadDataDetail3(connectionStrings, commandText, adver_id);//<=====================
        //MBULTDetailEntity ufeList = MBULThgSql.Instance.getUpLoadDataDetail(connectionStrings, commandText);//<=====================
        MBULTDetailEntity ufe = new MBULTDetailEntity();
        log.endWrite(MBULTDetail.ToString(), className, methodName);
        return MBULTDetail;
    }
   
    /// <summary>
    /// 新增上傳檔案
    /// </summary>
    public void addFileUpload(addFileUpload afu)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'afu':" + afu, className, methodName);

        string commandText = "INSERT INTO [HG].[dbo].[Upload_File] (File_Folder,File_num,File_Title,File_Name,add_user,add_date,add_ip) VALUES('{0}', '{1}', '{2}', '{3}', '{4}', GETDATE(), '{5}')";
        StringBuilder sbCommandText = new StringBuilder();
        sbCommandText.Append(string.Format(commandText, afu.File_Folder, afu.File_num, afu.File_Name, afu.File_Name, afu.add_user, afu.add_ip));
        noSelectSql.Instance.doNoneSelectSql(connectionStrings, sbCommandText.ToString());//<=====================

        log.endWrite(common.nothing, className, methodName);
    }
    
    public uploadFileEntity getUpLoadData(string mailId)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'mailId;':" + mailId, className, methodName);
        string commandText = "select F_ID,File_Folder,File_num,File_Title,File_Name  From UPload_File where File_Num='" + mailId + "' and  del_tag = '0'";
        uploadFileEntity ufe = UploadFilehgSql.Instance.getUpLoadData(connectionStrings, commandText);//<==========

        log.endWrite("'ufe' :" + ufe.ToString(), className, methodName);
        return ufe;
    }
    public List<uploadFileEntity> getFileDataList(string T_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'T_id' : " + T_id, className, methodName);
        string commandText = "select F_ID,File_Folder,File_num,File_Title,File_Name  From UPload_File where File_Num='" + T_id + "' and  del_tag = '0'";
        List<uploadFileEntity> ufeList = UploadFilehgSql.Instance.getFileDataList(connectionStrings, commandText);//<==========

        log.endWrite("'ufeList' : " + ufeList.ToString(), className, methodName);
        return ufeList;
    }

    public string deleteUpload_FileData(string File_num)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'File_num' :" + File_num, className, methodName);

        string commandText = "update Upload_File set del_tag='1' where File_num='"+ File_num + "'";
        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
    //20220624進度
    //取得郵件附件1
    public emailEntity getMailUpLoadData1(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        uploadFileEntity _uploadFileEntity1 = new uploadFileEntity();
        string commandText = "select a.add_Date,b.File_Name,b.File_Title,a.* from MMAIL a left join Upload_File b on CONVERT(varchar(30), a.MS_ID) = CONVERT(varchar(30), b.File_num) where b.File_Folder='MMAIL' and a.MS_ID='"+ MS_ID + "' order by a.add_Date desc";
        emailEntity _emailEntity=MMAILhgDao.Instance.getMailUPLoadDataDetail1(connectionStrings, commandText, MS_ID);
        MBULTDetailEntity MBULTDetail = MBULThgSql.Instance.getUpLoadDataDetail3(connectionStrings, commandText, MS_ID);//<=====================
        //MBULTDetailEntity ufeList = MBULThgSql.Instance.getUpLoadDataDetail(connectionStrings, commandText);//<=====================
        MBULTDetailEntity ufe = new MBULTDetailEntity();
        log.endWrite(MBULTDetail.ToString(), className, methodName);
        //return MBULTDetail;
        return _emailEntity;  
    }
    //20220624進度
    public emailEntity getMailUpLoadData2(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        uploadFileEntity _uploadFileEntity1 = new uploadFileEntity();
        string commandText = "select a.add_Date,b.File_Name,b.File_Title,a.* from MMAIL a left join Upload_File b on CONVERT(varchar(30), a.MS_ID) = CONVERT(varchar(30), b.File_num) where b.File_Folder='MMAIL' and a.MS_ID='" + MS_ID + "' order by a.add_Date desc";
        emailEntity _emailEntity = MMAILhgDao.Instance.getMailUPLoadDataDetail2(connectionStrings, commandText, MS_ID);
        MBULTDetailEntity MBULTDetail = MBULThgSql.Instance.getUpLoadDataDetail3(connectionStrings, commandText, MS_ID);//<=====================
        //MBULTDetailEntity ufeList = MBULThgSql.Instance.getUpLoadDataDetail(connectionStrings, commandText);//<=====================
        MBULTDetailEntity ufe = new MBULTDetailEntity();
        log.endWrite(MBULTDetail.ToString(), className, methodName);
        //return MBULTDetail;
        return _emailEntity;
    }
    //20220624進度
    public emailEntity getMailUpLoadData3(string MS_ID)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        uploadFileEntity _uploadFileEntity1 = new uploadFileEntity();
        string commandText = "select a.add_Date,b.File_Name,b.File_Title,a.* from MMAIL a left join Upload_File b on CONVERT(varchar(30), a.MS_ID) = CONVERT(varchar(30), b.File_num) where b.File_Folder='MMAIL' and a.MS_ID='" + MS_ID + "' order by a.add_Date desc";
        emailEntity _emailEntity = MMAILhgDao.Instance.getMailUPLoadDataDetail3(connectionStrings, commandText, MS_ID);
        //MBULTDetailEntity MBULTDetail = MBULThgSql.Instance.getUpLoadDataDetail3(connectionStrings, commandText, MS_ID);//<=====================
        //MBULTDetailEntity ufeList = MBULThgSql.Instance.getUpLoadDataDetail(connectionStrings, commandText);//<=====================
        MBULTDetailEntity ufe = new MBULTDetailEntity();
        log.endWrite(_emailEntity.ToString(), className, methodName);
        //return MBULTDetail;
        return _emailEntity;
    }

}