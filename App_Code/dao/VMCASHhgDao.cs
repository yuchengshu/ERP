using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// VMCASHhgDao 的摘要描述
/// </summary>
public class VMCASHhgDao : System.Web.UI.Page
{
    //sql連線字串 webconfig的對應位置
    private static string connectionStrings = "sqlConnectHG_Test";

    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;

    //引用時不用再NEW
    private static VMCASHhgDao _instance = new VMCASHhgDao();
    public static VMCASHhgDao Instance
    {
        get
        {
            return _instance;
        }
    }
    public VMCASHhgDao()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //List<ERPcustomerWebPayEntity>
    //List<ERPcustomerWebPayEntity> ecwpeList = VMCASHhgDao.Instance.getERPcustomerWebPay(gecwppe);//<==========
    //VMCASHDataEntity


    public List<VMCASHDataEntity> getVMCASHData(string Pay_Tag, string Done_Tag, string keyword)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        //pay_Tag:付款狀態
        //Done_Tag:案件狀態
        //keyword:關鍵字
        // log.startWrite("'keyWord' :" + gecwppe.keyWord + "'PayStatus' :" + gecwppe.PayStatus + "'U_MDEP' :" + gecwppe.U_MDEP + "'U_Num' :" + gecwppe.U_Num + "'ComID' :" + gecwppe.ComID, className, methodName);

        //string sql_txt = getSqlTxt.getERPcustomerWebPayST(gecwppe.keyWord, gecwppe.PayStatus);
        //string sql_condition = "";
        string sql_Main = "";//主要語法
        string sql_Pay_Tag = "";///pay_Tag:付款狀態
        string sql_Done_Tag = "";//Case_Status:案件狀態
        string sql_Keyword = "";//關鍵字
        //string keyword = "";
        //if (vmcashdataEntity.keyword != null)
        //{ 
        //  keyword = vmcashdataEntity.keyword.Trim();
        //}
        //if (keyword != "")
        //{
        //    sql_condition = sql_condition + "and(mc_name like '%" + keyword + "%' or c_tel like '%" + keyword + "%' or P_name like '%" + keyword + "%') ";
        //}
        //20220713進度
        //string U_MDEP = Session["U_MDEP"].ToString();
        //string U_NUM = Session["U_NUM"].ToString();
        //string ComID = Session["ComID"].ToString();
        //SQL參考:https://docs.microsoft.com/zh-tw/sql/t-sql/language-elements/else-if-else-transact-sql?view=sql-server-ver16
        string Condition = "";
        //&&:AND,||:OR
        if (Pay_Tag != null)
        {
            if (Pay_Tag.Trim() != "")//付款狀態(1:成功,2:失敗)
            {
                sql_Pay_Tag = " and a.Paystatus='" + Pay_Tag + "'";
            }
        }
        if (Done_Tag != null)
        {
            if (Done_Tag.Trim() != "")//簽署狀態(0:成功,1:未簽署,2:不限)
            {
                if (Done_Tag.ToString() != "undefined")
                {
                    sql_Done_Tag = "and a.Done_Tag='" + Done_Tag + "'";
                }
            }
        }
        if (keyword.Trim() != "")
        {
            sql_Keyword = " and ( a.MC_name like'%" + keyword + "%'"
                         + " or  a.C_Tel like '%" + keyword + "%'"
                         + " or a.P_Name like '%" + keyword + "%' )";
        }

