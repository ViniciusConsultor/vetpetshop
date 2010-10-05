﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="RegistrarPagamentoProdutos.aspx.cs" Inherits="WebUI.RegistrarPagamentoProdutos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table style="width:100%;">
        <tr>
            <td style="width: 863px">
              <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label>
                &nbsp;</td>
        </tr>        
        <tr>
            <td style="height: 246px; width: 863px">
                <table style="width: 102%; height: 228px;">
                    <tr>
                        <td style="height: 23px; width: 273px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="height: 23px; width: 273px">
                            &nbsp;<asp:Panel ID="Panel1" runat="server" Width="531px"> 
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
                                Text="Buscar" style="height: 26px" />
                                </td>
                            </tr>
                        </table>
                      </asp:Panel>
                      </td>
                    </tr>   
                    <tr>
                    <td>
                    </td>
                    </tr>
                    <tr>
                    <td>&nbsp;<asp:Label ID="lblValor" runat="server" Font-Bold="true" Visible="false" Text="Valor Total da Compra:" ForeColor="Blue"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblTotal" runat="server" Font-Bold="true" Visible="false" ForeColor="Blue"></asp:Label>
                    </td>
                    </tr>
                     <tr>
                    <td>
                     <asp:GridView ID="grProds" runat="server" AutoGenerateColumns="false" 
                                HeaderStyle-BackColor="DarkBlue" Width="100%" Visible="false" 
                                AlternatingRowStyle-BackColor="LightSteelBlue">
                                <Columns>
                                 <asp:TemplateField>  
                                <HeaderStyle  Width="5%"/>                      
                                <ItemTemplate>
                                <asp:LinkButton ID="lexcluir" runat="server" Text="Excluir" CommandName="excluir" CommandArgument='<%# Eval("id_produto") %>'></asp:LinkButton></ItemTemplate></asp:TemplateField><asp:BoundField HeaderText="Código" DataField="id_produto" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White">
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
                    
                    </td>
                    </tr>
                    <tr>
                    <td>
                    </td>
                    </tr>
                    <tr>
                    <td>
                       <asp:Panel ID="panel3" runat="server" Visible="false" Width="196px"><table style="border-color: #FF0000; width: 100%; border-style: solid";>
                                <tr>
                                    <td style="width: 82px">
                                        <b>Quantidade</b></td><td>
                                        <asp:TextBox ID="txtQuant" runat="server" Width="39px"></asp:TextBox>&nbsp;<asp:Button ID="btnQuant" runat="server" Text="OK" 
                                            onclick="btnQuant_Click" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    </tr>
                    <tr>
                    <td>
                    </td>
                    </tr>
                    <tr>
                    <td>
                    </td>
                    </tr>
                     <tr>                     
                        <td style="width: 550px;"> 
                        <div style="OVERFLOW: auto; HEIGHT: 300px; width: 690px">                        
                             &nbsp;<asp:GridView ID="grProdutos" runat="server" AutoGenerateColumns="false" 
                                HeaderStyle-BackColor="DarkBlue" Width="100%" AllowPaging="True" 
                                PageSize="10" 
                                AlternatingRowStyle-BackColor="LightSteelBlue" RowStyle-Height="50px" 
                                 onrowcommand="grProdutos_RowCommand">
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
                        &nbsp;</td>
                        </div>
                        </tr>
                        <tr>
                        <td style="width: 550px;">
                        
                             &nbsp;</td></tr><tr>
                        <td style="width: 550px;">
                        
                             &nbsp;</td></tr><tr>
                        <td style="height: 23px; width: 550px;">
                            &nbsp;
                              </td>
                    </tr>     
                    <tr>
                        <td style="height: 23px; width: 550px;">
                      <asp:Button ID="addProd" runat="server" Text="Adicionar Produto" 
                                onclick="addProd_Click" Visible="false" Width="189px" />                    
                        &nbsp;<asp:Button ID="btnSalvar" runat="server" Text="Salvar Nota Fiscal" 
                                Visible="false" onclick="btnSalvar_Click" />
                        </td>
                    </tr>     
                    <tr>
                        <td style="width: 550px;">
                            </td>
                    </tr>     
                    <tr>
                     <td style="height: 23px; width: 550px;">
                    
                      </td>                        
                      </tr>     
                    <tr>
                     <td style="height: 10px; width: 550px;">
                         </td>                        
                      </tr>     
                    <tr>
                     <td style="height: 23px; width: 550px;">
                         <asp:Label ID="lblRegistros" runat="server" Text="" Visible="false" Font-Bold="true"></asp:Label></td></tr><tr>
                        <td style="height: 23px; width: 319px">
                            &nbsp;</td></tr><tr>
                        <td style="width: 324px">                         
                            &nbsp;</td></tr></table></td></tr><tr>
            <td style="width: 863px">
                &nbsp;</td></tr></table>
                </asp:Content>