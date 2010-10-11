<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="CadastroPedidoDeCompra.aspx.cs" Inherits="WebUI.CadastroPedidoDeCompra" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table style="width:100%;">
        <tr>
            <td style="width: 863px">
              <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 863px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 246px; width: 863px">
                <table style="width: 102%; height: 228px;">
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 273px">
                            <asp:Button ID="btnOk" runat="server" Text="Novo Pedido de Compra" 
                                Width="189px" onclick="btnOk_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 273px">
                            &nbsp;</td>
                    </tr>
                    <asp:Panel ID="Panel2" runat="server" Visible="false">
                    <tr>
                        <td style="width: 58px; height: 23px">&nbsp;</td>                        
                        <td style="height: 23px; width: 352px;">
                             &nbsp; Código&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             <asp:Label ID="lblCod" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>     
                    <tr>
                        <td style="width: 58px; height: 23px">&nbsp;</td>
                        <td style="height: 23px; width: 550px;">
                             &nbsp;&nbsp;Data de Cadastro
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblData" runat="server" Text=""></asp:Label>
                        </td>                       
                    </tr>     
                    <tr>
                        <td style="width: 58px; height: 23px">&nbsp;</td>
                        <td style="height: 23px; width: 550px;">
                             &nbsp;&nbsp;<B>Valor Total R$</B>
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblTotal" runat="server" Text="" Font-Bold="true"></asp:Label>
                        </td>
                    </tr>     
                     </asp:Panel>
                    <tr>
                        <td style="width: 58px; "></td>
                        <td style="width: 550px;">
                        
                             &nbsp;</td>
                    </tr>     
                    <tr>
                        <td style="width: 58px; height: 23px">&nbsp;</td>
                        <td style="height: 23px; width: 550px;">
                            &nbsp;
                               <asp:GridView ID="grProds" runat="server" AutoGenerateColumns="false" 
                                HeaderStyle-BackColor="DarkBlue" Width="100%" Visible="false" 
                                onrowcommand="grProds_RowCommand" AlternatingRowStyle-BackColor="LightSteelBlue">
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
                                </asp:GridView></td>
                    </tr>     
                    <tr>
                        <td style="width: 58px; height: 23px">&nbsp;</td>
                        <td style="height: 23px; width: 550px;">
                      <asp:Button ID="addProd" runat="server" Text="Adicionar Produto" 
                                onclick="addProd_Click" Visible="false" Width="189px" />                    
                        &nbsp;<asp:Button ID="btnSalvar" runat="server" Text="Salvar Pedido de Compra" 
                                Visible="false" onclick="btnSalvar_Click" />
                        </td>
                    </tr>     
                    <tr>
                        <td style="width: 58px; "></td>
                        <td style="width: 550px;">
                            </td>
                    </tr>     
                    <tr>
                     <td style="width: 58px; height: 23px">&nbsp;</td>
                     <td style="height: 23px; width: 550px;">
                    <asp:Panel ID="Panel1" runat="server" Visible="false" Width="531px"> 
                    <table style="border-style: solid; width: 100%;">
                            <tr>
                                <td colspan="3" style="width: 143px">
                                    <b>Busca de Produto</b></td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 143px">
                                    Nome do Produto</td>
                                <td>
                                     <asp:TextBox ID="txtNome" runat="server" Width="232px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 143px">
                                    Tipo doProduto</td>
                                <td>
                                      <asp:DropDownList ID="ddlTipo" runat="server" Width="232px">
                            </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;<asp:Button ID="Button2" runat="server" onclick="Buscar_Click" 
                                Text="Buscar" />
                                </td>
                            </tr>
                        </table>
                      </asp:Panel>
                      </td>                        
                      </tr>     
                    <tr>
                     <td style="width: 58px; height: 10px"></td>
                     <td style="height: 10px; width: 550px;">
                         </td>                        
                      </tr>     
                    <tr>
                     <td style="width: 58px; height: 23px">&nbsp;</td>
                     <td style="height: 23px; width: 550px;">
                         <asp:Label ID="lblRegistros" runat="server" Text="" Visible="false" Font-Bold="true"></asp:Label>
                        </td>                        
                      </tr>     
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 319px">
                            <asp:Panel ID="panel3" runat="server" Visible="false" Width="196px">
                        <table style="border-color: #FF0000; width: 100%; border-style: solid";>
                                <tr>
                                    <td style="width: 82px">
                                        Quantidade</td>
                                    <td>
                                        <asp:TextBox ID="txtQuant" runat="server" Width="39px"></asp:TextBox>
                                        &nbsp;<asp:Button ID="btnQuant" runat="server" Text="OK" 
                                            onclick="btnQuant_Click" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px">
                            &nbsp;</td>
                        <td style="width: 324px">
                         <asp:GridView ID="grUsuarios" runat="server" AutoGenerateColumns="false" 
                                HeaderStyle-BackColor="DarkBlue" Width="100%" AllowPaging="True" 
                                PageSize="10" onrowcommand="grUsuarios_RowCommand" 
                                AlternatingRowStyle-BackColor="LightSteelBlue" RowStyle-Height="50px" 
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
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>        
        <tr>
            <td style="width: 863px">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
