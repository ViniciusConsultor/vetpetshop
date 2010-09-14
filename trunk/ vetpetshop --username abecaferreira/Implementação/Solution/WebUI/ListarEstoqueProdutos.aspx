<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="ListarEstoqueProdutos.aspx.cs" Inherits="WebUI.ListarEstoqueProdutos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:115%;">
        <tr>
            <td style="width: 863px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 863px">
                Listar por&nbsp;&nbsp;
                <asp:DropDownList ID="ddlTipo" runat="server" Width="140px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 863px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 863px; height: 24px;">
                <table style="width:100%;">
                    <tr>
                        <td style="width: 145px" class="style2">
                            Estoque mínimo/crítico
                        </td>
                        <td style="width: 35px; background-color:#ffd700;">
                            &nbsp;</td>
                        <td style="width: 127px">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Estoque médio</td>
                        <td style="width: 35px; background-color:#FFFF99;">
                            &nbsp;</td>
                        <td style="width: 137px">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Estoque máximo</td>
                        <td style="width: 35px; background-color:#33CC66;">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 145px" class="style2">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td style="width: 127px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td style="width: 137px">
                            &nbsp;</td>
                        <td">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                </td>            
                
        </tr>
        <tr>
            <td style="width: 863px">
                <b>Lista de Estoque de Produtos</b></td>
        </tr>
        <tr>
            <td style="height: 246px; width: 863px">
                <table style="width: 100%; height: 228px;">
                    <tr>
                        <td style="width: 100%; height: 23px">
                         <asp:GridView ID="grEstoque" runat="server" AutoGenerateColumns="false" 
                                HeaderStyle-BackColor="DarkBlue" Width="100%"  
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
                                <asp:BoundField HeaderText="Nome do Produto" DataField="nm_produto" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                                <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="15%"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Estoque Mínimo Mensal" DataField="min" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                                <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="15%"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Estoque Máximo Mensal" DataField="max" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                                <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="15%"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>                               
                                <asp:BoundField HeaderText="Quantidade em Estoque" DataField="quantidade" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                                <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="15%"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>        
                                </Columns>
                                </asp:GridView>
                        
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px">
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 863px">
                &nbsp;</td>
        </tr>
    </table>



</asp:Content>