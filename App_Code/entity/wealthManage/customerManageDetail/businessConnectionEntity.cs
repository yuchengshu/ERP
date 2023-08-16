using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// companyDataEntity 的摘要描述
/// </summary>
public class businessConnectionEntity
{
    

    public businessConnectionEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    //public string f_id { get; set; }
    public string M_ID { get; set; }
    public string MP_ID { get; set; }
    public string MP_Item { get; set; }
    public string CF_Item { get; set; }
    public string Results_Item { get; set; }
    public string Paymoney { get; set; }
    public string Paymoney1 { get; set; }
    public string Paymoney2 { get; set; }
    public string T_PType { get; set; }
    public string T_PType1 { get; set; }
    public string T_PType2 { get; set; }
    public string T_Type { get; set; }
    public string PT_Item { get; set; }
    public string V_ID { get; set; }
    public string PS { get; set; }
    public string V_Name { get; set; }
    public string Pay_Type { get; set; }
    public string T_AccountMoney0 { get; set; }
    public string V_ID1 { get; set; }
    public string V_Name1 { get; set; }
    public string VD_Paymoney { get; set; }
    public string VD_Type { get; set; }
    public string Special1_user { get; set; }
    public string Special1_userName { get; set; }
    public string Special1_usercom { get; set; }
    public string T_accountmoney1 { get; set; }
    public string Special2_user { get; set; }
    public string Special2_userName { get; set; }
    public string Special2_usercom { get; set; }
    public string T_accountmoney2 { get; set; }
    public string Special3_user { get; set; }
    public string Special3_userName { get; set; }
    public string Special3_usercom { get; set; }
    public string T_accountmoney3 { get; set; }
    public string begindate_Date { get; set; }
    public string enddate_Date { get; set; }
    public string CellPhone { get; set; }
    public string Fax { get; set; }
    public string Mess { get; set; }
    public string Media { get; set; }
    public string ATM { get; set; }
    public string discount { get; set; }
    public string INV_ITEM { get; set; }
    public string INV_Open_Item { get; set; }
    public string T_Ivo { get; set; }
    public string COMNAME { get; set; }
    public string INV_ITEM_UnifyNum { get; set; }


    public string Select_Com { get; set; }
    public string Select_Dept { get; set; }
    public string Select_Employ { get; set; }
    public string Attach_User { get; set; }
    public string Attach_Name { get; set; }
    public string Attach_Com { get; set; }

