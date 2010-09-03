<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="RecebimentoPedidoDeCompra.aspx.cs" Inherits="WebUI.RecebimentoPedidoDeCompra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td colspan="2">
                <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 133px; height: 17px;">
                </td>
            <td style="height: 17px">
                </td>
        </tr>
        <tr>
            <td style="height: 20px; width: 133px">
                         
                        &nbsp;Código
                            &nbsp;</td>
            <td style="height: 20px">
                <asp:Label ID="lblCodigo" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 133px">
                &nbsp;Data de Cadastro&nbsp;</td>
            <td>
                <asp:Label ID="lblData" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 133px">
                &nbsp;Valor Total&nbsp;</td>
            <td>
                <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 133px">
                &nbsp;Status</td>
            <td>
                <asp:Label ID="lblStatus" runat="server" Text="" Font-Bold="true"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 133px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 133px">
                &nbsp;Status &nbsp;</td>
            <td>
                <asp:DropDownList ID="ddlStatus" runat="server" Width="100px" 
                    onselectedindexchanged="ddlStatus_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnOk" runat="server" 
                    Text="Registrar Recebimento de Pedido" onclick="btnOk_Click" />
            </td>
        </tr>
        <tr>
            <td style="width: 133px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;<b>Lista de produtos cadastrados</b></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
            <asp:GridView ID="grProds" runat="server" AutoGenerateColumns="false" 
                                HeaderStyle-BackColor="DarkBlue" Width="100%" Visible="false" 
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
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>



</asp:Content>