<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="ManterCadastroCliente.aspx.cs" Inherits="WebUI.ManterCadastroCliente" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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
                  
                            <asp:DropDownList visible="false" ID="ddlTdsClientes" runat="server" AutoPostBack="true" 
                                width="189px" onselectedindexchanged="ddlTdsClientes_SelectedIndexChanged"></asp:DropDownList>
                        </td>
                        <td style="height: 23px; width: 138px">
                            <asp:Button ID="BtnBuscar" runat="server" Text="Buscar Clientes" 
                                onclick="BtnBuscar_Click"/>
                        </td>
                        <td style="height: 23px; width: 142px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 58px; height: 23px">
                            &nbsp;</td>
                        <td style="height: 23px; width: 518px">
                            CPF</td>
                            <td style="width: 58px; height: 23px">
                            <asp:RegularExpressionValidator ID="regCPFCliente" runat="server" ControlToValidate="txtCPF"
                            Display="None" ErrorMessage="O campo CPF está inválido. <br />Favor corrigí-lo."
                            ValidationExpression="^[0-9]{11}$" ValidationGroup="ManterCadastroCliente"></asp:RegularExpressionValidator>
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
                                            Data de Início da vacinação</td>
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
                        <asp:Button width="30%" ID="btnCancelar" runat="server" Text="Cancelar" 
                            onclick="btnCancelar_Click" /> &nbsp;
                        <asp:Button  width="30%" ID="btnSalvar" runat="server" Text="Salvar" 
                            onclick="btnSalvar_Click" />
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
    OkControlID="btpOK" ID="ModalPopupExtender1" TargetControlID="ButtonPp" runat="server" PopupControlID="Panel1" cancelcontrolid="btpCancel">
    </asp:ModalPopupExtender>
    
    <asp:Panel class="modalPopup1" ID="Panel1" runat="server" Style="display:block;">
        <div id="divPopupClientes">
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="ListarClientesCadastrados" TypeName="Negocios.ClienteBuss">
        </asp:ObjectDataSource>
            <asp:GridView ID="grClientes" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" 
                HeaderStyle-BackColor="DarkBlue" PageSize="15" Width="100%">
                <Columns>
                    <asp:BoundField  DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                    <asp:BoundField DataField="CPF" HeaderText="CPF" SortExpression="CPF" />
                    <asp:ButtonField CommandName="selecionar" Text="Selecionar" />
                </Columns>
                <HeaderStyle BackColor="DarkBlue" />
            </asp:GridView>
        </div>
        <asp:Button id="btpOK" Text="OK" runat="server"/>
        <asp:Button id="btpCancel" Text="Cancelar" runat="server"/>
    </asp:Panel>

</asp:Content>
