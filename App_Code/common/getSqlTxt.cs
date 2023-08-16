using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// sqlTxt 的摘要描述
/// </summary>
public class getSqlTxt
{
    public getSqlTxt()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public static string getMessageListST(getMessageListParam gmlp)
    {
        string backString = string.Empty;
        if (gmlp.keyWord != common.empty)
        {
            backString += " and msg_text like '%" + gmlp.keyWord + "%'";
        }

        if (gmlp.MP != common.empty && gmlp.MP != "null")
        {
            backString += " and MP='" + gmlp.MP + "'";
        }
        if (gmlp.MP_Item != common.empty)
        {
            backString += " and MP_Item='" + gmlp.MP_Item + "'";
        }

        if (!common.isEmpty(gmlp.StartDate) || !common.isEmpty(gmlp.EndDate))
        {
            if (gmlp.StartDate.Trim() != common.empty && gmlp.EndDate.Trim() == common.empty)
            {
                backString += "and (add_date >= '" + gmlp.StartDate + "') AND (add_date <= DATEADD(d, 1, '" + gmlp.StartDate + "')) ";
            }
            if (gmlp.StartDate.Trim() == common.empty && gmlp.EndDate.Trim() != common.empty)
            {
                backString += "and (add_date >= '" + gmlp.EndDate + "') AND (add_date <= DATEADD(d, 1, '" + gmlp.EndDate + "')) ";
            }
            if (gmlp.StartDate.Trim() != common.empty || gmlp.EndDate.Trim() != common.empty)
            {
                backString += "and (add_date >= '" + gmlp.StartDate + "') AND (add_date <= DATEADD(d, 1, '" + gmlp.EndDate + "')) ";
            }
        }

        return backString;
    }

    public static string getDailyResearchReportListST(getMessageListParam gmlp)
    {
        string backString = string.Empty;
        string Keyword = gmlp.keyWord;
        if (gmlp.keyWord != common.empty)
        {
            backString += " and ( a.F_Title like '%" + Keyword + "%' or a.Stock1 like '%" + Keyword + "%'  or a.Stock2 like '%" + Keyword + "%'  or a.Stock3 like '%" + Keyword + "%') ";
        }

        if (gmlp.MP != common.empty && gmlp.MP != "null")
        {
            backString += " and b.u_num='" + gmlp.MP + "'";
        }
        if (gmlp.MP_Item != common.empty)
        {
            backString += " and a.U_Item='" + gmlp.MP_Item + "'";
        }

        if (!common.isEmpty(gmlp.StartDate) || !common.isEmpty(gmlp.EndDate))
        {
            if (gmlp.StartDate.Trim() != common.empty && gmlp.EndDate.Trim() == common.empty)
            {
                backString += "and (a.add_date >= '" + gmlp.StartDate + "') AND (a.add_date <= DATEADD(d, 1, '" + gmlp.StartDate + "')) ";
            }
            if (gmlp.StartDate.Trim() == common.empty && gmlp.EndDate.Trim() != common.empty)
            {
                backString += "and (a.add_date >= '" + gmlp.EndDate + "') AND (a.add_date <= DATEADD(d, 1, '" + gmlp.EndDate + "')) ";
            }
            if (gmlp.StartDate.Trim() != common.empty || gmlp.EndDate.Trim() != common.empty)
            {
                backString += "and (a.add_date >= '" + gmlp.StartDate + "') AND (a.add_date <= DATEADD(d, 1, '" + gmlp.EndDate + "')) ";
            }
        }

        return backString;
    }

    public static string getAllPowerSendRecordST(getMessageListParam gmlp)
    {
        string backString = string.Empty;
        if (gmlp.keyWord != common.empty)
        {
            backString += " and M_text like '%" + gmlp.keyWord + "%'";
        }

        if (gmlp.MP != common.empty && gmlp.MP != "null")
        {
            backString += " and M_MP='" + gmlp.MP + "'";
        }
        if (gmlp.MP_Item != common.empty)
        {
            backString += " and M_MITem='" + gmlp.MP_Item + "'";
        }

        if (!common.isEmpty(gmlp.StartDate) || !common.isEmpty(gmlp.EndDate))
        {
            if (gmlp.StartDate.Trim() != common.empty && gmlp.EndDate.Trim() == common.empty)
            {
                backString += "and (add_date >= '" + gmlp.StartDate + "') AND (add_date <= DATEADD(d, 1, '" + gmlp.StartDate + "')) ";
            }
            if (gmlp.StartDate.Trim() == common.empty && gmlp.EndDate.Trim() != common.empty)
            {
                backString += "and (add_date >= '" + gmlp.EndDate + "') AND (add_date <= DATEADD(d, 1, '" + gmlp.EndDate + "')) ";
            }
            if (gmlp.StartDate.Trim() != common.empty || gmlp.EndDate.Trim() != common.empty)
            {
                backString += "and (add_date >= '" + gmlp.StartDate + "') AND (add_date <= DATEADD(d, 1, '" + gmlp.EndDate + "')) ";
            }
        }

        return backString;
    }

