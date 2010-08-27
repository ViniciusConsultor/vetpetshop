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
                        <td style="height: 23px; width: 710px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                        </td>
                        <td style="height: 23px; width: 710px">
                            Selecione o dono do animal</td>
                        <td style="height: 23px; width: 392px">
                          <asp:DropDownList ID="ddlClientes" runat="server" AutoPostBack="true" 
                                width="189px" onselectedindexchanged="ddlClientes_SelectedIndexChanged"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 710px">
                            Selecione o animal</td>
                            <td style="width: 58px; height: 23px">
                          <asp:DropDownList visible="false" ID="ddlAnimal" runat="server" AutoPostBack="true" 
                                width="189px" onselectedindexchanged="ddlTdsClientes_SelectedIndexChanged" 
                                    Enabled="False"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 710px">
                            Data do agendamento</td>
                            <td style="width: 58px; height: 23px">
                         <asp:TextBox ID="txtData" runat="server" Width="189px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 710px">
                            Valor da consulta</td>
                            <td style="width: 58px; height: 23px">
                         <asp:TextBox ID="txtValor" runat="server" Width="189px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 710px">
                            Status</td>
                            <td style="width: 58px; height: 23px">
                                <asp:RadioButtonList ID="rblStatus" runat="server" RepeatColumns="3">
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
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 710px">
                        </td>
                        <td align="center" style="height: 23px; width: 392px">
                         <asp:Button  width="42%" ID="btnAgendar" runat="server" Text="Agendar Consulta" 
                            onclick="btnSalvar_Click" />&nbsp;
                        <asp:Button width="30%" ID="btnCancelar" runat="server" Text="Cancelar" 
                            onclick="btnCancelar_Click" />
                        </td>                                        
                    </tr>
                    <tr>
                        <td style="width: 58px">
                            </td>
                        <td style="width: 710px">
                            </td>
                        <td style="width: 392px">
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