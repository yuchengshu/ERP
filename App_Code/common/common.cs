using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Xml;

/// <summary>
/// commonName 的摘要描述
/// </summary>
public class common
{
    //取得此類別名稱
    string className = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.FullName;
    public common()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    private static common _instanct = new common();
    public static common Instance
    {
        get
        {
            return _instanct;
        }
    }
    DateTime currentTime = DateTime.Now;
    public static string empty = "";
    public static string Null = null;
    public static string nothing = "無";
    public static string start = "開始";
    public static string end = "結束";
    public static string year = DateTime.Now.Year.ToString();
    public static string month = DateTime.Now.Month.ToString().PadLeft(2,'0');
    public static string day = DateTime.Now.Day.ToString().PadLeft(2, '0');
    public static string hour = DateTime.Now.Hour.ToString().PadLeft(2, '0');
    public static string minute = DateTime.Now.Minute.ToString().PadLeft(2,'0');
    public static string second = DateTime.Now.Second.ToString().PadLeft(2, '0');
    public static string Analyst = "Analyst";
    public static string Assistant = "Assistant";




    /// <summary>
    /// 取得ip位置
    /// </summary>
    /// <returns>ip位置</returns>
    public static string GetIP4Address()
    {
        string IP4Address = String.Empty;
        foreach (IPAddress IPA in Dns.GetHostAddresses(Dns.GetHostName()))
        {
            if (IPA.AddressFamily.ToString() == "InterNetwork")
            {
                IP4Address = IPA.ToString();
                break;
            }
        }
        return IP4Address;
    }
    /// <summary>
    /// 取得公司列表
    /// </summary>
    /// <returns></returns>
    public static List<string> getComIDList()
    {
        List<string> backList = new List<string>();
        backList.Add("HG01");
        backList.Add("HG05");
        backList.Add("HG02");
        backList.Add("HG03");
        backList.Add("HG04");
        backList.Add("HG06");
        return backList;
    }
    /// <summary>
    /// 取得上班時間08301730員工
    /// </summary>
    /// <returns></returns>
    public static List<string> getWt08301730EmpList()
    {
        List<string> wt08301730 = new List<string>();
        wt08301730.Add("B0612011");
        wt08301730.Add("B0612012");
        wt08301730.Add("08158");
        wt08301730.Add("D0002081");
        wt08301730.Add("B0611131");
        wt08301730.Add("B0611011");
        return wt08301730;
    }
    /// <summary>
    /// 取得上班時間09001800員工
    /// </summary>
    /// <returns></returns>
    public static List<string> getWt09001800EmpList()
    {
        List<string> wt09001800 = new List<string>();
        wt09001800.Add("A0608071");
        wt09001800.Add("B0611132");
        wt09001800.Add("B9601151");
        wt09001800.Add("B0303051");
        wt09001800.Add("B9903311");
        wt09001800.Add("A0508083");
        wt09001800.Add("B9911151");
        wt09001800.Add("b0103151");
        wt09001800.Add("B0509291");
        wt09001800.Add("B0408111");
        wt09001800.Add("B0508011");
        return wt09001800;
    }
    /// <summary>
    /// 取得部門列表
    /// </summary>
    /// <returns></returns>
    public static List<string> getDepList()
    {
        List<string> backList = new List<string>();

        backList.Add("0002");
        backList.Add("0006");
        backList.Add("0015");
        backList.Add("0016");
        backList.Add("0007");
        backList.Add("0008");
        backList.Add("0011");
        backList.Add("0012");
        backList.Add("0013");
        backList.Add("0014");
        backList.Add("0017");
        return backList;
    }

    /// <summary>
    /// 轉換星期
    /// </summary>
    /// <param name="num"></param>
    /// <returns></returns>
    public static string parseDate(string num)
    {
        string backstring = String.Empty;
        switch (num)
        {
            case "1":
                backstring = "一";
                break;
            case "2":
                backstring = "二";
                break;
            case "3":
                backstring = "三";
                break;
            case "4":
                backstring = "四";
                break;
            case "5":
                backstring = "五";
                break;
            case "6":
                backstring = "六";
                break;
            case "0":
                backstring = "日";
                break;
        }
        return backstring;
    }

