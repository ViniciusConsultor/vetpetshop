<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="ManterUsuario.aspx.cs" Inherits="WebUI.ManterUsuario" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>
        Manter Usuário
    </h3>
    <div style="width:100%;margin:5px 0 5px 30px;">
        <ul>
            <li>
                <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label>
            </li>
        </ul>
    </div>
    <div style="width:95%; margin:10px 0 0 35px;">
        <span id="erro1" runat="server" class="escondido" style="color:Red;">Preencha o campo tipo de usuário</span>
        <span style="display:block;"><asp:RequiredFieldValidator ID="rfvtxtNomePro" ControlToValidate="txtNomePro" runat="server" ErrorMessage="Preencha o campo Nome" Display="Dynamic"></asp:RequiredFieldValidator></span>
        <span style="display:block;"><asp:RegularExpressionValidator ID="regtxtNomePro" runat="server" ControlToValidate="txtNomePro" Display="Dynamic" ErrorMessage="Campo nome não deve conter caracteres especiais" ValidationExpression="^[. 0-9a-zA-Z ç Ç ã Ã õ Õ Ê ê Â â Ô ô ó Ó ò Ò á à Á À é è È É Í ì í Ì î ú û Ú ù Ùº ª ]+$"></asp:RegularExpressionValidator></span>
        <span style="display:block;"><asp:RequiredFieldValidator ID="rfvtxtNomeUsu" ControlToValidate="txtNomeUsu" runat="server" ErrorMessage="Preencha o campo Login" Display="Dynamic"></asp:RequiredFieldValidator></span>
        <span style="display:block;"><asp:RegularExpressionValidator ID="revtxtNomeUsu" runat="server" ControlToValidate="txtNomeUsu" ErrorMessage="Campo Login deve conter no mínimo 4 e máximo 30 caracteres" ValidationExpression="^[\s\S]{4,30}$" Display="Dynamic"></asp:RegularExpressionValidator></span>
        <span style="display:block;"><asp:RequiredFieldValidator ID="rfvtxtSenha"  ControlToValidate="txtSenha" runat="server" ErrorMessage="Preencha o campo Senha" Display="Dynamic"></asp:RequiredFieldValidator></span>
        <span style="display:block;"><asp:RegularExpressionValidator ID="revtxtSenha" runat="server" ControlToValidate="txtSenha" ErrorMessage="Campo Senha deve conter no mínimo 4 e no máximo 20 caracteres" ValidationExpression="^[\s\S]{4,20}$" Display="Dynamic"></asp:RegularExpressionValidator></span>
        <span style="display:block;"><asp:RequiredFieldValidator ID="rfvtxtEmail" ControlToValidate="txtEmail" runat="server" ErrorMessage="Preencha o campo E-mail" Display="Dynamic"></asp:RequiredFieldValidator></span>
        <span style="display:block;"><asp:RegularExpressionValidator ID="revtxtEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Campo E-mail inválido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" SetFocusOnError="true"></asp:RegularExpressionValidator></span>
    </div>
    <div style="width:100%;margin:5px 0 5px 30px;">
        <ul style="margin-top:10px;">
            <li style="margin-bottom:10px;">
                <span style="margin-left:10px;margin-right:5px;">Nome*:</span>
                <asp:TextBox ID="txtNomePro" runat="server" Width="60%"></asp:TextBox>
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:15px;margin-right:5px;">Tipo*:</span>
                <asp:DropDownList ID="ddlTipoUsu" runat="server" Width="20%" 
                    AutoPostBack="true" onselectedindexchanged="ddlTipoUsu_SelectedIndexChanged"></asp:DropDownList>
            </li>
            
            <li style="margin-bottom:10px;">
                <span style="margin-left:10px;margin-right:5px;">Login*:</span>
                <asp:TextBox ID="txtNomeUsu" runat="server" Width="40%"></asp:TextBox>
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:5px;margin-right:5px;">Senha*:</span>
                <asp:TextBox ID="txtSenha" runat="server" Width="30%"></asp:TextBox>&nbsp;&nbsp; 
                <asp:LinkButton id="lkGera" runat="server" Text="Gerar senha aleatória" onclick="lkGera_Click" ValidationGroup="false"></asp:LinkButton>
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:5px;margin-right:5px;">E-mail*:</span>
                <asp:TextBox ID="txtEmail" runat="server" Width="50%"></asp:TextBox>
            </li>
            <li>
                <div style="width:90%; margin:15px 0 10px 5px;">
                    <b><span style="margin-left:10px;margin-right:5px; font-size:x-small; font-style:normal;">* Preenchimento Obrigatório</span></b>
                </div>
            </li>
            <li style="margin-bottom:10px; width: 90%;">
                <center>
                <asp:Button Width="14%" ID="btnOk" runat="server" Text="Salvar" onclick="btnOk_Click" />&nbsp;&nbsp;
                <asp:Button Width="14%" ID="btnCancelar" runat="server" Text="Cancelar" onclick="btnCancelar_Click" ValidationGroup="false"/>
                </center>
            </li>
        </ul>
    </div>
    <div style="width:100%; margin:15px 0 10px 20px;">
        <b><span style="margin-left:10px;margin-right:5px; font-size:small; font-style:normal;"><asp:Label ID="lblCadastrados" runat="server" Font-Bold="true" Text="Lista de usuários cadastrados:"></asp:Label></span></b>
    </div>
    <div class="scroll" style="width: 90%; margin: 5px 0 20px 5%;">
        <asp:GridView ID="grUsuarios" runat="server" AutoGenerateColumns="false" 
                    HeaderStyle-BackColor="DarkBlue" Width="100%" AllowPaging="false" RowStyle-Height="20px" 
                    onrowcommand="grUsuarios_RowCommand" AlternatingRowStyle-BackColor="LightSteelBlue" 
                    onrowdatabound="grUsuarios_RowDataBound">
            <Columns>
            <asp:TemplateField>  
            <HeaderStyle  Width="10%"/>                      
            <ItemTemplate>
            <asp:LinkButton ValidationGroup="false" ID="lkExcluir" runat="server" Text="Excluir" CommandName="excluir" CommandArgument='<%# Eval("id_usuario") %>' OnClientClick="return confirm('Deseja excluir o usuário selecionado?');"></asp:LinkButton>
            </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="id_usuario" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White"  Visible="false">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Nome de Usuário" DataField="nm_usuario" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="20%"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Nome do Profissional" DataField="nm_prof" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="50%" HorizontalAlign="Center"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Tipo de Usuário" DataField="tipo_prof" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="20%" HorizontalAlign="Center"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            </Columns>
        </asp:GridView>
  </div>
</asp:Content>