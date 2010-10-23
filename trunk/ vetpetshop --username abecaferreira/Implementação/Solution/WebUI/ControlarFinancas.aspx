﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="ControlarFinancas.aspx.cs" Inherits="WebUI.ControlarFinancas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3></h3>
  <table width="100%">
    <tr>
    <td colspan="3">
    <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label>
    </td>
    <td style="width: 15%">        
    </td>
    </tr>
    <tr>
        <td style="width:15%;">
            <asp:Label ID="ano" runat="server" Text="Ano"></asp:Label>            
        &nbsp;de referência</td>
        <td style="width:15%;">
        <asp:DropDownList ID="ddlAno" runat="server"></asp:DropDownList>
        </td>
        <td>
            <asp:Button ID="BtnBuscar" runat="server" Text="Consultar" 
                onclick="BtnBuscar_Click" />
        </td>
     </tr>
     <tr>
     <td style="width: 15%"><br /></td>
     </tr>
  </table>
  <asp:Panel ID="PanelFinancas" runat="server" Visible="false">
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
                <td style="width: 98px">
                   <asp:Label ID="invest" runat="server" ForeColor="Blue" Text="Investimento"></asp:Label>
                </td>
                <td>
                   <asp:Label ID="venda" runat="server" ForeColor="Blue" Text="Vendas"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="estoque" runat="server" ForeColor="Blue" Text="Estoque"></asp:Label>
                </td>
                 <td>
                    <asp:Label ID="lucro" runat="server" ForeColor="Blue" Text="Lucro"></asp:Label>
                </td>
                 <td>
                    <asp:Label ID="valoareceber" runat="server" ForeColor="Blue" Text="Valor a Receber"></asp:Label>
                </td>
            </tr>
            
            <tr>
                <td>
                    Janeiro
                </td>
                <td style="width: 98px">
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
                <td style="width: 98px">
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
                <td style="width: 98px">
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
                <td style="width: 98px">
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
               <td style="width: 98px">
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
                <td style="width: 98px">
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
                <td style="width: 98px">
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
                <td style="width: 98px">
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
               <td style="width: 98px">
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
                <td style="width: 98px">
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
                <td style="width: 98px">
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
               <td style="width: 98px">
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
                    <asp:Label ID="Total" runat="server" Text="Total R$" Font-Bold="True" ForeColor="Blue"></asp:Label>
                </td>
                <td style="width: 98px">
                    <asp:Label ID="lblTotaInvest" runat="server" ForeColor="Blue"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblTotalVendas" runat="server" ForeColor="Blue"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblTotalEstoque" runat="server" ForeColor="Blue"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblTotalLucro" runat="server" ForeColor="Blue"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblTotalValor" runat="server" ForeColor="Blue"></asp:Label>
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
                <td style="width: 140px">
                    <asp:Label ID="lblConsultas" runat="server" ForeColor="Blue" Text="Consultas"></asp:Label>
                </td>
                <td style="width: 123px">
                    <asp:Label ID="lblVacinas" runat="server" ForeColor="Blue" Text="Vacinas"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblFaturamento" runat="server" ForeColor="Blue" Text="Faturamento"></asp:Label>
                </td>
            </tr>
            
            <tr>
                <td>
                    Janeiro
                </td>
                <td style="width: 140px">
                    <asp:Label ID="lblConsJan" runat="server"></asp:Label>
                </td>
                <td style="width: 123px">
                    <asp:Label ID="lblVacJan" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblFatJan" runat="server"></asp:Label>
                </td>               
            </tr>
            <tr>
                <td>
                    Fevereiro
                </td>
                <td style="width: 140px">
                    <asp:Label ID="lblConsFev" runat="server"></asp:Label>
                </td>
                <td style="width: 123px">
                    <asp:Label ID="lblVacFev" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblFatFev" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Março
                </td>
                <td style="width: 140px">
                    <asp:Label ID="lblConsMar" runat="server"></asp:Label>
                </td>
                <td style="width: 123px">
                    <asp:Label ID="lblVacMar" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblFatMar" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Abril
                </td>
                <td style="width: 140px">
                    <asp:Label ID="lblConsAbr" runat="server"></asp:Label>
                </td>
                <td style="width: 123px">
                    <asp:Label ID="lblVacAbr" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblFatAbr" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Maio
                </td>
               <td style="width: 140px">
                    <asp:Label ID="lblConsMai" runat="server"></asp:Label>
                </td>
                <td style="width: 123px">
                    <asp:Label ID="lblVacMai" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblFatMai" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Junho
                </td>
                <td style="width: 140px">
                    <asp:Label ID="lblConsJun" runat="server"></asp:Label>
                </td>
                <td style="width: 123px">
                    <asp:Label ID="lblVacJun" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblFatJun" runat="server"></asp:Label>
                </td>                
             </tr>
                <tr>
                <td>
                    Julho
                </td>
                <td style="width: 140px">
                    <asp:Label ID="lblConsJul" runat="server"></asp:Label>
                </td>
                <td style="width: 123px">
                    <asp:Label ID="lblVacJul" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblFatJul" runat="server"></asp:Label>
                </td>
              </tr>
                <tr>
                <td>
                    Agosto
                </td>
                <td style="width: 140px">
                    <asp:Label ID="lblConsAgo" runat="server"></asp:Label>
                </td>
                <td style="width: 123px">
                    <asp:Label ID="lblVacAgo" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblFatAgo" runat="server"></asp:Label>
                </td>
             </tr>
                <tr>
                <td>
                    Setembro
                </td>
               <td style="width: 140px">
                    <asp:Label ID="lblConsSet" runat="server"></asp:Label>
                </td>
                <td style="width: 123px">
                    <asp:Label ID="lblVacSet" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblFatSet" runat="server"></asp:Label>
                </td>                
            </tr>
             <tr>
                <td>
                    Outubro
                </td>
                <td style="width: 140px">
                    <asp:Label ID="lblConsOut" runat="server"></asp:Label>
                </td>
                <td style="width: 123px">
                    <asp:Label ID="lblVacOut" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblFatOut" runat="server"></asp:Label>
                </td>
            </tr>
             <tr>
                <td>
                    Novembro
                </td>
                <td style="width: 140px">
                    <asp:Label ID="lblConsNov" runat="server"></asp:Label>
                </td>
                <td style="width: 123px">
                    <asp:Label ID="lblVacNov" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblFatNov" runat="server"></asp:Label>
                </td>
            </tr>
             <tr>
                <td>
                    Dezembro
                </td>
               <td style="width: 140px">
                    <asp:Label ID="lblConsDez" runat="server"></asp:Label>
                </td>
                <td style="width: 123px">
                    <asp:Label ID="lblVacDez" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblFatDez" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTotal" runat="server" Text="Total R$" Font-Bold="True" 
                        ForeColor="Blue"></asp:Label>
                </td>
                <td style="width: 140px">
                    <asp:Label ID="lblTotalCons" runat="server" ForeColor="Blue"></asp:Label>
                </td>
                <td style="width: 123px">
                    <asp:Label ID="lblTotalVac" runat="server" ForeColor="Blue"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblTotalFat" runat="server" ForeColor="Blue"></asp:Label>
                </td>
            </tr>
        </table>
        </asp:Panel>
        </div>
  </ContentTemplate>
  </asp:TabPanel>
  </asp:TabContainer> 
  </asp:Panel>
  <br /><br /><br /><br />
 </asp:Content>
