<%@ Page Title="" Language="C#" MasterPageFile="~/Vetpetshop.Master" AutoEventWireup="true" CodeBehind="RegistrarPagamentoConsulta.aspx.cs" Inherits="WebUI.RegistrarPagamentoConsulta" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>
    Registrar Pagamento de Consultas
</h3>
<table width="100%">
    <tr>
    <td></td>
    <td>
    </td>
    </tr>
    <tr>
        <td style="width:6%;">
            <asp:Label ID="lblBusca" runat="server" Text="Nome" Font-Bold="true"></asp:Label>
        </td>
        <td style="width:20%;">
            <asp:TextBox ID="txtBusca" runat="server" Width="100%"></asp:TextBox>
        </td>
        <td style="width:1%;"></td>
        <td>
            <asp:Button ID="BtnBuscar" runat="server" Text="Buscar" 
                onclick="BtnBuscar_Click" />
        </td>
     </tr>
     <tr>
     <td><br /></td>
     </tr>
</table>
<p><asp:Label ID="lblMsg" runat="server" Font-Bold="true" ForeColor="red"></asp:Label></p>
<center><asp:Label ID="lblRegistros" runat="server" Text="" Visible="false" Font-Bold="true"></asp:Label></center>
<div class="scroll">
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
    </div>
    <br /> 
    <asp:Panel runat="server" ID="pnPgConsulta" Visible="false">
    <table>
    <tr>
    <td style="width: 112px">
    Cliente especial? <br />
    <asp:RadioButtonList ID="rbCliente" runat="server" Width="50px" AutoPostBack="true" 
            onselectedindexchanged="rbCliente_SelectedIndexChanged">
    <asp:ListItem Text="Sim" Value="0"></asp:ListItem>
    <asp:ListItem Text="Não" Value="1" Selected="True"></asp:ListItem>
    </asp:RadioButtonList>
    </td> 
    <td style="width: 200px">Tipo de pagamento:<br />
    <asp:RadioButtonList ID="rbTipoPagamento" runat="server" Width="200px" 
            AutoPostBack="true" 
            onselectedindexchanged="rbTipoPagamento_SelectedIndexChanged">
    <asp:ListItem Text="Dinheiro" Value="0"></asp:ListItem>
    <asp:ListItem Text="Cartão de crédito" Value="1"></asp:ListItem>
    <asp:ListItem Text="Cheque" Value="2"></asp:ListItem>
    </asp:RadioButtonList>
    </td>
    <td>
        <asp:Label ID="lblCli" Text="Nome Cliente:" runat="server" Visible="false"></asp:Label>
        <asp:DropDownList ID="ddlClienteEspecial" runat="server" Width="250px" 
            Visible="false" AutoPostBack="true" 
            onselectedindexchanged="ddlClienteEspecial_SelectedIndexChanged"></asp:DropDownList><br /><br /><br />
            <asp:Label ID="lblDesconto" runat="server" Font-Bold="true" ForeColor="Blue"></asp:Label>&nbsp;&nbsp;&nbsp;<asp:Label ID="lblTotal" runat="server" Font-Bold="true" ForeColor="Blue"></asp:Label>
        <asp:Panel runat="server" ID="espaco" Visible="false">
        <br />
        <br />
        <br />
        
        </asp:Panel>
        <br />
        <br />
        <asp:Label ID="lblParcela" Text="Nº Parcelas:" runat="server" Visible="false"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox runat="server" ID="txtParcelas" Visible="false"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td style="width: 112px">
   <!-- <asp:Button ID="btnEnviar" runat="server" Text="Ok" Width="90px" 
            onclick="btnEnviar_Click" /> -->
    <asp:Button ID="btnConfirmar" runat="server" Text="Finalizar Registro" Width="110px" 
            onclick="btnConfirmar_Click"/>
    </td>
    </tr>
    </table>    
    </asp:Panel>   
</asp:Content>
