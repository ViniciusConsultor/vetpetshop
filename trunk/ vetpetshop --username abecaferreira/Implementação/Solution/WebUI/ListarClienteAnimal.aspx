<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="ListarClienteAnimal.aspx.cs" Inherits="WebUI.ListarClienteAnimal" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <h3>
    Listar Clientes e Animais Cadastrados
  </h3>
  <table width="100%">
    <tr>
        <td style="width:6%;">
            <asp:Label ID="lblBusca" runat="server" Text="Nome" Font-Bold="true"></asp:Label>
        </td>
        <td style="width:20%;">
            <asp:TextBox ID="txtBusca" runat="server" Width="100%"></asp:TextBox>
        </td>
        <td style="width:1%;"></td>
        <td>
            <asp:Button ID="BtnBuscar" runat="server" Text="Listar" />
        </td>
    </tr>
  </table>
  <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1">
  <asp:TabPanel ID="tabPanel1" runat="server">
  <HeaderTemplate>
    Clientes
  </HeaderTemplate>
  <ContentTemplate>
    <div id="divClientes" style="display:block;">
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                SelectMethod="ListarClientesCadastrados" TypeName="Negocios.ClienteBuss">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtBusca" ConvertEmptyStringToNull="False" 
                        DefaultValue=" " Name="Nome" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:GridView ID="grClientes" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" PageSize="15" Width="100%">
                <Columns>
                    <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                    <asp:BoundField DataField="CPF" HeaderText="CPF" SortExpression="CPF" />
                    <asp:BoundField DataField="RG" HeaderText="RG" SortExpression="RG" />
                    <asp:BoundField DataField="Telefone1" HeaderText="Telefone" 
                        SortExpression="Telefone1" />
                    <asp:BoundField DataField="Telefone2" HeaderText="Celular" 
                        SortExpression="Telefone2" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Endereco" HeaderText="Endereço" 
                        SortExpression="Endereco" />
                    <asp:BoundField DataField="Bairro" HeaderText="Bairro" 
                        SortExpression="Bairro" />
                    <asp:BoundField DataField="Cidade" HeaderText="Cidade" 
                        SortExpression="Cidade" />
                    <asp:BoundField DataField="Estado" HeaderText="Estado" 
                        SortExpression="Estado" />
                    <asp:BoundField DataField="CEP" HeaderText="CEP" SortExpression="CEP" />
                </Columns>
                <HeaderStyle BackColor="DarkBlue" />
            </asp:GridView>
        </div>
  </ContentTemplate>
  </asp:TabPanel>
  <asp:TabPanel ID="tabPanel2" runat="server">
  <HeaderTemplate>
    Animais
  </HeaderTemplate>
  <ContentTemplate>
        <div id="divAnimais" style="display:block;">
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                SelectMethod="ListarAnimaisCadastrados" TypeName="Negocios.AnimalBuss">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtBusca" ConvertEmptyStringToNull="False" 
                        DefaultValue=" " Name="Nome" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:GridView ID="grAnimais" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" DataSourceID="ObjectDataSource2" PageSize="15" Width="100%">
                <Columns>
                    <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                    <asp:BoundField DataField="Peso" HeaderText="Peso" 
                        SortExpression="Peso" />
                    <asp:BoundField DataField="Raca" HeaderText="Raca" 
                        SortExpression="Raca" />
                    <asp:BoundField DataField="DataFimVacinacao" HeaderText="DataFimVacinacao" 
                        SortExpression="DataFimVacinacao" />
                    <asp:BoundField DataField="DataNascimento" HeaderText="DataNascimento" 
                        SortExpression="DataNascimento" />
                    <asp:BoundField DataField="DataProxVacinacao" HeaderText="DataProxVacinacao" 
                        SortExpression="DataProxVacinacao" />
                </Columns>
                <HeaderStyle BackColor="DarkBlue" />
            </asp:GridView>
        </div>
  </ContentTemplate>
  </asp:TabPanel>
  </asp:TabContainer>

</asp:Content>