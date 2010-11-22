<%@ Page Title="" Language="C#" MasterPageFile="~/Vetpetshop.Master" AutoEventWireup="true" CodeBehind="ConsultarEstatisticas.aspx.cs" Inherits="WebUI.ConsultarEstatisticas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>
        Consultar Estatísticas
    </h3>
    <div style="width:100%;margin: 10px 10px 10px 20px;">
        <ul>
            <li>
                <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label>          
            </li>
        </ul>    
    </div>
    <div style="width:95%;margin: 10px 10px 10px 20px;">
        <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
          <asp:TabPanel ID="tabPanel1" runat="server">
          <HeaderTemplate>
            <b>Petshop</b>
          </HeaderTemplate>
          <ContentTemplate>
          <div id="div1" style="padding-top:10px; padding-bottom:10px;padding-left:10px;">
                <ul style="margin-top:10px;">
                    <li style="margin-bottom:10px;">
                        <span style="margin-left:0px;margin-right:5px;">Opção:</span>          
                        <asp:DropDownList ID="ddlPetOpcoes" Width="25%" runat="server" AutoPostBack="True" onselectedindexchanged="ddlPetOpcoes_SelectedIndexChanged">
                            <asp:ListItem Text="Selecione"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Produtos Vendidos"></asp:ListItem>
                        </asp:DropDownList>
                    </li>
                </ul>
                <asp:Panel ID="PnDataPet" runat="server" Visible="False">
                   <div style="width:100%; margin:15px 0 10px 0;">
                        <span style="margin-left:0;margin-right:5px; font-size:small; font-style:normal;"><b>Busca por Período:</b></span>
                   </div>
                   <div style="width:100%;">
                       <span style="margin-left:0px;margin-right:5px;">De:</span> 
                       <asp:TextBox ID="txtDataInicioPet" runat="server" Width="20%" MaxLength="10" onkeypress="validaData(this,'Data inválida.\nFavor informar a data no formato DD/MM/YYYY.')"></asp:TextBox>
                       <span style="margin-left:10px;margin-right:5px;">Até:</span> 
                       <asp:TextBox ID="txtDataFimPet" runat="server" Width="20%" MaxLength="10" onkeypress="validaData(this,'Data inválida.\nFavor informar a data no formato DD/MM/YYYY.')"></asp:TextBox>
                       &nbsp;&nbsp;<asp:Button Width="10%" ID="btnOkPet" runat="server" Text="Buscar" onclick="btnOkPet_Click" />              
                   </div>
                </asp:Panel>
            <asp:Panel ID="PnPet" runat="server" Visible="False">
                <div style="width:95%; margin: 10px 0 10px 2%;" class="scrollmini">
                    <asp:GridView ID="grProdutos" runat="server" AllowPaging="false" RowStyle-Height="20px" 
                        AutoGenerateColumns="False" HeaderStyle-BackColor="DarkBlue" Width="100%" Font-Size="Small">
                        <Columns>
                            <asp:BoundField DataField="nm_produto" HeaderText="Produto" SortExpression="nm_produto">
                                <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                                    Wrap="False"/>
                                <ItemStyle HorizontalAlign="Center" Wrap="false"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="qtd_vendida" HeaderText="Qtd Vendida" SortExpression="qtd_vendida">
                                <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                                    Wrap="False"/>
                                <ItemStyle HorizontalAlign="Center" Wrap="false"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="nm_grupo" HeaderText="Grupo" SortExpression="nm_grupo">
                                <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                                    Wrap="False"/>
                                <ItemStyle HorizontalAlign="Center" Wrap="false"/>
                            </asp:BoundField>
                        </Columns>
                        <HeaderStyle BackColor="DarkBlue" />
                        <AlternatingRowStyle BackColor="LightSteelBlue" />
                    </asp:GridView>
                </div> 
            </asp:Panel>
          </div>
          </ContentTemplate>
          </asp:TabPanel>
          <asp:TabPanel ID="tabPanel2" runat="server">
          <HeaderTemplate>
            <b>Consultório</b>
          </HeaderTemplate>
          <ContentTemplate>
                <div id="div2" style="padding-top:10px; padding-bottom:10px; padding-left:10px;">
                    <ul style="margin-top:10px;">
                        <li style="margin-bottom:10px;">
                            <span style="margin-left:0px;margin-right:5px;">Opção:</span> 
                            <asp:DropDownList ID="ddlVetOpcoes" Width="25%" runat="server" AutoPostBack="True" onselectedindexchanged="ddlVetOpcoes_SelectedIndexChanged">
                                <asp:ListItem Value="" Text="Selecione"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Clientes Cadastrados"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Animais Cadastrados"></asp:ListItem>
                                <asp:ListItem Value="3" Text="Consultas Realizadas"></asp:ListItem>
                                <asp:ListItem Value="4" Text="Vacinas Realizadas"></asp:ListItem>
                            </asp:DropDownList>
                        </li>
                    </ul>
                    <asp:Panel ID="PnDataVet" runat="server" Visible="false">
                       <div style="width:100%; margin:15px 0 10px 0;">
                            <span style="margin-left:0;margin-right:5px; font-size:small; font-style:normal;"><b>Busca por Período:</b></span>
                       </div>
                       <div style="width:100%;">
                            <span style="margin-left:0px;margin-right:5px;">De:</span>
                            <asp:TextBox ID="txtDataInicioVet" runat="server" Width="20%" MaxLength="10" onkeypress="validaData(this,'Data inválida.\nFavor informar a data no formato DD/MM/YYYY.')"></asp:TextBox>
                            <span style="margin-left:10px;margin-right:5px;">Até:</span> 
                            <asp:TextBox ID="txtDataFimVet" runat="server" Width="20%" MaxLength="10" onkeypress="validaData(this,'Data inválida.\nFavor informar a data no formato DD/MM/YYYY.')"></asp:TextBox>
                            &nbsp;&nbsp;<asp:Button Width="10%" ID="BtnOkVet" runat="server" Text="Buscar" onclick="btnOkVet_Click" />
                       </div>              
                    </asp:Panel>
                    <asp:Panel ID="PnVetSexoCliente" runat="server" Visible="false">
                        <div style="width:100%;">
                            <ul>
                                <li style="margin: 10px 0 5px 0;">
                                    <span style="margin-left:0px;margin-right:12px;"><b>Total Clientes:</b></span>
                                    <asp:Label runat="server" ID="Label6" Font-Bold="true"></asp:Label>
                                </li>
                                <li style="margin: 10px 0 5px 0;">
                                    <span style="margin-left:0px;margin-right:11px;"><b>Total Homens:</b></span>
                                    <asp:Label runat="server" ID="Label8" Font-Bold="true"></asp:Label>
                                </li>    
                                <li style="margin: 10px 0 5px 0;">
                                    <span style="margin-left:0px;margin-right:5px;"><b>Total Mulheres:</b></span>
                                    <asp:Label runat="server" ID="Label10" Font-Bold="true"></asp:Label>                                    
                                </li>
                            </ul>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="PnVetSexoAnimal" runat="server" Visible="false">
                        <div style="width:100%;">
                            <ul>
                                <li style="margin: 10px 0 5px 0;">
                                    <span style="margin-left:0px;margin-right:5px;"><b>Total Animais:</b></span>
                                    <asp:Label runat="server" ID="Label12" Font-Bold="true"></asp:Label>
                                </li>
                                <li style="margin: 10px 0 5px 0;">
                                    <span style="margin-left:0px;margin-right:15px;"><b>Total Macho:</b></span>
                                    <asp:Label runat="server" ID="Label14" Font-Bold="true"></asp:Label>
                                </li> 
                                <li style="margin: 10px 0 5px 0;">
                                    <span style="margin-left:0px;margin-right:13px;"><b>Total Fêmea:</b></span>
                                    <asp:Label runat="server" ID="Label16" Font-Bold="true"></asp:Label>
                                </li>   
                            </ul>
                        </div>             
                    </asp:Panel>
                    <asp:Panel ID="PnVetConsultas" runat="server" Visible="false">
                        <div style="width:100%;">
                            <ul>
                                <li style="margin: 10px 0 5px 0;">
                                    <span style="margin-left:0px;margin-right:5px;"><b>Total Consultas:</b></span>
                                    <asp:Label runat="server" ID="Label18" Font-Bold="true"></asp:Label>
                                </li>
                                <li style="margin: 10px 0 5px 0;">
                                    <span style="margin-left:0px;margin-right:5px;"><b>Consultas de Cães:</b></span>
                                    <asp:Label runat="server" ID="Label20" Font-Bold="true"></asp:Label>
                                </li>
                                <li style="margin: 10px 0 5px 0;">
                                    <span style="margin-left:0px;margin-right:5px;"><b>Consultas de Gatos:</b></span>
                                    <asp:Label runat="server" ID="Label22" Font-Bold="true"></asp:Label>
                                </li>
                                <li style="margin: 10px 0 5px 0;">
                                    <span style="margin-left:0px;margin-right:5px;"><b>Consultas de Peixes:</b></span>
                                    <asp:Label runat="server" ID="Label24" Font-Bold="true"></asp:Label>
                                </li>
                                <li style="margin: 10px 0 5px 0;">
                                    <span style="margin-left:0px;margin-right:5px;"><b>Consultas de Pássaros:</b></span>
                                    <asp:Label runat="server" ID="Label26" Font-Bold="true"></asp:Label>
                                </li>
                                <li style="margin: 10px 0 5px 0;">
                                    <span style="margin-left:0px;margin-right:5px;"><b>Consultas de Roedores:</b></span>
                                    <asp:Label runat="server" ID="Label28" Font-Bold="true"></asp:Label>
                                </li>
                                <li style="margin: 10px 0 5px 0;">
                                    <span style="margin-left:0px;margin-right:5px;"><b>Total Consultas Para Clientes Especiais:</b></span>
                                    <asp:Label runat="server" ID="Label42" Font-Bold="true"></asp:Label>
                                </li>
                            </ul>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="PnVetVacinas" runat="server" Visible="false">
                        <div style="width:100%;">
                            <ul>
                                <li style="margin: 10px 0 5px 0;">
                                    <span style="margin-left:0px;margin-right:5px;"><b>Total Vacinas:</b></span>
                                    <asp:Label runat="server" ID="Label30" Font-Bold="true"></asp:Label>
                                </li>
                                <li style="margin: 10px 0 5px 0;">
                                    <span style="margin-left:0px;margin-right:5px;"><b>Vacinas de Cães:</b></span>
                                    <asp:Label runat="server" ID="Label32" Font-Bold="true"></asp:Label>
                                </li>
                                <li style="margin: 10px 0 5px 0;">
                                    <span style="margin-left:0px;margin-right:5px;"><b>Vacinas de Gatos:</b></span>
                                    <asp:Label runat="server" ID="Label34" Font-Bold="true"></asp:Label>
                                </li>
                                <li style="margin: 10px 0 5px 0;">
                                    <span style="margin-left:0px;margin-right:5px;"><b>Vacinas de Peixes:</b></span>
                                    <asp:Label runat="server" ID="Label36" Font-Bold="true"></asp:Label>
                                </li>
                                <li style="margin: 10px 0 5px 0;">
                                    <span style="margin-left:0px;margin-right:5px;"><b>Vacinas de Pássaros:</b></span>
                                    <asp:Label runat="server" ID="Label38" Font-Bold="true"></asp:Label>
                                </li>
                                <li style="margin: 10px 0 5px 0;">
                                    <span style="margin-left:0px;margin-right:5px;"><b>Vacinas de Roedores:</b></span>
                                    <asp:Label runat="server" ID="Label40" Font-Bold="true"></asp:Label>
                                </li>
                                <li style="margin: 10px 0 5px 0;">
                                    <span style="margin-left:0px;margin-right:5px;"><b>Total Vacinas Para Clientes Especiais:</b></span>
                                    <asp:Label runat="server" ID="Label44" Font-Bold="true"></asp:Label>
                                </li>   
                            </ul>
                        </div>
                    </asp:Panel>
                </div>
          </ContentTemplate>
          </asp:TabPanel>
          </asp:TabContainer>
    </div>      
</asp:Content>
