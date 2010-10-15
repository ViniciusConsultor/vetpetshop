<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="ControlarFinancas.aspx.cs" Inherits="WebUI.ControlarFinancas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3></h3>
  <table width="100%">
    <tr>
    <td></td>
    <td style="width: 15%">
        <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label>
    </td>
    </tr>
    <tr>
        <td style="width:6%;">
            <asp:Label ID="ano" runat="server" Text="Ano"></asp:Label>            
        </td>
        <td style="width:15%;">
        <asp:DropDownList ID="ddlAno" runat="server"></asp:DropDownList>
        </td>
        <td style="width:1%;">
         <asp:Label ID="lblMes" runat="server" Text="Mês"></asp:Label> 
         </td>
        <td style="width:14%;">
        <asp:DropDownList ID="ddlMes" runat="server"></asp:DropDownList>
            &nbsp;</td>
        <td>
            <asp:Button ID="BtnBuscar" runat="server" Text="Consultar" 
                onclick="BtnBuscar_Click" />
        </td>
     </tr>
     <tr>
     <td><br /></td>
     </tr>
  </table>
  <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
  <asp:TabPanel ID="tabPanel1" runat="server">
  <HeaderTemplate>
    <b>Petshop</b>
  </HeaderTemplate>
  <ContentTemplate>
    <div id="divClientes">
        <asp:Panel ID="PanelAno" runat="server">
        <table style="width: 100%;">
            <tr>
                <td>
                    
                </td>
                <td>
                    Investimento
                </td>
                <td>
                    Vendas
                </td>
                <td>
                    Estoque
                </td>
                 <td>
                    Lucro
                </td>
                 <td>
                    Valor a Receber
                </td>
            </tr>
            
            <tr>
                <td>
                    Janeiro
                </td>
                <td>
                    <asp:Label ID="lblInvestimentoJan" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblVendasJan" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEstoqueJan" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLucroJan" runat="server"></asp:Label>
                </td>
                 <td>
                    <asp:Label ID="lblValorJan" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Fevereiro
                </td>
                <td>
                    <asp:Label ID="lblInvestimentoFev" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblVendasFev" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEstoqueFev" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLucroFev" runat="server"></asp:Label>
                </td>
                 <td>
                    <asp:Label ID="lblValorFev" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Março
                </td>
                <td>
                    <asp:Label ID="lblInvestimentoMar" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblVendasMar" runat="server"></asp:Label>
                </td>
                <td>
                   <asp:Label ID="lblEstoqueMar" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLucroMar" runat="server"></asp:Label>
                </td>
                 <td>
                    <asp:Label ID="lblValorMar" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Abril
                </td>
                <td>
                    <asp:Label ID="lblInvestimentoAbr" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblVendasAbr" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEstoqueAbr" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLucroAbr" runat="server"></asp:Label>
                </td>
                 <td>
                    <asp:Label ID="lblValorAbr" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Maio
                </td>
               <td>
                    <asp:Label ID="lblInvestimentoMai" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblVendasMai" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEstoqueMai" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLucroMai" runat="server"></asp:Label>
                </td>
                 <td>
                    <asp:Label ID="lblValorMai" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Junho
                </td>
                <td>
                    <asp:Label ID="lblInvestimentoJun" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblVendasJun" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEstoqueJun" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLucroJun" runat="server"></asp:Label>
                </td>
                 <td>
                    <asp:Label ID="lblValorJun" runat="server"></asp:Label>
                </td>
             </tr>
                <tr>
                <td>
                    Julho
                </td>
                <td>
                    <asp:Label ID="lblInvestimentoJul" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblVendasJul" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEstoqueJul" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLucroJul" runat="server"></asp:Label>
                </td>
                 <td>
                    <asp:Label ID="lblValorJul" runat="server"></asp:Label>
                </td>
              </tr>
                <tr>
                <td>
                    Agosto
                </td>
                <td>
                    <asp:Label ID="lblInvestimentoAgo" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblVendasAgo" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEstoqueAgo" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLucroAgo" runat="server"></asp:Label>
                </td>
                 <td>
                    <asp:Label ID="lblValorAgo" runat="server"></asp:Label>
                </td>
             </tr>
                <tr>
                <td>
                    Setembro
                </td>
               <td>
                    <asp:Label ID="lblInvestimentoSet" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblVendasSet" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEstoqueSet" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLucroSet" runat="server"></asp:Label>
                </td>
                 <td>
                    <asp:Label ID="lblValorSet" runat="server"></asp:Label>
                </td>
            </tr>
             <tr>
                <td>
                    Outubro
                </td>
                <td>
                    <asp:Label ID="lblInvestimentoOut" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblVendasOut" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEstoqueOut" runat="server"></asp:Label>
                </td>
                <td>
                   <asp:Label ID="lblLucroOut" runat="server"></asp:Label>
                </td>
                 <td>
                   <asp:Label ID="lblValotOut" runat="server"></asp:Label>
                </td>
            </tr>
             <tr>
                <td>
                    Novembro
                </td>
                <td>
                    <asp:Label ID="lblInvestimentoNov" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblVendasNov" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEstoqueNov" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLucroNov" runat="server"></asp:Label>
                </td>
                 <td>
                    <asp:Label ID="lblValorNov" runat="server"></asp:Label>
                </td>
            </tr>
             <tr>
                <td>
                    Dezembro
                </td>
               <td>
                    <asp:Label ID="lblInvestimentoDez" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblVendasDez" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEstoqueDez" runat="server"></asp:Label>
                </td>
                <td>
                   <asp:Label ID="lblLucroDez" runat="server"></asp:Label>
                </td>
                 <td>
                   <asp:Label ID="lblValorDez" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Total" runat="server" Text="Total" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblTotaInvest" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblTotalVendas" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblTotalEstoque" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblTotalLucro" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblTotalValor" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
           </asp:Panel>
        </div>
  </ContentTemplate>
  </asp:TabPanel>
  <asp:TabPanel ID="tabPanel2" runat="server">
  <HeaderTemplate>
    <b>Consultório</b>
  </HeaderTemplate>
  <ContentTemplate>
        <div id="divAnimais">
        <asp:Panel ID="AnoConsul" runat="server">
        <table style="width: 100%;">
            <tr>
                <td>
                    
                </td>
                <td>
                    Investimento
                </td>
                <td>
                    Vendas
                </td>
                <td>
                    Estoques
                </td>
                 <td>
                    Lucro
                </td>
                 <td>
                    Valor a Receber
                </td>
            </tr>
            
            <tr>
                <td>
                    Janeiro
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                 <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    Fevereiro
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                 <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    Março
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                 <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    Abril
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                 <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    Maio
                </td>
               <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                 <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    Junho
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                 <td>
                    &nbsp;
                </td>
             </tr>
                <tr>
                <td>
                    Julho
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                 <td>
                    &nbsp;
                </td>
              </tr>
                <tr>
                <td>
                    Agosto
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                 <td>
                    &nbsp;
                </td>
             </tr>
                <tr>
                <td>
                    Setembro
                </td>
               <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                 <td>
                    &nbsp;
                </td>
            </tr>
             <tr>
                <td>
                    Outubro
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                 <td>
                    &nbsp;
                </td>
            </tr>
             <tr>
                <td>
                    Novembro
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                 <td>
                    &nbsp;
                </td>
            </tr>
             <tr>
                <td>
                    Dezembro
                </td>
               <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                 <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Total" Font-Bold="true"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
        </asp:Panel>
        </div>
  </ContentTemplate>
  </asp:TabPanel>
  </asp:TabContainer> 
  <br /><br /><br /><br />
 </asp:Content>
