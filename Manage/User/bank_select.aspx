<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bank_select.aspx.cs" Inherits="Manage_User_bank_select" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
    <script language="javascript">
    function closeDiag()
    {
        window.opener=null;
        window.close();
    } 
    function OK()
    {
        var Value=document.getElementsByName(“myRadio");
        for(var i=0;i<Value.length;i )
        {
            if(Value[i].checked)
            { 
                window.returnValue = Value[i].value;
                window.close();
            }
            else
            {
                document.getElementById("Lab_Info").innerText="沒有選中項,請選擇！";
            }
        }     
    } 
</script>
<body>
    <form id="form1" runat="server">
        <div>
              <asp:DataGrid ID="dgSjygl" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        BackColor="White" Font-Size="9pt" PageSize="5" Width="100%" Height="127px" >
                        <PagerStyle Mode="NumericPages" />
                        <AlternatingItemStyle BackColor="Gainsboro" />
                        <ItemStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Center" />
                        <Columns>
                            <asp:TemplateColumn>            
                                <HeaderTemplate>
                                    <label>選擇</label>
                                </HeaderTemplate>
                                <ItemTemplate>                                   
                                   
                                </ItemTemplate>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="60px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateColumn>
                            <asp:BoundColumn DataField="ID" HeaderText="編號">
                                <HeaderStyle Font-Bold="True"  Width="75px" HorizontalAlign="Center"/>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="MC" HeaderText="名稱">
                                <HeaderStyle Font-Bold="True"  Width="90px" HorizontalAlign="Center"/>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="BT" HeaderText="標題">
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Center"/>
                            </asp:BoundColumn>
                        </Columns>
                        <HeaderStyle BackColor="#7481BA" ForeColor="Yellow" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Font-Size="Small" />
                    </asp:DataGrid>
        </div>
    </form>
</body>
</html>
