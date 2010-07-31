<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="CadastroProduto.aspx.cs" Inherits="WebUI.CadastroProduto" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table style="width:100%;">
        <tr>
            <td style="width: 863px">
                &nbsp;</td>
            <td style="width: 80px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 246px; width: 863px">
                <table style="width: 100%; height: 228px;">
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
                            &nbsp;Alterar Produto
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
                            <asp:DropDownList ID="ddlTipo" runat="server" Width="232px">
                            </asp:DropDownList>
                        </td>
                        <td style="height: 23px; width: 298px">
                        <asp:Button ID="btnConsultar" runat="server" Text="Buscar" OnClick="Buscar" />
                            &nbsp;</td>
                        <td style="height: 23px; width: 538px">
                            &nbsp;</td>
                    </tr>
                    </asp:Panel>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 319px">
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
                            &nbsp;</td>
                        <td colspan="3" style="width: 324px">
                         <asp:GridView ID="grUsuarios" runat="server" AutoGenerateColumns="false" 
                                HeaderStyle-BackColor="DarkBlue" Width="100%" AllowPaging="True" 
                                PageSize="15">
                        <Columns>
                        <asp:TemplateField>  
                        <HeaderStyle  Width="10%"/>                      
                        <ItemTemplate>
                        <asp:LinkButton ID="lkEditar" runat="server" Text="Editar" CommandName="editar" CommandArgument='<%# Eval("id_produto") %>'></asp:LinkButton>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="id_produto" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White"  Visible="false">
                        <HeaderStyle BackColor="DarkBlue" ForeColor="White"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Nome do Produto" DataField="nm_produto" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="20%"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Tipo" DataField="tipo" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="50%" HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Estoque Mín" DataField="min" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="20%" HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                         <asp:BoundField HeaderText="Estoque Máx" DataField="max" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="20%" HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Descrição" DataField="descricao" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="20%" HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Preço Custo" DataField="preco_custo" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="20%" HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>                        
                        <asp:BoundField HeaderText="Preço Venda" DataField="preco_venda" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="20%" HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                         <asp:BoundField HeaderText="Validade" DataField="validade" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="20%" HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        </Columns>
                        </asp:GridView>
                        
                            &nbsp;</td>
                        <td style="width: 538px">
                            &nbsp;</td>
                        <td style="width: 298px">
                            &nbsp;</td>
                        <td style="width: 518px">
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
            <td style="height: 246px; width: 80px">
            </td>
            <td style="height: 246px">
            </td>
        </tr>
        <tr>
            <td style="width: 863px">
                &nbsp;</td>
            <td style="width: 80px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>


 
</asp:Content>
