<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="AgendarConsulta.aspx.cs" Inherits="WebUI.AgendarConsulta" %>

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
                        <td style="height: 23px; width: 690px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                        </td>
                        <td style="height: 23px; width: 690px">
                            Cliente</td>
                        <td style="height: 23px; width: 500px">
                          <asp:DropDownList ID="ddlClientes" runat="server" AutoPostBack="true" 
                                width="220px" onselectedindexchanged="ddlClientes_SelectedIndexChanged"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 690px">
                            Animal</td>
                            <td style="width: 500px; height: 23px">
                          <asp:DropDownList Enabled="False" ID="ddlAnimal" runat="server" AutoPostBack="true" 
                                width="220px" onselectedindexchanged="ddlAnimal_SelectedIndexChanged"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 690px">
                            Data do agendamento</td>
                            <td style="width: 500px; height: 23px">
                         <asp:TextBox ID="txtData" runat="server" Width="189px" onblur="TestaField(this)" onfocus="inField()" MaxLength="10" Tipo="DATE"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 690px">
                            Valor da consulta</td>
                            <td style="width: 500px; height: 23px">
                         <asp:TextBox ID="txtValor" runat="server" Width="189px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 690px">
                            Status da consulta</td>
                            <td style="width: 500px; height: 23px">
                                <asp:RadioButtonList ID="rblStatus" runat="server" RepeatColumns="3" 
                                    Enabled="False">
                                <asp:ListItem Text="Agendada" Selected="True" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Desmarcada" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Finalizada" Value="2"></asp:ListItem>
                                </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td colspan="3" style="height: 23px; ">
                            <br />
                            <asp:Panel ID="pnlAnimal" Visible="false" runat="server" Width="100%">
                                <asp:GridView ID="gdvAnimal" runat="server" AutoGenerateColumns="false" 
                                    HeaderStyle-BackColor="DarkBlue" Width="100%" AllowPaging="True" 
                                    PageSize="10">
                                    <Columns>
                                        <asp:BoundField DataField="id_consulta" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White"  Visible="false">
                                             <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                                            Wrap="False"/>
                                            <ItemStyle HorizontalAlign="Center" Wrap="false"/>
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Data da Consulta" DataField="dataconsulta" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                                             <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                                            Wrap="False"/>
                                            <ItemStyle HorizontalAlign="Center" Wrap="false"/>
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Status" DataField="status" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                                             <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                                            Wrap="False"/>
                                            <ItemStyle HorizontalAlign="Center" Wrap="false"/>
                                        </asp:BoundField> 
                                        <asp:BoundField HeaderText="Valor" DataField="valor" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                                             <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                                            Wrap="False"/>
                                            <ItemStyle HorizontalAlign="Center" Wrap="false"/>
                                        </asp:BoundField>                        
                                    </Columns>
                                <HeaderStyle BackColor="DarkBlue"></HeaderStyle>
                                <AlternatingRowStyle BackColor="LightSteelBlue" />
                                </asp:GridView>    
                            </asp:Panel>    
                        </td>
                        <td style="height: 23px; width: 518px">
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 690px">
                        </td>
                        <td align="center" style="height: 23px; width: 500px">
                            <asp:Button ID="btnAgendar" runat="server" Text="Agendar Consulta" 
                                onclick="btnAgendar_Click" />
                            &nbsp;
                            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" 
                                onclick="btnCancelar_Click" />
                        </td>                                        
                    </tr>
                    <tr>
                        <td style="width: 58px">
                            </td>
                        <td style="width: 690px">
                            </td>
                        <td style="width: 500px">
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