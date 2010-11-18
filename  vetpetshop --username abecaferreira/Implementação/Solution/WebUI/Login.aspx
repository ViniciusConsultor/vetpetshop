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
            <span style="display:block;"><asp:Label ID="lblAviso" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label></span>             
            <span style="display:block;"><asp:RequiredFieldValidator ID="rfvtxtUsu" ControlToValidate="txtUsu" runat="server" ErrorMessage="Preencha o campo Login" Display="Dynamic"></asp:RequiredFieldValidator></span>
            <span style="display:block;"><asp:RegularExpressionValidator ID="revtxtUsu" runat="server" ControlToValidate="txtUsu" ErrorMessage="Campo Login deve conter no mínimo 4 e máximo 30 caracteres" ValidationExpression="^[\s\S]{4,30}$" Display="Dynamic"></asp:RegularExpressionValidator></span>
            <span style="display:block;"><asp:RequiredFieldValidator ID="rfvtxtSenhaUsu"  ControlToValidate="txtSenhaUsu" runat="server" ErrorMessage="Preencha o campo Senha" Display="Dynamic"></asp:RequiredFieldValidator></span>
            <span style="display:block;"><asp:RegularExpressionValidator ID="revtxtSenhaUsu" runat="server" ControlToValidate="txtSenhaUsu" ErrorMessage="Campo Senha deve conter no mínimo 4 e no máximo 20 caracteres" ValidationExpression="^[\s\S]{4,20}$" Display="Dynamic"></asp:RegularExpressionValidator></span>
        </center>
        </div>
        <div style="width:98%; margin: 1% 0 0 0;">
            <center>
            <ul>
                <li style="margin-bottom:15px; list-style:none;">    
                    <asp:Label ID="lblUsu" Text="Login " runat="server" Font-Bold="True" ForeColor="#000066" Font-Size="XX-Large" Font-Names="Colonna MT"></asp:Label>
                    <asp:TextBox ID="txtUsu" runat="server" Width="20%"></asp:TextBox>
                </li>
                <li style="margin-bottom:20px; list-style:none;">
                    <asp:Label ID="lblSenha" runat="server" Text="Senha " Font-Bold="True" ForeColor="#000066" Font-Size="XX-Large" Font-Names="Colonna MT"></asp:Label>                               
                    <asp:TextBox ID="txtSenhaUsu" runat="server" TextMode="Password" Width="20%"></asp:TextBox> 
                    
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
