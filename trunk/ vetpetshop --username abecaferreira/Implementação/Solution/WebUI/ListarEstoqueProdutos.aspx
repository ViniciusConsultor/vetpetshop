<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="ListarEstoqueProdutos.aspx.cs" Inherits="WebUI.ListarEstoqueProdutos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>
      Listar Estoque de Produto
    </h3>  
    <div style="margin: 10px 10px 10px 20px; width:95%;">
        <ul>
            <li>
                <span style="margin-left:5px;margin-right:5px;">Listar por:</span>
                <asp:DropDownList ID="ddlTipo" runat="server" Width="25%" AutoPostBack="true" onselectedindexchanged="ddlTipo_SelectedIndexChanged"></asp:DropDownList>
            </li>
        </ul>
    </div>
    <div style="width:95%; margin:10px 0 10px 5px;">
        <b><span style="margin-left:10px;margin-right:5px; font-size:small; font-style:normal;">Lista de Estoque de Produtos:</span></b>
    </div>      
    <div class="scroll" style="width:95%; margin:0 0 10px 2.5%;">
        <asp:GridView ID="grEstoque" runat="server" AutoGenerateColumns="false" 
            HeaderStyle-BackColor="DarkBlue" Width="100%" AllowPaging="false" RowStyle-Height="30px"  
            onselectedindexchanged="grEstoque_SelectedIndexChanged" >
            <Columns>        
            <asp:BoundField DataField="id_estoque" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="5%"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>                         
            <asp:BoundField HeaderText="Tipo" DataField="tipo" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="15%"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Nome" DataField="nm_produto" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="15%"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Mínimo Mensal" DataField="min" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="15%"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Máximo Mensal" DataField="max" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="15%"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>                               
            <asp:BoundField HeaderText="Quantidade" DataField="quantidade" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="15%"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>        
            </Columns>
        </asp:GridView>
    </div>
    <div style=" margin:0 0 20px 2.5%; width:95%;border:1px solid #b9b9b9;">
        <div style="width:95%; margin:5px 0 5px 10px;">
            <b><span style="margin-left:5px;margin-right:5px; font-size:small; font-style:normal;">Legendas:</span></b>
        </div>
        <span style="margin-left:10px;margin-right:5px;"><b>Estoque mínimo/crítico</b></span><span style="background-color:#ffd700;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        <span style="margin-left:10px;margin-right:5px;"><b>Estoque médio</b></span><span style="background-color:#6495ED;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        <span style="margin-left:10px;margin-right:5px;"><b>Estoque máximo</b></span><span style="background-color:#33CC66;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>  
        <div>&nbsp;</div>
    </div>
</asp:Content>