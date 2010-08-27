<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PopUpClientes.aspx.cs" Inherits="WebUI.PopUpClientes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Lista de Clientes Cadastrados</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="divPopupClientes">
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="ListarClientesCadastrados" TypeName="Negocios.ClienteBuss">
        </asp:ObjectDataSource>
            <asp:GridView ID="grClientes" runat="server" AutoGenerateColumns="False" 
                    HeaderStyle-BackColor="DarkBlue" Width="100%" 
                    AllowPaging="True" PageSize="15" DataSourceID="ObjectDataSource1">
        <Columns>
            <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
            <asp:BoundField DataField="CPF" HeaderText="CPF" SortExpression="CPF" /> 
            <asp:ButtonField Text="Selecionar" CommandName="selecionar"/>
            </Columns>
        <HeaderStyle BackColor="DarkBlue"></HeaderStyle>
        </asp:GridView>  
        </div>
    </form>
</body>
</html>

