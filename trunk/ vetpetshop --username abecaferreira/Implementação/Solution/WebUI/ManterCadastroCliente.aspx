<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="ManterCadastroCliente.aspx.cs" Inherits="WebUI.ManterCadastroCliente" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <div style="width:87%; margin:5px 0 5px 30px;">
        <asp:RequiredFieldValidator ID="rfvtxtNomeCli" runat="server" ControlToValidate="txtNomeCli" Display="Dynamic" ErrorMessage="Preencha o nome do cliente" SetFocusOnError="false" Enabled="false"></asp:RequiredFieldValidator>         
        <br />
        <asp:RequiredFieldValidator ID="rfvtxtCPF" ControlToValidate="txtCPF" runat="server" ErrorMessage="Preencha o CPF" Display="Dynamic"></asp:RequiredFieldValidator>
        <br />
        <asp:RegularExpressionValidator ID="revtxtRG" ControlToValidate="txtRG" runat="server" ErrorMessage="Campo RG deve conter somente numeros" Display="Dynamic" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
        <br />    
        <asp:RegularExpressionValidator ID="revtxtTel" runat="server" ControlToValidate="txtTel" ErrorMessage="Campo telefone deve conter 10 caracteres" ValidationExpression="^[\s\S]{13,13}$" Display="Dynamic" ></asp:RegularExpressionValidator>
        <br />
        <asp:RegularExpressionValidator ID="revtxtCel" runat="server" ControlToValidate="txtCel" ErrorMessage="Campo celular deve conter 10 caracteres" ValidationExpression="^[\s\S]{13,13}$" Display="Dynamic" ></asp:RegularExpressionValidator>    
    </div>
    <div style="width:87%;margin:5px 0 5px 30px;">
        <ul style="margin-top:10px;">
            <li>
                <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label>
            </li>
        </ul>
        <ul style="margin-top:10px;">
            <li style="margin-bottom:10px;">
                <span style="margin-left:10px;margin-right:5px;">Nome*</span>
                <asp:TextBox ID="txtNomeCli" runat="server" Width="400px"></asp:TextBox>
                <span style="margin-left:10px;"><asp:Button ID="BtnBuscar" runat="server" Text="Buscar Clientes" 
                    onclick="BtnBuscar_Click" ToolTip="Buscar clientes para cadastrar pets"/></span>
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:18px;margin-right:5px;">CPF*</span>
                <asp:TextBox ID="txtCPF"  MaxLength="14" Width="120px"  runat="server" TabIndex="4"></asp:TextBox>
                <asp:MaskedEditExtender ID="meeCPF" runat="server" TargetControlID="txtCPF" Mask="999,999,999-99" ClearMaskOnLostFocus="false" MaskType="Number"></asp:MaskedEditExtender>
                <span style="margin-left:30px;margin-right:5px;">RG</span><asp:TextBox ID="txtRG" runat="server" Width="120px"></asp:TextBox>
                <span style="margin-left:30px;margin-right:5px;">Sexo*</span>
                <asp:DropDownList ID="ddlSexoCliente" runat="server" width="100px">
                    <asp:ListItem Value="">Selecione</asp:ListItem>
                    <asp:ListItem Value="Masculino">Masculino</asp:ListItem>
                    <asp:ListItem Value="Feminino">Feminino</asp:ListItem>
                </asp:DropDownList>
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:0px;margin-right:5px;">Telefone</span>
                <asp:TextBox ID="txtTel" runat="server" Width="200px"></asp:TextBox>
                <asp:MaskedEditExtender ID="meetxtTel" Mask="(99)9999-9999" runat="server" TargetControlID="txtTel" ClearMaskOnLostFocus="false" MaskType="Number"></asp:MaskedEditExtender>
                <span style="margin-left:50px;margin-right:5px;">Celular</span>
                <asp:TextBox ID="txtCel" runat="server" Width="200px"></asp:TextBox>        
                <asp:MaskedEditExtender ID="meetxtCel" Mask="(99)9999-9999" runat="server" TargetControlID="txtCel" ClearMaskOnLostFocus="false" MaskType="Number"></asp:MaskedEditExtender>
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:0px;margin-right:5px;">Endereço</span>
                <asp:TextBox ID="txtEndereco" runat="server" Width="300px"></asp:TextBox>
                <span style="margin-left:50px;margin-right:5px;">Bairro</span>
                <asp:TextBox ID="txtBairro" runat="server" Width="150px"></asp:TextBox>
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:10px;margin-right:5px;">Cidade</span>
                <asp:TextBox ID="txtCidade" runat="server" Width="150px"></asp:TextBox>
                <span style="margin-left:50px;margin-right:5px;">Estado</span>
                <asp:TextBox ID="txtEstado" runat="server" Width="100px"></asp:TextBox>
                <span style="margin-left:50px;margin-right:5px;">CEP</span>
                <asp:TextBox ID="txtCep" runat="server" Width="100px"></asp:TextBox>
            </li>            
            <li style="margin-bottom:10px;">
                <span style="margin-left:10px;margin-right:5px;">E-mail*</span>
                <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
            </li>
        </ul>
    </div>
    
    <div style="width:50%; margin:5px 0 5px 280px;">
        <asp:Button ID="btnNovoPet" runat="server" onclick="btnNovoPet_Click" Text="Adicionar Animal" />
    </div>
    
    <asp:Panel ID="pnlPet" runat="server" Visible="False" Width="90%">
    <div style="width:100%; margin:20px 0 10px 10px;">
        <b><span style="margin-left:10px;margin-right:5px; font-size:small; font-style:normal;">Dados do Pet do Cliente</span></b>
    </div>
    <div style="width:100%; margin:5px 0 5px 30px;">
        <ul>
            <li style="margin-bottom:10px;">
                <span style="margin-left:10px;margin-right:5px;">Nome*</span>
                <asp:TextBox ID="txtNomeAnimal" runat="server" Width="250px"></asp:TextBox>
                <span style="margin-left:50px;margin-right:5px;">Sexo*</span>
                <asp:DropDownList ID="ddlSexoAnimal" runat="server" width="100px">
                                            <asp:ListItem Value="">Selecione</asp:ListItem>
                                            <asp:ListItem Value="Masculino">Masculino</asp:ListItem>
                                            <asp:ListItem Value="Feminino">Feminino</asp:ListItem>
                                            </asp:DropDownList>
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:15px;margin-right:5px;">Tipo*</span>
                <asp:DropDownList ID="ddlTipoAnimal" runat="server" width="100px"></asp:DropDownList>
                <span style="margin-left:50px;margin-right:5px;">Data de Nascimento*</span>
                <asp:TextBox ID="txtNascimento" runat="server" Width="150px" onblur="TestaField(this)" onfocus="inField()" MaxLength="10" Tipo="DATE"></asp:TextBox>                                           
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:15px;margin-right:5px;">Peso*</span>
                <asp:TextBox ID="txtPeso" runat="server" Width="100px"></asp:TextBox>
                <span style="margin-left:50px;margin-right:5px;">Raça</span>
                <asp:TextBox ID="txtRaca" runat="server" Width="150px"></asp:TextBox>
            </li>
        </ul>    
    
    </div>
    </asp:Panel>                             
    <div style="width:89%; margin:20px 0 10px 10px;">
        <b><span style="margin-left:10px;margin-right:5px; font-size:x-small; font-style:normal;">* Preenchimento Obrigatório</span></b>
    </div>
    <div style="width:55%; margin:5px 0 5px 200px;">
        <asp:Button Width="20%" ID="btnCancelar" runat="server" Text="Cancelar" OnClientClick="history.back();" /> &nbsp;
        <asp:Button Width="20%" ID="btnSalvar" runat="server" Text="Salvar" onclick="btnSalvar_Click" />
        <asp:Button Width="20%" ID="btnSalvar2" runat="server" Text="Salvar" onclick="btnSalvar2_Click" Visible="false" />
        <asp:Button Width="20%" ID="BtnUpdateCli" runat="server" Text="Salvar" onclick="BtnUpdateCli_Click" Visible="false" />
        <asp:Button Width="20%" ID="BtnUpdateAni" runat="server" Text="Salvar" onclick="BtnUpdateAni_Click" Visible="false" />         
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
                 OnClientClick="history.back();"/>
        </div>
        
    </asp:Panel>

</asp:Content>
