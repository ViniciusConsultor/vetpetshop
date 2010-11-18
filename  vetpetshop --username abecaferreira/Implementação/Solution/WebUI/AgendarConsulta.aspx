<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="AgendarConsulta.aspx.cs" Inherits="WebUI.AgendarConsulta" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h3>
            Agendar Consulta
        </h3>
        <div id="divErros" style="width:87%; margin:5px 0 5px 30px;">
        <span id="erro1" runat="server" class="escondido" style="color:Red;">Selecione o animal desejado</span>
        <span id="erro2" runat="server" class="escondido" style="color:Red;">Selecione o cliente desejado</span>
        <span style="display:block;"><asp:CompareValidator ID="cvtxtDataVacinacao" runat="server" ControlToValidate="txtDataVacinacao" Display="Dynamic" ErrorMessage="Data da vacinação inválida" Operator="GreaterThan" Type="Date" ValueToCompare="01/01/1900"></asp:CompareValidator></span>
        <span style="display:block;"><asp:CompareValidator ID="cvtxtData" runat="server" ControlToValidate="txtData" Display="Dynamic" ErrorMessage="Data da consulta inválida" Operator="GreaterThan" Type="Date" ValueToCompare="01/01/1900"></asp:CompareValidator></span>
        <span style="display:block;"><asp:MaskedEditValidator ID="mevtxtValor" runat="server" ControlToValidate="txtValor" ControlExtender="meetxtValor" Display="Dynamic" TooltipMessage="Entre com o valor da consulta" IsValidEmpty="false" EmptyValueMessage="É preciso entrar com o valor da consulta" InvalidValueMessage="Valor inválido" MinimumValue="0" MinimumValueMessage="Valor mínimo é R$0,00"></asp:MaskedEditValidator></span>
        </div>
        <div style="width:100%; margin:5px 0 5px 30px;">
        <ul>
            <li>
                <asp:Label ID="lblMsg" runat="server" Text="" Font-Bold="true" forecolor="Red"></asp:Label>
            </li>
        </ul>
        <ul style="margin-top:10px;">
            <li style="margin-bottom:10px;">
                <span style="margin-left:5px;margin-right:5px;">Cliente:</span>
                <asp:DropDownList ID="ddlClientes" runat="server" AutoPostBack="true" width="450px" onselectedindexchanged="ddlClientes_SelectedIndexChanged"></asp:DropDownList>
            </li>
            <li style="margin-bottom:10px;">    
                <span style="margin-left:5px;margin-right:5px;">Animal:</span>
                <asp:DropDownList Enabled="False" ID="ddlAnimal" runat="server" AutoPostBack="true" width="450px" onselectedindexchanged="ddlAnimal_SelectedIndexChanged"></asp:DropDownList>
            </li>
            <li style="margin-bottom:10px; margin-left:5px;">
                <div style="border:1px solid #b9b9b9; width:25%;">
                    <span style="margin-left:5px;margin-right:5px;">Tipo de agendamento:</span>
                    <asp:RadioButtonList ID="rbTipo" runat="server"  AutoPostBack="true" onselectedindexchanged="rbTipo_SelectedIndexChanged" Width="180px">
                        <asp:ListItem Text="Agendamento de consulta" Selected="True" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Agendamento de vacinação" Value="2"></asp:ListItem>                                
                    </asp:RadioButtonList>
                </div> 
            </li>
            <li style="margin-bottom:10px;">
                <asp:Panel ID="PanelVacina" runat="server" Visible="false" Width="50%">
                    <span style="margin-left:5px;margin-right:5px;">Data da vacinação:</span>
                    <asp:TextBox ID="txtDataVacinacao" runat="server" MaxLength="10" Width="150px"></asp:TextBox>
                    <asp:MaskedEditExtender ID="meetxtDataVacinacao" runat="server" TargetControlID="txtDataVacinacao" Mask="99/99/9999" ClearMaskOnLostFocus="false" MaskType="Number" AutoComplete="false" InputDirection="LeftToRight"></asp:MaskedEditExtender>
                </asp:Panel>
                <asp:Panel ID="Panel1" runat="server" Width="50%">
                    <span style="margin-left:14px;margin-right:5px;">Data da consulta:</span>
                    <asp:TextBox ID="txtData" runat="server" MaxLength="10" Width="150px"></asp:TextBox>
                    <asp:MaskedEditExtender ID="meetxtData" runat="server" TargetControlID="txtData" Mask="99/99/9999" ClearMaskOnLostFocus="false" MaskType="Number" AutoComplete="false" InputDirection="LeftToRight"></asp:MaskedEditExtender>
                </asp:Panel>
            </li>
            <li style="margin-bottom:10px;">
                <span style="margin-left:11px;margin-right:5px;">Valor da consulta:</span>
                <asp:TextBox ID="txtValor" runat="server" Width="150px" MaxLength="9"></asp:TextBox>
                <asp:MaskedEditExtender ID="meetxtValor" runat="server" TargetControlID="txtValor" Mask="999,999.99" MaskType="Number" MessageValidatorTip="true" InputDirection="RightToLeft" DisplayMoney="Left" AcceptNegative="Left" AutoComplete="false" ClearMaskOnLostFocus="true"></asp:MaskedEditExtender>
            </li>
            <li style="margin-bottom:10px;margin-left:5px;">
                <div style="border:1px solid #b9b9b9; width:25%;">
                    <span style="margin-left:5px;margin-right:5px; margin-bottom:10px;">Status da consulta:</span>
                    <asp:RadioButtonList ID="rblStatus" runat="server" Enabled="False" Width="150px">
                        <asp:ListItem Text="Agendada" Selected="True" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Desmarcada" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Finalizada" Value="2"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
             </li>
            </ul>
        </div>                        
        <asp:Panel ID="pnlAnimal" Visible="false" runat="server" Width="100%">
            <div style="width:100%; margin:20px 0 5px 15%;">
                <b><span style="margin-left:10px;margin-right:5px; font-size:small; font-style:normal;">Consultas agendadas para este animal:</span></b>
            </div>
            <div class="scroll" style="width:70%; margin-left:15%; margin-top:10px;">
            <asp:GridView ID="gdvAnimal" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="DarkBlue" Width="100%" AllowPaging="false">
                <Columns>
                    <asp:BoundField DataField="id_consulta" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White"  Visible="false">
                         <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                        Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="false"/>
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Tipo da Consulta" DataField="tipoconsulta" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                         <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                        Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="false"/>
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Data da Consulta" DataField="dataconsulta" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                         <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                        Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="false"/>
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Status" DataField="status" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                         <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                        Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="false"/>
                    </asp:BoundField> 
                    <asp:BoundField HeaderText="Valor" DataField="valor" HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                         <HeaderStyle Font-Bold="True" Font-Italic="False" ForeColor="White" 
                        Wrap="False"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="false"/>
                    </asp:BoundField>                        
                </Columns>
            <HeaderStyle BackColor="DarkBlue"></HeaderStyle>
            <AlternatingRowStyle BackColor="LightSteelBlue" />
            </asp:GridView>
        </div>        
        </asp:Panel>    
        <div style="width:100%; margin:5px 0 5px 10px;">
            <center>
            <asp:Button Width="20%" ID="btnAgendar" runat="server" Text="Agendar" onclick="btnAgendar_Click" />
            &nbsp;
            <asp:Button Width="20%" ID="btnCancelar" runat="server" Text="Cancelar" onclick="btnCancelar_Click" />
            </center>
        </div>
</asp:Content>