    /// <summary>
    /// 取得年或月或日的數字
    /// </summary>
    /// <param name="param"></param>
    /// <returns></returns>
    public static string getYearOrMonthOrDay(string param)
    {
        string backString = string.Empty;
        string nowdate = DateTime.Now.ToString("MM-dd-yyyy");
        string[] nowdateArr = nowdate.Split('-');
        switch (param)
        {
            case "yy":
                backString = nowdateArr[2];
                break;
            case "MM":
                backString = nowdateArr[0].Trim().Length == 1 ? "0" + nowdateArr[0].Trim() : nowdateArr[0].Trim();
                break;
            case "dd":
                backString = nowdateArr[1].Trim().Length == 1 ? "0" + nowdateArr[1].Trim() : nowdateArr[1].Trim();
                break;
        }
        return backString;

    }

    /// <summary>
    /// 取得當月最後一天日
    /// </summary>
    public static string getThisMonthLastDay()
    {
        DateTime LastDay = DateTime.Now.AddMonths(1).AddDays(-DateTime.Now.AddMonths(1).Day);
        string[] dateARR = LastDay.ToString().Split(' ');
        string[] ymd = dateARR[0].Split('/');
        string backString = ymd[2];
        return backString;
    }
    public static string split(string str, char splitChar, int num)
    {
        return str.Split(splitChar)[num];
    }

    /// <summary>
    /// 把數字字串轉成數字型態千分位
    /// </summary>
    /// <param name="num"></param>
    /// <returns></returns>
    public static string stringToIntThousand(string num)
    {
        string backString = ((int)decimal.Parse(num)).ToString("#,0");
        return backString;
    }

    /// <summary>
    /// ymdhms格式轉成ymd
    /// </summary>
    /// <param name="ymdhms"></param>
    /// <returns></returns>
    public static string dateTimeToDate(string ymdhms)
    {
        string[] ymdhmsArr = ymdhms.Split(' ');
        return ymdhmsArr[0].ToString();
    }

    /// <summary>
    /// 產生 年 月 日 時 分 秒
    /// </summary>
    public static void getDateTime()
    {
        DateTime currentTime = DateTime.Now;
        year = currentTime.Year.ToString();
        month = makeUpZero(currentTime.Month.ToString());
        day = makeUpZero(currentTime.Day.ToString());
        hour = makeUpZero(currentTime.Hour.ToString());
        minute = makeUpZero(currentTime.Minute.ToString());
        second = makeUpZero(currentTime.Second.ToString());
    }

    /// <summary>
    /// 產生 年 月 日 時 分 秒
    /// </summary>
    public static string getDateTimeStr()
    {
        DateTime currentTime = DateTime.Now;
        year = currentTime.Year.ToString();
        month = makeUpZero(currentTime.Month.ToString());
        day = makeUpZero(currentTime.Day.ToString());
        hour = makeUpZero(currentTime.Hour.ToString());
        minute = makeUpZero(currentTime.Minute.ToString());
        second = makeUpZero(currentTime.Second.ToString());
        return year + month + day + hour + minute + second;
    }

    /// <summary>
    /// 產生 年 月 日
    /// </summary>
    public static string getMMddyyyyStr(string curStr)
    {
        string backStr = string.Empty;
        DateTime currentTime = DateTime.Now;
        year = currentTime.Year.ToString();
        month = makeUpZero(currentTime.Month.ToString());
        day = makeUpZero(currentTime.Day.ToString());
        backStr = month + curStr + day + curStr + year;
        return backStr;

    }

    public static string makeSqlDateTimeStr(int plusDay)
    {
        string backStr = string.Empty;
        DateTime currentTime = DateTime.Now;
        currentTime = currentTime.AddDays(plusDay);
        year = currentTime.Year.ToString();
        month = makeUpZero(currentTime.Month.ToString());
        day = makeUpZero(currentTime.Day.ToString());
        backStr = year + "-" + month + "-" + day + " 00:00:00.000";
        return backStr;

    }

    /// <summary>
    /// 補0
    /// </summary>
    /// <param name="word"></param>
    /// <returns></returns>
    public static string makeUpZero(string word)
    {
        string backString = string.Empty;
        if (word.Length < 2)
        {
            backString = "0" + word;
        }
        else
        {
            backString = word;
        }
        return backString;
    }