    public static string CustomerManageST(getCustormerParams gcp)
    {
        string backString = string.Empty;
        if (gcp.keyWord != common.empty)
        {
            /*backString += " and (M_Num = '" + gcp.keyWord + "' or M_Name = '" + gcp.keyWord + "' or MTel1 = '" + gcp.keyWord + "'";

            backString += " or MTel2 = '" + gcp.keyWord + "' or MTel3 = '" + gcp.keyWord + "'";

            backString += " or ((OTel_Zone +  OTel = '" + gcp.keyWord + "') ";

            backString += " or (OTel_Zone1 +  OTel1 = '" + gcp.keyWord + "') ";

            backString += " or (HTel_Zone +  HTel = '" + gcp.keyWord + "') ";

            backString += " or (HTel_Zone1 +  HTel1 = '" + gcp.keyWord + "'))) ";*/
            backString += " and (M_Num LIKE '" + gcp.keyWord + "%' or M_Name LIKE '%" + gcp.keyWord + "%' or MTel1 LIKE '" + gcp.keyWord + "%'";

            backString += " or MTel2 LIKE '" + gcp.keyWord + "%' or MTel3 LIKE '" + gcp.keyWord + "%'";

            backString += " or ((OTel_Zone +  OTel LIKE '" + gcp.keyWord + "%') ";

            backString += " or (OTel_Zone1 +  OTel1 LIKE '" + gcp.keyWord + "%') ";

            backString += " or (HTel_Zone +  HTel LIKE '" + gcp.keyWord + "%') ";

            backString += " or (HTel_Zone1 +  HTel1 LIKE '" + gcp.keyWord + "%')))";
        }
        if (gcp.Q_Name != common.empty)
        {
            backString += " and M_Name = '" + gcp.Q_Name + "'";
        }
        if (gcp.Q_Tel != common.empty)
        {
            backString += " and (MTel1 = '" + gcp.Q_Tel + "'";

            backString += " or MTel2 = '" + gcp.Q_Tel + "' or MTel3 = '" + gcp.Q_Tel + "'";

            backString += " or ((OTel_Zone +  OTel = '" + gcp.Q_Tel + "') ";

            backString += " or (OTel_Zone1 +  OTel1 = '" + gcp.Q_Tel + "') ";

            backString += " or (HTel_Zone +  HTel = '" + gcp.Q_Tel + "') ";

            backString += " or (HTel_Zone1 +  HTel1 = '" + gcp.Q_Tel + "'))) ";
        }
        if (!common.isEmpty(gcp.StartDate) || !common.isEmpty(gcp.EndDate))
        {
            if (gcp.StartDate.Trim() != common.empty && gcp.EndDate.Trim() == common.empty)
            {
                backString += "and (add_date >= '" + gcp.StartDate + "') AND (add_date <= DATEADD(d, 1, '" + gcp.StartDate + "')) ";
            }
            if (gcp.StartDate.Trim() == common.empty && gcp.EndDate.Trim() != common.empty)
            {
                backString += "and (add_date >= '" + gcp.EndDate + "') AND (add_date <= DATEADD(d, 1, '" + gcp.EndDate + "')) ";
            }
            if (gcp.StartDate.Trim() != common.empty || gcp.EndDate.Trim() != common.empty)
            {
                backString += "and (add_date >= '" + gcp.StartDate + "') AND (add_date <= DATEADD(d, 1, '" + gcp.EndDate + "')) ";
            }
        }
        if (gcp.Q_Analyst != common.empty)
        {
            backString += " and Analyst like '" + gcp.Q_Analyst + "'";
        }
        if (gcp.Q_Product != common.empty)
        {
            backString += " and Product like '" + gcp.Q_Product + "'";
        }
        if (gcp.Q_Grade != common.empty)
        {
            backString += " and M_Grade like '" + gcp.Q_Grade + "'";
        }
        if (gcp.Q_Member == "1")
        {
            backString += " and M_Num<>''";
        }
        return backString;
    }
    public static string getERPeditRecordST(string Keyword, string StartDate, string EndDate)
    {
        string backString = string.Empty;
        if (Keyword != common.empty)
        {

            backString += " and (M_Num = '" + Keyword + "' or M_Name = '" + Keyword + "' or MTel1 = '" + Keyword + "'";

            backString += " or MTel2 = '" + Keyword + "' or MTel3 = '" + Keyword + "'";

            backString += " or ((OTel_Zone +  OTel = '" + Keyword + "')  ";

            backString += " or (OTel_Zone1 +  OTel1 = '" + Keyword + "') ";

            backString += " or (HTel_Zone +  HTel = '" + Keyword + "') ";

            backString += " or (HTel_Zone1 +  HTel1 = '" + Keyword + "'))) ";
        }
        backString += "and (add_date >= '" + StartDate + "') AND (add_date <= DATEADD(d, 1, '" + EndDate + "')) ";
        return backString;
    }


