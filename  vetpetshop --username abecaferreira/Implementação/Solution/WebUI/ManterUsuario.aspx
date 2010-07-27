<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="ManterUsuario.aspx.cs" Inherits="WebUI.ManterUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <table style="width:100%;">
        <tr>
            <td style="width: 863px">
                <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label>
            </td>
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
                        <td style="height: 23px; width: 383px">
                            Tipo de Usuário</td>
                        <td style="height: 23px; width: 392px">
                        <asp:DropDownList ID="ddlTipoUsu" runat="server" Width="170px" AutoPostBack="true">
                </asp:DropDownList>
                        </td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                        </td>
                        <td style="height: 23px; width: 383px">
                            Nome de Usuário</td>
                        <td style="height: 23px; width: 392px">
                         <asp:TextBox ID="txtNomeUsu" runat="server" Width="170px"></asp:TextBox>
                        </td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 383px">
                            Nome do Profissional</td>
                        <td style="height: 23px; width: 392px">
                        <asp:TextBox ID="txtNomePro" runat="server" Width="350px"></asp:TextBox>
                        </td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 383px">
                            Senha</td>
                        <td style="height: 23px; width: 392px">
                            <asp:TextBox ID="txtSenha" runat="server" Width="170px"></asp:TextBox>&nbsp;&nbsp;
                            <asp:LinkButton id="lkGera" runat="server" Text="Gerar senha" 
                                onclick="lkGera_Click"></asp:LinkButton>
                        </td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 383px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 392px">
                            <asp:Button ID="btnOk" runat="server" Text="Salvar" onclick="btnOk_Click" />
                        </td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 383px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 392px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td colspan="3" style="height: 23px; width: 163px">
                            <asp:Label ID="lblCadastrados" runat="server" Font-Bold="true" Text="Lista de usuários cadastrados"></asp:Label>
                        </td>
                        <td style="height: 23px; width: 392px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td colspan="3" style="height: 23px; width: 163px">
                        <asp:GridView ID="grUsuarios" runat="server" AutoGenerateColumns="false" 
                                HeaderStyle-BackColor="DarkBlue" Width="100%" AllowPaging="True" 
                                PageSize="15" onrowcommand="grUsuarios_RowCommand">
                        <Columns>
                        <asp:TemplateField>  
                        <HeaderStyle  Width="10%"/>                      
                        <ItemTemplate>
                        <asp:LinkButton ID="lkExcluir" runat="server" Text="Excluir" CommandName="excluir" CommandArgument='<%# Eval("id_usuario") %>'></asp:LinkButton>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="id_usuario" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White"  Visible="false">
                        <HeaderStyle BackColor="DarkBlue" ForeColor="White"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Nome de Usuário" DataField="nm_usuario" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="20%"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Nome do Profissional" DataField="nm_prof" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="50%" HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Tipo de Usuário" DataField="tipo_prof" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle BackColor="DarkBlue" ForeColor="White" Width="20%" HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        </Columns>
                        </asp:GridView>
                            &nbsp;</td>
                        <td style="height: 23px; width: 392px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px">
                            &nbsp;</td>
                        <td style="width: 383px">
                            &nbsp;</td>
                        <td style="width: 392px">
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