<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="RegistrarPagamentoProdutos.aspx.cs" Inherits="WebUI.RegistrarPagamentoProdutos" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>
        Registrar Pagamento de Produtos
    </h3>
    <div style="width:95%;margin: 10px 10px 10px 20px;">
        <ul>
            <li>
                <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label>
            </li>
        </ul>
    <asp:Panel ID="Panel1" runat="server"> 
    <div style="width:100%; margin:10px 0 10px 10px;">
        <b><span style="margin-left:10px;margin-right:5px; font-size:small; font-style:normal;">Busca de Produto</span></b>
    </div>
    <div style="width:100%;margin: 10px 10px 10px 20px;">
        <ul>
            <li style="margin-bottom:10px;">
                <span style="margin-left:10px; margin-right:5px;">Nome:</span>
                <asp:TextBox ID="txtNome" runat="server" Width="50%"></asp:TextBox> 
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:17px; margin-right:5px;">Tipo:</span>
                <asp:DropDownList ID="ddlTipo" runat="server" Width="38%"></asp:DropDownList>&nbsp;&nbsp;
                <asp:Button Width="10%" ID="Button2" runat="server" onclick="Buscar_Click" Text="Buscar"/>
            </li>
        </ul>
    </div>
    </asp:Panel>
        <asp:Label ID="lblValor" runat="server" Font-Bold="true" Visible="false" Text="Valor Total da Compra:" ForeColor="Blue"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblTotal" runat="server" Font-Bold="true" Visible="false" ForeColor="Blue"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Font-Bold="true" Visible="false" Text="" ForeColor="Blue"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Font-Bold="true" Visible="false" ForeColor="Blue"></asp:Label>
    <asp:Panel ID="PanelCliEspecial" runat="server" Visible="false">
        <div style="width:100%; margin:10px 0 10px 10px;">
            <b><span style="margin-left:10px;margin-right:5px; font-size:small; font-style:normal;">Cliente Especial</span></b>
        </div>
        <div style="width:100%;margin: 10px 10px 10px 20px;">
            <ul>
                <li style="margin-bottom:10px;">
                    <span style="margin-left:17px; margin-right:5px;"><asp:Label ID="Cliente" Text="Nome:" runat="server"></asp:Label></span>
                    <asp:DropDownList ID="ddlClienteEspecial" runat="server" Width="350px"></asp:DropDownList>
                </li>
                <li style="margin-bottom:10px;">
                    <span style="margin-left:5px; margin-right:5px;"><asp:Label ID="lblParcelas" Text="Parcelas:" runat="server"></asp:Label></span>
                    <asp:TextBox ID="txtParcelas" runat="server" Width="100px"></asp:TextBox>
                </li>
             </ul>
        </div>
        </asp:Panel>
     
<div id="divProds" class="scroll" style="width:100%; margin: 10px 5px 10px 5px;">             
     <asp:GridView ID="grProds" runat="server" AutoGenerateColumns="false" 
                HeaderStyle-BackColor="DarkBlue" Width="100%" Visible="false" 
                AlternatingRowStyle-BackColor="LightSteelBlue" AllowPaging="false" 
            onrowcommand="grProds_RowCommand" onrowdeleting="grProds_RowDeleting">
                <Columns>
                 <asp:TemplateField>  
                <HeaderStyle  Width="5%"/>                      
                <ItemTemplate>
                <asp:LinkButton ID="lexcluir" runat="server" Text="Excluir" CommandName="excluir" CommandArgument='<%# Eval("id_produto") %>'></asp:LinkButton></ItemTemplate></asp:TemplateField>
                <asp:BoundField HeaderText="Código" DataField="id_produto" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White">
                <HeaderStyle BackColor="DarkBlue" ForeColor="White"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField HeaderText="Nome do Produto" DataField="nm_produto" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="20%"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField HeaderText="Preço Unitário" DataField="valunit" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="20%"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField HeaderText="Quantidade" DataField="quant" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="15%"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>                               
                <asp:BoundField HeaderText="Subtotal" DataField="valor" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="10%"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>                               
                </Columns>
    <HeaderStyle BackColor="DarkBlue"></HeaderStyle>
                </asp:GridView>