    public static string PerformanceRankingST(string group, string U_Mdep)
    {
        string backString = string.Empty;
        switch (group)
        {
            case "1":
                backString = "";
                break;
            case "2":
                backString = " and (d.U_Mdep='0002' or d.U_Mdep='0006')";
                break;
            case "3":
                backString = " and (d.U_Mdep='0002' or d.U_Mdep='0006')";
                break;
            case "4":
                backString = " and d.U_Mdep='" + U_Mdep + "'";
                break;
            case "5":
                backString = " and (d.U_Mdep='0007' or d.U_Mdep='0008')";
                break;
            case "6":
                backString = " and d.U_Mdep='" + U_Mdep + "'";
                break;
            case "7":
                backString = " and (d.U_Mdep='0013' or d.U_Mdep='0014')";
                break;
            case "8":
                backString = " and (d.U_Mdep='0015' or d.U_Mdep='0016')";
                break;
            case "9":
                backString = " and (d.U_Mdep='0017')";
                break;
        }
        return backString;
    }
    //公告欄資料搜尋

    public static string noticeBoardST(string adver_depart_id, string keyword)
    {
        string backString = string.Empty;
        //adver_depart_id=9999全公司
        if (string.IsNullOrEmpty(adver_depart_id.ToString()) && common.isEmpty(keyword))
        {
            backString = backString;
        }
        else if (adver_depart_id.ToString() == "9999")
        {
            backString = backString;
        }
        //undefined
        else if (adver_depart_id.ToString() == "undefined")
        {
            backString = backString;
        }
        else if (adver_depart_id.ToString() == "null")
        {
            backString = backString;
        }
        else if (adver_depart_id.ToString() != "null" && common.isEmpty(keyword))
        {
            backString = backString + "adver_depart_id = '" + adver_depart_id + "' ";
        }
        //標題(adver_subject)內文(adver_content)
        else if (!common.isEmpty(keyword) || adver_depart_id.Trim().Length == 0)
        {
            ////sqlTxt:((del_tag = '0' and (lower(adver_subject) like LOWER('%facebook%')))) or ((del_tag = '0' and ((convert([nvarchar](255),adver_content) like LOWER('%facebook%' ) ))))
            backString = backString + "((del_tag = '0' and (lower(adver_subject) like LOWER('%" + keyword + "%')))) or ((del_tag = '0' and ((convert([nvarchar](255),adver_content) like LOWER('%" + keyword + "%')))))";

            //backString = backString + " and (lower(adver_subject) like '%" + keyword.ToLower() + "%' or lower(adver_content) like '%" + keyword.ToLower() + "%') ";
            //backString = backString + " and adver_depart_id = '" + adver_depart_id + "' ";
            //backString = backString + " and (adver_subject like '%" + keyword + "%' or adver_content like '%" + keyword + "%') ";
            //backString = backString + " and adver_depart_id = '" + adver_depart_id + "' ";
        }
        else if (!common.isEmpty(keyword) || adver_depart_id.ToString().Trim() != "")
        {
            backString = backString + " adver_depart_id = '" + adver_depart_id + "' and ((del_tag = '0' and (lower(adver_subject) like LOWER('%" + keyword + "%')))) or ((del_tag = '0' and ((convert([nvarchar](255),adver_content) like LOWER('%" + keyword + "%')))))";

            //    backString = backString + " and (adver_subject like '%" + keyword + "%' or adver_content like '%" + keyword + "%') ";
            //    backString = backString + " and adver_depart_id = '" + adver_depart_id + "' ";
        }
        return backString;
    }
    //生成取得聯絡單種類條件
    public static string businessConnectionST(string CF_Item, string F_Status, string Keyword)
    {
        string backString = string.Empty;
        if (CF_Item.Trim() != "0000")//聯絡單種類
        {
            if (!common.isEmpty(CF_Item))
            {
                backString = backString + " and (CF_Item = '" + CF_Item + "') ";
            }
        }
        if (!common.isEmpty(F_Status) && F_Status == "0") //0:不限,1:處理中,2:處理失敗,3:處理完成
        {
            //backString = backString + " or (F_Status = '1') or (F_Status = '2')  or (F_Status = '3')";
            backString = backString + " and ((F_Status = '1') or (F_Status = '2')  or (F_Status = '3'))";
        }
        if (!common.isEmpty(F_Status) && F_Status != "0")
        {
            backString = backString + " and (F_Status = '" + F_Status + "') ";
        }
        if (Keyword.Trim()!="")
        {
            backString = backString + " and (c.M_Name = '" + Keyword + "' or c.MTel1 = '" + Keyword + "')";
            backString = backString + " or c.MTel2 = '" + Keyword + "' or c.MTel3 = '" + Keyword + "'";
            backString = backString + " or (c.OTel_Zone +  c.OTel = '" + Keyword + "')  ";
            backString = backString + " or (c.OTel_Zone1 + c.OTel1 = '" + Keyword + "') ";
            backString = backString + " or (c.HTel_Zone +  a.HTel = '" + Keyword + "') ";
            backString = backString + " or (c.HTel_Zone1 +  a.HTel = '" + Keyword + "') ";
            backString = backString + " and (CF_Item != '') ";
            backString = backString + " and CF_Item is not null";

        }
        //backString = backString + " and del_tag=0 ";
        backString = backString + " order by b.add_date desc";
        return backString;
    }

