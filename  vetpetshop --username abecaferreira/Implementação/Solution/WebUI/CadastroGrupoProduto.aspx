<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="CadastroGrupoProduto.aspx.cs" Inherits="WebUI.CadastroGrupoProduto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>
      Cadastrar Grupo de Produto
    </h3>
    <div style="width:100%;margin: 10px 10px 10px 20px;">
        <ul>
            <li>
                <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label>
            </li>
        </ul>    
    </div>
    <div style="width:95%; margin:10px 0 0 20px;">
        <span style="display:block;"><asp:RegularExpressionValidator ID="regtxtNomeGrupo" runat="server" ControlToValidate="txtNomeGrupo" Display="Dynamic" ErrorMessage="Campo nome não deve conter caracteres especiais" ValidationExpression="^[. 0-9a-zA-Z ç Ç ã Ã õ Õ Ê ê Â â Ô ô ó Ó ò Ò á à Á À é è È É Í ì í Ì î ú û Ú ù Ùº ª ]+$"></asp:RegularExpressionValidator></span>
    </div>
    <div style="margin: 10px 10px 10px 20px; width:95%;">
        <ul style="margin-top:10px;">
            <li style="margin-bottom:10px;">
                <span style="margin-left:10px;margin-right:5px;">Nome:</span>
                <asp:TextBox ID="txtNomeGrupo" runat="server" Width="30%"></asp:TextBox>
                &nbsp;&nbsp;<asp:Button Width="10%" ID="btnOk" runat="server" Text="Salvar" onclick="btnOk_Click" />
            </li>
        </ul>
    </div>
    <div style="width:100%; margin:20px 0 10px 10px;">
        <b><span style="margin-left:10px;margin-right:5px; font-size:small; font-style:normal;"><asp:Label ID="lblLista" runat="server" Font-Bold="true" Text="Lista de grupos cadastrados"></asp:Label></span></b>
    </div>        
    <div class="scroll" style="width: 80%; margin: 0 0 5px 30px;">
        <asp:GridView ID="grGrupos" Width="100%" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="DarkBlue" AllowPaging="false" onrowcommand="grGrupos_RowCommand" onrowdatabound="grGrupos_RowDataBound" AlternatingRowStyle-BackColor="LightSteelBlue">
        <Columns>
        <asp:TemplateField>  
        <HeaderStyle  Width="5%" Height="10%"/>                      
        <ItemTemplate>
        <asp:LinkButton ID="lkExcluir" runat="server" Text="Excluir" CommandName="excluir" CommandArgument='<%# Eval("id_grupo") %>'></asp:LinkButton>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="id_grupo" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White"  Visible="false">
        <HeaderStyle BackColor="DarkBlue" ForeColor="White"></HeaderStyle>
        </asp:BoundField>
        <asp:BoundField HeaderText="Nome do Grupo" DataField="nm_grupo" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
        <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="30%" Height="10%"></HeaderStyle>
        <ItemStyle HorizontalAlign="Center"></ItemStyle>
        </asp:BoundField>                        
        </Columns>
        </asp:GridView>                        
    </div>                        
</asp:Content>

 