    public string Attach_Dept { get; set; }
    public string CMonth { get; set; }
    public string Other { get; set; }
    public string T_ID { get; set; }
    public string T_Name { get; set; }
    public string D_MP { get; set; }
    public string D_Item { get; set; }
    public string D_Type { get; set; }
    public string D_Paymoney { get; set; }
    public string D_tag { get; set; }
    public string DSdate { get; set; }
    public string DEdate { get; set; }
    public string B_ID { get; set; }
    public string B_Name { get; set; }
    public string B_Paymoney { get; set; }
    public string S_tag { get; set; }
    public string S_ID { get; set; }
    public string S_Name { get; set; }
    public string S_Paymoney { get; set; }
    public string SSDate { get; set; }
    public string C_tag { get; set; }
    public string U_Agent { get; set; }
    public string U_Agent_Name { get; set; }
    public string U_Agent_Com { get; set; }
    public string U_Leader { get; set; }
    public string U_LeaderName { get; set; }
    public string U_LeaderCom { get; set; }
    public string L_Ps { get; set; }
    public string U_LeaderStatus { get; set; }
    public string U_LeaderStatusTime { get; set; }
    public string EX { get; set; }
    public string EX_Name { get; set; }
    public string EX_Com { get; set; }
    public string EX_Ps { get; set; }
    public string EX_Status { get; set; }
    public string EX_StatusTime { get; set; }
    public string EXLeader { get; set; }
    public string EX_LeaderName { get; set; }
    public string EX_LeaderCom { get; set; }
    public string EXL_Ps { get; set; }
    public string EX_LeaderStatus { get; set; }
    public string EX_LeaderStatusTime { get; set; }
    //public string PS { get; set; }
    //public string Obj { get; set; }
    public string F_Status { get; set; }
    //public string CCard_4Num { get; set; }
    public string del_tag { get; set; }
    public string add_date { get; set; }
    //public string add_user { get; set; }
    public string add_com { get; set; }
    public string add_ip { get; set; }
    public string M_Name { get; set; }
    public string Light_status { get; set; }
    public string Assign_name { get; set; }
    public string Assign_date { get; set; }
    public string DM_MC_Name { get; set; }
    public string DM_MarkTime { get; set; }
    public string T_PayMoney { get; set; }
    public string T_StartDate { get; set; }
    public string T_EndDate { get; set; }
    public string mc_name { get; set; }
    public string CF_ItemName { get; set; }
    public string ObjName { get; set; }
    public string add_userName { get; set; }
    public string MP_IDName { get; set; }
    public string MP_ItemName { get; set; }
    public string Results_ItemName { get; set; }
    public string T_TypeName { get; set; }
    public string T_PTypeName { get; set; }
    public string T_PType1Name { get; set; }
    public string T_PType2Name { get; set; }
    public string FaxName { get; set; }
    public string MessName { get; set; }
    public string MediaName { get; set; }
    public string INV_Open_ItemName { get; set; }
    public string INV_ITEMName { get; set; }
    public string T_IvoName { get; set; }
    public string CMonthName { get; set; }
    public string U_LeaderStatusName { get; set; }
    public string EX_StatusName { get; set; }
    public string EX_LeaderStatusName { get; set; }
    public string MC_Name { get; set; }
    public string D_MPname { get; set; }
    public string D_ItemName { get; set; }
    public string VD_TypeName { get; set; }
    public string New_PayMoney { get; set; }
    public string S_tagName { get; set; }
    public string C_tagName { get; set; }
    public string D_TypeName { get; set; }
    public string ca_id { get; set; }
    public string CF_item { get; set; }//0
    public string Obj { get; set; }//1
    public string add_user { get; set; }//2
    //public string add_date { get; set; }//3
    //public string MP_ID { get; set; }
    //public string M_Name { get; set; }
    //public string Light_status { get; set; }
    public string f_id { get; set; }
    //public string T_Type { get; set; }
   // public string V_ID { get; set; }
    //public string V_Name { get; set; }
    //public string Paymoney { get; set; }
    //public string Special1_userName { get; set; }
    //public string T_accountmoney1 { get; set; }
    //public string Special2_userName { get; set; }
    //public string T_accountmoney2 { get; set; }
    //public string Special3_userName { get; set; }
    //public string T_accountmoney3 { get; set; }//17
    //public string Results_Item { get; set; }
    //public string begindate_Date { get; set; }
    //public string enddate_Date { get; set; }
    //public string ca_id { get; set; }
    public string cellphone { get; set; }
    //public string Fax { get; set; }
    //public string Mess { get; set; }
    //public string Media { get; set; }
    public string P_Text { get; set; }
    public string P_video { get; set; }//27
    public string atm { get; set; }
    public string CCard_4Num { get; set; }
    public string INV_open_ITEM { get; set; }
    //public string INV_ITEM { get; set; }
    //public string COMNAME { get; set; }
    //public string INV_ITEM_UnifyNum { get; set; }
    //public string T_Ivo { get; set; }//34

    public string P_StartStop { get; set; }

    public string abccgetCase1 { get; set; } //選擇案件(編號)
    public string abccgetCase2 { get; set; } //選擇案件(名稱)
    public string abcSSdate_Date { get; set; } //暫停/恢復日期

    public string Com_Channge { get; set; }

    //Dept_Channge
    public string Dept_Channge { get; set; }

    public string Name_Channge { get; set; }
}