    public static string analystSinglePerformanceST(string StartDate, string EndDate, string MP, string M_Item)
    {
        string backString = string.Empty;
        if (!common.isEmpty(M_Item))
        {
            if (!common.isEmpty(StartDate))
            {
                if (!common.isEmpty(EndDate))
                {
                    backString += "and (T_AccountDate >= '" + StartDate + "') AND (T_AccountDate <= '" + EndDate + "') ";
                }
                else
                {
                    backString += "and (T_AccountDate >= '" + StartDate + "') AND (T_AccountDate <= DATEADD(d, 1, '" + StartDate + "')) ";
                }
            }
            else
            {
                if (!common.isEmpty(EndDate))
                {
                    backString += "and (T_AccountDate >= '" + EndDate + "') AND (T_AccountDate <= DATEADD(d, 1, '" + EndDate + "')) ";
                }

            }
        }
        else
        {
            backString += "and (T_EndDate >= '" + StartDate + "') AND (T_EndDate <='" + EndDate + "')";
        }


        if (!common.isEmpty(M_Item))
        {
            if (!common.isEmpty(MP))
            {
                backString += " and MP='" + MP + "'";
            }
            backString += " and T_Item='" + M_Item + "'";
        }

        return backString;
    }

    public static string internetBusinessPerformanceST(string StartDate, string EndDate, string ComID)
    {
        string backString = string.Empty;
        if (!common.isEmpty(StartDate))
        {
            if (!common.isEmpty(EndDate))
            {
                backString += "and (T_AccountDate >= '" + StartDate + "') AND (T_AccountDate <= '" + EndDate + "') ";
            }
            else
            {
                backString += "and (T_AccountDate >= '" + StartDate + "') AND (T_AccountDate <= DATEADD(d, 1, '" + StartDate + "')) ";
            }
        }
        else
        {
            if (!common.isEmpty(EndDate))
            {
                backString += "and (T_AccountDate >= '" + EndDate + "') AND (T_AccountDate <= DATEADD(d, 1, '" + EndDate + "')) ";
            }

        }
        if (!common.isEmpty(ComID))
        {
            backString += " and MP_COM='" + ComID + "'";
        }
        return backString;
    }


    public static string leaveDataST(string U_Num, string EX_Status, string EX_Type, string StartDate, string EndDate, string keyWord)
    {
        string backString = "";
        if (!common.isEmpty(U_Num))
        {
            backString += " and EX_User= '" + U_Num + "'";
        }
        if (!common.isEmpty(EX_Status))
        {
            backString += " and EX_Status= '" + EX_Status + "'";
        }
        if (!common.isEmpty(EX_Type))
        {
            backString += " and EX_Type= '" + EX_Type + "'";
        }
        if (!common.isEmpty(keyWord))
        {
            backString += " and (EX_Name like '%" + keyWord + "%' or EX_Reason like '%" + keyWord + "%') ";
        }
        if (!common.isEmpty(StartDate))
        {
            if (!common.isEmpty(EndDate))
            {
                backString += "and (EX_SDate >= '" + StartDate + "') AND (EX_SDate <= '" + EndDate + "') ";
            }
            else
            {
                backString += "and (EX_SDate >= '" + StartDate + "') AND (EX_SDate <= DATEADD(d, 1, '" + StartDate + "')) ";
            }
        }
        else
        {
            if (!common.isEmpty(EndDate))
            {
                backString += "and (EX_SDate >= '" + EndDate + "') AND (EX_SDate <= DATEADD(d, 1, '" + EndDate + "')) ";
            }

        }
        return backString;
    }

    public static string getOItable(string MP, string StartDate, string EndDate)
    {
        string backString = string.Empty;
        if (!common.isEmpty(MP))
        {
            backString += " and MP='" + MP + "'";
        }
        if (!common.isEmpty(StartDate) || !common.isEmpty(EndDate))
        {

            if (StartDate.Trim() != common.empty || EndDate.Trim() != common.empty)
            {
                backString += "and (add_date >= '" + StartDate + "') AND (add_date <= DATEADD(d, 1, '" + EndDate + "'))";
            }
        }
        return backString;
    }


    public static string getPrintDataST(string M_Num, string StartDate, string EndDate)
    {
        string backString = string.Empty;
        if (!common.isEmpty(M_Num))
        {
            backString += " and M_Num='" + M_Num + "'";
        }
        if (!common.isEmpty(StartDate) || !common.isEmpty(EndDate))
        {

            if (StartDate.Trim() != common.empty || EndDate.Trim() != common.empty)
            {
                backString += "and (a.add_date >= '" + StartDate + "') AND (a.add_date <= DATEADD(d, 1, '" + EndDate + "'))";
            }
        }
        return backString;
    }

