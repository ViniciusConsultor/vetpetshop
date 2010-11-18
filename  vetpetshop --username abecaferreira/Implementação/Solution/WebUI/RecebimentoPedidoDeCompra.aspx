<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="RecebimentoPedidoDeCompra.aspx.cs" Inherits="WebUI.RecebimentoPedidoDeCompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>
        Registrar Recebimento de Pedido de Compra
    </h3>
    <div style="width:100%;margin:15px 0 5px 20px;">
        <ul>
            <li>
                <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label>            
            </li>
        </ul>    
    </div>
    <div style="width:100%;margin:15px 0 5px 20px;">
        <ul style="margin-top:10px;">
            <li style="margin-bottom:10px;">
                <span style="margin-left:0px;margin-right:5px;">Código:</span>
                <asp:Label ID="lblCodigo" runat="server" Text=""></asp:Label>
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:0px;margin-right:5px;">Data de Cadastro:</span>
                <asp:Label ID="lblData" runat="server" Text=""></asp:Label>
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:0px;margin-right:5px;">Valor Total:</span>
                <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label>
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:0px;margin-right:5px;">Status:</span>
                <asp:Label ID="lblStatus" runat="server" Text="" Font-Bold="true"></asp:Label>
            </li>
            <li  style="margin-bottom:10px;">
                <span style="margin-left:0px;margin-right:5px;">Status:</span>    
                <asp:DropDownList ID="ddlStatus" runat="server" Width="100px" onselectedindexchanged="ddlStatus_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                &nbsp;&nbsp;&nbsp;<asp:Button ID="btnOk" runat="server" Text="Confirmar Recebimento" Width="30%" onclick="btnOk_Click" />
            </li>
        </ul>
    </div>
    <div style="width:100%; margin:20px 0 10px 10px;">
        <b><span style="margin-left:10px;margin-right:5px; font-size:small; font-style:normal;">Lista de Produtos Deste Pedido:</span></b>
    </div>
    <div class="scrollmini" style="width:95%; margin:0 0 20px 25px;">
        <asp:GridView ID="grProds" runat="server" AutoGenerateColumns="false" 
            HeaderStyle-BackColor="DarkBlue" Width="100%" Visible="false" RowStyle-Height="20px" 
             AlternatingRowStyle-BackColor="LightSteelBlue">
            <Columns>                                 
            <asp:BoundField HeaderText="Código" DataField="id_produto" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Nome do Produto" DataField="nm_produto" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="30%"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Valor Unitário" DataField="valunit" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="30%"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Quantidade" DataField="quant" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="15%"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>                               
            <asp:BoundField HeaderText="Valor Total" DataField="valor" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="30%"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>                               
            </Columns>
        </asp:GridView>
    </div>  
</asp:Content>