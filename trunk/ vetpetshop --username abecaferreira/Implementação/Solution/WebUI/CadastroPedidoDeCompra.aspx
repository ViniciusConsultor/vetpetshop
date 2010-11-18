<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="CadastroPedidoDeCompra.aspx.cs" Inherits="WebUI.CadastroPedidoDeCompra" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>
        Cadastrar Pedido de Compra
    </h3>
    <div style="width:90%;margin: 10px 10px 10px 20px;">
        <ul>
            <li style="margin-bottom:15px;">
                <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label>
            </li>
        </ul>
        <ul>
            <li style="margin-bottom:20px; margin-left:5px;">
                <center>
                <asp:Button ID="btnOk" runat="server" Text="Novo Pedido de Compra" Width="30%" onclick="btnOk_Click" />
                </center>
            </li>
        </ul>
    </div>    
        <asp:Panel ID="Panel2" runat="server" Visible="false">
            <div style="width:100%;margin: 10px 10px 20px 30px;">
                <ul>
                    <li style="margin-bottom:10px;">
                        <span style="margin-left:10px; margin-right:5px;">Código:</span>
                        <asp:Label ID="lblCod" runat="server" Text=""></asp:Label>
                        <span style="margin-left:30px; margin-right:5px;">Data de Cadastro:</span>
                        <asp:Label ID="lblData" runat="server" Text=""></asp:Label>
                        <span style="margin-left:30px; margin-right:5px;"><asp:Label ID="lblDescVal" Font-Bold="true" runat="server" Visible="false" Text="Valor Total: R$"></asp:Label></span>
                        <asp:Label ID="lblTotal" runat="server" Text="" Font-Bold="true"></asp:Label>
                    </li>         
                </ul>
            </div>
        </asp:Panel>
    <div id="divProds" runat="server" class="escondido" style="width:90%; margin: 10px 30px 10px 35px;">  
       <asp:GridView ID="grProds" runat="server" AutoGenerateColumns="false" 
            HeaderStyle-BackColor="DarkBlue" Width="100%" Visible="false" AllowPaging="false" RowStyle-Height="30px" 
            onrowcommand="grProds_RowCommand" 
            AlternatingRowStyle-BackColor="LightSteelBlue" 
            onrowdeleting="grProds_RowDeleting">
            <Columns>
             <asp:TemplateField>  
            <HeaderStyle  Width="5%"/>                      
            <ItemTemplate>
            <asp:LinkButton ID="lexcluir" runat="server" Text="Excluir" CommandName="excluir" CommandArgument='<%# Eval("id_produto") %>'></asp:LinkButton>
            </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Código" DataField="id_produto" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Nome do Produto" DataField="nm_produto" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="30%"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Valor Unitário" DataField="valunit" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="30%"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Quantidade" DataField="quant" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="15%"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>                               
            <asp:BoundField HeaderText="Valor Total" DataField="valor" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
            <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="30%"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>                               
            </Columns>
            <HeaderStyle BackColor="DarkBlue"></HeaderStyle>
        </asp:GridView>
    </div>
    <div style="margin-bottom:10px; margin-left:30px; width: 90%;">
        <center>
        <asp:Button ID="addProd" runat="server" Text="Adicionar Produto" onclick="addProd_Click" Visible="false" Width="30%" />                    
        &nbsp;<asp:Button ID="btnSalvar" runat="server" Text="Salvar Pedido de Compra" Visible="false" Width="30%" onclick="btnSalvar_Click" />
        </center>
    </div> 
    <asp:Panel ID="Panel1" runat="server" Visible="false"> 
        <div style="width:100%; margin:10px 0 10px 25px;">
            <b><span style="margin-left:10px;margin-right:5px; font-size:small; font-style:normal;">Busca de Produto</span></b>
        </div>
        <div style="width:100%; margin:10px 0 0 40px;">
            <span style="display:block;"><asp:RegularExpressionValidator ID="regtxtNome" runat="server" ControlToValidate="txtNome" Display="Dynamic" ErrorMessage="Campo nome não deve conter caracteres especiais" ValidationExpression="^[. 0-9a-zA-Z ç Ç ã Ã õ Õ Ê ê Â â Ô ô ó Ó ò Ò á à Á À é è È É Í ì í Ì î ú û Ú ù Ùº ª ]+$"></asp:RegularExpressionValidator></span>
        </div>                
        <div style="width:100%;margin: 10px 10px 20px 30px;">
            <ul>
                <li style="margin-bottom:10px;">
                    <span style="margin-left:10px; margin-right:5px;">Nome:</span>
                    <asp:TextBox ID="txtNome" runat="server" Width="50%" MaxLength="50"></asp:TextBox>
                </li>
                <li style="margin-bottom:10px;">
                    <span style="margin-left:17px; margin-right:5px;">Tipo:</span>
                    <asp:DropDownList ID="ddlTipo" runat="server" Width="39%"></asp:DropDownList>&nbsp;&nbsp;&nbsp;
                    <asp:Button Width="10%" ID="Button2" runat="server" onclick="Buscar_Click" Text="Buscar" />
                </li>
            </ul>
        </div>            
        </asp:Panel>
        <div style="width: 100%;">
            <center>
                <asp:Label ID="lblRegistros" runat="server" Text="" Visible="false" Font-Bold="true"></asp:Label>
            </center>    
        </div>
        <asp:Panel ID="panel3" runat="server" Visible="false">
            <div id="divErros" style="width:100%; margin:10px 0 0 40px;">
                 <span style="display:block;"><asp:RegularExpressionValidator ID="revtxtQuant" ControlToValidate="txtQuant" runat="server" ErrorMessage="Campo quantidade deve conter somente números" Display="Dynamic" ValidationExpression="^[0-9]+$" SetFocusOnError="true"></asp:RegularExpressionValidator></span>
            </div>
            <div style="margin: 15px 5px 10px 35px; width:30%; border:1px solid #b9b9b9;">
                <ul style="margin-top:10px;">
                    <li style="margin-bottom:10px; margin-left:10px;">
                            <span style="margin-left:0px;margin-right:5px;"><b>Quantidade:</b></span>
                            <asp:TextBox ID="txtQuant" runat="server" Width="65px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button Width="20%" ID="btnQuant" runat="server" Text="OK" onclick="btnQuant_Click" />
                    </li>
                </ul>
            </div>            
        </asp:Panel>
        <div id="divUsuarios" runat="server" class="escondido" style="width:90%; margin: 10px 30px 10px 35px;">  
             <asp:GridView ID="grUsuarios" runat="server" AutoGenerateColumns="false" 
                        HeaderStyle-BackColor="DarkBlue" Width="100%" AllowPaging="false" RowStyle-Height="25px" 
                        PageSize="10" onrowcommand="grUsuarios_RowCommand" 
                        AlternatingRowStyle-BackColor="LightSteelBlue"
                        onrowdatabound="grUsuarios_RowDataBound" 
                        onrowcreated="grUsuarios_RowCreated" 
                        onpageindexchanging="grUsuarios_PageIndexChanging">
                <Columns>
                 <asp:TemplateField>  
                <HeaderStyle  Width="5%"/>                      
                <ItemTemplate>
                <asp:LinkButton ID="lSelecionar" runat="server" Text="Selecionar" CommandName="selecionar" CommandArgument='<%# Eval("id_produto") %>'></asp:LinkButton>
                </ItemTemplate>
                </asp:TemplateField>    
                <asp:BoundField DataField="id_produto" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White"  Visible="false">
                <HeaderStyle BackColor="DarkBlue" ForeColor="White"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField HeaderText="Nome do Produto" DataField="nm_produto" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}" htmlencode="false">
                <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="30%"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField HeaderText="Tipo" DataField="tipo" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="20%" HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField HeaderText="Descrição" DataField="descricao" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="50%" HorizontalAlign="Center"></HeaderStyle>
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
            </asp:GridView>
        </div>
</asp:Content>