    public static string getTbdInvoiceST(string StartDate, string EndDate)
    {
        string backString = string.Empty;
        if (!common.isEmpty(StartDate) || !common.isEmpty(EndDate))
        {

            if (StartDate.Trim() != common.empty || EndDate.Trim() != common.empty)
            {
                backString += "and (inv_createdate >= '" + StartDate + "') AND (inv_createdate <= DATEADD(d, 1, '" + EndDate + "'))";
            }
        }
        return backString;
    }

    public static string getAllChargeDetailST(string StartDate, string EndDate)
    {
        string backString = string.Empty;
        if (!common.isEmpty(StartDate) || !common.isEmpty(EndDate))
        {

            if (StartDate.Trim() != common.empty || EndDate.Trim() != common.empty)
            {
                backString += "and (add_date >= '" + StartDate + "') AND (add_date <= DATEADD(d, 1, '" + EndDate + "'))";
            }
        }
        return backString;
    }


    public static string getAppointOriginalArchiveST(getOriginalArchiveParamEntity goape)
    {
        string backString = string.Empty;
        string keyword = goape.keyWord;
        string MC_COM = goape.MC_COM;
        string Back_tag = goape.Back_tag;
        string Back_Status = goape.Back_Status;
        string Back_intag = goape.Back_intag;
        if (!common.isEmpty(keyword))
        {
            backString += " and (b.M_name  = '" + keyword + "' or b.M_Num  = '" + keyword + "' or b.MTEL1  = '" + keyword + "')";
        }
        if (!common.isEmpty(MC_COM))
        {
            backString += " and (a.MC_COM  = '" + MC_COM + "')";
        }
        if (!common.isEmpty(Back_tag))
        {
            backString += " and (a.Back_tag  = '" + Back_tag + "')";
        }
        if (!common.isEmpty(Back_intag))
        {
            backString += " and (a.Back_intag  = '" + Back_intag + "')";
        }
        if (!common.isEmpty(Back_Status))
        {
            backString += " and (a.Back_Status = '" + Back_Status + "')";
        }


        if (!common.isEmpty(goape.StartDate) || !common.isEmpty(goape.EndDate))
        {

            if (goape.StartDate.Trim() != common.empty || goape.EndDate.Trim() != common.empty)
            {
                backString += "and (a.T_AccountDate >= '" + goape.StartDate + "') AND (a.T_AccountDate <= DATEADD(d, 1, '" + goape.EndDate + "'))";
            }
        }
        return backString;
    }


    public static string getERPcustomerWebPayST(string keyWord, string PayStatus)
    {
        string backString = string.Empty;

        if (!common.isEmpty(PayStatus))
        {
            backString += " and (PayStatus = '" + PayStatus + "')";
        }
        if (!common.isEmpty(keyWord))
        {
            backString += " and (C_Name = '" + keyWord + "')";
        }

        return backString;
    }

    public static string getIdCheckListST(string keyWord, string StartDate, string EndDate)
    {
        string backString = string.Empty;
        if (!common.isEmpty(keyWord))
        {
            backString += " and ( tel like '%" + keyWord + "%' or name like '%" + keyWord + "%') ";
        }
        if (!common.isEmpty(StartDate) || !common.isEmpty(EndDate))
        {
            if (StartDate.Trim() != common.empty || EndDate.Trim() != common.empty)
            {
                backString += "and (add_date >= '" + StartDate + "') AND (add_date <= DATEADD(d, 1, '" + EndDate + "'))";
            }
        }
        return backString;
    }


    public static string getWebConsumptionOrderListST(getWebConsumptionOrderParamEntity gwcope)
    {
        string backString = string.Empty;
        if (!common.isEmpty(gwcope.P_id))
        {
            backString += " and P_id='" + gwcope.P_id + "'";
        }
        string keyWord = gwcope.keyWord;
        if (!common.isEmpty(keyWord))
        {
            backString += "  and (Name like '%" + keyWord + "%' or Tel like '%" + keyWord + "%' or DPRD_NAME like '%" + keyWord + "%' or O_ID like '%" + keyWord + "%') ";
        }
        if (!common.isEmpty(gwcope.StartDate) || !common.isEmpty(gwcope.EndDate))
        {
            if (gwcope.StartDate.Trim() != common.empty || gwcope.EndDate.Trim() != common.empty)
            {
                backString += "and (Add_Date >= '" + gwcope.StartDate + "') AND (Add_Date <= DATEADD(d, 1, '" + gwcope.EndDate + "'))";
            }
        }
        if (!common.isEmpty(gwcope.PayStatus))
        {
            backString += " and PayStatus='" + gwcope.PayStatus + "'";
        }
        if (!common.isEmpty(gwcope.Payway))
        {
            backString += " and Payway='" + gwcope.Payway + "'";
        }
        return backString;
    }


