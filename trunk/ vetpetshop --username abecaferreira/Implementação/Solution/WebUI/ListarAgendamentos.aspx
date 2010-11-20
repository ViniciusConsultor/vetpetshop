<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="ListarAgendamentos.aspx.cs" Inherits="WebUI.ListarAgendamentos" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>
        Listar Agendamentos
    </h3>
    <div style="margin: 10px 10px 20px 20px; width:95%;">
        <asp:TabContainer ID="tabAgendamentos" runat="server" ActiveTabIndex="0"  OnActiveTabChanged="tabAgendamentos_OnActiveTabChanged" AutoPostBack="true" Width="100%">
            <asp:TabPanel ID="tabpnlConsultas" runat="server" OnClientClick="">
                <HeaderTemplate><b>Consultas</b>
                </HeaderTemplate> 
                <ContentTemplate>
                <div class="scroll" style="margin: 10px 0 10px 0;">
                <asp:GridView ID="gdvConsultas" runat="server" AutoGenerateColumns="False" RowStyle-Height="30px"
                        Width="100%" OnRowCommand="gdvConsultas_RowCommand" >
                        <Columns>
                        <asp:TemplateField>
                        <ItemTemplate>
                        <asp:LinkButton ID="alterar" runat="server" Text="Alterar" CommandName="alterar" CommandArgument='<%# Eval("id_consulta") %>'>
                        </asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                        <ItemTemplate>
                        <asp:LinkButton ID="excluir" runat="server" Text="Excluir" CommandName="excluir" CommandArgument='<%# Eval("id_consulta") %>' OnClientClick="return confirm('Deseja excluir a consulta selecionada?');">
                        </asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="id_consulta" visible="False" HeaderText="Código">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                                    Wrap="False"/><ItemStyle HorizontalAlign="Center" Wrap="False"/>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nm_cliente" HeaderText="Proprietário" SortExpression="nm_cliente"><HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                                    Wrap="False"/>
                                    <ItemStyle HorizontalAlign="Center" Wrap="False"/>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nm_animal" HeaderText="Animal" SortExpression="nm_animal">
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                                    Wrap="False"/>
                                    <ItemStyle HorizontalAlign="Center" Wrap="False"/>
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Data da Consulta" DataField="dataconsulta">
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                                Wrap="False" BackColor="DarkBlue"/><ItemStyle HorizontalAlign="Center" Wrap="False"/>
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Valor" DataField="valor">
                                <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                                Wrap="False" BackColor="DarkBlue"/>
                                <ItemStyle HorizontalAlign="Center" Wrap="False"/>
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Status" DataField="status">
                                <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                                Wrap="False" BackColor="DarkBlue"/>
                                <ItemStyle HorizontalAlign="Center" Wrap="False"/>
                                </asp:BoundField>
                                </Columns>
                                <AlternatingRowStyle BackColor="LightSteelBlue" />
                                <HeaderStyle BackColor="DarkBlue" />
                                </asp:GridView>
                            </div>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="tabpnlVacinacoes" runat="server">
                <HeaderTemplate><b>Vacinações</b>
                </HeaderTemplate>
                <ContentTemplate>
                <div class="scroll" style="margin: 10px 0 10px 0;">
                    <asp:GridView ID="gdvVacinacoes" runat="server" AllowPaging="false" AutoGenerateColumns="False" Width="100%" RowStyle-Height="30px"
                        OnRowCommand="gdvVacinacoes_RowCommand" >
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="alterar" runat="server" Text="Alterar" CommandName="alterar" CommandArgument='<%# Eval("id_consulta") %>'>
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="excluir" runat="server" Text="Excluir" CommandName="excluir" CommandArgument='<%# Eval("id_consulta") %>' OnClientClick="return confirm('Deseja excluir a vacinação selecionada?');">
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="id_animal" visible="False">
                                <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" Wrap="False"/>
                                <ItemStyle HorizontalAlign="Center" Wrap="False"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="nm_cliente" HeaderText="Proprietário" SortExpression="nm_cliente"><HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                                Wrap="False"/><ItemStyle HorizontalAlign="Center" Wrap="False"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="nm_animal" HeaderText="Animal" SortExpression="nm_animal"><HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                                Wrap="False"/><ItemStyle HorizontalAlign="Center" Wrap="False"/>
                            </asp:BoundField>                            
                            <asp:BoundField HeaderText="Data de Vacinação" DataField="datavacinacao"><HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                            Wrap="False" BackColor="DarkBlue"/><ItemStyle HorizontalAlign="Center" Wrap="False"/>
                            </asp:BoundField>    
                            <asp:BoundField DataField="valor" HeaderText="Valor" SortExpression="valor"><HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                                Wrap="False"/><ItemStyle HorizontalAlign="Center" Wrap="False"/>
                            </asp:BoundField>
                             <asp:BoundField HeaderText="Status" DataField="status">
                                <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                                Wrap="False" BackColor="DarkBlue"/>
                                <ItemStyle HorizontalAlign="Center" Wrap="False"/>
                                </asp:BoundField>                       
                        </Columns>
                        <AlternatingRowStyle BackColor="LightSteelBlue" />
                        <HeaderStyle BackColor="DarkBlue" />
                    </asp:GridView>
                </div>
                </ContentTemplate>
            </asp:TabPanel>        
        </asp:TabContainer>
        <div id="divErros" style="width:95%; margin:5px 0 5px 10px;">
        <span style="display:block;"><asp:CompareValidator ID="cvtxtDataVacinacao" runat="server" ControlToValidate="txtDataVacinacao" Display="Dynamic" ErrorMessage="Data da vacinação inválida" Operator="GreaterThan" Type="Date" ValueToCompare="01/01/1900"></asp:CompareValidator></span>
        <span style="display:block;"><asp:CompareValidator ID="cvtxtDataConsulta" runat="server" ControlToValidate="txtDataConsulta" Display="Dynamic" ErrorMessage="Data da consulta inválida" Operator="GreaterThan" Type="Date" ValueToCompare="01/01/1900"></asp:CompareValidator></span>
        </div>
        <div style="width:95%;margin:15px 0 5px 10px;">
            <ul>
                <li>
                    <asp:Label ID="lblMsg" runat="server" Font-Bold="true" ForeColor="red"></asp:Label>             
                </li>
            </ul>    
        </div>
        <asp:Panel ID="pnlConsultas" runat="server" Visible="False">
            <div style="width:95%;margin:15px 0 10px 10px;">
                <ul style="margin-top:10px;">
                    <li style="margin-bottom:10px;">
                        <span style="margin-left:0px;margin-right:10px;">Proprietário:</span>
                        <asp:Label ID="lblProprietario" runat="server"></asp:Label>   
                        <span style="margin-left:50px;margin-right:10px;">Animal:</span>
                        <asp:Label ID="lblAnimal" runat="server"></asp:Label>
                    </li>
                    <li style="margin-bottom:10px;">
                        <span style="margin-left:0px;margin-right:5px;">Data da Consulta:</span>
                        <asp:TextBox ID="txtDataConsulta" runat="server" MaxLength="10" Width="150px"></asp:TextBox>
                        <asp:MaskedEditExtender ID="meetxtDataConsulta" runat="server" TargetControlID="txtDataConsulta" Mask="99/99/9999" ClearMaskOnLostFocus="false" MaskType="Number" AutoComplete="false" InputDirection="LeftToRight"></asp:MaskedEditExtender>
                    </li>
                    <li style="margin-bottom:10px;">
                        <span style="margin-left:0px;margin-right:3px;">Valor da Consulta:</span>
                        <asp:TextBox ID="txtValor" runat="server" Width="150px"></asp:TextBox>
                        <asp:MaskedEditExtender ID="meetxtValor" runat="server" TargetControlID="txtValor" Mask="999,999.99" MaskType="Number" MessageValidatorTip="true" InputDirection="RightToLeft" DisplayMoney="Left" AcceptNegative="Left" AutoComplete="false" ClearMaskOnLostFocus="true"></asp:MaskedEditExtender> 
                    </li>
                    <li style="margin-bottom:10px;margin-left:5px;">
                        <div style="border:1px solid #b9b9b9; width:25%;">
                            <span style="margin-left:5px;margin-right:5px; margin-bottom:10px;">Status da consulta:</span>
                                <asp:RadioButtonList ID="rblStatus" runat="server" Width="150px">
                                <asp:ListItem Text="Agendada" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Desmarcada" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Finalizada" Value="2"></asp:ListItem>
                            </asp:RadioButtonList> 
                        </div>
                    </li>
                </ul>
                <div style="margin:10px 0 5px 35%; width:60%;">
                    <asp:Button Width="20%" ID="btnAlterar" runat="server" Text="Alterar" onclick="btnAlterar_Click" />&nbsp;
                    <asp:Button Width="20%" ID="btnCancelar" runat="server" Text="Cancelar" onclick="btnCancelar_Click"/> 
                </div>
            </div>
        </asp:Panel>
        
        <asp:Panel ID="pnlVacinacao" runat="server" Visible="False">
            <div style="width:95%;margin:15px 0 10px 10px;">
                <ul style="margin-top:10px;">
                    <li style="margin-bottom:10px;">
                        <span style="margin-left:0px;margin-right:10px;">Proprietário:</span>
                        <asp:Label ID="lblClienteVac" runat="server"></asp:Label>   
                        <span style="margin-left:50px;margin-right:10px;">Animal:</span>
                        <asp:Label ID="lblAnimalVac" runat="server"></asp:Label>   
                    </li>
                    <li style="margin-bottom:10px;">
                        <span style="margin-left:0px;margin-right:5px;">Data da Vacinação:</span>
                        <asp:TextBox ID="txtDataVacinacao" runat="server" MaxLength="10"></asp:TextBox>
                        <asp:MaskedEditExtender ID="meetxtDataVacinacao" runat="server" TargetControlID="txtDataVacinacao" Mask="99/99/9999" ClearMaskOnLostFocus="false" MaskType="Number" AutoComplete="false" InputDirection="LeftToRight"></asp:MaskedEditExtender>   
                    </li>
                    <li style="margin-bottom:10px;">
                        <span style="margin-left:6px;margin-right:5px;">Valor da Consulta:</span>
                        <asp:TextBox ID="txtValorVacina" runat="server"></asp:TextBox>
                        <asp:MaskedEditExtender ID="meetxtValorVacina" runat="server" TargetControlID="txtValorVacina" Mask="999,999.99" MaskType="Number" MessageValidatorTip="true" InputDirection="RightToLeft" DisplayMoney="Left" AcceptNegative="Left" AutoComplete="false" ClearMaskOnLostFocus="true"></asp:MaskedEditExtender>
                    </li>
                    <li style="margin-bottom:10px;margin-left:5px;">
                        <div style="border:1px solid #b9b9b9; width:25%;">
                            <span style="margin-left:5px;margin-right:5px; margin-bottom:10px;">Status da consulta:</span>       
                            <asp:RadioButtonList ID="rbStatusVacina" runat="server" Width="150px">
                                <asp:ListItem Text="Agendada" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Desmarcada" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Finalizada" Value="2"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                     </li>
                </ul>
                <div style="margin:10px 0 5px 35%; width:60%;">       
                    <asp:Button Width="20%" ID="btnAlterarVac" runat="server" Text="Alterar" onclick="btnAlterarVac_Click"/>&nbsp;
                    <asp:Button Width="20%" ID="btnCancelarVac" runat="server" Text="Cancelar" onclick="btnCancelarVac_Click"/>
                </div>
           </div>            
        </asp:Panel>
    </div>    
</asp:Content>
