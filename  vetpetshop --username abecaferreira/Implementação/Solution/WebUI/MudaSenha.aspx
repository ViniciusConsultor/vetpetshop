<%@ Page Title="" Language="C#" MasterPageFile="~/Vetpetshop.Master" AutoEventWireup="true" CodeBehind="MudaSenha.aspx.cs" Inherits="WebUI.MudaSenha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
    <h3>
        Alterar Senha
    </h3>
    <div style="width:100%;margin:5px 0 5px 30px;">
        <ul>
            <li>
                <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label>
            </li>
        </ul>
    </div>
    <div style="width:100%;margin:10px 0 5px 30px;">
        <span style="display:block;"><asp:RequiredFieldValidator ID="rfvtxtSenha"  ControlToValidate="txtSenha" runat="server" ErrorMessage="Preencha o campo Nova Senha" Display="Dynamic"></asp:RequiredFieldValidator></span>
        <span style="display:block;"><asp:RegularExpressionValidator ID="revtxtSenha" runat="server" ControlToValidate="txtSenha" ErrorMessage="Campo Nova Senha deve conter no mínimo 4 e no máximo 20 caracteres" ValidationExpression="^[\s\S]{4,20}$" Display="Dynamic"></asp:RegularExpressionValidator></span>
        <span style="display:block;"><asp:RequiredFieldValidator ID="rfvtxtConfSenha"  ControlToValidate="txtConfSenha" runat="server" ErrorMessage="Preencha o campo Confirma Senha" Display="Dynamic"></asp:RequiredFieldValidator></span>
        <span style="display:block;"><asp:RegularExpressionValidator ID="revtxtConfSenha" runat="server" ControlToValidate="txtConfSenha" ErrorMessage="Campo Confirma Senha deve conter no mínimo 4 e no máximo 20 caracteres" ValidationExpression="^[\s\S]{4,20}$" Display="Dynamic"></asp:RegularExpressionValidator></span>
    </div>
    <div style="width:100%;margin:10px 0 5px 30px;">
        <ul>
            <li style="margin-bottom:10px;">
                <span style="margin-left:19px;margin-right:5px;">Nova Senha:</span>
                <asp:TextBox TextMode="Password" ID="txtSenha" runat="server" Width="20%" MaxLength="20"></asp:TextBox>
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:0;margin-right:5px;">Confirma Senha:</span>
                <asp:TextBox TextMode="Password" ID="txtConfSenha" runat="server" Width="20%" MaxLength="20"></asp:TextBox>
            </li>
            <li style="margin-bottom:10px; width:46%;">
                <center>
                <asp:Button Width="70px" ID="btnAtualiza" runat="server" Text="Alterar" onclick="btnAtualiza_Click"/>
                &nbsp;&nbsp;<asp:Button Width="70px" ID="btnCancelar" runat="server" Text="Cancelar" ValidationGroup="false" onclick="btnCancelar_Click" />  
                </center>
            </li>
        </ul>
    </div>
</asp:Content>
