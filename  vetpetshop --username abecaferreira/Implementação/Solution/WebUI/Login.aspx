<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebUI.Login" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=iso8859-1" />
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
                <li style="margin-bottom:5px; list-style:none;">
                    <asp:Label ID="lblSenha" runat="server" Text="Senha " Font-Bold="True" ForeColor="#000066" Font-Size="XX-Large" Font-Names="Colonna MT"></asp:Label>                               
                    <asp:TextBox ID="txtSenhaUsu" runat="server" TextMode="Password" Width="20%"></asp:TextBox>
                </li>
                <li style="margin-bottom:20px; margin-left:30px; list-style:none;">
                    <asp:LinkButton Width="20%" id="lkLembrarSenha" runat="server" 
                        Text="Não consegue acessar a sua conta?" ValidationGroup="false" 
                        Font-Size="Small" onclick="lkLembrarSenha_Click"></asp:LinkButton>
                </li>
                <li style="margin-bottom:20px; list-style:none;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnOk" runat="server" Text="Entrar" onclick="Button1_Click" Width="15%"/>    
                </li>
            </ul>
            </center>
        </div>
        <asp:Panel ID="pnLembraSenha" runat="server" Visible="false">
            <div style="width:98%; margin: 1% 0 0 1%;">
                <center>
                <ul>
                    <li style="margin-bottom:5px; list-style:none;">
                        <asp:Label ID="Label1" Text="Sua senha será enviada para o e-mail informado abaixo:" runat="server" Font-Bold="True" ForeColor="#000066" Font-Size="Medium" Font-Names="Colonna MT"></asp:Label>
                        <span style="display:block;"><asp:RegularExpressionValidator ID="revtxtEmailLembraSenha" runat="server" ControlToValidate="txtEmailLembraSenha" ErrorMessage="Campo E-mail inválido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" SetFocusOnError="true"></asp:RegularExpressionValidator></span>
                        <span style="display:block;"><asp:Label ID="lblAvisoEmail" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label></span>             
                    </li>
                    <li style="margin-bottom:15px; list-style:none;">
                        <asp:Label ID="lblEmail" Text="E-mail " runat="server" Font-Bold="True" ForeColor="#000066" Font-Size="XX-Large" Font-Names="Colonna MT"></asp:Label>
                        <asp:TextBox ID="txtEmailLembraSenha" runat="server" Width="20%" MaxLength="30"></asp:TextBox>&nbsp;&nbsp;
                        <asp:Button ID="btnEnviarLembrete" runat="server" Text="Enviar" Width="5%" 
                            onclick="btnEnviarLembrete_Click"/>    
                    </li>
                 </ul>
                </center>       
            </div>
        </asp:Panel>
    </form>
</body>
</html>