    /// <summary>
    /// 取隨機數
    /// </summary>
    /// <returns>1000~9999</returns>
    public static string getRandom1()
    {
        string backString = string.Empty;
        Random rnd1 = new Random();
        backString = rnd1.Next(1000, 20001).ToString();
        return backString;
    }

    public static string getMillisecond()
    {
        string backString = string.Empty;
        DateTime currentTime = DateTime.Now;
        int ms = currentTime.Millisecond;
        if (ms < 100)
        {
            backString = getMillisecond();
        }
        else
        {
            backString = ms.ToString();
        }
        return backString;
    }

    /// <summary>
    /// 取隨機數
    /// </summary>
    /// <returns>1000~9999</returns>
    public static string getRandom2()
    {
        string backString = string.Empty;
        Random rnd2 = new Random();

        backString = getMillisecond() + rnd2.Next(1, 10).ToString();

        return backString;
    }

    public static bool isEmpty(string word)
    {
        bool tf = false;
        if (word == null || word == "" || word.Length == 0 || word == "undefined" || word == "null")
        {
            tf = true;
        }
        return tf;
    }

    public static long getTwoDaysDifference(DateTime startDate, DateTime endDate)
    {
        long oneDay = 864000000000;
        return ((endDate.Ticks - startDate.Ticks) / oneDay);

    }

    public static double getTwoDaysDifferenceBackDouble(DateTime startDate, DateTime endDate)
    {
        long oneDay = 864000000000;
        return ((endDate.Ticks - startDate.Ticks) / oneDay);

    }

    public static double calculateAccountMoney(string type, string Pay_Type, string T_type, string Account_Money, string EmpType, int listCount, string PayTag)
    {
        double backAccount_Money = 0;
        if (type == "nor")
        {
            if (Pay_Type == "0002" || Pay_Type == "0007" || Pay_Type == "0008" || Pay_Type == "0012")
            {
                backAccount_Money += (double.Parse(Account_Money) * 0.98);
            }
            else if (Pay_Type == "0006" || Pay_Type == "0009" || Pay_Type == "0010")
            {
                if (T_type == "0003")
                {
                    backAccount_Money += (double.Parse(Account_Money) - 10);
                }
                else
                {
                    backAccount_Money += (double.Parse(Account_Money) - 20);
                }
            }
            else
            {
                backAccount_Money += double.Parse(Account_Money);
            }
        }
        else
        {
            if (EmpType == "Analyst")
            {
                if (Pay_Type == "0002")
                {
                    backAccount_Money += (double.Parse(Account_Money) * 0.98);
                }
                else if (Pay_Type == "0006")
                {
                    if (T_type == "0")
                    {
                        backAccount_Money += (double.Parse(Account_Money) - 20);
                    }
                    else
                    {
                        backAccount_Money += double.Parse(Account_Money);
                    }
                }
                else
                {
                    backAccount_Money += double.Parse(Account_Money);
                }
            }
            else if (EmpType == "Assistant")
            {
                if (PayTag == "1")
                {
                    if (Pay_Type == "0002" || Pay_Type == "0007" || Pay_Type == "0008" || Pay_Type == "0012")
                    {
                        backAccount_Money += (double.Parse(Account_Money) * 0.98);
                    }
                    else if (Pay_Type == "0006" || Pay_Type == "0009" || Pay_Type == "0010")
                    {
                        if (listCount == 1)
                        {
                            backAccount_Money += (double.Parse(Account_Money) - 20);
                        }
                        else if (listCount >= 2)
                        {
                            backAccount_Money += double.Parse(Account_Money) - 10;
                        }
                    }
                    else
                    {
                        backAccount_Money += double.Parse(Account_Money);
                    }
                }
                else if (PayTag == "0")
                {
                    //todo
                }
            }
        }
        return backAccount_Money;
    }

