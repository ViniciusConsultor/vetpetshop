<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="ManterUsuario.aspx.cs" Inherits="WebUI.ManterUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <table style="width:100%;">
        <tr>
            <td style="width: 863px">
                <asp:Label ID="lblMsg" runat="server" Text="" forecolor="Red"></asp:Label>
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
                            <asp:TextBox ID="txtSenha" runat="server" Width="170px"></asp:TextBox>
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
                        <asp:GridView ID="grUsuarios" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="DarkBlue">
                        <Columns>
                        <asp:TemplateField>                        
                        <ItemTemplate>
                        <asp:LinkButton ID="lkExcluir" runat="server" Text="Excluir"></asp:LinkButton>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Código de Usuário" DataField="Cd_Usuario" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" HeaderStyle-Width="100" />
                        <asp:BoundField HeaderText="Nome do Profissional" DataField="Nm_prof" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" HeaderStyle-Width="100" />
                        <asp:BoundField HeaderText="Tipo de Usuário" DataField="Tipo_prof" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" HeaderStyle-Width="100" />
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