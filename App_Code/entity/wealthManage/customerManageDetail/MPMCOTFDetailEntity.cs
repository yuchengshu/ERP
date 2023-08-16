using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// companyDataEntity 的摘要描述
/// </summary>
public class MPMCOTFDetailEntity
{
    public MPMCOTFDetailEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    //M_ID
    public string M_ID { get; set; }
    public string MP_Item { get; set; }
    public string CF_item { get; set; }//0
    public string obj { get; set; }//1
    public string add_user { get; set; }//2
    public string add_user_Unum { get; set; }//2
    public string add_date { get; set; }//3
    public string MP_ID { get; set; }
    public string M_Name { get; set; }
    public string Light_status { get; set; }
    public string f_id { get; set; }
    public string T_Type { get; set; }
    public string V_ID { get; set; }
    public string V_Name { get; set; }
    public string Paymoney { get; set; }
    public string T_Paymoney { get; set; }
    public string Special1_userName { get; set; }
    public string T_accountmoney1 { get; set; }
    public string Special2_userName { get; set; }
    public string T_accountmoney2 { get; set; }
    public string Special3_userName { get; set; }
    public string T_accountmoney3 { get; set; }//17
    public string Results_Item { get; set; }
    public string begindate_Date { get; set; }
    public string enddate_Date { get; set; }
    public string ca_id { get; set; } //電子委任(編號)
    
    public string pay_serial { get; set; } //電子委任(1)
    public string p_name { get; set; } //電子委任(2)
    public string price { get; set; } //電子委任(3)
    
    public string cellphone { get; set; }
    public string Fax { get; set; }
    public string Mess { get; set; }
    public string Media { get; set; }
    public string P_Text { get; set; }
    public string Text { get; set; }
    public string P_video { get; set; }//27
    public string atm { get; set; }
    public string CCard_4Num { get; set; }
    public string INV_open_ITEM { get; set; }
    public string INV_ITEM { get; set; }
    public string COMNAME { get; set; }
    public string INV_ITEM_UnifyNum { get; set; }
    public string T_Ivo { get; set; }//34
    public string CellPhone { get; set; }
    public string ATM { get; set; }
    public string discount { get; set; }
    public string INV_Open_Item { get; set; }
    public string Attach_User { get; set; }
    public string Attach_Name { get; set; }
    public string Attach_Com { get; set; }
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
    public string S_id { get; set; }
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
    public string PS { get; set; }
    public string Obj { get; set; }
    public string F_Status { get; set; }
    public string del_tag { get; set; }
    public string add_com { get; set; }
    public string add_ip { get; set; }
   public string Assign_name { get; set; }
    public string Assign_date { get; set; }
    public string DM_MC_Name { get; set; }
    public string DM_MarkTime { get; set; }
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
    public string CF_item_Name { get; set; }
    public string Obj_Name { get; set; }
    public string MP_ID_Name { get; set; }
    public string MP_ID_Name2 { get; set; } //分析師中文名稱
    public string T_PType { get; internal set; } //金額[付款方式]代碼
    public string T_PType1 { get; internal set; } //金額1[付款方式]代碼
    public string T_PType2 { get; internal set; } //金額2[付款方式]代碼
    public string T_PType_Name { get; internal set; } //金額[付款方式]中文名稱
    public string T_PType2_Name { get; internal set; } //金額2[付款方式]中文名稱
    public string T_PType3_Name { get; internal set; } //金額2[付款方式]中文名稱
    public string PT_Item { get; internal set; }//決定入帳資訊顯示用
    public string c_tag { get; set; } //決定是否折讓

    public string ContractID { get; set; }

    public string MemberKind { get; set; }//會員種類
    public string Result_Item { get; set; }

    public string Mark { get; set; }

    public string Assign { get; set; }

    
    //public string DM_MC_Name { get; set; }
    //public string DM_MarkTime { get; set; }

    /*
     *  CF_item_Name = GetValueBYSQL(conn2, GetCF_item_Name_SQL);//聯絡單種類中文名稱
                        Obj_Name = GetValueBYSQL(conn2, GetObj_Name_SQL);//件別中文名稱
                        MP_ID_Name = GetValueBYSQL(conn2, GetMP_ID_Name_SQL);//會員種類中文名稱
                        DM_MC_Name = GetValueBYSQL(conn2, GetDM_MC_Name_SQL);//註記(姓名)
                        DM_MarkTime = GetValueBYSQL(conn2, GetDM_MarkTime_SQL);//註記(時間)
     */
}