    public static void sendMail(string MS_ID, string MS_Title, string MS_Text, string MS_Receiver, string MS_Sender, string add_User, string add_ip)
    {
        emailEntity ee = new emailEntity();
        ee.MS_ID = MS_ID;
        ee.MS_Title = MS_Title;
        ee.MS_Text = MS_Text;
        ee.MS_Receiver = MS_Receiver;
        ee.MS_Sender = MS_Sender;
        ee.add_User = add_User;
        ee.add_ip = add_ip;

        MMAILhgDao.Instance.sendEmail(ee);
    }

    public static string allPowerXmlReader(string xmlStr, string readType)
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

    public static double calculateAccountMoneyForInternetBusinessPerformance(string Pay_Type, string T_type, string Account_Money)
    {
        double backAccount_Money = 0;
        if (Pay_Type == "0002" || Pay_Type == "0007" || Pay_Type == "0008")
        {
            backAccount_Money += (double.Parse(Account_Money) * 0.98);
        }
        else if (Pay_Type == "0006" || Pay_Type == "0009" || Pay_Type == "0010")
        {
            if (T_type == "0003")
            {
                backAccount_Money += (double.Parse(Account_Money) - 10);
            }
            else
            {
                backAccount_Money += (double.Parse(Account_Money) - 20);
            }
        }
        else
        {
            backAccount_Money += double.Parse(Account_Money);
        }
        return backAccount_Money;
    }

    public static string[] getInOutCompanyTimeArr(string U_Num, string mdepCode, string item, workTimeEntity wte)
    {
        string methodName = System.Reflection.MethodBase.GetCurrentMethod().Name;
        log.startWrite("'U_Num' : " + U_Num + "'mdepCode' : " + mdepCode + "'item' : " + item + "'wte' : " + wte.ToString(), "common", methodName);
        string[] backArr = new string[2];
        if (mdepCode == "0002" || mdepCode == "0006")
        {
            if (item == "0001")
            {
                if (mdepCode == "0002")
                {
                    backArr[0] = wte.A_OTime_S;
                    backArr[1] = wte.A_OTime_E;
                }
                else if (mdepCode == "0006")
                {
                    if (U_Num == "A0409211")
                    {
                        backArr[0] = wte.C_OTime_S;
                        backArr[1] = wte.C_OTime_E;
                    }
                    else
                    {
                        backArr[0] = wte.A_OBTime_S;
                        backArr[1] = wte.A_OBTime_E;
                    }
                }
            }
            else if (item == "0002")
            {
                backArr[0] = wte.A_MTime_S;
                backArr[1] = wte.A_MTime_E;
            }
            else if (item == "0003")
            {
                backArr[0] = wte.A_NTime_S;
                backArr[1] = wte.A_NTime_E;
            }
        }
        else if (mdepCode == "0015" || mdepCode == "0016")
        {
            if (item == "0001")
            {
                if (mdepCode == "0015")
                {
                    backArr[0] = wte.E_OTime_S;
                    backArr[1] = wte.A_OTime_E;
                }
                else if (mdepCode == "0016")
                {
                    if (U_Num == "A0409212")
                    {
                        backArr[0] = wte.C_OTime_S;
                        backArr[1] = wte.C_OTime_E;
                    }
                    else
                    {
                        backArr[0] = wte.E_OBTime_S;
                        backArr[1] = wte.E_OBTime_E;
                    }
                }
            }
            else if (item == "0002")
            {
                backArr[0] = wte.E_MTime_S;
                backArr[1] = wte.E_MTime_E;
            }
            else if (item == "0003")
            {
                backArr[0] = wte.E_NTime_S;
                backArr[1] = wte.E_NTime_E;
            }
        }
        else if (mdepCode == "0007" || mdepCode == "0008")
        {
            if (item == "0001")
            {
                if (mdepCode == "0007")
                {
                    backArr[0] = wte.B_OTime_S;
                    backArr[1] = wte.B_OTime_E;
                }
                else if (mdepCode == "0008")
                {
                    backArr[0] = wte.B_OBTime_S;
                    backArr[1] = wte.B_OBTime_E;
                }
            }
            else if (item == "0002")
            {
                backArr[0] = wte.B_MTime_S;
                backArr[1] = wte.B_MTime_E;
            }
            else if (item == "0003")
            {
                backArr[0] = wte.B_NTime_S;
                backArr[1] = wte.B_NTime_E;
            }
        }
        else if (mdepCode == "0011" || mdepCode == "0012")
        {
            if (item == "0001")
            {
                if (mdepCode == "0011")
                {
                    backArr[0] = wte.D_OTime_S;
                    backArr[1] = wte.D_OTime_E;
                }
                else if (mdepCode == "0012")
                {
                    backArr[0] = wte.D_OBTime_S;
                    backArr[1] = wte.D_OBTime_E;
                }
            }
            else if (item == "0002")
            {
                backArr[0] = wte.D_MTime_S;
                backArr[1] = wte.D_MTime_E;
            }
            else if (item == "0003")
            {
                backArr[0] = wte.D_NTime_S;
                backArr[1] = wte.D_NTime_E;
            }
        }
        else if (mdepCode == "0017")
        {
            if (item == "0001")
            {
                if (mdepCode == "0017")
                {
                    backArr[0] = wte.F_OTime_S;
                    backArr[1] = wte.F_OTime_E;
                }

            }
        }
        //行政部班表
        else if (mdepCode == "0003" || mdepCode == "0004" || mdepCode == "0009" || mdepCode == "0017" || mdepCode == "0010")
        {
            //0830~1730人員判斷
            if (U_Num == "B0612011" || U_Num == "B0612012" || U_Num == "08158" || U_Num == "D0002081" || U_Num == "B0611131" || U_Num == "B0611011")
            {
                backArr[0] = wte.C_OTime_S;
                backArr[1] = wte.C_OTime_E;
            }
            //0900~1800人員判斷
            else if (U_Num == "A0608071" || U_Num == "B0611132" || U_Num == "B9601151" || U_Num == "B0303051" || U_Num == "B9903311" || U_Num == "A0508083" || U_Num == "B9911151" || U_Num == "b0103151" || U_Num == "B0509291" || U_Num == "B0408111" || U_Num == "B0508011" || U_Num == "B0704161")
            {
                backArr[0] = wte.C_MTime_S;
                backArr[1] = wte.C_MTime_E;
            }

        }
        log.endWrite("'backArr[0]' : " + backArr[0].ToString() + "'backArr[1]' : " + backArr[1].ToString(), "common", methodName);
        return backArr;
    }
    /*
    public static DateTime stringToDatetime(int yyyy, int MM, int dd)
    {
        return new DateTime(yyyy, MM,dd);
    }
    */
    public static string datepickerStrToDatetimeStr(string dateStr)
    {
        string backStr = string.Empty;
        string[] tempDate = dateStr.Split('/');
        backStr = tempDate[2] + "-" + tempDate[0] + "-" + tempDate[1];
        return backStr;
    }

