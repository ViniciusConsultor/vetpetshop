<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vetpetshop.Master" CodeBehind="Default.aspx.cs" Inherits="WebUI._Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

    <html xmlns="http://www.w3.org/1999/xhtml" >
    
 <head>
 <title>Teste</title>     
<style type="text/css">         
/* Background Image */
.tb4 {
	background-image: url(./images/bg.png);
	border: 1px solid #6297BC;
	width: 230px;
}
.style1
{
    width: 281px;
} 
 </style>
</head>
    <body>
     <form id="form1" runat="server">    
    <table style="width: 100%;">
        <tr>
            <td style="width: 53px">
                &nbsp;
            </td>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 53px">
                &nbsp;
                <asp:Label ID="Label1" runat="server" Text="Label">Nome: </asp:Label>
            </td>
            <td class="style1">
                &nbsp;
                <asp:TextBox ID="txtNome" runat="server" Width="218px" CssClass="tb4"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 53px">
                &nbsp;
            </td>
            <td class="style1">
                &nbsp;
                <asp:Button ID="btnOk" runat="server" Text="Enviar" onclick="btnOk_Click" />
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</form>
</body>
</html>

    

</asp:Content>
