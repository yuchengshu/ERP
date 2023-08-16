using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// VMCASHDataEntity 的摘要描述
/// </summary>
public class VMCASHDataEntity
{
    public VMCASHDataEntity()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public decimal ca_id { get; set; }

    public string M_id { get; set; }

    public string MC { get; set; }

    public string Member_Name { get; set; }//會員姓名
    public string MC_name { get; set; }//提案人

    public string mc_com { get; set; }

    public string Pay_Serial { get; set; }

    public string P_Name { get; set; }

    public string Price { get; set; }
    public string T_id { get; set; }

    public string mp_item { get; set; }
    public string C_Name { get; set; }

    public string C_Email { get; set; }

    public string C_Tel { get; set; }
    //期間
    public string Preiod { get; set; }
    public string T_Sdate { get; set; }

    public string T_Edate { get; set; }

    public string PS { get; set; }

    public string o_id { get; set; }

    public string del_tag { get; set; }

    public string  add_date { get; set; }

    public string add_user { get; set; }

    public string PayStatus { get; set; }

    public string Invoice_Vat { get; set; }

    public string Invoice_Com { get; set; }
    public string Invoice { get; set; }
    public string Card4NO { get; set; }
    public string Payway { get; set; }
    public string Done_Tag { get; set; }
    public string ContractID { get; set; }
    public string Pay_Tag { get; set; }
    public string OD_payOrderId
    { get; set; }
    public string msg { get; set; }
    public string keyword { get; set; }

    public string PayStatus_Txt { get; set; }
    public string Done_Tag_Txt { get; set; }
}