    public static string makeSQLdeleteStr(string tabName, string whereItem, string itemContent)
    {
        string backStr = string.Empty;
        backStr = "update " + tabName + " set del_tag='1' where " + whereItem + "='" + itemContent + "'";
        return backStr;
    }
    public static string makeTidStr()
    {
        string backStr = string.Empty;
        Random rnd2 = new Random();
        backStr = getDateTimeStr() + rnd2.Next(2, 100).ToString();
        return backStr;
    }


    public static DateTime stringToDateTime(String dateTimeStr)
    {

        return Convert.ToDateTime(dateTimeStr);
    }

    public static string getComIDfullName(string ComID)
    {
        string backStr = string.Empty;
        switch (ComID)
        {
            case "HG01":
                backStr = "營運事業一部";
                break;
            case "HG02":
                backStr = "投資推廣部";
                break;
            case "HG03":
                backStr = " 財富管理部";
                break;
            case "HG04":
                backStr = " 理財推廣部";
                break;
            case "HG05":
                backStr = " 營運事業二部";
                break;
            case "HG06":
                backStr = " 網路事業部";
                break;
        }
        return backStr;
    }
    public static List<ComIDentity> getComIDlist()
    {
        List<ComIDentity> ceList = new List<ComIDentity>();
        ComIDentity ce = null;
        DEPARentity de = null;
        List<ditcodedescEntity> ddeList = MITEMhgDao.Instance.getditcodedescEntityList("ComID");
        for (var d = 0; d < ddeList.Count; d++)
        {
            if (ddeList[d].ditcode != "0000")
            {
                ce = new ComIDentity();
                ce.ComID = ddeList[d].ditcode;
                ce.ComIDname = ddeList[d].ddesc;
                ce.depList = new List<DEPARentity>();
                switch (ce.ComID)
                {
                    case "HG01":
                        de = new DEPARentity();
                        de.DEPAR = "0002";
                        de.DEPAR = "營運事業一部A組";
                        ce.depList.Add(de);
                        de = new DEPARentity();
                        de.DEPAR = "0006";
                        de.DEPAR = "營運事業一部B組";
                        ce.depList.Add(de);
                        break;
                    case "HG02":
                        de = new DEPARentity();
                        de.DEPAR = "0007";
                        de.DEPAR = "投資推廣部A組";
                        ce.depList.Add(de);
                        de = new DEPARentity();
                        de.DEPAR = "0008";
                        de.DEPAR = "投資推廣部B組";
                        ce.depList.Add(de);
                        break;
                    case "HG03":
                        de = new DEPARentity();
                        de.DEPAR = "0011";
                        de.DEPAR = "財富管理部A組";
                        ce.depList.Add(de);
                        de = new DEPARentity();
                        de.DEPAR = "0012";
                        de.DEPAR = "財富管理部B組";
                        ce.depList.Add(de);
                        break;
                    case "HG04":
                        de = new DEPARentity();
                        de.DEPAR = "0013";
                        de.DEPAR = "理財推廣部A組";
                        ce.depList.Add(de);
                        de = new DEPARentity();
                        de.DEPAR = "0014";
                        de.DEPAR = "理財推廣部B組";
                        ce.depList.Add(de);
                        break;
                    case "HG05":
                        de = new DEPARentity();
                        de.DEPAR = "0015";
                        de.DEPAR = "營運事業二部A組";
                        ce.depList.Add(de);
                        de = new DEPARentity();
                        de.DEPAR = "0016";
                        de.DEPAR = "營運事業二部B組";
                        ce.depList.Add(de);
                        break;
                    case "HG06":
                        de = new DEPARentity();
                        de.DEPAR = "0017";
                        de.DEPAR = "網路事業部";
                        ce.depList.Add(de);
                        break;
                }
            }
        }

        return ceList;
    }

