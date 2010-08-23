<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="CadastroProduto.aspx.cs" Inherits="WebUI.CadastroProduto" %>


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
                        <td style="width: 58px; height: 23px">
                        </td>
                        <td style="height: 23px; width: 319px">
                            Novo Produto&nbsp;
                            <asp:RadioButton ID="novo" runat="server" 
                                ValidationGroup="tipoCadastro" AutoPostBack="True" CausesValidation="True" 
                                GroupName="tipo" oncheckedchanged="novo_CheckedChanged" />
                        </td>
                        <td style="height: 23px; width: 538px">
                            &nbsp;Editar/Excluir Produto
                            <asp:RadioButton ID="edicao" runat="server" AutoPostBack="True" 
                                CausesValidation="True" GroupName="tipo" 
                                oncheckedchanged="edicao_CheckedChanged" />
                        </td>
                        <td style="height: 23px; width: 298px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                        </td>
                        <td style="height: 23px; width: 319px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 538px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 298px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>     
                     <asp:Panel ID="Panel1" runat="server" Visible="false">                               
                    <tr>
                     
                        <td style="width: 58px; height: 23px">&nbsp;</td>                              
                        <td style="height: 23px; width: 352px;">
                            Nome do Produto&nbsp;
                            </td> 
                        <td style="height: 23px; width: 133px">
                            <asp:TextBox ID="txtNome" runat="server" Width="232px"></asp:TextBox>
                        </td>
                        <td style="height: 23px; width: 297px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                        </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 352px">
                            Tipo do Produto&nbsp;&nbsp;&nbsp; </td>
                        <td style="height: 23px; width: 133px">
                            <asp:DropDownList ID="ddlTipo" runat="server" Width="232px" AutoPostBack="true">
                            </asp:DropDownList>
                        </td>
                        <td style="height: 23px; width: 538px">
                            &nbsp;<asp:Button ID="Button1" runat="server" Text="Buscar Produto" 
                                onclick="Buscar_Click" /></td>
                    </tr>
                    </asp:Panel>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td colspan="2" style="height: 23px; width: 319px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 538px">                            
                            &nbsp;</td>
                        <td style="height: 23px; width: 298px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td colspan="2" style="height: 23px; width: 319px">
                            <asp:Label ID="lblLista" runat="server" Text="Lista de produtos cadastrados" Font-Bold="true" Visible="false"></asp:Label>
                        </td>
                        <td style="height: 23px; width: 538px">                            
                        </td>
                        <td style="height: 23px; width: 298px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td colspan="2" style="height: 23px; width: 319px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 538px">                            
                            &nbsp;</td>
                        <td style="height: 23px; width: 298px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px">
                            &nbsp;
                        <td colspan="4" style="width: 324px"><asp:Label ID="lblRegistros" runat="server" Text="" Visible="false" Font-Bold="true"></asp:Label></td></td>
                   </tr>
                    <tr>
                        <td style="width: 58px">
                            &nbsp;</td>
                        <td colspan="4" style="width: 324px">
                         <asp:GridView ID="grUsuarios" runat="server" AutoGenerateColumns="false" 
                                HeaderStyle-BackColor="DarkBlue" Width="100%" AllowPaging="True" 
                                PageSize="10" onrowdatabound="grUsuarios_RowDataBound" 
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
