<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebUI.Login" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>Vetpetshop</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width:100%; margin: 10% 0 0 0;">
            <center>
                <img src="style/img/bannerlogin.gif" alt="Vetpetshop" />                      
            </center>
        </div>
        <div style="width:98%; margin: 5% 0 0 0;">
            <center>
            <ul>
                <li style="margin-bottom:15px; list-style:none;">               
                    
                        <asp:Label ID="lblAviso" runat="server" Font-Bold="True" ForeColor="Red" Font-Size="Small"></asp:Label>
                   
                </li>
                <li style="margin-bottom:15px; list-style:none;">    
                    <asp:Label ID="lblUsu" Text="Login " runat="server" Font-Bold="True" ForeColor="#000066" Font-Size="XX-Large" Font-Names="Colonna MT"></asp:Label>
                    <asp:TextBox ID="txtUsu" runat="server" Width="20%"></asp:TextBox>
                </li>
                <li style="margin-bottom:20px; list-style:none;">
                    <asp:Label ID="lblSenha" runat="server" Text="Senha " Font-Bold="True" ForeColor="#000066" Font-Size="XX-Large" Font-Names="Colonna MT"></asp:Label>                               
                    <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" Width="20%"></asp:TextBox> 
                    
                </li>
                <li style="margin-bottom:15px; list-style:none;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnOk" runat="server" Text="Entrar" onclick="Button1_Click" Width="15%"/>    
                </li>
            </ul>
            </center>
        </div>
    </form>
</body>
</html>