</div>    
    <div style="width:100%; margin: 10px 0 10px 5px;">              
         <asp:Button Width="20%" ID="btnSalvar" runat="server" Text="Opções de Compra" Visible="false" onclick="btnSalvar_Click" />&nbsp;&nbsp;
         <asp:Button Width="20%" ID="btnFim" runat="server" Text="Finalizar Compra" Visible="false" onclick="btnFim_Click" />
    </div>
    
    <asp:Panel ID="Panel4" runat="server" Visible="false">
        <div style="margin: 10px 5px 10px 5px; width:100%;">
            <ul style="margin-top:10px;">
                <li style="margin-bottom:10px; margin-left:5px;">
                    <div style="border:1px solid #b9b9b9; width:20%;">
                        <span style="margin-left:0px;margin-right:10px;">Cliente especial?</span>
                        <asp:RadioButtonList ID="rbCliente" runat="server" Width="100%">
                        <asp:ListItem Text="Sim" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Não" Value="1" Selected="True"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </li>
                <li style="margin-bottom:10px; margin-left:5px;">
                    <div style="border:1px solid #b9b9b9; width:20%;">
                        <span style="margin-left:0px;margin-right:10px;">Tipo de pagamento:</span>
                        <asp:RadioButtonList ID="rbTipoPagamento" runat="server" Width="100%">
                            <asp:ListItem Text="Dinheiro" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Cartão de crédito" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Cheque" Value="2"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </li>
            </ul>
            <div style="margin: 10px 0px 5px 42%;">
                <asp:Button ID="btnEnviar" runat="server" Text="Confirmar" onclick="btnEnviar_Click1" Width="20%" />
            </div>
        </div>      
    </asp:Panel>
     
    <asp:Panel ID="panel3" runat="server" Visible="false">
        <div style="margin: 10px 5px 10px 5px; width:30%; border:1px solid #b9b9b9;">
            <ul style="margin-top:10px;">
                <li style="margin-bottom:10px; margin-left:10px;">
                        <span style="margin-left:0px;margin-right:5px;"><b>Quantidade:</b></span>
                        <asp:TextBox ID="txtQuant" runat="server" Width="60px"></asp:TextBox>
                        &nbsp;&nbsp;<asp:Button Width="15%" ID="btnQuant" runat="server" Text="OK" onclick="btnQuant_Click" />
                </li>
            </ul>
        </div>                                
    </asp:Panel>
                    
    <div class="scroll" style="width:95%; max-height:200px;">                        
    <asp:GridView ID="grProdutos" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="DarkBlue" Width="100%" AllowPaging="false" AlternatingRowStyle-BackColor="LightSteelBlue" RowStyle-Height="30px" onrowcommand="grProdutos_RowCommand" onpageindexchanging="grProdutos_PageIndexChanging">
    <Columns>
     <asp:TemplateField>  
    <HeaderStyle  Width="5%"/>                      
    <ItemTemplate>
    <asp:LinkButton ID="lSelecionar" runat="server" Text="Selecionar" CommandName="selecionar" CommandArgument='<%# Eval("id_produto") %>'></asp:LinkButton></ItemTemplate></asp:TemplateField><asp:BoundField DataField="id_produto" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White"  Visible="false">
    <HeaderStyle BackColor="DarkBlue" ForeColor="White"></HeaderStyle>
    </asp:BoundField>
    <asp:BoundField HeaderText="Nome do Produto" DataField="nm_produto" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}" htmlencode="false">
    <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="10%"></HeaderStyle>
    <ItemStyle HorizontalAlign="Center"></ItemStyle>
    </asp:BoundField>
    <asp:BoundField HeaderText="Tipo" DataField="tipo" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
    <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="10%" HorizontalAlign="Center"></HeaderStyle>
    <ItemStyle HorizontalAlign="Center"></ItemStyle>
    </asp:BoundField>
    <asp:BoundField HeaderText="Descrição" DataField="descricao" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
    <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="20%" HorizontalAlign="Center"></HeaderStyle>
    <ItemStyle HorizontalAlign="Center"></ItemStyle>
    </asp:BoundField>
    <asp:BoundField HeaderText="Preço Unitário" DataField="preco_venda" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
    <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="5%" HorizontalAlign="Center"></HeaderStyle>
    <ItemStyle HorizontalAlign="Center"></ItemStyle>
    </asp:BoundField>                                             
    </Columns>
    </asp:GridView>
    </div>                       
    <div style="width:95%; margin: 5px 0 5px 30%;">
        <asp:Button ID="addProd" runat="server" Text="Adicionar Produto" onclick="addProd_Click" Visible="false" Width="30%" />
        <asp:Label ID="lblRegistros" runat="server" Text="" Visible="false" Font-Bold="true"></asp:Label>                    
    </div>
 </div>
</asp:Content>