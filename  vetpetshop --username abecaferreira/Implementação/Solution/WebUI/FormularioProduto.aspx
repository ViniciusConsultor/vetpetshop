<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="FormularioProduto.aspx.cs" Inherits="WebUI.FormularioCadastroProduto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table style="width:100%;">
        <tr>
            <td style="width: 863px">
                <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label></td>
            <td style="width: 80px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 863px; height: 12px;">
                <b>Formulário de Cadastro de Produto</b></td>
            <td style="width: 80px; height: 12px;">
                </td>
            <td style="height: 12px">
                </td>
        </tr>
        <tr>
            <td style="width: 863px; height: 12px;">
                &nbsp;</td>
            <td style="width: 80px; height: 12px;">
                &nbsp;</td>
            <td style="height: 12px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 246px; width: 863px">
                <table style="width: 100%; height: 228px;">
                    <tr>
                        <td style="width: 58px; height: 23px">
                        </td>
                        <td style="height: 23px; width: 277px">
                            Nome do Produto</td>
                        <td style="height: 23px; width: 1079px">
                        <asp:TextBox ID="txtNome" runat="server" Width="347px"></asp:TextBox>
                        </td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                        </td>
                        <td style="height: 23px; width: 277px">
                            Tipo</td>
                        <td style="height: 23px; width: 1079px">
                        <asp:DropDownList ID="ddlTipoGrupo" runat="server" Width="200px">
                </asp:DropDownList>
                        </td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 277px">
                            Preço de Custo</td>
                        <td style="height: 23px; width: 1079px">
                            <asp:TextBox ID="txtPrecoCusto" runat="server" Width="200px"></asp:TextBox>
                        </td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 277px">
                            Preço de Venda</td>
                        <td style="height: 23px; width: 1079px">
                            <asp:TextBox ID="txtPrecoVenda" runat="server" Width="200px"></asp:TextBox>
                        </td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 277px">
                            Estoque Mínimo</td>
                        <td style="height: 23px; width: 1079px">
                            <asp:TextBox ID="txtEstoqueMin" runat="server" Width="200px"></asp:TextBox>
                        &nbsp;(quantidade mínima para aviso de reposição de estoque)</td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 277px">
                            Estoque Máximo</td>
                        <td style="height: 23px; width: 1079px">
                            <asp:TextBox ID="txtEstoqueMax" runat="server" Width="200px"></asp:TextBox>
                        &nbsp;(quantidade máxima do produto em estoque)</td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 277px">
                            Data de Validade </td>
                        <td style="height: 23px; width: 1079px">
                            <asp:TextBox ID="txtDia" runat="server" Width="28px"></asp:TextBox>
                        &nbsp;/
                            <asp:TextBox ID="txtMes" runat="server" Width="28px"></asp:TextBox>
                        &nbsp;/
                            <asp:TextBox ID="txtAno" runat="server" Width="73px"></asp:TextBox>
                        </td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 87px">
                            </td>
                        <td style="height: 87px; width: 277px">
                            Descrição</td>
                        <td style="height: 87px; width: 1079px">
                            <asp:TextBox ID="txtDesc" runat="server" Height="65px" TextMode="MultiLine" 
                                Width="347px"></asp:TextBox>
                        </td>
                        <td style="height: 87px; width: 518px">
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 58px">
                            &nbsp;</td>
                        <td style="width: 277px">
                            &nbsp;</td>
                        <td style="width: 1079px">
                        &nbsp;<asp:Button ID="btnOk" runat="server" Text="Salvar" onclick="btnOk_Click" />
                        </td>
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