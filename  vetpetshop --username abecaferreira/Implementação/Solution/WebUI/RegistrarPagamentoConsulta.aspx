﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Vetpetshop.Master" AutoEventWireup="true" CodeBehind="RegistrarPagamentoConsulta.aspx.cs" Inherits="WebUI.RegistrarPagamentoConsulta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:GridView ID="gdvConsultas" runat="server" AllowPaging="True" 
    AutoGenerateColumns="False" Width="100%" OnRowCommand="gdvConsultas_RowCommand" >
    <Columns>
    <asp:TemplateField>
    <ItemTemplate>
    <asp:LinkButton ID="registrar" runat="server" Text="Registrar" CommandName="registrar" CommandArgument='<%# Eval("id_consulta") %>'>
    </asp:LinkButton>
    </ItemTemplate>
    <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:BoundField DataField="id_consulta" visible="False">
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
    
    
</asp:Content>