    public static List<DEPARentity> getDeplist(string ComID)
    {
        List<DEPARentity> depList = new List<DEPARentity>();
        DEPARentity de = null;
        switch (ComID)
        {
            case "HG01":
                de = new DEPARentity();
                de.DEPAR = "0002";
                de.DEPAR = "營運事業一部A組";
                depList.Add(de);
                de = new DEPARentity();
                de.DEPAR = "0006";
                de.DEPAR = "營運事業一部B組";
                depList.Add(de);
                break;
            case "HG02":
                de = new DEPARentity();
                de.DEPAR = "0007";
                de.DEPAR = "投資推廣部A組";
                depList.Add(de);
                de = new DEPARentity();
                de.DEPAR = "0008";
                de.DEPAR = "投資推廣部B組";
                depList.Add(de);
                break;
            case "HG03":
                de = new DEPARentity();
                de.DEPAR = "0011";
                de.DEPAR = "財富管理部A組";
                depList.Add(de);
                de = new DEPARentity();
                de.DEPAR = "0012";
                de.DEPAR = "財富管理部B組";
                depList.Add(de);
                break;
            case "HG04":
                de = new DEPARentity();
                de.DEPAR = "0013";
                de.DEPAR = "理財推廣部A組";
                depList.Add(de);
                de = new DEPARentity();
                de.DEPAR = "0014";
                de.DEPAR = "理財推廣部B組";
                depList.Add(de);
                break;
            case "HG05":
                de = new DEPARentity();
                de.DEPAR = "0015";
                de.DEPAR = "營運事業二部A組";
                depList.Add(de);
                de = new DEPARentity();
                de.DEPAR = "0016";
                de.DEPAR = "營運事業二部B組";
                depList.Add(de);
                break;
            case "HG06":
                de = new DEPARentity();
                de.DEPAR = "0017";
                de.DEPAR = "網路事業部";
                depList.Add(de);
                break;
        }

        return depList;
    }


}