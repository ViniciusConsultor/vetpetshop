<%@ Page Title="" Language="C#" MasterPageFile="~/Vetpetshop.Master" AutoEventWireup="true" CodeBehind="RegistrarPagamentoConsulta.aspx.cs" Inherits="WebUI.RegistrarPagamentoConsulta" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<p><asp:Label ID="lblMsg" runat="server" Font-Bold="true" ForeColor="red"></asp:Label></p>
<br />
<asp:GridView ID="gdvConsultas" runat="server" AllowPaging="True" 
    AutoGenerateColumns="False" Width="100%" OnRowCommand="gdvConsultas_RowCommand" >
    <Columns>
    <asp:TemplateField>
    <ItemTemplate>
    <asp:LinkButton ID="registrar" runat="server" Text="Registrar" CommandName="registrar" CommandArgument='<%# Eval("id_consulta") %>'>
    </asp:LinkButton>
    </ItemTemplate>
    <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:BoundField DataField="id_consulta" visible="False">
    <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
        Wrap="False"/><ItemStyle HorizontalAlign="Center" Wrap="False"/>
        </asp:BoundField>
        <asp:BoundField DataField="nm_cliente" HeaderText="Proprietário" SortExpression="nm_cliente"><HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
        Wrap="False"/>
        <ItemStyle HorizontalAlign="Center" Wrap="False"/>
        </asp:BoundField>
        <asp:BoundField DataField="nm_animal" HeaderText="Animal" SortExpression="nm_animal">
        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
        Wrap="False"/>
        <ItemStyle HorizontalAlign="Center" Wrap="False"/>
        </asp:BoundField>
        <asp:BoundField HeaderText="Data da Consulta" DataField="dataconsulta">
        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
    Wrap="False" BackColor="DarkBlue"/><ItemStyle HorizontalAlign="Center" Wrap="False"/>
    </asp:BoundField>
    <asp:BoundField HeaderText="Valor" DataField="valor">
    <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
    Wrap="False" BackColor="DarkBlue"/>
    <ItemStyle HorizontalAlign="Center" Wrap="False"/>
    </asp:BoundField>
    <asp:BoundField HeaderText="Status" DataField="status">
    <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
    Wrap="False" BackColor="DarkBlue"/>
    <ItemStyle HorizontalAlign="Center" Wrap="False"/>
    </asp:BoundField>
    </Columns>
    <AlternatingRowStyle BackColor="LightSteelBlue" />
    <HeaderStyle BackColor="DarkBlue" />
    </asp:GridView>
    
    <asp:Panel runat="server" ID="pnPgConsulta" Visible="false">
    <table>
    <tr>
    <td style="width: 112px">
    Cliente especial? <br />
    <asp:RadioButtonList ID="rbCliente" runat="server" Width="50px">
    <asp:ListItem Text="Sim" Value="0"></asp:ListItem>
    <asp:ListItem Text="Não" Value="1" Selected="True"></asp:ListItem>
    </asp:RadioButtonList>
    </td> 
    <td style="width: 200px">Tipo de pagamento:<br />
    <asp:RadioButtonList ID="rbTipoPagamento" runat="server" Width="200px">
    <asp:ListItem Text="Dinheiro" Value="0"></asp:ListItem>
    <asp:ListItem Text="Cartão de crédito" Value="1"></asp:ListItem>
    <asp:ListItem Text="Cheque" Value="2"></asp:ListItem>
    </asp:RadioButtonList>
    </td>
    <td>
        <asp:Label ID="lblCli" Text="Nome Cliente:" runat="server" Visible="false"></asp:Label>
        <asp:TextBox runat="server" ID="txtNomeCli" Visible="false"></asp:TextBox>
        <asp:Panel runat="server" ID="espaco" Visible="false">
        <br />
        <br />
        <br />
        </asp:Panel>
        <asp:Label ID="lblParcela" Text="Nº Parcelas:" runat="server" Visible="false"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox runat="server" ID="txtParcelas" Visible="false"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td style="width: 112px">
    <asp:Button ID="btnEnviar" runat="server" Text="Ok" Width="90px" 
            onclick="btnEnviar_Click" />
    <asp:Button ID="btnConfirmar" runat="server" Text="Ok" Width="90px" 
            onclick="btnConfirmar_Click" Visible="false"/>
    </td>
    </tr>
    </table>    
    </asp:Panel>
    
</asp:Content>
