<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="RegistrarPagamentoProdutos.aspx.cs" Inherits="WebUI.RegistrarPagamentoProdutos" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>
        Registrar Pagamento de Produto
    </h3>
    <div style="width:95%;margin: 10px 10px 10px 20px;">
        <ul>
            <li>
                <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label>
            </li>
        </ul>
    <asp:Panel ID="Panel1" runat="server"> 
    <div style="width:100%; margin:15px 0 10px 0px;">
        <b><span style="margin-left:10px;margin-right:5px; font-size:small; font-style:normal;">Busca de Produto</span></b>
    </div>
    <div style="width:100%; margin:10px 0 0 20px;">
        <span style="display:block;"><asp:RegularExpressionValidator ID="regtxtNome" runat="server" ControlToValidate="txtNome" Display="Dynamic" ErrorMessage="Campo nome não deve conter caracteres especiais" ValidationExpression="^[. 0-9a-zA-Z ç Ç ã Ã õ Õ Ê ê Â â Ô ô ó Ó ò Ò á à Á À é è È É Í ì í Ì î ú û Ú ù Ùº ª ]+$"></asp:RegularExpressionValidator></span>
    </div> 
    <div style="width:100%;margin: 10px 10px 10px 10px;">
        <ul>
            <li style="margin-bottom:10px;">
                <span style="margin-left:10px; margin-right:5px;">Nome:</span>
                <asp:TextBox ID="txtNome" runat="server" Width="50%"></asp:TextBox> 
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:17px; margin-right:5px;">Tipo:</span>
                <asp:DropDownList ID="ddlTipo" runat="server" Width="39%"></asp:DropDownList>&nbsp;&nbsp;&nbsp;
                <asp:Button Width="10%" ID="Button2" runat="server" onclick="Buscar_Click" Text="Buscar"/>
            </li>
        </ul>
    </div>
    <div style="width:100%; margin: 20px 0 10px 0;">
        <center>
            <asp:Label ID="lblRegistros" runat="server" Text="" Visible="false" Font-Bold="true"></asp:Label>
        </center>
    </div> 
    </asp:Panel>
        <asp:Label ID="lblValor" runat="server" Font-Bold="true" Visible="false" Text="Valor Total da Compra: R$" ForeColor="Blue"></asp:Label>&nbsp;
        <asp:Label ID="lblTotal" runat="server" Font-Bold="true" Visible="false" ForeColor="Blue"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Font-Bold="true" Visible="false" Text="" ForeColor="Blue"></asp:Label>&nbsp;
        <asp:Label ID="Label2" runat="server" Font-Bold="true" Visible="false" ForeColor="Blue"></asp:Label>
    <asp:Panel ID="PanelCliEspecial" runat="server" Visible="false">
        <div id="divErros" style="width:100%; margin:15px 0 0 1px;">
            <span style="display:block;"><asp:RegularExpressionValidator ID="revtxtParcelas" ControlToValidate="txtParcelas" runat="server" ErrorMessage="Campo parcelas deve conter somente números" Display="Dynamic" ValidationExpression="^[0-9]+$" SetFocusOnError="true"></asp:RegularExpressionValidator></span>
        </div>
        <div style="width:100%;margin: 15px 10px 10px 5px;">
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
     
