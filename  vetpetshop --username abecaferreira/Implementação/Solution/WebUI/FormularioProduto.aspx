<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="FormularioProduto.aspx.cs" Inherits="WebUI.FormularioCadastroProduto" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>
        Manter Cadastro Produto
    </h3>
    <div style="width:100%;margin:5px 0 5px 20px;">
        <ul>
            <li>
                <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label>
            </li>
        </ul>
    </div>    
    <div style="width:100%; margin:20px 0 10px 10px;">
        <span style="margin-left:10px;margin-right:5px; font-size:small; font-style:normal;"><b>Formulário de Cadastro de Produto:</b></span>
    </div>
    <div style="width:100%; margin:10px 0 0 20px;">
        <span style="display:block;"><asp:RequiredFieldValidator ID="rfvtxtNome" ControlToValidate="txtNome" runat="server" ErrorMessage="Preencha o campo Nome" Display="Dynamic"></asp:RequiredFieldValidator></span>
        <span style="display:block;"><asp:RegularExpressionValidator ID="regtxtNome" runat="server" ControlToValidate="txtNome" Display="Dynamic" ErrorMessage="Campo nome não deve conter caracteres especiais" ValidationExpression="^[. 0-9a-zA-Z ç Ç ã Ã õ Õ Ê ê Â â Ô ô ó Ó ò Ò á à Á À é è È É Í ì í Ì î ú û Ú ù Ùº ª ]+$"></asp:RegularExpressionValidator></span>
        <span id="erroTipo" runat="server" class="escondido" style="color:Red;">Preencha o campo Tipo</span>
        <span style="display:block;"><asp:RequiredFieldValidator ID="rfvtxtPrecoCusto" ControlToValidate="txtPrecoCusto" runat="server" ErrorMessage="Preencha o campo Preço de Custo" Display="Dynamic"></asp:RequiredFieldValidator></span>
        <span style="display:block;"><asp:RequiredFieldValidator ID="rfvtxtPrecoVenda" ControlToValidate="txtPrecoVenda" runat="server" ErrorMessage="Preencha o campo Preço de Venda" Display="Dynamic"></asp:RequiredFieldValidator></span>
        <span style="display:block;"><asp:RequiredFieldValidator ID="rfvtxtEstoqueMin" ControlToValidate="txtEstoqueMin" runat="server" ErrorMessage="Preencha o campo Estoque Mínimo" Display="Dynamic"></asp:RequiredFieldValidator></span>
        <span style="display:block;"><asp:RequiredFieldValidator ID="rfvtxtEstoqueMax" ControlToValidate="txtEstoqueMax" runat="server" ErrorMessage="Preencha o campo Estoque Máximo" Display="Dynamic"></asp:RequiredFieldValidator></span>
        <span style="display:block;"><asp:RegularExpressionValidator ID="revtxtEstoqueMin" ControlToValidate="txtEstoqueMin" runat="server" ErrorMessage="Campo Estoque Mínimo deve conter somente números" Display="Dynamic" ValidationExpression="^[0-9]+$" SetFocusOnError="true"></asp:RegularExpressionValidator></span>
        <span style="display:block;"><asp:RegularExpressionValidator ID="revtxtEstoqueMax" ControlToValidate="txtEstoqueMax" runat="server" ErrorMessage="Campo Estoque Máximo deve conter somente números" Display="Dynamic" ValidationExpression="^[0-9]+$" SetFocusOnError="true"></asp:RegularExpressionValidator></span>
    </div>
    <div style="width:100%; margin:10px 0 20px 20px;">
        <ul>
            <li style="margin-bottom:10px;"> 
                <span style="margin-left:0px;margin-right:5px;">Nome do Produto*:</span>
                <asp:TextBox ID="txtNome" runat="server" Width="40%" MaxLength="100"></asp:TextBox>
                <span style="margin-left:30px;margin-right:5px;">Tipo*:</span>
                <asp:DropDownList ID="ddlTipoGrupo" runat="server" Width="20%" onselectedindexchanged="ddlTipoGrupo_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:12px;margin-right:5px;">Preço de Custo*:</span>
                <asp:TextBox ID="txtPrecoCusto" runat="server" Width="20%"></asp:TextBox>
                <asp:MaskedEditExtender ID="meetxtPrecoCusto" runat="server" TargetControlID="txtPrecoCusto" Mask="999,999.99" MaskType="Number" MessageValidatorTip="true" InputDirection="RightToLeft" DisplayMoney="Left" AcceptNegative="Left" AutoComplete="false" ClearMaskOnLostFocus="true"></asp:MaskedEditExtender> 
                <span style="margin-left:30px;margin-right:5px;">Preço de Venda*:</span>
                <asp:TextBox ID="txtPrecoVenda" runat="server" Width="20%"></asp:TextBox>
                <asp:MaskedEditExtender ID="meetxtPrecoVenda" runat="server" TargetControlID="txtPrecoVenda" Mask="999,999.99" MaskType="Number" MessageValidatorTip="true" InputDirection="RightToLeft" DisplayMoney="Left" AcceptNegative="Left" AutoComplete="false" ClearMaskOnLostFocus="true"></asp:MaskedEditExtender> 
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:6px;margin-right:5px;">Estoque Mínimo*:</span>
                <asp:TextBox ID="txtEstoqueMin" runat="server" Width="15%" MaxLength="20"></asp:TextBox>
                <span style="margin-left:5px;margin-right:5px;">(quantidade mínima para aviso de reposição de estoque)</span>
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:4px;margin-right:5px;">Estoque Máximo*:</span>
                <asp:TextBox ID="txtEstoqueMax" runat="server" Width="15%" MaxLength="20"></asp:TextBox>
                <span style="margin-left:5px;margin-right:5px;">(quantidade máxima do produto em estoque)</span>
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:4px;margin-right:5px;">Data de Validade:</span>
                <asp:TextBox ID="txtDataVal" runat="server" Width="15%" MaxLength="10" onkeypress="validaData(this,'Data inválida.\nFavor informar a data no formato DD/MM/YYYY.')"></asp:TextBox>
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:42px;margin-right:5px;">Descrição:</span>
                <asp:TextBox ID="txtDesc" runat="server" Height="20%" TextMode="MultiLine" Width="60%" MaxLength="300"></asp:TextBox>
            </li>
            <li>
                <div style="width:90%; margin:15px 0 10px 5px;">
                    <span style="margin-left:10px;margin-right:5px; font-size:x-small; font-style:normal;"><b>* Preenchimento Obrigatório</b></span>
                </div>
            </li>
            <li style="width:95%;">
                <center>
                    <asp:Button Width="15%" ID="btnOk" runat="server" Text="Salvar" onclick="btnOk_Click" />
                    <asp:Button Width="15%" ID="btnAtualizar" runat="server" Text="Atualizar" Visible="false" onclick="btnAtualizar_Click" />
                    &nbsp;&nbsp;<asp:Button Width="15%" ID="btnCancelar" runat="server" Text="Cancelar" onclick="btnCancelar_Click" />
                </center>
            </li>
        </ul>
    </div>
</asp:Content>