<%@ Page Title="" Language="C#" MasterPageFile="~/Vetpetshop.Master" AutoEventWireup="true" CodeBehind="ConsultarEstatisticas.aspx.cs" Inherits="WebUI.ConsultarEstatisticas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>
    Consultar Estatísticas
</h3>
<table width="100%">
    <tr>
    <td colspan="3">
    <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label>
    </td>
    <td style="width: 15%">        
    </td>
    </tr>
     <tr>
     <td style="width: 15%"><br /></td>
     </tr>
  </table>
<asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
  <asp:TabPanel ID="tabPanel1" runat="server">
  <HeaderTemplate>
    <b>Petshop</b>
  </HeaderTemplate>
  <ContentTemplate>
    <div id="div1" style="padding-top:10px; padding-bottom:10px;">
            <table width="100%">
                <tr>
                <td style="width:5%;">
                    <asp:Label ID="op1" runat="server" Text="Opção"></asp:Label>            
                &nbsp;</td>
                <td style="width:15%;">
                <asp:DropDownList ID="ddlPetOpcoes" runat="server" AutoPostBack="True" onselectedindexchanged="ddlPetOpcoes_SelectedIndexChanged">
                    <asp:ListItem Text="Selecione"></asp:ListItem>
                    <asp:ListItem Value="1" Text="Tipos de Produtos Vendidos"></asp:ListItem>
                </asp:DropDownList>
                </td>
                <td>
                </td>
             </tr>
             <tr>
             <td><br /></td>
             </tr>
          </table>
        <asp:Panel ID="PnDataPet" runat="server" Visible="False">
           &nbsp;<asp:Label ID="Label1" runat="server" Text="De"></asp:Label>
           <asp:TextBox ID="txtDataInicioPet" runat="server" Width="10%" MaxLength="10"></asp:TextBox>
           <asp:Label ID="Label2" runat="server" Text="Até"></asp:Label>
           <asp:TextBox ID="txtDataFimPet" runat="server" Width="10%" MaxLength="10"></asp:TextBox>
           &nbsp;<asp:Button ID="btnOkPet" runat="server" Text="Buscar" onclick="btnOkPet_Click" />              
        </asp:Panel>
        <asp:Panel ID="PnPet" runat="server" Visible="false"></asp:Panel>
    </div>
  </ContentTemplate>
  </asp:TabPanel>
  <asp:TabPanel ID="tabPanel2" runat="server">
  <HeaderTemplate>
    <b>Consultório</b>
  </HeaderTemplate>
  <ContentTemplate>
        <div id="div2" style="padding-top:10px; padding-bottom:10px;">
            <table width="100%">
            <tr>
                <td style="width:5%;">
                    <asp:Label ID="op2" runat="server" Text="Opção"></asp:Label>            
                &nbsp;</td>
                <td style="width:15%;">
                <asp:DropDownList ID="ddlVetOpcoes" runat="server" AutoPostBack="True" onselectedindexchanged="ddlVetOpcoes_SelectedIndexChanged">
                    <asp:ListItem Value="" Text="Selecione"></asp:ListItem>
                    <asp:ListItem Value="1" Text="Sexo Clientes Cadastrados"></asp:ListItem>
                    <asp:ListItem Value="2" Text="Sexo Animais Cadastrados"></asp:ListItem>
                </asp:DropDownList>
                </td>
                <td>
                </td>
             </tr>
             <tr>
             <td><br /></td>
             </tr>
          </table>
            <asp:Panel ID="PnDataVet" runat="server" Visible="false">
               &nbsp;<asp:Label ID="Label3" runat="server" Text="De"></asp:Label>
               <asp:TextBox ID="txtDataInicioVet" runat="server" Width="10%" MaxLength="10"></asp:TextBox>
               <asp:Label ID="Label4" runat="server" Text="Até"></asp:Label>
               <asp:TextBox ID="txtDataFimVet" runat="server" Width="10%" MaxLength="10"></asp:TextBox>
               &nbsp;<asp:Button ID="BtnOkVet" runat="server" Text="Buscar" onclick="btnOkVet_Click" />              
            </asp:Panel>
            <br />
            <asp:Panel ID="PnVetSexoCliente" runat="server" Visible="false">
                &nbsp;<asp:Label runat="server" ID="Label5" Text="Total Clientes:"></asp:Label>&nbsp;&nbsp;&nbsp;
                &nbsp;<asp:Label runat="server" ID="Label6"></asp:Label>
                <br />
                &nbsp;<asp:Label runat="server" ID="Label7" Text="Total Homens:"></asp:Label>&nbsp;&nbsp;&nbsp;
                &nbsp;<asp:Label runat="server" ID="Label8"></asp:Label>
                <br />
                &nbsp;<asp:Label runat="server" ID="Label9" Text="Total Mulheres:"></asp:Label>&nbsp;&nbsp;
                &nbsp;<asp:Label runat="server" ID="Label10"></asp:Label>
            </asp:Panel>
            <asp:Panel ID="PnVetSexoAnimal" runat="server" Visible="false">
                &nbsp;<asp:Label runat="server" ID="Label11" Text="Total Animais:"></asp:Label>&nbsp;
                &nbsp;<asp:Label runat="server" ID="Label12"></asp:Label>
                <br />
                &nbsp;<asp:Label runat="server" ID="Label13" Text="Total Macho:"></asp:Label>&nbsp;&nbsp;
                &nbsp;<asp:Label runat="server" ID="Label14"></asp:Label>
                <br />
                &nbsp;<asp:Label runat="server" ID="Label15" Text="Total Fêmea:"></asp:Label>&nbsp;&nbsp;
                &nbsp;<asp:Label runat="server" ID="Label16"></asp:Label>
            </asp:Panel>
        </div>
  </ContentTemplate>
  </asp:TabPanel>
  </asp:TabContainer>
</asp:Content>
