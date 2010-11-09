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
    <div id="div1" style="padding-top:10px; padding-bottom:10px;padding-left:10px;">
            <table width="100%">
                <tr>
                <td style="width:5%;">
                    <asp:Label ID="op1" runat="server" Text="Opção"></asp:Label>            
                &nbsp;</td>
                <td style="width:15%;">
                <asp:DropDownList ID="ddlPetOpcoes" runat="server" AutoPostBack="True" onselectedindexchanged="ddlPetOpcoes_SelectedIndexChanged">
                    <asp:ListItem Text="Selecione"></asp:ListItem>
                    <asp:ListItem Value="1" Text="Produtos Vendidos"></asp:ListItem>
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
        <div id="div2" style="padding-top:10px; padding-bottom:10px; padding-left:10px;">
            <table width="100%">
            <tr>
                <td style="width:5%;">
                    <asp:Label ID="op2" runat="server" Text="Opção"></asp:Label>            
                &nbsp;</td>
                <td style="width:15%;">
                <asp:DropDownList ID="ddlVetOpcoes" runat="server" AutoPostBack="True" onselectedindexchanged="ddlVetOpcoes_SelectedIndexChanged">
                    <asp:ListItem Value="" Text="Selecione"></asp:ListItem>
                    <asp:ListItem Value="1" Text="Clientes Cadastrados"></asp:ListItem>
                    <asp:ListItem Value="2" Text="Animais Cadastrados"></asp:ListItem>
                    <asp:ListItem Value="3" Text="Consultas Realizadas"></asp:ListItem>
                    <asp:ListItem Value="4" Text="Vacinas Realizadas"></asp:ListItem>
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
                <table width="100%">
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label5" Text="Total Clientes:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label6"></asp:Label>
                        </td>
                        <td style="width:80%;"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label7" Text="Total Homens:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label8"></asp:Label>
                        </td>
                        <td style="width:80%;"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label9" Text="Total Mulheres:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label10"></asp:Label>                
                        </td>
                        <td style="width:80%;"></td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="PnVetSexoAnimal" runat="server" Visible="false">
                <table width="100%">
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label11" Text="Total Animais:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label12"></asp:Label>
                        </td>
                        <td style="width:80%;"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label13" Text="Total Macho:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label14"></asp:Label>
                        </td>
                        <td style="width:80%;"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label15" Text="Total Fêmea:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label16"></asp:Label>
                        </td>
                        <td style="width:80%;"></td>
                    </tr>
                 </table>
            </asp:Panel>
            <asp:Panel ID="PnVetConsultas" runat="server" Visible="false">
                <table width="100%">
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label17" Text="Total Consultas:"></asp:Label>&nbsp;
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label18"></asp:Label>
                        </td>
                        <td style="width:70%;"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label19" Text="Consultas de Cães:"></asp:Label>&nbsp;
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label20"></asp:Label>
                        </td>
                        <td style="width:70%;"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label21" Text="Consultas de Gatos:"></asp:Label>&nbsp;
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label22"></asp:Label>
                        </td>
                        <td style="width:70%;"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label23" Text="Consultas de Peixes:"></asp:Label>&nbsp;
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label24"></asp:Label>
                        </td>
                        <td style="width:70%;"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label25" Text="Consultas de Pássaros:"></asp:Label>&nbsp;
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label26"></asp:Label>
                        </td>
                        <td style="width:70%;"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label27" Text="Consultas de Roedores:"></asp:Label>&nbsp;
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label28"></asp:Label>
                        </td>
                        <td style="width:70%;"></td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="PnVetVacinas" runat="server" Visible="false">
                <table width="100%">
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label29" Text="Total Vacinas:"></asp:Label>&nbsp;
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label30"></asp:Label>
                        </td>
                        <td style="width:70%;"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label31" Text="Vacinas de Cães:"></asp:Label>&nbsp;
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label32"></asp:Label>
                        </td>
                        <td style="width:70%;"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label33" Text="Vacinas de Gatos:"></asp:Label>&nbsp;
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label34"></asp:Label>
                        </td>
                        <td style="width:70%;"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label35" Text="Vacinas de Peixes:"></asp:Label>&nbsp;
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label36"></asp:Label>
                        </td>
                        <td style="width:70%;"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label37" Text="Vacinas de Pássaros:"></asp:Label>&nbsp;
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label38"></asp:Label>
                        </td>
                        <td style="width:70%;"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Label39" Text="Vacinas de Roedores:"></asp:Label>&nbsp;
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label40"></asp:Label>
                        </td>
                        <td style="width:70%;"></td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
  </ContentTemplate>
  </asp:TabPanel>
  </asp:TabContainer>
</asp:Content>
