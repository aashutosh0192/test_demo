<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CalculateService.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <table>
           <tr>
               <td>First Number</td>
               <asp:TextBox ID="txtFN" runat="server"></asp:TextBox>
           </tr>
           <tr>
               <td>Second Number</td>
               <asp:TextBox ID="txtSecond" runat="server"></asp:TextBox>
           </tr>
           <tr>
               <td>Result</td>
               <asp:Label ID="tblResult" runat="server"></asp:Label>
           </tr>
           <tr>
               <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" Text="Button" />
           </tr>
       </table>
    </form>
</body>
</html>