    public static string getEasySchoolOrderListST(getEasySchoolOrderParamEntity gesope)
    {
        string backString = string.Empty;

        string keyWord = gesope.keyWord;
        if (!common.isEmpty(keyWord))
        {
            backString += "  and (U_Name like '%" + keyWord + "%' or Tel like '%" + keyWord + "%' ) ";
        }
        if (!common.isEmpty(gesope.StartDate) || !common.isEmpty(gesope.EndDate))
        {
            if (gesope.StartDate.Trim() != common.empty || gesope.EndDate.Trim() != common.empty)
            {
                backString += "and (Add_Date >= '" + gesope.StartDate + "') AND (Add_Date <= DATEADD(d, 1, '" + gesope.EndDate + "'))";
            }
        }
        if (!common.isEmpty(gesope.PayStatus))
        {
            backString += " and PayStatus='" + gesope.PayStatus + "'";
        }
        if (!common.isEmpty(gesope.Payway))
        {
            backString += " and Payway='" + gesope.Payway + "'";
        }
        return backString;
    }

    public static string getMMBERdataST(string Tel)
    {
        string backString = string.Empty;
        if (!common.isEmpty(Tel))
        {
            backString += " and ((MTel1 = '" + Tel + "') OR (MTel2 = '" + Tel + "') OR (MTel3 = '" + Tel + "'))";
        }

        return backString;
    }

    public static string getMCdataForBusinessERPstatusST(string U_MDEP, string User_MDEP)
    {
        string backString = string.Empty;
        if (User_MDEP == "0002" || User_MDEP == "0006")
        {
            backString += " and (U_Mdep ='0002' or U_Mdep ='0006')";
        }
        else if (User_MDEP == "0007" || User_MDEP == "0008")
        {
            backString += " and (U_Mdep ='0007' or U_Mdep ='0008')";
        }
        else
        {
            if (U_MDEP != "")
            {
                backString += " and U_Mdep ='" + U_MDEP + "'";
            }
            else
            {
                backString += " and (U_Mdep ='0002' or U_Mdep ='0006' or U_Mdep ='0007' or U_Mdep ='0008')";
            }
        }

        return backString;
    }


    public static string getCompanyResourceTagST(getCompanyResourceTagParamEntity gcrtpe)
    {
        string backStr = string.Empty;
        if (!common.isEmpty(gcrtpe.StartDate) || !common.isEmpty(gcrtpe.EndDate))
        {
            if (gcrtpe.StartDate.Trim() != common.empty || gcrtpe.EndDate.Trim() != common.empty)
            {
                backStr += "and (DM_MarkTime >= '" + gcrtpe.StartDate + "') AND (DM_MarkTime <= DATEADD(d, 1, '" + gcrtpe.EndDate + "'))";
            }
        }
        if (!common.isEmpty(gcrtpe.MC))
        {
            backStr += " and DM_MC ='" + gcrtpe.MC + "'";
        }
        if (!common.isEmpty(gcrtpe.bMC))
        {
            backStr += " and b.MC ='" + gcrtpe.bMC + "'";
        }
        if (!common.isEmpty(gcrtpe.DM_tag))
        {
            backStr += " and DM_tag ='" + gcrtpe.DM_tag + "'";
        }
        if (!common.isEmpty(gcrtpe.U_MDEP))
        {
            backStr += " and MC_COM ='" + gcrtpe.U_MDEP + "'";
        }

        return backStr;
    }

    public static string getMCListForCaseDistributeST(string StartDate, string EndDate, string U_MDEP, string User_MDEP)
    {
        string backString = string.Empty;

        if (User_MDEP == "0002" || User_MDEP == "0006")
        {
            backString += " and (U_Mdep ='0002' or U_Mdep ='0006')";
        }
        else if (User_MDEP == "0007" || User_MDEP == "0008")
        {
            backString += " and (U_Mdep ='0007' or U_Mdep ='0008')";
        }
        else if (User_MDEP == "0011" || User_MDEP == "0012")
        {
            backString += " and (U_Mdep ='0011' or U_Mdep ='0012')";
        }
        else
        {
            if (!common.isEmpty(U_MDEP))
            {
                backString += " and U_Mdep ='" + U_MDEP + "'";
            }
            else
            {
                backString += " and (U_Mdep ='0002' or U_Mdep ='0006' or U_Mdep ='0007' or U_Mdep ='0008' or U_Mdep ='0011' or U_Mdep ='0012')";
            }
        }

        /*
           if (!common.isEmpty(StartDate) || !common.isEmpty(EndDate))
           {
               if (StartDate.Trim() != common.empty || EndDate.Trim() != common.empty)
               {
                   backString += "and (add_date >= '" + StartDate + "') AND (add_date <= DATEADD(d, 1, '" + EndDate + "'))";
               }
           }*/
        return backString;
    }


    public static string getMemberSessionStatusST(getMemberSessionStatusParamEntity gmsspe)
    {
        string backString = string.Empty;

        if (!common.isEmpty(gmsspe.admissionStartDate) && !common.isEmpty(gmsspe.admissionEndDate))
        {
            backString += "and (a.T_AccountDate >= '" + gmsspe.admissionStartDate + "') AND (a.T_AccountDate <= '" + gmsspe.admissionEndDate + "')";
        }
        if (!common.isEmpty(gmsspe.maturityStartDate) && !common.isEmpty(gmsspe.maturityEndDate))
        {
            backString += "and (a.T_EndDate >= '" + gmsspe.maturityStartDate + "') AND (a.T_EndDate <= '" + gmsspe.maturityEndDate + "')";
        }
        if (!common.isEmpty(gmsspe.accountStartDate) && !common.isEmpty(gmsspe.accountEndDate))
        {
            backString += "and (a.T_Accountdate >= '" + gmsspe.accountStartDate + "') AND (a.T_Accountdate <= '" + gmsspe.accountEndDate + "')";
        }
        backString += " and a.MP='" + gmsspe.MP + "'";
        backString += " and a.T_Item='" + gmsspe.M_Item + "'";
        return backString;
    }