<div id="divProds" runat="server" class="escondido" style="width:98%; margin: 10px 5px 10px 5px;">             
</div>
    <asp:Panel ID="Panel2" runat="server" Visible="false">  
    <div style="width:100%; margin: 10px 0 10px 5px;">              
         <asp:Button Width="20%" ID="btnSalvar" runat="server" Text="Opções de Compra" Visible="false" onclick="btnSalvar_Click" />&nbsp;&nbsp;
         <asp:Button Width="20%" ID="btnFim" runat="server" Text="Finalizar Compra" Visible="false" onclick="btnFim_Click" />
    </div>
    <div id="diverro1" class="escondido" runat="server" style="width:100%; margin: 10px 0 10px 10px;" >
        <span style="color:Red;">Adicione algum produto à sacola</span>
    </div>
    </asp:Panel>
    
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
                        <asp:GridView ID="grProds" runat="server" AllowPaging="false" 
                            AlternatingRowStyle-BackColor="LightSteelBlue" AutoGenerateColumns="false" 
                            HeaderStyle-BackColor="DarkBlue" onrowcommand="grProds_RowCommand" 
                            onrowdeleting="grProds_RowDeleting" Visible="false" Width="100%">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderStyle Width="5%" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lexcluir" runat="server" 
                                            CommandArgument='<%# Eval("id_produto") %>' CommandName="excluir" 
                                            Text="Excluir"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="id_produto" HeaderStyle-BackColor="DarkBlue" 
                                    HeaderStyle-ForeColor="White" HeaderText="Código">
                                    <HeaderStyle BackColor="DarkBlue" ForeColor="White" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="nm_produto" HeaderStyle-BackColor="DarkBlue" 
                                    HeaderStyle-ForeColor="White" HeaderText="Nome do Produto" 
                                    ItemStyle-HorizontalAlign="Center">
                                    <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="20%" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="valunit" HeaderStyle-BackColor="DarkBlue" 
                                    HeaderStyle-ForeColor="White" HeaderText="Preço Unitário" 
                                    ItemStyle-HorizontalAlign="Center">
                                    <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="20%" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="quant" HeaderStyle-BackColor="DarkBlue" 
                                    HeaderStyle-ForeColor="White" HeaderText="Quantidade" 
                                    ItemStyle-HorizontalAlign="Center">
                                    <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="15%" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="valor" HeaderStyle-BackColor="DarkBlue" 
                                    HeaderStyle-ForeColor="White" HeaderText="Subtotal" 
                                    ItemStyle-HorizontalAlign="Center">
                                    <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="10%" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle BackColor="DarkBlue" />
                        </asp:GridView>
                    </div>
                </li>
                <li style="margin-bottom:10px; margin-left:5px;">
                    <div style="border:1px solid #b9b9b9; width:20%;">
                        <span style="margin-left:0px;margin-right:10px;">Tipo de pagamento:</span>
                        <asp:RadioButtonList ID="rbTipoPagamento" runat="server" Width="100%">
                            <asp:ListItem Text="Dinheiro" Value="0" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Cartão de crédito" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Cheque" Value="2"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </li>
            </ul>
            <div>
            <center>
                <asp:Button ID="btnEnviar" runat="server" Text="Confirmar" onclick="btnEnviar_Click1" Width="20%" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Width="20%" onclick="btnCancelar_Click" />
            </center>
            </div>
        </div>      
    </asp:Panel>
     
    <asp:Panel ID="panel3" runat="server" Visible="false">
        <div id="div1" style="width:100%; margin:10px 0 10px 10px;">
            <span style="display:block;"><asp:RegularExpressionValidator ID="revtxtQuant" ControlToValidate="txtQuant" runat="server" ErrorMessage="Campo quantidade deve conter somente números" Display="Dynamic" ValidationExpression="^[0-9]+$" SetFocusOnError="true"></asp:RegularExpressionValidator></span>
        </div>
        <div style="margin: 10px 5px 10px 5px; width:30%; border:1px solid #b9b9b9;">
            <ul style="margin-top:10px;">
                <li style="margin-bottom:10px; margin-left:10px;">
                        <span style="margin-left:0px;margin-right:5px;"><b>Quantidade:</b></span>
                        <asp:TextBox ID="txtQuant" runat="server" Width="60px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;<asp:Button Width="20%" ID="btnQuant" runat="server" Text="OK" onclick="btnQuant_Click" />
                </li>
            </ul>
        </div>                                
    </asp:Panel>
                    
    <div id="divLstProds" runat="server" class="escondido" style="width:98%; margin-bottom: 20px; margin-left: 5px;">
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
    <div style="width:100%; margin: 0px 0 20px 0px;">
        <center>
            <asp:Button ID="addProd" runat="server" Text="Adicionar Produto" onclick="addProd_Click" Visible="false" Width="30%" />                   
        </center>
    </div>
 </div>
</asp:Content>