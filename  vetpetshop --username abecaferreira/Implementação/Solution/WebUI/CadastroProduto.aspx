<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="CadastroProduto.aspx.cs" Inherits="WebUI.CadastroProduto" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>
        Manter Cadastro Produto
    </h3>
    <div style="width:90%;margin:5px 0 5px 30px;">
        <ul>
            <li>
                <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label>
            </li>
        </ul>
    </div>
    <div style="width:90%;margin:5px 0 5px 30px;"> 
        <ul>
            <li style="margin: 10px 0 10px 0;">
                <asp:Button Width="25%" ID="btnNovo" runat="server" Text="Novo Produto" onclick="btnNovo_Click" />&nbsp;&nbsp;
                <asp:Button Width="25%" ID="Button2" runat="server" Text="Editar/Excluir Produto" onclick="Button2_Click" />    
            </li>
        </ul>
    </div>
    <asp:Panel ID="Panel1" runat="server" Visible="false">                               
        <div style="width:100%; margin:20px 0 10px 20px;">
            <span style="margin-left:10px;margin-right:5px; font-size:small; font-style:normal;"><b>Busca de Produtos:</b></span>
        </div>
        <div style="width:100%; margin: 5px 0 0 25px;">
            <span style="display:block;"><asp:RegularExpressionValidator ID="regtxtNome" runat="server" ControlToValidate="txtNome" Display="Dynamic" ErrorMessage="Campo nome não deve conter caracteres especiais" ValidationExpression="^[. 0-9a-zA-Z ç Ç ã Ã õ Õ Ê ê Â â Ô ô ó Ó ò Ò á à Á À é è È É Í ì í Ì î ú û Ú ù Ùº ª ]+$"></asp:RegularExpressionValidator></span>
        </div>
        <div style="width:100%; margin:5px 0 5px 20px;">
            <ul>
                <li style="margin-bottom:10px;">
                    <span style="margin-left:10px;margin-right:5px;">Nome:</span>
                    <asp:TextBox ID="txtNome" runat="server" Width="30%"></asp:TextBox>
                </li>
                <li style="margin-bottom:10px;">
                    <span style="margin-left:16px;margin-right:5px;">Tipo:</span>
                    <asp:DropDownList ID="ddlTipo" runat="server" Width="30%" AutoPostBack="true"></asp:DropDownList>
                    &nbsp;&nbsp;<asp:Button Width="10%" ID="Button1" runat="server" Text="Buscar" onclick="Buscar_Click" />
                </li>
            </ul>
        </div>
    </asp:Panel>
    <div style="width:100%; margin:10px 0 5px 20px;">
        <span style="margin-left:10px;margin-right:5px; font-size:small; font-style:normal;"><b><asp:Label ID="lblLista" runat="server" Text="Lista de produtos cadastrados" Font-Bold="true" Visible="false"></asp:Label></b></span>
    </div>
    <div class="scroll" style="width: 95%; margin: 10px 0 20px 25px;">
         <center><asp:Label ID="lblRegistros" runat="server" Text="" Visible="false" Font-Bold="true"></asp:Label></center>   
         <asp:GridView ID="grUsuarios" runat="server" AutoGenerateColumns="false" 
                HeaderStyle-BackColor="DarkBlue" Width="100%" AllowPaging="false" 
                onrowdatabound="grUsuarios_RowDataBound" AlternatingRowStyle-BackColor="LightSteelBlue" RowStyle-Height="30px" 
                onpageindexchanging="grUsuarios_PageIndexChanging" 
                onrowcommand="grUsuarios_RowCommand">
            <Columns>
             <asp:TemplateField>  
            <HeaderStyle  Width="5%"/>                      
            <ItemTemplate>
            <asp:LinkButton ID="lkEditar" runat="server" Text="Editar" CommandName="editar" CommandArgument='<%# Eval("id_produto") %>'></asp:LinkButton>
            </ItemTemplate>
            </asp:TemplateField>        
             <asp:TemplateField>  
            <HeaderStyle  Width="5%"/>                      
            <ItemTemplate>
            <asp:LinkButton ID="lkExcluir" runat="server" OnClientClick=" return confirm('Deseja realmente excluir este registro?');" Text="Excluir" CommandName="excluir" CommandArgument='<%# Eval("id_produto") %>'></asp:LinkButton>
            </ItemTemplate>
            </asp:TemplateField>                                      
            <asp:BoundField DataField="id_produto" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White"  Visible="false">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Nome do Produto" DataField="nm_produto" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}" htmlencode="false">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="20%"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Tipo" DataField="tipo" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="20%" HorizontalAlign="Center"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Descrição" DataField="descricao" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="40%" HorizontalAlign="Center"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Preço Custo" DataField="preco_custo" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="15%" HorizontalAlign="Center"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>                        
            <asp:BoundField HeaderText="Preço Venda" DataField="preco_venda" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="15%" HorizontalAlign="Center"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Estoque Mín" DataField="min" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="10%" HorizontalAlign="Center"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
             <asp:BoundField HeaderText="Estoque Máx" DataField="max" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="10%" HorizontalAlign="Center"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>                                              
             <asp:BoundField HeaderText="Validade" DataField="validade" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="25%" HorizontalAlign="Center"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            </Columns>
            <HeaderStyle BackColor="DarkBlue"></HeaderStyle>
        </asp:GridView>
    </div>
</asp:Content>
