<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="FormularioProduto.aspx.cs" Inherits="WebUI.FormularioCadastroProduto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table style="width:100%;">
        <tr>
            <td style="width: 863px">
               <b>Formulário de Cadastro de Produto</b></td>
            <td style="width: 80px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 863px; height: 12px;">
                </td>
            <td style="width: 80px; height: 12px;">
                </td>
            <td style="height: 12px">
                </td>
        </tr>
        <tr>
            <td style="height: 246px; width: 863px">
                <table style="width: 100%; height: 228px;">
                    <tr>
                        <td style="width: 58px; height: 23px">
                        </td>
                        <td style="height: 23px; width: 163px">
                            Nome do Produto</td>
                        <td style="height: 23px; width: 392px">
                        <asp:TextBox ID="txtUsu" runat="server" Width="347px"></asp:TextBox>
                        </td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                        </td>
                        <td style="height: 23px; width: 163px">
                            Tipo</td>
                        <td style="height: 23px; width: 392px">
                        <asp:DropDownList ID="ddlTipoUsu" runat="server" Width="200px">
                </asp:DropDownList>
                        </td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 163px">
                            Preço de Custo</td>
                        <td style="height: 23px; width: 392px">
                            <asp:TextBox ID="TextBox4" runat="server" Width="200px"></asp:TextBox>
                        </td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 163px">
                            Preço de Venda</td>
                        <td style="height: 23px; width: 392px">
                            <asp:TextBox ID="TextBox5" runat="server" Width="200px"></asp:TextBox>
                        </td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 163px">
                            Estoque Mínimo</td>
                        <td style="height: 23px; width: 392px">
                            <asp:TextBox ID="TextBox1" runat="server" Width="200px"></asp:TextBox>
                        </td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 163px">
                            Estoque Máximo</td>
                        <td style="height: 23px; width: 392px">
                            <asp:TextBox ID="TextBox2" runat="server" Width="200px"></asp:TextBox>
                        </td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 163px">
                            Data de Validade </td>
                        <td style="height: 23px; width: 392px">
                            <asp:TextBox ID="TextBox6" runat="server" Width="200px"></asp:TextBox>
                        </td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 87px">
                            </td>
                        <td style="height: 87px; width: 163px">
                            Descrição</td>
                        <td style="height: 87px; width: 392px">
                            <asp:TextBox ID="TextBox3" runat="server" Height="65px" TextMode="MultiLine" 
                                Width="347px"></asp:TextBox>
                        </td>
                        <td style="height: 87px; width: 518px">
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 58px">
                            &nbsp;</td>
                        <td style="width: 163px">
                            &nbsp;</td>
                        <td style="width: 392px">
                            <asp:Button ID="btnOk" runat="server" Text="Voltar" />
                        &nbsp;<asp:Button ID="btnVoltar" runat="server" Text="Salvar" />
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