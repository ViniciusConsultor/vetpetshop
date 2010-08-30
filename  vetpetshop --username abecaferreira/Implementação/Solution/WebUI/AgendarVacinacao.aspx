<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="AgendarVacinacao.aspx.cs" Inherits="WebUI.AgendarVacinacao" %>
    
    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <table style="width:100%;">
        <tr>
            <td style="width: 863px">
                <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label>
            </td>
            <td style="width: 80px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 246px; width: 863px">
                <table style="width: 100%; height: 228px;">
                    <tr>
                        <td style="width: 58px; height: 23px">
                        </td>
                        <td style="height: 23px; width: 555px">
                            <asp:ObjectDataSource ID="odsListarAnimais" runat="server" 
                                SelectMethod="ListarAnimaisTodos" TypeName="Negocios.AnimalBuss">
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                        </td>
                        <td style="height: 23px; width: 555px">
                            Cliente</td>
                        <td style="height: 23px; width: 669px">
                          <asp:DropDownList ID="ddlClientes" runat="server" AutoPostBack="true" 
                                width="220px" onselectedindexchanged="ddlClientes_SelectedIndexChanged"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 555px">
                            Animal</td>
                            <td style="width: 669px; height: 23px">
                          <asp:DropDownList Enabled="False" ID="ddlAnimal" runat="server" AutoPostBack="true" 
                                width="220px" onselectedindexchanged="ddlAnimal_SelectedIndexChanged"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 555px">
                            Data da próxima vacinação</td>
                            <td style="width: 669px; height: 23px">
                         <asp:TextBox ID="txtDataProx" runat="server" Width="189px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td colspan="3" style="height: 23px; ">
                            &nbsp;</td>
                    </tr>
                     <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td colspan="3" style="height: 23px; ">
                        <asp:Panel ID="pnlAnimal" Visible="false" runat="server" Width="100%">
                            <asp:GridView ID="gdvAnimal" runat="server" AutoGenerateColumns="false" 
                                HeaderStyle-BackColor="DarkBlue" Width="100%" AllowPaging="True" 
                                PageSize="10">
                                <Columns>
                                    <asp:BoundField DataField="id_animal" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White"  Visible="false">
                                        <HeaderStyle BackColor="DarkBlue" ForeColor="White"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Nome do animal" DataField="nm_animal" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}" htmlencode="false">
                                        <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="20%"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Raça" DataField="raca" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                                        <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="20%" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Peso" DataField="peso" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                                        <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="40%" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Data de Nascimento" DataField="nascimento" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                                        <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="15%" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>                        
                                    <asp:BoundField HeaderText="Data da próxima vacinação" DataField="dataproxvacinacao" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                                        <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="10%" HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>                         
                                </Columns>
                            <HeaderStyle BackColor="DarkBlue"></HeaderStyle>
                            </asp:GridView>    
                        </asp:Panel>
                        <asp:Panel ID="pnlListagem" runat="server" Visible="false" Width="100%">
                            <asp:GridView ID="gdvAnimais" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" DataSourceID="odsListarAnimais" 
                                HeaderStyle-BackColor="DarkBlue" PageSize="15" Width="100%" >
                                <Columns>
                                    <asp:BoundField DataField="id_animal" SortExpression="Id" Visible="false"/>
                                     <asp:BoundField DataField="nm_animal" HeaderText="Nome" SortExpression="nm_animal">
                                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                                            Wrap="False"/>
                                        <ItemStyle HorizontalAlign="Center" Wrap="False"/>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="raca" HeaderText="Raça" SortExpression="raca" >
                                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                                            Wrap="False"/>
                                        <ItemStyle HorizontalAlign="Center" Wrap="False"/>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="peso" HeaderText="Peso" SortExpression="peso">
                                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                                            Wrap="False"/>
                                        <ItemStyle HorizontalAlign="Center" Wrap="False"/>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nascimento" HeaderText="Nascimento" SortExpression="Nascimento">
                                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                                            Wrap="False"/>
                                        <ItemStyle HorizontalAlign="Center" Wrap="False"/>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="dataproxvacinacao" HeaderText="Data da próxima vacinação" SortExpression="Nascimento">
                                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                                            Wrap="False"/>
                                        <ItemStyle HorizontalAlign="Center" Wrap="False"/>
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle BackColor="DarkBlue" />
                            </asp:GridView>
                        </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 555px">
                        </td>
                        <td align="center" style="height: 23px; width: 669px">
                            <asp:Button ID="btnAgendar" runat="server" Text="Agendar" 
                                onclick="btnAgendar_Click" />
                            &nbsp;
                            <asp:Button ID="btnExcluir" runat="server" Text="Excluir" 
                                onclick="btnExcluir_Click" />
                            &nbsp;
                            <asp:Button ID="btnVisualizar" runat="server" Text="Agendamentos" 
                                onclick="btnVisualizar_Click"/>
                            &nbsp;
                            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" 
                                onclick="btnCancelar_Click" />                            
                        </td>                                        
                    </tr>
                    <tr>
                        <td style="width: 58px">
                            </td>
                        <td style="width: 555px">
                            </td>
                        <td style="width: 669px">
                            </td>
                        <td style="width: 138px">
                            </td>
                    </tr>
                </table>
            </td>
            <td style="height: 246px; width: 80px">
            </td>
            <td style="height: 246px">
            </td>
        </tr>
        <tr>
            <td style="width: 863px">
                &nbsp;</td>
            <td style="width: 80px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
