<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="ListarClienteAnimal.aspx.cs" Inherits="WebUI.ListarClienteAnimal" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>
    Listar Clientes e Animais Cadastrados
  </h3>
  <table width="100%">
    <tr>
    <td></td>
    <td>
        <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label>
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
            <asp:Button ID="BtnBuscar" runat="server" Text="Listar" />
        </td>
     </tr>
     <tr>
     <td><br /></td>
     </tr>
  </table>
  <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1">
  <asp:TabPanel ID="tabPanel1" runat="server">
  <HeaderTemplate>
    <b>Clientes</b>
  </HeaderTemplate>
  <ContentTemplate>
    <div id="divClientes">
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                SelectMethod="ListarClientesCadastrados" TypeName="Negocios.ClienteBuss">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtBusca" ConvertEmptyStringToNull="False" 
                        DefaultValue=" " Name="Nome" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:GridView ID="grClientes" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" PageSize="15" Width="100%" onrowcommand="grClientes_RowCommand">
                <Columns>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                    <asp:LinkButton ID="alterar" runat="server" Text="Alterar" CommandName="alterar" CommandArgument='<%# Eval("IdCliente") %>'></asp:LinkButton>
                    </ItemTemplate> 
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                    <asp:LinkButton ID="excluir" runat="server" Text="Excluir" CommandName="excluir" CommandArgument='<%# Eval("IdCliente") %>' OnClientClick="return confirm('Deseja excluir o registro selecionado?');"></asp:LinkButton>
                    </ItemTemplate> 
                    </asp:TemplateField>
                    <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                            Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="False"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="CPF" HeaderText="CPF" SortExpression="CPF">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                            Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="False"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="RG" HeaderText="RG" SortExpression="RG">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                            Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="False"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="Telefone1" HeaderText="Telefone" 
                        SortExpression="Telefone1">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                            Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="False"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="Telefone2" HeaderText="Celular" 
                        SortExpression="Telefone2">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                            Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="False"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                            Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="False"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="Endereco" HeaderText="Endereço" 
                        SortExpression="Endereco">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                            Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="False"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="Bairro" HeaderText="Bairro" SortExpression="Bairro">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                            Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="False"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="Cidade" HeaderText="Cidade" SortExpression="Cidade">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                            Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="False"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                            Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="False"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="CEP" HeaderText="CEP" SortExpression="CEP">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                            Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="False"/>
                    </asp:BoundField>
                </Columns>
                <HeaderStyle BackColor="DarkBlue" />
                <AlternatingRowStyle BackColor="LightSteelBlue" />
            </asp:GridView>
        </div>
  </ContentTemplate>
  </asp:TabPanel>
  <asp:TabPanel ID="tabPanel2" runat="server">
  <HeaderTemplate>
    <b>Animais</b>
  </HeaderTemplate>
  <ContentTemplate>
        <div id="divAnimais">
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                SelectMethod="ListarAnimaisCadastrados" TypeName="Negocios.AnimalBuss">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtBusca" ConvertEmptyStringToNull="False" 
                        DefaultValue=" " Name="Nome" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:GridView ID="grAnimais" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" DataSourceID="ObjectDataSource2" PageSize="15" Width="100%" OnRowDataBound="grAnimais_RowDataBound"  onrowcommand="grAnimais_RowCommand">
                <Columns>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                    <asp:LinkButton ID="alterar" runat="server" Text="Alterar" CommandName="alterar" CommandArgument='<%# Eval("IdAnimal") %>'></asp:LinkButton>
                    </ItemTemplate> 
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                    <asp:LinkButton ID="excluir" runat="server" Text="Excluir" CommandName="excluir" CommandArgument='<%# Eval("IdAnimal") %>' OnClientClick="return confirm('Deseja excluir o registro selecionado?');"></asp:LinkButton>
                    </ItemTemplate> 
                    </asp:TemplateField>
                    <asp:BoundField DataField="IdCliente" HeaderText="Proprietário" SortExpression="Proprietário">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                            Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="false"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                            Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="false"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="Peso" HeaderText="Peso" SortExpression="Peso">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                            Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="false"/>    
                    </asp:BoundField>
                    <asp:BoundField DataField="Raca" HeaderText="Raca" SortExpression="Raca">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                            Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="false"/>    
                    </asp:BoundField>
                    <asp:BoundField DataField="DataFimVacinacao" HeaderText="DataFimVacinacao" SortExpression="DataFimVacinacao" DataFormatString="{0:d}" NullDisplayText="" >
                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                            Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="false"/>    
                    </asp:BoundField>
                    <asp:BoundField DataField="DataNascimento" HeaderText="DataNascimento" SortExpression="DataNascimento" DataFormatString="{0:d}" NullDisplayText="" >
                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                            Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="false"/>    
                    </asp:BoundField>
                    <asp:BoundField DataField="DataProxVacinacao" HeaderText="DataProxVacinacao" SortExpression="DataProxVacinacao" DataFormatString="{0:d}" NullDisplayText="">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                            Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="false"/>    
                    </asp:BoundField>
                </Columns>
                <HeaderStyle BackColor="DarkBlue" />
                <AlternatingRowStyle BackColor="LightSteelBlue" />
            </asp:GridView>
        </div>
  </ContentTemplate>
  </asp:TabPanel>
  </asp:TabContainer> 
 </asp:Content>