    public static string getAnalystTidDataST(string MR_DateY, string MR_DateM, string t_id)
    {
        string backString = string.Empty;
        if (!common.isEmpty(t_id))
        {
            backString += " and P_id='" + t_id + "'";
        }
        if (!common.isEmpty(MR_DateY) || !common.isEmpty(MR_DateM))
        {
            string MR_SDate = MR_DateY + "/" + MR_DateM + "/1";
            string MR_DateM2 = string.Empty;
            if (MR_DateM == "12")
            {
                MR_DateM2 = "1";
            }
            else
            {
                MR_DateM2 = (int.Parse(MR_DateM) + 1).ToString();
            }
            string MR_EDate = MR_DateY + "/" + MR_DateM2 + "/1";
            backString += "and (add_date >= '" + MR_SDate + "') AND (add_date < '" + MR_EDate + "')";
        }
        return backString;
    }


    public static string getClickDetailST(string MR_DateY, string MR_DateM, string T_ID)
    {
        string backString = string.Empty;
        if (!common.isEmpty(T_ID))
        {
            backString += " and P_id='" + T_ID + "'";
        }
        if (!common.isEmpty(MR_DateY) || !common.isEmpty(MR_DateM))
        {
            string MR_SDate = MR_DateY + "/" + MR_DateM + "/1";
            string MR_DateM2 = string.Empty;
            if (MR_DateM == "12")
            {
                MR_DateM2 = "1";
            }
            else
            {
                MR_DateM2 = (int.Parse(MR_DateM) + 1).ToString();
            }
            string MR_EDate = MR_DateY + "/" + MR_DateM2 + "/1";
            backString += "and (M_date >= '" + MR_SDate + "') AND (M_date < '" + MR_EDate + "')";
        }
        return backString;
    }

    public static string getMFRRPresourceDistributionST(string startDate, string endDate, string MP_Com)
    {
        string backString = string.Empty;
        if (!common.isEmpty(MP_Com))
        {
            backString += " and MP_Com='" + MP_Com + "'";
        }
        backString += "and (result_Date >= '" + startDate + " 00:00:00') AND (result_Date <= '" + endDate + " 23:59:59') ";
        return backString;
    }


    public static string getWEVENTjoinWAnalystsResourceDistributionST(string startDate, string endDate, string MP_Com)
    {
        string backString = string.Empty;
        if (!common.isEmpty(MP_Com))
        {
            backString += " and b.U_com='" + MP_Com + "'";
        }
        backString += "and (result_Date >= '" + startDate + " 00:00:00') AND (result_Date <= '" + endDate + " 23:59:59') ";
        return backString;
    }

    public static string getWebsiteIPdetailST(string startDate, string endDate)
    {
        string backString = string.Empty;
        backString += "and (StartDate >= '" + startDate + " 00:00:00') AND (StartDate <= '" + endDate + " 23:59:59') ";
        return backString;
    }

    public static string getAdvancesRemainingMoneyST(getAdvancesRemainingMoneyParamEntity garmpe)
    {
        string backString = string.Empty;
        if (garmpe.startDate != "" || garmpe.endDate == "")
        {
            backString += " and (a.T_StartDate >= '" + garmpe.startDate + "') ";
        }
        else if (garmpe.startDate == "" || garmpe.endDate != "")
        {
            backString += " and (a.T_EndDate >= '" + garmpe.endDate + "') ";
        }
        else if (garmpe.startDate != "" || garmpe.endDate != "")
        {
            backString += "and (a.T_StartDate >= '" + garmpe.startDate + "') AND (a.T_EndDate <= '" + garmpe.endDate + "') ";
        }
        else if (garmpe.startDate != "" || garmpe.endDate != "")
        {
            backString += "and (a.T_StartDate >= '" + garmpe.startDate + "') AND (a.T_EndDate <= '" + garmpe.endDate + "') ";
        }
        //backString += "and (a.T_StartDate <= '" + garmpe.startDate + "') AND (a.T_EndDate <= '" + garmpe.endDate + "') ";
        //backString += "and (a.T_EndDate >= '" + garmpe.start2Date + "')";
        if (garmpe.MP != "")
        {
            backString += " and MP='" + garmpe.MP + "' ";
        }
        if (garmpe.M_Item != "")
        {
            backString += " and T_Item='" + garmpe.M_Item + "' ";
        }
        return backString;
    }

    public static string gerAllMuser()
    {
        string backString = string.Empty;
        return backString;
    }

