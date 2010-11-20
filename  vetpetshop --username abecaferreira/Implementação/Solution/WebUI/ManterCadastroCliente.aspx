<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="ManterCadastroCliente.aspx.cs" Inherits="WebUI.ManterCadastroCliente" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <h3>
        Manter Cadastro Cliente
    </h3>
    <div id="divErros" style="width:87%; margin:5px 0 5px 30px;">
        <span style="display:block;"><asp:RequiredFieldValidator ID="rfvtxtNomeCli" ControlToValidate="txtNomeCli" runat="server" ErrorMessage="Preencha o campo nome do cliente" Display="Dynamic"></asp:RequiredFieldValidator></span>
        <span style="display:block;"><asp:RegularExpressionValidator ID="regtxtNomeCli" runat="server" ControlToValidate="txtNomeCli" Display="Dynamic" ErrorMessage="Campo nome não deve conter caracteres especiais" ValidationExpression="^[. 0-9a-zA-Z ç Ç ã Ã õ Õ Ê ê Â â Ô ô ó Ó ò Ò á à Á À é è È É Í ì í Ì î ú û Ú ù Ùº ª ]+$"></asp:RegularExpressionValidator></span>
        <span style="display:block;"><asp:RequiredFieldValidator ID="rfvtxtCPF" ControlToValidate="txtCPF" runat="server" ErrorMessage="Preencha o campo cpf do cliente" Display="Dynamic"></asp:RequiredFieldValidator></span>
        <span id="erro3" runat="server" class="escondido" style="color:Red;">Preencha o campo sexo do cliente</span>
        <span style="display:block;"><asp:RequiredFieldValidator ID="rfvtxtTel" ControlToValidate="txtTel" runat="server" ErrorMessage="Preencha o campo telefone do cliente" Display="Dynamic"></asp:RequiredFieldValidator></span>
        <span style="display:block;"><asp:RequiredFieldValidator ID="rfvtxtEmail" ControlToValidate="txtEmail" runat="server" ErrorMessage="Preencha o campo email do cliente" Display="Dynamic"></asp:RequiredFieldValidator></span>
        <span style="display:block;"><asp:RegularExpressionValidator ID="revtxtCPF" ControlToValidate="txtCPF" runat="server" ErrorMessage="Campo CPF deve conter 11 dígitos" Display="Dynamic" ValidationExpression="^[\s\S]{14,14}$" SetFocusOnError="true"></asp:RegularExpressionValidator></span>
        <span style="display:block;"><asp:RegularExpressionValidator ID="revtxtRG" ControlToValidate="txtRG" runat="server" ErrorMessage="Campo RG deve conter somente números" Display="Dynamic" ValidationExpression="^[0-9]+$" SetFocusOnError="true"></asp:RegularExpressionValidator></span>
        <span style="display:block;"><asp:RegularExpressionValidator ID="revtxtTel" runat="server" ControlToValidate="txtTel" ErrorMessage="Campo telefone deve conter 10 caracteres" ValidationExpression="^[\s\S]{10,10}$" Display="Dynamic" SetFocusOnError="true"></asp:RegularExpressionValidator></span>
        <span style="display:block;"><asp:RegularExpressionValidator ID="revtxtCel" runat="server" ControlToValidate="txtCel" ErrorMessage="Campo celular deve conter 10 caracteres" ValidationExpression="^[\s\S]{10,10}$" Display="Dynamic" SetFocusOnError="true"></asp:RegularExpressionValidator></span>  
        <span style="display:block;"><asp:RegularExpressionValidator ID="revtxtEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Campo E-mail inválido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" SetFocusOnError="true"></asp:RegularExpressionValidator></span>
        <span style="display:block;"><asp:RegularExpressionValidator ID="revtxtCEP" ControlToValidate="txtCEP" runat="server" ErrorMessage="Campo CEP deve conter 8 dígitos" Display="Dynamic" ValidationExpression="^[\s\S]{8,8}$" SetFocusOnError="true"></asp:RegularExpressionValidator></span>
    </div>
    <div style="width:87%;margin:5px 0 5px 30px;">
        <ul>
            <li>
                <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label>
            </li>
        </ul>
        <ul style="margin-top:10px;">
            <li style="margin-bottom:10px;">
                <span style="margin-left:11px;margin-right:5px;">Nome*:</span>
                <asp:TextBox ID="txtNomeCli" runat="server" Width="400px" MaxLength="50"></asp:TextBox>
                <span style="margin-left:10px;"><asp:Button ID="BtnBuscar" runat="server" Text="Buscar Clientes" onclick="BtnBuscar_Click" ToolTip="Buscar clientes para cadastrar pets" ValidationGroup="false" /></span>
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:19px;margin-right:5px;">CPF*:</span>
                <asp:TextBox ID="txtCPF" Width="120px" runat="server" MaxLength="14"></asp:TextBox>
                <asp:MaskedEditExtender ID="meeCPF" runat="server" TargetControlID="txtCPF" Mask="999,999,999-99" ClearMaskOnLostFocus="false" MaskType="Number" AutoComplete="false" InputDirection="LeftToRight"></asp:MaskedEditExtender>
                <span style="margin-left:30px;margin-right:5px;">RG:</span><asp:TextBox ID="txtRG" runat="server" Width="120px"></asp:TextBox>
                <span style="margin-left:30px;margin-right:5px;">Sexo*:</span>
                <asp:DropDownList ID="ddlSexoCliente" runat="server" width="100px">
                    <asp:ListItem Value="">Selecione</asp:ListItem>
                    <asp:ListItem Value="Masculino">Masculino</asp:ListItem>
                    <asp:ListItem Value="Feminino">Feminino</asp:ListItem>
                </asp:DropDownList>
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:1px;margin-right:5px;">Telefone:</span>
                <asp:TextBox ID="txtTel" runat="server" Width="200px" MaxLength="10"></asp:TextBox>
                <asp:MaskedEditExtender ID="meetxtTel" Mask="(99)9999-9999" runat="server" TargetControlID="txtTel" ClearMaskOnLostFocus="true" MaskType="Number" AutoComplete="false" InputDirection="LeftToRight"></asp:MaskedEditExtender>
                <span style="margin-left:50px;margin-right:5px;">Celular:</span>
                <asp:TextBox ID="txtCel" runat="server" Width="200px" MaxLength="10"></asp:TextBox>        
                <asp:MaskedEditExtender ID="meetxtCel" Mask="(99)9999-9999" runat="server" TargetControlID="txtCel" ClearMaskOnLostFocus="true" MaskType="Number" AutoComplete="false" InputDirection="LeftToRight"></asp:MaskedEditExtender>
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:0px;margin-right:5px;">Endereço:</span>
                <asp:TextBox ID="txtEndereco" runat="server" Width="300px" MaxLength="50"></asp:TextBox>
                <span style="margin-left:50px;margin-right:5px;">Bairro:</span>
                <asp:TextBox ID="txtBairro" runat="server" Width="150px" MaxLength="20"></asp:TextBox>
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:11px;margin-right:5px;">Cidade:</span>
                <asp:TextBox ID="txtCidade" runat="server" Width="150px" MaxLength="20"></asp:TextBox>
                <span style="margin-left:50px;margin-right:5px;">Estado:</span>
                <asp:TextBox ID="txtEstado" runat="server" Width="100px" MaxLength="20"></asp:TextBox>
                <span style="margin-left:50px;margin-right:5px;">CEP:</span>
                <asp:TextBox ID="txtCep" runat="server" Width="100px" MaxLength="8"></asp:TextBox>
                <asp:MaskedEditExtender runat="server" ID="meetxtCep" ClearMaskOnLostFocus="true" TargetControlID="txtCep" MaskType="Number" Mask="99999-999" AutoComplete="false" InputDirection="LeftToRight"></asp:MaskedEditExtender>
            </li>            
            <li style="margin-bottom:10px;">
                <span style="margin-left:10px;margin-right:5px;">E-mail*:</span>
                <asp:TextBox ID="txtEmail" runat="server" Width="250px" MaxLength="30"></asp:TextBox>
            </li>
        </ul>
    </div>
    <div style="width:87%;margin:5px 0 5px 30px;">
        <center>
            <asp:Button ID="btnNovoPet" runat="server" onclick="btnNovoPet_Click" Text="Adicionar Animal" ValidationGroup="false" />
        </center>
    </div>
    <asp:Panel ID="pnlPet" runat="server" Visible="False" Width="90%">
    <div style="width:100%; margin:20px 0 10px 10px;">
        <span style="margin-left:10px;margin-right:5px; font-size:small; font-style:normal;"><b>Dados do Pet do Cliente:</b></span>
    </div>
    <div style="width:100%; margin:20px 0 10px 30px;">
        <span style="display:block;"><asp:RequiredFieldValidator ID="rfvtxtNomeAnimal" ControlToValidate="txtNomeAnimal" runat="server" ErrorMessage="Preencha o campo nome do animal" Display="Dynamic"></asp:RequiredFieldValidator></span>
        <span style="display:block;"><asp:RegularExpressionValidator ID="regtxtNomeAnimal" runat="server" ControlToValidate="txtNomeAnimal" Display="Dynamic" ErrorMessage="Campo nome não deve conter caracteres especiais" ValidationExpression="^[. 0-9a-zA-Z ç Ç ã Ã õ Õ Ê ê Â â Ô ô ó Ó ò Ò á à Á À é è È É Í ì í Ì î ú û Ú ù Ùº ª ]+$"></asp:RegularExpressionValidator></span>    
        <span style="display:block;"><asp:RequiredFieldValidator ID="rfvtxtPeso" ControlToValidate="txtPeso" runat="server" ErrorMessage="Preencha o campo peso do animal" Display="Dynamic"></asp:RequiredFieldValidator></span>
        <span style="display:block;"><asp:RequiredFieldValidator ID="rfvtxtNascimento" ControlToValidate="txtNascimento" runat="server" ErrorMessage="Preencha o campo data de nascimento do animal" Display="Dynamic"></asp:RequiredFieldValidator></span>
        <span id="erro9" runat="server" class="escondido" style="color:Red;">Preencha o campo tipo do animal</span>
        <span id="erro10" runat="server" class="escondido" style="color:Red;">Preencha o campo sexo do animal</span>
        <span style="display:block;"><asp:CompareValidator ID="cvtxtNascimento" runat="server" ControlToValidate="txtNascimento" Display="Dynamic" ErrorMessage="Data de Nascimento Inválida" Operator="GreaterThan" Type="Date" ValueToCompare="01/01/1900"></asp:CompareValidator></span> 
    </div>
    <div style="width:100%; margin:5px 0 5px 30px;">
        <ul>
            <li style="margin-bottom:10px;">
                <span style="margin-left:15px;margin-right:5px;">Nome*:</span>
                <asp:TextBox ID="txtNomeAnimal" runat="server" Width="250px" MaxLength="50"></asp:TextBox>
                <span style="margin-left:50px;margin-right:5px;">Sexo*:</span>
                <asp:DropDownList ID="ddlSexoAnimal" runat="server" width="100px">
                    <asp:ListItem Value="">Selecione</asp:ListItem>
                    <asp:ListItem Value="Masculino">Masculino</asp:ListItem>
                    <asp:ListItem Value="Feminino">Feminino</asp:ListItem>
                </asp:DropDownList>
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:21px;margin-right:5px;">Tipo*:</span>
                <asp:DropDownList ID="ddlTipoAnimal" runat="server" width="100px"></asp:DropDownList>
                <span style="margin-left:50px;margin-right:5px;">Data de Nascimento*:</span>
                <asp:TextBox ID="txtNascimento" runat="server" Width="100px" MaxLength="10"></asp:TextBox>
                <asp:MaskedEditExtender ID="meetxtNascimento" runat="server" TargetControlID="txtNascimento" Mask="99/99/9999" ClearMaskOnLostFocus="false" MaskType="Number" AutoComplete="false" InputDirection="LeftToRight"></asp:MaskedEditExtender>
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:0px;margin-right:5px;">Peso*(KG):</span>
                <asp:TextBox ID="txtPeso" runat="server" Width="100px" MaxLength="9"></asp:TextBox>
                <span style="margin-left:50px;margin-right:5px;">Raça:</span>
                <asp:TextBox ID="txtRaca" runat="server" Width="150px" MaxLength="50"></asp:TextBox>
            </li>
        </ul>    
    
    </div>
    </asp:Panel>                             
    <div style="width:89%; margin:20px 0 10px 10px;">
        <span style="margin-left:10px;margin-right:5px; font-size:x-small; font-style:normal;"><b>* Preenchimento Obrigatório</b></span>
    </div>
    <div style="width:87%;margin:5px 0 5px 30px;">
    <center>
        <asp:Button Width="20%" ID="btnSalvar" runat="server" Text="Salvar" onclick="btnSalvar_Click" />
        <asp:Button Width="20%" ID="btnSalvar2" runat="server" Text="Salvar" onclick="btnSalvar2_Click" Visible="false" />
        <asp:Button Width="20%" ID="BtnUpdateCli" runat="server" Text="Salvar" onclick="BtnUpdateCli_Click" Visible="false" />
        <asp:Button Width="20%" ID="BtnUpdateAni" runat="server" Text="Salvar" onclick="BtnUpdateAni_Click" Visible="false" />
        &nbsp;<asp:Button Width="20%" ID="btnCancelar" runat="server" Text="Cancelar" onclick="btnCancelar_Click" ValidationGroup="false" />
    </center>    
    </div>                        
    
    <asp:Button ID="ButtonPp" runat="server" style="display:none" />
    <asp:ModalPopupExtender 
    BackgroundCssClass="modalPopup1_Background" 
    ID="ModalPopupExtender1" TargetControlID="ButtonPp" runat="server" PopupControlID="Panel1" cancelcontrolid="btpVoltar">
    </asp:ModalPopupExtender>
    
    <asp:Panel class="modalPopup1" ID="Panel1" runat="server" Style="display:block;">
        <h3>
            Lista de Clientes Cadastrados
        </h3>
        <div id="divPopupClientes" style="width: 100%; max-height: 400px; overflow:scroll;">
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                SelectMethod="ListarClientesCadastrados" TypeName="Negocios.ClienteBuss">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtNomeCli" ConvertEmptyStringToNull="False" 
                        DefaultValue=" " Name="Nome" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:GridView ID="grClientes" runat="server" AllowPaging="false" RowStyle-Height="20px" 
                AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" 
                HeaderStyle-BackColor="DarkBlue" Width="100%" Font-Size="Small" 
                onrowcommand="grClientes_RowCommand">
                <Columns>
                    <asp:TemplateField>
                    <ItemTemplate>
                    <asp:LinkButton ValidationGroup="false" ID="selecionar" runat="server" Text="Selecionar" CommandName="selecionar" CommandArgument='<%# Eval("idCliente") %>'></asp:LinkButton>
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
            <asp:Button id="btpVoltar" Text="Voltar" runat="server" OnClientClick="history.back();"/>
        </div>
        
    </asp:Panel>

</asp:Content>
