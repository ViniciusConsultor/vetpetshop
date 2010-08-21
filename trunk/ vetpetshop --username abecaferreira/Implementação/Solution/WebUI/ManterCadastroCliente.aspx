<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="ManterCadastroCliente.aspx.cs" Inherits="WebUI.ManterCadastroCliente" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <head>
    <title>VetPetShop</title>
   <script src="alerts.js" type="text/javascript"></script>
</head>
  
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
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                        </td>
                        <td style="height: 23px; width: 383px">
                            Nome de Cliente</td>
                        <td style="height: 23px; width: 392px">
                         <asp:TextBox ID="txtNomeCli" runat="server" Width="189px"></asp:TextBox>
                        </td>
                        <td style="height: 23px; width: 497px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            CPF</td>
                            <td style="width: 58px; height: 23px">
                         <asp:TextBox ID="txtCPF" runat="server" Width="189px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            RG</td>
                            <td style="width: 58px; height: 23px">
                         <asp:TextBox ID="txtRG" runat="server" Width="189px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            Telefone</td>
                            <td style="width: 58px; height: 23px">
                         <asp:TextBox ID="txtTel" runat="server" Width="189px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            Celular</td>
                            <td style="width: 58px; height: 23px">
                         <asp:TextBox ID="txtCel" runat="server" Width="189px"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            Endereço</td>
                            <td style="width: 58px; height: 23px">
                         <asp:TextBox ID="txtEndereco" runat="server" Width="189px"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            Bairro</td>
                            <td style="width: 58px; height: 23px">
                         <asp:TextBox ID="txtBairro" runat="server" Width="189px"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            Cidade</td>
                            <td style="width: 58px; height: 23px">
                         <asp:TextBox ID="txtCidade" runat="server" Width="189px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            Estado</td>
                            <td style="width: 58px; height: 23px">
                         <asp:TextBox ID="txtEstado" runat="server" Width="189px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            CEP</td>
                            <td style="width: 58px; height: 23px">
                         <asp:TextBox ID="txtCep" runat="server" Width="189px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 383px">
                            E-mail</td>
                        <td style="height: 23px; width: 392px">
                         <asp:TextBox ID="txtEmail" runat="server" Width="189px"></asp:TextBox>
                        </td>
                        <td style="height: 23px; width: 497px">
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
                        <td style="height: 23px; width: 497px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td colspan="3" style="height: 23px; ">
                            <asp:Button ID="btnNovoPet" runat="server" onclick="btnNovoPet_Click" 
                                Text="Cadastrar Animal" />
                        </td>
                        <td style="height: 23px; width: 392px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td colspan="3" style="height: 23px; ">
                            <asp:Panel ID="pnlPet" runat="server" Visible="False" style="width:500px;" 
                                Width="456px">
                               <table>
                                   <tr>
                                        <td style="height: 23px; width: 337px">
                                            Nome do Animal</td>
                                        <td style="height: 23px; width: 392px">
                                         <asp:TextBox ID="txtNomeAnimal" runat="server" Width="189px"></asp:TextBox>
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td style="height: 23px; width: 337px">
                                            Tipo do Animal</td>
                                        <td style="height: 23px; width: 330px">
                                            <asp:DropDownList ID="ddlTipoAnimal" runat="server" width="189px">
                                            </asp:DropDownList>
                                        </td>                                                                               
                                    </tr>
                                    <tr>
                                        <td style="height: 23px; width: 337px">
                                            Data de Nascimento</td>
                                        <td style="height: 23px; width: 330px">
                                            <asp:TextBox ID="txtNascimento" runat="server" Width="189px" onblur="TestaField(this)" onfocus="inField()" Tipo="DATE"></asp:TextBox>                                           
                                        </td>                                                                               
                                    </tr>
                                    <tr>
                                        <td style="height: 23px; width: 337px">
                                            Peso</td>
                                        <td style="height: 23px; width: 392px">
                                         <asp:TextBox ID="txtPeso" runat="server" Width="189px"></asp:TextBox>
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td style="height: 23px; width: 337px">
                                            Raça</td>
                                        <td style="height: 23px; width: 392px">
                                         <asp:TextBox ID="txtRaca" runat="server" Width="189px"></asp:TextBox>
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td style="height: 23px; width: 337px">
                                            Data de início da vacinação</td>
                                        <td style="height: 23px; width: 392px">
                                         <asp:TextBox ID="txtInicioVacinacao" runat="server" Width="189px"></asp:TextBox>
                                        </td>                                        
                                    </tr>
                                     <tr>
                                        <td style="height: 23px; width: 337px">
                                            Data de Fim da vacinação</td>
                                        <td style="height: 23px; width: 392px">
                                         <asp:TextBox ID="txtFimVacinacao" runat="server" Width="189px"></asp:TextBox>
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td style="height: 23px; width: 337px">
                                            </td>
                                        <td style="height: 23px; width: 392px">
                                            <asp:Button ID="btnSalvar" runat="server" Text="Salvar" 
                                                onclick="btnSalvar_Click" />
                                        </td>                                        
                                    </tr>
                               </table>
                            </asp:Panel>                             
                        </td>
                        <td style="height: 23px; width: 392px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px">
                            </td>
                        <td style="width: 383px">
                            </td>
                        <td style="width: 392px">
                            </td>
                        <td style="width: 497px">
                            </td>
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