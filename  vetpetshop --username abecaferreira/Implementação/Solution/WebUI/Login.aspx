<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebUI.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 543px;
        }
        .botao3d	{
		display: block;
		border-color: #999 #000 #000 #999;

		border: 1px solid;
		width: 200px;
		padding: 10px;

		background: #00008b; 
		color: #000;

		font-family: Verdana;
		font-size: 11px;
		font-weight: bold;
		text-align: center;
		text-decoration: none;
		}
 
.botao3d:hover	{
		position: relative;
		top: 1px;
		left: 1px;
		border-color: #000 #999 #999 #000; 

		background: #4169E1;
		}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 100%; height: 529px;">
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <table style="width: 100%; height: 305px;" align="center">
                    <tr>
                        <td colspan="2" align="center"> 
                        <img src="images/bannercreator-nu (4).gif"</img>                       
                        </td>
                    </tr>  
                    <tr>
                            <td align="center"  bgcolor="White" colspan="2">
                                    <asp:Label ID="lblAviso" runat="server" Font-Bold="True" ForeColor="Red" 
                                        Font-Size="Small"></asp:Label>
                            </td>                          
                        </tr>
                    <tr>
                            <td class="style1" align="right">
                                &nbsp;
                                <asp:Label ID="lblUsu" Text="Usuário" runat="server" Font-Bold="True" 
                                    ForeColor="#000066" Font-Size="XX-Large" Font-Names="Colonna MT"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtUsu" runat="server" Width="153px"></asp:TextBox>
                            </td>                           
                        </tr>
                        <tr>
                            <td class="style1" align="right">
                                <asp:Label ID="lblSenha" runat="server" Text="Senha" Font-Bold="True" 
                                    ForeColor="#000066" Font-Size="XX-Large" Font-Names="Colonna MT"></asp:Label>                               
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" Width="153px"></asp:TextBox> 
                            </td>                            
                        </tr>                                          
                        <tr>
                            <td class="style1" align="right">
                                &nbsp;</td>
                            <td align="left">
                                <asp:Button ID="btnOk" runat="server" Text="Entrar" Height="27px" 
                                    onclick="Button1_Click" Width="153px" />&nbsp;&nbsp;
                                    </td>                            
                        </tr>                                          
                    </table>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
