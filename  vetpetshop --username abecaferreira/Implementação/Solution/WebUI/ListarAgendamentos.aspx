<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="ListarAgendamentos.aspx.cs" Inherits="WebUI.ListarAgendamentos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding: 20px 10px 10px 20px; width:100%;">
        <asp:TabContainer ID="tabAgendamentos" runat="server" ActiveTabIndex="0" Width="100%">
            <asp:TabPanel ID="tabpnlConsultas" runat="server">
                <HeaderTemplate>
                    <b>Consulta veterinária</b>
                </HeaderTemplate> 
                <ContentTemplate>
                    <br />
                    <asp:GridView ID="gdvConsultas" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" Width="100%" 
                        OnRowCommand="gdvConsultas_RowCommand" 
                        >
                        <Columns>
                            <asp:TemplateField>
                            <ItemTemplate>
                            <asp:LinkButton ID="alterar" runat="server" Text="Alterar" CommandName="alterar" CommandArgument='<%# Eval("id_consulta") %>'></asp:LinkButton>
                            </ItemTemplate> 
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                            <ItemTemplate>
                            <asp:LinkButton ID="excluir" runat="server" Text="Excluir" CommandName="excluir" CommandArgument='<%# Eval("id_consulta") %>' OnClientClick="return confirm('Deseja excluir o registro selecionado?');"></asp:LinkButton>
                            </ItemTemplate> 
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="id_consulta" visible="False">
                                <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                                    Wrap="False"/>
                                <ItemStyle HorizontalAlign="Center" Wrap="False"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="nm_cliente" HeaderText="Proprietário" SortExpression="nm_cliente">
                                <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
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
                                Wrap="False" BackColor="DarkBlue"/>
                                <ItemStyle HorizontalAlign="Center" Wrap="False"/>
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
                        <HeaderStyle BackColor="DarkBlue" />
                        <AlternatingRowStyle BackColor="LightSteelBlue" />
                    </asp:GridView>
                    <br />
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="tabpnlVacinacoes" runat="server">
                <HeaderTemplate>
                    <b>Vacinações</b>
                </HeaderTemplate>
                <ContentTemplate>
                    
                </ContentTemplate>
            </asp:TabPanel>        
        </asp:TabContainer>
        <asp:Panel ID="pnlConsultas" runat="server" Visible="False">
            <div style="width:100%; height:20px;">
                <div style="float:left; width:200px; height:20px;">
                    Proprietário:
                </div>
                <div style="float:left; width:300px; height:20px;">
                    <asp:Label ID="lblProprietario" runat="server"></asp:Label>   
                </div>
            </div>
            <div style="width:100%; height:20px;">
                <div style="float:left; width:200px; height:20px;">
                    Animal:
                </div>
                <div style="float:left; width:300px; height:20px;">
                    <asp:Label ID="lblAnimal" runat="server"></asp:Label>   
                </div>
            </div>
            <div style="width:100%; height:20px;">
                <div style="float:left; width:200px; height:20px;">
                    Data da Consulta:
                </div>
                <div style="float:left; width:300px; height:20px;">
                    <asp:TextBox ID="txtDataConsulta" runat="server"></asp:TextBox>   
                </div>
            </div>
            <div style="width:100%; height:20px;">
                <div style="float:left; width:200px; height:20px;">
                    Valor da Consulta:
                </div>
                <div style="float:left; width:300px; height:20px;">
                    <asp:TextBox ID="txtValor" runat="server"></asp:TextBox>   
                </div>
            </div>
            <div style="width:100%; height:30px;">
                <div style="float:left; width:200px; height:30px;">
                    Status da Consulta:
                </div>
                <div style="float:left; width:300px; height:30px;">
                    <asp:RadioButtonList ID="rblStatus" runat="server" RepeatColumns="3">
                        <asp:ListItem Text="Agendada" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Desmarcada" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Finalizada" Value="2"></asp:ListItem>
                    </asp:RadioButtonList>   
                </div>
            </div>
            <div style="width:100%; height:30px;">
                <div style="float:left; padding-left:200px; width:300px;">
                    <asp:Button ID="btnAlterar" runat="server" Text="Alterar" />&nbsp;
                    <asp:Button ID="btrCancelar" runat="server" Text="Cancelar" />   
                </div>
            </div>
        </asp:Panel>
    </div>    
</asp:Content>