        if (1 != 1)//U_NUM == "A9501041" || U_NUM == "A9501042" || U_NUM == "A9501043" || U_NUM == "A9501045" || U_NUM == "A9501046" || U_NUM == "D0110015" || U_NUM == "A9612031" || U_NUM == "A0508081" || U_NUM == "A0005042" || U_NUM == "B0808011" || U_NUM == "b0904151")
        {
            //if (ComID == "HG06")
            //{
            //    sql = "select  * from Vmcash  where (mc_com='" + ComID + "' or mc_com='ST'  ) and del_tag = '0'" + sql_condition + " order by add_date desc";
            //}
        }
        else
        {
            //20220714要修改的語法
            //ex:SELECT [ca_id],[M_id],[MC],[MC_name],[mc_com],[Pay_Serial],[P_Name],[Price],[T_id],[mp_item],[C_name],[C_Email],[C_Tel],[T_Sdate],[T_Edate],[PS],[o_id],[del_tag],convert(varchar, [add_date], 120),[add_user],[add_com],[PayStatus],[Invoice_Vat],[Invoice_Com],[Invoice],[Card4NO],[Payway],[Done_Tag],[ContractID],[Pay_Tag],[OD_payOrderId],[msg] FROM [HG].[dbo].[VMCASH] where Pay_Serial = '22222'
            //convert(varchar, [add_date], 120)
            //sql = "select a.Pay_Serial,a.C_Tel,a.P_Name,a.Price,a.T_Sdate,a.T_Edate,b.Name,a.MC_name,convert(varchar, a.[add_date], 120) add_date,a.Pay_Tag,a.PayStatus,a.Done_Tag,a.o_id,a.OD_payOrderId,a.Payway,a.Card4NO from VMCASH a left join iddata b on a.C_Tel=b.Tel order by add_date desc";
            //sql = "select a.Pay_Serial,a.C_Tel,a.P_Name,a.Price,a.T_Sdate,a.T_Edate,a.M_id,a.MC_name,convert(varchar, a.[add_date], 120) add_date,a.Pay_Tag,a.PayStatus,a.Done_Tag,a.o_id,a.OD_payOrderId,a.Payway,a.Card4NO from VMCASH a order by add_date desc";
            //sql = "select a.Pay_Serial,a.C_Tel,a.P_Name,a.Price,a.T_Sdate,a.T_Edate,ISNULL(a.M_id,'') M_id,b.Name Member_Name,a.MC_name,convert(varchar, a.[add_date], 120) add_date,a.Pay_Tag,ISNULL(a.PayStatus,0) PayStatus,a.Done_Tag,ISNULL(a.o_id,'') o_id,ISNULL(a.OD_payOrderId,'') OD_payOrderId,ISNULL(a.Payway,'') Payway,ISNULL(a.Card4NO,'') Card4NO from VMCASH a left join iddata b on convert(varchar, a.M_ID, 120)=convert(varchar, b.M_ID, 120) order by add_date desc";
            //20220715
            if (keyword == "")//關鍵字
            {
                //20220718修改包含keyword的查詢
                sql_Main = "select Distinct(a.Pay_Serial),a.ca_id,a.C_Tel,a.P_Name,a.Price,a.T_Sdate,a.T_Edate,ISNULL(a.M_id,'') M_id,"
                 + "b.Name Member_Name,a.MC_name,convert(varchar, a.[add_date], 120) add_date,a.Pay_Tag,ISNULL(a.PayStatus,0) PayStatus,"
                 + "a.Done_Tag,ISNULL(a.o_id,'') o_id,ISNULL(a.OD_payOrderId,'') OD_payOrderId,ISNULL(a.Payway,'') Payway,"
                 + "ISNULL(a.Card4NO,'') Card4NO,a.ContractID from VMCASH a right join iddata b on convert(varchar, a.M_ID, 120)=convert(varchar, b.M_ID, 120)"
                + " where Pay_Serial IS NOT NULL and 1=1 "
                 + " and a.del_tag='0' "
                + sql_Pay_Tag
                + sql_Done_Tag
                //+ " or a.C_Tel like '%" + keyword + "%'"
                //+ " or a.P_Name like '%" + keyword + "%'"
                + " order by add_date desc";
            }
            else
            {
                sql_Main = "select Distinct(a.Pay_Serial),a.ca_id,a.C_Tel,a.P_Name,a.Price,a.T_Sdate,a.T_Edate,ISNULL(a.M_id,'') M_id,b.Name Member_Name,a.MC_name,"
                    + "convert(varchar, a.[add_date], 120) add_date,a.Pay_Tag,ISNULL(a.PayStatus,0) PayStatus,a.Done_Tag,"
                    + "ISNULL(a.o_id,'') o_id,ISNULL(a.OD_payOrderId,'') OD_payOrderId,ISNULL(a.Payway,'') Payway,ISNULL(a.Card4NO,'') Card4NO,"
                    + "a.ContractID from VMCASH a right join iddata b on convert(varchar, a.M_ID, 120)=convert(varchar, b.M_ID, 120)"
                //+ "b.Name Member_Name,a.MC_name,convert(varchar, a.[add_date], 120) add_date,a.Pay_Tag,ISNULL(a.PayStatus,0) PayStatus,"
                //+ "a.Done_Tag,ISNULL(a.o_id,'') o_id,ISNULL(a.OD_payOrderId,'') OD_payOrderId,ISNULL(a.Payway,'') Payway,"
                //+ "ISNULL(a.Card4NO,'') Card4NO,a.ContractID from VMCASH a right join iddata b on convert(varchar, a.M_ID, 120)=convert(varchar, b.M_ID, 120)"
                + " where  Pay_Serial IS NOT NULL and a.MC_name like'%" + keyword + "%'"//提案人
                + " and a.del_tag='0' "
                + " or a.C_Tel like '%" + keyword + "%'" //會員電話
                + " or a.P_Name like '%" + keyword + "%'" //商品名稱
                 + " or a.Member_Name like '%" + keyword + "%'" //會員姓名
                + sql_Pay_Tag
                + sql_Done_Tag
                + sql_Keyword
                + " order by add_date desc";
            }
        }
        /*if trim(Keyword) <> "" then
         sql_txt = sql_txt & " and (mc_name = '" & Keyword & "' or c_tel = '" & Keyword &"' or P_name = '" & Keyword &"') "
         end if

        Set vrs = Server.CreateObject ("ADODB.RecordSet")
        Set rs = Server.CreateObject ("ADODB.RecordSet")
        Set vrs_Mitem = Server.CreateObject ("ADODB.RecordSet")


        if session("U_MDEP")="0003" or session("U_MDEP")="0004" or session("U_MDEP")="0009" or session("U_NUM")="B0808011" then 
        tsql = "select  * from Vmcash  where del_tag = '0'" & sql_txt & " order by add_date desc"

        else  

        if  session("U_NUM")="A9501041" or session("U_NUM")="A9501042" or session("U_NUM")="A9501043" or session("U_NUM")="A9501045"  or session("U_NUM")="A9501046" or session("U_NUM")="D0110015"  or session("U_NUM")="A9612031" or session("U_NUM")="A0508081" or session("U_NUM")="A0005042" or session("U_NUM")="B0808011" or session("U_NUM")="b0904151"  then '主管可以看到所屬公司的
        if  Session("ComID")="HG06" then
        tsql = "select  * from Vmcash  where (mc_com='"& Session("ComID")&"' or mc_com='ST'  ) and del_tag = '0'" & sql_txt & " order by add_date desc"
        else	
        tsql = "select  * from Vmcash  where (mc_com='"& Session("ComID")&"') and del_tag = '0'" & sql_txt & " order by add_date desc"
        end if
        'RESPONSE.WRITE TSQL

        else
        tsql = "select  * from Vmcash  where (mc='"& Session("U_Num")&"') and del_tag = '0'" & sql_txt & " order by add_date desc" '業務只能看所屬公司及個人案件

        end if  

        end if
         * 
         * 
         * 
         * 
         * 
         * 
         * 
         * 
         * 
         */
        string commandText = string.Empty;
        commandText = sql_Main;

