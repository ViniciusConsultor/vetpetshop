<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="ManterCadastroCliente.aspx.cs" Inherits="WebUI.ManterCadastroCliente" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 

    <table style="width:100%;">
        <tr>
            <td style="width: 100%;">
                <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label>
            </td>
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
                            Nome do Cliente*</td>
                        <td style="height: 23px; width: 392px">
                         <asp:RequiredFieldValidator ID="rqrNomeCliente" ControlToValidate="txtNomeCli" runat="server" ErrorMessage="Preencha o campo Nome do Cliente" Display="None"></asp:RequiredFieldValidator>
                         <asp:TextBox ID="txtNomeCli" runat="server" Width="189px"></asp:TextBox>
                        </td>
                        <td style="height: 23px; width: 138px">
                            <asp:Button ID="BtnBuscar" runat="server" Text="Buscar Clientes" 
                                onclick="BtnBuscar_Click" />
                        </td>
                        <td style="height: 23px; width: 142px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            CPF*</td>
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
                            Sexo*</td>
                            <td style="width: 58px; height: 23px">
                            <asp:RequiredFieldValidator ID="vldSexo" ControlToValidate="ddlSexoCliente" runat="server" ErrorMessage="Selecione o sexo do cliente" Display="None"></asp:RequiredFieldValidator>               
                            <asp:DropDownList ID="ddlSexoCliente" runat="server" width="189px">
                            <asp:ListItem Value="">Selecione</asp:ListItem>
                            <asp:ListItem Value="Masculino">Masculino</asp:ListItem>
                            <asp:ListItem Value="Feminino">Feminino</asp:ListItem>
                            </asp:DropDownList>
                        </td>                                                                               
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            Telefone*</td>
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
                         <asp:RegularExpressionValidator ID="vldCEP2" runat="server" ControlToValidate="txtCep" ErrorMessage="Campo CEP deve conter 8 dígitos." ValidationExpression="^[\s\S]{8,8}$" Display="None"></asp:RegularExpressionValidator>
                         <asp:TextBox ID="txtCep" runat="server" Width="189px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 383px">
                            E-mail*</td>
                        <td style="height: 23px; width: 392px">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtEmail" runat="server" ErrorMessage="Preencha o campo E-mail." Display="None"></asp:RequiredFieldValidator>
                         <asp:TextBox ID="txtEmail" runat="server" Width="189px"></asp:TextBox>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="E-mail inválido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            Width="105px" Display="None"></asp:RegularExpressionValidator>
                        </td>
                        <td style="height: 23px; width: 138px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td align="center" colspan="3" style="height: 23px; ">
                            <asp:Button ID="btnNovoPet" runat="server" onclick="btnNovoPet_Click" 
                                Text="Adicionar Animal" />
                        </td>
                        <td style="height: 23px; width: 142px">
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
                                            Nome do Animal*</td>
                                        <td style="height: 23px; width: 392px">
                                         <asp:TextBox ID="txtNomeAnimal" runat="server" Width="189px"></asp:TextBox>
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td style="height: 23px; width: 337px">
                                            Sexo do Animal*</td>
                                        <td style="height: 23px; width: 330px">
                                            <asp:DropDownList ID="ddlSexoAnimal" runat="server" width="189px">
                                            <asp:ListItem Value="">Selecione</asp:ListItem>
                                            <asp:ListItem Value="Masculino">Masculino</asp:ListItem>
                                            <asp:ListItem Value="Feminino">Feminino</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>                                                                               
                                    </tr>
                                    <tr>
                                        <td style="height: 23px; width: 337px">
                                            Tipo do Animal*</td>
                                        <td style="height: 23px; width: 330px">
                                            <asp:DropDownList ID="ddlTipoAnimal" runat="server" width="189px">
                                            </asp:DropDownList>
                                        </td>                                                                               
                                    </tr>
                                    <tr>
                                        <td style="height: 23px; width: 337px">
                                            Data de Nascimento*</td>
                                        <td style="height: 23px; width: 330px">
                                            <asp:TextBox ID="txtNascimento" runat="server" Width="189px" onblur="TestaField(this)" onfocus="inField()" MaxLength="10" Tipo="DATE"></asp:TextBox>                                           
                                        </td>                                                                               
                                    </tr>
                                    <tr>
                                        <td style="height: 23px; width: 337px">
                                            Peso*</td>
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
                               </table>
                            </asp:Panel>                             
                        </td>
                        <td style="height: 23px; width: 142px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 337px">
                        </td>
                        <td align="center" style="height: 23px; width: 392px">
                         * Preenchimento Obrigatório.         
                        </td>                                        
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 337px">
                        </td>
                        <td align="center" style="height: 23px; width: 392px">
                        <asp:Button width="30%" ID="btnCancelar" runat="server" Text="Cancelar" 
                                 OnClientClick="window.history.back();" /> &nbsp;
                        <asp:Button  width="30%" ID="btnSalvar" runat="server" Text="Salvar" 
                            onclick="btnSalvar_Click" />
                        <asp:Button  width="30%" ID="btnSalvar2" runat="server" Text="Salvar" 
                            onclick="btnSalvar2_Click" Visible="false" />
                        <asp:Button  width="30%" ID="BtnUpdateCli" runat="server" Text="Salvar" 
                            onclick="BtnUpdateCli_Click" Visible="false" />
                        <asp:Button  width="30%" ID="BtnUpdateAni" runat="server" Text="Salvar" 
                            onclick="BtnUpdateAni_Click" Visible="false" />         
                        </td>                                        
                    </tr>
                    <tr>
                        <td style="width: 58px">
                            </td>
                        <td style="width: 383px">
                            </td>
                        <td style="width: 392px">
                            </td>
                        <td style="width: 138px">
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
    
    <asp:Button ID="ButtonPp" runat="server" style="display:none" />
    <asp:ModalPopupExtender 
    BackgroundCssClass="modalPopup1_Background" 
    ID="ModalPopupExtender1" TargetControlID="ButtonPp" runat="server" PopupControlID="Panel1" cancelcontrolid="btpVoltar">
    </asp:ModalPopupExtender>
    
    <asp:Panel class="modalPopup1" ID="Panel1" runat="server" Style="display:block;">
        <h3>
            Lista de Clientes Cadastrados
        </h3>
        <div id="divPopupClientes">
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                SelectMethod="ListarClientesCadastrados" TypeName="Negocios.ClienteBuss">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtNomeCli" ConvertEmptyStringToNull="False" 
                        DefaultValue=" " Name="Nome" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:GridView ID="grClientes" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" 
                HeaderStyle-BackColor="DarkBlue" PageSize="15" Width="100%" Font-Size="Small" 
                onrowcommand="grClientes_RowCommand">
                <Columns>
                    <asp:TemplateField>
                    <ItemTemplate>
                    <asp:LinkButton ID="selecionar" runat="server" Text="Selecionar" CommandName="selecionar" CommandArgument='<%# Eval("idCliente") %>'></asp:LinkButton>
                    </ItemTemplate> 
                    </asp:TemplateField>
                    <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                            Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="false"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="CPF" HeaderText="CPF" SortExpression="CPF">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                            Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="false"/>
                    </asp:BoundField>
                </Columns>
                <HeaderStyle BackColor="DarkBlue" />
                <AlternatingRowStyle BackColor="LightSteelBlue" />
            </asp:GridView>
        </div>
        <div align="center">
            <br />
            <asp:Button id="btpVoltar" Text="Voltar" runat="server" 
                 OnClientClick="window.history.back();"/>
        </div>
        
    </asp:Panel>

</asp:Content>
