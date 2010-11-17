<%@ Page Title="" Language="C#" MasterPageFile="~/Vetpetshop.Master" AutoEventWireup="true" CodeBehind="RegistrarPagamentoConsulta.aspx.cs" Inherits="WebUI.RegistrarPagamentoConsulta" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>
    Registrar Pagamento de Consultas
    </h3>
    <div style="width:100%;margin: 10px 10px 10px 20px;">
        <ul>
            <li>
                <asp:Label ID="lblMsg" runat="server" Font-Bold="true" ForeColor="red"></asp:Label>
            </li>
        </ul>    
    </div>
    <div style="margin: 10px 10px 10px 20px; width:95%;">
        <ul style="margin-top:10px;">
            <li style="margin-bottom:10px;">
                <span style="margin-left:0px;margin-right:10px;">Nome:</span>         
                <asp:TextBox ID="txtBusca" runat="server" Width="250px" MaxLength="50"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;<asp:Button Width="10%" ID="BtnBuscar" runat="server" Text="Buscar" onclick="BtnBuscar_Click" />
            </li>
        </ul>
        
<center><asp:Label ID="lblRegistros" runat="server" Text="" Visible="false" Font-Bold="true"></asp:Label></center>
<div class="scroll" style="margin: 10px 0 10px 0;">
    <asp:GridView ID="gdvConsultas" runat="server" AllowPaging="false" 
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
    
    <asp:Panel runat="server" ID="pnPgConsulta" Visible="false">
    <div style="margin: 10px 5px 10px 5px; width:100%;">
        <ul style="margin-top:10px;">
            <li style="margin-bottom:10px; margin-left:5px;">
                <asp:Label ID="lblDesconto" runat="server" Font-Bold="true" ForeColor="Blue"></asp:Label>
                &nbsp;
                <asp:Label ID="lblTotal" runat="server" Font-Bold="true" ForeColor="Blue"></asp:Label>
            </li>
            <li style="margin-bottom:10px; margin-left:5px;">
                <div style="border:1px solid #b9b9b9; width:20%;">
                    <span style="margin-left:0px;margin-right:10px;">Cliente especial?</span>
                    <asp:RadioButtonList ID="rbCliente" runat="server" Width="100%" AutoPostBack="true" onselectedindexchanged="rbCliente_SelectedIndexChanged">
                    <asp:ListItem Text="Sim" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Não" Value="1" Selected="True"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </li>
            <li style="margin-bottom:10px; margin-left:5px;">
                <div style="border:1px solid #b9b9b9; width:20%;">
                    <span style="margin-left:0px;margin-right:10px;">Tipo de pagamento:</span>
                    <asp:RadioButtonList ID="rbTipoPagamento" runat="server" Width="100%" AutoPostBack="true" onselectedindexchanged="rbTipoPagamento_SelectedIndexChanged">
                        <asp:ListItem Text="Dinheiro" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Cartão de crédito" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Cheque" Value="2"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </li>
            <li style="margin-bottom:10px; margin-left:5px;">
                <asp:Label ID="lblCli" Text="Nome Cliente:" runat="server" Visible="false"></asp:Label>&nbsp;
                <asp:DropDownList ID="ddlClienteEspecial" runat="server" Width="450px" Visible="false" AutoPostBack="true" onselectedindexchanged="ddlClienteEspecial_SelectedIndexChanged"></asp:DropDownList>
            </li>
            <li style="margin-bottom:10px; margin-left:16px;">
                <asp:Label ID="lblParcela" Text="Nº Parcelas:" runat="server" Visible="false"></asp:Label>&nbsp;
                <asp:TextBox runat="server" ID="txtParcelas" Visible="false" Width="100px" MaxLength="3"></asp:TextBox>
            </li>
         </ul>
         <div style="margin: 10px 0px 5px 40%;">
            <asp:Button ID="btnConfirmar" runat="server" Text="Finalizar" Width="20%" onclick="btnConfirmar_Click"/>
         </div>
      </div>                
     </asp:Panel>
    </div>  
</asp:Content>
