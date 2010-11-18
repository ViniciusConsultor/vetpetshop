<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="ListaPedidoDeCompra.aspx.cs" Inherits="WebUI.ListaPedidoDeCompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>
        Listar Pedidos De Compra
    </h3>
    <div style="margin: 10px 10px 10px 20px; width:95%;">
        <div style="width:95%; margin:0 0 10px 5px;">
            <b><span style="margin-left:10px;margin-right:5px; font-size:small; font-style:normal;">Lista de Pedidos Cadastrados:</span></b>
        </div>
        <div style="width:95%; margin:10px 0 0 5px;">
            <center>
                <asp:Label ID="lblRegistros" Visible="false" runat="server" Text="Nenhum registro encontrado"></asp:Label>
            </center>
        </div>
        <div id="divPedidos" runat="server" class="scroll" style="width:95%; margin:0 0 20px 15px;">
        <asp:GridView ID="grPedidos" runat="server" AutoGenerateColumns="false" 
            HeaderStyle-BackColor="DarkBlue" Width="100%" AllowPaging="false"  
             AlternatingRowStyle-BackColor="LightSteelBlue" 
            onrowcommand="grPedidos_RowCommand">
            <Columns>
             <asp:TemplateField>  
            <HeaderStyle  Width="5%"/>                      
            <ItemTemplate>
            <asp:LinkButton ID="lkselecionar" runat="server" Text="Selecionar" CommandName="selecionar" CommandArgument='<%# Eval("id_pedido") %>'></asp:LinkButton>
            </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Código" DataField="id_pedido" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Data de Cadastro" DataField="dt_cad" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="30%"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Valor" DataField="valor" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="15%"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Status" DataField="status" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="15%"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>                               
            <asp:BoundField HeaderText="Data de Recebimento" DataField="dt_receb" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="20%"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>        
            </Columns>
        </asp:GridView>
        </div>
    </div>
</asp:Content>