        //if (gecwppe.U_MDEP == "0003" || gecwppe.U_MDEP == "0004" || gecwppe.U_MDEP == "0009")
        //{
        //    commandText = "select ca_id,MC_name,Pay_Serial,P_Name,Price,C_name,C_Tel,add_date,o_id,Card4NO,Payway,PayStatus,Done_Tag,ContractID,M_id from VMCASH where del_tag = '0'" + sql_txt + " order by add_date desc";
        //}
        //else
        //{

        //    if (gecwppe.U_Num == "A9501041" || gecwppe.U_Num == "A9501042" || gecwppe.U_Num == "A9612031" || gecwppe.U_Num == "A0508081" || gecwppe.U_Num == "A0005042")
        //    {
        //        commandText = "select ca_id,MC_name,Pay_Serial,P_Name,Price,C_name,C_Tel,add_date,o_id,Card4NO,Payway,PayStatus,Done_Tag,ContractID,M_id from VMCASH where (mc_com='" + gecwppe.ComID + "') and del_tag = '0'" + sql_txt + " order by add_date desc";
        //    }
        //    else
        //    {
        //        commandText = "select ca_id,MC_name,Pay_Serial,P_Name,Price,C_name,C_Tel,add_date,o_id,Card4NO,Payway,PayStatus,Done_Tag,ContractID,M_id from VMCASH where (mc='" + gecwppe.U_Num + "') and del_tag = '0'" + sql_txt + " order by add_date desc";
        //    }
        //}

        List<VMCASHDataEntity> VMCASHDataList = VMCASHhgSql.Instance.getVMCASHData(connectionStrings, commandText);//取得[線上付費暨委任契約書簽署]資料

        log.endWrite("'VMCASHDataList' :" + VMCASHDataList.ToString(), className, methodName);
        return VMCASHDataList;
    }

    public string  delVMCASHData(string ca_id)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'ca_id' :" + ca_id, className, methodName);

        string commandText = "update VMCASH set del_tag='1' where ca_id='" + ca_id + "'";

        string backStr = noSelectSql.Instance.doNoneSelectSql(connectionStrings, commandText);//<==========

        log.endWrite("'backStr' :" + backStr, className, methodName);
        return backStr;
    }
}