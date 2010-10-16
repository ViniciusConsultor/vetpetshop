<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="EmitirReceitaMedica.aspx.cs" Inherits="WebUI.EmitirReceitaMedica" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding: 20px 10px 10px 20px; width:100%;">
        <div style="width:100%; height:30px;">
            <div style="float:left; width:60px; height:20px; padding-top:10px;">
                Proprietário:
            </div>
            <div style="float:left; width:300px; height:30px;">
                <asp:TextBox ID="txtProprietario" runat="server" Width="300px"></asp:TextBox> 
            </div>
            <div style="float:left; width:86px; height:20px; padding-left:10px; padding-top:10px;">
                Data da Consulta:
            </div>
            <div style="float:left; width:200px; height:30px;">
                <asp:TextBox ID="txtDataConsulta" runat="server" onblur="TestaField(this)" onfocus="inField()" MaxLength="10" Tipo="DATE"></asp:TextBox>   
            </div>
        </div>            
        <div style="width:100%; height:10px;"></div>
        <div style="width:100%; height:30px;">
            <div style="float:left; padding-left:10px; width:300px;">
                <asp:Button ID="btnListar" runat="server" Text="Listar" onclick="btnListar_Click"/>&nbsp;
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" onclick="btnCancelar_Click"/>   
            </div>
        </div>        
        <div style="width:100%; height:15px; text-align:center; margin-top:7px;">
            <asp:Label ID="lblMsg" runat="server" Font-Bold="true" ForeColor="red"></asp:Label>
        </div>
        <div style="width:100%">
            <asp:GridView ID="gdvConsultas" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" Width="100%" OnRowCommand="gdvConsultas_RowCommand" >
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="selecionar" runat="server" Text="Selecionar" CommandName="selecionar" CommandArgument='<%# Eval("id_consulta") %>'>
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
        
        <div style="height:15px; width:100%"></div>          
    </div>    
</asp:Content>