    public static string getEmpDataST(string StartDate, string EndDate, string dateType, string inoutService, string empName)
    {
        string backString = string.Empty;
        if (!common.isEmpty(StartDate) && !common.isEmpty(EndDate))
        {
            switch (dateType)
            {
                case "1":
                    backString += " and (Slimdate >= '" + StartDate + "') and (Slimdate <= '" + EndDate + "')";
                    break;
                case "2":
                    backString += " and (Leavedate >= '" + StartDate + "') and (Leavedate <= '" + EndDate + "')";
                    break;
                case "3":
                    backString += " and (BirthdayDate >= '" + StartDate + "') and (BirthdayDate <= '" + EndDate + "')";
                    break;
            }
        }

        if (!common.isEmpty(empName))
        {
            backString += " and U_Name = '" + empName + "'";
        }
        if (!common.isEmpty(inoutService))
        {
            if (inoutService == "inService")
            {
                backString += " and LeaveDate is null";
            }
            else
            {
                backString += " and LeaveDate is not null";
            }

        }

        return backString;
    }

    public static string getVenuePerformanceST(string StartDate, string EndDate, string MP)
    {
        string backString = string.Empty;
        if (!common.isEmpty(MP))
        {
            backString += "and (MP = '" + MP + "')";
        }
        backString += "and (V_DAte >= '" + StartDate + "') AND (V_DAte <= DATEADD(d, 1, '" + EndDate + "'))";
        return backString;
    }

    public static string getVenuePerformanceForMCst(string StartDate, string EndDate, string MC)
    {
        string backString = string.Empty;
        if (!common.isEmpty(MC))
        {
            backString += "and (b.MC = '" + MC + "')";
        }

        backString += "and (T_AccountDate >= '" + StartDate + "') AND (T_AccountDate <= '" + EndDate + "')";
        return backString;
    }

    public static string getVenueMCst(string StartDate, string EndDate, string MC)
    {
        string backString = string.Empty;
        if (!common.isEmpty(MC))
        {
            backString += "and (MC = '" + MC + "')";
        }

        backString += "and (add_date >= '" + StartDate + "') AND (add_date <= '" + EndDate + "')";
        return backString;
    }

    public static string getElectronicCalculatorInvoiceDetailST(string StartDate, string EndDate, string Invoice_Item)
    {
        string backString = string.Empty;
        if (!common.isEmpty(Invoice_Item))
        {
            backString += "and (Invoice_Item = '" + Invoice_Item + "')";
        }

        backString += "and (Invoice_CreateDate >= '" + StartDate + "') AND (Invoice_CreateDate <= '" + EndDate + "')";
        return backString;
    }

    public static string getAnalystST(getAnalystParamEntity gape)
    {
        string backString = string.Empty;
        if (!common.isEmpty(gape.MP))
        {
            backString += " and U_num='" + gape.MP + "'";
        }
        /*
        if (!common.isEmpty(gape.MR_DateY) || !common.isEmpty(gape.MR_DateM))
        {
            string MR_SDate = gape.MR_DateY + "/" + gape.MR_DateM + "/1";
            string MR_DateM2 = string.Empty;
            if (gape.MR_DateM == "12")
            {
                MR_DateM2 = "1";
            }
            else
            {
                MR_DateM2 = (int.Parse(gape.MR_DateM) + 1).ToString();
            }
            string MR_EDate = gape.MR_DateY + "/" + MR_DateM2 + "/1";
            backString += "and (add_date >= '" + MR_SDate + "') AND (add_date <= '" + MR_EDate + "')";
        }*/
        return backString;
    }

    public static string getProgramST(string MR_DateY, string MR_DateM)
    {
        string backString = string.Empty;


        if (!common.isEmpty(MR_DateY) || !common.isEmpty(MR_DateM))
        {
            string MR_SDate = MR_DateY + "/" + MR_DateM + "/1";
            string MR_DateM2 = string.Empty;
            if (MR_DateM == "12")
            {
                MR_DateM2 = "1";
            }
            else
            {
                MR_DateM2 = (int.Parse(MR_DateM) + 1).ToString();
            }
            string MR_EDate = MR_DateY + "/" + MR_DateM2 + "/1";
            backString += "and (P_SDate <= '" + MR_EDate + "') AND (P_EDate >= '" + MR_SDate + "')";
        }
        return backString;
    }


    public static string getMMTELdataST(string MR_DateY, string MR_DateM)
    {
        string backString = string.Empty;


        if (!common.isEmpty(MR_DateY) || !common.isEmpty(MR_DateM))
        {
            string MR_SDate = MR_DateY + "/" + MR_DateM + "/1";
            string MR_DateM2 = string.Empty;
            if (MR_DateM == "12")
            {
                MR_DateM2 = "1";
            }
            else
            {
                MR_DateM2 = (int.Parse(MR_DateM) + 1).ToString();
            }
            string MR_EDate = MR_DateY + "/" + MR_DateM2 + "/1";
            backString += "and (MT_Date >= '" + MR_SDate + "') AND (MT_Date < '" + MR_EDate + "')";
        }
        return backString;
    }
}