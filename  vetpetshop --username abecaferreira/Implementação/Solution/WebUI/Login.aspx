<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebUI.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 577px;
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
<body background="#3399FF">
    <form id="form1" runat="server">
    <div>
    
        <table bgcolor="#3399FF" style="width: 100%; height: 541px;">
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
                        <img src="images/bannercreator-nu (2).gif"</img>                       
                        </td>
                    </tr>  
                    <tr>
                            <td class="style1" align="right">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>                           
                        </tr>
                    <tr>
                            <td class="style1" align="right">
                                &nbsp;
                                <asp:Label ID="lblUsu" Text="Usuário" runat="server" Font-Bold="True" 
                                    ForeColor="White" Font-Size="XX-Large" Font-Names="Colonna MT"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtUsu" runat="server"></asp:TextBox>
                            </td>                           
                        </tr>
                        <tr>
                            <td class="style1" align="right">
                                <asp:Label ID="lblSenha" runat="server" Text="Senha" Font-Bold="True" 
                                    ForeColor="White" Font-Size="XX-Large" Font-Names="Colonna MT"></asp:Label>                               
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSenha" runat="server"></asp:TextBox> 
                            </td>                            
                        </tr>                                          
                        <tr>
                            <td class="style1" align="right">
                                &nbsp;</td>
                            <td align="left">
                                <asp:Button ID="btnOk" runat="server" CssClass="botao3d" Text="Autenticar" Height="35px" 
                                    onclick="Button1_Click" Width="155px" ForeColor="White" />
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
