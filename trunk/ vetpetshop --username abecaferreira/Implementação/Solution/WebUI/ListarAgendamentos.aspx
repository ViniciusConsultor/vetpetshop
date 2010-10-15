<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="ListarAgendamentos.aspx.cs" Inherits="WebUI.ListarAgendamentos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding: 20px 10px 10px 20px; width:100%;">
        <asp:TabContainer ID="tabAgendamentos" runat="server" ActiveTabIndex="0"  OnActiveTabChanged="tabAgendamentos_OnActiveTabChanged" AutoPostBack="true"
            Width="100%">
            <asp:TabPanel ID="tabpnlConsultas" runat="server" OnClientClick="">
                <HeaderTemplate><b>Consulta veterinária</b>
                </HeaderTemplate> 
                <ContentTemplate><br />
                <asp:GridView ID="gdvConsultas" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" Width="100%" OnRowCommand="gdvConsultas_RowCommand" >
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
                        <asp:LinkButton ID="excluir" runat="server" Text="Excluir" CommandName="excluir" CommandArgument='<%# Eval("id_consulta") %>' OnClientClick="return confirm('Deseja excluir o registro selecionado?');">
                        </asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="id_consulta" visible="true" HeaderText="Código">
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
                                </asp:GridView><br />
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="tabpnlVacinacoes" runat="server">
                <HeaderTemplate><b>Vacinações</b>
                </HeaderTemplate>
                <ContentTemplate><br />
                    <asp:GridView ID="gdvVacinacoes" runat="server" AllowPaging="True" AutoGenerateColumns="False" Width="100%" 
                        OnRowCommand="gdvVacinacoes_RowCommand" >
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="alterar" runat="server" Text="Alterar" CommandName="alterar" CommandArgument='<%# Eval("id_animal") %>'>
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="excluir" runat="server" Text="Excluir" CommandName="excluir" CommandArgument='<%# Eval("id_animal") %>' OnClientClick="return confirm('Deseja excluir o registro selecionado?');">
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
                        </Columns>
                        <AlternatingRowStyle BackColor="LightSteelBlue" />
                        <HeaderStyle BackColor="DarkBlue" />
                    </asp:GridView><br />
                </ContentTemplate>
            </asp:TabPanel>        
        </asp:TabContainer>
        <p><asp:Label ID="lblMsg" runat="server" Font-Bold="true" ForeColor="red"></asp:Label></p>
        <br />
        <asp:Panel ID="pnlConsultas" runat="server" Visible="False">
            <div style="width:100%; height:30px;">
                <div style="float:left; width:200px; height:30px;">
                    Proprietário:
                </div>
                <div style="float:left; width:300px; height:30px;">
                    <asp:Label ID="lblProprietario" runat="server"></asp:Label>   
                </div>
            </div>
            <div style="width:100%; height:30px;">
                <div style="float:left; width:200px; height:30px;">
                    Animal:
                </div>
                <div style="float:left; width:300px; height:30px;">
                    <asp:Label ID="lblAnimal" runat="server"></asp:Label>   
                </div>
            </div>
            <div style="width:100%; height:30px;">
                <div style="float:left; width:200px; height:30px;">
                    Data da Consulta:
                </div>
                <div style="float:left; width:300px; height:30px;">
                    <asp:TextBox ID="txtDataConsulta" runat="server"></asp:TextBox>   
                </div>
            </div>
            <div style="width:100%; height:30px;">
                <div style="float:left; width:200px; height:30px;">
                    Valor da Consulta:
                </div>
                <div style="float:left; width:300px; height:30px;">
                    <asp:TextBox ID="txtValor" runat="server"></asp:TextBox>   
                </div>
            </div>
            <div style="width:100%; height:30px;">
                <div style="float:left; width:200px; height:30px;">
                    Status da Consulta:
                </div>
                <div style="float:left; width:300px; height:30px;">
                    <asp:RadioButtonList ID="rblStatus" runat="server" RepeatColumns="3" Width="300px">
                        <asp:ListItem Text="Agendada" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Desmarcada" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Finalizada" Value="2"></asp:ListItem>
                    </asp:RadioButtonList>   
                </div>
            </div>
            <div style="width:100%; height:30px;">
                <div style="float:left; padding-left:200px; width:300px;">
                    <asp:Button ID="btnAlterar" runat="server" Text="Alterar" onclick="btnAlterar_Click"/>&nbsp;
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" onclick="btnCancelar_Click"/>   
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlVacinacao" runat="server" Visible="False">
            <div style="width:100%; height:30px;">
                <div style="float:left; width:200px; height:30px;">
                    Proprietário:
                </div>
                <div style="float:left; width:300px; height:30px;">
                    <asp:Label ID="lblClienteVac" runat="server"></asp:Label>   
                </div>
            </div>
            <div style="width:100%; height:30px;">
                <div style="float:left; width:200px; height:30px;">
                    Animal:
                </div>
                <div style="float:left; width:300px; height:30px;">
                    <asp:Label ID="lblAnimalVac" runat="server"></asp:Label>   
                </div>
            </div>
            <div style="width:100%; height:30px;">
                <div style="float:left; width:200px; height:30px;">
                    Data de vacinação:
                </div>
                <div style="float:left; width:300px; height:30px;">
                    <asp:TextBox ID="txtDataVacinacao" runat="server"></asp:TextBox>   
                </div>
            </div>            
            <div style="width:100%; height:30px;">
                <div style="float:left; padding-left:200px; width:300px;">
                    <asp:Button ID="btnAlterarVac" runat="server" Text="Alterar" onclick="btnAlterarVac_Click"/>&nbsp;
                    <asp:Button ID="btnCancelarVac" runat="server" Text="Cancelar" onclick="btnCancelarVac_Click"/>   
                </div>
            </div>
        </asp:Panel>
    </div>    
</asp:Content>
